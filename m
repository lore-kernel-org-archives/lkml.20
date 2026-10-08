Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D771A49482D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453574; cv=none; b=GNv/3QiDroBPrkqmrEyY4xeU0vC+J8awwd3bYWoQie+foMBwQbGs0iapQQibgTCA7muage16bi3VFjI1T+mwow0xbqgmetpo2d/oR37Wk9yL3go43EJD9ZS/T+lAlyjstVtImWnGaoMBh78/D/bLEkUBkGFNxDUrlnWwGvI8ZBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453574; c=relaxed/simple;
	bh=TTmm/JiwM7rex0JkiB1ropg5AYtieGpfIx6c4EeIo+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M1oLV5XPg9UyiT3Oly22ICeVG8qfC2geZl3HFVBE/pZp7A08Fqx5ehV0gyFXT7QSm+tK3NcSdRrGnY2Jfw/5NKTnxcKf48N5U9Gz6aIn7MbDQLjBfP5rlKeHPRuaQXlLMfdl9HjpjigZBk92FAI0GCMEVWuOgK5IBgeHjpMDteo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pEkKd59r; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pEkKd59r"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso2051465a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791453567; x=1792058367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OlPgHKy4wplHuzogabgKJQHpma7ybFczSL9aCnuSDNg=;
        b=pEkKd59rM8GwTAnqZaJ5nGoe2UHVfQlqK7144ULFlZwBbF4mSw3EzDPBikhz1hMhcr
         YSO6d3okudZ9UZQrX6e2/tokUvqniaI1dGTNAT5ldwIU+8nm099l5hwC2Wpo89XwdEVm
         Rtqu5+J2Dohtj3q4iLB5JrIFLdS0v/NKYMzlSUhM9jU+QVjezm+o/q3Jwmu1vgqXD9aD
         0selyD+aXtICmj9awErkNqLX4Xr2dvmPC46COyH5HRj8Yz6RGyISRiHMtXjntnxXqjnN
         HEA+EtO0XfKFmDkUqCa/yT3nt+RtA/8TPFvXdxKSGEPa0oc5Iy/HVkJB49vCRncYrugh
         Og9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791453567; x=1792058367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OlPgHKy4wplHuzogabgKJQHpma7ybFczSL9aCnuSDNg=;
        b=VDwEqtskXMrpyyIP2h63IhYDKq2SH8yE26skTlmHKVVyndcQmiUxCreYUFiQbgTFkM
         Rmy13th7sCX6EN3Cj5SWGa5eY9gCJgObkH8gaqCyzoOf4IX0g7knZzfrAPfnc7QNWQHx
         POhtokgX/2UHAUXNABFXIaeI0ehU+FQVrW+Kw8BVX2gCMJszooxszbRwPg2cJYeFRbVG
         CRQ2Sji0Vep6fE+iqQOoYCiM4/4vgj3uLHet1313pka93FjS2z+s9ByDpnw98cUj09g9
         QojtKRRToPpY3LCf6RRIKVCjOeVh3hu9Ng4ghInhkyOOvbz1V7oBq8qGSIB+9WUwg8hc
         hl8w==
X-Forwarded-Encrypted: i=1; AKwUvBywunb0upyWAWoX2WeWeNRTFPKK+kChUuKy2sWAoTYjBFk/9/gyMIumHBl10Kxl2Md21Ib7JlB05bfGlg4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlMb2UVWbyUsaNL8QWPqAQsbO6UZyAKDRLsPAFQHoaxIyQU9K5
	tD9/S+zGXuFnNIgCzKfDd09EiVnf+ZYK5agO/H4AKNFXBghRABQA4mq5
X-Gm-Gg: AYBFou1SwK2IMoBSm0ECZDuFk42ZExOyh2JvdGyRpCa4R6xhhJll6a3iWw1iuzaX6Yv
	1DXlFYXMmzseffkncafoO4TZNrVrCs6/LrWazlEvvNI9h5+Hv+TPxKXLIiizFbSNWRfG3VgCIZD
	73sPkcqgE2dk/6FZzrI4fdu1NBi8zShWVoeIHCHOcVTLv3nmqJ7gKbp/EoQMYIHBgX5uHXgjGqZ
	/hPQlqKU4Re4MndL5sogEX4vkdM3F7tkQFhVyWX/qNW+qfIcsI3Z7xQ28aiHBoJHJ57ggruq3eO
	bYPLa1PepyMqISFG3dvOBjr6bTh1YDiw0JO7oFKilBnN4quf5OB6PFo0GH+V7r0GtD7GXfEht4s
	AE6nUIsYnoRAU329XuFWR7jNJAZp8afDRLul3gGCq0iEF5zWX/mk0+fsfl3cqCWX5f53I+0nF9d
	m3u9Q/9U59PjwwVDyq+wA0BQDUrQKF7ym7ZCV1GJbGz0GRnC5GBrudRnlHW5gqRq2CKqaaYwTae
	yFX9W+Iq6kSkwz6XuKWMRmMVVD+7Cbk/aw0tZp0M0e+/PWFB4o7cKsERRWh4kfpWa0=
