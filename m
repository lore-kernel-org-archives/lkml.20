Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871148;
	b=rzlTLE3++iQXDnBKSFDLhS9iYwX/TZabV4WKLe5MiRpcD8F1F+vEvR95c9Jy4oAjzc0b
	 4CfDo5+4I18LV9nXvBR7Op2t4VaQ6W7+GfxPVTlPERzgA9GLB5g9WbvxZOZzI4QYq8RcO
	 x5Y1Y/ehd6X0N3WJ5KKNfpoi1xDHecHotf0PIcwFq2IFtIdamcGNZ8uJmiK7Ec+BcUFYg
	 kX/Y46c1r0ZZsAZ8HzvlezX4xU8wSS+fkOkzdmxlfZYrCujnBaSjssRIOb+I/SZHv2jB9
	 B/pTfk9Mpf5V5M36M0cPpxk4fwwKp3a6Wv74fuMsQIM334n7XrbNq2CT6mbAK0A1Vww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871148;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Z5UoptergY0pXPhOZfV8qVoo9ZyI9tAXpbNaS7WGsPs=;
	b=LiRzhM6gfoNDtu1R/Sbd51WfnFNFoyk+O1c63jFN+nlDfuyV18l5xtpmTJJ8IyHhm8xl
	 OiUIOaXqbxQKHeeY6xPdTCIG1wD0e5AQ9WqfHdasimY+j17u7BmjJZgyAnyBv+1i4pVuT
	 pEQDiYVuUNYhNR7Lg26P1XQRjpWdEOic25IOaCPhqKTLa8qyDcZxwxWcLabhqkKWDNK+j
	 yG2DFYTbyOm1CnUEtQsLAnX6cAQ4NjJKtkA4IE9Gv/APoGtcVMmM3wzm3WznIsqAAGLUp
	 uEsWPMlkMJtTCyE1QRGqWuiO+uSyKuvCmFiirlBjSREajcGBFBH+JOembsJJPJDR5uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=cWUKTqoK;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CF1606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:32:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67CF1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=cWUKTqoK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793871145;
	bh=ViE9NczNde3sg3tSsZ6L6dOH8qK0mpgSPv6HZO+Nxe0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cWUKTqoKhaQ4sKoovGnmI/gRFqHkGnWmdGuM1ntYMoEqoOaNLBtr8w/T9NsZmwD6c
	 dW/ybKa/MwXQ4MpYnlmgcCiyxNp+wfeC8pLT8ug3M4LlmZ2OSjEdlJ+pt8s3o0rZso
	 grIFRe7j71llFUcjdQTHBgPEmO5siwISdAsXDXOD+xyztkSV0GA8mbpmAH54FJXQZE
	 yMBOxYYEzSk4fa8/VkmGSjAVdr2alyoTs2FNBJqdDYg9GNTKAu0wUfS/TQFjFXmey7
	 GZ9gECALLvYOx84X0V1MxDrk6QhW0CwcCzUb9TUdvEsVruBu79PWBQcB9c8Z/Ca1F/
	 Ul/7S471OvMRg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D6BE717E096A;
	Thu, 05 Nov 2026 10:32:24 +0100 (CET)
Message-ID: <26d45091-592d-4be1-8017-b9937c9df071@collabora.com>
Date: Thu, 5 Nov 2026 10:32:24 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Validate gamma_lut size
To: Fei Shao <fshao@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20261105091054.3993611-1-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261105091054.3993611-1-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/26 10:10, Fei Shao wrote:
> The DRM core only checks that a GAMMA_LUT blob size is a multiple of
> sizeof(struct drm_color_lut), not that its entry count matches the
> hardware LUT size. mtk_gamma_set() and mtk_aal_gamma_set() then read
> the blob up to the hardware LUT size, which is an OOB read when the blob
> is shorter.
> 
> Add mtk_crtc_atomic_check() and reject gamma_lut with invalid length.
> 
> Fixes: 2f3f4dda747c ("drm/mediatek: Add gamma correction.")
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> 
>   drivers/gpu/drm/mediatek/mtk_crtc.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
> index 2920f3198ef6..fd9b51fd00ea 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -880,6 +880,26 @@ static void mtk_crtc_atomic_flush(struct drm_crtc *crtc,
>   	mtk_crtc_update_config(mtk_crtc, !!mtk_crtc->event);
>   }
>   
> +static int mtk_crtc_atomic_check(struct drm_crtc *crtc, struct drm_atomic_commit *state)
> +{
> +	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	struct drm_property_blob *gamma_lut = crtc_state->gamma_lut;
> +	unsigned int lut_size;
> +	int i;
> +
> +	if (!gamma_lut)
> +		return 0;
> +
> +	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {

Yet another iterator in an array of components, slowing down this driver...

I know it's not merged yet, but please, do it on top of my restructuring for
mediatek-drm...

Cheers,
Angelo

> +		lut_size = mtk_ddp_gamma_get_lut_size(mtk_crtc->ddp_comp[i]);
> +		if (lut_size && gamma_lut->length != lut_size * sizeof(struct drm_color_lut))
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>   static const struct drm_crtc_funcs mtk_crtc_funcs = {
>   	.set_config		= drm_atomic_helper_set_config,
>   	.page_flip		= drm_atomic_helper_page_flip,
> @@ -899,6 +919,7 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
>   	.atomic_flush	= mtk_crtc_atomic_flush,
>   	.atomic_enable	= mtk_crtc_atomic_enable,
>   	.atomic_disable	= mtk_crtc_atomic_disable,
> +	.atomic_check	= mtk_crtc_atomic_check,
>   };
>   
>   static int mtk_crtc_init(struct drm_device *drm, struct mtk_crtc *mtk_crtc,
