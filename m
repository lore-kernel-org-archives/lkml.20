Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794359556;
	b=NLnLcuNUFd/f0t3jUTupsK+ExIBGCwxlxTLMHvy1lj51gcsB51s9jF7krX8zW/5gtxWz
	 igpbiJQHJIpgxx6YuAhIuBXkmcJkrP8KNRZl1vKqanZI4wm9oa6wzant4/MM42lC+zDiC
	 50igg/gI9U5JtuSAkE+ZWnQyNetAiiTOLRCGuqB1PfBdvQbOVZG1alzHF25SaSH4XpcpW
	 dmKe6JcKpM4TqLpoiHRGULVVWDX1vHoB6S+qsschGsSI52lc/R8oo/LrCu3GAA7ipRhtr
	 r4dpGLqxg8/mFY0LUQLCcWck+4M/M1/+UTcqXn6EWSq4NcrFe7KJ7fFP5RHAfm9UUhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794359556;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=SIWfoxvOGQzQzHQfjEY1KjwfR1NJq/Fzgk+eBIX7VSE=;
	b=VM6aCSlyIP+usNfftTlDGFw4PBrpBKGceN91C+awAGInej87kTjlBiM35C0u8RxruDND
	 oJoNfMCLOEYotk7bxGD+Tw7bfo4tRdqrlHUrvar7a4lvs21ziKc/HD4qXnmkQloFXt82q
	 6xkwIqycyT2v1Nqeb/MnMlgNio0kABwTIpjGhUhFRIu3nIAMq4t2pj133h6x0HUrGsSdf
	 YECNY3O0tN8yWAebXeA75Ekp/C/l4EemuUsb+xniFyzk3/g2xVNKG4nEMD6/44TH8YEr6
	 undMuzRblU2+XgAKODqfl+1hX3VKXT1YqV2bCjt3K4vPuvF5Ybfo4MTulcHYbQJB6Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056CF606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 056CF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-5640a2d9708so2987404b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:12:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794359555; x=1794964355;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SIWfoxvOGQzQzHQfjEY1KjwfR1NJq/Fzgk+eBIX7VSE=;
        b=JnNkp0KiSYWT17rc0FGPJcmhzvQoVTmGFzXGFmPfhyrU8Dz9BMQulD9n6E4aDos345
         U6epx/adQYANFqyiibQ7urB/WhyUJO1BHxdyvHhWCK26vS9/ridsUhHfkxL5XzZ68irW
         6mZOL5UJptqDUOKYGv1kxlEXsLl2NemoTEZ+gIJj6j0BV4oPLiIcsm6Yyyw92pZ0w/Ux
         2Bl0kmqGHWime7tX5vuXgUJe/aAWd9ohqcmEWnfZr+BWlgTEUhvRXAySzKhX+UYAFXNV
         JkllrglJXuBmGwoTXWfNgHeagcigZHOxHHqISAFCkII/hYHOxKD5kuq56+JgehDB631k
         8MXA==
X-Gm-Message-State: APuU4Z9T85m7w7UrOu55RrUUIkQYTe2p8bCIX+kBrazc6Ay9JnDBeBt4
	RYJOwDeRyI7D2O9Tzsqi8cTse28M3XZ2ueX9yDD8JxqB/G0wP3p8eA5eYyHQYAK/+7WPxQoUvwE
	/HiQ+6WXiDG8sSBVYV7lKD5JlE3+0I8zxJNSb87hcSm4XinuzlCFs3UuHjEY=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6614:b0:4d6:90f3:74a1 with SMTP id
 5614622812f47-56b9771889emr610667b6e.44.1794359555068; Tue, 10 Nov 2026
 17:12:35 -0800 (PST)
Date: Tue, 10 Nov 2026 17:12:35 -0800
In-Reply-To: <6a900c70.50659fcc.60cd.0013.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af3c103.c2a1e073.10a5a1.117d.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [block?] BUG: unable to handle kernel paging
 request in blk_mq_complete_request_remote
From: syzbot <syzbot+2e3bf0bd49acd9b21d4b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [block?] BUG: unable to handle kernel paging request in blk_mq_complete_request_remote
Author: nenkov2004@gmail.com

#syz test: https://github.com/torvalds/linux.git
58c1eb84e97701c583605ba2fd553b69afba2245


