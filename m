Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794800025;
	b=iFUFbtRkthyUW5n4TQFNs64Z0CThohBqFNHqamq3jCTdN5a7AHqdhQ4+KMQVrlA8HNz4
	 CA+FXfoqFfpSwnHjc3FESYbhXC4lt3T7+nJLyOl8Kms6sp628FgGLfIYtD7zbc1XGJ4Va
	 hPW/8zvzeQaYwIfo1s7bkbrCUH4Gk/8IneRqja118leTzOkT+h5hlxkYPK9AWJH0HYT3j
	 KLsvr0xb+mbTlaxF+9khxrT1lS95lm+NRS7E/t6KYYfj4gtXVqKN0CXdmGCXyCleOpIaI
	 ifpl86k/hvolmoMOsvkmioz+NIaWvZ21barnugaD6hYpetK2XdAr0Gcq3ZPkLWlMlzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794800025;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=J93bDpdVSbsUy2JEpGRT4ocytoAEjIMqKKx6oz8CLRc=;
	b=nNTb1kDuv2UZ2il+VWO2N7vNBvtZ4rCuxk5gdjUJgX4T4q8cuMpQZYdrb0x/RkfOG0p6
	 3iHm7ccRg23mXDK+5zJlxo0z8RGNEjAKotaQzQzB+6Ls837vDL5dlXT6AV06WCr7rPgdM
	 NRHAf+KuRPdEjFNrYjwgvqNEPtKLEUH1wfbypPFmmATs1H6qCJeHxcJ71IF3h0+7jO5eg
	 UqLrA5dTMyuA4hZ1jD/rX6BPObWRCZwhkrVolRxXiS9rXrPY3+MQOLKm08JW47kF0DTAq
	 k2jyXLCohHIXzAfTIxcE6pNyD2LwjerNzTZq8axWgjP5xmC2FgAkwsEgK2jYlxGEZJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1920606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1920606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4f8281066c4so3913996b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:33:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794800024; x=1795404824;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J93bDpdVSbsUy2JEpGRT4ocytoAEjIMqKKx6oz8CLRc=;
        b=b4NJwxsNI3tXLd3wNkg5OeIrvR3co5Ug2i5jL2o+ySFfJ7Oxwu8uhqKYrJ3A778FOs
         FxTVBVX+l0vu5LNJaglqX02mYVxUZz1ksmzoJKWoakqVfpeNXfYTymIfdaUaF8FhwglW
         y6NcZkGxWJzdrEK3jpKfSahDlkHlfGNfmqb2hyx35+CYXnghcGsu4Q6yf5BLVeU0emiZ
         CQC4fVCjGc9wsPyy53Uw0AydJKkflzOgFjvIZ/KFoOjJFbsniSMphVPn5+Z1DAcp5Y8y
         uQ3KB6eUAe8UbgsJYTLZ24dqvVH7Pzy6N90g3VF6YPmd9PKrjoUawQ0eyCrjyCdM5brF
         kxWA==
X-Forwarded-Encrypted: i=1; AL+hErFxSDta6hn5dd1KXI9jWkBd0Ohe1yEKtj8oB9pgRt6chGfZi5FECJDuRPLN6rJwOT8Wwzi8ove9UMtmXTQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q7JkQfMSyiuBeJgfaVq+5YtewUL3nKdWkkZrYJkqYaXXfNz6d
	M0TxGwf8uZj1XgDxnXhV3melRkgZVDDTGOqIONrTaeh1okTQqygdoLBKcdHwSXQwtaVolULztBi
	mBJmqYMDFvCFCZJ+BYEi+aKQ8b3G/IW/NltfYzaYuEmOSOk9B03alLW2G61s=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:11cb:b0:4bc:fbd4:2a43 with SMTP id
 5614622812f47-56e643d2026mr8065752b6e.41.1794800023933; Sun, 15 Nov 2026
 19:33:43 -0800 (PST)
Date: Sun, 15 Nov 2026 19:33:43 -0800
In-Reply-To: <CAC2RYzKrmqkCcsWWb0Q2s7+Zc8+qUNU8Kk741dMms6fND5EGKA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afa7997.920b2b3a.148c65.0060.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] WARNING in hci_connect_sco [hcidrain base 01/12]
From: syzbot <syzbot+5897b3c764f5989ea942@syzkaller.appspotmail.com>
To: gservice341@gmail.com
Cc: gservice341@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

> https://www.google.com/url?q=http://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git&source=gmail&ust=1794886422615000&sa=E
> da3cc02587c629420603df4395179ec82955c941
