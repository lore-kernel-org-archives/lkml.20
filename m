Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6188313523
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966393; cv=none; b=emV/QP22fOiQJ8PC++k0EarosKZTPE9ZlK/IZ+u0s8Uz97bB+ejdvgBUO2e35xvKTbyZrj8UjCI9PM0y9rT64K6t6M2o2iyeau/vAvgMEueRFTnmT8yFSdwPa3ZL8/799TQFToV4+2mantUR/044poTugahrqUsunyLtGD/iTh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966393; c=relaxed/simple;
	bh=SWb6shhILBkvVN+vu9k6U3UVsd+O56A6zqS8zioGhJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9bUnPRc5iwRXGdifZD916PJx7Pm003RPS3+H1hrgS6ItBhkj8ctPnNfjNf4m0JxDxnL+Hl/oXapIdiH9+aaj2NKgY36WEQezuvqa5K7QtfBGIeSN3TLEawHwiOn7Hr3ia3qVCWDS8PWj2nybrq/gqdsC+uctqHZwlYzVnGx9pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mQ8HP/Ra; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mQ8HP/Ra"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3D81F00A3A;
	Wed,  9 Sep 2026 15:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788966392;
	bh=E9ytG7kb5dbrGiKhe0oxqCTTvFC6jYjdhibOnVV1Go8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mQ8HP/RaMQKuI/HcIUaifGof6tg3xWV3kT6LI8eYb9rgbpsVWzV+ByXU0riskHILH
	 i0JmeE6OALfZX8nSlHLj3RT5ls0hI/TW0WkTL7/grJm0KzHlKvABBvZlGU9NKbXRQi
	 AKpwJXKS2VMOXoeUdMgfSQwVPg7wyMfjHnv4RQYP8tuY1y9LTvmb/iNrGa+cDvMeVh
	 WlidRBgitZb7XcL/ODNZi9TqIoC5WWTzvN62bsZwe2rcG4qUsETYMI9E0ITvSOPhYc
	 MJP0B5yuO6qm/JyAD8dBlT1mETJEfIRbjxpVnD93WpIpLh8HojMepFQPLK0RpbXtlM
	 nJtyhY/CYFlow==
Date: Wed, 9 Sep 2026 17:06:23 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, p.zabel@pengutronix.de, 
	chunkuang.hu@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, 
	matthias.bgg@gmail.com, granquet@baylibre.com, justin.yeh@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Subject: Re: [PATCH 2/2] phy: mediatek: phy-mtk-hdmi-mt8195: Fix TMDS clk bit
 ratio setting
Message-ID: <5bmxa4pcwkiemubwfjun3dti4szu66gnxe6yw2pudq3wplpc23@inyswc2bdlhw>
References: <20260701121936.19407-1-angelogioacchino.delregno@collabora.com>
 <20260701121936.19407-3-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701121936.19407-3-angelogioacchino.delregno@collabora.com>

On Wed, Jul 01, 2026 at 02:19:36PM +0200, AngeloGioacchino Del Regno wrote:
> The comment in the mtk_phy_tmds_clk_ratio() function clearly and
> correctly explains that the TMDS ratio has to be 1/10 for data
> rates under 3.4Gbps, and 1/40 over that.
> 
> Unfortunately though, the TXC_DIV register setting was wrong, as
> in value 3 means to divide by 8 and, in order to achieve the in
> spec 1/40 (tmds) data rate, this has to divide by 4 instead!
> In order to achieve the correct 1/40 (tmds) data rate, this has

This statement is cut-off!

> 
> Add definitions for the TXC_DIV register values clearly explaining
> the meanings (DIV2, DIV4, DIV8), and program the correct, DIV 4,
> value to the register in mtk_phy_tmds_clk_ratio().
> 
> This fixes out of spec clocking and, with this change, SoCs using
> the MT8195 class HDMI PHYs can now successfully be configured to
> output 3840x2160@60Hz over HDMI.
> 
> Fixes: 45810d486bb4 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

With above comment addressed,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
