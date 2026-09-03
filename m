Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A534B2CA0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455509; cv=none; b=FJ0JxvdR3eiXjJN5ktvwvM7SBAws0ip715MJ2hVuMUS3C0jQpveKg/m5qi51cmWg3aWSj3gi97snYBY8BkkiYvpvFfUAcyUqiAmHC1YTjV26nIhMcq3RAu8k+YNzKHWIZiaDNKwzsXMwywF3qDkhRzgnjwfdA+7T8BLFmazCy8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455509; c=relaxed/simple;
	bh=br7nj5so9XXIb3ddRV0Js6A/aNCBt2FDaTzyEZaBivs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P8rWAcOshYDdTdbc9LimxQNgk1EY5K5Ee0oVyw98maDidAMX9vgmxGvSCqrua4gQbOsnbFwxvHwEZvoY+dUz5e3LQ25rcQxmboz3z3bYgV6WnVtNrNyVES+TOvDSrsyzibBdkwlpX/j1x6C3UKJBo8kmXRh4FgPFYZpZ0ScUDJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ibn13256; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ibn13256"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CF31F00ACF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455508;
	bh=1AV36kVhmlL5D/McqXi8geSrZx/Q6+1EOIxy2WI/hBQ=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=ibn13256RsVI1Iinyjm81qJWg32QimVHtgtNnWPSD/AYCnwwxeI+TOL9v6S3Q6iWc
	 6F+yT9Q3xZSsx0Hqxm7UH7KeOvmpxrAc4TMXd9ZtHHQImjrDC+POBvfGvwLhGQNWYL
	 9OngVozXkAZ252bEWF4BdfmqmBZCKpQHDPvjrtWkkNeK8KafXqiqJqL859vLGwhWhH
	 cd70bnW3cFXUXdWIz6/qv2NleqL8YVLV/pVlettzclW+v2tWUIydBTwtHx5djKoriP
	 mzJ5ZEOpfsKIXgm726dB94FDT4p/uRvDTCLOjJLepAOrwMVoqi2Xh5i30hU2rdsg/a
	 zvITS9f9uoxIQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39c86945164so1833931fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 10:11:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzQwDrjzOFwPzFoO2DKZfUbWqEXQEpdEhRWHCGQITLjX2qfeH+/wQywF3gEuGg3aYaqMisOJ8BH58mQG+c=@vger.kernel.org
X-Gm-Message-State: AFuF++kBJCtH0XeHI+BBiWPpFA0zjvxkz43OXj5/MEkAmV5WhwvD/iAP
	M/AYpZkn/8GabgFAz8gN5EID7aAp3RzGB9slmIXU2CSY5olHn04gkSlkvKcvXH01n5RugXbca5p
	giHJJfd8T55XBdjW4FOrZB8HdPTWS+Yw=
X-Received: by 2002:a05:651c:198e:b0:3a3:37fb:27b0 with SMTP id
 38308e7fff4ca-3a3719a563dmr389821fa.0.1788455506462; Thu, 03 Sep 2026
 10:11:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
 <20260812-axp318-regulator-v6-4-d6b84b55c000@baylibre.com>
 <CAGb2v66Uz6hCQaf5Nk5Eup8wQ+Xo9tuAqm0+ZH9J5CbT0zyAPg@mail.gmail.com> <1jjyp38pa8.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jjyp38pa8.fsf@starbuckisacylon.baylibre.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 4 Sep 2026 01:11:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v67FP9jLqs5OHWJQ1bfmFDyqBscqQnKJe9C88FA6X4wsZQ@mail.gmail.com>
X-Gm-Features: AcwNN1UXur3_fu9zD6ZMtcX3N3JHKPwXli5C13AhpCSRSxZ9KS2GEHhEI0Ns9q0
Message-ID: <CAGb2v67FP9jLqs5OHWJQ1bfmFDyqBscqQnKJe9C88FA6X4wsZQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v6 4/5] mfd: axp20x: Add support for AXP318W PMIC
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 2:46=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com>=
 wrote:
>
> On dim. 23 ao=C3=BBt 2026 at 21:17, Chen-Yu Tsai <wens@kernel.org> wrote:
>
> >>
> >> +enum axp318_irqs {
> >> +       AXP318_IRQ_DCDC1_V_LOW,
> >> +       AXP318_IRQ_DCDC2_V_LOW,
> >> +       AXP318_IRQ_DCDC3_V_LOW,
> >> +       AXP318_IRQ_DCDC4_V_LOW,
> >> +       AXP318_IRQ_DCDC5_V_LOW,
> >> +       AXP318_IRQ_DCDC6_V_LOW,
> >> +       AXP318_IRQ_DCDC7_V_LOW,
> >> +       AXP318_IRQ_DCDC8_V_LOW,
> >> +       AXP318_IRQ_DCDC9_V_LOW,
> >> +       AXP318_IRQ_DIE_TEMP_HIGH_LV1,
> >> +       AXP318_IRQ_DIE_TEMP_HIGH_LV2,
> >
> >> +       AXP318_IRQ_PEK_SHORT,
> >> +       AXP318_IRQ_PEK_LONG,
> >
> > The order of these two are reversed.
> >
> >> +       AXP318_IRQ_PEK_FAL_EDGE,
> >> +       AXP318_IRQ_PEK_RIS_EDGE,
> >
> > And these two as well.
>
> Applied everything except this is last one.
> AFAICT, the IRQ above are not inverted ... but it is slightly confusing
> because the regmap_irqs orders it the other way

I'm reading them in ascending bit order, so it should be DCDC1 ~ 9,
die temp high lv1, lv2, PEK long press, PEK short press, PEK falling
edge, PEK rising edge.

I guess I got confused somewhere reading the list backwards...

> Thanks for the detailed review
>
> >
> > Once all these are fixed,
> > Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> >
> >
> > ChenYu
> >
> >> +       AXP318_IRQ_GPIO1_INPUT =3D 20,
> >> +       AXP318_IRQ_GPIO2_INPUT,
> >> +       AXP318_IRQ_GPIO3_INPUT,
> >> +       AXP318_IRQ_WDOG_EXPIRE =3D 24,
> >> +};
> >> +
> >>  enum axp717_irqs {
> >>         AXP717_IRQ_VBUS_FAULT,
> >>         AXP717_IRQ_VBUS_OVER_V,
> >>
> >> --
> >> 2.47.3
> >>
>
> --
> Jerome
