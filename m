Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9FB4519AA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773438; cv=pass; b=FPcBAy5ugETGjp9Q7aZDysv1ho1oe26Q6KT9bt+Fq1+TcffWJtPO9+0vRkAicSx/oFByWxOzXfdHx0T7nnB7rpf9iQt1+itARfi6FslCLWak5ifGQ8g52374w3pFC1ScITI9wr/Ee9ebYP8Ho70i8EmfDGzrG60kz7cQETmG9eA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773438; c=relaxed/simple;
	bh=ySvYBWj1kqDX260YLrGFd871sZRTFsyG1g+pJmCwDm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TLPVnLZTPUg4U9PGfwhqwlOU2FA1n3JuWZWheCf5MitsU97/zbgGu3UG1Dw92/ERo8klbsn05uBpCMqxTQ3urZodbP6l9Rk1G3As5is8k3jJplZQLGHcMbm71GtjDDi5Lyean8g0EZSU1oY3Jcd75Xgck2tk0MZ8I/O7VIIHMWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lazuvHRq; arc=pass smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lazuvHRq"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6b1b233ca98so2494022eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:30:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788773434; cv=none;
        d=google.com; s=arc-20260327;
        b=U8/CWtr/wCoUlklz3xjoBU5DzuiEkJrJgEH4jKMUyJpzAsn0kA4HlQp/5yjUdOlnB/
         5MNzxoWbOXXXESKsdc7zqf7xAxuo+fC9tZhns5s0h99nbLNKm46UABGa7OihYLSm/RSb
         NT04SYSnd8xSdiwE0VUzWxnXzrRSYgfqACUQFnBrXqrsL816rPXw2GQqiTmxgHEoWBgy
         DiaEIP9Sqs+FqCaSJcgI+CT1OmqugQOoi0eFeAjpSMLn4IjM7m1UzJLsaRwKvYcOzxZc
         sTUWDM5PVAOiY3hTsIkGLli04EsWUsAZK2/Poq7WFOaNMUzAkJHp20tWDa8ulw0avBwD
         3pdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AnzK7mPc+8L6dW3M70ul/j2wDrcv1XELkwTbyIrABKU=;
        fh=zhovVyGFQzO8sz1R9A4qGlxr8DzADYh3oeARenI0vLk=;
        b=IlZGFwva4fQxIerTCdEwO1rT+/caZmHwipP1IrgIenJMuGTMYt6CZP/RvY8nmJFqwM
         lZp7dnfz69X1K0MRPXlGxKzbv8ev9TCE5sGNWEzN8iAW4XDUKmUXbkKW7Lk0aFHKYxHq
         w7wxtIxwYGlZgFroFjVKKNN+qGf1ujZ/gCSq163r1QRDo9CPAOTwfzZbbGBUk7BAjeof
         BKh1E8czE2QvoA1YiNz2ACn6JYI52O8/msFwO1IcKo4GAplCIt7mMeoR3m1gtj1DhS/6
         qP/IEgWeOAjcv2L49f0v8nuMBbaSQ3MWNbt35kjXkUzFY9NYJpNb/kRKj/xTiel85mZw
         lInA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788773434; x=1789378234; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AnzK7mPc+8L6dW3M70ul/j2wDrcv1XELkwTbyIrABKU=;
        b=lazuvHRqYgLea8WZge3LIDgc0AZAtQsAJj9LP7YHrQnthY6twbu+4C/Kkw+n8hmj1M
         56kWtJTwkSBiPIAqVfx4ZIxTcb3WFnDOMEM2bWkxCS6FnMp+0Mod8hTfC88XQSDhsdvz
         /WWKK9khu3PG88+DPOppvkCQH95kS4KCfZSKeSXjIInGTNd0pIXfAz6VyJofMi1ekkDO
         Zzuc/9t1Np6zDdV11OiZKzgMxE6WqzS/NzPachD+jqFuASS3nLCmLVmVSW5YCYvb+YJb
         yNG/htpw/mNWPOH6reHYmbY3kGPLO9fa9DH31HJdm7EL6hnXnmzN/Dco8p9UYKQ+7zub
         9XEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788773434; x=1789378234;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AnzK7mPc+8L6dW3M70ul/j2wDrcv1XELkwTbyIrABKU=;
        b=hXKmTnfJ1KnLbbfryDLVY7KmPyiD95z2LcjRiylsd1esu1DKaJPvaFaaKH/JlmPSB0
         l/JxGOuGbNPvjsie2es3Wr/eti3+uVP8OHXznGs7Dt55KHY4NQ/wDP+6Kjy6bR3l0SJi
         w7L210Dy+zomMqgROkqXs8Y73Vt51DWZeRZ87B7ao/vG9MJ1x+3PY2XkiaCgWiMGRZ6c
         aOvrM/3VrEp+j/zO+oBmTjY3+Kv7J9JTbSeFUK+9R6F6D5Tkwgi4QRYsL+zgddnK/6Iv
         z1+XBpgxkFtgBPVZS6vQXOoVKEk5XVltiaJ4fys0LDKFZsqQB61+nDtCMnojqA0yIeFC
         Qq8g==
