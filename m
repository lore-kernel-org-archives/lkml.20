Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790185;
	b=nKD4YWLeYyY8TZtRTJ74CAs1hEmrqJ2P2GrKYhBCLm6QoTsAaE8PAN080naUI73vhrEy
	 hp86vXZyAStMBfYu7KLoW4uf2HkMMshIVCuqBy+96k8jtEI0hrBAM3lwYxPI178GzD1k8
	 WZkH6Ch9YbeqXEeRjIzkYKX4ivOflygyVHW+e0JMspkbEXZ6aWNuPCKA9C+oGb0+Hs1JY
	 cfe2MfJziGSxw7JQKEkkOS/S1SGcNjrlxXf2mcPLVphrtX3EkzRAGgvxn4f5cb2U/T/1m
	 gl3vVGRIsOXoSDV29H4RqxxBHv0QCvSi/34fC085WBqhNG1zybhSph4JpbuYzNw+cgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790185;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=NnMxguNfYzyO7trMKLr5aKVkBnz9EAjblel5nSJ/fdQ=;
	b=eoGjbzaYTG53TgG2vHAoVBYz2at+Ho5gmI0pR0xgEME0NAilcV2Q28DMdmJde80MJh8d
	 EmqNrKUDmrzQ+R1p6XNYQFxlQ3u6fcMjL5YzN2+LJ/IyFsT4JMwGkMEI8C6iQvYE62xhE
	 90x9pF2xocg7Hg6O2ilBhp3UHfv6L/EQ9Vl9ij8Jjj5lmJbJAjAOYTdilf5+E+Y9TImtf
	 KYIK6cHDtom8njRvqJQcO5cTqZ1GmxCuAoxo8+91HOnlUJnkBSaJIn0WEr/0CYrzOf+0D
	 5S4FuZiaJXp5nMp8XgCTJ7qmBUriLcKkh310v4/Sa+mWbPYIZM1U1+NMeO7vT58W/LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BAF606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5BAF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4cc89e86e4dso822242b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 03:03:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793790183; x=1794394983;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NnMxguNfYzyO7trMKLr5aKVkBnz9EAjblel5nSJ/fdQ=;
        b=xFzEMoXs4UQjR+kfQCSgZxqMSf+6aLydfXesCawwtUMzXB+5F5nXWJ6SAgwoKYZjwW
         1OAVWTsVMqYPCrc0CPBnHi8mvIY5NvxDuQ97qcZ2A6DwBQBPI35svA9CXTYvupMrNzIs
         8vTVzqNH63ZBeg6tyL7BfEhUQCfpChlf1YLhErXlIzi+4ssGrM/BVq9I35Y5WIAJdcjL
         GeRXwGthCGFt/xc9sQRTKCStteetR4t/lwfP6RMN0Ilk8XeD7SHpVqL3nR50bsfaBmal
         QCid/bVGyUSAyMU5sJ5R0lDYlUFXqKaEtjJL47XzvBiJuYt9rHFHnBgPYf4ESqzlhjEJ
         4DBw==
X-Forwarded-Encrypted: i=1; AKwUvBwFhMNaDga8708Elia9KtbTXH/Se0+mCq2ThsRAUK0IxA66dNbjSPebOgL75c0q0BQ3HM5x1Jlq20hAxB4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8J7pI5tvhgcmvQYAsUSOn+NqNOfz4GZZg0WLXpZxdis6Jiv/C7
	NPFQohTD670rLMQc3Jxjq3meGChLN7dw6UDdLrFng+U+4FNmHd19ZeFC794sb1CUtEzAOID/Bas
	m/UiSBsXFouKjucHJDUGECOWBpWq3KVYavEkIxCBkp2GHjBWqXSxyotZul+g=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2218:b0:55c:95a:f10f with SMTP id
 5614622812f47-5640de58220mr11388395b6e.52.1793790183590; Wed, 04 Nov 2026
 03:03:03 -0800 (PST)
