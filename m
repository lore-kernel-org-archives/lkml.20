Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A451C377AB1
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810665; cv=none; b=dP/KsllUiC5wzNLDO+dCG6Z43gmlzsXRJFj6M2to481V8PZ2OfokvzRqayHh189Q42o9tgA24cqkOBbv5u2Z6cWVNL0GBduprBD2mGWqpbiaI1lS1vLz02VeMH3qLjC8T+I9DBCeRUc8xPDl7UnPfXqcVvDWUEuM3gHflh2G01k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810665; c=relaxed/simple;
	bh=8N0h8NHIy9ex+81WQvhVD7gxuaoQhGI7HLQa8M+5wSY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BofSIYSac7ef78YWpTvbG1VOEwPUv9OS/Fl8ktW3jMRcyzy9sm/Lxu4mOnmwiHCPteYtdAeTsjoAJafT6rI5o2XAALvEh3HcvN30VTz8cMCntNjZT0TqAU8A9Uul4WLRmhCPEw4y7MJ9Lq8rT7DOSq4nlefujQWAOFrJ8rkX3UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4d2f0f77124so2604769b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810662; x=1792415462;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Vh9H+kbybr7CPInyXIXpzuYQjvuMFEq9QfyGFS6VpGI=;
        b=nf76dRfIJObAugZnU36XT1vEmNtp4bItQJeKZrC8ZM6A1RFqmDPr7cieIiR7UODVK/
         9G3aqWqMakJ1Hk94DltJSgUH4OLqdDhUzKf6apBj5ffxiNQMXp5YEsXTHPvhp9kFQF7S
         l0v7nHlwvDR7inwYjuPAgQ3ssnFN1R+lTGI456pw21JHru2PIGJCCtL3sdIBwc4eH0UX
         Baqvt3UMxXAuHcHJXV29GqyqVU6u5v42ay6qWb07XfrugB6wAVJChY9ubdoHVcQqdrUh
         hkjuCpRqBJhDBURMrYyzefl2tXw0DjnPTxo4uUOpnMmQCbdRQGNoJNZod4Df8nLoDlxf
         UUHg==
X-Forwarded-Encrypted: i=1; AKwUvBxNdsFRZ5//tqINvoX2V/J0HZ1UKt3uzZcDzpjLpt4BFiuw5zm3P80X6ZpIYgkH5FPMY00uJd3eNWdaKLs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL86Lk4OFjcHJ1VJzE6umFHE4paxEbZ9kDycT9RXM32qCG1ofYK
	HcTI3flG4oqrj13KayRhL/s7NisH3Ig4QAYCh8lNCCl4IEb8rXyv8k7MTt5wtxyahIUmT/mjOvB
	AIMnWEQe/1E4Gr+PM/sJU0zfmvlN21tQ9r6NE7e/NMc6iiFGxxcO7jc4dJi8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1304:b0:4fb:ac9b:b06a with SMTP id
 5614622812f47-50c54170d05mr7623857b6e.48.1791810662600; Mon, 12 Oct 2026
 06:11:02 -0700 (PDT)
Date: Mon, 12 Oct 2026 06:11:02 -0700
In-Reply-To: <20261012124158.498-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6accdc66.0e5b5d80.2c029c.0578.GAE@google.com>
Subject: Re: [syzbot] [nvme?] BUG: corrupted list in nvmet_fc_remove_port
From: syzbot <syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
BUG: corrupted list in nvmet_fc_remove_port

 non-slab/vmalloc memory
list_del corruption. prev->next should be ffff888042a5f220, but was 0000000000000000. (prev=ffffffff9aecd340)
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:64!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 6805 Comm: syz.2.84 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
RIP: 0010:__list_del_entry_valid_or_report+0x15a/0x190 lib/list_debug.c:62
Code: e8 8b f8 37 fd 43 80 3c 2c 00 74 08 4c 89 ff e8 4c bf 58 fd 49 8b 17 48 c7 c7 40 6e cc 8b 48 89 de 4c 89 f9 e8 27 88 4c fc 90 <0f> 0b 4c 89 f7 e8 5c f8 37 fd 43 80 3c 2c 00 74 08 4c 89 ff e8 1d
RSP: 0000:ffffc90005157c30 EFLAGS: 00010246
RAX: 000000000000006d RBX: ffff888042a5f220 RCX: 112f50d9f18e7400
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000201 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed101708490b R12: 1ffffffff35d9a68
R13: dffffc0000000000 R14: ffffffff85f7e820 R15: ffffffff9aecd340
FS:  00007f076720d6c0(0000) GS:ffff8881249bb000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000564cae572950 CR3: 00000000361dc000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __list_del_entry_valid include/linux/list.h:140 [inline]
 __list_del_entry include/linux/list.h:261 [inline]
 list_del include/linux/list.h:275 [inline]
 nvmet_fc_portentry_unbind drivers/nvme/target/fc.c:1281 [inline]
 nvmet_fc_remove_port+0x179/0x340 drivers/nvme/target/fc.c:2931
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
RIP: 0033:0x7f0767bce1d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f076720d028 EFLAGS: 00000246 ORIG_RAX: 0000000000000107
RAX: ffffffffffffffda RBX: 00007f0767e56090 RCX: 00007f0767bce1d9
RDX: 0000000000000000 RSI: 0000200000000780 RDI: ffffffffffffff9c
RBP: 00007f0767c65888 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f0767e56128 R14: 00007f0767e56090 R15: 00007ffc73e653d8
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__list_del_entry_valid_or_report+0x15a/0x190 lib/list_debug.c:62
Code: e8 8b f8 37 fd 43 80 3c 2c 00 74 08 4c 89 ff e8 4c bf 58 fd 49 8b 17 48 c7 c7 40 6e cc 8b 48 89 de 4c 89 f9 e8 27 88 4c fc 90 <0f> 0b 4c 89 f7 e8 5c f8 37 fd 43 80 3c 2c 00 74 08 4c 89 ff e8 1d
RSP: 0000:ffffc90005157c30 EFLAGS: 00010246
RAX: 000000000000006d RBX: ffff888042a5f220 RCX: 112f50d9f18e7400
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000201 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed101708490b R12: 1ffffffff35d9a68
R13: dffffc0000000000 R14: ffffffff85f7e820 R15: ffffffff9aecd340
FS:  00007f076720d6c0(0000) GS:ffff8881249bb000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000564cae572950 CR3: 00000000361dc000 CR4: 00000000003526f0


Tested on:

commit:         24a19b95 Linux 7.3-rc7
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=131aa9c9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=df4bbab1c2172b9f
dashboard link: https://syzkaller.appspot.com/bug?extid=c98b21427617af7f547a
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10728f15580000

