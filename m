Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD53723D295
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791731976; cv=none; b=RlAJvyQFGAGCaM2LAHcAwnjcVtgn7xCYM6usKn4sCmSF+8HcI12qMW3zbOkkRkwOKDVVFRZ6I7BVilALYAJML2F828fCPwa9Q9yRkfjrPZ4q5+2IcJLsZ5buEYCWQH7e9ofG7F/9px5AvPrZVG4LxuAkFjwhfSTHZw5FwksblXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791731976; c=relaxed/simple;
	bh=SfZU5QBRdMi/KgNELcecbO6USgMv2hCSJf9T0qU5shI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=sDlxVZHf6I+n0JtprrBJ01NghUpj8qub5cKB9ZQNZOk435gCWUyKHm4g8b0ZXIhoxtwYAzaGWMNansOBMXkb+DsD9K6IFRTyk+NnbzhEILwj9lDOZcISNOcDqJHJgLeBGUp1Gyie3z2kFOPgEo/v7DTBsfTBPJX7EohjWcFr0eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4e937c5bd4fso1301185b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791731973; x=1792336773;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ejP176Rx5rm5jeJ6KaI7hE3f67vqppgEazw/7JP8qc=;
        b=ZaNWJAVND5IxrcrFQ7zOT74p9EfNH6vmEMSXsMIH0szH0XtCmgz4t174rp9L8P2X7R
         raeOoU+hWf8+0lk298V5eVDzm6NWqTvMxfPkZerlSM+m+u4+k2Ipt/WRiExKf7vV9lLp
         0VygnFfQ+iWH8HWPsfyjEvteyxjj11lHfquedplTpHpRv68gSDJtvHVRyAK1TDIKE8/4
         6n9rfanJ35Wtw2H3KcLaCV9lZrIsM/7HTUJsJxnpav8e8aWLzw9tbGafArYCveLo0wUt
         2SKcbRZsdV9l2+Yc1iRDmAbdWiEq+kPr75UlCol8mQw9H8bUIsAzmY7VfinBAp+bE8QK
         Jt8w==
X-Forwarded-Encrypted: i=1; AKwUvBwfLPshtzH8dYmHvbxnmZAyAa8Kn389vZtHATWTZpF32B98k84OyA3t2rCwAKEYOJiyCpKftP1Om7IhhzM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4aM+o7N6spNrOM41OUSNoXKmUxMaxweay8MEo1RULuAeEFFRi
	H4oAYNh0M3/pVBlx+KkMDFiYjGyAbXwRlJK6iLyABNiQzssGLiitpM9DxLPnMKNDfXtiKQWiyI5
	bSvCtcbQd2ADmlpGH024I1ZJQY5EvUVRW23wKHRVcti7vlXrBPFODAd2w3yg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:130f:b0:4c3:2e7:55bb with SMTP id
 5614622812f47-50c537c68c7mr6581827b6e.38.1791731973659; Sun, 11 Oct 2026
 08:19:33 -0700 (PDT)
Date: Sun, 11 Oct 2026 08:19:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6acba905.8cdf6287.1eb53.00e4.GAE@google.com>
Subject: [syzbot] [block?] WARNING: lock held when returning to user space in blk_throtl_init
From: syzbot <syzbot+1eb53c83ab8b0a0302a6@syzkaller.appspotmail.com>
To: axboe@kernel.dk, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    becb95e45ef0 Add linux-next specific files for 20261009
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=119ea68e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7400eab0484d1dc
dashboard link: https://syzkaller.appspot.com/bug?extid=1eb53c83ab8b0a0302a6
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=100e8999580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=159ea68e580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b16b9c03e69c/disk-becb95e4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/78483614b526/vmlinux-becb95e4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e333f1b9fe69/bzImage-becb95e4.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1eb53c83ab8b0a0302a6@syzkaller.appspotmail.com

null_blk: disk nullb1 created
================================================
WARNING: lock held when returning to user space!
syzkaller #0 Not tainted
------------------------------------------------
syz.0.452/6787 is leaving the kernel with locks still held!
locks held by syz.0.452/6787: 2, last CPU#0:
 #0: ffff88803652c190 (&q->q_usage_counter(io)#105){++++}-{0:0}, at: blk_mq_freeze_queue include/linux/blk-mq.h:956 [inline]
 #0: ffff88803652c190 (&q->q_usage_counter(io)#105){++++}-{0:0}, at: blk_throtl_init+0x27b/0x420 block/blk-throttle.c:1332
 #1: ffff88803652c1c8 (&q->q_usage_counter(queue)#88){+.+.}-{0:0}, at: blk_mq_freeze_queue include/linux/blk-mq.h:956 [inline]
 #1: ffff88803652c1c8 (&q->q_usage_counter(queue)#88){+.+.}-{0:0}, at: blk_throtl_init+0x27b/0x420 block/blk-throttle.c:1332


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
