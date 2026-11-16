Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817804;
	b=CjQULc5nm421twW3b+TQGsiuh2GKvOPmmIWT/7d+ji0Kx1EbSUachPLYKhlz/MSga14K
	 kZL3tLyYASE3OAoT8r9PXs2cNX00EMuSw/Yfr63ehQ3Xutj7C4a5MgeGDuM7HcK/C1Qtj
	 ceMOFeTSMDuuvp6LaxkjkcGK+w/Kz35nQfGqXJA24HE1B4UcyPtR2vMCnJF3vHU0prgI/
	 fLZcVci8AmZfqTIFk36ZXBF317ibI3O39AO04QJrSx4U1ITTvGC3fsrH+jJwmo2jpqmvr
	 YzLthohvcXebYjyHh7hXN/VSxG9LT+101PaCTt1KkY6kapnGBIlDdstl/cHqFHm4GSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817804;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=lm4Go5/e0CrX7BxoDuZggSWLrwmRULJIrvc5xvYu07I=;
	b=MXW9/v3wvvzMdBOPIA5IQb/Zqfs3pM+fGLIff/y9DWK2W5wuse3znTt9VYOkcft82wNi
	 scmKL5dr8et2mB7+afnUSfNP0hzCCdg6Pi6MpNKM80ICD74C5lKwvQsapp1lMAPmQZ2WB
	 deoPllAmldi+rUl9hkl6JPg0ui9lJECE2pftTF1GVTcJfAudinxk3JKXX1EVS8bqA4LtP
	 uhb0glbNP4oHetDm+RKPrczv+GceFRNIF+851tpLZp9MkaoYlCA0FL5DrctTp6iULiL3T
	 yO2BmjTW/lsWwcdf4i5O5sD2nR8oipbGHRmGQXWcVmcU86nd8uGAKWQ30A0Xk+ASsAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=fCIhAIp8;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E131C606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E131C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=fCIhAIp8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=lm4Go5/e0CrX7BxoDuZggSWLrwmRULJIrvc5xvYu07I=; t=1794817803; x=1796027403; 
	b=fCIhAIp8p8XKjAeqYz6JCBtVHtAN89yB38O3gDKhiItY0d5cXxWQySnce8b4qwoGywsRS8ZEAQJ
	Ce/+2n+ep3z7WnoKPyXEbhSd1H21pxq7QDfGDc/IIP9iwXPeXXj/d4847VivLhQHsyMSLJB0Rq8Gx
	TxmD+j3bG2JeftNnLknTM9DQCQmU1cDoGB53JKgrVn+hYyLCqq6uWoZFRnvlt6onx3GgSpVlo1ZA4
	xK/B4R8B1m1g0Dz+IaI80mV8XwBYB0/N0HLvgQuBytpZXybfFvv2pV+MAEZRl35yE0o/WQyyJ86lt
	GzROtZ73FGYlMpajF382SM8D2T+EaavvQhXA==;
Date: Mon, 16 Nov 2026 09:29:54 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Dave
 Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v5 09/13] drm/bridge: tc358762: Fix sync polarities
Message-ID: <20261116092954.1997be09@kemnade.info>
In-Reply-To: <20261015-tc358762-fixes-v5-9-7cd721a6451b@ideasonboard.com>
References: <20261015-tc358762-fixes-v5-0-7cd721a6451b@ideasonboard.com>
	<20261015-tc358762-fixes-v5-9-7cd721a6451b@ideasonboard.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 Oct 2026 14:16:00 +0300
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> Setting LCDCTRL_HSYNC_POL and LCDCTRL_VSYNC_POL will make the respective
> sync signal active high. The driver does this in inverse. Fix it.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

at least the commit message matches what the patch does, but nothing else
can be checked anyways here.

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

> ---
>  drivers/gpu/drm/bridge/tc358762.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
> index 1fb5626a35ab..2baacef685a5 100644
> --- a/drivers/gpu/drm/bridge/tc358762.c
> +++ b/drivers/gpu/drm/bridge/tc358762.c
> @@ -190,10 +190,10 @@ static int tc358762_init(struct tc358762 *ctx)
>  
>  	lcdctrl |= LCDCTRL_DCLK_POL;
>  
> -	if (ctx->mode.flags & DRM_MODE_FLAG_NHSYNC)
> +	if (ctx->mode.flags & DRM_MODE_FLAG_PHSYNC)
>  		lcdctrl |= LCDCTRL_HSYNC_POL;
>  
> -	if (ctx->mode.flags & DRM_MODE_FLAG_NVSYNC)
> +	if (ctx->mode.flags & DRM_MODE_FLAG_PVSYNC)
>  		lcdctrl |= LCDCTRL_VSYNC_POL;
>  
>  	tc358762_write(ctx, LCDCTRL, lcdctrl);
> 

