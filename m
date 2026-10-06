Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1877D3F1ACE;
	Tue,  6 Oct 2026 14:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791297357; cv=none; b=u5bWSANwRAjZ1hhIuTwYiPkArmRH/dZAD74hLF0/k4MHfQ1dEsTl1QQ4rt/r4Tz/cIDrF8DUVnqGDTMQ34xIZhhQ+wX9Fm/1k4c/76oxoiQMhGIqMRo4IzJA/C+RPc+DhhMEBQ3yy6KRan3RY+nBB0Jtc7GwcAdEAhNI+BTQiM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791297357; c=relaxed/simple;
	bh=WKyjJo0ctDdDpRtfBNoImhZUouSnE7D4e9wIb82XiVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cf5e69n2j54uifJFsZ+BVAUwpEUW7WQTc2MBHkCr2/BWe6vlzzVEpjz5XQVJZr3x7TGorW84Mg6v9BaGKk4Ol4ZS7dPo1xINlbpB7o5pctBYCcT2vhXgiqEfczXieGCjb+PigNoHJEvI/VwVfJhRPBfmbJVb0jY/0tvIxwzreRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BvXdGDK1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BvXdGDK1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02DCC1F0089B;
	Tue,  6 Oct 2026 14:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791297355;
	bh=U1L8jykox/avQocIULNmCLTZ8y9+zM/0S8Z42jWufDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BvXdGDK1YwBTmfBMPwEf8IFYL007+JRcPJuME3P2Nita0OLXh/mfsdPULxUMPb5kg
	 mS7as+zUWe+7e+Yp8opbOXi0KstRi60uJybcaGLDsDYa9B0axaxKI89Ebezd4SUhYz
	 Z4TZ86oCLJBOEl95dp6dGye62RFqhdvbOWBXcSM1waI/obfEqL0Q2w5B/dNrf7GBuI
	 k6L1cJQMuwIcViz0XrniedgIFkosG2Ae0q4zq9Qqfc1qY8xY0qvAwW9aC/IdSi3F+k
	 2PzmYlch3jT089e1FhbWE47ty9r9pYjMAEwpenMfzUUs0uUv8c/TQKYC4xIDpVii9j
	 vQCzlmbsnR3tQ==
Date: Tue, 6 Oct 2026 09:35:54 -0500
From: Rob Herring <robh@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Ricardo Ribalda <ribalda@chromium.org>, Kees Cook <kees@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Fei Shao <fshao@chromium.org>,
	Haoxiang Li <haoxiang_li2024@163.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Irui Wang <irui.wang@mediatek.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Fan Wu <fanwu01@zju.edu.cn>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v7 08/14] Add the MT8196 compatible string to the
 MediaTek vcodec subdev decoder binding.
Message-ID: <20261006143554.GA2123458-robh@kernel.org>
References: <20260923024258.257846-1-kyrie.wu@mediatek.com>
 <20260923024258.257846-9-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923024258.257846-9-kyrie.wu@mediatek.com>

On Wed, Sep 23, 2026 at 10:42:51AM +0800, Kyrie Wu wrote:
> Compared to previous ICs, the MT8196 supports a 10-bit decoder
> and has a decoding capability of 4K@120fps. It also supports
> 36-bit DRAM IOVA address and Video Power Control to optimize
> bandwidth and voltage usage.

Please fix your subject.

> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 50 ++++++++++++++++++-
>  1 file changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> index d1d209cbb..618be8c52 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> @@ -76,6 +76,7 @@ properties:
>        - mediatek,mt8186-vcodec-dec
>        - mediatek,mt8188-vcodec-dec
>        - mediatek,mt8195-vcodec-dec
> +      - mediatek,mt8196-vcodec-dec
>  
>    reg:
>      minItems: 1
> @@ -96,6 +97,12 @@ properties:
>        The node of system control processor (SCP), using
>        the remoteproc & rpmsg framework.
>  
> +  mediatek,vcp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |

Don't need '|'

> +      The node of video companion processor (VCP), using
> +      the remoteproc & rpmsg framework.

Please say what the VCP provides, not the Linux subsystem it uses.

Rob
