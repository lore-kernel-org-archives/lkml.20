Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F67432E6F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787828357; cv=none; b=B8rw3eZZaDkPMlnM9zO+ciIlaf3U0+DvveIax6ooRek2d4uPcoRmJoeNljGNu3xBhZoSLk+udEdMLDWunJA0acjFUNS58Cond750QGYU/UT88nULPrOfF5byGXSQ67QrpX93MV+OIDoRKiUTCRuWfxtjlZJVd5yiTljJ0HqeguE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787828357; c=relaxed/simple;
	bh=JJ7xmZYsWxpHV3bmBvz951AQYyyVVFUDVSDdDqYE8OI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BXMbDTW2lu8i2zmmo9cnQ3tLkKtYQUfecxMBTkT9nX1tlCZJ5rJ+JHmcWJzWCJJkPs/tnvqV86HXSdu4x9Kgan6M1W8Q6HT3v6kVN9+nNgfW1p0f9bgXFPGm/7fuhKc3btsEEkaWq243q+oGS293Q3vP7gIBMm/epOcDRGNof9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b37733badcso2124640b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787828342; x=1788433142;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RdD8Z10UoycLeU+m22gUXOdbmaKrrKX9XGWwAQdeYVA=;
        b=nCZ5b5U6Te6vDM8IjdIpbgD65eErgX4hZiRoO54Xet5cdtAKvKvWl4QaAsVsLQpmfk
         W0sIZut9BxpP4hnPmRfBG8jvLbxQ1SRIN0DUo9FHTxF3fnhOzx2sOuIgxf1sG7vWlHKt
         PZTI7A+4poSpwt7qc31wxNZ03Jt763aZ+PtmJmgLcYCZDV9Plp5aenP0n1fpg6aNLN0I
         JuxHsNTPKydNXgFOoiCNhQVRSygiubNkStgbw1b7bk5L2MmHQEcp/V/DXzKizmz1PKaT
         JS/ihgbGilLLRzCTi63F0CdYvYXQnGImzkSgB5l99igSaybvUYGCbrvlqsGZlvN6NOXu
         /ttw==
X-Forwarded-Encrypted: i=1; AHgh+Ro2SDfCJX4I6mSlRSgYM2jj8327U7O8+l2H04k5AYCzp/1XbDNz9tywRz+zlkkKf11TOOuX78HME4AA59M=@vger.kernel.org
X-Gm-Message-State: AFuF++neZJMoTUYfGWYSx9ktARnxd8PVOw3EJHIU3k+n/0P0DoHD+P/c
	5Wa6crgUZk5HZPAz9VxUPARCSE16d1bBGWQETWQtXrSBUdDdDXzS0zW6F8vRwkr1fIsugmUgmUx
	oqtkWZ0iFGK4EFF8F7vsvDobyDzSxHP+0b69k/SL4o6Ivn/Y3Ss6PHUk8q+Y=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c164:b0:4b2:c80:e01b with SMTP id
 5614622812f47-4b366b49c62mr16408998b6e.14.1787828342278; Thu, 27 Aug 2026
 03:59:02 -0700 (PDT)
Date: Thu, 27 Aug 2026 03:59:02 -0700
In-Reply-To: <20260827104306.21231-1-jeffinphilip14@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a901876.27659fcc.2ceef7.0014.GAE@google.com>
Subject: Re: [syzbot] [sound?] BUG: unable to handle kernel NULL pointer
 dereference in snd_ctl_led_get
From: syzbot <syzbot+b7fe2760ea6f1ee44b4d@syzkaller.appspotmail.com>
To: jeffinphilip14@gmail.com, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b7fe2760ea6f1ee44b4d@syzkaller.appspotmail.com
Tested-by: syzbot+b7fe2760ea6f1ee44b4d@syzkaller.appspotmail.com

Tested on:

commit:         818bebeb drm/xe: Don't hand out the flat CCS storage a..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=16e14579580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=b7fe2760ea6f1ee44b4d
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1714e579580000

Note: testing is done by a robot and is best-effort only.
