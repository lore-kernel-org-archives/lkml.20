Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794359631;
	b=KKRbz5qpUFxMu5cIsmjqQ7s0ePPHm3882Mzwz7Y2plHqmMymsqUu4ekJex3NFsXkAXOx
	 ScpJHwvaHUqRViWuON70IyTbSMV+a1an1CHdYhZqlnUFJZTeqb945okOx/k8hgFTZJeFL
	 UKiO9m9yf/SpjQDzwOpiS22Ok/noCp7eqEenfGC51+26LxCy3CtDK5pCdWRenryOFG0Og
	 Tu8AXC4ONHnWFOVrEuvoNAlOGzxUWqz062io2qJEqTXCyAlEMNXt3gW+DJj+7X/fqI6bl
	 ewZqg3KhoAiET76H+0c3fvVgFnBzFV2sfZnynuH89OIWOI+uYfuLB66XpB0vNjjztMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794359631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 In-Reply-To:References:MIME-Version:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=bDaWtE7H2k7Fv9wNLy43TPQhOX7yGpomZ18tYe1Tcn0=;
	b=DpIBSMPRYxzhkfTOgnlDzdb5hya6O8zz2q3RMV+rnncoB2wqQRNu04gozFn/Dxvp4z0X
	 FzsbKotSTQXTB5Mpnthn84bM3zsXf3Ghiy6xBzw8/165oydt082D8EbpgW08DtZzkaQ8h
	 wtgK+KJ4DtcsCM1sjTRlC0T4mrs15cfV9QSiTuXxbj5NDHgsgRKvV3cSWgiCgZRUPJaub
	 z9hJB1H9oqVjBmutlZ0PWi1TiwU0Tu5/ZN1LW9opShnRTf0b5zaI8YT4pGnokmDDF+jdM
	 INXlrKofKupTGg0+OfW1Z9X8eASQyCzAD41W6FbaztGS+DBM1PhTMFIoXk+Nz/1Wwsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o77dp4UH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7A1606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B7A1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o77dp4UH
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53c4b82919fso35054271cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:13:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794359629; cv=none;
        d=google.com; s=arc-20260327;
        b=FApvE6Ks/BhzbLFmUBqoFxVpCq6SshIMI18LCP598CBRTki6/LfrGfZ5FZOZhA0MJC
         KFdhswMNafI95h0wOcVSVI1lQNKtcXDSaUTRvYpZ65lmKaaS84fcx8947SIBhHdNlGzP
         oBxJXROLzIx/Rjpzx8f5Quhd1FiLBK7hbDQW7A1O7Mx1afxYSS7xTaQveoJkCuhsZB8l
         JrrBjYf3J9vngEpkuaC4R38ES9ZDOdwyyFRnbvtEpoVpsGSRi8WQR9e2tuaIdM7209Ka
         4Tg6+CJPUX1a6xDTVLwLyornx72IF4zIIfXIf9YIE3fzRSuLcAQwLr8/KwVjVTpbGaDb
         g67w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=bDaWtE7H2k7Fv9wNLy43TPQhOX7yGpomZ18tYe1Tcn0=;
        fh=c7b7+fKRWxebqpDfLsFipqUEYNqy71JG7xOmLcIvfA4=;
        b=pD9UGx0hrUfFQ+qypWVJdlq/iT9Wc/OFwmnjCGW+ew2C/Zj1lb5C8TnGYBbARyHFWG
         FFJZXgKqejzpzW+flo1m2RIPEEoGjV8O6LN94lFb963qsEzuBjr6WDh4L3bmSw95a/9E
         8C5pdrXz8PaLOgvkAXBJ5I2W0+IvTFIOogK9ucgRkv82wWbecuYXSXlvsYOuXzpfi4nm
         zoGi+IRvU/HhQ4GDc7fN93EpA1BeVFMSuG0CQ6+0Lk+Q6vOwodqCLguSn9SqLa8Nnh6S
         mCO13CoRltNdhfc4n2/pHbzeu6GcsR9/7NWai5q7U/H2BDfNfR1rUhPNCm7htUYqYMgB
         SP2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794359629; x=1794964429; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bDaWtE7H2k7Fv9wNLy43TPQhOX7yGpomZ18tYe1Tcn0=;
        b=o77dp4UHswfRqNhzbnwkAXqL6FiVCl8z16beQ4p4VAznGBoBHvi2Bp1TNKSuWIy/zm
         HxrgT3mHzQY1UmvPj4ncUbFw+tT4+2EyaSmVltVTEgpB0SCCNtVqsbt21CmqTLuTxteC
         l8zpu8ZIOEmhqYfhc7htJNyyZPgKURWlAt93GvqKw9iPqyRGx8Txikp1QWWl8IGuWs9B
         bEtV0hUfbHXeoKxayWJuGG73hbhCqPCUFP+pvqMuX7MGeuqKNGOc4uVFpiRG8yPvNuZY
         L8UAszNSqqb0t0cifjKaBnGrh4GPZvzyCeBBSk4W4G2fmcPJ6BLLb+3rBwe7mUvLVfVO
         5xbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794359629; x=1794964429;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bDaWtE7H2k7Fv9wNLy43TPQhOX7yGpomZ18tYe1Tcn0=;
        b=CDTuecC0x30iQQoBsk5DC9Vo2EKOYG4MaxV0dGia7rjTIoq4MFUgIKMw82lCQOmJI0
         4jpXWTt5Ln3m+q+oz6lZS/uLCM0E99EwUl5srS1Wf3gazmrZa6Th20rCvYMhtjNRcy5u
         HNISD7TUN2mKIKGTkNzGH3s7mXovZaZhxU8RDHINjJIvVq4AiRFFGn/XSrBebjy/HG78
         +lD/N2jcfdcN8pRAwsI72rdErCcLDqlnAMpV9WtFZZzz4FA//LQVc7v594M1+VzQZsBS
         aOffOfWjQXCt/WX2s32Vt+CSjpwQpoifTpZmzeswiBRW9KzRSDxWWglmufsiHyF9NouD
         CxaA==
