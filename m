Received: from mail-oi2-f0.google.com (mail-oi2-f0.google.com [74.125.231.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9765B2EFD9B
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789794446; cv=none; b=FZdXTdgv3K2YcrNrg3JflFwLOBco5E5dYdiY0H2NUXXJBByb9ER2jIuY5RQ8/xzH2Asi7yP6gicaUCE1XbE5iFRbWH2q964fs6A2+YEmYfjnFZxFf9OlqJizH9GUt6Vbrs40V/E119gJIBShbYZ6G5Yp96EWiXuV3HE0gqH+RwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789794446; c=relaxed/simple;
	bh=v18GxUnEeRxhSOHGS9h6egoTxw8jBvg2dyiZLgRddUo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=LSFyAsEFBSxhvosiWDcSb5+4ZC4zMRM7qtaEhJihP6sC+M05681i+3Ugg8pkF0Al2aeq4tzrP7QuqrO2MnkQcAOgDOTWlh1Jnhi+WR9HCVmUGdgXrwGIotuld/t7tWC9vSU8xUiF/Hk6wyJWVWSmrPkxvO7dg4vTE794MaRYo3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f0.google.com with SMTP id 5614622812f47-4a4492f5cd1so260996b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789794443; x=1790399243;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxzdYtFKH/Wd1tPRHa/P6bYgy1e4uRMJUfNAlpzw3sA=;
        b=kmBMxxYlhJdOR0Px0gEPZDx9nqwj8JrUpXd1v2dK7+GMbv6R85l/ylJbirnOR7Z43E
         yfguA/n8m8VUCoHSWGC32ot7csIV5sPhijelk+kNvWy8Yz4JQP5e4NyOXV5vhwtD+PuU
         qoxydc5RUZ4tZ96VKvdW5Tu9y9W5w6rc1d+qKKKuW8xbqgQHTaWnu5gCZFIcQaozLvJJ
         wHVeFKzMXTbfocOJ7wAkeAFFj01egfeJaDr1C7DkJMj3fPwGqM+G+LE9w/DNiHbMpqqX
         dCVg7LM8WEPxzrCgjKTp2Wv0zp2cqOsgy7lI8AdbklsgmGuF8iahLzYxu7BLnkpOXubg
         ac3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxBM2kf0y2TYHTb0vR00TTVU/cfCJmCkG5X2XJ6eoVpWesUK128duyAqPYlduooGC7N1dmxXS9Ny7oEVHI=@vger.kernel.org
X-Gm-Message-State: AFuF++kTOBZKopPSs3qZThtB0IuutqA0ewGA/Hxfyw45eFy58uEWY5+b
	zsUrsOFyx7F0AnLWW6Q+lIyG8bO5PLXXTucXRzaTkCLf4907T6pE0mYsZBBFAM6jcykKjLfVcCd
	MkS5UQaL2hOkTfEieaXXwjL+a4TOZcd+1B9lcEabnOo8abdx0DNNH8H0+4tc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b09:b0:6b4:c316:6fdd with SMTP id
 006d021491bc7-6ca9aa41fcbmr4126293eaf.19.1789794443460; Fri, 18 Sep 2026
 22:07:23 -0700 (PDT)
Date: Fri, 18 Sep 2026 22:07:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aae188b.71f81b7d.15fa6d.0004.GAE@google.com>
Subject: [syzbot] [mm?] WARNING in v9fs_fid_get_acl (2)
From: syzbot <syzbot+de6fd6789748a8aa64a0@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, apopple@nvidia.com, byungchul@sk.com, 
	david@kernel.org, gourry@gourry.net, joshua.hahnjy@gmail.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, matthew.brost@intel.com, 
	rakie.kim@sk.com, syzkaller-bugs@googlegroups.com, 
	ying.huang@linux.alibaba.com, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    587858367581 Merge tag 'nfsd-7.3-1' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1361a115580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=de6fd6789748a8aa64a0
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11f64df9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10e1a115580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-58785836.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f8460d7438eb/vmlinux-58785836.xz
kernel image: https://storage.googleapis.com/syzbot-assets/551bf08b9af2/bzImage-58785836.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+de6fd6789748a8aa64a0@syzkaller.appspotmail.com

------------[ cut here ]------------
1
WARNING: mm/page_alloc.c:5340 at alloc_order_allowed mm/page_alloc.c:5340 [inline], CPU#0: syz.1.357/7872
WARNING: mm/page_alloc.c:5340 at __alloc_frozen_pages_noprof+0x2137/0x3300 mm/page_alloc.c:5397, CPU#0: syz.1.357/7872
Modules linked in:
CPU: 0 UID: 0 PID: 7872 Comm: syz.1.357 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:alloc_order_allowed mm/page_alloc.c:5340 [inline]
RIP: 0010:__alloc_frozen_pages_noprof+0x2137/0x3300 mm/page_alloc.c:5397
Code: 13 00 00 39 84 24 98 00 00 00 0f 85 4a fa ff ff e9 91 f6 ff ff 80 3d e2 93 bb 0e 00 0f 85 9d e2 ff ff c6 05 d5 93 bb 0e 01 90 <0f> 0b 90 e9 8d e2 ff ff 31 c0 e9 5f ec ff ff 48 8b 7c 24 08 48 c7
RSP: 0018:ffffc90004df7758 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000029 RDI: 0000000000040d40
RBP: 0000000000000029 R08: 0000000000000000 R09: 0000000000000009
R10: 0000000000000029 R11: 0000000000000000 R12: 0000000000040d40
R13: 1ffff920009bef47 R14: 0000000000000000 R15: 1ffff920009bef05
FS:  00007fc8804026c0(0000) GS:ffff8880d5b59000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fc88037dff8 CR3: 0000000037685000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 alloc_pages_mpol+0x201/0x550 mm/mempolicy.c:2486
 ___kmalloc_large_node+0xe8/0x130 mm/slub.c:5353
 __kmalloc_large_node_noprof+0x1c/0x70 mm/slub.c:5385
 __do_kmalloc_node mm/slub.c:5402 [inline]
 __kmalloc_noprof+0x5a8/0x840 mm/slub.c:5439
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 v9fs_fid_get_acl+0x7a/0x120 fs/9p/acl.c:33
 __v9fs_get_acl fs/9p/acl.c:67 [inline]
 v9fs_get_acl+0xe8/0x480 fs/9p/acl.c:93
 v9fs_qid_iget_dotl fs/9p/vfs_inode_dotl.c:131 [inline]
 v9fs_inode_from_fid_dotl+0x26d/0x300 fs/9p/vfs_inode_dotl.c:154
 v9fs_get_new_inode_from_fid fs/9p/v9fs.h:264 [inline]
 v9fs_get_tree+0x55c/0xb50 fs/9p/vfs_super.c:120
 vfs_get_tree+0x92/0x320 fs/super.c:1933
 fc_mount fs/namespace.c:1198 [inline]
 do_new_mount_fc fs/namespace.c:3772 [inline]
 do_new_mount fs/namespace.c:3848 [inline]
 path_mount+0x7d0/0x24c0 fs/namespace.c:4168
 do_mount fs/namespace.c:4181 [inline]
 __do_sys_mount fs/namespace.c:4397 [inline]
 __se_sys_mount fs/namespace.c:4374 [inline]
 __x64_sys_mount+0x293/0x310 fs/namespace.c:4374
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc87f59e159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fc880402028 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007fc87f825fa0 RCX: 00007fc87f59e159
RDX: 0000200000000240 RSI: 0000200000000200 RDI: 0000000000000000
RBP: 00007fc87f63503b R08: 0000200000000180 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fc87f826038 R14: 00007fc87f825fa0 R15: 00007ffeeb3b2c38
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
