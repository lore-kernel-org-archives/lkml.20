Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012081;
	b=TMLVr1ZEgzNmp9tTXTi94ReapuW9jTHGiM0ql/Qp1I0eh5Ci/jeTXKQRdksJenLRVleY
	 80vYGDrG5QuHPYlyowH8ZcEU9NirPDRhDOb+pJT5DcI0fky2aBt8dfQeTKVJyuSagE/BX
	 AH26ZBw7/VAU8LKoVWbvxqjOBlOnMxUqaAI5oR5p3q5/U3xSJliqDV5GVhWAaPX43Bj4m
	 5z5eVMN5y6O55elCXdRfljsdOUFTye0eidQVoDl4kNAQPToiuG65yCW9wuJPPLqMzcIew
	 /44A/BJcFcnCJoTYM/FDoLqigyQ7aachjhCmMXKwlVfUJ/5nyXNDmkDRrbcRzBSvTMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012081;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=RBCyfOqZ8orxpSJuRJ2SYeYJ7j8W5qtbbOxDj0iiVng=;
	b=UtrCGwaRsRKt0zFDq3SJFfrwZRjB/yvGbxPS6cAlQqL1y1ZsqXSPbhyxbV2sIVNr/3Mx
	 4GFlUKBXXTrKRS5/kJJ7xQQfzaxswGI08mXKqWtUr+CciAJbJVp9OQ+39Zf1MrJFdzYZf
	 30bNQyur7kPiZJy1/U6CHX1b6S6Tk1YTBA6i/XxeUMpV44p3nldjlal8Qon4je7D7E/Ip
	 4kmfyDGGI7Sgj07O1LbC/9m2Am4zRNhnsuvJDPzHLtz/JzHwViCZ7UAUk7i1tqRtwsxjN
	 dwDBbTZsuZtuR7x2onr8r7WZaBu0/hn+oBL5k3kfQsamf69zcS1xxxIsYoBNN7angTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58ADA606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58ADA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-824cc5f7fcdso4417973a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012080; x=1793616880;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RBCyfOqZ8orxpSJuRJ2SYeYJ7j8W5qtbbOxDj0iiVng=;
        b=V11M0gA/3yPtcO+7TFJ75a99u+waySXEU7O/GYN9pkgbtWYJjnUrl8nIgPRTDeaBtT
         /ZriowZP6+r/MIXrdshSk6Xd1kaLc0MipRy6tGGQFKQEKwJgvpjuhWrIy3QMcUGaZf3A
         d7fmte469TiLASDUFsFPmm04R3JTOeJx+utR460xVd7uUaBEWHmsNfUaC010jMN5oQKw
         WLsVEDMgqMfbUQTfBtI409cYocGnD9H1GspqYBg0D2SC8Iwr37UhFjWaykrM3jvuIz9n
         SBstMapZrJCYphZBYtbJB048UXhMjKIJigRylrhit0uWDnVbq7P/Vqm2DhwzFLXNMxAM
         YlDA==
X-Gm-Message-State: AFq9FYKDqpP15iU1mmmsFvJYfMcy8sHnNc41Pfq43i1NaVAHG6ySVLoI
	WbWjNH/biNkKDXz6ZPTqEuuUnfvf6Opfubndi9vkjFaLSC4vkhZPRIG+XXpUG8vjU9hvUt6eyfK
	d9zf7qmQ++X98DicsjCcWZgyV5zg2U14OEIbUTsVLnQOSPaOkztbQC6mz/ts=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1510:b0:539:ad19:d0cf with SMTP id
 5614622812f47-55c0020b600mr4075211b6e.20.1793012080274; Mon, 26 Oct 2026
 03:54:40 -0700 (PDT)
Date: Mon, 26 Oct 2026 03:54:40 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adf3170.a6443767.132891.0077.GAE@google.com>
Subject: [syzbot] kernel BUG in remove_inode_hugepages (2)
From: syzbot <syzbot+2fcec0eca7f4cade53b2@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    9ba46df34488 Merge tag 'bitmap-for-v7.4-rc1' of https://gi..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=14eff495580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=968c4ca981edd5f
dashboard link: https://syzkaller.appspot.com/bug?extid=2fcec0eca7f4cade53b2
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16eff495580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2fcec0eca7f4cade53b2@syzkaller.appspotmail.com

