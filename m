Received: from mail-oo2-f7.google.com (mail-oo2-f7.google.com [74.125.231.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61B51397
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789776628; cv=none; b=alecbq/mzIshhuIl/6ty3OOn0vAmSEI6lOueHbpskqgaS9IdDlE6A+BjXM3mZjyyT0s/UjO4yEB7KOhREZiNKT9ZS+Mf8NuKTHAR1m4PzUxTQPlkZL/BC2XcB8RN6gzHcVw+2HhZgmA7Ruy35zEy4HHPrswNdL6aiBNXSA2ZRlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789776628; c=relaxed/simple;
	bh=uvrpE+ZMEwzZvvst0nIEmLN+s+ABNTry+DvEqIbCT8I=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=IXWVkk4Pg0fZCbdFgcz+kk1lVDaEwSEqIo0g+lHnYn8xgPF06DnOO3uc/OLFkPAJfzMYitA2tRKSzYwb1mmUidNglpm2giWqJGvLOSv2RnoFRa6FPr+ji+Ed6IXEegfIcWgAGtz0R1i6s4KgM9s9sjgI4otaQSSqGx8gZtwBjYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f7.google.com with SMTP id 006d021491bc7-6c197ff1f3aso466275eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789776625; x=1790381425;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xo9q5xUUXF4KjJ0+zPrqtPtiLxRKts0CpehP+nEYXok=;
        b=eq6H4AAwXFnoO6UxXBTIeCigbTZVqOmGMSKg1Z4yP7fYX90JGOfbY/PF00YoQvQMR5
         cOD2mgzl9DJcDZArdRlFKysEZajWbjczkyBObqZduHfWi5VmV0lEvc1ek9EESvrE3uBT
         ezx9rciTpJm6k7hG72SwduyU/BT4TMtVBLWEVSmIB97RX6W84KXYmNDBAAsf03jokcRB
         dZFUTs99hVaj/mZDeZAjQDFKQPQORxCy8R/nUOsLcSmkYmjyggC3a/nd06T6N5hWG4Z2
         /zdY4J4wxrn5r0IcL/xfc+dsOLcQ1ZxN0iN8I37lgCOkxgUmvw9F4sUJrnJWBr2invbW
         tsWQ==
X-Forwarded-Encrypted: i=1; AKwUvByG95O1CgFT+FuRcfPEH/MFfIbcH4L1bpGf68IIT0Q56Ld9wKDi4JVKggr/+Cv767KojSLaz3OihAuorrE=@vger.kernel.org
X-Gm-Message-State: AFuF++nwqBOKGA31c8Uc+R8cuCQZ5TyOLb7uy1qfjbDLSFo4SOIczXrY
	iokUgL5thKHLllINmfmY3kGt4MB5NXoLVuppFCuSZMbCePmUuD4NXmSW4dsRvPG09LBxSdpOIOt
	RJBBMtQvnppBXktvWOA/pv+WmW7uaCm4eyg5ce369XVBG8IEK7W7ftA6LCTA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:201b:b0:6c9:80d9:5e8 with SMTP id
 006d021491bc7-6ca9bf4c753mr3598445eaf.41.1789776625762; Fri, 18 Sep 2026
 17:10:25 -0700 (PDT)
Date: Fri, 18 Sep 2026 17:10:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aadd2f1.ef152331.3350b.0000.GAE@google.com>
Subject: [syzbot] [nvme?] WARNING: bad unlock balance in nvme_update_ns_info
From: syzbot <syzbot+64bc2169c92ee55ad31f@syzkaller.appspotmail.com>
To: axboe@kernel.dk, hch@lst.de, kbusch@kernel.org, 
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, 
	sagi@grimberg.me, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    704340f1cd0d Merge tag 'x86_urgent_for_7.3-rc4' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=126bbdf9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=64bc2169c92ee55ad31f
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/068a35f4a268/disk-704340f1.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5bb5e44895e8/vmlinux-704340f1.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8cb2bd26a861/bzImage-704340f1.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+64bc2169c92ee55ad31f@syzkaller.appspotmail.com

=====================================
WARNING: bad unlock balance detected!
syzkaller #0 Tainted: G             L     
-------------------------------------
kworker/u8:28/9220 is trying to release lock (&q->q_usage_counter(io)) at:
[<ffffffff85e833c7>] blk_mq_unfreeze_queue include/linux/blk-mq.h:962 [inline]
[<ffffffff85e833c7>] nvme_update_ns_info+0xa07/0x1200 drivers/nvme/host/core.c:2623
but there are no more locks to release!

other info that might help us debug this:
locks held by kworker/u8:28/9220: 2, last CPU#1:
 #0: ffff88801ae8d138 ((wq_completion)async){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801ae8d138 ((wq_completion)async){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801ae8d138 ((wq_completion)async){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801ae8d138 ((wq_completion)async){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc9000460fc40 ((work_completion)(&entry->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000460fc40 ((work_completion)(&entry->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000460fc40 ((work_completion)(&entry->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc9000460fc40 ((work_completion)(&entry->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479

stack backtrace:
CPU: 1 UID: 0 PID: 9220 Comm: kworker/u8:28 Tainted: G             L      syzkaller #0 PREEMPT_{RT,(full)} 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Workqueue: async async_run_entry_fn
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_unlock_imbalance_bug+0xdc/0xf0 kernel/locking/lockdep.c:5349
 __lock_release kernel/locking/lockdep.c:5590 [inline]
 lock_release+0x252/0x3c0 kernel/locking/lockdep.c:5964
 blk_mq_unfreeze_queue include/linux/blk-mq.h:962 [inline]
 nvme_update_ns_info+0xa07/0x1200 drivers/nvme/host/core.c:2623
 nvme_alloc_ns drivers/nvme/host/core.c:4293 [inline]
 nvme_scan_ns+0x34c1/0x46c0 drivers/nvme/host/core.c:4483
 async_run_entry_fn+0x9d/0x430 kernel/async.c:129
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
