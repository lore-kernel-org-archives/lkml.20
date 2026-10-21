Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792544613;
	b=c6rrfRIuu3AFq/KrSQxXbgPblRIvjusIX4kgxD/E2DIe1AAv6CUpjf3PfvPhM8AkJ9as
	 UWqB3TQG68pecD2rPJnUcWhHYH7x33K8BXsDHP0Iloyq+0DNVJ0KKiX3PePsQsQvN9nOQ
	 FI5WJVjbmupQ56rnkq937EByM6BT9tpnIJeVW9Vc4oXLHEn0+iNLXv1+2cIlQKKbATyGx
	 dO595vWQGCNopuw1m3hOeMv9XEDzrTCfVl0D4EWMl4zUc5y7l0aNGe/0nGJapOg6zuF6b
	 4On+rywLAU7WM0o7UPLMegPGoDhEElnmEmTGKBNuTeMSra5jy9GkXlIRtje3bb7Px5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792544613;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=26ckmdUGF7QTnv8n0/aMUKoRme42kauVoRprvIKYDLU=;
	b=mNcI6XAGGSrauVHEUu/dN7G4wzyFVzUKsQh63t8e+siI6eGcxnmUEJhv41/tQFZJaJ9X
	 MqPK+s03VGDcR1o+UkTTGhm8ySMM3nmNJ+YflMcYnCVb9xi0MmvnApBzF19suJFNJz/Kl
	 Ayv5xRHipFceOLUIqMJpIR2tTq38I1Oic6Ydd8xXCR36uHtZrDPbtStSdmtRiw5XzKuZ6
	 f9Ten6iZY+wB/oVFqwe2wn5cftsJe1DuIhmieTu5p7Ar/6522AX5U2UH+ay1OnSxC0RMW
	 67UB5fy76c8ZZFdO0ZpFqvNNQqwfXGlD+CaAvQjXine42HgJSqDjzKUmPkxdz0UCYkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E93606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66E93606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28d7ffab1so326094b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792544612; x=1793149412;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=26ckmdUGF7QTnv8n0/aMUKoRme42kauVoRprvIKYDLU=;
        b=KLKoPmJWwamV9YwurSfeG/vT637hIBonUtlfWzn283mBWHLb/QpuN0LGW8BtnaX9SC
         ycvG0B5N1kIWGgKB7ht8AIibJd4plEtB3CVrOMgzVnvsZmseVOL+p+NJlKQWY4Wh43kG
         smE/uBV763fLpSAvCOuYEoh8PwyCwIHhp/XkRoGO188P1rszs5gdcXXLS9QrW980QwQM
         JsYaKd2TRoOEiDi84VPAZBb62kweKUnfdXxSxcT4gOrQuesi2Ckam4K5DHBUZQTyneLj
         +4S72dnclAMf41J7w6RtiIW3lnOr1zeL2dqdNxm7yAMf1ds26et+UTGc6NIg+QIKnsFi
         XgRg==
X-Forwarded-Encrypted: i=1; AKwUvBxpJSOcbgg41PhbiDzA6MZfR+FZ8ZfQFQHWqQ5ObW5UgZ2bbpq7MC9xa8Mms6SQdNiHc42a6mHlg2Vi7/w=@vger.kernel.org
X-Gm-Message-State: AFq9FYL70Ju+gZ928v4otOxlYTk/qppZhhyMYyq5z2a3CxoTC0Ybqm3r
	J4kj26//p/uuaNqs/8EciNLispgdSesr7q/HU8AkKABRGKEZy5NL0MZzQH1AHQZyNcoJ1O5e514
	tNwnXjAoDlHEu2ujepjmS07mR2EGHjO6GsreenmkDIbA7tLg2B+r/cnfC5B8=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c224:b0:4e6:76eb:b991 with SMTP id
 5614622812f47-54d950c7a3emr2372052b6e.29.1792544612365; Tue, 20 Oct 2026
 18:03:32 -0700 (PDT)
Date: Tue, 20 Oct 2026 18:03:32 -0700
In-Reply-To: <6a6be82b.77639fcc.3d4fd0.0014.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad80f64.46bc089a.3217e3.0039.GAE@google.com>
Subject: Re: [syzbot] [net?] possible deadlock in __netdev_update_features (3)
From: syzbot <syzbot+c6c86a1c56b5131f2d97@syzkaller.appspotmail.com>
To: andrew+netdev@lunn.ch, andrew@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, edumazet@kernel.org, horms@kernel.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    7a19f0cc94ad Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=14b5b831580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=26d6221a572842ac
dashboard link: https://syzkaller.appspot.com/bug?extid=c6c86a1c56b5131f2d97
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15311081580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=159e0481580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/296cd4b77dbf/disk-7a19f0cc.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e57669ed895f/vmlinux-7a19f0cc.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c679c1ad76d4/Image-7a19f0cc.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c6c86a1c56b5131f2d97@syzkaller.appspotmail.com

