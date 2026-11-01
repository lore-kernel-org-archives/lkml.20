Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793548753;
	b=CJlpx1EALSyAAwArF3bza3QwHtVq48+RxHYyOHIGAiMB5H64gZaWIc+o+f1rF2iEcCYa
	 xXfKWOg61KxxG8fL2/OCMZNvmAaSxQSNjAVkNw+VHIqeJr1xISRfAT0EXYMjw0VOLhZ4R
	 VxchCiY3KauMKBBYwWa2rUNPCsit0VWxyYEg9kQ7nCwWbIyauCmxjjpSd5f93TeRhMKsg
	 Q/IYKSeE4/znY9lrhfFABd9O3IFzNagdK9LueBynmw0+OQVjhgBG+A0L3Se7T/R8XL15Z
	 YJIzY6qNCXbP2QS+K2fQpLYa3OsNqIazf6ojnWotXxxo/vbf2eOuOgBjJ4DeszVMGdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OaBbso/nWA2Q4yJF5+SbtI8vmJ4zVrnNgMLlXI5ZDPE=;
	b=gby/eMyWFci7v99yQe+KJUzIIQneONy1+czV8UweLPU1scD81YjPCXG3ZfRLiN9xJIzt
	 LzfRRm7ffRZ/a96CwsqHqHeeCJ1vM0lfcIwsjpz3iU6G2LMUWVFPK0fdnHO3UV/ElWzYw
	 G8Wz+pn9vVo3+koPLFL7pa3NRi/PHnxYjqgUKTRLT/IVs1Z+KYobPDZpegxCUTyMLy/8P
	 MA+56d/Fm1n0uojqfh6sRaJWdDnyh/aIc8A1M2GxhcPAonY+KD3W7QQdPRbwOEZtvMGFQ
	 B1O5pdolwWKlATFe98aJ5kxqs8EFrIIK61nIskMSHoQ2MDixqh2KvlBZLA0q3v/EQxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vyOmQU+G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0EE606A327
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E0EE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vyOmQU+G
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3550c917fd3so3078118eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 07:59:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793548752; cv=none;
        d=google.com; s=arc-20260327;
        b=cWwPfBqoQmDMNAMFc/oO/gObgAGRWokuISeNzVdKZLoy+ohnGA8MltquRDpZDd18gv
         sIiVfUuZbtzcten0qMkkRhQv+zeN8v6NNJGxnzrh3hXBC20aqtq5NLi5nurCXzv5M48E
         dEx3/3aO2hhOxvCJ+8vOdweoSwsfffgpNA8W3M7bIR7HnhFIF+H47mjAbepGqIhO3yRp
         xT4B/chGKW/Qffqzy/i/FPWhbEDzx4yAbn0GI3xnMGEKtH07RP5Bccwzr0yZmrK/9PjB
         aWr1VYOcVkgC1M/TDiDI0vDZcJ+GToFbu9HNgYY6z5WEB9y45VpgqS5yEd2CsZyLcM6X
         q34Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OaBbso/nWA2Q4yJF5+SbtI8vmJ4zVrnNgMLlXI5ZDPE=;
        fh=P7lMJcmX4/vrHCANyYzdhMa+94yuHFhpWaesKlSCLhM=;
        b=e2PH+4LWhv85eQXDLZO8PJZl5DfkQrhxhvxQm8yWPCeHjW0wlRWe62SjchuQ52R62X
         OcsKh8ZB/GRewMxYbkWm+b8izYG3eUotElu52uzhXAW451yhzK/ZotZ1iVjXtzBGZb5Z
         sQeei/x0VFqF/xyK8noKdk2H0jTFM7H854IOrL/mzv6c+GX986jozTaiPGlyYk/I+GYA
         RKtD5meoTGtc6N65do9qynTAhaGp7VAggTUh69sZrPCXM8jL+PSKsezIqjw/ANpiMIg1
         UmZ3q+RNqrlSBVTRhw9Yw+GWia/G3SWQwfxHBeHcfVjKOTjErA5NjwCvb2APVcdigsRK
         jNLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793548752; x=1794153552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OaBbso/nWA2Q4yJF5+SbtI8vmJ4zVrnNgMLlXI5ZDPE=;
        b=vyOmQU+GIUzXlWzuISIAqmcM+65J78pwMqPSy/SmvKYrqsO5olf638kBeiXOM3v7fD
         7Gjz2ZgbU+Y14eCQ/WSShxwfOn/HC5FFJPn+gZia6EiAo7w+pYIMU2t2Ia0UWj+TUBPg
         PJDZOD7lvjlbUhpVweHCokLOA6EG5D8SVEorKg9Age6da+KPUy0x3ZqNQOIZ3sdcYOsI
         lf0khruygB9gKpxiaUoEzlksGd02/37GJ7qNZFPu2SNZAil98x/HUwjVANp1Xlcy+UWg
         056SSxMwD8fwFs3wlSDLNpmICXNxGhgJxtkxBA08Ee/r62MC2T6Qxlcy6FnEvqnVfVsh
         DI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793548752; x=1794153552;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OaBbso/nWA2Q4yJF5+SbtI8vmJ4zVrnNgMLlXI5ZDPE=;
        b=C4xebFAzFQDP2zrDZ1tpGYJu6Q0rfcCt6/0WEuA4a4MFnAySPo2GGvi+VWntKtHDWz
         6wz9vMpDhJmdWLY/TUa+nVOucLe17uNfitlIFWoozFwd8BUl3j6Zq5HBax70vkAHvMMq
         lRUG1yIq7wD+K7k3lwmCHQ9+zsjqvVWU6VZYeG79618sTcprAVCOcDUqupJC4fTO+ETq
         X//pVpVTo7VeNL5lT5xmwMSLh/gbcCKEWHBYHK6p6DNzR2Vq288Yt3rDyErnQ2HUetI/
         PI6+hHYXvm1nnduvVVQeIrVIcoz6D7SntJ87wB9fWV1mnZJawXW6a+WZIfr52CFLzVkn
         0T/g==
