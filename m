Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39379367B9C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788342426; cv=none; b=dvDcchAhfmAm3JHOoCgrfRv/ux8Bg02qLliO6U5JWnyGDUJeOqp76xG5WCDfgaKTyhiC4WZV1peb7eJDVk0PJk+PAbKQqaVZZgRbjZWNKwhNFtkzApdmpIk1bT23wolipTtTZCYf9N2tzbNx772M5U3/8YpQry9EoYdrwVQel18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788342426; c=relaxed/simple;
	bh=K/PDLz8+qDwOtLxn9xEF/pi5/m+cRWoZyCKersqf7jY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HMN2htXLiahwb+YYbDBlvyNuXbTgWICOHZBpWDWmFUhw2CrlY8mbpINQHILkDarfTmVCkR21urTi82vdAEiNax0kNQ3dOgI65sZ1dMGTgjdtPHGw4qikFq7HwH239f5cqcgW9tkFzC/+zWF2OtbxHsNbcixxGc51Di4Um8bbn0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28dbf4197so1148056b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788342421; x=1788947221;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H4AchL2IXzL1P9B17n74ANmnb/KFYEiznul7UScLfbU=;
        b=iK9ymNIJWpHGmPYDK8Uyp7LEfuRXDdOmPQWScOLSioPFZ/hp83Xp/HvAMD73RdvfWW
         Ur5vbduOLw8YW6IoSMNNwgqFpm+W6fAtMOpmm8aOTwFNXjJxwPaH2m9theJcUcvWM//J
         u4qHYOmUe1is2dWa22nH4+6pr633qQD3mF/vuB5Y/Sqeq6UhR2QU/mQ1xOIjG1B5MR0G
         fNtOTCMAWxVZL4DCbDJtQ85yIUw/ezAd8w0aPA/Rr6JvnBP09h4Bi/B+pELTP6NMKJLX
         cCs9sv5DN0ZNc6SREgtB5ET3To6w8rm22rderg+7DPVpX1mKys3fSBsJZ3P5cMHQIebQ
         nRUw==
X-Forwarded-Encrypted: i=1; AHgh+RqC9vYXX6W7gS40LYlKSKICEbPydXeXrTHgsElpFp4ayQfFn/Fmh8QRG88DyEBmH2dnl42503ZWINB/Ahc=@vger.kernel.org
X-Gm-Message-State: AFuF++l0Wo9qErjs/pP5sW4cIY05pmRhvr+N0ihzjeS8pE1dpYSyiXc5
	octTPfzB/mGhaWqYX3P06rMzEqRhDYSxAiLKVcg61nPutYDMTIwMGFEZ8HwlAwbcC8g7LH7XroG
	n/nuq2X97eO0Oaar5qndXB+ZEWbmdGUirEAX3Fm5wcLQ0ZjEHDk8i4D/djUY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1787:b0:6b3:1874:6f21 with SMTP id
 006d021491bc7-6b478ccd4a7mr3054035eaf.0.1788342421705; Wed, 02 Sep 2026
 02:47:01 -0700 (PDT)
Date: Wed, 02 Sep 2026 02:47:01 -0700
In-Reply-To: <59870778-1f82-4113-8ef9-dde998676f1e@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a97f095.9266084e.bf0d7.0006.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] KASAN: slab-use-after-free Read in roccat_open
From: syzbot <syzbot+d632e93ffcd1452bc61e@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+d632e93ffcd1452bc61e@syzkaller.appspotmail.com
Tested-by: syzbot+d632e93ffcd1452bc61e@syzkaller.appspotmail.com

Tested on:

commit:         89a31299 Merge tag 'cifs-fixes-7.3-rc2' of https://git..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=12d46f79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5bf18a904921512b
dashboard link: https://syzkaller.appspot.com/bug?extid=d632e93ffcd1452bc61e
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15be8125580000

Note: testing is done by a robot and is best-effort only.