batman_adv: batadv0: Interface activated: macvlan2
============================================
WARNING: possible recursive locking detected
syzkaller #0 Not tainted
--------------------------------------------
syz.0.17/4904 is trying to acquire lock:
ffff0000cbc0ce78 (&dev_instance_lock_key#23){+.+.}-{4:4}, at: netdev_lock include/linux/netdevice.h:2864 [inline]
ffff0000cbc0ce78 (&dev_instance_lock_key#23){+.+.}-{4:4}, at: netdev_lock_ops include/net/netdev_lock.h:42 [inline]
ffff0000cbc0ce78 (&dev_instance_lock_key#23){+.+.}-{4:4}, at: netdev_sync_lower_features net/core/dev.c:10983 [inline]
ffff0000cbc0ce78 (&dev_instance_lock_key#23){+.+.}-{4:4}, at: __netdev_update_features+0x988/0x1894 net/core/dev.c:11153

but task is already holding lock:
ffff0000cbc0ce78 (&dev_instance_lock_key#23){+.+.}-{4:4}, at: netdev_lock include/linux/netdevice.h:2864 [inline]
ffff0000cbc0ce78 (&dev_instance_lock_key#23){+.+.}-{4:4}, at: netdev_lock_ops include/net/netdev_lock.h:42 [inline]
ffff0000cbc0ce78 (&dev_instance_lock_key#23){+.+.}-{4:4}, at: __dev_ethtool net/ethtool/ioctl.c:3627 [inline]
ffff0000cbc0ce78 (&dev_instance_lock_key#23){+.+.}-{4:4}, at: dev_ethtool+0x384/0x1a98 net/ethtool/ioctl.c:3669
and the lock comparison function returns 0:

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&dev_instance_lock_key#23);
  lock(&dev_instance_lock_key#23);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

locks held by syz.0.17/4904: 2, last CPU#0:
 #0: ffff80008aa8ec80 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_lock+0x20/0x2c net/core/rtnetlink.c:80
 #1: ffff0000cbc0ce78 (&dev_instance_lock_key#23){+.+.}-{4:4}, at: netdev_lock include/linux/netdevice.h:2864 [inline]
 #1: ffff0000cbc0ce78 (&dev_instance_lock_key#23){+.+.}-{4:4}, at: netdev_lock_ops include/net/netdev_lock.h:42 [inline]
 #1: ffff0000cbc0ce78 (&dev_instance_lock_key#23){+.+.}-{4:4}, at: __dev_ethtool net/ethtool/ioctl.c:3627 [inline]
 #1: ffff0000cbc0ce78 (&dev_instance_lock_key#23){+.+.}-{4:4}, at: dev_ethtool+0x384/0x1a98 net/ethtool/ioctl.c:3669

stack backtrace:
CPU: 0 UID: 0 PID: 4904 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/14/2026
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 dump_stack+0x1c/0x28 lib/dump_stack.c:129
 print_deadlock_bug+0x2e8/0x2f0 kernel/locking/lockdep.c:3085
 check_deadlock kernel/locking/lockdep.c:3137 [inline]
 validate_chain kernel/locking/lockdep.c:3939 [inline]
 __lock_acquire+0x2404/0x2b08 kernel/locking/lockdep.c:5288
 lock_acquire+0x13c/0x320 kernel/locking/lockdep.c:5942
 __mutex_lock_common kernel/locking/mutex.c:646 [inline]
 __mutex_lock+0x164/0x1078 kernel/locking/mutex.c:821
 mutex_lock_nested+0x24/0x30 kernel/locking/mutex.c:874
 netdev_lock include/linux/netdevice.h:2864 [inline]
 netdev_lock_ops include/net/netdev_lock.h:42 [inline]
 netdev_sync_lower_features net/core/dev.c:10983 [inline]
 __netdev_update_features+0x988/0x1894 net/core/dev.c:11153
 netdev_update_features+0x78/0xf4 net/core/dev.c:11210
 macvlan_device_event+0x530/0x778 drivers/net/macvlan.c:1883
 notifier_call_chain+0x1a4/0x4cc kernel/notifier.c:85
 raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
 call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
 call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
 call_netdevice_notifiers net/core/dev.c:2327 [inline]
 netdev_features_change+0x84/0xcc net/core/dev.c:1612
 dev_ethtool_locked net/ethtool/ioctl.c:3576 [inline]
 __dev_ethtool net/ethtool/ioctl.c:3634 [inline]
 dev_ethtool+0x165c/0x1a98 net/ethtool/ioctl.c:3669
 dev_ioctl+0x284/0xc88 net/core/dev_ioctl.c:745
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
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
