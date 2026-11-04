Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789944;
	b=tOHTgi1hGz3UhnxKaNcVDzO8s9NecHHi3CoGtQFn3qytvLgFRFO+7NyOH96JlbuEgxj9
	 /K32pd9aL/ndnLE79K6RrjDZZNqXcR3PfyJlbOVNpyRiRyYJrhPIz0vzvIbeSgdjuWWhb
	 m/UAisXT5NlfUuqCTYpRLr7DPy9WUBRkFb4NeOoZdoscIGVdSEa/g/tim/mweQg9f/Vlz
	 ksFNWiMXsU7n+n5Cu1Kpd8804vsc62r98vKDlcQQeDKvjbbTggalYPwGUUm7NxWP7idIa
	 viB+gYnvaX4hiAyzL/I9whEzCMRpkErnPsEJFT4k3zk2I7PYP3OW9x2/yyY5bjkri9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=bBTgawvztyIZVheW/rAsVHtWBMGpPSBdrEb02iHgYVo=;
	b=wAP14omS2dOo60wBtqP//2wefyOwulplBigGdFG4i3zkQhVAtt86DZNsIWEks3+BZfzu
	 RLVQaE8zW4eAAEU4jjTvqlsDWBeVF1JtfcskGOm7ex4JIQrwNHD299ewR87EEXr9pxJ7F
	 p8ZHBR/YeGJUMk46GB04LaGx4hT8dvtYB3W48m50B2WGXPOFM+raDDJol3kcDgee8QyU3
	 OzILkIXn3hs8pifMhFHT7t2b6m+54f+DQSPIUmcDgYRVeUq7wfVqIxSypoSDupIwzjHi7
	 kI0Q0cIiV6LK4n7r7lOjw5vMyUBQvFAviHbzOJKIGgIGjeekJO4ayAbGucY3nRQFQJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=veHHt0AT;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DAA606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7DAA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=veHHt0AT
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd8ca57ef64so664506a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793789943; x=1794394743; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bBTgawvztyIZVheW/rAsVHtWBMGpPSBdrEb02iHgYVo=;
        b=veHHt0ATjkA8mDlg+Nd4K6AnUtOdd8i+sPNfn9TF2mxGCLRhq6+cTPNd0w0DYO0WwO
         qb5NtaCQGXxgo1Hh4hWWZ0zRArNwHTTyVWnTVeZg1lXMvOLlU+w1r+cPsG5P1we3Cf7w
         JSVbYA6jpjub2xiHwpEOmHOLZBEdzEXtYMe88IqmohHHYfws2Ug0seUFpcBpDz0B446E
         nSlENjNPDjTpw9Gdijhn9gHm3M1+QbVjs4ra/DFYRZqH9dAYEOBfNouTO2sNlU3HBVxB
         jE18ToGHZUWXn1g5b40KCeIxrjNEIiA5oyrGMO4UlX6HLiCc134nMAWMLECdMG5hrUFI
         bGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793789943; x=1794394743;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBTgawvztyIZVheW/rAsVHtWBMGpPSBdrEb02iHgYVo=;
        b=SZN20o8p3BOTqDngWLB27b1eDxPyz242/UVbFZdtPqCSV6UQHoE/pMlrPfkZ5Bgbir
         eRGXunp2/Xo+b3n5fPdGuAbt3UTLHh2OEt2R9amyoxVxXGwSufoKZZznw4kDpecwZYYb
         bQWb2DT04K/gmN620sfcb4pGydzn+NGDtTBw4y7dZytDSH/CnL1wBd1oW7ori5JeWQ+h
         rEXO4pXIPUUNX4WNHEvsDty6Ed/+pAUK9EqEnZ1SbgRCWZlUj81TDsSlrfwbEe87tP62
         IxQqh/AUbRtvqgINmTI/ncNBN/7Vyey4Ua2M0ByrmKfjTx/cStSLuFPxi1QhLdHKXGUV
         sUiA==
X-Forwarded-Encrypted: i=1; AKwUvBx3/cLcCcy9b9S0lAXmXGC0rn5Ls9h+UWMwkk3B8R2gosEZw+9bxmKO3yrcONe8lgEHyeriWlsbJRRR8ro=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gnEXQs0AmE28K8TnxMr7ldZg9CjjB0MUoZLKaQAJ9ahI3TYp/
	ZwdgQwu6YcqmvPzpc6okDHCO7uiDL7v9rOxAm9LkXhtEC+FdkvDlkyIt
