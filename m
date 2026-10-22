Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792685855;
	b=1WjZeo49e7zvYgfgUHJV6hjlb2EW23bcRZ2+K/qPMICcgUky2dhs/2orgvDDe8osN1cn
	 4M8f7sgs7mEdouWpAns7ezJKN9n/es68HNTZpNke7TduvoTG7gcq9BDzAyttSVptYCNC5
	 0AxC1WcD+xrN8ADPz9jp5tN/96CWL/skeGrFbBNxgxpIiCGzvAA5Ju+S0+QXOwmgrapj1
	 7VjSutNUBdX/1tawEORNsHbVOTbdqRwcQdsMeGmX03m0MjvKRkEa0A/gQ+NE0xPpqfrdp
	 wkC9pCQNXt+QPFG9kK+vIgi3Our+tpUto0e0cflUePHvuBkw0P72fs3lIc7daIc2qEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685855;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type:Content-Transfer-Encoding;
	bh=5HOxdA60brS5/vE87VoiaV9Lf/Ck3aNReGrQMOrjtAc=;
	b=vlq2FwyxE9FW2o/7umBuRPE0h3F6WbaiPiAXrRz58egVj6o4hLWBRIte37+0D+9X+QTC
	 UOB3XlJ3AmeUNd6uV0o4X/ID2hI6sqyi3POOTc8bXSyma7lbgjTfcwwrPNO73fww9ZNJH
	 rs1vmp+e03HdZqAec5gDdTdoZVr8EeO6nYgXxDXqOTqrkJQZt7zTR/HDaG9oyhKSDbiHU
	 kkFSUZOUmsVGpC6XI0gMgVw+PqC2KiXbxNxnXisrh7ymr1oR51tw0glg0vpg4RPbAwsze
	 Bl/dEFykVyY+RZzflfHfwmqY/Vl1P2C65YM8sUahUFIjEruxsQUdd92p+WpTsW8OpvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.70
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671BB606A323
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 671BB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-44899f99756so14361fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792685854; x=1793290654;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5HOxdA60brS5/vE87VoiaV9Lf/Ck3aNReGrQMOrjtAc=;
        b=lq3ofOgEDwXOixL2PxjVpeh0e7UoIQE2EVrbEDvZbocfFM/TYnVVUeRR0CebR+0ygn
         /Ceptxv5duUmB3HxxFZtFs+ocy9PBEx7JTuSBNzqylQ0+UiPA0aDsIEI0+6rzd5LpF2J
         EXom/fYkwcY8EyaIfaINDCF9SPG8E6GWiDxdI3cH978kY4foF5rbyJThHXOdNlfvKhHt
         +L6sfkn/80ua1/uD6P+hQn7AGd+6GMXwojHRJG7UHJYjUKRnmIYbEcOBVcMi5Qy9C2PI
         HjspZJxVINfF2NEGIGYV9r7kYPUlvzw9I8kSq1R4uaf1tuZqJudfNFj4luNYavRTGN8E
         +7Jw==
X-Gm-Message-State: AFq9FYL8bicud6VnmI7cpE9WXXd/gkWBzjtj+i2XHXzssbR2E3UpYVYF
	P12DzL7d6wNzilqZ5xUb+FHKNJ8zmJI6g7f9FqHI0zOJ5pAaxgYtl4umv5fyOl8bx2jkvZ+4bNx
	1cBfs9bbPFo8WwVnscjItJ4EMcMkgiqoogPPq4sI0wv0YmS/ksPmxe2eucqU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:14cf:b0:4fb:90ae:2b0c with SMTP id
 5614622812f47-55366181fccmr4037751b6e.68.1792685854466; Thu, 22 Oct 2026
 09:17:34 -0700 (PDT)
Date: Thu, 22 Oct 2026 09:17:34 -0700
In-Reply-To: <6ad958f5.16f08417.1cb7b7.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ada371e.3ebfcf67.79b0c.0097.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [media?] [usb?] kernel BUG in v4l2_device_put
From: syzbot <syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [media?] [usb?] kernel BUG in v4l2_device_put
Author: neganhat@gmail.com

#syz test: linux-next 8f7df005a756

On Thu, Oct 22, 2026 at 9:52=E2=80=AFPM Nh=E1=BA=ADt Anh Nguy=E1=BB=85n Duy=
 <neganhat@gmail.com> wrote:
