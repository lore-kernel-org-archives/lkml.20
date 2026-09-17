Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE87E44AB8A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789673436; cv=none; b=aF9huILcTaz7uT29W5yyF8p4zqxgV8WjQbtOc4GWT+7SG1ZkM5IMmuPOB0MTwZI1nE8nacF7TXq1toxbya1CcNS7oNuOcA5JKEicLxSEfEUSPt5UOyFZCga1a22JNeyolZdZRuwO8jDjz1/W96y2AZH0Xq5eKJKd76tsfkDTjYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789673436; c=relaxed/simple;
	bh=op/43Q8ivGnszBMmvmaQWfcywOTvNbXrkE7Z3J2S4MM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=jLSjVeG7RVzeAwHKhZ129l+KE0wlNnc0X4ICeKAARqCwJzY7amxpd1wk4WWnqAgBWWf3Akww3TSgBHj6EdCgslKTUJGnZmWzWpTZGsUzYEeMRjPgF6slAJl+JY+gTGke8OKTyD2EaYnC7VY9B7+uGDTOzMHmG5ALmtWTV0vzFI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-4c6545d0f93so21529b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789673433; x=1790278233;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKBKAO6uZv7zwP+i5r1kqr1VSMo/flSyHByrbO63mzg=;
        b=tAUvVBq2L7Fekzn6FykYv+i2IMhbdH2ZHzcPIYuEln5zNZg+91wh+i8r/WfCVHnDc7
         d2Ykp4DqdFCIToy1TsPztWdTinqyAthY9lCOL5SMIvmYmgDTzMeoElR1C54pw5MPQnT4
         4x8baeuvE8lkmsSjFOSwi+EsX8W3NvBzahA3Nr/lvclMvNAUIm6LgGPyWQie3MfdZXSf
         vnhIqY5Si3G/RyR9JbCzMqDja6Cs15JVaZpqpw0oPF2p3iJwYppN/mmfgbxZVYBWpip0
         FIJjXaC1lQcmI4u5N2F0wj9KQkfk1DJMzOQEDhfH6MFDd989ticLQceYRJLHB+a2jEL1
         0ZDw==
X-Forwarded-Encrypted: i=1; AKwUvBzeuYURyH+9D1woejctYm2ebJWpkpHyeyELCqzuE2jb4bH3/isfuEG/mUFXqHP+Wsxhf81PZ257A2AJnyA=@vger.kernel.org
X-Gm-Message-State: AFuF++nJs8xd34qGKhDi5l29d9+4HuWo6ycXRDN3NXLvZJOFFJU+gYc2
	CEDECf7Q5MM2IR1/3xAaCyWN/5P2lwVnV7BxJpm76N1B2808jT+KrjXhS+enwydWsjpnBr7dId7
	SxFxO1tecAXkA+HbfX8CGxXVdnvp0rK1LQAG1D5gH9NGwmvaXs68fjCIDcGs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1383:b0:490:315d:e0d5 with SMTP id
 5614622812f47-4ccf6a75030mr310242b6e.16.1789673433516; Thu, 17 Sep 2026
 12:30:33 -0700 (PDT)
Date: Thu, 17 Sep 2026 12:30:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aac3fd9.b398a7c9.1f86be.0021.GAE@google.com>
Subject: [syzbot] [lsm?] [io-uring?] kernel BUG in commit_creds (3)
From: syzbot <syzbot+fa63184795283ac3f842@syzkaller.appspotmail.com>
To: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, paul@paul-moore.com, sergeh@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5445d6419962 arm64: Don't read GMID_EL1 when MTE is disabled
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=11f4d8c9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=56ed23170c168d4c
dashboard link: https://syzkaller.appspot.com/bug?extid=fa63184795283ac3f842
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=124353f9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10f73bf9580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e8b70e3bd109/disk-5445d641.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e5227e56ac93/vmlinux-5445d641.xz
kernel image: https://storage.googleapis.com/syzbot-assets/54905f78be59/Image-5445d641.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fa63184795283ac3f842@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at kernel/cred.c:376!
Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 4923 Comm: iou-wrk-4922 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/14/2026
pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : commit_creds+0x888/0x8d4 kernel/cred.c:376
lr : commit_creds+0x888/0x8d4 kernel/cred.c:376
sp : ffff800098287850
x29: ffff800098287860 x28: ffff0000d05e08c8 x27: ffff0000d05e0000
x26: dfff800000000000 x25: dfff800000000000 x24: ffff700013050f18
x23: ffff0000c7e6bac8 x22: ffff0000d05e08d0 x21: ffff0000d2bb7000
x20: ffff0000d2bb7000 x19: ffff0000d2bb7300 x18: 1fffe00035b9ec28
x17: ffff8000818fd3bc x16: ffff8000816109b4 x15: ffff800080391038
x14: ffff8000815de4b4 x13: 0000000000000001 x12: 0000000000000000
x11: 0000000000000000 x10: ffff600018fcd751 x9 : 0000000000000000
x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000004 x3 : ffff800080391048
x2 : 0000000000000000 x1 : ffff0000d05e0000 x0 : 0000000000000000
Call trace:
 commit_creds+0x888/0x8d4 kernel/cred.c:376 (P)
 smk_write_relabel_self+0x398/0x418 security/smack/smackfs.c:2709
 loop_rw_iter+0x3c0/0x5c0 include/linux/uio.h:-1
 io_write+0xd50/0x1364 io_uring/rw.c:1170
 __io_issue_sqe+0x134/0x364 io_uring/io_uring.c:1386
 io_issue_sqe+0x94/0x8f0 io_uring/io_uring.c:1409
 io_wq_submit_work+0x4c4/0x690 io_uring/io_uring.c:1525
 io_worker_handle_work+0x640/0xeb8 io_uring/io-wq.c:659
 io_wq_worker+0x830/0xb44 io_uring/io-wq.c:752
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:838
Code: 91009280 9420ad5a 17fffe51 940b1fa2 (d4210000) 
---[ end trace 0000000000000000 ]---


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
