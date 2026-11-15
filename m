Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794778151;
	b=xjHnqjF0pv1TYH9SNTaSJ5YyAnQmg5JORsXBckwADPhzx60wY8bCVdbaV9f/nLPEM44P
	 9IUtqfKwt0BdhRi1Z2Z5A1+ZqC89MnALJHJ/bO7jB1s9disfFsmD+lFzZVAfU69lel7Py
	 CXQKugsWocYYVYsNGdFpg84IzevclvJ65k259kBi6zFXbUtTXb2SArYK0PjtBnTaty9GN
	 5zSb0TjoZgdqMz01dVzhjfARzpz2nLNyfffBNkvUuuGtAzAdyFNJGOuWQRQIgciQLasfo
	 SzzYtpUBnSHU/kvoRToRhjQlZFkDUS4mh7loSPb6LgnJwNJWgP+KQSLSA/giajkJhFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794778151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LDJ9mV97bkkNMHmuEk5zxwCzRbf60DW+NGGRcWDMJuA=;
	b=iTxczTh2vOyoOdKaCEXGoAHWtMRgyfYk0ubrIgzbV8V20lcMPYhX7cra2xg5LDV5cmSa
	 W7U6GjRcuYjsejqdRQDVzSBskWXF75W3UfXnYd1WGHuGe7GN5gHz+7c9N8AOG/kQsOxqV
	 rjfxChozBOb9gADZR45fGbR+S/f8OCR/FT0TqJWq6xoQeksVeJc3w7PK15fZ0av6B3xfz
	 sWxRwMW+QPGoOaOBEiOgzU4JpshBKIcQQ+FBQzu25L43BSC1sVUxrVjIl9PtaPZsfH+sC
	 g1hLMM4mj7Rbe+qEHJcxFkxm9rM3SxnqNiHDKxYuTqDgqQJxSe5B/mUcsIirpoRuLjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=rV5+gU+N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1914606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1914606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=rV5+gU+N
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67da7d18f2fso978975d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:29:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794778150; cv=none;
        d=google.com; s=arc-20260327;
        b=gIVmIxTE0/urvftjxtH/FNd26dqCYoOthUlkRIvS8wNKEvkgdeAh/cpamXvnELxMHp
         LpkuJ3T/lKEDDwp3NEDhRcqMtagdegVXnH4GwlY/V905Tgu1/JRgwDZuIBpNN8fuTs9R
         cGDnaarkLbedZB8yVZRPMdqqom/ridRuLcM+P1IYDgMd13tlHxp9VC7xfV4A89Dkwmup
         xQH1qzJRTjXdg2mOc4EacsPSr3oMQvKJkRs9vU2WLt4gj7b03t0Y6zpvnvcx3fPOX9zq
         uLziMD4um34/o4wAnExoKkB85OBigRmOQs/BwRUZp6mG1PUhyLOz2Ntdq++jDYXe8EOj
         fz6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LDJ9mV97bkkNMHmuEk5zxwCzRbf60DW+NGGRcWDMJuA=;
        fh=ItALQXhX7t3LelisBmuMthvXEHyen9MhPefoR7iuM5U=;
        b=rqh9Pl0Lp7d0IQy8upp1SBOQmZu/lPEItLO2/Y1FVpLh3SnPd7OeUmyceQ5okiNBzJ
         BCdVSuAHU43o7GHMyd1LLhWLlFlH/wXIRXAK+geqS4GbBzsXVRNYreY+51xm8Xa8LBYX
         Jn/7a1X2Y5nzXMwikOUdoVMRFkJ3S5NYChBk6TFlHYhcKSXwOiIYA0gFitzRjpLcGphv
         M5w6NiGELik+EGSL+M3bofeHlU+lCArjwQBZGbOpps2j+gI9SlL+GnNDvf6s9SYIaAeX
         y6KDNOtPVtBWJbBVEjRkXneq8hqQT4PTpyUxRPgyrPZIy43EYi6VSXAf1k/ooCVtA7K9
         8OFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794778150; x=1795382950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LDJ9mV97bkkNMHmuEk5zxwCzRbf60DW+NGGRcWDMJuA=;
        b=rV5+gU+NHij2v89bHwlyKY5Noir/2v24z3w0oIAEvARkSvIG7vd/YfqLUzMP3cmaSz
         PzFU2lykEHbheQDsK2BYl9l6VKCgo+IPgPrlACsHsPnzpircwB7z66RcO+XSwDhtaY3z
         MFTJUjF4CAJNRHves/bvOhHnzbyjw3EEc+Vvgnq6Hz7qcZtjZBBHAvwAJIp+uFsJIF83
         CM4IQwPYCq88iOcwLOA1AH+yprNaPnJsRhjVEWeC+oRWid4DKMiIJ6g5EGBx7Lrqd3dB
         uhQF/ypFr1l+xUXc2mErccQhwwC3ejk8Gv7Bn3/FCqlQVwXKMf41TDdqc6KjtqWlcFAV
         mRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794778150; x=1795382950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDJ9mV97bkkNMHmuEk5zxwCzRbf60DW+NGGRcWDMJuA=;
        b=OXelUaDVj8c73qYE0oUfGpK4+uRKAnf8inXe+LLEcskM/su/Qftf+xbb6x391JqR5f
         6RWVCaSbPo1H102MElJbTPnbor1opuhW9swDdkdRuGd23G4R/MF5PSQc8bTwh23nschT
         k3Y0YgeClAP77EFoEUFEztV/Bs7+JpQbEz8lueoqOe03WTQOItHBg8U/KSoZZhQFKLqm
         412vuN6Y7bbyGO/SX639zS/uErM55PTsq6Qenk+VnYOy+tsguRXjX79b15xmQt8oxLMd
         +rUyv9YuFVnY1M/EO6YNUjeQ9qd1O0EfkhbAnYmK+Ppw4vjJIaibOpPRUd66J5UUGjTh
         i98Q==
