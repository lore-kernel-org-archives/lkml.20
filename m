Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886F137F337
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787797866; cv=none; b=cS7WcJ/uAg0haKGlt2joYl1R3gBtWUwdrL4WsC6xz/SA6uczo2d52iV99twAnbqDdvAtRyHSmiYRijCzyj/713AL5Tf0O+v9a/UEkx9pWzQW6b/k52oe/1h/3hKKtJa6zWZARtiO7ZFihgcDbENNch7EPrqaEWEJyyWDiyTZQOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787797866; c=relaxed/simple;
	bh=XP7UHR1uB+U9JRNNGR4fmIT+dzWk5dvcudlCPG65Jls=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WQiKFrYXXb6Ax5HfuJ3LL9JFaU93Mu3ZLeasFlLt+354jzUcUsUCDPWDekrj7nwjXDF8DJ3t6C5Cor2xDDJySm/yEWGq+FhHaNbMSXzaD1mIlN2fgXgzywDVAHDip9mDKH2SP7BEw8PVwgv65plSGuY0FDABJK4tK6cMoGmfObw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7ec6685adabso3187564a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787797861; x=1788402661;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OKPu9SGHutG01yRBrH86cocuujKUKiiWLDZmPGFX6bE=;
        b=mkwtCs1nx/DFzkloErKrJqGAnEjKSE7Lc5ivxfV4435V5d024iP5wIT6zU4chGCevA
         DYPHRyIboAQQwqUq5KEG+YRTiEGeX0p0d0OICSUaYtu82zBI/F1ceaUOatp/JiPWwkjY
         2hFUfhnwtAVFNUBN2F3fp6pT3V86R9/JvLh1Rc+DoUHSgLO9H2SNAho2RtP5nbN41esF
         TpWIGIOHP/TMD4w6oxAJy8g7ZsQfyGc+vj+4KYWybmE+JON0jpKAnNOHW7dEcBJ+edKR
         MgUh7DUL6/1aR2eme2mWtQ1/cEWHSmWCT1a7wE4AhEQl261nobl9kn7qzT/7Cwyjqp5K
         Y0SA==
X-Forwarded-Encrypted: i=1; AHgh+RpubQxjmrHI5WDkXV3aFC74k0A55oLYGSeg95Qm1VaYDlalUjYn2f8fV8dlAO7fGZXf39c6Bljx2xdnvxs=@vger.kernel.org
X-Gm-Message-State: AFuF++ngTKg6H8mnoeqDqy6vc7OYAz5aRxBx7VhjyUMSlzwTvUl/LEyq
	hRczQxS6Mi1ExpzSjWgWBjX2uSodXwB6Mthun6plF++K6GVJ7xjltdsQMl7xg9MefJ7WdpczRFI
	FGwHoyUNL+Qrqz5fuAxoI3S668v/CFMxFkN7vQm4xhmkPbJY3tsRQzL9Qr2E=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4ccc:b0:6b1:4fa4:76c5 with SMTP id
 006d021491bc7-6b1a035972cmr11997044eaf.4.1787797861678; Wed, 26 Aug 2026
 19:31:01 -0700 (PDT)
Date: Wed, 26 Aug 2026 19:31:01 -0700
In-Reply-To: <20260827004601.134804-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8fa165.27659fcc.2ceef7.000b.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in stub_rx_loop
From: syzbot <syzbot+06fa667a0931a3430026@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+06fa667a0931a3430026@syzkaller.appspotmail.com
Tested-by: syzbot+06fa667a0931a3430026@syzkaller.appspotmail.com

Tested on:

commit:         818bebeb drm/xe: Don't hand out the flat CCS storage a..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=10268579580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=06fa667a0931a3430026
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1420b415580000

Note: testing is done by a robot and is best-effort only.
