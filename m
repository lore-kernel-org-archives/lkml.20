Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793272763;
	b=OGtS5IvV0ACsA6uu0hJcsn4do1N4o94fK4j0aRc+troP7b0dn83qAzmwLf2YE+pIuqbi
	 WxfmVwAXRcHTFNpauFhk7NgCF+zxObiD3AU1nTvlZ2YWkuw16zRhhJNWiE9Pbhz2J9AB/
	 SWVkIrG+AiTVakQcjy+4uq7OZAA72whlg7WvCMFKd8EvbHwfhRoeYfKe5thVO8Mmf6ULb
	 aHJ5gh79q00dJCBnnvUF4cgyF0TlCC8Xqchaftye7h1tUbHhNY372fc0DpdKqJxW71szm
	 98NOVWHTtRUM6Zf8qY7CQIFR6TD9jtfUfR3SV3w0beLv0G9MRphloAmEkty3a5/i9Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793272763;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=w87Fsky0NgxDuxHBRoTymPJmUy6XO+2+F5+Frr/38EA=;
	b=e59/UX9rqusAz5izac/JAckumH6yq+Qzb0WrpeLHeSt61eXB0g0wsCskvkevujPwL6qh
	 5xb8JDvoJdu0DsVIHBbHyfNV6TR7O6UlO1eMrbC4XS4Dohc3uQDEUQLXiiAmkj1O9vs4I
	 5m/4ZdKXcfFjcu9O17iM3bHgEhIwvG5jv7tXixmCU26L8VlSW9PwqA0UJJlkpIatX6bmg
	 BOuqTY0yt8C0BltPX1MVchOlyYjsQsZ7bhdhm3vxKOzdL1PKOqQT2gADZPTtXjcmD8Gq7
	 1SIBMfgd1XBMtrisxgbWRHRCxAdgW1e/nHDfayjia3f7vx3SvI5cejn8x60nkrAdrHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4F9606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A4F9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4dab94dc3e7so3159550b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:19:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793272762; x=1793877562;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w87Fsky0NgxDuxHBRoTymPJmUy6XO+2+F5+Frr/38EA=;
        b=25L8uosBi8Ill69mz9sz6+MgzkpQ1rpHjABG9gCDgcvT3QHL9Iu+TE7d9ULOBPHL98
         WfDX+SvSb9heJORGfTM3yzG15tjxSatoQQVytQ/gF4cge+GUckKR7fPg4NaTgYT7Vb95
         KY+jMf30a+PtFkk3KF3h5aq4Ll4sAjNka3V6m5kh6TUYlFb782fPE7L3hwJQNwHLhWHK
         NImhd73kiexQHKu3j9XYeOq+OA56GCXPfk3PyssZ1hEh+zTUGMCd7gA61vHpHLDnWlQh
         vZBhyLqc0TpNVuAmJJo49RjOZAYLhUUHsrmb447q5bYMnzTAvpsXVwg6Q8e305jxdshF
         2NAw==
X-Gm-Message-State: AFq9FYKDWZdYrH+z3Z09KY2fl2Jb12hDo/loH6KwwB6UnG9kH7U0Ryfx
	I6zNEot/tVa3PUN+XuwnhH+ByqMsNdNEX82aIRhlxY3z0lHp1XtVOpd3WFqMSKwl/DfA1g3EVNg
	m2zM37olKAAYsADuU7QDoYN6V+35jMCUp2BUr6rd+bdhhY1iRwmf4JmwN8OE=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:518b:b0:539:df4e:2d25 with SMTP id
 5614622812f47-56382681aa0mr3578427b6e.28.1793272762283; Thu, 29 Oct 2026
 04:19:22 -0700 (PDT)
Date: Thu, 29 Oct 2026 04:19:22 -0700
In-Reply-To: <6a8cdbd6.dbb3a75c.7844.0013.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae32bba.4f340204.2a886f.0072.GAE@google.com>
Subject: Forwarded: test
From: syzbot <syzbot+75f49ec552cc74d9d69b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: test
Author: gowtham398gs@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
master

diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index f0646fb24371..d35efa876274 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -3050,6 +3050,11 @@ static struct r1conf *setup_conf(struct mddev *mddev)
  struct md_rdev *rdev;
  size_t r1bio_size;
  int err = -ENOMEM;
+
+        /* check if mddev->raid_disks is valid before passsing through
kzalloc */
+
+ if(mddev->raid_disks <= 0 || mddev->raid_disks > MAX_RAID_DISKS)
+ return ERR_PTR(-EINVAL);

  conf = kzalloc_obj(struct r1conf);
  if (!conf)
