Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831A71F192E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792116158; cv=none; b=EjEpJGGKYE8q1238EqfJY/ARwDOcdFcc+axBSApHOKK+nSC0NIMZ5o/ITzbTJWROYb7anUmrgJfgd2PMvp2Zv2lVpe6WwbTJBMvujlq4c6D/SM38iUqTsHn6Up14UyKYPwAOX7bEWoKaxNOE7T14C+dfqwp0alCzEaKe59a95zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792116158; c=relaxed/simple;
	bh=A0I1mWwizIvYdZUBcf5raPdsCOAEwZDrb/1+5sxxi8w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=i3w2ItMHooSwgYB26Lv/0w8kuoPHHQgai3gegC5LZ4vuMXi/nQSZ3mmWUhuqEDNJ+rpNqBD879tA4CAeCJe5oMgPi9Ut+6q8ivkdMDt0ey2n6c9pf1k7Ey8uYjFH/il4C10z1+/XVXVydBcwEYK2P5BPX3MiWwbJj1YtW1Uj8Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5zvW4Gl; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5zvW4Gl"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-89d6bd67045so336785b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792116155; x=1792720955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GyGVehmhLNcazv3ZQY4plfSb5McnZ6DkGVKM3V9rd8s=;
        b=Z5zvW4Gl26iKnTI+5qcXc1My93nhkDtvEK/9s/iGpYZH3MjqZiCQKuSGEKmYSmjqqG
         curLed4qb7jsmBVVRha0209siyYjtrPkiCFYjv1ze4Xy/7HaItn2Lf4w6mmf0PMlrA9m
         9Nz1AIAma4Zi2BdatZ7QlAQeItvfVXWM/UZQsuMxhSfTKteGKD/UsPeyLeGLJ06JuhcO
         SSMYmNXvokVpZ09AfaEUj5DA2UmvWNZ5yzmfRN+o2u11kPwWSVPjUMpk3DH0DLtQtU/p
         IDwzCFpLII1tbj4aW8yqtf5qK2Hk0jSPIPBr2B/HJ8mJ5vmJuw2VEzR3WkNJoKK1CeQ7
         vUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792116155; x=1792720955;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GyGVehmhLNcazv3ZQY4plfSb5McnZ6DkGVKM3V9rd8s=;
        b=FS9fi3yvXLXlawg20SnBRpSQ52KE4Lt+dVn5vYCkleRqyF06CRHw8JcorU9XVbAHeC
         yuEAbeZXu2q6LDrAg9RCPLcX1/Eeyg8NdFvOmhfURm6PWJO1SesM7LYK0NyiSyadG4fg
         wLhdMPkhDRWn9iIv+yMP+J7vbDYt1/fgdBYyUt5Ct0/Sr+8l3mqQDYb0k4VtaIOpf+NP
         3CR6IkBToWroQx7zAwZlXm1UJNacC4KVV3x8VxOFNQ/QQ8A1Uij6p/0WLlM6eLnRs34/
         hC4LwmOYvCMtW372U2/+gM+GPh4FvZyTj53d8uA6H0umXdwRJ7kRkZ0sShwIO4E9rg6G
         bnRQ==
X-Forwarded-Encrypted: i=1; AKwUvByzEkSxeyvcIH4RWs7bjZNIe5znifnX53aP5rb5dlvu+yISnJ4hnelYhDOn0T9oW0QwZfAmXRQQnd1y/3o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ30TCM1/cXwc9YfdXUmmV8AAQc0U25y9VgJGMDJUO8jEqOhWeI
	bygqgCse7m0yKMoToOs1IQq0aVpPB9CcplIgvGFnfo1fQ1btN09Cm7rc
