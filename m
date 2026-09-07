Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EEB437852
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773960; cv=pass; b=GU/s4aw5GoOy6PoIzJbnl4cKjnL9nB1Tf8gOlSDEJHNCZ7bskvQpCqQwk7fNLvM47vzi+NgAoeGKB9c1dnBbPFIymQvYXwHZo2jzZDx+ftsvMjSmOlHVs+3+SHiu9Ln0GywEAeZduZfRjNHYEg/hPLy+Jz4j/3Tsu8bTpcK66o8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773960; c=relaxed/simple;
	bh=MagqI8XN/0XIKZWh6eojJ1SPBazhBvR5j2uHI9auC54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MOeYmJM+yNHsy9QrXyuTteXsMqda87Hbq4BdP9zcAzSIYteLTDcvjTWoRCP/Mo1s1kvT8iM4zssYVnhBeAkjPwXBHkjrggIGRV5k5mRGH2tMb5S3xC2iMxU8gPsdDWQq5cg6fLgBobbLnM7Vtfme/U1pPgSgMY6+48n9DvWwFrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eI64qAjz; arc=pass smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eI64qAjz"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4a45b3f0becso2383717b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:39:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788773958; cv=none;
        d=google.com; s=arc-20260327;
        b=JSlm1LZwUn6nb75IYyFGxtyJBYUBBNka0Y3l15VjmwTAb/rR7+KfeiFS2Gw1pEMJjV
         7/06lfYpnc/FRWJchgiKbBIUh4qtJcr6lLi93//DxZyGrLp4YMu699utGf8HznXEmTC3
         at7xtayLGRvl/skm6BuACyhGXB8FyDS1hA5f9nkEGBY0519IghhrtwdSpZFWudB8tpWZ
         cIYtgo8a1fSpg/jK/NisUuNb02dJUqE19RMMFyY5nxzSewMFnC5bN57hF100gIRxK3Ys
         PP7EF9ezJmPXj8gOLcFlDwOavAZQLXYAgtTsz4f8izzE/3x1ZBK6hKGhwPEijoo7TIcQ
         gFCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zr2BtmB2HKSIHWFikoM0kA9i/Dq+exld/VzGn4o2YJA=;
        fh=sdkaIXJECEBdIdCQmxE1NR6RpsDYkAMG2MnfXOV6rxY=;
        b=CUbMIv4jf799ocjsXeFInpKQIiRsQYi0vOq6//NeXn3D94QCFPBrX/49zD7dNzXn0t
         d6m4xFEmbPG/9+7+Rm+4lo19M5M1wyRgLz049M8/BK8Be1jpERfxiK/7rLP5Kkn45pZI
         48fHxqU85Cq7EL8m+M0hFDG0tfK7q5US/AFZDOtMOAUX+LV/bnuCw7jD0angT1zkDzpq
         IXQ+/fr73jNQW3bGIiOnuzjTm/ZKrrqEMztk4YTE8SevWf8ZEur8qZEQTA8tH0C1xJbC
         lLAXnga8oQqqQy1oozNIlOtyhlDtZuf5sST3qOStOhuoh/W91zHzRB/PQ9YtgJuS8keK
         dlbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788773958; x=1789378758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zr2BtmB2HKSIHWFikoM0kA9i/Dq+exld/VzGn4o2YJA=;
        b=eI64qAjziMGsYzUuRpt5dk2rrN8wy7jpcnCGSk30nEimiJu832ESIYApX0rkOgTR6X
         eIf2P2Xa7o4nWDn5JccSFbcwxHelbovChPOKLVrwBQjLkww7YGiWMyLpYtifRY7VSXDl
         +OtVnMYxD+wUqnnerf9Al8HdRvefvB2RyWWUUHqHMJgUVPMUJoVJ03ejJ4FphveQ3fB3
         jNhsf/W3eX+hsA+CNkOnmCVtiZfAa8XnMVQydbrHepejAg5rb/JXvFudYo9aFqK1UZCx
         G4zJKukm8sNwMud5a6RzoZeIKB40xu9a0PtNq39ZeobN3qeGTl+oMr/AOdMgQe3bW2FJ
         cjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788773958; x=1789378758;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zr2BtmB2HKSIHWFikoM0kA9i/Dq+exld/VzGn4o2YJA=;
        b=rB/gXt9Uj7lNbx8MV3qkmbJ4F7ZeKhdduA2ylb0YMEFrReVNxHqDvIfp3SBFp/TAgL
         E6aHSK1RB24LoKSjtuvanW2IIszyPkfaAs/U1/bRf8zyqGXEoMXo5pWOsQus1p5kXT1t
         SiLKLfclaJ+6ONzC788GXYopkteLjFOWsSurTHFf0f/B9THCI3XR8B6tMe571Qld6eKq
         JhKfBmMMHGRb8pD99nGQYIgSYe08dm5cfPDROWRf+dUdp7GpvOf3e9R+cxtI+IBOGuAQ
         wkZ1o8idVrBa298rbyNWDaV7A6qZkS6CbwYQZt8LqFFmTUVSfqMWy3qdPSerjCM3KhtA
         ZgGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUyC0B1GK3/GCPSA0tGFtvDX4UWvb6ZFUesXPxJG4wUuJBEoqRjkaRyXbZoaDr6Y91bMMXv6rED9Nn+qA=@vger.kernel.org
