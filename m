Received: from mail-oa2-f0.google.com (mail-oa2-f0.google.com [74.125.231.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A25D48F01A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905328; cv=none; b=IMbe16cwUlaiL2r8pmkDKCN7ikRwBIgETRCfncgz5xbJCjaSwnU9aeGsMAN141CRiUc0ke3Hs40GvBp7IYOdQ8x1Lsc5BnI06L3ZxXAQZTmdwQWil5x7tSsqkwh/in7tMy33nt9hyQBWtoA6bZ12f8ZpUTZoNObD4SFihFDKIlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905328; c=relaxed/simple;
	bh=OnKvCHQQWpy21sOx08SAt6H+1UlBFhVgYfLX4fnd6kw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=JtAmOvhBHBk8TCoWAcKvh2OtOiuJPypNF+ys5YZxf69CICbfizb6GWzY3wwiUJMx/SCVljQ9utPgij0stD57SMWkeoidomX8VjFYadAkW+GVEENu0LvCpZG43NYBvtfaszMDJatwiwoAlf5sgvH84fBul8QozIWvujf8w6vpZXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa2-f0.google.com with SMTP id 586e51a60fabf-455efbd6e96so1555780fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 15:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788905326; x=1789510126;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A4MhYi0B0IRTLYdNfba+OaC5J49MdhkPU0xHMnjFvmA=;
        b=S2pjmmwgstVtcshac4NMMCRs459lggsB1b932tAOqN87GWSh9Pe+uELFgO40dTNE0/
         jG2bwEXJMcLedda/G6rngeNBlRECMyUGKlK7xYi0Y5UVRNNFHAiHmI+nSf3pKsGqtnaA
         kO6FMfgTkcyjno7CVTNiX5ViMnLUm9r2mcRCX7DmvjnAZ0Lxmuw5FqtjH2U8z8s134Pu
         0fKNOnVOTCHpFuI8wkd3aKgS19nGNuXBiK4IVqXzpJTjR6jN+pQjYYLZs25906fZ82rJ
         LH+7P9MuvlA0gjMVTVotUno0j1tVpn2TwpJNg9zWAlwDHQILQIBfuG0F64YEouL4sVqU
         X4Qg==
X-Forwarded-Encrypted: i=1; AKwUvBwQnRPGLOYaJ+V4m7is5J0idpS2u03iaXD15GCmtFErWkZboNvTKSWMjDr4BcDEozAi7n1MPdwYPI2716E=@vger.kernel.org
X-Gm-Message-State: AFuF++ly7t9I5ox7iB19oU/VA5X4apx1rMlmhzpW2WE8p3S/88hsT8RY
	OKKYYcOzUFay6SeomPemkU7tk7Egld8XrEsSzAhMpzDrt+HJvIi9m2MzA7apihHs7cUH0DGOxf1
	g2pTDuIWaVAmvN6k7Ym60yemA9Jm9OR8uhjtvirJX8FgQaKzoFs8aT13fkIE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f036:b0:6b1:b68e:5109 with SMTP id
 006d021491bc7-6b6fe59cdf5mr17762393eaf.33.1788905325930; Tue, 08 Sep 2026
 15:08:45 -0700 (PDT)
Date: Tue, 08 Sep 2026 15:08:45 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa0876d.f81106d8.285f0a.0003.GAE@google.com>
Subject: [syzbot] [usb-storage?] BUG: unable to handle kernel NULL pointer
 dereference in usb_stor_invoke_transport (2)
From: syzbot <syzbot+356ae236154297f0d60d@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com, usb-storage@lists.one-eyed-alien.net
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    28924df2a08f Merge tag 'perf-tools-fixes-for-v7.3-2026-09-..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=16145749580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=356ae236154297f0d60d
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14bf2a15580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15023b9e580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/dbb658780e3f/disk-28924df2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ed954d86e83d/vmlinux-28924df2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/56cc5fdb5ce4/bzImage-28924df2.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+356ae236154297f0d60d@syzkaller.appspotmail.com

BUG: kernel NULL pointer dereference, address: 0000000000000000
#PF: supervisor instruction fetch in kernel mode
#PF: error_code(0x0010) - not-present page
PGD 80000000733dc067 P4D 80000000733dc067 PUD 7324b067 PMD 0 
Oops: Oops: 0010 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 5644 Comm: usb-storage Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:0x0
Code: Unable to access opcode bytes at 0xffffffffffffffd6.
RSP: 0018:ffffc90003997af8 EFLAGS: 00010246
RAX: 1ffff1100f2c69f0 RBX: ffff888073cbd110 RCX: ffffffff9a9de501
RDX: 0000000000000001 RSI: ffffffff8e474d50 RDI: ffff888079634e90
RBP: ffffc90003997cd0 R08: ffffffff907a1e7f R09: 1ffffffff20f43cf
R10: dffffc0000000000 R11: 0000000000000000 R12: 1ffff1100f2c680e
R13: 1ffff92000732f74 R14: ffff888079634e90 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888124cd6000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 00000000729a6000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 usb_stor_invoke_transport+0x55a/0x1a40 drivers/usb/storage/transport.c:926
 usb_stor_control_thread+0x44c/0x8f0 drivers/usb/storage/usb.c:462
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
CR2: 0000000000000000
---[ end trace 0000000000000000 ]---
RIP: 0010:0x0
Code: Unable to access opcode bytes at 0xffffffffffffffd6.
RSP: 0018:ffffc90003997af8 EFLAGS: 00010246
RAX: 1ffff1100f2c69f0 RBX: ffff888073cbd110 RCX: ffffffff9a9de501
RDX: 0000000000000001 RSI: ffffffff8e474d50 RDI: ffff888079634e90
RBP: ffffc90003997cd0 R08: ffffffff907a1e7f R09: 1ffffffff20f43cf
R10: dffffc0000000000 R11: 0000000000000000 R12: 1ffff1100f2c680e
R13: 1ffff92000732f74 R14: ffff888079634e90 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888124cd6000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 00000000729a6000 CR4: 00000000003526f0


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
