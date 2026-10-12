Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26D148A8C6
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808421; cv=none; b=HrLsUTRhCnnLf9SqDOdPYa8BTd7zq4gDpWFPlMyBEvuSmksPf7j1otywdAsX+m5u1odinqquOB+z8lO+iK7qWyHEPMXpLqu0ghH8l/UuxFD91NFqBTBOSLh3T/YBQGlESw/5Nnnd58I+OPexTZ2AhveYTM0G9uDYck6CjURuEAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808421; c=relaxed/simple;
	bh=2VPiXw1q3kR54sFKHzIp1fFBiFplG0qbis1UdmRy8ow=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=IRYWMooJR9mmxC6SL8BMKYMhEl/Qew5TlfgkTJlsbcfK52roLaNgdO1KpyhQaRDePaD8u43S7n/malxV3PlQiZXhfX7xg4m9LxYv2Z/C/K5iRZXBLLu/UUhbYeADp4lx3j+CROaujSQOW1VdUP/i6ZxPx2H29Hg2Q/yxRNY1xfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4cc89e86e9eso2742130b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808419; x=1792413219;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZkkVxmXihGSE9ad18xf43HJ5yD+WjmR37orxM5dMJfg=;
        b=E9/s+mRcaAfhQcjewG8Gmf2Ey/7PtC8Gan+FXnjHp5vh4srH9fjTkYKiYDe7Ia454x
         l+oKmYUCsXY9GD6Aq1RM8H+RWipcaExLEzdejc2Qb3EQh69U0qVGBPKfqbtJw/po6WVa
         CDoryckxoZlIecX6NYaKgu/ry8LiQXRG981wEp4cVbh1WqgNqptQBl62BKCs1YvVfl2i
         Ts3pYluJvkSJdWZocpxycjbU6qOs5GAPhfLujzKRKBa4767SyrrmgPpyP4t2UO0jOwY6
         IfTrB02rRBA1KClOM1ICAPDUmhdJM2Hvy0VSJPj4J5WeM0NdgUzUCzLWIuSSM3ALBE+l
         vhXA==
X-Forwarded-Encrypted: i=1; AKwUvBz6/BuAP3r4S+vYx69IDcwZAzgufw95AHo1mbduAgvQ2PZofHqI84dXt8CA6deJYytTGeNbdfyVrk/fBKc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/ofqtgW5bp2HJrNLeYDRknAW5rn61MD26NXIMYtLGM1de7f5B
	QalhWxAiKPZ8tT1b5FaX9rQL4zaKehtrJnD7vQZvIccQXFpTQrMrt3mkaKDJRfBMy8IisY2k+I6
	/EMvvotvSlGbU5yudInmg0sAYEKAGgolsnQlOxbjT4OOzjsMn1mLHgC+jtkQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f8d:b0:4f4:f3c1:72c7 with SMTP id
 5614622812f47-50c58042ff6mr7524732b6e.61.1791808418853; Mon, 12 Oct 2026
 05:33:38 -0700 (PDT)
Date: Mon, 12 Oct 2026 05:33:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6accd3a2.0e5b5d80.2c029c.0575.GAE@google.com>
Subject: [syzbot] Monthly fs report (Oct 2026)
From: syzbot <syzbot+list927011c44246282e30bf@syzkaller.appspotmail.com>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello fs maintainers/developers,

This is a 31-day syzbot report for the fs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/fs

During the period, 2 new issues were detected and 1 were fixed.
In total, 46 issues are still open and 645 have already been fixed.
There are also 31 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  11432   Yes   KASAN: use-after-free Read in hpfs_get_ea
                   https://syzkaller.appspot.com/bug?extid=fa88eb476e42878f2844
<2>  8798    Yes   INFO: task hung in __iterate_supers
                   https://syzkaller.appspot.com/bug?extid=b10aefdd9ef275e9368d
<3>  2037    Yes   INFO: task hung in user_get_super (2)
                   https://syzkaller.appspot.com/bug?extid=ba09f4a317431df6cddf
<4>  2004    Yes   INFO: task hung in lookup_slow (3)
                   https://syzkaller.appspot.com/bug?extid=7cfc6a4f6b025f710423
<5>  79      Yes   UBSAN: shift-out-of-bounds in befs_check_sb
                   https://syzkaller.appspot.com/bug?extid=fc26c366038b54261e53
<6>  28      Yes   KASAN: slab-use-after-free Read in lockref_get (2)
                   https://syzkaller.appspot.com/bug?extid=227dbc9afd022922d624
<7>  24      Yes   INFO: task hung in writeback_iter (3)
                   https://syzkaller.appspot.com/bug?extid=1e3ff4b07c16ca0f6fe2
<8>  9       Yes   INFO: rcu detected stall in kswapd (4)
                   https://syzkaller.appspot.com/bug?extid=f886305df0acc6fa097a
<9>  5       No    possible deadlock in uvcg_format_bma_controls_store
                   https://syzkaller.appspot.com/bug?extid=50560f9ba016e97e2023
<10> 43      Yes   KASAN: slab-use-after-free Read in filp_flush
                   https://syzkaller.appspot.com/bug?extid=df868600fe111c5ff79f

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
