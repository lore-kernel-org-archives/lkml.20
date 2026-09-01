Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7746145D5C2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788294823; cv=none; b=DRX1l5TDEwynXwpeoitsK6GrHq33CKNiJeSQt63Qu0euajtxvs2PgW//vNTc/+PutIeM1Dgxc8VG3vG8F4ek/MdX/B9FdOr8Cau4+zeZDEKBQVK+pycFVp3nkE8+V03+B6Y/WOxpYEcnVcupSHbPZe9gA2bHAHRBf1HtbQFi42I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788294823; c=relaxed/simple;
	bh=YIYRgKhaWTAdVwoiQpEKf/jbAncBgJQxHoHwQlqMKzM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=HJir9HksMTBCO2WR4JSogimeqHMDRgyGSeGO1edIXZHh8WBoEWmtC+iUWYSdxuemh05XomMJvxrT9R+nBrE9um5/fc7DivzHnyfqGOIFcr0RIw827eC8ZEQbJPRXdhfyiiKQwbFbIF8JaqL1tw/UL6ZtPG+/7vpsvBi/fpNnkMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b28deb7ee3so381584b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788294821; x=1788899621;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oeVBmyUMEvxOlKf+fY9yPsfNQy9yuLRkEOc1khjK5pM=;
        b=kisPK74kgShMWTwkkvVkTn72ekquykBAja39j5MZuvw1HocjwDhLsQmGIcdkaqTG4U
         GVVeiiXh7ChlmBnPPMIWHE3FMfswVkQI4PqtUx/P7MQJjMNJrcRSR6ERdn/p7/Ocpkxh
         ywwj/Epq2XppqxjMlABDGiGwNDIrug1vkwiEGQGSKAOlr63ZE+/xkd2CBU7nEfZw6QMo
         le3dSbvOPhh79kqjVjX6KKu3vcFpJ3eSicE9QEJiZyYQIJjNZFdnEuQOpDfG4/0HkLSD
         OFJ6sdwr+eZbdX+NrTC1zdvf8OaC9n1X3WHyXb2Qki9qP9quWT3puiFAGghC1to3TcgK
         sk1Q==
X-Forwarded-Encrypted: i=1; AHgh+RrYWmuGnmt0Mroyo3xDBuavqRVKl5ZyQVz1WAbyP+0ov+1bnuP9jeT2KmRQBa0FFnfL8M9x3kxWF5hHNU4=@vger.kernel.org
X-Gm-Message-State: AFuF++n2OgL9ZOnJothCXkh4gyjjVZwraVuCcV19qbgHft6/RWteKxFF
	DCYGpCZhkK86HOCuj1Kt3wXbYDI9X5guI4cfgizTzo9UAIzUeLaAu3SFkIx7FTSxK8qxsJUKoVT
	TBlgR/1SsDfahgPAQvSd8IyvP4cQdNL5/b4SbD1AeiM7Ls24ug2GGtXtQMx8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:bc4:b0:4a4:c12:ee68 with SMTP id
 5614622812f47-4b5b8172009mr11585524b6e.10.1788294821342; Tue, 01 Sep 2026
 13:33:41 -0700 (PDT)
Date: Tue, 01 Sep 2026 13:33:41 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9736a5.e163c37b.143a1.0001.GAE@google.com>
Subject: [syzbot] Monthly kernfs report (Sep 2026)
From: syzbot <syzbot+list13c72f37136b099f0317@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello kernfs maintainers/developers,

This is a 31-day syzbot report for the kernfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/kernfs

During the period, 0 new issues were detected and 1 were fixed.
In total, 22 issues are still open and 31 have already been fixed.
There are also 10 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  1843    Yes   possible deadlock in kernfs_remove
                   https://syzkaller.appspot.com/bug?extid=2d7d0fbb5fb979113ff3
<2>  1490    No    possible deadlock in kernfs_remove_by_name_ns (2)
                   https://syzkaller.appspot.com/bug?extid=b50eba6bf6cd3f8ba7d0
<3>  237     No    possible deadlock in kernfs_fop_readdir
                   https://syzkaller.appspot.com/bug?extid=8fd10d8928ed1f715290
<4>  178     Yes   INFO: rcu detected stall in sys_unshare (9)
                   https://syzkaller.appspot.com/bug?extid=872bccd9a68c6ba47718
<5>  652     Yes   WARNING in kernfs_remove_by_name_ns (3)
                   https://syzkaller.appspot.com/bug?extid=93cbdd0ab421adc5275d
<6>  167     Yes   INFO: task hung in fdget_pos
                   https://syzkaller.appspot.com/bug?extid=0ee1ef35cf7e70ce55d7
<7>  104     Yes   INFO: task hung in kernfs_add_one
                   https://syzkaller.appspot.com/bug?extid=e4804edf2708e8b7d2a5
<8>  75      Yes   possible deadlock in kernfs_seq_start
                   https://syzkaller.appspot.com/bug?extid=4c493dcd5a68168a94b2
<9>  60      Yes   INFO: rcu detected stall in sys_readlink (5)
                   https://syzkaller.appspot.com/bug?extid=23e14ec82f3c8692eaa9
<10> 37      Yes   INFO: rcu detected stall in cleanup_net (8)
                   https://syzkaller.appspot.com/bug?extid=0604401cc084920f6c3d

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
