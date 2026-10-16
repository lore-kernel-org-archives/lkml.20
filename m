Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729384502F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792117057; cv=none; b=FgY16jf5fLBbdZ/iab8Q37ccsVpNummw5Z4Zts2hUFTSNkrHUtni3sWA5TM2SY9sV6veyJBep/fwb3RrnzBrEZC6csCHm+oCny9Ah3ZMSYxkAmag/Zeg6H9tT6OGFB/RcltYrNAK4j8gS2dumLdc8Dd0ddIagWB3eA87ZGWIyt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792117057; c=relaxed/simple;
	bh=NvR2WM9jj8jRIgCdUG7NjHDGnPC2aHpHe+hr7SZN8iY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=TNof6BkrWvGcbgnKWBbzKkMI5obrFo9Z5slG0F0YujfI4a02umLay9rIOx/ttsHfaPXrmzS0u7nfCuPJ3lnO+IUh0hNCuts3kxwgPFoDM6O/FE+Cp7kmfS3A1GmuxEYUrCsvPWBa1kzH/DLU9smY/Ls6xI+JcmVY/V61Hdo/ymA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnhtI3W4; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnhtI3W4"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ab98332238so3441448a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792117056; x=1792721856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVmS+D5i0kAr5Pru2PharXfZ0ptxDBQzVp4Kcfu2Y0k=;
        b=fnhtI3W4XJLr3EfsQWRYSBnF8yg8zxgPwfIR/7puNu4nK7t3dY3kiya7SyYaYNz/w5
         7WpPqe9yBvrAG96HI4X48ZCZcZXrdzEmRmZbbbBQ0roONTMQM4sG1KfEqvPRKZNFXpkl
         WaXi8sN2dT+5lHXrJSleEqd3nQ8xpiETISX5UTYSoU5LDJQGkr4qKX56Km3NQK0aE1oA
         8OFwytnBotZy2BRHbCmblUdoIi0utS2+HxJ6pnyQ4VqX8hrXmQ6WaBU7lgmi14SpYhcV
         m9EOgKqUN4CNZ98FzRNv37Fn9JpX8VxoYhZfZBYG2bz9rNbfpXlICZumkuslH8TPW6ck
         RzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792117056; x=1792721856;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CVmS+D5i0kAr5Pru2PharXfZ0ptxDBQzVp4Kcfu2Y0k=;
        b=sKWbtjfNcnjJ3y3XF0oAsaP6WJy/Uh7OMoTQH9K0k5Dw8A7LRVjxne0lZE/2nCGrl3
         M9DhYjReMoJ2rp/IhpSnCIDBOOTEwn4KFXTA9U0qOju1a25Wu9nR62c67o8BEXbvr6fg
         udjCZ5Wy12FW9W6aMXMseK0JoKtdcYSe5+acAtG/txB39g91VkytRSZaRkz8C6YEOmWm
         AUTSGkz4dnYkwB/HhACE2Lb7K7GNuHLa5o1whR7izeC0NV2+EwLqxIjJhYPWDYo6XVrL
         eQwqW853cWPjWDD9KkN1qTaY1Fkdh+Ec0+5Se+3DTtjkF1hTrWj1R8QPddjiOrjGieTZ
         ri1g==
X-Forwarded-Encrypted: i=1; AKwUvBxOykWhxtkIoRPUjrzffqvqWp/6RFAkJr08lnLwf8ozYUdRJuk4lBVd0A+PVJRN6F5kb5aaPB5Bfywpwu0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZnzcigqpsNbDNAySWlOV6ipYjp0Gy7lYciKudjJioGrSUFuhW
	22V00WRfCq+HwXkl4wkIVcUEdrTPWwT9/4sFtBHCqUpEt4I0uB8jxQ61
X-Gm-Gg: AYBFou3c5EdsmYcwNJPJSI1+AvKMTiq5uqDHJ200XMQVWdEWlxQBWw5EqD2CtFJNNDv
	4E+RmhgWQjLScrtT1w9FuZ94BWuew44DRsZD16ezhBr6uKCH9xbKSQ0wEgJJz0759s50ppzUtXK
	SXcfymdkrUjxvWTp6vDGikCwXK+YrBTA2ZaJj2HmxcqI0g8ExlnsuPoyzQisWRAIsQfraLvz7fC
	76X2qOVm7VE6XLljAtmvZ97ssJoR5EKixeTZM2HJ6kf8suVxls8KifRjghJyXcqonYfOuYwiiCO
	1yxCg2rL7dp5DKxRcLPgJiW77ewLbQ7+uFe3+wGJYm5F9L4fMEWUQ7D83kB2tFxDrvwx0Pgfb43
	FRZAhSoKUGj2wgiuAnN50ouVVHfITu2L9hLJR3+//Svi+MtzRHDjAxHBfkIuQ+rZrrUCTf5ijdQ
	HXRPRr0b+rM9j0mcX3H4NzdCeHHttLWMsAfh44D8PBawjmqBcDHXXqXUMWYp4QwUXBLA==
