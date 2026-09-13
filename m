Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984EC361954
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789313671; cv=none; b=DYRiEINLS8FYIUCoN0ceNZPCvDjZmoEChfpGWjGt5z3oE3ibM2QBTMtQRNg5phZcNpHp7JVUj3rB1Kmwy728hksSbaQsI2NE2RCVg8h9qP8J6r3oDefRK14/th33H/ho6tTJN4VEu4vJLkrxOKitfcKCJe5i2gPBWMCByQA3vTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789313671; c=relaxed/simple;
	bh=X42yzkjbAEasH4dl1SVCRprQcNogTUO5KYZtvXtAl+0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=lyuZ+BXlVEhCHRLYwuw6esfwD9V47fXFZd23NyB9mb/Lc9pa8gttS8w78P1imd0UWcRvgspfZARfDJxQnVGrO5H8AvurL6nVuj0UzWRYJgyY5ojWtr1fLQx4pXEXCigcCUbS3hQ+He/anwoyTU1+WqTn4MPJr+cH+iiw7cNuNd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8064fadbb1dso385858a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789313667; x=1789918467;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FkmW/KE1CGkFtTZ0aRXS/creYAddRQ91ghlXWYCbS8I=;
        b=V0E6ltYvza7d/Fh4jiiJD3oLDuYBjgTAgziSzzZ3cZrHJd+C72KSFkYr9haC2zA7Lh
         ejWxh/AvfoRensXIrdhCaRFgBnCj2nZixxpv0T9SrDH5QCl5lEYbP7FUJ2v0Gxr3xKD7
         y0cKzfoBVbakcXRgU4CxgVpv2rpDlsxKsW9EbwKJE3PfC7GyXY+c/LXqvPgsZWGArN1W
         2PzsDM/whojivYkczSgh9O9PJ7CJOxyDnOTWTsi4OYwzWBxzc8FMfiFgNABV+xF8AAk+
         4Rjr6fudOg6PKi+q0zz2vUGbx5jpSno7X5aPsOiotviXq09ugnkIfla/ik/jFNngzxvi
         ysYg==
X-Forwarded-Encrypted: i=1; AKwUvBxbPVHlSAkpwRuCqgNlT1toyzxdl82bgH6DmbHaMZs5JzudrPVXxNA7yXa+ifZvJ9lPRVIHvtsdFJ5rPaw=@vger.kernel.org
X-Gm-Message-State: AFuF++m7IKGkkmgmQlj77Mk+c26xNgBP4tqRxJxnCdm+3EEjNs8lNLRn
	QT7fsh3TxrhkpgDxP9wHf9DG8qUmqvnTugvdJFOHUORLwADJR+8aE4+53GDAp3U2lu3+NsXrLUe
	mBiZRgo5p0uFWcIS1vT1nzoBYVyHgiNYhD5q2jv7VovYSkxnY34UsduAlQxk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f012:b0:6c1:b8a5:cbed with SMTP id
 006d021491bc7-6c24f6527a5mr4222634eaf.55.1789313666919; Sun, 13 Sep 2026
 08:34:26 -0700 (PDT)
Date: Sun, 13 Sep 2026 08:34:26 -0700
In-Reply-To: <6a9ed559.6e6c5f9e.240462.0003.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa6c282.4c28b7d0.c1bba.000d.GAE@google.com>
Subject: Re: [syzbot] [nvme?] WARNING in nvme_loop_reset_ctrl_work
From: syzbot <syzbot+4a1d521d19d6321f5aad@syzkaller.appspotmail.com>
To: hch@lst.de, kch@nvidia.com, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, sagi@grimberg.me, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    2f0c1cf72f46 Merge tag 's390-7.3-3' of git://git.kernel.or..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=159b19f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=4a1d521d19d6321f5aad
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1074f615580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4a1d521d19d6321f5aad@syzkaller.appspotmail.com

------------[ cut here ]------------
1
WARNING: drivers/nvme/target/loop.c:455 at nvme_loop_reset_ctrl_work+0x1ad/0x5d0 drivers/nvme/target/loop.c:455, CPU#2: kworker/u33:1/38
Modules linked in:
CPU: 2 UID: 0 PID: 38 Comm: kworker/u33:1 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: nvme-reset-wq nvme_loop_reset_ctrl_work
RIP: 0010:nvme_loop_reset_ctrl_work+0x1ad/0x5d0 drivers/nvme/target/loop.c:455
Code: 7c 08 84 d2 0f 85 85 03 00 00 8b 9d dc f8 ff ff bf 01 00 00 00 83 eb 04 89 de e8 5e 1e 58 fb 83 fb 01 76 09 e8 e4 23 58 fb 90 <0f> 0b 90 e8 db 23 58 fb 48 83 c4 18 5b 5d 41 5c 41 5d 41 5e 41 5f
RSP: 0018:ffffc90000727bd8 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 00000000fffffffd RCX: 0000000000000000
RDX: ffff88801c78cb00 RSI: ffffffff86b3f22c RDI: ffff88801c78cb00
RBP: ffff888028d84b10 R08: 0000000000000005 R09: 0000000000000001
R10: 00000000fffffffd R11: 0000000000000000 R12: ffff888028d843e8
R13: ffff888028d843ec R14: 0000000000000000 R15: ffff888027346800
FS:  0000000000000000(0000) GS:ffff8880d5d59000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fde19ca5e9c CR3: 000000002206a000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
