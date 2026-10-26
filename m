Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793045681;
	b=0UV9rUv354rrtT47hgOwEX5cXbgCR/5kY8J5eNqytQC0/B+Axnq4Od9FvfvtvIwjxzAa
	 3yR3OD8AFeJPVh+AKONs/s6yO3dWZiwb6pHaSkaeUEbK0MUVBvUEI1UhRaupgh268hQDr
	 fosd0iEMCpFqPT6CtSPume4Rxupe0FAXdCy9FbiEgnTsZ2TV08tVeDVqkg4MEzIjV3n0g
	 vdoCecHZgqznmL1GJjw4zgqqrsl00bPMSOT1CmgM4Cd7lhOS+Ivama2franxfl39DOSWG
	 FyCvQn2yi69b06Z/mnbqcl1+J+Hh7y7iyCNYT2kHjsRZxts+s8gh/jYMqSjeB28MYlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045681;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=LeOLAG5NOHl+ZQ8R8LORc0MyjQm0Hxg75hKx7RVPk/Y=;
	b=MZO8Nsp+fARMvt1O84wbLCDd6d3BiCAUG4T3U3+yg6WoFltlmAiHPniEXt0KcLwJ9D5v
	 1Ld+A3N1TWXAjtomT/4Erex8RXaibbL5ZQR7ZG9fcPkE8VV8kvdw2AYqyFOL/MEEYTbR5
	 4lG30l8F0xAu1f3tL0YKnpc6Vu3X91ZGNIA6CPqJpZvu1chV1xj7RCnLeh4DRAh1EOLul
	 5wFFLZWoc2IateBX0y4Dd/2Qs4DccbrG7wx6SUaVNHJ79lHNzd25v17IxkuRMXSvvQ77d
	 Fpuv4QHzZacOqrDTlPhYRHPDFBkk8g592KS8t7ODGAlbITW2Vb2qhWuwKc3vpe8fzVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xs1Jg6qe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03BB606A31F;
	Mon, 26 Oct 2026 20:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xs1Jg6qe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EA201F01828;
	Mon, 26 Oct 2026 20:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793045680;
	bh=LeOLAG5NOHl+ZQ8R8LORc0MyjQm0Hxg75hKx7RVPk/Y=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Xs1Jg6qeY7610nOhA+Uu04Div3Lju7oTOFQGdimETN+LJC2tWXKk2YsaWAilhAHOe
	 1tyY/ZP/1P2J8Wi9Dgx6yQl94DBpesgj14Qv7osTwtZfMg1vHz0L1ZrVlxEXkXrqj0
	 xyIvpE5JFnhSY25SOX4NTS6XTrPY32g/QTX95d34+dGrqXn6CDellE2yUgNwvfh0se
	 xEsO+dELSdttvhyFhZrbUijIFWKimwDjMuSmkR0WxCpqsMxWLNDL6/lJJCgO0SgWNu
	 wlnbYZovvCBNP6yjfbd+EzrL+YL9vIS2+LyZMvxSfKxsRpLAk1uiK8wBHq7/3iwMjY
	 6Mn9DUok3TUVw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 142721EDD13F;
	Mon, 26 Oct 2026 20:14:27 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] ASoC: es8328: set SLRCK for the ES8388
From: Mark Brown <broonie@kernel.org>
To: Bob Hui <bg9oxa@163.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261024-es8328-vol-init-v1-2-efbd24de9639@163.com>
References: <20261024-es8328-vol-init-v1-0-efbd24de9639@163.com>
 <20261024-es8328-vol-init-v1-2-efbd24de9639@163.com>
Date: Mon, 26 Oct 2026 20:14:26 +0000
Message-Id: <179304566603.199157.13719785959966378464.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260; i=broonie@kernel.org;
 h=from:subject:message-id; bh=84b5N5Rm3tU7QK1zIji77/4mAR4ulxL7aQScdiy2r/w=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLub1n0yuTN74W3N1wQfz5zuWjuttUSvNLtTyXXX/7ks
 rNx/cYfaR2lLAxiXAyyYooscVncL+tLXq/hO7iwDWYOKxPIEAYuTgGYiGUkI8Oz/SfrF/28+N2I
 6axrXMnhm/fy97M9LQljZuFq+XRpnvxjRoY7kdE7Pr1bvPxGerDFdO+1cZs75m9Ur7H/NumDSHJ
 qgw4zAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The ES8388 has a single LRCK pin, so the DAC and the ADC have to take
> their frame clock from that one pin.  With SLRCK clear, which is the
> power-on default, the capture path never gets a frame clock and records
> digital silence while playback keeps working, so boards appear to have a
> dead microphone.

> @@ -13,6 +13,7 @@
>  #include <linux/pm.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
> +#include <linux/of.h>

Please keep the includes sorted.

>  
> +	/*
> +	 * The ES8388 has a single LRCK pin, so the DAC and the ADC must
> +	 * share it: without SLRCK the capture path never gets a frame
> +	 * clock and records digital silence while playback still works.
> +	 * Bit 7 of DAC Control 21 is SLRCK on the ES8388 and LD2MO (left
> +	 * DAC to the mono mixer) on the ES8328, so write it only here.
> +	 */
> +	if (of_device_is_compatible(component->dev->of_node,

It'd be better to put an ID in the match tables and then use
i2c_get_match_data() to look up the variant, that way the driver will
work on ACPI systems as well.

> +		ret = snd_soc_component_write(component, ES8328_DACCONTROL21,
> +					      0x80);

It'd be better to add a define for the bit.

-- 
Mark Brown <broonie@kernel.org>
