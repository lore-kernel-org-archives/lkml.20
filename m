Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA75E32B99F
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 22:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791669865; cv=pass; b=cJ/hDR2qGUEzuSIPOnNk/MJQv8DheQaybQznOIZQ42fSA0NwsUUugv6MNb2eo7s3nl6HOsH5OycoIFo1FoaWn48rsjp9FYfoDuB9yOrfTyg+/TVzYDrFQuI6Hl+xvlhLcdfl4us5L807y0LfLbAawT1mI5H7/gy8iJu0eARa9Jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791669865; c=relaxed/simple;
	bh=BYcObbLCaSgU0tk4reE6Oh6GJ9XtFYK/QOHixm1CUkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lRMTGCaRgwQMi0lWlh0W/swZI5KRW7HC+/TmL9hFdyIlWTBGuqz2wZhrkfcfWWFJcfmIxBfsvSnvFk8WWWDvY9LTvvmobyOVvaGwWYkHApPFpNKdu/Hw1+n3OgaConTiQs4KJqVZA4zGFK49lW8HgUsjjcPY3dl1JPQKJo1DXrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=p1O8tu+j; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="p1O8tu+j"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-675617e81f9so677913d50.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:04:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791669863; cv=none;
        d=google.com; s=arc-20260327;
        b=dePDNDXVKYOvHBFDlCVL8v/THZ03kQwfI5QtCwQ613c8FxZVhUaybe7yK1s6WambzQ
         d6RMtt9gjIHH3mGBdylaHd5/GiCTCDcLBNJN1jLEZ4z4FGaqQpa77KewivnGCj2sUDba
         YzvbpMpbrURZddWNj60JTkSBPq7zPtesOjflba08LY3zAWwCZQI4nM0jzyllEIx1qyc3
         ZIEI3GmauY2Hmc/LXSQJIODO0fMrHfijpXHs/tlZiNDxqEOQBYIBfv1GPM80YhWfcSj+
         C015RHxSBCpRH7YezJdVt+1TVOBsR5H8vb28kmtDmOISPVAvRYjIXYCWb10NfUbxfNep
         yh3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nD84KsrwDgkTBQQV+472E0SUuRjtbi5qncXpaLstElo=;
        fh=2kLYFT7A2dIpghXEcfH+hImyMguqiwr72KJyB6Ch6Sk=;
        b=RY0gK7X96KV/8t9tf1Gs4cm3VccE1YlYGpLPil+RoxY8p2lw8DnCNANBhJcStw+Rmd
         pDJQBN8yzdDghDU9FqgIhXth1encmuCQiG9R2DmkkYJz9qsXp3dxU7nHJZ6X4htgMK3H
         AtcPUvPY7uGQCw4sy80kjbkslLQGlaXWqeYmEnmyfgeroHWQz1HiOl1XnBSjANBXZ6+v
         mFuI9cq/5Di067JzLZNmT0fk9Jb739Heuq7HPagDSViugYmnLQa8Bdxf0dcb+WtAdPy2
         nX2/ZngVwsd4tVjNO1fycQCho7nGdQiCnv8IGjrojSQAmuAjklKv2uZkHfd3mxLwnDjZ
         Qj6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791669863; x=1792274663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nD84KsrwDgkTBQQV+472E0SUuRjtbi5qncXpaLstElo=;
        b=p1O8tu+jIHXloojYJcntAerl/63gaJIulBPFm0UByRTVmqXvIAJ8HJtZgddJxFBqIi
         nF5h4mp6dj23uHnsVS36bQjBHKmd63qWW0gad61dzh2TTLSF2ZVGYBUlum3SX3qlgcMk
         SnSFMCyFDXFX+gE2H8Nwej9Va8ZAbGQZticmu7pDJjmsi5cdyGj7HoXT0rtsP3Nx6J92
         ftCPAwnl7vex6uvBvtHwF0VJZaXZghBmode6VuLHv+jgzvB2m0/jCci3hL3LV3tv01Gu
         z2BoKqS1TvFdVFs9zBc4ZLPtlFWwOOAJtqAMFDzc/XkFz+zDHS9S71BOrl8I7dCwR0jP
         Lk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791669863; x=1792274663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nD84KsrwDgkTBQQV+472E0SUuRjtbi5qncXpaLstElo=;
        b=q/ZXH/a6EEnbwfJ5ZWZobp8fB1IAn78QiT3PlgEDuBsB5JE7q+RmOdAmxdc7qAFq69
         693p+CijMnuSr+VBuwlwkbavpwqkGByk/XK39wWzHs/c6eEn1lP02y+8K4vuWfCK0aE7
         5JoMScpg+qq8I/SjBMyZmGAlRHVFRDGVrKg+nbi4db5PNhKt6Y4YZjKzcBtOuFFkzd5l
         2PHrVjrE/EMEjydEjXvzq574yDsfZrX+ZbrZ0VZVNFNBXU9PUVSjvBr9yQCZ0Ahzxlxy
         HDf+DuzOe9xhJEsRz9T8j3X/pftdhvPZZp4nARQCnN7C0rMlFVCEb3Z4r5zi29Sb1D02
         wXnA==
