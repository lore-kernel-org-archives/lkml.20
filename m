Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D8F494A18
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453568; cv=none; b=CQKaMiVi9aZPWqFkft0LfPR+YSwVmgvXdSA7mpaXsLbd6d+c3eVRibJR6V7ErJwocl9bpdvMPMi99W5sBC84N1uKAPFF6hKDHwoe5MXqqNhjaN0jl43E0W5geB3O7sXpkNpoQClRq61RUS/q7pb+D+x1tUK5r3ULWsHb/qN55FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453568; c=relaxed/simple;
	bh=rgSr/Guj4GUF8wvvCOHx1p4og8x4bjpNWQ//b+9Zzu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MJvkC/WO/e6bMSfjS+GfYf978n7baeg2j1+MDQ+uQCJF8i2z1gbCwixZyB8v+skmO0ABYVT7HepELbcAt0q9IJ2Stn9quURpiaEvCjE96VIj/0ZU6caUV2PUdNKmFDYNDbZpca2LztxZmtqaSRQoqiFd3n5uGL5nCk8RvfPiMlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rZMv2/+S; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rZMv2/+S"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so397092a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791453558; x=1792058358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpRpBEaZCuebRAlGLna05hDbPxBUbWw7JtxZRFzQOJA=;
        b=rZMv2/+SeW/AfTeTpDKwwZ/Lcut7qA9sbLmUjTbehgJHyJqB6n0rjnAoBEJgez0pej
         ThoMbgFZ9vIdo07zp+Sub/gIW3KGJwPisC1ESbLGMdBjT7YxJ/9NuWRSffhs2bAb6FxT
         yYmxN/xCIfDNOTpTWHO8tWRA8tztAxdC4u4YwfXonnI2M9KXD2/YXvqPIWgDmRsH40DV
         jWTj7/4tzcmVTIvP3jo0YuoR/h69Hag9ybV8dAkwbzpXv4I4/PasqD3LE2l057qUnOWv
         /UyWfKLaRIRKY7+x4qhhg/UOUAeFQKLDRriHZUJfxOiUz/ehhrVgQBTNI8JDzxUC+n75
         q1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791453558; x=1792058358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QpRpBEaZCuebRAlGLna05hDbPxBUbWw7JtxZRFzQOJA=;
        b=D/bCkNHLWC8Zf816LUzUN25NaDmDRz5PjnTAP7paGax3xZRjd2IDFGLLmYiIuhr31E
         ZL6dD5nF0uyDGzR5ylf6lRbTaaMzMxQV/ocpM5sg0JVhIur2JRVUIVr9oTZVnzifSbNe
         DvM4geWA6BGf0lNuBjqmTx9uQX++T6Bp2yQ/aAtMBghsMROp9xWjkQpFBK4lSfnnGYLq
         LQAP8Tro4zd5xDXEm+QLEgoQSQi6REuor7f2idBvb6+CYJBDeKQrBW1cbvH76Oi/wAw9
         2U92Hc/xIX6Fn1cvnHKcEnJ1OLdgn+GJ79D4n0Cy3bcPh0mRjIVs+63udNqalQJTfiCF
         YOuw==
X-Forwarded-Encrypted: i=1; AKwUvBy4QALh/eDuao8+ulAQKTG7+u7ARo6w8DK48MSbnsrk6jzpvX5S0Lw5H5X9Nu5GQd87IXeh//lB0kVBuPM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSYZDj0T65kOXbXV+Z9otL4G5nZ9YHp0/YRby7CtpnZ7ysoobI
	CLoxkIyoRNcYfgoAwChstxOTd3uORBumA9JMZSeZeIVJT4rW0pwA0Mxu
