Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445522;
	b=RHzepYn+QE9/kWqOvTQJ0UmDFnOcb5v4NkeoDnMilOOpQC8qs0OyZa4ySasAnpGc7kBY
	 wfMMsTXPffm6GVR+tPRkce6vn3JyYzBqn33/eYFkUbtSB2I2XOOlsH1LJFdhXthYgAtgh
	 5Lda1ghgIBWDin4cOf0Q3BVqH0XNOg5ZkGJJsqRM7nYI4OeE5cFEWM6OARW/KcZuLsMUO
	 uvf4qm29ntl03vCNeTdwjeyAVETa76iEp/ckcUq9jNPpPThOj9uQyKroEk7qNNTbfG4+i
	 pwTBlDchHWHi2rXK9aQMTvrLEo+3VlMGeiIxXumYTd2JV2avaYUKpc33lLFFUrkhZHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445522;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=wc4KI4JX6N3tKx7PcXacfJ/6loXxDCQLw7+V+x9ydRc=;
	b=HYgeJlQioZN9V8WGO3ueiQEdaZFhD81nd22YwFcqbNP+krScHka/PdDyyuZBOTHgmsrE
	 Q8rf0j1kpGMTY7kwAMm0z6M9qLrCzAtwflqdeaSyREqpgwwdNWAdvLBJ3X2dobEHuh0q1
	 c5YcLpyCCMrQgwmehiFxLCIVAZ3Xv+5a8eDTIEiB3QuXawUYsnW+cDsAP9A2CpbH8DL3J
	 0wwb9sZylosdF76Mg4wIQltr4hJXFW7m/O/L3nBNhCzlfilETeUvL5JOvIwm1fKItVJ5j
	 O9Z4B/QLoiQuQfv01SXHWXRLkk0HG+kgoy5Ntd4oGhG2I2WrRGM3nuavPDUEOPUY8TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294F5606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 11:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 294F5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4db3db8687fso2547819b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445521; x=1794050321;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wc4KI4JX6N3tKx7PcXacfJ/6loXxDCQLw7+V+x9ydRc=;
        b=y/DRhIFjKgRt1O1aZdWpWqsUtCjrfffAu1FHwFT0BeWOKkWPWyu9wyg345Tz1dyr8a
         UxNlPvUQq/GUxxXYRClDGzoTNrtQhS/a1Bg62oyfBznNaoJBiEIepPlyZzRv2aROpHEC
         cFaJBUd2IFAnKjsaUiBD/YpwqJ0IgfOOSDkLlkfS+xoBYL917NfYbsoI1e4zYAeV43Gp
         DI86LrvnlsYkTL/dX+Ei7gw2yDpsoou8MJ1fQTvh2aT5C028hr8Qu3F0EPSOMXJKxrkS
         pNSi1vYBcmERcSF26g1KFjXdT+pIM+dQRiweq3hQFonrM8hmMoXUd3c+TcHhTxcqZYLz
         6Viw==
X-Forwarded-Encrypted: i=1; AKwUvBxcJVm+Lw0EW6X7UXAf0R6wjFhHNmMvGHXKB2qJMfE5G1M91HJwdzJa0iSMvDZROx0T/rVn7SWbKV58Jtw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKkzr7HzfgtH/kLfl4TGBQbqgTySC/qbyZVSodTLR9Fe6gSWbr
	qpKtdm4AERRtg43S+ExaMV/U3tFXzqq+6oTwHqSApPuBefANEY51DtoJrrmHLwWrx2eFz+/jTGe
	cVvAQHdaKLdV6K/qPTOFiAqZo5P1sO9mUhb+V2U8bIGAsqzljPFTyJwc3jvI=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6411:b0:4f3:890b:5fec with SMTP id
 5614622812f47-5640de4bed0mr3731564b6e.25.1793445521183; Sat, 31 Oct 2026
 04:18:41 -0700 (PDT)
Date: Sat, 31 Oct 2026 04:18:41 -0700
In-Reply-To: <6a13d9ca.050a0220.7dd1.0000.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae5ce91.264039fe.1edcaa.0004.GAE@google.com>
Subject: Re: [syzbot] [ocfs2?] kernel BUG in ocfs2_page_mkwrite (4)
From: syzbot <syzbot+42984127d45ad96219de@syzkaller.appspotmail.com>
To: heming.zhao@suse.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, 
	linux-kernel@vger.kernel.org, mark@fasheh.com, ocfs2-devel@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    abf8c33470f7 Merge tag 'spi-fix-v7.4-merge-window' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14bd94b1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4a49f7c2815c8df7
