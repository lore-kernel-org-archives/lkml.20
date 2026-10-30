Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371895;
	b=JIuTh1ELtweKvZE6vD+uDOnIzIQGs7I4DanpZPEYUrhcGDGW7winEQmmJD4iV1wwNjYC
	 09kTiziV2Z3hxpesUAf41jYxyUnu7uyP3nb2KzKa62UEsTjUsdMRgq6bKRwftbsx3FOeD
	 F77q0InhCDgNf1DtXpAAi+zVpxpErzSlEfOEzBDOn2f528suZBN/znWFRaa2yJiMlCD4A
	 wE6IdvEAbmFLt0qfnnWIp179wqkDIJJzDTOb14e92fANNo9w6JAph5z20wczyRjXz1g5c
	 E9avoLxsoC/WNgWKS8tiIbssyk1autH3/m3xC6Mk2S9zbxtn8gvDDFitQDH09LwZfXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371895;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=pLvKcTKjDVfUs9yaIS0jokit+OyX7v31xpCWqoHULN8=;
	b=YjYyLIh2lPJY/yJ93eoNRERhl7sA1K1LPTxFegr9hX56IcKZ0XyZBEUUnm8UrRe3uH9B
	 qq+MUh8Qerm63z4rC2PlQmjmRJKs5fIN2IUCb3PblJ1zpP6HhUlx6PvMUlAq+/KNMFJxw
	 gouICb3dgcDEetAtJm9xQcWt/ifbEhb7wDbm4Nd7HA65srD6xc3t//PLtprGdfARy0Vpm
	 sUR1oBcECTNNZ99yjvz/+S6ZEN0S5bqJdFIFCo9sEJ2hY1xDLyr1WrkqZL/W724k1OslO
	 zWu9DLFwi2Ag8ZTg3whSPRI5/OStQk3kdXFSJc1kgEEvkUxjho/G1r7Z+B4mh5p75DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Laa3b9gC;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D007B606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D007B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Laa3b9gC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793371893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pLvKcTKjDVfUs9yaIS0jokit+OyX7v31xpCWqoHULN8=;
	b=Laa3b9gCb8HraG9OeNz/mgp2T7qctGBUwBsdPQrFvfsfUZ1GKDqbcGwGySfM+Z7SVmJTXD
	/BCaJ7qqkNU50+xWs5G4F9qwk0/sJePW0jIbO5fBkn/EXjT/s9PdzOX/NW43LnKUNrEn1p
	u5ic6Vt1fLD0fzaENn/STTh5653jkpA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-354-DjTMm6CZMrC0_JLTKYO5sg-1; Fri,
 30 Oct 2026 10:51:30 -0400
X-MC-Unique: DjTMm6CZMrC0_JLTKYO5sg-1
X-Mimecast-MFC-AGG-ID: DjTMm6CZMrC0_JLTKYO5sg_1793371889
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4C0E21955BFC;
	Fri, 30 Oct 2026 14:51:29 +0000 (UTC)
Received: from tglozar-thinkpadt14gen5.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 803E61956089;
	Fri, 30 Oct 2026 14:51:26 +0000 (UTC)
From: Tomas Glozar <tglozar@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Tomas Glozar <tglozar@redhat.com>
Cc: John Kacur <jkacur@redhat.com>,
	Luis Goncalves <lgoncalv@redhat.com>,
	Crystal Wood <crwood@redhat.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Wander Lairson Costa <wander@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-trace-kernel <linux-trace-kernel@vger.kernel.org>
Subject: [PATCH] rtla/tests: Get rtla PID correctly when system shell is not bash
Date: Fri, 30 Oct 2026 15:51:11 +0100
Message-ID: <20261030145111.238098-1-tglozar@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

There are several places where rtla runtime tests call a script with
"--on-threshold shell" to verify the trace configuration in the middle
of tracing. Some of these checks require the rtla pid.

Currently, the tests assume that rtla is the parent process of the
utility script. That is, however, only the case when the system shell is
bash, which optimizes the invokation of "sh -c script.sh" used by the
system() function into just one process executing script.sh. On systems
where the system shell is not bash (including all Debian-based systems),
the system shell is the parent of the script, not rtla, and the checks
fail.

Pass $PPID resolved in the system shell to rtla's --on-threshold option
and use it as the PID for rtla to make the tests pass on all
distributions.

Note that some of the tests (the cgroup test, for example) were
intending to use rtla's PID, but work with the system shell's PID as
well. For consistency, all scripts are updated to use $PPID.

