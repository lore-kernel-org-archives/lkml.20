Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747779;
	b=CkhEEJk1swKK88iwHU5tHddVcrFeN/GbJlalC6+/XM5/9Rlt2YUApE3cZ6/8zGybobiu
	 boUiQDsPzYXLdJPOw/X2jLQ+e89VDDtEGzQJz7Q64pFKvk/whE/87iFzq3J0c/QIYTYXt
	 Qt4IVQnYurl7fnYOxQbjp/8O9D/R9UlkneB60t4lcbJtkaFsKwO5fove03rm3EbgBqRiR
	 sMd9GRJk41YKI1n7JgYOm423S85zf7HS7p7czjMAsF0COjwoYps4enDROyGcqUgEjvb0i
	 vGD+kU/eOjBPbvW4djBC9VF+fhCLaDBsyUdie7b9kpNkatGVPvPIOtfO99S7/0pWF7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747779;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=WH6ppsWJmNp7XsRvR8E8E9xrLV/H91K1v+S1jWsOr98=;
	b=2dSrF9l6xvKoKk7W0PXpFzmG3UJWOF26riYKMfCiyLAsHESN8PII5ZIShDYki8hh7ZAC
	 Y+v8WwJdBM+JIM1E+0WB1H6iqGEQT4E2Y6d6y+fs+eYAEiGp3oybzKi+MDsmEK/rB+NeY
	 QIc0y42I1qJVkDGvoJUJMfQzcueSkaHsS3M0+I3AR5AdENvI0RCahuYdMN6RzjQg+5JJR
	 8K8s8cAsxJLojTsS2a98bJZ+cnAL2DQWqQhk+bZ4YX+aMC8MIo4uwjsriGE7Y64yG7w+8
	 UCNaYE+9cfal2tCMtk4NpxipZ1C0fxoaSx7kuctFZrRNRk07hoGthrzQxgSou6J8vqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FU8TCa39;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A8E606A31A;
	Fri, 23 Oct 2026 09:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FU8TCa39
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A82B1F031E2;
	Fri, 23 Oct 2026 09:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792747778;
	bh=WH6ppsWJmNp7XsRvR8E8E9xrLV/H91K1v+S1jWsOr98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FU8TCa39PytfbnkRY4DJctKSSCC37mFhtmkpTw/Q94ZEsGIoe0POJ9U45KcVMVCmA
	 X93457lPUGQNQhbMzjXZi9TtOhLLJEEnns5i04OVWAR5ItVlUMr8IBGUf1yh2/z22r
	 rKMGp6BOFV5sKqpCWzTup7fm3xngwwuN/4UF1FI0X99Fmm00H/fg5h4dOOIdUFlSCe
	 BOOaHM99eoXMiHFuQ54EgmIB2LRNPgrrOVrxbfDorOvOjn/6+4I8U3cJNbwOKsk9j8
	 xEKFYMbNIVB5SqBM/YLYBAj82ZRmlVeqGjGFk3hBn1s6sE4NT3nOhIZKltMUMaw0MN
	 yU9Jcki0kExtw==
Date: Fri, 23 Oct 2026 11:29:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Robert Chiras <robert.chiras@nxp.com>, Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 2/7] dt-bindings: display: simple: Add
 waiken,101wx001-wct
Message-ID: <20261023-apricot-hawk-of-spirit-267aed@quoll>
References: <20261020-dxl_lcdif-v3-0-adc944659e14@nxp.com>
 <20261020-dxl_lcdif-v3-2-adc944659e14@nxp.com>
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
In-Reply-To: <20261020-dxl_lcdif-v3-2-adc944659e14@nxp.com>

On Tue, Oct 20, 2026 at 04:12:52PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add WKS101WX001-WCT panel, which is an industrial-grade 10.1-inch IPS TFT
> LCD capacitive touch screen display module.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v3
> - Use Waiken Technology Limited in description
> - Use 10.1" at comments
> - Use waiken,101wx001-wct

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

