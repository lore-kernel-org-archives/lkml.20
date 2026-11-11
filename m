Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371166;
	b=yvqSB00FtFyGV0GEz+QE2eXggB0Ozm3RLorldfb2p1f9VH+obPce58OeGNhI6mQWRZmM
	 38e72tkU7tTBnG3TR05tErKEeXGRWv9Yv26a3wR1IQoTohqEx8Mxgeo+k700QTY7g3eh+
	 CDzaRqr8eKej5jVJnIOuZCv0nFBYvZ4bZSd5KE14XqbXYLLc30uTUF7o/hzbQM9jNohV2
	 wF+FrlWDoas3l/UvD9BHo0hM2xq8zTG+IrqqddF1PVUAHKIpUXJJkLisXD9PvIxI5kMPc
	 6xyUiwWjUtufg5DGEttIXWtr+Ao1MbzszvIkt5K7l4tAgtEgoY3ZnY1lITyzRKir3Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371166;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=1SawKUdljjfjAsoXlQFxKsHimtx+RwI5L5NkokkbMpE=;
	b=xiasMBMjuqwN+WS0m1CmoyqPZbUof8lQ5DEipWAq5cQKDUTPotfpxxD+nSJqv55uvPGv
	 zW8yARkjPPFLJykNxkIOqASLoKS5rJWUjO5qdDwxrUTaOnkqJEFTHAukcrSAsHu09KBp/
	 J6hAQ77qf+9fjoOUmei9zebLwAo5SHT7433BbkKeG7/HrMed0bklRu5A780j1OrddRp7c
	 amPqd8DKJhCMfH00aCWFtb37ANnQFLpiChewv0wCL6wED0YO547Zt1WNiHtLqp9KKS7kC
	 6MM8qGyprIP4dcGGFEUTsRMbRj/tQzOCh8XPhXFaFwpL5WL5SPHGpV2AW1RnS+UNPiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41102606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41102606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c734afb8deso3134399b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:26:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371165; x=1794975965;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1SawKUdljjfjAsoXlQFxKsHimtx+RwI5L5NkokkbMpE=;
        b=U4qVZ+k9GoE2fTKEOqlDEG/Xg0EIa1LVBEQyKa2rl9CCn8utnJw4BF9Pi+3t1jSR/A
         DmDXTawXTfVoOLUU3lTWWO3X+/btvXaQjgFxI8Vc8MgwT032mVQVxraY/DPbxuentU3E
         IaOiP9ktTcvKsADnwqnfsb9+n8apa/U3o5FqpCX7Gy31JNcSxXLUmaNa4Ixwd8424cuE
         661PYS6WYhAL6ZVUXTX/0PAWB+902pRGD0j4TSgDtMR7Hh+FYW9rttsXdPxdyrnZmVOZ
         d8WlwleDWNMKs7cyJ8JfXcnFidCBHh1t1OGqHpx8rvx+9agugw8biv7ZWiHX9J1OEZSx
         9a4w==
X-Gm-Message-State: APuU4Z8qZrCrxCOPx8XwpL1QJYxB+nYG6L2oR7EDrC+V2aVabsNxPtGj
	fSrSRy7MrmCjI8O5nqmmAzxWqbKOMSQ4XzCsRj64cV0oVCrImGyKe9HvVWMge3tRhww5sElsGUL
	IkADQn29pgQrj2mo7GITJCeoJSW+hPT7+BrUOwAnrQivPrbonVqGjxXjwZkI=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:320c:b0:4e6:b6a1:5af2 with SMTP id
 5614622812f47-56b9770a5admr986535b6e.51.1794371165414; Tue, 10 Nov 2026
 20:26:05 -0800 (PST)
Date: Tue, 10 Nov 2026 20:26:05 -0800
In-Reply-To: <CAO7_G+xfNddPzLFwOEK1nm06WbPMH2b_DgFNOHeE50Za0Zr+eQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af3ee5d.5a88765f.2cb6a7.0001.GAE@google.com>
Subject: Re: [syzbot] [block?] BUG: unable to handle kernel paging request in blk_mq_complete_request_remote
From: syzbot <syzbot+2e3bf0bd49acd9b21d4b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, nenkov2004@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
BUG: unable to handle kernel paging request in ip6mr_rule_action

