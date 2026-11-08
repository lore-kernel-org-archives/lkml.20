Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794170504;
	b=zdiMCAJX3dpJnXuABSYHsCPWp42jPJszka9aFaA8Kg+vrqPMXGMJREw2jt1OMW6QijDn
	 CvJzoQB6VCviTmVP4p3He21goGp6wmMNwIQt6sQfBq0g2xnA1IEOhQmAzUVNaDtRS2SH0
	 eSr0p3NjaMbNDm4diFIzt6QLsJvwfFBqxL+uCerfPg817t//SjHcmqERxSmt8jCMBHqOG
	 dC7HzOVVMQJsK3Lg6//2amSwOaApupO+fJKq1Pa9a93qFe09FEfHxmqpu+V0S1BfMz0tx
	 5XvUeUGqED4Gu/fDlR050O83I9H/RKq1Vbq+CEr7wKfwcVGDFgU9voslq0VV9q+nlig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794170504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=K13VqWWLANb+jPNCnSt91FUtEo2SHmNlcvUhSyb9ULQ=;
	b=Dy5x2GKL7wZow29zDRC7tT7tMaB7rb4JR/l2gUl6qxGYIJ7hfTwIsmZj27pxm9o4F2se
	 3WRTXVWw2sGVvZGWJa81dLrwayKYUeoUI6Vem2KFblPM7NkmmKdg4Vg2DNkmriWXik8AR
	 KCsIeOJorloU6oPiwL7DLilpMui1qXETUwd64rpWgdtJjadgPxRAJOZWKADmea6QXXG4h
	 dwXirEt/6qR67HfP2yaoSt8OFwop9NKlZdFz3LJzwNSE3rhdGeCXnEjIDFu526Cca6N2k
	 JicRP9IgM2/mSU0lkEmzWJgXzZS975hGlp2WHkTCcyJcL/x4WEeF7s8d9UtaKbdfuHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dyv9iOjh;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52741606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 20:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52741606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dyv9iOjh
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so1478435e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 12:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794170503; x=1794775303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K13VqWWLANb+jPNCnSt91FUtEo2SHmNlcvUhSyb9ULQ=;
        b=dyv9iOjhr3KGPyS4s8lOh+Hl0ohpT49BSEprx+bZAsHY48gYllYa3Etc1vHFblObLv
         UApm9sRajodVdYUa5Mjqu9vls0xQzdwyxUIR1aFgvWm8+dPPq2tKkmZx/gyWmvez1yR/
         zRh4VAZhiVlBPBCV4M1XJWbw6O2XWIw4rbln9TWtFUPcPvM0LFZM/OiX4LIOk6aAycHJ
         bfvnYG0T1D5XY7ujRRbHm5WgmnZUDou0O1K8smex8Bz53hj0R9isb3hGIJQFDh48FuMf
         bql88viIj/LxnDoJ1sHyV8rujrTWpGJPgnv3iLiRWDtaVq7k80wgshEEABmNxS2LuejI
         o92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794170503; x=1794775303;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K13VqWWLANb+jPNCnSt91FUtEo2SHmNlcvUhSyb9ULQ=;
        b=FpBeNyIsSpZdyCCFMEClSmTYzDAnJZbpcq80cdVTNBcuyOFDUTQ0rP0WlgtHZIsh6W
         M/gyqzv78tZhTqu7iFFDQVdxf4qRHHBW9GLBGOuoN/L+93EFysnpK6wn1jrK70m45zd6
         HydLJ9BroT0cCWsyv3+j+mqMjqTMqxSGUH8jijN65t5yQeAYDa1FXm9+JxhN1MGIczvT
         5+8sma5zSgtmwgPHLbeB00bhmg0Qlm23yjkvVi6tQi5WhU6vEtTLuNop1xucl8jFVV1e
         YfGasAAVTQdd3HwrjZOVzfjBz03PTSAyQ+0MvRHgKkXk6+RfaDIDhCSorFoSkz+BAMtB
         qrCQ==
X-Gm-Message-State: APuU4Z+Kn/8l6BvDm3bBKqO98D2l2ZhaTYMKaLzkdHqdwJaEA3YT59ff
	0Ka/ligb+C+qO+rzwluXq3Q4ckwRqQHmEMs7fXNPIaz0My3PSj/crRIFfg5D0PIa
X-Gm-Gg: AYBFou3g6/NBoEW2hzXA4bXXeu9BwxmG2uIMk5WV8BCH765YYSt/jVhUsZhm5zpp6t6
	5yyI6XYpFuZH2DetZ6HgUUm9z3niJ2V0ls8EEGToJ5gjTojakgk8kLxZE7nNKdeZ1cES4oPTmVP
	+F3FeIS2vFWVyVmr+a4WJBobqaL4nqYLCjoJMmVL2XOzbY71RyZDEB7Z0Y+Tf3vuUCLREbBQYKO
	Dvp3qEHEuOzNPfoOc6sxX6eGy6KHvEwjyMlPnY6wq62Nv6wIxi+ShabP2wpRcoJASy+soTJgmFr
	6gCWiTUrbpvitHOWOCeAFL158zmpm50a0cLzG+EF/xO/w2fEXAkqAq9YB/jQNZMeCoT5/hDAkGu
	qFig3UKixFK0sOvVtYh9ttzxPbReB5lsShSk23y0kgdQNv0h1CueiLTiaVzLWdiu2AZZZ6GeClH
	taR24J+ndbBs035RKxSjBFWuqMUI/2stWEqXGrCxfJqkndSKEqP4aZ06YnnfRSKUrBIOU0Ev8Um
	nImwuDif6koN4rz6AN/S7VycFaXkBRtsHjS8VJ1h18WXvdadiusytYJ2KUUqaey7BV6+1j+gUFE
	zg/1DoZF7+OwQ+JZOgK8eZ9Ia7HJMTki2M6S8YWUWdcDk9NYLP0bw1zC7nIeDmPYI7+cUoVbIKx
	eUMEpvpVeJA==
X-Received: by 2002:a05:600c:474a:b0:4b5:2c72:651c with SMTP id 5b1f17b1804b1-4b963c6cac0mr47339615e9.5.1794170502718;
        Sun, 08 Nov 2026 12:41:42 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f119b96sm89447915e9.15.2026.11.08.12.41.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:41:42 -0800 (PST)
Date: Sun, 8 Nov 2026 20:41:41 +0000
From: David Laight <david.laight.linux@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add offsetofp() and offsetofendp() for pointer
 arithmetic
Message-ID: <20261108204141.6112599a@pumpkin>
In-Reply-To: <00152592-fd72-4413-88cd-c78a3722829a@arm.com>
References: <20261105-offsetof-v1-0-4153f5c10edc@arm.com>
	<au2J-lMcEn4p4KGR@infradead.org>
	<00152592-fd72-4413-88cd-c78a3722829a@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Nov 2026 09:29:24 +0100
Bence Cs=C3=B3k=C3=A1s <bence.csokas@arm.com> wrote:

Not cc'ing everyone because there are too many addresses.

> However, as Sashiko pointed out (don't know why it didn't write this=20
> earlier), struct_offset() already exists, so we should just use that=20
> one, and probably add a struct_offset_end() variant.

Even that is 'another define that you might have to look up'.
A lot of these 'helpers' don't really help.

David
