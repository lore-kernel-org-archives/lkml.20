Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C957518AE3
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788141728; cv=none; b=XtIyzsIkzyJ7Os1LOO+ik7kG0bkPF8FgurBaHMgrFpo/g7Hjj2jLcACzLz0jkRGmDE/nHrRf1Mx+XzP+i63V0ogMTqkSPFO/4/fapBGz6Hvg9R2jMH+oQaqU6HLJrObVfmZjAUsXNc47l+H8wGVqrQ32dAQl8NtrWCN4C+0PGEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788141728; c=relaxed/simple;
	bh=padt0Xd+wAnFmLw2LV5s39KmRIa/5sA1Zfp/aBNmFCA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kHSxSFxCHOT9mcj9csUH4Gos2etYBjQLmCPskn9G8/80XTqIZpD33PgOstwEIAvnaQnJaLmrEJYJF7yDaa224LE9DmJqnEreRSwdadB84DsROZVBNeijarfwSU1MOlVuQ31Vt0RJQfckHPHl+DjvtsMpBZbb4FJVb1eX5BDhpNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-49d4cb3ca23so5107639b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 19:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788141725; x=1788746525;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zIqEfiX4d4HuoWo3JB5PZR1QlDu2Z2xdQkSP06CZ2PM=;
        b=rgJOXLYkxo9mnqDaJ86eR2SGG1zFSUbuac8NnEwp4ABZ7mzFydFi93JPEt11Ptau7K
         TZmc0l7CK2avPDXCFb3nc7n2aUQd4BsAGKhIUyssWdoEwfjqfvQgY/RYSz79cbAbw+Ye
         iOYQDT26xhkRvc2ZEapHhrmFnvlg34oujGBdS4Pg4moQ369Msr2M0wYYy8HdHeboCLzD
         iL1JFXVwwa4CmS/O1QrvfPEqoZhlnvUgu2CTcXE4vEnyGaOrLHqywO9RV2RlNJzPh0An
         DjuamyBOfI8/0vgGVBhIOwsFI6LnwtT7j07cEDA5eMjL/NG/RS0Lkskn3sqG/jjucehr
         0jow==
X-Forwarded-Encrypted: i=1; AHgh+RpWtAfHr11KvU2ly6R31zw98jTIXXyzV6Pp7hSIeqRFM3A+VjwwFNXXNMpBncGtxe/qD/YoQCq8j2OMb/o=@vger.kernel.org
X-Gm-Message-State: AFuF++lqh0fo7jmvpToGz5bY7EdtfPT69UbxaGv+2jLZgAXPM9QQbB5K
	GPtqIP3USzDkLnZcBZS96Zx6eYy75LNUe9D1zDhbXzlo/Lzq07/QVpDK0Tmmd7xxND4Nk79WRCx
	tPRa5ZQ2cC0hz63r05pq/fG5CUOXQoV2dDNKHAzlIYigX1Fcw9VzbpkbBk7I=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f4f:b0:4a3:f4b7:cbdf with SMTP id
 5614622812f47-4b5b16ee2demr49263b6e.15.1788141725707; Sun, 30 Aug 2026
 19:02:05 -0700 (PDT)
Date: Sun, 30 Aug 2026 19:02:05 -0700
In-Reply-To: <20260830225812.1943-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a94e09d.a8e469d2.cbf3.5611.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] kernel panic: kernel: panic_on_warn set ... (3)
From: syzbot <syzbot+fe5ea83cdd7fc263f452@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in hci_conn_drop

------------[ cut here ]------------
cnt < 0
WARNING: ./include/net/bluetooth/hci_core.h:1709 at hci_conn_drop+0x1c5/0x2d0 include/net/bluetooth/hci_core.h:1709, CPU#1: kworker/u9:1/4935
Modules linked in:
CPU: 1 UID: 0 PID: 4935 Comm: kworker/u9:1 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Workqueue: hci3 hci_cmd_sync_work
RIP: 0010:hci_conn_drop+0x1c5/0x2d0 include/net/bluetooth/hci_core.h:1709
Code: e7 e8 9f 49 4f f7 49 8b 34 24 bf 08 00 00 00 4c 89 fa 4c 89 f1 5b 41 5c 41 5d 41 5e 41 5f 5d e9 c1 08 a6 f6 e8 0c 80 df f6 90 <0f> 0b 90 e9 91 fe ff ff 44 89 f1 80 e1 07 38 c1 0f 8c b5 fe ff ff
RSP: 0018:ffffc9000f9f7a10 EFLAGS: 00010293
RAX: ffffffff8ae836a4 RBX: ffff88807fd9c000 RCX: ffff888033f63e80
RDX: 0000000000000000 RSI: 00000000ffffffff RDI: 0000000000000000
RBP: 00000000ffffff92 R08: ffff88807fd9c013 R09: 1ffff1100ffb3802
R10: dffffc0000000000 R11: ffffed100ffb3803 R12: ffff88803255ea18
R13: 1ffff110064abd43 R14: 00000000ffffffff R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888124dda000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f3acee37008 CR3: 000000007b2ae000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 le_read_features_complete+0x24/0xd0 net/bluetooth/hci_sync.c:7873
 hci_cmd_sync_work+0x25a/0x3f0 net/bluetooth/hci_sync.c:334
 process_one_work kernel/workqueue.c:3387 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3470
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3551
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


Tested on:

commit:         cee9395a Linux 7.3-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12f2ec15580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=fe5ea83cdd7fc263f452
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=145a5379580000

