Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED71357D08
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 01:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788487024; cv=none; b=EQkzjH8LNTgH3lwDFE9+WsaeMT0vilu3nTtVh6+AVmD8h875dFnUJMzAk3ceQ1uA0MYJ+wQClVz8Y62d6RWBkBLdIWBdWNouDgsHigulXXBulsuwn5iX1Y9K8S7qk1lWjLZEWKF4aMfheDiei8gpLV71z6KS0XTtxkwQ2nuR1tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788487024; c=relaxed/simple;
	bh=9TV5BNCzbWikvjfQ2s37oXiHZH4YpvyhQY3uTflxyWw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=VsycS8Uxmsavn7gnt2wifFGnbarg9urFSNEiyEAc202SyjeilGMW8TW6qdGIADZpyw8Hf4HYgFtp420/GN91rDke9VwXM7fM2iJvzCoho/E6qnj2Z/N41jVL/rez/X9G2+2uwdWReez//7i3KeYan6kV3RSz/rNo6q4s+djb5aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e9f6a49e69so766230a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 18:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788487022; x=1789091822;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kfjxmy5yc8/jEFRlAYO2IBeFOPtMslxau1puO0iisgE=;
        b=iQV3yvBgGzltE33qyp5Dg5+utZuqu7FfxJ/ag6j1r65FJ9a77yEQrl6D5zEMKkiiNM
         3cD+bVGWC7LHsUFmfi2YTKWK6wdINV+/Yot8ZsUozIqkOHHIPo+n/2p40ZYVQF8yHvZx
         eFcOEpCZ79Zu7bob8ODp3DaDjP/pQ//bHStu7MtMignCz2QNqfb7HH0NORENqywlb0IQ
         aP+ZcBDloqYf1B7T/fV+Wcy6wF4DVbxEU+ibumRNHndjqp1ndkDwHWA5gctiUPiqa+Jj
         TPcjBMORiu77sFPyXBoqR9nRplHpJCNz0UyzE7Kyd7lC9xe3xGkAEZg9MJVrsuY8Ba5z
         615g==
X-Forwarded-Encrypted: i=1; AKwUvByTu1621P2HOVWipMXjgFRJBpYm/SFcN03AvHXjgPgFh/eDSkCMOhqRlbrZxhOOSW4KCn/VTvFzepkw0Ik=@vger.kernel.org
X-Gm-Message-State: AFuF++nkXUuGcKpaaZuWfNzRovhKeg5SxwWw7mpWFzGu206iOGq+ke6t
	/3HvWsdroct+vWezzFeXv2igV1rYrZdfmCw2u16rdGNrxMkqyzYB0WditCgadw2k/R6wArGXMvB
	sWN/wteJ//8NA2AEdA0ddVcwB7fqxJlhhjrF81jJO/EyRlEDxGuWP8J1vTVU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4d03:b0:6b7:83d6:2931 with SMTP id
 006d021491bc7-6b783d62f12mr3556eaf.52.1788487022066; Thu, 03 Sep 2026
 18:57:02 -0700 (PDT)
Date: Thu, 03 Sep 2026 18:57:02 -0700
In-Reply-To: <20260904013131.574605-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9a256e.9266084e.bf0d7.0381.GAE@google.com>
Subject: Re: [syzbot] [block?] general protection fault in blk_mq_quiesce_queue
From: syzbot <syzbot+fefa0af09f7891b1800e@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in nvme_reset_ctrl_sync

------------[ cut here ]------------
!list_empty(&work->entry)
WARNING: kernel/workqueue.c:2432 at __queue_work+0xee4/0x1370 kernel/workqueue.c:2432, CPU#0: syz.3.20/6407
Modules linked in:
CPU: 0 UID: 0 PID: 6407 Comm: syz.3.20 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:__queue_work+0xee4/0x1370 kernel/workqueue.c:2432
Code: 44 89 f6 e8 9e 35 3b 00 45 84 f6 0f 85 f7 f1 ff ff e9 54 7f 51 ff e8 7b 3b 3b 00 90 0f 0b 90 e9 7c f4 ff ff e8 6d 3b 3b 00 90 <0f> 0b 90 e9 95 f5 ff ff e8 5f 3b 3b 00 4c 89 e2 48 b8 00 00 00 00
RSP: 0018:ffffc90003f57af8 EFLAGS: 00010093
RAX: 0000000000000000 RBX: ffff888029078800 RCX: 0000000000000001
RDX: ffff8880290a0000 RSI: ffffffff81d000c3 RDI: ffff8880290a0000
RBP: ffff88804c6c8b10 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: ffff88804c6c8b18
R13: 1ffff920007eaf69 R14: ffff8880280cd000 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888096967000(0063) knlGS:00000000f6804b40
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 00007f04c5506e9c CR3: 000000004e47d000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 queue_work_on+0x180/0x1e0 kernel/workqueue.c:2501
 queue_work include/linux/workqueue.h:700 [inline]
 nvme_reset_ctrl drivers/nvme/host/core.c:226 [inline]
 nvme_reset_ctrl_sync+0x51/0xe0 drivers/nvme/host/core.c:236
 nvme_sysfs_reset+0x35/0x80 drivers/nvme/host/sysfs.c:21
 dev_attr_store+0x58/0x80 drivers/base/core.c:2509
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 __do_fast_syscall_32+0x13a/0x8b0 arch/x86/entry/syscall_32.c:291
 do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:316
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf702efec
Code: Unable to access opcode bytes at 0xf702efc2.
RSP: 002b:00000000f680450c EFLAGS: 00000292 ORIG_RAX: 0000000000000004
RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 0000000080000480
RDX: 0000000000000001 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000292 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>


Tested on:

commit:         940de590 Merge tag 'hardening-v7.3-rc2' of git://git.k..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=16cecb49580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85bc5cc2fc7394d9
dashboard link: https://syzkaller.appspot.com/bug?extid=fefa0af09f7891b1800e
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14cca125580000

