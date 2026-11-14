Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794659366;
	b=2rE9n4s08XNkg9V/3xGx0h/rnGY1pq5deYEGIhSJGpSfPkp6lDJm5lY40n3HSUqzOvuv
	 IZhdS5eAbwfZtNfjaw98weNw55hGKm655YFVVRCQKHxglck1xf4o5s6yoxi0qEmC+RPMe
	 GiFzmrujJmuW03ay07s7fQOeEq3vaBwJ6XigfkRfUGSlnrZFOiH9qf2/l3Qd+a8j8/CCB
	 zpZ/zcjlRDtZQnB/937KLW40PhatG6cgsNUFKk7yzPSrqYWlT+G0+eqdwAwZstP/r2U3G
	 gR5HAs+ABzaIW/gCHiR0mfL0RdSG5wznnGIFfQHKQr5nKAotkjSy6HPoYw9478rW/DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794659366;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=OXHD5Uokfvl6aJ4ScD7Bv2c5aa91gxV0mQD6awhz1gE=;
	b=E7dFqeS3p/tH05Dn+D+U9h0qlDtaXoiXP/aTWhBUi5qa2V8a4EEn7T1vtiM4R6tb9i07
	 D0OdnBtil9Wr/pzp0we15M5HujejT+tNWgywMUmzRcL07HL6+NlB7ZykfjVZWTcqn0ZHX
	 jdhIDeYH0pUJH7JdthvEUgoPRgHySOfrOuJ22oQJxbWUVa4o3if83VH34kzOKABUeKK/g
	 vMtG+GLiA4UiSol8D+PegHe3HsgJ/P1PFm5c07Y9WWpZ+RdibNlUVU931vQ7I+yyns2Xo
	 aEa3y3gW6cPKPGuCepShdWigwYOwvsCz1O4hngNjGMrnM2HWscT+l86YyUXocN8AStQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B93F606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B93F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4dab94dc3e7so3904254b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:29:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794659365; x=1795264165;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OXHD5Uokfvl6aJ4ScD7Bv2c5aa91gxV0mQD6awhz1gE=;
        b=RViXda/r28emaE+EJtJfVNGCkBZjuUTOEo/2YwG4sq7nmpiqcaZkV38dqHOZy1oBmX
         l7Wq9PA8Qkd3bKMfdzXxGTeDQT8oJr3XdgloIoBMs8U5TntpJYaY/oBXrPhCuL81HbGT
         UG9we64A9nKps25rZH//CFHhINIig8aUEHa2df7zUZEV9nr8ZL5Q9HAesiwOlSpPh0ig
         ifY/PLddQnoc+dVNB0riHVpePOGIoyjU6kCCYnwnMxyrTOqD5TDfdKTu7MlvOsJriixI
         73PWUjZsaedVesWJl97jAgwIt7CNuNikvDWi27nvobuxDbIxX/hDFJCKrzQIKUzSl491
         kZhQ==
X-Gm-Message-State: APuU4Z8CNSBn094xvpWoi9T6HmWhKX72tRqcLryxEBEnrEvi9gBmrAxN
	fQpWVCusIaBMhi+tYMCSvPxYi4rytORTvasBq0lYASGaEvw8+m6yq2Cj+tvXTqa8tO4toG1uGT+
	iRcTH+DqQH0KP+EQFFgVKz5RNa1kAVZ34EB59u4IqqXehOQmQaBZZZ5GQgjA=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1990:b0:4f4:d7:b15b with SMTP id
 5614622812f47-56e611e1b17mr4846541b6e.4.1794659365260; Sat, 14 Nov 2026
 04:29:25 -0800 (PST)
Date: Sat, 14 Nov 2026 04:29:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af85425.097d52ff.3d440.0006.GAE@google.com>
Subject: [syzbot] [squashfs?] general protection fault in __d_obtain_alias
From: syzbot <syzbot+5d7ba5f6127ed887f459@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, phillip@squashfs.org.uk, 
	squashfs-devel@lists.sourceforge.net, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    84abb955b101 Add linux-next specific files for 20261113
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=122fbda1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d9d5eeb0ba036071
dashboard link: https://syzkaller.appspot.com/bug?extid=5d7ba5f6127ed887f459
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=174cb369580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1136b011580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ffae1d4a717e/disk-84abb955.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/fd2a35a63abf/vmlinux-84abb955.xz
kernel image: https://storage.googleapis.com/syzbot-assets/039ccf647778/bzImage-84abb955.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/3d55211a7134/mount_0.gz

