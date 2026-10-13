Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB4B3290AA
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791893709; cv=none; b=KigzChTCKCHf3UtWQyFJfgft4vBKfXrmeL6SHzaMSu8kycHlrNqYJ9Cb7k22l6ot85cnSAgIOJ2IcaJ8lRwAImpCwv3ukOzeOo59AAlLo6ZUiOiMJXURUxLPH/Dv2DsRchy2BGnwqyl7NY9lzCpoBJaQ2fAh29M5mL1JLRPldS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791893709; c=relaxed/simple;
	bh=bxzdKWYV8es/4cPjiTSOM6NuN997uFnaVeuJzl7hiAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVoviSmSSF9Sna1YA/JjyCZ75LYHO2gVrF28l5+GiqRQ4KYAJNsklNr0XKLzzJjh2f/D4ZSaEB+Ijr1S0h5++M2bR4WrOWzru3aLlNnUY4xvazsWXZeGotOPP0pqc4e3Kojf5rlyHWFxeZmld+v55o3EcoShPECVK8AW1r+IA3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=naPGNmrb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="naPGNmrb"
Received: from killaraus.ideasonboard.com (unknown [185.104.138.147])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 88F5A230;
	Tue, 13 Oct 2026 14:13:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791893583;
	bh=bxzdKWYV8es/4cPjiTSOM6NuN997uFnaVeuJzl7hiAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=naPGNmrbcJHxO1N8b4GGpGMl6MN0mCIX0/uchubzN6RXpt/nHMqaU8MppMKjbsY6s
	 +/1mb/r4JuZq5vJuvdhQO+yeMU/Ug97wD+hZwZZfvPUZyQ0wNYnDOd4FLmboG3QNRx
	 Jm0PcrO4Fzwpx6CfbS19gSOpnSxgb3Cyy4m1VksE=
Date: Tue, 13 Oct 2026 14:14:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Hui Pu <Hui.Pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/drv: stop mentioning deprecated
 drm_of_find_panel_or_bridge() in docs
Message-ID: <20261013121450.GL56180@killaraus.ideasonboard.com>
References: <20261012-drm-bridge-every-panel-cleanups-v1-0-0fd272f486b6@bootlin.com>
 <20261012-drm-bridge-every-panel-cleanups-v1-3-0fd272f486b6@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012-drm-bridge-every-panel-cleanups-v1-3-0fd272f486b6@bootlin.com>

On Mon, Oct 12, 2026 at 04:29:53PM +0200, Luca Ceresoli wrote:
> drm_of_find_panel_or_bridge() is deprecated. Update the "component helper
> usage recommendations" docs by mentioning the currently recommended API.
> 
> Also stop mentioning drm_panel because now every drm_panel embeds a
> drm_bridge and the drm_bridge API is recommended to access panels too.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_drv.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 0cdc606af8d1..3f1b7faf5bef 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -695,10 +695,10 @@ static void drm_fs_inode_free(struct inode *inode)
>   *
>   *  - The component helper fills the niche where further standardization of
>   *    interfaces is not practical. When there already is, or will be, a
> - *    standardized interface like &drm_bridge or &drm_panel, providing its own
> - *    functions to find such components at driver load time, like
> - *    drm_of_find_panel_or_bridge(), then the component helper should not be
> - *    used.
> + *    standardized interface like &drm_bridge providing its own functions
> + *    to find such components at driver load time, like
> + *    of_drm_get_bridge_by_endpoint() and of_drm_find_and_get_bridge(),
> + *    then the component helper should not be used.
>   */
>  
>  static void drm_dev_init_release(struct drm_device *dev, void *res)

-- 
Regards,

Laurent Pinchart
