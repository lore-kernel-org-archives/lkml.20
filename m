Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE54833A6F1;
	Fri, 11 Sep 2026 05:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789104017; cv=none; b=Zf1+sOZHtUVBngDN4F+POnqqd2pSPVFme/IOjvRxFjZvCdTkyGwkgDMmh9TBJPrIMiLTn3UbkNvb9h6ZaMXSBoUmgD6UuL3MDt9vOmRM4IBniV/QYmfhljVlVd6G9JGQM3rzC+1jhq0s+D9RlVKhfuaEWb845XPgsLGxdtrN0bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789104017; c=relaxed/simple;
	bh=v+BpL7w60o6w3gJVynoZ3cLeuos+xpoHpbCgWu1iWJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=odutfyZLBX/ifrJ+jfyTq9Nehx7MLAEj8x3LSSw2bx8QF4DpbMI7GvUrrGmI6wvGoF9b+oHN76mrIzUqC0hdtOsrouI4zoUIC22LAaj6Jsbph53bL9knlI5PosoJs2v4OKF5QAWlg9gltNs2XFPethhSFemxxKAup8GGttws9qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4bAq3t6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4bAq3t6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DED1F000FF;
	Fri, 11 Sep 2026 05:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789104016;
	bh=zQkaItX0xqo5kFCTOPQvErm+zlth+OHMFg4BhhYP06c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m4bAq3t6xGNaDJIAUQZb5j72asbrzo3kHL9Z95osZGv0FSm+lI+GiTji1/5h9z5Na
	 SdjWZapU5O7ZCqDBU0DO09eDrxABIvz97cYjMC5Sdlvhjd4X65ZXLa4WMgQxwLAfnw
	 p9jylw7kLyiJSZgPD1NI/ALAdP0vRi3xXBZRcwL5Hn+liVDz3xBDuD7GQCAElU31VC
	 Jf0bkgZ6zZAIaQATdwkyLAjemkhynonHl+/zp5qmoYsh5h7rdN9VHgJv7mr/2eJp+2
	 s2LQia0fpY/ORQRx0byN3JPmVrc3YfSs2jFAg80Z/4xUVfwd49977V0nZhvvgkZL11
	 oY7j5hhsHvZlg==
Date: Fri, 11 Sep 2026 07:20:06 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v4 11/12] phy: phy-mtk-dp: Add PHYD Lane EN register mask
 to SoC data
Message-ID: <dcywgc2ccerd6h7rsib5dak2tmanhy6tnbl3fuzvl4ni2ua2lw@jiqbmfni7uou>
References: <20260910092038.48291-1-angelogioacchino.delregno@collabora.com>
 <20260910092038.48291-12-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260910092038.48291-12-angelogioacchino.delregno@collabora.com>

On Thu, Sep 10, 2026 at 11:20:37AM +0200, AngeloGioacchino Del Regno wrote:
> In preparation for adding support for the eDP PHY found in newer
> SoCs, transfer the register mask for PHYD_TX_LN_EN to SoC specific
> data.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
