Received: from mail-oi2-f2.google.com (mail-oi2-f2.google.com [74.125.231.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5181D3264C7
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 07:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787986958; cv=none; b=jVf6z9mH7r4VGkU7t90A4UFSPjlU5Pd5BkU0y7S3S/9rXfv9BltsltrJeBs1b9Uv1oNbMi4Httn3DpbMehbnArPnJdoo5WADSGttrR8HANYxfVntCfIw4ntv2q0+ObfOOW2/H5pNk4k53dEtDZkJiczKamg8vea91f2W9wjGMP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787986958; c=relaxed/simple;
	bh=kbNeXW/ICKHU30aJ/o4rsV0t4dRnuC4Lb/lKpiyyjL0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=M8l48/A+jPt3b6TmmfSYLDSq+rZJXbnfERFYGDrbX/q9rVsKkSlppVXNA1HyhkUbfMaavX4aqQo6HekhbfloJonM3t7CKqabtI4RmgLstmSwfbqq9sABU2NSIguOOXe9pKtSGXiIjWReSPiL3CxPAKNWb2HOKBr1RgdbnQuc2os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f2.google.com with SMTP id 46e09a7af769-7f4e9ec63a7so470211a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 00:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787986956; x=1788591756;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DUXjaMzi5/EgJKrAoped5owNC5y56qkeKiobRo8ozcI=;
        b=GpMao132WIIAV1Es1GRWbC/P3tAD3zekIRok/W1hWiNeQyZkefuijhd85oGp+doupI
         6UjbckyFchjP3+9WkMRTg/U4Tk4D2D7q3DXdUW+cEGV/o8tTkrBy8F73Mgxxwn8dkcgX
         vhydW1lvfcJX6tPTEmgYlSg70X95Lgqp7vy0EwNPoRly8rUjsSdR957CZRbwUH22n/Ok
         jhd4KDKOGKyHaox2zaBpx/79wZ0upXfdQKIMAKLFsNhuP9F4YB1fzJmD6N9iIH5KJdZ2
         ak4vmoq91ryqooPqm3kHcnWeAi9v9xOcSNnivJBbWkO/R6QnCJhQaffjEkl1fn53SiR7
         vh9w==
X-Forwarded-Encrypted: i=1; AHgh+Rqooil5QowxAnZPpSAxdBFVrbBZpfkFPrnwg5LVk5u4k46ZFDAwZPZ8mueIzKV0bOX8FpH4QEvBe9ttLic=@vger.kernel.org
X-Gm-Message-State: AFuF++kt9sSVmw3xTYWGjP0LxA4S9PV4TSLew5GiMRrR+QmxPjyrRqSB
	7O5y9M1A/GVjXBWWzbqZz6nzdvDMqO4G5GqKasWCRsudQavLs6jBZ4F+ey0MliLDdSYrfUen5Hx
	yhnKQ7p5ksQ/VyJn546a1+1T60E61TILIWPQy289J2wL5Zgolq6AfBPZB140=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6d92:b0:489:5d05:552c with SMTP id
 5614622812f47-4b398352104mr14860732b6e.18.1787986956323; Sat, 29 Aug 2026
 00:02:36 -0700 (PDT)
Date: Sat, 29 Aug 2026 00:02:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a92840c.1d9ded08.62e62.0105.GAE@google.com>
Subject: [syzbot] [btrfs?] WARNING in btrfs_remove_from_free_space_tree
From: syzbot <syzbot+df8b249da18c45425242@syzkaller.appspotmail.com>
To: clm@fb.com, dsterba@suse.com, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16467549580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3c35c7e43de75adb
dashboard link: https://syzkaller.appspot.com/bug?extid=df8b249da18c45425242
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-818bebeb.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9adea981957f/vmlinux-818bebeb.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6676075cd03e/bzImage-818bebeb.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+df8b249da18c45425242@syzkaller.appspotmail.com

------------[ cut here ]------------
btrfs_abort_should_print_stack(__error)
WARNING: fs/btrfs/free-space-tree.c:869 at btrfs_remove_from_free_space_tree+0xbcd/0xda0 fs/btrfs/free-space-tree.c:869, CPU#0: kworker/u4:2/24
Modules linked in:
CPU: 0 UID: 0 PID: 24 Comm: kworker/u4:2 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: events_unbound btrfs_async_reclaim_metadata_space
RIP: 0010:btrfs_remove_from_free_space_tree+0xbcd/0xda0 fs/btrfs/free-space-tree.c:869
Code: e2 74 1a 41 83 ff fb 74 0d 41 83 ff f4 75 15 e8 29 c1 8c fd eb 17 e8 22 c1 8c fd eb 10 e8 1b c1 8c fd eb 09 e8 14 c1 8c fd 90 <0f> 0b 90 44 89 f9 f7 d9 49 bd 00 00 00 00 00 fc ff df e9 5d fe ff
RSP: 0018:ffffc9000031ef60 EFLAGS: 00010293
RAX: ffffffff843a73ac RBX: ffff888052270001 RCX: ffff88801b7b4b00
RDX: 0000000000000000 RSI: ffffffff8f3ffd50 RDI: 00000000ffffffe4
RBP: ffffc9000031f158 R08: ffff88801b7b4b00 R09: 0000000000000003
R10: 00000000fffffffb R11: 0000000000000000 R12: 1ffff92000063df8
R13: dffffc0000000000 R14: ffff88801f5fb580 R15: 00000000ffffffe4
FS:  0000000000000000(0000) GS:ffff88808c30a000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00002000007ff000 CR3: 000000000eb46000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 alloc_reserved_extent+0x4a/0x2b0 fs/btrfs/extent-tree.c:4976
 alloc_reserved_tree_block fs/btrfs/extent-tree.c:5155 [inline]
 run_delayed_tree_ref fs/btrfs/extent-tree.c:1815 [inline]
 run_one_delayed_ref fs/btrfs/extent-tree.c:1851 [inline]
 btrfs_run_delayed_refs_for_head fs/btrfs/extent-tree.c:2058 [inline]
 __btrfs_run_delayed_refs+0x18b5/0x43b0 fs/btrfs/extent-tree.c:2134
 btrfs_run_delayed_refs+0xdc/0x2a0 fs/btrfs/extent-tree.c:2246
 btrfs_commit_transaction+0x28a/0x30b0 fs/btrfs/transaction.c:2256
 flush_space+0x28a/0xde0 fs/btrfs/space-info.c:-1
 do_async_reclaim_metadata_space+0x3e8/0x940 fs/btrfs/space-info.c:1211
 btrfs_async_reclaim_metadata_space+0x89/0xe0 fs/btrfs/space-info.c:1278
 process_one_work kernel/workqueue.c:3387 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3470
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3551
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
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
