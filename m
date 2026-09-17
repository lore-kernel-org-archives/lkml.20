Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701B04FD793
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789662552; cv=none; b=SIx572mE/T32kcIwkiY+Rnab6NZ3zyVnrw6rpii4tkNaQM66laTSPu2bljsD1g6yaR1wOWEcWUJabfFC9wa/eEt++BrhjJ2kKXMuDz/s9RijXKXBBoZnVVcF2qsauHExJUkMZN/fm54Z5Nlso6fI0Q+wUfVVbFgtR6/CQ+AgJhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789662552; c=relaxed/simple;
	bh=+AwNLsG+SJHdUR7CukO36vOn4L4i5+SBWefpEj/cdYw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Jl/l/Mhhh8QcDTROu1cp7sRNq8fFRoXgji7xb6ZjouUvmCmzzFUMHzkZF+tuLfk3eAfMmBsb3u5qiEbN4Gig91egJZB0cmIFkGKyfeOn22BvHo4yvklZqYG98EvdMuYM3hej+q8Vv1IBHHmu/wJH1s86FPRzEiLe7xkLAPkBl6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab4f652f9bso867327b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789662549; x=1790267349;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+AwNLsG+SJHdUR7CukO36vOn4L4i5+SBWefpEj/cdYw=;
        b=vHTBqQTiJe5B2vAcu6iLqwcspGlkw32jjBX2G0pgmVU/8pOHU9zUnA3AiHxLNMFXxZ
         gkRw9wauEA7Llh7Jruo/0Cmpz/PQ5WGyixFKrc+rKXy91/os80HiwvkRRDX8YRtfMJb2
         I1b4tAl74ZfDKc0b/UvuEkGnQmb8XXj8fRhOgE1wVWVVN9R28VQQo/MbkhnpsVtv/P6q
         vwK3cQwO9GMWinIYUFHZj4OT38TTH2O/eEQ8B2vobopzz9GH9t88HqTJI3BaWNoUzke9
         Ig5aCZ1yp3rPnHH9NfCsg2ENhqj8FrIDuP9Lj9fTeP/xW83dINOsQsRQwiCFadmnFBhB
         nTRw==
X-Gm-Message-State: AFuF++k5AmomiCDbuS85yCq8jM/4MBpcB8SJCF5ClwtZ7htRLCsvxFPP
	posUEOMBpyRkeBq0afJjSGnPgqLA7WTTVtl5YTvUGajL2C5CZWmvX+lMy5shJJNF8YoZrLxANRU
	WVYibfGU/NUj+39VB4q5JnmhrjIpZsTeFAe8mOif/6hrlDeLcPtJi1i1iLhM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f6c:b0:4c4:9f7e:92ce with SMTP id
 5614622812f47-4ca4cac4891mr7545001b6e.38.1789662549351; Thu, 17 Sep 2026
 09:29:09 -0700 (PDT)
Date: Thu, 17 Sep 2026 09:29:09 -0700
In-Reply-To: <6a8278d8.dbb3a75c.20434b.0041.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aac1555.b398a7c9.1f86be.001d.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Read in disable_device
From: syzbot <syzbot+4393dfdddf166f2de2b0@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Read in disable_device
Author: adarshdas950@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Fix patch attached.
