Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895303;
	b=fLjiq9ysNjKDUWpQVJaEHVIkcJoVl0ob6seL6Ww/we4iG/ejqdASBXfAfbhutRhGSRXn
	 T9NVGPOi5lWhPsqVi7PYCj/v3FBQFiGVfnui7uwfnyc7rwrj6RW5Vh4j+auE2whjt3gwY
	 xv00pc47EVUi6xRaLfyi+LG8glC1i+6xzWh23bQudBzkwWXTt4C2Hplt6emQGj/IxPgnX
	 VroVRmwFOpUxdZDp+YQXKuCF7ylI38R4vTAZSt9yXXU4LB4Fc2V7xFP5hapomUcKeFasj
	 qq+0dZOcJwpfwjbBZK6Bf5u4ASjDvYnyjbHgkkBNQpUv07eRZ0IS2xnoFgjgM8zosSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895303;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=tEG+XoWoEpBjsITgLA2zKZfIDKkw10MK3Hp6SrgTFDc=;
	b=urwNINJetI6PS1CfWwyKLTerEaE9eGFxE0lFwAgUQk1zLh+CM/4+WGaq5GJoZsYGNdG8
	 x/ahN9QflG4zpDO7jL+1sbHde9akyZXYmPUSTj2rX+ltGQCuDeJH8WG7+S3g2rEgrKXCo
	 sFU4JsZqf6QMb33NFqHAw18hTrvokYcMOmRgacS/OId93mhZKLbaHQVeJb3EQSFQpOcp9
	 XiG6OqN70Qu1TnYu8cow4fsZzXCOkwkree6lNo0scLiSQ7z82lOYy3Msy8EMhjvAFixl1
	 Iv1OfryP297hYoaKVQxKQVgcFYHz5aOvGVh/l6zn/eTgklSBG8Hg39j4YsMZxGjrCuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA9E606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FA9E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-5641cd2cc13so2181638b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:15:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895302; x=1794500102;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tEG+XoWoEpBjsITgLA2zKZfIDKkw10MK3Hp6SrgTFDc=;
        b=EMhwpNx98PEctY19mElNQFudSwQbSuM4gxfjAuWAYe92mP4520r9qNNTS2dwpXYxiJ
         qkEnO76TQvsKhvu6IJQk3cvtSunzvM6+4fyB4RozUl+6uTZXroMjhBiAZ1udaam6JEuZ
         e53EbvkbniQkTuulBgIE5lszk06Dnqsl/yysBvVxQTVZvJ2DTpA4I8RRoJusPZF5g5nd
         py20LBk2HKZrlyGFPceXKk9Jv5WlXyrPxB6ZshvtUx/m0uXn4AxZYulKlBGPRoiNve1a
         rf/mTX7dAdvkrA5F59XyoFxDJBVpkB1dtB+bWg2MTSAf5Pmj5BMrqKH2J3z2SQBmg8S/
         J5Zg==
X-Forwarded-Encrypted: i=1; AKwUvBwVc3QzT/LaDlGw0V9wxjhCjRfA8njLTfw/FCA1UyfdfbeMzorT7sEhN2YndtooQngGghYAxJYzaNr29bk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gxz4anCbxGfyiigD6tzApgLjYhMCIIAEEwsgOlxuVdgj1Wq2/
	w5WYXhUAVIhxjki10Y7xE0tn0AlSDAEBl+gOYzYp5TylIeZ2C6w2WaxtJ8kh+M1+cihp8+7unK1
	KUHejG3PXOczpVXoZEhdz3YD+f88pNryszvX9Nvyp8r3Vdbmf3KWnnmB/LMg=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f4e:b0:4f5:4f8:889 with SMTP id
 5614622812f47-5640de7b4e1mr14102896b6e.62.1793895302220; Thu, 05 Nov 2026
 08:15:02 -0800 (PST)
Date: Thu, 05 Nov 2026 08:15:02 -0800
In-Reply-To: <20261105125943.178158-1-gowtham398gs@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aecab86.ab333cca.1deac.0001.GAE@google.com>
Subject: Re: [syzbot] [btrfs?] [ext4?] [ntfs3?] memory leak in __pcs_replace_full_main
From: syzbot <syzbot+4d078516add5f4f12cea@syzkaller.appspotmail.com>
To: gowtham398gs@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
memory leak in __netlink_create

