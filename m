Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794359560;
	b=XTNtjKrP8fHczWmBC1bnUMBk1R4Ijln37uROvMhRCmfPPDZKzj/APNJ0+hHRbKpoSCdR
	 FdJkHxOHlgIQq4zAlcozfEiVqrKf+JXC713w8qab3ndpWnY0VoWXDIs9iOjoh2jfzxvRz
	 YvklSEi+TKPPMrnYwaj5VnIRBjHGHFphgR6Lz401AUath08Ifn1AqPTilEi99wo1EhHou
	 At0rqWTYfd7Mus7CQWsyIz0/6DsjdzBTb/eDK3WRt0HFu+ccjQBzqzaCz+6x7qyTaLEv2
	 gTafZmrbpsh2fBkhP6NCLh9kbSiA9f5LqZBuujX5Diolx7XyjJpll5fSuelvzHaarog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794359560;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=+mkH6EmiJLsw0LgYdB8cE8bG7NqkR6d4lNmfVUbGQOs=;
	b=CgpJbjtvxtj8NE8JfZAOid7sycAApqAV6Y/gKkHzbM/MHEWM6QkOU/UoNsE4YQ4UqmAs
	 3u0kEF8tLgUrfhCf9RCruWLlxLqfOnM/jvoyOPnDHRorM5CMn4Z/2SJ9PW/wcgTbYrg4D
	 OyqxvoSd8RWnJMwH2efV1P4fh10VzyfKtgHfLJjZ8MLkLg0SFyI0gyxiIKmmZ4OM3Efp8
	 8v519tTrYBUuGQUvJrTiDF8g94+n1NmDbri+/6TrqYJaeluSGHXPCWU+pNMq3WCUg5o+N
	 KdgEHmLI+abynbYEJ+iZwipvSQSkLhJIOlr4Azt+oXCzY7KOTyDIhPSuwVE6uS0B8/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0913A606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0913A606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-84478a97bfbso4059730a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:12:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794359559; x=1794964359;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+mkH6EmiJLsw0LgYdB8cE8bG7NqkR6d4lNmfVUbGQOs=;
        b=jwojAlP/sWMi3o7LY4GWx0ZF64nnYMaAX/GBiQgJN10NtzLrp+YqbMbvKClLYi7tVF
         lZoXyqdxc42Q35MV8LcCW0QYvpWumDci2x812JRHNNlll3/UR+/R2dLpv1GM2kqEkngD
         dxoLiy46JR4EQtEmYEic5RMrVTUGchWbF21Z8JRbm3TXCO53Q+O8zw18esDQ5TgUDUvM
         vxkJL8zP3B7UQBiQsPXNIlh/J2egwCLgqnZUXj40cBxbZ2KyALwHfG8euXrrT3ZjW+eu
         lqsxY6OAY6BLR/NrLiUfpveKjp218uJnwOUQDDjCYwvPptSQ+64ORkYSt2qESi7swGOb
         ZpLQ==
X-Gm-Message-State: APuU4Z92n/KSt+Hm7LKlUEbCWPSiMyKxUytKgiaWVtw3iTdAIZ8QqEeE
	9eo+LY4E63w1cVGeWb3YHnFb2Pe7llD4A3WNkOdIzqaIMpKRT0J54JFvP5fTe8k43963u4YCfOX
	RgaRcco4c8cnkWONG3O6UIJGu0muS8+INVuNO0P2o1sw+WvkLtCGC7+ZtVfk=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6809:103:10b0:4f7:d324:bc3a with SMTP id
 5614622812f47-56b968c33c5mr500542b6e.18.1794359559069; Tue, 10 Nov 2026
 17:12:39 -0800 (PST)
Date: Tue, 10 Nov 2026 17:12:39 -0800
In-Reply-To: <6a900c70.50659fcc.60cd.0013.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af3c107.17ff5aea.1b027f.01a0.GAE@google.com>
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

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -3815,7 +3815,9 @@ static int nvme_dev_map(struct nvme_dev *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev->dev);

-	if (pci_request_mem_regions(pdev, "nvme"))
+	if (pci_request_selected_regions_exclusive(
+		    pdev, pci_select_bars(pdev, IORESOURCE_MEM),
+		    "nvme"))
 		return -ENODEV;

 	if (nvme_remap_bar(dev, NVME_REG_DBS + 4096))


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
