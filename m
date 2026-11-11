Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363996;
	b=lbKioGjRhvF35sXKSmgfMEszVbVtSFSS/zQcHYOdoIyf+ocIj0uVzv58VE6Xa4dMk7DN
	 USEZLRhGmHhwuqq/DoYe+2sFsKbV1fjxZ/qQJvGpD7cdnpVFtSoQsCcOJlUmHMNDiFbWf
	 CALD488ADP9Q0lyRpJdjQB9M3Zuwdu2Ro9xTDmDCPsZrzBIyC7fs1f91e2bPEUra5bh7F
	 YpfwXodqsTn8IpmDdjZxDOxDNWMKFwp1gzA/aXYhyFUq4zuCiqXau2izz8P1a2JvH4M/k
	 04uU4WZieFtvXTDPkzQKrY193TNuQPYo1Ap+BA9KNNVOuKizoUcCLdnMbipoJeBWcJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363996;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=bqAQthlYWXd2wB1UC1Kq1+fP5T/K7rstim8fmGmQbZY=;
	b=Mv+7veL7WBseZYKfpfC3b7Chgch9S4mdXycPwWyklpeyo4F6KvXeuxIlmIq4zI0SyxrW
	 sZwjlHsnHy1ZlYhmb+4ftWCBbQYHMYBMJTIwXGcsqkKX30+RyJ9zB0q2/EGwgXKiM9Civ
	 bUKTS8T7ImFBbBIkoZlTXZnpCJBqY8Ucc2fNth7ZoERSx42tW1CFeEMXRGZOSP6sGrsLH
	 Q+vYuP8oPZBhLYHVuW5jSDN1lyDePCg1LWP6S4F6uvpUwLWR0MAwi0JbFtGEdN7o2iM3J
	 aqxjNnXDU8GoGuFQ0HPvIpEzsXDgwhOCyQLhNn34tUq4jrf/VHgEHM7LfaIsjUq7ZIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD37606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AD37606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-5384e381fbbso2199656b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794363995; x=1794968795;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bqAQthlYWXd2wB1UC1Kq1+fP5T/K7rstim8fmGmQbZY=;
        b=nUHVchqVUIm8mMryT6XcqBG2racqm98kAMWfYnobWJJzI0lzrmwLsZ2LuajVMX093g
         7STBUxguzwMlE6oCtEJ5dYjfR+6ibjQiFGxGltSZRSdFyU0HLS+kfp6lIchdHLAa+LR1
         3eWx+2658hD7mV+QkAISjNDXp1E4D4rC9r76s3lhqqpUixkPNjz2DrLKqabQWAtwNmvF
         5PgIyStz2jLbMeKgYHy9NMBvriGby7qEbxQU4ww2WGcmLVeODrLV/oGej0kNMFtinrlg
         iXDr1VHwPIpLABO4UNczG9ZxiOUl5DsNl79KXmwNqKS4FZByHqpFkY2hVmormYNdYZFA
         K+vw==
X-Forwarded-Encrypted: i=1; AL+hErEc7Snz5DJ5Makl7QiQi0IWVOJVpuykH7ztr4gzrjUm4Ww/ANPldpIrSCvyQxwwTbU4MJHuCEoHKBc92r8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LNFnv7LqX7IDSE0ovnH7ovqd2oSo4dEEr8jhjhGXZcwvRt48Y
	vMFAluWnZrMg7+TnKXHsEWF9NWUFR2n2f8GoS0dH8RtTS+TWsAg2qN6FsBHM+ZwKdmc9gVc/B/z
	nh32qSRkIiJiY9kHPa8BhLiU2JtF3mRDxloxojeIItDf9YxwioKzsAI//6xk=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4442:b0:53e:3b0b:fc1f with SMTP id
 5614622812f47-56b961950b9mr845236b6e.22.1794363995259; Tue, 10 Nov 2026
 18:26:35 -0800 (PST)
Date: Tue, 10 Nov 2026 18:26:35 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af3d25b.17ff5aea.1b027f.01a2.GAE@google.com>
Subject: [syzbot] [batman?] WARNING in __batadv_dat_purge
From: syzbot <syzbot+89f07b62d8237346ecab@syzkaller.appspotmail.com>
To: antonio@mandelbit.com, b.a.t.m.a.n@lists.open-mesh.org, 
	linux-kernel@vger.kernel.org, marek.lindner@mailbox.org, sven@narfation.org, 
	sw@simonwunderlich.de, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    b3dfbde62cf1 Merge tag 'linux_kselftest-fixes-7.4-rc3' of ..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17356f35580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d16c0eae9c338e3c
dashboard link: https://syzkaller.appspot.com/bug?extid=89f07b62d8237346ecab
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/403baefe34aa/disk-b3dfbde6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e7f58e7003b8/vmlinux-b3dfbde6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/83e039a928f8/bzImage-b3dfbde6.xz

AI-generated root cause summary:
Under PREEMPT_RT kernels, `__local_bh_enable_ip()` enforces that hard IRQs are
enabled using `lockdep_assert_irqs_enabled()`. When `batadv_dat_purge()` invokes
`__batadv_dat_purge()`, `spin_unlock_bh()` calls `local_bh_enable()`, which
trips `kernel/softirq.c:289` because lockdep's per-CPU `hardirqs_enabled`
tracker was 0 despite CPU hardware interrupts being enabled (`EFLAGS.IF == 1`).
The lock and bottom-half operations in `__batadv_dat_purge()` and its callee
`batadv_dat_entry_put()` are properly balanced, indicating lockdep's per-CPU IRQ
tracking state became desynchronized from the CPU's hardware interrupt state.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=89f07b62d8237346ecab

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+89f07b62d8237346ecab@syzkaller.appspotmail.com

------------[ cut here ]------------
__lockdep_enabled && !this_cpu_read(hardirqs_enabled)
WARNING: kernel/softirq.c:289 at __local_bh_enable_ip+0x1ea/0x2b0 kernel/softirq.c:289, CPU#1: kworker/u8:12/1182
Modules linked in:
CPU: 1 UID: 0 PID: 1182 Comm: kworker/u8:12 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
Workqueue: bat_events batadv_dat_purge
RIP: 0010:__local_bh_enable_ip+0x1ea/0x2b0 kernel/softirq.c:289
Code: 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc cc 90 0f 0b 90 e9 66 fe ff ff e8 02 78 ec 09 41 f7 c4 00 02 00 00 75 d8 eb d7 90 <0f> 0b 90 e9 92 fe ff ff 90 0f 0b 90 e9 6f ff ff ff e8 e0 77 ec 09
RSP: 0018:ffffc9000694fa30 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000200 RCX: 0000000000000046
RDX: 0000000000000001 RSI: 0000000000000200 RDI: ffffffff8b3e742e
RBP: 0000000000000400 R08: ffffffff90d5a8bf R09: 1ffffffff21ab517
R10: dffffc0000000000 R11: fffffbfff21ab518 R12: ffffffff8b3e7790
R13: dffffc0000000000 R14: ffff888061f74b90 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ffff88812480e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fe1171a6000 CR3: 0000000034222000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 spin_unlock_bh include/linux/spinlock_rt.h:122 [inline]
 __batadv_dat_purge+0x343/0x400 net/batman-adv/distributed-arp-table.c:252
 batadv_dat_purge+0x20/0x70 net/batman-adv/distributed-arp-table.c:271
 process_one_work kernel/workqueue.c:3495 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3578
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3659
 kthread+0x38b/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


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
