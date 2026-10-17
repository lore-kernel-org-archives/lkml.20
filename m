Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6703DB96F
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792270538; cv=none; b=g+Hy5ISU4kh8196I3lBteQmwOQ41GoQclG3AzDzuVzpbuUijwtY8EMOQxJva4OxnQe556b+R189kN8xjMqrNahqboJdxubsFvSkb+KZyT4UV44EozHeIyUzJm+VHWergnOqA1YJS+CJ5ASIBka6Wy+WpmZ24KS0N4ug3tLMhLd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792270538; c=relaxed/simple;
	bh=Np33pUZ03ybJkTaLCWapmqgrfPNKYoPDMRMSeWtGcsE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=oVn2F0PD8hdK0gCqrj3JaiGT8IchpiG1IREptOsTSO0CyLoWY+41Dg+qByyoFpHOdc+o0tL4YeMeKZUeTRCnLrqnoQ/zqgQ97k3WQdEvw9tQHN/WZUxi4y7CyGL8gWGYG9wM+sGGureAdYMXoy/jcnAhX4ZHM1YZaCIeHZLxktA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8468290b866so763496a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 13:55:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792270535; x=1792875335;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XkCz3HCYfdF/OoT6Q+24x/6yDact+rY8x9IzAwYTBKY=;
        b=N8i1PHTDKRi00HcyyxktL7qUUdNHeZj2seuYRomuDfrJ39VJLw6r+tla2zYpYl1T2f
         /z5NHI+x30Bkex5OYJ27fi85zgFSft02KBonpiOca4fL0f6MKgtHtr4w9/NGMsB1cq5l
         q4gYV24Z0XCsAPSe4EOzDQ1Ja35yzhErROsZN3jfEZovZXoL3Xg1Y5uPu9GBKOMPLjqi
         wTZpDx9dTYBhFZrKNSQvn5EQKjhRoOwffBqGnCyaQkKodx4CntuLkaPO33kEa9JMwUPL
         HmEXkXS6ZwFaZraNxLRot6cfgqi9kaVcT67WvA6BWUYq0W987ugdqWtuAeuhZ09X3spI
         mQWw==
X-Forwarded-Encrypted: i=1; AKwUvBwZAt7n1MJHRVFiV1ciXbbhLlFa1JLMaophxZ18RqaEbqUaSreeBXK5rheCjy2vNfQuDwS7Su3QGaD6hco=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4HNcBn7GKwVa9bhlXotu6QLTYjwRShwj76/Ds6vOMpeBysZ2t
	RWpL8/5g2oyhvfLxRyQMray9C6JlwNjYTRaSG0zKWkFbY0vIC65pxsp8xDNM0zkSgycSHVhk8fO
	YNuCqzY8F/54KPvKLSyKxgY4fUhleUV6fZJP7ZkvOx3TKVfb8E4ghUWPOwmU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6c93:b0:4e8:2150:2a1 with SMTP id
 5614622812f47-53cd63c1741mr2497986b6e.68.1792270534947; Sat, 17 Oct 2026
 13:55:34 -0700 (PDT)
