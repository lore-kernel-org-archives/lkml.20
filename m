Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348682;
	b=V0Lp0r0ml1XRbUFO+acrFBTmFlhd5rjCSLXsI7IqmkqK70rRSNE79O85BWiyO4gh1+ly
	 UQP4JyUcY2m3YDC2Pr/5i6VsLwEiulQK/ul2oNdLiXzEbhYPhDaaz+Xml/ayjM54ku8uM
	 olWNpfnPlEo3Tw7TRf9uIakjKSy2lUbVrZJmXNEz8l98Xa8GkUwunqk4skI4eV/lHT4cA
	 Vq1jy0IxYGb0PInpqJ9IxU7dPCeDRqdM9aDb/ap5tL2or55O9QrM6j4x4lH/iTmvxwIQN
	 Vl60nlWGZ0DXiLzAbdNcGk/C3WWpj3w9C8Lm3ocN1Q9ZLEzwiJDlpflnzzghrhjLqgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=HZ7Z0KiGCVqwhkRcIn3IW5zwbm6q5Duw70TB57NZTJw=;
	b=SmaTtmHCkP12sHHDARhLmYxk+S1y+5rhF77boxd+6qQsvPrFtBA2i5xIddFW4fpPCk21
	 B54mW0BNTJFOfesaKhQS3Pt9oSQe0G09o3q7q967DeKmiKC3bMaqo9hb3UqMk8OASkV8d
	 rjgdwBLhu9W0uN4bVVUtGBxaLfPamiya47L087Ynrvq7zX8dFU0waIMMKQurvgiRzpXlS
	 QADrfwz4GgXOmaxZE595lfx2XcbHwXie4pikrjtv98SusAbRrP1RPwr/kLiiNNVXbZPSZ
	 GlAARM2Of6KGWOJUpFRAb8vnalpk3EjJjMX5uQPanQr6HII2p81/nJfFqrhCY4ecUaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nW/rLNw2";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EC3606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7EC3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nW/rLNw2
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so3502645e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793348680; x=1793953480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HZ7Z0KiGCVqwhkRcIn3IW5zwbm6q5Duw70TB57NZTJw=;
        b=nW/rLNw2xW9CGeIYsXOdFobHl3jgIgIj8zXSP+lRilpK8cbfWld3zglmwMUuK5rUR5
         nwO9xA75DHO1QeKSksn2Hm5jQZyhnOP/OCo6x2wz0vXPiGgTnyLhgVVrSy2rCbJ2WUvj
         1/1WCz2NEvlTVnGcxt/kuElmpBmqiS2gU6aJtqEhVwFdJdQLgkVHLRKvWJ3thqdEhxN0
         2ZZPNBPtlljRamZbjjf8hMW4oN2IbSX5aUriXxA85BKWy0AU0vrIHLl4W43fYrEhGh5/
         aJ0QUaU3Bf6IJ/nN46ZnH20QVOrun/68kRuuFucyNVC3935Qfu1EuCDDJocXcC1UEzwm
         Bfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348680; x=1793953480;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZ7Z0KiGCVqwhkRcIn3IW5zwbm6q5Duw70TB57NZTJw=;
        b=EJLsgx5kWc37s82yoSdc+VcHKPwk9npBW8biRGOOJiVhCAX4LbtkMGEMJZeiN7Wy2R
         ooiJv9UWScSU/D/AK/vqwhJ/j0r4YMvI2oKpJw2grHTBl07OtKQAXroqsMU4slnStFz7
         U3WoLNjLm4pBO66sQ1QUnmDY6zK9QpdMMfppYsBVJ650c3Kxtj0iKYP+Nj/B0uEj5JZA
         SvX1qDWVWU2tEzEL02OgK5Ny3QdNmCWiT7AZBKZjVeJhcha5LojsQ3fTrdpTb95otROE
         BTo2fkDf1erTezLOmXcEU0Mar6IMe3ZOuC76o0yq8q8XXXSWpxUH0jObv+oxgXawzXBk
         rUwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzM0GU8DDkNvZkC/PZWHW8KpnN8PNOo1yZsFbBd6YUfctCPbY/uBnr5twznMWjuKTmuD8Peuu4yNieOvgk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIov9oYNla3GbWdI0ImtwQEDwJK7T4lUgGacLH65PEBfBlJbZqR
	N5EYvnvAU3hgeO1KFldWC8COC56q3Cgex+4wO3ciLFw9rIij+THiwp1y
