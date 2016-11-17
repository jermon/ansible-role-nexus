[1mdiff --git a/handlers/main.yml b/handlers/main.yml[m
[1mindex ff0a908..881db0e 100644[m
[1m--- a/handlers/main.yml[m
[1m+++ b/handlers/main.yml[m
[36m@@ -1,3 +1,3 @@[m
 ---[m
[31m- - name: start nexus service[m
[32m+[m[32m - name: restart nexus service[m
    service: name=nexus state=restarted[m
[1mdiff --git a/tasks/configuration.yml b/tasks/configuration.yml[m
[1mindex 836de22..f8703ac 100644[m
[1m--- a/tasks/configuration.yml[m
[1m+++ b/tasks/configuration.yml[m
[36m@@ -15,48 +15,56 @@[m
     dest: "{{ nexus_home_dir }}/.bashrc"[m
     regexp: "^NEXUS_HOME="[m
     line: "NEXUS_HOME={{ nexus_home_dir }}"[m
[32m+[m[32m  notify: restart nexus service[m
 [m
 - name: Configuration - Uncomment run_as_user.[m
   lineinfile:[m
     dest: "{{ nexus_home_dir }}/bin/nexus.rc"[m
     regexp: "^#run_as_user="[m
     line: "run_as_user={{ nexus_user }}"[m
[32m+[m[32m  notify: restart nexus service[m
 [m
 - name: Configuration - Set run_as_user.[m
   lineinfile:[m
     dest: "{{ nexus_home_dir }}/bin/nexus.rc"[m
     regexp: "^run_as_user="[m
     line: "run_as_user={{ nexus_user }}"[m
[32m+[m[32m  notify: restart nexus service[m
 [m
 - name: Configuration - Uncomment INSTALL4J_JAVA_HOME_OVERRIDE[m
   lineinfile:[m
     dest: "{{ nexus_home_dir }}/bin/nexus"[m
     regexp: "^# INSTALL4J_JAVA_HOME_OVERRIDE="[m
     line: "INSTALL4J_JAVA_HOME_OVERRIDE=/usr/lib/jvm/java-8-oracle"[m
[32m+[m[32m  notify: restart nexus service[m
 [m
 - name: Configuration - Set INSTALL4J_JAVA_HOME_OVERRIDE[m
   lineinfile:[m
     dest: "{{ nexus_home_dir }}/bin/nexus"[m
     regexp: "^INSTALL4J_JAVA_HOME_OVERRIDE="[m
     line: "INSTALL4J_JAVA_HOME_OVERRIDE=/usr/lib/jvm/java-8-oracle"[m
[32m+[m[32m  notify: restart nexus service[m
 [m
 - name: Configuration - nexus-context-path.[m
   lineinfile:[m
     dest: "{{ nexus_home_dir }}/etc/nexus-default.properties"[m
     regexp: "^nexus-context-path="[m
     line: "nexus-context-path={{ nexus_context_path }}"[m
[32m+[m[32m  notify: restart nexus service[m
 [m
 - name: Configuration - Jetty application-port.[m
   lineinfile:[m
     dest: "{{ nexus_home_dir }}/etc/nexus-default.properties"[m
     regexp: "^application-port="[m
     line: "application-port={{ nexus_application_port }}"[m
[32m+[m[32m  notify: restart nexus service[m
 [m
 - name: Configuration - Jetty application-host.[m
   lineinfile:[m
     dest: "{{ nexus_home_dir }}/etc/nexus-default.properties"[m
     regexp: "^application-host="[m
     line: "application-host={{ nexus_application_host }}"[m
[32m+[m[32m  notify: restart nexus service[m
 [m
 - name: Configuration - Ensure nexus user is owner of nexus directory.[m
   file:[m
[1mdiff --git a/tasks/initd.yml b/tasks/initd.yml[m
[1mindex d49a2dd..14115f5 100644[m
[1m--- a/tasks/initd.yml[m
[1m+++ b/tasks/initd.yml[m
[36m@@ -9,4 +9,4 @@[m
 - name: Initd - update-rc.d nexus.[m
   command: "update-rc.d nexus defaults"[m
   when: initd_symlink.changed[m
[31m-  notify: start nexus service[m
[32m+[m[32m  notify: restart nexus service[m