>
> #syz test: linux-next 8f7df005a756
>
> On Thu, Oct 22, 2026 at 9:08=E2=80=AFPM syzbot
> <syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot has tested the proposed patch but the reproducer is still trigge=
ring an issue:
> > KASAN: slab-use-after-free Read in v4l2_release
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > BUG: KASAN: slab-use-after-free in v4l2_device_supports_requests includ=
e/media/v4l2-device.h:252 [inline]
> > BUG: KASAN: slab-use-after-free in v4l2_release+0xfe/0x350 drivers/medi=
a/v4l2-core/v4l2-dev.c:466
> > Read of size 8 at addr ffff888035785b10 by task v4l_id/7282
> >
> > CPU: 1 UID: 0 PID: 7282 Comm: v4l_id Not tainted syzkaller #0 PREEMPT(f=
ull)
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS=
 Google 10/07/2026
> > Call Trace:
> >  <TASK>
> >  dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
> >  print_address_description+0x55/0x1e0 mm/kasan/report.c:378
> >  print_report+0x58/0x70 mm/kasan/report.c:482
> >  kasan_report+0x117/0x150 mm/kasan/report.c:595
> >  v4l2_device_supports_requests include/media/v4l2-device.h:252 [inline]
> >  v4l2_release+0xfe/0x350 drivers/media/v4l2-core/v4l2-dev.c:466
> >  __fput+0x408/0xa40 fs/file_table.c:513
> >  fput_close_sync+0x11f/0x240 fs/file_table.c:619
> >  filp_close_sync fs/open.c:1897 [inline]
> >  __do_sys_close fs/open.c:2153 [inline]
> >  __se_sys_close+0xa2/0x160 fs/open.c:2140
> >  do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
> >  do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
> >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> > RIP: 0033:0x7f4a56ca7407
> > Code: 48 89 fa 4c 89 df e8 38 aa 00 00 8b 93 08 03 00 00 59 5e 48 83 f8=
 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f =
