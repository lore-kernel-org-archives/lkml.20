Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3884A3F13
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859254; cv=pass; b=k+OE86DJMeFgnSGCqxvDI2OhHYoYATctCofPCjhdX1PZ5khkCidvDsqYoZOlyO4XAkoIVaKZHE9KX2UVOHf6bwaET9ehPJVSYhXA2Y3EHAcg4zXfj9EBP0PnCzhPaIJiU4XkVk37TiTFSwesTzme/HN2cs+kisojlMqjHJRJKuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859254; c=relaxed/simple;
	bh=yIIF6mWj7bFOlkRHS/id1/tsCjS5b0FbY63g4oGRkyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=euHklllpZv6JMxvivdU8jcqXn7s1pSFZqd6N/EMOOGCOxkhumkkpEbha8XSYfwjmqOZe9djq2CU47u5charH5lEqPvJ5Xlm4la/F+x1QpcB6CmxPTPBhmahdUMyxiy+yoC0JDlyrtD8lDW9LuZgjdD/SuynwUl10oT4ctfVGn78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TngFPzoA; arc=pass smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TngFPzoA"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-469d76ce704so3870535fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:20:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788859252; cv=none;
        d=google.com; s=arc-20260327;
        b=TAHFrur2Pa73p3lY5HTZGNPeF/5HgDgArzQOAnY9Xb0RZenDcSxiSJNENHQ/uezsuJ
         ALL+DBpqsWcWf1WlCjDB2BaUzt9XjtypZwyujf5yOyEoYQAS7FhrxMRLjrUGz0DwzRqW
         FTyeY3QoHf47dvsv/QjiS7/1y+Ic1Js/JwL/FMtJg7BrsCULazizqM0LOb3vnE1Dx0kd
         N2CyLdxnRL5v5jxtRZ0hyEQSeKiWxe3SGDanrFEHbEMOSyYfQqHIff05sgPnDjvPnFQm
         bmCQrX6rpJLl8DN4937/xuWGoPLAKOpgCHKC6hq7vZ7DXKH8aDzOaG9xmu4pgkfj3YP+
         sf4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JPmm4yb2QVFN512dzs7NfWwHg+ryNuSig79rVbbhJeg=;
        fh=8SJFnwiRchyIpwBidh47bBBVyMKBj5NTpOjNQ4FCAiE=;
        b=kOEzTXqAxArknIBOownRxwyIp7X3Xsyn2z6IXxO5UbSqvspF4HJqZt6Q1e6pkr6iFg
         kkP7X7J2Wo27e7DLgLnDqAJkxISamBGG8hl+fjNZpl9c5mlGe2ilc8ltEMGZE1tfcd0M
         iwvOtbpTReRzS/VcspWRkyhczmAKcdf09NydgOf3ahFXifWDAotZOLNtGOysucZupq9u
         1EheQLwRVCi0tYNcYdsri4RjLMoiD8jIbLteF9f5p4IPFo+caJfJ6RO94qNoviF6B8SR
         6c0ZHz8pV5D2IhxZXaDCrFLHHE6bND8435eJY2FusnBYOPlr7vl2MRR+QFJErRRKoIpe
         cT5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788859252; x=1789464052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JPmm4yb2QVFN512dzs7NfWwHg+ryNuSig79rVbbhJeg=;
        b=TngFPzoAnX91MYg07T80coAOpoK48B5VZzN89EG4vS+eip4ifeyKkFR/Iv1T9EfsZQ
         MLEoCdyRutaoAuJQKfsm7CZFb6in6xjov/zFpxKi3vksc73D5LDCJwU2m/eaufdXah9v
         foe9bevMgkDli1LBMsEmf+XSPHbQkNiBjgDyq68SGjqkdiUEKjZt1gP9JMviZXgdJmLH
         ZY5zqBDcnto1gT5TZAXDRetK4CfMwX470neO+8mB7t0doXQLASY5W8dl6LK/Iaf2f4cb
         7aS+jYbHeB/9ZoRFk3vA+8AADKGFlhNTBP6JpUOWJp1TqANP2MkR7S9dl4Ieu3CwN9tk
         hFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859252; x=1789464052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JPmm4yb2QVFN512dzs7NfWwHg+ryNuSig79rVbbhJeg=;
        b=YqM5iGV2X/1yNTALC1tXDnxl03HnhIpaY7JxVCiZMDS3wQdy+FV7Wo7D5YglsBIdyQ
         nC+gpxP2pJQ9jedFlQ8OhOMRGT9Pv3LFe5jIkDNA47p5dPENDo1HRmTCvcrL6Ze1uhIL
         6uM/tSR2FqBkmKZNzYVdRRCzhNs4Zw2qRpFlseAphV9vNQO1sDilXjj8qV6zT2nrsTtj
         vsCQ1mluWDRXDv5qhFNYr/nN4mxsaBgej3NDnyPn7POgcP3VvMk99jxpklyInTlJX8QE
         1UpBf6VIkDLRQ2v/IKfjZUZuQQ175FGJwOhWxpwEpIRyCZHCaQ7WNF6TnF+5rGe8Fesx
         a8PQ==
