Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794781266;
	b=yPObbs/bX5RGN8GPwZoH37vWbcgMtmsxe77G2MZ9lmh1+nDL/SFaW90Tlkh6hmBCPRLJ
	 FJOf/04cu8RtYyErjgrW4DQ+yKWjeHKRzRNloEbuHrP1GV8ADBK3v5QMsvr1KUjWOrySc
	 zOXK/Xjw9NF8Qgcq+2ddDvcXndldQSXlBnOAtb8d7rmiG1w3ifw4+JgS+/m9LnMy4DOea
	 bWJ9Ky5eypp0pnFKRwEq/GPA+5jqsFazKLbFQwRLhmRmgbWpPtXfphwjQyRAi1cmPKqIW
	 4DI6RYUc2oMNRkbTPzlwNDAO7tuf/PQlSZpwv50yezWnQ2VQupPunl4F2DhttlhF2oQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794781266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZAFY3cUder3qW+PINYFFGIewRXLP/J/NJFjtZaZIdPQ=;
	b=pPeDs2TIalc9YdQrPaR7igRaRD98PZYVU6TW7atUpGVmDyJefdO4cmqhvGljre7fnhEc
	 xH2L4W6dI8tcHA56Usmy2TtzbgV2ZGNkhEvBzpDt18Z+JAdmTNqAFf8yRJhQUgFuJ6oO8
	 60HwQIoisSG3QDJTa/7BQAID2kxprkzW8XuRUcPXMr6UgjlrD4jnqJZQxgxbQD5N52r8b
	 Yv3ajVuGGq4DnWegMQmtWfAtjHMtupyq0qEDyGpUV8bNrWzmyP8aCvXFDhCDmbNXPQ8gn
	 LnT24snL9n7YZH4SyIxNK+i6s6bkKpKUCZbEdVUIqm6MvIAMs9nvjHHU8wlKAYIa3EA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=ohRWuzLs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7EE606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D7EE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=ohRWuzLs
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67db35e7953so451268d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:21:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794781264; cv=none;
        d=google.com; s=arc-20260327;
        b=G3LZreVfftUnzJuGtopNh1Mei0cJSW7xjhghB64JXIGKn/fACd4Z+RnV3EayPfJEps
         UeB745DHv2E57NRT/ItmbZO9KBqjD/lbTZXlUcD48FrNNWPGfeS65n4nmEyg8aLieGrP
         ToR5n55fY7ov22PWuGX26zNoveSFjBJlGsrhZJMbtMJs5WbtrkJJZyAqIZfDJDeM2ccj
         xR7sDy+2MrXpH8uv6LyQQjc1dW5DlULpt/FYO5BSnsQA5MQefIOt5MKPIBjcsm5BuJAV
         Gd00KQqhNcITffBVHF6mAusH4OGk6DJm6MlzcU0PelVj6ZCHshThAc0dLD8+fkWtbGAv
         eOWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZAFY3cUder3qW+PINYFFGIewRXLP/J/NJFjtZaZIdPQ=;
        fh=beB7+VNaGgNtCRUdA9KTh0CafLh/u+tHWacvvvvPiLU=;
        b=aeU8kqoSOZnjNWcab2A7o3GmQ92UeE9hYmTWBRzIz3Wol4VUHtOePJX295DQrSc5G9
         Q0b2GKE7JzFGpT0j560/4A3nrr1OkgVoFuEcEJiYyJILOZt3td4b2appuWSxuR4oXMXS
         Pc2Opobwe8l0CK3QVY46TmtsnlTYsvQvWtvH3S/W9jRhBbhOXRpHvax3pyn+SXKCKv1+
         TrEZCCNt3aEpnC3SEjyp6uNMeLFRq9JBAvlRXarLHPfkiM/V+37lpMV49sVmXpBPoU4w
         X0seq1qCGlH8WWyNmF+YjKjPkZzXoYWEGRxIZ5srJnYdWiLx2R9LtaOTPiU1mAM+6EFx
         +dUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794781264; x=1795386064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZAFY3cUder3qW+PINYFFGIewRXLP/J/NJFjtZaZIdPQ=;
        b=ohRWuzLskucdZexyQNJ+heplSWXTaJEIIm7suUD2DWYYOw3bnEfYiwHRYTQCmL/v3E
         xwwWqRiJ+eBb7u6IhQcghQVUllcYPsaVimvlgY2YtViPXRF14a83f8Bjd/3xDRDYBNhN
         TVIZ8Hr0BlNeaTbuAdwZpKqiPpAAhqBi1bLs/CvCjludvcbtIj9zZ1VdNoUt8W0SJJA3
         GBkVqjX6DJAHOT7fGd9fRQcmI+yShx/YpUiWjyImkVDlCzoW0hSM/eaJVZIrdq6T5ScQ
         wMrz5zB4WQX2HfdLQlBr9kqUa12qUbNMbA/VVh59+oT6rDVABxNJxxVOaQZXOMOmQ1h0
         HrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794781264; x=1795386064;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZAFY3cUder3qW+PINYFFGIewRXLP/J/NJFjtZaZIdPQ=;
        b=dN1HonkYivqrnOOrQPquzTit0OqHlSCGHA7xbE43Nud5Klxxh8aVBZpVuaRcwpDcMg
         Cw+bEWJQ1F2Vc4sKBgQpOdfGn5ihWbfl+wQYlsQE1zxY2I2HWZQFQdOXPBMDjhVRuFb3
         mFlNz8YxXU7CYyyx7viM6gzDVH32ZYIGLRHTJwLyfXWwDiB21KDVU3gmD8kDQwQfcnyL
         NjA1Bc9StjnGMyg07N/40mi4BxOXmBszfpNfsjk1kpNg9jTyVXWc2qWgA8EuvbtrMYo8
         uZP0wAeZrLYYVYlS4XTCWu0WcfWxc5iVXNjGRAlJAdBxKImM9Rk+kWRQw6SPh0p0B7SD
         QSzA==
