Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794148744;
	b=UF7KimJe7KlnZ0G2Md9y5WMqlWXGsblao7WVdMsF9NYFFUnS3N7t4MsRJAQGkrULJZ+v
	 oCqQpVprbK8QBz/0tagjWRR5uG0hchv48haV2AfiJN4BNdVm8EzX45XQ7bvEHZ1OFhPGW
	 YTUcsQFtN/g3XRfF5oBPXi5GRr5vZfTjv8yKtDUfVnxYwa8TJqnkOGaagt72IeVurAVHv
	 xZhUxOTkxPcThWyXTsECqD3KMnJRMOZLvPEr2vz2sYfUzw0NV6hzOS3X7PRiT0KeguvLl
	 v2RvRZ9/TjiKjABZRJZthNa68TNSWuC+3+LcChEvjWtwHLrZHqAM7BWUx+9G3BDoLqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794148744;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=8kTPZBveYv3ty0a3n7a+x9XvGo/SsjTPqtkFd0brnpw=;
	b=uIdnIplNMRsEa2nGi5swGIyu3u00ostG+2ixyqLsBw3T3fX0rVhc2VWhaNLjjrdO3K5+
	 n2lS37fBiPBMRBtegVRfz1Szwa8p7csNlAbCt1NezmfQ9sXk0fWqXyTSlRB7+2Vkntf1h
	 IMP/12HwcTcqPsGNXSVxT/HNUpczoljs7vPrh5oP90XLYGRfkmn0MCYLrY5UBDJmZxtoP
	 4LaD0uSWrkjeHGHUfvSNuN9zVmdKqtLV8Ves9q6VjK09dDc+HBhgDsfDgYhn+KFQ3mWST
	 S3ltMbbwdaDTUz2aG/AN25rnAY4fExg7H7nxQxHJfkMnNOZG82uZnOn4QpUXxlHbXuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63AD606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D63AD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-568249fbf5eso83964b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 06:39:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794148743; x=1794753543;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8kTPZBveYv3ty0a3n7a+x9XvGo/SsjTPqtkFd0brnpw=;
        b=J5ncEJLLl9LReyejUM2X1tnQBppLrkvcsgBzsMiP2l/0jJpE6k0mTChu1Bydshdm6X
         e21lBr8IoobBUknI/tMsYivCqAXjb9IQmCqdu3DFG5K7r6ZpW65NWmTfgNf28zxYzizR
         7KQnGXznGf/50zayKKckpbDrK/u68DbikcXZp//x1wB4+yqRHQrgj7xgrpY/3+1DEJqq
         nA4RbfZB9YXnfHqwWS32aAFmbAK3wAWJv+2Al8lKluHltXe7IakBUcbUNAi3sgmDqT3X
         HdIUNUe/TkPfw290kOrrJ9WZHuUuHBJ6RTk4X83ZredkCKHpve5H9YNimvcOPIado1fb
         xh1A==
X-Forwarded-Encrypted: i=1; AL+hErEDGNz1T1wGuauCJJ/4kKqDhkv4AvcKYt2v/ZqaNyzMUs2f2m9PIm8bP5qTLgfBUdtE5YswmoyOBqF9S5E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oHcFkjlLqhY17clLJMRMZgyCSxXm+5jB9kiLa9TWXmC1X7r/o
	x0tlrKbe8o6imsQS0Vlzgo0tHn0ZDh0uEORdmyyZaU86ngQv0qPDvhqENQGE7W0ySLdvgOJgDsw
	RcqDT2dfmB/JpBNWactpGwtqNcRnSUhhhA5gTVvzH3xnaEiTJx49FowL+YsM=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:14d2:b0:4fb:a089:bf26 with SMTP id
 5614622812f47-56814648f23mr924934b6e.56.1794148742741; Sun, 08 Nov 2026
 06:39:02 -0800 (PST)
Date: Sun, 08 Nov 2026 06:39:02 -0800
In-Reply-To: <20261108140754.1057-1-drifabdelmalekmohamedsaid@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af08986.5a668245.1aceb6.000f.GAE@google.com>
Subject: Re: [syzbot] [nfs?] [net?] WARNING in svc_destroy
From: syzbot <syzbot+8cbdf9aa6c281a4e6bbe@syzkaller.appspotmail.com>
To: drifabdelmalekmohamedsaid@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in svc_destroy

