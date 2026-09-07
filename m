Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADD3443A88
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773710; cv=pass; b=hwSrwg302zA2FZD1MKb+DTEPcyDay01sTFyW1Jr4qk4J4c9mav/TOKq0f+FODFUc5h3QRXRck+9gd4PgAGefUWBGPKdR0WkKKyKCt+HDt0lklGscCDTK1mZHZuTIMrLRd6VgbRgPoZmpqefCaQ9GF+x2mej744/JU08g9jCaFDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773710; c=relaxed/simple;
	bh=NPNbhRKhSZG1iCcOB83/OhbeGC5vuht73xzNAlq+5oU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HXr/nnxMVbVKxxAcgM1yN40p9Eds+VomWKcPLLUMPdQwWBkr99n9s/vpKdcxcz+p4a9XjBP6fwJp60wqKYfI+JCHJeeZgQnWHg5okv5s+lnCPqwUtBjSI1zciwU9KwmNjLoivBSdYc+VQ/Z+rqJnzuLE4OkE2VMsJAlSls9Zekg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p+jiX28E; arc=pass smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p+jiX28E"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-46ac530ba95so2266428fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:35:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788773706; cv=none;
        d=google.com; s=arc-20260327;
        b=jkVbRQBbhtnNaV6r/EQ/He4YA62MoxpdiHScpSWN/Nn2apA16WcCokOEeHupA79vGw
         WTRGNtdXFfUdqyR1Y3WQW4zBZiHruroBOxozyWfCql5S+jOmCCIrS2fb/F8OqYx06JTn
         83MbTCN5yAY9eNnArpVBemPU85U3/kMdPJg//NQonEYMcB9g6NpvcvnK9kKQ1aC4l74U
         kqGwbzmOZ0X/KHHQdGNT6zfCYc0R3ExJuDLbCxR4+QHWCL6aoaPmkqumEtOOePcq056b
         J2kxcrqefpQbIuBxctU8anguPcs16o5GzfEhxYDizXKlYkLl2CmTshPDXqRdsBvOz2SY
         xPeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HhLCqdkxL+SDqZCeuIxRaYzFesLGduG3+h8eya1+xaU=;
        fh=xGeoOrUL0ybX7WisJYk7zvn4xnL8iuF3+bM4gIZa7DU=;
        b=PiAvQ6UjejNfFFIJznNz9nriJkcfUwmtpeE3D9l8zPFmSV/XLjhjIbERXa0nPM3fqk
         g7b1YhmBiaapm0dN8n/2z5m2UnEZyASP3nkp+hAQxNJB6G//j5HLBKd6F37RhXwaCA8S
         tBittH9kDB2S99KrPpsEs2/wITMVgETUHYuGAPqxcne6XuPLsv8qka4MkMlkCwdiW7Zz
         YPawbKScq1kEzjSRe7+cMBuwBn0+t5Crm5HUrYUHXicUtbn5adegi4q/UHKiVaDh7qfv
         NjUOPb/vp5joozdW9gE0tLDf/dRQNaZuIAn2zRQhN8Ldh4tjQVPWxxzqU6t8pJTAo2Tf
         FzGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788773706; x=1789378506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HhLCqdkxL+SDqZCeuIxRaYzFesLGduG3+h8eya1+xaU=;
        b=p+jiX28EUicT22vzs+txic3TCkuQfG/JDlcd0qoo1uhsMcJKeoXBf39Smp6YHZtPq5
         Mvjbw1C5uJvnApR9ePrZES0s712Bm1XWh1bAwyrFOCazYAxjxgHg6yhZFMaZPVomCZIy
         +koUE5TDoqpWmOHQk2MLWS+d1ggrA9rHzWLm1Do5jHBNAJzgGRasuU4+d0y9TzoxHpWV
         lhVQmGYyWGoEX12sD2SVHlgKBnjIfGOy8rLKc8yP3JGXlF+GBiDfumTbRRZYE/0is17l
         eQHq/pRu3JAET06PzxHoxcHMm8ym5lpRh1iRmBsLRsE30WTN3KefjFeFlyxeJrCjAAJE
         tYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788773706; x=1789378506;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HhLCqdkxL+SDqZCeuIxRaYzFesLGduG3+h8eya1+xaU=;
        b=UTtkM7eKI1IilFprrsbo4rN8VyTF/9NuZHKWpmPRPgX8Qso0KlRXtSGDoqXy4dSvLp
         i7uNsqvOENQNwl6E7+uSRe4zeuSrUFh80sElzf+ADkgzDw0V0NOCwman/MEG+2NkfpcL
         EeP5V+ReJEfdwqEugmQv6xOSysKRwL9F1U1k2/QFfZ/u3eeW5YN37+FMqavIO0JEk/A9
         XYRS9bulhVvf9rA41ppURyXoLhbqAVYaPJh5aLXXdbpQ1iZDlagL27jGdILohBFmhuJF
         L5w+OegICE1cNiZtMQJ2sTBNmyFnk/L8As13C8ESFnbCoGYE4VdhXLuhqVWayY3HuUPg
         wStQ==
