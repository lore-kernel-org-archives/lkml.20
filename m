Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2B62EACF2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792116285; cv=none; b=XXX+1ht/hjW+lmaYi/oVWkG22E8teJqWkrZCZr6iYsm/NNLIu7yZqZIeLhHXVUekX1KZUUgysiTat15lS9Bbfux+jy+Isy/P833eD75P3DWHlUnsM5iIebHsY0TrO/Bg481t8gRsPOHAyQejrKgP02K/PwtlJrUehtRUNkoihuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792116285; c=relaxed/simple;
	bh=LVFZKom2xvc7Ck1yD864BRzvK5konzcXIKxRyDpS4Io=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=tl048Y+yUIaWsE/jeSCmfNr+hsRNnq8+XL5WoUkd30aJ97iXyqNn8IIz/gdBbEn+Ue149QsiOeP36nwlr5DZf6DUDnJVBQDFzVWFUqURz38Df7hBrIuKp20FbIrtsVprP+u4SDr5VvR355s6gDhwHWxpIriosrUvb5EoZUxqxt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8m+FgW2; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8m+FgW2"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab41538192so4197529a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792116284; x=1792721084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=puhD66ynBKF0mzbAFUzBYXxynPmUnfSs5mE7TE7zq8Y=;
        b=P8m+FgW2XnFQl/NjJ5iWVM5/p2C8oMcPPBspmhqJ4+DoGJy85UftO6uHD6KQ2y5JKd
         aFhB/NSdtC6shDdMXwlZygNOoGszRt7SU65MJ6QewhL5CD9wxrb/qik/I6UMK57Qd24k
         Di4EyWbnuoTkX85AQw1y3IoO9BNoqC/aeo72AJ58k8nl0wncM8uVm9DgPeB2iovHOOvM
         VEBmCB6UgNmyrQeY+uj8RPQMXwU6i5FhFuFRhY+vcbGBBEJXqQbOm3xARxqupySs0vE4
         797NP40w5CbZAaF7QN6WjJg5EAkUbZvRvDcL3EBEsO6awhUXfpDgjmQ50BkCNsuJsgZp
         2UPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792116284; x=1792721084;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=puhD66ynBKF0mzbAFUzBYXxynPmUnfSs5mE7TE7zq8Y=;
        b=rKdzECWhmKojs6jlVUMSoylc87w/MO4ENVlQHA5d7OEBO8TjrfzaHW/w2M5n603jz4
         2O1rae1wqVyRO1ar6jKzjcT/2WLRCJbd9QR9lfEx/PY4Cenc1DNtMKqEtCTfztWLKOfZ
         IT3g3YYZdZfNRLQxEVCCgPfZwVhHWIUZ0HqPUYTJaCkwAzGSoNiaRnZl2Sz1JYgqI7G1
         xb5o4T8H72XSS2DQrEjNWvQBt6FEAJcD2fFc6M0Xb5YHfzM1+/EhzNydK1/c0Yxeci3C
         aBSuSx9HOWNEJGrjYYTklNyFBtKaccKP3TaN1kWly852jAJG49ss9GAtJ428Wn3//eLN
         6WMw==
X-Forwarded-Encrypted: i=1; AKwUvBwqj/qX2VknA6Z4z/pf1ordT0dZiWIG3PqRqHtos97cnG2m8tQR/wKXweB0bt2qFC/kjo/rhA6Y+z7r9nI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDXgXxlIN6W/KIXxpJX6+h8BEBhot5zKsBN7yv76nvsXj/zM1r
	oqzNJOayVIWGYefk+O2+DL5G7atVXEP9eJHl50Rvg8sEDm5uJVYbdZj9
X-Gm-Gg: AYBFou3c0vuK0CTC93jIarEVY8k/e0FAnazPwkudQ1DoM1DPRWrdiDuyyrloRzDVRyk
	8UdSavAjlQijBUdNyYt3RQrfnHbPhxAU332lKweXjzsU4VUMVNZn62RzEsrVzwx6D6l5dXkzTTF
	xYJzWO+aLASMHkxbeI3eHIPXMdG6H0tg/G7r5rmw8LrcRxAzy0If90Q6gr+ZuKG2iaToliSfVdb
	xCv2q1bEppWsP4ulBU729mLfQWgV2BNF78TacePG/nLS+2YIHJnHdAzYES0M+Y1nM7n9Ys5LCrq
	w3d0+/uAka5GbLiCh0rqbyoMAGZpeP5xMWLVzC38sPiQJaktfj2kirSjhEkJn3Iy84mypqbo9s0
	mvW09SmyYjJv5i4PMJ2sCASNKCJq3atW0Q3/JdPvo6HFoY4KBFDO+l95acnd63kT7EC5lnOQcg4
	WO6fZ9JupyQi1qTur5TFBeI8xjkJEqFaHE00qczB7Ojd48zcBcb6dQUlc1k7MNdsLz7Q==
