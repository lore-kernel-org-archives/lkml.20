Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DF34DA9BF
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790609478; cv=pass; b=JG/P6cw2t7o+x4v7Jdnu2rqeY3l7dXWIdUTBSTkZ/7ftYuPuR4OCE1ygXmdg6Tz7ylhGGoVR0O9psGt5n9titavshHjEWRnpwUsWr5ldKmvE7Dk9kknZZTseSrOIqfZPuKhgvnf+KUAGHrutRjxMHuY+HHDb0N5zrdvBqnOrq28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790609478; c=relaxed/simple;
	bh=URdrVF8CUCfl5cEEKueYF3bFcAaehDEpLdUsL9ZEN7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EjXJuW2AkoWUUXAbXLLDpZt0TDTxWlu2/bc41mTJFF7yf9kYS+LL99QMksLomlV4HLHB2pZAsT0zVtOcgW53oAX2X1BVeuJpBzZVPgo3D3qw6HmkWv2aO+M37JLqtMgqKToP4othT57e1vbaEAFCpSAfVbvLd7fri09vpHrNZgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pFtM/h4q; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pFtM/h4q"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2da4eea067so243112166b.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:31:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790609475; cv=none;
        d=google.com; s=arc-20260327;
        b=MCLMZVEUl8OPvp4Ezm8vc0YlMF6hSnhjwc4Z3kfE+hnAdGaOY3x+6sxdTkkiijFmTb
         /f8hgFPsWKmBaKtiELrS9B8f38xrLW5vGdxXp3nH9YHdabTW3yfP3pdXk4OHs9KvSLRO
         wu0Yh7nF+/6MJ7FrHbYBnhhbRZ/jBjEMjAevjEf36g4xtAzZOwHptR23HG7H/gsRZ3l6
         0Jsr6qIX8OPTtdrdO5l8KZVumWgeo7+Br2aG7H1QA373lWNBlTOFHg15qdXVueEAFqiE
         8/jXrGXB22IREL6mBwaYMw7Gct9FUVQzO5FvXO4aRGhYt0CfXsNqcU2j63P5KhoPdIiX
         NUeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RAXuWKTislQVLPyYyJ2DQuvsjvgmRgUDTyRccJU8uDE=;
        fh=w7FZUBNIogj5ieY0xxhJqjrnUMI6BIVPxBMZiHPDi+c=;
        b=UixZxGWp41L3nNGVcxNoY+YIUtztShT36IXTOVcVIA/L4CqBBLcS5CFb/IGKSSqFqt
         iLdhty+QIMShbPBmsGIpgGlTz0yTlXm8At0AVW7Lhd53Tn5/Usrh91XwxZhadtf73QjA
         h54GCdlbriFqaaDOiKdjy9TJjtdkDF+uFKjLvAxqW7M95NTrAdvRhrKxzib24XDpmpPW
         Yt71+4WGMZ8ChTH/VC4sHPJPc7qHeNCS+WdxMWoz/4BaKtWpADKX+FU7cLSp9VECzmJ6
         dTlb155yKErjUJ634gL9Dx+rBm7Q0d9qej0soMXnl7EztttU3VYRYDD2umWUlJNONqCX
         mn9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790609475; x=1791214275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RAXuWKTislQVLPyYyJ2DQuvsjvgmRgUDTyRccJU8uDE=;
        b=pFtM/h4qzUo22QBrJ3kI8EXOU93rF+MkrQiCAves69ufrXDm0sL5PAFaNveaQYc32g
         b/UoTAmBcWNLjUKqaFyE7gue8UKrYgbHliq+SdcWHKj7aHMbcrlwS40yzjIy1fwmF6pL
         6+JUjjnaySr80UqE9nvnTLlRAMdtVWOs9gmhbFWbFE2vzekDB0/JshAb5txzrZ5SFohp
         emtIFQ5YQ1osyCRUjLTaDzhDiJJqfCDuRw+fQn8JTDNuQY2nDJKTc04N/Uh6XxgpUgFr
         VuJ4RyAJJRaMGkDtzS7q98hoih/nJRfM5pvwEpHCK0KWfKL0ubzBjnaT3nUZzD4NgiWP
         OnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790609475; x=1791214275;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RAXuWKTislQVLPyYyJ2DQuvsjvgmRgUDTyRccJU8uDE=;
        b=TH+QYgvWoiNT9w1BFBHNolp5HLKDbePN2puc6TDsepNIOdy1ZDL4QXnF1bBcdJzlnE
         U6bjx3y5RpvWJCljfDSdbNys77bUcdWqipBHxMOS4dCgl4CtFiE54/NFlCPlwPMZwy1X
         jB6jcvGeWIZ/pUHvTbKaC9D++Te79JZZwKIsAGjyfTapveLvCP3kFAinmS3SqwkmK6ac
         8KkTCy0ma1HcLw29kCP9kb09rnCXUWUd5/LCi+ACBTL65UWxfgdohEOibzuAcCHM8Ht1
         ZvYGIpTczXL63Rbf0VEhfAacqTBd66c5ydp9EvQoW7kWiLjWA38BOC5Wdx7luJFnNcBE
         0gKw==
