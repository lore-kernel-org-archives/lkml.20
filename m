Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793004300;
	b=meqxEX0HJk1dqhcqrrMQ8Bh4Rdrh5vnGTsafVZ5tHXC66L2qi7EI0zoD4a+I3I4e1W8E
	 xvmecTqNXl898H+Ih8ZATmEO6jKhOKHFKbKi2NcQJWkbHupa39bY6s0sQxFhxRvl6DIdH
	 eKOxRSNrQMNa5m2QoqUX+vUL9KtbqH3Imq92LHa6LqJwUFjWdjXX3DoBocFdVo+5d+z4f
	 IkODxQomlLKG1CQ1EIC/GVshqn0hsz/HTt33IJaWNWZg6Qt5djMLZRw2les+LiHNuzk5Y
	 t4OtNLF1nWCb3v7BGmJq00QpmLTEytY16WWXhRwrVzq819Xt4RqsQyCyLvcLAaV71EA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/+OfYGm15CkAH0WHnJPCzWJUSoHLWoxQ7qLcfLsz2ps=;
	b=vVTX+N/OvuL4ee3mAD9d6xj6Qyk+uoO2Ye4HS/Y2ZJQDAiffSg8n6KnVJrVi6dnX9Fys
	 MlChcjajMwVfIrecBFPNP0hQZk8hDPhZW8xAqhVLEXMJ+F56/pVd1jvMfUbkM117qb2+z
	 vaOJwY54+Ade8W9v4jqhXp9e3gcP1SdKevVaJ5cKBQPPxGYcit+MpOUlLePw6BJiGQ7p4
	 slKETC4+ZupirR5wYWMfah81Jp4osUGOvA9fBUpmD6JvzIG3PkzfktrNKkwO4uMtK9cBa
	 wrBe3tRnKkK+67Jou/s0/6LVG6OUPGXfltDUO0fZvULZoVzF2VeBNnbW4QlTnfpvOMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oRzX2iC5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F119F606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F119F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oRzX2iC5
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-89d6bd67045so1200311b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:44:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793004299; cv=none;
        d=google.com; s=arc-20260327;
        b=JVUDbcynCd685MisfsJp1wGZyJXEHQsQJrEjmOkHxP6ITQg0hqqbC4QgYKjZ6/M+Cd
         yvd+zQqhNhjm7Ms47+rkJAZguhPX83sy7iIsUC0NQXRYoP53qwrSxEOga7VVtY2wcoki
         H61eLzfrtK+Z5OhOqu4MTB0EP92T00jFRQ38vdFfWCBUrDgGELE7IK0v5ajKF3uXD6PR
         EcbWSWnEoqJm7fDDAJhmdyU1+W8PpxA20ZZcWMxVoo9gXRw6AVJpypKutsdqZGu904n3
         WH0oRSxE+/jfvEDs3cKse+yn0cxD8F3L6ovI07AzMGNIouBdf6K0OzgVRpqsZDGH/C3B
         opEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/+OfYGm15CkAH0WHnJPCzWJUSoHLWoxQ7qLcfLsz2ps=;
        fh=ubFuLJrgHuGUaxrO7E/jd15gIeBgdrZCRv+dXpnwjKI=;
        b=ERvLvRQwPnwKqabmQQfgJCqu5ZoU+ePPu2nqzfVjZmg0tnV8e96fMYscjEgiryuj1H
         +KHWcY32LBOaIQdv2FuEk2fCvZJhsKI2rh2G//cmfBbHbWBIm8PvqOCug2wG0ZsRBfMs
         xTXkF2L0ikSnhvgH2sfjkwNM6DP60VP4j5E7VZG11ECzfjFmRuvspAz8ZpWRN5lSFIZw
         hdJ3Xl/RuU7oupLSaRy9mVnXye6ppD5UdTcC4+AJR5PJgnmYNj37qhRr2ba5TGYXWlfc
         jJ6FZVpUYz5PyyxNguCOuAPSICRRtvu2DVXFUIwqNEKNcH1s3MSDqHfXyV7rsXh/KB0T
         QlIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793004299; x=1793609099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/+OfYGm15CkAH0WHnJPCzWJUSoHLWoxQ7qLcfLsz2ps=;
        b=oRzX2iC5sjA1tFsiTB6aNwrdj4RQk2BmimneSw55p6TGBTSWxl+cHqUxqLvokDzhqZ
         D1jRXo8sWnN4eYA5ESKLiFEW5MwvxkO2PjAOrO63oMN1FMmj24mBi7ZAuy+KFw4knAz7
         Q8ktZmS5fj8Jjaa8oKBEvVgJNYCumBOLeUW51y3RgCqTjOHFnP3BuIcuW2yr6OxqHKME
         baSVEnMzdVhN8PRX3pGcNWDNA5yfDeohTRClqAOGTiEy5sG+56azoZ/gmX67c2u6matY
         e3HdbKI0XX1Ab+zKHVzZebup86u9NwWrw9KMRkoKj8KK/tS4XcBaUBttDJgUoUxcjyeQ
         t0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793004299; x=1793609099;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/+OfYGm15CkAH0WHnJPCzWJUSoHLWoxQ7qLcfLsz2ps=;
        b=izhz1SV50TIslqMGv/ivbkV960pzcnJ66NRldG3ePTTLsvsZ5dckZZTVaRwTQqQsdu
         ISAbN+GTUYhvZH0pW0K/A+mLmq6WDOU3PhVg70YGu60U3/nIw2WKDNVQx73jyjPKzBxt
         3p49qJuyaKw1+fW7TT5P7p0E4I5FW2Zv23oEQUsoJ3pxX6/vrprO//q7oP7ILgHhInMX
         Z/e6vCjU4XRDHk9hXdZCMKj9QX2SRifECFjjQSYG1AAVDxtZSyf3de9CXYEHDyw/IG3A
         taF/g5U15NRMat9ykNS38OkCbRAxz4bK3pOZ+IuSyCFqva2jhhxlGTjKXU2YDWCXxSF1
         GsNA==
