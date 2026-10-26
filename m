Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021878;
	b=I2VlGZXVJ/0k25T1Mb163+jlSW2EcB96+sZ0auRsP3yI4D9kb8BzLvETPRlwxSJebgr/
	 1A+0fFS/EKPjUqhjeko1WOYYhGw4aOzLGJNg/60lNjNmQu6Hge23SWGtQga3b+eg4Bc4R
	 9AsCFdVW1udK/xAUaAofWV8SKedf7Oj72epUD7JrW9nC5X59SrLRPJSk/m1zQU87SEeeI
	 LPAs6ttPXd5w3q40iX5SoNVFGeJS4NBUg5y931DoiKxqvRYdTTuJu3JE9NcLXNL+FC6vu
	 93kxzriRd74Ww9/Hp9iHWs3EwIhXsyMwst26YR5lxgQlA2LHCN913Zn9b0Su3cfN9Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0NEUYZq26o4Xkjy3jaiogMRlNrImZbcxBkDaRpeXytw=;
	b=4yEIPjLJvWM9pnZ9Vhm+MXgvbUnx9ReLRVN+S/hRx2O+1y3siHe4dQmMU4MgWyH2kdbz
	 hfdrX0tEhXmlGkipvsKX0utBcprimFuOmazXg8zES4R0xmMLUvvKxWn0MTlJdMEEMaqqC
	 dwXh7zJBsqpHbnDrKs8++EmciM3JNS128d5YGBsi6GiwYMcaLiHEUX1mmvrmO5g9G9ihs
	 CP1lvk7YSkSB9Li2LKcdhEYWrSG6AKXF6GbuvBslYOO6wd3tYlUqWiwrxl6WgyS5PQ7lv
	 hknUOtzhos2/L7Xy0Q+pEjYbFJsjk8uZbXRJG51/Hv7DVgS7voSRWWhoZjhvK1xmyIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="hlxiVD/B";
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDDB60A3828
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EDDB60A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hlxiVD/B
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ea94541adbso8474405ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793021878; x=1793626678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0NEUYZq26o4Xkjy3jaiogMRlNrImZbcxBkDaRpeXytw=;
        b=hlxiVD/B6/JKW3MjIqHYGstUsZTjbSG5XQmzL/gzO7H6J2OYmnQ0FqRhrpt2PkUy75
         VpeKtbY94kJXetnQLZTwlopZBxUL4kOzIqxpTqWmniUKRfet2o1aYHfZefvzaPu7cHYd
         tO7AuSXRt6i8h5mEC1aFLEDqhZn/eKFiNVSnNy3a0X5b2v63S1a90LuLyeunMXAykrWy
         uzNyJb1uMlMRMsy6aKzZBLrbcDsfGVd1J0BsEEzNzAffKu3FWaIomtzqVz7NZLT5+Jum
         Dayj4PGVIzMXpiXWfGfB/WiEnbLww3SbBTd25WMb1f9IlUEdQn+fK07XgIAiBKvVQWDD
         Zymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021878; x=1793626678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0NEUYZq26o4Xkjy3jaiogMRlNrImZbcxBkDaRpeXytw=;
        b=D/enjmLP//5nDL4ZQpoHmjrqYW3ijgSIZsXFdxn5z/P/9bnLf6MeO1Q+ipj7fb2UNv
         2FTKz7itWMPg7EU/KRP85n/P4DzyyPNHVB83pFgoMcATBY3zD9boEL5+O0IRCh1/I5Kp
         SWD1JiVfCvbg3n9ul/a2BeDefhh4fKkvAC8+B22MzSNdWcEau0RE10FVdxNmnC3YaljF
         A0T9XH0MSjOvqAnJUUIsDJaROGXVBlNZE4T0ttpBuCvTJTL6mFV8H72UBhw4EMC+fOH9
         4MWOlbzy586KhOxpMNK3DtLMXoTsRyRqWNc3fajiC5iqzWEkt8Niyw+ar9zolSUVUqIw
         FP2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzzykWjqRDqaXk30My5sbG9V1NVRkUtaEVSZAj38CkN+l17BT7+oibmi/fzk+o6aXvSCTqlp4HN1bNE6Dw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGuzRjAA2al7oGFGACCJb1K2PPZxLAC1mZ58aNfsTxD1jC+fP+
	8YZXXXYTFOh/ib/jEX3ocMlHIBIsb5vBaqFd0Xte3K7qpnpheHeLeSFC
