Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE75353A77
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 10:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789898524; cv=none; b=d368cg3sblce1mg+yVoR45oachJUvdgkBXxdQFOkFItBjaiV9A3Qxa7qb+enzcnWOhlLMziHkNVXyjClTtQLem72/5/NCemo7s6Xfe+zFidinejqzscoi9u6CNcMs5UsX1ia/SUdYYzvXl8DG0803TnLIJZ/KDf8tnQZifBWc+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789898524; c=relaxed/simple;
	bh=sD1tvy9i/kQf1pCntM5zhGI1Kwe+vvUR6kAtDA+R0hs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=uBp3cJJWU5ICjscJyqWbPBwylGhXgCInVvj8yclKLgwQmg5hkDqIj99qR/Ld6KzNygI9HV4+OGQAVb5RZMglBAMv7S0Ol4OoQgJzlq786e7nmywBLvx3KDc135RjI4Hd3NZy8XuHvxXAPLALmhfAQMT7YTxnRSgnvOmL7fdpAk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-806004ec379so1737786a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 03:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789898522; x=1790503322;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=orFe4c3ZEes/v9h1tkFcgZKIV+bzphp3crAMqXYbhRU=;
        b=xA9IKreLck+viJMWxnx1wqJieNWoA2mtq0ep3LafZvYhMBxMUZQIZdwq0waAr6Si0Q
         N0lPG3uplrsHrPIm21wvhmbkh0zv0DE0rvUlHGG7LfFkuQprKl+B6JiT2llqrXG1xlB0
         omEYbMEJF2feXX0Us/WbWbuF4HU93TAVoO+8qoXSKPDxnOIn0Jlt9NEGuN9BrBDXay0T
         4sxkMRXGHGd1LzzyX5kiTm/Od3GfJL3nTWsw02DyoXiE4sYetQu+jBKeK58Br8byRV3S
         hUB4br+ehAVyBdyoCQXlNhhDtcWGrAnF4lAtjc2lG0RSApsY9BiIBDtWFVVonMcYijkC
         NvMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkqz8dzR9RbbRcEUEci0RJHzS5e2q8udtKg2NOLzlUDXj2D5KDTGfjKkUgfP6cFj/isv4TBxW7sJ17mhc=@vger.kernel.org
X-Gm-Message-State: AFuF++l019d6k82NX4fvB5e9ERGP1WN+6op2EU2XBKaL3SXBiYr2U/Fd
	gxKZmmlwx6xkxz48dncB+FpcifGnxVfkB46c3nAl3REy2HsDVSX1qUgx1Pq+idWHGiBsv6BgpVC
	9+5ce2BG0yUdJ9w96lQXDkaGSqOIH6+GrMFwd9QqFkgeWBThSBB6hfW7/Bbs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4cc7:b0:6c7:af50:b2e4 with SMTP id
 006d021491bc7-6ca9a132ec7mr6414078eaf.13.1789898522240; Sun, 20 Sep 2026
 03:02:02 -0700 (PDT)
Date: Sun, 20 Sep 2026 03:02:02 -0700
In-Reply-To: <20260920092811.61884-1-adarshdas950@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aafaf1a.3179f8cd.1e36b2.000a.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in ntfs_evict_inode
From: syzbot <syzbot+3db654d91b471c4d7a7d@syzkaller.appspotmail.com>
To: adarshdas950@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in ntfs_evict_inode

------------[ cut here ]------------
ifs_is_fully_uptodate(folio, ifs) != folio_test_uptodate(folio)
WARNING: fs/iomap/buffered-io.c:295 at ifs_free+0x34a/0x410 fs/iomap/buffered-io.c:294, CPU#0: syz-executor/6336
Modules linked in:
CPU: 0 UID: 0 PID: 6336 Comm: syz-executor Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:ifs_free+0x34a/0x410 fs/iomap/buffered-io.c:294
Code: 41 5f 5d e9 b8 66 c1 ff e8 83 47 61 ff 90 0f 0b 90 e9 d5 fe ff ff e8 75 47 61 ff 90 0f 0b 90 e9 12 ff ff ff e8 67 47 61 ff 90 <0f> 0b 90 eb c7 44 89 e1 80 e1 07 80 c1 03 38 c1 0f 8c 08 fe ff ff
RSP: 0018:ffffc90004fbf698 EFLAGS: 00010293
RAX: ffffffff826553f9 RBX: 0000000000000008 RCX: ffff88802da69f40
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 000000008265d201 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffff940003014e9 R12: ffff88803c80be84
R13: ffff88803c80be00 R14: ffffea000180a740 R15: 0000000000000000
FS:  000055555e6ba500(0000) GS:ffff888125bc8000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fe150dcd000 CR3: 00000000433cc000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 folio_invalidate mm/truncate.c:140 [inline]
 truncate_cleanup_folio+0xcb/0x190 mm/truncate.c:160
 truncate_inode_pages_range+0x2c4/0xd80 mm/truncate.c:404
 ntfs_evict_inode+0x19/0x40 fs/ntfs3/inode.c:2012
 evict+0x624/0xb50 fs/inode.c:822
 dispose_list fs/inode.c:864 [inline]
 evict_inodes+0x7e3/0x870 fs/inode.c:918
 generic_shutdown_super+0xaa/0x2d0 fs/super.c:741
 kill_block_super+0x44/0xa0 fs/super.c:1904
 ntfs3_kill_sb+0x44/0x1c0 fs/ntfs3/super.c:1940
 deactivate_locked_super+0xbc/0x110 fs/super.c:589
 cleanup_mnt+0x3d3/0x460 fs/namespace.c:1317
 task_work_run+0x1d9/0x270 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
 exit_to_user_mode_loop+0x204/0x770 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:343 [inline]
 do_syscall_64+0x328/0x520 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f3fd9b1f397
Code: a2 c7 05 5c 43 25 00 00 00 00 00 eb 96 e8 e1 12 00 00 90 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 e8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffce2e41e08 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 00007f3fd9bb44bb RCX: 00007f3fd9b1f397
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffce2e41ec0
RBP: 00007ffce2e41ec0 R08: 00007ffce2e42ec0 R09: 00000000ffffffff
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffce2e42f50
R13: 00007f3fd9bb44bb R14: 000000000003663f R15: 00007ffce2e42f90
 </TASK>


Tested on:

commit:         518e5b79 Merge tag 'for-7.3-rc3-tag' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17474005580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a5341e268a22b76d
dashboard link: https://syzkaller.appspot.com/bug?extid=3db654d91b471c4d7a7d
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16357ff9580000

