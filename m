Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEBB3168EE
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792272101; cv=none; b=auMHv8E7WhS6Kt5taBDD2hUEnwpaq8FALEouhO6eywlxjK0CFzlpV3wFR3lbPphmxHAgA6Dc+XbFXLp5qVGG6h70E35+RK9Q3d4bpt+NXE1x5ODijwQR6u4+4Yfxj+2062CoaewzyKmsFnAoRi7MBaBDO7E4WW0DCuWvwY6a8rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792272101; c=relaxed/simple;
	bh=/kFfHFRoe408EgWKwNIyFW0hOifIAtJ3KHni0rDxd2A=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PPP+35HJNseOnaWCEZcdDspkwoZtCA5oDw09F98uEqqcRtkfORqY/OeLkb51uAvE6F2NXuOQNeEBtLO2GPoy7IOvHI0J4jsA7+mF4GECRzGqSv8YSThsPzvaCbmwnDGQ0FIj51hEVDbCxByL/Rr7d7Z8P7X4voTGlX00NzgqOgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-8254ce65bfeso1794182a34.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 14:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792272099; x=1792876899;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wiq5SZSeAP0nUEm5Zy0xf68TR8qV63o4MNSaQsjSlFU=;
        b=e6qApYyflFqaxSWhVj0fyu9q5bhRssCjbgI8Dse1TmZeryxBBlAYQiGTjPRKJoCnqk
         SfwxhqYM1TzcFmV7LqthwBb2OJ76TRxd9TlVhMfUjr9kqlTFr/wTT6/4///qxzNgLw/B
         rg6NVLXQ0lMvDj4jI0ECOU8175i/YZeyQ69dvrgSPg9OUThn1BxswkKJKnoX85xFhDOz
         0LzyKvB8UJp7zopjA3rcuugptEYhS/jwVofCeMg/5YPWfbFgYfwd5Qx3bOGkzeacMqcl
         n0+e85NMSOlks8ohRXVP/BU5k2+RxeOeb/dAMJut7pBFU0D4cM08hBHAy3kY9PTNTfRq
         3wAg==
X-Forwarded-Encrypted: i=1; AKwUvBxf7TZxcIMtR7t0Nn6gVE5GzENcC9L2mVvoHb7/WbyqQcediVyrvxkBdF25k5rUWTDjGwsOieHfA1Kjt+o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwfPnrnROOOvg1x2S4+f8ArPlhlE899BQcM4QWXO8RgtNkeBlD
	WKrHlkTZ5Sj6ntZM2KdAc4FfJG+lytsuRhyeTeV8SJfI2h3lvFitBTtk3r9l+CzBfKRfQLdPjqi
	Jq57VRwhx1/AArSZHksnE3+f9GSpCuHdPqVUCsE9go5pjuACo+Xuf/R8vBIE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2387:b0:4d6:92d4:c804 with SMTP id
 5614622812f47-53cd20a090cmr2570349b6e.60.1792272098767; Sat, 17 Oct 2026
 14:21:38 -0700 (PDT)
Date: Sat, 17 Oct 2026 14:21:38 -0700
In-Reply-To: <6a82cd06.dbb3a75c.20434b.004b.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad3e6e2.a6d1a155.34a93f.004d.GAE@google.com>
Subject: Re: [syzbot] [gfs2?] WARNING: kobject bug in __dlm_new_lockspace
From: syzbot <syzbot+b2b8d04ec4914f618d23@syzkaller.appspotmail.com>
To: aahringo@redhat.com, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, teigland@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    58161ead29e5 Merge tag 'drm-fixes-2026-10-17' of https://g..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=121e9495580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c4b098695335c89f
dashboard link: https://syzkaller.appspot.com/bug?extid=b2b8d04ec4914f618d23
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=138e8d99580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b2b8d04ec4914f618d23@syzkaller.appspotmail.com

dlm: Using TCP for communications
workqueue: Failed to create a rescuer kthread for wq "dlm_callback": -EINTR
dlm: can't start dlm_callback workqueue
dlm: ls_6035_1: can't start dlm_callback -12
------------[ cut here ]------------
kobject: '(null)' (ffff888027a28088): is not initialized, yet kobject_put() is being called.
WARNING: lib/kobject.c:736 at kobject_put+0x66/0x550 lib/kobject.c:734, CPU#0: syz-executor183/6040
Modules linked in:
CPU: 0 UID: 0 PID: 6040 Comm: syz-executor183 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
RIP: 0010:kobject_put+0x8e/0x550 lib/kobject.c:734
Code: ae 05 48 89 d8 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df 80 3c 08 00 74 08 48 89 df e8 ab 9f 59 f6 48 8b 33 4c 89 f7 48 89 da <67> 48 0f b9 3a eb 05 e8 56 c2 e8 f5 4c 8d 73 38 4c 89 f7 be 04 00
RSP: 0018:ffffc9000307f9f0 EFLAGS: 00010246
RAX: 1ffff11004f45011 RBX: ffff888027a28088 RCX: dffffc0000000000
RDX: ffff888027a28088 RSI: 0000000000000000 RDI: ffffffff918d8000
RBP: 0000000000000000 R08: ffffffff917a747f R09: 1ffffffff22f4e8f
R10: dffffc0000000000 R11: fffffbfff22f4e90 R12: 1ffff11004f45018
R13: ffffffff9bad9988 R14: ffffffff918d8000 R15: 00000000fffffff4
FS:  00005555573c3400(0000) GS:ffff888123abf000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f6992404000 CR3: 00000000260fb000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 new_lockspace fs/dlm/lockspace.c:617 [inline]
 __dlm_new_lockspace+0x1714/0x1cd0 fs/dlm/lockspace.c:638
 device_create_lockspace+0xc7/0x350 fs/dlm/user.c:414
 device_write+0x872/0xed0 fs/dlm/user.c:606
 vfs_write+0x296/0xba0 fs/read_write.c:685
 ksys_write+0x150/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f69924444e9
Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd9a54bda8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f69924444e9
RDX: 0000000000000080 RSI: 00007ffd9a54be80 RDI: 0000000000000003
RBP: 00007ffd9a54be80 R08: 00000000ffffffff R09: 0000000084a559bf
R10: 00007ffd9a54beb8 R11: 0000000000000246 R12: 0000000000000002
R13: 00007ffd9a54bdd0 R14: 0000000000000001 R15: 00007f6992404000
 </TASK>
----------------
Code disassembly (best guess):
   0:	ae                   	scas   %es:(%rdi),%al
   1:	05 48 89 d8 48       	add    $0x48d88948,%eax
   6:	c1 e8 03             	shr    $0x3,%eax
   9:	48 b9 00 00 00 00 00 	movabs $0xdffffc0000000000,%rcx
  10:	fc ff df
  13:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
  17:	74 08                	je     0x21
  19:	48 89 df             	mov    %rbx,%rdi
  1c:	e8 ab 9f 59 f6       	call   0xf6599fcc
  21:	48 8b 33             	mov    (%rbx),%rsi
  24:	4c 89 f7             	mov    %r14,%rdi
  27:	48 89 da             	mov    %rbx,%rdx
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	eb 05                	jmp    0x36
  31:	e8 56 c2 e8 f5       	call   0xf5e8c28c
  36:	4c 8d 73 38          	lea    0x38(%rbx),%r14
  3a:	4c 89 f7             	mov    %r14,%rdi
  3d:	be                   	.byte 0xbe
  3e:	04 00                	add    $0x0,%al


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
