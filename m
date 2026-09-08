Received: from mail-oi2-f0.google.com (mail-oi2-f0.google.com [74.125.231.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4E648F027
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905328; cv=none; b=Gps7xrxGT+9s5myUtEv+UXwvJ5l+vF/5NkU/qtKQ5S1NcPbgoEmXNgbvimDZxHSKz9A07+lYQscFqTE/rlHGeiuJk2Tu0dgUX/2hl1DYdjXpH6DH58L81KcLVPC62c5G5JVoCvX0mWKZ8iF1/KJbyBiFNTuE3mhZoyXIR/qcAaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905328; c=relaxed/simple;
	bh=XSRx6sqC0TDMNBjUuKLKvlMtQo5rWcuXDhuCg7sGRzk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Wn4Erl5ZJ4Rtw5oB8GBtIB9vN5oiz04DLyB/iQqWxz1HVxxAgwinLlMIyYKCBFQpR99zi4HlyiZV4au1EXkuP8u05l75jstqSUgYFKX7pNcFFBgoN61Q1uOsm9keGiwJ8jqn32YcXZiyuk9RRoyRv2dpITG24QTCj42+mltmZro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f0.google.com with SMTP id 5614622812f47-4a4492f5cd1so549890b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 15:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788905326; x=1789510126;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRJT814FQHWjUha258QV+njUSFINacRXd/TWJLq0+bk=;
        b=I4C/2REJjAVHYQhL3Z1egxaaJXynIIPMmu1OAVNAcvi+X2blZMsnzQ41cnzp1TuNv5
         5jLnRtt4+D77bm9N7mWUsJryu3fd43hQhzXl9/qgbntsde8LlfnNJLpiEHS7GzefQa/t
         CBZJBLr+Mx4ZymPj8/WNYB4T1Yt0uJwgVvnZkKIQVnQQEy+onwFGLwsIeAmpsnlbAVMV
         dM5Y8nksaLMs+yOPuw90rSaDG1IYUEv2Z23rsRwYq5LicSsFjZXfKgWUJaXa25EWzxGY
         5psuxNKjmsjtQqnzIsTVJrtVKk2mU/Sp+E9tgCk+cp28sqTmy3ciBr6kVFY+aviAoWME
         2snA==
X-Gm-Message-State: AFuF++k9fkro87UoSOy8adDYINSTozrtexYatFsi7LwMREYzBhiEdmhl
	ESdPTyrL//BBZ1+LiE7x5etNt20cdg2NEqheeI2X3n4qwMmy8GVdiKwK2aEGt+gS3O0PzMIludK
	oIVmrEc8xI87iVQDfUUB/RvRK5f0fPx6lPHCnV9YxnddehlcuZU1W5ZULwvCsGw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:3405:10b0:6b7:8396:f3e0 with SMTP id
 006d021491bc7-6b78396f8e7mr10596247eaf.66.1788905326132; Tue, 08 Sep 2026
 15:08:46 -0700 (PDT)
Date: Tue, 08 Sep 2026 15:08:46 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa0876e.f81106d8.285f0a.0004.GAE@google.com>
Subject: [syzbot] [media?] [usb?] WARNING in v4l2_ctrl_auto_cluster
From: syzbot <syzbot+cf896de36144391bcde1@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    28924df2a08f Merge tag 'perf-tools-fixes-for-v7.3-2026-09-..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13901af9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e909ffe6b35dddb7
dashboard link: https://syzkaller.appspot.com/bug?extid=cf896de36144391bcde1
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13982af9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15651749580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-28924df2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/309bf243aefc/vmlinux-28924df2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5baa1c49144e/bzImage-28924df2.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cf896de36144391bcde1@syzkaller.appspotmail.com

R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
R13: 00007f81ee626038 R14: 00007f81ee625fa0 R15: 00007ffd680b1ea8
 </TASK>
------------[ cut here ]------------
ncontrols == 0 || controls[0] == NULL
WARNING: drivers/media/v4l2-core/v4l2-ctrls-core.c:2525 at v4l2_ctrl_cluster drivers/media/v4l2-core/v4l2-ctrls-core.c:2525 [inline], CPU#0: syz.2.26/5734
WARNING: drivers/media/v4l2-core/v4l2-ctrls-core.c:2525 at v4l2_ctrl_auto_cluster+0x1c1/0x610 drivers/media/v4l2-core/v4l2-ctrls-core.c:2547, CPU#0: syz.2.26/5734
Modules linked in:
CPU: 0 UID: 0 PID: 5734 Comm: syz.2.26 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:v4l2_ctrl_cluster drivers/media/v4l2-core/v4l2-ctrls-core.c:2525 [inline]
RIP: 0010:v4l2_ctrl_auto_cluster+0x1c1/0x610 drivers/media/v4l2-core/v4l2-ctrls-core.c:2547
Code: ff c7 e9 e8 fe ff ff 89 e9 80 e1 07 80 c1 03 38 c1 0f 8c 73 ff ff ff 48 89 ef e8 da b1 22 fa e9 66 ff ff ff e8 a0 12 b1 f9 90 <0f> 0b 90 eb 65 e8 95 12 b1 f9 48 8b 44 24 28 80 3c 18 00 74 08 4c
RSP: 0018:ffffc9000760f7d8 EFLAGS: 00010293
RAX: ffffffff8816c3c0 RBX: dffffc0000000000 RCX: ffff888033ce8000
RDX: 0000000000000000 RSI: 0000000000000002 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffffff8ce09500 R09: 0000000000000001
R10: 0000000000000009 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: ffff888051a45628 R15: 0000000000000002
FS:  00007f81ef2da6c0(0000) GS:ffff88808c2ca000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007faf8e1eb840 CR3: 0000000043b66000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 hackrf_probe+0x80a/0x1360 drivers/media/usb/hackrf/hackrf.c:1430
 usb_probe_interface+0x788/0xe50 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c4/0x450 drivers/base/dd.c:1098
 proc_ioctl+0x409/0x660 drivers/usb/core/devio.c:2370
 proc_ioctl_default+0xc4/0x110 drivers/usb/core/devio.c:2405
 usbdev_do_ioctl drivers/usb/core/devio.c:2769 [inline]
 usbdev_ioctl+0x1386/0x2120 drivers/usb/core/devio.c:2829
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f81ee39e159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f81ef2da028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f81ee625fa0 RCX: 00007f81ee39e159
RDX: 0000200000000200 RSI: 00000000c0105512 RDI: 0000000000000004
RBP: 00007f81ef2da090 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
R13: 00007f81ee626038 R14: 00007f81ee625fa0 R15: 00007ffd680b1ea8
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
