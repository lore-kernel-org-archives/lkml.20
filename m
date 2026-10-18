Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DE23B6379
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 08:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792312914; cv=pass; b=lCUkIkl7VXbcZUV59Vs7Tkf3mMzsqMbEGqoSsXHK6j7kTyvWIUIMTU594w0PA2N9Nl1qY5F8SMxNqxeEEA87XVa72QskQkRarH6cjWpZ9+9mtZGy45jo0NLq+f184S0IwDpxAuXBkM/77iNNe0GQd13AOpAy4IG8GW4LBSkewRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792312914; c=relaxed/simple;
	bh=5iRx2ZSxes9xpNH/ccBYerhwDJMxlHq/pyvCpsWU8SI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EN+hdqhABB5Yg+izqha09gdeYioPS5fL6MZ/sgDcRI258EwW1C3uR7uDQgSlvXkf8FRJLc23SC0VZeMBwemhxNDa/dkc+fyxAFCTZex1uteTmdUuLsfjxG0NtT3Re1fj5I030jfvJ5D17PBzlGVBLbGOsg1PGP3bxC9qinuRgz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VS4UZku1; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VS4UZku1"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c414e5d282eso127430766b.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 01:41:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792312911; cv=none;
        d=google.com; s=arc-20260327;
        b=EFCl3louhadlBoV9lKGaFEEWlP4lrE9OTIw60mLyKrlMjI6+rHLCQcFHAL2DBabLoe
         qsqdycBv7+VAUbkuEo+qJiBauM8hgxt/lUf4zi3c8HXCJD2NdBcFIqGVkRll8ZxeKQHQ
         avlz4iLXUoE6ONtL4IXLano4qecTarTDLJU35FOIdLfLh3uskSWvwutjnOWNdvfRmUMl
         1BnpM/kJN9I5Pd76W2W14Nu+luukcswAcwn9xjNpdsV8KMxf6rkiJeulrfCVCclbcouN
         LFn78pz584L77iVFOrEgdWKCVcDMs2jP61e5l6MxXQj5wzvZxzdCQ9+hS3/Nz3GSgxYM
         rohg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5iRx2ZSxes9xpNH/ccBYerhwDJMxlHq/pyvCpsWU8SI=;
        fh=gIEkMWrJXJt4o0PB3zixKbfWJwDWcMViCcCp1WcjiiA=;
        b=QrKYWmSBP/iYLnX/7DAM1hjD5Mj/rF1EzonROke7pekuZRKuKuxfq87Kxhl3ULfid9
         kpP4nhTP9R1+HaCZnRcUWdsp4YYCO2k6IQotT4RkpnKYdaL+bwDvj9IkTA20KtZhoh/P
         WW4seIsz/gXwHc9SIMbnRxBPRJGKb8Ui7LXtWaZSRsr/kwYiorJZLUWM8GdaPB3h3XnJ
         N1EuUxodtpvrvLsh8kB1IrIUsNH8vl2EDmtd3EmV1FZdLcOPBpzQtVVl3H8fsdKGwu4U
         dcwaUAhTOqg5qa/PqinAfaFfdK1sYJaC3leQfKyl632Ei5GJeFic96MZEd5lIKrGgPUc
         2FRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792312911; x=1792917711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5iRx2ZSxes9xpNH/ccBYerhwDJMxlHq/pyvCpsWU8SI=;
        b=VS4UZku1t06BlRiF1T9+BaNwWa/HYdm8UQq2ThmXtJ+uYUf//9yDO9c9g2NAzeNVQM
         JORBHzB0aOsMZUvzXL4d2fTOokKIQgC2MfQaQ2TqoJ9x7mrwDU+yOUc6bFAVrOyYlsKr
         ODPl4hNCBa95CUjsmn4JVZ8JA2qigfYMJFDPd0fGJkhXdnEopdYcQCP39BGlTtMgIGSn
         xWBwmc8qOQBjFgvpFUypj7yNOaA5XNhsqcGoWntrndSN5tHXC68pV//kg/PJk+K55axj
         cvr8RdQXshuuIbpWZd6ct/l/1KK5ppZ9j2VNpzaNyGcATpXkUxrF3hp7fA77SclezMjO
         C8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792312911; x=1792917711;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5iRx2ZSxes9xpNH/ccBYerhwDJMxlHq/pyvCpsWU8SI=;
        b=Y6tgvnKlvBZrY7D1mTub70TANBu+H84HSJXxLhFOef2ZUkFHjVWF4GOS4ZuX7ijdbG
         MbRn3mV67HYhzPSz4shDkon+ptRyA/7SEVXClvmyEONyTywtbxw79rK5r6Mq72RAnqre
         guFDmXrCQNwKsG4kkwXqj3HYRWsAbuaTjpTC/4csW6NONl+MuyW+ZkXvzMd3ANEg2XPs
         pafeMlcUannn/ABUIWxAkVYNfjrVjTIr+kbht1qqP53bYzVtiLaYPq/wvG5E/AZEoHrw
         8qk+Wzsj2QLzrEXc2xmGPlPopqGXLQlkJPs1vWrX+h1d0HqzMwMfBSDh4rIc+ESwCVQn
         9OSg==