X-Forwarded-Encrypted: i=1; AKwUvBz+s6adimriYdhXPzZ9rN3eQsuz0pbdAjLZ+gcb7f6i5XrwJHlr/3LJK/d4eodIBEu9HXIUEn5kdWAr9Sw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+Ni42fkF3/F23zDYOVz9LHIwjJLNbtDUgkhW/BP6fKMpdFjpb
	jjSrU5u3rl3wAwxXvVWaPF8ldsYTgcN8uyMWP4xEsI8UDIQNyKyJ8do4zq0xJzy2dwIgtJsMqi3
	usMav7rnXO1OpQu/+zniyhczLwV7OvUA=
X-Gm-Gg: AYBFou1RUvB4s9uLFOMss3hOnzEOdMjLQLeao6ajEgq6GcUsYYCbtyih7Fym4jX3WV2
	MB26PV+4niRO8LopW695Bvqtr+izIVHCAlSzMDziRqKd7lm83+cwYilQ92bdVBhl1eNQTzTNhII
	OwE3fnBnPJxgQC1X/npAsuFyPiKN0GPv1IknmIBRnGi+0AJiAfs5TNTSDs88i2sRS3IiJwuwtiW
	BHYwiuCvE+n/c2CXc+gifYYJs233Jk8Xs0L6wEu3cCPzA0pd9ZdWyvUIV0KfOHHPn1HlPK5T51a
	IYRtrT88gNeKteawDMFxIwPCnZFeqacIo0xZTlAbi2WmtFVxT5sBduhjwevMDZ0DbEztbTjP/dF
	3k4R24/fbqC1pA4lSCWoyiHKTlpaZ3rBk/PKGgbsJPjtjHsR7E8yd
X-Received: by 2002:a05:6a00:4b50:b0:881:236b:748a with SMTP id
 d2e1a72fcca58-8a36d37e6d4mr3132209b3a.16.1793004299238; Mon, 26 Oct 2026
 01:44:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026003918.155321-1-pmazzini@gmail.com> <20261026003918.155321-5-pmazzini@gmail.com>
 <20261026091042.5376dd7d@kemnade.info>
In-Reply-To: <20261026091042.5376dd7d@kemnade.info>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Mon, 26 Oct 2026 08:44:49 +0000
X-Gm-Features: AclHuK9_NUBMdrtPDHUqBa1joWHVyrlNOUdr6n64NQwUGaOI057FJmNNARkHWA8
Message-ID: <CAAxh=jv7DEPMPm6-d19w+R_jXdB7qx0b7R_kaf5J_ORN5PPROw@mail.gmail.com>
Subject: Re: [PATCH 4/7] regulator: sy7636a: wait for power good, then switch VCOM_EN
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Alistair Francis <alistair@alistair23.me>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It only changes the power-off order (VCOM before the other rails instead
of all together), which made no visible difference. I will drop it in v2
and keep only the power good wait. Splitting VCOM from vposneg can come
later if someone needs it.

On Mon, Oct 26, 2026 at 8:10=E2=80=AFAM Andreas Kemnade <andreas@kemnade.in=
fo> wrote:
>
> On Mon, 26 Oct 2026 00:39:15 +0000
> Pablo Mazzini <pmazzini@gmail.com> wrote:
>
> > Wait for power good on enable, as the TPS65185 and FP9931 drivers do.
> >
> which is a good idea that the consumers can relay on the regulators being
> useable when enabled.
>
> > The VCOM_EN line was requested but held low. When it is wired, let it
> > switch VCOM after power good.
> >
> What is the reason for this change? VCOM gets enabled this way, too.
> I added this line just for having the hardware completely documented.
>
> A possible scenario where I could imagine this line being useful:
>
> Calibration of required VCOM voltage, You would turn on everything else,
> do a mode 0 refresh on the EPD and measure some kickback voltage on the
> otherwise inactive VCOM line and have your calculated value for that
> regulator.
>
> To be useful, several things are needed:
> - SY7636a driver needs to model vcom as a separate regulator turning
>   on a vposneg regulator. The TPS65185 driver defines a vposneg regulator=
.
> - ADC input is needed. The TPS65185 provides (not implemented in the
>   driver yet) such measurement. Of course that can come from another
>   chip.
> - Some (probably userspace logic) to control all of this.
>
> Regards,
> Andreas
