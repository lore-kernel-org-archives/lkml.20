Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418666;
	b=pPOBKnvvnZqz9Z39AoSByqaqI2SJfNtQDPnfRYLlJpMzQqVG74rq8MqZ26UzcYd27Yru
	 abh9KKUue+j7LoivKkj9ZVpGDVNBkGH5ThcRp0sHBbMoUY+fMknmTv4CuBTOEYxd3u3BS
	 htwrYxDkJgGnOFbTxnuJ8zeQboqLWYYZp0ysG020Fg+Q9C1RumAmJYVcqMzMGaF7P1XRH
	 oCwdM2dCjit4niwmnJZeXqYTuNRB4LZNmOR/yxAQBVJDB1ZDervMf7qnkL9pdJOESii6G
	 gNaCkHybUe3FPLC14PAdKTj1ApWmfGmXwGkyJJm5XU8MAXCPyzDAqJO5zOWsQnDtBlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418666;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=1CMalMQfv1btYwj0czqGElOTxymPjZTc5WmKz4IRhXg=;
	b=DT+x4wlHB30itPG583JOgju48MRSr1T2Cdog8eLLBx2VE3YAawpwyo1a9BZ7fY6bClv6
	 MRT4abzhTSllJYFs6d+FhNAJADe9u7/dNu2ADu7A77lvd2muOAUrZin6/D7xIArx47M4v
	 cChK/Cb/Q563sB3JydAJWav8YCt23Z8sC7/1QfNB6SQB+D7sQ4+kyrwSbeu4mvkV7d95V
	 JNvrtXjD8vE1oJufA/S5NfgxrEBxi67oKZpnrJuTT12hC/EINo37d/VUpaK9NimcuG7sc
	 gBFjHMsPbLExyvEfFtIjVryjm7yc9dDLfFtffmljIp+ybIeD0yvZc9ooU+gGV0xwKRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DBE606A331
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85DBE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-5384e381fbbso2716015b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:37:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418665; x=1795023465;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1CMalMQfv1btYwj0czqGElOTxymPjZTc5WmKz4IRhXg=;
        b=buuU0hT0ozUSBIy90/+QpKOzp+n6+OYGJEiaOIuCFE7LgL9e9PJkNt3gDjHZSXIyuf
         0v6/PcRZTnXTgh8yTuRyEz/7lM6QuweKgy678RqqRbEeMtGhl20VQBo0C1FdrqPZgH/E
         SdJ86zgQGdmqAoiqGCpGc/rqqtUw6j2VtCxTD2u5aMJtR9u8bYqLdbhVRFLpsnIaPqmt
         X0mvXkk94GAX5+9/yXTzqddSFWDoYUNC5o+MagRGhNjAJoEUKxzG3HOSYkrlzouQ483I
         TB8x9nUkSR49tctuLlZEK64nlmUzznmqK+Q1OAn2REJjkIDSh85gqkJu89EzMthW1wtV
         pRNw==
X-Forwarded-Encrypted: i=1; AL+hErG05jNb+GXrTH5cfIBHAzB5ziqoXS0i9eHWa5EdFPaGi+aeP15BxJoUz6ybX4vw6kc8XETZgGTZ5+r0kC4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ORerZ7Wk0PaY9zleNF75PL6sKoK5YTVT4dCKNNxfMY+l8hW3v
	uNVm4qzwiKaQtIZwuzheZwj4YVkLyzNJPM4xtDMHDTXCeDHUZeskfLtrStMBU9O+Xzj8r2qMC0s
	auhghZ+6pbuKn15lKS70GWXqIIyAx1VTWhdY4Rp+lT9vvq9+d1PViUbxleYI=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:bc9:b0:4d6:9293:9bc3 with SMTP id
 5614622812f47-56b98031617mr2466640b6e.61.1794418665547; Wed, 11 Nov 2026
 09:37:45 -0800 (PST)
Date: Wed, 11 Nov 2026 09:37:45 -0800
In-Reply-To: <AoU-V5M5ZCKF37bLl8ILhgeNdsnCEaiaQNuWP4K56kRfJsnhkIexZ8tFRLq7uzGiA0qNqK6shXcSZ5E4hyV0-QI0ZWSuKiJzKvMrv3NfqCg=@proton.me>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af4a7e9.7afbdece.117ea2.000a.GAE@google.com>
Subject: [syzbot ci] Re: tipc: bound reassembly size in tipc_buf_append()
From: syzbot ci <syzbot+ci972ab65a3669be2c@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@kernel.org, jmaloy@redhat.com, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	noahweinberger2003@proton.me, pabeni@redhat.com, tung.quang.nguyen@est.tech
Cc: syzbot@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot ci has tested the following series

[v1] tipc: bound reassembly size in tipc_buf_append()
https://lore.kernel.org/all/AoU-V5M5ZCKF37bLl8ILhgeNdsnCEaiaQNuWP4K56kRfJsnhkIexZ8tFRLq7uzGiA0qNqK6shXcSZ5E4hyV0-QI0ZWSuKiJzKvMrv3NfqCg=@proton.me
* [PATCH] tipc: bound reassembly size in tipc_buf_append()

and found the following issue:
general protection fault in tipc_buf_append

Full report is available here:
https://ci.syzbot.org/series/3856f5b1-55ca-4bc2-885e-034eb8af1bdf

***

general protection fault in tipc_buf_append