Unable to handle kernel paging request at virtual address dfff800000000005
KASAN: null-ptr-deref in range [0x0000000000000028-0x000000000000002f]
Mem abort info:
  ESR = 0x0000000096000005
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x05: level 1 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0
[dfff800000000005] address between user and kernel address ranges
Internal error: Oops: 0000000096000005 [#1]  SMP
Modules linked in:
CPU: 1 UID: 0 PID: 26 Comm: kworker/1:1 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
Workqueue: mld mld_ifc_work
pstate: 03400005 (nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : __ip6mr_get_table net/ipv6/ip6mr.c:135 [inline]
pc : ip6mr_rule_action+0x13c/0x240 net/ipv6/ip6mr.c:182
lr : __ip6mr_get_table net/ipv6/ip6mr.c:135 [inline]
lr : ip6mr_rule_action+0x154/0x240 net/ipv6/ip6mr.c:182
sp : ffff80008fb37320
x29: ffff80008fb37320 x28: 0000000000000001 x27: dfff800000000000
x26: ffff80008fb375d3 x25: 1ffff00011f66eb9 x24: ffff0000cef72030
x23: dfff800000000000 x22: 00000000000000fe x21: ffff0000d8361170
x20: 0000000000000000 x19: ffff80008fb37480 x18: ffff80012364b000
x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
x14: 00000000001afe83 x13: 0000000000000009 x12: 0000000000000009
x11: 000000009b598062 x10: 000000000000000f x9 : 0000000000000005
x8 : 0000000000000028 x7 : ffff800084e20308 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff8000858e5e60
x2 : 0000000000000000 x1 : ffff0000c1b79d80 x0 : 0000000000000000
Call trace:
 __ip6mr_get_table net/ipv6/ip6mr.c:135 [inline] (P)
 ip6mr_rule_action+0x13c/0x240 net/ipv6/ip6mr.c:182 (P)
 fib_rules_lookup+0x624/0xc14 net/core/fib_rules.c:337
 ip6mr_fib_lookup+0x11c/0x1c4 net/ipv6/ip6mr.c:154
 mroute6_is_socket+0x128/0x234 net/ipv6/ip6mr.c:1705
 ip6_finish_output2+0xbe0/0x132c net/ipv6/ip6_output.c:85
 __ip6_finish_output net/ipv6/ip6_output.c:-1 [inline]
 ip6_finish_output+0x230/0x618 net/ipv6/ip6_output.c:221
 NF_HOOK_COND include/linux/netfilter.h:314 [inline]
 ip6_output+0x2d0/0x528 net/ipv6/ip6_output.c:248
 dst_output include/net/dst.h:471 [inline]
 NF_HOOK+0x14c/0x464 include/linux/netfilter.h:325
 mld_sendpack+0x72c/0xd34 net/ipv6/mcast.c:1890
 mld_send_cr net/ipv6/mcast.c:2191 [inline]
 mld_ifc_work+0x76c/0x9e4 net/ipv6/mcast.c:2739
 process_one_work kernel/workqueue.c:3495 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3578
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3659
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854
Code: eb15029f 540002a0 9100a288 d343fd09 (38f76929) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	eb15029f 	cmp	x20, x21
   4:	540002a0 	b.eq	0x58  // b.none
   8:	9100a288 	add	x8, x20, #0x28
   c:	d343fd09 	lsr	x9, x8, #3
* 10:	38f76929 	ldrsb	w9, [x9, x23] <-- trapping instruction


Tested on:

commit:         58c1eb84 arm64: sdei: Preserve the interrupted context..
git tree:       https://github.com/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15ce04ad580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a58b6b4d667e7a61
dashboard link: https://syzkaller.appspot.com/bug?extid=2e3bf0bd49acd9b21d4b
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=173b3f7f980000

