Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794372123;
	b=Y0v7P3xdMeJiDlziyC3GJ4xs9KKiyo40xoP3mXfoy/nJZZqxeClYtw7MWSXWX/4v0VvC
	 pJvhVxgcNxIxQ0RJGHb34BR4cLQiMJWDeMceQqjlykVCqkOyvckrpukQ9L0AI2U/iOnSu
	 UQZeaNUtSRyWfG0gGWPW3hm99aWMyIKU9R7ovQ8oMVce8eH1aYhiCmbAlxUWgc0pFmv1f
	 O6xgovEL/R/DvV0u7Xa0m1QAFTeeOgXhBn6CRz6p4njBHdUzFzqyD7I3cilcoRK+6T44i
	 MP52BTeADQgmte1amDWaCoN6226mHtnkZ8M9120sxW/M+Nxtdd/tf+IWwAAlsGUlR3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794372123;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=FRneNlikMLGlcgwXeyNT0zePXHoEfbyzXnwyA+onIVc=;
	b=Qr8dv1M4v5iDXJLjLLzToSPmVHSBPEiQqpwwgIlyx1KrbnbGDOAQUAt2XFiOkZIqyPPw
	 sAr30gm+GibkSozknmmmDLTF41JP4e0eQt+Sq1l82amUuPl8k/FWVJUCoodv5MmXHxTz3
	 ljL3njurj1xD71Dplgiyh0ZVfCuCKYarfElfrvWci5hOuUdnZHKt69iPi4WI9cgrosRR9
	 CCuMJNLcywOrBCiOyTq4zlHu+Qc56OIoZoGw2K/+vO7otlp7TlhQ5Y0R+1b7HCAJ52Igb
	 Tlo2M6WkwplodcfxwzN+OXcL9aSAJqy0kMVHF/sPinwx2LY47RVcV4uTd1tsmPQgSUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28940606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28940606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a41f46d629so3859719b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:42:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794372122; x=1794976922;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FRneNlikMLGlcgwXeyNT0zePXHoEfbyzXnwyA+onIVc=;
        b=Xvvoos8sd3KXgwjt16wehr7+7TxvmLWDK8Lu0FQ/rln4XRgpztxR0pSbiOgyGG/ntI
         p4cjdb50RE6zZyf6AKw7E0rI5W9NDOWzmQPnyfgBp9rwGNqX84z2dnWT6SYJt/05zWGn
         k5XJ68aRJRR9eLf6pYu0zQOqBAawNyfGLBOFcKpqDR39+PKL431QLQ8tvLH+yCvoaJvn
         +whrYD1J/hFo/BW8cPqNI5dSl4i8mujCrjxsUjO7HkjrYXog9zfMiz52gJoTZIANmYuM
         G50teuhrvfDTAPmPN9LJq1Vu4lv9mEc3RYSAcXvPzOKF6rIP+wT6gZ9ikW+pOwcj4W4z
         JCQg==
X-Gm-Message-State: APuU4Z8pCwF2QOuj5B06eGqeV8nw8anbytr91sFs0BSnGnblqOehcmr7
	S8cOCXEG+tHz2eC/PgqRHLC/W3WMTLNJtSRmmPTgM7KX13sJHG+kFMB7S4W2ghAwLwe4uhK8McT
	i3CxrKVC2lZgk7jXqEU8iMYFp0zNZDGzbFSFuwcYyMpmpfltwHEgZYP+0GWQ=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:178f:b0:4b9:e65b:8c33 with SMTP id
 5614622812f47-56b970eca6fmr999487b6e.33.1794372122110; Tue, 10 Nov 2026
 20:42:02 -0800 (PST)
Date: Tue, 10 Nov 2026 20:42:02 -0800
In-Reply-To: <CAO7_G+xxRab6PJQnffPhpV+fiYbEj85bDOLYO6Uho360ohVYLw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af3f21a.926a6ce0.263fd.0198.GAE@google.com>
Subject: Re: [syzbot] [block?] BUG: unable to handle kernel paging request in blk_mq_complete_request_remote
From: syzbot <syzbot+2e3bf0bd49acd9b21d4b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, nenkov2004@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: use-after-free Write in rht_lock

