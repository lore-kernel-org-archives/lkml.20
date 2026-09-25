Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5CA4C9DFA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351585; cv=none; b=crraVROEXlXTwxYaTjks8SNIu1Uimn2ClN386Qk1znPr9xWlal8BLl5Kr1+iNppu+F0DCuJQiBVzJeFCj/PPPQ9shCr2zKL/abAI2vYFaraoDUnmrHy5ByVjn0K9yMY5TgC/YP9tu5DHSxdTRst6guTLC+yVxt5opzE4jkYPL7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351585; c=relaxed/simple;
	bh=kWp6u3eDu8CMfV3Gkh2auIB/Pv3KZjoJAEz3jYIh6n4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KtrlAINgAR7lpqkYe7jvPMlC++prBf94c2xbHZv/FtDjw3TGQSsuG6g0gSr9avRpWco/vbnNP0JDUem3byarPKMgd7sMBL65kbDP3j1OYDfuscXAfwATaBayh0He9TJ/mPGkA2sm4H9Vm3zrogNxcz41gi5c0JEtbHslIQ6z7g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4db3db8687fso1690455b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351582; x=1790956382;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XgubwZoDwjfMZxz2biWtWQULahdH1VadZ96shGtXC4g=;
        b=A/VXteEHNBfgxf0AD8bgQOpdjP/RoSsX+Sma5siq3wVIt6V8k7Rk30bafc0mEcGsbz
         sUiybheYrvRZOwYrApMTOuxbrBFPku2+0KsW5gi7QuMUigzcjfxjacqDnFZG4JM/OClc
         JFXMN4A15ctP37YKj9IH4qF7hmHKP1PyyhykiWM2vdB6QuOiSMdt6eUWCqN3aKntK4Yw
         G541SBmr6tX6urnuJQcoX7AXBXhd/J2ocTLGv3OhkO5h6MouopOEtJybs3Qt4ZjpBvoP
         trxz9pWVMZmegXBGLDHuslVXT0nJ67kMVBS/nRrIY0AzVzBWoYmvY95DAiTHJX+ul7Y0
         QJww==
X-Forwarded-Encrypted: i=1; AKwUvBzax+yLv/68vbso3U5n/yeTjduvr98YnK+CUiVni8404Aje3F3NLjxdZOBGNwqWo67KsEHR7vuTO4Z12Gw=@vger.kernel.org
X-Gm-Message-State: AFuF++ngcTXfpzxsgGb9ZL5p9Vwb8c+rG4XfxMcAE1Jedf6zo0LEU5Sm
	T5bpnGW2pZ+22x2IT6GO4ET3YnAXIqIgec044qoknf3nXokKxqGHVWAHUmMpu9XXYuyZFCr605l
	oeY0dpTkkfhkcrlNlfg7kwP/4sWrOd4k6+gntWa5+6Qe3L8pjHahyCrRA3ZU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1984:b0:4d6:90f3:74a3 with SMTP id
 5614622812f47-4d72e664a0bmr8186492b6e.46.1790351582038; Fri, 25 Sep 2026
 08:53:02 -0700 (PDT)
Date: Fri, 25 Sep 2026 08:53:01 -0700
In-Reply-To: <20260926.003610.1086231564499039984.konishi.ryusuke@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab698dd.80e1c6cc.1e8e5f.0039.GAE@google.com>
Subject: Re: [syzbot] [nilfs?] WARNING in nilfs_rename (2)
From: syzbot <syzbot+f6c7e1f1809f235eeb90@syzkaller.appspotmail.com>
To: konishi.ryusuke@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in nilfs_rename

------------[ cut here ]------------
inode->i_nlink == 0
WARNING: fs/inode.c:408 at drop_nlink+0xc5/0x110 fs/inode.c:408, CPU#0: syz.0.17/5904
Modules linked in:
CPU: 0 UID: 0 PID: 5904 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:drop_nlink+0xc5/0x110 fs/inode.c:408
Code: a8 07 00 00 be 08 00 00 00 e8 47 6b e4 ff f0 48 ff 83 a8 07 00 00 5b 41 5c 41 5e 41 5f 5d c3 cc cc cc cc cc e8 3c 13 73 ff 90 <0f> 0b 90 eb 81 44 89 f1 80 e1 07 80 c1 03 38 c1 0f 8c 5b ff ff ff
RSP: 0018:ffffc900051679f0 EFLAGS: 00010293
RAX: ffffffff825406c4 RBX: ffff888042e04d70 RCX: ffff888000ae0000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffffff9055877f R09: 1ffffffff20ab0ef
R10: dffffc0000000000 R11: fffffbfff20ab0f0 R12: 1ffff110085c09b7
R13: ffff888042e05990 R14: ffff888042e04db8 R15: dffffc0000000000
FS:  00007f1c7f8f66c0(0000) GS:ffff88808c5a0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f80b5775a10 CR3: 0000000033897000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 nilfs_rename+0x4b0/0x8a0 fs/nilfs2/namei.c:418
 vfs_rename+0xbd9/0xef0 fs/namei.c:6208
 filename_renameat2+0x533/0x9a0 fs/namei.c:6326
 __do_sys_renameat2 fs/namei.c:6355 [inline]
 __se_sys_renameat2+0x5a/0x2c0 fs/namei.c:6350
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x155/0x510 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1c7e99aeb9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f1c7f8f6028 EFLAGS: 00000246 ORIG_RAX: 000000000000013c
RAX: ffffffffffffffda RBX: 00007f1c7ec16180 RCX: 00007f1c7e99aeb9
RDX: 0000000000000006 RSI: 00002000000000c0 RDI: 0000000000000007
RBP: 00007f1c7ea08c1f R08: 0000000000000000 R09: 0000000000000000
R10: 0000200000000100 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f1c7ec16218 R14: 00007f1c7ec16180 R15: 00007ffc83c7ff08
 </TASK>


Tested on:

commit:         89a31299 Merge tag 'cifs-fixes-7.3-rc2' of https://git..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=16c0fc5e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=db6ce8c8614a5a8f
dashboard link: https://syzkaller.appspot.com/bug?extid=f6c7e1f1809f235eeb90
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=139f7c5e580000

