Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8616490C15
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788432810; cv=none; b=RXNXNqWTmTxwxZ0Co0PJRORUKiID3rUqMSKeoDYtkTtqw/dLOyKRzZoru8HdVg0Ark/BYyzsCzhwk4cBsSGwdWLDEwzF6EQClGeT7NmfATaYyPp7+KEh235xPLOqNhupYYSdHWiafagLcdnma7umt0HUtA6g3PDSOOBGaSIt+qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788432810; c=relaxed/simple;
	bh=pPLn8AajgOA0NudMomsdMRz+fMVynaZRSOcM8YEekmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fA+5kVoFCEzIwtgnhLSf6oDy7r3nDQ5WVNtaUunCGDYPiK7Sum4oGSvD1IxAdxMn3LBOWUxCrk16hwkzc97W1AgnN72hYN4AFkqBYXM7I/W9xRJvkPF9i/LvvXc6bbRpzqNyY0bTzCg20Bah1WHZuKfBC2ONA4N8VlSXUJbJDwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=usUeMIii; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="usUeMIii"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E57B2335;
	Thu,  3 Sep 2026 12:51:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788432713;
	bh=pPLn8AajgOA0NudMomsdMRz+fMVynaZRSOcM8YEekmk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=usUeMIiigXwMVFb2jnbq5rwbL/qU5HD9Yovp4GwkAUvRa6jAkz8Y3XAuL6+mS4+JG
	 hM+AHArh9JviJoced862gtsdeeoEbeBt0Xli3BhGx3RBov/ALVQOOK4g9csHAz4MPs
	 rnMFSeJz61Zz/+2JSh9Sk0JYQTQXhG4oogxcIuv8=
Message-ID: <85ce561d-fd2b-4705-9136-0173670e9148@ideasonboard.com>
Date: Thu, 3 Sep 2026 13:53:22 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tidss: dispc: Switch to drm_fb_dma_get_gem_addr() for
 framebuffer addresses
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jyri Sarha <jyri.sarha@iki.fi>
References: <20260903063142.3770509-1-wenst@chromium.org>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260903063142.3770509-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 03/09/2026 09:31, Chen-Yu Tsai wrote:
> dispc_plane_state_dma_addr() and dispc_plane_state_p_uv_addr() are
> basically the same as drm_fb_dma_get_addr(), without the support for

drm_fb_dma_get_gem_addr()

> formats with block parameters. Since the driver doesn't support any of
> those formats, the result is the same.
> 
> Switch to drm_fb_dma_get_gem_addr() for getting the framebuffer addresses.
> Drop the const modifier on "struct drm_plane_state *state" for
> dispc_plane_setup() so that the state can be passed to
> drm_fb_dma_get_gem_addr().

Or add const modifier to drm_fb_dma_get_gem_addr(). But it's ok either way.

> Using the helper also future proofs the driver in case block parameters
> are added for more formats, especially the common sub-sampled YUV
> formats.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>   drivers/gpu/drm/tidss/tidss_dispc.c | 38 +++--------------------------
>   drivers/gpu/drm/tidss/tidss_dispc.h |  2 +-
>   2 files changed, 4 insertions(+), 36 deletions(-)

Looks good to me. I can pick this up and fix the above typo while 
applying, or wait for v2 if you want to do something about the const.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index 58d5eb033bdb..2a0ec11a6c90 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -2157,47 +2157,15 @@ int dispc_plane_check(struct dispc_device *dispc, u32 hw_plane,
>   	return 0;
>   }
>   
> -static
> -dma_addr_t dispc_plane_state_dma_addr(const struct drm_plane_state *state)
> -{
> -	struct drm_framebuffer *fb = state->fb;
> -	struct drm_gem_dma_object *gem;
> -	u32 x = state->src_x >> 16;
> -	u32 y = state->src_y >> 16;
> -
> -	gem = drm_fb_dma_get_gem_obj(state->fb, 0);
> -
> -	return gem->dma_addr + fb->offsets[0] + x * fb->format->cpp[0] +
> -		y * fb->pitches[0];
> -}
> -
> -static
> -dma_addr_t dispc_plane_state_p_uv_addr(const struct drm_plane_state *state)
> -{
> -	struct drm_framebuffer *fb = state->fb;
> -	struct drm_gem_dma_object *gem;
> -	u32 x = state->src_x >> 16;
> -	u32 y = state->src_y >> 16;
> -
> -	if (WARN_ON(state->fb->format->num_planes != 2))
> -		return 0;
> -
> -	gem = drm_fb_dma_get_gem_obj(fb, 1);
> -
> -	return gem->dma_addr + fb->offsets[1] +
> -		(x * fb->format->cpp[1] / fb->format->hsub) +
> -		(y * fb->pitches[1] / fb->format->vsub);
> -}
> -
>   void dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
> -		       const struct drm_plane_state *state,
> +		       struct drm_plane_state *state,
>   		       u32 hw_videoport)
>   {
>   	bool lite = dispc->feat->vid_info[hw_plane].is_lite;
>   	u32 fourcc = state->fb->format->format;
>   	u16 cpp = state->fb->format->cpp[0];
>   	u32 fb_width = state->fb->pitches[0] / cpp;
> -	dma_addr_t dma_addr = dispc_plane_state_dma_addr(state);
> +	dma_addr_t dma_addr = drm_fb_dma_get_gem_addr(state->fb, state, 0);
>   	struct dispc_scaling_params scale;
>   
>   	dispc_vid_calc_scaling(dispc, state, &scale, lite);
> @@ -2229,7 +2197,7 @@ void dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
>   	if (state->fb->format->num_planes == 2) {
>   		u16 cpp_uv = state->fb->format->cpp[1];
>   		u32 fb_width_uv = state->fb->pitches[1] / cpp_uv;
> -		dma_addr_t p_uv_addr = dispc_plane_state_p_uv_addr(state);
> +		dma_addr_t p_uv_addr = drm_fb_dma_get_gem_addr(state->fb, state, 1);
>   
>   		dispc_vid_write(dispc, hw_plane,
>   				DISPC_VID_BA_UV_0, p_uv_addr & 0xffffffff);
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
> index 739d211d0018..2183254f1ab7 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.h
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.h
> @@ -140,7 +140,7 @@ int dispc_plane_check(struct dispc_device *dispc, u32 hw_plane,
>   		      const struct drm_plane_state *state,
>   		      u32 hw_videoport);
>   void dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
> -		       const struct drm_plane_state *state,
> +		       struct drm_plane_state *state,
>   		       u32 hw_videoport);
>   void dispc_plane_enable(struct dispc_device *dispc, u32 hw_plane, bool enable);
>   const u32 *dispc_plane_formats(struct dispc_device *dispc, unsigned int *len);

