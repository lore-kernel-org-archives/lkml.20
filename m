Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B57445D909
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793505; cv=none; b=S/qrz7YM+oN+oYsscOO52KglOJPSPRTBzn8075BMiVLeopbbNQUIw4kr8jY7P4+AiGsdkBoZQqnQ1Dk/uRmcis14pHYQxZenrpG6PWHzdNjDGYtVPil9evixee6WsWGdTxEb5tiCNtwEhQvOfkY9qPiPYibK20kaXLRK7yaey/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793505; c=relaxed/simple;
	bh=ImOOINWaLEXmzPTvNh7r0fSDk27MpWbpTVjiRx/WH3M=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=FM/cwmsQAULFefZC3PdeOMsRdQg45GdwydUp8YUTq8ftVAJRUsV3ZkaqtZqfrK41nlC+RRPaehVwsQx1uRdDtl6C/WQnMRF/2JEKzJHvZDpivuM01h6nEBbCwUvIm0ci1LzfwEwgvIYRJgXMKsIy3k2IlD00Pk3emkzCF2SDSfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-48296f34f1dso2072197fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793503; x=1792398303;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7ieBeUprCeI4lGB/ia0ws73k13xYUaAVtpQqsoHKNsE=;
        b=gvbq8qQvS7MAhFaw4c0lWC4xLXHH9lVFHzJSjw603afdyAMfiIz9EqDDNjlZ437cn3
         c+nr2HTKk00450XBf42FWSl2Rm40SeFKhgNCx1aMBMJkMpiJrrvaNVKss4genhYxqY8/
         5DEo/tLtcq//D2FI5/2DOHeOKr80HdWyWvhwbENqY7Wdx84ydC07OyDc+G6uROIOYcKN
         CV7/WlTGW8JpmM+568ohfWuvYLApzwzK3IXbF7Cq+hF6XMdtpcQ8WgTJhsXitrPeIXDq
         7ckOedgsW6aX3+OnUc/n91M/wq6m58mAsvAdi/uNzog3CdOSJ3exKLEcMVavyLXlcRRE
         8gEA==
X-Forwarded-Encrypted: i=1; AKwUvBzFrOXPDewch2avzp1vBl3raPDpFhnutdTvzgrgD9MczhELlJQE0B/ncUQd9AeMTLWJFChNFSSbsuUF4qA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkWr5OSjTo/GCC84lssZwQcBXW9XbvObJVkZYRFc4iX+rihxl+
	uqIB70WiAdeWGI9BDJH94u+l3t9WJDe2wE6I38i2MIM2fixCuNAlhrMlfBIArMcHK4os7P0/Nom
	lJ7ATY3EMZRNcgi4FgtOzsB7bS8jieutfvNc06fF5inLau06UeUuSGaGbrY4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6713:b0:4f6:1e12:e37d with SMTP id
 5614622812f47-50c5870a541mr8263518b6e.63.1791793503468; Mon, 12 Oct 2026
 01:25:03 -0700 (PDT)
Date: Mon, 12 Oct 2026 01:25:03 -0700
In-Reply-To: <20261012075854.435-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6acc995f.a150a118.27e199.0044.GAE@google.com>
Subject: Re: [syzbot] [nvme?] BUG: corrupted list in nvmet_fc_remove_port
From: syzbot <syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
BUG: corrupted list in nvmet_fc_remove_port

 non-slab/vmalloc memory
list_del corruption. prev->next should be ffff88805f6be020, but was 0000000000000000. (prev=ffffffff9aecd340)
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:64!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 6706 Comm: syz.1.55 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
RIP: 0010:__list_del_entry_valid_or_report+0x15a/0x190 lib/list_debug.c:62
Code: e8 8b f8 37 fd 43 80 3c 2c 00 74 08 4c 89 ff e8 4c bf 58 fd 49 8b 17 48 c7 c7 40 6e cc 8b 48 89 de 4c 89 f9 e8 27 88 4c fc 90 <0f> 0b 4c 89 f7 e8 5c f8 37 fd 43 80 3c 2c 00 74 08 4c 89 ff e8 1d
RSP: 0018:ffffc90005077c38 EFLAGS: 00010246
RAX: 000000000000006d RBX: ffff88805f6be020 RCX: 3022935dcdf04700
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000201 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed101708490b R12: 1ffffffff35d9a68
R13: dffffc0000000000 R14: ffffffff85f7e840 R15: ffffffff9aecd340
FS:  00007f556375d6c0(0000) GS:ffff8881249bb000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fcf66ae41d8 CR3: 0000000035112000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __list_del_entry_valid include/linux/list.h:140 [inline]
 __list_del_entry include/linux/list.h:261 [inline]
 list_del include/linux/list.h:275 [inline]
 nvmet_fc_portentry_unbind drivers/nvme/target/fc.c:1288 [inline]
 nvmet_fc_remove_port+0x1fb/0x380 drivers/nvme/target/fc.c:2934
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
RIP: 0033:0x7f556411e1d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f556375d028 EFLAGS: 00000246 ORIG_RAX: 0000000000000107
RAX: ffffffffffffffda RBX: 00007f55643a6090 RCX: 00007f556411e1d9
RDX: 0000000000000000 RSI: 0000200000000780 RDI: ffffffffffffff9c
RBP: 00007f55641b5888 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f55643a6128 R14: 00007f55643a6090 R15: 00007ffde0760588
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__list_del_entry_valid_or_report+0x15a/0x190 lib/list_debug.c:62
Code: e8 8b f8 37 fd 43 80 3c 2c 00 74 08 4c 89 ff e8 4c bf 58 fd 49 8b 17 48 c7 c7 40 6e cc 8b 48 89 de 4c 89 f9 e8 27 88 4c fc 90 <0f> 0b 4c 89 f7 e8 5c f8 37 fd 43 80 3c 2c 00 74 08 4c 89 ff e8 1d
RSP: 0018:ffffc90005077c38 EFLAGS: 00010246
RAX: 000000000000006d RBX: ffff88805f6be020 RCX: 3022935dcdf04700
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000201 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed101708490b R12: 1ffffffff35d9a68
R13: dffffc0000000000 R14: ffffffff85f7e840 R15: ffffffff9aecd340
FS:  00007f556375d6c0(0000) GS:ffff8881249bb000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fcf66c6f040 CR3: 0000000035112000 CR4: 00000000003526f0


Tested on:

commit:         24a19b95 Linux 7.3-rc7
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17e825d1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=df4bbab1c2172b9f
dashboard link: https://syzkaller.appspot.com/bug?extid=c98b21427617af7f547a
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12c690a5580000