X-Forwarded-Encrypted: i=1; AL+hErFxtZyVarxRmiigNHDTwSGQOm+r+IoqbXBbXnSwbx9qqGzoepxLu/Ph5u9BovDFyA3j3VVeEHpzPwmwi7M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jsyV1akIFGbEhfxjBHYzD8s4Jcf+JtPUS5gmJ19dwWSPI1g4J
	y26c9wCwh1uKdwhK8pqHndoljSSoOA2bJT/WfOmpSaevq/Og5Id9NFC75mlhgStvNkw+D4F/3G6
	j86XZora5b7Mcb2eyjpw7IPWZ5E6Gb24=
X-Gm-Gg: AYBFou3YiA3fuJteP1jh6oYSnpxER99zunpRKr3SKCx2gRUBR0mDMMhw+dHbWZw69vK
	U9FnJzdUDKIS9GFDcXqi2rZGkZnbprn47fgDYoXGRanaIF42+b4N5knfF760smCSzXHJ+jaJy5B
	K2u4y+1bjlcJi8yTF+jdxIkmf5RA+sRGm7YYUBV6suQZhe9h+TUKj1YCG/H+bYS/PObanfmtsz/
	JpAyKKHtuC0ijUM4vC3/wCePOGF5WHzJv7ZgDzeXrqZ4/upFeyv212+AnianD2trnsZE6uDQGpa
	P6EM6ChDuuz17TWoc4bB4HPw2jcr0KT465DXoINIXBN4F8tfbaGaIvGyWDe2yUWPDQkUgSGCORY
	dv4Gq3nyOE2ksqnv699w2zYWxn/9zh/k5AGM=
X-Received: by 2002:a05:622a:1b87:b0:536:990d:79a0 with SMTP id
 d75a77b69052e-556c0ea8447mr11107661cf.49.1794359629299; Tue, 10 Nov 2026
 17:13:49 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 10 Nov 2026 17:13:49 -0800
In-Reply-To: <6af39150.6ea51c61.3838e6.0017.GAE@google.com>
References: <6af39150.6ea51c61.3838e6.0017.GAE@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Hristos Nenkov <nenkov2004@gmail.com>
Date: Tue, 10 Nov 2026 17:13:49 -0800
X-Gm-Features: AclHuK-6ZcaMsa5rxGG-0CTzbZ0Vg-im7-SyxSHuLkIrWU8mc5mwr2LEnDMF6K8
Message-ID: <CAO7_G+ycrRXe+qnFoogWYgt5W=CPjq4yCg-D490x3c6sekeQfw@mail.gmail.com>
Subject: Re: [syzbot] [block?] BUG: unable to handle kernel paging request in blk_mq_complete_request_remote
To: syzbot+2e3bf0bd49acd9b21d4b@syzkaller.appspotmail.com
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

#syz invalid

I traced the current C reproducer and this report is induced by privileged
userspace directly manipulating the live NVMe PCI BAR rather than by a normal
NVMe request lifecycle.

The reproducer mounts sysfs, opens
/sys/bus/pci/devices/0000:00:02.0/resource0 with O_RDWR, and mmaps 0x2000
bytes with PROT_READ|PROT_WRITE. It then uses addresses inside that mapping
as process memory while operating on /proc/self/cmdline. In particular,
0x20002000 is BAR offset 0x1000, i.e. the NVMe doorbell area for this mapping.
The test therefore allows userspace-controlled accesses to an active
controller's MMIO registers and can make the device produce CQEs that do not
correspond to the driver's normal submission lifecycle.

The reproducer is privileged: its sandbox only drops CAP_SYS_PTRACE and
CAP_SYS_NICE, and the syzbot security assessment also marks this as
PeripheralTrigger/VMHostTrigger, not Unprivileged or UserNamespace.

A driver-side "request must be IN_FLIGHT" filter is not a sound fix here:
after tag/CID reuse a stale CQE can race with a newly started request and become
indistinguishable from a legitimate completion, turning a crash into potential
silent data corruption. Making the NVMe BAR exclusive is also not an
appropriate NVMe fix because userspace register mapping is an intentional
interface used by tools such as nvme-cli show-regs when strict I/O-memory
access is disabled.

I also submitted separate syzbot diagnostics for the existing genctr-on-cancel
and controller-disable proposals, plus an exclusive-BAR diagnostic. Those are
useful for their respective real late-completion/error-path cases, but they do
not make privileged arbitrary live-controller MMIO a valid NVMe software
lifecycle.

This report should therefore be treated as a one-off invalid crash induced by
direct privileged hardware/MMIO manipulation.

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
