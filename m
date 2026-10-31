Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453442;
	b=R8OkummhuRqla3FeV+C4cfImHnp09L4mboYVBy2bihU9GuSKacmcUX3BY0icUSS81S7a
	 zyYbgm+suXs5qr0rKYB0dzvxcKBURnJ90V//9ad9f2fgaBSr75sMU3lI2dMwEqKGB1uWR
	 GpqF7jr+ZYuf0JmKn0ypTzD46YNmQHyuqmwkl1VqIRa1U6G+P7dzx39luTZctnTaQtI6J
	 ZoRy429KF964RUehm+yjO4D4CIxVTmLceHmYVBHl+qAMEz3WipBU7D4/8AAWLB5crEpeJ
	 bOnFJZidk5yWhk7a6dx+1S7ax1L883f4el/wPAKktKT2qbuZG2Krv8fL5w8BMKVLnGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453442;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=8pfUsnr9tdOmGaNwEWjLs1OKNwnTF5JIb3eCI5kWqIg=;
	b=rFKvZQWeafWbvTiPSWZsosHy2MkFqKtCWb6P/Sx4ytun4ETPnN653amntKwXUA1EiUai
	 7oDEt7W9vGOS4nrk1IXn9KBBAuRHsRBJ/Z2t+Yalz+Pdwv6HqDxSrnbZPTbPggDH46auS
	 Mp6KL05OnKxCnm5k/jMioiO/pIbEXfP56BCBvinMPIrxyl42z3itEifmYyl5FPJSGiK0N
	 JCxmhIdJ8G5C0u3XrNTRfAoJS0tTPIok/jQd66dwefxXpIMEQ8+wNCpLzW59rDEQ9hdRY
	 Vb1Kmws0ZKgHMutTj8E/p8hOK/h5/2X/IYXau8t6YyEhON/Nz2WtqfWIAUfB4Y3njmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F56D606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F56D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-851f720d7afso1183085a34.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 06:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793453441; x=1794058241;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8pfUsnr9tdOmGaNwEWjLs1OKNwnTF5JIb3eCI5kWqIg=;
        b=AltzOuRHsep/S2SLzkD3EGlQMS9cWWcjRZY2CeJK7rse2ORLXSntEZvPO96vWNIjIY
         Y3T8IVRbmvnIKzevvcT2niELpFfgPSRw+53pln32QzWBjYToOkmZx2kgsDIMd4qOIv1x
         uXDRbucBCddfEAQMiKPtwDhg0yx8FIwp0BbAOQuwf3WCQPl7r/xNrSHcb3EJUWi6Lhn1
         MelOfEr1A7WzHf+kfKQXAJ+UtIeF36HVinl0j8dDFUwIck+5/8EgLJiHwHNuRVsGR6jK
         LZhX8kOU17l33g6iw35/caiaMNRNKd4th/28PcL7Ts/8XE1felIvPhB0nZk0D1C/eXkQ
         XUBA==
X-Forwarded-Encrypted: i=1; AKwUvBwpDqrJXRLWZkhqZ58l0x8R8KeJzUx/IWDXMJwJPI3BF/Cydqa0hILF+vHzaTlX3NeYyTzeLCS0UUDBMfU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKj1s10B8ScXvG/2VAcQhakYlZWD7T4wvyTgbZkfvyWNP87bqzZ
	+OsDz7PB46tNqNn32C+H4iIR0Wq84MG8deO4zAsKCdk59ynsQomvAtZ2frFBfXYenvPyKhrKa9U
	0cthirQWbxrftiHnjMYgUzQv4lyp/KDZeXXYT7r1NhWWaT2Tgu3g0Xd7Y1aE=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:192a:b0:504:5fe1:c8d4 with SMTP id
 5614622812f47-5640de7456amr3804995b6e.59.1793453441120; Sat, 31 Oct 2026
 06:30:41 -0700 (PDT)
Date: Sat, 31 Oct 2026 06:30:41 -0700
In-Reply-To: <6a791c94.01d0871a.3a0d52.009a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae5ed81.041e992e.a2316.0006.GAE@google.com>
Subject: Re: [syzbot] [btrfs?] WARNING in __add_block_group_free_space
From: syzbot <syzbot+6931616d57696102d8aa@syzkaller.appspotmail.com>
To: clm@fb.com, dsterba@suse.com, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    36aad21d50d1 Merge tag 'ksmbd-for-7.4-rc1-part2' of git://..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=113b8959580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=94cb1a71158c9027
dashboard link: https://syzkaller.appspot.com/bug?extid=6931616d57696102d8aa
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=147bccb1580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6931616d57696102d8aa@syzkaller.appspotmail.com

------------[ cut here ]------------
btrfs_abort_should_print_stack(__error)
WARNING: fs/btrfs/free-space-tree.c:1446 at __add_block_group_free_space+0x5a3/0x5b0 fs/btrfs/free-space-tree.c:1446, CPU#0: kworker/u4:7/185
Modules linked in:
CPU: 0 UID: 0 PID: 185 Comm: kworker/u4:7 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: events_unbound btrfs_async_reclaim_data_space
RIP: 0010:__add_block_group_free_space+0x5a3/0x5b0 fs/btrfs/free-space-tree.c:1446
Code: 07 38 c1 0f 8c ce fc ff ff 4c 89 f7 e8 66 3c f5 fd e9 c1 fc ff ff e8 cc 98 7c fd eb 10 e8 c5 98 7c fd eb 09 e8 be 98 7c fd 90 <0f> 0b 90 44 89 e1 f7 d9 e9 51 fe ff ff 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffc90001a7f578 EFLAGS: 00010293
RAX: ffffffff844c8872 RBX: ffff888013790001 RCX: ffff888034dc0000
RDX: 0000000000000000 RSI: ffffffff9081ef80 RDI: 00000000ffffffe4
RBP: ffff888037aea758 R08: ffff888034dc0000 R09: 0000000000000003
R10: 00000000fffffffb R11: 0000000000000000 R12: 00000000ffffffe4
R13: ffff88801377d000 R14: ffff888037aea7b8 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff88808aa01000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f4b3d8dd080 CR3: 0000000041dd5000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 btrfs_add_block_group_free_space+0xd0/0x130 fs/btrfs/free-space-tree.c:1471
 btrfs_create_pending_block_groups+0xcc6/0x15e0 fs/btrfs/block-group.c:2942
 __btrfs_end_transaction+0x140/0x640 fs/btrfs/transaction.c:1119
 flush_space+0x3e9/0xde0 fs/btrfs/space-info.c:912
 do_async_reclaim_data_space+0x137/0x550 fs/btrfs/space-info.c:1455
 btrfs_async_reclaim_data_space+0x41/0x90 fs/btrfs/space-info.c:1519
 process_one_work kernel/workqueue.c:3495 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3578
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3659
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
