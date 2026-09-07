Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CE143CE4D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777155; cv=pass; b=upmcUShz90UM/lYIvChGSBPjI9gnz15VqVsmA+wLvq3EPl5hElCY37MGQRFKJwGy3IWNg72fd2tYeJzRhF16pwfT27CuhGNjq97+pKeDxXb1N4aNJ4R8MMSk4hMPHrGy7wDWSkfhL32v4uMJuSQcM1cEU1glOc0rnb5UBjquOBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777155; c=relaxed/simple;
	bh=X1qWDgE4nF+kcB5zeHXPeP2a0sHwXZUBovy4AQQ1Zh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ux77xB2gqFMN8UXLKQ1ZfCeYTVl2nZrhg6XDXfKt1Bzij+CtFtpX84/J929KDvdVZ2WFwG+HZaDebNROmtXWRaO15Se0K2lMcAIxQJmoDthBCcVi8J1vZNhREBcovto80lh4+MTE9K7KTN6fPVoRZloPQ9dKL9eJssHFF+B1u7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZUgWUGN; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZUgWUGN"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c262204cc80so297180466b.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:32:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788777152; cv=none;
        d=google.com; s=arc-20260327;
        b=LIYEOPXrDSL/9xo5PLeHrLWEXKft4UVHblQ+LoTL6Yd60YtkH7Fwto3Qnnrtlfhodi
         QcKp70L9rfrixX33m/7QkQW1A+H1eMe3d8K/M7SjUt0IGJJWdvCVpVlgz7mlZ2MsDBWN
         ilar95FLLrGjknQGcVxYHkcQqq7jYRw6e2QIPp6SEZZmpZ7t2BDIybIvdQ7UhIioY3kf
         KvM3sNVAE6zZXvClX3ldcH7txhxuEwH5xscOwG0CYlXDgNRZ7sDCyuSYAX0lc5S0Qlb4
         u+8i4qbyHVSYpXJCkBSbM709cBwa3Y5IwF7e6pKs+1dj58Kgv/VbFMFQjC6Sed9np1Pf
         u5+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X1qWDgE4nF+kcB5zeHXPeP2a0sHwXZUBovy4AQQ1Zh0=;
        fh=EnLfuI1xF1pi/fBRRJbMkXyvdjaox36WWFRgIH++KvA=;
        b=NwRkqsGhx4upUxuN2gi72ermTz5q7bwr7bFxSA3nbDH5zKvLMZS8nuD1heOGsJV6A7
         X4QOMmcm+n+Mq/j2VXbPmCss8jl1gdiAI7nTz/Vdv1SiwiEWBraJfJJnDcAlBdlrKbV9
         UXfRBOoGb+SSP0eUAwVTDAnL0LTXoJYs+28D6PRY7tkEC9dz2zKzZmMqquhGyJVOu537
         I9FmHs6SFgFEefwUFYcCu/KQO5tQpjlZCnT4GlcnncH7556sQycI+S+pVwSKGAubbjig
         1G63hHI+LsdL4Lm/sXDDqdtmE1FWocItq+8MpzfZH4yoLYc+tDsJ7IeAXj1UC8AtEZGL
         QeRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788777152; x=1789381952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X1qWDgE4nF+kcB5zeHXPeP2a0sHwXZUBovy4AQQ1Zh0=;
        b=aZUgWUGNhSKdU0nIKvkjb6Cw5yxj90QoLBEyhckqRrB0qA3hfhbB1fL0tnrHadsB5U
         LG7IjEYz0rDxcSvEFjVx7fvlbg3pDh7h3v6v+K/BYz94ttnmlbq0JpSX6TUNgm4PwS93
         IJl336Q5xTPjTQMAxlxOcW0n4z7iqZ/5eSjxpnFB68XlcwftBFdG6iFBjjbk44f+BjOU
         uLjPES0qhxiDcClsu2cuU6Ws5IwGyt6nbF6KY0FFTNsMM4JyMeC0kEAYKcFx0xprScCz
         8PodESrmtgT2HIXDHuW4B89WO4BTwoagjV3daDkEY3yba9yVoHHgDlNrTot2kAkN2Fuk
         +H5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788777152; x=1789381952;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X1qWDgE4nF+kcB5zeHXPeP2a0sHwXZUBovy4AQQ1Zh0=;
        b=ZvwC1Jm2G9dKwy3ThT9FatJEez+ulhdaGhkNmSeI6BRVTQlgEjNbiSoi5cQFjhnnWv
         urc5PyKrWhaefANgBH2deMN5GDR70XEMblmGVThA7THm1eGrVzA8bT49j3q8WhHmK7gv
         gwt4uEmDz5awILP7xHlVBpQnFvLRXv32Vc8Ot4ogWxIVei/+lEYSN3l+ICqPnzvKk8D3
         zpq32SAl+lBUtLe7dZnMxf5ZBeJgJrotofzziZO1xSB8oyuertmxcouOcYrM4LW5dnNC
         CpA1bCothTWO3YrdWYdMGjgj+cotZhXx4aTUQvKdLUT2Rfvbp3TUZphVHnIR+rshZt6k
         XOzA==
