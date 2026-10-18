Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75823AAF5D
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302485; cv=none; b=QNebgzP2zjV7/UO+N0vpzCCXXC+OQ6UGm92jHw+kv7jqnhjk/rEb1VnPhGTu4HIKe1BzpIVxFqIRP0+/sAcTd3cS7ItY953eNrXAJ0Z6BNHDUf/bdnjPnI+9YyGWz6y/ZX5bGV76Wf6JEK/zlDFC7RGiqrM8+BJ3FscSh9khIEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302485; c=relaxed/simple;
	bh=nL33N4MkG2GAXW61rbmW51GmG14HD5JKfZBJNorgJ1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mRvQrO+RFb+J763lb9sU6emy0NiZPq6rGU/0GEU5nJgLeH5MhMPtdzG6HOri5+Aq3jlJWM2Lo0HfB2txmDsIRQ+MyAJpVnEEvTxLHyisP+VTRVQRnD2BJVolGRmEBUoA+iiSXT8iP4/xI23fGqFX1bl5kmKM3+JcnYDvowCar24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+Fudt+4; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+Fudt+4"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a05b210703so153034b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 22:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302483; x=1792907283; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OZY9wh4sxQs63RQAxeF2tIFILu93inTX2QwnrPUnhYs=;
        b=a+Fudt+4e3OgW67xS1yaWa8wIhwZ0817b8ZSxDEmUF7BN/A8tWfBQdUtxrSbUpOixK
         ax0dihjdGmYwaGU6Q9Tv3mxTI8Iu89eMfygwHBV+yHZozOl9Qv+wMPLkxvAEBHghsKjy
         n2WYDipj5a1iuntZKr1My8AunZiesDyYCwglNoKCcOyMWpbDDnRnoTv5NaMPSTEgL1EQ
         ua2QT2RYy56PwqQOSvHU3nAfRrs3a65vPB/Z5bgyjCco8D7layo2OPpAhe+TLjbcBhhL
         APFMzXGDKF6ulpYnzlIXC1uTqKDEt5xVsyN0OcAZAa47rQ4VPqQkPFHSYF8/ID84zObZ
         biKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302483; x=1792907283;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZY9wh4sxQs63RQAxeF2tIFILu93inTX2QwnrPUnhYs=;
        b=BDEetpd/5wLsQC6DMBCXRjyIAqJ1y6W39AD8McslBJIsF+68eZA4Qe5F57o2Aov6fV
         xIRAfZcJDfwX5I9l8wE82mBxIaQX1DXBOMPWKoYgiENlAAyXkOtQx+wfd8QPl43gF/Kw
         ybVKx6E+ImoBoTAX+rinFmM3BTILLjBaUBFBPetnah/QRlEbN/ihoTMBInkx26FKfJOe
         5zK7M9/BJV+45aun1SzZIZEEETwDKdaAvCjgqImtIfM72IS5XU9ZBy5RMSub2KmWa7Mx
         dpslj92CRGol2WdU6XzN0V4rr5Cg3Mm5AH5ircQT6xZ2ol0p4GKqbyqRQ2eeCD+3qszn
         74bQ==
X-Forwarded-Encrypted: i=1; AKwUvBz36Fb1Ng3wy9O5LGrOY17E8y5Gf2IYoTubzGvrbF4HXywPQ/I4ehbXfabrJD1R21VkT+LjjcGtihbjDYc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+uDg2+uetPdENct7TeAZcHXqd8wx5U7KCDsyenEHssLsdjpU9
	NTcH0/oSYgEUncRKA6qm0wiod3vKnbTIBlQRcF8VLKP9TjvFuWCDX85h
X-Gm-Gg: AYBFou0VWeaAOI0qM4Qv49Q4mmJ+d2x3DXFUqjGDY+tlPka2/xEGleHE3YZCjdp3wpt
	fXOOpIQZe8rN5ImWmYQP6M5nYdEZXPnmelIhcYHVBkguF+4O9T3lhx6bQ1jNVuwnq30hTd1bhkj
	IyTrzwrNuJtgNGTwhCfCEr04S0n4KwdnikgYENq//MSSIBjTU1BPOOzVLF7ZAQY8wDXoky8ELm8
	hlqY1SaKuxNlWvZSJgsZwY6D6yLXgFAPqEmnUBjCBGdoldolpEAISFxhWGavUF0t4j6zXPCk7wP
	iFiEt0cTimwZvLuxUUrHw37vu3aPIr9H6K9Gz0DWwp69hJiCnZsi72R1vwshXqQr5/LnFrZwiBe
	H6zDUkNWfb8mgKeNZq4dH5Ks8nqPrIcv6t/PwY205m+YZFHRquoQKZ3ESiuj+UHyho3938S132s
	ZRO+W0mCgl6BwltNAxVi7MUDZ0ORP/3lZIddLeKra2DVFrhOAova0Imy3jEWlGg+Xibmym+8+ui
	1wM7DQfCzVwE9UtA0CRIXuqFFnHFJ2cRv2BrhmA2C4WoAWwlSPbAIPSzxFj+DtxO6LVuRf/15OR
	i9oCVpfDJ/OYvZjwWON76yIkVGQk52fWTCABxJwPd7S9c6k47GM=
X-Received: by 2002:a05:6a20:c5aa:b0:3e1:efce:1d35 with SMTP id adf61e73a8af0-3e225f2b40emr3593769637.14.1792302483139;
        Sat, 17 Oct 2026 22:48:03 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57452b16sm2648102b3a.29.2026.10.17.22.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:48:02 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
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
Subject: Re: [PATCH v2 08/21] ASoC: card: Let 'fixup_controls' return errors
Date: Sun, 18 Oct 2026 15:47:54 +1000
Message-ID: <sd9fj8SNRAmGisFuRJU7rg@gmail.com>
In-Reply-To: <asZV7oBh7jQ6wk/g@opensource.cirrus.com>
References:
 <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-8-7b47ed6335a8@gmail.com>
 <asZV7oBh7jQ6wk/g@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Thursday, 8 October 2026 12:23:42=E2=80=AFam Australian Eastern Standard=
 Time=20
Charles Keepax wrote:
> On Sun, Oct 04, 2026 at 04:03:35PM +1000, James Calligeros wrote:
> > From: Martin Povi=C5=A1er <povik+lin@cutebit.org>
> >=20
> > Let the 'fixup_controls' card method return error values which will roll
> > back the half-done binding of the card.
> >=20
> > Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>
> > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> > ---
> >=20
> >  include/sound/soc-card.h                 |  2 +-
> >  include/sound/soc.h                      |  2 +-
> >  .../soc/mediatek/mt8188/mt8188-mt6359.c  |  4 +++-
> >  sound/soc/soc-card.c                     | 12 +++++++++---
> >  sound/soc/soc-core.c                     |  5 ++++-
>=20
> Fixup is missing here for sound/soc/sdca/sdca_class_function.c

Unless I'm missing something, that one calls the .fixup_controls on
snd_soc_component_driver, which is not the snd_soc_card callback
modified by this commit. That callback already expected an int,
and class_function_component_fixup_controls already returns one
per b8f71f16134f ("ASoC: SDCA: Switch to fixup_controls callback
for IRQ registration").

Regards,
James


