Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021869;
	b=b18AoC8Fpns0LTN/dHSNanMxSQJYr+YLVEupkIFu3HGD57o89v4hSJOJ36vLIKnDr0fC
	 RRgh5fZQYZeTNiArUCeooWzsIWEzL4mg0G/0M4NMD23kQnArgPgPszHBPJ21as2hyWF05
	 rLsgryrfJTuEJuJOORj+T0yB+kLtEoiS4tx8lmrvMr8p0Upr73k1BrG8uYRBY7TAL6fSF
	 dkc+oCgXuh3YE/rwmg79S5foR1L3JzwaVGR2nBAo2r71eAviTrOf9mdbLPy3o0f0Gd8jw
	 hGB/kllqtXDqj85gTDL+OkhBjOThEN/yyH5kvZbVCLkPMzPMw0/bhZ3KiyXCtcs4WVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T7y8SwdnADDbC+DDlYVYRTqGz++HEi25V4ddWUokft4=;
	b=a+zanZKtwjHXCIt7RGC3DqDha8Y5vtsotzYUJ2aq8uxpmuPbjXEND2ex1JoyKIYFvzap
	 SYONEssBU6biDN7w7tmINOGlh4wRtox+4tXAcfVw8ZhxYiz4uPBxLjy11sjJtlkTdQg+i
	 qIz4BQ1fHYhU5iIcM8VH/bUEmX/Y6fkevJdfCtrEH4i3EE75VY/OpGynGogBxFG5GkPEU
	 2ATWC15MB1fvxZ9iCQEnyFm8mCbBiCAZBiIcpGRZ9UXW6ayjlQ9oTRlrGwoHa0wLvesnr
	 JpDzBk9XiZYqIfS7X7e6sTD4YKecGY82crStfFsv0Scv7rEUbw+7jPGA7EO7dyzN5xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=G2lQFepv;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3A0606AD24
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B3A0606AD24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=G2lQFepv
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso15920395ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793021868; x=1793626668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T7y8SwdnADDbC+DDlYVYRTqGz++HEi25V4ddWUokft4=;
        b=G2lQFepvcX4skziAJU8uTi8jfQOLX405n0O9E/YUznVap9Xzi0zgoDMeyTyOip6q+C
         8mobFkCXoLTGHwza856AvHTLCErL1CIwAhxtMkxarzI8QSRSA9XPXCjM91uL0M2Ckisa
         hLWINSN+vMpvrTd8LU2BOsKGwQvccnamRC8egQZikf0y05o01g3YthPiaKWsOY41Fzd1
         zoZlxJNgqLwyL7uQdh15Fkcm14Q3B7s/StJ3g5fKxlTX7FZpJfNhXqhdyEBhJBSui2rV
         4hf3VsJaaJ0UJ8dX4S6veTvxTWzKKS/tBHSw3oAPEcEhyc1aLJnomnCSEcUBype1CkoZ
         qu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021868; x=1793626668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T7y8SwdnADDbC+DDlYVYRTqGz++HEi25V4ddWUokft4=;
        b=lcDYVZAY6A9Pl8YJiA+aMZSE9m0y+NTLvNFj12djX7Ht2L1d9BPZCEGfGZkAioLD2V
         aLnjdJqoVYqMptx9EopLWtXk8K/2JaA0RkWo6wSUjWRT/J6+OuaZaJLVaLgaZZ79DPex
         MM/1KQj+ZYtUyjciveEoRVCmTwtGED7aFpf4rLgNRv6eAZclzmb1jzvA8K3Zxjt/1vA5
         yTxm+C54fDDLcwL7VOME7BtHFR3FrGplJtVzzymHS56xRzv6i+u83l2SC7M06oQ9SIEJ
         U5HWxsZJNCinaSLJ0i3i8dlBOj91RnCSr/A4lpuxZOOtugm4BfDo/GBgiQ45ePAFIdnZ
         M1dg==
X-Forwarded-Encrypted: i=1; AKwUvBybSbibLVfJvNjBVj76IR4aAS7/g2ZDob7AOJsXOwVnycKifM94WQ5ukQ/fO3hBNfXNxbYj3gSbanHkhw8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLg56yWO+sliaBwSf3NH6+4WnfvDT8k6FZ60G7+DbehQVPd1okP
	yNsS7vVOtWo7MR9jQ1wk77IdwcgQPoRXB1TJgpFvdTjHzL4MOx4pQFyP