Date: Sat, 17 Oct 2026 13:55:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad3e0c6.a6d1a155.34a93f.004a.GAE@google.com>
Subject: [syzbot] [mtd?] memory leak in phram_setup
From: syzbot <syzbot+c9d8bc9f8ccc03799e1f@syzkaller.appspotmail.com>
To: joern@lazybastard.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at, 
	syzkaller-bugs@googlegroups.com, vigneshr@ti.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    24a19b953e2a Linux 7.3-rc7
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15a128a5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=eeccc827207f48ec
dashboard link: https://syzkaller.appspot.com/bug?extid=c9d8bc9f8ccc03799e1f
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=110d73d1580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1025968e580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0f1e259089c6/disk-24a19b95.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6b65050296a3/vmlinux-24a19b95.xz
kernel image: https://storage.googleapis.com/syzbot-assets/cb73ff77ea56/bzImage-24a19b95.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c9d8bc9f8ccc03799e1f@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff88810afde7f8 (size 8):
  comm "syz.0.17", pid 5903, jiffies 4294943995
  hex dump (first 8 bytes):
    70 30 00 00 00 00 00 00                          p0......
  backtrace (crc 43334c2):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4696 [inline]
    slab_alloc_node mm/slub.c:4996 [inline]
    __do_kmalloc_node mm/slub.c:5413 [inline]
    __kmalloc_node_track_caller_noprof+0x40d/0x560 mm/slub.c:5545
    __kmemdup_nul mm/util.c:64 [inline]
    kstrdup+0x3c/0x80 mm/util.c:84
    parse_name drivers/mtd/devices/phram.c:224 [inline]
    phram_setup+0x1c2/0x360 drivers/mtd/devices/phram.c:286
    phram_param_call+0xe4/0x110 drivers/mtd/devices/phram.c:349
    param_attr_store+0x99/0x130 kernel/params.c:591
    module_attr_store+0x3d/0x60 kernel/params.c:906
    sysfs_kf_write+0x94/0xb0 fs/sysfs/file.c:145
    kernfs_fop_write_iter+0x1f1/0x2d0 fs/kernfs/file.c:345
    new_sync_write fs/read_write.c:595 [inline]
    vfs_write+0x3ae/0x720 fs/read_write.c:687
    ksys_write+0xa5/0x170 fs/read_write.c:739
    do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
    do_syscall_64+0xe9/0x530 arch/x86/entry/syscall_64.c:84
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff88810afdebe8 (size 8):
  comm "syz.0.18", pid 5905, jiffies 4294943995
  hex dump (first 8 bytes):
    70 30 00 00 00 00 00 00                          p0......
  backtrace (crc 43334c2):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4696 [inline]
    slab_alloc_node mm/slub.c:4996 [inline]
    __do_kmalloc_node mm/slub.c:5413 [inline]
    __kmalloc_node_track_caller_noprof+0x40d/0x560 mm/slub.c:5545
    __kmemdup_nul mm/util.c:64 [inline]
    kstrdup+0x3c/0x80 mm/util.c:84
    parse_name drivers/mtd/devices/phram.c:224 [inline]
    phram_setup+0x1c2/0x360 drivers/mtd/devices/phram.c:286
    phram_param_call+0xe4/0x110 drivers/mtd/devices/phram.c:349
    param_attr_store+0x99/0x130 kernel/params.c:591
    module_attr_store+0x3d/0x60 kernel/params.c:906
    sysfs_kf_write+0x94/0xb0 fs/sysfs/file.c:145
    kernfs_fop_write_iter+0x1f1/0x2d0 fs/kernfs/file.c:345
    new_sync_write fs/read_write.c:595 [inline]
    vfs_write+0x3ae/0x720 fs/read_write.c:687
    ksys_write+0xa5/0x170 fs/read_write.c:739
    do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
    do_syscall_64+0xe9/0x530 arch/x86/entry/syscall_64.c:84
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff88810afde5b8 (size 8):
  comm "syz.0.19", pid 5908, jiffies 4294943996
  hex dump (first 8 bytes):
    70 30 00 00 00 00 00 00                          p0......
  backtrace (crc 43334c2):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4696 [inline]
    slab_alloc_node mm/slub.c:4996 [inline]
    __do_kmalloc_node mm/slub.c:5413 [inline]
    __kmalloc_node_track_caller_noprof+0x40d/0x560 mm/slub.c:5545
    __kmemdup_nul mm/util.c:64 [inline]
    kstrdup+0x3c/0x80 mm/util.c:84
    parse_name drivers/mtd/devices/phram.c:224 [inline]
    phram_setup+0x1c2/0x360 drivers/mtd/devices/phram.c:286
    phram_param_call+0xe4/0x110 drivers/mtd/devices/phram.c:349
    param_attr_store+0x99/0x130 kernel/params.c:591
    module_attr_store+0x3d/0x60 kernel/params.c:906
    sysfs_kf_write+0x94/0xb0 fs/sysfs/file.c:145
    kernfs_fop_write_iter+0x1f1/0x2d0 fs/kernfs/file.c:345
    new_sync_write fs/read_write.c:595 [inline]
    vfs_write+0x3ae/0x720 fs/read_write.c:687
    ksys_write+0xa5/0x170 fs/read_write.c:739
    do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
    do_syscall_64+0xe9/0x530 arch/x86/entry/syscall_64.c:84
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


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
