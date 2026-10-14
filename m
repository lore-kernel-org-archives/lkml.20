Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBAE23E334
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975162; cv=none; b=V+RVrc2BIdsx29ETPMbATkWUn7hy54ZwSegJ3QdD3azH7A7vhSq2XIThyb0uavDBygjYKuuDF5ww7jh2S73lvkMB9tvHS8X2NfB1Qil4jdgewGvn5ybnzFNGsdvoNU08GdYOmRHDlR7u/3eJhgzuDaBMfem2h9IdV1Dx3e6VAr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975162; c=relaxed/simple;
	bh=Q49PMsqd51XUOD7a7jlVyldBpg0SF5Qg9KRWNxz3k6g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=g1Erg6NALDHgfrYoyqDjcN079rC1SrwId03sHTevbNTQd+1Xxc0mujXrC4XKhUe5Ny1HzWrPYxmiC/T/fr1wGApPkV4KHv4UAvcELtHXt5faLiF6bE4AXm3TxGZ9669iGd1ub18iuv9Nn/YN+3G0Ffa28aM/5tVFdNvZmCSCdq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qWEbIYgv; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qWEbIYgv"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ab4178ee33so2174161a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791975160; x=1792579960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wig2LP7DxnylQhC+34c7Wl9fLrwtCXMPXx2vMZ2qsyA=;
        b=qWEbIYgvK65gYIM50qhZS4144R6VHYWG7k1wwWx0Ju4Mf+wyC4RcxC3aYYy53a7Jhw
         yaoGvdm1YZ/C1geGmLkKO84tg4XjZnKEqa21hTfrprH14u0LqT74bo3SB0dleN395bYP
         d2EwcCdKIw3yPHU0D4T4KKUybD1mchJ17a3Mzcs+iX6qvhgckrTV9SI7bwXJWo8voLgH
         RWpT5sFiY+yEjcpVo+9oAeSVptzPkJNw3IAUVk8VCZkD6ProuWmRKJcB7LG5YSotBHql
         k8dD5QJ+Z7i3oxKgfiS4zDTmdIWSIBlT20kMbzHPqTgiwUzZ9jg6X9ONdVK/Eo9Ks50h
         E2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975160; x=1792579960;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wig2LP7DxnylQhC+34c7Wl9fLrwtCXMPXx2vMZ2qsyA=;
        b=TBkZetMJohYCokfDF2C8wed+zi+wApa3aiJvO3UbpVEwq72IWk6NplL/Q2fZVoyvpr
         j2G+7jo7i9mdJHOxFoi3yusvGeMUOLUqaO2Idx52j+pGisLlkBMGNQl//b6qQF7uXpM/
         idG/0e+4UzRPn41ele4t4BPfP470sf3A1RUUrwZo2rbq8A1Lylon7GpCOlUw7wBiJ5kM
         M4ABtEDrFLbFSO9OWkPh2txYmh+c5m2/AfNuF8Q3yH//KwBqS763F5bzvKTw4gXS7CHn
         tVJgfgz0QhMtScKsRaraH5igevAk0oeArZWmywPeYRaPVjii39ahpZTDSBKHnYSIliJR
         R1hw==
X-Forwarded-Encrypted: i=1; AKwUvBzvrm0vgKbB1U4hXvScZJ63VHXhnx2NeSB3eUZPCCv8Enl9mTUL0IYMf1G39PnvAa4TDpE1o3/87F68nZU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLn3fm0w76L1zyWw8aglT//uRWRy+D+yqIuJ3duTGLVoC86E1z
	qRayYY8iVokTL++dite/l9ZRLXijkboTqVjXkuFj9ULWwHBq3x2j7FjB
X-Gm-Gg: AYBFou1DUxa2ptGX0MLzkOZhrFDEsYgNSPbGkS1A6G1gsouhFGdPRwUcjnrCz8xUqik
	E9TlunyhSX/cwIdhYkK3issTLZtrvvWUte9ctp+L/qVZJPBvXGzGGA6A+PQ43uPvpdznjyQJR48
	DoefMwEUGxGWEqa/GHysqijuG/DHkFgHW2qs1FyTYy2/x89yDAcLaaBrYFzxiIAWJommNuTK+kq
	gB+dWmBaumfcaABxsPXC/MetY8Mxu7r7HeeAv+abeK/hQfG/qATu6OItwhnLv48KNddgJPcs4vb
	4Q9XMtHTgU3fI99L+KGti7niM6N5Hj18VH+NpSqM7GtWB4qp9BsdcIp8ep+MNqkz47pnQt017o9
	EC0qBFe9b7DQQMwIUfiFIBSXu3k8WE9gDuogkJM/vAurDZH4if6Z1GL8mYPaRL9m25QuuQaGMv1
	QBcO0RZCb6Zs6yoCIBkiP4JohKWY9ivn1BpbuOSnj6bKK8uHwhGXbdckwaQj5dqGQ26Q==
