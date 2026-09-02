Received: from mail-oo2-f9.google.com (mail-oo2-f9.google.com [74.125.231.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCEB274B4A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 03:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788320504; cv=none; b=NoCmNHlTbhu9x721G6lE0f7I2aElq/AStgPL5a502NgXau+WjxhfXfz3UYgviMfsHgmjhlSWj1EVOPaeahXxc/+19IVWGXV1Hc57QL7vsehgTv1bm5AVXT1b8ib+m4PqXFKBBDj8N7uKp/pu+PfitWjrz9nsC75vJPZRV4FHP7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788320504; c=relaxed/simple;
	bh=pjoTA2Nr2VnrZDfw8norahjrz+TaPFTdXgMCkoIIWMQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=JirgO3kBqBxzIWnTmJHDaiEEpKnhx+LdKf8PPxRGSauIFoCaKxrZyaCY8lLYJfxyzKllamQfnOJdiZ717swqzvYG7ERUV61S1P+EN9lWFtXnbwfXlGyppQXFd3by1ioCl0+JE537ghkQEO8J/Glsox0wMfdLoKE+uTIZs6CFZlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f9.google.com with SMTP id 006d021491bc7-6b136fad4b3so155935eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 20:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788320501; x=1788925301;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WknVe6YbEwHTjQ8SnS3LNO11L5BkxkkKwGa2maUHawk=;
        b=FcPeR5a3IqLIZZXM4hjWFEJk3JA+s5ol/QjY/9pyPV7NJLIcjUe0ah8EzMd/3mC3r1
         BHB5y5EI3bAUKtUf6J7XLx88HmlI8uZCrK9gRxfgWIanxSPs0SsYHokPatcYL0n7fY/q
         BO9ii410zlH/vTpdLiB5nPDITHav9/zfIVlgR/7qMalq9PlShljfW6oHJnmpotnjA42j
         Rew0rR9J3CySgpUVie2i+vAyqy38cc65QWb4MV84Bya0ygOt6fFB3SUJ2JBcjTJfk94x
         kZ5IkeldlfqdgwH/le7y06l8mxtcLGndndZueiroamh6UAHD7B0eHviOmRfvuxncK2T6
         NsYg==
X-Forwarded-Encrypted: i=1; AHgh+RodpUAYI5kU7bUTv+7DC/DeLNZnHVMyDMvjC9RfHa80s8nckcfLioEgbGXFf9kZ9F/8eN3C9jX1ISaLNXQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n/4JO8PPgW138HrHJ+U6Z4aWuqqBXxdqgq3Me/CQ0wCkaEO5TV
	8tec0QjCemewGKQMTLVYUuaCuw7/sDcKExkkEznuTHxFUnCn+K0ngVTuNuMkJHfn1EGTahIPjSO
	r6twQOemCvtSnaemh26htJJZ+j3y2eG3VCkRLSIMI5+nbMyRriFKJVu2VMko=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c84:b0:6b1:6136:956a with SMTP id
 006d021491bc7-6b47fc2dfa3mr1688847eaf.15.1788320501447; Tue, 01 Sep 2026
 20:41:41 -0700 (PDT)
Date: Tue, 01 Sep 2026 20:41:41 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a979af5.e163c37b.143a1.0004.GAE@google.com>
Subject: [syzbot] [f2fs?] general protection fault in new_curseg
From: syzbot <syzbot+ae5b8eb92ed40411ce16@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    89a312991dc6 Merge tag 'cifs-fixes-7.3-rc2' of https://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1075e779580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e909ffe6b35dddb7
dashboard link: https://syzkaller.appspot.com/bug?extid=ae5b8eb92ed40411ce16
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-89a31299.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/114a4744ab8e/vmlinux-89a31299.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c65021627f2c/bzImage-89a31299.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ae5b8eb92ed40411ce16@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc000000000c: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000060-0x0000000000000067]
CPU: 0 UID: 0 PID: 12 Comm: kworker/u4:0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: writeback wb_workfn (flush-7:0)
RIP: 0010:f2fs_dev_is_alloc_blocked fs/f2fs/segment.h:956 [inline]
RIP: 0010:get_new_segment fs/f2fs/segment.c:2964 [inline]
RIP: 0010:new_curseg+0x1134/0x3580 fs/f2fs/segment.c:3110
Code: e8 21 ab ce fd 48 8b 7c 24 30 48 8b 07 49 6b cf 70 4c 8d 34 08 49 83 c6 61 4c 89 f0 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df <0f> b6 04 08 84 c0 0f 85 73 11 00 00 41 80 3e 00 0f 84 e6 00 00 00
RSP: 0018:ffffc9000025e628 EFLAGS: 00010206
RAX: 000000000000000c RBX: 0000000000008000 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 0000000000008000 RDI: ffff888012125a88
RBP: 0000000000000000 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffff5200004bcb4 R12: ffff888052be0000
R13: 0000000000000004 R14: 0000000000000061 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff88808c2cf000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200001000000 CR3: 000000004fe72000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 f2fs_allocate_data_block+0x229c/0x43c0 fs/f2fs/segment.c:3979
 do_write_page+0x13f/0x880 fs/f2fs/segment.c:4099
 f2fs_outplace_write_data+0x11a/0x220 fs/f2fs/segment.c:4175
 f2fs_write_compressed_pages fs/f2fs/compress.c:1403 [inline]
 f2fs_write_multi_pages+0x43bb/0x6370 fs/f2fs/compress.c:1602
 f2fs_write_cache_pages fs/f2fs/data.c:3351 [inline]
 __f2fs_write_data_pages fs/f2fs/data.c:3603 [inline]
 f2fs_write_data_pages+0x19bb/0x36f0 fs/f2fs/data.c:3641
 do_writepages+0x338/0x560 mm/page-writeback.c:2560
 __writeback_single_inode+0x136/0x1220 fs/fs-writeback.c:1788
 writeback_sb_inodes+0x9de/0x1b00 fs/fs-writeback.c:2099
 __writeback_inodes_wb+0x114/0x240 fs/fs-writeback.c:2175
 wb_writeback+0x42f/0xad0 fs/fs-writeback.c:2286
 wb_check_start_all fs/fs-writeback.c:2412 [inline]
 wb_do_writeback fs/fs-writeback.c:2459 [inline]
 wb_workfn+0x980/0x10f0 fs/fs-writeback.c:2497
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f2fs_dev_is_alloc_blocked fs/f2fs/segment.h:956 [inline]
RIP: 0010:get_new_segment fs/f2fs/segment.c:2964 [inline]
RIP: 0010:new_curseg+0x1134/0x3580 fs/f2fs/segment.c:3110
Code: e8 21 ab ce fd 48 8b 7c 24 30 48 8b 07 49 6b cf 70 4c 8d 34 08 49 83 c6 61 4c 89 f0 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df <0f> b6 04 08 84 c0 0f 85 73 11 00 00 41 80 3e 00 0f 84 e6 00 00 00
RSP: 0018:ffffc9000025e628 EFLAGS: 00010206
RAX: 000000000000000c RBX: 0000000000008000 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 0000000000008000 RDI: ffff888012125a88
RBP: 0000000000000000 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffff5200004bcb4 R12: ffff888052be0000
R13: 0000000000000004 R14: 0000000000000061 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff88808c2cf000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200001000000 CR3: 000000004fe72000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	e8 21 ab ce fd       	call   0xfdceab26
   5:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
   a:	48 8b 07             	mov    (%rdi),%rax
   d:	49 6b cf 70          	imul   $0x70,%r15,%rcx
  11:	4c 8d 34 08          	lea    (%rax,%rcx,1),%r14
  15:	49 83 c6 61          	add    $0x61,%r14
  19:	4c 89 f0             	mov    %r14,%rax
  1c:	48 c1 e8 03          	shr    $0x3,%rax
  20:	48 b9 00 00 00 00 00 	movabs $0xdffffc0000000000,%rcx
  27:	fc ff df
* 2a:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax <-- trapping instruction
  2e:	84 c0                	test   %al,%al
  30:	0f 85 73 11 00 00    	jne    0x11a9
  36:	41 80 3e 00          	cmpb   $0x0,(%r14)
  3a:	0f 84 e6 00 00 00    	je     0x126


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