Fixes: d18fd5a34ff3 ("rtla/tests: Add get_workload_pids() helper")
Fixes: 7f7ad23bced9 ("rtla/tests: Check -c/--cpus thread affinity")
Reported-by: Steven Rostedt <rostedt@goodmis.org>
Closes: https://lore.kernel.org/linux-trace-kernel/20260810210425.61435b0b@robin/
Signed-off-by: Tomas Glozar <tglozar@redhat.com>
---
 tools/tracing/rtla/tests/osnoise.t                   |  8 ++++----
 .../tracing/rtla/tests/scripts/check-cgroup-match.sh |  6 ++++--
 tools/tracing/rtla/tests/scripts/check-cpus.sh       |  4 +++-
 .../rtla/tests/scripts/check-housekeeping-cpus.sh    |  5 +++--
 tools/tracing/rtla/tests/scripts/check-priority.sh   | 10 +++++++---
 .../rtla/tests/scripts/check-user-kernel-threads.sh  |  5 ++++-
 .../rtla/tests/scripts/lib/get_workload_pids.sh      | 12 ++++++++----
 tools/tracing/rtla/tests/timerlat.t                  | 12 ++++++------
 8 files changed, 39 insertions(+), 23 deletions(-)

diff --git a/tools/tracing/rtla/tests/osnoise.t b/tools/tracing/rtla/tests/osnoise.t
index 352b302372453..53a6a23514d73 100644
--- a/tools/tracing/rtla/tests/osnoise.t
+++ b/tools/tracing/rtla/tests/osnoise.t
@@ -16,15 +16,15 @@ check_top_q_hist "verify the --trace param" \
 
 # Thread tests
 check_top_q_hist "verify the --priority/-P param" \
-	"osnoise TOOL -P F:1 -c 0 -r 900000 -d 10s -S 1 --on-threshold shell,command=\"$testdir/scripts/check-priority.sh SCHED_FIFO 1\"" \
+	"osnoise TOOL -P F:1 -c 0 -r 900000 -d 10s -S 1 --on-threshold shell,command=\"$testdir/scripts/check-priority.sh \\\$PPID SCHED_FIFO 1\"" \
 	2 "Priorities are set correctly"
 check_top_q_hist "verify the -C/--cgroup param" \
-	"osnoise TOOL -C -c 0 -r 900000 -d 10s -S 1 --on-threshold shell,command=\"$testdir/scripts/check-cgroup-match.sh\"" \
+	"osnoise TOOL -C -c 0 -r 900000 -d 10s -S 1 --on-threshold shell,command=\"$testdir/scripts/check-cgroup-match.sh \\\$PPID\"" \
 	2 "cgroup matches for all workload PIDs"
 check_top_q_hist "verify the -c/--cpus param" \
-	"osnoise TOOL -P F:1 -c 0 -r 900000 -d 10s -S 1 --on-threshold shell,command=$testdir/scripts/check-cpus.sh" 2 "^Affinity of threads: 0$"
+	"osnoise TOOL -P F:1 -c 0 -r 900000 -d 10s -S 1 --on-threshold shell,command=\"$testdir/scripts/check-cpus.sh \\\$PPID\"" 2 "^Affinity of threads: 0$"
 check_top_q_hist "verify the -H/--house-keeping param" \
-	"osnoise TOOL -P F:1 -H 0 -r 900000 -d 10s -S 1 --on-threshold shell,command=$testdir/scripts/check-housekeeping-cpus.sh" 2 "^Affinity of threads: 0$"
+	"osnoise TOOL -P F:1 -H 0 -r 900000 -d 10s -S 1 --on-threshold shell,command=\"$testdir/scripts/check-housekeeping-cpus.sh \\\$PPID\"" 2 "^Affinity of threads: 0$"
 
 # Histogram tests
 check "hist with -b/--bucket-size" \
diff --git a/tools/tracing/rtla/tests/scripts/check-cgroup-match.sh b/tools/tracing/rtla/tests/scripts/check-cgroup-match.sh
index fdc2c68c5957a..dd9bcb6e43e22 100755
--- a/tools/tracing/rtla/tests/scripts/check-cgroup-match.sh
+++ b/tools/tracing/rtla/tests/scripts/check-cgroup-match.sh
@@ -1,10 +1,12 @@
 #!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
+# check-cgroup-match.sh <rtla_pid>
+# Check that all workload threads are in the same cgroup as rtla.
 . "$(dirname $0)/lib/get_workload_pids.sh"
-rtla_pid=$(echo $(ps -o ppid= $$))
+rtla_pid=$1
 rtla_cgroup=$(</proc/$rtla_pid/cgroup)
 echo "RTLA cgroup: $rtla_cgroup"
