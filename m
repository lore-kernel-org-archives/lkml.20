Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846797;
	b=u9XrODJ6I/WG3/Suh3w05Z77kv78vXhFwchpUEKpimKAmYHhzFm+SFI12A1s3wHabvzT
	 ec9FW6moW+OLycKdGIs1F3YEcb0x2YDFOonzhxs4gp8DtI/bW1MCG5BBfyZnBxEf4E5dD
	 8pfwhuqKJzJ6Wngm8Abn8wy1aAkUcVSxbWsSALOCt7f1Pk6GTcNRwKCvAyIYPjjrQtEFN
	 9+3bthgMTINMG10b0jCgbJabbN7DCRmj/aZmpj8nZ8D42u+pRmpifYfCAR/Zeqx7MtlSm
	 ZkRjkc3uvyPJMpKl1wCgshpYQUCgfkhwCtVifaKmQ55Sh1AxkUccu+LbGwX0zq1equA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846797;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=pD7prHhiJ8g/6FZtF/D8PiiXNhYA2KHBJ1gkM5psetQ=;
	b=y2+Jofrdt/YVXJl+/hTPBaBZUItsGHBZNl3Kl6wgo+50sbZy8EkPfm4h++t7BMR7P4bN
	 SQKpLZxyUcpmFuaSlO7xQUXiSwTrNRRZBzmpDm13e8jzNi6hnmpFl+DfyfhMGq42MZxAE
	 Nx8/YyXgCN9qd6u4mlu+z7F1SPKmcVuTSIHffD4Kck3bjSuOHpy+QgvmN5PZWwTIgQGrC
	 LxEWxLHNOxqoA4FqgkVUJG9LcXdm9QaEqKMj26HmeDfkpSVyHCx1whH5GxMxjbf6N2hrR
	 AjCtJCGOdgu9GaVLmKzQSXesa2KthiwguAEQgOTvi1G7Abz6edL3B525foPG8MYD9DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VrnrA0DP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BC0606A330;
	Mon, 16 Nov 2026 16:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VrnrA0DP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E41001F000C4;
	Mon, 16 Nov 2026 16:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794846797;
	bh=pD7prHhiJ8g/6FZtF/D8PiiXNhYA2KHBJ1gkM5psetQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VrnrA0DP/p1+KjOsC8vMgMEU17+Cvb5TlrgTiKxQo4luy9v2Y3GnHDct3cGh5ilot
	 mMVAirBCcjnN93hWGB16XyODO2SNhrZwa9bs3QHV0/FWLq6pETZqOF+fEXae7FL9Hg
	 EkrW2NXYYkvwVrLQrDu+/st9wxetbJyq62f+ZPsqRx7fjeZiAx+JAF3wUXrWRVIY/c
	 iJEOJ3ocH/EsTkrTh6yC//OHPp9GlD3yPVjNq4R0qU4YFSN+tYmVm1Kg5LI/ToATY+
	 tlKQ2h/XU2wHFe2zGKBxy37W+Y0pYQOjJ+LeKXEZzl3cnXSt/KIdB0NK9uft90ZVVo
	 yfHte0leQcGlA==
Date: Mon, 16 Nov 2026 10:33:15 -0600
From: Rob Herring <robh@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bin Liu <bin.liu@mediatek.com>,
	kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	irui wang <irui.wang@mediatek.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v19 09/13] dt-bindings: soc: mediatek: Add MT8196 JPEG
 SMMU
Message-ID: <20261116163315.GA2488434-robh@kernel.org>
References: <20261116013402.1273016-1-kyrie.wu@mediatek.com>
 <20261116013402.1273016-10-kyrie.wu@mediatek.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116013402.1273016-10-kyrie.wu@mediatek.com>

On Mon, Nov 16, 2026 at 09:33:34AM +0800, Kyrie Wu wrote:
> Document the dedicated MT8196 JPEG SMMU configuration syscon and its
> GUSER_ID register block. JPEG decoder and encoder cores use this shared
> register block to configure their SMMU stream IDs.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
>  .../mediatek/mediatek,mt8196-jpeg-smmu.yaml   | 41 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +
>  2 files changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml
> new file mode 100644
> index 000000000..2bc67a2af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8196 JPEG SMMU configuration registers
> +
> +maintainers:
> +  - Kyrie Wu <kyrie.wu@mediatek.corp-partner.google.com>
> +
> +description:
> +  The MT8196 JPEG SMMU configuration register block contains the GUSER_ID
> +  fields used by the JPEG decoder and encoder hardware.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,mt8196-jpeg-smmu
> +      - const: syscon

Trivial syscon's like this can go in syscon.yaml.

Rob
