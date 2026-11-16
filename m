Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832947;
	b=Sa4sAIN9BDD9OcdqjwXcre8ICsAFOIluMcTAXiEebegz/y3FRUd1ieVyW/Y8Sc1378Jx
	 NsRfsaRVQ8Gwn8hSfyf95dS9mHTkTDzr15TDBv2zPQ1mVtCCclqQ/DJUxqdd4JkOI0WUG
	 LN6wEUW8wKiF/lF9F2GkVkSipJ+Zl+N7C7lWVm79Sm6oTzjY15Jsy5a3tsZgIi3LxU2T7
	 WNK950HhkWex4I3I1zlT3GXtJZSPTPR2DGHOHyokMFlAlvcWXazW79Z3IsUay5MJAoUzO
	 19iBk9LFvllAT5MsZ3OIDZGZg90/OY8ZrndNTZ79J6Q366kpXqR2gUHkIlxfzviEjOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832947;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KaGd73jUvBCtYYL6VAII2la7monoqE07c5rmlmDTQEY=;
	b=GYTbDdJehtS/FXyp/ydK66AVWkJoAoERZrfjOHMDn/e404dA05V/Cxew6AQq7JuBkeCF
	 jWNTNRR9GRx7A1jzj8CE6O01L8bQtBUIGv+IGCxu/D7wC0QU/XnNw01gzPYtlaCX2If0q
	 vohY0mRT/ZFYilpnf9ioL3/yGjogIjZKu8+M9W5JGXcuHoJhjVzXx8yjVewgYjBp4ijZK
	 94+Z9bdeotngX1TZApXE5nqNR1vDHEShC+vPD52aslYLSo0rucBnQWe4eVbXUHXj7NAwJ
	 EiKg/V46CVUzP/fTK3cXrHrUK9r+X9qtIiQHHHUitfFL45k/pWUSepl6Km4HCEnJxgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DePnHql2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D9F606A31C;
	Mon, 16 Nov 2026 12:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DePnHql2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68831F000C4;
	Mon, 16 Nov 2026 12:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794832946;
	bh=KaGd73jUvBCtYYL6VAII2la7monoqE07c5rmlmDTQEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DePnHql2vogNseC44FlmR7jh1l1OWiprMO+LPBPtIqCAkEK9tWs+PBcs7op/SeLU+
	 nWeleNAQrWVX72IcIswaR27oRuQKG5uRGZVe/i65oeRrq1QzNrfVjxdAq+vE7HRE0D
	 XO3GyMSFtIWmlLgu3Rno3cHFbIRvA9FD5W/19SUjCKH24eWTbOG3pA4KhDGjytXu2h
	 6YnHpIBU2SX+oo1AFH0/pZ7dFEcwAlK7MKj08Mkl1fAYt9QAsDIjmNbl1ANRRE9TUn
	 fwCFHwraGT/OHD/ZwzkMRUEg5jS/Gam/BN8iS1TVV2/xB1yJUFblPiE51/lk6RnH58
	 drFOsvaE54kfQ==
Date: Mon, 16 Nov 2026 13:42:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: vamshi gajjela <vamshigajjela@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Jim Wylder <jwylder@google.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: spmi: Add Google LGA SPMI controller
Message-ID: <20261116-slim-innocent-prawn-2caee1@quoll>
References: <20261115180147.1208082-1-vamshigajjela@google.com>
 <20261115180147.1208082-2-vamshigajjela@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261115180147.1208082-2-vamshigajjela@google.com>

On Sun, Nov 15, 2026 at 11:31:46PM +0530, vamshi gajjela wrote:
> From: Vamshi Gajjela <vamshigajjela@google.com>
> 
> Document the device tree bindings for the SmartDV Technologies MIPI SPMI
> master controller integrated in Google Tensor SoCs starting with the G5
> generation (codename: laguna, canonically written as "lga").
> 
> Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
> ---
>  .../bindings/spmi/google,lga-spmi.yaml        | 56 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml b/Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml
> new file mode 100644
> index 000000000000..60d1e1769cf2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

