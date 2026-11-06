Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969477;
	b=30//Ch3QcGH1Aukhh2TNTKfuqnJuUfvtJJm8WvjaN/qR2hnJdY3JpsOq9HeY/phksZq7
	 idVln6kKXvunRJjwj2H/UD0WGEB400nZ5EEgjNbed24dVYpn5Ru0aB9vNarC7PYlU2I/b
	 A8RENzcZJqio9vpZ6q3PwZWt7Sof8GNZ/7GECyb2Em4tOF9gKD1g+3elp6XuvYrfaDNAQ
	 DGUQl1x+X0R1W1KljuGTYEyX3FuPROkpSu2KFfatqVVV5c1xvnTzi+H8hObnb58goZ4db
	 3p+Hjjv4zOZUZ4va9dg4/CjeQSmH2KMqWtyTjSrXtgzlJ3U+bzE0YA5Dv0Y3Pl0wKpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969477;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=A4eqQOE0DSkHSkNE/FUQXnB6sdsllvdnom03K8LESpU=;
	b=op31fGPYNLE7/5VQekUmW4PJvU0VPPFRqNeimsoxSSAHvVO0Rgw1LLv8mWMuUrR4s6yX
	 PebDtIxkRYd02uTtoQJMWmGP4vo3gQWElxfwiY9hLeRaKrW7imE/9YEzmD3CdwAuAZVSU
	 o53g2CuBbTrLDzmhCvp/PuHULf9Ma6zT74p1oQx8xtyCpHt83zKt1zci+wxcPARzoeJzo
	 O96aLOcz+QJEMoQmsbcl8SAIBc40TPJRdw6eD4TxaAQeR3G2Cf7f9Fo+i6ZJ/R3GXU0KT
	 aGcpvMNLmhadgW13htAXlImVOa6IoBUCts2rtGcYjrgSit3qd8Rj/NpdFxFzjP4bY8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EjJhzyUn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6953E606A326;
	Fri,  6 Nov 2026 12:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EjJhzyUn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 095181F0089F;
	Fri,  6 Nov 2026 12:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793969477;
	bh=A4eqQOE0DSkHSkNE/FUQXnB6sdsllvdnom03K8LESpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EjJhzyUnLWXusjWJ0YL7uyZLGYms89tIuLl27ijFJIyviYAjXPmHUcKYWwSRF7UEC
	 evi7ioLaXUkTahgiJNYIa0dDbW6IpYQLrGxy7QG3IMqphoF4DxQ3ppxzuKFe9o2EnE
	 LNDeTehsrHSGW31d+FGmpmTB9iDgNEYcC6hMOXBe4+M4/4xcOq/4kHBvteidQTON3j
	 yBZLmfjJQkW4xVMgd5f3RGIiet6xH5i2uoYpQHlLopUor0qXKNMqs93fUp7oS9lL0J
	 Nfm7ZquvtvAEIoslHzFqdodm2gcZx3pZ/FV5oFL3EFDyskLFIPi0P6EUzgzGZzytu7
	 C2Lf8I8cNNHgg==
Date: Fri, 6 Nov 2026 13:51:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/8] dt-bindings: arm: fsl: Add BSH SMM-M2B board
Message-ID: <20261106-adamant-thoughtful-cheetah-a5969e@quoll>
References: <20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com>
 <20261105-add-bsh-smm-m2-v2-1-fb5ffc7da486@cn.bosch.com>
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
In-Reply-To: <20261105-add-bsh-smm-m2-v2-1-fb5ffc7da486@cn.bosch.com>

On Thu, Nov 05, 2026 at 10:41:15AM +0800, Haoning Cheng wrote:
> Add the BSH SMM-M2B SystemMaster to the list of supported
> i.MX6ULZ-based boards.
> 
> The SMM-M2B is a variant of the BSH SMM-M2 SystemMaster
> equipped with an AIC Wi-Fi and Bluetooth chip.
> 
> Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

