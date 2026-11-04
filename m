Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811422;
	b=t5b/tQjBJqioPHD9/6/t75Hni/csx0bVaULBqORv+TwPYRR1VACmu3MaYbDGRx0iSYpj
	 2Y7siYKE1zGveoVKySKLSp2r8HDHQYIs3shlwMBKpnBAF6TZPjD5IEkdf1Ysr2mIr7L61
	 2pReSLdHJ/E4dOhbjVcdTNfMDo9/tr55Nc3v4oiXCNUwckPzDZrRRKlxZk5mhj8iGUbvO
	 8+xV21AbJu0ctBIIuEVQXvTP35K86cZ0aVA6ZbdtZuO4jq4yYENwhOK9+8LGKIk2CDFha
	 Rh+8Ndj1F6tU+j7EYysJIq7KctuDglUeooJbS7mqnZ2C2LuyAN1Rkfqn83w43Y1FWoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cE1gnx2YHPf4MvV+vgkgPbrUeIAsuqrxUSvbmG436mE=;
	b=c9Qc9guDkXuUNL3099Cx6ItjgfUU1l3QVGEXSHcpz3Fn6FVrFKu1PjobfAyhX9xOrVRM
	 S32Lax5L+G4rameMTVSMKpsHbVWPOUOEsCSeF4UJs4gCNpuamySwDZ5X9pGU2ykOJkxki
	 GrpR4JPlUz45vK6XL/VBwyaeJzVZ9gis/T9YuJiqBH35tv0OLSZ4cATxOwRs56Cmo/8fR
	 Z+XUIOGTcEGvZnwe+mvEQXfH/R9HfohQJf8mw+WpJFcY1w5BvUbYaOtoFAqzRcTrnL+Iw
	 b8NEGSiyK+I/DJvq8Dcv2L8XnH4ryMPu9YMhzTHhkjrTUUyqVCpan5Kd/yhnfnh7SGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JJ0pj60V;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E819606D80D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E819606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JJ0pj60V
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2051818eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811421; x=1794416221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cE1gnx2YHPf4MvV+vgkgPbrUeIAsuqrxUSvbmG436mE=;
        b=JJ0pj60VK1r7DoFZaHKwHqiBxc1oRaBXPVkFjQBkvoDrIiYoJ93psBc1EhUEmMdHFh
         8BI46Bo83L0XzfmoZ8pDu6RL6+vyqeatroxMvytNullkBD2YUxGSW0fEi4rD4f+d1zMK
         u3V06xvZ5Y2estRMDBxz8JA8SeFdoY6gexd/4dfQl0R34kdrJA7L4QMt1F4SFe/hloIp
         rA0CbnywzmhYCuJZk30wNSDjDeMlytnFn28OyGkWDyU8ro30Q2eDzi9gRbTbu4VFY6Lc
         Zym+lYjbDGvwVYcuUGQpbATpqP26mahOG35rjXfSScsoh7OJHX2HUquyp72j+DkznzV1
         dBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811421; x=1794416221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cE1gnx2YHPf4MvV+vgkgPbrUeIAsuqrxUSvbmG436mE=;
        b=EcObj0s7AKIkonORxzm09XAxWsOpTM3HGzdn45+fOQrtLdSHn4FYUeeAgH8ujuVxqT
         8mbj6LAi4UL7z0tRr/o0nsFNF4qUU6bv68BLO4uC70UY+xc9UOOQe9gZyKsN6qiSaTsK
         vA7Se+VleVdYcRdwFoU6ft/iB74AjV0h/yl8xe6TWszAj/4KMXTzuWQH9OVllGMP5uEZ
         OoUI4NH1WpaeYacyHAVq4uUsScIS4u+yz3jG77qJELKlYsCEVkbSGnEY48zycdbzvgZA
         yVMg68O2pTn+Sg6RG0dELVYypq2cjL2GZMpgQ1V+Z69JyvKdTfRcc18AdrUqebfOY4W4
         siVw==
