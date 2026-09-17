Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934DE2AF00
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789613174; cv=none; b=CT45Ah+xTS3gqE1v9mrkMAw7Xa28U2Xu0zKi1WCM1HVVPyR4akz8ePl+e9sAiGZkZplD28tTtGw18gQ2BkRm9oFT3cimu6dWBXm3Dfr20IUGv8cNzDOM5/Ejhkas8HwItvZFUfyfB3U2v4PH+c27/yiLHK4xt8VvzaaBPtSRmUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789613174; c=relaxed/simple;
	bh=RrUUKAKDe/loSPVZsASySs/9olzDMYpugk/YELN78hM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pY+JdCJ9P57C64MeY2zO1UpMh9ewoDpYOtTfDIxEZyPrmHLViUisnK5jgHT1j7Jv/HHQpL8FJXieP2EIEL6wuFgOGdV+QRtRiTZ27a2lfdDNGuhsmp/gRW1W+42IFA9vwplwEM/S40KILxD7O4qLOiTff6hImKxVEhXyizY3XmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c467e19391so603592b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789613163; x=1790217963;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ElLIe4pOQElDva+0vzLTPy2uXzX/7tE55KxsVj+DUHc=;
        b=Xr17olycGbeQrNl82ohkEk/5tF1JBRuCO7qaZsTv9NChf4Mwa6KayNxRttq81NPnkd
         dJMFsgZCwSvv7eBNtjZmiuK4P7/J5rAvYPAC5TvSpZujAzTC24feT3SxZDXhVx+GyPlO
         iRwbsdsHedFzU1b2NA5YLZfUil1ubW9U2XwQym3p9ZiQd6u7nC7jSdkI/JRhta2S+L+s
         OOMc53m2JJ6xdXyilHdK/LncAPLUGQSaMwRDJz6z6xMMV9UgOiXE7+rAXF4lfbrDMA3K
         27UqKqjv0gDV381wrGkJva+bcM3IvhzAzCFkrdA2mnb12bIgOZv+3xBFMJxXOwVhNLlk
         pR1w==
X-Forwarded-Encrypted: i=1; AKwUvBzpHTCrmmqBaKqC0xXNjc401niBZNng3Qs/nFIn1Ui/NlYDRcY5BqLosQ0SOeC+xRi34+jp2eZSVe6SJ6Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nTaUEkxvqnbxJWMLSKTLgK3sUxdtFrZ3EdyYU1x7hJjEY3nZON
	0noBcLTSVlFjewhaQIjSj8r/wNgDnaVor8k+OpikXcLlc8oiXVN3VP/PA9EnesBvtbmlzgCzkZM
	FKIZ1mKg9BQ+latW9RxNkpLqEAK7DYVgXIPeeKqze3KxWMvE4Io3U80UmcIY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:538d:b0:4b9:e6ab:d084 with SMTP id
 5614622812f47-4ca4c5a322emr4631155b6e.36.1789613162994; Wed, 16 Sep 2026
 19:46:02 -0700 (PDT)
Date: Wed, 16 Sep 2026 19:46:02 -0700
In-Reply-To: <20260917022208.977393-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab546a.87c06881.1db2b3.0008.GAE@google.com>
Subject: Re: [syzbot] [ecryptfs?] KASAN: slab-out-of-bounds Read in ecryptfs_verify_auth_tok_from_key
From: syzbot <syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com
Tested-by: syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com

Tested on:

commit:         f6e7b42b Merge tag 'sysctl-7.03-fixes-rc4' of git://gi..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=121793f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e909ffe6b35dddb7
dashboard link: https://syzkaller.appspot.com/bug?extid=b9529ebe6a9394ddf825
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=139b8915580000

Note: testing is done by a robot and is best-effort only.