X-Gm-Message-State: AFuF++kZIW4lrOI5/UQFbIXlH/QYuCuHxlglnWGueyDlCw8GOkVpQV/Z
	7wtScDn5pqBx0AeFeaS0s2Mzj2TajoYKhX6DwK30DjLUQEdwef9ryx1lTbJs4BoyhdCV5YMOvdk
	pc3VLigU17RCH4jTbfTUPW7UknpC4NvkAEFvhlSCf
X-Gm-Gg: AYBFou29HxRQ8q/BbfTR54Bvbz6Wx50BxOrh5FbupbsD2QSsOBhQTRQw2obPKbN7a51
	bp5g+A4p2YrjU3tLqrSnFHrMWIB5sb8Ipjcp92FQ06ro0RCmmZEY/Yn3ObDAW7bG6Ad5d7cSToV
	EeGUmMjoamWMn65DX/GBht3yWLfdRMjhqdtdKFYLb0WokAXY9qltitoY4wfa+JYC6gx6nABq05y
	ugriLwPNBVK+dAO6neJLFxkjv9QLPtZYYnnXCcRGNuqSf/lNsaMli5Yr69XC3rIcBnliJnmJch1
	LL9EH3RcAkWvDiirVgj6+jTpWPyACCEJMakqSUWma8rJ8/pENqj+mD2xjXwXKDTRmNmifXQQk1X
	ZNYhGsDrDLMlorXW8l4CUk41sm36ceijd6cnnoF01pH8F91SHvyvTmAGTay6KzrnkaVFpZZ9R54
	NzkYcFQNVoR5Ht
X-Received: by 2002:a05:6870:330b:b0:45e:4deb:92e7 with SMTP id
 586e51a60fabf-47552a575a7mr22076112fac.10.1788773705937; Mon, 07 Sep 2026
 02:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a73bc8f.5aeeccc9.207e63.0003.GAE@google.com>
In-Reply-To: <6a73bc8f.5aeeccc9.207e63.0003.GAE@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Mon, 7 Sep 2026 11:34:54 +0200
X-Gm-Features: AcwNN1XBIQBJ4ucd6o5MVC4F63orppCi-AZ1EChsSuGPJEmmJuVZVpoY4_DBzd0
Message-ID: <CANp29Y6AaKwnkT1c1+iWe9-_2R4yU9ETzRYv41wxhdde4mN=PQ@mail.gmail.com>
Subject: Re: [syzbot] [usb?] BUG: unable to handle kernel paging request in ioread32
To: syzbot <syzbot+97999b836ee62ddb0181@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz invalid

See the discussion at
https://lore.kernel.org/all/6a88012e.dbb3a75c.13dd47.0007.GAE@google.com/T/

