Received: from mail-oi2-f2.google.com (mail-oi2-f2.google.com [74.125.231.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393E33655E0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794203; cv=none; b=G/gV9uaMAn6j6WEB+/gf3STAHWzHqTVjL0myef5au9omjIij7G06ieQ666yyA4yXO+GG6qQK6cK621f9+Hv2RVdpNjHR/sKGSvsuXEWEjRAW5E15MpvKTBUryEkudcmWWitdO5IExISY1V0HIiYZRy0Xajh5h3RQemzLgsjqYOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794203; c=relaxed/simple;
	bh=blK6FvmKpRoS9MGLabGRHLSOnuDcnrPUjZXb8EBLLQE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=WV1BDCmfS9H6SoZcf2DQojT+9VQn5y/+a51ZHBADYj9KUSSIhtWy8nVHvDBliC346YUQKvE4YfBN5zFFRJD1U1O3OKDR7cfIkdntwk9Xif3IOsmd1GzfocQUk06UcdgIjoJFJYWPPfecYhhNsci+wCiYAY3rpFSGFGjY8ghG2DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f2.google.com with SMTP id 5614622812f47-495d5d27acfso981942b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794201; x=1789399001;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+IjrXitel32FTdEZ7ujqbpwDNgbWTPcI1o56TG8f6VQ=;
        b=eP5aTWc4wRHGORepuo0YMtTrs3+9vlrNaJtdh28Iyi6wMifVD0k5Ivk7vWoEC8QU1J
         15FTOEIFfjrgfR4PB3DUWojTvvjpeDjWWvRmJqCV7+kV/yLZH+NFlzAsYzbqzY3nRkQz
         LkiArLj6t2GdIuEeJTeSJPQwiUm09hw5lA23grfnMszo3FQQN3MuS1BO9NK+dkul2sef
         RpvVTckywu88tIDno3fRNlITJOX7aPqhlEAA5Yj7WHfD+GxCZS+hsvKgWtEboeulJIKJ
         SImJ5dOUKE/6qQKGC03EHlwBwZL1uwFoGlzWT3afkDh8o75H/kdtRNWFxin0rX1NHN3r
         r9bQ==
X-Forwarded-Encrypted: i=1; AKwUvBzByrOL6q/mYL0pXfgtVWmxe169yuJ9lDtx04B+yI3Hg56naStClsECKEZOvGD2/59QiSf2WsFrOHKVk6M=@vger.kernel.org
X-Gm-Message-State: AFuF++lnLztfAO/o3hopQ57z0O6bvDgr9h/YrwN/+uYncseukzHjvAmS
	5Ru/uR3U4EEF8KONIdPRp85LyKORqGc62KgmnuruJNwSLigd6t0+51IqVVpOuE2r4fpJDFIjEP+
	2MIkUlx8BKbEkKskFYsmYAE+hRujT++IWdcOIGhMxevdntUIAdiceyLLmiWI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1795:b0:6b3:f31f:bd74 with SMTP id
 006d021491bc7-6b6fcfd90f0mr23613753eaf.20.1788794201131; Mon, 07 Sep 2026
 08:16:41 -0700 (PDT)
Date: Mon, 07 Sep 2026 08:16:41 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9ed559.6e6c5f9e.240462.0003.GAE@google.com>
Subject: [syzbot] [nvme?] WARNING in nvme_loop_reset_ctrl_work
From: syzbot <syzbot+4a1d521d19d6321f5aad@syzkaller.appspotmail.com>
To: hch@lst.de, kch@nvidia.com, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, sagi@grimberg.me, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    940de590b839 Merge tag 'hardening-v7.3-rc2' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=150e2125580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=4a1d521d19d6321f5aad
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/465f56673f03/disk-940de590.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b8f5904c8659/vmlinux-940de590.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b2c5a5b98759/bzImage-940de590.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4a1d521d19d6321f5aad@syzkaller.appspotmail.com

------------[ cut here ]------------
1
WARNING: drivers/nvme/target/loop.c:455 at nvme_loop_reset_ctrl_work+0x423/0x810 drivers/nvme/target/loop.c:455, CPU#0: kworker/u8:16/1478
Modules linked in:
CPU: 0 UID: 0 PID: 1478 Comm: kworker/u8:16 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Workqueue: nvme-reset-wq nvme_loop_reset_ctrl_work
RIP: 0010:nvme_loop_reset_ctrl_work+0x423/0x810 drivers/nvme/target/loop.c:455
Code: 00 00 48 8b 44 24 18 8b 18 83 e3 fe bf 04 00 00 00 89 de e8 ef 30 d4 fb 83 fb 04 75 07 e8 d5 2b d4 fb eb 09 e8 ce 2b d4 fb 90 <0f> 0b 90 48 83 c4 28 5b 41 5c 41 5d 41 5e 41 5f 5d e9 d7 fa 66 05
RSP: 0018:ffffc90007127a80 EFLAGS: 00010293
RAX: ffffffff85f24df2 RBX: 0000000000000002 RCX: ffff888025970000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffffbfff1f63bb0 R12: ffff888024bc4c18
R13: 1ffff11004978879 R14: dffffc0000000000 R15: ffff888024bc4000
FS:  0000000000000000(0000) GS:ffff888125bd5000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f899ad0b840 CR3: 00000000390e0000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x470 kernel/kthread.c:436
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