tree:      net-next
URL:       https://kernel.googlesource.com/pub/scm/linux/kernel/git/netdev/net-next.git
base:      c4c470912125ec8a1a427a70f4085d8a731b00e4
arch:      amd64
compiler:  Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
config:    https://ci.syzbot.org/builds/28264169-6c3f-405e-9f6a-339572b43e52/config
syz repro: https://ci.syzbot.org/findings/e9e2a2a5-41e6-4866-89fc-45c75bfe992b/syz_repro

Oops: general protection fault, probably for non-canonical address 0xdffffc000000000e: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000070-0x0000000000000077]
CPU: 1 UID: 0 PID: 5915 Comm: syz.1.18 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
RIP: 0010:tipc_buf_append+0x389/0xa20 net/tipc/msg.c:153
Code: e9 b5 01 00 00 e8 97 ea 29 f6 48 8b 44 24 20 42 80 3c 30 00 48 8b 5c 24 28 74 08 48 89 df e8 8e 74 a1 f6 48 c7 03 00 00 00 00 <41> 0f b6 46 0e 84 c0 0f 85 ea 04 00 00 8b 1c 25 70 00 00 00 4d 8d
RSP: 0018:ffffc900039defa0 EFLAGS: 00010246
RAX: 1ffff9200073be13 RBX: ffffc900039df098 RCX: ffff88810d335a00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff88816af130c0
RBP: ffffc900039df078 R08: ffff8881ba5f6ee3 R09: 1ffff110374beddc
R10: dffffc0000000000 R11: ffffed10374beddd R12: 1ffff1102d5e2617
R13: 1ffff9200073bdfc R14: dffffc0000000000 R15: ffff88816af12ff0
FS:  00007fbe193e76c0(0000) GS:ffff8882a7809000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fbe193e6ff8 CR3: 0000000117562000 CR4: 00000000000006f0
Call Trace:
 <TASK>
 tipc_msg_reassemble+0x230/0x3b0 net/tipc/msg.c:807
 tipc_mcast_xmit+0x254/0x19e0 net/tipc/bcast.c:392
 tipc_sendmcast net/tipc/socket.c:887 [inline]
 __tipc_sendmsg+0x2074/0x2b60 net/tipc/socket.c:1470
 tipc_sendmsg+0x55/0x70 net/tipc/socket.c:1404
 sock_sendmsg_nosec+0x14e/0x190 net/socket.c:800
 __sock_sendmsg net/socket.c:818 [inline]
 ____sys_sendmsg+0x54e/0x850 net/socket.c:2715
 ___sys_sendmsg+0x2a5/0x360 net/socket.c:2769
 __sys_sendmmsg+0x273/0x4e0 net/socket.c:2858
 __do_sys_sendmmsg net/socket.c:2885 [inline]
 __se_sys_sendmmsg net/socket.c:2882 [inline]
 __x64_sys_sendmmsg+0xa0/0xc0 net/socket.c:2882
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fbe185a8f19
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fbe193e7028 EFLAGS: 00000246 ORIG_RAX: 0000000000000133
RAX: ffffffffffffffda RBX: 00007fbe18825fa0 RCX: 00007fbe185a8f19
RDX: 0000000000000300 RSI: 0000200000006740 RDI: 0000000000000003
RBP: 00007fbe18637f6d R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fbe18826038 R14: 00007fbe18825fa0 R15: 00007ffeceeefb38
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:tipc_buf_append+0x389/0xa20 net/tipc/msg.c:153
Code: e9 b5 01 00 00 e8 97 ea 29 f6 48 8b 44 24 20 42 80 3c 30 00 48 8b 5c 24 28 74 08 48 89 df e8 8e 74 a1 f6 48 c7 03 00 00 00 00 <41> 0f b6 46 0e 84 c0 0f 85 ea 04 00 00 8b 1c 25 70 00 00 00 4d 8d
RSP: 0018:ffffc900039defa0 EFLAGS: 00010246
RAX: 1ffff9200073be13 RBX: ffffc900039df098 RCX: ffff88810d335a00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff88816af130c0
RBP: ffffc900039df078 R08: ffff8881ba5f6ee3 R09: 1ffff110374beddc
R10: dffffc0000000000 R11: ffffed10374beddd R12: 1ffff1102d5e2617
R13: 1ffff9200073bdfc R14: dffffc0000000000 R15: ffff88816af12ff0
FS:  00007fbe193e76c0(0000) GS:ffff8882a7809000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fbe193e6ff8 CR3: 0000000117562000 CR4: 00000000000006f0
----------------
Code disassembly (best guess):
   0:	e9 b5 01 00 00       	jmp    0x1ba
   5:	e8 97 ea 29 f6       	call   0xf629eaa1
   a:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
   f:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
  14:	48 8b 5c 24 28       	mov    0x28(%rsp),%rbx
  19:	74 08                	je     0x23
  1b:	48 89 df             	mov    %rbx,%rdi
  1e:	e8 8e 74 a1 f6       	call   0xf6a174b1
  23:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
* 2a:	41 0f b6 46 0e       	movzbl 0xe(%r14),%eax <-- trapping instruction
  2f:	84 c0                	test   %al,%al
  31:	0f 85 ea 04 00 00    	jne    0x521
  37:	8b 1c 25 70 00 00 00 	mov    0x70,%ebx
  3e:	4d                   	rex.WRB
  3f:	8d                   	.byte 0x8d


***

If these findings have caused you to resend the series or submit a
separate fix, please add the following tag to your commit message:
  Tested-by: syzbot@syzkaller.appspotmail.com

---
This report is generated by a bot. It may contain errors.
syzbot ci engineers can be reached at syzkaller@googlegroups.com.
