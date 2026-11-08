Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794150004;
	b=AI7ZYV7uIfcILhnzlEKf6nFZY6kIQz/abrf8YFzkSrmMT69WnTMlWc1m1pGe8KuZwMuU
	 tHAtcnBddEzKqP1IdzX0jX8d5sj1f7GixD1BK9pZSq3hqC4DdSpQVZX60eIt08wiOsNvq
	 f6lZVMyLwjy3OsNeUs2VLIEdy7MA8iIXt8btl12FUWh2/ex02AyFDV0IZKVSzZVrp/q9k
	 nYxOeJqVxDVNmCNCVJ68nWrUTO16n5KuJGI9jKj658l1Wt0GQFF+phbDYWq5Pap26u92A
	 tM1wD6S5KcOzl20tpGvy0ggIg8lQsvC050Fc5IOs2rm+d729qmgMZiuCBtBQPq9TnNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794150004;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=KOtAHeTFQbPEp181u+mI7MnD3IUoEMWDMST/qXmCbrM=;
	b=Q/52wCDJB8haPaHizlPdFsMN6KBv42LS7qkW5AM4GNFnn7vRcQwqSisiTr1QCoh5UzYS
	 4aWRz5EcomvchGgSFNCZOc80tJld510D0ycR04q/dzJXD8jqcDIwWIN8t+/t6NpvAUBt4
	 ueK+cGf9eP7XP8OarACKEVQflxFeO0t8JJK4cLMS23ZeKPh75nIPLUHHs0JCHFjAIMasJ
	 L0115Xjx4t/zxs8JYIpXh0ux+1gYUvVksq/VoyxETxubTTzYDm2QcaGj8axL5zw9kcsDo
	 YalmQUjda1AMVoqVaoEqKqzcUXwnSCyro39KOQew3tvsr5mSksuwg/hy/GFYk6pHZ/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.69
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77F5606A333
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 15:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C77F5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4a72bcd6599so153691fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 07:00:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794150003; x=1794754803;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KOtAHeTFQbPEp181u+mI7MnD3IUoEMWDMST/qXmCbrM=;
        b=Dpaq9zbHc7MIa83a8J5DPigUdsziEZkG8Jld7CAj7rMVTj3YeBgfycRgR6RgDvqN8X
         1lnFg6U6z9sZP0meNsbP76ysN17G8Kl2WOAQ14kuyd5/+ixzAAoib/ENNGRN+9QV2QHL
         XAzovj36/VeLkwfhyYRG48jzr9FGl81g6Z2cVVWry9vw6ULlgFSE3kh5jsSnMmIp1Fgt
         4rYiu9X3sFsw4ol09szWnNluIZ4JUnfLepTlzGy/Zwez8sZqcKGIfnRiOfy54zfaJcg6
         ufSvBEPhohIBBvAbx0kpfj+9wQvKb2R4NW+cIBNSZK+RzFxveTeJ5ST1l40+aGmTF8PP
         Ud9g==
X-Forwarded-Encrypted: i=1; AL+hErFSJmIqKbPiet+gpRIz3TRlC4xMxmV6HRlg8fC9eabfQQV+JjlhpwGxJw/InKm78wI7yf9NjzBPJzwu4nA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GCuGAFUbvEUYlSLMpZvOyp8Pqf/tbXkx5RTeHagtG+4qk0T0w
	Lm29Olh2Ttf5s60iPLrFET8X+zOsI4Vr/fLrLwyZDX/WByjmQID0SZO1KaYHh47d2L85k7H3uO6
	RuFXoseynOvrB6nGFtZ9qaumQyroP/euX71dLsDyLnR1thxUVjcX3qP9jpd4=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c125:b0:4f6:a430:1822 with SMTP id
 5614622812f47-568141ffe0fmr1126838b6e.7.1794150002824; Sun, 08 Nov 2026
 07:00:02 -0800 (PST)
Date: Sun, 08 Nov 2026 07:00:02 -0800
In-Reply-To: <20261108140816.1083-1-drifabdelmalekmohamedsaid@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af08e72.c4c6bce2.24c2d9.0007.GAE@google.com>
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
WARNING: net/sunrpc/svc.c:532 at svc_destroy+0x299/0x330 net/sunrpc/svc.c:532, CPU#0: syz-executor281/6032
Modules linked in:
CPU: 0 UID: 0 PID: 6032 Comm: syz-executor281 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/15/2026
RIP: 0010:svc_destroy+0x29d/0x330 net/sunrpc/svc.c:532
Code: 48 b8 00 00 00 00 00 fc ff df 49 8b 5d 00 48 8d 7b 18 48 89 fa 48 c1 ea 03 80 3c 02 00 75 67 48 8d 3d 07 5e 77 07 48 8b 73 18 <67> 48 0f b9 3a e9 d0 fd ff ff 48 8b 7c 24 08 e8 8f 2c 85 f7 e9 a5
RSP: 0018:ffffc9000259f858 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: ffffffff9040bf80 RCX: 0000000000000000
RDX: 1ffffffff20817f3 RSI: ffffffff8c37ebc0 RDI: ffffffff927b0770
RBP: 0000000000000000 R08: 00000000ffffffff R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: ffff888020340000
R13: ffff888027daec00 R14: ffff88807b8b4000 R15: ffffffff9cd624c0
FS:  0000555576b41400(0000) GS:ffff888122475000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffdf9156de4 CR3: 0000000075178000 CR4: 00000000003526f0
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
RIP: 0033:0x7f754c860f1a
Code: 48 c7 c2 d8 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffdb5c8cd48 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f754c860f1a
RDX: 00007f754c8bf03f RSI: 00007f754c8beffe RDI: 00007f754c8bf044
RBP: 0000000000000004 R08: 00007ffdb5c8cdc0 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f754c8beffe
R13: 0000000000001791 R14: 0000000000000801 R15: 00007ffdb5c8cdc0
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
console output: https://syzkaller.appspot.com/x/log.txt?x=11abca4e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1cf189394a856f11
dashboard link: https://syzkaller.appspot.com/bug?extid=8cbdf9aa6c281a4e6bbe
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15bb67a5580000

