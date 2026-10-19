Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEA8497B7C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399445; cv=none; b=i60zktWqsoU9cw+nkpvSBHafwkBFKl9/eVI3q6el01ytGowbrj9dUuNGZ1rZajwt4hQwpz7dqiM9Mxx8x/gQ9ZhhXvLk95urx0d3NCU0CDl1IODpRrCfWVvWGL8+8mlZSHLlU6Nun1LEBKJP9bV7HkN8r7MKDmypGiE7uM2cPMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399445; c=relaxed/simple;
	bh=mKW/5WFafnSCxCWOxMNDUMe+POzWRfOIpZ/uReCQNss=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Mo/NbsejBxmVOnG0tzD4D5P7kByIxmD4tQzEkKsfd4tITxNCfu0VpgY1v7BZw/m6k2hv9hq0MdyHZxpLgCNYT7945lfqHiukRVF9RWu+xJZR1Rq8tGfgw+JpylZiuKsdEpYT0y84rnNR3TCKj5qVIQbNY8jNBuRRPKHegk+7aCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4eb0b989f0eso3409106b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792399443; x=1793004243;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H3pELg/uw04yTBk+yNKqmmVEkyARW2v3iZdNTwM6vyw=;
        b=GCtdQIZSGN0H9wWzWrYGksObGqENofE2CdOJkldtgaAUhBkmfpfhgZEYLtEFJ/ca1M
         aC1pggEnUpnVdGZwv0i5sxHwG4BlE/bUodJGvwK4JyfCUD6GxJxM6mpzMglFsbohJkPE
         jFsoGdo/qGgcgSsso7Q3K23KJSZNx3DmkXSD9CZ1kf4OPHLolE7Y+yE4NBKSmZE2Tljz
         u6mAX30myZgB1yGMGud8BGoSUvvfeUF9nczITkCa1H/WldhihMBp5PaFaaYeI/GUf+J2
         wXcqvdc0cxoPOiMaLb/wMIO5+rWc6Q/ypp14lN+rkoZMqBXSzroFBJ6dxlDBug2GaqN4
         A0wQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9jjeSTZIhm1+ol1Z/Bu0hW8C+V4YqgDDVG4ziBlOkwn2r1VfimRmWXzxMrRdinmyXY2Zu8LihjMXjaxY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKn1IlcTfkVbeJho8NxrPWhaJc4BOGc08zy03kKA4LhffX5ZC4S
	hIxxLu2NBV3EXT90PhyO3BDFSxH8Q1WDjD4rh86nE4kUjUs+FWdJ0JCn4c3M8a8+MzO6adWjUZ/
	3yU9FEWFP0IpzFOhVqFswPpsTECkyRcp+rZo5WJ5762pJ7u1S/xBUll0CSy8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:e84:b0:4d6:9133:cfe0 with SMTP id
 5614622812f47-53700bf0222mr6161117b6e.37.1792399443094; Mon, 19 Oct 2026
 01:44:03 -0700 (PDT)
Date: Mon, 19 Oct 2026 01:44:03 -0700
In-Reply-To: <20261019074123.5048-1-eklavyasingh2106@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad5d853.7f4e89eb.3d59aa.00be.GAE@google.com>
Subject: Re: [syzbot] [ocfs2?] KASAN: null-ptr-deref Write in fput
From: syzbot <syzbot+5d4e96acd0febccb5e87@syzkaller.appspotmail.com>
To: eklavyasingh2106@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+5d4e96acd0febccb5e87@syzkaller.appspotmail.com
Tested-by: syzbot+5d4e96acd0febccb5e87@syzkaller.appspotmail.com

Tested on:

commit:         c27d46b3 ocfs2/heartbeat: serialize concurrent writes ..
git tree:       https://github.com/eklavya072/linux.git ocfs2-hb-dev-race-v2
console output: https://syzkaller.appspot.com/x/log.txt?x=129d8f01580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e4870cbb323b955d
dashboard link: https://syzkaller.appspot.com/bug?extid=5d4e96acd0febccb5e87
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
