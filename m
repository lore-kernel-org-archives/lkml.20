Received: from mail-oa1-f79.google.com (mail-oa1-f79.google.com [209.85.160.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7523B6362
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 17:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788111514; cv=none; b=LGJCD1Ecunw/IwuYVAyDQa1kAtrv8t7YaUoHcMd68mCMubvSeHh50Fl4VqFL4pCjNW58LaPxGpdcFvmyR1G8ZDYYtfX7qwCBDMqIOoqo27riW60B3XPG6AWJ3sXC/go+zeZxmkBvO2Ui3KGIfxHqwILJNWbBJRsHqj/vCD3N2eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788111514; c=relaxed/simple;
	bh=G8uudVDlmu6OBfesgS6iZ9rS4NwZkdL34dsSJd7B7bI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Kgppa/5RJqAjVFVFAiTvhkDQdlgRcXUQO8RVqC5qxYeZ4VErxw+bwc3hRhS+888L9q+uHT3zhwoxUEZ/G8F5wapbUWd4qZg/46WUwYwJ66b8FIKYTsu3CsEfUW+hGd/i4tz/Osc03feyhA9jRF/JazJnzA1MFG9M6dmXvhg2/oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f79.google.com with SMTP id 586e51a60fabf-464e69965b8so5912681fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:38:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788111511; x=1788716311;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5VNzQWRFLebN1X6lVK2IUMMclgAeM+X4+PsLzs0+xtk=;
        b=GvX3OdxQ7l9OY00ae3Ajrj/PmWt7aUHyUBmFawJDm0kA6WTB0fK5XmO/ergLRw1jrn
         bnBbSGSk0uqSTdX+Rgi1e7EpV9UDyG7k2t+yP0QB4ksK/1hwO2Zwx5WBggCaoEU2JcCi
         pA2/pk+2KmpLPJ7AXREqk+Mg5O551sJ/q/TjYuMEs7nGDBHhCeH5WwWl5D3PzidD1Z+7
         /kfeufUI86KdNwoWNXHTc7YNMQpEZTRGbbKyE3AGLYuZzNtgkrIQauyekGkGWqedbOTW
         Hokg+SxDPBmid+/1Li6xjIbxdDlC+EBEHEzPIJtabXf0EiPg7W/lEYusLNS7BCXATuIK
         I14w==
X-Forwarded-Encrypted: i=1; AHgh+RqZyMWcx0FcD5t9gOhkDTIVW8A8xAs2IXDTEjKLLCFDs1pVl5uvdk2eU8yE1MB2cw69ALHUUpDMx7NRUOA=@vger.kernel.org
X-Gm-Message-State: AFuF++mrPowTxLJW7wj07YihjmHB3vGpWdyRtUslnUEu0Zwi354v/unD
	Nq9pa+2b2870SbibGM1V6u3scXIm7ewOiRzp//nIinNc4mfwUzm0jt80ZXf72HE1dl2bDoCaflT
	e4MTSWIuSukK6451hfdbNLgRRihDA4iEHdvLcLcp1ybzMV9yLCza4nZaQAE4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c145:b0:4b2:8d83:436e with SMTP id
 5614622812f47-4b59e7b66f2mr3077637b6e.8.1788111511597; Sun, 30 Aug 2026
 10:38:31 -0700 (PDT)
Date: Sun, 30 Aug 2026 10:38:31 -0700
In-Reply-To: <6a77c53d.01d0871a.3a0d52.0077.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a946a97.1d9ded08.62e62.0120.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] kernel panic: kernel: panic_on_warn set ... (3)
From: syzbot <syzbot+fe5ea83cdd7fc263f452@syzkaller.appspotmail.com>
To: axboe@kernel.dk, io-uring@vger.kernel.org, krzk@kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	luiz.dentz@gmail.com, marcel@holtmann.org, netdev@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    08dbfad3f504 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14f47379580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=fe5ea83cdd7fc263f452
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10c2a379580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16181e25580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ddff5719ec3b/disk-08dbfad3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4b5e39b20fa5/vmlinux-08dbfad3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/eb1f70eed57f/bzImage-08dbfad3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fe5ea83cdd7fc263f452@syzkaller.appspotmail.com

 <TASK>
 process_one_work kernel/workqueue.c:3387 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3470
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3551
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Kernel panic - not syncing: kernel: panic_on_warn set ...
CPU: 1 UID: 0 PID: 5905 Comm: kworker/u9:5 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Workqueue: hci5 hci_conn_timeout
Call Trace:
 <TASK>
 vpanic+0x56d/0xa60 kernel/panic.c:651
 panic+0xc5/0xd0 kernel/panic.c:788
 check_panic_on_warn kernel/panic.c:525 [inline]
 __warn+0x315/0x4c0 kernel/panic.c:1104
 __report_bug+0x276/0x570 lib/bug.c:254
 report_bug+0x16b/0x220 lib/bug.c:286
 handle_bug+0x9c/0x200 arch/x86/kernel/traps.c:436
 exc_invalid_op+0x1a/0x50 arch/x86/kernel/traps.c:490
 asm_exc_invalid_op+0x1a/0x20 arch/x86/include/asm/idtentry.h:593
RIP: 0010:hci_conn_timeout+0xff/0x2c0 net/bluetooth/hci_conn.c:641
Code: 48 89 df e8 e3 f5 09 00 eb 07 e8 ac 50 f1 f6 b0 13 0f b6 f0 48 89 df 5b 41 5c 41 5e 41 5f 5d e9 d7 9f fe ff e8 92 50 f1 f6 90 <0f> 0b 90 eb 8c 44 89 f9 80 e1 07 80 c1 03 38 c1 0f 8c 31 ff ff ff
RSP: 0018:ffffc90003097ab0 EFLAGS: 00010293
RAX: ffffffff8ad6630e RBX: ffff888079288000 RCX: ffff88802f728000
RDX: 0000000000000000 RSI: 00000000ffffffff RDI: 0000000000000000
RBP: 00000000ffffffff R08: ffff888079288013 R09: 1ffff1100f251002
R10: dffffc0000000000 R11: ffffed100f251003 R12: dffffc0000000000
R13: ffffffff818f95da R14: ffff888079288a50 R15: ffff888079288010
 process_one_work kernel/workqueue.c:3387 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3470
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3551
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
