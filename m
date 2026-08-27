Received: from mail-oi2-f1.google.com (mail-oi2-f1.google.com [74.125.231.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241D52C0F6C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787819627; cv=none; b=ORyjPzq4AT1BiCrab3YpmfNUGNogCj3Z3QhuAri1N/18A+ykTq4lNiO/2ykhBnWGP7JpHwUzeRV5wv3k3Ev16E+xUzNAwDRJB2VyuqnHT99Af3uAf5BA30oEjA+lWq8LLK7zJBMR/Z5H7XWdXP6HCspe3OzeUrJEU5J+1rtJTlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787819627; c=relaxed/simple;
	bh=XTCp8tFn8uslXfRjTEa9+W+qqGDPTytkXwTJo5oTDbk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Elgm3pYq1dv78/GBGkNtFxhygxQJhg+SO/+lX5H7rKI510YLh0h3kdSih3GqaN7K5w4YakAtYimrSYqkT/4lhFYlUsk9ve/w2fJZkCcfI+mOYwIN45gTwOt+6lqfLlSAV+dfBFo2Hy4gIZ4xq/Jv2MTuncPfuAmmRqq/em2487E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f1.google.com with SMTP id 5614622812f47-4b3780fb4f5so363176b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787819622; x=1788424422;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n9SjqDQMP4d9ke7LBuq+8qIZQA/L5115Lypl+jgL8Ic=;
        b=HCLRzHfBvPj5o4xlQAmWsdY0a7zXnt6AriFrOtDRmLkSfJ/Dvt33H/wibah5RKrJ8J
         birhHQ2CEvYPaSs8uYMD17vmxj9bd7Qfn+GpsB35MJ3YPEGE6mkLvL/9OLgAcJUc9EYD
         VyI8EGue0qRSjlwCPwLG1k/fiT4UzSsPP4+FL29HNkEF12et3Lfxc6xwd8wYOy1a9XAO
         tyw+PFoluKLyMTMx55nisNPHGAzOlsOcIgk6d9EpOxdhBr33b03Sm9Evqt6w7ciTTAT4
         1Zi605t3R7EoPxrDnVbxVxIDo8nw8Wul69sXcHnY3u++TAMmC6WGj2Db3GlM5sgLz/Ua
         qiBw==
X-Forwarded-Encrypted: i=1; AHgh+RoGwlxOr2+V7LkZdHwHb1GpBdnsLSDFyUuERJbnwuKczOBH0tHiGeRnzFzizIEck4Y6rdNxrHXHA4REZTA=@vger.kernel.org
X-Gm-Message-State: AFuF++nsdbyfQCt/oVLU/B5S5QgEwjtT7VdYv+YCbzCtMkxVOwHPdIrO
	k7ZoAZFyJg6d7iVFMM6izxebbYHTF+VP3DRCohKZFTZJWNwSYCOTSKvk2ADtiwGvuvDM/UfPPfU
	1wmfbXOyZB+GUZ6vTCvR9C9L5EAlITvM3/5i/VRSxaEI1PINDFwSYkUJ+64k=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:5184:b0:4aa:cad:cb4c with SMTP id
 5614622812f47-4b366908457mr14805744b6e.1.1787819622498; Thu, 27 Aug 2026
 01:33:42 -0700 (PDT)
Date: Thu, 27 Aug 2026 01:33:42 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8ff666.27659fcc.2ceef7.000f.GAE@google.com>
Subject: [syzbot] [mm?] WARNING in __split_vma
From: syzbot <syzbot+5c417b73ac02e0e352c4@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, jannh@google.com, liam@infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org, 
	pfalcato@suse.de, syzkaller-bugs@googlegroups.com, vbabka@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1645f979580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=5c417b73ac02e0e352c4
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=104a0d49580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13f35979580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-818bebeb.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6e4100526b12/vmlinux-818bebeb.xz
kernel image: https://storage.googleapis.com/syzbot-assets/723c4783ee96/bzImage-818bebeb.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5c417b73ac02e0e352c4@syzkaller.appspotmail.com

------------[ cut here ]------------
pgoff != vma->vm_start >> 12
WARNING: mm/vma.h:276 at assert_sane_pgoff mm/vma.h:276 [inline], CPU#2: syz.0.17/5920
WARNING: mm/vma.h:276 at vma_set_pgoff mm/vma.h:282 [inline], CPU#2: syz.0.17/5920
WARNING: mm/vma.h:276 at vma_add_pgoff mm/vma.h:289 [inline], CPU#2: syz.0.17/5920
WARNING: mm/vma.h:276 at __split_vma+0x1228/0x1800 mm/vma.c:578, CPU#2: syz.0.17/5920
Modules linked in:
CPU: 2 UID: 0 PID: 5920 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:assert_sane_pgoff mm/vma.h:276 [inline]
RIP: 0010:vma_set_pgoff mm/vma.h:282 [inline]
RIP: 0010:vma_add_pgoff mm/vma.h:289 [inline]
RIP: 0010:__split_vma+0x1228/0x1800 mm/vma.c:578
Code: 3c 02 00 0f 85 d3 05 00 00 4c 8b 2b 48 89 ef 49 c1 ed 0c 4c 89 ee e8 a7 3d 9e ff 4c 39 ed 0f 84 bf fd ff ff e8 b9 43 9e ff 90 <0f> 0b 90 e9 b1 fd ff ff e8 ab 43 9e ff 48 8b 54 24 38 48 b8 00 00
RSP: 0018:ffffc9000344f228 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff88803e4b23c0 RCX: 0000000000000000
RDX: ffff888030d0a580 RSI: ffffffff826cbe17 RDI: ffff888030d0a580
RBP: 0000000200000003 R08: 0000000000000006 R09: 0000000200000003
R10: 0000000200000ffd R11: 0000000000000000 R12: ffff88803e4b2410
R13: 0000000200000ffd R14: ffffc9000344f5c8 R15: 0000000000000000
FS:  000055555d60b500(0000) GS:ffff8880d5da2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ff66f270000 CR3: 000000001345e000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 vms_gather_munmap_vmas+0x1d2/0x1720 mm/vma.c:1472
 __mmap_setup mm/vma.c:2496 [inline]
 __mmap_region+0x4a7/0x30b0 mm/vma.c:2818
 mmap_region+0x5a8/0x6d0 mm/vma.c:2921
 do_mmap+0x12c7/0x1c30 mm/mmap.c:573
 vm_mmap_pgoff+0x28d/0x470 mm/util.c:581
 ksys_mmap_pgoff+0x3cb/0x610 mm/mmap.c:619
 __do_sys_mmap arch/x86/kernel/sys_x86_64.c:89 [inline]
 __se_sys_mmap arch/x86/kernel/sys_x86_64.c:82 [inline]
 __x64_sys_mmap+0x125/0x190 arch/x86/kernel/sys_x86_64.c:82
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff66f39e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffec1164ee8 EFLAGS: 00000246 ORIG_RAX: 0000000000000009
RAX: ffffffffffffffda RBX: 00007ff66f625fa0 RCX: 00007ff66f39e0d9
RDX: 0000000000000001 RSI: 0000000000003000 RDI: 0000200000ffd000
RBP: 00007ff66f435024 R08: 0000000000000004 R09: 0000010000000000
R10: 0000000000000011 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ff66f625fac R14: 00007ff66f625fa0 R15: 00007ff66f625fa0
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