X-Received: by 2002:a17:90a:e7ca:b0:3a7:ef4:164b with SMTP id 98e67ed59e1d1-3ab3a3593famr12775256a91.2.1791975159622;
        Wed, 14 Oct 2026 03:52:39 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd61fc465c3sm1680472a12.27.2026.10.14.03.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:52:39 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	cassiogabrielcontato@gmail.com,
	kees@kernel.org,
	phucduc.bui@gmail.com,
	cezary.rojewski@intel.com,
	zzzccc427@gmail.com,
	yilinzhang@moonshot.ai
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	tiwai@suse.de
Subject: [PATCH v2] ALSA: pcm: Serialize and check HW_REFINE ioctls
Date: Wed, 14 Oct 2026 18:52:33 +0800
Message-Id: <pm-pmb-b3f7b3445bb11aaa9a7b-v3-371faafc2599ec7fa136@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hardware refinement must reject disconnected streams before entering
their runtime constraint rules. The native ioctl checks the state at
the outer dispatch, before copying the parameters, while the compat
HW_REFINE32 path only checks that the runtime exists. Both call the
unlocked refinement helper without the buffer access lock used by
HW_PARAMS.

The BUFFER_BYTES rule keeps a substream pointer as its private payload.
A compat request can still enter that rule after component disconnect.
If component free overlaps its execution, the following order permits
a use-after-free read of buffer_bytes_max:

  Component cleanup                 Compat HW_REFINE
  -----------------                 ----------------
  snd_pcm_dev_disconnect()
    Runtime -> DISCONNECTED
                                    Enter compat ioctl
                                    snd_pcm_hw_refine()
                                      Enter BUFFER_BYTES rule
  snd_device_free()
    snd_pcm_free_stream()
      Free substream
                                      Read buffer_bytes_max

Add a wrapper that acquires the existing buffer access lock and checks
the same allowed states and mmap conditions as HW_PARAMS before running
the refinement rules. Share the state checker with snd_pcm_hw_params()
and use the wrapper for native, compat and legacy PCM HW_REFINE ioctls.
This rejects the described entry after disconnect and serializes these
refinement calls with other buffer-locked parameter operations.

Keep the original snd_pcm_hw_refine() helper for existing internal
callers, including snd_pcm_hw_params() which already holds the buffer
lock, to avoid locking that mutex recursively.

