Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6474D956F;
	Thu, 15 Oct 2026 19:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.128.243.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092308; cv=none; b=KigFCzLNN868xYAMQmBgCNk7ULNpf01+iLKB4JnkqplWEGkYmk1yfDmDxxKjLoLissGqAAzWn7+ZhPpURHNyB8tf0eVg8ZB8gPPguyqTubAWnHXyOYL+nTfInBOnFd5G/EqhMGZtR8T2afX0gzmYDFWTH2Otvm0zgRTd+siTmTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092308; c=relaxed/simple;
	bh=tU7SttCJuXiXSdn4aI6q5wp5/GBBe9+68ixR/4vh4SU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=edC3pVknD9QpfjSqMKBgfSr3UxjdU0P/JnB0jshAsq9isWhyjDdCVDdSnpweBmoKbppPjxIErL1ep4NJ9PUBpV/UV01eAtER85qtGazDLBbk7/3e8ybjULlwruB+dw+cVCR1mDntvkiPscdHw5kmKZssa7VjaRDjXume889fUoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net; spf=pass smtp.mailfrom=asmblr.net; dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.b=Hi7NqBZG; arc=none smtp.client-ip=85.128.243.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.b="Hi7NqBZG"
X-Virus-Scanned: by amavisd-new using ClamAV (23)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1792092303;
	bh=LwfbJ/ovnkdDCpiQfYRa99yrv9di6xMouQJuq/fGtQ4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Hi7NqBZGjwJm1Uf7orLDE9VAm186iLx/suzEiIxdkTv1kiW+r9hsQtHw8pqOjTFMo
	 mgiu/hnPhyoiUo8Hh0xfrIwRAkTREZV2hqj3k1Hya/+1K4+NShs7Ht3nc2jIuVncUa
	 EIp8mXlyo366q5xf728lPZ1SRVf8pvTSQxHT5NNHprYBlAmcdeHLXiO0GA328MjyF7
	 muyzsD2weArJd93Vb5e4eO+pEJYUxoYmWHGpAYXeuBFpILBGo2R2CVkszdwKdOGcGA
	 DIFatFJtmd2KYboHIts5ir0zeIruLWXuJxndRhJkdxyqr19rpjyJxUmn5Kw6xex5f5
	 tyCqECtxwAILg==
Received: from milkyway (91-150-221-36.dynamic.play.pl [91.150.221.36])
	by server753313.nazwa.pl (Postfix) with ESMTP id 662AD1BD4C5;
	Thu, 15 Oct 2026 21:25:03 +0200 (CEST)
Date: Thu, 15 Oct 2026 21:25:02 +0200
From: Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?= <amade@asmblr.net>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, linux-sound@vger.kernel.org, tiwai@suse.com,
 perex@perex.cz, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ASoC: Intel: avs: Unprepare a stream when recovery
 occurs
Message-ID: <20261015212502.6280c705@milkyway>
In-Reply-To: <20261015190240.729793-2-cezary.rojewski@intel.com>
References: <20261015190240.729793-1-cezary.rojewski@intel.com>
	<20261015190240.729793-2-cezary.rojewski@intel.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 Oct 2026 21:02:38 +0200
Cezary Rojewski <cezary.rojewski@intel.com> wrote:

> Recovery on alsa-lib side is handled with either:
> 1) snd_pcm_prepare(state=XRUN)
> 2) snd_pcm_drop/drain() -> snd_pcm_prepare(state=SETUP)
> 
> before starting the PCM anew. Relying solely on state=XRUN leaves 2)
> unaccounted for. sound/core/pcm_native.c ensures correctness of the
> state machine so plain state!=PREPARED check suffices.
> 
> This is the BE equivalent of job done previously for FE side only with
> commit cfca1637bc2b ("ASoC: Intel: avs: Unprepare a stream when XRUN
> occurs") and its follow up titled: ("ASoC: Intel: avs: Reset the stream
> unless it is already prepared").
> 
> Link: https://lore.kernel.org/linux-sound/20261010103753.16969-1-stiraspo@gmail.com/T/
> Fixes: d070002a20fc ("ASoC: Intel: avs: HDA PCM BE operations")
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/avs/pcm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
> index 3cf455e8b879..a0a0d645ea33 100644
> --- a/sound/soc/intel/avs/pcm.c
> +++ b/sound/soc/intel/avs/pcm.c
> @@ -461,6 +461,8 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
>  	link_stream = data->link_stream;
>  	p = &be->dpcm[substream->stream].hw_params;
>  
> +	if (substream->runtime->state != SNDRV_PCM_STATE_PREPARED)
> +		link_stream->link_prepared = false;
>  	if (link_stream->link_prepared)
>  		return 0;
>  

It's bit late, so I can be wrong, but if you are going to execute whole
function in most cases anyway, is link_prepared even needed? Why not just:
	if (substream->runtime->state == SNDRV_PCM_STATE_PREPARED)
		return 0;
and remove link_prepared entirely?
