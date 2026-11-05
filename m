Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900538;
	b=zswgak0ih6S+9dPHFtyR0o6eH1dMEuZh3/rFJeVaQ70C1l4fuLz33k1i9B/adnApfWl4
	 3Mb3wl4pi953Xe/l56LgEiUfIEuC9uWTzL/7UI9r+Q5oQUvrhI1ojNT1WompIX3QO2vRG
	 3juZTliPE6YJSHq67FabbP/WMQ6XXR9XaiaZ1gm7grNDV4iVoKnJQ+f+r6Kajet0aP6ha
	 7i50n+0LgXsvcPngoOoXlGLFb/6io9ljc5xLYgNIBwyr0Z1N5qcBlrHorkHd5l03+lc2W
	 nxXBudEiH4z6PglPE+1vtxlsZ+sCTDYBWQR1GUFrAGshEqXyPvE06FA93/SZZvmeibQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900538;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=oTHjCu0LuGcIRh50R1eAfy0Rx3NQD8kakUvV0IXvgdk=;
	b=NxSl8q+HxDjOLQptfsM08SPUonxjvyGt7qDPFfxEHcPoGda0OgwEY1VuPpSkAdk16T8e
	 WtM4VVuxpziuz+kvYdNkSwq7jK76NnUr//j9Yqg+cEk8dd6arz+EaI5IUkzZ+viytEkoc
	 QUSoTPP+2MRMpc7an7YU3BH8UaWYMnMdvBOGTmOhXzQorEsTHH62/Rys+b1IIe9X5HIQD
	 7lSjBUW6+00t8EwEDvGPEhISkDQoDZNDt4tKlBaGyp5v/X/K+zvsRNkPsozRac9zyxO1J
	 Ns7WNwekcQihXn1JsqTWQtxh5Ijr3NDpH0oGqxfdy8kva4VtIYOyUhOtM7HoSOeKF9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Mhab/l40";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B6A606A337;
	Thu,  5 Nov 2026 17:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mhab/l40
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8FF1F0093A;
	Thu,  5 Nov 2026 17:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793900537;
	bh=oTHjCu0LuGcIRh50R1eAfy0Rx3NQD8kakUvV0IXvgdk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Mhab/l402h4Lf/3cz4XzcGuiQQL8yfS/02KiNRD6mUwsKekRoshxkt0O0hrxVfG8z
	 814X+3nfnhZIbfprkweX++k/GWQYvu5ienfsHJK3E6NC2JBTYUqwiNNy/fygUwq8Rz
	 phqYxWNzCxffjb73zM21F4xDq95QlgMUDhFOh4kV3s6pNWPFaKz+yyAQYFJ2NQYdW2
	 RsVU9vKkSIlz+pAf05Q6nx20zgPqxuDNJCdd/czGq81RmUWEwqQpTU4AE1JhkwPaBf
	 XwyWJdw+QyBLzhkCAULCbE0BolamYHqhXfjKC30iQKmwa5qo8OM2459Db39PIL7/6m
	 2c9rct+Y7nX0A==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 0C6B927B45C5;
	Thu, 05 Nov 2026 17:42:05 +0000 (GMT)
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
Subject: Re: [PATCH] ASoC: codec: pcm1681: Acquire sck when bound to a card
From: Mark Brown <broonie@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
 Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261021031228.2074402-1-shengchao.guo@oss.qualcomm.com>
References: <20261021031228.2074402-1-shengchao.guo@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 17:42:03 +0000
Message-Id: <179390052368.3073895.16132231139898724200.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1716; i=broonie@kernel.org;
 h=from:subject:message-id; bh=CdVAXl6InBlLA2D6W+tvuTQS7KcpYmzS0ufCPYeNK0s=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe7H9zeJZKZOd302nv0s7s+bhx4maRRfOjtiltzzaWv
 b7L/Jm3V0cpC4MYF4OsmCJLXBb3y/qS12v4Di5sg5nDygQyhIGLUwAmUsfEyLDvHuvdvm9q12of
 ZT1dUOGnIPUvMVP0416127NfJ7I53XnE8E9XsVmfJTP/R+D+nCO9XWpW73+kfXcQD2WYWfilSnl
 5Og8A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The sck clock is taken once at i2c probe and held for the lifetime of
> the device. On Qualcomm boards it is an LPASS clock exported by the
> q6prm clock controller, which lives on the DSP and is unregistered and
> registered anew whenever the ADSP is stopped and restarted. fw_devlink
> cannot tie pcm1681 to that provider, since the provider node only gets
> a device once the DSP is up, so it falls back to the remoteproc device,
> which stays bound across a DSP restart. pcm1681 is therefore never
> unbound and keeps a clk handle to the dead provider.

This seems like something that ought to be dealt with on the Qualcomm
or fw_devlink side TBH, registering the clocks and returning -EBUSY on
attempts to use them would be less disruptive to other components in the
system.  I don't understand what fw_devlink would be doing with
reparenting clocks...

> +static int pcm1681_component_probe(struct snd_soc_component *component)
> +{
> +	struct pcm1681_private *priv = snd_soc_component_get_drvdata(component);
> +	struct device *dev = component->dev;
> +	int ret;
> +
> +	priv->sck = clk_get_optional(dev, "sck");
> +	if (IS_ERR(priv->sck)) {
> +		ret = PTR_ERR(priv->sck);
> +		priv->sck = NULL;
> +		return dev_err_probe(dev, ret, "Failed to get sck\n");
> +	}

This is the oppositie of the standard advice for drivers, and we don't
deal well with probe deferral from component probes - in particular,
nothing will trigger a rebind of the card if we don't probe a new
component and that's not going to happen if the CODEC already bound and
isn't waiting for the clock.

Also dev_err_probe() will only DTRT from device model probe.

-- 
Mark Brown <broonie@kernel.org>