X-Received: by 2002:a17:90b:384a:b0:3ac:b3c7:de14 with SMTP id 98e67ed59e1d1-3acb3c7e4a0mr2312783a91.61.1792117055618;
        Thu, 15 Oct 2026 19:17:35 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc487e509sm1717020a91.9.2026.10.15.19.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 19:17:35 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	thomas.weissschuh@linutronix.de,
	sammiee5311@gmail.com,
	tglx@kernel.org,
	phucduc.bui@gmail.com,
	kees@kernel.org,
	clemens@ladisch.de
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: dummy: Revalidate CD Volume before updating its access
Date: Fri, 16 Oct 2026 10:17:29 +0800
Message-Id: <pm-pmb-0d5be4c3f73a268b6e4e-v2-33b37cf9980d74d33ee3@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The CD Volume control must remain live while snd_dummy_iobox_put()
updates its access flags and sends an INFO notification. The mixer
constructor caches a raw pointer to that control, but removing it does
not invalidate the cached pointer.

This can happen when a kernel client removes CD Volume through
snd_ctl_remove_id() while the dummy card remains connected and External
I/O Box is still present. Userspace ELEM_REMOVE rejects this driver
control, so a kernel control-removal caller is required. With I/O Box
initially set to 1, the following ordering is possible:

  1. The kernel client takes controls_rwsem for write in
     snd_ctl_remove_id(). __snd_ctl_remove() unlinks CD Volume, sends
     REMOVE notifications and frees it through snd_ctl_free_one(). The
     semaphore is released and removal returns.
  2. After removal returns, a native ELEM_WRITE changes External I/O Box
     from 1 to 0. snd_ctl_elem_write() takes controls_rwsem for write
     and calls snd_dummy_iobox_put(), which follows the cached CD Volume
     pointer to update vd[0].access.

The access update starts with a use-after-free read. The subsequent
write and notification ID access also use the freed allocation. The
semaphore serializes removal and the callback, but does not preserve a
control removed before callback entry.

Save the control ID after successful addition and look it up again
inside snd_dummy_iobox_put(). The existing control-write semaphore keeps
a found control live through the access update and INFO notification.
Skip those operations when the lookup fails, preserving the I/O Box
value change and the surviving control's update.

KASAN report as below:

    BUG: KASAN: slab-use-after-free in snd_dummy_iobox_put+0x391/0x440 [snd_dummy]
    Read of size 4 at addr ffff88810d8b4c98 by task alsa-trigger/415

    CPU: 0 UID: 0 PID: 415 Comm: alsa-trigger Tainted: G           O        7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
    Tainted: [O]=OOT_MODULE
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     ? snd_dummy_iobox_put+0x391/0x440 [snd_dummy]
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __virt_addr_valid+0x20d/0x410
     ? snd_dummy_iobox_put+0x391/0x440 [snd_dummy]
     kasan_report+0xe0/0x110
     ? snd_dummy_iobox_put+0x391/0x440 [snd_dummy]
     snd_dummy_iobox_put+0x391/0x440 [snd_dummy]
     snd_ctl_elem_write+0x376/0x5a0
     snd_ctl_ioctl+0x997/0xdd0
     ? __pfx_snd_ctl_ioctl+0x10/0x10
     ? __pfx_do_sys_openat2+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? selinux_file_ioctl+0xaa/0x280
     ? __pfx_snd_ctl_ioctl+0x10/0x10
     __x64_sys_ioctl+0x163/0x1d0
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    RIP: 0033:0x7fc9c21a991b
    Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
    RSP: 002b:00007ffc08d51f80 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
    RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fc9c21a991b
    RDX: 00007ffc08d51fe0 RSI: 00000000c4c85513 RDI: 0000000000000003
    RBP: 0000000000000004 R08: 0000000000000000 R09: 0000000000000000
    R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
    R13: 00007ffc08d52600 R14: 00007fc9c22d8000 R15: 00005578bae81d58
     </TASK>

    Allocated by task 415:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_noprof+0x2d7/0x770
     snd_ctl_new+0x51/0x190
     snd_ctl_new1+0x13c/0x650
     snd_dummy_probe+0xba5/0x1240 [snd_dummy]
     platform_probe+0xbe/0x1d0
     really_probe+0x21f/0xa90
     __driver_probe_device+0x1ec/0x490
     driver_probe_device+0x4f/0x130
     __device_attach_driver+0x1d2/0x2e0
     bus_for_each_drv+0x155/0x1d0
     __device_attach+0x1c3/0x490
     device_initial_probe+0x96/0xb0
     bus_probe_device+0x69/0x160
     device_add+0xfff/0x1700
     platform_device_add+0x318/0x7b0
     platform_device_register_full+0x596/0x7b0
     pmbd_remove_cd_exit+0x12a/0xf90 [remove_cd]
     do_one_initcall+0xf3/0x4e0
     do_init_module+0x281/0x8e0
     load_module+0x658c/0x7cc0
     init_module_from_file+0x15b/0x180
     idempotent_init_module+0x22d/0x770
     __x64_sys_finit_module+0xd2/0x160
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    Freed by task 415:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x307/0x580
     snd_ctl_free_one+0x6b/0x110
     __snd_ctl_remove+0x26f/0x360
     snd_ctl_remove_id+0x4f/0x70
     0xffffffffc04060c9
     do_one_initcall+0xf3/0x4e0
     do_init_module+0x281/0x8e0
     load_module+0x658c/0x7cc0
     init_module_from_file+0x15b/0x180
     idempotent_init_module+0x22d/0x770
     __x64_sys_finit_module+0xd2/0x160
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    The buggy address belongs to the object at ffff88810d8b4c00
     which belongs to the cache kmalloc-192 of size 192
    The buggy address is located 152 bytes inside of
     freed 192-byte region [ffff88810d8b4c00, ffff88810d8b4cc0)

    The buggy address belongs to the physical page:
    page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10d8b4
    flags: 0x200000000000000(node=0|zone=2)
    page_type: f5(slab)
    raw: 0200000000000000 ffff8881000423c0 dead000000000122 0000000000000000
    raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
    page dumped because: kasan: bad access detected

    Memory state around the buggy address:
     ffff88810d8b4b80: 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc fc
     ffff88810d8b4c00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
    >ffff88810d8b4c80: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
                                ^
     ffff88810d8b4d00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
     ffff88810d8b4d80: 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc fc
    ==================================================================