X-Gm-Message-State: AFuF++kjgZfkw6Eg5R5Pr7vrVV4SiANwX8J8zProCVqdDQtor4waVwMz
	5Qp1UT1bmr0h0VgLQ5hVcUS6wUkQgr8MG2AWcZd5HirjKqMNvDxIRNMK1CEapy1eb4asEig0QFP
	c25TA63nF08e12ji3/u0Kjlmum8TqHhe94cEUb7pudUNhkWiGq1gWEk8gkWo=
X-Gm-Gg: AYBFou0RG/afbxJsEmjHaiJRe6Y1y6l7pAiejA37LUWfnQ12hr03BZTyWLoqnOap04U
	zq++dU2mXQVH1ranDGli/SHLs5KX+Vhhxz/sPoCv93hDNdxIqGxuk2oe9PvCgXtdqHGLAhL2Cda
	3a8LbkPkdmuQUKKE04N0OrU9vALP1eoHgWO0uySa/KRKOjmjnt8WzPJxJC+aNawwjFbeDYivx6W
	9grjtDa/b+38abpU9GpA0G6v3tI/PL7YkL2lNb1y0RH1Sq+9YPc65BZxc4nwfByWYh96eqwF8ku
	odmlMLb9Bek+LwE4SKJZy5wI7hpOiUMKKTcebSAyLuu6cMXP+Dy6zL9u5sCdZQQkcCq1jyCb9+l
	U82CRvkBETPm7FmZucPkTNEl8tGrAlnVAJmfVa1zzclbDEICahVWM6CAlszjftHV11IiOl8ruNf
	Zny79RtjCYj1Cj2/mRgX8+ixU=
X-Received: by 2002:a05:6820:8109:b0:6b7:46fa:1698 with SMTP id
 006d021491bc7-6b746fa1a1cmr11190572eaf.45.1788773956989; Mon, 07 Sep 2026
 02:39:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a7919c6.9c11d2ce.289b96.00de.GAE@google.com>
In-Reply-To: <6a7919c6.9c11d2ce.289b96.00de.GAE@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Mon, 7 Sep 2026 11:39:04 +0200
X-Gm-Features: AcwNN1XSKzNHTRwQ2rJDKQAbvZAIpfnCPs4o9vKcpTucMJ21eCV3CNqaQasXvaU
Message-ID: <CANp29Y7uYa_58N4VY92678SsqPjNAmRt2p5gyXJ_xABM4UmHnA@mail.gmail.com>
Subject: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Write in bus_for_each_drv
To: syzbot <syzbot+9cb1ac7fce4944ba9165@syzkaller.appspotmail.com>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz invalid