KASAN report as below:

    BUG: KASAN: slab-use-after-free in snd_pcm_hw_rule_buffer_bytes_max+0x276/0x2a0
    Read of size 8 at addr ffff888111b36870 by task pmbd_alsa_reade/486

    CPU: 2 UID: 0 PID: 486 Comm: pmbd_alsa_reade Tainted: G           O        7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
    Tainted: [O]=OOT_MODULE
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     ? snd_pcm_hw_rule_buffer_bytes_max+0x276/0x2a0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __virt_addr_valid+0x20d/0x410
     ? snd_pcm_hw_rule_buffer_bytes_max+0x276/0x2a0
     kasan_report+0xe0/0x110
     ? snd_pcm_hw_rule_buffer_bytes_max+0x276/0x2a0
     snd_pcm_hw_rule_buffer_bytes_max+0x276/0x2a0
     ? snd_pcm_hw_rule_div+0x16b/0x200
     ? __pfx_snd_pcm_hw_rule_buffer_bytes_max+0x10/0x10
     ? constrain_params_by_rules+0x17a/0xfe0
     constrain_params_by_rules+0x506/0xfe0
     ? __pfx_constrain_params_by_rules+0x10/0x10
     ? __ia32_compat_sys_ioctl+0x289/0x2f0
     ? do_int80_emulation+0x14a/0x5e0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lock_release+0xc8/0x280
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? snd_interval_refine+0x284/0x470
     snd_pcm_hw_refine+0x768/0xcc0
     ? __pfx_snd_pcm_hw_refine+0x10/0x10
     ? _copy_from_user+0x51/0xa0
     snd_pcm_ioctl_hw_params_compat+0x138/0x280
     snd_pcm_ioctl_compat+0x4c5/0x7c0
     ? __pfx_snd_pcm_ioctl_compat+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? selinux_file_ioctl+0xaa/0x280
     ? ksys_write+0x16b/0x200
     ? __pfx_snd_pcm_ioctl_compat+0x10/0x10
     __ia32_compat_sys_ioctl+0x289/0x2f0
     ? srso_alias_return_thunk+0x5/0xfbef5
     do_int80_emulation+0x14a/0x5e0
     asm_int80_emulation+0x1a/0x20
    RIP: 0023:0x8049084
    Code: 80 b8 04 00 00 00 bb 01 00 00 00 b9 43 a0 04 08 ba 2b 00 00 00 cd 80 b8 36 00 00 00 89 f3 b9 10 41 5c c2 ba b8 b0 04 08 cd 80 <85> c0 78 6c b8 04 00 00 00 bb 01 00 00 00 b9 27 a0 04 08 ba 1c 00
    RSP: 002b:00000000ffd35e40 EFLAGS: 00000246 ORIG_RAX: 0000000000000036
    RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00000000c25c4110
    RDX: 000000000804b0b8 RSI: 0000000000000003 RDI: 0000000000000004
    RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
    R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
    R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
     </TASK>

    Allocated by task 486:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_cache_noprof+0x251/0x610
     snd_pcm_new_stream+0x98f/0x1350
     _snd_pcm_new+0x1d1/0x310
     snd_pcm_new+0x43/0x60
     0xffffffffc0401115
     do_one_initcall+0xf3/0x4e0
     do_init_module+0x281/0x8e0
     load_module+0x658c/0x7cc0
     init_module_from_file+0x15b/0x180
     idempotent_init_module+0x22d/0x770
     __x64_sys_finit_module+0xd2/0x160
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    Freed by task 494:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x307/0x580
     snd_pcm_free_stream+0xcf/0x290
     snd_pcm_free+0xb1/0xf0
     __snd_device_free+0x1a1/0x490
     snd_device_free+0xcf/0x190
     case_owner_ioctl+0xb8/0x160 [pmbd_alsa_fixture]
     __x64_sys_ioctl+0x163/0x1d0
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    The buggy address belongs to the object at ffff888111b36800
     which belongs to the cache kmalloc-1k of size 1024
    The buggy address is located 112 bytes inside of
     freed 1024-byte region [ffff888111b36800, ffff888111b36c00)

    The buggy address belongs to the physical page:
    page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888111b35800 pfn:0x111b30
    head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
    flags: 0x200000000000240(workingset|head|node=0|zone=2)
    page_type: f5(slab)
    raw: 0200000000000240 ffff888100042dc0 ffffea0004218610 ffffea00042c6810
    raw: ffff888111b35800 000000000010000f 00000000f5000000 0000000000000000
    head: 0200000000000240 ffff888100042dc0 ffffea0004218610 ffffea00042c6810
    head: ffff888111b35800 000000000010000f 00000000f5000000 0000000000000000
    head: 0200000000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
    head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
    page dumped because: kasan: bad access detected

    Memory state around the buggy address:
     ffff888111b36700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
     ffff888111b36780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
    >ffff888111b36800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                                 ^
     ffff888111b36880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
     ffff888111b36900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
    ==================================================================

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
Assisted-by: LLM

---
Changes in v2:
- Use the buffer-lock and state-check wrapper for all three PCM HW_REFINE
  ioctl paths, as Takashi suggested.
- Share the HW_PARAMS state check and keep the original helper for existing
  locked callers.

Link to v1: https://lore.kernel.org/r/pm-pmb-b3f7b3445bb11aaa9a7b-v2-a514c1399f30f407d626@gmail.com

diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index 55ecf87586c4ddc553a82997ddaf30a69ab6627a..e48f4b7b692f6e5da453c1072489a81e7104050c 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -252,7 +252,7 @@ static int snd_pcm_ioctl_hw_params_compat(struct snd_pcm_substream *substream,
 		return -EFAULT;
 
 	if (refine) {
-		err = snd_pcm_hw_refine(substream, data);
+		err = snd_pcm_hw_refine_with_lock(substream, data);
 		if (err < 0)
 			return err;
 		err = fixup_unreferenced_params(substream, data);
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index defbb2977efe9dcd8d48b934c3944d3fe159bcd6..20d5c7c7f56364a7d469559a9497e13a2aae9703 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -580,29 +580,6 @@ int snd_pcm_hw_refine(struct snd_pcm_substream *substream,
 }
 EXPORT_SYMBOL(snd_pcm_hw_refine);
 
-static int snd_pcm_hw_refine_user(struct snd_pcm_substream *substream,
-				  struct snd_pcm_hw_params __user * _params)
-{
-	int err;
-	struct snd_pcm_hw_params *params __free(kfree) =
-		memdup_user(_params, sizeof(*params));
-
-	if (IS_ERR(params))
-		return PTR_ERR(params);
-
-	err = snd_pcm_hw_refine(substream, params);
-	if (err < 0)
-		return err;
-
-	err = fixup_unreferenced_params(substream, params);
-	if (err < 0)
-		return err;
-
-	if (copy_to_user(_params, params, sizeof(*params)))
-		return -EFAULT;
-	return 0;
-}
-
 static int period_to_usecs(struct snd_pcm_runtime *runtime)
 {
 	int usecs;
@@ -799,6 +776,22 @@ static void pcm_qos_req_update(struct snd_pcm_substream *substream, int usecs)
 					    usecs);
 }
 
+static int hw_params_state_check(struct snd_pcm_substream *substream)
+{
+	guard(pcm_stream_lock_irq)(substream);
+	switch (substream->runtime->state) {
+	case SNDRV_PCM_STATE_OPEN:
+	case SNDRV_PCM_STATE_SETUP:
+	case SNDRV_PCM_STATE_PREPARED:
+		if (!is_oss_stream(substream) &&
+		    atomic_read(&substream->mmap_count))
+			return -EBADFD;
+		return 0;
+	default:
+		return -EBADFD;
+	}
+}
+
 static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
@@ -813,20 +806,7 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
 	err = snd_pcm_buffer_access_lock(runtime);
 	if (err < 0)
 		return err;
-	scoped_guard(pcm_stream_lock_irq, substream) {
-		switch (runtime->state) {
-		case SNDRV_PCM_STATE_OPEN:
-		case SNDRV_PCM_STATE_SETUP:
-		case SNDRV_PCM_STATE_PREPARED:
-			if (!is_oss_stream(substream) &&
-			    atomic_read(&substream->mmap_count))
-				err = -EBADFD;
-			break;
-		default:
-			err = -EBADFD;
-			break;
-		}
-	}
+	err = hw_params_state_check(substream);
 	if (err)
 		goto unlock;
 
@@ -947,6 +927,57 @@ static int snd_pcm_hw_params_user(struct snd_pcm_substream *substream,
 	return err;
 }
 
+/*
+ * call snd_pcm_hw_refine() after buffer lock and sanity check;
+ * this one should be used for ioctls and other external paths instead of
+ * direct call of snd_pcm_hw_refine()
+ */
+static int snd_pcm_hw_refine_with_lock(struct snd_pcm_substream *substream,
+				       struct snd_pcm_hw_params *params)
+{
+	struct snd_pcm_runtime *runtime;
+	int err;
+
+	if (PCM_RUNTIME_CHECK(substream))
+		return -ENXIO;
+	runtime = substream->runtime;
+	err = snd_pcm_buffer_access_lock(runtime);
+	if (err < 0)
+		return err;
+	err = hw_params_state_check(substream);
+	if (err)
+		goto unlock;
+
+	err = snd_pcm_hw_refine(substream, params);
+
+ unlock:
+	snd_pcm_buffer_access_unlock(runtime);
+	return err;
+}
+
+static int snd_pcm_hw_refine_user(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params __user * _params)
+{
+	int err;
+	struct snd_pcm_hw_params *params __free(kfree) =
+		memdup_user(_params, sizeof(*params));
+
+	if (IS_ERR(params))
+		return PTR_ERR(params);
+
+	err = snd_pcm_hw_refine_with_lock(substream, params);
+	if (err < 0)
+		return err;
+
+	err = fixup_unreferenced_params(substream, params);
+	if (err < 0)
+		return err;
+
+	if (copy_to_user(_params, params, sizeof(*params)))
+		return -EFAULT;
+	return 0;
+}
+
 static int do_hw_free(struct snd_pcm_substream *substream)
 {
 	int result = 0;
@@ -4203,7 +4234,7 @@ static int snd_pcm_hw_refine_old_user(struct snd_pcm_substream *substream,
 	if (IS_ERR(oparams))
 		return PTR_ERR(oparams);
 	snd_pcm_hw_convert_from_old_params(params, oparams);
-	err = snd_pcm_hw_refine(substream, params);
+	err = snd_pcm_hw_refine_with_lock(substream, params);
 	if (err < 0)
 		return err;
 