X-Forwarded-Encrypted: i=1; AKwUvByL3U4bWPI0ii/Ms+9pjnCf9pgIi4jvfZ+JgBMxb8ngluov5cKAdxELb4NoYqn2pBvpCA6oWiLV7A8RPRU=@vger.kernel.org
X-Gm-Message-State: AFuF++kjPpkga70S4vsfpuAwoDdSS5H1m2PkkDXoXVhGms0Izn4JyYW1
	oVOp+thwoqAG+EEYmJnBcFX3P10wNG7xrgwAv6Zg50UzF/Nf8pJGDnMSqgbsema8Nb2FpKbF+21
	8sJ1UoDbhCij17tar29VjHfTbbYYo4rA=
X-Gm-Gg: AYBFou2rEBmyWMoFdoQaK96SCiONLJaFtMx2HdMeFYVkmpEdJr7f7tscCE+R/YOdlYd
	mMXHTvJRgeGggTf2m3+eNacd85QO46OWJcDRmNcvDTkEooc3imLeCG6qFZGFsppZCV4foTxP1be
	l67rBOBThnzAMHkVrekeShG7r1loI0jnGzwgijn4j2nwyJJjthSH4jjaZvS4KTnGIBtjEQqbx3y
	x2GQl3Hv8A4Ge0WeHX7VphPSfwKAjR8MKa+JAzewerf80zVkAYVFduUExk4D/1AOgc4NCBoAa+U
	SluvfQLW+6mRv8E6L5N+AYTXJZQwyxN2nRcFXE03En5l+NZ57/rTjR6N4h6h/3EVbZsG8QzDq2I
	oiOxBcjCfEX/fNXS3GXXyj+QGsAZXD5QaGJIIcowKqhbP/hbdG8HUgyV582tIIjFIrMfxT84x3U
	ACYdUpvsnIqHZ6zcGV4IfL202uVxpfQMV2qdF6yFfV
X-Received: by 2002:a17:906:6296:b0:c25:541:fd3a with SMTP id
 a640c23a62f3a-c2ac525f2e5mr1076429266b.7.1790609474421; Mon, 28 Sep 2026
 08:31:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928142450.103799-1-vidhu.linux@gmail.com>
In-Reply-To: <20260928142450.103799-1-vidhu.linux@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Sep 2026 18:30:37 +0300
X-Gm-Features: AclHuK-5IKTJHGjSEb6fW93reQsGc4rhOzFPJDI5ScaUzd9TfeEPZ2P1lvjRVCw
Message-ID: <CAHp75VcW3ADQdf68Whmo7yhqu9rdi54YVYgyh5PRLPccH6aUBg@mail.gmail.com>
Subject: Re: [PATCH] iio: humidity: am2315: fix negative temperature decoding
To: Vidhu Sarwal <vidhu.linux@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Siratul Islam <email@sirat.me>, Tiberiu Breana <tiberiu.a.breana@intel.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 5:25=E2=80=AFPM Vidhu Sarwal <vidhu.linux@gmail.com=
> wrote:
>
> The AM2315/AM2320 report temperature as a sign-magnitude value,
> with bit 15 as the sign and bits 14-0 as the magnitude.
> am2315_read_data() stores the raw value directly in an s16, causing
> negative temperatures to be interpreted as two's complement. Both the
> read_raw and the triggered buffer paths are affected.
>
> Decode the sign bit before storing the temperature value. Positive
> readings are unaffected.

...

> -       sensor_data->temp_data =3D (rx_buf[AM2315_TEMP_OFFSET] << 8) |
> -                                 rx_buf[AM2315_TEMP_OFFSET + 1];
> +
> +       /*
> +        * Temperature is sign-magnitude, not two's complement:
> +        * bit 15 is the sign, bits 14-0 are the magnitude (x0.1 degC).
> +        */
> +       temp_raw =3D (rx_buf[AM2315_TEMP_OFFSET] << 8) |
> +                  rx_buf[AM2315_TEMP_OFFSET + 1];
> +       sensor_data->temp_data =3D (temp_raw & 0x8000) ?
> +                                 -(temp_raw & 0x7fff) : temp_raw;

Can you use sign_extend32()?

--=20
With Best Regards,
Andy Shevchenko