X-Gm-Gg: AYBFou2uoeOPqG89dVbv1z4sO8Nl47kg+egiIz/BTqQAD6sm+lgjWLBdyIIJfVB0kVn
	YODXOrPLW1U0reUE60+xnsjGIPpr5pxytpljWt3v8GGlJbpfS4iKu1e3H/LmgShP1F50FbEEZSh
	yji06zdmLcUXAYIcFU3CJKjVEmVWy75cJfxo8QZl6FRFNMM+Lg0DKJw9rpvD9fRGjyP+/CvLf0K
	sIABzThozowKp2e8uoeg+d8LO9lE6LKL5Uyiqk4iQBEfKURFhDwExZNxszcBAiAC3f2NF8tGzuv
	71+b81bDKNG/99aj6DM/cV5AIaYiHTT4BgeC4geYVkylhoLymhvAJCtTdkmJMQyy86WOUgxf1S7
	/AjN6iSzFWyva2I1zmmBl+Jr9QgSUZYseF1+B6kXMb1O5gPDGG5HW9DBP37aTNPTtZM76oR+VIj
	wbdYpsqei4A5T4K2VL0F6VjAiNYzqvW3lVAebNeVahptPEbEGJ4K1WiCRIkim4uRaYeDqtCnZ9Q
	pPGGSg3ptwVushyYRViv85QD2f3UVjOiujJ35Cl0Mbtn2g4he2ZuntH
X-Received: by 2002:a17:90a:e70e:b0:3a0:eaf4:a435 with SMTP id 98e67ed59e1d1-3aaedf942a5mr1152500a91.46.1791453557648;
        Thu, 08 Oct 2026 02:59:17 -0700 (PDT)
