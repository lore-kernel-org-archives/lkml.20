Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30393A0EB8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 20:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788554030; cv=none; b=fgx2BNEjocCuy1pHHk+RnIJP7czp6y05EnXJ5oS2i0CcLmpzX6q+z2bigh6kZreXv3DDJYq/bI9cHVjP3OxkLx5Po0hy01ehiDEf+opffeRNJ/7PohfJbeZVGFPtbzgNb4NIbUmzLrwFZyF+bUGQ8kECoW5qZeJaP7NAPu6eXY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788554030; c=relaxed/simple;
	bh=WWpnEqPnpbR/yuawFiBdEyhlCxR0V0JrLt7mt62L9fk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Y79+px5qNWXw/6nEzT0HIp2Gj3jEnd6PtRadGL3PsW+pXgQBOseRztiwm7aWS7n5IfqdrPsAhePSvIyxry15RLGvRv5gXLf4jOb964vyhZpK0Qx0zuij90eDjumBtMO58ORHA7o/8mz+uMse2VO001E7gxKTqXnDZg96/pDa9FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b352d9062fso1921539eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 13:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788554019; x=1789158819;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WCIRxMwU7FkF5NClnWliGt7Fjn0PVFIZ1AwuQ3Y3wP4=;
        b=gYY810wsZEms8NYqDxmt/jQjMfGtA2lJ2nMLQnydP/oGuo/69Dx+cuKzQupGG3B92T
         gwp6+rHWjLYwSZd+WZasvUzUf9G/bxYwSpoZzEVdNlVu/sQnBNyRqtPZAzlfXBjXBhXS
         5nFRApXNe4gh1t0IaAQDk0Mo7v43S0czMDU9jXFpebSJf6yXIppngbk/PiT0c1UHmd5z
         9CDF7xNh2+pRHhUOby6it2bJQ3sllDzeqyVimdj5sYWcg08m3yeOvTGcrEZR9V4nBeK6
         t2O/h4uIHgdNsRYNBef1HP6TgWmb2+IXPn9DttLJwgZ1A/eGbATwewbqISA7PSpOW/V7
         tPMg==
X-Forwarded-Encrypted: i=1; AKwUvBwCiMIJUjf53oZUtRp4X21rDWHHW19lniycn2Epdvab4Yk4+Ytwm5lJSQuhPeBb9le+6xfhg7IzTHxAjKY=@vger.kernel.org
X-Gm-Message-State: AFuF++l8LdQZjlBKYYtsWKB+ONc6Xp/rpXre44wcq8/FWuayX3gEc2El
	pD6Jf5LL+o3/r2ANgG9HuXrEPZkr9Auc0UiaD3eggF7VAzXMLDdsJ/XTAj5I8yshHAJbo833uiX
	TvK3bofWYSuVqtUUBoPUq6drUuC9xtbsdcRIRTjyWvASpH/1jQd3W9qORQBA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4cc8:b0:6aa:de29:651 with SMTP id
 006d021491bc7-6b6fbcd091cmr6577744eaf.16.1788554019269; Fri, 04 Sep 2026
 13:33:39 -0700 (PDT)
Date: Fri, 04 Sep 2026 13:33:39 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9b2b23.b5d4176b.238c3e.0005.GAE@google.com>
Subject: [syzbot] Monthly btrfs report (Sep 2026)
From: syzbot <syzbot+list28cec74617be14fd94e2@syzkaller.appspotmail.com>
To: clm@fb.com, dsterba@suse.com, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello btrfs maintainers/developers,

This is a 31-day syzbot report for the btrfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/btrfs

During the period, 8 new issues were detected and 0 were fixed.
In total, 30 issues are still open and 121 have already been fixed.
There are also 12 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  198     Yes   WARNING in btrfs_run_delayed_refs (2)
                   https://syzkaller.appspot.com/bug?extid=810ea5febd3b79bdd384
<2>  78      Yes   WARNING in btrfs_destroy_inode (3)
                   https://syzkaller.appspot.com/bug?extid=25df068cd8509f8c0fe1
<3>  71      No    possible deadlock in btrfs_dirty_inode (2)
                   https://syzkaller.appspot.com/bug?extid=415a049af48761105c01
<4>  15      No    WARNING in __add_block_group_free_space
                   https://syzkaller.appspot.com/bug?extid=6931616d57696102d8aa
<5>  15      No    WARNING in __btrfs_update_delayed_inode (4)
                   https://syzkaller.appspot.com/bug?extid=768687d6d7c96a124e24
<6>  13      No    WARNING in btrfs_create_new_inode (3)
                   https://syzkaller.appspot.com/bug?extid=c1b8c52e6c0142c5e448
<7>  1105    Yes   WARNING in btrfs_chunk_alloc
                   https://syzkaller.appspot.com/bug?extid=e8e56d5d31d38b5b47e7
<8>  511     Yes   WARNING in btrfs_remove_chunk
                   https://syzkaller.appspot.com/bug?extid=e8582cc16881ec70a430
<9>  52      Yes   WARNING in btrfs_finish_one_ordered
                   https://syzkaller.appspot.com/bug?extid=6e54e639e7b934d64304
<10> 47      Yes   WARNING in btrfs_init_new_device
                   https://syzkaller.appspot.com/bug?extid=3bf3e110b2d406b8166c

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