X-Gm-Gg: AYBFou3p24ysJt/ihDCnOXJMSyaWPNNYmGJihDtYsvgKrZTpqi3/1YfT63RLwdwXotn
	jnUcujL5wfd90TpLBwQjfl0OUo7+m3Tc75UJKcQ4hKRm402siD2J25BX/lgYgSyznE5iLlfQ8Ks
	XBTmt9pM+kzES2lpO4tBW00tDf/QFaxpNmRm+rrVNlWN3mfyqDRTz6c6N6QaShAzYt2U74cbde6
	GJTMCXXQTRZ6FZEOo+Yo4rn4nF2VAODgYw2Q86++Sl356i9PhK2Bu0dTfCnoK0o4RpruTy+ZaPV
	LDiEJ3CPhn2D0ZJFpYl3sMYRbaV8SHkAU9T3fL33YNDMJ+hH42ckjPgFiEUD4xfnAx3KaidKycI
	7l4l0R+Qnd8SkPAo4iG710nKKrPYKnNtiFLTWbPxvdX5gKXHQJknpsGD39WyijZEqYxsypory+v
	0bf9mwo1dyXKE2rq+czHXPD+OD/c9wQUrNNHrhKfOzDWF2BhUJ+EzqLnSwQ1cA49K4kQ==
X-Received: by 2002:aa7:8886:0:b0:89c:e375:1de9 with SMTP id d2e1a72fcca58-89f1e7ab4f8mr1365092b3a.4.1792116154809;
        Thu, 15 Oct 2026 19:02:34 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f54b2eec9sm350873b3a.8.2026.10.15.19.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 19:02:34 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	kees@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: vmaster: Protect follower lookup and setup
Date: Fri, 16 Oct 2026 10:02:29 +0800
Message-Id: <pm-pmb-6c0b7e841529ddd0b21a-v2-b53dbcd593a7a4bd9582@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A control selected by snd_ctl_add_followers() must remain alive until
_snd_ctl_add_follower() has copied it and installed its wrapper. The
lookup returns a raw pointer without retaining the control, and neither
the short-lived list lookup lock nor the fast lookup protects later use.

If a kernel client adds followers to a live virtual master while another
client removes or replaces a published follower, the following order is
possible, with the card and master kept alive:

  Follower setup                      Control removal
  snd_ctl_add_followers()
    snd_ctl_find_id_mixer()
      return follower
                                      snd_ctl_remove()
                                        down_write(controls_rwsem)
                                        __snd_ctl_remove()
                                          unlink follower
                                          snd_ctl_free_one(follower)
                                        up_write(controls_rwsem)
    _snd_ctl_add_follower()
      read follower->count

Removal completes after lookup returns and before setup reads the
control. Since setup holds neither controls_rwsem nor a reference, the
count read and subsequent control copies can access freed memory.

Hold controls_rwsem for writing across the lookup and follower setup.
This prevents removal or replacement from freeing the selected control
until wrapper installation is complete. Write ownership also excludes
control callbacks while setup changes the callback and private fields.

