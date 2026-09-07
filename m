Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C81A44CF29
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773526; cv=pass; b=nb/bHKPK2AsEMstvXsxOHpCwB2n6vMP5xN6FiM1w0lNeCPvEFp2Zb4XCQqkQK0H7Qb50wy2g4lqMOrz1UD9gbKizBCmKp/afVB/oig4+cHrxB53YS7q43Dr2c8tAuVe4JIT35WFqvc5nLwwzmNzrB4UqlhLsQCvIb8NzYMdF/E4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773526; c=relaxed/simple;
	bh=v9I5r1JUhE+zLYACJbml7p6rzWAbiD1yZbROLmPgMtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DlzIbaQG/bCcgCmf9xcqogP8YmiZ45pwrrNw1cUTC7rpPY0WRRvhMgtjUvRW/SLqqCgPMkXmAQHeMZBXsIBfvCttMtt8P8tOqnj02QleICGaDxAu4SWjp4/rNDDdYAuaJSeUJc+F3vq2PcACiBtAf827asji7bn50RTuXUfXiuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=va0JYC2e; arc=pass smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="va0JYC2e"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso1314969eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:32:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788773524; cv=none;
        d=google.com; s=arc-20260327;
        b=d77lWQbDf7tLHAdyF8uDTdusd1peoRyE24aKCF2N2nRQsUIi79KevPVBkSVXshJjLv
         cMU3g6K29yOEx/kr9plzWPSpiNzdyqmMVqhPZdPo6VceTMuNxSTNve25YFfnwI6Yk765
         z0V9EZoRxKqIlctS2Ih+FcfUcjAPIDl3P8S3QkO3fqZcGimOqZkZ8S5O8a+vg9/QAp5T
         KssAmQHgJ59AhJ1+3FVEEnQwlRQ1CjqzJJYw8rrssheBFFg7iT0kp5ebQku6Hr0WM8HQ
         Jfzsb36mYWy9617F8FZmWnTChrSeFLkdzOALNM4/ifai/ygov1bHPHl8osRhyx8N4Ype
         lIGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d+4ALPI3dZvmLR4k43Y5R+49LnwK51lTHoswuYvlvrA=;
        fh=A+4a8x85Ln+VBASNpAA92F3aoY02dbT/uMSXNbvt5Qg=;
        b=kQq9LfDDN17cH4SkITRQRSbYQE2MvZ6XGtVlPG2/J7UHeIY0ebqaZlfed+KW9sN9Yt
         XnOpDXXOEKQIANRjNs0c2vOfCHuzxflzNVq8YQdy9sAjXSbyVhEvzVKFAkYKOPMWQKUs
         7Il+Hh9wDJz/d6xz/f1983rXJ2hXefDK9jyiSM7GQt9lIyfBITnZWu2i94xMtaHUlkly
         H8wGC57keQ0Q9y2s+TsISHnNOBfIL+JC+69bvEPu5T9FP7th4Z3H8rMsfDN8lEn+WLIK
         hVYlLRRDYw/pbGuo4NDkiEIXO6pDkM1SoFyFfkh8HV65i9BZ6M7xUIQRARsphb4q1IvN
         V1mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788773524; x=1789378324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d+4ALPI3dZvmLR4k43Y5R+49LnwK51lTHoswuYvlvrA=;
        b=va0JYC2eDkyB6Ahd51fSHajlODkHU/AQZX1ePxl1pxgtUEJgOk6CIVvDdi/yysYQ7q
         hnVF8HWk0XV+js6k3g619PXwy1IoY3Wu8XMHkdjw/DGy0py+9CM16w+P1VSQ30Xk7s0X
         R5k4cngWEr/4r2RzT5mpS1Dsm9FdY49kLCyBMnZZbSx3wW5sVUsoXQZOYYFhWuFAZz88
         7TIAqvEKP56bj22Q8mFgO8DHpJp8EZ9GEgsCTvBcYns5TJaC7jf/k1Z0rj31RvVtfdh0
         RVYQ5sHUyWomtXdhs/cUEhRABlaRw/MEYui/BxNnMk2DgOOgius5+us/gTX6BFmT10bR
         Hg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788773524; x=1789378324;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d+4ALPI3dZvmLR4k43Y5R+49LnwK51lTHoswuYvlvrA=;
        b=VT3MLz13rY15v2MxZL+TvnlAkqUVE95LbOJDrXpo9P6o+EjzdVHubykyl4hWEAsYtS
         JeXisJoUHMhR+0EUeWFgRmI2/a5nrkXKD0ARhoHWp1Cwyr8t+tuW3e7Cs3VOPyTeC8G5
         p6UHNPqr3yDVOsevASXJm7YgGrXJBSK4cBZaKV5/whEWeSRb+o+UANPGbTYXycYVbkPJ
         ugL08dU2qveABVD2xciE28WtYNthGR8j+iZ1TTW9H2D8tiisYEFTZjbUCSE0TisLIn6l
         ClkJ+azCz0TufY3uXZlsmomaXQu5BaneSdcW6JCn2sq+QkoRjlEm5eZETXcqhEkbY/KS
         DmnQ==
