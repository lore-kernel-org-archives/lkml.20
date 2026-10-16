Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B647F12F585
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162805; cv=none; b=UvYHolDmyuMSEFKFyVg5b0vvlOYc8cz5XrpLIyfSu8Ixw0MBZ88E97ZKG2d4PFNOwXUW/aYtYnh2/B9IWkmF1xOMBQ43eAWB6Zw5B4Uk2zh13sUUNpIvDt7M4dJpElvLaG7D0Da3MiHV15y1VY1ThiTKEWTRUOeSQXwnn0l4PNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162805; c=relaxed/simple;
	bh=QBti5vwjk7WlTFkKvAS6TVHKmZBp63dfmkG7VGEfRHs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=fcY1gjZsAB/YpoPrOUoS/P9XmhidEBirWARt4KYcQKgymEFinya+MZMpoQYcjzxVQeSkCFUx+qnIeCrqwWoPJcV2dQj15iidjtoK3Dor/lRxK5Y6ixf4DXd4f5ljvhFN6P9X6J9iDLwmrk18LL84y3wWqdOfXNGehl6mNnX5tlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4d2f0f77124so77574b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162802; x=1792767602;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3VoXz3pWcGk2OFpNgn4+uwiFcbn5gsf99/tWqu0Qxes=;
        b=Qix6zt574jrg9KncHwB6q1b1PihFPSKsxfOPRuern2pc1sZzKOkemDoGxuPYoNpiOT
         NGQvD4bTeAq/LW6/m43VCjHa9xQYShzhaKEO16XxkX90TyqDuNJ2N1aeizzyLQBJYgEx
         wG+QeWyO2jV0V/l+UKaQI2MKW7P5G2F6UMuSktNaoufBqnnZTuBUJ8/hJIvGqmN82Wli
         UwuJdlTqUuIw9ARjMRkHQkKrmFHzNYIlqScI2Qy5T2hs4G62keS2jYCT52IzI3AStZul
         PvODBHr/yDCI+N2cvJQZVAjUY5pqk0Tdp1MsDDEgwOLDJ4nFW8fSVouGerF2R6+Yrc11
         LmUw==
X-Forwarded-Encrypted: i=1; AKwUvBxsKYPC9z2gppPIhBJB//SH0uT8G9WNX6uWKnu+tkBtsXIZ/GfBrCOnls0eEwmtyZwZXIGGF/g58/Qg+o4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVqyyCrr9GHGYYrS/w6lgN7fb3czyMwys4sANIo/2X/mHomSwB
	sSSUPY04wzyiFVJPNu1Z4Jg6Bv1V9qbmHvd8mGDjuSs1YRISth/aJbxgMPZtkyIL1lWvxZ/T4Q0
	6jN/yN3CZH5P8OfKMjYBt5cuvTd7mgvtgBDePydZUZ1RKSr8hbcjzjkR87lE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2175:b0:533:be44:82e with SMTP id
 5614622812f47-533be446562mr3401311b6e.40.1792162802722; Fri, 16 Oct 2026
 08:00:02 -0700 (PDT)
Date: Fri, 16 Oct 2026 08:00:02 -0700
In-Reply-To: <20261016144043.105294-1-deaner92@yahoo.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad23bf2.7952420f.283480.0346.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] WARNING in hci_connect_sco
From: syzbot <syzbot+5897b3c764f5989ea942@syzkaller.appspotmail.com>
To: deaner92@yahoo.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in hci_connect_sco

