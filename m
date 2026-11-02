Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630857;
	b=2v9IjOwmAmWoT7zrJJ+GTXHW8Y4A9PKauYepHhSsrU84aG0sugds/LgMfEVyWRpS7neH
	 nh15nbI/qOYgxq/42IgOoyCtRpRWuvAxThzLPT6gEPGtiorrSimO8AVWGXUbix0QPkQSX
	 PVPO200nrhuVj/NTNPHP16GP6WGbWRWY2zTyDzW6VXsOCqj4JMjudhc34pOAkKoTTbDcs
	 2BjKn/RXz9OzXClgKPq50S6znn/zWWDgs+6os5fFUIhiPCitA2BwAYBXwFSyCb4MCTGTI
	 OBBd1KjKnxwRF6+nA1r9OUEpDz6RIZNNqz8UnxeHXgd69sjtyJqt6tutE/TO9eBlB5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Disposition-Notification-To:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=gFxWaAr4e8pvWdps+x1ea8YchRLnBYcg9irtyuiJvGM=;
	b=RMjmzoZjUMQtcMUruAVGZMwYsurP7kGiY0jCwbZMm85v4IqdvrF/j5bNUvEJaKljXF3U
	 HMPL1OlkfIgJzBCxnx2DppvyzNtenVqXGbCdtDfDyY1WsQ52PoYnrh8xTQZQQ9niCIl1F
	 7BnRobk00qQgaZb/dipHE+vpHftuFgaKOYovVhKiXRKsJDj/KnIxqLJvS6Ze7WEkyQMhi
	 Yo/KCZ7RY+Nh4M0czFAC4YYGHX+6m2sgZMDKrNQC0NKp0ET8LkDXIb57Sw2gIuyudWE7S
	 UWXeBydE/j7EF1mUsMbVfEvnjWuMFkruTWkMq+3AsqsVadojfQJwZ82h6UEJz3o/PrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vOOwiHKI;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3426083620
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B3426083620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vOOwiHKI
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4cd28978b8so43619966b.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793630856; x=1794235656; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gFxWaAr4e8pvWdps+x1ea8YchRLnBYcg9irtyuiJvGM=;
        b=vOOwiHKIig3GV4B3RMpyXaNnJvZaW5WHqMXuZALmn7YyIgw0aneM5TYWVq80XIixV8
         u6RJ5fNn41M/8veQNr5jwps5Ukj8gbzp+KDPFKohS+eLwVXBvdV2KgVdB2NE/Xr6mMEv
         IOSwnRj0EH2SiqK6YOcEsUKaKvoP7KgasR2XVmt47RJox7gaPctJublgkpgb5eWGZPFa
         VxRmjb/10Ns7IOqFCEZg4nXBN9kF+/fZ6DDi/FlUD74LsAHY6q4rm+kUcYUeVDdcDGKv
         KALPkMWB5q0tNLogDjZHsJVT4/wzvBadCiJKYDJhkt9pDx/aS29KY4Pwl1MNLVnUh65X
         o0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630856; x=1794235656;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gFxWaAr4e8pvWdps+x1ea8YchRLnBYcg9irtyuiJvGM=;
        b=1MHjBz4xw3iRd3snHr0I2u+e1PAtug7/eThFuymTLlx/712GUfkkjYP2QXgYjtSkGC
         IGzSbXXTwDwbsSIXjirkLS5BhO8vPxVo9PBWFVI+CzdtqpCad0844ss1loxQJZ8oxbDq
         5gfj1ShZlxDrD9h+W1vpbYtuEKxMDnBxGkpKHMeKJDctm6NlMcc6xj/7iN5QPklKtzdO
         9Oj74PyYFvkcykPl0nNyQSOsC9sUlI5BFVzd+Yub2Zoct/MA7ghSR0Z1PJFXWlc2wJe/
         bcw9IdDmlweXhG1UnC8UBj6wc2kkWgqU4XqFbrkIVwqmlZ8NGoVWriwmYtJ9N/HeZdtV
         HzjA==
X-Forwarded-Encrypted: i=1; AKwUvBwgl0HcW8o3kqIV83wXxj+UKOu4iflTf/IXQ62VObtvYsZMI66rOFKk7l0faVipEUR/ZqcPAeUfkUa8wPo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WSQHUFlUWNZtDdVjaFMj6CU2hVCuVUhitYcbgDLIxkgUWontm
	JxrNTZfL2GGdrXXV2Ou5QNK3byGd9KPRmuczG/7srFs8ryFi1DcgSVUD
