Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA60375ABE;
	Sat, 26 Sep 2026 03:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790393586; cv=none; b=IMscBbhMg3XHy+0bvNmWhYYocG5hwftfpM2XIN2Rv9mjELzg7MxXS71dlnwJiG2+Jw8bMpJKHGlsLgi9n+vgbptFE18MR25z4L4ePIfz7kODhu3FpFBtDsxzaAZTl7IUaYYAQHdFHQNfatWbK4k6oOudJhIwg0ZfuXPl9Jj25uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790393586; c=relaxed/simple;
	bh=aLcmNlm5zQ4M7vbeszZxfjYYZTjMNLrTj1d62cKv59A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKVCSAjn/3C4qJziU0zfcEx0C3cRNbG1fXnp0JWO1Ba+cq+E+qjYpMsyxwubCV9rsKcI34E1N0U6NkM0mUxBTzhUUUNKVVVM6fpa+7svSoDn81tRYdL0E7WBTcphHfE6YQktv6AKNKK/V3D63r8NScF6W6xvTAqqfSrM8l3ipyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQuT/Bjp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQuT/Bjp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8821F000FF;
	Sat, 26 Sep 2026 03:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790393584;
	bh=xBq0wqS8ZLPavDCOyvU1lYPGX/xfQxgO7HPGHAPjgcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MQuT/BjpuMRR8WZUmnI1eSoCv4GzAzAxru3zpCWCe69TcZwZLABAurhbK0B+eXlTt
	 27BYP7L3jvDgZ81ZDbgiS7bgjaNuV3TKANREe+B9HXka3inU2OPnTAksQGq8FvsJqy
	 y26kClKs6fySMLvAq3/+UKYmRXVJ+hxiqBVlQFCm5uNzDfSNPv2C1+NzvEpTsRK/12
	 pkzCm37Ey8SIDxgNnFvgvaJeWxaasfn69g/LviacM1v+rW/EDtw9aX2qdWFdBxhBGY
	 XUrJbo371T+EsKNjJYY7etEKwCtvZNaX4bRlFtjvQ+B38LNg5YmZqIAxxAr5Qrux02
	 YMkY+Wn74m3zw==
Date: Sat, 26 Sep 2026 05:32:46 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v15 05/16] phy: rockchip: usbdp: Handle missing
 clock-names DT property gracefully
Message-ID: <pfqtqhvssmsxd23n5i3hps5nimqaqe7y65lakzmm2tc26lxc5o@zd2tvlp7vyuu>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-5-80e2c11d1ce8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-5-80e2c11d1ce8@collabora.com>

On Tue, Sep 15, 2026 at 03:49:52PM +0200, Sebastian Reichel wrote:
> The rk_udphy_clk_init() function would currently try to do a strncmp for
> a NULL pointer, if DT specifies 'clocks' property, but no 'clock-names'
> property. Fix this by making sure the clock has an id string set.
> 
> Note that DT binding requires setting clock-names, so this is only a
> problem when booting a non-compliant device tree.
> 
> Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/message/20260619154349.071321F000E9%40smtp.kernel.org
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
