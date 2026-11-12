Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480096;
	b=2Eh6VOlEGDB8GkvqI5jOqe2MEoofuD7uV7fo/PbQQSz3sBadB2W3kC6LZp0G3yZgD2DL
	 dGwd8Xxng8zRZK5gAdyS1rFb9ylhkcSWIvMEs1Tnz/qk5af41QObpzPB4tO6fjKMXu5oC
	 XwOs4Rfh1tteFufEnLt+RcymQsewM5mBUCEPpaGv6DDWCCukMqa4qU0cYPT31IP28GEB5
	 WeO+AKAj/BrogQlxhQ/yfvjW3cSuVLsQcfXUZadv0bCiVt9ZIK4rh2MN/OPs4Rf9Kkj1D
	 nTqvxvWg0/yicqDN8aZAMO4e9n/u0Whl9tlHSGwTdrfEWhwsr5zoosa+5h2OdTO4n+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480096;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZP3U5tKFMTHhfEkSOkzIHCLH+O/mUp11WA5Kb/PScQc=;
	b=DEzVWdMwGOZw5+CY4BPj7U1i8YDHSbVQPvgolLWhpJVHRwUvO7vyCB2RneLTrdCvTx/H
	 Nb4jKHReKmwXW6e2RHbxZBJZS8v928YF6iiGNwY+04uJrNbd2tJm5NqYgHBxo57pwn7W/
	 yNlPi7YP9c+Tw2eDmIQoZ/+cm4saelvZ3xn/LvP77MrUKYceDRH022LxYlSjqOG3yrTau
	 BDG6+BdOs70S9wnvvtxQ2QRaKnYc87aOnDR99xMBs7QFFufoZ8zlJBw0HPKmX/M1+HEbI
	 3k/pGxGvOdOqcdso5m4j4sdZx06Sc+hqem7Y2xGMYSTWen7qTj29TkW153OEwX9CP7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ny7X4Hvn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8451606A31C;
	Thu, 12 Nov 2026 10:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ny7X4Hvn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D83D1F00A05;
	Thu, 12 Nov 2026 10:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794480096;
	bh=ZP3U5tKFMTHhfEkSOkzIHCLH+O/mUp11WA5Kb/PScQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ny7X4Hvn9UH6mVup1UvEbkAfGc8JY7VlNNNI96Rh8wwN1bR0EwV4gzt8yE+wqa/8r
	 oF5fVa29etzTNaKAy2YFBaeku48E1mY07UDW65GViK2gQOq3h2y/ZTXQ7V9b+zMIJR
	 /xaYSk9mqAXQzWRMgbmjxUrtEL60BJ8U79nESmxJvPqfA6zYl0FKsxIIrBCj65czpo
	 JseNY5/q1Yy2av2SqkHLCDr9k1PG+D3Kx7PXkKJBC54BqxM0mQKD+GyG7L7VGhI1Px
	 BWxrlY7uEVtl6B08t8IPWbz3pNrXrTecf4zGnvQPSku6vZe0qhvEHV62uYgKYD2oty
	 QrtzyroSYsGcA==
Date: Thu, 12 Nov 2026 11:41:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Obergfell <frank.obergfell@bytesatwork.ch>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Michael Walle <mwalle@kernel.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Alexander Forsch <alexander.forsch@bytesatwork.ch>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] dt-bindings: arm: fsl: Add byteENGINE i.MX93
 platforms
Message-ID: <20261112-acoustic-natural-koel-053ef8@quoll>
References: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
 <20261111133119.1063210-5-frank.obergfell@bytesatwork.ch>
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
In-Reply-To: <20261111133119.1063210-5-frank.obergfell@bytesatwork.ch>

On Wed, Nov 11, 2026 at 02:31:18PM +0100, Frank Obergfell wrote:
> Document the vendor prefix for bytesatwork AG and add the compatible
> strings for the byteENGINE i.MX93 System on Module (SoM) on the
> byteDEVKIT carrier board.
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml         | 7 +++++++
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  2 files changed, 9 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

