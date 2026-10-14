Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89DF3515F1
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967057; cv=none; b=P4h1q3rnjAHNsfozOgW1ZI3X/qH7vFCMCxAHYcEIBTB3sloOWOn2ddzVNMAQ5+03vZDEK0BQZz2pZVMXtKk2lxLi8wxaXKAVzZiZHVBLGXfrPBMycnWPVrL0KN2x3gW0ey/oJCQOlpbKcfp4ZTtonsFOyZ2TCnwUfNRGBIorlKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967057; c=relaxed/simple;
	bh=Mks9C4jhJpesQrrWhQu4fO5sEuKlhmQaCEdEM2kf0yw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=noTgR4caaBRj7LCLIdxu3OZwMKuixHFVVugJuMxAjTUCCiV+uRFdAMZ/Qpe3x+QQrv0uaxC5iuOuEyCnmwfQzsy89zoITuADtSkSzqpr2/W8BHutlVUtsHMGFvpB6V1f1qatkfS2eu2zWly+pG0tBmM4eXoOJ1B2UxrJ7tC5C/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-809f1af7992so9172985a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791967054; x=1792571854;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CPlslS4763Ppg94O9SfZOlLgJkMA8tc2UJYAoGMUcXA=;
        b=zTMiE+8F1yzyRO6l+jg+c7Hpw1iJfOaX2sl2XV4vpNnxYojBWKMjKDyZ1KAc/OGYQn
         C7YYMFa+gTX/j3aqtOla6lsnB/Hv9jprwtMljoRDYL8uv04okheFMqPsEp+w+4fkJmFZ
         nrl0/J26R114rLZl/vsmzbfK4vF9uQnEFWO2N+Nu7bAONP5fItdQ675sP3XK92LaGy6E
         5koehT0+EaWiuF7o4oOvYm03x4VG7sU+RMIu3P9XMbdX9Hr8xOQKMIPgnztXgZHnmL0b
         zVEbMnj67OFRzyCdZf44QnNXAnEfnyg9xgr6lT+dVLYcQAs7v5zKA1oDfiCBC5JgJUM4
         OZig==
X-Forwarded-Encrypted: i=1; AKwUvBwRQwBuLhohKx8p4AaX2upiCDRkpOSYH0bnjbxnietcu9gizSTW2UxSiMCCC4SCh3FeI7Gs8TNaRlwx5yU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxim7gPHrG63oUIXwLSjne2tYDyS2FrAJwIgejfHBRdRq5CGHo
	XUgf/ygU1qG+O1CLVhHe43THMI3Fmiu1efFAt0szup7/KP8K4pCtWBzSe5zo1N9aYdWb/5Wa+cn
	m0cUPUADs8T0Ap9xJxEDoWarFQen21co6Qp9VKi4x8ZdOsPxtDfequ594A90=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:308f:b0:4b9:a8ac:480 with SMTP id
 5614622812f47-50c50f29888mr15942933b6e.30.1791967054743; Wed, 14 Oct 2026
 01:37:34 -0700 (PDT)
Date: Wed, 14 Oct 2026 01:37:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6acf3f4e.38256f13.2006af.00d6.GAE@google.com>
Subject: [syzbot] [bpf?] general protection fault in bpf_inode_storage_free
From: syzbot <syzbot+b547ffac63b636628299@syzkaller.appspotmail.com>
To: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	daniel@iogearbox.net, eddyz87@gmail.com, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	martin.lau@linux.dev, memxor@gmail.com, song@kernel.org, 
	syzkaller-bugs@googlegroups.com, yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    becb95e45ef0 Add linux-next specific files for 20261009
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=116cc1d1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=90dad226b9b89d98
dashboard link: https://syzkaller.appspot.com/bug?extid=b547ffac63b636628299
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=132f268e580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1622f435580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c2788d0b538b/disk-becb95e4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/13231cbc415a/vmlinux-becb95e4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e6abf775ab73/bzImage-becb95e4.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/ac2293f9c36f/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=166cc1d1580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b547ffac63b636628299@syzkaller.appspotmail.com

