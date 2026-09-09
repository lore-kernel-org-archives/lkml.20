Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C38136E484;
	Wed,  9 Sep 2026 17:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974765; cv=none; b=sYTiHxO2xLB+Zd/2r88INTL2iiAWeIsddoTaIA5wDoMeHdzsPBsl9NRZ7vKS5gqMu8Qjz7M/8qJVyccAidV05tPGoAYIq9sQIAGSblDrRWNlJ07buuCyVxSNjXkFRUTG7pngBzf2bTX/ULzdmSEprE4OvDJDpJOSQSAF/DnbDdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974765; c=relaxed/simple;
	bh=saOq0T08ujEkv7uf07ir5qxUt0lSS9BcKQRan01kmio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QIeAutei350pJsvcoHTFASyWZkNgFwOO5wkvSbG1nN/EzSwKjK1TL9/EYY4UnKfG4G6yiiHslxJV0tp2M7PRv4vQnStqqLnsBFtYv8UFTqmLdbmqX/uSC+FX0C7kZDZhBH0qfoU8nOXKsvXwWEbeXWqLPix7kizlV/ckrMYUOTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nl4q23VJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nl4q23VJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2301F000FF;
	Wed,  9 Sep 2026 17:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788974764;
	bh=SP6jmQqIOLrkVvQFwD6N9WK9kKibbvJko54SPU9/I58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nl4q23VJ5Bm5v7pAPhT0FU5OXL0bq5WJU1l32a55XGKzfUR69tUcrge+B6lV3RU2B
	 3AHjhFmXm5sK4D1zu5dK3s99hvKvhjKA/G6fmJfI87yA1aTqkCej67GTeeLLrTALCo
	 LRAdzsW2J+2SCJv3PNJKPckBndFwi5KB1e3jziA98+cwrcQhr3nGD9z1haUZLF1+0n
	 pzvj/U1vA65Oy20ntN4HC+ejsMV3qALbI96pD0duvwY8Eot2EgTa/JEWli3gc18o0r
	 rikvNe+39scM4J9j8AgFo5OQ9f3FBzJdzyor8NvfNHP2PSR/4XemWgNdFA77J4t+5l
	 CneQU4HMOtzaw==
Date: Wed, 9 Sep 2026 19:25:54 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 12/12] phy: phy-mtk-dp: Add support for MT8196 eDP PHY
Message-ID: <nz5vqejravxuaxdodfjb5mdmdndevwe75rtbfi7ndow3qlqdim@xuo2awaygbv2>
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
 <20260707154245.198361-13-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707154245.198361-13-angelogioacchino.delregno@collabora.com>

On Tue, Jul 07, 2026 at 05:42:45PM +0200, AngeloGioacchino Del Regno wrote:
> The MT8196 SoC features an updated PHY IP compared to the older
> ones, and there is one that is specific to Embedded DisplayPort.
> 
> Add support for the eDP PHY found in the MediaTek MT8196 SoC and
> all of its variants.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
