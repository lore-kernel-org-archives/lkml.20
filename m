Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484939;
	b=doBz5hOdUXGNNotK6A3tiO8hLvqZK40FDTd/Gj3YlO04pc/uqSLf6CNTyrhx9Lwub8mc
	 riU7j+FJxnmr2M5ks5ZlU2Gfn6o9S7QsHS+bmtMh0eUHLcffE2mUshDwxZ4EN2Ug3285k
	 Njdb6iEntThtVzeQcHivIpptLHAvWTdj6LP7mrHSMR8G82gM9K4SkJAVgeB0pAiOLh1/m
	 38d6RlS0wdXf9tTbvP81I39gZkKU1kxV45RhUtGrvQJPGfdVZiDdgpD6Uw/9IDIca1wAE
	 MZhyXHUdrsna/fnsi8QIRKInQF4NNQsvDzmKuntRxaDnvym1Ez6eW0VYSDPnFnXarOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484939;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vyucOTsSgLZgrADiAoF4uVAGYoXy/9hXlyt8Dq2To40=;
	b=e9Ab364P2Ptz19HP6Y0OkqzjrTpMYoU+Ab2RGT/t3Oz68cW167mK+BNzcHex2j2V9ZHb
	 kjks/CqNs4vxZcW+1jpHMty+I30RMjlNaftzj8hCY1bQAkDQI13WdlPJ0QYXK0kar8JGn
	 fJOcLumsRQevaUmq6FuD0c7zs3xX4l44MotB97zIngvnJnXpnKBc5vNniSaaeMjTJp53s
	 MZDupR7uX0zvM9cBgR1Fx+CWc2HpQ6rHF1/oprzqmqOknUFofDGRn3nn/3qsi+NfOLv+T
	 tfEWU0DpDFG+XziZTq8C1pWH2omxgYEmE6N1DZKAOOC42fxSN74D6ud9Jpm3BsdfiDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X1QbPGdg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2F9606A31D;
	Tue, 20 Oct 2026 08:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X1QbPGdg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D432C1F000C4;
	Tue, 20 Oct 2026 08:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792484938;
	bh=vyucOTsSgLZgrADiAoF4uVAGYoXy/9hXlyt8Dq2To40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X1QbPGdgGnyhvJgbj7nWBs0fVTqa5p3X3mLygwxpvPDz9+wfNiTKokVt0ZtNOjqUb
	 9cJVxAXCFuD3SCUwfbCHTxcYB3tsU6zhrXh8vS5UymufrU7P++7C8dFUNBOsSNlK1c
	 E2d6mNbN5GR6oWEY4Zk/+p4UsxGJz6e2ndGdP5oZwd1/FPmLe5EmhM8Ei0WCxECcNH
	 bsMY5aEaq+fEx5ihYAfkfBb8nQLL615Xe/GUSikth3TmMaehviaPtc/VJaMDEvsQO6
	 eV3pDVkCZshpB9c9lHzueJ0U+q5EGx8ORf4nzypZ42lMu6hoE1wyrN97augvkuf7tF
	 FRQFMtjq4blYA==
Date: Tue, 20 Oct 2026 10:28:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	"open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: display: sgd,gktw70sdae4se: use
 unevaluatedProperties
Message-ID: <20261020-artificial-olive-mushroom-b798c5@quoll>
References: <20261019205000.1084408-1-Frank.Li@oss.nxp.com>
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
In-Reply-To: <20261019205000.1084408-1-Frank.Li@oss.nxp.com>

On Mon, Oct 19, 2026 at 04:50:00PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Use unevaluatedProperties replace additionalProperties because it ref
> other yaml file to allow backlight and label property.
> 
> Drop panel-timing and port, which copy from panel-common.yaml. Others have
> additional restrictions.
> 
> Fix below CHECK_DTBS warning:
>   arch/arm/boot/dts/nxp/imx/imx6q-var-dt6customboard.dtb: lvds-panel (sgd,gktw70sdae4se): 'backlight', 'label' do not match any of the regexes: '^pinctrl-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/display/panel/sgd,gktw70sdae4se.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> changes in v2:
> - drop panel-timing and port

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

