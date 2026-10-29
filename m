Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793259182;
	b=mqzuUYCor8u/Rd/Dulzos2+A+z/Ry7zHxbAIWkrSQhEkORUWtgcSmlrDqJHhNu/CVCmt
	 BT+xo//f/Vui9d4oJXDQZhLPy5I4aoozF9RiUjahpA91z5qFe86GqYWuj2qG+BPrnpnt7
	 z8XewLYtTpsIw3ryT8FNAfPxfodi3FZVxSgYImaSn1iE5eOB1VKcBL4u0wFG1xuTWTvKA
	 nhKZf3pdPMiZv9bMe/3lPSNbgqFdTiAQpcwuq29No7EBBuc2P/4ejVkbFH0Zi5+O5FwEz
	 B9/+7MYkxKClG5p1kO7roUKn84TzJj2swotNJQjmjSZoNfviaNh2SjtztcwoBCrtqMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259182;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=Eoo1njgtdx30xlP0Vx0fFRKj4wckiyGH+QHChQVI1PM=;
	b=ZR3cl4zuHXFACZFxJMrWeHjPoL1CxEaCPsMJKWo59pI6R5rApsqVLdBzrzy6QTeFmhHT
	 /XzcOVzBdATVB5GmrswRp95qhd/C5jFQ9JY9Tz0emKBpkLaS4/vCqKslxjViFLzeCI9gO
	 ZCsXz0UKUnV2yki8l8WNSC7ACHHa8UR5raou00mZAqFWZ2FbFxd9wKfYAYG/PqvqSuQIL
	 mK5YJM5/IrXR0Ju8HaWXXTxHXuMNcBEp3tuCzUjfr8E9sPN4jcZ/yKYtojvslYkOmFhlp
	 LS4RP0ym3pPyTsK09lihHkH1B7dnevKn2QzZhrdwtQWZMQOrV99NiklEzTo7zGnMSQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87003606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87003606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4f2040e10d8so1541535b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793259181; x=1793863981;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Eoo1njgtdx30xlP0Vx0fFRKj4wckiyGH+QHChQVI1PM=;
        b=SF08A5yxujSVXTqq/hNMW3Nwd5hl8rNa9PUn6sxre3ixxbPl/Nb5gDNuYDgj/8Uh8e
         6Zezp9wHDYb0CYPjk6CNegtAjz5qcaMm7N5bZxQ1zDzEl8V2kNuaKSt3+MD85s1roGZ/
         z/4WCZVhchbmSQSQF+2crsb+m/JMs6VOXtBn/+3seFvRxTtFw3ak6FsW7i48fVm8P0AY
         3JsFKHBEBwUdMkbIGFoESziaw7OvBlcBdacBLB7H7FZR8oO9z4fB4QNxLUB+InXC5ZwU
         arehNJEs1H/fHDldvuE/vG5zkPMjyNpzVw7g561EGBX4MADPqadsKUPIXAF1KdtbZj6W
         uGmA==
X-Gm-Message-State: AFq9FYKejkJxC0v+Pqwt3oHMliVGr4Er1arZQDs2qSJRkH4EQJOK6Sp+
	3tXpcFxo73R9F0YW5/X968xEQuA+KZJ6UuEw9qMlP+jlzCeidspzemIw6aDgyk5xUTgliBo1CUj
	oyOgkddqn6NeyE3B0sfD0nRYGXXWrJbwxxs5HZouPURr5JjyWHAyvu1OF6so=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:124a:b0:53a:3533:10d7 with SMTP id
 5614622812f47-56382c84d1amr3152858b6e.14.1793259181535; Thu, 29 Oct 2026
 00:33:01 -0700 (PDT)
Date: Thu, 29 Oct 2026 00:33:01 -0700
In-Reply-To: <CA+FtcEpVevUcS4pbiCebTJ4noA2H=3K3VZq+-jJ=4=BJNsmEXw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae2f6ad.5451848c.f7707.0007.GAE@google.com>
Subject: Re: [syzbot] [mm?] [usb?] WARNING in corrupted (4)
From: syzbot <syzbot+9fe09db3795456e0b442@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, rohithmatham@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+9fe09db3795456e0b442@syzkaller.appspotmail.com
Tested-by: syzbot+9fe09db3795456e0b442@syzkaller.appspotmail.com

Tested on:

commit:         5b0764a5 Merge tag 'drm-next-2026-10-21' of https://gi..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=10ab8b31580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fd1433abd362f255
dashboard link: https://syzkaller.appspot.com/bug?extid=9fe09db3795456e0b442
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=149d49e1580000

Note: testing is done by a robot and is best-effort only.