On Thu, Aug 6, 2026 at 12:43=E2=80=AFAM syzbot
<syzbot+97999b836ee62ddb0181@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    848acc8ffe1b Merge tag 'fsverity-for-linus' of git://git.=
k..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D1209b64958000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D145fa60d73086=
782
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D97999b836ee62dd=
b0181
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for D=
ebian) 2.44
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D15febe32580=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D145813b958000=
0
>
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d=
900f083ada3/non_bootable_disk-848acc8f.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/6fb497cc0c8d/vmlinu=
x-848acc8f.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/663ccee34982/b=
zImage-848acc8f.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+97999b836ee62ddb0181@syzkaller.appspotmail.com
>
> BUG: unable to handle page fault for address: 00000000000556e0
> #PF: supervisor read access in kernel mode
> #PF: error_code(0x0000) - not-present page
> PGD 275ae067 P4D 275ae067 PUD 0
> Oops: Oops: 0000 [#1] SMP KASAN NOPTI
> CPU: 2 UID: 0 PID: 5940 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(f=
ull)
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.=
16.3-2 04/01/2014
> RIP: 0010:readl arch/x86/include/asm/io.h:59 [inline]
> RIP: 0010:ioread32+0x87/0xc0 lib/iomap.c:99
> Code: 2d 0e 3b 5a 0a 31 ff 89 ee e8 55 f0 e3 fc 85 ed 75 28 e8 dc f5 e3 f=
c bb ff ff ff ff 89 d8 5b 5d e9 ce 03 98 06 e8 c9 f5 e3 fc <8b> 1b e8 c2 f5=
 e3 fc 89 d8 5b 5d c3 cc cc cc cc e8 b4 f5 e3 fc 83
> RSP: 0018:ffffc90004c878d0 EFLAGS: 00010293
> RAX: 0000000000000000 RBX: 00000000000556e0 RCX: ffffffff85266eab
> RDX: ffff88803214a540 RSI: ffffffff85266f17 RDI: ffff88803214a540
> RBP: ffff888055c95c38 R08: 0000000000000007 R09: 000000000003ffff
> R10: 00000000000556e0 R11: 0000000000000000 R12: 1ffff92000990f29
> R13: ffff88802323a0d0 R14: ffff888055c95c80 R15: ffffc90004c87968
> FS:  000055557cf64500(0000) GS:ffff8880d5fd8000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00000000000556e0 CR3: 0000000058784000 CR4: 0000000000352ef0
> Call Trace:
>  <TASK>
>  nhi_probe+0xdc/0x8f0 drivers/thunderbolt/nhi.c:1198
>  nhi_pci_probe+0x322/0x5a0 drivers/thunderbolt/pci.c:479
>  local_pci_probe+0xdd/0x1b0 drivers/pci/pci-driver.c:332
>  pci_call_probe+0x176/0x800 drivers/pci/pci-driver.c:394
>  __pci_device_probe drivers/pci/pci-driver.c:455 [inline]
>  pci_device_probe+0x1cd/0x370 drivers/pci/pci-driver.c:489
>  call_driver_probe drivers/base/dd.c:628 [inline]
>  really_probe+0x241/0xa60 drivers/base/dd.c:706
>  __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
>  device_driver_attach+0xd1/0x220 drivers/base/dd.c:1203
>  bind_store+0xf4/0x190 drivers/base/bus.c:267
>  drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
>  sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
>  kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
>  new_sync_write fs/read_write.c:595 [inline]
>  vfs_write+0x6ac/0x1050 fs/read_write.c:687
>  ksys_write+0x12a/0x250 fs/read_write.c:739
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fb04af9e019
> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f=
7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff=
 ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fff5f802b58 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> RAX: ffffffffffffffda RBX: 00007fb04b225fa0 RCX: 00007fb04af9e019
> RDX: 000000000000000d RSI: 0000200000000240 RDI: 0000000000000005
> RBP: 00007fb04b03500c R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007fb04b225fac R14: 00007fb04b225fa0 R15: 00007fb04b225fa0
>  </TASK>
> Modules linked in:
> CR2: 00000000000556e0
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:readl arch/x86/include/asm/io.h:59 [inline]
> RIP: 0010:ioread32+0x87/0xc0 lib/iomap.c:99
> Code: 2d 0e 3b 5a 0a 31 ff 89 ee e8 55 f0 e3 fc 85 ed 75 28 e8 dc f5 e3 f=
c bb ff ff ff ff 89 d8 5b 5d e9 ce 03 98 06 e8 c9 f5 e3 fc <8b> 1b e8 c2 f5=
 e3 fc 89 d8 5b 5d c3 cc cc cc cc e8 b4 f5 e3 fc 83
> RSP: 0018:ffffc90004c878d0 EFLAGS: 00010293
> RAX: 0000000000000000 RBX: 00000000000556e0 RCX: ffffffff85266eab
> RDX: ffff88803214a540 RSI: ffffffff85266f17 RDI: ffff88803214a540
> RBP: ffff888055c95c38 R08: 0000000000000007 R09: 000000000003ffff
> R10: 00000000000556e0 R11: 0000000000000000 R12: 1ffff92000990f29
> R13: ffff88802323a0d0 R14: ffff888055c95c80 R15: ffffc90004c87968
> FS:  000055557cf64500(0000) GS:ffff8880d5fd8000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00000000000556e0 CR3: 0000000058784000 CR4: 0000000000352ef0
> ----------------
> Code disassembly (best guess):
>    0:   2d 0e 3b 5a 0a          sub    $0xa5a3b0e,%eax
>    5:   31 ff                   xor    %edi,%edi
>    7:   89 ee                   mov    %ebp,%esi
>    9:   e8 55 f0 e3 fc          call   0xfce3f063
>    e:   85 ed                   test   %ebp,%ebp
>   10:   75 28                   jne    0x3a
>   12:   e8 dc f5 e3 fc          call   0xfce3f5f3
>   17:   bb ff ff ff ff          mov    $0xffffffff,%ebx
>   1c:   89 d8                   mov    %ebx,%eax
>   1e:   5b                      pop    %rbx
>   1f:   5d                      pop    %rbp
>   20:   e9 ce 03 98 06          jmp    0x69803f3
>   25:   e8 c9 f5 e3 fc          call   0xfce3f5f3
> * 2a:   8b 1b                   mov    (%rbx),%ebx <-- trapping instructi=
on
>   2c:   e8 c2 f5 e3 fc          call   0xfce3f5f3
>   31:   89 d8                   mov    %ebx,%eax
>   33:   5b                      pop    %rbx
>   34:   5d                      pop    %rbp
>   35:   c3                      ret
>   36:   cc                      int3
>   37:   cc                      int3
>   38:   cc                      int3
>   39:   cc                      int3
>   3a:   e8 b4 f5 e3 fc          call   0xfce3f5f3
>   3f:   83                      .byte 0x83
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
-bugs/6a73bc8f.5aeeccc9.207e63.0003.GAE%40google.com.