X-Received: by 2002:a17:90b:5102:b0:3ab:f38:2b3c with SMTP id 98e67ed59e1d1-3ab0f385291mr458671a91.28.1791453566932;
        Thu, 08 Oct 2026 02:59:26 -0700 (PDT)
Received: from yafangs-Air ([240e:46c:2100:3ace:b801:9432:769f:ff9d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff7ff13esm3422790a91.7.2026.10.08.02.59.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 02:59:26 -0700 (PDT)
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
Subject: [PATCH v11 9/9] selftests/livepatch: Add function test for provides/obsoletes
Date: Thu,  8 Oct 2026 17:58:30 +0800
Message-ID: <20261008095830.26308-10-laoar.shao@gmail.com>
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

Livepatches with different provides ids must not modify the same
function, unless they share the same provides id or the second
livepatch obsoletes the first one.

Add test scenarios that verify this rule on the combination of
patched functions and provides ids.

These tests are skipped on kernels that still support the legacy
"replace" attribute.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 .../livepatch/test-provides-obsoletes.sh      | 188 ++++++++++++++++++
 .../selftests/livepatch/test_modules/Makefile |   1 +
 .../test_modules/test_klp_meminfo_lp2.c       |   2 +
 3 files changed, 191 insertions(+)
 create mode 100644 tools/testing/selftests/livepatch/test_modules/test_klp_meminfo_lp2.c

diff --git a/tools/testing/selftests/livepatch/test-provides-obsoletes.sh b/tools/testing/selftests/livepatch/test-provides-obsoletes.sh
index b92188fcf45f..fce421a45fdb 100755
--- a/tools/testing/selftests/livepatch/test-provides-obsoletes.sh
+++ b/tools/testing/selftests/livepatch/test-provides-obsoletes.sh
@@ -5,6 +5,7 @@
 . $(dirname $0)/functions.sh
 
 MOD_MEMINFO=test_klp_meminfo_lp
+MOD_MEMINFO2=test_klp_meminfo_lp2
 MOD_CMDLINE=test_klp_cmdline_lp
 MOD_STATE=test_klp_state
 MOD_STATE2=test_klp_state2
@@ -465,4 +466,191 @@ $MOD_STATE: free_loglevel_state: freeing space for the stored console_loglevel
 livepatch: '$MOD_STATE': unpatching complete
 % rmmod $MOD_STATE"
 
+
+# - load two livepatches that modify the same function
+#   (meminfo_proc_show), both with provides=1. The second livepatch
+#   replaces the first one because of the same provides id, even
+#   though they share the patched function.
+# - verify that the first livepatch is gone from sysfs (replaced)
+#   and that the second one is enabled
+# - unload the replacing livepatch, then the replaced one
+
+start_test "same function, replaced by provides"
+
+load_lp $MOD_MEMINFO provides=1
+
+grep 'live patched' /proc/meminfo > /dev/kmsg
+
+load_lp $MOD_MEMINFO2 provides=1
+
+loop_until '[[ ! -e "$SYSFS_KLP_DIR/$MOD_MEMINFO" ]]' ||
+	die "failed to replace $MOD_MEMINFO"
+
+grep 'live patched' /proc/meminfo > /dev/kmsg
+
+check_sysfs_value "$MOD_MEMINFO2" "provides" "1"
+
+disable_lp $MOD_MEMINFO2
+unload_lp $MOD_MEMINFO2
+
+grep 'live patched' /proc/meminfo > /dev/kmsg
+
+unload_lp $MOD_MEMINFO
+
+check_result "% insmod test_modules/$MOD_MEMINFO.ko provides=1
+livepatch: enabling patch '$MOD_MEMINFO'
+livepatch: '$MOD_MEMINFO': initializing patching transition
+livepatch: '$MOD_MEMINFO': starting patching transition
+livepatch: '$MOD_MEMINFO': completing patching transition
+livepatch: '$MOD_MEMINFO': patching complete
+$MOD_MEMINFO: this has been live patched
+% insmod test_modules/$MOD_MEMINFO2.ko provides=1
+livepatch: enabling patch '$MOD_MEMINFO2'
+livepatch: '$MOD_MEMINFO2': initializing patching transition
+livepatch: '$MOD_MEMINFO2': starting patching transition
+livepatch: '$MOD_MEMINFO2': completing patching transition
+livepatch: '$MOD_MEMINFO2': patching complete
+$MOD_MEMINFO2: this has been live patched
+% echo 0 > $SYSFS_KLP_DIR/$MOD_MEMINFO2/enabled
+livepatch: '$MOD_MEMINFO2': initializing unpatching transition
+livepatch: '$MOD_MEMINFO2': starting unpatching transition
+livepatch: '$MOD_MEMINFO2': completing unpatching transition
+livepatch: '$MOD_MEMINFO2': unpatching complete
+% rmmod $MOD_MEMINFO2
+% rmmod $MOD_MEMINFO"
+
+
+# - load a livepatch that modifies meminfo_proc_show with provides=1,
+#   then try to load another livepatch that modifies the same
+#   function with a different provides id (provides=2).
+# - since the provides ids differ, the second livepatch would not
+#   replace the first one; the same function can not be handled by
+#   two different provides groups in parallel, so the load must fail.
+# - unload the first livepatch
+
+start_test "same function, can't be loaded in parallel"
+
+load_lp $MOD_MEMINFO provides=1
+load_failing_mod $MOD_MEMINFO2 provides=2
+
+disable_lp $MOD_MEMINFO
+unload_lp $MOD_MEMINFO
+
+check_result "% insmod test_modules/$MOD_MEMINFO.ko provides=1
+livepatch: enabling patch '$MOD_MEMINFO'
+livepatch: '$MOD_MEMINFO': initializing patching transition
+livepatch: '$MOD_MEMINFO': starting patching transition
+livepatch: '$MOD_MEMINFO': completing patching transition
+livepatch: '$MOD_MEMINFO': patching complete
+% insmod test_modules/$MOD_MEMINFO2.ko provides=2
+livepatch: Livepatch patch ($MOD_MEMINFO2) is not compatible with the already installed livepatches.
+insmod: ERROR: could not insert module test_modules/$MOD_MEMINFO2.ko: Invalid parameters
+% echo 0 > $SYSFS_KLP_DIR/$MOD_MEMINFO/enabled
+livepatch: '$MOD_MEMINFO': initializing unpatching transition
+livepatch: '$MOD_MEMINFO': starting unpatching transition
+livepatch: '$MOD_MEMINFO': completing unpatching transition
+livepatch: '$MOD_MEMINFO': unpatching complete
+% rmmod $MOD_MEMINFO"
+
+
+# - load a livepatch that modifies meminfo_proc_show with provides=1,
+#   then another livepatch with provides=1 that modifies a different
+#   function (cmdline_proc_show). The second one replaces the first
+#   one because of the same provides id.
+# - since the patched functions differ, the replacement does not need
+#   to restore the old function body; the transition only switches
+#   the ftrace nops, i.e. the atomic replace (nops) path.
+# - after the replacement /proc/meminfo is no longer patched, while
+#   /proc/cmdline is patched
+# - unload the replacing livepatch, then the replaced one
+
+start_test "different functions, atomic replace works (nops)"
+
+load_lp $MOD_MEMINFO provides=1
+
+grep 'live patched' /proc/meminfo > /dev/kmsg
+
+load_lp $MOD_CMDLINE provides=1
+
+grep 'live patched' /proc/meminfo > /dev/kmsg
+grep 'live patched' /proc/cmdline > /dev/kmsg
+
+disable_lp $MOD_CMDLINE
+unload_lp $MOD_CMDLINE
+unload_lp $MOD_MEMINFO
+
+check_result "% insmod test_modules/$MOD_MEMINFO.ko provides=1
+livepatch: enabling patch '$MOD_MEMINFO'
+livepatch: '$MOD_MEMINFO': initializing patching transition
+livepatch: '$MOD_MEMINFO': starting patching transition
+livepatch: '$MOD_MEMINFO': completing patching transition
+livepatch: '$MOD_MEMINFO': patching complete
+$MOD_MEMINFO: this has been live patched
+% insmod test_modules/$MOD_CMDLINE.ko provides=1
+livepatch: enabling patch '$MOD_CMDLINE'
+livepatch: '$MOD_CMDLINE': initializing patching transition
+livepatch: '$MOD_CMDLINE': starting patching transition
+livepatch: '$MOD_CMDLINE': completing patching transition
+livepatch: '$MOD_CMDLINE': patching complete
+$MOD_CMDLINE: this has been live patched
+% echo 0 > $SYSFS_KLP_DIR/$MOD_CMDLINE/enabled
+livepatch: '$MOD_CMDLINE': initializing unpatching transition
+livepatch: '$MOD_CMDLINE': starting unpatching transition
+livepatch: '$MOD_CMDLINE': completing unpatching transition
+livepatch: '$MOD_CMDLINE': unpatching complete
+% rmmod $MOD_CMDLINE
+% rmmod $MOD_MEMINFO"
+
+
+# - load two livepatches with different provides ids (1 and 2) that
+#   modify different functions (meminfo_proc_show and
+#   cmdline_proc_show). Neither of them replaces the other, so both
+#   livepatches must coexist.
+# - verify that both /proc/meminfo and /proc/cmdline are patched
+# - disable and unload both livepatches
+
+start_test "different functions, install in parallel"
+
+load_lp $MOD_MEMINFO provides=1
+
+grep 'live patched' /proc/meminfo > /dev/kmsg
+
+load_lp $MOD_CMDLINE provides=2
+
+grep 'live patched' /proc/meminfo > /dev/kmsg
+grep 'live patched' /proc/cmdline > /dev/kmsg
+
+disable_lp $MOD_MEMINFO
+unload_lp $MOD_MEMINFO
+disable_lp $MOD_CMDLINE
+unload_lp $MOD_CMDLINE
+
+check_result "% insmod test_modules/$MOD_MEMINFO.ko provides=1
+livepatch: enabling patch '$MOD_MEMINFO'
+livepatch: '$MOD_MEMINFO': initializing patching transition
+livepatch: '$MOD_MEMINFO': starting patching transition
+livepatch: '$MOD_MEMINFO': completing patching transition
+livepatch: '$MOD_MEMINFO': patching complete
+$MOD_MEMINFO: this has been live patched
+% insmod test_modules/$MOD_CMDLINE.ko provides=2
+livepatch: enabling patch '$MOD_CMDLINE'
+livepatch: '$MOD_CMDLINE': initializing patching transition
+livepatch: '$MOD_CMDLINE': starting patching transition
+livepatch: '$MOD_CMDLINE': completing patching transition
+livepatch: '$MOD_CMDLINE': patching complete
+$MOD_MEMINFO: this has been live patched
+$MOD_CMDLINE: this has been live patched
+% echo 0 > $SYSFS_KLP_DIR/$MOD_MEMINFO/enabled
+livepatch: '$MOD_MEMINFO': initializing unpatching transition
+livepatch: '$MOD_MEMINFO': starting unpatching transition
+livepatch: '$MOD_MEMINFO': completing unpatching transition
+livepatch: '$MOD_MEMINFO': unpatching complete
+% rmmod $MOD_MEMINFO
+% echo 0 > $SYSFS_KLP_DIR/$MOD_CMDLINE/enabled
+livepatch: '$MOD_CMDLINE': initializing unpatching transition
+livepatch: '$MOD_CMDLINE': starting unpatching transition
+livepatch: '$MOD_CMDLINE': completing unpatching transition
+livepatch: '$MOD_CMDLINE': unpatching complete
+% rmmod $MOD_CMDLINE"
+
 exit 0
diff --git a/tools/testing/selftests/livepatch/test_modules/Makefile b/tools/testing/selftests/livepatch/test_modules/Makefile
index 732e0003930b..0c17754997d2 100644
--- a/tools/testing/selftests/livepatch/test_modules/Makefile
+++ b/tools/testing/selftests/livepatch/test_modules/Makefile
@@ -2,6 +2,7 @@ TESTMODS_DIR := $(realpath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
 KDIR ?= /lib/modules/$(shell uname -r)/build
 
 obj-m += test_klp_meminfo_lp.o \
+	test_klp_meminfo_lp2.o \
 	test_klp_callbacks_busy.o \
 	test_klp_callbacks_demo.o \
 	test_klp_callbacks_demo2.o \
diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_meminfo_lp2.c b/tools/testing/selftests/livepatch/test_modules/test_klp_meminfo_lp2.c
new file mode 100644
index 000000000000..2b93c969b7ba
--- /dev/null
+++ b/tools/testing/selftests/livepatch/test_modules/test_klp_meminfo_lp2.c
@@ -0,0 +1,2 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "test_klp_meminfo_lp.c"
-- 
2.52.0

