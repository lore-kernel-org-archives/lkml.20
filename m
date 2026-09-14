Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFACE3438BE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374546; cv=none; b=amyJ+7ycf5xjd4EYiipkXKy+vui4R0f7k6PtBb2pyRkYWqMQP0oXzF+ZqlyvEqaGX44D0rviQSrtUB0Hqs47kQ9yb5znpatp9Bvl4Mfnlo4+Y/7H+tFs9ogmRHy/19gNPRCD4bnA8pSnY5jJNMw1NMFisVp5PHPATJorLjcyYcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374546; c=relaxed/simple;
	bh=+hhFKZBq+p8n87GCIUkVBbmnTKTvdHmiMg7cDswcAF8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=UrX3byszACGtGIgoAqRxsKA0lShn+J1i4ruGHX2aL4gUin+n4aG4HqCADCAWXmqDLtDr/iHuaMUsn1dUftRTHp68NrTX1+QIYikn1rbIJsGUL9DzBcmLOrTAk6LI7f/T4CKBGs6qitz5jYnWxuOjtJsrwu2sTt+9r+4m1ARBx34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c307941971so4265149b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789374543; x=1789979343;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PeUH/zJ2IOOmYMm8A/brmMzl91+mwEw6P5lmBe+Whdw=;
        b=O03e963oOO0SU9UCr4lT6DDbh1ycEi0opWT7anUzxAPqv8MFgkn5cgak6rHxmN/+Qt
         UabbHeKPEkh63GtCrWTNZNiuV7KcTqWgw8b9kxHH1xY1kRK2MbyT2+Iwp4R7M6GwebWE
         pcONAm4j9SNzQ87/337InjdMxhF+vhlX0RPVPQ+6wAJBPiQmmXxdnjyEbiyTj16tbNc4
         KNezpz46QmwCXTAaCw+obfUx1XBgzSnvMTCrwM8TrC26opAL59Kl8t5JwH9f8cYDUOXu
         GnayMUicENHKLiyK9VkQBYF+2cIa3XJ4++Q8cwDMUYsECLaZvQBcZ+0zLmRv2jVeXY4e
         vR9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxOd/WxxMu4EBbt14+i5uIXPA1aAEU1UM6SdIdcxehELX1xWwbhIZ4GxDMzOh+WYpQbvMhgbsoNZ37P4f0=@vger.kernel.org
X-Gm-Message-State: AFuF++kEmCS5NUEPeIkCslS9VzuregkTS0fOxqy9P0jhOKsKQD4cvqIN
	fs/4pG5Xks++5OpMY7/Mvq/aC5HA1ntMglpTIJOqUWsEmJFi0lfldS1yFF+GcwabomTaP/Z0m96
	5TSTbmJuyEzexYYs9JULW5LBzVg43kaMLv6X4OJoSBx1Z7X/EtVsBiiwMNSg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:81c9:b0:6b7:46fc:1df with SMTP id
 006d021491bc7-6c542c2ccfemr663508eaf.62.1789374542952; Mon, 14 Sep 2026
 01:29:02 -0700 (PDT)
Date: Mon, 14 Sep 2026 01:29:02 -0700
In-Reply-To: <6aa7a5d9.10e42a5c.b751b.1185SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa7b04e.f670cee1.72fc4.0019.GAE@google.com>
Subject: Re: [syzbot] [raid?] UBSAN: array-index-out-of-bounds in super_90_sync
From: syzbot <syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com
Tested-by: syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com

Tested on:

commit:         704340f1 Merge tag 'x86_urgent_for_7.3-rc4' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16f4b5f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=9e3014263a35700ab49b
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10106601580000

Note: testing is done by a robot and is best-effort only.