-for pid in $(get_workload_pids)
+for pid in $(get_workload_pids $rtla_pid)
 do
     pid_cgroup=$(</proc/$pid/cgroup)
     echo "PID $pid cgroup: $pid_cgroup"
diff --git a/tools/tracing/rtla/tests/scripts/check-cpus.sh b/tools/tracing/rtla/tests/scripts/check-cpus.sh
index 0b016d4a79459..dc0f146bf2dc5 100755
--- a/tools/tracing/rtla/tests/scripts/check-cpus.sh
+++ b/tools/tracing/rtla/tests/scripts/check-cpus.sh
@@ -1,8 +1,10 @@
 #!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
+# check-cpus.sh <rtla_pid> - print affinity of all rtla workload threads
 . "$(dirname $0)/lib/get_workload_pids.sh"
+rtla_pid=$1
 echo -n "Affinity of threads: "
-for pid in $(get_workload_pids)
+for pid in $(get_workload_pids $rtla_pid)
 do
     echo -n $(taskset -c -p $pid | cut -d ':' -f 2)
 done
diff --git a/tools/tracing/rtla/tests/scripts/check-housekeeping-cpus.sh b/tools/tracing/rtla/tests/scripts/check-housekeeping-cpus.sh
index 4742f34efb494..3f282fdd7fbf6 100755
--- a/tools/tracing/rtla/tests/scripts/check-housekeeping-cpus.sh
+++ b/tools/tracing/rtla/tests/scripts/check-housekeeping-cpus.sh
@@ -1,4 +1,5 @@
 #!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
-pid=$(ps -o ppid= $$)
-echo "Affinity of threads:$(taskset -c -p $pid | cut -d ':' -f 2)"
+# check-housekeeping-cpus.sh <rtla_pid> - print affinity of the rtla process
+rtla_pid=$1
+echo "Affinity of threads:$(taskset -c -p $rtla_pid | cut -d ':' -f 2)"
diff --git a/tools/tracing/rtla/tests/scripts/check-priority.sh b/tools/tracing/rtla/tests/scripts/check-priority.sh
index b51d5232a8688..8896bde77fd5c 100755
--- a/tools/tracing/rtla/tests/scripts/check-priority.sh
+++ b/tools/tracing/rtla/tests/scripts/check-priority.sh
@@ -1,8 +1,12 @@
 #!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
+# check-priority.sh <rtla_pid> <sched_policy> <sched_priority>
+# Check that all rtla workload threads run with the given scheduling
+# policy and priority.
 . "$(dirname $0)/lib/get_workload_pids.sh"
-for pid in $(get_workload_pids)
+rtla_pid=$1
+for pid in $(get_workload_pids $rtla_pid)
 do
-  chrt -p $pid | cut -d ':' -f 2 | head -n1 | grep "^ $1\$" >/dev/null
-  chrt -p $pid | cut -d ':' -f 2 | tail -n1 | grep "^ $2\$" >/dev/null
+  chrt -p $pid | cut -d ':' -f 2 | head -n1 | grep "^ $2\$" >/dev/null
+  chrt -p $pid | cut -d ':' -f 2 | tail -n1 | grep "^ $3\$" >/dev/null
 done && echo "Priorities are set correctly"
diff --git a/tools/tracing/rtla/tests/scripts/check-user-kernel-threads.sh b/tools/tracing/rtla/tests/scripts/check-user-kernel-threads.sh
index bb7ac510a7358..27064cb845e7e 100755
--- a/tools/tracing/rtla/tests/scripts/check-user-kernel-threads.sh
+++ b/tools/tracing/rtla/tests/scripts/check-user-kernel-threads.sh
@@ -1,10 +1,13 @@
 #!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
+# check-user-kernel-threads.sh <rtla_pid>
+# Print counts of kernel and user rtla workload threads
 . "$(dirname $0)/lib/get_workload_pids.sh"
 kthreadd_pid=$(pgrep ^kthreadd$)
+rtla_pid=$1
 cnt_kernel=0
 cnt_user=0
-for pid in $(get_workload_pids)
+for pid in $(get_workload_pids $rtla_pid)
 do
     if [ "$(echo $(ps -o ppid= $pid))" = "$kthreadd_pid" ]
     then