X-Gm-Message-State: AFuF++mevgBn5vytxuKU/Bw+VwhmRTbvQ3u1xCB6A+nGtrDvOaP63RaT
	tm9KCLXDX4IXqPwIEYryKwx/vyI1bq8n4uSI5mcsU5FKA2jK+xNESDwnkhxZyfyIxWHchw4L6Ao
	ZDKUeKsx5937iP/ErzBZ7Q/6rKysKTDgCjKYKzPBE
X-Gm-Gg: AYBFou3GJiXxE2PJx7ZxHvqp4Zf3EnxwTXigUc5q1rhLrS70TUteXndsOfM+GhrURjo
	iGOo+soGMUFlCwOfSuK+h+wEU00O98rjN4r912x8HUrDgZFRkashlr/DPlJHbvP6tj7BTXZuaaa
	YZgmQG4nDFtiKWIyqqJMlzXmhEfYhQn5IZo9P4bSZAnMdyYvD3NOGZnsMyx271CnBRnbW/YGQXn
	EfDECcC39H/QufX+p7c6ixdMLLq53cGsPORUFiRLc1Fp0akRXEABX991YWDyioX08jNKmdyyx6q
	QRFs/HaXLxifdiTVTQv1jTIx/mVVRFhXZNMMjowNKqAhtwkeqapHbT6eCl7kgBrtGZPRpub4baW
	7SjEbyYUldRUNMeIwpUxnIJVYRkAe74eayorn7vcd56NCr4TbYvC4OBdr2n1UuXvJB33w6HmvpI
	2zwyUSpf9IgtAw
X-Received: by 2002:a05:6820:6ac3:b0:6a3:c6f8:4caa with SMTP id
 006d021491bc7-6b6fa5e80f5mr13924837eaf.2.1788773523433; Mon, 07 Sep 2026
 02:32:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a8818d8.ae6ddae5.3da009.0030.GAE@google.com>
In-Reply-To: <6a8818d8.ae6ddae5.3da009.0030.GAE@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Mon, 7 Sep 2026 11:31:51 +0200
X-Gm-Features: AcwNN1WalyxdtxU8WUJkBGh9rNmHmOVy00uAqjZDoZ0EibkWoWclmqubwefGIrw
Message-ID: <CANp29Y6sk+JYQXFJpuefjXL9W6h9s2rtBd035+JDO_WBJQZuOQ@mail.gmail.com>
Subject: Re: [syzbot] [usb?] general protection fault in ucsi_acpi_probe
To: syzbot <syzbot+23cf45a9fce78e4e0dc1@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz invalid

See the discussion at
https://lore.kernel.org/all/6a88012e.dbb3a75c.13dd47.0007.GAE@google.com/T/

