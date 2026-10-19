Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792438834;
	b=RtscDZgEjJI79ahOzXR3W4eafUcHudgtb3LI2aPvcQkYptFFUcTCUjdvYKQMXQeoBKRZ
	 5s/Gq0TruHLAkJ4fTZfYbHWFpiSE884Ubx50L8kQVVcW9eAl5a+WC3E65orDPL3xiDoiU
	 v1OcWz/+fVPCNhagKo8nYv1nsw1VXxHK/Sl2iqRlKw3C2dPNnb8s9b9hWVdtSC5pvfIIl
	 oPByXarwXwITNwXblN6CfSVSOgiPijMkvpalOIRUCIlFi69wvy3XRpdqADIPyjf7pKLW+
	 TqxJ43+wVxz2U8v7jy02KnUdoU0bxr3tRnXfXwV49OSxLgaP+ziqBjXgmU5HRcuNajg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792438834;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=PBifRyIrgHNKeJNMg4xWZbwNbxc9hE/18PM0weTakxA=;
	b=sl/CIIkSu27EcoLiYMFQu6PCPF5QBDdwQVA9VFIOXWk0IxJ+ek6Pz5s06XXqk1YdxDSZ
	 VUeJskEW2z1iECWxG3BBIcxeQ1hvFG/2eMb3xN3sDpuvV9jbfDLQm/lf14zxc82VdyIMq
	 AbMQ2vj85rWG8FU2KJGQyKuqGFbPM+AN8g5FSDQQC4VfbtrNyVDagt/1rM2vH3qNRtpXt
	 zxEdrlmcnFqwugEsDQ4g7FwEBjfQIAAm+i58QEprmY3awkAVj7mHUhsah8rY0VWQ5bodq
	 ziXzWVHwaj5gIe5mydQn75Z9SEprLl5pcVy80l6fajTsA3Dcle7xF9x7ai+w/y7kCKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4F2606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F4F2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-54d6281f6dbso129250b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792438833; x=1793043633;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PBifRyIrgHNKeJNMg4xWZbwNbxc9hE/18PM0weTakxA=;
        b=IW/aD3C9BOF66fpkTKG3jC7FlRFhf/RAjM2rFJJaMXAiim2L/warFOjo4kNbne44Qo
         e1iN2IfVr3sPOLrl/mRQoQWSGiGmGJEQo+gyQkbw1EQ2SE5V1cm+sfhTKYfUWk9lH43n
         izymXy+Jdc8sixGlxA++UDUZN3qUBbTMG3bvXa37L1gDdaU8RM5pjtaxu/3NYDD9dRfJ
         u3pzdt8EFa32yFKYODKLtxrlfCKayz1gutoWwCczZ1uPSvgVml2pOkY472zVzAObuIXT
         0Jk+B+Oiqs6Ke5zbL+D3FSguexamUCbbbN8vywvoXI2Cpkn02jI9w3+BBL/oVgW6TnI0
         pJjg==
X-Forwarded-Encrypted: i=1; AKwUvBwiBtQw904t9NWY7O3wRdqz0tZL1Qp4S7sYNzi4tKMod7gauOzVlpXCHNXZPKy/3PKrIEJuGCkDSpeBvwY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKASAAqZpOKdfCxjM29Nw7IfIZJKWuHbQDfEHRZZIT4FRqKr9Xm
	mhqxl7mL/5TiKkZE1p2aFYLPSCKnHCAvgF2VSuWs3NpaNn8kJ1yi1pvzspW2Xnx/V+P9iV0KArY
	hOnASp2t7IscUXgfqZJ48xtEqXzjz0uu4VMiN8GwaOBvePLxHpYtBEXu9UXc=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1784:b0:4e6:cc78:edc1 with SMTP id
 5614622812f47-53ccf0036fbmr8290767b6e.42.1792438833300; Mon, 19 Oct 2026
 12:40:33 -0700 (PDT)
Date: Mon, 19 Oct 2026 12:40:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad67231.a20cb897.960b0.0042.GAE@google.com>
Subject: [syzbot] [mm?] WARNING in shrink_one
From: syzbot <syzbot+54f6a8926b40a171f2c8@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, david@kernel.org, gourry@gourry.net, 
	joshua.hahnjy@gmail.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rakie.kim@sk.com, syzkaller-bugs@googlegroups.com, 
	ying.huang@linux.alibaba.com, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a0ff06b3a7bd Merge tag 'firewire-fixes-7.3-final' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12cdb20d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=44ac479246d4559b
dashboard link: https://syzkaller.appspot.com/bug?extid=54f6a8926b40a171f2c8
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-a0ff06b3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3f4bcbceb92e/vmlinux-a0ff06b3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/bf4df8252e54/bzImage-a0ff06b3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+54f6a8926b40a171f2c8@syzkaller.appspotmail.com

