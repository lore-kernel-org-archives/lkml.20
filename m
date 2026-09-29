Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74A14B0CA4;
	Tue, 29 Sep 2026 08:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671610; cv=none; b=MoKdLngkQJXacbqezdx2Gaq7/WwbDsxA342xqsMfBlMhyOP+lxb5oF6b7zkiNHg0kh/4OU+nBzV2iAAud4aBZPGhUak42J/qUi+mvyNGs1MF1JIujSNS7alSPSXUePF3hWbEumurUgb0263+61r8XoXEdYcDkBhIfyUdB8JJpX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671610; c=relaxed/simple;
	bh=nhZa9US+a3qozdFWza4F1MJneaEX3eFGl7c26J3N4CY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcICyj6l9cB7FBrSRx5oEPEBL3h2l9IojK/BsCNXPTEW4NFUyNBdM/NG1l7DEW6JQwu6lMYsUAoNSCSgXC4PQesG0SL5rlTm6N32nSlVo4adtDk4H6TfWL2hCLmKku0+ATbVRFONQWr80SZJtyx6Yi7qRbkY5sBqM7ejKmg8JdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQno3+SU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQno3+SU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB8FC1F00899;
	Tue, 29 Sep 2026 08:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790671596;
	bh=X2bjnjkfAYn9RGZpcWaVsSZdftTR1zHRUBhxYKKVJts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bQno3+SULrhkcdpaywbcogY3sw2IWoviVqeWjhZujw5vJL2hriSaN+jCc4r/oyM4o
	 YWtKD/lKoaGUMqRFEWHGWI9sYi+96XjjMHCXUCkQwFnFiJ2EzS0RnCJv0BUTyxh9/b
	 YCFe8i3LfGV0euQkNSuCSHFs5PvKCpGoFe6ndmmaD+d9z7uyqvYXTN6h2s32BL98/x
	 yK5GwUvFJ6h4ZzkhW0GWeyJL5+mOBUPvg64cPgilh3WI29gbOIofA1zQiQ4P4yDDem
	 HP6zTyCFR5uN6KjjbehUUOLQT0oPq3jZe5/kxbgRKlAsA9KWfCP7z4k/RiPnPIxaQQ
	 bVIPuWr/pCtxQ==
Date: Tue, 29 Sep 2026 10:46:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sofus Forstreuter <sofus.c@icloud.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Heiko Stuebner <heiko@sntech.de>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 01/17] dt-bindings: media: add apple,avd
Message-ID: <20260929-poised-sympathetic-hound-c0ddf1@quoll>
References: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
 <20260926-avd-v2-1-ecebe6a3648e@icloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260926-avd-v2-1-ecebe6a3648e@icloud.com>

On Sat, Sep 26, 2026 at 03:14:40PM +0200, Sofus Forstreuter wrote:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - apple,t6030-avd
> +              - apple,t6031-avd
> +          - const: apple,t8122-avd
> +      - enum:
> +          - apple,t8103-avd
> +          - apple,t8112-avd
> +          - apple,t8122-avd
> +          - apple,t6000-avd
> +          - apple,t6020-avd

These are misordered. Order is alphabetical.

With this fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

