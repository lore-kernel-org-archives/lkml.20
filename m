Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180293;
	b=UQ6z10LQuiEuLliQYsGr2nLtZNUWGYelE+IugclAPpwvn5x5lFtQzn3Dva7j/C0gPoIc
	 Aq4yHmT6bWxj/y8bBqD0GuylGPZSb+ffonC+CSjgpHZIJGWnruY0naLqmGJwOKKa1IZWw
	 iIZpTS73VaXkjwXmIr+Puh5Z00k5AS88J8gHFkeIbPgUG9WlR+TWIhUMtvYrBPcWHQ4xX
	 dYG32+/8JtKMF/P36dzAZtbYMLJatHtkDy2VqJzscjklFDNMhSreAwL9K1COgkc9TgSYL
	 2dJHFemlc/KX4b9n8RrCSODrOElI/7CtiagPMKZULDfwx7EP5v1j2LCgU1+0/xqtGxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180293;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=/337IpE5KTxyqcxql/1j4KDMdfOcExSPgOP5KC4FMmQ=;
	b=V3oIrddvK+p+V2KbXwliV6RYr7qjXFF3KBDnKaBnzJQkbMCk1ztQWKN5jaDH39D6hb3e
	 sXmcU49tCVcIr1Udxo63n9keMYGotH1S0jRtI2dy+oZcc20t3FDRvwWTIKhUv7l0GjUqI
	 NAEMiH1YpHG0NSkyCSSI1MQI8EgKdO0ACMLjS6PssqLyr3oJeZaJocwDJhVDGiLxdNPWC
	 Uh7eMDOATAXFLJ2GK7RxDoNXRVAX/jfYIdPtZ+/Y2aJvAqf+mabsCL710Ve+m17LXsy42
	 aXcQ2rk1diCn7/aSulCVNSceo/r+g49b2iPbD9Yu1yWjjvGwyFETIi4QgvmgFVyfcMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KMg/f8po";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C63E606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KMg/f8po
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3BC1F031E5
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793180293;
	bh=/337IpE5KTxyqcxql/1j4KDMdfOcExSPgOP5KC4FMmQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=KMg/f8poVuF+OYYPg2we+k9iKYhNdzzwEXevZXPuMFYAaiLTlZFRzurPDpsiRIA6r
	 qLN1YK2LwoyVaOu7Cdy3S9Htjl0OIBaayZEpGzl8lI4++ZLgj534gb/BgWiIY6iVXG
	 FWGk00+epgjbssmL3PjakXWdSicxCzL+H/TvG+M+6uKZX+AXfuuvdY/9UUxMosk8SQ
	 /fiBgKRohC+iL4XCrhjFTGJ+WoVq5m8oCDJrRcGg68uNTQwsIxovttjBgkYu60BdWo
	 gM+kcfRCO6oKdEmiS8CTEZcPamFqUl041qLLO2EgPF0ajyw3VjptY3FUJHg252a49a
	 jAENpJ3EsZzTg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a595487d43so5596121fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:38:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz8Pj/8VsMpsG0EhFeBl25dylK+UHxB+j7WLv/XjhimcvYDA6+Z28/fFV4xJfHAhDmWjO/DODCes5RasFw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZ3tBb2rfRjmUo1tDx7aWPS64UyAXk018OBoqltO5kMpVOLWP4
	9cTnNSBW9v2mNrInmOacIP+7kMfC+172HDNgAFqg1UN5XULeUISDXZXHwjX31kHOrNmRpfjLNRj
	eMRqXnb85f+qhbsaa3mfEweynBYTkgPNcMjg2gKUplQ==
X-Received: by 2002:a05:651c:3605:b0:3a8:bd3d:549a with SMTP id
 38308e7fff4ca-3ac9cf08a40mr4333801fa.7.1793180291927; Wed, 28 Oct 2026
 02:38:11 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 02:38:10 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 02:38:10 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261024-samsung-kp-v4-2-e21253295e68@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com> <20261024-samsung-kp-v4-2-e21253295e68@gmail.com>
Date: Wed, 28 Oct 2026 02:38:10 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdtxtssfPrwXVGxLe1tyyfUxdOKcNmczn=gzESRNE5+oQ@mail.gmail.com>
X-Gm-Features: AclHuK8XdDJnZKMQhT5pgCqqGCu9vzYOmcLsT73Wl1aen1LlgEEs17VBcSWb8bE
Message-ID: <CAMRc=MdtxtssfPrwXVGxLe1tyyfUxdOKcNmczn=gzESRNE5+oQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] ARM: s3c: crag6410: convert PMIC DVS GPIO to
 software properties
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, mfd@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Oct 2026 06:03:13 +0100, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> Convert the PMIC DVS GPIO configuration from a legacy lookup table to
> software properties. We use the new 'dcdc_swnodes' field in 'struct
> wm831x_pdata' to pass the software node to the regulator driver.
> We keep the DVS configuration parameters (control source, startup
> state) in the platform data.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