X-Forwarded-Encrypted: i=1; AKwUvBzvBJFwRN1JJJ36l1ZLF2LEjNSa81Zh4iFfSqkyAQXZLhfNuRHUCKXPzJtcfeJe4IwAG71iycA5zKdl8RE=@vger.kernel.org
X-Gm-Message-State: AFuF++nb/7D4VKe6zIm14q2X2tt/UGmjP4puk4w5ZMiWbAWqcw6LuOFN
	chtQyHF1Q+8qYNWRNFc79EwRV95cdYi6CaxmdardmijTaCNhL0sVIwL0GVpaHxIz5oFFxyOc2Xo
	jU6qLpx0lpS4ECANo5oqQxIgSvtOVOfW7poL7sCMlHs3zaEtHRB+jvgI+BMo=
X-Gm-Gg: AYBFou3UiOivXNRiHu58jrHXI0CnGTBQO1KiswRAnP7G+6e56ug6F8r8o1ObtveObWx
	phU/t0K5NQXFXckd+x7Eae/is6TIp3hKcGItn7mFu7qhjo2hJrFj00+hC5JM3ZSaS10oUk1Vr7R
	QLGz3LnqgFUkk0wvU8QCEw7b+lQifTevRXcusad+iWCF9pMqTVcUyrbHsCo0dd0O1HJluASse56
	XqUTOI8p9fAH/eBvr1kgjXHWOBkA5v8LxEV474GKMOfqcL0FLUS3rnt/yKlispUKGLphaKmW2HY
	p3BoUCwGu2bdWaeXKXk0cgBxgCcKMRwbLuc/kRz0hUDzFQH6qqhJZ+5S7NDr5dhFA30HnB/IW3G
	ubEGl6w96xQvslO8HBkyRDgoD9EllSZQTiwMglCHbgW27UKNbPrUdaVsdISTfziA45qEgyxKjcu
	d2AT/IVFx/ErJ2
X-Received: by 2002:a05:6820:8118:b0:6b7:8415:d78c with SMTP id
 006d021491bc7-6b78415d913mr11207771eaf.55.1788773433767; Mon, 07 Sep 2026
 02:30:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a68b426.b6659fcc.241ab8.00ea.GAE@google.com> <6a695c5e.e3659fcc.2a40b8.002e.GAE@google.com>
In-Reply-To: <6a695c5e.e3659fcc.2a40b8.002e.GAE@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Mon, 7 Sep 2026 11:30:21 +0200
X-Gm-Features: AcwNN1VNRGLnxxXRk-30wmmoTKJ11ul54sMkqzxBZGhU_qOgk-rcKmXIjDBMLTU
Message-ID: <CANp29Y49eRxwt01Kdna4y6C5RfDHNay_o2Tk5q05=4QKVhf4-g@mail.gmail.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in raw_process_ep0_io
To: syzbot <syzbot+9aacea11bc70c3ddaff2@syzkaller.appspotmail.com>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz invalid

See the discussion at
https://lore.kernel.org/all/6a88012e.dbb3a75c.13dd47.0007.GAE@google.com/T/

