Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55ABB568FBC;
	Wed,  9 Sep 2026 16:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788972776; cv=none; b=NXRORKWNHF1V/N7ISsRPZejrVE+/cx17PVpGtMCaAmFhKSNBaghhksW/fWP78bTOWioIXqsfsw9Bx1ssXCsC8DtmQqUIeDqZWOPJS3dRTK8Pqy4u317zzsRmsMK3AtKY9WFsOocAK9k3SF+31pRICvnR1MW3FOQsSjCY8sSZa2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788972776; c=relaxed/simple;
	bh=HOF9Q7DkKM0TFlzYKTgQ0Zh54r9VMKhlB/n8RDgQpbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVd0gLwPoyQk6pA0KuGaaIv5KUn4y6TRxLgt9aBHXtHXtDC2K/mt7JkKYThfIw3G8d6EUrevJo6VH7kv+ca4uIzL+zH5hskzhZyVHhyK3lwADDWApsFz17cguhwdMJ/yE0a/7TRb4vg6xNdOkPe+VoWP/Q/l/dk+eG9OxhYEUHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkhMoR6G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkhMoR6G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32791F000FF;
	Wed,  9 Sep 2026 16:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788972775;
	bh=GmlMljZT/6fO26V/fEoR8ernMpnUFy1iAPY7wr0dQNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KkhMoR6Gs7IooOaJd6DKs7tUqWc1jCblWwWBcebrdQphPcJfx9IHywVG0VVdPQcZr
	 Ujc+1ZiZDZsZBo0BrfVxc7W0Z7wbJxsVToSLW6b854TSdi/sJPu6STLcXEmkiKy4TS
	 3nkPhpQ1Bl7Z4P9RYdUWzulpKKMbSG40E8yaol2K0HHfVSpDN1gMbN6cbgpBTs9QIy
	 VDePMdyerGmnffIQvv6WecoqTTaLEzerfhfu6+Vu58/WBqIxA/6IEgxAWNKrGKLnDG
	 JgHQbPwgWlMwEFPoMtfE1bMTTELWNN7XggB/FHAP+91OztVhKa6hS689YxKChFNb7r
	 SkgQHw+GkfxQA==
Date: Wed, 9 Sep 2026 18:52:45 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 02/12] phy: phy-mtk-dp: Rename regs to regmap in
 struct mtk_dp_phy
Message-ID: <wvjid3xethoskbttbgy3oy3j7fxnonrnzqg7pqndn32skzp4bt@2q7svyz6ojr7>
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
 <20260707154245.198361-3-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707154245.198361-3-angelogioacchino.delregno@collabora.com>

On Tue, Jul 07, 2026 at 05:42:35PM +0200, AngeloGioacchino Del Regno wrote:
> In preparation to perform further cleanups and to extend the
> driver to support more SoCs, rename the `regs` member to `regmap`
> to improve readability, as this is a common name across many
> kernel drivers for a struct regmap.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
