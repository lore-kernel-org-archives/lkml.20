Received: from mail-oo1-f80.google.com (mail-oo1-f80.google.com [209.85.161.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2BE3C109C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632989; cv=none; b=aikTcMp2strVwfWtLhD6yCmw3koBc+HwUtmsydxBAwVru9zYSaTLg7CizkFUEHSeydDvzQ1qpN0Pdx3F6nduvWjI5MoMJpKg3kjqb3NTYgaZbUFgr8xB20Arxstp+FERfRLoNbu3sJRavCjMLfl6iVHFPvUHcU8KEqjHmXGVw7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632989; c=relaxed/simple;
	bh=4KRL2qc0w59AU+HOu4vPCuUcUVvwOd96+NDA2zGB1bc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WgqROaDTMxIOKo7k3m43J/ULZkrjfx5N9VDeN6kgtDrWt2r96dDkqneo8IlUF04eI1sMUadn4WGjflNubHh0E00/m0T6Z/dlrwE7HMLUR6GEdUwqQt1Ebc/xZXB6/d+z5mPBUSaIlbGEbpciFDraKKJI+UsDYD4TxGepddCDf6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f80.google.com with SMTP id 006d021491bc7-6c2d5235ac3so612298eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632985; x=1790237785;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wSAY2aklFodNsFGu4dsV57NG7NuAkAQ4W9NTcOSTLCU=;
        b=vei54k9rHAYnRglmYQGE83IGB1LPqR5jSMoKqOmACjvmHnZiVoroH26q80/LKTm9cV
         aDYqEbnBmsyDaqNAFpXJNc8bxTOqSJdtcygwlXB/qiGptDE32TOrvbDwpO9TMoUL5oeM
         EF2XRA/yFHbpzECM20YKNHJ41w6nZmB+Q/y/3qTrJO3l5r3Aex+wSXRbcdfMTxHMguem
         jisfXu0vEs2oQfI4UGo3IRrZcjOWSDJqjFZpHqvBNMIyfV3yrTyE53U1GjsDvzoQRvxc
         8xKy+DdvgakzzNnLSvh7giuvf4W0B5EJ95N5RjsxUg+wouiLHO34mfoNoYRnwaBTPzk4
         2Yeg==
X-Forwarded-Encrypted: i=1; AKwUvBxaZXNSTxXt7hizDfTRWCHnte5Kw50/BfMimLOJ1LX0bwYwjBKINFkq0eDypx2dL9Pt4KY4YaGXMNaYAQM=@vger.kernel.org
X-Gm-Message-State: AFuF++ku3hqJup51vKUBQe8V75YMD05jek76uD+e6znuuqPb/5opBwDI
	9GgPUslqbSt+N6YFkdgacuumGDfTcfJJMz8F6QNJqcuhCAJZONO0TsRM/OVEPKTJF4DDdmnYUOn
	PinhmYUskRBmqP8f+76LJyFIfjyF19DASAy9UnA51ub7GT92jpRLrg9u5SmU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f48:b0:6b5:ec2f:3571 with SMTP id
 006d021491bc7-6c8feeece48mr1854166eaf.34.1789632985100; Thu, 17 Sep 2026
 01:16:25 -0700 (PDT)
Date: Thu, 17 Sep 2026 01:16:25 -0700
In-Reply-To: <6aa5e2ac.6e6c5f9e.28f11f.0052.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aaba1d9.71f81b7d.278072.001a.GAE@google.com>
Subject: Re: [syzbot] [net?] WARNING in tcf_ct_flow_table_process_conn
From: syzbot <syzbot+6cc37aba98dac721c415@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	jhs@mojatatu.com, jiri@resnulli.us, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	ngocthang2710.1999@gmail.com, pabeni@redhat.com, paulb@mellanox.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    238650ef6c7c Merge tag 'powerpc-7.3-4' of git://git.kernel..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=15663bf9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=6cc37aba98dac721c415
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=160653f9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14cbebf9580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/78c78695c277/disk-238650ef.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ed193a418b0f/vmlinux-238650ef.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f7a21c8aa010/bzImage-238650ef.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6cc37aba98dac721c415@syzkaller.appspotmail.com

RDX: 000000000000001c RSI: 0000200000000500 RDI: 0000000000000003
RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000200000000500
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
------------[ cut here ]------------
1
WARNING: net/sched/act_ct.c:437 at tcf_ct_flow_table_add net/sched/act_ct.c:437 [inline], CPU#0: syz-executor278/6366
WARNING: net/sched/act_ct.c:437 at tcf_ct_flow_table_process_conn+0x449/0x7c0 net/sched/act_ct.c:513, CPU#0: syz-executor278/6366
Modules linked in:
CPU: 0 UID: 0 PID: 6366 Comm: syz-executor278 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:tcf_ct_flow_table_add net/sched/act_ct.c:437 [inline]
RIP: 0010:tcf_ct_flow_table_process_conn+0x449/0x7c0 net/sched/act_ct.c:513
Code: 85 81 02 00 00 41 0f b7 2f 31 ff 89 ee e8 2f 67 e9 f7 85 ed 0f 84 7c 01 00 00 e8 e2 62 e9 f7 e9 e0 01 00 00 e8 d8 62 e9 f7 90 <0f> 0b 90 e9 b2 01 00 00 e8 ca 62 e9 f7 4d 89 f7 40 84 ed 74 27 e8
RSP: 0018:ffffc900042d6ef8 EFLAGS: 00010293
RAX: ffffffff89de6f88 RBX: ffff888070202000 RCX: ffff888028c90000
RDX: 0000000000000000 RSI: ffffffff8c6da060 RDI: ffffffff8c6da020
RBP: 0000000000000000 R08: 00000000ffffffff R09: 1ffffffff1dd5cfe
R10: dffffc0000000000 R11: fffffbfff1dd5cff R12: dffffc0000000000
R13: 1ffff1100e04041e R14: ffff8880702020c0 R15: 0000000000000001
FS:  000055556fc09400(0000) GS:ffff888124cd1000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffe25dff4c8 CR3: 0000000079ba6000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 tcf_ct_act+0x2a75/0x4050 net/sched/act_ct.c:1123
 tc_act include/net/tc_wrapper.h:131 [inline]
 tcf_action_exec+0x185/0x8d0 net/sched/act_api.c:1162
 tcf_exts_exec include/net/pkt_cls.h:361 [inline]
 basic_classify+0x1b2/0x2d0 net/sched/cls_basic.c:54
 tc_classify include/net/tc_wrapper.h:198 [inline]
 __tcf_classify net/sched/cls_api.c:1779 [inline]
 tcf_classify+0x43d/0x1160 net/sched/cls_api.c:1875
 tc_run+0x42d/0x750 net/core/dev.c:4463
 sch_handle_ingress net/core/dev.c:4538 [inline]
 __netif_receive_skb_core+0x1443/0x30c0 net/core/dev.c:6115
 __netif_receive_skb_one_core net/core/dev.c:6262 [inline]
 __netif_receive_skb net/core/dev.c:6377 [inline]
 netif_receive_skb_internal net/core/dev.c:6463 [inline]
 netif_receive_skb+0x1fe/0xbf0 net/core/dev.c:6522
 tun_rx_batched+0x1de/0x790 drivers/net/tun.c:1571
 tun_get_user+0x2be0/0x44d0 drivers/net/tun.c:2045
 tun_chr_write_iter+0x113/0x200 drivers/net/tun.c:2091
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x612/0xba0 fs/read_write.c:687
 ksys_write+0x150/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f6c0bc30879
Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffff5b95668 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007ffff5b95690 RCX: 00007f6c0bc30879
RDX: 000000000000001c RSI: 0000200000000500 RDI: 0000000000000003
RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000200000000500
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
