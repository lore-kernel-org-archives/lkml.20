Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564462;
	b=y/hmXvSnJsIJLvDFWj9ixg84nCCFYg6Af2nJu1u16LiJoM4IkVM0c42VA91m+mTTcOwo
	 dazd5pM8HaG4etfqYujNIfEpalYqX1R+/Up3QvIopAFdkKg+jXWzEVJDUDSeVA+lwoOJN
	 3gHB2yLH58V1aZZ3q/k0VIEs+CTRpkPAcMY7wI5pBOFhyvy8O5yxPqJIVdOAjAlPMOpPH
	 ysUCWf2PuM3ufYKw8j8/G9wonCBtIWaJvYMMuGSoZf/oCCkGupt75tT9PAYVFG+S2SZcZ
	 ZMuEARHnaZ7Zm9qRg3GzrAQCGCJlnGdISqc8fM/TtXXhl5XOONaTlDuusOkj/KVPf2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564462;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=M+He5GZ0KmkxtjNbEWExh1PZmwL5eABb9JK/dacBH4M=;
	b=DG+jKbWWXBBZ3hZ16+pKgZ20wIt4tgYMPbyVLE/PaFrT7/fjPNn+xva75hWTnOoLcpTO
	 qXrGu1vaffAZdcMwMGIwMOzjFPW7kx9fnQ9aQUHAKEtDYcYpPrJFK9R4QPYycXIukE7uB
	 umTdR6QzcqmXQ3QRecEMqe57j/Wes4srE2SxUZ/xkDmkVTTW1LFAIaUqdiTcG8qLgFxI3
	 BhlHkrAs9DjfXm14qGrT3AmBLtHcKwL5Ba0D6ES8g2+jjKG+0wHPua4fLkW3pktPYx+yN
	 HoK2nuVyz7UO9zB6XIh80dzbhdLxU82drW4+WTjoSt1tArsQB9C4jIriZO6jp2qsiuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I9Yt+iaJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C73E606A32D;
	Fri, 13 Nov 2026 10:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I9Yt+iaJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D671F000C4;
	Fri, 13 Nov 2026 10:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564462;
	bh=M+He5GZ0KmkxtjNbEWExh1PZmwL5eABb9JK/dacBH4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I9Yt+iaJbuNFlNOCkkutSaWBe/lzHAoF1Keu3hWDVpP1eWmxaA+tYDjESE06inLOh
	 YQkoX159KwVyYKuFthiScAuIWxSCKTOA1SIDlLn0ImN+PkprICp9eTGFCnqGTbpJCy
	 5n6+yXSnAmQ0YBLbbOFXzBtxQ1qvOgbddw+eO8U43CSu84bJRxfLrpYj3s/wWu5yRU
	 BNblnl0INpSDZxG4yEXhU68kF72z6e+8WOZTpBrKE8fqERyrKSBUiAJ5tk1G29bOU5
	 v8u0ikf4vTSr95pPWoeQjSKk22x/o4Zk0Y6gcgAWV0gGfkyYzzdfL3ptYzJydcbLrf
	 /51w0hsmt9hjw==
Date: Fri, 13 Nov 2026 11:07:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add the cfg_ahb clock for Nord
Message-ID: <20261113-influential-lumpy-goose-68ec0f@quoll>
References: <20261112-qcom-nord-ahb2phy-clk-v2-0-30ad3d947217@oss.qualcomm.com>
 <20261112-qcom-nord-ahb2phy-clk-v2-1-30ad3d947217@oss.qualcomm.com>
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
In-Reply-To: <20261112-qcom-nord-ahb2phy-clk-v2-1-30ad3d947217@oss.qualcomm.com>

On Thu, Nov 12, 2026 at 04:36:38PM +0100, Bartosz Golaszewski wrote:
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> index 13e64fe510b8f..8d09e6937fef0 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> @@ -209,11 +209,13 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,nord-qmp-usb3-dp-phy
>                - qcom,sc7180-qmp-usb3-dp-phy
>                - qcom,sdm845-qmp-usb3-dp-phy
>      then:
>        properties:
>          clocks:
> +          minItems: 5
>            maxItems: 5
>          clock-names:
>            items:
> @@ -229,6 +231,7 @@ allOf:
>            compatible:
>              contains:
>                enum:
> +                - qcom,nord-qmp-usb3-dp-phy

I don't understand why it is added to two blocks constraining clocks.
Does it even pass checks?

Best regards,
Krzysztof

