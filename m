Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794137508;
	b=hsLxFH0med1HYHNwGOS7ZoPPb8cdrdO9KWIyFcl4LxRxrK7IRyyZZeY5IslU7GOz8wOp
	 y7rosKls3zyg3FWg0OIWRVd1SX4K9VM3fBAisNZ+WsT4bSOOS+hvJNOBnmbx6isueXApc
	 ZhMW5ilChi5iaYALONDSAPGSxj51MAH0YKGYl47/HrLD5XMG6iollfqUqKmqhuFVwPxOp
	 j++AcdHRtqZmV4wB2jrEyKUOqigt9DR5uhTfrLYVNh8aNSoQYvxTNIyPu8DTEl7lq4umX
	 JOdtQJfOybzZGC5Vr1pQMNXm/wTlAnNCV8Mv4bXnpvLsOb0Gb1XLfk9OKRd7GrllIog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794137508;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=KRL+3tegb75sy7FkitCyQ9xbROLrywZN8vIUkPBp9iQ=;
	b=NIrZs9hwnXpEn76lVWaqpbmwKzD63bTxkwhBLSbI7j83W5ZScSYAFwyM/h24OrHkEL6v
	 pzc/NzUma8Ap+pYVsxh35U4BEJxYr9xqrDEbQXi8ZvtgiKK6NAd24w5rMmD6hsShqGxj2
	 wkO2Vg7tv2z2gh/mGPScCtwbwVeG+1VFCxMG+l4Wv6WMkW2PaDxNyLDcNgGrMBzo0kk+5
	 NmU/ujoJUsRcYHyXbAfuVd/aON7nd3hM1Rqyu6dSmztKjVMl9ukA6huccJqb78Skl+e0y
	 sQwFC+v7zjUnaid+D1YVdZ+5h/9Z4rfLLjMEseaNis1HyHJYdxJThJ73MR0Pq7RNFwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA03606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 11:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAA03606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c467e19391so29115b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 03:31:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794137507; x=1794742307;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KRL+3tegb75sy7FkitCyQ9xbROLrywZN8vIUkPBp9iQ=;
        b=fgGiPV3RQCmjNrMBt1YddOEImwKJqc2E4cr8S52R70ldvUleptJ5l4+w3Q2XTEKhSF
         jTVAebEybyOhgAvLTYi3/7YK2aN2mSZEPRZNx2S+3KZ3NvPW3f85OY4YMAsd/NiHR33n
         LY10p+PLGj2CLhwRDhCTGRfew1IbYwORQHiEpqJk8r3dyeSSSMt83zWR+KWPXpaHB0N5
         HQOm4gR8g2j6oifWRbeoAJy8vgymuXvsgf8d+XaQwY9smXfp2DjxEiHryTGDdMIYhelZ
         Kw1x3mfBZnTqtAnustEwg62Wv1gJPACStHpki98KjRxM0RcuwI/d+VrrmDFYfUH+bvJR
         uYbQ==
X-Gm-Message-State: APuU4Z9RTRgnbluOVt49tX8m6cfCaLj80Z5q4rQc3kTidQtswOWejFhO
	Q01728MPLnYpc4lRAmcky/e3UcAKKNrfaEpBnf7JtX8chXx1M/yI2rnk4s3iA3FlDtdqMbUSVmn
	SULuYnSa+P6v8HejTQ5J63eIfFhN0N5XJg24n6q+QU3K5+CLjH+3ElR/QK14=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6809:1c6:20b0:568:185e:e69 with SMTP id
 5614622812f47-568185e0ec6mr293457b6e.13.1794137506769; Sun, 08 Nov 2026
 03:31:46 -0800 (PST)
Date: Sun, 08 Nov 2026 03:31:46 -0800
In-Reply-To: <6a8c5208.dbb3a75c.7844.0005.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af05da2.f50b2b3a.2c0de7.0008.GAE@google.com>
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
https://storage.googleapis.com/vrp-syzbot-rce-842629920185-1108/bare-repo-62aaeae
main
