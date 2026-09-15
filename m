Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C1C135A53;
	Tue, 15 Sep 2026 00:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789430812; cv=none; b=BL7f0zEmADpKDQBFSej627KER1ZHRStcsC5Bk6HgSZMNuyMaDDA78MIdBqbuh8xsB81wNpS6r1Lh1tSPmXAteCpzaaCxXk20NEE5b8ZBXpj0y0TIjb2Ab615WY7A7IluuTLO7SEEXC2wIgFeWe+DcnYZS7eKBReb5OwQsOrJkvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789430812; c=relaxed/simple;
	bh=WOwRBLg+7b+gJWo+/8WY+8abFEJ6zaAncWZOIAQZjvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqEvJPhr6d6qcPaMzA8xb/xdnAb5WUvnWEAXo+mOs6dhhu7qXCuX2Pur4Z1SrabZjnckeDg3wkMbtFvzgZeaQq9L72mFq43ub9YX0Iq6YeXA2UTN6CYGEPE0WeiwW7hTZyaoUjlf1AZJjGiEiAXDeXw5edy0fCdTGm63Y+MJzQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OVYGPm5q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OVYGPm5q"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BEB2447;
	Tue, 15 Sep 2026 02:05:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789430709;
	bh=WOwRBLg+7b+gJWo+/8WY+8abFEJ6zaAncWZOIAQZjvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OVYGPm5qwGxfBR6c4XwK2/TN0jkK9BYeOvjGfSHatHPPfOS98egoniH1pBDVlDlJg
	 w+yd+pfHgux9RYvKwij4RPS/LdgOboEUey4XcXgw6UfPEePC96NILXsNX5wROeu4YL
	 mTSLxYDQCb47H5BI5wyTeN6TIj/kYKD6kbDIR35o=
Date: Tue, 15 Sep 2026 03:06:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/6] media: dt-bindings: nxp,imx8-isi: Add i.MX952 ISI
 compatible string
Message-ID: <20260915000648.GC2804748@killaraus.ideasonboard.com>
References: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
 <20260831-isi_imx952-v2-4-fafdb4b446d4@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831-isi_imx952-v2-4-fafdb4b446d4@oss.nxp.com>

On Mon, Aug 31, 2026 at 11:36:59AM +0800, Guoniu Zhou wrote:
> The i.MX952 ISI is a minor silicon revision of the i.MX95 ISI,
> primarily addressing RAW data alignment. The core functionality
> remains identical, so the i.MX952 ISI uses a fallback compatible
> string to fsl,imx95-isi.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v2:
> - Use fallback compatible fsl,imx95-isi for imx952 (Frank, Conor Dooley)
> ---
>  .../devicetree/bindings/media/nxp,imx8-isi.yaml        | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> index 279c9cd3034a..d0a99f00a45e 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> @@ -18,13 +18,17 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx8mn-isi
> -      - fsl,imx8mp-isi
> -      - fsl,imx8ulp-isi
> -      - fsl,imx91-isi
> -      - fsl,imx93-isi
> -      - fsl,imx95-isi
> +    oneOf:
> +      - enum:
> +          - fsl,imx8mn-isi
> +          - fsl,imx8mp-isi
> +          - fsl,imx8ulp-isi
> +          - fsl,imx91-isi
> +          - fsl,imx93-isi
> +          - fsl,imx95-isi
> +      - items:
> +          - const: fsl,imx952-isi
> +          - const: fsl,imx95-isi
>  
>    reg:
>      maxItems: 1

-- 
Regards,

Laurent Pinchart