BUG: memory leak
unreferenced object 0xffff8881126c5800 (size 2048):
  comm "udevd", pid 4994, jiffies 4294948333
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    10 00 07 40 00 00 00 00 00 00 00 00 00 00 00 00  ...@............
  backtrace (crc a071d5b):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4735 [inline]
    slab_alloc_node mm/slub.c:5035 [inline]
    __do_kmalloc_node mm/slub.c:5532 [inline]
    __kmalloc_noprof+0x3ce/0x510 mm/slub.c:5558
    _kmalloc_noprof include/linux/slab.h:995 [inline]
    sk_prot_alloc+0xf9/0x1b0 net/core/sock.c:2281
    sk_alloc+0x36/0x3e0 net/core/sock.c:2337
    __netlink_create+0x3b/0xb0 net/netlink/af_netlink.c:624
    netlink_create+0x1c5/0x2f0 net/netlink/af_netlink.c:682
    __sock_create+0x1a9/0x2d0 net/socket.c:1679
    sock_create net/socket.c:1737 [inline]
    __sys_socket_create net/socket.c:1774 [inline]
    __sys_socket+0xb7/0x1a0 net/socket.c:1821
    __do_sys_socket net/socket.c:1835 [inline]
    __se_sys_socket net/socket.c:1833 [inline]
    __x64_sys_socket+0x1b/0x30 net/socket.c:1833
    do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
    do_syscall_64+0xe9/0x530 arch/x86/entry/syscall_64.c:84
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888126e74380 (size 32):
  comm "udevd", pid 4994, jiffies 4294948333
  hex dump (first 32 bytes):
    f8 ae 0a 00 81 88 ff ff 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc f6dd81f5):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4735 [inline]
    slab_alloc_node mm/slub.c:5035 [inline]
    __do_kmalloc_node mm/slub.c:5532 [inline]
    __kmalloc_noprof+0x3ce/0x510 mm/slub.c:5558
    _kmalloc_noprof include/linux/slab.h:995 [inline]
    _kzalloc_noprof include/linux/slab.h:1312 [inline]
    lsm_blob_alloc+0x4d/0x80 security/security.c:219
    lsm_sock_alloc security/security.c:4556 [inline]
    security_sk_alloc+0x2d/0x290 security/security.c:4572
    sk_prot_alloc+0x114/0x1b0 net/core/sock.c:2284
    sk_alloc+0x36/0x3e0 net/core/sock.c:2337
    __netlink_create+0x3b/0xb0 net/netlink/af_netlink.c:624
    netlink_create+0x1c5/0x2f0 net/netlink/af_netlink.c:682
    __sock_create+0x1a9/0x2d0 net/socket.c:1679
    sock_create net/socket.c:1737 [inline]
    __sys_socket_create net/socket.c:1774 [inline]
    __sys_socket+0xb7/0x1a0 net/socket.c:1821
    __do_sys_socket net/socket.c:1835 [inline]
    __se_sys_socket net/socket.c:1833 [inline]
    __x64_sys_socket+0x1b/0x30 net/socket.c:1833
    do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
    do_syscall_64+0xe9/0x530 arch/x86/entry/syscall_64.c:84
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888127f13800 (size 2048):
  comm "udevd", pid 4994, jiffies 4294948336
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    10 00 07 40 00 00 00 00 00 00 00 00 00 00 00 00  ...@............
  backtrace (crc b5cbc83d):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4735 [inline]
    slab_alloc_node mm/slub.c:5035 [inline]
    __do_kmalloc_node mm/slub.c:5532 [inline]
    __kmalloc_noprof+0x3ce/0x510 mm/slub.c:5558
    _kmalloc_noprof include/linux/slab.h:995 [inline]
    sk_prot_alloc+0xf9/0x1b0 net/core/sock.c:2281
    sk_alloc+0x36/0x3e0 net/core/sock.c:2337
    __netlink_create+0x3b/0xb0 net/netlink/af_netlink.c:624
    netlink_create+0x1c5/0x2f0 net/netlink/af_netlink.c:682
    __sock_create+0x1a9/0x2d0 net/socket.c:1679
    sock_create net/socket.c:1737 [inline]
    __sys_socket_create net/socket.c:1774 [inline]
    __sys_socket+0xb7/0x1a0 net/socket.c:1821
    __do_sys_socket net/socket.c:1835 [inline]
    __se_sys_socket net/socket.c:1833 [inline]
    __x64_sys_socket+0x1b/0x30 net/socket.c:1833
    do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
    do_syscall_64+0xe9/0x530 arch/x86/entry/syscall_64.c:84
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888126fbf9e0 (size 32):
  comm "udevd", pid 4994, jiffies 4294948336
  hex dump (first 32 bytes):
    f8 ae 0a 00 81 88 ff ff 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc f6dd81f5):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4735 [inline]
    slab_alloc_node mm/slub.c:5035 [inline]
    __do_kmalloc_node mm/slub.c:5532 [inline]
    __kmalloc_noprof+0x3ce/0x510 mm/slub.c:5558
    _kmalloc_noprof include/linux/slab.h:995 [inline]
    _kzalloc_noprof include/linux/slab.h:1312 [inline]
    lsm_blob_alloc+0x4d/0x80 security/security.c:219
    lsm_sock_alloc security/security.c:4556 [inline]
    security_sk_alloc+0x2d/0x290 security/security.c:4572
    sk_prot_alloc+0x114/0x1b0 net/core/sock.c:2284
    sk_alloc+0x36/0x3e0 net/core/sock.c:2337
    __netlink_create+0x3b/0xb0 net/netlink/af_netlink.c:624
    netlink_create+0x1c5/0x2f0 net/netlink/af_netlink.c:682
    __sock_create+0x1a9/0x2d0 net/socket.c:1679
    sock_create net/socket.c:1737 [inline]
    __sys_socket_create net/socket.c:1774 [inline]
    __sys_socket+0xb7/0x1a0 net/socket.c:1821
    __do_sys_socket net/socket.c:1835 [inline]
    __se_sys_socket net/socket.c:1833 [inline]
    __x64_sys_socket+0x1b/0x30 net/socket.c:1833
    do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
    do_syscall_64+0xe9/0x530 arch/x86/entry/syscall_64.c:84
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888126d86000 (size 2048):
  comm "udevd", pid 4994, jiffies 4294948337
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    10 00 07 40 00 00 00 00 00 00 00 00 00 00 00 00  ...@............
  backtrace (crc 2985600b):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4735 [inline]
    slab_alloc_node mm/slub.c:5035 [inline]
    __do_kmalloc_node mm/slub.c:5532 [inline]
    __kmalloc_noprof+0x3ce/0x510 mm/slub.c:5558
    _kmalloc_noprof include/linux/slab.h:995 [inline]
    sk_prot_alloc+0xf9/0x1b0 net/core/sock.c:2281
    sk_alloc+0x36/0x3e0 net/core/sock.c:2337
    __netlink_create+0x3b/0xb0 net/netlink/af_netlink.c:624
    netlink_create+0x1c5/0x2f0 net/netlink/af_netlink.c:682
    __sock_create+0x1a9/0x2d0 net/socket.c:1679
    sock_create net/socket.c:1737 [inline]
    __sys_socket_create net/socket.c:1774 [inline]
    __sys_socket+0xb7/0x1a0 net/socket.c:1821
    __do_sys_socket net/socket.c:1835 [inline]
    __se_sys_socket net/socket.c:1833 [inline]
    __x64_sys_socket+0x1b/0x30 net/socket.c:1833
    do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
    do_syscall_64+0xe9/0x530 arch/x86/entry/syscall_64.c:84
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888129029720 (size 32):
  comm "udevd", pid 4994, jiffies 4294948337
  hex dump (first 32 bytes):
    f8 ae 0a 00 81 88 ff ff 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc f6dd81f5):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4735 [inline]
    slab_alloc_node mm/slub.c:5035 [inline]
    __do_kmalloc_node mm/slub.c:5532 [inline]
    __kmalloc_noprof+0x3ce/0x510 mm/slub.c:5558
    _kmalloc_noprof include/linux/slab.h:995 [inline]
    _kzalloc_noprof include/linux/slab.h:1312 [inline]
    lsm_blob_alloc+0x4d/0x80 security/security.c:219
    lsm_sock_alloc security/security.c:4556 [inline]
    security_sk_alloc+0x2d/0x290 security/security.c:4572
    sk_prot_alloc+0x114/0x1b0 net/core/sock.c:2284
    sk_alloc+0x36/0x3e0 net/core/sock.c:2337
    __netlink_create+0x3b/0xb0 net/netlink/af_netlink.c:624
    netlink_create+0x1c5/0x2f0 net/netlink/af_netlink.c:682
    __sock_create+0x1a9/0x2d0 net/socket.c:1679
    sock_create net/socket.c:1737 [inline]
    __sys_socket_create net/socket.c:1774 [inline]
    __sys_socket+0xb7/0x1a0 net/socket.c:1821
    __do_sys_socket net/socket.c:1835 [inline]
    __se_sys_socket net/socket.c:1833 [inline]
    __x64_sys_socket+0x1b/0x30 net/socket.c:1833
    do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
    do_syscall_64+0xe9/0x530 arch/x86/entry/syscall_64.c:84
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


Tested on:

commit:         05441d69 Merge tag 'cocci-7.4-rc1' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12dde455580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4361b1bb937ae1c4
dashboard link: https://syzkaller.appspot.com/bug?extid=4d078516add5f4f12cea
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13bf59dd580000