Received: from yafangs-Air ([240e:46c:2100:3ace:b801:9432:769f:ff9d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff7ff13esm3422790a91.7.2026.10.08.02.59.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 02:59:17 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: jpoimboe@kernel.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	song@kernel.org
Cc: live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v11 7/9] selftests/livepatch: Add provides/obsoletes test scenarios
Date: Thu,  8 Oct 2026 17:58:28 +0800
Message-ID: <20261008095830.26308-8-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261008095830.26308-1-laoar.shao@gmail.com>
References: <20261008095830.26308-1-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the legacy "replace" field has been replaced by the
provides/obsoletes mechanism, add test scenarios to verify the new
behavior.

The test modules gain provides/obsoletes module parameters, and
test-provides-obsoletes.sh covers the new replace semantics: provides=0
replacement, same-provides replacement, obsoletes-based replacement
and coexistence of different provides ids.

These tests are skipped on kernels that still support the legacy
"replace" attribute.

Assisted-by: LLM
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Acked-by: Miroslav Benes <mbenes@suse.cz>
---
 tools/testing/selftests/livepatch/Makefile    |   3 +-
 .../livepatch/test-provides-obsoletes.sh      | 229 ++++++++++++++++++
 .../test_modules/test_klp_callbacks_demo2.c   |  12 +-
 .../test_modules/test_klp_cmdline_lp.c        |  11 +-
 .../test_modules/test_klp_meminfo_lp.c        |  22 +-
 .../livepatch/test_modules/test_klp_state.c   |   5 +-
 .../livepatch/test_modules/test_klp_state2.c  |   5 +-
 7 files changed, 261 insertions(+), 26 deletions(-)
 create mode 100755 tools/testing/selftests/livepatch/test-provides-obsoletes.sh

diff --git a/tools/testing/selftests/livepatch/Makefile b/tools/testing/selftests/livepatch/Makefile
index a080eb54a215..38f98594d883 100644
--- a/tools/testing/selftests/livepatch/Makefile
+++ b/tools/testing/selftests/livepatch/Makefile
@@ -11,7 +11,8 @@ TEST_PROGS := \
 	test-ftrace.sh \
 	test-sysfs.sh \
 	test-syscall.sh \
-	test-kprobe.sh
+	test-kprobe.sh \
+	test-provides-obsoletes.sh
 
 TEST_FILES := settings
 
diff --git a/tools/testing/selftests/livepatch/test-provides-obsoletes.sh b/tools/testing/selftests/livepatch/test-provides-obsoletes.sh
new file mode 100755
index 000000000000..78a644f6ec56
--- /dev/null
+++ b/tools/testing/selftests/livepatch/test-provides-obsoletes.sh
@@ -0,0 +1,229 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2026 Yafang Shao <laoar.shao@gmail.com>
+
+. $(dirname $0)/functions.sh
+
+MOD_MEMINFO=test_klp_meminfo_lp
+MOD_CMDLINE=test_klp_cmdline_lp
+
+setup_config
+detect_provides_attr
+
+# The provides/obsoletes based tests only run on kernels that no longer
+# support the legacy "replace" attribute.
+if [[ "$HAS_PROVIDES_ATTR" != "1" ]]; then
+	skip_exit "kernel still supports the legacy replace attribute"
+fi
+
+
+# - load a livepatch with provides=0 (cmdline), then another with
+#   provides=0 (meminfo). The second replaces the first (same provides).
+# - unload the remaining livepatch
+
+start_test "provides 0 replaces provides 0"
+
+load_lp $MOD_CMDLINE provides=0
+load_lp $MOD_MEMINFO provides=0
+
+check_sysfs_value "$MOD_MEMINFO" "enabled" "1"
+
+disable_lp $MOD_MEMINFO
+unload_lp $MOD_MEMINFO
+unload_lp $MOD_CMDLINE
+
+check_result "% insmod test_modules/$MOD_CMDLINE.ko provides=0
+livepatch: enabling patch '$MOD_CMDLINE'
+livepatch: '$MOD_CMDLINE': initializing patching transition
+livepatch: '$MOD_CMDLINE': starting patching transition
+livepatch: '$MOD_CMDLINE': completing patching transition
+livepatch: '$MOD_CMDLINE': patching complete
+% insmod test_modules/$MOD_MEMINFO.ko provides=0
+livepatch: enabling patch '$MOD_MEMINFO'
+livepatch: '$MOD_MEMINFO': initializing patching transition
+livepatch: '$MOD_MEMINFO': starting patching transition
+livepatch: '$MOD_MEMINFO': completing patching transition
+livepatch: '$MOD_MEMINFO': patching complete
+% echo 0 > $SYSFS_KLP_DIR/$MOD_MEMINFO/enabled
+livepatch: '$MOD_MEMINFO': initializing unpatching transition
+livepatch: '$MOD_MEMINFO': starting unpatching transition
+livepatch: '$MOD_MEMINFO': completing unpatching transition
+livepatch: '$MOD_MEMINFO': unpatching complete
+% rmmod $MOD_MEMINFO
+% rmmod $MOD_CMDLINE"
+
+
+# - load a livepatch with provides=1 (cmdline), then another with
+#   provides=1 (meminfo). The second replaces the first (same provides).
+# - unload the remaining livepatch
+
+start_test "same provides replaces"
+
+load_lp $MOD_CMDLINE provides=1
+load_lp $MOD_MEMINFO provides=1
+
+check_sysfs_value "$MOD_MEMINFO" "enabled" "1"
+
+disable_lp $MOD_MEMINFO
+unload_lp $MOD_MEMINFO
+unload_lp $MOD_CMDLINE
+
+check_result "% insmod test_modules/$MOD_CMDLINE.ko provides=1
+livepatch: enabling patch '$MOD_CMDLINE'
+livepatch: '$MOD_CMDLINE': initializing patching transition
+livepatch: '$MOD_CMDLINE': starting patching transition
+livepatch: '$MOD_CMDLINE': completing patching transition
+livepatch: '$MOD_CMDLINE': patching complete
+% insmod test_modules/$MOD_MEMINFO.ko provides=1
+livepatch: enabling patch '$MOD_MEMINFO'
+livepatch: '$MOD_MEMINFO': initializing patching transition
+livepatch: '$MOD_MEMINFO': starting patching transition
+livepatch: '$MOD_MEMINFO': completing patching transition
+livepatch: '$MOD_MEMINFO': patching complete
+% echo 0 > $SYSFS_KLP_DIR/$MOD_MEMINFO/enabled
+livepatch: '$MOD_MEMINFO': initializing unpatching transition
+livepatch: '$MOD_MEMINFO': starting unpatching transition
+livepatch: '$MOD_MEMINFO': completing unpatching transition
+livepatch: '$MOD_MEMINFO': unpatching complete
+% rmmod $MOD_MEMINFO
+% rmmod $MOD_CMDLINE"
+
+
+# - load a livepatch with provides=1 (cmdline), then another with
+#   provides=2 and obsoletes=[1] (meminfo). The second replaces the
+#   first (obsoletes contains the first patch's provides id).
+# - verify the provides/obsoletes sysfs values
+# - unload the remaining livepatch
+
+start_test "obsoletes replaces"
+
+load_lp $MOD_CMDLINE provides=1
+load_lp $MOD_MEMINFO provides=2 obsoletes=1
+
+check_sysfs_value "$MOD_MEMINFO" "provides" "2"
+check_sysfs_value "$MOD_MEMINFO" "obsoletes" "1"
+
+disable_lp $MOD_MEMINFO
+unload_lp $MOD_MEMINFO
+unload_lp $MOD_CMDLINE
+
+check_result "% insmod test_modules/$MOD_CMDLINE.ko provides=1
+livepatch: enabling patch '$MOD_CMDLINE'
+livepatch: '$MOD_CMDLINE': initializing patching transition
+livepatch: '$MOD_CMDLINE': starting patching transition
+livepatch: '$MOD_CMDLINE': completing patching transition
+livepatch: '$MOD_CMDLINE': patching complete
+% insmod test_modules/$MOD_MEMINFO.ko provides=2 obsoletes=1
+livepatch: enabling patch '$MOD_MEMINFO'
+livepatch: '$MOD_MEMINFO': initializing patching transition
+livepatch: '$MOD_MEMINFO': starting patching transition
+livepatch: '$MOD_MEMINFO': completing patching transition
+livepatch: '$MOD_MEMINFO': patching complete
+% echo 0 > $SYSFS_KLP_DIR/$MOD_MEMINFO/enabled
+livepatch: '$MOD_MEMINFO': initializing unpatching transition
+livepatch: '$MOD_MEMINFO': starting unpatching transition
+livepatch: '$MOD_MEMINFO': completing unpatching transition
+livepatch: '$MOD_MEMINFO': unpatching complete
+% rmmod $MOD_MEMINFO
+% rmmod $MOD_CMDLINE"
+
+
+# - load two livepatches with different provides ids that modify
+#   different functions and verify that they coexist
+# - in particular, verify that provides=0 does NOT replace a patch
+#   with a different provides id
+# - unload both livepatches
+
+start_test "provides 0 coexists with provides 1"
+
+load_lp $MOD_CMDLINE provides=0
+load_lp $MOD_MEMINFO provides=1
+
+grep 'live patched' /proc/cmdline > /dev/kmsg
+grep 'live patched' /proc/meminfo > /dev/kmsg
+
+disable_lp $MOD_CMDLINE
+unload_lp $MOD_CMDLINE
+disable_lp $MOD_MEMINFO
+unload_lp $MOD_MEMINFO
+
+check_result "% insmod test_modules/$MOD_CMDLINE.ko provides=0
+livepatch: enabling patch '$MOD_CMDLINE'
+livepatch: '$MOD_CMDLINE': initializing patching transition
+livepatch: '$MOD_CMDLINE': starting patching transition
+livepatch: '$MOD_CMDLINE': completing patching transition
+livepatch: '$MOD_CMDLINE': patching complete
+% insmod test_modules/$MOD_MEMINFO.ko provides=1
+livepatch: enabling patch '$MOD_MEMINFO'
+livepatch: '$MOD_MEMINFO': initializing patching transition
+livepatch: '$MOD_MEMINFO': starting patching transition
+livepatch: '$MOD_MEMINFO': completing patching transition
+livepatch: '$MOD_MEMINFO': patching complete
+$MOD_CMDLINE: this has been live patched
+$MOD_MEMINFO: this has been live patched
+% echo 0 > $SYSFS_KLP_DIR/$MOD_CMDLINE/enabled
+livepatch: '$MOD_CMDLINE': initializing unpatching transition
+livepatch: '$MOD_CMDLINE': starting unpatching transition
+livepatch: '$MOD_CMDLINE': completing unpatching transition
+livepatch: '$MOD_CMDLINE': unpatching complete
+% rmmod $MOD_CMDLINE
+% echo 0 > $SYSFS_KLP_DIR/$MOD_MEMINFO/enabled
+livepatch: '$MOD_MEMINFO': initializing unpatching transition
+livepatch: '$MOD_MEMINFO': starting unpatching transition
+livepatch: '$MOD_MEMINFO': completing unpatching transition
+livepatch: '$MOD_MEMINFO': unpatching complete
+% rmmod $MOD_MEMINFO"
+
+
+# - load a livepatch with provides=2 and obsoletes=[1] (meminfo),
+#   then another with provides=1 (cmdline). The second patch does not
+#   list provides=2 in its own obsoletes list, so it does not replace
+#   the first one: the obsoletes relationship is not symmetric and
+#   both livepatches coexist.
+# - verify that both livepatches remain active
+# - unload both livepatches
+#
+#   MOD_MEMINFO(provides=2, obsoletes=[1])  -- loaded first
+#   MOD_CMDLINE(provides=1)                 -- loaded second, coexists
+
+start_test "obsoletes is not symmetric"
+
+load_lp $MOD_MEMINFO provides=2 obsoletes=1
+load_lp $MOD_CMDLINE provides=1
+
+grep 'live patched' /proc/cmdline > /dev/kmsg
+grep 'live patched' /proc/meminfo > /dev/kmsg
+
+disable_lp $MOD_CMDLINE
+unload_lp $MOD_CMDLINE
+disable_lp $MOD_MEMINFO
+unload_lp $MOD_MEMINFO
+
+check_result "% insmod test_modules/$MOD_MEMINFO.ko provides=2 obsoletes=1
+livepatch: enabling patch '$MOD_MEMINFO'
+livepatch: '$MOD_MEMINFO': initializing patching transition
+livepatch: '$MOD_MEMINFO': starting patching transition
+livepatch: '$MOD_MEMINFO': completing patching transition
+livepatch: '$MOD_MEMINFO': patching complete
+% insmod test_modules/$MOD_CMDLINE.ko provides=1
+livepatch: enabling patch '$MOD_CMDLINE'
+livepatch: '$MOD_CMDLINE': initializing patching transition
+livepatch: '$MOD_CMDLINE': starting patching transition
+livepatch: '$MOD_CMDLINE': completing patching transition
+livepatch: '$MOD_CMDLINE': patching complete
+$MOD_CMDLINE: this has been live patched
+$MOD_MEMINFO: this has been live patched
+% echo 0 > $SYSFS_KLP_DIR/$MOD_CMDLINE/enabled
+livepatch: '$MOD_CMDLINE': initializing unpatching transition
+livepatch: '$MOD_CMDLINE': starting unpatching transition
+livepatch: '$MOD_CMDLINE': completing unpatching transition
+livepatch: '$MOD_CMDLINE': unpatching complete
+% rmmod $MOD_CMDLINE
+% echo 0 > $SYSFS_KLP_DIR/$MOD_MEMINFO/enabled
+livepatch: '$MOD_MEMINFO': initializing unpatching transition
+livepatch: '$MOD_MEMINFO': starting unpatching transition
+livepatch: '$MOD_MEMINFO': completing unpatching transition
+livepatch: '$MOD_MEMINFO': unpatching complete
+% rmmod $MOD_MEMINFO"
+
+exit 0
diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_demo2.c b/tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_demo2.c
index 6c46ce575f5c..93789470fe18 100644
--- a/tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_demo2.c
+++ b/tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_demo2.c
@@ -8,10 +8,9 @@
 #include <linux/livepatch.h>
 
 #ifdef CONFIG_KLP_HAS_PROVIDES
-/*
- * TODO: Add provides/obsoletes module parameters for the
- * provides/obsoletes based tests (to be added later).
- */
+static unsigned int provides;
+module_param(provides, uint, 0444);
+MODULE_PARM_DESC(provides, "provides id (default=0)");
 #else
 static int replace;
 module_param(replace, int, 0644);
@@ -87,10 +86,7 @@ static struct klp_patch patch = {
 static int test_klp_callbacks_demo2_init(void)
 {
 #ifdef CONFIG_KLP_HAS_PROVIDES
-	/*
-	 * TODO: Set provides/obsoletes from the module parameters
-	 * for the provides/obsoletes based tests (to be added later).
-	 */
+	patch.provides = provides;
 #else
 	patch.replace = replace;
 #endif
diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_cmdline_lp.c b/tools/testing/selftests/livepatch/test_modules/test_klp_cmdline_lp.c
index 88c6aed925fb..8a93f005a383 100644
--- a/tools/testing/selftests/livepatch/test_modules/test_klp_cmdline_lp.c
+++ b/tools/testing/selftests/livepatch/test_modules/test_klp_cmdline_lp.c
@@ -6,8 +6,14 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/livepatch.h>
-
 #include <linux/seq_file.h>
+
+#ifdef CONFIG_KLP_HAS_PROVIDES
+static unsigned int provides;
+module_param(provides, uint, 0444);
+MODULE_PARM_DESC(provides, "provides id (default=0)");
+#endif
+
 static int livepatch_cmdline_proc_show(struct seq_file *m, void *v)
 {
 	seq_printf(m, "%s: %s\n", THIS_MODULE->name,
@@ -36,6 +42,9 @@ static struct klp_patch patch = {
 
 static int test_klp_cmdline_lp_init(void)
 {
+#ifdef CONFIG_KLP_HAS_PROVIDES
+	patch.provides = provides;
+#endif
 	return klp_enable_patch(&patch);
 }
 
diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_meminfo_lp.c b/tools/testing/selftests/livepatch/test_modules/test_klp_meminfo_lp.c
index 0c434a27672d..a3b433385148 100644
--- a/tools/testing/selftests/livepatch/test_modules/test_klp_meminfo_lp.c
+++ b/tools/testing/selftests/livepatch/test_modules/test_klp_meminfo_lp.c
@@ -8,10 +8,15 @@
 #include <linux/livepatch.h>
 
 #ifdef CONFIG_KLP_HAS_PROVIDES
-/*
- * TODO: Add provides/obsoletes module parameters for the
- * provides/obsoletes based tests (to be added later).
- */
+static unsigned int provides;
+module_param(provides, uint, 0444);
+MODULE_PARM_DESC(provides, "provides id (default=0)");
+
+#define KLP_MAX_OBSOLETES 16
+static unsigned int obsoletes[KLP_MAX_OBSOLETES];
+static int nr_obsoletes;
+module_param_array(obsoletes, uint, &nr_obsoletes, 0444);
+MODULE_PARM_DESC(obsoletes, "obsoletes provides ids");
 #else
 static int replace;
 module_param(replace, int, 0644);
@@ -51,10 +56,11 @@ static struct klp_patch patch = {
 static int test_klp_meminfo_lp_init(void)
 {
 #ifdef CONFIG_KLP_HAS_PROVIDES
-	/*
-	 * TODO: Set provides/obsoletes from the module parameters
-	 * for the provides/obsoletes based tests (to be added later).
-	 */
+	patch.provides = provides;
+	if (nr_obsoletes > 0) {
+		patch.obsoletes = obsoletes;
+		patch.nr_obsoletes = nr_obsoletes;
+	}
 #else
 	patch.replace = replace;
 #endif
diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_state.c b/tools/testing/selftests/livepatch/test_modules/test_klp_state.c
index 4d419a58cf65..f53eead9d55b 100644
--- a/tools/testing/selftests/livepatch/test_modules/test_klp_state.c
+++ b/tools/testing/selftests/livepatch/test_modules/test_klp_state.c
@@ -143,10 +143,7 @@ static struct klp_patch patch = {
 	.objs = objs,
 	.states = states,
 #ifdef CONFIG_KLP_HAS_PROVIDES
-	/*
-	 * TODO: Add provides/obsoletes module parameters for the
-	 * provides/obsoletes based tests (to be added later).
-	 */
+	/* provides=0 by default, replaces all provides=0 patches */
 #else
 	.replace = true,
 #endif
diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_state2.c b/tools/testing/selftests/livepatch/test_modules/test_klp_state2.c
index 4f70f0619967..5f07fe1be2b9 100644
--- a/tools/testing/selftests/livepatch/test_modules/test_klp_state2.c
+++ b/tools/testing/selftests/livepatch/test_modules/test_klp_state2.c
@@ -172,10 +172,7 @@ static struct klp_patch patch = {
 	.objs = objs,
 	.states = states,
 #ifdef CONFIG_KLP_HAS_PROVIDES
-	/*
-	 * TODO: Add provides/obsoletes module parameters for the
-	 * provides/obsoletes based tests (to be added later).
-	 */
+	/* provides=0 by default, replaces all provides=0 patches */
 #else
 	.replace = true,
 #endif
-- 
2.52.0