Date: Wed, 04 Nov 2026 03:03:03 -0800
In-Reply-To: <20261104104914.357927-1-gowtham398gs@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aeb10e7.7bd3e221.25cd79.0000.GAE@google.com>
Subject: Re: [syzbot] [sctp?] kernel BUG in __pskb_pull_tail (2)
From: syzbot <syzbot+f15a6eff7a53f6eb7dc3@syzkaller.appspotmail.com>
To: gowtham398gs@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
kernel BUG in __pskb_pull_tail

------------[ cut here ]------------
kernel BUG at net/core/skbuff.c:2903!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 1 UID: 0 PID: 6405 Comm: syz.0.18 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:__pskb_pull_tail+0x1335/0x1920 net/core/skbuff.c:2903
Code: 5b f8 48 89 df e8 2b 03 fe ff 31 ff 41 89 c4 89 c6 e8 7f 58 5b f8 45 84 e4 0f 84 1c f2 ff ff e9 84 f2 ff ff e8 5c 5e 5b f8 90 <0f> 0b e8 54 5e 5b f8 48 8b 54 24 30 48 b8 00 00 00 00 00 fc ff df
RSP: 0018:ffffc900006a0870 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 00000000fffffff2 RCX: 0000000000000101
RDX: ffff88802bb18000 RSI: ffffffff89b30684 RDI: 0000000000000005
RBP: ffffc900006a08f0 R08: 0000000000000000 R09: 00000000fffffff2
R10: ffff88802d072f87 R11: 0000000000000000 R12: 00000000000000e4
R13: 0000000000000180 R14: 0000000000000000 R15: ffff8880336af040
FS:  00007f5316b9d6c0(0000) GS:ffff8880d457c000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000020000001a000 CR3: 0000000023deb000 CR4: 0000000000352ef0
Call Trace:
 <IRQ>
 __skb_linearize include/linux/skbuff.h:4025 [inline]
 skb_linearize include/linux/skbuff.h:4037 [inline]
 sctp_rcv+0x143e/0x3cc0 net/sctp/input.c:125
 ip_protocol_deliver_rcu+0x44c/0x4d0 net/ipv4/ip_input.c:207
 ip_local_deliver_finish+0x3fb/0x6e0 net/ipv4/ip_input.c:241
 NF_HOOK include/linux/netfilter.h:325 [inline]
 NF_HOOK include/linux/netfilter.h:319 [inline]
 ip_local_deliver+0x1a3/0x200 net/ipv4/ip_input.c:262
 dst_input include/net/dst.h:481 [inline]
 ip_rcv_finish net/ipv4/ip_input.c:492 [inline]
 NF_HOOK include/linux/netfilter.h:325 [inline]
 NF_HOOK include/linux/netfilter.h:319 [inline]
 ip_rcv+0x33a/0x3c0 net/ipv4/ip_input.c:612
 __netif_receive_skb_one_core+0x197/0x1e0 net/core/dev.c:6433
 __netif_receive_skb+0x1f/0x120 net/core/dev.c:6546
 process_backlog+0x487/0x1600 net/core/dev.c:6897
 __napi_poll.constprop.0+0xaf/0x450 net/core/dev.c:7966
 napi_poll net/core/dev.c:8029 [inline]
 net_rx_action+0xa40/0xf20 net/core/dev.c:8186
 handle_softirqs+0x216/0xa20 kernel/softirq.c:669
 do_softirq kernel/softirq.c:569 [inline]
 do_softirq+0xaf/0xf0 kernel/softirq.c:556
 </IRQ>
 <TASK>
 __local_bh_enable_ip+0xff/0x120 kernel/softirq.c:473
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 rcu_read_unlock_bh include/linux/rcupdate.h:923 [inline]
 __dev_queue_xmit+0xa43/0x48d0 net/core/dev.c:5121
 dev_queue_xmit include/linux/netdevice.h:3483 [inline]
 neigh_hh_output include/net/neighbour.h:538 [inline]
 neigh_output include/net/neighbour.h:552 [inline]
 ip_finish_output2+0xfa4/0x2740 net/ipv4/ip_output.c:236
 __ip_finish_output.part.0+0x43b/0x6f0 net/ipv4/ip_output.c:314
 __ip_finish_output net/ipv4/ip_output.c:302 [inline]
 ip_finish_output net/ipv4/ip_output.c:324 [inline]
 NF_HOOK_COND include/linux/netfilter.h:314 [inline]
 ip_output+0x392/0xc00 net/ipv4/ip_output.c:437
 dst_output include/net/dst.h:471 [inline]
 ip_local_out+0x193/0x1f0 net/ipv4/ip_output.c:131
 __ip_queue_xmit+0x876/0x1f50 net/ipv4/ip_output.c:533
 sctp_v4_xmit+0x91a/0x1070 net/sctp/protocol.c:1061
 sctp_packet_transmit+0x22fe/0x30b0 net/sctp/output.c:659
 sctp_outq_flush_transports net/sctp/outqueue.c:1174 [inline]
 sctp_outq_flush+0xb2b/0x3380 net/sctp/outqueue.c:1222
 sctp_cmd_interpreter net/sctp/sm_sideeffect.c:1826 [inline]
 sctp_side_effects net/sctp/sm_sideeffect.c:1211 [inline]
 sctp_do_sm+0xce1/0x5c30 net/sctp/sm_sideeffect.c:1182
 sctp_assoc_bh_rcv+0x392/0x740 net/sctp/associola.c:1048
 sctp_inq_push+0x25c/0x320 net/sctp/inqueue.c:91
 sctp_backlog_rcv+0x169/0x590 net/sctp/input.c:336
 sk_backlog_rcv include/net/sock.h:1194 [inline]
 __release_sock+0x39d/0x440 net/core/sock.c:3341
 release_sock+0x1e5/0x280 net/core/sock.c:3940
 sctp_sendmsg+0x1166/0x22e0 net/sctp/socket.c:2091
 inet_sendmsg+0x11c/0x140 net/ipv4/af_inet.c:864
 sock_sendmsg_nosec net/socket.c:800 [inline]
 __sock_sendmsg net/socket.c:818 [inline]
 ____sys_sendmsg+0xa23/0xc30 net/socket.c:2715
 ___sys_sendmsg+0x190/0x1e0 net/socket.c:2769
 __sys_sendmmsg+0x20c/0x440 net/socket.c:2858
 __do_sys_sendmmsg net/socket.c:2885 [inline]
 __se_sys_sendmmsg net/socket.c:2882 [inline]
 __x64_sys_sendmmsg+0x9c/0x100 net/socket.c:2882
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5315d9fb19
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f5316b9d028 EFLAGS: 00000246 ORIG_RAX: 0000000000000133
RAX: ffffffffffffffda RBX: 00007f5316025fa0 RCX: 00007f5315d9fb19
RDX: 0000000000000001 RSI: 0000200000000e40 RDI: 0000000000000004
RBP: 00007f5315e37b70 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f5316026038 R14: 00007f5316025fa0 R15: 00007ffcc4fe8548
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__pskb_pull_tail+0x1335/0x1920 net/core/skbuff.c:2903
Code: 5b f8 48 89 df e8 2b 03 fe ff 31 ff 41 89 c4 89 c6 e8 7f 58 5b f8 45 84 e4 0f 84 1c f2 ff ff e9 84 f2 ff ff e8 5c 5e 5b f8 90 <0f> 0b e8 54 5e 5b f8 48 8b 54 24 30 48 b8 00 00 00 00 00 fc ff df
RSP: 0018:ffffc900006a0870 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 00000000fffffff2 RCX: 0000000000000101
RDX: ffff88802bb18000 RSI: ffffffff89b30684 RDI: 0000000000000005
RBP: ffffc900006a08f0 R08: 0000000000000000 R09: 00000000fffffff2
R10: ffff88802d072f87 R11: 0000000000000000 R12: 00000000000000e4
R13: 0000000000000180 R14: 0000000000000000 R15: ffff8880336af040
FS:  00007f5316b9d6c0(0000) GS:ffff8880d457c000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000020000001a000 CR3: 0000000023deb000 CR4: 0000000000352ef0


Tested on:

commit:         05441d69 Merge tag 'cocci-7.4-rc1' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1439892d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1cf189394a856f11
dashboard link: https://syzkaller.appspot.com/bug?extid=f15a6eff7a53f6eb7dc3
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=150258be580000