X-Forwarded-Encrypted: i=1; AKwUvBwzaX3WRMlmeyVoHCsDR1I/ADwJiXscJcKju5HXowFnsghTwFJAyHGHlarvVXP9meGY3bCvC7xltZxgCkA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hniKfnwBOHaUTXSfvVIJk34vdrte84urfKsYTLZYtH0nvMQwX
	PfYdRC6dPsvInfrznNQWN1ImNBnsKv23I4p2Qyh5G1Tg7eIbYhk93a40HAgXUXSy+/Vn1kh82xj
	71ROO2Tc/IMjtcrFN79sYd5T2ypLw/ng=
X-Gm-Gg: AYBFou0sGi2bXuVer8Z24h2R90MrLV1/WX4hh47RbnAg0OilvQG7MVUpDLB1e7BPuQW
	DHxSmgw5ewsDWHe2OZ3toAcd6bBya0/rhJb0kCrwbMTEYuGuOVPt5B+NHBXkgETMto7RgO0j9UK
	pakyedNhWZYKbw2u4kPzhv7oKvTzUTsNfkwIqNa28RXNjhRMGakeqB3sCOQxfRYN7dDZhmAZV2Y
	5v7+XYIvD8jmqnLfhEJtNr5lRqFuZeaRSf341zs5/ICjTB+CPoFnCgYtbO5RMi5B1jkfUTUYNEK
	t4pGIf68w2/Zrpid5mlcxBdzcX8YsO9he01gluZrQlGJSDojOzlIf5N6kKe/4J4Cyf4fRdbP5eB
	YTDGEoQtbskvKqtPfI1UHAYqvB1CRdVtoMzzRbbxzjargzthlmGvCDlFiUfQjVWmexU3BlfU=
X-Received: by 2002:a05:7301:6198:b0:36a:1e9e:ae61 with SMTP id
 5a478bee46e88-36a42602aa1mr11000618eec.38.1793548752284; Sun, 01 Nov 2026
 07:59:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101-upstream-iio-cm3217-v1-0-5e1724cae7b7@tsv-stahl-riesa.de>
 <20261101-upstream-iio-cm3217-v1-2-5e1724cae7b7@tsv-stahl-riesa.de>
In-Reply-To: <20261101-upstream-iio-cm3217-v1-2-5e1724cae7b7@tsv-stahl-riesa.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 1 Nov 2026 17:59:01 +0200
X-Gm-Features: AclHuK8C4vxEYccTnlJFTZvavpWf-GCXw0Ej68N8q_v5q9HytmNW0NUmwJ3LSVo
Message-ID: <CAPVz0n2YSjPsmhYHnm9UfNtU5gg-pWcxe0Rybpf12jrXUKn1aw@mail.gmail.com>
Subject: Re: [PATCH 2/2] iio: light: Add Capella CM3217 ambient light sensor driver
To: admin@tsv-stahl-riesa.de
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Kevin Tsai <ktsai@capellamicro.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 1 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:46=
 Patrick Fischer via B4 Relay
<devnull+admin.tsv-stahl-riesa.de@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Patrick Fischer <admin@tsv-stahl-riesa.de>
>
> The CM3217 has no registers and no ID. Writing a byte to address 0x10
> or 0x11 sets command byte 1 or 2, reading a byte from 0x10 or 0x11
> returns the high or low byte of the 16-bit light count.
>
> Command byte 1 holds the shutdown bit and the IT_T field (1/2 T, 1 T,
> 2 T or 4 T), command byte 2 the FD_IT field (800 ms down to 66 ms). The
> count scales linearly with both. The driver exposes FD_IT as the
> integration time and IT_T through the scale, so the scale list offers
> four ranges for each integration time.
>
> The datasheet is not public. The bit fields, the reserved bits that are
> written as 1 and the startup setting of 2 T and 100 ms come from NVIDIA's
> downstream drivers for the Tegra Note 7 (drivers/staging/iio/light/
> cm3217.c in the 3.4 and 3.10 kernels). For the resolution, Capella
> gives a range of 0.01875 to 119156 lux. The driver takes 0.01875 lux
> per count at 4 T and 800 ms. This matches both the upper end (65535
> counts at 1/2 T and 66 ms) and the 0.3 lux per count that the NVIDIA
> 3.4 driver uses at 2 T and 100 ms.
>
> The sensor has no data-ready flag, and a new setting only takes effect
> when the conversion in progress ends. A conversion takes IT_T times
> FD_IT, up to 3.2 s. Leaving shutdown starts a new one at once, so the
> driver passes through shutdown on every change and waits one conversion
> period plus a margin before it reads the count. The timing was measured
> on a Tegra Note 7.
>
> Signed-off-by: Patrick Fischer <admin@tsv-stahl-riesa.de>
> ---
>  drivers/iio/light/Kconfig  |  10 ++
>  drivers/iio/light/Makefile |   1 +
>  drivers/iio/light/cm3217.c | 383 +++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 394 insertions(+)
>

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab P1988