X-Forwarded-Encrypted: i=1; AKwUvBzshYhUZVUhw/H6aMVCRlNkXXUn/64YnpMmbev3YmnBfgbgQI250xjbfpBoqKSjgqtAF2fuP7WpDC7Alow=@vger.kernel.org
X-Gm-Message-State: AFuF++liO0uTietQZhvLvyYGRyI3/3AKPqSYn3Q0Z2ErznAn++X4Xt7e
	rMK7Y2P5jBw52/y/t3NIUrj2jJXRPBdb62YJaoRaFlKoqnUBIv7ogb/PTYKriIRxVOXodeIhkOZ
	WbVdZ76sLG2MBMxQp8dClmHN7pZeAj5A=
X-Gm-Gg: AYBFou3WwdiwMdxPKr0SWy9yXeQ9tjkMsVN0BqTcSoKbPwh0H90LLoLfTyJ3YyQO2Tp
	6WIj54PMYPcxwhM66V9rL8/uHFQxKQt17RT8dABr1RetNCymh80CjKicUDxZcsANLwW1ahcRqu2
	Ql42eLysEaER5e+3SnLTQJOIYG1k5qAtdC8FBYMmyVbDhTq0kxi4u1JYkfPm6neZQrZK5w0LIEp
	Mp7OcSNapGpYXmHOCt7YWuRFpci5QTARKL+PllDpqycDDz7YkyvDZXKSjEzTICBpuH+a4icklGs
	pb2KabJ+LbxyV5zXkwQ2VXhVwCJY7IGgCOvV5sqVknARdhBshezUoUq0jcjafNkG2m486dg674e
	Js/qMsVKyyZfuXk0Hr6W85dO7MePk2OdutXxCcZB6bg1fmTeJ3S8z1Op3SqVESh3gAVF15wbjZA
	s0Ylyph832YfjCjkqkSKjabJfpcA/oBGQ=
X-Received: by 2002:a17:907:9490:b0:c26:19de:9ae5 with SMTP id
 a640c23a62f3a-c2619dea790mr625724566b.36.1788777151897; Mon, 07 Sep 2026
 03:32:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907084319.351688-4-blum@kernel.org>
In-Reply-To: <20260907084319.351688-4-blum@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 7 Sep 2026 13:31:55 +0300
X-Gm-Features: AcwNN1WOOJgn8-p9-C3jUkiPvWDFmRlO5oCRAvc2gPgeLyW6w8fr-M5Dv74RW9U
Message-ID: <CAHp75Ve4pcd=KHcJpGW9qtpNJLwWsQjf-FzoNtkxdryVfUB6Vg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add and use supported/unsupported string helper
To: Thorsten Blum <blum@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 11:44=E2=80=AFAM Thorsten Blum <blum@kernel.org> wro=
te:
>
> Add a shared str_supported_unsupported() helper and use it to replace
> thinkpad_acpi's custom implementation.
>
> Changes in v2:
> - Add and use str_supported_unsupported() as suggested by Ilpo

Suggested-by?

--=20
With Best Regards,
Andy Shevchenko