KASAN report as below:

    BUG: KASAN: slab-use-after-free in _snd_ctl_add_follower+0x452/0x520
    Read of size 4 at addr ffff888107957d50 by task loadmodule/491

    CPU: 3 UID: 0 PID: 491 Comm: loadmodule Tainted: G           O        7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
    Tainted: [O]=OOT_MODULE
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     ? _snd_ctl_add_follower+0x452/0x520
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __virt_addr_valid+0x20d/0x410
     ? _snd_ctl_add_follower+0x452/0x520
     kasan_report+0xe0/0x110
     ? _snd_ctl_add_follower+0x452/0x520
     _snd_ctl_add_follower+0x452/0x520
     snd_ctl_add_followers+0x153/0x2b0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_snd_ctl_add_followers+0x10/0x10
     ? __might_fault+0x135/0x190
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __might_fault+0x14e/0x190
     ? __pfx_fixture_write+0x10/0x10 [pmbd_vmaster_fixture]
     fixture_write+0x174/0x1f0 [pmbd_vmaster_fixture]
     ? __pfx_fixture_write+0x10/0x10 [pmbd_vmaster_fixture]
     ? __pfx___might_resched+0x10/0x10
     proc_reg_write+0x1fb/0x2d0
     vfs_write+0x25a/0x1010
     ? __pfx_proc_reg_write+0x10/0x10
     ? kmem_cache_free+0x242/0x580
     ? __pfx_vfs_write+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? putname+0x93/0xe0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? do_sys_openat2+0x12a/0x1b0
     ? __pfx_do_sys_openat2+0x10/0x10
     ksys_write+0x111/0x200
     ? __pfx_ksys_write+0x10/0x10
     ? irqentry_exit+0xbe/0x820
     ? srso_alias_return_thunk+0x5/0xfbef5
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    RIP: 0033:0x7f0b835a9687
    Code: 48 89 fa 4c 89 df e8 58 b3 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
    RSP: 002b:00007ffc82ea0360 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
    RAX: ffffffffffffffda RBX: 00007f0b83517780 RCX: 00007f0b835a9687
    RDX: 0000000000000005 RSI: 0000564f8a21d074 RDI: 0000000000000003
    RBP: 0000000000000003 R08: 0000000000000000 R09: 0000000000000000
    R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000000
    R13: 00007ffc82ea04f0 R14: 00007f0b83755000 R15: 0000564f8a21ed78
     </TASK>

    Allocated by task 485:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_noprof+0x2d7/0x770
     snd_ctl_new+0x51/0x190
     snd_ctl_new1+0x13c/0x650
     0xffffffffc04011b5
     do_one_initcall+0xf3/0x4e0
     do_init_module+0x281/0x8e0
     load_module+0x658c/0x7cc0
     init_module_from_file+0x15b/0x180
     idempotent_init_module+0x22d/0x770
     __x64_sys_finit_module+0xd2/0x160
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    Freed by task 492:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x307/0x580
     __snd_ctl_remove+0x2ac/0x3d0
     snd_ctl_remove+0x46/0x70
     fixture_write+0x1ae/0x1f0 [pmbd_vmaster_fixture]
     proc_reg_write+0x1fb/0x2d0
     vfs_write+0x25a/0x1010
     ksys_write+0x111/0x200
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    The buggy address belongs to the object at ffff888107957d00
     which belongs to the cache kmalloc-192 of size 192
    The buggy address is located 80 bytes inside of
     freed 192-byte region [ffff888107957d00, ffff888107957dc0)

    The buggy address belongs to the physical page:
    page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x107957
    flags: 0x200000000000000(node=0|zone=2)
    page_type: f5(slab)
    raw: 0200000000000000 ffff8881000423c0 dead000000000100 dead000000000122
    raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
    page dumped because: kasan: bad access detected

    Memory state around the buggy address:
     ffff888107957c00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
     ffff888107957c80: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
    >ffff888107957d00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                     ^
     ffff888107957d80: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
     ffff888107957e00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    ==================================================================

Fixes: ae07eb9bf23e ("ALSA: vmaster: Add snd_ctl_add_followers() helper")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---

diff --git a/sound/core/vmaster.c b/sound/core/vmaster.c
index cd3dcaaf9f720e723ad6667e3df5e384a121542d..f4dad747717a4f52983e27d35575a8511d2317c3 100644
--- a/sound/core/vmaster.c
+++ b/sound/core/vmaster.c
@@ -287,6 +287,8 @@ EXPORT_SYMBOL(_snd_ctl_add_follower);
  *
  * Adds the multiple follower kcontrols with the given names.
  * Returns 0 for success or a negative error code.
+ *
+ * Note that this function takes card->controls_rwsem lock internally.
  */
 int snd_ctl_add_followers(struct snd_card *card, struct snd_kcontrol *master,
 			  const char * const *list)
@@ -294,6 +296,7 @@ int snd_ctl_add_followers(struct snd_card *card, struct snd_kcontrol *master,
 	struct snd_kcontrol *follower;
 	int err;
 
+	guard(rwsem_write)(&card->controls_rwsem);
 	for (; *list; list++) {
 		follower = snd_ctl_find_id_mixer(card, *list);
 		if (follower) {
