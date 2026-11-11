Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402364;
	b=BxmpNQIIvn95297ZJzuKoGJBV3MDChd9YbgCAa2iUR0Y7BAPWzxuD6kqsFMk09y3Y8Re
	 eojPnjoa2319yXNoVKy/y1KN4q+KNaxbvPpoOfUbWcPfOQebhBdlCqAkhuVIC4rjQ8JeS
	 WWEugWmMJkfpe3QVZCkQDctV2xdYUWR/JBe26Hk4AEpd34LzllFGPF3xYr6G3cQz2Z+mu
	 awc99WCoGpWoEzic9SjUQ5f6bUcQ6vC+1uXkuU403GyJXvLp47e81XuKU7myp2/I4gAqu
	 9TFvVDvme9U4IiF8NXD/adxpqPKYu2Dnn7CCqztXGXQZBzu+Pkgyr6x2LSwn4U4PXZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402364;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=YJqHfa7BjKO4Y74TXrvm1AGTQDm2FqYI3EyIeBwb3sM=;
	b=emImDBX8D8rK5F2r+l8dCyn1xE7KqZqy5Z+QfaW5dyROBFP1l3PLC7D42dHiKzQKhK9n
	 TC3s3I6sPEcifzQPKGsaw61Yhp/AtQfMmOGAa89c5dm/FNnha1+61pbBcrAD0bd1OKwF7
	 1MJkL+t1uit2C8TFSR2chF6p9kuqZGi2oATXEb7rqelGFYIfpdgjUrMT/MyNYUKx/4qfQ
	 u+W65EOcgorJHHLnsufQiZYQ9/huYVyKdhWf1H7ZIAGOraCyqQVZtG7XT1BgjR58ZZKpD
	 et6GalU5jRKE7TzOFJL6FIhh6/08wOTvmGu8qWjIc9mMPSHbNf34L1FX2Rb54cbdKzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8275E606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8275E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4e937c5bd4fso2285464b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:06:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402363; x=1795007163;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YJqHfa7BjKO4Y74TXrvm1AGTQDm2FqYI3EyIeBwb3sM=;
        b=J0N+QmslnH9bamkmhsV86EUGYuvFBCzSeLU8oF4KYnAH6xDQ5bWZ5g5k8HJkxoK6cI
         JOxOamPIPzcNiHAUL2ALY0aD4UIpNnCAePm1rDjS6IhRB80pvrMn7aYBhvm1kmW71cdj
         0EVJd12WMRb1S8R64MN1v7wEOGgVRmxsMQFkcqAcfK/NLLEnqcKJ4cyLTmzV7H5wJXs7
         IQwZxftx66u1S0XIw1bb3kCWhBsRGYR1x51gDaVWUqPNmRMFV2r6r4J6ChSgwxLRM+08
         Vgogxx5/lM8eXU5zwnMS1uEWY509mDaSHG13Oq0h5RyxrU6Of6+/vC8Rgr7hJs/KZvVh
         /EuQ==
X-Forwarded-Encrypted: i=1; AL+hErHEokcNRFnnT1MLITKiJMFihvvnIMptRt2AILaBXiaF1e3E6IguDjW+sOuKLTiHzpaqhUAqC3DMuKFSTnY=@vger.kernel.org
X-Gm-Message-State: APuU4Z936q/5fU9tCxW+PzMfS+SfxRRXrhNkWa03i1IViCraRuwWc6ZU
	ExiybejHvEM9diWQTslnUzg10Ro6eqijPgLGcc5jkStlri7qxg/N3EUWBs9JvHFKTe9VnPjRbmk
	GzWNnOGt+ZME4UnMLhCXywRE9FHIJ2krBrHgJDwPw4ob1W/r/zu8+zLIXjo8=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:124d:b0:568:1716:190b with SMTP id
 5614622812f47-56b9629a2c3mr1559594b6e.17.1794402363363; Wed, 11 Nov 2026
 05:06:03 -0800 (PST)
Date: Wed, 11 Nov 2026 05:06:03 -0800
In-Reply-To: <CACbwGuTdDY1vAmVFxj8UwfaLS0F84aAb4QijFjpTFykyCoTVSw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af4683b.926a6ce0.263fd.01a1.GAE@google.com>
Subject: Re: [syzbot] [driver-core?] INFO: task hung in usb_set_configuration
From: syzbot <syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com>
To: gbughunter8@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

owned.c:1: error: vrp-clang-host-71cd29454405c5a8


Tested on:

commit:         567fd694 ignore local Python bytecode
git tree:       https://storage.googleapis.com/vrp-syzbot-owned-fixture-811055272945-1108/bare-repo-clang-host-71cd2945
kernel config:  https://syzkaller.appspot.com/x/.config?x=8bdeea7ee6735f91
dashboard link: https://syzkaller.appspot.com/bug?extid=c22bb42560ec86726aba
compiler:       

Note: no patches were applied.