------------[ cut here ]------------
current->flags & PF_MEMALLOC
WARNING: mm/page_alloc.c:4816 at __alloc_pages_slowpath mm/page_alloc.c:4816 [inline], CPU#3: syz-executor/5706
WARNING: mm/page_alloc.c:4816 at __alloc_frozen_pages_noprof+0x1eac/0x3300 mm/page_alloc.c:5449, CPU#3: syz-executor/5706
Modules linked in:

CPU: 3 UID: 0 PID: 5706 Comm: syz-executor Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:__alloc_pages_slowpath mm/page_alloc.c:4816 [inline]
RIP: 0010:__alloc_frozen_pages_noprof+0x1eac/0x3300 mm/page_alloc.c:5449
Code: 38 d0 7c 08 84 d2 0f 85 de 12 00 00 65 48 8b 05 c2 6c 1c 13 c7 84 24 94 00 00 00 00 80 00 00 f6 40 2d 08 0f 84 ba e7 ff ff 90 <0f> 0b 90 e9 b1 e7 ff ff 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03
RSP: 0000:ffffc900045465e8 EFLAGS: 00010202

RAX: ffff88802a07a580 RBX: 0000000000000000 RCX: 1ffff1100fffad29
RDX: 0000000000000000 RSI: 0000000000000002 RDI: ffff88803fffd938
RBP: ffff88802a07a5ac R08: 0000000000008000 R09: 0000000000000001
R10: 0000000000000002 R11: 0000000000000000 R12: 0000000000048c40
R13: ffff88803fffb900 R14: 0000000000000000 R15: 1ffff920008a8cd7
FS:  0000000000000000(0000) GS:ffff888095a4a000(0063) knlGS:00000000567714c0
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 00000000f7159f10 CR3: 00000000265ed000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 00000000000f000e DR6: 00000000ffff0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 alloc_pages_mpol+0x201/0x550 mm/mempolicy.c:2486
 alloc_pages_noprof mm/mempolicy.c:2577 [inline]
 folio_alloc_noprof+0x22/0x250 mm/mempolicy.c:2587
 filemap_alloc_folio_noprof.part.0+0x3db/0x440 mm/filemap.c:1019
 shrink_one+0x398/0x850 mm/vmscan.c:5119
 shrink_many mm/vmscan.c:5180 [inline]
 lru_gen_shrink_node mm/vmscan.c:5258 [inline]
 shrink_node+0x2b20/0x4320 mm/vmscan.c:6247
 shrink_zones mm/vmscan.c:6503 [inline]
 do_try_to_free_pages+0x33e/0x16d0 mm/vmscan.c:6565
 try_to_free_pages+0x2a0/0x740 mm/vmscan.c:6804
 __perform_reclaim mm/page_alloc.c:4451 [inline]
 __alloc_pages_direct_reclaim mm/page_alloc.c:4478 [inline]
 __alloc_pages_slowpath mm/page_alloc.c:4939 [inline]
 __alloc_frozen_pages_noprof+0xf8a/0x3300 mm/page_alloc.c:5449
 alloc_pages_mpol+0x201/0x550 mm/mempolicy.c:2486
 alloc_pages_noprof mm/mempolicy.c:2577 [inline]
 folio_alloc_noprof+0x22/0x250 mm/mempolicy.c:2587
 filemap_alloc_folio_noprof.part.0+0x3db/0x440 mm/filemap.c:1019
 filemap_alloc_folio_noprof mm/filemap.c:2033 [inline]
 __filemap_get_folio_mpol+0x653/0x1280 mm/filemap.c:2018
 __filemap_get_folio include/linux/pagemap.h:761 [inline]
 filemap_fault+0x879/0x3130 mm/filemap.c:3607
 __do_fault+0x10b/0x440 mm/memory.c:5565
 do_read_fault mm/memory.c:6000 [inline]
 do_fault+0xb3f/0x1830 mm/memory.c:6134
 do_pte_missing mm/memory.c:4700 [inline]
 handle_pte_fault mm/memory.c:6558 [inline]
 __handle_mm_fault+0x150b/0x2f60 mm/memory.c:6707
 handle_mm_fault+0x363/0xa20 mm/memory.c:6876
 do_user_addr_fault+0x59c/0x12f0 arch/x86/mm/fault.c:1343
 handle_page_fault arch/x86/mm/fault.c:1483 [inline]
 exc_page_fault+0x6f/0xd0 arch/x86/mm/fault.c:1536
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:595
RIP: 0023:0xf7159f10
Code: Unable to access opcode bytes at 0xf7159ee6.
RSP: 002b:00000000ffdf10b0 EFLAGS: 00010283
RAX: 0000000000000051 RBX: 00000000f73ebff4 RCX: 0000000000000050
RDX: 0000000056792cf8 RSI: 0000000056792748 RDI: 00000000f73f2760
RBP: 00000000000005b0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000292 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
