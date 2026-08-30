Received: from mail-oi2-f4.google.com (mail-oi2-f4.google.com [74.125.231.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B660339705
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 11:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788090036; cv=none; b=mt9RQzB5jTgE1WHGvicHmhGDNvbyN/6h2WYNJJ5byFsiWd4NzKyxTXzKtt5eFC7PQTRemxDOYWvMQzvmomXikhNt35tnv6DiO/5xhfOrBpC+JplxO/FZudtd7LWd4RAqHkA/sBWR8zIpj5bllc4tnOIy058W/A8MHpj4L2k62W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788090036; c=relaxed/simple;
	bh=8Pff1Wk07M/7bubMolJQjCm0CW3UdfouL21G/Pknu+4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Ra8v18zzIo8zSGlr+FVSah4PEEO4D+5L83lgqrBj2OyuOzK89kUfnn1v0sN8oxsfI6/ujafIJtwRk71G2zoaHbF7ctGv167Jz4i/T9TdBhLonNCjJujel5ckS5SmnRIpiuRtUme59YlSiurQrl1dKIvY7gknzvvPH60EiAh+Ijs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f4.google.com with SMTP id 5614622812f47-4b3880be385so1111418b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788090034; x=1788694834;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e2vCjviBcI/2k6EmDCZf+Wibzyyve/QshLja8u6lGI4=;
        b=NPHt8SR46q2me9uXOMsWPEfJUVUhzAWGPXm0cgOlazS2u5dQ7ixSxePkc9AC59j4mX
         hRVzzVqlUJTrt6gm1PkvweMnIHj25nzcbv7o0dZ3AqZ0P27QyQ/KK64hnv8pbEoOaDL3
         XfiJRXoZtAxqAVAIPsHbzmmSG/ItqOynCBLJBI+OTGp6p+uaiPFR2tK2f8XwHhoLR+x9
         FGGcP62697jzK3D5H8NlyrTuA2VmArVy1bmNx5T8WrhN3nwGW2LNNdrpsxDVRt5mm+jN
         6F56tBTa+X8GXKETYeSmAcnH4tZJnPC+KnWAthOGlAlG7DDyt2cIuWHPWqeVAUgxLKyW
         lM2Q==
X-Forwarded-Encrypted: i=1; AHgh+RrFVgrL/aKsBT6JaMS9wXiV9ZeAP6FFX1LPAB0WYzqm/jetf5x05bJzlEcxXWlTCJi18/1Se9RANcPdXrU=@vger.kernel.org
X-Gm-Message-State: AFuF++kIAN2Ak0IrCAr7DgJ0Od6vz9SRK3isw4fforuSJTQsu+7ZkDUw
	FKNWCaBwYtmC5owmO+Z6nBQFcMRP6pagkkIBFuMH04jlSnV/UEBmf4Khhl9dua/2WYAoat1Dklf
	OJ7wwabu/6TCsLkns5v02YFPzfeygkd/Ufa5GnfH+vQjBST4vhMnWqbUDLaw=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1523:b0:496:892:c58f with SMTP id
 5614622812f47-4b398037ce5mr15499585b6e.2.1788090033902; Sun, 30 Aug 2026
 04:40:33 -0700 (PDT)
Date: Sun, 30 Aug 2026 04:40:33 -0700
In-Reply-To: <6a8725d5.4d75e56a.c9a88.0043.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9416b1.a8e469d2.cbf3.5607.GAE@google.com>
Subject: Re: [syzbot] [media?] KASAN: slab-use-after-free Read in
 __vb2_queue_cancel (2)
From: syzbot <syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, hverkuil@kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, lvc-project@linuxtesting.org, 
	m.szyprowski@samsung.com, mchehab@kernel.org, syzkaller-bugs@googlegroups.com, 
	tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    08dbfad3f504 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=11740349580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=19560cab9a915237
dashboard link: https://syzkaller.appspot.com/bug?extid=dd0f06181ab66b93dc00
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10c45d79580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10eeee25580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5896a88f5701/disk-08dbfad3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/af401a4b0127/vmlinux-08dbfad3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c322757c580c/bzImage-08dbfad3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com

 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 1 UID: 0 PID: 25 Comm: kworker/1:0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
Workqueue: events request_module_async
RIP: 0010:__wake_up_common+0x9b/0x1f0 kernel/sched/wait.c:105
Code: 02 00 0f 85 5b 01 00 00 48 8b 5b 40 48 8d 43 e8 4c 39 fb 0f 84 b3 00 00 00 48 ba 00 00 00 00 00 fc ff df 48 89 d9 48 c1 e9 03 <80> 3c 11 00 0f 85 18 01 00 00 48 bd 00 00 00 00 00 fc ff df 4c 8b
RSP: 0018:ffffc900001f79a0 EFLAGS: 00010056
RAX: ffffffffffffffe8 RBX: 0000000000000000 RCX: 0000000000000000
RDX: dffffc0000000000 RSI: 0000000000000003 RDI: ffff8880298b5790
RBP: ffff8880298b5790 R08: 0000000000000000 R09: fffff5200003ef2b
R10: 0000000000000003 R11: 00000000000075fb R12: 0000000000000003
R13: 0000000000000000 R14: 0000000000000000 R15: ffff8880298b57d0
FS:  0000000000000000(0000) GS:ffff888123c61000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000557902ace698 CR3: 0000000034273000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 __wake_up_common_lock kernel/sched/wait.c:126 [inline]
 __wake_up+0x31/0x60 kernel/sched/wait.c:147
 __vb2_queue_cancel+0x348/0xe90 drivers/media/common/videobuf2/videobuf2-core.c:2244
 vb2_core_queue_release+0x27/0x190 drivers/media/common/videobuf2/videobuf2-core.c:2677
 vb2_queue_release drivers/media/common/videobuf2/videobuf2-v4l2.c:943 [inline]
 vb2_video_unregister_device drivers/media/common/videobuf2/videobuf2-v4l2.c:1279 [inline]
 vb2_video_unregister_device+0x152/0x2e0 drivers/media/common/videobuf2/videobuf2-v4l2.c:1254
 em28xx_v4l2_init.cold+0xe1a/0x3a18 drivers/media/usb/em28xx/em28xx-video.c:3097
 em28xx_init_extension+0x13a/0x200 drivers/media/usb/em28xx/em28xx-core.c:1248
 request_module_async+0x1e/0x30 drivers/media/usb/em28xx/em28xx-cards.c:3685
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3387
 process_scheduled_works kernel/workqueue.c:3470 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3551
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__wake_up_common+0x9b/0x1f0 kernel/sched/wait.c:105
Code: 02 00 0f 85 5b 01 00 00 48 8b 5b 40 48 8d 43 e8 4c 39 fb 0f 84 b3 00 00 00 48 ba 00 00 00 00 00 fc ff df 48 89 d9 48 c1 e9 03 <80> 3c 11 00 0f 85 18 01 00 00 48 bd 00 00 00 00 00 fc ff df 4c 8b
RSP: 0018:ffffc900001f79a0 EFLAGS: 00010056
RAX: ffffffffffffffe8 RBX: 0000000000000000 RCX: 0000000000000000
RDX: dffffc0000000000 RSI: 0000000000000003 RDI: ffff8880298b5790
RBP: ffff8880298b5790 R08: 0000000000000000 R09: fffff5200003ef2b
R10: 0000000000000003 R11: 00000000000075fb R12: 0000000000000003
R13: 0000000000000000 R14: 0000000000000000 R15: ffff8880298b57d0
FS:  0000000000000000(0000) GS:ffff888123c61000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000557902ace698 CR3: 0000000034273000 CR4: 0000000000350ef0
----------------
Code disassembly (best guess):
   0:	02 00                	add    (%rax),%al
   2:	0f 85 5b 01 00 00    	jne    0x163
   8:	48 8b 5b 40          	mov    0x40(%rbx),%rbx
   c:	48 8d 43 e8          	lea    -0x18(%rbx),%rax
  10:	4c 39 fb             	cmp    %r15,%rbx
  13:	0f 84 b3 00 00 00    	je     0xcc
  19:	48 ba 00 00 00 00 00 	movabs $0xdffffc0000000000,%rdx
  20:	fc ff df
  23:	48 89 d9             	mov    %rbx,%rcx
  26:	48 c1 e9 03          	shr    $0x3,%rcx
* 2a:	80 3c 11 00          	cmpb   $0x0,(%rcx,%rdx,1) <-- trapping instruction
  2e:	0f 85 18 01 00 00    	jne    0x14c
  34:	48 bd 00 00 00 00 00 	movabs $0xdffffc0000000000,%rbp
  3b:	fc ff df
  3e:	4c                   	rex.WR
  3f:	8b                   	.byte 0x8b


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