Fixes: 16e434670e95 ("ALSA: dummy: allow disabling mixer controls")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---

diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index 6b0a06e5c87638264e5d22deda1fe4bc028febe7..d422fb3fa25d1279df2e971e0f5546a329db4049 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -134,7 +134,7 @@ struct snd_dummy {
 	int mixer_volume[MIXER_ADDR_LAST+1][2];
 	int capture_source[MIXER_ADDR_LAST+1][2];
 	int iobox;
-	struct snd_kcontrol *cd_volume_ctl;
+	struct snd_ctl_elem_id cd_volume_id;
 	struct snd_kcontrol *cd_switch_ctl;
 };
 
@@ -836,6 +836,7 @@ static int snd_dummy_iobox_put(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *value)
 {
 	struct snd_dummy *dummy = snd_kcontrol_chip(kcontrol);
+	struct snd_kcontrol *cd_volume_ctl;
 	int changed;
 
 	if (value->value.enumerated.item[0] > 1)
@@ -845,20 +846,27 @@ static int snd_dummy_iobox_put(struct snd_kcontrol *kcontrol,
 	if (changed) {
 		dummy->iobox = value->value.enumerated.item[0];
 
+		/* The control-write path holds controls_rwsem. */
+		cd_volume_ctl = snd_ctl_find_id(dummy->card,
+						&dummy->cd_volume_id);
 		if (dummy->iobox) {
-			dummy->cd_volume_ctl->vd[0].access &=
-				~SNDRV_CTL_ELEM_ACCESS_INACTIVE;
+			if (cd_volume_ctl)
+				cd_volume_ctl->vd[0].access &=
+					~SNDRV_CTL_ELEM_ACCESS_INACTIVE;
 			dummy->cd_switch_ctl->vd[0].access &=
 				~SNDRV_CTL_ELEM_ACCESS_INACTIVE;
 		} else {
-			dummy->cd_volume_ctl->vd[0].access |=
-				SNDRV_CTL_ELEM_ACCESS_INACTIVE;
+			if (cd_volume_ctl)
+				cd_volume_ctl->vd[0].access |=
+					SNDRV_CTL_ELEM_ACCESS_INACTIVE;
 			dummy->cd_switch_ctl->vd[0].access |=
 				SNDRV_CTL_ELEM_ACCESS_INACTIVE;
 		}
 
-		snd_ctl_notify(dummy->card, SNDRV_CTL_EVENT_MASK_INFO,
-			       &dummy->cd_volume_ctl->id);
+		if (cd_volume_ctl)
+			snd_ctl_notify(dummy->card,
+				       SNDRV_CTL_EVENT_MASK_INFO,
+				       &cd_volume_ctl->id);
 		snd_ctl_notify(dummy->card, SNDRV_CTL_EVENT_MASK_INFO,
 			       &dummy->cd_switch_ctl->id);
 	}
@@ -903,7 +911,7 @@ static int snd_card_dummy_new_mixer(struct snd_dummy *dummy)
 		if (err < 0)
 			return err;
 		if (!strcmp(kcontrol->id.name, "CD Volume"))
-			dummy->cd_volume_ctl = kcontrol;
+			dummy->cd_volume_id = kcontrol->id;
 		else if (!strcmp(kcontrol->id.name, "CD Capture Switch"))
 			dummy->cd_switch_ctl = kcontrol;
 
