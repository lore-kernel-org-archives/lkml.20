Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C16E439F96;
	Mon, 14 Sep 2026 11:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=24.134.29.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384246; cv=none; b=X6i4DqO5khFVhMM+y4p/jvB9fW4ZJcMBHWtFCJD/4cOc/ZDaR0CuKUnbsYZ9/fTzHY7SSa5RTcN+7UzUmjAeY0ePf8dTTE6A4kQtbitjbHOlaRda/djDwOZeUKZZtL0oZtbsowRFYTkYSZcF1GSRLVxBkxRb4vptr4Hf2CKyq00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384246; c=relaxed/simple;
	bh=Snz0OCxdiERQaB60pbDwd668W+usaSatmVo7PTAIJfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HorVv+QxgysvaOSQuV5taQTo//dBblYCjPlpe1EI5fj4qhKH7yK6BhFeuZKS1K3H6aiox5TBo7WOaMwBEFI2yUSCj2YxFuYK03nu65MVHO/HuxysRYZKo0mcLXQq/4eGPPeoGDNNzKDS/QBRGRH5117u/YJb4xOnp9h+YT91B4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org; spf=pass smtp.mailfrom=sigxcpu.org; dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b=n91rP5er; arc=none smtp.client-ip=24.134.29.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="n91rP5er"
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id A05FBFB03;
	Mon, 14 Sep 2026 13:00:53 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T89Q9flm9AQz; Mon, 14 Sep 2026 13:00:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1789383651; bh=Snz0OCxdiERQaB60pbDwd668W+usaSatmVo7PTAIJfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n91rP5er2PLxe3m03DLXGE8fQJnS4cP884UhP8y0dhlLm5rF9TGk3GJDKsMafjoQ6
	 qIOgcOLuO8KGKYFNZdbd5b8yB+frAVyVXTAE8qzDPYOvln1C7eglW6StOBw8HTwLyu
	 bJkNDkBszFV3tEtqEHOboVGJQWyIvnP0eIOi6hYShPTuihYT30gdgiUktkeGOzRBA4
	 wusUSKUlwKcjLcenbUeAt5alFCTti17C7UtEH8OBt9PxI+qTIBCFwniHRsOXRo1H6g
	 H1T8HuLO1vFgGG8ZK+8hRKJKkFubeGIJ4AwUHusmMcfpazvZj2cytzmyQRhi/WDdZA
	 XkrR3P6oTPVgA==
Date: Mon, 14 Sep 2026 13:00:49 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Val Packett <val@packett.cool>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] ASoC: soc-core: use the device tree card name as
 long_name
Message-ID: <aqfT4ZzmxtxM2Dn0@quark2.heme.sigxcpu.org>
References: <20260506041112.412871-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506041112.412871-2-val@packett.cool>

Hi,
On Wed, May 06, 2026 at 12:58:55AM -0300, Val Packett wrote:
> When setting the model property for the sound card on an OF/DT system,
> the expectation is that that model name would be used in the UCM config
> path lookup. However, the DT model name was only used as the "short"
> name, which gets overriden by the "long" name during loading, and
> the "long" name is automatically set based on DMI data if available.
> As a result, adding an intermediate bootloader such as U-Boot which
> provides DMI data on a device that didn't have it before would break
> the UCM config loading by suddenly looking at the "wrong" path.
> 
> Fix by assigning the DT model name to the long_name field as well.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> 
> For more context/examples, see:
> https://gitlab.postmarketos.org/postmarketOS/pmaports/-/work_items/4386
> 
> err, for some reason that link requires an account to view right now,
> hopefully that's fixed by the time you're reading this. if not, quoting:
> 
> > ALSA looks for wrong device name when using U-Boot
> > 
> > What's the expected behaviour?
> >   ALSA finds Fairphone 5.conf
> > What's the current behaviour?
> >   ALSA looks for fairphone-Fairphone5-.conf, doesn't find it, and results in no audio.
> 
> ("Fairphone 5.conf" coming from `model = "Fairphone 5";` in .dts)
> 
> So it's totally unexpected in the DT world that adding DMI info would
> change which UCM path is used.
> 
> Now the question is, could this possibly break anything for anyone???..
> 
> Qcom laptops do not rely on these model-based paths at all, instead
> having custom DMI match `If` conditions inside of "fallback" SoC-wide
> UCM .conf files such as:
> https://github.com/alsa-project/alsa-ucm-conf/blob/980fb83651e82c3e53d3a0ab7fa9b7d6fc2d809b/ucm2/Qualcomm/x1e80100/x1e80100.conf
> 
> So there it shouldn't make a difference. But does *anyone* use DMI-based
> soundcard names intentionally on *any* DT platform?

Would be great to have some guidance from the subsystem / alsa ucm
maintainers as multiple distros are patching around it atm (either with
this patch or symlinks in the ucm profiles).

Cheers,
 -- Guido

> 
> 
> Thanks,
> ~val
> 
> P.S. I don't understand the lifecycle of these strings but it seeeems that
> the expectation is that they point to static data so they're never freed?
> 
> ---
>  sound/soc/soc-core.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 3fecf9fc903c..8456595bb41d 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2995,6 +2995,14 @@ int snd_soc_of_parse_card_name(struct snd_soc_card *card,
>  		return ret;
>  	}
>  
> +	/*
> +	 * When setting the OF property in a device tree, the expectation is
> +	 * that the UCM config matching the value would be loaded. However if
> +	 * a long_name is set, it would be used in the config path instead, and
> +	 * snd_soc_set_dmi_name sets long_name to the DMI name if it's unset.
> +	 */
> +	card->long_name = card->name;
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_of_parse_card_name);
> -- 
> 2.53.0
> 
