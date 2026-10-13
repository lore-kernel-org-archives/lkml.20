Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8804FDA67
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791893456; cv=none; b=Uc5aspyCB301wolJE1gR14OCVAfQl5fzfncm5kw8KF4Fhl1PG5mic/v8I61Cn1z6UgN6qMOYTjoEY6toZMGqVRlf38VXCu3gJG76Vmp1zZ4BAQhdhK+WFG2e6QKxKcilu1+pWvT2guJIMAo8TCnQ99XnqYP3AYG8UQfzIN5Pp/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791893456; c=relaxed/simple;
	bh=a1p10/uR/IHwvnBKDLlNO5lRIxzSDvGbG4EgaUu7ilY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqKab3nRL+EPiQjXFOFVTInvTn+Ne0tJ7huwQ2Gqhskni8Re8PnfgT6iD6riITRK7WrxsWINZTmvII7VSP6YBIPegPmYef7MDZMgLWx8PqXwNxaCvYv8biDHkQCPFOAtMoSSzfBs4X4Ul2zYPciu2Sctvw8jIfvRZF8dkGhf9hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SlsOlOku; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SlsOlOku"
Received: from killaraus.ideasonboard.com (unknown [185.104.138.147])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EE021E4;
	Tue, 13 Oct 2026 14:08:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791893330;
	bh=a1p10/uR/IHwvnBKDLlNO5lRIxzSDvGbG4EgaUu7ilY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SlsOlOku9VLZ/0sgrm4xw6YwzJnWIC1tdmjT+W4c4tEtQpwzTg9sS1/y++iH0MD4r
	 O7MnJ3jFQW3ohf8YIGdcPZ2qasPErcWoD0D0dWZu+K3hCLh4kOJPSXIrERI3f7Ckf4
	 TxKYV9avp0AT/b3d1hPo2mY5oic2FQWPDaY6efKo=
Date: Tue, 13 Oct 2026 14:10:40 +0200
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
Subject: Re: [PATCH 1/3] drm/bridge: stop mentioning deprecated
 devm_drm_of_get_bridge() in docs
Message-ID: <20261013121040.GK56180@killaraus.ideasonboard.com>
References: <20261012-drm-bridge-every-panel-cleanups-v1-0-0fd272f486b6@bootlin.com>
 <20261012-drm-bridge-every-panel-cleanups-v1-1-0fd272f486b6@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012-drm-bridge-every-panel-cleanups-v1-1-0fd272f486b6@bootlin.com>

On Mon, Oct 12, 2026 at 04:29:51PM +0200, Luca Ceresoli wrote:
> devm_drm_of_get_bridge() is deprecated. Update the "display driver
> integration" docs by mentioning the currently recommended API.
> 
> Link: https://lore.kernel.org/all/c1b065c8bd926708500b7c42864279e055ed95d0.camel@iscas.ac.cn/
> Suggested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_bridge.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index e7f9e6d58927..e259d078f7de 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -68,8 +68,9 @@
>   *
>   * Display drivers are responsible for linking encoders with the first bridge
>   * in the chains. This is done by acquiring the appropriate bridge with
> - * devm_drm_of_get_bridge(). Once acquired, the bridge shall be attached to the
> - * encoder with a call to drm_bridge_attach().
> + * of_drm_get_bridge_by_endpoint() or of_drm_find_and_get_bridge(). Once
> + * acquired, the bridge shall be attached to the encoder with a call to
> + * drm_bridge_attach().
>   *
>   * Bridges are responsible for linking themselves with the next bridge in the
>   * chain, if any. This is done the same way as for encoders, with the call to

-- 
Regards,

Laurent Pinchart