NFS: callback service start failed
------------[ cut here ]------------
SVC: permsocks remain for NFSv4 callback
WARNING: net/sunrpc/svc.c:532 at svc_destroy+0x299/0x330 net/sunrpc/svc.c:532, CPU#1: syz-executor246/6020
Modules linked in:
CPU: 1 UID: 0 PID: 6020 Comm: syz-executor246 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
RIP: 0010:svc_destroy+0x29d/0x330 net/sunrpc/svc.c:532
Code: 48 b8 00 00 00 00 00 fc ff df 49 8b 5d 00 48 8d 7b 18 48 89 fa 48 c1 ea 03 80 3c 02 00 75 67 48 8d 3d 07 5e 77 07 48 8b 73 18 <67> 48 0f b9 3a e9 d0 fd ff ff 48 8b 7c 24 08 e8 8f 2c 85 f7 e9 a5
RSP: 0018:ffffc9000327f858 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: ffffffff9040bf80 RCX: 0000000000000000
RDX: 1ffffffff20817f3 RSI: ffffffff8c37ebc0 RDI: ffffffff927b0770
RBP: 0000000000000000 R08: 00000000ffffffff R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: ffff888020732000
R13: ffff88802e69dc00 R14: ffff888038dc4000 R15: ffffffff9cd624c0
FS:  000055556db93400(0000) GS:ffff888122575000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055cc9adb7968 CR3: 000000005b735000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 nfs_callback_up+0x511/0xb50 fs/nfs/callback.c:243
 nfs4_init_callback fs/nfs/nfs4client.c:327 [inline]
 nfs4_init_client_minor_version fs/nfs/nfs4client.c:379 [inline]
 nfs4_init_client+0x236/0x420 fs/nfs/nfs4client.c:429
 nfs_get_client+0xf38/0x1230 fs/nfs/client.c:467
 nfs4_set_client+0x3f6/0x640 fs/nfs/nfs4client.c:763
 nfs4_init_server.isra.0+0x5be/0xf80 fs/nfs/nfs4client.c:1014
 nfs4_create_server+0x185/0x2b0 fs/nfs/nfs4client.c:1063
 nfs4_try_get_tree+0x93/0x140 fs/nfs/nfs4super.c:228
 nfs_get_tree+0xa61/0x1440 fs/nfs/fs_context.c:1621
 vfs_get_tree+0x92/0x320 fs/super.c:1881
 fc_mount fs/namespace.c:1282 [inline]
 do_new_mount_fc fs/namespace.c:3910 [inline]
 do_new_mount fs/namespace.c:3986 [inline]
 path_mount+0x7d0/0x2850 fs/namespace.c:4337
 do_mount fs/namespace.c:4350 [inline]
 __do_sys_mount fs/namespace.c:4565 [inline]
 __se_sys_mount fs/namespace.c:4542 [inline]
 __x64_sys_mount+0x293/0x310 fs/namespace.c:4542
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f89d50d5f1a
Code: 48 c7 c2 d8 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe2b5c7a48 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f89d50d5f1a
RDX: 00007f89d513403f RSI: 00007f89d5133ffe RDI: 00007f89d5134044
RBP: 0000000000000004 R08: 00007ffe2b5c7ac0 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f89d5133ffe
R13: 0000000000001785 R14: 0000000000000801 R15: 00007ffe2b5c7ac0
 </TASK>
----------------
Code disassembly (best guess):
   0:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
   7:	fc ff df
   a:	49 8b 5d 00          	mov    0x0(%r13),%rbx
   e:	48 8d 7b 18          	lea    0x18(%rbx),%rdi
  12:	48 89 fa             	mov    %rdi,%rdx
  15:	48 c1 ea 03          	shr    $0x3,%rdx
  19:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
  1d:	75 67                	jne    0x86
  1f:	48 8d 3d 07 5e 77 07 	lea    0x7775e07(%rip),%rdi        # 0x7775e2d
  26:	48 8b 73 18          	mov    0x18(%rbx),%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	e9 d0 fd ff ff       	jmp    0xfffffe04
  34:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  39:	e8 8f 2c 85 f7       	call   0xf7852ccd
  3e:	e9                   	.byte 0xe9
  3f:	a5                   	movsl  %ds:(%rsi),%es:(%rdi)


Tested on:

commit:         fa4ad798 Merge tag 'for-7.4-rc1-tag' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15b11409580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1cf189394a856f11
dashboard link: https://syzkaller.appspot.com/bug?extid=8cbdf9aa6c281a4e6bbe
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10e11409580000