diff --git a/tools/tracing/rtla/tests/scripts/lib/get_workload_pids.sh b/tools/tracing/rtla/tests/scripts/lib/get_workload_pids.sh
index d10a4e3b321dc..a18f6698dd413 100644
--- a/tools/tracing/rtla/tests/scripts/lib/get_workload_pids.sh
+++ b/tools/tracing/rtla/tests/scripts/lib/get_workload_pids.sh
@@ -1,11 +1,15 @@
 #!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
+# get_workload_pids <rtla_pid> - print PIDs of all rtla workload threads
+#
+# Kernel threads are children of kthreadd. User threads are children of
+# the rtla process itself, so its PID is needed to find them.
 get_workload_pids() {
-    local shell_pid=$$
-    local rtla_pid=$(ps -o ppid= $shell_pid)
+    local rtla_pid=$1
 
     # kernel threads
     pgrep -P $(pgrep ^kthreadd$) -f '^\[?(osnoise|timerlat)/[0-9]+\]?$'
-    # user threads
-    pgrep -P $rtla_pid | grep -v "^$shell_pid$"
+    # user threads, excluding this script and the intermediate shell
+    # running it, if any
+    pgrep -P $rtla_pid | grep -vE "^($$|$PPID)$"
 }
diff --git a/tools/tracing/rtla/tests/timerlat.t b/tools/tracing/rtla/tests/timerlat.t
index 1d317c851a0fa..6001c7a09be50 100644
--- a/tools/tracing/rtla/tests/timerlat.t
+++ b/tools/tracing/rtla/tests/timerlat.t
@@ -41,19 +41,19 @@ check_top_hist "disable auto-analysis" \
 
 # Thread tests
 check_top_hist "verify -P/--priority" \
-	"timerlat TOOL -P F:1 -c 0 -d 10s -T 1 --on-threshold shell,command=\"$testdir/scripts/check-priority.sh SCHED_FIFO 1\"" \
+	"timerlat TOOL -P F:1 -c 0 -d 10s -T 1 --on-threshold shell,command=\"$testdir/scripts/check-priority.sh \\\$PPID SCHED_FIFO 1\"" \
 	2 "Priorities are set correctly"
 check_top_hist "verify -C/--cgroup" \
-	"timerlat TOOL -k -C -c 0 -d 10s -T 1 --on-threshold shell,command=\"$testdir/scripts/check-cgroup-match.sh\"" \
+	"timerlat TOOL -k -C -c 0 -d 10s -T 1 --on-threshold shell,command=\"$testdir/scripts/check-cgroup-match.sh \\\$PPID\"" \
 	2 "cgroup matches for all workload PIDs"
 check_top_q_hist "verify -c/--cpus" \
-	"timerlat TOOL -c 0 -d 10s -T 1 --on-threshold shell,command=$testdir/scripts/check-cpus.sh" 2 "^Affinity of threads: 0$"
+	"timerlat TOOL -c 0 -d 10s -T 1 --on-threshold shell,command=\"$testdir/scripts/check-cpus.sh \\\$PPID\"" 2 "^Affinity of threads: 0$"
 check_top_q_hist "verify -H/--house-keeping" \
-	"timerlat TOOL -H 0 -d 10s -T 1 --on-threshold shell,command=$testdir/scripts/check-housekeeping-cpus.sh" 2 "^Affinity of threads: 0$"
+	"timerlat TOOL -H 0 -d 10s -T 1 --on-threshold shell,command=\"$testdir/scripts/check-housekeeping-cpus.sh \\\$PPID\"" 2 "^Affinity of threads: 0$"
 check_top_q_hist "verify -k/--kernel-threads" \
-	"timerlat TOOL -k -c 0 -d 10s -T 1 --on-threshold shell,command=$testdir/scripts/check-user-kernel-threads.sh" 2 "1 kernel threads, 0 user threads"
+	"timerlat TOOL -k -c 0 -d 10s -T 1 --on-threshold shell,command=\"$testdir/scripts/check-user-kernel-threads.sh \\\$PPID\"" 2 "1 kernel threads, 0 user threads"
 check_top_q_hist "verify -u/--user-threads" \
-	"timerlat TOOL -u -c 0 -d 10s -T 1 --on-threshold shell,command=$testdir/scripts/check-user-kernel-threads.sh" 2 "0 kernel threads, 1 user threads"
+	"timerlat TOOL -u -c 0 -d 10s -T 1 --on-threshold shell,command=\"$testdir/scripts/check-user-kernel-threads.sh \\\$PPID\"" 2 "0 kernel threads, 1 user threads"
 
 # Tracer option tests - verify that rtla correctly sets tracefs options
 # Default tests: poison tracefs with wrong values, verify rtla resets to defaults
-- 
2.56.0

