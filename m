Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916217;
	b=ZeSQArFDSMynjkWYJjRfTtRXGceBJSVm0+CA3K7yUpoDH42Bo/pl6tOphP4gxb5V2rP3
	 iNiH2YKxnsrg0h8SyXiWGT4m7OxeCV5Aux/EiULa2L/HS9DrlbE8R3m4QvQYE0w0fih28
	 tgmOcohoPYXND9Dqeh25SBgGFhZX7KD2YUoKpA3H5Kj1pmO/Bb5KRcL4EPUzr0japeoho
	 /vfF2k4eFVepgQsFA7KV5ImrtciECfVREmyEXOnWKjJQ+XR5GFn46L7GeMTlLNLPRYi00
	 fAGP2SWg9N/MrmgJoBsb5wvIbBVb+furnNDxY++fi9p5sRm13/9L8F+pMDJTQhboXcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916217;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=OinoJ2YO+YOfGUZstgvmMrUbUZjkNmC3XLb6fiAbEe4=;
	b=n7pcJAhV0BT8B25ivRQrr2ShLAJFuKLjgFg3gCQ/qfTsg0jp1haG7IcbQoUe0O3HeVot
	 MyRtO8II1e/X/E2E+3kHTHKhk3Wf6YUjSp8DrO5POTYWzM6JnoBZUDeTW7tXHIHgH87nn
	 HEvFGzokWU66qOYEp5XYgG0lYnv/+xnOeJXmXPBdQScjHcQPCxLDIdFUsEAuiQF9z4k1F
	 m5zvLl4LMcBCgkKITY25/5+45gU0EUMDIPYig5P1K5ar6rSXee84ZN2SfNOgitI6SbnAw
	 HwsltpsdsHPtxid22SRAShAu34DGBtnV4+mrHWL81Yh5gwogNIx1ja4j93VQtIVzxiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=De7VliQk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20A0606A32A;
	Tue, 17 Nov 2026 11:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=De7VliQk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B2D1F000CE;
	Tue, 17 Nov 2026 11:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794916217;
	bh=OinoJ2YO+YOfGUZstgvmMrUbUZjkNmC3XLb6fiAbEe4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=De7VliQk7kcGvoqZCWD5wU1HmXVV9710uHxb/5ekEJ4N1fjetO5SrCoizklxPQXzb
	 KtBK3gFQMpWZcO/RNeYnDls8YEzqW+i6c2Hg8X/A/mdrzVSN8SRMu3FcEKC6GLP62a
	 lqSlIbr205v+2XtQ3HloOha3dlnUBRLW78O9/WSIaSyBepjqPvOQjLbxh+SrT/rRsq
	 hCyTUFJcEzp8XJhPS/S6wSMuRItQRJXhqk8hv+t53uQa8aTB3uiMRxi9r7cP+ry8Ml
	 PxFKqUPlrX/iCTI81mMXtF13RD5AO7sTMjeNspRMZ/22+fwCY6oUSv3jZAJwZQKKtz
	 rDzP6L4N6fD4A==
Message-ID: <a7337b3d-2621-4c68-b165-904f7b88e4dd@kernel.org>
Date: Tue, 17 Nov 2026 12:50:14 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Missing signoff in the mediatek tree
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <avw2yoxCfKfHK9Hv@sirena.org.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
Content-Language: en-US
In-Reply-To: <avw2yoxCfKfHK9Hv@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 12:13, Mark Brown wrote:
> Commits
> 
>    af557feaed1f9 ("clk: mediatek: mt7981: fix "emmc_400m_sel" clock mux sources")
>    6fe7aa32b1063 ("clk: mediatek: pllfh: clear state data in mtk_clk_cleanup_pllfhs")
>    a3ef44f33667d ("clk: mediatek: Move fhctl_parse_dt call into mtk_clk_register_pllfhs")
>    2def5260f4be1 ("clk: mediatek: pllfh: Add ops for PLLs using set/clr regs")
>    4587b6170ea5f ("clk: mediatek: pllfh: Add configurable clock ops to mtk_pllfh_data")
>    7cbf375f78def ("clk: mediatek: pll: Add ops for PLLs using set/clr regs")
>    b7285135ac890 ("clk: mediatek: pll: Add PLL stabilization delay definition")
>    efa27fb633420 ("clk: mediatek: pll: Factorise pll power on/off sequences")
>    696eb5f8af066 ("clk: mediatek: pll: Add BAR reset register offsets")
>    e998b6e82a481 ("clk: mediatek: Harmonize mtk_pll_fenc related symbol names")
>    294637d60bc0d ("dt-bindings: clock: mediatek: Add MT8189 system/base clocks and resets")
>    dc3a6ae2eeab9 ("dt-bindings: clock: mediatek: regroup MT8195 dt-bindings into MT8186")
>    833dc5fe7832f ("dt-bindings: clock: mediatek: regroup MT8192 dt-bindings into MT8186")
>    09b156611b0a8 ("dt-bindings: clock: mediatek: regroup MT8188 dt-bindings into MT8186")
>    3b372542144aa ("dt-bindings: clock: mediatek: reorder MT8186 compatibles")
>    cb47a7976bb5e ("dt-bindings: clock: mediatek: Make '#clock-cells' required for MT8195")
>    1a2b86804febe ("dt-bindings: clock: mediatek: Make '#clock-cells' required for MT8192")
>    51928be3081a2 ("dt-bindings: clock: mediatek: Make '#clock-cells' required for MT8186")
>    24bf5189aadf3 ("clk: mediatek: Reserve missing MT8516 top clock IDs")
>    8779893558124 ("clk: mediatek: Reserve missing MT8196 MDP clock IDs")
>    afd8231b5a434 ("clk: mediatek: Reserve missing MT8173 topckgen IDs")
>    3ccbdb37d10af ("clk: mediatek: Reserve missing MT8167 clock ID")
>    dbed26f4c4895 ("clk: mediatek: Fix MT6797 clock onecell IDs")
>    8dcfe9e6b3cc7 ("clk: mediatek: Fix MT6779 clock onecell IDs")
>    336f7db3af40c ("clk: mediatek: mt6795: fix the FHCTL DDS mask width")
>    351444cd006ef ("clk: mediatek: mt8173: fix the FHCTL DDS mask width")
> 
> are missing a Signed-off-by from their committers

No idea how this happened, but it's fixed.

Thanks

