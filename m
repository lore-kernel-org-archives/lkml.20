Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2021435E931
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 20:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790973215; cv=none; b=pY8vr//sQ9EC9pARbZu1BygwSiW91cJb5EgPluujrudSAPK8VMl2fGRRjQ7g7CTW+vvOK3HPmhCxGIp0Mnvs3JJarNnErqMozfRplIRT1+SXe+Bh3W9mqNGChMy+dJYWMIaBK3EUkdLnyNntQ1oSLpF4saVxS1WeH35a037SwrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790973215; c=relaxed/simple;
	bh=KE/MH5M0np6wNwywaAleqtnLPIXCCzbPkE60V4uuW7o=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=WXeureCQHV7Li8g9hi7KTP9Z13V+OSYjEsjhtAIjBss6MXb+TRVMWDtzlTPXJSR32jwOh71L5b9aj9MZGEvfFUfUQ73XbzAj7a2AIZKnPoSQAUNGDIkq5BkKp482XNUb9M/jIl3UlO73/eS+wB8EoLc5IcMwV7MxpmvvVRNI+lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ea4c979030so523161b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790973213; x=1791578013;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=svJVIDSgYOtlv7kd6fSF4YYJeM093KhLmii69D7JD0g=;
        b=rAYiy24lmQSnYU6UvCJsQPuHc0d4+FqakVOlMQYpHFz8onXnziebyL+qEqK6pMTo66
         JTxN9/KrdgCCbI8Ae0jeKc1Qua9AqBvJHcBuAjvd3Pll99UbPX0JOUawHwulGZtuyACz
         3AdYDtREDPta9rli90rVItyBjXPy7UUZ7mFwtwB1/vMjTDQ/HoJ3+XUWZSYq8nCiCzDV
         4lwcqj+0w4K055K7xmGws+PqtKnGVAtk0yo0tgUZ++Q6FCnrvRTF/jlVhQTHpEVCQ3NL
         iEv0ViJ5/WLEte0Hrp0VOoDZ1Uz8aDCIQPhuKHQbqdbaLBX2EwrXn3pZc+Jg2rt1OFgN
         sZ+Q==
X-Forwarded-Encrypted: i=1; AKwUvByAOtXOK8GXrR232qxuE8jDoRuAFFqIiqXFV78ZsUnLmpq4E0vGqwi33OnE3CE02MpnxudIYgQQu8AebkA=@vger.kernel.org
X-Gm-Message-State: AFuF++mTYuO9QexXhmh8yjA6D/qOx4Xc2c+TOD7SnWmi0A8UXhkwixqt
	yZtWhljbNGfa+JI7Ky0ZK9szxV2akAz4nFdPNYn/sooCIL11XOAtvyVDqrVSIbYj2GbGEo50XJ7
	lUTImFErB3uo5xbmwvQan2iiZnWHEZqncKA9jvQQg359VkpS706UeJSNOlk4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f02:b0:4e8:3707:d4cf with SMTP id
 5614622812f47-4f52376b295mr3626605b6e.0.1790973213138; Fri, 02 Oct 2026
 13:33:33 -0700 (PDT)
Date: Fri, 02 Oct 2026 13:33:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac0151d.34119e79.2f92f3.0005.GAE@google.com>
Subject: [syzbot] Monthly kernfs report (Oct 2026)
From: syzbot <syzbot+list97c89c631358cb2020f2@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello kernfs maintainers/developers,

This is a 31-day syzbot report for the kernfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/kernfs

During the period, 0 new issues were detected and 0 were fixed.
In total, 25 issues are still open and 31 have already been fixed.
There are also 11 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 3207    No    possible deadlock in kernfs_remove_by_name_ns (2)
                  https://syzkaller.appspot.com/bug?extid=b50eba6bf6cd3f8ba7d0
<2> 2048    Yes   possible deadlock in kernfs_remove
                  https://syzkaller.appspot.com/bug?extid=2d7d0fbb5fb979113ff3
<3> 241     No    possible deadlock in kernfs_fop_readdir
                  https://syzkaller.appspot.com/bug?extid=8fd10d8928ed1f715290
<4> 32      No    possible deadlock in kernfs_add_one
                  https://syzkaller.appspot.com/bug?extid=f50d605480fdec503770
<5> 18      Yes   INFO: rcu detected stall in kernfs_fop_open (7)
                  https://syzkaller.appspot.com/bug?extid=19d01f6082ec61dd45b2
<6> 676     Yes   WARNING in kernfs_remove_by_name_ns (3)
                  https://syzkaller.appspot.com/bug?extid=93cbdd0ab421adc5275d
<7> 182     Yes   INFO: task hung in fdget_pos
                  https://syzkaller.appspot.com/bug?extid=0ee1ef35cf7e70ce55d7
<8> 64      Yes   INFO: rcu detected stall in sys_readlink (5)
                  https://syzkaller.appspot.com/bug?extid=23e14ec82f3c8692eaa9
<9> 2       Yes   INFO: rcu detected stall in kernfs_fop_release (3)
                  https://syzkaller.appspot.com/bug?extid=087d9dac1f398074ca9f

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
