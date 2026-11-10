Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314619;
	b=aGknWJXS8bSPyYqmb3k2tedU4E34TDcpVDaM76RIyFlcN1St00GlXFODPudtT73DYUgw
	 eVivy0X3m4ZD2AsnmEFjVsx3FploproW8DAWjPdqZL9DNFuM5GGTnbfTn+L0DRR+KjHYY
	 Rzn4ushhwP2CE05HWTiAjy/55OrmJQV0Sei2eCwzUbjb7kF9q3n5p62b4uap8lcbKDIRT
	 HiMYWIuTeeW82dR8yd4ClG1bALFh6ZaH5a+0qGtjkxP7D+byQ/QB7vYzu70HYK/xdKLLX
	 UqH1Q0BgqJ7ibXbgoj85FMpyMV9uvgGhCfVTCNLBdjPY1bzX4bWPmScuzNlRqC0cmXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314619;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=5h+m068mdSPRsv8veOTCpVhqXXE2IddgZEqLEh31UcQ=;
	b=IQjJQdgxdU0fk0UbYSMXEiFvmNDqqT4Gy9B+djeDshsQiSsCWgozHIpv4MlrvD92sQLu
	 8jVH545v/aVWjev5AZ9d0etAEljgLQrkT0DpmQG5L323414LFR/2jM95DCDfc9zRVt5UZ
	 gr8Q1arOVxp+0/OEx0sCjV93DuiiwVulesUAf1weCKAsN6lmaxRcCQFGHDF9EhxGERB8B
	 4L+nnmpLdr4V5jv9BMIh5tdbOZ8ofyLQScK1f4LRJZ3Us01X04Tua7LCEwknXZrhRL6kL
	 aN4Sx8rLi1eZ1q2hVSMQLp1K0XIwdShZ/WJ6Tq3P4T1W7mxWHUKWP7qNuDizvbjC7tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4EA606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D4EA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4eb0b989f0eso2542215b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:43:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314618; x=1794919418;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5h+m068mdSPRsv8veOTCpVhqXXE2IddgZEqLEh31UcQ=;
        b=VXsZMw8VpiD2JX7p09wxxKs/Qj00jz0/dpj+zq7RNxFxl0+bBTfDn/5kXb0DWPfLSC
         siKhYWbSZEeBhLX6Ch+bzdh3AZR2JaK5fTUS6GgPsiKHbhYN1GxCUtlasHlfbAlq23EI
         8gYnLn6UYjPPzY6mqtct85xsUn5XOznlEgkzwclhMUusS78D+yscZRefJYyOjIKG0x7E
         9YD8LPCrtg1Lfzcz8frlb/DHnNs4zFsYvX8ChafMiRCHd7KpdX6LS8CR6IL1kCRCZebA
         Ib+A2/gMLuQ0FVLX37eg9tmPMWQwkIKH87JkIfOl7KTTKb3HB6F1bJVWigjpaWarLKLZ
         zDIQ==
X-Gm-Message-State: APuU4Z8fBf6c3BZVgj5f1d0h0Yn81gTEjefrIq5D5Fz8O8w3hwJz+lsT
	jla7FlWtIvRGBA4vzDJ+KIjpxuWlNGfMDVVfqYwS7qfDJuAbt4Rm0k36PxKL0nWGu84kHq1dq+m
	PbpvzzAyVQEBad5HJSHnHSCdB6U6tkjBKSSUA7wZq5H7F7RkZqIXHdfVTDv8=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1308:b0:53a:1c29:cb37 with SMTP id
 5614622812f47-56881356266mr1177419b6e.38.1794314618391; Tue, 10 Nov 2026
 04:43:38 -0800 (PST)
Date: Tue, 10 Nov 2026 04:43:38 -0800
In-Reply-To: <6a8c5208.dbb3a75c.7844.0005.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af3117a.6ea51c61.3838e6.0008.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [usb?] [input?] INFO: task hung in usb_set_configuration
From: syzbot <syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [usb?] [input?] INFO: task hung in usb_set_configuration
Author: gbughunter8@gmail.com

#syz test:
https://storage.googleapis.com/vrp-syzbot-rce-842629920185-1108/bare-repo-host-google-chain-1110-2424fa6
2424fa6f78ae910235de4ab1fd42e5d36d81ca13