X-Forwarded-Encrypted: i=1; AKwUvByYoztPyB+YvrP07T2hFcgt9HkzHjOITkfxEU9w036nxEok0iqv17a9F2oO211TND4nW1S0lwlXmV9DSzg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SBxK5Pmb5lfssU2ZFSZeIHNOB47QllkcZgDVXv7M73BZOXCCp
	UusGjtdlyBYaxo6wLoUUEDxk4WETQcELaZVixtiCZw1BghHgPzbC3HlP
X-Gm-Gg: AYBFou3ui/3//WOu+Oi4/jX45Bex05zFmdJxCXVVYcVPhAKrmTRmcxcqgENA6XnMwLC
	1ZASQJuhVlPo/E6aOKAOonDbtbZva4sprqOImvs6NHTFwWOX4aeJ9csfOaxagauXKxI7zZGemrR
	3gKtkUUXjfGnIexExqqcV1Lr/Y+3C7PX2DwJNiuaPe/ChnFbCeuQrc4fMpm67tCIQ7iF9VODILd
	bT6N0YSU3gF2jLCcTRuzNtx3QSdOWoRJO0Ocxtk5nwKKkwDchXIEGQZe/uOIiSiyDkfJMvkmeiK
	mH0ZmgDYSTzaPlamDGVj4P31832c1sBr4Ys+O6EON953JPheDAXIVm8jfoZcGswA2CD/MLYfkIK
	Myz0/3d6v7ThxasngaVW1NiAyGaaEAch44WfgG1370c4XSCuCDlmnts0Cmna2rDEVTP8gIa9neN
	xtEySIUGBFtvtzllfxwVFKVOVKPyI2/HKxnJiVu+xjrs5miBsMsb3nN8nsiaGMkblKjdckxozt1
	Igw7gFP3eAuozs2dW66hHzJ/DLHy+0kOb9qR2BzSzdxWpbGinufhsir2vEt6gTNpMzre6FCn/MR
	eFibomfT7m0fGG5r4+frNjGp0t8FgmvDVTu/76Q=
X-Received: by 2002:a05:7300:cb0b:b0:36a:1c97:26e5 with SMTP id 5a478bee46e88-36a4232f2bdmr33018593eec.12.1793811420514;
        Wed, 04 Nov 2026 08:57:00 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:57:00 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 11/28] selftests/rcutorture: Add hazptr torture test script
Date: Thu,  5 Nov 2026 00:54:29 +0800
Message-ID: <20261104165504.2430480-12-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
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

Add hazptr.sh: runs the NOPREEMPT/PREEMPT/READERS0/READERS4 basic
scenarios, the LOCKDEP (PROVE_LOCKING + wq_churn) and SLOWPATH
(forced slow path) combinations, the CPU-scaling sweep, and the
HOTADDR/LONGHOLD staged scenarios, checking each console log for
the module verdict (End of test: FAILURE), lockdep splats, and
unexpected stall-detector reports.  Also adds the torture configs
to CFLIST.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../selftests/rcutorture/bin/hazptr.sh        | 319 ++++++++++++++++++
 .../rcutorture/configs/hazptr/CFLIST          |   6 +
 2 files changed, 325 insertions(+)
 create mode 100755 tools/testing/selftests/rcutorture/bin/hazptr.sh

