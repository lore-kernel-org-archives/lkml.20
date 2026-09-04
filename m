Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB9D442B17
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514385; cv=none; b=KaoH6LX2GE+7u5yjV9hfrmWy12/XEmU0DszbIQ0KUOzFqcsZf1ATE2W9/L5glBCo85uVCSRricKSPT/53NJxPdw6/FaqDkRCt7IlZl6RSwmHLOSHdqYQOx43ej0l0unXgkw7msy3wjR4MqaNMuSvibsdtSaMFIc7OjeWvIFXva0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514385; c=relaxed/simple;
	bh=s46HHW4Euo/dZsXvgBesfmbB31mlgKeYt0eqjvjiDAQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=K1zTagI62X4d8QpAM6/fWiT/3yGrkOwTUpy/PRvfdL83uctDZfM88fRLcmtUmkpQO1yJ97tsGpGqz2lP3Yn5khlrBGS9gqq54m2a1L0t7iXlsj3PbSWbzCKTxfneOTtZuE56yjZgboREdomylHyVw3re3xTqjfnUPD8vxsogb0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28dbf4197so1075860b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788514383; x=1789119183;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hEiPujauQzePXZmlxDjSXNyf4SR83+1ho3+EUP8pfrA=;
        b=eR+WfSbEZpU/WjM4/Oa4vliJNW4uSudR4pH5yH1DNUuYWmBHQPsnGoNIAi0wYYd4Qf
         YXYHlhCZEshdati4zxCqg6G3YkMMPzPXsLl5oAwfbzaBgifhyNz9+6/zc6Ib64kArOBR
         CDWwxJ53czl0kQ/pyKKudyc23A1fGuLiwkjqb8CZWNmv8ezUHjNaH2kZxpNPWTxbzTuJ
         jkn63F/zTjzDI5kBMBIz7nmYkHFvSLfkx/3qTzDFejZ0DLui8xiyI1TOvJmMYrGJlgkj
         m8krJd0tkDMBDRtS4iQJEVsJLXAUEtzBKbnU0WL9lL1MzFWOEVXAqLKXtS10ZqNet9qT
         2/hA==
X-Forwarded-Encrypted: i=1; AKwUvByk2DO0fqtkoyujO5zmKQjKVKuudqCfZNKOiy4Pdluz+aYBoUZeKhVxD3CB3ujWCltEJrdvo3uhZiW7jPo=@vger.kernel.org
X-Gm-Message-State: AFuF++nJxV+INWVOQbzvzFZ0C2DAbQyrRMeslV4mFz/fMzF7LLaJVsrv
	9UljD3su0vwEvPhPFpzV+wgi0QcUsRuiLjlKaY66Q8lAaQRA5kRTW7QJOCbE6pkjL8nKBpVG5ZK
	Ihyz0YgwSfl6pOkQdR1jewyoRBK07Ia67DPmn/0Sh6UWVG9etsFmewEiLp1U=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1209:b0:4a0:cf55:3cf0 with SMTP id
 5614622812f47-4b9613fc552mr3447399b6e.9.1788514382789; Fri, 04 Sep 2026
 02:33:02 -0700 (PDT)
Date: Fri, 04 Sep 2026 02:33:02 -0700
In-Reply-To: <20260904091018.606487-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9a904e.9266084e.bf0d7.060f.GAE@google.com>
Subject: Re: [syzbot] [block?] general protection fault in blk_mq_quiesce_queue
From: syzbot <syzbot+fefa0af09f7891b1800e@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in nvme_loop_reset_ctrl_work

------------[ cut here ]------------
1
WARNING: drivers/nvme/target/loop.c:457 at nvme_loop_reset_ctrl_work+0x1d4/0x620 drivers/nvme/target/loop.c:457, CPU#3: kworker/u33:3/62
Modules linked in:
CPU: 3 UID: 0 PID: 62 Comm: kworker/u33:3 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: nvme-reset-wq nvme_loop_reset_ctrl_work
RIP: 0010:nvme_loop_reset_ctrl_work+0x1d4/0x620 drivers/nvme/target/loop.c:457
Code: 7c 08 84 d2 0f 85 b2 03 00 00 8b 9b dc f8 ff ff bf 01 00 00 00 83 eb 04 89 de e8 c7 fb 59 fb 83 fb 01 76 09 e8 4d 01 5a fb 90 <0f> 0b 90 e8 44 01 5a fb 48 83 c4 18 5b 5d 41 5c 41 5d 41 5e 41 5f
RSP: 0018:ffffc900007dfbd8 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 00000000ffffffff RCX: 0000000000000000
RDX: ffff888020f72580 RSI: ffffffff86b13ae3 RDI: ffff888020f72580
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000001
R10: 00000000ffffffff R11: 00000000000075fb R12: ffff8880299f83e8
R13: ffff8880299f83ec R14: 0000000000000000 R15: ffff88802886b800
FS:  0000000000000000(0000) GS:ffff888096c67000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000f7f6e210 CR3: 000000004d58f000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


Tested on:

commit:         940de590 Merge tag 'hardening-v7.3-rc2' of git://git.k..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=116438f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85bc5cc2fc7394d9
dashboard link: https://syzkaller.appspot.com/bug?extid=fefa0af09f7891b1800e
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=100438f9580000