X-Gm-Gg: AYBFou1ZwPggtqKrpU4sDsYfCh4tGvuk9TDGPpEHJVF8Mcw/17izyjINwLrqftu0PML
	I9bjSYxO4+hLHY9a9m8ypVYDcLh41QfG1hHGFCHHDxfzLD9VNrNbXu6rvnKDD42D5xFJuu9ioXw
	Lwa5Ev1CSMn9jfZ1OB3Q6NfNlPE+WYtyxnHRwuPQA62mlKB5tvmyh0m2iKrO6Dbc2L2Em/7gweM
	7NGx2P8pI0fvVrqial7XbJNL/x1/eAhXdNLqlDKRUpph+ktOcoh8TY88gm+5f9yrONh80PIPnvS
	zJccY+fAzP4MzPt0Iqslzbg6JVaz8XLeGbknHKOo+Jpi7sH7/AurpluQLzkRKOKoBErRy+rAQGV
	Q8TrPJkQPY3wzO9aSZg2knCU9zxpr5aB4U2MFY3N6fT1QrpAb6Xf68DN6ph7blY9GcXuLAQPrCa
	5p92VxL2e4ZFMxicfaz3Qogx0P5/sJiB4loMqS/m7l8YyMZEd6kj+DWGvL2kNX1w6O3nUYj3YY9
	MJnCTKfLwy1RV02QIC4FeF9yZHzOsSQEYRRBteg2XHV/dHwISyyArjAa2/aa9udCy+tYT+fIpRt
	BRx+CtSw9gGWxI8tbzaJKYv9oletalNmBdUhjA==
X-Received: by 2002:a17:902:d50a:b0:2e5:54b9:6b5c with SMTP id d9443c01a7336-2ea9c66bb6emr56564945ad.20.1793021867460;
        Mon, 26 Oct 2026 06:37:47 -0700 (PDT)
Received: from yafangs-Air ([240e:46d:2600:484d:51ee:4f49:b5a8:aabd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a5cf0sm17447055ad.52.2026.10.26.06.37.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 06:37:46 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: jpoimboe@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	song@kernel.org
Cc: live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v13 7/9] selftests/livepatch: Add provides/obsoletes test scenarios
Date: Mon, 26 Oct 2026 21:36:49 +0800
Message-ID: <20261026133651.40061-8-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261026133651.40061-1-laoar.shao@gmail.com>
References: <20261026133651.40061-1-laoar.shao@gmail.com>
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

Now that the legacy "replace" field has been replaced by the
provides/obsoletes mechanism, add test scenarios to verify the new
behavior.

The test modules gain provides/obsoletes module parameters, and
test-provides-obsoletes.sh covers the new replace semantics: provides=0
replacement, same-provides replacement, obsoletes-based replacement
and coexistence of different provides ids.

These tests are skipped on kernels that still support the legacy
"replace" attribute.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Acked-by: Miroslav Benes <mbenes@suse.cz>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 tools/testing/selftests/livepatch/Makefile         |   3 +-
 .../selftests/livepatch/test-provides-obsoletes.sh | 229 +++++++++++++++++++++
 .../test_modules/test_klp_callbacks_demo2.c        |  12 +-
 .../livepatch/test_modules/test_klp_cmdline_lp.c   |  11 +-
 .../livepatch/test_modules/test_klp_meminfo_lp.c   |  22 +-
 .../livepatch/test_modules/test_klp_state.c        |   5 +-
 .../livepatch/test_modules/test_klp_state2.c       |   5 +-
 7 files changed, 261 insertions(+), 26 deletions(-)
 create mode 100755 tools/testing/selftests/livepatch/test-provides-obsoletes.sh

diff --git a/tools/testing/selftests/livepatch/Makefile b/tools/testing/selftests/livepatch/Makefile
index a080eb5..38f9859 100644
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
index 0000000..78a644f
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
index 6c46ce5..9378947 100644
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
@@ -87,10 +86,7 @@ static void post_unpatch_callback(struct klp_object *obj)
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
index 88c6aed..8a93f00 100644
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
@@ -36,6 +42,9 @@ static int livepatch_cmdline_proc_show(struct seq_file *m, void *v)
 
 static int test_klp_cmdline_lp_init(void)
 {
+#ifdef CONFIG_KLP_HAS_PROVIDES
+	patch.provides = provides;
+#endif
 	return klp_enable_patch(&patch);
 }
 
diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_meminfo_lp.c b/tools/testing/selftests/livepatch/test_modules/test_klp_meminfo_lp.c
index 0c434a2..a3b4333 100644
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
@@ -51,10 +56,11 @@ static int livepatch_meminfo_proc_show(struct seq_file *m, void *v)
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
index 4d419a5..f53eead 100644
--- a/tools/testing/selftests/livepatch/test_modules/test_klp_state.c
+++ b/tools/testing/selftests/livepatch/test_modules/test_klp_state.c
@@ -143,10 +143,7 @@ static void post_unpatch_callback(struct klp_object *obj)
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
index 4f70f06..5f07fe1 100644
--- a/tools/testing/selftests/livepatch/test_modules/test_klp_state2.c
+++ b/tools/testing/selftests/livepatch/test_modules/test_klp_state2.c
@@ -172,10 +172,7 @@ static void post_unpatch_callback(struct klp_object *obj)
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
1.8.3.1