bond0 (unregistering): (slave bond_slave_0): Releasing backup interface
bond0 (unregistering): (slave bond_slave_1): Releasing backup interface
bond0 (unregistering): Released all slaves
==================================================================
BUG: KASAN: use-after-free in instrument_atomic_read_write include/linux/instrumented.h:112 [inline]
BUG: KASAN: use-after-free in test_and_set_bit_lock include/asm-generic/bitops/instrumented-lock.h:57 [inline]
BUG: KASAN: use-after-free in bit_spin_lock include/linux/bit_spinlock.h:40 [inline]
BUG: KASAN: use-after-free in rht_lock_nested include/linux/rhashtable.h:330 [inline]
BUG: KASAN: use-after-free in rht_lock+0x74/0x19c include/linux/rhashtable.h:339
Write of size 8 at addr ffff000139838a68 by task kworker/u8:7/1394

CPU: 1 UID: 0 PID: 1394 Comm: kworker/u8:7 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
Workqueue: netns cleanup_net
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 print_address_description+0xb0/0x238 mm/kasan/report.c:378
 print_report+0x68/0x84 mm/kasan/report.c:482
 kasan_report+0x8c/0xc4 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x17c/0x1ac mm/kasan/generic.c:200
 __kasan_check_write+0x20/0x30 mm/kasan/shadow.c:37
 instrument_atomic_read_write include/linux/instrumented.h:112 [inline]
 test_and_set_bit_lock include/asm-generic/bitops/instrumented-lock.h:57 [inline]
 bit_spin_lock include/linux/bit_spinlock.h:40 [inline]
 rht_lock_nested include/linux/rhashtable.h:330 [inline]
 rht_lock+0x74/0x19c include/linux/rhashtable.h:339
 __rhashtable_remove_fast_one include/linux/rhashtable.h:1069 [inline]
 __rhashtable_remove_fast include/linux/rhashtable.h:1150 [inline]
 rhashtable_remove_fast include/linux/rhashtable.h:1179 [inline]
 tipc_sk_remove net/tipc/socket.c:3051 [inline]
 tipc_release+0x54c/0x10d0 net/tipc/socket.c:648
 __sock_release+0xf8/0x1d4 net/socket.c:735
 sock_release+0x24/0x34 net/socket.c:763
 tipc_topsrv_stop net/tipc/topsrv.c:770 [inline]
 tipc_topsrv_exit_net+0x224/0x26c net/tipc/topsrv.c:782
 ops_exit_list net/core/net_namespace.c:200 [inline]
 ops_undo_list+0x3cc/0x81c net/core/net_namespace.c:253
 cleanup_net+0x474/0x6c4 net/core/net_namespace.c:708
 process_one_work kernel/workqueue.c:3495 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3578
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3659
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x179838
flags: 0x5ffc00000000000(node=0|zone=2|lastcpupid=0x7ff)
raw: 05ffc00000000000 fffffdffc4e60e08 fffffdffc4e60e08 0000000000000000
raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff000139838900: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff000139838980: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>ffff000139838a00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                                                          ^
 ffff000139838a80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff000139838b00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
==================================================================
hsr_slave_0: left promiscuous mode
hsr_slave_1: left promiscuous mode
batman_adv: batadv0: Interface deactivated: batadv_slave_0
batman_adv: batadv0: Removing interface: batadv_slave_0
batman_adv: batadv0: Interface deactivated: batadv_slave_1
batman_adv: batadv0: Removing interface: batadv_slave_1
veth1_macvtap: left promiscuous mode
veth0_macvtap: left promiscuous mode
veth1_vlan: left promiscuous mode
veth0_vlan: left promiscuous mode
team0 (unregistering): Port device team_slave_1 removed
team0 (unregistering): Port device team_slave_0 removed
netdevsim netdevsim3 netdevsim0: set [1, 0] type 2 family 0 port 6081 - 0
netdevsim netdevsim3 netdevsim2: set [1, 0] type 2 family 0 port 6081 - 0
wlan1: Created IBSS using preconfigured BSSID 50:50:50:50:50:50
wlan1: Creating new IBSS network, BSSID 50:50:50:50:50:50
bridge0: port 1(bridge_slave_0) entered blocking state
bridge0: port 1(bridge_slave_0) entered forwarding state
bridge0: port 2(bridge_slave_1) entered blocking state
bridge0: port 2(bridge_slave_1) entered forwarding state


Tested on:

commit:         58c1eb84 arm64: sdei: Preserve the interrupted context..
git tree:       https://github.com/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1356e03d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a58b6b4d667e7a61
dashboard link: https://syzkaller.appspot.com/bug?extid=2e3bf0bd49acd9b21d4b
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: arm64

Note: no patches were applied.
