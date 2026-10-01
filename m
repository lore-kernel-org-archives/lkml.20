Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC39345ED8
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 04:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790828614; cv=none; b=YcYecMcVr27jE/+pclOwVWwUUUwtjzKXZLZ9f8XAJP6G0VbIYq0HvYdZ9V199eadz5bBYAAW45dXUCOOaviw0QxvtJXL0FbEw+CQueX+EmsBSPsUDxDnu4sh8VtTJjkgI2TMuSQlUX6yArSQYU6gMdPegUpcgmoGtqJo/rGh4rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790828614; c=relaxed/simple;
	bh=sKDXKqSk3bvFauLVZvF0WaTTUVosGhjPrmjm4n0Sy1A=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=RUumu+gVCbhKzeCqRHe5zj8VAqaFb09xvIL1OYHkg+SzM7FEr73t7HyhinLLi7wgolD+ujw5FvZe1V9b20JhQxUdq955ceAw6YGu4WarRbxZCdz8J8oU2X0htxWnOBBUK0mFwICZR+7rcHPUB4vUGLQOgdduRDl9LvcuG+HTO4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4cc89e86e4dso9243774b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:23:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790828611; x=1791433411;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JVrqKTfGYUejmOU+41XO88Q8ARfTs1jAkBPA+fh3krU=;
        b=OddzUxTfMnZPje1pYg4AP8pFwghDvk710I8T+0schTtDPch6txPGcRMDXo/4UxAxyy
         NNX2rMyOY6qW6QA7+sLdJLnv1SdQbckkZ7bFpzeiKdV9O82chb6TRiV9CbaR3H2uJ7vq
         kYIlgHd56AsbK/HXVHyC6OK7wf75WhZs4cGkPnqmAqKuKNcdWO3vWZYmgeTAI3h9xzA6
         OdqJQjaxQ2jmXukIsHs3Et4lYlZ1ePDLUnfgmBJJhYa/KqfXXnEzPUI1M/Z0mkqf8qIh
         2+0AkOxXRaHCXIGZJ6uXQBBngZ4ctL4lDfnt5izwiqUh33IDfLrgBwFWShUSmkebB9tx
         K0EQ==
X-Gm-Message-State: AFuF++lt/7zX0efLMEHEkLlehAULmXEBrOrhvZpX9Crz+beNASdXKNTz
	qPfmNKxuUYHga+3XYzBXtDSLnwp7mbkIq+1UpniFwRq5cCgPPbpNiJ747TxDSV9RBf3ejKJ8nqA
	vEMB+15MKZycqf5VaUMzwCN+N3OT6TkC93ZSViNXE1hcRbadSjFgwP6AfGjw=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:e8b:b0:4e6:db9c:9a7c with SMTP id
 5614622812f47-4f1b9f26838mr3798525b6e.63.1790828611486; Wed, 30 Sep 2026
 21:23:31 -0700 (PDT)
Date: Wed, 30 Sep 2026 21:23:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abde043.092aa46d.14d54.0001.GAE@google.com>
Subject: [syzbot] [net?] WARNING: still has locks held in devl_lock
From: syzbot <syzbot+35ccc77ab91141b6cf3a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, mcgrof@kernel.org, netdev@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    e8e60d3ddd25 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=17310725580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=375776a45e10c065
dashboard link: https://syzkaller.appspot.com/bug?extid=35ccc77ab91141b6cf3a
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ca9fd6dc9b6c/disk-e8e60d3d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/690b32d87cdf/vmlinux-e8e60d3d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/35db39da550c/Image-e8e60d3d.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+35ccc77ab91141b6cf3a@syzkaller.appspotmail.com

====================================
WARNING: syz.3.129/5297 still has locks held!
syzkaller #0 Not tainted
------------------------------------
locks held by syz.3.129/5297: 1, last CPU#1:
 #0: ffff0000d6879258 (&devlink->lock_key#5){+.+.}-{4:4}, at: devl_lock+0x24/0x34 net/devlink/core.c:308

stack backtrace:
CPU: 1 UID: 0 PID: 5297 Comm: syz.3.129 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/14/2026
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 dump_stack+0x1c/0x28 lib/dump_stack.c:129
 print_held_locks_bug+0x90/0x98 kernel/locking/lockdep.c:6848
 debug_check_no_locks_held+0x24/0x30 kernel/locking/lockdep.c:6856
 try_to_freeze include/linux/freezer.h:62 [inline]
 usermodehelper_read_trylock+0x1d8/0x294 kernel/umh.c:228
 fw_load_from_user_helper drivers/base/firmware_loader/fallback.c:157 [inline]
 firmware_fallback_sysfs+0x158/0x930 drivers/base/firmware_loader/fallback.c:248
 _request_firmware+0xb34/0xf5c drivers/base/firmware_loader/main.c:898
 request_firmware+0x4c/0x70 drivers/base/firmware_loader/main.c:948
 devlink_compat_flash_update+0x134/0x27c net/devlink/dev.c:1248
 dev_ethtool+0x63c/0x1a78 net/ethtool/ioctl.c:3676
 dev_ioctl+0x284/0xc88 net/core/dev_ioctl.c:751
 sock_do_ioctl+0x198/0x254 net/socket.c:1339
 sock_ioctl+0x55c/0x7ec net/socket.c:1446
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __arm64_sys_ioctl+0x154/0x1cc fs/ioctl.c:583
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x60/0x1d8 arch/arm64/kernel/entry-common.c:796
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:815
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606


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