AI-generated root cause summary:
In fs/squashfs/inode.c:squashfs_read_inode(), squashfs_read_metadata() returns
the number of bytes read on success (e.g. sizeof(struct squashfs_dir_inode) ==
32) into err. When checking directory inodes (SQUASHFS_DIR_TYPE and
SQUASHFS_LDIR_TYPE) where inode->i_size < 3, the code jumps to failed_read via
goto without updating err to a negative error code (such as -EINVAL). As a
result, squashfs_read_inode() returns a positive integer (32 or 40), which
squashfs_iget() wraps with ERR_PTR(err) into (struct inode *)0x20. Callers like
d_obtain_alias() check IS_ERR(inode), which evaluates to false for positive
values, and subsequently dereference inode->i_sb at offset 0x28 (address 0x48),
triggering a near-NULL pointer dereference crash.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=5d7ba5f6127ed887f459

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5d7ba5f6127ed887f459@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 8
SQUASHFS error: Unable to read inode 0x87
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000009: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000048-0x000000000000004f]
CPU: 0 UID: 0 PID: 5647 Comm: syz-executor372 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
RIP: 0010:__d_obtain_alias+0x50/0x880 fs/dcache.c:2359
Code: e8 25 e6 64 ff eb 53 e8 1e e6 64 ff 49 c7 c5 8c ff ff ff eb 45 49 bf 00 00 00 00 00 fc ff df 49 8d 7d 28 48 89 f8 48 c1 e8 03 <42> 80 3c 38 00 74 05 e8 14 da e4 ff 4d 8b 75 28 4c 89 ef e8 a8 a8
RSP: 0018:ffffc90003b2f9d0 EFLAGS: 00010206
RAX: 0000000000000009 RBX: 0000000000000002 RCX: ffff888079600000
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000048
RBP: 0000000000000001 R08: ffffffff91bec8bf R09: 1ffffffff237d917
R10: dffffc0000000000 R11: fffffbfff237d918 R12: ffff88807deca000
R13: 0000000000000020 R14: 1ffff92000765f4c R15: dffffc0000000000
FS:  000055556efe9400(0000) GS:ffff8881233cd000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffc93144b5c CR3: 000000007b0fe000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 squashfs_export_iget+0x1d8/0x370 fs/squashfs/export.c:117
 exportfs_decode_fh_raw+0x1c8/0x770 fs/exportfs/expfs.c:460
 do_handle_to_path+0xa4/0x1a0 fs/fhandle.c:274
 handle_to_path fs/fhandle.c:423 [inline]
 do_handle_open+0x6dd/0xb10 fs/fhandle.c:447
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x00007fab5525dc49
Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff9e969ae8 EFLAGS: 00000246 ORIG_RAX: 0000000000000130
RAX: ffffffffffffffda RBX: 00007fab552bd0b0 RCX: 00007fab5525dc49
RDX: 0000000000000000 RSI: 0000200000000340 RDI: 0000000000000004
RBP: 0000000000000001 R08: 000055556efea580 R09: 000055556efea580
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fff9e969b10
R13: 0000000000000002 R14: 431bde82d7b634db R15: 00007fab552bd04b
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__d_obtain_alias+0x50/0x880 fs/dcache.c:2359
Code: e8 25 e6 64 ff eb 53 e8 1e e6 64 ff 49 c7 c5 8c ff ff ff eb 45 49 bf 00 00 00 00 00 fc ff df 49 8d 7d 28 48 89 f8 48 c1 e8 03 <42> 80 3c 38 00 74 05 e8 14 da e4 ff 4d 8b 75 28 4c 89 ef e8 a8 a8
RSP: 0018:ffffc90003b2f9d0 EFLAGS: 00010206
RAX: 0000000000000009 RBX: 0000000000000002 RCX: ffff888079600000
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000048
RBP: 0000000000000001 R08: ffffffff91bec8bf R09: 1ffffffff237d917
R10: dffffc0000000000 R11: fffffbfff237d918 R12: ffff88807deca000
R13: 0000000000000020 R14: 1ffff92000765f4c R15: dffffc0000000000
FS:  000055556efe9400(0000) GS:ffff8881233cd000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffc93144b5c CR3: 000000007b0fe000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	e8 25 e6 64 ff       	call   0xff64e62a
   5:	eb 53                	jmp    0x5a
   7:	e8 1e e6 64 ff       	call   0xff64e62a
   c:	49 c7 c5 8c ff ff ff 	mov    $0xffffffffffffff8c,%r13
  13:	eb 45                	jmp    0x5a
  15:	49 bf 00 00 00 00 00 	movabs $0xdffffc0000000000,%r15
  1c:	fc ff df
  1f:	49 8d 7d 28          	lea    0x28(%r13),%rdi
  23:	48 89 f8             	mov    %rdi,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1) <-- trapping instruction
  2f:	74 05                	je     0x36
  31:	e8 14 da e4 ff       	call   0xffe4da4a
  36:	4d 8b 75 28          	mov    0x28(%r13),%r14
  3a:	4c 89 ef             	mov    %r13,%rdi
  3d:	e8                   	.byte 0xe8
  3e:	a8 a8                	test   $0xa8,%al


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
