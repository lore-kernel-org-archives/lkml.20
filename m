Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827536;
	b=k2OzrgDitFWnWRT/Zm2ZoWuK87VWVi1xoxiFd1rpKu7YnVnq4vW9FLsnWN926Pe8qJFH
	 UmKG2IqBb/DDpKgd8IOegUmXqCpLxhcG+/O8r5qHSCD7MFByQkDFYbWaus7IbDAuXnRLC
	 gvfRmTlRD3DMP5sYyPjAlt53z44reznFlBz6ApSWv7UidMdaIZJNKFQAkqMW4/xMyfC6g
	 S3zQMNbIg1txhBVw3E7+j2i7Jjelh6sVsQP4a8eV4y/Yb7j/q5Puwp44C4xfHlw0ClcnF
	 zXD3w1eixeXwODWxdB/or9JyxpmOpmz7TcgrwgtsoItK70/krQj1mojztYJ4wMwf7rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827536;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wJhGraY4E2F3DhRPt+fkpNkkY0LjI7cgZJQyq/wKMOk=;
	b=P/rczQyQODcq6WB9mC/HKx2g/vuqUK/yApVJzCsVNKPIcaLy2RS+6et7CTbyGj7K4S1x
	 pfMx9PTxs9xLCGUabxqwVDIMqQcuYT6NHwSXPfBHseKJ4sbDzu8G4Qx4WIwI0WcF2+A0e
	 rMRWFQpGNWfyj/rI5G8pBeXRykePowMWEzL86TW4hYNOaHqmU9XpsdyUlOkKrRzbCGhgI
	 Wn9zG+jL98eoOGvL23Thob+0Cn+woOzpIWavAxMCS/19rpt/zNiSoy45korV8HSKm39mQ
	 D2r4MMxIEbLHj1WHf6gCxwtFsepjgo5Khw+TdZWbR/me74nWQFztNWiS52VveU5dHgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=be3RE2Tv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920AC606A31C;
	Mon, 16 Nov 2026 11:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=be3RE2Tv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6C41F000C4;
	Mon, 16 Nov 2026 11:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794827536;
	bh=wJhGraY4E2F3DhRPt+fkpNkkY0LjI7cgZJQyq/wKMOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=be3RE2TvHfu/0+xHeuoCE6/kUt020jzanpOKfY2dJPntwCkGA8zzpR+if6hDSxfZ3
	 xlR4NatqGaVrQHPNX7X7jpwdO/JykdMhgR4Wyo0uJaay5F2AD7O/82hsMzJ9C4+KwV
	 QRO2Ur+CSE3g6ig1CkdwHzBRm8xfUKxXuGUG9h2euPws0jJtqC6tZDznYp/jF97JOQ
	 AzsirOO8JH7MMs+71eoG11Nk7kpSQoAzE2jg7HFjx2QRvWJcx60POqnv3h2Gz5bnBg
	 c7vE8kOHR5uYPdN+XGTfJ3MpylRMZEYlBbvDG+9v2BUN0eXwow39UhQr8JXO/uS1MM
	 R2xt668x4LoJQ==
Date: Mon, 16 Nov 2026 12:12:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yanli Yang <yanli.yang@bedmex.com>
Cc: linux-wireless@vger.kernel.org, 
	Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Zhirun Liu <zhirunliu@aicsemi.com>, 
	Dijia Xu <dijiaxu@aicsemi.com>, Chunqiu Liu <chunqiuliu@aicsemi.com>, 
	Liheng Wei <liheng.wei@bedmex.com>
Subject: Re: [PATCH wireless-next v5 1/4] dt-bindings: net: wireless: Add
 AIC8800D80 SDIO Wi-Fi
Message-ID: <20261116-groundhog-of-magic-flowers-baeecf@quoll>
References: <179481380235.4.7388336477392853157@bedmex.com>
 <179481380235.4.9476425206200425967@bedmex.com>
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
In-Reply-To: <179481380235.4.9476425206200425967@bedmex.com>

On Mon, Nov 16, 2026 at 03:23:22PM +0800, Yanli Yang wrote:
> +description:
> +  The AIC8800D80 and AIC8800D80N are Wi-Fi and Bluetooth combo chips.
> +  Wi-Fi is attached over SDIO and the chip variant is identified through
> +  the SDIO vendor and device IDs. Both chips use the aicsemi,aic8800d80-fmac
> +  compatible and the same device tree properties defined here.
> +  The node describes SDIO function 1 and its optional out-of-band wake-up
> +  lines, and is a child of the MMC host controller node. The chip supply
> +  and enable line are described on the MMC host controller through
> +  vmmc-supply and mmc-pwrseq.
> +
> +allOf:
> +  - $ref: ieee80211.yaml#
> +
> +properties:
> +  compatible:
> +    const: aicsemi,aic8800d80-fmac

Nothing binds to it, no user. At least I could not find one. Can you
point me? See also submitting patches in DT for explanation of rules.


Best regards,
Krzysztof

