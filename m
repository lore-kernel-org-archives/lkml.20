Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793552058;
	b=0Mp420EOkPJHj7IEr1A5Jcj/wzhmbwG2tg28RULEm0pU1UptUJzT26czxipMkWLjZYHC
	 /5eN8SvNTnioMXjPtfOlsqdD8qZFcSJXGxT/onOVEQr37wzR15srBLSby+KIwyOU29IDj
	 WVxTnALfCRIeXZ2/VacL8pgTwUHOZaxpdWsn+8ZNkcyIQv02AkJXUjXJqZsMoqSlXcdL0
	 EtNr8rPxU5hFwZ17l+oc1HteMUZrY2tGXE6Wj5U8B2oxYsR2Eg7fHHgXUchOgg552osAa
	 4YHy4m6APAc/fCARVQprUf7X2GbyUUFPJ49RiFZWBdUi40LiuxI8gl7jSRrv5Ke3Ddg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793552058;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=mYvfifkh2cRh4ADWZM91A6IieNu1Ui2i8vEHoXTtKBg=;
	b=Efult1THZEzEj7nb7JlG0T9bk6WqagHuMi6OwhRqR/a6Xs54nZRBKUQ0GztFdZ5DAhRu
	 YCHMMVr1PeJdhm4CjWu6swj9GT86A4krG8lti0ZDT+Ot4857HIkMxxp1EQFJubcn+3pmk
	 MsVWcGF9EvmckKeMfiMsZDXJHEppZ3chrid8nbnok/UNVooxPEfSWjhOKFGjiMl1At7RF
	 gIrp0JCvJZv7NVB3u29M9D5qyhoZTyjIuoczhg1+lpB81RPCAUSZvN8o77iek0X1fq5fx
	 VKeTMFXS8rOqOSeKpwEoo6QvLSHKTsLW6IhTQ0gIZDQV4gQ9+MlA1bKXHeGd9usNq2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.72
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809F1606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 809F1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-492f39f29c4so2707686fac.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:54:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793552057; x=1794156857;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mYvfifkh2cRh4ADWZM91A6IieNu1Ui2i8vEHoXTtKBg=;
        b=Ja+7sdhqW7awUZCFFu/shZL6/X93LKtSQp2eSmDYU6pSpDIfv1CNcPWsszdVZflcM8
         vBte2weidEPLWLNnXwP6YRF9h8ITmapm9uO2SWvNoDbFZ6g+YwrCYWPOvf/WaLaoEbIO
         Ywv9ve7MsjRQ9UHL8x0FpJeKYCPGC1FAHm+Eb6ISUqsp7PMew5sC3b8zqPk+KY8WQrhN
         0JBSL7XT7xJJm7RaFNrFJn6wi/sXME9RfaNxYoqw/bElpC/f1VSbQqe/CKxd048nHVkB
         Rq7+JiN6TNirfVnNGBwZNHg4sOegvMx3lV92zF00K5gGm/o6koLfm1OJsBXfyaFipgDJ
         ZA4g==
X-Gm-Message-State: AFq9FYIUctOfNX0cVaocRFwYzmw7zhpAImXxYAO18hKAlGXYhT+I0VMC
	73X4i2d/LsbEsk2LNtv8/VUlNz08ygwJ/NII0j6RcYPECaLneRtURn52dCyq0K430iNppqEv3pA
	kkJDZTss6CNyqh3/NKFlwCL68ENwSLqG4Tl1O4eB26iQD5ZwVyMxe/6ERUvQ=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1798:b0:4e5:a74e:d6c0 with SMTP id
 5614622812f47-5640dea5592mr5693870b6e.64.1793552057455; Sun, 01 Nov 2026
 08:54:17 -0800 (PST)
Date: Sun, 01 Nov 2026 08:54:17 -0800
In-Reply-To: <6a830720.dbb3a75c.20434b.005b.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae76eb9.c8ffc79a.e3697.0025.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [serial?] KASAN: slab-use-after-free Read in check_tty_count
From: syzbot <syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [serial?] KASAN: slab-use-after-free Read in check_tty_count
Author: varun.singh10011@gmail.com

#syz test