X-Gm-Gg: AYBFou0q1o1IVYxg+61CHq19BozHaqKf5JVf/9wfj+41ObFq8OZ/kgUVkG7R2q/spAu
	K8ixggyoGdyEk72cKyPc4gPMtaG3Mt7vXQt4WqqmFGEFhfHvr9jMaCrSUK1VCDf4yL3fK8JFoxt
	AbjRyrC7M1TRvzWElFv0QpUZ+FZoLSGR+Pb2VrrMKRV/QZZCsCyq1SZonI4QEgCnk2TXPsFdyCU
	8xwLv5dbr2x7b9wOgF5N55enzZZEiCP4P0HK7izXP3Poe0UULqcjpRxLM79r1C8OLv6GXo64g3S
	jQ2RpwINrZtHmR32HkcJyQCyhlRSLMzRx1i29o9JqlrfMYes1Fno8BJqlf2hYsSHMiy/93KwAbb
	EqfzzBgTOegrvjkib8UNDvCBOEeqxWJWZ6griKNJxC7HZssMMWJPmsje8NHr+AAEoH4oCivNCCO
	zfj/cTXMKJH7KrL1UnfFmJR30BwjiCRB08RYvFQE+taFbhphI/ml/L+hTRCNfsEtGYyIQMc/JHb
	8tSQZSCtEnoSQY2sqQ0JLVRwjr6YWIsP2d6/HO/vHYZ9x0xcFdLFLyPeKBkRuVimuj2rIlOacuy
	SvZvg1MzEfi4+iMPyBO0X4V8gVnhfGcpTYNLdIHUgzcLG9OE7BTk3rZTJWbPwvGBXeHii1THXM1
	FCza50mnWOE7+QX7DUkwMiQvcBiFuGFh3H1nNz6IYWhUJsygjtlsMJdiez9ARFvyaWoX8GeKwR7
	lq1cSuJ8bWf1cjvoYvGODFQOPx7ctqyb86GOnA6+K4QXqw2ffolxZwZGtBl3qGxJLFhFrWvKABk
	Mg3VKp88W5tBLP3bXWLjyVPoMaCN/HJ7/veTev6
X-Received: by 2002:a05:600c:46d1:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4ac187a72f4mr30429825e9.22.1793348680262;
        Fri, 30 Oct 2026 01:24:40 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm122659835e9.4.2026.10.30.01.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:24:40 -0700 (PDT)
Date: Fri, 30 Oct 2026 09:24:38 +0100
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, stable
 <stable@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Matheus Silveira <matheus.feitosa@usp.br>, Lucas
 Rabaquim <lucas.rabaquim@usp.br>, Stepan Ionichev <sozdayvek@gmail.com>,
 Joe Sandom <joe.g.sandom@gmail.com>
Subject: Re: [PATCH 09/15] iio: light: tsl2591: don't divide by zero in the
 dark
Message-ID: <20261030092438.000029bd@gmail.com>
In-Reply-To: <20261027-llm-char-misc-iio-v1-9-0d818334f6c7@linuxfoundation.org>
References: <20261027-llm-char-misc-iio-v1-0-0d818334f6c7@linuxfoundation.org>
	<20261027-llm-char-misc-iio-v1-9-0d818334f6c7@linuxfoundation.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, 27 Oct 2026 17:19:13 +0100
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> From: Josef Bacik <josef@toxicpanda.com>
>=20
> The computation of the illuminance divides by the count of channel 0.
> That is the channel which sees the whole spectrum: in complete darkness it
> reads zero, and reading in_illuminance_input divides by zero.  Depending
> on the architecture this is an oops, a warning with a backtrace, or goes
> unnoticed.
>=20
> Report 0 lux in that case.
>=20
> Fixes: 2335f0d7c790 ("iio: light: Added AMS tsl2591 driver implementation=
")
> Cc: stable <stable@kernel.org>
> Cc: David Lechner <dlechner@baylibre.com>
> Cc: "Nuno S=E1" <nuno.sa@analog.com>
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: Josef Bacik <josef@toxicpanda.com>
> Cc: Matheus Silveira <matheus.feitosa@usp.br>
> Cc: Lucas Rabaquim <lucas.rabaquim@usp.br>
> Cc: Stepan Ionichev <sozdayvek@gmail.com>
> Cc: Joe Sandom <joe.g.sandom@gmail.com>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---

Reviewed-by: Joshua Crofts <crofts@kernel.org>

--=20
Kind regards,
Joshua Crofts