X-Received: by 2002:a17:90b:2688:b0:3a4:adea:50ad with SMTP id 98e67ed59e1d1-3ab3a775938mr18017420a91.27.1792116283528;
        Thu, 15 Oct 2026 19:04:43 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd654a249f3sm330134a12.27.2026.10.15.19.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 19:04:43 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	phucduc.bui@gmail.com,
	kees@kernel.org,
	blum@kernel.org,
	hui.wang@canonical.com,
	kai.vehmanen@linux.intel.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: jack: Protect debugfs setup against control removal
Date: Fri, 16 Oct 2026 10:04:37 +0800
Message-Id: <pm-pmb-0f2e227b93626e3c7554-v2-0b7a6296bbea01ae57e8@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The jack control attachment must remain alive while its injection
interface is being initialized. snd_jack_kctl_add() links the attachment
to jack->kctl_list and then calls snd_jack_debugfs_add_inject_node(),
which dereferences jack_kctl->kctl to read the control name. Neither the
list insertion nor the debugfs setup holds controls_rwsem.

With CONFIG_SND_JACK_INJECTION_DEBUG enabled, an independent kernel
control owner can remove the newly linked control in this order:

  1. The creator publishes the control with snd_ctl_add(), which releases
     controls_rwsem, and links its attachment in snd_jack_kctl_add().
  2. The remover takes controls_rwsem for writing in snd_ctl_remove().
     __snd_ctl_remove() unlinks the control and calls snd_ctl_free_one().
     snd_jack_kctl_private_free() unlinks and frees the attachment, then
     snd_ctl_free_one() frees the control.
  3. The creator enters snd_jack_debugfs_add_inject_node() and reads the
     control name through the freed attachment.

This causes a use-after-free read during jack creation. Hold the existing
controls_rwsem for reading before linking the attachment and until the
debugfs helper returns. The remover's write lock then keeps the attachment
and its control alive throughout this post-publication setup interval.