See the discussion at
https://lore.kernel.org/all/6a88012e.dbb3a75c.13dd47.0007.GAE@google.com/T/

On Mon, Aug 10, 2026 at 2:22=E2=80=AFAM syzbot
<syzbot+9cb1ac7fce4944ba9165@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    848acc8ffe1b Merge tag 'fsverity-for-linus' of git://git.=
k..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D1109be3258000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dcb17729fb04b1=
e3a
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D9cb1ac7fce4944b=
a9165
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e25=
5-1~exp1~20260613092250.77), Debian LLD 22.1.8
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/375d27e96ecb/dis=
k-848acc8f.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/4ba19a656b9d/vmlinu=
x-848acc8f.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/7c2a17aaee7c/b=
zImage-848acc8f.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+9cb1ac7fce4944ba9165@syzkaller.appspotmail.com
>
> Need at least one configuration in g1.
> udc pcspkr: failed to start g1: -22
> configfs-gadget.g1 gadget.33: probe with driver configfs-gadget.g1 failed=
 with error -22
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KASAN: slab-use-after-free in knode_set_klist lib/klist.c:60 [inline=
]
> BUG: KASAN: slab-use-after-free in klist_release lib/klist.c:201 [inline]
> BUG: KASAN: slab-use-after-free in kref_put include/linux/kref.h:65 [inli=
ne]
> BUG: KASAN: slab-use-after-free in klist_dec_and_del+0x386/0x3d0 lib/klis=
t.c:206
> Write of size 8 at addr ffff8880329628e0 by task syz.4.45/5977
>
> CPU: 1 UID: 0 PID: 5977 Comm: syz.4.45 Not tainted syzkaller #0 PREEMPT_{=
RT,(full)}
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 07/24/2026
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
>  print_address_description+0x55/0x1e0 mm/kasan/report.c:378
>  print_report+0x58/0x70 mm/kasan/report.c:482
>  kasan_report+0x117/0x150 mm/kasan/report.c:595
>  knode_set_klist lib/klist.c:60 [inline]
>  klist_release lib/klist.c:201 [inline]
>  kref_put include/linux/kref.h:65 [inline]
>  klist_dec_and_del+0x386/0x3d0 lib/klist.c:206
>  klist_next+0xc3/0x2f0 lib/klist.c:386
>  next_driver drivers/base/bus.c:457 [inline]
>  bus_for_each_drv+0x268/0x2f0 drivers/base/bus.c:499
>  __device_attach+0x2c7/0x450 drivers/base/dd.c:1098
>  device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
>  bus_probe_device+0x12d/0x220 drivers/base/bus.c:620
>  device_add+0x7d7/0xb80 drivers/base/core.c:3772
>  usb_add_gadget+0x47d/0x700 drivers/usb/gadget/udc/core.c:1461
>  usb_add_gadget_udc_release+0x1a4/0x1f0 drivers/usb/gadget/udc/core.c:151=
7
>  vudc_probe+0x89f/0x9d0 drivers/usb/usbip/vudc_dev.c:613
>  platform_probe+0xf9/0x190 drivers/base/platform.c:1439
>  call_driver_probe drivers/base/dd.c:-1 [inline]
>  really_probe+0x254/0xae0 drivers/base/dd.c:706
>  __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
>  device_driver_attach+0xe0/0x1d0 drivers/base/dd.c:1203
>  bind_store+0x1d3/0x220 drivers/base/bus.c:267
>  kernfs_fop_write_iter+0x3a5/0x540 fs/kernfs/file.c:345
>  new_sync_write fs/read_write.c:595 [inline]
>  vfs_write+0x61e/0xbb0 fs/read_write.c:687
>  ksys_write+0x156/0x270 fs/read_write.c:739
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fabe65ee019
> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f=
7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff=
 ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fabe4846028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> RAX: ffffffffffffffda RBX: 00007fabe6875fa0 RCX: 00007fabe65ee019
