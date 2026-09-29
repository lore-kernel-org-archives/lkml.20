Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E3B385D8E;
	Tue, 29 Sep 2026 07:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790667917; cv=none; b=Vyr/xoPJjCLKC+SrK8k/JzSMQW/bxs7QgEApUBXVoMVdEoor8cMvBYVY91dlH4WLJCpuuWtE7QvkvwVAxa32luerYDtXPGfaM0GT621Rw+/FrEVaABsPC3M6NqkJu0z8AA1a6SgdjNqYHMtTbGJtzRd6rlf/rMsF1Uaeqm59dG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790667917; c=relaxed/simple;
	bh=mGEZY/fD7+XQLDfjaIy0mTpiYoeYRKt7VFKYzR+TcYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F4p8m4t1oFxDKR8Eblf5U/iMjnoHTL3Z6AggyRIqO0neGSL1CxfQF1QfPwAMblBqozBmfHhL0bP+PCn85r3aakspEt3WDh+Qx7H0pZnYeFuAHBnom9ucNQ20gHiWUEqVvOum1WbyKBho2mcJKICwqaBXD7hdm5gpglra+bqcU7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBdqiyXd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBdqiyXd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63EF21F00893;
	Tue, 29 Sep 2026 07:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790667916;
	bh=nk5wMiMAX7vmm1Ap7xDUsjodqXNumTEJaxf1IBSHmDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QBdqiyXd4YSEFgEBMn2SLVp2Cy4+10t4naU40ueHRJBEEmrCXXYeFD7I2DW8Fxao0
	 zhKfE8rVAmOOqJBX355ZAIgrBd1+s/FqzJN1uADcaPTt6Y7wyIWQr2gOXwg4OPp/vz
	 L7L69bpmnqEX7bogFhChT8TMyfAmMWC0aSApXjiVKHkEXN6PCwmsLZNiYD/dOnIAC8
	 3NrQ6Dg7v+yEz0HvckJ63xWwOLPNviFTKrijFFjconpxIRa1nglIFl3YFxRJhJ2SkJ
	 jA604EDyNOQakfcAwLEVj6xdQjMXt9g8QsHJeQuBIpOhfFpWeqqB5GOh+MU93/CLf8
	 1ahJr9WsSiaqw==
Date: Tue, 29 Sep 2026 09:45:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Dzmitry Sankouski <dsankouski@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Petr Vorel <petr.vorel@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 06/11] drm/panel: s6e3ha8: Correct the polarity logic
 within
Message-ID: <20260929-dramatic-ocelot-of-support-2aa377@quoll>
References: <20260924-crosshatch-panel-v2-0-08d5c7bf72fc@ixit.cz>
 <20260924-crosshatch-panel-v2-6-08d5c7bf72fc@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260924-crosshatch-panel-v2-6-08d5c7bf72fc@ixit.cz>

On Thu, Sep 24, 2026 at 04:01:34PM +0200, David Heidelberg wrote:
> The reset was introduced with wrong polarity. Correct for the future
> compatibles and keep current with reverted logic.
> 
> Old DTs keep GPIO_ACTIVE_HIGH and are fixed up via
> gpiod_toggle_active_low() on the deprecated compatible.
> 
> Assisted-by: LLM
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> index 5e1e997b83b36..99290913de69a 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> @@ -20,16 +20,17 @@
>  #include "panel-samsung-dsi.h"
>  
>  struct s6e3ha8_desc {
>  	const struct drm_panel_funcs *funcs;
>  	const struct drm_display_mode *mode;
>  	unsigned long mode_flags;
>  	const struct regulator_bulk_data *supplies;
>  	unsigned int num_supplies;
> +	bool broken_reset_polarity;
>  };
>  
>  struct s6e3ha8 {
>  	struct drm_panel panel;
>  	struct mipi_dsi_device *dsi;
>  	const struct s6e3ha8_desc *desc;
>  	struct drm_dsc_config dsc;
>  	struct gpio_desc *reset_gpio;
> @@ -62,22 +63,22 @@ static int s6e3ha8_unprepare(struct drm_panel *panel)
>  {
>  	struct s6e3ha8 *priv = to_s6e3ha8(panel);
>  
>  	return regulator_bulk_disable(priv->desc->num_supplies, priv->supplies);
>  }
>  
>  static void s6e3ha8_amb577px01_wqhd_reset(struct s6e3ha8 *priv)
>  {
> -	gpiod_set_value_cansleep(priv->reset_gpio, 1);
> -	usleep_range(5000, 6000);
>  	gpiod_set_value_cansleep(priv->reset_gpio, 0);
>  	usleep_range(5000, 6000);
>  	gpiod_set_value_cansleep(priv->reset_gpio, 1);
>  	usleep_range(5000, 6000);
> +	gpiod_set_value_cansleep(priv->reset_gpio, 0);

This breaks all users and this usage of ABI was already released.

NAK

> +	usleep_range(5000, 6000);
>  }
>  
>  static int s6e3ha8_amb577px01_wqhd_on(struct s6e3ha8 *priv)
>  {
>  	struct mipi_dsi_device *dsi = priv->dsi;
>  	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
>  
>  	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> @@ -203,17 +204,17 @@ static int s6e3ha8_amb577px01_wqhd_prepare(struct drm_panel *panel)
>  	ret = regulator_bulk_enable(priv->desc->num_supplies, priv->supplies);
>  	if (ret < 0)
>  		return ret;
>  	mipi_dsi_msleep(&ctx, 120);
>  	s6e3ha8_amb577px01_wqhd_reset(priv);
>  
>  	ret = s6e3ha8_amb577px01_wqhd_on(priv);
>  	if (ret < 0) {
> -		gpiod_set_value_cansleep(priv->reset_gpio, 0);
> +		gpiod_set_value_cansleep(priv->reset_gpio, 1);

No, you just changed it!

Implement correct and logical fixes, not half-baked fix which is
immediately wrong.

Best regards,
Krzysztof

