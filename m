Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68557373BE6;
	Wed,  9 Sep 2026 17:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974538; cv=none; b=StEKzYEoaTBnBhzuk78r3ApI2YNHCbcKaTttmo09UnkWBc5Nq2YVqMK+Eq0UDJucy+/sVYlLdZlOkSg5eP4Yf5ZsT3CFg9Y6MImpiFGxH2jEhv/X4hnyiqu5q8s9TXIPC17NrMvoqEB5Di3+JEaysI9J/FGLPE6rKpShiJPQ4Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974538; c=relaxed/simple;
	bh=HThOMRPObQiKH5k7rMrVwZsEN4BhjZPlx7PA+OgvXtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mx4zOHcEGqHEQbHJEmzFKQ0ZucY/NcQDYu6Tp5eI13NBWv0fs83ZsIUf7/d3c93wOUPyf81S9Nmy/KRG3FwrDjex8EMOoJsp604RTq+g8hJM2ZrptGitsExLV0bkf7AsrPUK/wOSnTadO3j8TOqpih9KtORyGQPFDjJS1cJGCcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FzZ6zHuu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FzZ6zHuu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61391F000FF;
	Wed,  9 Sep 2026 17:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788974537;
	bh=TTiLgaAW8oDG8ctZ/GijkFx6Ydc/BMWX2BkNbD07Dek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FzZ6zHuuZr55mmH4+vSo24dCuLDTV+Favm5/kzoxEge48jXhuODYPdH5y8bEQ1l5D
	 GE7FqzMWcNU7kPSglZmQeb9d8WQ4uj/x/pDYT5RFhtPs98xPNA5egwh51UQYDKWRm5
	 f59ftgqJmpgIN0n2TDgmuuLGHPw9ZK5Dc0Lk1PPvk4/fur0xbMOGvxkpVpvFNr2+QJ
	 o/JLBwa2e3OFVdZXYhG6JKx/w1nkV2xaAXY54cB4XjD1+n+2VhsnXrzfVTHRJ6MBFT
	 p6Ic2wrme/sYDLrEfnTSsRtbS1FlMZJ9/y3Ma/4mHv+JK3fX+BQnqnrjLSTtPzdhFX
	 coPAqhMgvJsdg==
Date: Wed, 9 Sep 2026 19:22:08 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 09/12] phy: phy-mtk-dp: Rewrite and document default
 driving param macros
Message-ID: <ztidtis3m3g5ykkolsje2xeq7xl4gh2bbbbkxhxajorenvnkpt@yztuepbseogg>
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
 <20260707154245.198361-10-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707154245.198361-10-angelogioacchino.delregno@collabora.com>

On Tue, Jul 07, 2026 at 05:42:42PM +0200, AngeloGioacchino Del Regno wrote:
> Use FIELD_PREP_CONST and add nicer definitions/macros to build the
> default driving parameters for the PHY and, while at it, also add
> comments explaining what they are supposed to set in the PHY.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
