Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F11472065
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790339620; cv=none; b=NrMbDmk7dNxkG001ZAb+KOkVtXA0VpBGkaXUcqJtHTCmUTZYJv7VvBxO9OH+79TWIptzLBG+ou1HPVF3g37sxBZo9Gcx/HaEl6AEHX7ormWejDoo4sMcur+0gvF7WcFsfBJYmYzUnnsFXKviN70oRRDiiOMF5lV1sQMeMGFWPME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790339620; c=relaxed/simple;
	bh=Olll5538sssrk68cKb+6lh5JqkNnLGdUBWebScXwjb8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=mDBtiMmwZghubgUxgCIQR67gw+XXf/rWdXNSy5DBvs+fQNXuG7csqCaFv5bQFu12F7Qci3KIvEIPTUA8ht9n6WIWNXLJ1dAx0jX946Qtd9mqFzCsEnRcmX5O+y9mqc9rWCjSrErPd2EdwBC0LqBA0teeMGzOxm1VIIvc4+UruIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c9ade8cfe1so2486397b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790339618; x=1790944418;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3tGsQcEo2L+rh2VXZGGUz0I7c7yOYimMqn0H8hByYtU=;
        b=2Wr23XXVbf+IhlxTfblrYLIfdljqFaZiXj8+7mjX0VdsrbeB6XVZza70fFYohSs328
         754EQogi+iTkybwEUIGdwtQrV+jitL5dblc/t8Qt4JRGocEdJRnebXULEY/mrjXPvUwb
         Zu8xiHhVntTww/Q3bkGpK7T/pxFUMwsgKe3NsZjVxo9DhPyhgwa/5LH/nZDgHxVOy2SB
         NLkkFvAEUB0l/MW8jvgs5oaJPsUh779/zddSdeaPreLrcQnFGwdVU8twmTzpwuWZ94cT
         3jvh5WtmrG0eJ/7rxRrIH4ykkZINjzLvWeXBsWGvihhFv7mY/ULWz4SCD6fwwpIe49uI
         ugbA==
X-Gm-Message-State: AFuF++nXF/xb60cGzv8CGyxde8MD98Tmhau1gK2tbwJ49sRAAlriz544
	Vqr0PfTOahulatEWZj1FqnzVFfIIMk/40w5j9u2XIWdhQwC56dNRj0dY0qNTJ0wV0tDqu2b7Hm1
	SxMNxetk+Pc9ZygKIYgKtWKsFLh1nokgSkYBnKx3rPvmox5Gfx1Xqs2ihIOc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6809:3cb:10b0:4dd:f8bb:e1bd with SMTP id
 5614622812f47-4ddf9083167mr694918b6e.13.1790339618117; Fri, 25 Sep 2026
 05:33:38 -0700 (PDT)
Date: Fri, 25 Sep 2026 05:33:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab66a22.80e1c6cc.1e8e5f.0031.GAE@google.com>
Subject: [syzbot] Monthly mm report (Sep 2026)
From: syzbot <syzbot+list9522b235663d5a4f6672@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello mm maintainers/developers,

This is a 31-day syzbot report for the mm subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/mm

During the period, 2 new issues were detected and 1 were fixed.
In total, 76 issues are still open and 382 have already been fixed.
There are also 39 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  3955    Yes   WARNING in trace_suspend_resume
                   https://syzkaller.appspot.com/bug?extid=99d4fec338b62b703891
<2>  3805    Yes   possible deadlock in attr_data_get_block (2)
                   https://syzkaller.appspot.com/bug?extid=262a71e9d2faf8747085
<3>  3136    Yes   possible deadlock in filemap_fault
                   https://syzkaller.appspot.com/bug?extid=7736960b837908f3a81d
<4>  638     Yes   INFO: rcu detected stall in sys_newfstatat (4)
                   https://syzkaller.appspot.com/bug?extid=1c02a56102605204445c
<5>  528     Yes   kernel BUG in filemap_unaccount_folio
                   https://syzkaller.appspot.com/bug?extid=17a207d226b8a5fb0fd9
<6>  329     No    kernel BUG in __page_table_check_zero (3)
                   https://syzkaller.appspot.com/bug?extid=2b5fe617654be3d8848b
<7>  308     No    INFO: task hung in migrate_pages_batch (4)
                   https://syzkaller.appspot.com/bug?extid=f523acb98cd782b4872e
<8>  185     Yes   INFO: rcu detected stall in sys_unshare (9)
                   https://syzkaller.appspot.com/bug?extid=872bccd9a68c6ba47718
<9>  166     Yes   WARNING in ext4_mb_load_buddy_gfp
                   https://syzkaller.appspot.com/bug?extid=fd3f70a4509fca8c265d
<10> 115     Yes   INFO: rcu detected stall in sys_setsockopt (4)
                   https://syzkaller.appspot.com/bug?extid=6e61d59e9d2150c8492b

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
