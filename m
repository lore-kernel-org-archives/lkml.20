Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D0F17DFFA;
	Thu, 15 Oct 2026 12:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066045; cv=pass; b=U7Y4lxOw2aSdcXlWwxPcMDCtabkliYMGs/R/5BSJ24V8fhQFno2wxEJ0dxnXWltmWihVVYR7mdVE5D4eNLw516CsJ+5zHgUsfGzI2U16eH8ZvziA+rn+6+73XH4XcwGTm4b+XVpiAG7+ROZ3UMqLvZx+vtr+oc9/XqiF+AtYFEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066045; c=relaxed/simple;
	bh=nNP+Fhnuz43izQOtDHtDXM0wRfPfESEKF9hULARcNyI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BCRMGH7dh/dp3wOA01DvEqHg70DwBlxGqRzjs3sBTwV7BbE5z4fUePT4IORBak9+5rU4H3iQi7zfjIRpEoIlEeGo4L7/QwMTwIDRvOeVMNZxjYgozQGMQnibw9WXRWtyiq5QJh7y6YudUwmF1JRPbY9qxh0ir/0/Ser993X6rNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=V/VhihZi; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="V/VhihZi"
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 148ED200563;
	Thu, 15 Oct 2026 14:07:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792066034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AzhGgKYacCpBjvJn7OHauXCkEcJeUBoCpFaiUeHOgps=;
	b=V/VhihZigYE0mxxjZyKs0RFYejck80xENPJXKEE5jhKm3DL1PsCJsqjcC8QEiMl6bLZmKi
	k9V0AsxuEmyORjrnDQCiLX+uGPbFmlAkf+8xkTSTpRIOo4FsdRljAcD1JkiM56eXx+tBGN
	sJvt3YVz286bjggz9GdbRE6QXizLxkd733mIOYtxrYpIiEGmyw5MeJzLLTlyCs50de1bi0
	MHnseuB1ReE0Zg3cH7wcLIa57nG08hAdywAFVZJ63ovxvEGpAiGZsja1zRER8gTgddZqvF
	HxVXdBy1V8oW/6Pngk1RHz/FJkrOLZVemi13uwqyvWEVEWlH43IOyIMFIPtrEg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792066034; a=rsa-sha256;
	cv=none;
	b=SDsTVvWabalC0zxNlbN1N73C85Y5irdwNvJpYD28ZjuV7/zcL5uf6QwGD6qZW/9AnFbKi7
	g9t+HA1bsRNJmwrT7ujP7mXE/OYNdMhM8gO45EmqfNU7jceU9TxyVBsQUGCygVqGmR0tpi
	PYHDRebgWbmm/TosBDtpT3ZnvmkmXFRkqnHwG91/DnS4kTS7d9GfllfZ+zxktUoB5kwk7F
	naeggJmYmvzavYi2o8rdgzq9eptqYOp2FafQA5TbXYFLBVdRQWMPoSrGPwZMdvHRzS8eGk
	zQKwVsXzrPDjc98aYg+ta92I2t+XPv60Hdcww57OGeiIAuHq5GGp+vE9kG8xCA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792066034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AzhGgKYacCpBjvJn7OHauXCkEcJeUBoCpFaiUeHOgps=;
	b=FUkCn5s9zJEfrt5Bu40NO60ajsgDNr1zDeKRCcwRiNGmo5Yl8563NO4DgSeUcA0rQP9CRS
	UNoPHhcDOKbtBaGfpfGOqUnWKqmrBypXzqingiVchkCNXnLeVjJUZCIFHVXDwHvoE0hzkC
	B+VKGGqP7/crGl194J/gsKC94iouIiT0Ya0n2kAXlWFF+RQOvS+cUhtGY0UYLvzRD2yo4o
	+ua2qlAu4i31B/MCWx7NvNyyjT329RgPyZt0o2somy9oF1ktxVXy4WE8wTEOxtPq1/qZDR
	b8Ydae6KABEvGNE0oSezl0KqsDOevTwnjhITGcMfLF+ntVh48J3l6Z/wsaidPQ==
Message-ID: <71ec016a796934e8d445e8d3b7f4e8e5335b5a8f.camel@pengutronix.de>
Subject: Re: [PATCH v4 2/2] ASoC: airoha: Add support for AN7581 PCM driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Christian Marangi <ansuelsmth@gmail.com>, Liam Girdwood	
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai	
 <tiwai@suse.com>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 15 Oct 2026 14:07:13 +0200
In-Reply-To: <20261012115408.87066-3-ansuelsmth@gmail.com>
References: <20261012115408.87066-1-ansuelsmth@gmail.com>
	 <20261012115408.87066-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mo, 2026-10-12 at 13:54 +0200, Christian Marangi wrote:
> The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
> supporting playback and capture at sample rates of 8 kHz and 16 kHz.
> The driver configures the PCM bit clock to 2.048 MHz and supports
> 8-bit and 16-bit samples, with up to 32 channels.
>=20
> Add an ASoC platform driver for the AN7581 PCM controller configured for
> ZSI attached voice chip.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  MAINTAINERS                   |   7 +
>  sound/soc/Kconfig             |   1 +
>  sound/soc/Makefile            |   1 +
>  sound/soc/airoha/Kconfig      |  10 +
>  sound/soc/airoha/Makefile     |   3 +
>  sound/soc/airoha/an7581-pcm.c | 904 ++++++++++++++++++++++++++++++++++
>  6 files changed, 926 insertions(+)
>  create mode 100644 sound/soc/airoha/Kconfig
>  create mode 100644 sound/soc/airoha/Makefile
>  create mode 100644 sound/soc/airoha/an7581-pcm.c
>=20
[...]
> diff --git a/sound/soc/airoha/an7581-pcm.c b/sound/soc/airoha/an7581-pcm.=
c
> new file mode 100644
> index 000000000000..568c11dc7e6b
> --- /dev/null
> +++ b/sound/soc/airoha/an7581-pcm.c
> @@ -0,0 +1,904 @@
[...]
> +
> +struct an7581_pcm_priv {
> +	struct regmap *map;
> +	struct reset_control *reset;

This doesn't seem to be used anywhere other than _probe?
Could be a local variable there.

regards
Philipp