X-Forwarded-Encrypted: i=1; AKwUvByfKYg7cHgcQDYq83v68HpuTbZDBwui43Y5LQG66XdbPdEFmJ76Yw1ZqkS5SH4LELxGTEZRj5d3/m4uyw8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQ7bDW9KBrlGwfJ2oue9V26AXNJrilrU4zHjiCdFHuBcjO9m0c
	iLrRthGemT6MJqXGA/vB1ICHE4ayloINqT4pvFzesqD7StyQ0fo1LVBAGqA5gi+I+2a+9Mb2M43
	WkObhlN2sWVuhQAF/+uG2hPOHmyoM+b8=
X-Gm-Gg: AYBFou1vG5y0NTGmldX1OHQxEDg/sffwdBB9ZCgKOzgqLfmAwbkVNSU/kEjC72Pys1t
	B6LA061d2U0ad12SzMENHlaYPQwTLlvdWA3Gy0bjZ0uEccZiEdT8ex7rPv3vLGi+4L+gYEntwUA
	rq/EjIRVOjYMU7FQ9LKMgxNYyi+z+Bd2i4Yg2luG6g5KHEYtwC5NU2TfE3Lxioje3914KW7vR1h
	la5bUeHbuYM170R4PDiTH7L7O3o41DJe4RN5uN3ntlASEjX9bZQ6ka4LtC93qQ5BBQyTbiBV+7B
	ryqQz72pXWbJVkMmD/OUnUreg/VFLiKFYO3YTtpUI4OoRvpfd/xREp7w
X-Received: by 2002:a17:907:a2cd:b0:c40:dfec:50b6 with SMTP id
 a640c23a62f3a-c41a0cd5321mr274282166b.49.1792312910747; Sun, 18 Oct 2026
 01:41:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320135624.223863-1-a.shimko.dev@gmail.com>
 <25916fdf-22e2-4884-a78f-a7926a99b63e@roeck-us.net> <20261018-dw-wdt-shimko-v2-ask@iav.lv>
In-Reply-To: <20261018-dw-wdt-shimko-v2-ask@iav.lv>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Sun, 18 Oct 2026 11:41:40 +0300
X-Gm-Features: AclHuK9P2iF2gWSz851uTbxbHnWf2v6nboUYIiTnbXgBU-u-2PjNlk6Dv4sXWhE
Message-ID: <CAOPX747Nbzs0aQBoxXx2_K9qY2_6RyMqtcpWcop3KrZqcm0u7g@mail.gmail.com>
Subject: Re: [PATCH 0/5] watchdog: dw_wdt: reset clean up and pm
To: Igor Velkov <iav@iav.lv>
Cc: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, p.zabel@pengutronix.de, 
	mika.westerberg@linux.intel.com, andi.shyti@kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Igor,

Thanks for reaching out, and sorry for the very late reply - i missed
the earlier review feedback =3D(

On Sun, Oct 18, 2026 at 2:23=E2=80=AFAM Igor Velkov <iav@iav.lv> wrote:
> Do you plan a v2? If not, I can pick the series up, keeping your
> authorship, and address the review findings. Armbian carries it for
> RK3399 boards (Helios64, ROCK Pi 4A): together with resets on the
> rk3399 watchdog node, the watchdog no longer resets the board in s2idle.

i'd like to continue with the series myself and address the review findings=
.
But it will be great to collaborate on testing, especially since you
have RK3399
boards (Helios64, ROCK Pi 4A) where this actually matters. i'll also test v=
2 on
my side before sending it out.

Thank you.

Regards,
Artem