X-Gm-Message-State: AFuF++nuoM2EYg9R8zIArD9Bo0fM0vGsxMGLZ85Ef1olEY8X46KxvhUr
	zhjDcMgHqekIXi3grtgxo3tP8hgRBXh306eedCywlyvLRL0rTU2CPmfDtPCHW9BGrs+O6Pd/isf
	DoYAaZ+VNZfwucb3ERIXz4BnAkBs182U3vZzFqU0y
X-Gm-Gg: AYBFou16Ubv0zTIOIxQngUS4DNGd0v/Zc7DHogZkDLKS/P9YqkPkfqmNgTpq6/fBC61
	A4Qk1tCERERnzG7KOVsTGxe2wZfty42rEkq5ZvVPRKK4kYdPgW2MyLImONpSNg3GqEu5rB5Y3DG
	kDuEVTogtDnbXNMCGCz0z7N7dOG8otc9DNZnSOOeuZEcp81ZBrm0ko4Ry8khsu5csXQoEcxWfMa
	EIqAQbM78EEUSZwfxE/Cde+E54wq97R09+JnK6HNRNkKO6dYQkXhZ0QK9DDPu0fJmQtH9BQiwJE
	gokRVEgXKiU8dBdlzboShuw7APUgk6OUBxYzignQWZMA6P/BWqITrVgkPN/C9kEaQbZznYDV4wX
	Hz53oPetgzMyeG7rrWmtzKTlVETVyTdawzurMfwJ6XkmIOYPdyqqDiAZd8gr/kjeVSaovBnxpYz
	oWTGqePxPLbGUD8+NWDWMMo/g=
X-Received: by 2002:a05:6870:2428:b0:475:e066:7710 with SMTP id
 586e51a60fabf-475e0669528mr15009402fac.23.1788859251481; Tue, 08 Sep 2026
 02:20:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a6d41a2.f794c993.27aeb.000c.GAE@google.com>
In-Reply-To: <6a6d41a2.f794c993.27aeb.000c.GAE@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Tue, 8 Sep 2026 11:20:38 +0200
X-Gm-Features: AcwNN1V0FoR_1AjF2Sm23QHM57J02nkiWaKo1wPvp7LIcN7pGbi73d7hWk5HPr4
Message-ID: <CANp29Y7hdnCDumUT+BwtaiNrYjoQnQK12LPLf4Oh4pTFQsS8AA@mail.gmail.com>
Subject: Re: [syzbot] [usb?] general protection fault in mon_notify
To: syzbot <syzbot+5f4b29d9fe710a964482@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz invalid

See the discussion at
https://lore.kernel.org/all/6a88012e.dbb3a75c.13dd47.0007.GAE@google.com/T/

On Sat, Aug 1, 2026 at 2:45=E2=80=AFAM syzbot
<syzbot+5f4b29d9fe710a964482@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    62cc90241548 Merge tag 'mm-hotfixes-stable-2026-07-27-14-=
1..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D156affde58000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D145fa60d73086=
782
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D5f4b29d9fe710a9=
64482
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for D=
ebian) 2.44
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D131be449580=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D1467e49958000=
0
>
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d=
900f083ada3/non_bootable_disk-62cc9024.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/b10a9ae7e3d1/vmlinu=
x-62cc9024.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/b89124d39495/b=
zImage-62cc9024.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+5f4b29d9fe710a964482@syzkaller.appspotmail.com
>
> dummy_hcd dummy_hcd.0: remove, state 4
> usb usb5: USB disconnect, device number 1
> dummy_hcd dummy_hcd.0: stopped
> dummy_hcd dummy_hcd.0: USB bus 5 deregistered
> Oops: general protection fault, probably for non-canonical address 0xdfff=
fc0000000001: 0000 [#1] SMP KASAN NOPTI
> KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
> CPU: 0 UID: 0 PID: 5954 Comm: syz.0.42 Not tainted syzkaller #0 PREEMPT(f=
ull)
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.=
16.3-2 04/01/2014
> RIP: 0010:__list_del_entry_valid_or_report+0x20/0x1d0 lib/list_debug.c:49
> Code: 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 48 b8 00 00 00 00 00 fc f=
f df 41 54 55 53 48 89 fb 48 83 c7 08 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f=
 85 5b 01 00 00 48 89 da 48 8b 6b 08 48 b8 00 00 00
