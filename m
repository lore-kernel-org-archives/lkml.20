Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102869;
	b=k26R34gr1GPpAuFmL0Xa/Bm6yzB5CT7+MjoyTvukyYKGezEUvQ9IslUd1bg/e1zcuv0l
	 SaLO7juJLZuS5rfevsX6SLBNyyoAtHXyBpowhvaLTzhUuoDOe/j6C5yY/z2yrWYStfBDC
	 hlOsrm9HbNBodyl+a8mcZQGHC/lHd1OiZYUDFFq1J/hBE1UMnut89u1kcZHomZzoYoISJ
	 uiPsHjKOePx1vo7JfcFwfKYOzu61LY1PxQQvrt6/uYL1HOdjgmeKBZ91/0QjCF1uLhtCb
	 6NT5T7K3IGGRbLJPftyaA5T4w7JKikvQiKQzsBYgcOuKVsTZ9FVSWJxREG+WOxy/Sdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102869;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=DVX5zc2pwJeMtT6YRdNqiBpgCc8zZQSefcqRU+MXHBk=;
	b=mfs6BHv3AlW7j/uyyhsU6uJUI7wmWXHGGUccGDuAQPLEDTAcr8n/CArgGcQZFlaRnlfp
	 kBdj17z2wnvqXTw4TdZeU157LWb1RWAED5FnMEPArFgSYXXQCme4//oJqipclGObBf2ji
	 osWukRQpanC72qsFCOpUBybBRdtQ2fuOKKjgyu90V1DX1gy7lEmo+Dn6rOW25Dh/ISHii
	 TXVPLf/DV/6Ugc0tXDQyqnsA5IXcemupZGeEx6DqHGM8ixNuPGasybUJ0IzDHv/FHdeSw
	 v6dYqVJIIBga0Mq3PPX2RpNAVW+Cfzu/yonrCMaAgoOGd6xKGdGBvPNaSdYb5en7MXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.161.69
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B40606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1B40606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-704aee0b7b2so4175142eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102867; x=1793707667;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVX5zc2pwJeMtT6YRdNqiBpgCc8zZQSefcqRU+MXHBk=;
        b=tw7IFAgYgEn1sNmKjnRevTlX0vP34koXCUkCpaLLXDtgmEVzO4mNUleC1/UQeQJEe9
         pYwSJFXZF5DO1P5Qn4Rpwj54BGjMunkOxizEvV76nQEmXwAhw1BfS73enHzlPoUWuZIR
         5w6VtYCBuV9/B8M7gjhgnZa84SIxnp/OB4RUywm0+6uoqlr+b3/LdQ/XeIxBffzyuCqX
         XpfQbKa+ZVuk2Zy54YKvktb1EC5kddNA/M8KkgNM/1dW4bpfA/bdPwPmvUzuF3wLzJcP
         pDOMiHGPXXv7LC0RMudEhBCgaK1ZuUdXDHblpLBUHLr7X+h47us74YsizxFiJmecDlLJ
         S8QA==
X-Forwarded-Encrypted: i=1; AKwUvBwX01VS4DeYgaIAOE0hjHB1SMBk68WG//uLK9U1twjI7BShLpDOa+hcrLu6dO93d0F8nFQm+geH9/0tRzM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQ6weTW7mxUZEtICbQnb64TKM2JK48FYyHCfJvRlTvM+QfhIH8
	2T+l1RiVF7JyxVPuARQmyhF8JTXIEsEozs29+QQyKJzmggMSVPFp9Fg4k7M/hG3WuPimRnzSbRt
	YGi4MyIbfI8LjYFSHBrYyAyCeccva0e/rlBoNBdu6YB1UnAiyUodURn/Ch3I=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6820:570d:10b0:6b9:6c3c:9492 with SMTP id
 006d021491bc7-70ba0f58971mr3367119eaf.64.1793102867654; Tue, 27 Oct 2026
 05:07:47 -0700 (PDT)
Date: Tue, 27 Oct 2026 05:07:47 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae09413.985912ea.1e5798.00c1.GAE@google.com>
Subject: [syzbot] [tipc?] general protection fault in tipc_named_node_up
From: syzbot <syzbot+64197f7577a09686ffdb@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@kernel.org, horms@kernel.org, 
	jmaloy@redhat.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com, 
	tipc-discussion@lists.sourceforge.net, tung.quang.nguyen@est.tech
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    20a33c6b6cbe Add linux-next specific files for 20261023
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1000e5e0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b72dfd5e7ab2b781
dashboard link: https://syzkaller.appspot.com/bug?extid=64197f7577a09686ffdb
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15c25b0d580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13c25b0d580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/cfbd1ccc6546/disk-20a33c6b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c36184d6a775/vmlinux-20a33c6b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/48b7e871397c/bzImage-20a33c6b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+64197f7577a09686ffdb@syzkaller.appspotmail.com

