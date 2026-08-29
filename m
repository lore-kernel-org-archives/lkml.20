Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F17835975
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 17:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788025949; cv=none; b=ZbsUgM6Xq3pQ7/mtPGX0yi67TqJJVNaikTii7ioILaVc7hndtXKOIyD/klRAMogTCtjgeNKvDIU71N4UFT00qRgy9FPXc5RvkPP4nA+LrNPNCb5jNJHkkVADwjSr0jpGoWx+D4fB8yJpSK4YXo73pd6uFsHRXnnStQ6//XWhAns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788025949; c=relaxed/simple;
	bh=HKegA+uEne4Vmkltbu6L/Eawxa5dDosv8tcxs5ZYhGs=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=n/V3YKbSP6C+Wk+vYtIdCTRRxyAsctmNR+Jxl62C1QvwQ2pHQAF1DY/TR8eP0AnP0lK6NEgPR4LITSC48jPApnx6dtMfDFlWMohB0olW6uSctT7B99kduBIB3RprXQasanstpyu3pK4WiAG5RabNi0iFoMpy7xMro7eHOFdc8Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4ab4ca7ce3fso2633024b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788025946; x=1788630746;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G/oBzRnbhFxdqSVA70kptLmynzwRlanOYaz1/Oy6KYM=;
        b=nGjZBVDQH4LFLsU4PrW4oaawIhiH6JUgz+JV1Pq54Q22XDmYZs9aG6CvTkSO5WaHNA
         WwrASTFhedn99sJ5NAMMB0pZNELj6jdxjMQ6k7FxlIHS6WLiCBzTbuH7nJC6YBe4Sj1g
         F3Gr8P1TyMXDV0XQ/Dgua0loMIxpxyKZY7Q6CI8N7jJDGsd4H61o4e6ePjDf3lekM6KK
         yKnwgqUJMaL0GODL4dj2dZ+5iRQWgXiy5iw16fMxIW6soIbOfK198XLTl8DHZENSFdRZ
         SNn7psC6oqqXycr9WIEI9v0LocQZuuUp7lT/TM07wh+BneoNMv3zdN3OBaWm3BZbhP95
         wY3Q==
X-Gm-Message-State: AFuF++mEuYEAu9tLJ6Rg/GxvOf0v3sqbQ46kx4g7/lCrxMcENy2Th6v2
	MH7fwN32apZN5IOvUBBWg7o/Qwsym0b07gzdPxR2BiOcEzooZhNJrBvsOYjujTOIIuwo0fpwa1v
	y7tIbWUZavKK0wf1XX8TqjlVp2utjT1/ojDMpOMsU7fTx/s3hETtteMFICFo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c2f9:b0:4a3:fefb:899b with SMTP id
 5614622812f47-4b3980186d4mr17637489b6e.7.1788025946389; Sat, 29 Aug 2026
 10:52:26 -0700 (PDT)
Date: Sat, 29 Aug 2026 10:52:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a931c5a.08e933ee.dbf97.0093.GAE@google.com>
Subject: [syzbot] [mm?] WARNING in __mod_zone_page_state
From: syzbot <syzbot+cd2073ee6d958a8d0fcd@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=10286d79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=cd2073ee6d958a8d0fcd
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13cf7625580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cd2073ee6d958a8d0fcd@syzkaller.appspotmail.com

smpboot: CPU 1 is now offline
------------[ cut here ]------------
IS_ENABLED(CONFIG_PREEMPT_COUNT) && __lockdep_enabled && (preempt_count() == 0 && this_cpu_read(hardirqs_enabled))
WARNING: mm/vmstat.c:361 at __mod_zone_page_state+0x96/0x190 mm/vmstat.c:361, CPU#2: syz-executor412/6040
Modules linked in:
CPU: 2 UID: 0 PID: 6040 Comm: syz-executor412 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:__mod_zone_page_state+0x96/0x190 mm/vmstat.c:361
Code: d0 00 00 00 8b 05 3e 44 ea 0e 85 c0 74 1f 65 8b 05 87 e0 2e 12 65 0b 05 d0 99 2e 12 75 0f 65 8b 05 d3 db 2e 12 85 c0 74 04 90 <0f> 0b 90 48 c7 c7 c0 e7 ff 8b e8 3b b3 6d 09 65 48 0f be 5d 00 48
RSP: 0018:ffffc9000627f8e0 EFLAGS: 00010202
RAX: 0000000000000001 RBX: 0000000000000000 RCX: 1ffffffff2287150
RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffff88807ffd79b8
RBP: ffffffff9489f448 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: ffffffffffffffff
R13: 0000000000000008 R14: ffff88807ffd7940 R15: ffffffff9489f440
FS:  00005555785ce400(0000) GS:ffff8880d5da2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005608d531ffb8 CR3: 000000002cb7c000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 __zone_stat_mod_folio include/linux/vmstat.h:410 [inline]
 __munlock_folio mm/mlock.c:144 [inline]
 mlock_folio_batch+0xf97/0x36e0 mm/mlock.c:204
 mlock_drain_remote+0xe5/0x140 mm/mlock.c:230
 page_alloc_cpu_dead+0x16/0x130 mm/page_alloc.c:6468
 cpuhp_invoke_callback+0x3b4/0x9a0 kernel/cpu.c:194
 __cpuhp_invoke_callback_range+0x158/0x1d0 kernel/cpu.c:972
 cpuhp_invoke_callback_range kernel/cpu.c:996 [inline]
 cpuhp_down_callbacks kernel/cpu.c:1386 [inline]
 _cpu_down+0x523/0x1020 kernel/cpu.c:1457
 cpu_down_maps_locked kernel/cpu.c:1483 [inline]
 cpu_down kernel/cpu.c:1491 [inline]
 cpu_device_down+0x82/0xc0 kernel/cpu.c:1508
 device_offline drivers/base/core.c:4283 [inline]
 device_offline+0x2f4/0x400 drivers/base/core.c:4267
 online_store+0xd1/0x180 drivers/base/core.c:2883
 dev_attr_store+0x58/0x80 drivers/base/core.c:2509
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f90996d005e
Code: 08 0f 85 f5 e2 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 90 41 57 41 56 4d 89 c6 41 55 4d 89 cd 41 54 55 53 48 83 ec 08
RSP: 002b:00007ffd7eb94578 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00005555785ce400 RCX: 00007f90996d005e
RDX: 0000000000000002 RSI: 00007f90997150ff RDI: 0000000000000003
RBP: 00007f90997175e0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f9099717578
R13: 00007f909971509a R14: 00007f90997150b9 R15: 0000000000000002
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
