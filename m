Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F421E2EB874
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966290; cv=none; b=nPCuisl5LKfvxz4/M/vmSwqYPfhGTQOv/CzwQojuIaDcD8BaLmsWg31l07QGSIgcm0H2jds5PzUfvC62oiRx1xojclVkORHwZszbzUx/fJMmEopOPdyR3QQfwpIM10dFte5Yzip6/H+8hjJFvopY3v/3Be5MNnzbLey91w7AKKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966290; c=relaxed/simple;
	bh=Pc6Nfh6eqP9BxOVZuPRuNDXYafr9nfA4rfvtul0x2gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4VFYrgLVqKec+TRvY0ofkpJ3L0inhj7/VXOpYQ2oSknwoAdWTGn239lMEQMcsRkd46Y7VLxxy2sqzfLt64nls6q8U2aqrVuf8sT1PXPlyN53YKqMBYJET5BUMFxeEU1ttJzYowoMeMowO1nkrNFKNKM//bBevgtoYlv/vFjiiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVuUiYF8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVuUiYF8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B80F1F00A3A;
	Wed,  9 Sep 2026 15:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788966288;
	bh=koc31sD8jNUGY12YBBneZjOQV63HfvgiWXOvYIpvhlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cVuUiYF81lvPxLrEo/jB4FHWll11l3fZla6GDDprhdn944gmL8El2xxvjAVcXqhR7
	 hfO0yUEp3xeP5ec6UV3BAY9oILoz9qPNPU7vC6eF/NBNVjfjGfFBq8afm0G+PSrPUm
	 diANVBgVxP3uHB3A4FAQKGp9GD+7PeGEsA1041CAKu7JtwOqchVvCUE3X8Cq9IuIJh
	 4TKKrS0jxJBU6BrKxKtyMEVj3YgW92YV5YT7rIIGc8Hj6gjSvzLjg7NyitcyljnB5+
	 P7b/IggMPQXEepA8h13KMnb8diVXOv6+wxxp+nCqyzCDSFCSZ6auJWmwZ+0m9Y4lEY
	 WxSRIcwBp+H4Q==
Date: Wed, 9 Sep 2026 17:04:39 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, p.zabel@pengutronix.de, 
	chunkuang.hu@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, 
	matthias.bgg@gmail.com, granquet@baylibre.com, justin.yeh@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Subject: Re: [PATCH 1/2] phy: mediatek: phy-mtk-hdmi-mt8195: Fix PLL calc
 divisor overflow
Message-ID: <wdvdeeoo3lpru5266r4sjjaj5s5cbvdjzkjw3vncvltu5vpw2q@rv6h7dzibzsv>
References: <20260701121936.19407-1-angelogioacchino.delregno@collabora.com>
 <20260701121936.19407-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701121936.19407-2-angelogioacchino.delregno@collabora.com>

On Wed, Jul 01, 2026 at 02:19:35PM +0200, AngeloGioacchino Del Regno wrote:
> When trying to calculate a PLL rate for target display resolutions
> above 2560x1440, 24bpp, 30Hz, the pixel clock value will be more
> than 32-bits long but the division to finally calculate the digital
> clock divider is being done with div_u64(), which expects a 32bit
> unsigned divisor.
> 
> Fix the overflow by using div64_u64() instead.
> 
> Fixes: 9d9ff3d2a4a5 ("phy: mediatek: hdmi: mt8195: fix wrong pll calculus")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