KASAN report as below:

    BUG: KASAN: slab-use-after-free in snd_jack_kctl_add+0x50b/0x5e0
    Read of size 8 at addr ffff88810d8def00 by task kworker/2:1/68

    CPU: 2 UID: 0 PID: 68 Comm: kworker/2:1 Tainted: G           O        7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
    Tainted: [O]=OOT_MODULE
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    Workqueue: events azx_probe_work [snd_hda_intel]
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     ? snd_jack_kctl_add+0x50b/0x5e0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __virt_addr_valid+0x20d/0x410
     ? snd_jack_kctl_add+0x50b/0x5e0
     kasan_report+0xe0/0x110
     ? snd_jack_kctl_add+0x50b/0x5e0
     snd_jack_kctl_add+0x50b/0x5e0
     ? snd_jack_kctl_add+0x5/0x5e0
     snd_jack_new+0x347/0x4c0
     snd_hda_jack_add_kctl_mst+0x19e/0x540 [snd_hda_codec]
     add_jack_kctl+0x1b9/0x2c0 [snd_hda_codec]
     ? __pfx_add_jack_kctl+0x10/0x10 [snd_hda_codec]
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? _raw_spin_unlock_irqrestore+0x44/0x60
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? pmbd_probe_hit_cookie+0xee/0x1c0
     snd_hda_jack_add_kctls+0x212/0x910 [snd_hda_codec]
     ? srso_alias_return_thunk+0x5/0xfbef5
     snd_hda_gen_build_controls+0x23a/0x6a0 [snd_hda_codec_generic]
     ? __pfx_snd_hda_gen_build_controls+0x10/0x10 [snd_hda_codec_generic]
     snd_hda_codec_build_controls+0x2e4/0x9f0 [snd_hda_codec]
     ? __pfx_snd_hda_codec_build_controls+0x10/0x10 [snd_hda_codec]
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? snd_hda_codec_build_pcms+0x4d8/0x6e0 [snd_hda_codec]
     hda_codec_driver_probe+0x26e/0x590 [snd_hda_codec]
     ? __pfx_hda_codec_driver_probe+0x10/0x10 [snd_hda_codec]
     really_probe+0x21f/0xa90
     __driver_probe_device+0x1ec/0x490
     driver_probe_device+0x4f/0x130
     __device_attach_driver+0x1d2/0x2e0
     ? __pfx___device_attach_driver+0x10/0x10
     bus_for_each_drv+0x155/0x1d0
     ? __pfx_bus_for_each_drv+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? trace_hardirqs_on+0x18/0x160
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? _raw_spin_unlock_irqrestore+0x44/0x60
     __device_attach+0x1c3/0x490
     ? __pfx___device_attach+0x10/0x10
     ? snd_hda_codec_configure+0x4a2/0x690 [snd_hda_codec]
     snd_hda_codec_configure+0x4c5/0x690 [snd_hda_codec]
     ? __pfx_snd_hda_codec_configure+0x10/0x10 [snd_hda_codec]
     ? __pfx_azx_probe_codecs+0x10/0x10 [snd_hda_codec]
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? request_threaded_irq+0x21f/0x380
     azx_codec_configure+0x65/0x200 [snd_hda_codec]
     azx_probe_work+0x4d8/0x23b0 [snd_hda_intel]
     ? __pfx_azx_probe_work+0x10/0x10 [snd_hda_intel]
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lock_release+0xc8/0x280
     ? srso_alias_return_thunk+0x5/0xfbef5
     process_one_work+0x908/0x19c0
     ? __pfx_process_one_work+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lock_is_held_type+0x8f/0x100
     ? srso_alias_return_thunk+0x5/0xfbef5
     worker_thread+0x65c/0xe40
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __kthread_parkme+0x175/0x220
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_worker_thread+0x10/0x10
     kthread+0x34f/0x460
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_kthread+0x10/0x10
     ret_from_fork+0x659/0x940
     ? __pfx_ret_from_fork+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __switch_to+0x74f/0xf80
     ? __pfx_kthread+0x10/0x10
     ret_from_fork_asm+0x1a/0x30
     </TASK>

    Allocated by task 68:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_cache_noprof+0x251/0x610
     snd_jack_kctl_new+0x80/0x180
     snd_jack_new+0x4b/0x4c0
     snd_hda_jack_add_kctl_mst+0x19e/0x540 [snd_hda_codec]
     add_jack_kctl+0x1b9/0x2c0 [snd_hda_codec]
     snd_hda_jack_add_kctls+0x212/0x910 [snd_hda_codec]
     snd_hda_gen_build_controls+0x23a/0x6a0 [snd_hda_codec_generic]
     snd_hda_codec_build_controls+0x2e4/0x9f0 [snd_hda_codec]
     hda_codec_driver_probe+0x26e/0x590 [snd_hda_codec]
     really_probe+0x21f/0xa90
     __driver_probe_device+0x1ec/0x490
     driver_probe_device+0x4f/0x130
     __device_attach_driver+0x1d2/0x2e0
     bus_for_each_drv+0x155/0x1d0
     __device_attach+0x1c3/0x490
     snd_hda_codec_configure+0x4c5/0x690 [snd_hda_codec]
     azx_codec_configure+0x65/0x200 [snd_hda_codec]
     azx_probe_work+0x4d8/0x23b0 [snd_hda_intel]
     process_one_work+0x908/0x19c0
     worker_thread+0x65c/0xe40
     kthread+0x34f/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30

    Freed by task 436:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x307/0x580
     snd_jack_kctl_private_free+0x154/0x200
     __snd_ctl_remove+0x29f/0x3b0
     snd_ctl_remove+0x46/0x70
     remove_control_set+0x110/0x1b0 [pmbd_alsa_control_remove]
     param_attr_store+0x191/0x2f0
     module_attr_store+0x5d/0x90
     sysfs_kf_write+0xed/0x140
     kernfs_fop_write_iter+0x34b/0x500
     vfs_write+0x637/0x1010
     ksys_write+0x111/0x200
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    The buggy address belongs to the object at ffff88810d8def00
     which belongs to the cache kmalloc-64 of size 64
    The buggy address is located 0 bytes inside of
     freed 64-byte region [ffff88810d8def00, ffff88810d8def40)

    The buggy address belongs to the physical page:
    page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10d8de
    flags: 0x200000000000000(node=0|zone=2)
    page_type: f5(slab)
    raw: 0200000000000000 ffff8881000428c0 dead000000000100 dead000000000122
    raw: 0000000000000000 0000000000200020 00000000f5000000 0000000000000000
    page dumped because: kasan: bad access detected

    Memory state around the buggy address:
     ffff88810d8dee00: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
     ffff88810d8dee80: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
    >ffff88810d8def00: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
                       ^
     ffff88810d8def80: 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc
     ffff88810d8df000: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
    ==================================================================

Fixes: 2d670ea2bd53 ("ALSA: jack: implement software jack injection via debugfs")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---

diff --git a/sound/core/jack.c b/sound/core/jack.c
index 0f04018181acb20f6bf85b11a9f6d4c7d3179e5a..dd604ffd8c815a9828f5e4b30a70b7597c86a37f 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -418,6 +418,7 @@ static void snd_jack_kctl_private_free(struct snd_kcontrol *kctl)
 
 static void snd_jack_kctl_add(struct snd_jack *jack, struct snd_jack_kctl *jack_kctl)
 {
+	guard(rwsem_read)(&jack->card->controls_rwsem);
 	jack_kctl->jack = jack;
 	list_add_tail(&jack_kctl->list, &jack->kctl_list);
 	snd_jack_debugfs_add_inject_node(jack, jack_kctl);