X-Gm-Gg: AYBFou29TZOLWIZU2yYFUhP0amMvm84Ff8AxwJtTWMaagKPOqj/klPHFgU8VNiKGgrB
	/0WDOwTRT6St1gPPjM4ph7p65hNg9BpAkEo9elME2LGVasqfDUvVZ3asr+l9MK7KFWmR0YoJ+Vg
	RB4TfwQi03ZWSwk9FMdWBdC5dFvkKLYyW00WnGkBELI4AqXyHkCdJUz2B25FkW3pt7QkM3FiKKw
	uv4miSRE4kmBpYJm5O8rJRfsDp0+x8PA8x8OySNCjbyfllHHtg6i2eJ2uKTGNmWngqCEYldnhn6
	Owbz7/6dZsXvB3P834EKZDWdIOpA/ERiAgSdaaRjmqxyVxuenz67astSOpLH1CkEfeS7LVCX1SG
	UDyHwd1OOv+vWMGf/+p+0kBUuwY5hzIaBaWhUI96KSgaH+JvSmen/9cjGH6j29WIPhs9oiTQk8N
	/kmd/hbetWM95D1/S9eQoBjwPVjiPkquBD8BgQt3TyKuvJaJ08+n16W+v6726qQTR38vIuimNv/
	yLvmElrwDgancdDdH3PeEkcnzbOO10ABMEaFGac83aUrYBJ8WqPza6pzI+21lVr85Ow1pMMTl39
	2aaMNdvdHcH7FgnN62SMDlUAgTOOt0SBy3vTzw==
X-Received: by 2002:a17:903:26c4:b0:2e2:d09f:d770 with SMTP id d9443c01a7336-2ea9c7fe3bbmr62581695ad.26.1793021873016;
        Mon, 26 Oct 2026 06:37:53 -0700 (PDT)
