Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C552D594F;
	Mon, 12 Oct 2026 09:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797604; cv=none; b=XSC0RFa0JPH4m2hbJ3lOrgNdaDXG7meex3pQLkmQJhy21Tp8gkfOvtAaYbM0n1c2/d05hLYNu79gYDMTx7LQAeV9rhiM+oejCMU/JbCS3MR7Gpf+Jr+yq/S4+oBm+oNF7GF0ShHwtOr2IpgV2sKy5CzsXYGZdXs0HhlcjGp4gMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797604; c=relaxed/simple;
	bh=e8VPPlAfWahF7zgLAUVUYwlsb+VSvnH+lc7RJgI3mDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yu3e4NJjkMYAyblSIiNSMZBW38Wzhli0W+2O3mh1rJ2rwVTynoi2KwhcDGaEzhYjNTmZ3MQGSTP+nbbIPUMU4KZr5P4Q9VMjXYYg92wbFOsTc1pqtBk9USJaVZEbY5jlfOJyS0pTjlZnQFYFMBX5j/J/RDWT1+T5Q04uHG5J80g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/8tSBD7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/8tSBD7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BDC71F0089C;
	Mon, 12 Oct 2026 09:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791797602;
	bh=NCBaLoV31wqphlVvEaFSt1x8hpc/UDTsLJLp1gfaYF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B/8tSBD7dqH40URDKUKpPoZIengaDGRGdRz1+xBS2LOL9azOI1kKmuVSOvwWU5KGG
	 Xs+2RnmVkSWCii6D+GiRhZfrEc/hx/giDzmIjfDMvl7cQlMSmKNyMjQMSAmYAdgTub
	 GF1j7Fd/0Wr03jOGywP7OZoQTaQ0HAjlW7AdtT6H5HA6W5xw2xJvpNySrafXA1CPRx
	 EPZWLx/UlYCeS8GT3/BvZ7OZ8hJ+yRYQYvVHUHw6pw/mRfmuVXvuncIW5u4XK5OvXv
	 lswcFccpowIfqEAYHBfedmARXtfFsJP3dPUVHcU4JDHDw6bzxXJjFIm9uQAe2T950W
	 xktXnnFJClkqg==
Date: Mon, 12 Oct 2026 11:33:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bin Liu <bin.liu@mediatek.com>, 
	kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, Hans Verkuil <hverkuil@kernel.org>, 
	irui wang <irui.wang@mediatek.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v18 09/13] media: dt-bindings: mediatek,jpeg: Add
 mediatek, mt8196-jpgdec compatible
Message-ID: <20261012-original-visionary-gharial-ee41cc@quoll>
References: <cover.1791614327.git.kyrie.wu@mediatek.com>
 <016a61397c01b8745622ff54f1e27b5209b3f34d.1791614327.git.kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <016a61397c01b8745622ff54f1e27b5209b3f34d.1791614327.git.kyrie.wu@mediatek.com>

On Sat, Oct 10, 2026 at 04:07:13PM +0800, Kyrie Wu wrote:
> Compared to the previous generation IC, the MT8196 uses SMMU
> instead of IOMMU and supports features such as dynamic voltage
> and frequency scaling. Therefore, add "mediatek,mt8196-jpgdec"
> compatible to the binding document.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

So this has subject "media: dt-bindings:" but a new patch you added here
has completely different subject prefix. Including the re-introduced
nit, I am sure I already asked you.

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

This is random way of coding, not even checking your git history before
sending to lists.

Best regards,
Krzysztof

