Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299020;
	b=2TWb8GER41VyQ6CMEV24l+1jPah3ufz0MIoHFpD+HRPGvDm+YTFPtuT5YEibHGlPI3JC
	 6yfympt47smWc8KX1M5phW8KqTqQADIX+W2Ij0S+wQww2fk+8Qv4qY74p7X3EKXtoC+Nj
	 zCiv7sndvYIcyJtm8ND3kdE6eQaApwIcB91uQ12xbrqFFWO2MmbS7sx4SWD0A6ez6X7YM
	 ab3cix1jb8ArmoZPnhYDnrpComhjU76p5zR/4/IbLyhpmgB7LKyr8b2OaGeUvfGJBqzW3
	 ERFKeMSDbuNcwZ+BH/pMOu2AO8CmtlkaC8c2s4au1N2TM6pTavQ+YmSKUedwuSejQ3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299020;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=C+lLx34DtFR+icpIrkFESZORb4whxR56bE4IISsmaT0=;
	b=ZwED+EyMJJOApS1WCpb3hvx63xTmy3NOzHnRW9I+kmW1FcI5Wt445P2oHYY8EPT9SsU8
	 M8a/v510qtbmvhVab9GXJTzXJmHIVLdk3DFZRCzqsxTXzvvNVMy8PFHJT3zrR0CiUD8V7
	 fDboyz0Wt4k2As2scS4IpRvOhtXW5Cb+cksnIoNUnux9h5lnAVnNY27S+/wxDL+3w92/S
	 BnYKKcOGP8D1cjwVRAqhk1tXliv0FqvQLDo4OErk3hzDBZcxcAJmDEs3uZmHGSUsqWQO7
	 BvH97f2yFJIc78SkCICpUh3Nix7xT3Xa0PReK13lcuLsCMqhvxqCuDotj7RTWJkA4RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB9C606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AB9C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4f4612a1a5cso2035059b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:23:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794299019; x=1794903819;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C+lLx34DtFR+icpIrkFESZORb4whxR56bE4IISsmaT0=;
        b=kYq4fXxRzGsXDKZIYu1AFrJvwOP3TEnLYKuQINSngPU/Mp13z34qZH3GAuaN0Soo/O
         jL8gqeo5Q8g6naFg3PUHIJDwGQm/uXVW2tfacV9tvzxsjN1zx/UZzAliqKEPrgvYi9rA
         mzkBgjC825DfdP9WweN78inJRP4z0XiDxPgvN/ipVovytyxsSiH/KCVTmNeB4GxkCUQE
         6mMAawNAvqgz+NaZsVJzL7beW6MFOIeC5RC2cUsb5tlKvKiZxIeKNtKnJBEYxSBz1Zh9
         zIEI5t6eXy5OmuuHc2Vh8jHhkvEHu7lEpRpeuFkfx0goZWw7nN/f2AKPt2Z5yNnRGPBL
         z7tg==
X-Forwarded-Encrypted: i=1; AL+hErFjlgEj9NAVdMRqfj8y45XzHZJKjK0emBiq5gVcZ2wP2tENA7bGi7bOteq71ySbXgU51oLbXhksd5Px6Fo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8isfZYOljMkGiRRrAls19l/6WPgAK3NPF3gdLvPc3+APDOenO+
	R2Ccpk7kGlTHZZBNKajTc514TP12GqdrvbSNlLRhZuEqoTm4VvaujCKS3QDHqcmfGgMOIluaEr2
	jLY09Z6gKHCc0XEFCQbjGmOxazNbz23Rq6zzUUdhem5YG+odzYO9xgcTnoe0=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c1fc:b0:4d6:9133:cfeb with SMTP id
 5614622812f47-568813b3f76mr846681b6e.48.1794299019256; Tue, 10 Nov 2026
 00:23:39 -0800 (PST)
Date: Tue, 10 Nov 2026 00:23:39 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af2d48b.4dd4714a.f8d02.0024.GAE@google.com>
Subject: [syzbot] [bluetooth?] WARNING in disable_delayed_work_sync
From: syzbot <syzbot+b1146b58a9d6d90e0eb4@syzkaller.appspotmail.com>
To: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	luiz.dentz@gmail.com, marcel@holtmann.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    58c1eb84e977 arm64: sdei: Preserve the interrupted context..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=1070f24e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a58b6b4d667e7a61
dashboard link: https://syzkaller.appspot.com/bug?extid=b1146b58a9d6d90e0eb4
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12869155580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b1ec47537e12/disk-58c1eb84.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3bca0c2b1169/vmlinux-58c1eb84.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0a7c49594d5a/Image-58c1eb84.gz.xz

