Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979543;
	b=nBnoA3DkGNOg0zmqTI0y6kulNyRSV1K31dkLYQEHZQWd6/CVJRR/F1KAggzhv91ryeC9
	 scZvLSVXJceSFMI6znMU33T0PT35nl62gik2ztgk6AAdHhSr4t/bArt2vNIds/dHkkM+u
	 kYpWJq5OpidWgQDpfFJaNjT+ONPrcngANADP6IZzz8socRtk6q9ILYeY5O5eIgHEsZUsj
	 xp9RBHma/tjaJU62546wuwXnVHo44XjmfhveNJLunZAB1bUmtNQN5s9e1LwV75olpSjjM
	 X97TjVcwOXvPiouDCUlUlkbRiVHqwpBThiMso/1oG2SUMdJWRDhMx1Sl4I+HDpH/z1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979543;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=YBZrnR7BOQApPgiP0ljXs5blRi/wDnS+mCptVcNLM08=;
	b=GkKEcLiizIveFD7euXmQnhlJAfHoBn4W6UiyO2BTg88EwtLM1CEx4VourA20kj9l6jDt
	 GpGwhr1k9b/zUvS2TcPjDN7so6nPqH/JVp9c5I2WYC0bQf+G/yOb8Q2GJE7QCLS06XLZ/
	 nd5H+KF/5w/++cb11i4sqPuU7a3EUCxuydqzTgxAxWLqeh4vnvMq5/X9GB5zZyEfF/eFN
	 lBOkKzlvFBudd+ZazSsQ1AIP/CLs4HsgIA65XpZHbOXQBuEMZf+Rb44wHh4oH8/mpnkvV
	 4CHnwRhLdJXGLj6noceGd5N29T9avuYHj0TOe5gxOELLVRDIi7QinkmSw0SatpSgPxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577BF606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 577BF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c7f887ac6bso983194b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:39:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793979542; x=1794584342;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YBZrnR7BOQApPgiP0ljXs5blRi/wDnS+mCptVcNLM08=;
        b=ss2zF/vr19YOLdlBq4TOwFHOyjuvPuOvmg/GuPiZSWZ93+r3oMNLJ6Fih+nZi50XXW
         bwSUCvS727YH7C/EVZCouWhAcf9WdqAe4Nw3ZyO2RmbjcYrvE4wXg8ov1hBIufrt2b7T
         eCfIlTHmaeCL1CQ2lhzYksOP7E6qPF8MFbhujxtrlQMGZ8cOdaWWLcmdiikZR3Al1Ydy
         OYDdR+v5h39Ks2v2tM7udQC6oSxLyH18RqIyXEJTa4eYZH+ho+7vHi6J2xovzNtrHsYe
         sVSpHNvaBAw+oI0UrhkHNQliGB5fqaTwebOjGK9f1kofv9+O1wVvMxj2D6iWzCmLzjYQ
         Sunw==
X-Forwarded-Encrypted: i=1; AKwUvByhGH8tgn1LPYQdvv3nJPKaRb7W0V3TLg4zO3WF6nYdaQu8DsT4XRNIzUNjgogfd/9VW0aZ1RjA6c0AIxo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SgeP4WtWo+3QxBQQUrZHlFPlxoLbEVw2kr882VhsERWJn3E7T
	dDe0xH27LyXacL9NUz5Kvi7hvnesR/zcD17MWTduUNItz5l06pjVwmEj0q+MuR4TMmlmuNMziC8
	sp/0sVmOQxG9p1gNhKOFfRNjp0fhtJmwUUxwvWJVRj2V9kROsQvf8f08TLow=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:15a5:b0:55c:928:69d1 with SMTP id
 5614622812f47-567e16594e8mr1950490b6e.56.1793979542519; Fri, 06 Nov 2026
 07:39:02 -0800 (PST)
Date: Fri, 06 Nov 2026 07:39:02 -0800
In-Reply-To: <179397691694.27761.9543494907127681190.gadgetfs-ep0-patch-test@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aedf496.871af9b0.266aa7.0004.GAE@google.com>
Subject: Re: [syzbot] [usb?] WARNING in dummy_free_request (2)
From: syzbot <syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com>
To: devnull@kernel.org, kayano050408@gmail.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com
Tested-by: syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com

Tested on:

commit:         f66469d9 Merge tag 'net-7.4-rc2' of git://git.kernel.o..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15bae369580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=664189a7d8e350d3
dashboard link: https://syzkaller.appspot.com/bug?extid=c73e1942197af9f54ca3
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17acf2fd580000

Note: testing is done by a robot and is best-effort only.
