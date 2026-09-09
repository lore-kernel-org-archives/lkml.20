Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C383D36F8EE;
	Wed,  9 Sep 2026 17:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974274; cv=none; b=K7T0+NzbpF09f22FmkMvjnfXxDSOOFeaGr3tjvhcbUVIbndNhbtKdmaxTSKRrkOPiOAq1Q2Si2dbOYtdhe5Jv7gnwSzj4lzd53uk1c7vYcLGLwSNPZNojfd39WcUPeTld5FPrJ3daZbFHG/12m9Z0BL88TeuzTv0hvmHWjzxEYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974274; c=relaxed/simple;
	bh=EE22Xhfxi0Ut6rjYYzgn2DqmDLwg67ZyrjslJaNxK0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DrIlkrx4uPpa5BKedZg40iIfarICuo+P0u3Xt+OWeey/fyoP8tBLJpDN57vzv0c7TH52X6575RdEsW+Ng2VQ+yz5Z8RkLAVGfJg3Xu+++Qls0Yi7ByN3bm3lyrhXllo9mFspofhHPx4GA8v9CWhYAdxQouY+es+bMyaxNG8RtVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/Tl62vD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/Tl62vD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2712D1F00893;
	Wed,  9 Sep 2026 17:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788974273;
	bh=8VPY0deMqZZdrYnmVNpJtaQIzzwrsHUnmWiCqzQ+mTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h/Tl62vDVbX7K7x9KxWl4Y1ioFq2FtWmlA0h7fNRPi1yoUVPKOfJQv4aj0vSn/zG0
	 o4H+TRVi07XNDX4qm6y8JxgfeANszC3KWbSxV5dP4gZ8Ir9Pj/sSjkArLr06pjCU2C
	 VZ8vPxIezLpot7J1zyVd5AjcWlSsvGj8T2Xqlus9nQ1jj9QUYkOQ0+CM8nxcWViVgC
	 lABKCMhDvA07ki3Ckc1S3CR0fWaGkRBV2dO9mhIIcm5GD3E/XHMl4PlazfcNHp2sg4
	 CTTJKi94WMWXwyEXJ1OlEjxa0u+H6PWGstz3+SyzoHQjmxRPx0/VKRE6zNB1wnqGg3
	 YHPzGEhrL4DqQ==
Date: Wed, 9 Sep 2026 19:17:43 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 07/12] phy: phy-mtk-dp: Support setting volt swing and
 preemphasis values
Message-ID: <voe2zlbmri2mesde2b5ypyj5xtfcaso4i4vsjlkrjfkq2mxxue@5hbymqqlb2da>
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
 <20260707154245.198361-8-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707154245.198361-8-angelogioacchino.delregno@collabora.com>

On Tue, Jul 07, 2026 at 05:42:40PM +0200, AngeloGioacchino Del Regno wrote:
> Add support for honoring the set_voltages request to set the
> voltage swing and preemphasis values in the .configure() callback.
> 
> For proper hardware cleanup, reset both in the .reset() callback.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