X-Gm-Gg: AYBFou2wT75i0b3u7NLBn38AeaZJG2F/Z3/fOiXAo88wJ37HVwjhQzRmfGeCZQ5plAT
	Xz2/gp19zWO2khEkhaTP+i81WnuEqd6+hAX4l7q4QK86Lm31uoFa3AExEWPrlQiLf8MckO5/WLO
	7mp+JUM9mNUTKujGocX1DRWcuvH56HWmrD0a3xTJsLSjNk9ButFx/3XykO/7cMS9a1jxCz0P9G7
	quu2ns1DEM6botwV70j+6x0xq3SCakjqCUcDqvXGLyKI37F2VlfvS2r9+B4pBFvI5MKoFY3+IxW
	88EHYkMXr7g9mrpWFAFbrfrx0w+meUw35Kck96NnKSfmxlRpLIMdZa6Chx6eODtlhtYAMxDHO9d
	mH0QLqIOWahM4Km9cuGVclVxEVyeqgdI9b9+AOKmTl9x5Sl/5LMGgoJCJUCWSIC2Kv64SmJbUkk
	jiKEgZeNGLUWzfI5t4dUlDPVzk4man7AxdGbvru0huaadTJQRnJvFCibALPfIBgJ8FkHcPNI6JW
	XeoGu2awjVs4Tc/uASsNENTenqalOmtk5PRY2dTlZzcw21MU6xNQrHreqrTLdVrBtvf6pb4gmzf
	6liFxUkPedgLlbk53kr2aQVwkwSuC5nZ+xs2PJ3wNzpe4FeE0w9zwwNiij9sprm06KLxBFUyXkW
	67yk8nihDqnFigQ==
X-Received: by 2002:a17:906:6a88:b0:c2e:3698:dbba with SMTP id a640c23a62f3a-c4ca7a72e75mr879925866b.4.1793630855489;
        Mon, 02 Nov 2026 06:47:35 -0800 (PST)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4a9a1sm400030766b.58.2026.11.02.06.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:47:35 -0800 (PST)
Message-ID: <bb43e80f92a82e1a27077a45606a9c7f2678ddcf.camel@gmail.com>
Subject: Re: [PATCH] HID: pidff: bound the unit exponent rescaling loop
From: Tomasz =?UTF-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: Shengzhuo Wei <me@cherr.cc>
Cc: Oleg Makarenko <oleg@makarenk.ooo>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires	 <bentiss@kernel.org>,
 =?UTF-8?Q?Micha=C5=82_Kope=C4=87?= <michal@nozomi.space>,  Paul Dino Jones
 <paul@spacefreak18.xyz>, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Date: Mon, 02 Nov 2026 15:47:31 +0100
In-Reply-To: <auig8ARnvkEoAagA@kernel>
References: <20261029-b4-pidff-rescale-exponent-v1-1-3ba54accf767@cherr.cc>
	 <bbd1ec87a9fff50b189f74cbd21e1d5bddf41136.camel@gmail.com>
	 <auig8ARnvkEoAagA@kernel>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-11-02 at 22:40 +0800, Shengzhuo Wei wrote:
> Hi Tomasz,
>=20
> Thanks for testing and reviewing the patch.
>=20
> > Should we maybe add a warning to the driver that the time exponent migh=
t
> > be out of a sane range? Sane range being, say, 10 to 0? This of course
> > would have to happen during init stage not to spam dmesg.
>=20
> For the initialization-time warning, would -8 to 0 be a reasonable
> exponent range?

Yes, I meant to say -10 (not positive 10 obviously) but -8 seems like a
better fit here.

> - -8 is the lowest exponent in the commonly used signed 4-bit HID
>   encoding.
> - 0 allows a time unit of one second.
> - Positive exponents 1 through 7 would give time units of ten seconds
>   or more, which seem unusually coarse for force-feedback effects.
>=20
> This would only be a warning threshold: the driver would still accept
> the device and leave the rescaling behavior unchanged.
>=20
> Does that match what you had in mind, or would you prefer a different
> range?

Yup, that range is great.

>=20
> Thanks,
> Shengzhuo
