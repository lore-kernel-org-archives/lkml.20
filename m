Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2471F1B4F09
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792205404; cv=none; b=nRhLEIFmUlWGwcw1HDQPDYDU5v6FfvKwsgcoBudSi3J3RpPx6J5N0suOFJhBvcrHeGzW6zf7wmGMGxai+ccDji4vR3Sggqc+SWCdEcdL64BZ5/5Pg9ni/5HxRkgtbkD0LfKxuzRx7sjvxkkt/voBvoZ1LVNlT5CqU4gDQl+CzXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792205404; c=relaxed/simple;
	bh=u/nYif1IuKcK1uOFyjxnwlHlRgIBjvHNMbYgG9jlkcw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=qf6HSze2cfkQeMeYd2DvxAWwR3ETYoUOmQ9sNXHz+/kNbed5FxmGBwrkB96+rwOvHgdSpQ9Uoj2NdxfMQZrzOMufHEMopryRHo1BQsIJPUgjfPa/7e6I77EwMLuJ8C9J5M8nOtt7tyCUTdIc6sAmAPIpoTaFuE9fz0uJhc6753Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c307941971so917900b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792205402; x=1792810202;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RdQ+QfGu9wvy//zjV7J19hauM1f7qLqT9ShNy6NyiRc=;
        b=KbHqXlpKSLCJ89gJGnIdFnl989IjqSgoQpkKqjvMu+11E4K8LcuDSfZQVg3ejvW+9t
         0JIJr+a51tW3mAdMnMY16cf83uyv8j9PPE7GJXrQNYcvKJm86V3w1avx480GcuPOazwc
         DVoXMAv0XzWZynHb4V6Nhflzn7Ekm6wetAlwoAmEgQGebm3WtOb4R73fxS1rXSgyUgCU
         hmt/Hvt8YrTHDCfAGyoWfp9sGYpAF6VGZOasI+vzOS/gnIFwqoSED2hthRxa0G+uHzUz
         8f2lwASaYqb0xOUKtjh8ONrN15xwZsYcG7vmAR6sF9HitGzxhUbOMclhHxMu9eRprjQz
         EnWA==
X-Forwarded-Encrypted: i=1; AKwUvBzMB6V4xmXxq20VSw7q4hTUfK736PWpXHDC/jdvwZ9kIZE19cv6s0agnso3j3xxTUfWwWCMiHYJ40iOY20=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdSr2MzWrGZMgvaV9YbdwLLdTxG7yupkZlFljR+GuDU3R1crde
	KH7iL0Yza211zdSncR2KIaD8veZxsCPSTPzelBNUmveyIWzAXouv1QFlh7n84oN+UvYU+PDthcw
	8biHm4OgBUetYU3txQ2hHIgsBL95PN6LhKCSLxbT7GtoNKSyj1Bww1qaAgKQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:660c:b0:4b3:7b31:8df7 with SMTP id
 5614622812f47-53cd1cb069bmr1502056b6e.14.1792205402117; Fri, 16 Oct 2026
 19:50:02 -0700 (PDT)
Date: Fri, 16 Oct 2026 19:50:02 -0700
In-Reply-To: <20261017020912.558-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad2e25a.7952420f.283480.0358.GAE@google.com>
Subject: Re: [syzbot] [nvme?] BUG: corrupted list in nvmet_fc_remove_port
From: syzbot <syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, neganhat@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
BUG: corrupted list in nvmet_fc_remove_port

 non-slab/vmalloc memory
list_del corruption. prev->next should be ffff88802b1c4020, but was 0000000000000000. (prev=ffffffff9aecd380)
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:64!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 1 UID: 0 PID: 6659 Comm: syz.1.38 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
RIP: 0010:__list_del_entry_valid_or_report+0x15a/0x190 lib/list_debug.c:62
Code: e8 fb f0 37 fd 43 80 3c 2c 00 74 08 4c 89 ff e8 bc b7 58 fd 49 8b 17 48 c7 c7 40 6f cc 8b 48 89 de 4c 89 f9 e8 e7 82 4c fc 90 <0f> 0b 4c 89 f7 e8 cc f0 37 fd 43 80 3c 2c 00 74 08 4c 89 ff e8 8d
RSP: 0018:ffffc90004f07c30 EFLAGS: 00010246
RAX: 000000000000006d RBX: ffff88802b1c4020 RCX: 1c46e68f21e3c500
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000201 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed10170a490b R12: 1ffffffff35d9a70
R13: dffffc0000000000 R14: ffffffff85f7f100 R15: ffffffff9aecd380
FS:  00007fccc25bd6c0(0000) GS:ffff888124abb000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fbda5aaf000 CR3: 000000002c6f4000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __list_del_entry_valid include/linux/list.h:140 [inline]
 __list_del_entry include/linux/list.h:261 [inline]
 list_del include/linux/list.h:275 [inline]
 nvmet_fc_portentry_unbind drivers/nvme/target/fc.c:1281 [inline]
 nvmet_fc_remove_port+0x16b/0x320 drivers/nvme/target/fc.c:2928
 nvmet_disable_port+0x13e/0x1f0 drivers/nvme/target/core.c:400
 nvmet_port_subsys_drop_link+0x1e8/0x210 drivers/nvme/target/configfs.c:1123
 configfs_unlink+0x44f/0x6b0 fs/configfs/symlink.c:258
 vfs_unlink+0x27b/0x6e0 fs/namei.c:5648
 filename_unlinkat+0x3d3/0x610 fs/namei.c:5718
 __do_sys_unlinkat fs/namei.c:5747 [inline]
 __se_sys_unlinkat+0x83/0x1a0 fs/namei.c:5739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fccc2f7e1d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fccc25bd028 EFLAGS: 00000246 ORIG_RAX: 0000000000000107
RAX: ffffffffffffffda RBX: 00007fccc3206090 RCX: 00007fccc2f7e1d9
RDX: 0000000000000000 RSI: 0000200000000780 RDI: ffffffffffffff9c
RBP: 00007fccc3015888 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fccc3206128 R14: 00007fccc3206090 R15: 00007ffcdc929c08
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__list_del_entry_valid_or_report+0x15a/0x190 lib/list_debug.c:62
Code: e8 fb f0 37 fd 43 80 3c 2c 00 74 08 4c 89 ff e8 bc b7 58 fd 49 8b 17 48 c7 c7 40 6f cc 8b 48 89 de 4c 89 f9 e8 e7 82 4c fc 90 <0f> 0b 4c 89 f7 e8 cc f0 37 fd 43 80 3c 2c 00 74 08 4c 89 ff e8 8d
RSP: 0018:ffffc90004f07c30 EFLAGS: 00010246
RAX: 000000000000006d RBX: ffff88802b1c4020 RCX: 1c46e68f21e3c500
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000201 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed10170a490b R12: 1ffffffff35d9a70
R13: dffffc0000000000 R14: ffffffff85f7f100 R15: ffffffff9aecd380
FS:  00007fccc25bd6c0(0000) GS:ffff888124abb000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fbda5aaf000 CR3: 000000002c6f4000 CR4: 00000000003526f0


Tested on:

commit:         58161ead Merge tag 'drm-fixes-2026-10-17' of https://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=179ce895580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b38d39c45202f4fa
dashboard link: https://syzkaller.appspot.com/bug?extid=c98b21427617af7f547a
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13ea960d580000