On Fri, Aug 21, 2026 at 11:22=E2=80=AFAM syzbot
<syzbot+23cf45a9fce78e4e0dc1@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    4477a78374a5 Add linux-next specific files for 20260814
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D114036c658000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D9b32a36dd637b=
06f
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D23cf45a9fce78e4=
e0dc1
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e25=
5-1~exp1~20260613092250.77), Debian LLD 22.1.8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D13c60679580=
000
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/994c1c8c560e/dis=
k-4477a783.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/cd54543d69ae/vmlinu=
x-4477a783.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/407cdf8f3fc2/b=
zImage-4477a783.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+23cf45a9fce78e4e0dc1@syzkaller.appspotmail.com
>
> Oops: general protection fault, probably for non-canonical address 0xdfff=
fc00000000e5: 0000 [#1] SMP KASAN PTI
> KASAN: null-ptr-deref in range [0x0000000000000728-0x000000000000072f]
> CPU: 1 UID: 0 PID: 5814 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(f=
ull)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 07/24/2026
> RIP: 0010:ucsi_acpi_probe+0x6c/0x4b0 drivers/usb/typec/ucsi/ucsi_acpi.c:1=
99
> Code: 89 74 24 08 4c 8b 23 4c 89 e7 e8 ef df 54 fd 49 83 c4 f0 45 31 f6 8=
4 c0 4d 0f 45 f4 49 81 c6 2c 07 00 00 4c 89 f0 48 c1 e8 03 <42> 0f b6 04 28=
 84 c0 0f 85 16 04 00 00 41 8b 2e 31 ff 89 ee e8 cb
> RSP: 0018:ffffc9000272fab8 EFLAGS: 00010203
> RAX: 00000000000000e5 RBX: ffff88801db68430 RCX: ffff88807f249f40
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: 0000000000000000 R08: ffff88802b52e5a3 R09: 1ffff110056a5cb4
> R10: dffffc0000000000 R11: ffffffff87e620e0 R12: fffffffffffffff0
> R13: dffffc0000000000 R14: 000000000000072c R15: 1ffff11003b6d086
> FS:  000055555ee6f500(0000) GS:ffff888124df8000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fb722c70000 CR3: 0000000075912000 CR4: 00000000003526f0
> Call Trace:
>  <TASK>
>  platform_probe+0xf9/0x190 drivers/base/platform.c:1507
>  call_driver_probe drivers/base/dd.c:-1 [inline]
>  really_probe+0x254/0xae0 drivers/base/dd.c:706
>  __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
>  device_driver_attach+0xe0/0x1d0 drivers/base/dd.c:1203
>  bind_store+0x1d0/0x220 drivers/base/bus.c:267
>  kernfs_fop_write_iter+0x3a4/0x540 fs/kernfs/file.c:345
>  new_sync_write fs/read_write.c:595 [inline]
>  vfs_write+0x612/0xba0 fs/read_write.c:687
>  ksys_write+0x150/0x270 fs/read_write.c:739
>  do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
>  do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fb722d9e0d9
> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f=
7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff=
 ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fff7bf8acb8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> RAX: ffffffffffffffda RBX: 00007fb723025fa0 RCX: 00007fb722d9e0d9
> RDX: 0000000000000007 RSI: 0000200000000180 RDI: 0000000000000004
> RBP: 00007fb722e35024 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007fb723025fac R14: 00007fb723025fa0 R15: 00007fb723025fa0
>  </TASK>
> Modules linked in:
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:ucsi_acpi_probe+0x6c/0x4b0 drivers/usb/typec/ucsi/ucsi_acpi.c:1=
99
> Code: 89 74 24 08 4c 8b 23 4c 89 e7 e8 ef df 54 fd 49 83 c4 f0 45 31 f6 8=
4 c0 4d 0f 45 f4 49 81 c6 2c 07 00 00 4c 89 f0 48 c1 e8 03 <42> 0f b6 04 28=
 84 c0 0f 85 16 04 00 00 41 8b 2e 31 ff 89 ee e8 cb
> RSP: 0018:ffffc9000272fab8 EFLAGS: 00010203
> RAX: 00000000000000e5 RBX: ffff88801db68430 RCX: ffff88807f249f40
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: 0000000000000000 R08: ffff88802b52e5a3 R09: 1ffff110056a5cb4
> R10: dffffc0000000000 R11: ffffffff87e620e0 R12: fffffffffffffff0
> R13: dffffc0000000000 R14: 000000000000072c R15: 1ffff11003b6d086
> FS:  000055555ee6f500(0000) GS:ffff888124cf8000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fb722fee000 CR3: 0000000075912000 CR4: 00000000003526f0
> ----------------
> Code disassembly (best guess):
>    0:   89 74 24 08             mov    %esi,0x8(%rsp)
>    4:   4c 8b 23                mov    (%rbx),%r12
>    7:   4c 89 e7                mov    %r12,%rdi
>    a:   e8 ef df 54 fd          call   0xfd54dffe
>    f:   49 83 c4 f0             add    $0xfffffffffffffff0,%r12
>   13:   45 31 f6                xor    %r14d,%r14d
>   16:   84 c0                   test   %al,%al
>   18:   4d 0f 45 f4             cmovne %r12,%r14
>   1c:   49 81 c6 2c 07 00 00    add    $0x72c,%r14
>   23:   4c 89 f0                mov    %r14,%rax
>   26:   48 c1 e8 03             shr    $0x3,%rax
> * 2a:   42 0f b6 04 28          movzbl (%rax,%r13,1),%eax <-- trapping in=
struction
>   2f:   84 c0                   test   %al,%al
>   31:   0f 85 16 04 00 00       jne    0x44d
>   37:   41 8b 2e                mov    (%r14),%ebp
>   3a:   31 ff                   xor    %edi,%edi
>   3c:   89 ee                   mov    %ebp,%esi
>   3e:   e8                      .byte 0xe8
>   3f:   cb                      lret
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
-bugs/6a8818d8.ae6ddae5.3da009.0030.GAE%40google.com.
