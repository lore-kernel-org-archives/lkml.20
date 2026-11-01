Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793492078;
	b=TYS5aeKwm4tsaX47FGjBhijSgUZzQkptvx6wkkSxPLvb0GfIhZaBNAqH5bWuwE8pchJS
	 TW4E7SoMuOZ59cupTsJD3xJecWsCUdv1QpzwZL99uOE/WFJkBB0bWJQdIetpmfhi3LC6w
	 59aL5X+bJ/0dcm+u1NSefDuFXic6KBvEWY2ZGmVgrlOeJ9M5q/+38oZwcRvYGTJYshJXS
	 00bISfdUgcHrIdMXXcyIVKQ77pSETMIf+RthOkaxE/wFsNlCpc0uYINj3n7/0KlsMZXW2
	 Qp+gdflwUf7oK/cfxFUmLnfJCYBhF+8Nf3Xw6SasKlDhZS/ERXPnR7wTG3uh2NPRqOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793492078;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=DuP6C47u0z0F/RUHjxsIFtc4MMzc8QPA8OI+YYw0yWE=;
	b=oARcgOog8/wlaGqjIVmfJfigXji62o96Flof9x0KtxuzMAJROjKimzKxSVEm8SGCC6A0
	 CzLTcPrPkalbWZr9UVZ/B3pgQiV23yc0imC6vR9W2HuCcq10sPu6VMDLHV8OlBd72zD8x
	 U2FnD9vGY76Rt6dgUyJdQcZBIVsrgT5YNsA2LDUT23ooYvAJPeaKtTBG6YzbIdNCJWnrX
	 yRU0awsQywIcE9qvhsPQbt8bO+OPxwQ13ma7peW63QmYz4WV0KwYKAfysQah+U5hP2IAY
	 mMRF/tdtpMQu8VbyvRyHiBaG8+jJv4KFnQgZyqQXKsB/3mpQks28Qkmc/slqiRrLNEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9E1606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 00:14:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA9E1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a7de733fa9so2946891b6e.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 17:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793492077; x=1794096877;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DuP6C47u0z0F/RUHjxsIFtc4MMzc8QPA8OI+YYw0yWE=;
        b=UQQbnQ2qjLM1izsiO6HoUG1gPqQIXeyhbfRdUtqNDpVxSobNngIdsh+ElEqZmupoC/
         2B8P/5qR7N27mLfxyopf+jHdkP2WRx0T5BkYofY/pbwMYuXdwtIEyZAM0tqd8D5jUvG9
         i5zpiyNZAYRHDlyvhHIBemjvNHPNJQvp9xIiItE0Uo6lmYAaQUbUDPJYblbwfK3pWh2H
         A05rWbWwOpkPyKOsM78tkXt09/PrNcW8I/GMNAfhApc8ko2Z/iKFFHcef/KQmTQiyBYv
         pwgpg4TIJVTqCse0woXce++HMl4RBH7Cg+zRH9XhJzi05aG76ABFH01lxGq0Aw1qD3QN
         sf6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzM79SIDR396s+zGoHvxOx3l8MiLhYhVuxO2RGwFWNLthTIH20SxvAbytqvVEY0Q9JliQLsZvZl4HL4cHc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaLNRHjPVCLjY249vghQvaFvYdS2ZEU/AVGuBqxT7avySNmC6p
	2iB8A7pbpg2anNd6QxrvcY/ZiV5BkzifqkDpNFkUMbGA+yot1f1JOUeO9oLXaFdLsFQmVnpc70q
	DWfP6ekITgy9dbwcIb9i2jgsWXrzLPA19O55IjXvKfuL6yuqOggbwck+/xpk=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:168c:b0:4c1:f40e:b697 with SMTP id
 5614622812f47-5640de8aaf5mr4227665b6e.38.1793492076829; Sat, 31 Oct 2026
 17:14:36 -0700 (PDT)
Date: Sat, 31 Oct 2026 17:14:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae6846c.64e51036.15cf6a.0003.GAE@google.com>
Subject: [syzbot] [block?] WARNING: lock held when returning to user space in elevator_change
From: syzbot <syzbot+48ca80a8587c1d97c433@syzkaller.appspotmail.com>
To: axboe@kernel.dk, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    151a134a4e6e Add linux-next specific files for 20261027
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=113ab295580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f530fbb08d65d27a
dashboard link: https://syzkaller.appspot.com/bug?extid=48ca80a8587c1d97c433
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1422b721580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c1d27f58c2b6/disk-151a134a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c2670074ce19/vmlinux-151a134a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1588f5d40496/bzImage-151a134a.xz

AI-generated root cause summary:
A race condition exists between concurrent DM_TABLE_LOAD and DM_DEV_REMOVE
operations on a device-mapper mapped device. In __dm_destroy(),
blk_mark_disk_dead() is invoked to mark the queue dying and start queue draining
before waiting for mapped_device holders to drain, allowing
blk_freeze_set_owner() to overwrite q->mq_freeze_queue_dying on the request
queue after another thread in table_load() freezes the queue via
elevator_change(). Consequently, blk_unfreeze_release_lock() observes
q->mq_freeze_queue_dying as true and skips releasing the lockdep map for
&q->q_usage_counter, triggering a lockdep warning upon returning to userspace.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=48ca80a8587c1d97c433

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+48ca80a8587c1d97c433@syzkaller.appspotmail.com

device-mapper: ioctl: device has been removed from the dev hash table.
================================================
WARNING: lock held when returning to user space!
syzkaller #0 Not tainted
------------------------------------------------
syz.1.593/7980 is leaving the kernel with locks still held!
locks held by syz.1.593/7980: 1, last CPU#1:
 #0: ffff888030823878 (&q->q_usage_counter(queue)#53){+.+.}-{0:0}, at: blk_mq_freeze_queue include/linux/blk-mq.h:953 [inline]
 #0: ffff888030823878 (&q->q_usage_counter(queue)#53){+.+.}-{0:0}, at: elevator_change+0x194/0x480 block/elevator.c:668


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
