Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA96CA4E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791784205; cv=none; b=qpyqBXgtfD3MltVpe2anDAH5DLLqLmlq963BlGR8mkxsfyDGX3etPK/UT3+Bzhk4fVCh7eF3FukDr7+BAoG+aoG2Mok6JZR90EASMUybA0ZlAtdlsuZ5wfQuCc0g9yWRZTlp2eSHVBNW2hs9hR9VMaGrjCyp87Eg1/OVkt3BR7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791784205; c=relaxed/simple;
	bh=s+oknHcvljrP36U+54yN/qpp//cigPqxFj/ohJ2uJiA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=OkgbZuxL8+42Jn+bluFRMw5ZP2Qiw69W2q1rOT76KElSATZ28M9AddzKmZeZqsnYLoX/hlzFVeWMJCeCG8X8srp8wHtwEsqQXQduQyoSmtQeL64QfuKmH4z6+43Hl+9+TEcDj0/1SLJGIMvnClaPNpNUkRQf9V6XtILNwzqttFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-81c1dde0219so3565277a34.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791784203; x=1792389003;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d+TozmeYfldkWVDrTiVz5fqLt1+wlVAIJGjeE0YfbA4=;
        b=aUpNlFRrPDcc/ouaoCU2YXKucH2JHMAiCn9jUIW9Nh6hiFkjRzz2LBi4IhkEy02azG
         vy48v9HRmcmxpymA2DsmMHwTE2ga4YxqdfwVi1bSXJkkJyYaY7uEqHlFhkq8ejQx4S3P
         Ur+TbbsByFX783G8ZAbbmwqkAvY+XlcCNHphk6+Qmu1bCnzelDiJJHam+XMLVQoWRhQg
         6evdw7271EqiCFCfv+55s7BoW5kcv/SwEJ6P3ZavbelKc156DhbXgD0dqdFJ7JV4zT4X
         MJ11HV1MMMq6IwGeOviiIIuqKeZ6EO4zKgNn9s6o0m8PUG20MdRC1wURHv8rISNG6cJZ
         UYSw==
X-Forwarded-Encrypted: i=1; AKwUvByEQtVdcj7AYDZOLLEUwVunG1vOKkgV7Rk2uOjvqwKEm3rMSoYjdzigHML3ySXOw6dsKsJkt96MEKT2+L8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFGOjZd5mAy50oSp0QdRPz2LoM/O0cws1AAxllEKGwSjbQ4cuR
	xCq6AxRnrjS23Xa+QYGzMwhN0z5PVKt/T7F2h9fuIg6Emnt0WPzixl7xHz0mSlO8wLkPZevF7gW
	7BAAY5toXvd1AqH6x+BK4xGfY0efaSrwehgqOrzvAPCB3G7KZ3BUAPFRdG8c=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1992:b0:4b2:5529:ed3c with SMTP id
 5614622812f47-50c438a3cf6mr9309098b6e.7.1791784203475; Sun, 11 Oct 2026
 22:50:03 -0700 (PDT)
Date: Sun, 11 Oct 2026 22:50:03 -0700
In-Reply-To: <20261012051140.410-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6acc750b.8cdf6287.1eb53.0110.GAE@google.com>
Subject: Re: [syzbot] [nvme?] BUG: corrupted list in nvmet_fc_remove_port
From: syzbot <syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
BUG: corrupted list in nvmet_fc_remove_port

 non-slab/vmalloc memory
list_del corruption. prev->next should be ffff8880387ec820, but was 0000000000000000. (prev=ffffffff9aecd340)
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:64!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 6847 Comm: syz.0.45 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
RIP: 0010:__list_del_entry_valid_or_report+0x15a/0x190 lib/list_debug.c:62
Code: e8 8b f8 37 fd 43 80 3c 2c 00 74 08 4c 89 ff e8 4c bf 58 fd 49 8b 17 48 c7 c7 40 6e cc 8b 48 89 de 4c 89 f9 e8 27 88 4c fc 90 <0f> 0b 4c 89 f7 e8 5c f8 37 fd 43 80 3c 2c 00 74 08 4c 89 ff e8 1d
RSP: 0018:ffffc90004f8fc30 EFLAGS: 00010246
RAX: 000000000000006d RBX: ffff8880387ec820 RCX: 4b2bacb912474a00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed101708490b R12: 1ffffffff35d9a68
R13: dffffc0000000000 R14: ffffffff85f7e800 R15: ffffffff9aecd340
FS:  00007f415b0fd6c0(0000) GS:ffff8881249bb000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fa587c4b8c0 CR3: 0000000037614000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __list_del_entry_valid include/linux/list.h:140 [inline]
 __list_del_entry include/linux/list.h:261 [inline]
 list_del include/linux/list.h:275 [inline]
 nvmet_fc_remove_port+0xbc/0x340 drivers/nvme/target/fc.c:2924
 nvmet_disable_port+0x13e/0x1f0 drivers/nvme/target/core.c:400
 nvmet_port_subsys_drop_link+0x1e8/0x210 drivers/nvme/target/configfs.c:1123
 configfs_unlink+0x44f/0x6b0 fs/configfs/symlink.c:258
 vfs_unlink+0x27b/0x6e0 fs/namei.c:5678
 filename_unlinkat+0x3d3/0x610 fs/namei.c:5748
 __do_sys_unlinkat fs/namei.c:5777 [inline]
 __se_sys_unlinkat+0x83/0x1a0 fs/namei.c:5769
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f415babe1d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f415b0fd028 EFLAGS: 00000246 ORIG_RAX: 0000000000000107
RAX: ffffffffffffffda RBX: 00007f415bd46090 RCX: 00007f415babe1d9
RDX: 0000000000000000 RSI: 0000200000000780 RDI: ffffffffffffff9c
RBP: 00007f415bb55888 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f415bd46128 R14: 00007f415bd46090 R15: 00007ffda341e7e8
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__list_del_entry_valid_or_report+0x15a/0x190 lib/list_debug.c:62
Code: e8 8b f8 37 fd 43 80 3c 2c 00 74 08 4c 89 ff e8 4c bf 58 fd 49 8b 17 48 c7 c7 40 6e cc 8b 48 89 de 4c 89 f9 e8 27 88 4c fc 90 <0f> 0b 4c 89 f7 e8 5c f8 37 fd 43 80 3c 2c 00 74 08 4c 89 ff e8 1d
RSP: 0018:ffffc90004f8fc30 EFLAGS: 00010246
RAX: 000000000000006d RBX: ffff8880387ec820 RCX: 4b2bacb912474a00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed101708490b R12: 1ffffffff35d9a68
R13: dffffc0000000000 R14: ffffffff85f7e800 R15: ffffffff9aecd340
FS:  00007f415b0fd6c0(0000) GS:ffff8881249bb000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fa587c4b8c0 CR3: 0000000037614000 CR4: 00000000003526f0


Tested on:

commit:         24a19b95 Linux 7.3-rc7
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=160b540d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=df4bbab1c2172b9f
dashboard link: https://syzkaller.appspot.com/bug?extid=c98b21427617af7f547a
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1493540d580000