tipc: Enabling of bearer <eth:syz_tun> rejected, already enabled
Oops: general protection fault, probably for non-canonical address 0xdffffc000000001b: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x00000000000000d8-0x00000000000000df]
CPU: 1 UID: 0 PID: 6165 Comm: syz.4.85 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
RIP: 0010:buf_msg net/tipc/msg.h:202 [inline]
RIP: 0010:named_distribute net/tipc/name_distr.c:195 [inline]
RIP: 0010:tipc_named_node_up+0x8e0/0xb00 net/tipc/name_distr.c:221
Code: 41 2b f6 48 8d b4 24 80 00 00 00 48 8b 84 24 88 00 00 00 31 db 48 39 f0 48 0f 45 d8 48 81 c3 d8 00 00 00 48 89 d8 48 c1 e8 03 <42> 80 3c 28 00 74 10 48 89 df e8 21 12 a2 f6 48 8d b4 24 80 00 00
RSP: 0018:ffffc9000407f2e0 EFLAGS: 00010206
RAX: 000000000000001b RBX: 00000000000000d8 RCX: ffff88802a719f40
RDX: 0000000000000000 RSI: ffffc9000407f360 RDI: 0000000000000001
RBP: ffffc9000407f430 R08: ffff8880352dc007 R09: 1ffff11006a5b800
R10: dffffc0000000000 R11: ffffed1006a5b801 R12: ffff88805d6e4000
R13: dffffc0000000000 R14: 0000000000000456 R15: ffff88805d6e6020
FS:  0000555560621500(0000) GS:ffff888123511000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fffd16d5c70 CR3: 0000000077bdc000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 tipc_node_write_unlock+0x2ce/0x4f0 net/tipc/node.c:428
 tipc_rcv+0xb55/0x1020 net/tipc/node.c:2196
 tipc_l2_rcv_msg+0x2d9/0x470 net/tipc/bearer.c:671
 __netif_receive_skb_one_core net/core/dev.c:6405 [inline]
 __netif_receive_skb net/core/dev.c:6518 [inline]
 netif_receive_skb_internal net/core/dev.c:6604 [inline]
 netif_receive_skb+0x4af/0xbf0 net/core/dev.c:6663
 tun_rx_batched+0x1de/0x790 drivers/net/tun.c:1575
 tun_get_user+0x2b78/0x4470 drivers/net/tun.c:2053
 tun_chr_write_iter+0x113/0x200 drivers/net/tun.c:2100
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x612/0xba0 fs/read_write.c:687
 ksys_write+0x150/0x270 fs/read_write.c:1036
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f737d15fd8e
Code: 08 0f 85 a5 a8 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 80 00 00 00 00 48 83 ec 08
RSP: 002b:00007fff46919968 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000555560621500 RCX: 00007f737d15fd8e
RDX: 0000000000000046 RSI: 0000200000000140 RDI: 00000000000000c8
RBP: 00007f737d236b20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f737d425fac R14: 00007f737d425fa0 R15: 00007f737d425fa0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:buf_msg net/tipc/msg.h:202 [inline]
RIP: 0010:named_distribute net/tipc/name_distr.c:195 [inline]
RIP: 0010:tipc_named_node_up+0x8e0/0xb00 net/tipc/name_distr.c:221
Code: 41 2b f6 48 8d b4 24 80 00 00 00 48 8b 84 24 88 00 00 00 31 db 48 39 f0 48 0f 45 d8 48 81 c3 d8 00 00 00 48 89 d8 48 c1 e8 03 <42> 80 3c 28 00 74 10 48 89 df e8 21 12 a2 f6 48 8d b4 24 80 00 00
RSP: 0018:ffffc9000407f2e0 EFLAGS: 00010206
RAX: 000000000000001b RBX: 00000000000000d8 RCX: ffff88802a719f40
RDX: 0000000000000000 RSI: ffffc9000407f360 RDI: 0000000000000001
RBP: ffffc9000407f430 R08: ffff8880352dc007 R09: 1ffff11006a5b800
R10: dffffc0000000000 R11: ffffed1006a5b801 R12: ffff88805d6e4000
R13: dffffc0000000000 R14: 0000000000000456 R15: ffff88805d6e6020
FS:  0000555560621500(0000) GS:ffff888123511000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fffd16d5c70 CR3: 0000000077bdc000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	41 2b f6             	sub    %r14d,%esi
   3:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   a:	00
   b:	48 8b 84 24 88 00 00 	mov    0x88(%rsp),%rax
  12:	00
  13:	31 db                	xor    %ebx,%ebx
  15:	48 39 f0             	cmp    %rsi,%rax
  18:	48 0f 45 d8          	cmovne %rax,%rbx
  1c:	48 81 c3 d8 00 00 00 	add    $0xd8,%rbx
  23:	48 89 d8             	mov    %rbx,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1) <-- trapping instruction
  2f:	74 10                	je     0x41
  31:	48 89 df             	mov    %rbx,%rdi
  34:	e8 21 12 a2 f6       	call   0xf6a2125a
  39:	48                   	rex.W
  3a:	8d                   	.byte 0x8d
  3b:	b4 24                	mov    $0x24,%ah
  3d:	80 00 00             	addb   $0x0,(%rax)


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