> RDX: 0000000000000006 RSI: 0000200000000140 RDI: 0000000000000004
> RBP: 00007fabe668500c R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007fabe6876038 R14: 00007fabe6875fa0 R15: 00007ffeb7f127b8
>  </TASK>
>
> Allocated by task 5978:
>  kasan_save_stack mm/kasan/common.c:57 [inline]
>  kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
>  poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
>  __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
>  kasan_kmalloc include/linux/kasan.h:263 [inline]
>  __kmalloc_cache_noprof+0x3d2/0x6b0 mm/slub.c:5489
>  _kmalloc_noprof include/linux/slab.h:988 [inline]
>  _kzalloc_noprof include/linux/slab.h:1309 [inline]
>  bus_add_driver+0x165/0x670 drivers/base/bus.c:747
>  driver_register+0x23a/0x320 drivers/base/driver.c:174
>  usb_gadget_register_driver_owner+0xf9/0x270 drivers/usb/gadget/udc/core.=
c:1752
>  gadget_dev_desc_UDC_store+0x1c9/0x2f0 drivers/usb/gadget/configfs.c:300
>  flush_write_buffer fs/configfs/file.c:207 [inline]
>  configfs_write_iter+0x33a/0x430 fs/configfs/file.c:229
>  new_sync_write fs/read_write.c:595 [inline]
>  vfs_write+0x61e/0xbb0 fs/read_write.c:687
>  ksys_write+0x156/0x270 fs/read_write.c:739
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> Freed by task 5978:
>  kasan_save_stack mm/kasan/common.c:57 [inline]
>  kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
>  kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
>  poison_slab_object mm/kasan/common.c:253 [inline]
>  __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
>  kasan_slab_free include/linux/kasan.h:235 [inline]
>  slab_free_hook mm/slub.c:2677 [inline]
>  slab_free mm/slub.c:6377 [inline]
>  kfree+0x1c5/0x6c0 mm/slub.c:6692
>  kobject_cleanup lib/kobject.c:689 [inline]
>  kobject_release lib/kobject.c:720 [inline]
>  kref_put include/linux/kref.h:65 [inline]
>  kobject_put+0x222/0x550 lib/kobject.c:737
>  bus_remove_driver+0x248/0x320 drivers/base/bus.c:834
>  usb_gadget_register_driver_owner+0x223/0x270 drivers/usb/gadget/udc/core=
.c:1774
>  gadget_dev_desc_UDC_store+0x1c9/0x2f0 drivers/usb/gadget/configfs.c:300
>  flush_write_buffer fs/configfs/file.c:207 [inline]
>  configfs_write_iter+0x33a/0x430 fs/configfs/file.c:229
>  new_sync_write fs/read_write.c:595 [inline]
>  vfs_write+0x61e/0xbb0 fs/read_write.c:687
>  ksys_write+0x156/0x270 fs/read_write.c:739
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> The buggy address belongs to the object at ffff888032962800
>  which belongs to the cache kmalloc-512 of size 512
> The buggy address is located 224 bytes inside of
>  freed 512-byte region [ffff888032962800, ffff888032962a00)
>
> The buggy address belongs to the physical page:
> page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x3296=
0
> head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> flags: 0x80000000000040(head|node=3D0|zone=3D1)
> page_type: f5(slab)
> raw: 0080000000000040 ffff88813ffb2c80 dead000000000100 dead000000000122
> raw: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
> head: 0080000000000040 ffff88813ffb2c80 dead000000000100 dead000000000122
> head: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
> head: 0080000000000002 ffffffffffffff01 00000000ffffffff 00000000ffffffff
> head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000004
> page dumped because: kasan: bad access detected
> page_owner tracks the page as allocated
> page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(=
__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), =
pid 5832, tgid 5822 (syz.0.1), ts 126620428538, free_ts 125246166491
>  set_page_owner include/linux/page_owner.h:32 [inline]
>  post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1859
>  prep_new_page mm/page_alloc.c:1867 [inline]
>  get_page_from_freelist+0x262a/0x26a0 mm/page_alloc.c:3946
>  __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5304
>  alloc_slab_page mm/slub.c:3266 [inline]
>  allocate_slab+0x79/0x5e0 mm/slub.c:3380
>  new_slab mm/slub.c:3426 [inline]
>  refill_objects+0x2d8/0x350 mm/slub.c:7310
>  refill_sheaf mm/slub.c:2804 [inline]
>  __pcs_replace_empty_main+0x330/0x690 mm/slub.c:4675
>  alloc_from_pcs mm/slub.c:4773 [inline]
>  slab_alloc_node mm/slub.c:4905 [inline]
>  __kmalloc_cache_noprof+0x468/0x6b0 mm/slub.c:5485
>  _kmalloc_noprof include/linux/slab.h:988 [inline]
>  _kzalloc_noprof include/linux/slab.h:1309 [inline]
>  userio_char_open+0x51/0x1b0 drivers/input/serio/userio.c:76
>  misc_open+0x2de/0x350 drivers/char/misc.c:163
>  chrdev_open+0x4dc/0x600 fs/char_dev.c:411
>  do_dentry_open+0x849/0x1420 fs/open.c:947
>  vfs_open+0x3b/0x350 fs/open.c:1052
>  do_open fs/namei.c:4700 [inline]
>  path_openat+0x2e60/0x3850 fs/namei.c:4863
>  do_file_open+0x23e/0x4a0 fs/namei.c:4892
>  do_sys_openat2+0x115/0x200 fs/open.c:1368
>  do_sys_open fs/open.c:1374 [inline]
>  __do_sys_openat fs/open.c:1390 [inline]
>  __se_sys_openat fs/open.c:1385 [inline]
>  __x64_sys_openat+0x138/0x170 fs/open.c:1385
> page last free pid 4960 tgid 4960 stack trace:
>  reset_page_owner include/linux/page_owner.h:25 [inline]
>  __free_pages_prepare mm/page_alloc.c:1406 [inline]
>  __free_frozen_pages+0x10e7/0x11c0 mm/page_alloc.c:2950
>  __slab_free+0x252/0x2a0 mm/slub.c:5741
>  qlink_free mm/kasan/quarantine.c:163 [inline]
>  qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
>  kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
>  __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:350
>  kasan_slab_alloc include/linux/kasan.h:253 [inline]
>  slab_post_alloc_hook mm/slub.c:4584 [inline]
>  slab_alloc_node mm/slub.c:4917 [inline]
>  __do_kmalloc_node mm/slub.c:5333 [inline]
>  __kmalloc_noprof+0x3b6/0x780 mm/slub.c:5359
>  _kmalloc_noprof include/linux/slab.h:992 [inline]
>  tomoyo_realpath_from_path+0xef/0x640 security/tomoyo/realpath.c:251
>  tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
>  tomoyo_check_open_permission+0x229/0x470 security/tomoyo/file.c:776
>  security_file_open+0xa9/0x240 security/security.c:2739
>  do_dentry_open+0x4be/0x1420 fs/open.c:924
>  vfs_open+0x3b/0x350 fs/open.c:1052
>  do_open fs/namei.c:4700 [inline]
>  path_openat+0x2e60/0x3850 fs/namei.c:4863
>  do_file_open+0x23e/0x4a0 fs/namei.c:4892
>  do_sys_openat2+0x115/0x200 fs/open.c:1368
>  do_sys_open fs/open.c:1374 [inline]
>  __do_sys_openat fs/open.c:1390 [inline]
>  __se_sys_openat fs/open.c:1385 [inline]
>  __x64_sys_openat+0x138/0x170 fs/open.c:1385
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
>
> Memory state around the buggy address:
>  ffff888032962780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>  ffff888032962800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >ffff888032962880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                                                        ^
>  ffff888032962900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>  ffff888032962980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller=
-bugs/6a7919c6.9c11d2ce.289b96.00de.GAE%40google.com.
