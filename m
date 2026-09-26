Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCB52EEE8C
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790384776; cv=none; b=EUz+L2LyqjYsg0t+6fiy5jdK2vTNdnvSphJUl2aHV14gtjDN3c6TJdo6PDb0jAy1UAtakv3JBHAe8G46MlJXVULk26rjg8O9cH/rM9lLAu1akKzO+sSB5rKGGxyHia4Rt/rzZRorFwqeEMP58SIhY9ayrNypAmQn9oaRIaGAlzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790384776; c=relaxed/simple;
	bh=mhu7VQi5nbBAN9Zn9j1l1cfmqS/PN4mzd61KAU5Q0HA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aNaSbuootYty/dDprHuwjlHkxeT4/iWJTdItTOCLFNe/FTi2PrPqWndAZ287puGEd+ar+e7jApy1/nZAuAcBxoL7Nb6EWUZtjd8oNJtr5iH2CRBpWAepdQ2gZQrqXnrexPz8UDTZpIelfw33615FpiESfuCfxXdLJb2cTx1hDDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQLr3/lv; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQLr3/lv"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2dfa0f73c3cso4140205ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790384775; x=1790989575; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uPh7h4QVBO0+zLyzuNTJsDnUZi453ATtVOhNG9pw0Zg=;
        b=kQLr3/lvce7B9RMhulTxDJu5Ss1ukjOChx4GuHCABc+yu3OVnORqpIKLjgNk8crqUB
         ODiuhomWNrPDvJ4LK9Rgiuhq3iEd2Mqwsu9qooe8jNbKnOYnVlIFUXETavvgUwruHklo
         ffqyFAFBCMMCaK743h85dm931JORUN4QdNKpjB4YIArAO0Jdi3BbV9o/VK9cZaU4uF+g
         hCxHuF+KJ+3RCbMZhhoc/KejzxX4DtPR6b6PiW4+RvmoA+Rw8TOy/pytFDxY2VArRh7i
         5G2n7t3VB+ff3eCKjiWdw2+GnV2GdBG5lq4lSwyjice0cMu1woqUOQPNCXCQV9GGC/ln
         MdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790384775; x=1790989575;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uPh7h4QVBO0+zLyzuNTJsDnUZi453ATtVOhNG9pw0Zg=;
        b=X2eaZmmtpgTYlQ55XZcvHaXOG5kChPvFh/Syu25IBbmesTtethqTi1Sp/j89/Ltgw/
         J9wCqV8lD6YMocPgfJW0t12krA8wRQheyFgnhIMqo1K44KJB6LpWjv/bwuGDhZq2tpHS
         bBpvTUdY60CiaYm6bGb4QyJjp4BXnDnbkMCXB26LTXinsGBAPwga09+naJuamSKCHi7d
         Air6u6rkoFe3Kwsi/NEVCy11vQBudkjBkgRjbN0C9YyIQ1JGE2jtvroNB+Qwvsx+Mfvd
         VHPLOxlQ35lBY5O5QfP4bd2cQxpmJgniYvua5Y0KNPv6ExF0m9Eyu40br3FFPE7EoGtO
         Lpgw==
X-Forwarded-Encrypted: i=1; AKwUvBwVh7iQl+xAixKkzawjGCd44Lx0FUbWl6/1TLTIFtlAa8wfkrkZzGhQZtFB7+KajFkpwvZW4gL89jO9X5c=@vger.kernel.org
X-Gm-Message-State: AFuF++kM4gHiATyB9j/JQcMsD2FZlI93QFjbj0/8F0UfK5XwQu//Uyxo
	c/+Z80h1vFGpJkanLjauD7cuP5/ndFl4cX58kJUTtitetaYTwHrp2/ma