> RSP: 0018:ffffc9000374fa20 EFLAGS: 00010202
> RAX: dffffc0000000000 RBX: 0000000000000000 RCX: fffff520006e9f22
> RDX: 0000000000000001 RSI: ffffffff8c401500 RDI: 0000000000000008
> RBP: ffff88802ff87000 R08: 0000000000000000 R09: fffffbfff2244efa
> R10: ffffc9000374fa40 R11: 0000000000000000 R12: 00000000fffffffe
> R13: ffff88802ff870e8 R14: 0000000000000008 R15: 0000000000000000
> FS:  000055556cf07500(0000) GS:ffff8880d5ddc000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fc48295da08 CR3: 000000003cd5d000 CR4: 0000000000352ef0
> Call Trace:
>  <TASK>
>  __list_del_entry_valid include/linux/list.h:132 [inline]
>  __list_del_entry include/linux/list.h:246 [inline]
>  list_del include/linux/list.h:260 [inline]
>  mon_bus_remove drivers/usb/mon/mon_main.c:203 [inline]
>  mon_notify+0x84/0x480 drivers/usb/mon/mon_main.c:222
>  notifier_call_chain+0x99/0x3f0 kernel/notifier.c:85
>  blocking_notifier_call_chain kernel/notifier.c:380 [inline]
>  blocking_notifier_call_chain+0x69/0xa0 kernel/notifier.c:368
>  usb_remove_hcd.cold+0x25f/0x401 drivers/usb/core/hcd.c:3084
>  dummy_hcd_remove+0x109/0x1e0 drivers/usb/gadget/udc/dummy_hcd.c:2761
>  platform_remove+0x5f/0x80 drivers/base/platform.c:1456
>  device_remove+0xcb/0x180 drivers/base/dd.c:616
>  __device_release_driver drivers/base/dd.c:1349 [inline]
>  device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
>  unbind_store+0xf8/0x110 drivers/base/bus.c:244
>  drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
>  sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
>  kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
>  new_sync_write fs/read_write.c:595 [inline]
>  vfs_write+0x6ac/0x1050 fs/read_write.c:687
>  ksys_write+0x12a/0x250 fs/read_write.c:739
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fc481b9de99
> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f=
7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff=
 ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007ffd993809e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> RAX: ffffffffffffffda RBX: 00007fc481e25fa0 RCX: 00007fc481b9de99
> RDX: 000000000000000b RSI: 0000200000000200 RDI: 0000000000000003
> RBP: 00007fc481c33eaf R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007fc481e25fac R14: 00007fc481e25fa0 R15: 00007fc481e25fa0
>  </TASK>
> Modules linked in:
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:__list_del_entry_valid_or_report+0x20/0x1d0 lib/list_debug.c:49
> Code: 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 48 b8 00 00 00 00 00 fc f=
f df 41 54 55 53 48 89 fb 48 83 c7 08 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f=
 85 5b 01 00 00 48 89 da 48 8b 6b 08 48 b8 00 00 00
> RSP: 0018:ffffc9000374fa20 EFLAGS: 00010202
> RAX: dffffc0000000000 RBX: 0000000000000000 RCX: fffff520006e9f22
> RDX: 0000000000000001 RSI: ffffffff8c401500 RDI: 0000000000000008
> RBP: ffff88802ff87000 R08: 0000000000000000 R09: fffffbfff2244efa
> R10: ffffc9000374fa40 R11: 0000000000000000 R12: 00000000fffffffe
> R13: ffff88802ff870e8 R14: 0000000000000008 R15: 0000000000000000
> FS:  000055556cf07500(0000) GS:ffff8880d5ddc000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fc48295da08 CR3: 000000003cd5d000 CR4: 0000000000352ef0
> ----------------
> Code disassembly (best guess):
>    0:   90                      nop
>    1:   90                      nop
>    2:   90                      nop
>    3:   90                      nop
>    4:   90                      nop
>    5:   90                      nop
>    6:   90                      nop
>    7:   90                      nop
>    8:   90                      nop
>    9:   90                      nop
>    a:   f3 0f 1e fa             endbr64
>    e:   48 b8 00 00 00 00 00    movabs $0xdffffc0000000000,%rax
>   15:   fc ff df
>   18:   41 54                   push   %r12
>   1a:   55                      push   %rbp
>   1b:   53                      push   %rbx
>   1c:   48 89 fb                mov    %rdi,%rbx
>   1f:   48 83 c7 08             add    $0x8,%rdi
>   23:   48 89 fa                mov    %rdi,%rdx
>   26:   48 c1 ea 03             shr    $0x3,%rdx
> * 2a:   80 3c 02 00             cmpb   $0x0,(%rdx,%rax,1) <-- trapping in=
struction
>   2e:   0f 85 5b 01 00 00       jne    0x18f
>   34:   48 89 da                mov    %rbx,%rdx
>   37:   48 8b 6b 08             mov    0x8(%rbx),%rbp
>   3b:   48                      rex.W
>   3c:   b8                      .byte 0xb8
>   3d:   00 00                   add    %al,(%rax)
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
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
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
-bugs/6a6d41a2.f794c993.27aeb.000c.GAE%40google.com.