X-Forwarded-Encrypted: i=1; AL+hErHenV3nBfoqCcCaqikyQGcobEWPU+0FZeq/vgFgbt931wOewTVLjfvlshyRfCRRSzEZoIglCz6UwZR1GV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Sc/szt5MfxYDg+fxKtDia7SVYMgEQrQ3Y+grztIPAjpzkz9hF
	hCJhbVJyw/G9bqVL6pCVVUQo1Al2P3DRTtlNcEaRSa4iZQ2rDAhsIDS7wHQ4tbfgNeuFRqYwDt8
	a+j+Iio55cc1lZE40v9ANadQ1CGEQ+go=
X-Gm-Gg: AYBFou3zWCXWRVpD9Pld8kt9xWkO+3QOxw2cHS/ZoaI6TGlz1OZUhLAWyGwe7ZdqxOu
	cIlswIMxhkUAwvWxdkVWL5E/nxcstb7BChfr7L4DCnHruD6AeKBOcjRfZok5RP/J1wOLxzyRdzC
	WlnkH3kvoGUbOaMQGdC58aNJwzAuJ0OAHxNjG/yac+FCAG/7XiydHcOFieQvbyUvQo9xo+J9/ru
	hb6qfyseC/Pez0GEuymnk+dPKr5l542m27z1sJcB3hTPTYD/i+xo5VjcotzpDtuHQoquLse6oq0
	ThSAFtvTtbBcwWpBMr2frnUjMBL4fXNMlCdjEDgttbRg9B2TyQbD59WRyxHLReE7+RGtwdl7jrD
	O5hGWKbIbJNg/osH+X6j6uS9ERFT6dhhHGXsXe6BNP2u/hIVn5zvdnFVFn7pHy3uRn/gviQ==
X-Received: by 2002:a05:690e:1c0f:b0:67d:b0a1:c9c3 with SMTP id
 956f58d0204a3-67db0a1d2ebmr1094277d50.32.1794778149875; Sun, 15 Nov 2026
 13:29:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:28:59 +0100
X-Gm-Features: AclHuK_mrwYOs88jQPUihYmd8k-bNvXzF9c0J2wcB0Lmj_2uDGdqbd4QCFY5NB0
Message-ID: <CAFBinCA12FvOi=9gB1xj3MDvNWstx1N4TtyyrrndJ_JT5eLX=Q@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] ASoC: meson: gx-card: add support for audin FIFO
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 12:18=E2=80=AFPM Valerio Setti <vsetti@baylibre.com=
> wrote:
[...]
> +       if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gxbb-audin", =
"FIFO"))
> +               return meson_card_set_fe_link(card, dai_link, np, false);
I suggest using the "audin" prefix. AIU / audin seem close enough on
all supported SoCs that we don't need a SoC generation prefix  in
there to handle this differently.