On Wed, Jul 29, 2026 at 3:50=E2=80=AFAM syzbot
<syzbot+9aacea11bc70c3ddaff2@syzkaller.appspotmail.com> wrote:
>
> syzbot has found a reproducer for the following issue on:
>
> HEAD commit:    cc2b5f627e8c Add linux-next specific files for 20260714
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D1312e40158000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D2290ccbf984c5=
24f
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D9aacea11bc70c3d=
daff2
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e25=
5-1~exp1~20260613092250.77), Debian LLD 22.1.8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D17ab25c1580=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D13edc03e58000=
0
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/6836f8efb1da/dis=
k-cc2b5f62.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/0109d3477cc7/vmlinu=
x-cc2b5f62.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/c2e49e350bbf/b=
zImage-cc2b5f62.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+9aacea11bc70c3ddaff2@syzkaller.appspotmail.com
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KASAN: slab-use-after-free in string[  341.221266][ T6232] BUG: KASA=
N: slab-use-after-free in string_nocheck lib/vsprintf.c:648 [inline]
> BUG: KASAN: slab-use-after-free in string[  341.221266][ T6232] BUG: KASA=
N: slab-use-after-free in string+0x216/0x2d0 lib/vsprintf.c:730
> Read of size 1 at addr ffff88802aed30e0 by task syz.0.219/6232
>
> CPU: 1 UID: 0 PID: 6232 Comm: syz.0.219 Not tainted syzkaller #0 PREEMPT_=
{RT,(full)}
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 07/16/2026
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
>  print_address_description+0x55/0x1e0 mm/kasan/report.c:378
>  print_report+0x58/0x70 mm/kasan/report.c:482
>  kasan_report+0x117/0x150 mm/kasan/report.c:595
>  string_nocheck lib/vsprintf.c:648 [inline]
>  string+0x216/0x2d0 lib/vsprintf.c:730
>  vsnprintf+0x74a/0xef0 lib/vsprintf.c:2949
>  snprintf+0xe8/0x140 lib/vsprintf.c:3047
>  set_dev_info drivers/base/core.c:4984 [inline]
>  dev_vprintk_emit+0x30f/0x400 drivers/base/core.c:4994
>  dev_printk_emit+0xee/0x140 drivers/base/core.c:5007
>  _dev_err+0x11e/0x180 drivers/base/core.c:5062
>  raw_process_ep0_io+0x531/0x990 drivers/usb/gadget/legacy/raw_gadget.c:73=
0
>  raw_ioctl_ep0_read drivers/usb/gadget/legacy/raw_gadget.c:782 [inline]
>  raw_ioctl+0x2721/0x40d0 drivers/usb/gadget/legacy/raw_gadget.c:1316
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:597 [inline]
>  __se_sys_ioctl+0xff/0x170 fs/ioctl.c:583
>  do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
>  do_syscall_64+0x17b/0x530 arch/x86/entry/syscall_64.c:85
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f4973c5db2b
> Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 4=
4 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0=
 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