diff --git a/tools/testing/selftests/rcutorture/bin/hazptr.sh b/tools/testing/selftests/rcutorture/bin/hazptr.sh
new file mode 100755
index 000000000000..4e30ea51d9fc
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/bin/hazptr.sh
@@ -0,0 +1,319 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0+
+#
+# Run hazptr torture tests and report any that fail.
+#
+# Usage: hazptr.sh [ --cpus N ] [ --allcpus ] [ --datestamp string ]
+#
+# Copyright (C) 2026 Kunwu Chan
+#
+# Authors: Kunwu Chan <kunwu.chan@gmail.com>
+
+usage () {
+	echo "Usage: $scriptname optional arguments:"
+	echo "       --cpus N       override CPU count (default: auto-detect)"
+	echo "       --allcpus      test at CPU counts 8,16,32,...,256"
+	echo "       --datestamp string"
+	exit 1
+}
+
+ds=`date +%Y.%m.%d-%H.%M.%S`-hazptr
+scriptname="$0"
+
+RCUTORTURE="`pwd`/tools/testing/selftests/rcutorture"; export RCUTORTURE
+PATH=${RCUTORTURE}/bin:$PATH; export PATH
+. functions.sh
+
+cpus=""		# empty = let kvm.sh auto-detect
+allcpus=0
+
+while test $# -gt 0
+do
+	case "$1" in
+	--datestamp)
+		checkarg --datestamp "(relative pathname)" "$#" "$2" '^[a-zA-Z0-9._/-]*$' '^--'
+		ds=$2
+		shift
+		;;
+	--cpus)
+		checkarg --cpus "(number)" "$#" "$2" '^[0-9]\+$' '^--'
+		cpus="$2"
+		shift
+		;;
+	--allcpus)
+		allcpus=1
+		;;
+	*)
+		echo Unknown argument $1
+		usage
+		;;
+	esac
+	shift
+done
+
+nerrs=0
+
+run_kvm () {
+	local ds_suffix="$1"
+	local configs="$2"
+	local cpu_arg="$3"
+	local kconfig="$4"
+	local duration="${5:-5s}"
+	local resdir="$RCUTORTURE/res/$ds/$ds_suffix"
+
+	mkdir -p "$resdir"
+
+	tools/testing/selftests/rcutorture/bin/kvm.sh \
+		--torture hazptr \
+		--duration "$duration" \
+		--configs "$configs" \
+		${cpu_arg:+--cpus "$cpu_arg"} \
+		${kconfig:+--kconfig "$kconfig"} \
+		--trust-make \
+		--datestamp "$ds/$ds_suffix" > "$resdir/kvm.sh.out" 2>&1
+	return $?
+}
+
+check_lockdep () {
+	local ds_suffix="$1" config_dir="$2" label="$3"
+	local resdir="$RCUTORTURE/res/$ds/$ds_suffix"
+	local console="$resdir/$config_dir/console.log"
+
+	if ! test -f "$console"
+	then
+		echo "Missing console.log for $label ($ds_suffix)" > "$resdir/kvm.sh.err"
+		return 1
+	fi
+	if grep -qE "WARNING: possible (recursive locking|circular locking dependency)" "$console"
+	then
+		echo "Lockdep warning in $label" > "$resdir/kvm.sh.err"
+		return 1
+	fi
+	return 0
+}
+
+# The stall detector must not fire in normal scenarios: a splat here is
+# either a detector false positive (deadline arithmetic, too-aggressive
+# timeout) or a genuine kernel bug making legitimate waits exceed the
+# timeout.  Either way, fail the test.  (HOTADDR is the positive case
+# and is checked separately.)
+check_stall () {
+	local ds_suffix="$1" config_dir="$2" label="$3"
+	local resdir="$RCUTORTURE/res/$ds/$ds_suffix"
+	local console="$resdir/$config_dir/console.log"
+
+	if ! test -f "$console"
+	then
+		echo "Missing console.log for $label ($ds_suffix)" > "$resdir/kvm.sh.err"
+		return 1
+	fi
+	if grep -q "hazptr: waiter stall" "$console"
+	then
+		echo "Unexpected hazptr stall splat in $label" > "$resdir/kvm.sh.err"
+		return 1
+	fi
+	return 0
+}
+
+# Classify the in-kernel torture verdict from the console log:
+#   FAILURE    -- the module explicitly reported failure
+#   INCOMPLETE -- no module verdict reached (e.g. external limit hit)
+#   SUCCESS    -- the module explicitly reported success
+# Only SUCCESS passes.  kvm.sh does not propagate the per-run exit
+# status of its background kvm-test-1-run.sh jobs, so grep the
+# console directly.
+check_verdict () {
+	local ds_suffix="$1" config_dir="$2" label="$3"
+	local resdir="$RCUTORTURE/res/$ds/$ds_suffix"
+	local console="$resdir/$config_dir/console.log"
+
+	if ! test -f "$console"
+	then
+		echo "Missing console.log for $label ($ds_suffix)" > "$resdir/kvm.sh.err"
+		return 1
+	fi
+	if grep -q "End of test: FAILURE" "$console"
+	then
+		echo "Module verdict FAILURE in $label: $(grep -m1 "End of test: FAILURE" "$console" | cut -c1-160)" > "$resdir/kvm.sh.err"
+		return 1
+	fi
+	if ! grep -q "End of test: SUCCESS" "$console"
+	then
+		echo "No module verdict in $label (INCOMPLETE): $(grep -m1 "MAX_LOCKDEP_KEYS\|BUG:\|hung\|Killed" "$console" 2>/dev/null | cut -c1-120)" > "$resdir/kvm.sh.err"
+		return 1
+	fi
+	return 0
+}
+
+# Basic torture: all hazptr configs, CPU count auto-detected
+echo "--- hazptr basic torture${cpus:+ ($cpus CPUs)} ---"
+if run_kvm basic "NOPREEMPT PREEMPT READERS0 READERS4" "$cpus"
+then
+	for cfg in NOPREEMPT PREEMPT READERS0 READERS4
+	do
+		check_verdict basic "$cfg" "basic/$cfg" ||
+			nerrs=$((nerrs+1))
+		check_stall basic "$cfg" "basic/$cfg" ||
+			nerrs=$((nerrs+1))
+	done
+else
+	nerrs=$((nerrs+1))
+fi
+
+# LOCKDEP: verify no lockdep splats with PROVE_LOCKING + wq_churn
+
+echo "--- hazptr lockdep + wq_churn ---"
+if run_kvm lockdep-wq LOCKDEP "$cpus"
+then
+	check_verdict lockdep-wq LOCKDEP "LOCKDEP wq_churn" ||
+		nerrs=$((nerrs+1))
+	check_lockdep lockdep-wq LOCKDEP "LOCKDEP wq_churn" ||
+		nerrs=$((nerrs+1))
+	check_stall lockdep-wq LOCKDEP "LOCKDEP wq_churn" ||
+		nerrs=$((nerrs+1))
+else
+	nerrs=$((nerrs+1))
+fi
+
+# SLOWPATH + PROVE_LOCKING: verify forced-slowpath does not deadlock
+
+echo "--- hazptr SLOWPATH + lockdep ---"
+if run_kvm slowpath-lockdep SLOWPATH "$cpus" \
+	"CONFIG_PROVE_LOCKING=y"
+then
+		check_verdict slowpath-lockdep SLOWPATH \
+			"SLOWPATH+PROVE_LOCKING" ||
+			nerrs=$((nerrs+1))
+		check_lockdep slowpath-lockdep SLOWPATH \
+			"SLOWPATH+PROVE_LOCKING" ||
+			nerrs=$((nerrs+1))
+		check_stall slowpath-lockdep SLOWPATH \
+			"SLOWPATH+PROVE_LOCKING" ||
+			nerrs=$((nerrs+1))
+else
+	nerrs=$((nerrs+1))
+fi
+
+# HOTADDR: Lai-scenario documenting mode.  Starvation episodes and
+# stall-detector splats are EXPECTED here (baseline behavior); the
+# check verifies the scenario ran and the machinery stayed sane.
+
+echo "--- hazptr HOTADDR (Lai-scenario documenting) ---"
+if run_kvm hotaddr HOTADDR "$cpus" "" "30s"
+then
+	resdir="$RCUTORTURE/res/$ds/hotaddr/HOTADDR"
+	console="$resdir/console.log"
+	hotaddr_err=""
+	if ! test -f "$console"
+	then
+		echo "Missing console.log for HOTADDR" > "$RCUTORTURE/res/$ds/hotaddr/kvm.sh.err"
+		hotaddr_err=1
+	elif ! grep -q "End of test: SUCCESS" "$console"
+	then
+		echo "HOTADDR: module verdict not SUCCESS" > "$resdir/kvm.sh.err"
+		hotaddr_err=1
+	elif ! grep -q "hot r" "$console"
+	then
+		echo "HOTADDR: staged rounds not found" > "$resdir/kvm.sh.err"
+		hotaddr_err=1
+	fi
+	# Independent checks: a failure must not be masked by an earlier
+	# elif taking the note branch.
+	if grep -q "positive control timed out" "$console" 2>/dev/null
+	then
+		echo "HOTADDR: positive control failure (machinery fault)" >> "$resdir/kvm.sh.err"
+		hotaddr_err=1
+	fi
+	if [ -z "$hotaddr_err" ]
+	then
+		if ! grep -q "hazptr: waiter stall" "$console"
+		then
+			echo "HOTADDR note: no stall splats observed (record as not-reproduced, investigate interleaving)" > "$resdir/kvm.sh.note"
+		else
+			echo "HOTADDR: starvation reproduced, stall detector confirmed, drain verified"
+		fi
+	else
+		nerrs=$((nerrs+1))
+	fi
+else
+	nerrs=$((nerrs+1))
+fi
+
+# LONGHOLD: legitimate long-lived references.  The stall detector must
+# fire (observation), the holder must release, and the waiter must drain
+# normally afterwards: diagnostics without interruption, module verdict
+# stays SUCCESS.
+
+echo "--- hazptr LONGHOLD (legitimate long-held reference) ---"
+if run_kvm longhold LONGHOLD "$cpus" "" "60s"
+then
+	resdir="$RCUTORTURE/res/$ds/longhold/LONGHOLD"
+	console="$resdir/console.log"
+	longhold_err=""
+	if ! test -f "$console"
+	then
+		echo "Missing console.log for LONGHOLD" > "$RCUTORTURE/res/$ds/longhold/kvm.sh.err"
+		longhold_err=1
+	elif ! grep -q "End of test: SUCCESS" "$console"
+	then
+		echo "LONGHOLD: module verdict not SUCCESS" > "$resdir/kvm.sh.err"
+		longhold_err=1
+	elif ! grep -q "longhold drain=1" "$console"
+	then
+		echo "LONGHOLD: drain after release not observed" > "$resdir/kvm.sh.err"
+		longhold_err=1
+	fi
+	# Independent check: the sync must drain after release; this
+	# must not be masked by the stall-report note branch.
+	if grep -q "longhold: sync did not drain" "$console" 2>/dev/null
+	then
+		echo "LONGHOLD: sync failed to drain after release" >> "$resdir/kvm.sh.err"
+		longhold_err=1
+	fi
+	if [ -z "$longhold_err" ]
+	then
+		if ! grep -q "hazptr: waiter stall" "$console"
+		then
+			echo "LONGHOLD note: stall detector did not fire on a legitimate long hold" > "$resdir/kvm.sh.note"
+		else
+			echo "LONGHOLD: detector fired on legitimate hold, drain verified, no interruption"
+		fi
+	else
+		nerrs=$((nerrs+1))
+	fi
+else
+	nerrs=$((nerrs+1))
+fi
+
+# CPU scaling: optionally test at multiple CPU counts
+
+if test "$allcpus" -ne 0
+then
+	max_cpus=`grep '^processor' /proc/cpuinfo 2>/dev/null | wc -l`
+	for n in 8 16 32 64 128 256
+	do
+		if test "$n" -le "$max_cpus"
+		then
+		echo "--- hazptr CPU=$n ---"
+		if run_kvm "cpu$n" "PREEMPT" "$n" "CONFIG_NR_CPUS=$n"
+		then
+			check_verdict "cpu$n" PREEMPT "cpu$n/PREEMPT" ||
+				nerrs=$((nerrs+1))
+			check_stall "cpu$n" PREEMPT "cpu$n/PREEMPT" ||
+				nerrs=$((nerrs+1))
+		else
+			nerrs=$((nerrs+1))
+		fi
+		fi
+	done
+fi
+
+# Report
+
+if test "$nerrs" -ne 0
+then
+	echo "hazptr.sh: $nerrs test(s) failed"
+	exit 1
+fi
+echo "hazptr.sh: all tests passed"
+exit 0
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST b/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST
index 4d62eb4a39f9..90ef09b0e654 100644
--- a/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST
@@ -1,2 +1,8 @@
 NOPREEMPT
 PREEMPT
+READERS0
+READERS4
+SLOWPATH
+LOCKDEP
+CPU128
+CPU256
-- 
2.43.0