ERROR: (device loop0): jfs_readdir: JFS:Dtree error: ino = 2, bn=0, index = 3
ERROR: (device loop0): jfs_readdir: JFS:Dtree error: ino = 2, bn=0, index = 5
Oops: general protection fault, probably for non-canonical address 0xdffffc018ef8da81: 0000 [#1] SMP KASAN PTI
KASAN: probably user-memory-access in range [0x0000000c77c6d408-0x0000000c77c6d40f]
CPU: 1 UID: 0 PID: 5630 Comm: syz-executor383 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:bpf_inode_storage_free+0x1f4/0x5c0 kernel/bpf/bpf_inode_storage.c:67
Code: d2 c1 d2 ff c6 05 75 65 6d 0f 01 48 c7 c7 60 3f 17 8c be 53 03 00 00 48 c7 c2 a0 3f 17 8c e8 c3 21 ae ff 4c 89 f0 48 c1 e8 03 <42> 80 3c 20 00 74 08 4c 89 f7 e8 8d b0 45 00 4d 8b 36 e8 d5 24 f9
RSP: 0018:ffffc90003a6f8f0 EFLAGS: 00010206
RAX: 000000018ef8da81 RBX: ffff888075cd04c0 RCX: ffff888075cd0000
RDX: 0000000000000000 RSI: ffffffff8c6e2360 RDI: ffffffff8c6e2320
RBP: 0000000000000001 R08: ffffffff81f5d602 R09: 0000000000000000
R10: dffffc0000000000 R11: fffffbfff1f42939 R12: dffffc0000000000
R13: 1ffff1100eb9a098 R14: 0000000c77c6d408 R15: ffffffff81f5d602
FS:  0000000000000000(0000) GS:ffff888123bad000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f86a058ebbc CR3: 000000000fb48000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 security_inode_free+0xdc/0x180 security/security.c:1289
 __destroy_inode+0x2a1/0x630 fs/inode.c:363
 destroy_inode fs/inode.c:386 [inline]
 evict+0x8d4/0xb50 fs/inode.c:847
 dispose_list fs/inode.c:865 [inline]
 evict_inodes+0x844/0x8c0 fs/inode.c:918
 generic_shutdown_super+0xaa/0x2d0 fs/super.c:737
 kill_block_super+0x44/0xa0 fs/super.c:1914
 deactivate_locked_super+0xbe/0x110 fs/super.c:586
 cleanup_mnt+0x204/0x2a0 fs/namespace.c:1392
 task_work_run+0x1d9/0x260 kernel/task_work.c:233
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x705/0x2380 kernel/exit.c:980
 do_group_exit+0x22d/0x2f0 kernel/exit.c:1123
 __do_sys_exit_group kernel/exit.c:1134 [inline]
 __se_sys_exit_group kernel/exit.c:1132 [inline]
 __x64_sys_exit_group+0x3f/0x40 kernel/exit.c:1132
 x64_sys_call+0x18c6/0x18d0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f86a052dac5
Code: Unable to access opcode bytes at 0x7f86a052da9b.
RSP: 002b:00007ffcb03fbdc8 EFLAGS: 00000206 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 00007f86a052dac5
RDX: 00000000000000e7 RSI: ffffffffffffffd8 RDI: 0000000000000001
RBP: 0000000000000000 R08: 0000000000000000 R09: 00000000ffffffff
R10: 0000000000000100 R11: 0000000000000206 R12: 0000000000000001
R13: 00007f86a05c6110 R14: 00007f86a05c86a8 R15: 00007f86a05c86c0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:bpf_inode_storage_free+0x1f4/0x5c0 kernel/bpf/bpf_inode_storage.c:67
Code: d2 c1 d2 ff c6 05 75 65 6d 0f 01 48 c7 c7 60 3f 17 8c be 53 03 00 00 48 c7 c2 a0 3f 17 8c e8 c3 21 ae ff 4c 89 f0 48 c1 e8 03 <42> 80 3c 20 00 74 08 4c 89 f7 e8 8d b0 45 00 4d 8b 36 e8 d5 24 f9
RSP: 0018:ffffc90003a6f8f0 EFLAGS: 00010206
RAX: 000000018ef8da81 RBX: ffff888075cd04c0 RCX: ffff888075cd0000
RDX: 0000000000000000 RSI: ffffffff8c6e2360 RDI: ffffffff8c6e2320
RBP: 0000000000000001 R08: ffffffff81f5d602 R09: 0000000000000000
R10: dffffc0000000000 R11: fffffbfff1f42939 R12: dffffc0000000000
R13: 1ffff1100eb9a098 R14: 0000000c77c6d408 R15: ffffffff81f5d602
FS:  0000000000000000(0000) GS:ffff888123bad000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f86a058ebbc CR3: 000000000fb48000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	d2 c1                	rol    %cl,%cl
   2:	d2 ff                	sar    %cl,%bh
   4:	c6 05 75 65 6d 0f 01 	movb   $0x1,0xf6d6575(%rip)        # 0xf6d6580
   b:	48 c7 c7 60 3f 17 8c 	mov    $0xffffffff8c173f60,%rdi
  12:	be 53 03 00 00       	mov    $0x353,%esi
  17:	48 c7 c2 a0 3f 17 8c 	mov    $0xffffffff8c173fa0,%rdx
  1e:	e8 c3 21 ae ff       	call   0xffae21e6
  23:	4c 89 f0             	mov    %r14,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1) <-- trapping instruction
  2f:	74 08                	je     0x39
  31:	4c 89 f7             	mov    %r14,%rdi
  34:	e8 8d b0 45 00       	call   0x45b0c6
  39:	4d 8b 36             	mov    (%r14),%r14
  3c:	e8                   	.byte 0xe8
  3d:	d5 24 f9             	{rex2 0x24} stc


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
