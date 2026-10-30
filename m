Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793362476;
	b=YXwHHcLxkItZrnDix3iQMcQm7ANr1YQv3vs1xUP8P1NhBCaF2HjQgEgxwDm+oQVhT08f
	 4oRixv5Kcc1Kasd3A5EKxTPjdQnO6fCUmGrH/nYquITPpxXh9dDeu9yjFbA0bHOC2msOl
	 AW/lbog6qPzqGoUg7x15iqEAonK/Ts8OzAj4g4IRquWA5BBmRXK02lxt0bZ+Qmbrv0s2/
	 QVbIb3kgr0+bMHcrv+414U+xX1gmxmvfnhSgRc1G8QbtHBD4nwahCq9PLDMwRBj8UX4Ir
	 AseeV1RiSPmYYaqnCYgXyxw7tjb8Jb3LUuGvH6ShdP/+2ZcyFT/hHDKcGk7RdDD4uZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793362476;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=fIsZN7+4fkQBsb9F8HsQdpPNVBhUbbSPmwMZcGaHUyM=;
	b=EKP2o8UZ1lQ/qFe526bIyyZkNl9Kb/vS/iTizdtcq5/2HOmeSTE5Q3iGwSYHMP7p8nqF
	 azALB1k/uOMOmTBs00hvf1BSokIW/dDMJjKX9Q494q/LN6T+BDZWukyWkZzkX1OcTflEk
	 ZvCHgGzY8mY7gpDV5+kANkHTxA1mjNjWH5o+LEERfRQs8i5xIs4sHdLKwbSHfRMD4tvXE
	 U+p3fw7JriTtbrc2zGkerhEBemZAvFyG74v7pXLwZqwpewV6J/mKQL3swu4P9sinU+Lit
	 zq8xAdXtXrKCH0HGAlPz/WU9V8pwiZpemLLpr+2H80jz3UrhwlPGsa0dpquwu9enn+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DF0606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46DF0606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b597558c4cso805669b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793362475; x=1793967275;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fIsZN7+4fkQBsb9F8HsQdpPNVBhUbbSPmwMZcGaHUyM=;
        b=fgQ6wbGOuBH14fQ1nyzPG6XP3nTtM7xVwX5nayo271fcUHBu93aW821/12Jk+x57pE
         rdGXWwEel0Z2sRvfAMwnlC6120HWnKoJKdSHX4qhQT/tdfrn0fgdrKq/W1Yq1dXIW549
         eULFhkn+s4FtTHWrcjHRq15E3J+y2ZCFUnKmDlvJlQQaozH9Q0JTKZkLfmybuDdBg7vg
         SWRSope1r+i6/t5i9wa99I4wXasaI2ycNC0SXU7kZOlVkMqEmeA6Pxa67cnAZBlG7kz3
         02cRgPS5I5w5EeFOm3eURXV6k6LNx3t2bylGGSlHfpZ8Jbz4cJXkysHQ+GMQVf5ajbxj
         Kxwg==
X-Forwarded-Encrypted: i=1; AKwUvBzQjq0UBVlT8Ns2EewEliKSPGjBhL7ckmCCVf1wUG0xgR2XpiMC0qlZwYb1ThN5jvHnPmwMKpx2FTuKFVc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKy0pj/oaR+7SXY9xO7QnrMrgTMXGwbQPsuFsc0JAycgsD8nwZc
	TsmRtlDaLy52EfSrYQ91gh6fOisDkG2M+Z7FyecGTunmL4gceSzdFWSSJtQjsmzxDriDN1E7Gcp
	/F5EWj3642Ycad5fuXqSsieWMtEmA8dgLN3I27RRvz4nWX8BYPvVGyr6WGA0=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4704:b0:4f1:6c9c:78d3 with SMTP id
 5614622812f47-5640df39312mr1305526b6e.26.1793362475290; Fri, 30 Oct 2026
 05:14:35 -0700 (PDT)
Date: Fri, 30 Oct 2026 05:14:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae48a2b.6713f5d0.92cad.0001.GAE@google.com>
Subject: [syzbot] [wpan?] general protection fault in ieee802154_llsec_dump_table
 (2)
From: syzbot <syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com>
To: alex.aring@gmail.com, linux-kernel@vger.kernel.org, 
	linux-wpan@vger.kernel.org, miquel.raynal@bootlin.com, netdev@vger.kernel.org, 
	stefan@datenfreihafen.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c339f4010dea Merge tag 'platform-drivers-x86-v7.4-1' of gi..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15a3dd95580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=119e5f4d0a8d39cf
dashboard link: https://syzkaller.appspot.com/bug?extid=9ea34da5ca6100593c90
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=151a448d580000

