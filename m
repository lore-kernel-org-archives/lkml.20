Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792589404;
	b=ky3FOmx2uEH1Df8MaCqlq2jjcIcvgJV+Ii7HoX09d4UrrWmjcFz+IaCGEg1nB3WEE9fQ
	 9gwr3JPVwsLqBU0nj41XfhBcN0hMJoDpqKLXQoUCD48d8F0aTEr6Ujp3luRq+FApaTHkg
	 P9zmUjk5upjPU/FpMOkNM932GY6HZ6cLF5FsgA2db6eJ2D5wfCLjfbBX8xdfqV5dqEUNK
	 nzJqK/RAMsRhQDGR6paYb9vNA36EdcyenpOU5WRx/01H87a59QZMC5HNq/ByDqyLAVu7y
	 7oTMHZq80ljz76F5fMR8exGP2p/xCKPmiDvtzkAXVxqxu+z5N4RhI6l1IeRjXOphQXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792589404;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ySWsHfGDAlrCmx3rkvXDuoQmW74X/X5yZy4N3Gn3SOE=;
	b=rBK7RGffBQpTBIDsIqDI1bgdTJdc+SVO/Hg/sHf1RaMZsE/f9J1rdEmKWg4k7c1TbQDU
	 +ZTnqU/PY6iYGTBwlwX40XGxBHflyo3DDu9NXFCJKb9MhJQms9CmWCfKJWzo61vnmUTNS
	 eDubd29onkDSpCy3mh57bGoyJIj52/mrc0Sm2xh753meruzpnmi57UncAmieqZ7tJxUU2
	 qTJLqQCxVIYhxWu6bEexi4PWjRz9cLFq7YboWx+HzXekAvI3I/qneLkvnK6E+azH8EHmo
	 agBayM0DpRNG+lccfJY2/9o/Mrao9dMueYZJW53XQPPW+USXcf5D8pkssALbo2KcMFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RptAFMBC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF88606A322;
	Wed, 21 Oct 2026 13:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RptAFMBC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697541F000C7;
	Wed, 21 Oct 2026 13:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792589403;
	bh=ySWsHfGDAlrCmx3rkvXDuoQmW74X/X5yZy4N3Gn3SOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RptAFMBC1SSHfKut0L7FDCS+W1mdN4cxnSkqr6PuexCz0K06EJRXFfyL1EYVGw07i
	 /BH23RbF1El/pqqMrkfNvCpe0JzrqjDWgjuk0+gdUxq5aUY9B5Wwu19cHRJKUqg444
	 cOh5bKXEEkpMJYGXv/YkzN/9e+KAjyMXgqD5yD8j3fAX6Og+zSxZTj+pIGr6b+2Pa7
	 kvdG+La3wZiEvPADEB80HOSKADK41pGvzxOWAKkeN3qY/7fGiPCbaUs3SebjAXN2cI
	 ONgPPFcoL4hSZWMTzva72yn8Vo2dzRo+2FBCaG6B3irXCydmkNkw/mP1FdEPZZyviS
	 zJlm/X17a+HeA==
Date: Wed, 21 Oct 2026 08:30:02 -0500
From: Rob Herring <robh@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dave Jones <s.dave.jones@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 1/6] dt-bindings: display: rockchip: analogix-dp: Add
 support for RK3568
Message-ID: <20261021133002.GA3886567-robh@kernel.org>
References: <20261020030916.3223833-1-damon.ding@rock-chips.com>
 <20261020030916.3223833-2-damon.ding@rock-chips.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020030916.3223833-2-damon.ding@rock-chips.com>

On Tue, Oct 20, 2026 at 11:09:11AM +0800, Damon Ding wrote:
> Document the "rockchip,rk3568-edp" compatible.  Like RK3576/RK3588,
> the RK3568 eDP controller has the dp/pclk/hclk clocks and dp/apb
> resets, but unlike them it does not use GRF registers, so make the
> "rockchip,grf" property conditional on the SoC.
> 
> Also document the optional avdd-0v9 and avdd-1v8 supplies, which are
> needed by the RK3568 eDP controller.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../rockchip/rockchip,analogix-dp.yaml        | 25 ++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> index 39dafe75a680..f8670a4e0430 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> @@ -15,6 +15,7 @@ properties:
>      enum:
>        - rockchip,rk3288-dp
>        - rockchip,rk3399-edp
> +      - rockchip,rk3568-edp
>        - rockchip,rk3576-edp
>        - rockchip,rk3588-edp
>  
> @@ -47,6 +48,16 @@ properties:
>        - const: dp
>        - const: apb
>  
> +  avdd-0v9-supply:
> +    description:
> +      A 0.9V supply that powers up the SoC internal circuitry. The actual
> +      supply source varies between different boards.
> +
> +  avdd-1v8-supply:
> +    description:
> +      A 1.8V supply that powers up the SoC internal circuitry. The actual
> +      supply source varies between different boards.
> +

Are these valid for other compatibles?

Rob