------------[ cut here ]------------
workqueue: cannot queue hci_conn_timeout on wq hci4
WARNING: kernel/workqueue.c:2352 at __queue_work+0xdb7/0x1370 kernel/workqueue.c:2351, CPU#3: syz.3.10663/29395
Modules linked in:
CPU: 3 UID: 0 PID: 29395 Comm: syz.3.10663 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:__queue_work+0xdbb/0x1370 kernel/workqueue.c:2351
Code: 00 00 00 fc ff df 49 8d 94 24 70 01 00 00 48 89 f9 48 c1 e9 03 80 3c 01 00 0f 85 92 05 00 00 48 8d 3d f9 73 31 0f 48 8b 75 18 <67> 48 0f b9 3a 48 b8 00 00 00 00 00 fc ff df 48 89 ea 48 c1 ea 03
RSP: 0018:ffffc9000fb5fad0 EFLAGS: 00010046
RAX: dffffc0000000000 RBX: ffff888024bc4b00 RCX: 1ffff110068ce94d
RDX: ffff88802dd11170 RSI: ffffffff8aaa2470 RDI: ffffffff91015080
RBP: ffff888034674a50 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffff88802dd11000
R13: 1ffff92001f6bf64 R14: 0000000000000000 R15: ffff888034674a58
FS:  00007f7656c026c0(0000) GS:ffff8880d634f000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7655c71fc0 CR3: 00000000333f3000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 __queue_delayed_work+0x357/0x450 kernel/workqueue.c:2617
 queue_delayed_work_on+0x180/0x1e0 kernel/workqueue.c:2669
 queue_delayed_work include/linux/workqueue.h:715 [inline]
 hci_conn_drop include/net/bluetooth/hci_core.h:1729 [inline]
 hci_conn_drop include/net/bluetooth/hci_core.h:1703 [inline]
 hci_connect_sco+0x4d2/0xef0 net/bluetooth/hci_conn.c:1881
 sco_connect net/bluetooth/sco.c:375 [inline]
 sco_sock_connect+0x631/0x1800 net/bluetooth/sco.c:764
 connect_socket net/socket.c:2141 [inline]
 connect_socket net/socket.c:2131 [inline]
 __sys_connect_file+0x146/0x1a0 net/socket.c:2166
 __sys_connect+0x141/0x170 net/socket.c:2183
 __do_sys_connect net/socket.c:2189 [inline]
 __se_sys_connect net/socket.c:2186 [inline]
 __x64_sys_connect+0x72/0xb0 net/socket.c:2186
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x119/0x770 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7655d9c629
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f7656c02028 EFLAGS: 00000246 ORIG_RAX: 000000000000002a
RAX: ffffffffffffffda RBX: 00007f7656015fa0 RCX: 00007f7655d9c629
RDX: 0000000000000008 RSI: 0000200000000340 RDI: 0000000000000005
RBP: 00007f7655e32b39 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f7656016038 R14: 00007f7656015fa0 R15: 00007fffaa2a52b8
 </TASK>
----------------
Code disassembly (best guess):
   0:	00 00                	add    %al,(%rax)
   2:	00 fc                	add    %bh,%ah
   4:	ff                   	lcall  (bad)
   5:	df 49 8d             	fisttps -0x73(%rcx)
   8:	94                   	xchg   %eax,%esp
   9:	24 70                	and    $0x70,%al
   b:	01 00                	add    %eax,(%rax)
   d:	00 48 89             	add    %cl,-0x77(%rax)
  10:	f9                   	stc
  11:	48 c1 e9 03          	shr    $0x3,%rcx
  15:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
  19:	0f 85 92 05 00 00    	jne    0x5b1
  1f:	48 8d 3d f9 73 31 0f 	lea    0xf3173f9(%rip),%rdi        # 0xf31741f
  26:	48 8b 75 18          	mov    0x18(%rbp),%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  36:	fc ff df
  39:	48 89 ea             	mov    %rbp,%rdx
  3c:	48 c1 ea 03          	shr    $0x3,%rdx


Tested on:

commit:         90201351 wifi: atk9k: Revert "wifi: ath9k: reject shor..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13940305580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1422747690f83bc1
dashboard link: https://syzkaller.appspot.com/bug?extid=5897b3c764f5989ea942
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Note: no patches were applied.
