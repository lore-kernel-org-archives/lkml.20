Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794191859;
	b=gYm3AB0+ha08hxXs5LVdo3NEAasKtblbVPt+ZrMtn87bFgNf45p10F48UTPdBDM0grgM
	 k3gcVU8P+WiioKV981hWjrVbBiMRbv58KBPCuLfq+GQaNLRqi1ENNAcB9rXSq26kaI1Lz
	 JKpnq2QLwnFS5VI2iGEyXGsCYCTOShf6S7ls/Sz4pGzOF143K77gXh+XvrDkVg6+s8hju
	 6NbLt/DEVi6JGNaAoLiQCcDy0edbmIyPwZ396NjU5sXwFiX3UEK0V/JOoFF0mgl0v7lbc
	 MuE4h7/ZbnvGEDqNb7EBeuxFHmI4Bxdw+m6nJ+16ussz2afopb2s12ZYnv+2HPBMrOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794191859;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=9rXEcNZzcZAe4iE0p0XDHsc0VjCCW/UujjQm/s4ivWE=;
	b=EFQCQ7NIYpZuFm2yen5h7CK68hWoFLwAFAQo3nlUfJnxTmd7WHmmXjSY1dVukuQl6AQr
	 /N1rKKTDASZ+pM7R89bfsPcgdCK9mBU6mUcpf5RkqqbP7Zg7HBlFUuFY5Oh+G/iDw0ZD9
	 XSX1G+SQDOuZ6xRYYREEPf0pwdjd+1/Xl8HiJeXoYnF7/K6YtUHqQcnXM8zFDdmxKPFNV
	 QyB/F8o0vIIJSx7Qcw7/dl9gca1hO3+2zW4WG3HP+Xl9D/VQ/YbIxj4GIWGUa4ZuDQvzc
	 mIjOp1DH7EJdlNQ/NzkZgq6ZuPeLQL1G+Whc5uSNF73/O/2ujSylwMY4BlbIJrDOf1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBF2606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:37:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DBF2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4f4612a1a5cso611092b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 18:37:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794191858; x=1794796658;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9rXEcNZzcZAe4iE0p0XDHsc0VjCCW/UujjQm/s4ivWE=;
        b=rqYwxJjuGOESpTDf0Kp4wDVxgTxaSUL9pxTImRihFASQ5ou6u+ipfNEf27cyA/0/fO
         rPnPKI9oPF0wvUeTIE7ebiEjcxLQUSX1gYk3JjbpUDEiYRlEcnGwn/e7Og1gqndNGhzi
         v4V0Ic5BKIyuQIYeunLNIWoTZdU7ukiYM3rL+rOwi1+x0FVWqn3n4VmquT5fTpg6Ochq
         Kgoi3pkYwvkaX6OS9BOQg0rg14HcVKhTS47DyH5REC8IPlybVe029ICcCf6jIPj6/qPS
         hKULLay6E+i9UI7LgKjh80GHitwhRKEtRE4DqBIOHk2mRe32pvv7Exveq1p4pd1jlcJK
         nXrw==
X-Forwarded-Encrypted: i=1; AL+hErEw/xvGStir9yHC3yVEtTa3lkBtra1+A4tV/IS2ZCLLEHqbgvn6pqZd6/vwsy76zHB9CI6/Rrnp9xZlMmg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DjRVeZUjULDJAIUZ/nt2jSuuvF4fDQ64qYBSfsHlyoOfKcut8
	b1y6S1NLxeVFpDcWUAWY4Mjd4w+I85m3VC9Zfi8mnZP+TVxdP9EG+BrC8/b/theGXhQ+q0QP1am
	QhvSKV1ABkPzZCvkxCb93maEUq7nBt2K3k9+yKvLXlSDoSkoWVuqriS/kcCc=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:518b:b0:495:f8a5:8797 with SMTP id
 5614622812f47-567fcf350damr2647509b6e.0.1794191858336; Sun, 08 Nov 2026
 18:37:38 -0800 (PST)