X-Gm-Gg: AYBFou1O15G3iUbe6+sn+PYtRbNw2m3krrlfydT0o7j52ll2Q9K0ZjuFJBw30IzHzYQ
	Qtg8yNo94q9lRZo3f3C4w29ZXzk0BNA6NpuOvYjuzYkwUCfD8H2kNlDLX+lHixZ8U0netVB4V88
	vLUowX+ZYJhqKNUOIxv3oRxMWDxKDlLHFqXazqGQG3rXW7KHHuAd2RhDR/kWxcxf1PuWrtm1Oep
	8FOcktYIkElIKCq3CzwYyo985+4efcy1moyXIl1vkci0R+3MMWUPV6ifCNmh+aWIbTfBaCqIvMY
	02nomh5L/GSXYGOOp2sKHXtLkQ6/KYu1f+9Zb2Ou4tyiEGYi6GlKhIrMr1yvip7QGeZnlzbGBOI
	ueEF9qLR1wyFtMTYlyQq64YxLfKmHY1XqLp0gPLkgg4JhVxa5essn90JX5gknQoD04q8klV+o3l
	RI1xtqnonxy/6+oWqfD+OxW4TlQlBChDLHESETcLTaOOnpCORLo21gsL0hv+7Dkp4KmnyKnDoMJ
	AMuh7Gtt9+ZISvhyX2GidMB2KqpO2s18IPPXMbUMFDz4k616Pwh/LSTzsDrVFjK+/mD7XDTbq/B
	VNpUoxZH5+MshxulU28a0ItSMZcN8n7kTwGYYukmEhnoM54wQh+mewFcwGJ0EljSWKujwDd3/r6
	sD0Pf7iWfILduF00uIBbShzUKLL1M+gtTpkGnxUYvJmgBXxqu55cWYuKHMkcoLyefpgPRr7ae0z
	CJLasN
X-Received: by 2002:a17:90b:1cc5:b0:3ae:3d82:5d88 with SMTP id 98e67ed59e1d1-3ae8917bf84mr9431934a91.0.1793789942970;
        Wed, 04 Nov 2026 02:59:02 -0800 (PST)
Received: from minako.localnet ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b095314e85sm3304868a91.15.2026.11.04.02.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:59:02 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject:
 Re: [PATCH v4 02/22] ASoC: dt-bindings: cs42l42: Allow referenced dai-common
 properties
Date: Wed, 04 Nov 2026 20:58:53 +1000
Message-ID: <dD3cbQkjQr2lqk83ChC6wQ@gmail.com>
In-Reply-To: <f25646e3-d80e-4b26-b869-42608c89e665@kernel.org>
References:
 <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261104-strict-precise-mouflon-85cbad@quoll>
 <f25646e3-d80e-4b26-b869-42608c89e665@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Wednesday, 4 November 2026 8:52:38=E2=80=AFpm Australian Eastern Standar=
d Time=20
Krzysztof Kozlowski wrote:
> On 04/11/2026 11:49, Krzysztof Kozlowski wrote:
> > On Tue, Nov 03, 2026 at 05:39:50PM +1000, James Calligeros wrote:
> >> We may need to define both #sound-dai-cells and sound-name-prefix on s=
ome
> >> machines where this codec is part of a simple DAI. Allow this by
> >> refrencing
> >> dai-common.yaml and allowing its properties to be used.
> >>=20
> >> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> >> ---
> >>=20
> >>  Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml | 5 ++++-
> >>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>=20
> >> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.ya=
ml
> >> b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml index
> >> ab4c7d22dc0e..4ac0af34c464 100644
> >> --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> >> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> >> @@ -9,6 +9,9 @@ title: Cirrus Logic CS42L42 audio CODEC
> >>=20
> >>  maintainers:
> >>    - patches@opensource.cirrus.com
> >>=20
> >> +allOf:
> >> +  - $ref: dai-common.yaml#
> >> +
> >>=20
> >>  description:
> >>    The CS42L42 is a low-power audio codec designed for portable
> >>    applications.
> >>    It provides a high-dynamic range, stereo DAC for audio playback and=
 a
> >>    mono
> >>=20
> >> @@ -193,7 +196,7 @@ required:
> >>    - VL-supply
> >>    - VA-supply
> >=20
> > Missing dai-cells constraint
>=20
> Heh, I already asked for this two weeks ago.
>=20
> I do not see how you responded to my comment, dropping everything from
> DT patchwork.
>=20
> Best regards,
> Krzysztof

Given that the binding did not have a constraint for this originally, it
was my impression that adding one would best go in another patch unrelated
to this series. If you think it's fine to add here then I can simply fix th=
is
for v5.


