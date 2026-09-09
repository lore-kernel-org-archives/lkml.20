Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45238328B62;
	Wed,  9 Sep 2026 17:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788973399; cv=none; b=rCPWSah/NSXMI77OvJ84QS7xTkxl6YgPglhdvhyNdzfC9qglNdP+OSkStM3ZHefLEjQbnUDJLPzF34xhnWgPH6tWVVEDhEodBm92q3KsspPc0BdHyGQhb+Lmgp5VSy21Y4g9VbyhpwzhrORzI3EGzbnGTYa4CyjvQ5tmt0aBRww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788973399; c=relaxed/simple;
	bh=tX2VUfTLGv8UQmUm4FCMONQXQwnKDPo3atFzKdSPHd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=juSxhnsG/SIs2L1pP6bUaA2JlZAYqZ/ymT4UTuFI+FVEuT+vr76jLnyL+NwBo2lBu4fJBYw3TDJCwisAN8EIuofaIkdEqN+yy499S66wEQGmzup8zJeLBC0q2gJ8WwZTtvZOsbVVirgc89HGu0ZFUReWSNF3NzYBOMOSRx6EcdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XkVQ0vIu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XkVQ0vIu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C281F000FF;
	Wed,  9 Sep 2026 17:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788973397;
	bh=p2s8uYoBSnPRtzrtxy84WXDVLveffRjaRrPrEHzO3Eg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XkVQ0vIuB6RQIRTUzSey3nGs+UX/fU73qGe5rLJyVH74queEPlJAnPabs0WWtPtc2
	 AxwFcbtRNCukAPEqEW7rAq4WamRm6e5w76DIxmlGofvrUfKd0d4x75v7u9tRtkcbDC
	 JOTgcuqnOx117t79O/6qN0+IE/2TJ9rK8MLBBsHqfRu8ueC01Gs12akCoHc+tPQTpu
	 R85FtifAhbIUhJFuE5Xt77KmJDvQv+HKr6+Q5nDAcNzmAfny9H3TMDj7eeyFonpnuq
	 tDHH4fZvp9tjRevl4BB7ecdS22L6GBeX2minc5iWSMTNe7DbPL8JP52sSmaZFVZSqc
	 7XoXLn9sP/kQA==
Date: Wed, 9 Sep 2026 19:03:08 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 03/12] phy: phy-mtk-dp: Allow probing with devicetree
 match
Message-ID: <bkx46kvsmovy2rbjnqwov65whmwnbkoig27iihk7w4qcosqoqf@jymp7vcu3ezi>
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
 <20260707154245.198361-4-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707154245.198361-4-angelogioacchino.delregno@collabora.com>

On Tue, Jul 07, 2026 at 05:42:36PM +0200, AngeloGioacchino Del Regno wrote:
> Make it possible to decouple the registration of the DisplayPort
> PHY driver from the DisplayPort IP driver by adding a devicetree
> match to probe the PHY, registering an OF PHY provider and this
> device's own MMIO regmap - if, and only if, this PHY driver was
> registered with an OF match.
> 
> In order to retain compatibility with older devicetrees that are
> not declaring the DisplayPort PHY as a separate node, the legacy
> code was moved in a `mtk_dp_phy_legacy_probe()` function, which
> gets called if the driver was registered by the DisplayPort one.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