X-Forwarded-Encrypted: i=1; AL+hErH/XFGOywXuy3WFtdNlt6iu55CY08xrOyS45k4zc3PDyQLCqEDqrGVGV3LOp6WhKQkXGz0GJVtrRjEN678=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3f7ZEp5wOVXGK+q24z5eR1g9Wf47++taidcvzBYVimkwpM3j+
	mHPgOIoEFyGon6rfee3o3Uii2+iFLGbMMnYUByKcloePxD3bULfQWh2A2QM0CwUMML2c5M0uQFK
	KLIBhwMz+sgFgSwEV+bW2pA9bDWKIYvE=
X-Gm-Gg: AZFdTZfXB+DI6JWBRFlBSt1rQKHf9sigWu72/0WSbEGG62bOkRl/kdXvt578XZvqdlS
	6bO1KuJNWasNeim3PBJ99eCE8qIUqdklYX1hDIbqGWS6vtpeOSlMujZiPwFihT/R0VtUYfZvOCh
	0WNtsAh0sGf2cokRNJa4UCpOGZhc9ZqlJbumlRJI9CbmqaeZuwfrdaYTZ/ObIBYpLLi9zWXLgs8
	C2tx6gF/2Jyg2XkJTIRLFzI4iEsXUeXE10j4z2UIHVuoIys5DP2/5htPBR0qHLxmcPSrM0uDrKL
	BujXrg1JiM/oUu8s6XgVHRNVexjAMDFn7jyO2yVS+iAQnbZQ2XjMpbFrD42r2kpeLsaqilEhGDT
	WVJ54s3v1Ysm/DL9gT9ZXvnx6pq2GWikg8BZC6mpztSnSpnhEKJY3rZn5njxgSs4NLuW+TKLsWL
	qaGUALqLLsFyK8Ppc=
X-Received: by 2002:a05:690e:4086:b0:67d:a3f0:7dac with SMTP id
 956f58d0204a3-67da3f0917amr1936855d50.14.1794781264626; Sun, 15 Nov 2026
 14:21:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001-add-t7-sys-pwm-clk-v4-0-8ed2b1e0cdfe@aliel.fr> <20261001-add-t7-sys-pwm-clk-v4-3-8ed2b1e0cdfe@aliel.fr>
In-Reply-To: <20261001-add-t7-sys-pwm-clk-v4-3-8ed2b1e0cdfe@aliel.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 23:20:53 +0100
X-Gm-Features: AclHuK-51aJAWSj3WTQV4S_5nCaT5gjYIQp2CQlsLrogi8Dpichyl4UfpyRzP20
Message-ID: <CAFBinCCf2x3Ear_iOg9=KYXd5jbvAh2LdQb3uOME=Lry8Wm4HA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: amlogic: a1-c3-s4-t7: Add bus clock to
 PWM controller nodes
To: linux-kernel-dev@aliel.fr
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 6:56=E2=80=AFPM Ronald Claveau via B4 Relay
<devnull+linux-kernel-dev.aliel.fr@kernel.org> wrote:
>
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>
> Describe the system clock of each PWM controller as a third clock,
> and add the clock-names property expected by the updated binding:
> "channel-a", "channel-b" and "bus".
>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 28 +++++++++++++++++++++--=
-----
>  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 28 +++++++++++++++++++++--=
-----
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi   | 12 +++++++++---
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi   | 20 +++++++++++++++-----
note: a single patch per SoC is easier for me to review but we don't
have a strict rule.