AI-generated root cause summary:
In net/ieee802154/nl-mac.c, ieee802154_llsec_dump_table() iterates through all
network devices in the namespace and assumes any device with dev->type ==
ARPHRD_IEEE802154 has a non-NULL ml_priv pointing to struct ieee802154_mlme_ops.
However, devices such as TUN can have their link type changed to
ARPHRD_IEEE802154 via the TUNSETLINK ioctl without initializing ml_priv (leaving
it NULL). Consequently, ieee802154_llsec_dump_table() dereferences
data.ops->llsec at offset 0x38 of a NULL pointer when dumping LLSEC tables,
leading to a general protection fault / kernel crash (Denial of Service).

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=9ea34da5ca6100593c90

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000007: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000038-0x000000000000003f]
CPU: 0 UID: 0 PID: 6025 Comm: syz-executor400 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/15/2026
RIP: 0010:ieee802154_llsec_dump_table+0x204/0x5d0 net/ieee802154/nl-mac.c:778
Code: 89 f8 48 c1 e8 03 80 3c 18 00 0f 85 d3 02 00 00 4d 8b be b8 07 00 00 49 8d 7f 38 4c 89 bc 24 98 00 00 00 48 89 f8 48 c1 e8 03 <80> 3c 18 00 0f 85 a5 02 00 00 4d 8b 7f 38 4d 85 ff 0f 84 b2 01 00
RSP: 0018:ffffc900031ef4a0 EFLAGS: 00010202
RAX: 0000000000000007 RBX: dffffc0000000000 RCX: 0000000000000000
RDX: ffff8880314ccb00 RSI: ffffffff8b9ff162 RDI: 0000000000000038
RBP: 0000000000000026 R08: 0000000000000324 R09: 0000000000000324
R10: ffffc900031ef40f R11: ffffc900031ef520 R12: ffff888036830610
R13: 0000000000000000 R14: ffff88805d7a8000 R15: 0000000000000000
FS:  000055558d27f400(0000) GS:ffff88812248e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fff8aa5bff8 CR3: 000000002ce9b000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 genl_dumpit+0x125/0x230 net/netlink/genetlink.c:1026
 netlink_dump+0x53b/0xd00 net/netlink/af_netlink.c:2351
 __netlink_dump_start+0x6d6/0x990 net/netlink/af_netlink.c:2466
 genl_family_rcv_msg_dumpit+0x1e2/0x2e0 net/netlink/genetlink.c:1075
 genl_family_rcv_msg net/netlink/genetlink.c:1191 [inline]
 genl_rcv_msg+0x471/0x800 net/netlink/genetlink.c:1209
 netlink_rcv_skb+0x159/0x420 net/netlink/af_netlink.c:2576
 genl_rcv+0x28/0x40 net/netlink/genetlink.c:1218
 netlink_unicast_kernel net/netlink/af_netlink.c:1335 [inline]
 netlink_unicast+0x668/0x950 net/netlink/af_netlink.c:1361
 netlink_sendmsg+0x9ac/0x10c0 net/netlink/af_netlink.c:1920
 sock_sendmsg_nosec net/socket.c:800 [inline]
 __sock_sendmsg net/socket.c:818 [inline]
 __sys_sendto+0x492/0x4e0 net/socket.c:2283
 __do_sys_sendto net/socket.c:2290 [inline]
 __se_sys_sendto net/socket.c:2286 [inline]
 __x64_sys_sendto+0xe0/0x1c0 net/socket.c:2286
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0fada8d8b7
Code: 48 89 fa 4c 89 df e8 98 1d 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007fff8aa5c1d0 EFLAGS: 00000202 ORIG_RAX: 000000000000002c
RAX: ffffffffffffffda RBX: 000055558d27f400 RCX: 00007f0fada8d8b7
RDX: 0000000000000014 RSI: 00007fff8aa5c220 RDI: 0000000000000004
RBP: 0000000000000003 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00007f0fadac9d23
R13: 00007fff8aa5c390 R14: 000000000000001d R15: 0000000000000002
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:ieee802154_llsec_dump_table+0x204/0x5d0 net/ieee802154/nl-mac.c:778
Code: 89 f8 48 c1 e8 03 80 3c 18 00 0f 85 d3 02 00 00 4d 8b be b8 07 00 00 49 8d 7f 38 4c 89 bc 24 98 00 00 00 48 89 f8 48 c1 e8 03 <80> 3c 18 00 0f 85 a5 02 00 00 4d 8b 7f 38 4d 85 ff 0f 84 b2 01 00
RSP: 0018:ffffc900031ef4a0 EFLAGS: 00010202
RAX: 0000000000000007 RBX: dffffc0000000000 RCX: 0000000000000000
RDX: ffff8880314ccb00 RSI: ffffffff8b9ff162 RDI: 0000000000000038
RBP: 0000000000000026 R08: 0000000000000324 R09: 0000000000000324
R10: ffffc900031ef40f R11: ffffc900031ef520 R12: ffff888036830610
R13: 0000000000000000 R14: ffff88805d7a8000 R15: 0000000000000000
FS:  000055558d27f400(0000) GS:ffff88812258e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffdac0fedc4 CR3: 000000002ce9b000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	89 f8                	mov    %edi,%eax
   2:	48 c1 e8 03          	shr    $0x3,%rax
   6:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
   a:	0f 85 d3 02 00 00    	jne    0x2e3
  10:	4d 8b be b8 07 00 00 	mov    0x7b8(%r14),%r15
  17:	49 8d 7f 38          	lea    0x38(%r15),%rdi
  1b:	4c 89 bc 24 98 00 00 	mov    %r15,0x98(%rsp)
  22:	00
  23:	48 89 f8             	mov    %rdi,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1) <-- trapping instruction
  2e:	0f 85 a5 02 00 00    	jne    0x2d9
  34:	4d 8b 7f 38          	mov    0x38(%r15),%r15
  38:	4d 85 ff             	test   %r15,%r15
  3b:	0f                   	.byte 0xf
  3c:	84                   	.byte 0x84
  3d:	b2 01                	mov    $0x1,%dl


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