dashboard link: https://syzkaller.appspot.com/bug?extid=42984127d45ad96219de
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16bd94b1580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1170f04e580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-abf8c334.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2fa6d9134089/vmlinux-abf8c334.xz
kernel image: https://storage.googleapis.com/syzbot-assets/17b6a19466ca/bzImage-abf8c334.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/afd449083684/mount_1.gz
  fsck result: OK (log: https://syzkaller.appspot.com/x/fsck.log?x=10bd94b1580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+42984127d45ad96219de@syzkaller.appspotmail.com

(syz.0.17,5578,0):__ocfs2_journal_access:730 ERROR: Error -30 getting 1 access to buffer!
(syz.0.17,5578,0):ocfs2_write_end_nolock:1945 ERROR: status = -30
------------[ cut here ]------------
kernel BUG at fs/ocfs2/mmap.c:106!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5578 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:__ocfs2_page_mkwrite fs/ocfs2/mmap.c:106 [inline]
RIP: 0010:ocfs2_page_mkwrite+0xb59/0xb60 fs/ocfs2/mmap.c:143
Code: 50 42 fe e9 27 fd ff ff e8 44 4d 07 08 e8 5f af c9 fd 4c 89 e7 48 c7 c6 40 21 77 8c e8 00 af 28 fd 90 0f 0b e8 48 af c9 fd 90 <0f> 0b cc cc cc cc cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffc90001c3f960 EFLAGS: 00010293
RAX: ffffffff83ff77b8 RBX: 00000000ffffffe2 RCX: ffff88803c8ea580
RDX: 0000000000000000 RSI: 0000000000001000 RDI: 00000000ffffffe2
RBP: ffffc90001c3faf0 R08: ffffffff91be13bf R09: 1ffffffff237c277
R10: dffffc0000000000 R11: fffffbfff237c278 R12: dffffc0000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000001000
FS:  000055557db80500(0000) GS:ffff88808aa01000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f6af90e5440 CR3: 0000000040472000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 do_page_mkwrite+0x147/0x310 mm/memory.c:3879
 do_shared_fault mm/memory.c:6145 [inline]
 do_fault mm/memory.c:6207 [inline]
 do_pte_missing+0x70f/0x3570 mm/memory.c:4763
 handle_pte_fault mm/memory.c:6627 [inline]
 __handle_mm_fault mm/memory.c:6776 [inline]
 handle_mm_fault+0x1a53/0x3750 mm/memory.c:6943
 do_user_addr_fault+0x7f6/0x1480 arch/x86/mm/fault.c:1394
 handle_page_fault arch/x86/mm/fault.c:1483 [inline]
 exc_page_fault+0x6a/0xc0 arch/x86/mm/fault.c:1536
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:595
RIP: 0033:0x7f8bc2868b02
Code: 30 48 8b 14 24 48 85 d2 74 17 8b 44 24 10 0f c8 89 c0 48 89 44 24 10 48 83 fa 01 0f 85 aa 02 00 00 48 8b 44 24 18 8b 74 24 10 <89> 30 e9 1e fe ff ff 48 8b 44 24 18 8b 10 48 8b 04 24 48 85 c0 0f
RSP: 002b:00007ffe54034e30 EFLAGS: 00010246
RAX: 0000200000000480 RBX: 0000000000000004 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000004 RDI: 000055557db803d8
RBP: 00007ffe54034f50 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000004 R11: 0000000000000000 R12: 0000000000000000
R13: 00007f8bc2c25fac R14: 000000000001c34b R15: 00007f8bc2c25fa0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__ocfs2_page_mkwrite fs/ocfs2/mmap.c:106 [inline]
RIP: 0010:ocfs2_page_mkwrite+0xb59/0xb60 fs/ocfs2/mmap.c:143
Code: 50 42 fe e9 27 fd ff ff e8 44 4d 07 08 e8 5f af c9 fd 4c 89 e7 48 c7 c6 40 21 77 8c e8 00 af 28 fd 90 0f 0b e8 48 af c9 fd 90 <0f> 0b cc cc cc cc cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffc90001c3f960 EFLAGS: 00010293
RAX: ffffffff83ff77b8 RBX: 00000000ffffffe2 RCX: ffff88803c8ea580
RDX: 0000000000000000 RSI: 0000000000001000 RDI: 00000000ffffffe2
RBP: ffffc90001c3faf0 R08: ffffffff91be13bf R09: 1ffffffff237c277
R10: dffffc0000000000 R11: fffffbfff237c278 R12: dffffc0000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000001000
FS:  000055557db80500(0000) GS:ffff88808aa01000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005598dcb9a660 CR3: 0000000040472000 CR4: 0000000000352ef0


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