On Tue, 10 Nov 2026 13:49:04 -0800, syzbot
<syzbot+2e3bf0bd49acd9b21d4b@syzkaller.appspotmail.com> wrote:
> Hello,
>
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> KASAN: null-ptr-deref Write in fib_insert_alias
>
> ==================================================================
> BUG: KASAN: null-ptr-deref in hlist_add_before_rcu include/linux/rculist.h:744 [inline]
> BUG: KASAN: null-ptr-deref in fib_insert_alias+0xb0/0xb08 net/ipv4/fib_trie.c:1160
> Write of size 8 at addr 0000000000000000 by task syz-executor/5244
>
> CPU: 1 UID: 0 PID: 5244 Comm: syz-executor Not tainted syzkaller #0 PREEMPT
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
> Call trace:
> show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:499 (C)
> __dump_stack+0x30/0x40 lib/dump_stack.c:94
> dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
> print_report+0x58/0x84 mm/kasan/report.c:485
> kasan_report+0x8c/0xc4 mm/kasan/report.c:595
> check_region_inline mm/kasan/generic.c:-1 [inline]
> kasan_check_range+0x17c/0x1ac mm/kasan/generic.c:200
> __kasan_check_write+0x20/0x30 mm/kasan/shadow.c:37
> hlist_add_before_rcu include/linux/rculist.h:744 [inline]
> fib_insert_alias+0xb0/0xb08 net/ipv4/fib_trie.c:1160
> fib_table_insert+0x5dc/0x12bc net/ipv4/fib_trie.c:1352
> fib_magic+0x26c/0x344 net/ipv4/fib_frontend.c:1147
> fib_add_ifaddr+0x2e0/0x500 net/ipv4/fib_frontend.c:1184
> fib_netdev_event+0x35c/0x49c net/ipv4/fib_frontend.c:1529
> notifier_call_chain+0x1a4/0x4cc kernel/notifier.c:86
> raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:558
> call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2313
> call_netdevice_notifiers_extack net/core/dev.c:2351 [inline]
> call_netdevice_notifiers net/core/dev.c:2365 [inline]
> __dev_notify_flags+0x288/0x438 net/core/dev.c:10051
> netif_change_flags+0xd0/0x15c net/core/dev.c:10080
> do_setlink+0xc28/0x32d4 net/core/rtnetlink.c:3294
> rtnl_changelink net/core/rtnetlink.c:3942 [inline]
> __rtnl_newlink net/core/rtnetlink.c:4113 [inline]
> rtnl_newlink+0xf48/0x1390 net/core/rtnetlink.c:4252
> rtnetlink_rcv_msg+0x66c/0x9bc net/core/rtnetlink.c:7169
> netlink_rcv_skb+0x238/0x414 net/netlink/af_netlink.c:2584
> rtnetlink_rcv+0x28/0x38 net/core/rtnetlink.c:7196
> netlink_unicast_kernel net/netlink/af_netlink.c:1335 [inline]
> netlink_unicast+0x73c/0x934 net/netlink/af_netlink.c:1361
> netlink_sendmsg+0x670/0x98c net/netlink/af_netlink.c:1920
> sock_sendmsg_nosec net/socket.c:800 [inline]
> __sock_sendmsg+0xc8/0x188 net/socket.c:818
> __sys_sendto+0x250/0x328 net/socket.c:2283
> __do_sys_sendto net/socket.c:2290 [inline]
> __se_sys_sendto net/socket.c:2286 [inline]
> __arm64_sys_sendto+0xec/0x10c net/socket.c:2286
> __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
> invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
> el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
> do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
> el0_svc+0x60/0x1d8 arch/arm64/kernel/entry-common.c:797
> el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:816
> el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606
> ==================================================================
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> Mem abort info:
> ESR = 0x0000000096000044
> EC = 0x25: DABT (current EL), IL = 32 bits
> SET = 0, FnV = 0
> EA = 0, S1PTW = 0
> FSC = 0x04: level 0 translation fault
> Data abort info:
> ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
> CM = 0, WnR = 1, TnD = 0, TagAccess = 0
> GCS = 0, Overlay = 0, DirtyBit = 0
> user pgtable: 4k pages, 48-bit VAs, pgdp=00000001173dd000
> [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
> Internal error: Oops: 0000000096000044 [#1] SMP
> Modules linked in:
> CPU: 1 UID: 0 PID: 5244 Comm: syz-executor Tainted: G B syzkaller #0 PREEMPT
> Tainted: [B]=BAD_PAGE
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
> pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
> pc : hlist_add_before_rcu include/linux/rculist.h:744 [inline]
> pc : fib_insert_alias+0xb0/0xb08 net/ipv4/fib_trie.c:1160
> lr : hlist_add_before_rcu include/linux/rculist.h:744 [inline]
> lr : fib_insert_alias+0xb0/0xb08 net/ipv4/fib_trie.c:1160
> sp : ffff800096b86750
> x29: ffff800096b86780 x28: ffff0000c8fb8528 x27: ffff0000eb35fc20
> x26: dfff800000000000 x25: 0000000000000018 x24: ffff0000c8fb8210
> x23: ffff0000dcc87660 x22: 0000000000000000 x21: ffff0000c8fb8528
> x20: ffff0000c8fb8218 x19: 1fffe000191f7043 x18: 0000000000000000
> x17: 3d3d3d3d3d3d3d3d x16: 3d3d3d3d3d3d3d3d x15: 3d3d3d3d3d3d3d3d
> x14: 00000000000006f9 x13: 0000000000000001 x12: 0000000000000000
> x11: 0000000000000000 x10: ffff70001161f92d x9 : 0000000000000000
> x8 : 0000000000000000 x7 : 0000000000000000 x6 : ffff8000804a0c38
> x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff80008030c9a8
> x2 : 0000000000000000 x1 : ffff0000c1fb1d80 x0 : 0000000000000000
> Call trace:
> hlist_add_before_rcu include/linux/rculist.h:744 [inline] (P)
> fib_insert_alias+0xb0/0xb08 net/ipv4/fib_trie.c:1160 (P)
> fib_table_insert+0x5dc/0x12bc net/ipv4/fib_trie.c:1352
> fib_magic+0x26c/0x344 net/ipv4/fib_frontend.c:1147
> fib_add_ifaddr+0x2e0/0x500 net/ipv4/fib_frontend.c:1184
> fib_netdev_event+0x35c/0x49c net/ipv4/fib_frontend.c:1529
> notifier_call_chain+0x1a4/0x4cc kernel/notifier.c:86
> raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:558
> call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2313
> call_netdevice_notifiers_extack net/core/dev.c:2351 [inline]
> call_netdevice_notifiers net/core/dev.c:2365 [inline]
> __dev_notify_flags+0x288/0x438 net/core/dev.c:10051
> netif_change_flags+0xd0/0x15c net/core/dev.c:10080
> do_setlink+0xc28/0x32d4 net/core/rtnetlink.c:3294
> rtnl_changelink net/core/rtnetlink.c:3942 [inline]
> __rtnl_newlink net/core/rtnetlink.c:4113 [inline]
> rtnl_newlink+0xf48/0x1390 net/core/rtnetlink.c:4252
> rtnetlink_rcv_msg+0x66c/0x9bc net/core/rtnetlink.c:7169
> netlink_rcv_skb+0x238/0x414 net/netlink/af_netlink.c:2584
> rtnetlink_rcv+0x28/0x38 net/core/rtnetlink.c:7196
> netlink_unicast_kernel net/netlink/af_netlink.c:1335 [inline]
> netlink_unicast+0x73c/0x934 net/netlink/af_netlink.c:1361
> netlink_sendmsg+0x670/0x98c net/netlink/af_netlink.c:1920
> sock_sendmsg_nosec net/socket.c:800 [inline]
> __sock_sendmsg+0xc8/0x188 net/socket.c:818
> __sys_sendto+0x250/0x328 net/socket.c:2283
> __do_sys_sendto net/socket.c:2290 [inline]
> __se_sys_sendto net/socket.c:2286 [inline]
> __arm64_sys_sendto+0xec/0x10c net/socket.c:2286
> __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
> invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
> el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
> do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
> el0_svc+0x60/0x1d8 arch/arm64/kernel/entry-common.c:797
> el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:816
> el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606
> Code: aa1603e0 52800101 f90002b8 96d8b07a (c89ffed5)
> ---[ end trace 0000000000000000 ]---
> ----------------
> Code disassembly (best guess):
> 0: aa1603e0 mov x0, x22
> 4: 52800101 mov w1, #0x8 // #8
> 8: f90002b8 str x24, [x21]
> c: 96d8b07a bl 0xfffffffffb62c1f4
> * 10: c89ffed5 stlr x21, [x22] <-- trapping instruction
>
> Tested on:
>
> commit: 067c5c24 Merge tag 'page_alloc-for-7.4-rc2' of git://g..
> git tree: upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=12c7b1fd580000
> kernel config: https://syzkaller.appspot.com/x/.config?x=c06331d9bb9c8204
> dashboard link: https://syzkaller.appspot.com/bug?extid=2e3bf0bd49acd9b21d4b
> compiler: Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
> userspace arch: arm64
> patch: https://syzkaller.appspot.com/x/patch.diff?x=16dccebe580000