Date: Sun, 08 Nov 2026 18:37:38 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af131f2.44d55313.247daf.0001.GAE@google.com>
Subject: [syzbot] [btrfs?] WARNING in btrfs_put_root
From: syzbot <syzbot+55d1814e49f1fc0ba542@syzkaller.appspotmail.com>
To: dsterba@suse.com, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mason@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    fa4ad798f6f6 Merge tag 'for-7.4-rc1-tag' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16f5af35580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d44b06612b68f56
dashboard link: https://syzkaller.appspot.com/bug?extid=55d1814e49f1fc0ba542
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7a262c93f0a1/disk-fa4ad798.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/670f0137c169/vmlinux-fa4ad798.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7b5f342645af/bzImage-fa4ad798.xz

AI-generated root cause summary:
When a Btrfs filesystem encounters a transaction abort (reported in state EA),
inodes being evicted during unmount (particularly via delayed iputs in
close_ctree(), which runs after btrfs_error_commit_super()) fail to persist
their delayed inode updates in btrfs_commit_inode_delayed_inode() because
transaction joining fails. In btrfs_evict_inode(), this error causes execution
to jump directly to the out label, bypassing btrfs_kill_delayed_inode_items().
Because the delayed items remain uncleaned, __btrfs_release_delayed_node()
re-queues the delayed node into delayed_root->node_list and retains a reference,
preventing refcount_dec_and_test() from hitting zero and skipping
xa_erase(&root->delayed_nodes, ...). When the root is finally freed in
btrfs_put_root(), root->delayed_nodes is still non-empty, triggering
WARN_ON(!xa_empty(&root->delayed_nodes)).

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=55d1814e49f1fc0ba542

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+55d1814e49f1fc0ba542@syzkaller.appspotmail.com

BTRFS info (device loop6 state EA): last unmount of filesystem 395ef67a-297e-477c-816d-cd80a5b93e5d
------------[ cut here ]------------
!xa_empty(&root->delayed_nodes)
WARNING: fs/btrfs/disk-io.c:1844 at btrfs_put_root+0x1f9/0x250 fs/btrfs/disk-io.c:1844, CPU#1: syz-executor/6160
Modules linked in:
CPU: 1 UID: 0 PID: 6160 Comm: syz-executor Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
RIP: 0010:btrfs_put_root+0x1f9/0x250 fs/btrfs/disk-io.c:1844
Code: c5 0e fe e8 b9 81 a3 fd 48 8d bb 40 05 00 00 90 0f 0b 90 e8 69 98 de 07 e9 9b fe ff ff e8 9f 81 a3 fd 48 8d bb 90 05 00 00 90 <0f> 0b 90 e8 4f 98 de 07 e9 ad fe ff ff e8 85 81 a3 fd 90 0f 0b 90
RSP: 0018:ffffc90006287d18 EFLAGS: 00010293
RAX: ffffffff84258d21 RBX: ffff888079a62000 RCX: ffff8880233e8000
RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff888079a62590
RBP: 0000000000000001 R08: ffff888079a6262b R09: 1ffff1100f34c4c5
R10: dffffc0000000000 R11: ffffed100f34c4c6 R12: dffffc0000000000
R13: ffff888069f06218 R14: ffff888079a625d8 R15: dffffc0000000000
FS:  000055556295c500(0000) GS:ffff888123509000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007faacae5e000 CR3: 000000001ef0b000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 btrfs_free_fs_info+0x252/0x360 fs/btrfs/disk-io.c:1257
 deactivate_locked_super+0xbe/0x110 fs/super.c:558
 cleanup_mnt+0x204/0x2a0 fs/namespace.c:1396
 task_work_run+0x1d9/0x260 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
 exit_to_user_mode_loop+0x204/0x770 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:343 [inline]
 do_syscall_64+0x328/0x520 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb8687a0d57
Code: a2 c7 05 9c a9 25 00 00 00 00 00 eb 96 e8 e1 12 00 00 90 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 e8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffc6dae6688 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00007fb8687a0d57
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffc6dae6740
RBP: 00007ffc6dae6740 R08: 00007ffc6dae7740 R09: 00000000ffffffff
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffc6dae77d0
R13: 00007fb868836fb3 R14: 0000000000041ae3 R15: 00007ffc6dae7810
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
