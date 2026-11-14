Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794666453;
	b=Wmx83NlWvSPR8hU6wvoL1mnqyc7SVJ2uyucDCpBrkrpaVHWHzd0bDs9+2SQtL2zFVdxu
	 V/F0WoR3ej3EJI21bt6VNh/9RVmdTNj2Jj+CKQ8hIcXA93vtVSTHuyoio/Jz9kjhgmf1s
	 hCDOd0eZLfWubuzZ4y8a4iUzCxNllREaubTsrUT97yV1Zh4kOPk3tQw0OFJgQWnrAN/HI
	 3FCmKVofzFiT5Z5cHaBkWhLy437G2ygChoOQjGhnVjnVzN13umTEYamFGagIXt4UAXwJv
	 bqJJxlFC96+NdPw/YoEamBIevXD31mLZQc3oAwrPZ5zT3/9SliIPs09hVBiuxaFpMWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666453;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=YfG/qSQI5pTIdG2JUWK/8TRtadRGl682+LLoIQ+5zow=;
	b=p7JoYshpOj0UjsSvmct4bHDVfGYMUy2qUffYfwIdUk4R+2j4LXJkEB0EiHyUcZhCyhRN
	 JA/xd0NBuJdtCfo7V5+fEhIXYb4/XwPlJtdkTw2Xw/xjJXrVwfcCI0hYAsxBzrkG6CkUl
	 CKOOBBKJU0imSp+lW7047ys4D6SJRLY/J12X0lZulZpG8/8KHgHgLA2c6CkWdgt+6bV0z
	 kC0qrf9j38G/dcA2VYvB1fJTxUXqqt2mxn48x5VmS31uXqqPbzgbJBgr2p9gHaNttJfB/
	 nLVuREs3r1jMEIRiDzXyMv23x/M0FoB08jHuJ+5wjA/dWRS5B4I9F5CGuNzLrzflvFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449E8606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 449E8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-847e2926d94so4474674a34.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:27:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794666452; x=1795271252;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YfG/qSQI5pTIdG2JUWK/8TRtadRGl682+LLoIQ+5zow=;
        b=0Ze4NzwxRVvVFQtVUhWxho7RPOVL5nXI34wg6O9TacSmOPzQw9j6yKAkw8YLkIwRo9
         563859QDFBrGrEpIJj2JOZk9Kx1uMIAlEHSnS8X0qI+YZeMXvZmDZYFIm1tc4V4H9pKx
         R82s/c6QF/ebD34SurDujePtrAbD9TKf4Kp+duAK0AXM/7s4rnQMKRCDMHsXaKFooWYs
         11xME66ypJdqwQJWuBvco7WyjRhF1TE1MLzkAGXjto3SVfscvmZKkixcBNIsdIrfaaH5
         awMHrBXXIKDDhuL4aHCOFvJq6ktsJWo85pnJzhnVUqYssrsw2CKW1kCetDujPgd+NJTk
         sQzQ==
X-Forwarded-Encrypted: i=1; AL+hErGinxTAdeQ+ohKibEfPhe5if1ckhBNzimaX0RpRi06xWhiSaI31OTkWirlMIdkIfSN0tRaSgq2tgclLcm4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+puefJ8BszxINYQFhRsEZcAZb/1JcwI6uLGUdotBAkf7dP2QW2
	tWMFgssAZa0Ve2Nvx7qWIpmBokc8PFE7T3f+EAXlU3cjvXbNhUArI3GHn0Eqwldmk8sGLrE3NRE
	OIJ0s+nTaFkuMJNloYFy+HNulhZMAevU4DGhcxiQcEc0siqL0xFHJLiMDLvQ=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2208:b0:572:d0fb:ae57 with SMTP id
 5614622812f47-572d10afe15mr174078b6e.28.1794666452208; Sat, 14 Nov 2026
 06:27:32 -0800 (PST)
Date: Sat, 14 Nov 2026 06:27:32 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af86fd4.07d0a7c9.39b765.0005.GAE@google.com>
Subject: [syzbot] [squashfs?] kernel BUG in vfs_get_tree (3)
From: syzbot <syzbot+7b1d0ea11475e857d063@syzkaller.appspotmail.com>
To: brauner@kernel.org, jack@suse.cz, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phillip@squashfs.org.uk, 
	squashfs-devel@lists.sourceforge.net, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    84abb955b101 Add linux-next specific files for 20261113
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=149b45be580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d9d5eeb0ba036071
dashboard link: https://syzkaller.appspot.com/bug?extid=7b1d0ea11475e857d063
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17da103d580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1352844d580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ffae1d4a717e/disk-84abb955.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/fd2a35a63abf/vmlinux-84abb955.xz
kernel image: https://storage.googleapis.com/syzbot-assets/039ccf647778/bzImage-84abb955.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/dbda48ecccdc/mount_0.gz