80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
> > RSP: 002b:00007ffcfee18b00 EFLAGS: 00000202 ORIG_RAX: 0000000000000003
> > RAX: ffffffffffffffda RBX: 00007f4a57357880 RCX: 00007f4a56ca7407
> > RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000003
> > RBP: 00007f4a573576e8 R08: 0000000000000000 R09: 0000000000000000
> > R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000013
> > R13: 00007ffcfee18d30 R14: 00007f4a5745c000 R15: 0000557c8543f4d8
> >  </TASK>
> >
> > Allocated by task 5749:
> >  kasan_save_stack mm/kasan/common.c:57 [inline]
> >  kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
> >  poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
> >  __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:426
> >  kasan_kmalloc include/linux/kasan.h:263 [inline]
> >  __kmalloc_cache_noprof+0x31c/0x600 mm/slub.c:5680
> >  _kmalloc_noprof include/linux/slab.h:991 [inline]
> >  _kzalloc_noprof include/linux/slab.h:1312 [inline]
> >  em28xx_media_device_init drivers/media/usb/em28xx/em28xx-cards.c:3757 =
[inline]
> >  em28xx_init_dev+0x857/0x2680 drivers/media/usb/em28xx/em28xx-cards.c:3=
947
> >  em28xx_usb_probe+0x17b2/0x2dd0 drivers/media/usb/em28xx/em28xx-cards.c=
:4324
> >  usb_probe_interface+0x751/0xe00 drivers/usb/core/driver.c:399
> >  call_driver_probe drivers/base/dd.c:-1 [inline]
> >  really_probe+0x254/0xae0 drivers/base/dd.c:707
> >  __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:869
> >  driver_probe_device+0x4f/0x240 drivers/base/dd.c:899
> >  __device_attach_driver+0x270/0x410 drivers/base/dd.c:1027
> >  bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:503
> >  __device_attach+0x2bd/0x430 drivers/base/dd.c:1131
> >  device_initial_probe+0x9c/0x100 drivers/base/dd.c:1190
> >  __bus_probe_device+0x126/0x220 drivers/base/bus.c:617
> >  device_add+0x7d7/0xb80 drivers/base/core.c:3776
> >  usb_set_configuration+0x1bb5/0x2260 drivers/usb/core/message.c:2280
> >  usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
> >  usb_probe_device+0x1c3/0x3b0 drivers/usb/core/driver.c:293
> >  call_driver_probe drivers/base/dd.c:-1 [inline]
> >  really_probe+0x254/0xae0 drivers/base/dd.c:707
> >  __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:869
> >  driver_probe_device+0x4f/0x240 drivers/base/dd.c:899
> >  __device_attach_driver+0x270/0x410 drivers/base/dd.c:1027
> >  bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:503
> >  __device_attach+0x2bd/0x430 drivers/base/dd.c:1131
> >  device_initial_probe+0x9c/0x100 drivers/base/dd.c:1190
> >  __bus_probe_device+0x126/0x220 drivers/base/bus.c:617
> >  device_add+0x7d7/0xb80 drivers/base/core.c:3776
> >  usb_new_device+0x9aa/0x1690 drivers/usb/core/hub.c:2713
> >  hub_port_connect drivers/usb/core/hub.c:5585 [inline]
> >  hub_port_connect_change drivers/usb/core/hub.c:5725 [inline]
> >  port_event drivers/usb/core/hub.c:5889 [inline]
> >  hub_event+0x28e8/0x4d30 drivers/usb/core/hub.c:5971
> >  process_one_work kernel/workqueue.c:3495 [inline]
> >  process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3578
> >  worker_thread+0xa47/0xfb0 kernel/workqueue.c:3659
> >  kthread+0x38b/0x480 kernel/kthread.c:436
> >  ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
> >  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> >
> > Freed by task 5749:
> >  kasan_save_stack mm/kasan/common.c:57 [inline]
> >  kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
> >  kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
> >  poison_slab_object mm/kasan/common.c:264 [inline]
> >  __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:296
> >  kasan_slab_free include/linux/kasan.h:235 [inline]
> >  slab_free_hook mm/slub.c:2780 [inline]
> >  slab_free mm/slub.c:6630 [inline]
> >  kfree+0x1c5/0x650 mm/slub.c:6923
> >  em28xx_unregister_media_device drivers/media/usb/em28xx/em28xx-cards.c=
:3779 [inline]
> >  em28xx_release_resources+0xde/0x240 drivers/media/usb/em28xx/em28xx-ca=
rds.c:3798
> >  em28xx_usb_disconnect+0x19f/0x2f0 drivers/media/usb/em28xx/em28xx-card=
s.c:4493
> >  usb_unbind_interface+0x295/0x9c0 drivers/usb/core/driver.c:460
> >  device_remove drivers/base/dd.c:619 [inline]
> >  __device_release_driver drivers/base/dd.c:1357 [inline]
> >  device_release_driver_internal+0x48d/0x7d0 drivers/base/dd.c:1380
> >  bus_remove_device+0x444/0x560 drivers/base/bus.c:681
> >  device_del+0x524/0x8f0 drivers/base/core.c:3965
> >  usb_disable_device+0x3d4/0x8d0 drivers/usb/core/message.c:1484
> >  usb_disconnect+0x346/0x9a0 drivers/usb/core/hub.c:2355
> >  hub_port_connect drivers/usb/core/hub.c:5425 [inline]
> >  hub_port_connect_change drivers/usb/core/hub.c:5725 [inline]
> >  port_event drivers/usb/core/hub.c:5889 [inline]
> >  hub_event+0x1bbb/0x4d30 drivers/usb/core/hub.c:5971
> >  process_one_work kernel/workqueue.c:3495 [inline]
> >  process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3578
> >  worker_thread+0xa47/0xfb0 kernel/workqueue.c:3659
> >  kthread+0x38b/0x480 kernel/kthread.c:436
> >  ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
> >  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> >
> > The buggy address belongs to the object at ffff888035785800
> >  which belongs to the cache kmalloc-1k of size 1024
> > The buggy address is located 784 bytes inside of
> >  freed 1024-byte region [ffff888035785800, ffff888035785c00)
> >
> > The buggy address belongs to the physical page:
> > page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x35=
780
> > head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> > flags: 0xfff00000000040(head|node=3D0|zone=3D1|lastcpupid=3D0x7ff)
> > page_type: f5(slab)
> > raw: 00fff00000000040 ffff88813ff2bdc0 dead000000000100 dead00000000012=
2
> > raw: 0000000000000000 0000000000100010 00000000f5000000 000000000000000=
0
> > head: 00fff00000000040 ffff88813ff2bdc0 dead000000000100 dead0000000001=
22
> > head: 0000000000000000 0000000000100010 00000000f5000000 00000000000000=
00
> > head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffff=
ff
> > head: ffffffffffffffff 0000000000000000 00000000ffffffff 00000000000000=
08
> > page dumped because: kasan: bad access detected
> > page_owner tracks the page as allocated
> > page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd282=
0(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1=
62, tgid 162 (kworker/u8:7), ts 176383093465
> >  set_page_owner include/linux/page_owner.h:33 [inline]
> >  post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1856
> >  prep_new_page mm/page_alloc.c:1864 [inline]
> >  get_page_from_freelist+0x220f/0x2280 mm/page_alloc.c:3935
> >  __alloc_frozen_pages_noprof+0x1fe/0x410 mm/page_alloc.c:5459
> >  alloc_slab_page mm/slub.c:3384 [inline]
> >  allocate_slab+0x7d/0x5e0 mm/slub.c:3499
> >  new_slab mm/slub.c:3550 [inline]
> >  refill_objects+0x2d5/0x350 mm/slub.c:7539
> >  refill_sheaf mm/slub.c:2917 [inline]
> >  __pcs_replace_empty_main+0x2c8/0x6c0 mm/slub.c:4811
> >  alloc_from_pcs mm/slub.c:4887 [inline]
> >  slab_alloc_node mm/slub.c:5021 [inline]
> >  __do_kmalloc_node mm/slub.c:5530 [inline]
> >  __kmalloc_noprof+0x476/0x710 mm/slub.c:5556
> >  _kmalloc_noprof include/linux/slab.h:995 [inline]
> >  _kzalloc_noprof include/linux/slab.h:1312 [inline]
> >  ieee802_11_parse_elems_full+0x14b/0x2a10 net/mac80211/parse.c:1077
> >  ieee802_11_parse_elems net/mac80211/ieee80211_i.h:2583 [inline]
> >  ieee80211_rx_mgmt_probe_beacon net/mac80211/ibss.c:1542 [inline]
> >  ieee80211_ibss_rx_queued_mgmt+0x509/0x2c40 net/mac80211/ibss.c:1573
> >  ieee80211_iface_process_skb net/mac80211/iface.c:1805 [inline]
> >  ieee80211_iface_work+0x769/0xfa0 net/mac80211/iface.c:1859
> >  cfg80211_wiphy_work+0x29e/0x420 net/wireless/core.c:610
> >  process_one_work kernel/workqueue.c:3495 [inline]
> >  process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3578
> >  worker_thread+0xa47/0xfb0 kernel/workqueue.c:3659
> >  kthread+0x38b/0x480 kernel/kthread.c:436
> >  ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
> >  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> > page last free pid 31 tgid 31 ts 176051931514 stack trace:
> >  reset_page_owner include/linux/page_owner.h:26 [inline]
> >  __free_pages_prepare mm/page_alloc.c:1403 [inline]
> >  __free_frozen_pages+0xc97/0xd90 mm/page_alloc.c:2954
> >  __slab_free+0x269/0x2c0 mm/slub.c:5926
> >  qlink_free mm/kasan/quarantine.c:163 [inline]
> >  qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
> >  kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
> >  __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:361
> >  kasan_slab_alloc include/linux/kasan.h:253 [inline]
> >  slab_post_alloc_hook mm/slub.c:4720 [inline]
> >  slab_alloc_node mm/slub.c:5033 [inline]
> >  __kmalloc_cache_noprof+0x29a/0x600 mm/slub.c:5676
> >  _kmalloc_noprof include/linux/slab.h:991 [inline]
> >  dummy_urb_enqueue+0x7c/0x7a0 drivers/usb/gadget/udc/dummy_hcd.c:1327
> >  usb_hcd_submit_urb+0x328/0x1b60 drivers/usb/core/hcd.c:1543
> >  usb_start_wait_urb+0x13f/0x5b0 drivers/usb/core/message.c:62
> >  usb_internal_control_msg drivers/usb/core/message.c:117 [inline]
> >  usb_control_msg+0x234/0x3e0 drivers/usb/core/message.c:167
> >  get_bMaxPacketSize0 drivers/usb/core/hub.c:4869 [inline]
> >  hub_port_init+0xb0b/0x28c0 drivers/usb/core/hub.c:5065
> >  hub_port_connect drivers/usb/core/hub.c:5514 [inline]
> >  hub_port_connect_change drivers/usb/core/hub.c:5725 [inline]
> >  port_event drivers/usb/core/hub.c:5889 [inline]
> >  hub_event+0x24e8/0x4d30 drivers/usb/core/hub.c:5971
> >  process_one_work kernel/workqueue.c:3495 [inline]
> >  process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3578
> >  worker_thread+0xa47/0xfb0 kernel/workqueue.c:3659
> >  kthread+0x38b/0x480 kernel/kthread.c:436
> >  ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
> >
> > Memory state around the buggy address:
> >  ffff888035785a00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >  ffff888035785a80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > >ffff888035785b00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >                          ^
> >  ffff888035785b80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >  ffff888035785c00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >
> > Tested on:
> >
> > commit:         8f7df005 Add linux-next specific files for 20261020
> > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linu=
x-next.git
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D120a9fa9580=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D9c1b9b13e3e=
4ce1a
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D809dfc586f33f=
c44b6ac
> > compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.=
1.8
> > patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D17b7b50d=
580000
> >