> RSP: 002b:00007ffc26cc96f0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f4973c5db2b
> RDX: 00007ffc26cc9770 RSI: 00000000c0085504 RDI: 0000000000000003
> RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000003 R11: 0000000000000246 R12: 00007ffc26cc9778
> R13: 0000000000000000 R14: 00007f4973ee5fa0 R15: 00007f4973ee5fa0
>  </TASK>
>
> Allocated by task 6231:
>  kasan_save_stack mm/kasan/common.c:57 [inline]
>  kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
>  poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
>  __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
>  kasan_kmalloc include/linux/kasan.h:263 [inline]
>  __do_kmalloc_node mm/slub.c:5339 [inline]
>  __kmalloc_node_track_caller_noprof+0x566/0x7b0 mm/slub.c:5468
>  kvasprintf+0xeb/0x1a0 lib/kasprintf.c:25
>  kobject_set_name_vargs+0x61/0x110 lib/kobject.c:274
>  dev_set_name+0xe2/0x140 drivers/base/core.c:3560
>  usb_add_gadget+0x475/0x700 drivers/usb/gadget/udc/core.c:1459
>  usb_add_gadget_udc_release+0x1a4/0x1f0 drivers/usb/gadget/udc/core.c:151=
7
>  dummy_udc_probe+0x6e1/0x7e0 drivers/usb/gadget/udc/dummy_hcd.c:1103
>  platform_probe+0xf9/0x190 drivers/base/platform.c:1494
>  call_driver_probe drivers/base/dd.c:-1 [inline]
>  really_probe+0x254/0xae0 drivers/base/dd.c:706
>  __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
>  device_driver_attach+0xe0/0x1d0 drivers/base/dd.c:1203
>  bind_store+0x1d3/0x220 drivers/base/bus.c:267
>  kernfs_fop_write_iter+0x3a5/0x540 fs/kernfs/file.c:345
>  new_sync_write fs/read_write.c:595 [inline]
>  vfs_write+0x61e/0xbb0 fs/read_write.c:687
>  ksys_write+0x156/0x270 fs/read_write.c:739
>  do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
>  do_syscall_64+0x17b/0x530 arch/x86/entry/syscall_64.c:85
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> Freed by task 6233:
>  kasan_save_stack mm/kasan/common.c:57 [inline]
>  kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
>  kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
>  poison_slab_object mm/kasan/common.c:253 [inline]
>  __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
>  kasan_slab_free include/linux/kasan.h:235 [inline]
>  slab_free_hook mm/slub.c:2706 [inline]
>  slab_free mm/slub.c:6388 [inline]
>  kfree+0x1c5/0x6c0 mm/slub.c:6703
>  kobject_cleanup lib/kobject.c:695 [inline]
>  kobject_release lib/kobject.c:720 [inline]
>  kref_put include/linux/kref.h:65 [inline]
>  kobject_put+0x267/0x550 lib/kobject.c:737
>  device_remove drivers/base/dd.c:616 [inline]
>  __device_release_driver drivers/base/dd.c:1349 [inline]
>  device_release_driver_internal+0x48b/0x880 drivers/base/dd.c:1372
>  unbind_store+0x1a4/0x1d0 drivers/base/bus.c:244
>  kernfs_fop_write_iter+0x3a5/0x540 fs/kernfs/file.c:345
>  new_sync_write fs/read_write.c:595 [inline]
>  vfs_write+0x61e/0xbb0 fs/read_write.c:687
>  ksys_write+0x156/0x270 fs/read_write.c:739
>  do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
>  do_syscall_64+0x17b/0x530 arch/x86/entry/syscall_64.c:85
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> The buggy address belongs to the object at ffff88802aed30e0
>  which belongs to the cache kmalloc-16 of size 16
> The buggy address is located 0 bytes inside of
>  freed 16-byte region [ffff88802aed30e0, ffff88802aed30f0)
>
> The buggy address belongs to the physical page:
> page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2aed=
3
> flags: 0x80000000000000(node=3D0|zone=3D1)
> page_type: f5(slab)
> raw: 0080000000000000 ffff88813fe37640 dead000000000100 dead000000000122
> raw: 0000000000000000 0000000800800080 00000000f5000000 0000000000000000
> page dumped because: kasan: bad access detected
> page_owner tracks the page as allocated
> page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(=
GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, =
tgid 1 (swapper/0), ts 13143981484
>  set_page_owner include/linux/page_owner.h:33 [inline]
>  post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1871
>  prep_new_page mm/page_alloc.c:1879 [inline]
>  get_page_from_freelist+0x264c/0x26c0 mm/page_alloc.c:3955
>  __alloc_frozen_pages_noprof+0x222/0x5b0 mm/page_alloc.c:5394
>  alloc_slab_page mm/slub.c:3295 [inline]
>  allocate_slab+0x7c/0x5e0 mm/slub.c:3410
>  new_slab mm/slub.c:3456 [inline]
>  refill_objects+0x2d8/0x350 mm/slub.c:7321
>  refill_sheaf mm/slub.c:2833 [inline]
>  __pcs_replace_empty_main+0x330/0x690 mm/slub.c:4699
>  alloc_from_pcs mm/slub.c:4775 [inline]
>  slab_alloc_node mm/slub.c:4909 [inline]
>  __do_kmalloc_node mm/slub.c:5338 [inline]
>  __kmalloc_node_track_caller_noprof+0x616/0x7b0 mm/slub.c:5468
>  __kmemdup_nul mm/util.c:64 [inline]
>  kstrdup+0x42/0x100 mm/util.c:84
>  __kernfs_new_node+0xac/0xa70 fs/kernfs/dir.c:661
>  kernfs_new_node fs/kernfs/dir.c:751 [inline]
>  kernfs_create_dir_ns+0xfe/0x230 fs/kernfs/dir.c:1120
>  sysfs_create_dir_ns+0x12f/0x2a0 fs/sysfs/dir.c:59
>  create_dir lib/kobject.c:73 [inline]
>  kobject_add_internal+0x62c/0xce0 lib/kobject.c:240
>  kobject_add_varg lib/kobject.c:374 [inline]
>  kobject_add+0x163/0x240 lib/kobject.c:426
>  device_add+0x3fa/0xb80 drivers/base/core.c:3695
>  usb_add_gadget+0x47d/0x700 drivers/usb/gadget/udc/core.c:1461
>  usb_add_gadget_udc_release+0x1a4/0x1f0 drivers/usb/gadget/udc/core.c:151=
7
> page_owner free stack trace missing
>
> Memory state around the buggy address:
>  ffff88802aed2f80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>  ffff88802aed3000: fa fb fc fc 00 02 fc fc fa fb fc fc 00 05 fc fc
> >ffff88802aed3080: 00 05 fc fc 00 05 fc fc fa fb fc fc fa fb fc fc
>                                                        ^
>  ffff88802aed3100: 00 02 fc fc 00 02 fc fc 00 02 fc fc 00 01 fc fc
>  ffff88802aed3180: 00 05 fc fc 00 05 fc fc 00 05 fc fc 00 05 fc fc
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
> ---
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller=
-bugs/6a695c5e.e3659fcc.2a40b8.002e.GAE%40google.com.
