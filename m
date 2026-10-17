Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E9C426436
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792222049; cv=none; b=qOUyLFOTGFHiRpQqL6sH41L3ELOjlDYpXzrPhyz7BmwW+PyPQ7hLh3D7MFsHdjGjPIDw4/hahL9hiUWCt/OzzuKVDaIjtmcmC6t6XQC+AR6Y5We5PSNhcmv6lkEGGiam0pAb4uzWS0ImZt3PFoyg381XTypdjRUW1ybOawKndn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792222049; c=relaxed/simple;
	bh=ScCkCg1PasslyQrcGv0QXe/t4I4hQs8RryHqx7F57W4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=tjhkrFWIpOWjnk5oiyjr7KcI5dsYn5kTHiZTB1iPSpqOBmbHINGWhpXBr227ZP7kmutJ+/SwuL9f1L66NJW4imvOce/jVdzoXIerTNCOUFWLSW/RWsxvMBTFk3yV23WO+yu5xhNjad1dc9rWmrzS3xfIFptQpn/oiar3JF7Qfwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJgSfn5j; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJgSfn5j"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-88bd2b44f3aso304559b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792222047; x=1792826847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UCr2hGuSoBbZG63UvS3r5zJM0OZa0bzIBmhskmWguD0=;
        b=eJgSfn5jy/eER1wuOUFEAhwfPbXLTmO/3PcLJMiyBB40eHzRjse5jj69lflDu1MVVX
         gGZAoYPViMCyXA5hXwG4+w7SAWF7SkdCaw7rKJLLX4lJszZY0cTSwHwXGwvJ8A3Zm0wZ
         Mu9nU+RxEW7WlJzxMuUMr2tuz0pic0pSIM6WrmN9/eWaN1r6TNAGw6HXSmq5oT1QfenX
         TnJEK6iz9pmW+823iAcqUCodkdWRa9dClMYbHnrks7Q2R4YYONG96g4WaecF6mcM727f
         zMOGsWSAJX6dUlIgzYYy9lUUHRsGzb9VeZmOYJPd+A/K92pDXdUDGNxi3AOpOGiqRygj
         VlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792222047; x=1792826847;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UCr2hGuSoBbZG63UvS3r5zJM0OZa0bzIBmhskmWguD0=;
        b=baBh0N2+qf4mKZIAsN9G3h4Dh34xv/R15k2xHAflRojgIyH/cowJmD7PVwrtZXAjsD
         fGkRMGROVWgXRFuzKnv0CUjy9JKW9W0kVQPnlNY/lPYh+KKpdybnv8u1gLdCN1fl52sW
         CzmSFiVJ1Gyu0f4T7OQTS1DSooCjQeE45y8/Xfb8FyzVbSlQNB305DBq4mo5GRwsZuYC
         eCYyn5581CZag/FlOUGeoVBWXuPamQ9/8EImMmR15Cu7sZY5rcerX29LITDzOK5jFGyQ
         sHRcPIImN13246JtLbtYN1mVhjukbWOjIAZwgH26IAxQGaj28/HM91wXZzq6bfnzXnKe
         nD3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzC+oHbJKzg5IX5h5AdmWgtczsHyyYxU9/2kFQWCPN+YHRxXVj3qAp2urlXtDfv7kkuHA/wEFMs9BjRCBQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLUzFZt8jDtMvLtSPegtpYbPiqMdkQV0Vj4PB/8lM85OoIexUA
	A1F5LmP92+xzky7Al94vHjw4R1XA1gYy8KJ4Ue0vRmsXdsogwUKJd5X7
X-Gm-Gg: AYBFou0cvarFoJkCTvoNddij9TNAllmtFHiQr0LBaGLBsbdQwWGSLHmU6yvGp2k3ACf
	VtVPKAs0hUDhYq+OiQSsGVlV0zH9THtfR+zSD5sTsf1uEG4WcXE7Efb08KiXzS5hMmj3zV2wG2H
	Fy/VD7ubZ7tuGsMIkU3Z67D/nr7XafPeTrax4dp4xlWTGd2CDcqej17t99vUq7PGBLB8bKg0OYZ
	RCfj6cRJ29J2MwRX6S5XvQT2JE7+vYU5WCUZSvA+6kotjU8qu9mjMOAdiez4fHWmKmHBu8LDE40
	RttLQUD2Fk8HfPUqFoOd8x0/nKgxbZ6Ypkh54fUcOPBy3BR23lK2tkvcNnsiORckYxIUVaFndje
	TgTXJFNQgdHHHATUj06oYqc6hBdeQJ+TQ7AmqsTtwqve1zvw8jImC8ELEpOjX0Jhj7I7RC6FBUK
	BvYL7zF3lZFKCgVKJ+W3TFgLqIXiUfh4LXzB2MdLCZfUGXh6yMu0KRuq3neZW+uhfopRw=
