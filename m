Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48092EF653
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 20:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791318812; cv=none; b=hlAgbNenEHuvLawO63NTOCgQNKHjnzWnNv1zbUG9wFLvC0TDNE43r8CyKEc06Y7I+o74b1be0LMCx396b5Z+FKQFYJdvnrY5pkZcz/XT6KyDNcbSN6iBnB3y9+oJyGxgtMnG2OzFoo1gLu4HsgpQ5XDTwoOkOx3eepc/cNEmKTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791318812; c=relaxed/simple;
	bh=qi1LRU5YBq+7DHQZcDM5R+WbyGVSyvY4zL7bGgrD/T0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=jVPIKWRrjqGM2fCEsSNoA+HDlvp/v1OHmr8hKuI8H6rjW61jmdax7+xTiVuTUi6+vvjHfFDywmpNuc3FvOgkZIO3JYj7X8RoCP+zbH4HAh6VtyBSsTxA81s7f/6bH3NkrN9+Jnr+uGLk0lARoI0feR+R+/M/pNl+9H6MAv+53zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-823b717034dso4677611a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 13:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318809; x=1791923609;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bEiv9FmNjfte+qMUNS6gqynthoGLCc8MNAJTrEvbY2Y=;
        b=Q5mk4ytgZbZCWuLmxlu4e2U+dj+qaXo8rqSNJwld9uwhU5LTr+YdFxwperl/Lv79el
         KbscMxh/njxX7wmcL/b5hFJg6Q4opTWt3L9sMogZyqCMGUh//BLqOeDP5nccwLJ0EMyx
         v2RQH3UyeFwakjIxrfS8O+twjjUmyhKxJtZpYWY+dTeO51AxQfdvELvhcU/rBIZKhDH3
         0ziZO5kDgzO8DwJ9x2v1FXJlFSYLW11GU+lKJEvndI25K7zxIp1F326Cs7uUGhmsiROg
         txLFimmdj0Z+QMKx1PMH2G2EBF2c5GTbVi4upERn7tXQGdqBCPbk6vk0+5ns18VfxnbQ
         18cg==
X-Forwarded-Encrypted: i=1; AKwUvBy9U0X04J3bt5jeFJdU6DS9M7dYgK01hDC0G9NhOm2dAPPZgFpWmQ2nyu7oJFZVJhAaBW+6flvieMQcDBg=@vger.kernel.org
X-Gm-Message-State: AFuF++nSK+B0aK+npdK+KMRl6tIo1C6YfpbJEjArC9rTNr+osa1LB0fs
	UiQ3b8MvwPd1gGMhyVOBA3TvGb6+DpRZjINFzvFg3duyqscX9c/R2pWhyIrJWixuWHtbgjNX6KW
	Oe7EFEnEvDfAqo4o4v/70jc1QBmFjj7oPFg4EKTfsTL2l+aBdmVQEQkyjeJY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c3ee:b0:4fb:a089:bf26 with SMTP id
 5614622812f47-4fc483da4d3mr363014b6e.56.1791318809646; Tue, 06 Oct 2026
 13:33:29 -0700 (PDT)
Date: Tue, 06 Oct 2026 13:33:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac55b19.fe639fcc.32b100.000a.GAE@google.com>
Subject: [syzbot] Monthly block report (Oct 2026)
From: syzbot <syzbot+listef51fe61e4284ca4e920@syzkaller.appspotmail.com>
To: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello block maintainers/developers,

This is a 31-day syzbot report for the block subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/block

During the period, 0 new issues were detected and 0 were fixed.
In total, 32 issues are still open and 119 have already been fixed.
There are also 32 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  1744    Yes   INFO: task hung in blkdev_fallocate
                   https://syzkaller.appspot.com/bug?extid=39b75c02b8be0a061bfc
<2>  1435    Yes   possible deadlock in blkg_conf_prep
                   https://syzkaller.appspot.com/bug?extid=144a1c0e22e53a08ef5a
<3>  220     Yes   INFO: task hung in __rq_qos_throttle (2)
                   https://syzkaller.appspot.com/bug?extid=53706c567afab5131044
<4>  141     No    INFO: task hung in read_cache_folio (6)
                   https://syzkaller.appspot.com/bug?extid=9db0864859224b833108
<5>  46      No    BUG: unable to handle kernel paging request in blk_mq_complete_request_remote
                   https://syzkaller.appspot.com/bug?extid=2e3bf0bd49acd9b21d4b
<6>  22      Yes   BUG: corrupted list in blk_mq_request_bypass_insert
                   https://syzkaller.appspot.com/bug?extid=f4353e96f7004ae5a09e
<7>  21      No    WARNING in blk_mq_alloc_tag_set
                   https://syzkaller.appspot.com/bug?extid=18431bc7dccedc61778f
<8>  21      No    WARNING in blk_mq_dispatch_rq_list
                   https://syzkaller.appspot.com/bug?extid=49b69d460fb5134ee1d7
<9>  19      No    BUG: unable to handle kernel paging request in __blk_mq_alloc_driver_tag
                   https://syzkaller.appspot.com/bug?extid=b380cbb218c1ef0fe808
<10> 34      Yes   KASAN: slab-out-of-bounds Read in blk_mq_free_rqs
                   https://syzkaller.appspot.com/bug?extid=e90526cab23b9efcd03c

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
