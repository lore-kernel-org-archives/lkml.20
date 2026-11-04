Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784363;
	b=dLeDP7tBedFvgikGgCt7fDl+Db/yjDqWuPHj2c2yRNPEYiDbh+amdynuVWKNN1OLLj4r
	 9oAC7olVKUkg/eq8LmdUqf72SE6ofxh0+tvyukjYZ5qplMaAp6akm9GsGo0KQVwtWSF7w
	 NdsnNqsOIy8rKTA+6z62E1427EAeoCxzboGyuVd/zWYFMlEXKv+BdzI3ppfrNSFvLEGPa
	 h5hjqZgagsUNfJ6Zgx8NA0TLtA0svx6afSYcH+F3iFQbxSXn3ZCiW4miwInElSsYhMR/m
	 M1GFh+w83Ycgbv9GA3eNl9XpyJePjxaDL9tZG7ZhmRnIBEiLRV0kRQrZDAuDQ/hO5dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784363;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=PFrZ5dbTOXlM0VvYXkehn2Hkl3Ka9277tqCUBifKvOA=;
	b=wglWET2wc3ofs7J8h5X3f/LHt+DdBwLhii6SEIYfS4Q/Tbf0SPqV5HIbgZblaaNApFNd
	 ENdFVNjyZjhwWtJZX9unArY574eXu6nwT0gaEmPDNUMQlUX2O22GJXinDvbnYnsP/pauF
	 n6+eeKiTHpaZ6sz/Ax8jkB5i4Jz/usxPzLDZh6+335qVzjadqEV4Lvcf5Gewg3j/PhMLs
	 LW9Q8LRruy/dpN+R+iS0pGeVZEZOp/p5zSswi+yZpzfCAIrf5ZnCGLjpgaSbw+tnGA+ex
	 kGeg5G0gpiGWhzXj8h28WjZ395l7x0Kvr62EZd8wcoNwxxpDsQ/Tcpnou26Faq5WJJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AB7606A334
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89AB7606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4e937c5bd4fso421292b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:26:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793784362; x=1794389162;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PFrZ5dbTOXlM0VvYXkehn2Hkl3Ka9277tqCUBifKvOA=;
        b=fulsF4+P7+fsKS3SdmU8/w8lAHrXyYktd8pxsLZIg/y0i28mbrF+vmfW2kKGgApSvy
         RXZJs//LNsp9ux4K6CJOPdbqsjbZ6X1p3IE1heAhoSL2r7QYK6nmobq0kfp3ta2DV/aF
         /atH023sWqXmIW0Jx1FUdY3M3ldOG9VabL8Jk071ZpK2aN8sidd1x7OIEgbvoGbSfuY/
         TSD6jpUqc+XoQXEJdnfQFGoJy699AMY8v6gzTmJeQ+C2/y+osUecsE8MAA+TXQSQ9UmP
         AUJGViQbpfxtAPe/xrerrFZ8m6THCnCPEzZLEwKTAFayHbflt9TYkZhGr8bb6O1faeAz
         6RIg==
X-Gm-Message-State: APuU4Z+buuyV+wHvmvS/Fszff7ZEpG7U3SFHZDxac1vBzhn0ZD6U7Q4Y
	Wqb3eP5iLnljij3YXwqn2aODmxKVcSBoFiqNKLgSPkgc64cj5mXutbUkJAv6z6iRGY3al/a1NX8
	wPsXL679btLpRbb+XresDZYVkKtLrxnT2bMFEGiGsui4mPhA0pUfA9hqB/ak=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:14cf:b0:4cb:d056:b14f with SMTP id
 5614622812f47-5640d91b353mr9627782b6e.1.1793784362623; Wed, 04 Nov 2026
 01:26:02 -0800 (PST)
Date: Wed, 04 Nov 2026 01:26:02 -0800
In-Reply-To: <179378340638.11608.18306459463443605471@cmss.chinamobile.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aeafa2a.bf891901.a11b2.0003.GAE@google.com>
Subject: Re: [syzbot] [driver-core?] WARNING in firmware_fallback_sysfs (2)
From: syzbot <syzbot+8f06445357a052a92657@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	xujiahao@cmss.chinamobile.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+8f06445357a052a92657@syzkaller.appspotmail.com
Tested-by: syzbot+8f06445357a052a92657@syzkaller.appspotmail.com

Tested on:

commit:         05441d69 Merge tag 'cocci-7.4-rc1' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1047668d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ea9128325cfe7743
dashboard link: https://syzkaller.appspot.com/bug?extid=8f06445357a052a92657
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=143035a5580000

Note: testing is done by a robot and is best-effort only.