X-Gm-Gg: AYBFou0EtFyDQnd3OFuyCX1s0/OQnr0NkZiK9U8kKrQr27/d/o4Y4rzETcTlObVMoOS
	J0PU8rf08rG9VIaB2n3xuxMzi3u7qVcK4WPT9Y+mHM8TBKUOFYNWPcgqj4azoujFalX3GvflmTq
	ApJm30KqTZYcFxZPQfIVYqxKPF/EdRRdHaLWhVPr2pGkqxmpCKuIKBXuWGIEAMMkyCWq5L0341g
	tQ/m5KisE2ClFYZXwNbFRB3ZJIoBmv3kQ5wffmLAeLyjuQo2kQtHZoizMzfEGRTuLzMHG1fdeRr
	jJWq3jdRCXBTuY2zGlQTUza8H9/VdAZUkngra9xP9ihnom1U1f4BRZZLTmApWSg5M+LzrWmQAMe
	JS4k5HwTtyRsOWcRUoOhGzb/0ZkTq1vYYkfub340rgrD7EpEm4w2450kD6ZDInB+0iY79Ueqjsj
	0LxeR8fS5/QCG7ePpXhb2tj1FXa1DgaSCh6S+Hpi8278kBe5mbe/pAj6barF20D4V6vREtlZSAS
	JJpek31mJg5hMzKEyZNiJFuUb9+T7pIFkwcqH923YrJLRYpHSebn5SqbqSgfs1HeryOxiJ9Iu8e
	T2aR0pUKrHgDzNezECn/JLYAxZViYz0ulwm95ViEoPwAPnwZ8Ow=
X-Received: by 2002:a17:903:245:b0:2dd:8e7d:90f7 with SMTP id d9443c01a7336-2df7da6101cmr56469765ad.9.1790384774750;
        Fri, 25 Sep 2026 18:06:14 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913e032bsm17424215ad.27.2026.09.25.18.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:06:13 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 James Schulman <james.schulman@cirrus.com>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>,
 linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>,
 Sasha Finkelstein <k@chaosmail.tech>
Subject: Re: [PATCH 16/28] ASoC: apple: Add macaudio machine driver
Date: Sat, 26 Sep 2026 11:06:02 +1000
Message-ID: <6dv6M3LAS9mol5fvC8Ie-w@gmail.com>
In-Reply-To: <arJMrsl45g2_bLPB@sirena.co.uk>
References:
 <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-16-741cc20a74e5@gmail.com>
 <arJMrsl45g2_bLPB@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Mark,

On Tuesday, 22 September 2026 7:38:54=E2=80=AFpm Australian Eastern Standar=
d Time Mark Brown wrote:
> > +static void macaudio_vlimit_update(struct macaudio_snd_data *ma)
> > +{
> >=20
> > +
> > +	/* Check that *every* limited control is locked by the same owner */
> > +	list_for_each_entry(kctl, &ma->card.snd_card->controls, list) {
> > +		if (!snd_soc_control_matches(kctl, volume_control_names[ma->cfg->amp=
]))
> > +			continue;
>=20
> This is used from the volume limit timeout work which doesn't hold the
> controls_rwsem, userspace can add or remove user controls which would
> change the list so the work needs to lock the controls list.
>=20

Would it be sufficient to scoped_guard the controls_rwsem wherever we
use this pattern?

> > +static int macaudio_dpcm_hw_params(struct snd_pcm_substream *substream,
> > +				   struct snd_pcm_hw_params *params)
> > +{
> > +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substrea=
m);
> > +	struct macaudio_snd_data *ma =3D snd_soc_card_get_drvdata(rtd->card);
> > +	struct macaudio_link_props *props =3D &ma->link_props[rtd->dai_link->=
id];
> > +	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
> > +	struct snd_interval *rate =3D hw_param_interval(params,
> > +						      SNDRV_PCM_HW_PARAM_RATE);
> > +	int bclk_ratio =3D macaudio_get_runtime_bclk_ratio(substream);
> > +	int i;
> > +
> > +	if (props->is_sense) {
> > +		rate->min =3D rate->max =3D cpu_dai->symmetric_rate;
> > +		return 0;
> > +	}
>=20
> It feels like this DAI ought to have separate ops...  Also, for the
> sense link will we definitely already have a rate set up?

AIUI, the cpu rate should always be set up by the time we hit
this path as it is only taken when setting up the VISENSE FE (after the
playback stuff is already set up).