AI-generated root cause summary:
When shutting down a Bluetooth HCI device (e.g., via vhci_release() during
process exit), hci_dev_close_sync() calls hci_conn_hash_flush() to iterate and
delete all active connections on hdev->conn_hash.list via hci_conn_del(). In
hci_conn_del(), disable_delayed_work_sync(&conn->disc_work) invokes
__flush_work(), which triggers WARN_ON(!work->func) because
conn->disc_work.work.func is NULL. This occurs because the connection entry on
conn_hash.list either suffered an in-place memory corruption overwriting
disc_work or remained linked after an unbalanced hci_conn_put() dropped its
refcount to zero without deleting it from the connection hash table.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=b1146b58a9d6d90e0eb4

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b1146b58a9d6d90e0eb4@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: kernel/workqueue.c:4570 at __flush_work+0x988/0xa90 kernel/workqueue.c:-1, CPU#0: syz-executor/4881
Modules linked in:
CPU: 0 UID: 0 PID: 4881 Comm: syz-executor Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : __flush_work+0x988/0xa90 kernel/workqueue.c:-1
lr : __flush_work+0x984/0xa90 kernel/workqueue.c:4570
sp : ffff80009c5c7540
x29: ffff80009c5c76b0 x28: ffff7000138b8eac x27: 1fffe0001913694d
x26: ffff0000c89b4a68 x25: 0000000000000001 x24: dfff800000000000
x23: 0000000000000040 x22: dfff800000000000 x21: dfff800000000000
x20: ffff0000c89b4a50 x19: ffff80009c5c7580 x18: 00000000ffffffff
x17: 0000000000000003 x16: ffff8000898b7000 x15: ffff80008b586000
x14: 0000000000000000 x13: 0000000000000005 x12: 0000000000000000
x11: ffff7000138b8ec5 x10: 0000000000000000 x9 : 0000000000000000
x8 : 0000000000000000 x7 : 0000000000000000 x6 : 000000000000003f
x5 : 0000000000000040 x4 : 0000000000000000 x3 : 0000000000000020
x2 : 0000000000000008 x1 : ffff0000c8350000 x0 : 0000000000000000
Call trace:
 __flush_work+0x988/0xa90 kernel/workqueue.c:-1 (P)
 __cancel_work_sync+0xc8/0x144 kernel/workqueue.c:4729
 disable_delayed_work_sync+0x24/0x38 kernel/workqueue.c:4892
 hci_conn_del+0x6c/0xfcc net/bluetooth/hci_conn.c:1300
 hci_conn_hash_flush+0x17c/0x238 net/bluetooth/hci_conn.c:2814
 hci_dev_close_sync+0x5d4/0xd00 net/bluetooth/hci_sync.c:5681
 hci_dev_do_close+0x34/0xbc net/bluetooth/hci_core.c:502
 hci_unregister_dev+0x204/0x4c4 net/bluetooth/hci_core.c:2694
 vhci_release+0x12c/0x17c drivers/bluetooth/hci_vhci.c:704
 __fput+0x338/0x74c fs/file_table.c:512
 fput_close_sync+0x10c/0x278 fs/file_table.c:618
 filp_close_sync+0x7c/0xb4 fs/open.c:1573
 close_files fs/file.c:572 [inline]
 put_files_struct+0x1a4/0x2e8 fs/file.c:584
 switch_files_struct+0x60/0x74 fs/file.c:598
 exit_files+0x50/0x68 fs/file.c:604
 do_exit+0x55c/0x1a64 kernel/exit.c:977
 do_group_exit+0x198/0x238 kernel/exit.c:1123
 __do_sys_exit_group kernel/exit.c:1134 [inline]
 __se_sys_exit_group kernel/exit.c:1132 [inline]
 pid_child_should_wake+0x0/0x104 kernel/exit.c:1132
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x60/0x1d8 arch/arm64/kernel/entry-common.c:797
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:816
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606
irq event stamp: 175128
hardirqs last  enabled at (175127): [<ffff80008036fa20>] __cancel_work+0xf4/0x1a4 kernel/workqueue.c:4709
hardirqs last disabled at (175128): [<ffff800086953878>] el1_brk64+0x20/0x54 arch/arm64/kernel/entry-common.c:484
softirqs last  enabled at (173918): [<ffff8000800204f4>] __do_softirq+0x14/0x20 kernel/softirq.c:703


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