X-Forwarded-Encrypted: i=1; AKwUvBzbT4rny0kcTL9G9kEAVTimpZGD4p7GQwSISrbg/sJxHCYdO/DGrV7V8SnVfe/1kxcp0jRlDdEZhVDd8ew=@vger.kernel.org
X-Gm-Message-State: AFq9FYIL2NyQsho8vXmP0Pb6e6sP9tVAZLJlq7G/+vh50sBi1ItJcjrC
	ETc+aTijd0GXJG3hN5qqSOjTYXt4b7tTprO1jh2KecuqscCbG5TaqAnrIDpxBIy7HRVveP/aqRk
	bn81Xmq3ZivXeVXuCfEE57CtXPQqiYmI=
X-Gm-Gg: AYBFou3XgUW4c5Zz2s3FaQYiQoNA04zjKKZczhdSY6/svyW9MHBwTHi1WH2Fom5+1VS
	X/Rqij8BaLSu69nQpuU7YLaNpQEzOWqr+2Oq0G8GImTlM0jEwEjOHN4Dvc9XbILxtWDhHkPWaZr
	+ygTmx3sAGdQMJN9K88D2FdWcHCfPEzlPnJMC2fPiHAIAOExUNHszTK00xBH5xXa+6e31ZWaRwO
	qqAaHPJEmRVq/XCaxxmQN/wfh56IQd+suNTEDEzS9rgAKgJxTAwoLqgNe15ROG2Rpw4P8qkCRnN
	R8TVJ8DGdr/prA7+npJxdLujXrgVItRNWOIeubRD6Z/JPnWLSGzyZajSJSsC55ACij/VoJj2QRG
	p4+viRfeMRSaJhQ==
X-Received: by 2002:a05:690e:1407:b0:679:24b6:fb2f with SMTP id
 956f58d0204a3-6793678c7e0mr2255529d50.12.1791669862784; Sat, 10 Oct 2026
 15:04:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-2-tanure@linux.com>
In-Reply-To: <20261010105900.247342-2-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 00:04:12 +0200
X-Gm-Features: AclHuK9eVPsrLu_8xG98kzx45q0ow1wl_zWO8WFmOGBNd_k8l5MABlydeHwbbRI
Message-ID: <CAFBinCAejxmeeHyDy+vMSg6dBm+9prhEo9qZ7FAsiWNB1W-HXw@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: net: amlogic,meson-dwmac: list the
 compatible combinations
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lucas and Conor,

On Sat, Oct 10, 2026 at 12:59=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
[...]
> +          - enum:
> +              - amlogic,meson8b-dwmac
> +              - amlogic,meson-gxbb-dwmac
> +              - amlogic,meson-axg-dwmac
> +              - amlogic,meson-g12a-dwmac
> +          - const: snps,dwmac-3.70a
> +          - const: snps,dwmac
> +      - items:
> +          - enum:
> +              - amlogic,meson6-dwmac
> +              - amlogic,meson8m2-dwmac
Meson8m2 dwmac reports: User ID: 0x10, Synopsys ID: 0x37
In case it helps I can submit a patch to change the Meson8m2 .dtsi to
use "amlogic,meson8m2-dwmac", "snps,dwmac-3.70a", "snps,dwmac" - then
we could move it here too.
That leaves only Meson6 with a single fallback compatible. I don't
have any Meson6 boards, so it'll have to stay that way.


Best regards,
Martin