refcount_t: addition on 0; use-after-free.
------------[ cut here ]------------
kernel BUG at lib/refcount.c:34!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 5930 Comm: syz-executor856 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
RIP: 0010:refcount_warn_saturate+0xf0/0x110 lib/refcount.c:34
Code: 80 c1 03 38 c1 0f 8c 6a ff ff ff 4c 89 f7 e8 d7 92 63 fd e9 5d ff ff ff e8 ad b2 f6 fc 48 c7 c7 60 82 ea 8b e8 11 5c 57 fc 90 <0f> 0b e8 99 b2 f6 fc 48 c7 c7 e0 82 ea 8b e8 fd 5b 57 fc 90 0f 0b
RSP: 0018:ffffc90004a37928 EFLAGS: 00010246
RAX: 000000000000002a RBX: 0000000000000002 RCX: 3a69e62f58ffd700
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc90004a37be8 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffff52000946ed5 R12: ffffea0001610000
R13: dffffc0000000000 R14: ffff888036ec0c01 R15: ffff88803af58430
FS:  000055558950d4c0(0000) GS:ffff8881247ad000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fa042400000 CR3: 000000003486e000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __refcount_add include/linux/refcount.h:-1 [inline]
 __refcount_inc include/linux/refcount.h:366 [inline]
 refcount_inc include/linux/refcount.h:383 [inline]
 kref_get include/linux/kref.h:45 [inline]
 hugetlb_unmap_file_folio fs/hugetlbfs/inode.c:413 [inline]
 remove_inode_single_folio fs/hugetlbfs/inode.c:512 [inline]
 remove_inode_hugepages+0xbdb/0x10f0 fs/hugetlbfs/inode.c:577
 hugetlb_vmtruncate fs/hugetlbfs/inode.c:621 [inline]
 hugetlbfs_setattr+0x4f0/0x6d0 fs/hugetlbfs/inode.c:856
 notify_change+0xbb8/0xec0 fs/attr.c:556
 do_truncate+0x1c2/0x250 fs/open.c:68
 do_ftruncate+0x4e0/0x590 fs/open.c:194
 ksys_ftruncate fs/open.c:206 [inline]
 __do_sys_ftruncate fs/open.c:211 [inline]
 __se_sys_ftruncate fs/open.c:209 [inline]
 __x64_sys_ftruncate+0x8f/0xe0 fs/open.c:209
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa04350daa7
Code: 00 00 00 48 c7 c0 d0 ff ff ff 64 c7 00 0c 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 b8 4d 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 d0 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007fffbd25aeb8 EFLAGS: 00000246 ORIG_RAX: 000000000000004d
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fa04350daa7
RDX: 0000000000000044 RSI: 0000000000000000 RDI: 0000000000000003
RBP: 00007fa0435adb60 R08: 0000000029b4ae16 R09: 3fffffffffffffff
R10: 4000000000000000 R11: 0000000000000246 R12: 0000000000000003
R13: 00007fffbd25af00 R14: 00007fffbd25aef0 R15: 4ec4ec4ec4ec4ec5
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:refcount_warn_saturate+0xf0/0x110 lib/refcount.c:34
Code: 80 c1 03 38 c1 0f 8c 6a ff ff ff 4c 89 f7 e8 d7 92 63 fd e9 5d ff ff ff e8 ad b2 f6 fc 48 c7 c7 60 82 ea 8b e8 11 5c 57 fc 90 <0f> 0b e8 99 b2 f6 fc 48 c7 c7 e0 82 ea 8b e8 fd 5b 57 fc 90 0f 0b
RSP: 0018:ffffc90004a37928 EFLAGS: 00010246
RAX: 000000000000002a RBX: 0000000000000002 RCX: 3a69e62f58ffd700
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc90004a37be8 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffff52000946ed5 R12: ffffea0001610000
R13: dffffc0000000000 R14: ffff888036ec0c01 R15: ffff88803af58430
FS:  000055558950d4c0(0000) GS:ffff8881247ad000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fa042400000 CR3: 000000003486e000 CR4: 00000000003526f0


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
