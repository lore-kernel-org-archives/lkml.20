Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB302DCF46
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792025884; cv=none; b=XTvIhiie2J3Asi8D8qv1+zuVUtxo6GdnOTOjBrNcMTCjzFMJxxzx+iW00ZLXhFTg1pmFOSlYOrtw95OWSRLsH4eRs7gPfKOUJrHUAu2twX+6Rxyt/JTxTIfg3Ngv3iQjJR/TvDPmFwuyh1EpwKPcQ2lCkqiG1ly79aMPzC+eq8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792025884; c=relaxed/simple;
	bh=+bIo9cJqounn5tFWO+AlXDj10n+Ru2lW6w5VCXCaQQk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=dnWGXU8iSGVBg0yhahJ/0OlQ6yjXgsfFE64WcZ6H7w5ZLJurMsOrCnGzvudY67I2vmhg68/GmlpURXidT69w0AL3V1IkA5Yr9Kdnio8GQYr6wbI+PypVKJUjBzQuK/SySxss1DbSfdxdPp5Xt8A25EimFBB7GC+m+tDBpjIvlnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4a41f46d629so1779304b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792025882; x=1792630682;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cc7DalWNCMk8aoTJaj4heqsGM0iGv+AJvAgY3BsSA4w=;
        b=bjarjWLxcu8Jx3laXd9u4+Tzlc6sinODUSsUhceSIqKt/UK6RFpndT1xcMrM5eoRxA
         RjUu8/pL4sReHBTRtSbh7vrjp6f3/whS5N5VF/PJz00F2BbNzEbef6V52y0GTBWAqZLi
         AhOwB60RezHBXQ28Zvo5YR8bEqaq4KhAIx0WDmO8U9VFnlCbxb84zz07UdpEj5gbQViR
         ujfm+9IP58vEx6TbV+LPrPzQvFs04OS6kO+Q4EIaJ+jtGW5czIPgU77BnufMZ8dnsb8f
         MRQ1EqQ9bPFP8TZHH22xjPiwC7YI79Mhzux/gkeryxbMshnruwHx0BAFGZenI3IXDLIw
         M0qA==
X-Forwarded-Encrypted: i=1; AKwUvBx5x0Z1xPzrzkb+YeorGeCD0VMuKcCw1ufW3COMjVIdyWi9AJtouCN+dt3+rROHTZ/jtpJOZ+44XeUGC9A=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8a23+v5MVzqJek8RQ6wJpgbKxNkLVlIPg2lNljtjGZnbxrexY
	RB4MbxXww94EOxJ8pSQeQflgzZDIxaoRBt5PZZqVOWeThj8MiO8BbCn7aksf9VZsiIkriPUXnVe
	aEGfKkgMjQwL4Tt9q33SGcXvlAVY9h9ZQ5g0Q0yc+6gmrEUikyBw+KmPpdO8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:338a:b0:4f7:1e2:e79d with SMTP id
 5614622812f47-50c56354c5bmr15028368b6e.40.1792025882366; Wed, 14 Oct 2026
 17:58:02 -0700 (PDT)
Date: Wed, 14 Oct 2026 17:58:02 -0700
In-Reply-To: <20261015003852.532-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad0251a.5f317f00.247b6.005c.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in mesh_send_sync
From: syzbot <syzbot+f20755f37da70df33a16@syzkaller.appspotmail.com>
To: hdanton@sina.com, igorpetindev@gmail.com, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, luiz.dentz@gmail.com, marcel@holtmann.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+f20755f37da70df33a16@syzkaller.appspotmail.com
Tested-by: syzbot+f20755f37da70df33a16@syzkaller.appspotmail.com

Tested on:

commit:         0fcb05b7 Merge tag 'libcrypto-fixes-for-linus' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16034599580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fc812281b37d1115
dashboard link: https://syzkaller.appspot.com/bug?extid=f20755f37da70df33a16
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=173b329c580000

Note: testing is done by a robot and is best-effort only.
