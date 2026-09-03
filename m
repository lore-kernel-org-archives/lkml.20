Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0686D440647
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420784; cv=none; b=KdA2j3xYUP6vCz5EaFGrdWdZGPgvR/wH2Ieu7efpBzSh6e7SPsogjNDkSPkmJ5ZaK4aw9+NPt/9ts3ISA6E4TxKEsKkqxTFlJTuzuinvdwC+OtEvxsKzQsZaGaKcjxyZfz4bZA8j6XD9dr1pOwlEmnANkygVDJCUy+YpIZ1S9PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420784; c=relaxed/simple;
	bh=nWmsqPS9FI0LrhgcKaD2/efQz6/CXyeznkML8S8/ouo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=N/p1DiHSy1GJ5jxHXP0pKlW/Zgjquhimvldco9Q4jT5Vq7cJJyh919tTeQp3NDdpoRAmRNz5UWrn8ibjKPzyHC7Ir/pHcfSRz7TNiwbhjdhuGhaHy9cylQSti4Dwzzbc7+fozmiMxC9wUjU/lsT1azJS79wmlk8COxLNSo+O7tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7f94a2da216so255325a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420782; x=1789025582;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EOjFMMfG7ZQHdZ2PEmpoXhTbohIr8dRdywkr8lfkeoo=;
        b=rl/cNsGyLdHz6XSQ15JMfWnix8vfOEsoApDoUWVxJtbK2rVjFfG4kfPPUlFPk6O3sw
         J5XtynmWe8PSdoU7VM3nq2ne127R5rBuBqcf7XdcijoMG8nxUQydywxARsQMsOVlQI2/
         321iFL8cI4wZfZm72mcUO4tDSxeU1yXegK70mCUX/GouKziZ1u1gg4hAZ4zdMT8mc7FV
         YSXExWR77RGf+5kL4QrUVsMOq7yw+9Nt9GMjvujKKho+IBTIxg42jzbxJKQfORr4JY1m
         ewkI8RyDkq6jHj13RieUN7v2M9jQwgIeM5h0ymrgoA5oFaPgNpdyfTrCTuXEnSfDRcAb
         xK6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwmueKXxbNk1xH61qb5SEIezWLpcrvZjhjapmDsjY1OUit71k7cCbuh3QfKQ8Izx1ZJUD3MXFX+4ELxasQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nlRLzbILXhUrljMdpyDzgUULi9f2GBmv4A8vcopiB8AGJ7DXGU
	pcdpXrxT9ZlFPaODYsB3fneR8k1kA/K1gQuNwfrya9r0GCkTdOaTP1IdIdAyfmqR/xqsfoeZXJW
	vQjF/VrZS3/KJ1Mkm2WSzcYzWauUUo9gVKZyoNnHsJJWyoZ70F6JUs5fnClM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f09:b0:6b3:f31f:bd74 with SMTP id
 006d021491bc7-6b480a4547emr7604732eaf.20.1788420781851; Thu, 03 Sep 2026
 00:33:01 -0700 (PDT)
Date: Thu, 03 Sep 2026 00:33:01 -0700
In-Reply-To: <20260903071128.105757-1-khiemtranzo532001@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9922ad.9266084e.bf0d7.00ee.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in bus_remove_device
From: syzbot <syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com>
To: khiemtranzo532001@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com
Tested-by: syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com

Tested on:

commit:         940de590 Merge tag 'hardening-v7.3-rc2' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=163f8b49580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=87188222c77c0dbbdb4d
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12af8b49580000

Note: testing is done by a robot and is best-effort only.
