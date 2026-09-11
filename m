Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34E1476064
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789130014; cv=none; b=pdItumPp3bpfyYsWJmES/V+m05c9tHFUGyqdFliNPewAc1jSEom42/uKlOGSSKrkMM6p3FHLQdvVS9wT3EA+c75LqVqA8TAyXeppyOGPY5qkhDboZa7JWjWfNPa+bsDwLDNRKTNBa1Fh5x4UvfcVNxKS7c4kNEbE4EXga7hBcOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789130014; c=relaxed/simple;
	bh=Yuz5L7e5NkvWbA0ATJ/mkkGYozizg7NYLQ2XtBmH/Xk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Jh5fLaD5Rh4PFT1o4d6Sscqpky75D7rITmKwad03RpUYKszjN2FYrdh92wCCuK3CdHxfP3sHnS6oHm+ypTJQeJD+XoMY/zozWJuODSDGytJycBz/MvcwDLn2I9S5l3gXR5DhATdi0+qctLz+kJRC2Q0c+QeqxJxIJ8GOA1s6lgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6bdc0e8af81so810794eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789130008; x=1789734808;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1x2q4dn+cMVLp+9PDO0kgzLAyr/7wEbtWldTSqUF0L0=;
        b=V06Hhn5X0WOmGw7U9Z6YR+8yYmvaX+QcehmE1vz6W+P/pvKX5Nm6yf3T3QZDSZ5HPr
         DEJplNLgebo+c2CxewbVemLH62WeuX9zSxag9B/Ahz37KbO8+zaZvoS2i4dBInD+7st+
         68NKr4+cLXnjbUmz572AB3Wq9+7b8R5k9z4w7MAHgUB2bx1KchDRkVWitP7aT6LWuUNi
         ZkwhWGImYeOUbYbv5hFIndcQ+kM0lT6nvriACuEySlMfwC3mMmbz/QB7JUyvA4Y3mKin
         sil9CHJ3HiwvRiB9AAoC0WKBKaFGV69d8VTu/3sxjtpx/cLLQYFUBSozOX+3rPEEKK3H
         OjKA==
X-Forwarded-Encrypted: i=1; AKwUvBxlEd/5J1HtQ8Y+wI/r6XgGmSiSYouy7J7n7vWD7RCEJG2KSnSOOQZGczFpi9uHlCz6SWV5S/I9KMAxADg=@vger.kernel.org
X-Gm-Message-State: AFuF++nUcv5kEzuWQs245x7GTPrYZqrnucJ9oyP3k4CrSgrvYy55pfbZ
	O8FiOsE6t4AjmcIXzvkqnh+rDCnaWt/hy7eE0OnsPd5wJGn1njBWInu2NPBNRfOEA6o0MqG/Dkh
	hi/feXzlh7FV4LNyU6R40loA/ls5q5j/DTGIFRCbg9FWiij7dH/akOUEyDfI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:273:b0:6b8:ce67:77d5 with SMTP id
 006d021491bc7-6c0bae0b068mr4556925eaf.13.1789130008502; Fri, 11 Sep 2026
 05:33:28 -0700 (PDT)
Date: Fri, 11 Sep 2026 05:33:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa3f518.f2639fcc.29487d.002b.GAE@google.com>
Subject: [syzbot] Monthly ocfs2 report (Sep 2026)
From: syzbot <syzbot+list23d4f5ba12358c4333ba@syzkaller.appspotmail.com>
To: jlbec@evilplan.org, joseph.qi@linux.alibaba.com, 
	linux-kernel@vger.kernel.org, mark@fasheh.com, ocfs2-devel@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ocfs2 maintainers/developers,

This is a 31-day syzbot report for the ocfs2 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ocfs2

During the period, 1 new issues were detected and 0 were fixed.
In total, 34 issues are still open and 58 have already been fixed.
There are also 4 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  433239  Yes   possible deadlock in ocfs2_try_remove_refcount_tree
                   https://syzkaller.appspot.com/bug?extid=1fed2de07d8e11a3ec1b
<2>  49814   Yes   possible deadlock in ocfs2_reserve_suballoc_bits
                   https://syzkaller.appspot.com/bug?extid=5d516fba7bc3c966c9a9
<3>  20057   Yes   possible deadlock in ocfs2_setattr
                   https://syzkaller.appspot.com/bug?extid=d78497256d53041ee229
<4>  9371    No    possible deadlock in ocfs2_xattr_set
                   https://syzkaller.appspot.com/bug?extid=ba9a789bd1f4d21fcefe
<5>  6281    Yes   kernel BUG in ocfs2_write_cluster_by_desc
                   https://syzkaller.appspot.com/bug?extid=18a87160c7d64ba2e2f6
<6>  537     Yes   kernel BUG in ocfs2_reserve_suballoc_bits
                   https://syzkaller.appspot.com/bug?extid=fd05de09d1267725aa95
<7>  451     Yes   kernel BUG in ocfs2_dio_wr_get_block
                   https://syzkaller.appspot.com/bug?extid=f8b081be889b639423bb
<8>  27181   Yes   possible deadlock in ocfs2_reserve_local_alloc_bits
                   https://syzkaller.appspot.com/bug?extid=843fa26882088a9ee7e3
<9>  2714    Yes   INFO: trying to register non-static key in ocfs2_dlm_shutdown
                   https://syzkaller.appspot.com/bug?extid=d7935821694d430624ea
<10> 2028    Yes   kernel BUG in ocfs2_iget
                   https://syzkaller.appspot.com/bug?extid=5bdd4953bc58c8fbd6eb

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
