Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6130E37419B
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 20:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788640416; cv=none; b=KcSG5fjOgHX3hg1T0BxfODQS1X/rcKYlctzGe2QGn4AnvGJYNWzYuFLV7K+hO8jrJIrPB1Mk4WgtFhPF7PSQ1EHUUf7zVurHcz1/53fwStqKp4B7oeTrie2QvBHcBo/886xB6UvJtamOXECOJv9FptHmTp5QuXE5BQnzCE9Z5i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788640416; c=relaxed/simple;
	bh=VEyTOk2wnJuWL/0aDXAN5YhjuaqFPCGeVVSL0O/+rwk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Guj8PGP25XoJz0WjLYx3RT60LMeESXFurwrSqckrhE/ECJresO3xQyngQpKYTIEulhrl14rN3svA/NHBKjn94rf1Rw+ExLfPBQSDvMatQFOyIX6B7X+9FRvjg+V0J8n8nO58Lq23ckO1QDVS9mtuLBOYR0HPXXtpou/wN+qm1l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b34c5c6de4so2586995eaf.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 13:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788640414; x=1789245214;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DaK/UszpBwoJ72t5z8E9yTVEpqhHUeXVcZVl5D5Td0o=;
        b=mP7PW6xHbR+tW5bfGCPVnarBbrjqVUGWsBYi0rz6Tgwm8wef7WnONL9zPL4HDi8OjM
         tQ3hmHAssn2952Dj6vSjjtU3eIAMcU74Tssp4v3toWblcsVEVvfqdp/nHe+KCM4jsY5v
         /hxjLHPNFYMYgpjcGOgGhUbGie56IqXu5l/zQ4EiOjAECiEx2FTj47m9GKV/jbKlL55R
         IMvmKfH0NynDoF+Rbg3Dpq7kI61uKjvy2Kh/9ig1UmGde5atGTgHjoBM3GyuetibpScO
         XYUtRJkBLdinZJgGMCaNuCWKi7YhAN+UBO7HUqc49N2ATqgBFAOUZ2bJN/Q5wS6bDxH+
         9HYg==
X-Forwarded-Encrypted: i=1; AKwUvByoX4AtZo7yNqGg85+oc4T6Y/rW/Ypd4eAetZZlDnRMYKq/lEgpYtWHcS/EvEk6/st9U8QWvI3w3mIn4+M=@vger.kernel.org
X-Gm-Message-State: AFuF++m/eoKMmTRbETO1k6+h5fUI8ZLSkjOe99xNGOdzztzgBTN+gtek
	TZYpsHXpjRcOLm8hTj66iFIOVWQGCM3XuHWa3L5Mj4TU31T1ndGWdzb6HOLDQ7p9TRMHorWa8kN
	SPRnI0nRzHEnG7LLy21kJrVqb8vmp2kHI5IQ/a4rQdwRd1nxUYut/fCxfaQ0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:82a:b0:6b3:4a99:bd87 with SMTP id
 006d021491bc7-6b6fd7ca02bmr8376303eaf.30.1788640414366; Sat, 05 Sep 2026
 13:33:34 -0700 (PDT)
Date: Sat, 05 Sep 2026 13:33:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9c7c9e.87c06881.102b7.0001.GAE@google.com>
Subject: [syzbot] Monthly block report (Sep 2026)
From: syzbot <syzbot+list6a51048a59f44a26a220@syzkaller.appspotmail.com>
To: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello block maintainers/developers,

This is a 31-day syzbot report for the block subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/block

During the period, 10 new issues were detected and 4 were fixed.
In total, 32 issues are still open and 118 have already been fixed.
There are also 30 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  1741    Yes   INFO: task hung in blkdev_fallocate
                   https://syzkaller.appspot.com/bug?extid=39b75c02b8be0a061bfc
<2>  87      No    INFO: task hung in read_cache_folio (6)
                   https://syzkaller.appspot.com/bug?extid=9db0864859224b833108
<3>  57      Yes   INFO: task hung in __rq_qos_throttle (2)
                   https://syzkaller.appspot.com/bug?extid=53706c567afab5131044
<4>  29      No    possible deadlock in blkcg_deactivate_policy (2)
                   https://syzkaller.appspot.com/bug?extid=14254d81dd19ba7d7e41
<5>  16      Yes   INFO: task hung in blkdev_read_iter
                   https://syzkaller.appspot.com/bug?extid=afa7aef0c237038586e7
<6>  11      No    BUG: unable to handle kernel paging request in blk_mq_complete_request_remote
                   https://syzkaller.appspot.com/bug?extid=2e3bf0bd49acd9b21d4b
<7>  1249    Yes   WARNING in blk_mq_free_tag_set
                   https://syzkaller.appspot.com/bug?extid=02b37e31e64ea5cb6d29
<8>  94      Yes   INFO: rcu detected stall in kjournald2 (2)
                   https://syzkaller.appspot.com/bug?extid=14c6ac6811273526cfa5
<9>  30      Yes   KASAN: slab-out-of-bounds Read in blk_mq_free_rqs
                   https://syzkaller.appspot.com/bug?extid=e90526cab23b9efcd03c
<10> 13      No    KASAN: slab-out-of-bounds Read in seq_buf_putmem
                   https://syzkaller.appspot.com/bug?extid=f179b16e13624138b0f1

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
