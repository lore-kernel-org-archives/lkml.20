Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846207;
	b=NXKmQPm0GVKU/IrVRVZ6FPNBLn+kXi6EYUCIhVuXIs/nFLbG9fNTOZsZKJ0+MlNe+acX
	 UK8wk/4j2u+Q9pF1K9aZB4IeIVrS7INAjaOi6S2a8q9mfHA6sbrBchdSw/jOCVTej4y+d
	 +iVpo1PcdaLbkDZTDHgmcv80ggHExeThGG/K7rmKIJor52hJ/jeggM0S51RPnt6NyUZ8E
	 Qb5L88LRs4yOz9TkEFg/UU/DxndWd37T9OEUBS5yFGY//+j3PD0qzEfQ4m+q/q0bA+noI
	 sVZenN4jrqLpWoIYfaaWTHv3Qj8PP2F8brqlUJDm1aFaPE+A+YvHeovTcmeJl/3fp/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846207;
	h=Received:DKIM-Signature:Date:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:From:Cc:To:In-Reply-To:References:Message-Id:Subject;
	bh=hV5HxN4iZUg/iKmw0/HzwNF9cux4HXGPAW6rNXzLRBY=;
	b=DQOqEe1igS29BFqHQpTT+UZpF3ADPemhsjpZUR4NpUK3B2mCp2FjC5+8K7SmGp2jn5R0
	 uJZuG4dvN0pRYpBmCCRl9JzLCEbkDevRO0bXBLPb53w3/3BT0s00m+NleQwTWtNZNIsCG
	 4nOXpYHM0+7k3ZZjHQ8G+rg3ogrLBOAOv+tmdf+F29lwv8osnbiiuJVIVxeB3lXfvYT+R
	 TCTNZRwR0JQOhHlKzOnXqylBzOr3GMgNAbshf2xYhCrIwYuUrWXM2wy+yu/KWdj2oo9w+
	 I+4wloosY9rf4MK9gpDE1x+5H/M384bhC+xQewTtK1MMTlLz66+QIn55905hIt8itQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QlZTyq5c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6BB606A8A0;
	Mon, 16 Nov 2026 16:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QlZTyq5c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5CE1F0092A;
	Mon, 16 Nov 2026 16:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794846207;
	bh=hV5HxN4iZUg/iKmw0/HzwNF9cux4HXGPAW6rNXzLRBY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=QlZTyq5cHKxeaEi+fzkvC/Lbqk4D0G3AeGRHdYzwyTMeevQL6y/lFn1ohvEuxIjD5
	 ZnsC/a9Lk8PhaT23sSFm3Nzin+NBnYyaU3VwfKNJm2QtJqj7PsHs1mdANQgQGRmBBh
	 D+uZaw82PA67VQzCOHf4IXqBi4GNtS+BiLF/GZhlShQ6YKlb/XriqZvQIPblyrs6FO
	 YXIc3DDbjbmGaEJMuKE1wwglvvQAiESh1ZdtNPZXpvQWPqnGx3Xk+1URl8YGVrgL9Z
	 syQF+J+gBXfuRFm93Z5NWObV7XxuePV98Ig4McfuNxOGCZmELlQx2oR+AbpKTRs7XW
	 UxdDIXN5KPAxg==
Date: Mon, 16 Nov 2026 10:23:25 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, Jan Remmet <j.remmet@phytec.de>, 
 upstream@lists.phytec.de, linux-kernel@vger.kernel.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>, imx@lists.linux.dev, 
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
 Sascha Hauer <s.hauer@pengutronix.de>, Benjamin Hahn <b.hahn@phytec.de>, 
 linux-arm-kernel@lists.infradead.org, Christian Hemp <C.Hemp@phytec.de>, 
 Conor Dooley <conor+dt@kernel.org>
To: Yannic Moog <y.moog@phytec.de>
In-Reply-To: <20261116-imx8mp-phyflex-v1-1-4adcf8b4d373@phytec.de>
References: <20261116-imx8mp-phyflex-v1-0-4adcf8b4d373@phytec.de>
 <20261116-imx8mp-phyflex-v1-1-4adcf8b4d373@phytec.de>
Message-Id: <179484619251.2165678.3116272117041652680.robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: fsl: add phyFLEX-Libra i.MX 8M Plus
 FPSC


On Mon, 16 Nov 2026 11:54:40 +0100, Yannic Moog wrote:
> Add bindings for phyFLEX-i.MX 8M Plus System-on-Module [1] along with a
> carrier board (Libra) that join to an SBC.
> 
> [1] https://www.phytec.eu/en/produkte/system-on-modules/phyflex-imx-8m-plus-fpsc/
> 
> Signed-off-by: Yannic Moog <y.moog@phytec.de>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/fsl.yaml:1231:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
./Documentation/devicetree/bindings/arm/fsl.yaml:1236:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20261116-imx8mp-phyflex-v1-1-4adcf8b4d373@phytec.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

