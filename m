Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0D636B909;
	Mon,  5 Oct 2026 08:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791189303; cv=none; b=PQs+0cca34X9cVCp/C2D/QELBSb4TmQksHfg8bjUFcyDLgrKtKOBediFWo0j2p5RnFS1/ji0DM2tjNf1KDbAbtmI3KRmLRdSUgg0+61zKIqWVFLidEJRUrnibfM/1C9Lcl74kNLptMLqlHERjBN5vgSAxmhOiaFBMy3i/ztmQJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791189303; c=relaxed/simple;
	bh=8CgGXeL4qoXn7oGswBC/lA97xsP5Gdemx8cM5Fn5UkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+pVTMn9ypPRFeC/G5Eoy7JxRfHz8yp6JAqJVUqR0vN8D2KCjuqGNGWpNTQfB4ll7YYHP3byjzR+bs6L3deQqb9WEEiJd0k+b5frDTg3QhiGdhCf064zoiOPXvbJ8R1YQcByuh/m0O67D880F0dULlFanm1Sas9gO6MSeZE73iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YxMTLgxU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YxMTLgxU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06EF31F00898;
	Mon,  5 Oct 2026 08:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791189302;
	bh=E5SZttTyES90Zw6ClM9sjxcQWTQunMvhZdqFjl3y/fk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YxMTLgxUMZxmalkP9CbMvd6gaqFmci9mgzUidwqOcKgsFe9yd2Eu16uArb8ENZld3
	 I2EA709vIP45dnxVphm81lgNI9jnBl2qJCZgW575gb8e0NyoGatssjc3y0Gel7em/H
	 FlIsGskY77A5I3VQGluKP0AC6Egxn+ZwN7HYDMqKNvo9HT/GRH1hvl5QLQsIlRWf/w
	 eWfbjr8SRyCfd0pySgMTlHWL2MMJBwcbz6T5WZpDUGMw6yl0u7GX2pj9wnz/jEWu9u
	 F461SjTjBd884mLflZLxrBfLsM/AVzCrCiPSADbyZLU4riSfdnEgRtAaPoaqQx5nP7
	 ayO2d1XM8zkTw==
Received: from johan by theta with local (Exim 4.100.1)
	(envelope-from <johan@kernel.org>)
	id 1xDe9s-0000000014e-42Xm;
	Mon, 05 Oct 2026 10:34:52 +0200
Date: Mon, 5 Oct 2026 10:34:52 +0200
From: Johan Hovold <johan@kernel.org>
To: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio: fix use-after-free in
 gbcodec_hw_params
Message-ID: <asNhLGdigxSqU5Op@hovoldconsulting.com>
References: <20261005060126.93732-1-marinela.selseth@firmwaredesign.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005060126.93732-1-marinela.selseth@firmwaredesign.org>

On Mon, Oct 05, 2026 at 01:01:26AM -0500, Marinela Tatiana Selseth wrote:
> Automated semantic analysis via Coccinelle uncovered a use-after-free
> vulnerability in gbcodec_hw_params() caused by accessing a list
> iterator variable outside the loop boundary.
> 
> The routine walks through the codec module list using
> 'list_for_each_entry' to locate a matching data connection.
> After the loop exits, the iterator pointer 'module' becomes
> out-of-bounds. Attempting to pass this unmapped reference into
> 'to_gb_bundle()' down the line triggers a critical kernel panic.
> 
> Fix this flaw by introducing a dedicated copy 'allocated_module'.
> Cache the matched pointer inside the loop block only when
> 'find_data()' returns a valid reference, and route the subsequent
> power management execution steps safely through this verified object
> tracking reference.
> 
> Assisted-by: Gemini
> Signed-off-by: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
> ---
>  drivers/staging/greybus/audio_codec.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> index 6daa4e706792..a0645bf83097 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -396,6 +396,7 @@ static int gbcodec_hw_params(struct snd_pcm_substream *substream,
>  	u8 sig_bits, channels;
>  	u32 format, rate;
>  	struct gbaudio_module_info *module;
> +	struct gbaudio_module_info *allocated_module = NULL;
>  	struct gbaudio_data_connection *data;
>  	struct gb_bundle *bundle;
>  	struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
> @@ -439,8 +440,10 @@ static int gbcodec_hw_params(struct snd_pcm_substream *substream,
>  	/* find the data connection */
>  	list_for_each_entry(module, &codec->module_list, list) {
>  		data = find_data(module, dai->id);
> -		if (data)
> +		if (data) {
> +			allocated_module = module;
>  			break;
> +		}
>  	}
>  
>  	if (!data) {

The code bails out here when no data is found (and the function bails
out early when there are no modules), so how could module be out of
bounds below?

Again, don't send LLM assisted patches to staging which is used for people
to learn.

> @@ -456,7 +459,7 @@ static int gbcodec_hw_params(struct snd_pcm_substream *substream,
>  		return -EINVAL;
>  	}
>  
> -	bundle = to_gb_bundle(module->dev);
> +	bundle = to_gb_bundle(allocated_module->dev);
>  	ret = gb_pm_runtime_get_sync(bundle);
>  	if (ret) {
>  		mutex_unlock(&codec->lock);

Johan
