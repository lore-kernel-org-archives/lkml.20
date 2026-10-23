Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758957;
	b=Sx8Pry3irXsBjWrhoifbwiRtt4x95yFpVMyfIFsOG0jVOIJa0aguj7uBmi2wybghcClD
	 t0HR/VotB9SSxiwGT3qIzu++LxeckJQUerDOTyf50oyuwazgcgd6ZpTg5tIvK5B4nn+uL
	 jpW031nvKVYAaXMvwGX0rEGh9xvs3MzGkPtRvtujsS56HSzw7G+cuVNNKkwe4I64kOa1M
	 sVoYZLF2VebZ/BaDL/sYEB1bZM+i3GSTbp4NEXRJPhhrN1m87QaVhdDYBhnZ82QeoKUmZ
	 IAmJfUQLlOS7brq2/GKLcnQZA/EOD+huvJ6CuDoUf47P4rnPBUGQIqz7Xv6QtwxOcTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758957;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=RgmnbZuXKYWtnIJRvSR+ux3Op+h0Pygq2TggjNldeso=;
	b=LBWn/to8f7bGTqhs56CtFt/jKRHIXg/9BJmigft+uR9b5XxwOkhvleM8cvrwq+lX/e9z
	 P9h989KEbW9PCaxiyTKpx91faEk3lvzRXWb/DxW7IpY7awzkEWT11Ocwq7go3LuvpuqfY
	 2GVDqqbjWzGu0y36BV3DQTLyK239FXuUSZbLsgEH41CZsI2kN77ltQXj37REykS50gFR3
	 s5AeH6lOBzkDMBovyaGf307xGWzkjOieIKOEe2jrzc/8wkwDhPpKFVuYnWSqsctzfNjYV
	 JJLFGiu4ZS9lExyCcMjziRvve+YvMF6S6QyQLj9DO4GQtGSeWz31WZeSHZfYcWYXFFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A62606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20A62606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-823d73ffca1so1081800a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758956; x=1793363756;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RgmnbZuXKYWtnIJRvSR+ux3Op+h0Pygq2TggjNldeso=;
        b=doMNrrXJ96hz+iFmJCMZ+Nf6hbNbTgKatIIe0opy8P24DGDDnPf5L5hzj79ez+7nJI
         HCo3zwif5AQWPYrtEF8fhWL5KwjSr3Y+XLRIPHX6LR+mGi4PJREZhaSJW/aEtu2OVDk5
         SIlKtRTk1JvtYiegillmvnJlcZsUkOAHmBs195U6I/DLvMVxH3nhV9huzGO33tnUUTS+
         TNfyuo1oQov77ypefkWUolx9Hu6XR8OuTjasg5s+2t22UiJSmeIW7QbwLL755/wNXSdi
         O1em4jrQUkliTGHB/vJQLmudoW0j0s4Him7ZpTKHMr08NruAfOwB2kt3D9YKyEJP4t3H
         m+Pw==
X-Forwarded-Encrypted: i=1; AKwUvBwyoWhsVib4uuM5a3AdpVywDSR/ERLuUUqbEzlm0w4JY3riJJv/GfEUguMVt4pG8xvwRyIHiyWOUY2+8qE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+89lX0DRZIdv9rILD/xZWMOxG3OcuEfhm1mE/6qKISlGzBzLZ
	GIxgn3MeJ7eqMa6N2nnycytwcks2BXEN5rKUgtqqjUi4GWLltSSwrnxMyYyVP0AR6vHOtuHA2Hx
	W4E/Qu30W81PqyxiyksIa7iArtkrIgjtgFmNgg3BlVHKL1yxnyOLIuoYUYNM=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:130a:b0:4e9:cbdd:457d with SMTP id
 5614622812f47-55be85a6243mr1323057b6e.11.1792758956107; Fri, 23 Oct 2026
 05:35:56 -0700 (PDT)
Date: Fri, 23 Oct 2026 05:35:56 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adb54ac.d1cee5ca.8df35.0007.GAE@google.com>
Subject: [syzbot] [rdma?] WARNING in __rxe_cleanup
From: syzbot <syzbot+fef38133c495aeb48297@syzkaller.appspotmail.com>
To: jgg@ziepe.ca, leon@kernel.org, linux-kernel@vger.kernel.org, 
	linux-rdma@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	zyjzyj2000@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c03c1a14507d Linux 7.3
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1796a621580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c4b098695335c89f
dashboard link: https://syzkaller.appspot.com/bug?extid=fef38133c495aeb48297
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c9d4a36731a6/disk-c03c1a14.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3c00e4e185bb/vmlinux-c03c1a14.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1f95d3156291/bzImage-c03c1a14.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fef38133c495aeb48297@syzkaller.appspotmail.com

------------[ cut here ]------------
!ret
WARNING: drivers/infiniband/sw/rxe/rxe_pool.c:212 at __rxe_cleanup+0x311/0x350 drivers/infiniband/sw/rxe/rxe_pool.c:212, CPU#0: kworker/u8:9/3389
Modules linked in:
CPU: 0 UID: 0 PID: 3389 Comm: kworker/u8:9 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/26/2026
Workqueue: krds_cp_wq#0/0 rds_shutdown_worker
RIP: 0010:__rxe_cleanup+0x311/0x350 drivers/infiniband/sw/rxe/rxe_pool.c:212
Code: f7 be 03 00 00 00 e8 7e 15 e8 fb 40 84 ed 0f 85 26 fe ff ff e9 5b fe ff ff e8 5b 89 cf f8 90 0f 0b 90 eb 09 e8 50 89 cf f8 90 <0f> 0b 90 41 be 92 ff ff ff e9 47 ff ff ff 44 89 f1 80 e1 07 80 c1
RSP: 0018:ffffc9000f2ff6d0 EFLAGS: 00010293
RAX: ffffffff88f888b0 RBX: ffff88807f162250 RCX: ffff888034160000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000001 R08: ffffffff917a757f R09: 1ffffffff22f4eaf
R10: dffffc0000000000 R11: fffffbfff22f4eb0 R12: ffff88807e7615a0
R13: 00000000ffffffff R14: 0000000000000000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888123abf000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffd5380382c CR3: 000000003558f000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 rxe_destroy_qp+0x74/0x270 drivers/infiniband/sw/rxe/rxe_verbs.c:661
 ib_destroy_qp_user+0x354/0x5a0 drivers/infiniband/core/verbs.c:2182
 ib_destroy_qp include/rdma/ib_verbs.h:4103 [inline]
 rdma_destroy_qp+0xd0/0x250 drivers/infiniband/core/cma.c:1170
 rds_ib_conn_path_shutdown+0x9bd/0x1820 net/rds/ib_cm.c:1113
 rds_conn_shutdown+0x477/0xb20 net/rds/connection.c:440
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