X-Received: by 2002:a05:6a20:43a7:b0:3dd:85a9:55a3 with SMTP id adf61e73a8af0-3e2260646f4mr1317417637.37.1792222047021;
        Sat, 17 Oct 2026 00:27:27 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f56c8cf81sm1973166b3a.16.2026.10.17.00.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 00:27:26 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: pcm: oss: Serialize final setup list cleanup
Date: Sat, 17 Oct 2026 15:27:19 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v6-680f350d78e44f9de7a7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

OSS setup nodes and their task names must remain valid throughout
snd_pcm_oss_look_for_setup(). The lookup holds setup_mutex while
comparing names, traversing the list and copying a matched record, but
snd_pcm_oss_proc_done() frees that list without taking the mutex.

With verbose proc support enabled, an OSS open on a stream with a
populated setup list can overlap HDA codec unbind. The card remains
registered, so the card-file reference does not prevent the PCM
component from being freed.

The lookup runs before pcm->open_mutex is taken and before the driver
acquires a PCM reference. Codec unbind disconnects the PCM and drains
existing codec PCM references first. Its cleanup then reaches
snd_pcm_free() through codec_release_pcms() and snd_device_free(). The
n_unregister callback invokes snd_pcm_oss_unregister_minor() and
snd_pcm_oss_proc_done().

Both columns below access the setup list of the same PCM stream. Without
this fix, cleanup does not take setup_mutex:

  OSS open                        HDA PCM teardown
  --------                        ----------------
  snd_pcm_oss_look_for_setup()
    lock(setup_mutex)
    setup = setup_list
                                  snd_pcm_oss_proc_done()
                                    snd_info_free_entry()
                                    /* no setup_mutex held */
                                    snd_pcm_oss_proc_free_setup_list()
                                      kfree(setup->task_name)
                                      kfree(setup)
    read setup->task_name
    or setup->next -> UAF

Take setup_mutex around final list cleanup, as the proc clear/erase path
already does. This waits for the active lookup to finish its reads and
copy before freeing the nodes. Acquire the mutex after
snd_info_free_entry() so proc callback rundown can finish without
waiting on a mutex held by teardown.

