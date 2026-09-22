Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B169488225
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790058305; cv=none; b=E8uaGXvZg3onh/m6FID4y9xMEahmkgkubxexDDm649ldxyApY+zxZe3q1xVEku2gZiv3qK7EgM+HG8O/dMqWJ85dXYm1UB/xF/SwdLK+RpnvEbGQx5rArC6rm533NFBvgrPJ7y1SIduvOrrYLtljD9FJlDK8QYbL+CefYAbdvJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790058305; c=relaxed/simple;
	bh=1AJOaubEwjpJzJtUToPLUe8lIsuxog6Idb7ZyGvunmY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=lUQSSNxo5RRQrzF3Kx/yZQ6zZld1klRNe0NYofq1YAtBm7Tudeyr3/mFR5qks3pqBDuaYulsoRUTiGV0t2BcnRHMQmejeiRFwaDEQun40jU/svqhLc4GxP6oAO+kch4YhlI/JFNffayBssz6BDF3Eh6jt1WviLSu1MOfGsblj6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7f4fa572ba2so3459118a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790058303; x=1790663103;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=udwfQfbOkx1bsyX/+lZI959a4W3iP3JnimH6nQ04o7k=;
        b=ttV7QI5XC6wHMRw8NE93ZPXwhEnILovK1MM4/PNv4EJ8So2G2SPYgAHuwop7H1LsVf
         A8hOOA1244ulTEzf7j9YgtbRWG9sTx3B+qPDIWIrXkPmgmxG8Fa/mHj6R3hiKGXeIOCr
         TJr5vyuGq+K6cwrjaarIaFPc//kl8g355DgY31kwvwbCq60+1znbHyh2Z1oqyXPmkZN5
         LRYy9/Ta5Lz9Ba6Olmow4qB+uulXwV+Hj0AcqmmsCJb1u1pt7pjO51LHrEV3fVAX8bTn
         BJMQPuUgRhgkUvQnDLS1Y5cJZmA7u2iGwKu9HetoECOiqynGXJDc/3UAkGdlM2nmVbsT
         neIw==
X-Gm-Message-State: AFuF++mvpu8VxHftBwBAUEjE4E0ShEVyEY7mBSkDTrSanzab16A9UTtx
	ngj1ERva74tN4Ict2ehF8qkJoDUHELtDzrx1o8S9Hr4405t8XTNZ/OF6YqVQ6sYVV55L4zkOz8D
	XJFwjZYx8NsJeTa5OROgzKBf4Nj8UadkEp3yhgfopeR6KiRTcwDE0v/eBWkw=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f02f:b0:6cd:3fdc:a932 with SMTP id
 006d021491bc7-6cd3fecc42fmr8892804eaf.79.1790058303186; Mon, 21 Sep 2026
 23:25:03 -0700 (PDT)
Date: Mon, 21 Sep 2026 23:25:03 -0700
In-Reply-To: <20260921180338.2360-1-nsvatoslav515@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab21f3f.71f81b7d.15fa6d.003d.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in ntfs_evict_inode
From: syzbot <syzbot+3db654d91b471c4d7a7d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, nsvatoslav515@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in ntfs_evict_inode

------------[ cut here ]------------
ifs_up != folio_up
WARNING: fs/iomap/buffered-io.c:298 at ifs_free+0x352/0x420 fs/iomap/buffered-io.c:298, CPU#1: syz-executor/6284
Modules linked in:
CPU: 1 UID: 0 PID: 6284 Comm: syz-executor Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:ifs_free+0x352/0x420 fs/iomap/buffered-io.c:298
Code: e8 83 47 61 ff 90 0f 0b 90 e9 d5 fe ff ff e8 75 47 61 ff 90 0f 0b 90 e9 12 ff ff ff e8 67 47 61 ff 41 c1 ee 03 40 0f b6 f5 90 <0f> 0b 90 48 c7 c7 20 94 81 8b 44 89 f2 e8 ac 11 c2 fe eb b0 44 89
RSP: 0018:ffffc900048f7698 EFLAGS: 00010202
RAX: ffffffff826553d9 RBX: 1ffffd4000301458 RCX: ffff8880275a9f40
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 000000008265d200 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffff94000301459 R12: ffff88802c03d384
R13: ffff88802c03d300 R14: 0000000000000001 R15: 0000000000000000
FS:  00005555916b9500(0000) GS:ffff888125ccb000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000033ac226b9000 CR3: 0000000039800000 CR4: 00000000003526f0
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
RIP: 0033:0x7fded076f397
Code: a2 c7 05 5c 43 25 00 00 00 00 00 eb 96 e8 e1 12 00 00 90 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 e8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffc86ca8078 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 00007fded08044bb RCX: 00007fded076f397
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffc86ca8130
RBP: 00007ffc86ca8130 R08: 00007ffc86ca9130 R09: 00000000ffffffff
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffc86ca91c0
R13: 00007fded08044bb R14: 0000000000027906 R15: 00007ffc86ca9200
 </TASK>


Tested on:

commit:         238650ef Merge tag 'powerpc-7.3-4' of git://git.kernel..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15e3d805580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=3db654d91b471c4d7a7d
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17ca6805580000