Received: from yafangs-Air ([240e:46d:2600:484d:51ee:4f49:b5a8:aabd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a5cf0sm17447055ad.52.2026.10.26.06.37.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 06:37:52 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: jpoimboe@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	song@kernel.org
Cc: live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v13 8/9] selftests/livepatch: Add state test for provides/obsoletes
Date: Mon, 26 Oct 2026 21:36:50 +0800
Message-ID: <20261026133651.40061-9-laoar.shao@gmail.com>
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

Livepatches with different provides ids must not share the same state
id, unless the second livepatch replaces the first one via obsoletes.

Add provides/obsoletes module parameters to test_klp_state and
test_klp_state2, and cover both cases: reusing a state id across
different provides ids is rejected, while it is allowed when the new
livepatch obsoletes the old one.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>
---
 .../selftests/livepatch/test-provides-obsoletes.sh | 239 +++++++++++++++++++++
 .../livepatch/test_modules/test_klp_state.c        |  34 ++-
 .../livepatch/test_modules/test_klp_state2.c       |  42 +++-
 3 files changed, 299 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/livepatch/test-provides-obsoletes.sh b/tools/testing/selftests/livepatch/test-provides-obsoletes.sh
index 78a644f..b92188f 100755
--- a/tools/testing/selftests/livepatch/test-provides-obsoletes.sh
+++ b/tools/testing/selftests/livepatch/test-provides-obsoletes.sh
@@ -6,6 +6,8 @@
 
 MOD_MEMINFO=test_klp_meminfo_lp
 MOD_CMDLINE=test_klp_cmdline_lp
+MOD_STATE=test_klp_state
+MOD_STATE2=test_klp_state2
 
 setup_config
 detect_provides_attr
@@ -226,4 +228,241 @@ livepatch: '$MOD_MEMINFO': completing unpatching transition
 livepatch: '$MOD_MEMINFO': unpatching complete
 % rmmod $MOD_MEMINFO"
 
+
+# - load a livepatch with provides=1 that registers state ID 1
+# - try to load another livepatch with provides=1 that reuses the same
+#   state ID. The second one will replace the first one.
+# - disable and unload the remaining livepatch
+
+start_test "same state, same provides"
+
+load_lp $MOD_STATE state=1 provides=1
+load_lp $MOD_STATE2 state=1 provides=1
+
+disable_lp $MOD_STATE2
+unload_lp $MOD_STATE2
+unload_lp $MOD_STATE
+
+check_result "% insmod test_modules/$MOD_STATE.ko state=1 provides=1
+livepatch: enabling patch '$MOD_STATE'
+livepatch: '$MOD_STATE': initializing patching transition
+$MOD_STATE: pre_patch_callback: vmlinux
+$MOD_STATE: allocate_loglevel_state: allocating space to store console_loglevel
+livepatch: '$MOD_STATE': starting patching transition
+livepatch: '$MOD_STATE': completing patching transition
+$MOD_STATE: post_patch_callback: vmlinux
+$MOD_STATE: fix_console_loglevel: fixing console_loglevel
+livepatch: '$MOD_STATE': patching complete
+% insmod test_modules/$MOD_STATE2.ko state=1 provides=1
+livepatch: enabling patch '$MOD_STATE2'
+livepatch: '$MOD_STATE2': initializing patching transition
+$MOD_STATE2: pre_patch_callback: vmlinux
+$MOD_STATE2: allocate_loglevel_state: space to store console_loglevel already allocated
+livepatch: '$MOD_STATE2': starting patching transition
+livepatch: '$MOD_STATE2': completing patching transition
+$MOD_STATE2: post_patch_callback: vmlinux
+$MOD_STATE2: fix_console_loglevel: taking over the console_loglevel change
+livepatch: '$MOD_STATE2': patching complete
+% echo 0 > $SYSFS_KLP_DIR/$MOD_STATE2/enabled
+livepatch: '$MOD_STATE2': initializing unpatching transition
+$MOD_STATE2: pre_unpatch_callback: vmlinux
+$MOD_STATE2: restore_console_loglevel: restoring console_loglevel
+livepatch: '$MOD_STATE2': starting unpatching transition
+livepatch: '$MOD_STATE2': completing unpatching transition
+$MOD_STATE2: post_unpatch_callback: vmlinux
+$MOD_STATE2: free_loglevel_state: freeing space for the stored console_loglevel
+livepatch: '$MOD_STATE2': unpatching complete
+% rmmod $MOD_STATE2
+% rmmod $MOD_STATE"
+
+
+# - load a livepatch with provides=1 that registers state ID 1
+# - try to load another livepatch with provides=2 that reuses the same
+#   state ID. The second one must be rejected because livepatches with
+#   different provides ids must not share the same state id.
+# - disable and unload the remaining livepatch
+
+start_test "same state, misc provides"
+
+load_lp $MOD_STATE state=1 provides=1
+load_failing_mod $MOD_STATE2 state=1 provides=2
+
+disable_lp $MOD_STATE
+unload_lp $MOD_STATE
+
+check_result "% insmod test_modules/$MOD_STATE.ko state=1 provides=1
+livepatch: enabling patch '$MOD_STATE'
+livepatch: '$MOD_STATE': initializing patching transition
+$MOD_STATE: pre_patch_callback: vmlinux
+$MOD_STATE: allocate_loglevel_state: allocating space to store console_loglevel
+livepatch: '$MOD_STATE': starting patching transition
+livepatch: '$MOD_STATE': completing patching transition
+$MOD_STATE: post_patch_callback: vmlinux
+$MOD_STATE: fix_console_loglevel: fixing console_loglevel
+livepatch: '$MOD_STATE': patching complete
+% insmod test_modules/$MOD_STATE2.ko state=1 provides=2
+livepatch: Livepatch patch ($MOD_STATE2) is not compatible with the already installed livepatches.
+insmod: ERROR: could not insert module test_modules/$MOD_STATE2.ko: Invalid parameters
+% echo 0 > $SYSFS_KLP_DIR/$MOD_STATE/enabled
+livepatch: '$MOD_STATE': initializing unpatching transition
+$MOD_STATE: pre_unpatch_callback: vmlinux
+$MOD_STATE: restore_console_loglevel: restoring console_loglevel
+livepatch: '$MOD_STATE': starting unpatching transition
+livepatch: '$MOD_STATE': completing unpatching transition
+$MOD_STATE: post_unpatch_callback: vmlinux
+$MOD_STATE: free_loglevel_state: freeing space for the stored console_loglevel
+livepatch: '$MOD_STATE': unpatching complete
+% rmmod $MOD_STATE"
+
+
+# Take over system state change by a patch that obsoletes the old one.
+# Although the provides IDs are different, the second patch's obsoletes
+# list includes the first patch's provides ID, so it can replace the
+# first patch and reuse the same state ID.
+
+start_test "same states, replaced by obsoletes"
+
+load_lp $MOD_STATE state=1 provides=1
+load_lp $MOD_STATE2 state=1 provides=2 obsoletes=1
+unload_lp $MOD_STATE
+disable_lp $MOD_STATE2
+unload_lp $MOD_STATE2
+
+check_result "% insmod test_modules/$MOD_STATE.ko state=1 provides=1
+livepatch: enabling patch '$MOD_STATE'
+livepatch: '$MOD_STATE': initializing patching transition
+$MOD_STATE: pre_patch_callback: vmlinux
+$MOD_STATE: allocate_loglevel_state: allocating space to store console_loglevel
+livepatch: '$MOD_STATE': starting patching transition
+livepatch: '$MOD_STATE': completing patching transition
+$MOD_STATE: post_patch_callback: vmlinux
+$MOD_STATE: fix_console_loglevel: fixing console_loglevel
+livepatch: '$MOD_STATE': patching complete
+% insmod test_modules/$MOD_STATE2.ko state=1 provides=2 obsoletes=1
+livepatch: enabling patch '$MOD_STATE2'
+livepatch: '$MOD_STATE2': initializing patching transition
+$MOD_STATE2: pre_patch_callback: vmlinux
+$MOD_STATE2: allocate_loglevel_state: space to store console_loglevel already allocated
+livepatch: '$MOD_STATE2': starting patching transition
+livepatch: '$MOD_STATE2': completing patching transition
+$MOD_STATE2: post_patch_callback: vmlinux
+$MOD_STATE2: fix_console_loglevel: taking over the console_loglevel change
+livepatch: '$MOD_STATE2': patching complete
+% rmmod $MOD_STATE
+% echo 0 > $SYSFS_KLP_DIR/$MOD_STATE2/enabled
+livepatch: '$MOD_STATE2': initializing unpatching transition
+$MOD_STATE2: pre_unpatch_callback: vmlinux
+$MOD_STATE2: restore_console_loglevel: restoring console_loglevel
+livepatch: '$MOD_STATE2': starting unpatching transition
+livepatch: '$MOD_STATE2': completing unpatching transition
+$MOD_STATE2: post_unpatch_callback: vmlinux
+$MOD_STATE2: free_loglevel_state: freeing space for the stored console_loglevel
+livepatch: '$MOD_STATE2': unpatching complete
+% rmmod $MOD_STATE2"
+
+
+# - load a livepatch that modifies system state (state=1) with
+#   provides=1, then another livepatch with the same provides id=1 that declares
+#   a different system state (state=2)
+# - the second livepatch would replace the first one due to the same
+#   provides id, but it does not handle the system state modified by
+#   the first one, therefore it is rejected as incompatible and the
+#   insmod must fail.
+# - verify the first livepatch is still alive, then disable and
+#   unload it.
+
+start_test "misc states, same provides"
+load_lp $MOD_STATE state=1 provides=1
+load_failing_mod $MOD_STATE2 state=2 provides=1
+
+disable_lp $MOD_STATE
+unload_lp $MOD_STATE
+
+check_result "% insmod test_modules/$MOD_STATE.ko state=1 provides=1
+livepatch: enabling patch '$MOD_STATE'
+livepatch: '$MOD_STATE': initializing patching transition
+$MOD_STATE: pre_patch_callback: vmlinux
+$MOD_STATE: allocate_loglevel_state: allocating space to store console_loglevel
+livepatch: '$MOD_STATE': starting patching transition
+livepatch: '$MOD_STATE': completing patching transition
+$MOD_STATE: post_patch_callback: vmlinux
+$MOD_STATE: fix_console_loglevel: fixing console_loglevel
+livepatch: '$MOD_STATE': patching complete
+% insmod test_modules/$MOD_STATE2.ko state=2 provides=1
+livepatch: Livepatch patch ($MOD_STATE2) is not compatible with the already installed livepatches.
+insmod: ERROR: could not insert module test_modules/$MOD_STATE2.ko: Invalid parameters
+% echo 0 > $SYSFS_KLP_DIR/$MOD_STATE/enabled
+livepatch: '$MOD_STATE': initializing unpatching transition
+$MOD_STATE: pre_unpatch_callback: vmlinux
+$MOD_STATE: restore_console_loglevel: restoring console_loglevel
+livepatch: '$MOD_STATE': starting unpatching transition
+livepatch: '$MOD_STATE': completing unpatching transition
+$MOD_STATE: post_unpatch_callback: vmlinux
+$MOD_STATE: free_loglevel_state: freeing space for the stored console_loglevel
+livepatch: '$MOD_STATE': unpatching complete
+% rmmod $MOD_STATE"
+
+
+# - load two livepatches with different provides ids (provides=1 and
+#   provides=2) that modify different system states (state=1 and
+#   state=2). Neither of them replaces the other, because their
+#   provides ids differ (and the obsoletes lists are empty), so they
+#   can coexist.
+# - verify the provides sysfs value of both livepatches
+# - disable and unload both livepatches
+
+start_test "misc states, misc provides"
+
+load_lp $MOD_STATE state=1 provides=1
+load_lp $MOD_STATE2 state=2 provides=2
+
+check_sysfs_value "$MOD_STATE" "provides" "1"
+check_sysfs_value "$MOD_STATE2" "provides" "2"
+
+disable_lp $MOD_STATE2
+unload_lp $MOD_STATE2
+disable_lp $MOD_STATE
+unload_lp $MOD_STATE
+
+check_result "% insmod test_modules/$MOD_STATE.ko state=1 provides=1
+livepatch: enabling patch '$MOD_STATE'
+livepatch: '$MOD_STATE': initializing patching transition
+$MOD_STATE: pre_patch_callback: vmlinux
+$MOD_STATE: allocate_loglevel_state: allocating space to store console_loglevel
+livepatch: '$MOD_STATE': starting patching transition
+livepatch: '$MOD_STATE': completing patching transition
+$MOD_STATE: post_patch_callback: vmlinux
+$MOD_STATE: fix_console_loglevel: fixing console_loglevel
+livepatch: '$MOD_STATE': patching complete
+% insmod test_modules/$MOD_STATE2.ko state=2 provides=2
+livepatch: enabling patch '$MOD_STATE2'
+livepatch: '$MOD_STATE2': initializing patching transition
+$MOD_STATE2: pre_patch_callback: vmlinux
+$MOD_STATE2: allocate_loglevel_state: allocating space to store console_loglevel
+livepatch: '$MOD_STATE2': starting patching transition
+livepatch: '$MOD_STATE2': completing patching transition
+$MOD_STATE2: post_patch_callback: vmlinux
+$MOD_STATE2: fix_console_loglevel: fixing console_loglevel
+livepatch: '$MOD_STATE2': patching complete
+% echo 0 > $SYSFS_KLP_DIR/$MOD_STATE2/enabled
+livepatch: '$MOD_STATE2': initializing unpatching transition
+$MOD_STATE2: pre_unpatch_callback: vmlinux
+$MOD_STATE2: restore_console_loglevel: restoring console_loglevel
+livepatch: '$MOD_STATE2': starting unpatching transition
+livepatch: '$MOD_STATE2': completing unpatching transition
+$MOD_STATE2: post_unpatch_callback: vmlinux
+$MOD_STATE2: free_loglevel_state: freeing space for the stored console_loglevel
+livepatch: '$MOD_STATE2': unpatching complete
+% rmmod $MOD_STATE2
+% echo 0 > $SYSFS_KLP_DIR/$MOD_STATE/enabled
+livepatch: '$MOD_STATE': initializing unpatching transition
+$MOD_STATE: pre_unpatch_callback: vmlinux
+$MOD_STATE: restore_console_loglevel: restoring console_loglevel
+livepatch: '$MOD_STATE': starting unpatching transition
+livepatch: '$MOD_STATE': completing unpatching transition
+$MOD_STATE: post_unpatch_callback: vmlinux
+$MOD_STATE: free_loglevel_state: freeing space for the stored console_loglevel
+livepatch: '$MOD_STATE': unpatching complete
+% rmmod $MOD_STATE"
+
 exit 0
diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_state.c b/tools/testing/selftests/livepatch/test_modules/test_klp_state.c
index f53eead..16b3dfa 100644
--- a/tools/testing/selftests/livepatch/test_modules/test_klp_state.c
+++ b/tools/testing/selftests/livepatch/test_modules/test_klp_state.c
@@ -9,10 +9,25 @@
 #include <linux/printk.h>
 #include <linux/livepatch.h>
 
-#define CONSOLE_LOGLEVEL_STATE 1
 /* Version 1 does not support migration. */
 #define CONSOLE_LOGLEVEL_STATE_VERSION 1
 
+static unsigned int state = 1;
+module_param(state, uint, 0444);
+MODULE_PARM_DESC(state, "console loglevel state (default=1)");
+
+#ifdef CONFIG_KLP_HAS_PROVIDES
+static unsigned int provides;
+module_param(provides, uint, 0444);
+MODULE_PARM_DESC(provides, "provides id (default=0)");
+
+#define KLP_MAX_OBSOLETES 16
+static unsigned int obsoletes[KLP_MAX_OBSOLETES];
+static int nr_obsoletes;
+module_param_array(obsoletes, uint, &nr_obsoletes, 0444);
+MODULE_PARM_DESC(obsoletes, "obsoletes provides ids");
+#endif
+
 static const char *const module_state[] = {
 	[MODULE_STATE_LIVE]	= "[MODULE_STATE_LIVE] Normal state",
 	[MODULE_STATE_COMING]	= "[MODULE_STATE_COMING] Full formed, running module_init",
@@ -35,7 +50,7 @@ static int allocate_loglevel_state(void)
 {
 	struct klp_state *loglevel_state;
 
-	loglevel_state = klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
+	loglevel_state = klp_get_state(&patch, state);
 	if (!loglevel_state)
 		return -EINVAL;
 
@@ -52,7 +67,7 @@ static void fix_console_loglevel(void)
 {
 	struct klp_state *loglevel_state;
 
-	loglevel_state = klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
+	loglevel_state = klp_get_state(&patch, state);
 	if (!loglevel_state)
 		return;
 
@@ -65,7 +80,7 @@ static void restore_console_loglevel(void)
 {
 	struct klp_state *loglevel_state;
 
-	loglevel_state = klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
+	loglevel_state = klp_get_state(&patch, state);
 	if (!loglevel_state)
 		return;
 
@@ -77,7 +92,7 @@ static void free_loglevel_state(void)
 {
 	struct klp_state *loglevel_state;
 
-	loglevel_state = klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
+	loglevel_state = klp_get_state(&patch, state);
 	if (!loglevel_state)
 		return;
 
@@ -133,7 +148,6 @@ static void post_unpatch_callback(struct klp_object *obj)
 
 static struct klp_state states[] = {
 	{
-		.id = CONSOLE_LOGLEVEL_STATE,
 		.version = CONSOLE_LOGLEVEL_STATE_VERSION,
 	}, { }
 };
@@ -151,6 +165,14 @@ static void post_unpatch_callback(struct klp_object *obj)
 
 static int test_klp_callbacks_demo_init(void)
 {
+#ifdef CONFIG_KLP_HAS_PROVIDES
+	patch.provides = provides;
+	if (nr_obsoletes > 0) {
+		patch.obsoletes = obsoletes;
+		patch.nr_obsoletes = nr_obsoletes;
+	}
+#endif
+	states[0].id = state;
 	return klp_enable_patch(&patch);
 }
 
diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_state2.c b/tools/testing/selftests/livepatch/test_modules/test_klp_state2.c
index 5f07fe1..b9772a3 100644
--- a/tools/testing/selftests/livepatch/test_modules/test_klp_state2.c
+++ b/tools/testing/selftests/livepatch/test_modules/test_klp_state2.c
@@ -9,10 +9,25 @@
 #include <linux/printk.h>
 #include <linux/livepatch.h>
 
-#define CONSOLE_LOGLEVEL_STATE 1
 /* Version 2 supports migration. */
 #define CONSOLE_LOGLEVEL_STATE_VERSION 2
 
+static unsigned int state = 1;
+module_param(state, uint, 0444);
+MODULE_PARM_DESC(state, "console loglevel state (default=1)");
+
+#ifdef CONFIG_KLP_HAS_PROVIDES
+static unsigned int provides;
+module_param(provides, uint, 0444);
+MODULE_PARM_DESC(provides, "provides id (default=0)");
+
+#define KLP_MAX_OBSOLETES 16
+static unsigned int obsoletes[KLP_MAX_OBSOLETES];
+static int nr_obsoletes;
+module_param_array(obsoletes, uint, &nr_obsoletes, 0444);
+MODULE_PARM_DESC(obsoletes, "obsoletes provides ids");
+#endif
+
 static const char *const module_state[] = {
 	[MODULE_STATE_LIVE]	= "[MODULE_STATE_LIVE] Normal state",
 	[MODULE_STATE_COMING]	= "[MODULE_STATE_COMING] Full formed, running module_init",
@@ -35,14 +50,14 @@ static int allocate_loglevel_state(void)
 {
 	struct klp_state *loglevel_state, *prev_loglevel_state;
 
-	prev_loglevel_state = klp_get_prev_state(CONSOLE_LOGLEVEL_STATE);
+	prev_loglevel_state = klp_get_prev_state(state);
 	if (prev_loglevel_state) {
 		pr_info("%s: space to store console_loglevel already allocated\n",
 		__func__);
 		return 0;
 	}
 
-	loglevel_state = klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
+	loglevel_state = klp_get_state(&patch, state);
 	if (!loglevel_state)
 		return -EINVAL;
 
@@ -59,11 +74,11 @@ static void fix_console_loglevel(void)
 {
 	struct klp_state *loglevel_state, *prev_loglevel_state;
 
-	loglevel_state = klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
+	loglevel_state = klp_get_state(&patch, state);
 	if (!loglevel_state)
 		return;
 
-	prev_loglevel_state = klp_get_prev_state(CONSOLE_LOGLEVEL_STATE);
+	prev_loglevel_state = klp_get_prev_state(state);
 	if (prev_loglevel_state) {
 		pr_info("%s: taking over the console_loglevel change\n",
 		__func__);
@@ -80,14 +95,14 @@ static void restore_console_loglevel(void)
 {
 	struct klp_state *loglevel_state, *prev_loglevel_state;
 
-	prev_loglevel_state = klp_get_prev_state(CONSOLE_LOGLEVEL_STATE);
+	prev_loglevel_state = klp_get_prev_state(state);
 	if (prev_loglevel_state) {
 		pr_info("%s: passing the console_loglevel change back to the old livepatch\n",
 		__func__);
 		return;
 	}
 
-	loglevel_state = klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
+	loglevel_state = klp_get_state(&patch, state);
 	if (!loglevel_state)
 		return;
 
@@ -99,14 +114,14 @@ static void free_loglevel_state(void)
 {
 	struct klp_state *loglevel_state, *prev_loglevel_state;
 
-	prev_loglevel_state = klp_get_prev_state(CONSOLE_LOGLEVEL_STATE);
+	prev_loglevel_state = klp_get_prev_state(state);
 	if (prev_loglevel_state) {
 		pr_info("%s: keeping space to store console_loglevel\n",
 		__func__);
 		return;
 	}
 
-	loglevel_state = klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
+	loglevel_state = klp_get_state(&patch, state);
 	if (!loglevel_state)
 		return;
 
@@ -162,7 +177,6 @@ static void post_unpatch_callback(struct klp_object *obj)
 
 static struct klp_state states[] = {
 	{
-		.id = CONSOLE_LOGLEVEL_STATE,
 		.version = CONSOLE_LOGLEVEL_STATE_VERSION,
 	}, { }
 };
@@ -180,6 +194,14 @@ static void post_unpatch_callback(struct klp_object *obj)
 
 static int test_klp_callbacks_demo_init(void)
 {
+#ifdef CONFIG_KLP_HAS_PROVIDES
+	patch.provides = provides;
+	if (nr_obsoletes > 0) {
+		patch.obsoletes = obsoletes;
+		patch.nr_obsoletes = nr_obsoletes;
+	}
+#endif
+	states[0].id = state;
 	return klp_enable_patch(&patch);
 }
 
-- 
1.8.3.1