AI-generated root cause summary:
In squashfs_read_inode(), reading directory metadata via
squashfs_read_metadata() returns the positive number of bytes read (32 for
SQUASHFS_DIR_TYPE and 40 for SQUASHFS_LDIR_TYPE). When the directory size sanity
check fails (inode->i_size < 3), the code jumps to failed_read without setting
err to a negative errno such as -EINVAL. Consequently, squashfs_read_inode()
returns positive 40 (or 32), which propagates up through squashfs_fill_super()
and get_tree_bdev() to vfs_get_tree(). Because vfs_get_tree() only checks for
error < 0, it observes a positive return value without fc->root being populated,
triggering an explicit kernel BUG().

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=7b1d0ea11475e857d063

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7b1d0ea11475e857d063@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 8
SQUASHFS error: Unable to read inode 0x11f
Filesystem squashfs get_tree() didn't set fc->root, returned 40
------------[ cut here ]------------
kernel BUG at fs/super.c:2174!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 5645 Comm: syz-executor247 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
RIP: 0010:vfs_get_tree+0x29c/0x2a0 fs/super.c:2174
Code: 1b 48 89 d8 48 c1 e8 03 42 80 3c 28 00 74 08 48 89 df e8 07 2b eb ff 48 8b 33 48 c7 c7 00 6b 40 8c 44 89 f2 e8 85 81 c9 fe 90 <0f> 0b 66 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f
RSP: 0018:ffffc90003a67c88 EFLAGS: 00010246
RAX: 000000000000003f RBX: ffffffff903c9a60 RCX: f236a142641ab000
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffc90003a67df0 R08: ffffffff9014d12b R09: 1ffffffff2029a25
R10: dffffc0000000000 R11: fffffbfff2029a26 R12: 1ffff11003b5f455
R13: dffffc0000000000 R14: 0000000000000028 R15: 0000000000000000
FS:  0000555561a2d400(0000) GS:ffff8881233cd000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffd3ab27000 CR3: 000000007b7a8000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 fc_mount fs/namespace.c:1300 [inline]
 do_new_mount_fc fs/namespace.c:4030 [inline]
 do_new_mount+0x325/0xb00 fs/namespace.c:4106
 do_mount fs/namespace.c:4470 [inline]
 __do_sys_mount fs/namespace.c:4683 [inline]
 __se_sys_mount+0x31d/0x420 fs/namespace.c:4660
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x00007f7481046aca
Code: 56 53 b8 9d 00 00 00 0f 05 83 f8 ea 75 a2 c7 05 c4 ff 08 00 00 00 00 00 eb 96 e8 51 05 00 00 90 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd3ab26658 EFLAGS: 00000206 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffd3ab26680 RCX: 00007f7481046aca
RDX: 00002000000001c0 RSI: 0000200000000200 RDI: 00007ffd3ab26680
RBP: 00002000000001c0 R08: 00007ffd3ab266c0 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000200000000200
R13: 00007ffd3ab266c0 R14: 0000000000000003 R15: 0000000000000000
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:vfs_get_tree+0x29c/0x2a0 fs/super.c:2174
Code: 1b 48 89 d8 48 c1 e8 03 42 80 3c 28 00 74 08 48 89 df e8 07 2b eb ff 48 8b 33 48 c7 c7 00 6b 40 8c 44 89 f2 e8 85 81 c9 fe 90 <0f> 0b 66 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f
RSP: 0018:ffffc90003a67c88 EFLAGS: 00010246
RAX: 000000000000003f RBX: ffffffff903c9a60 RCX: f236a142641ab000
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffc90003a67df0 R08: ffffffff9014d12b R09: 1ffffffff2029a25
R10: dffffc0000000000 R11: fffffbfff2029a26 R12: 1ffff11003b5f455
R13: dffffc0000000000 R14: 0000000000000028 R15: 0000000000000000
FS:  0000555561a2d400(0000) GS:ffff8881233cd000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffd3ab27000 CR3: 000000007b7a8000 CR4: 00000000003526f0


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