KASAN report as below:

    BUG: KASAN: slab-use-after-free in snd_pcm_oss_look_for_setup+0x30c/0x3c0
    Read of size 8 at addr ffff888106ecc2c0 by task pmbdossuaf/427

    CPU: 3 UID: 0 PID: 427 Comm: pmbdossuaf Not tainted 7.2.0-rc6-pmb-alsa-functional-v2+ #1 PREEMPT(lazy)
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     ? snd_pcm_oss_look_for_setup+0x30c/0x3c0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __virt_addr_valid+0x20d/0x410
     ? snd_pcm_oss_look_for_setup+0x30c/0x3c0
     kasan_report+0xe0/0x110
     ? snd_pcm_oss_look_for_setup+0x30c/0x3c0
     snd_pcm_oss_look_for_setup+0x30c/0x3c0
     snd_pcm_oss_open+0xd38/0x1240
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? avc_has_perm_noaudit+0x4a/0x330
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? find_held_lock+0x2b/0x80
     ? __pfx_snd_pcm_oss_open+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __lock_acquire+0x466/0x2260
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lock_release+0xc8/0x280
     ? __pfx_snd_pcm_oss_open+0x10/0x10
     soundcore_open+0x3ae/0x510
     ? __pfx_soundcore_open+0x10/0x10
     chrdev_open+0x21f/0x660
     ? __pfx_chrdev_open+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     do_dentry_open+0x5c8/0x1300
     ? __pfx_chrdev_open+0x10/0x10
     ? security_inode_permission+0x5d/0xb0
     vfs_open+0x87/0x390
     ? srso_alias_return_thunk+0x5/0xfbef5
     path_openat+0x2460/0x3cd0
     ? do_syscall_64+0x115/0x6a0
     ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
     ? __pfx_path_openat+0x10/0x10
     do_file_open+0x21e/0x470
     ? __pfx_do_file_open+0x10/0x10
     ? _raw_spin_unlock+0x23/0x40
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? alloc_fd+0x3a6/0x6b0
     do_sys_openat2+0xf4/0x1b0
     ? __pfx_do_sys_openat2+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     __x64_sys_openat+0x136/0x1e0
     ? __pfx___x64_sys_openat+0x10/0x10
     ? irqentry_exit+0xbe/0x820
     ? srso_alias_return_thunk+0x5/0xfbef5
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    RIP: 0033:0x7f687d8c4687
    Code: 48 89 fa 4c 89 df e8 58 b3 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
    RSP: 002b:00007ffca02dde50 EFLAGS: 00000202 ORIG_RAX: 0000000000000101
    RAX: ffffffffffffffda RBX: 00007f687d830780 RCX: 00007f687d8c4687
    RDX: 0000000000080801 RSI: 00007f687d518b90 RDI: ffffffffffffff9c
    RBP: 00007f687d66e1c8 R08: 0000000000000000 R09: 0000000000000000
    R10: 0000000000000000 R11: 0000000000000202 R12: 00000000000001ff
    R13: 00007f687d356830 R14: 00007ffca02ddf30 R15: 00007f687d518b90
     </TASK>

    Allocated by task 426:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_cache_noprof+0x251/0x610
     snd_pcm_oss_proc_write+0x619/0x950
     snd_info_text_entry_release+0x100/0x260
     close_pdeo.part.0+0xe0/0x2e0
     close_pdeo+0x161/0x180
     proc_reg_release+0x185/0x1f0
     __fput+0x39f/0xa60
     fput_close_sync+0xff/0x200
     __x64_sys_close+0x8c/0xf0
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    Freed by task 428:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x307/0x580
     snd_pcm_oss_proc_free_setup_list+0x9c/0x140
     snd_pcm_oss_unregister_minor+0x203/0x450
     snd_pcm_free+0xb0/0x180
     __snd_device_free+0x193/0x3f0
     snd_device_free+0xcf/0x190
     snd_hda_codec_cleanup_for_unbind+0x1b3/0xad0
     hda_codec_driver_remove+0x1c4/0x2e0
     device_remove+0x12a/0x170
     device_release_driver_internal+0x471/0x650
     unbind_store+0xfd/0x110
     drv_attr_store+0x79/0xb0
     sysfs_kf_write+0xed/0x140
     kernfs_fop_write_iter+0x34b/0x500
     vfs_write+0x637/0x1010
     ksys_write+0x111/0x200
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    The buggy address belongs to the object at ffff888106ecc2c0
     which belongs to the cache kmalloc-32 of size 32
    The buggy address is located 0 bytes inside of
     freed 32-byte region [ffff888106ecc2c0, ffff888106ecc2e0)

    The buggy address belongs to the physical page:
    page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x106ecc
    flags: 0x200000000000000(node=0|zone=2)
    page_type: f5(slab)
    raw: 0200000000000000 ffff888100042780 dead000000000100 dead000000000122
    raw: 0000000000000000 0000000000400040 00000000f5000000 0000000000000000
    page dumped because: kasan: bad access detected

    Memory state around the buggy address:
     ffff888106ecc180: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
     ffff888106ecc200: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
    >ffff888106ecc280: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
                                               ^
     ffff888106ecc300: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
     ffff888106ecc380: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
    ==================================================================

Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
Assisted-by: LLM

---
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index bd19328dca9e..ac7f6f1384fc 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -3111,6 +3111,7 @@ static void snd_pcm_oss_proc_done(struct snd_pcm *pcm)
 		struct snd_pcm_str *pstr = &pcm->streams[stream];
 		snd_info_free_entry(pstr->oss.proc_entry);
 		pstr->oss.proc_entry = NULL;
+		guard(mutex)(&pstr->oss.setup_mutex);
 		snd_pcm_oss_proc_free_setup_list(pstr);
 	}
 }
