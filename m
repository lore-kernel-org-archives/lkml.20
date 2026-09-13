Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FF537C0FC;
	Sun, 13 Sep 2026 08:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789289848; cv=none; b=lVXN106gN6A33KCwomHUO9f+pZHiqVRBfCgYi3C5PKurUyHI1Tmx3VZm6GJdjI3YE3ONadLdd81jc78UmgcCbTgk94KoT+SzknSKa4B1gL1IBwIzXXDxYh/wc9FHnPvGj/F+Eb6nnT3mWuACTDbSkQljucnvIjMjlqS3cL/Xpy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789289848; c=relaxed/simple;
	bh=+1nb7YPMejRdx0NF83bKzZ+bz2YPYtL5YD7pyuAqIiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DNM7bIsbnxflrvodZZq9Eh1CNFUwOl1bp1ehW0JF+YWnxpgvLlV6KULqlvlh9OOwYrpP1BZx5xutQcQbhqPiYVw+BYVOR2r844//zDvd0poYeuPLqAlFcucoZ/jutxVIroHeIIst2s58SsiTwFrTNzb4jGsrR1z2mp/RUtUZDVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9tjk92C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9tjk92C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C451F000FF;
	Sun, 13 Sep 2026 08:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789289846;
	bh=BL5xIJ06x6sWaYiDzKO+L8oTIfl/IJqCehJ4SatDQuY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=B9tjk92Cg1BLQGLcILMt+xCPA+7vurr2DIzXOTUdMUO5nU3wTtn/UJML9VbfAGI0O
	 qRUuirqbG7fmat/slz2H0gbc5+I2/0qrAzZ/UVMTbQA1fuqa2gzjZemqU/5GxECDgZ
	 1JoHHRAckRtCA2LoUJ9aXR5lDtl642+/79JvNCE33Qj5hVAmSXKFDdUSNxQRXgrjVh
	 Efs4ztI+68hGF0RvNANFOvN68qdcvFuF+8e7u+NPF3Z3cTC0HvlekB1EFyuSSCo0w5
	 cFc9UIbeDbZ2PRdaDNb4J6dki/AVUj3UcfxVi3b4GHUsdXEdoLh28xZWkuSnc+BUjJ
	 78HdGxQAGTwWg==
Message-ID: <17349991-bfff-4e6d-9176-dd6ce6bc20ac@kernel.org>
Date: Sun, 13 Sep 2026 10:57:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] arm64: dts: apple: t8122: Fix most property-order
 dt-style-check issues
To: Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>
References: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
 <20260909-apple-dts-m3-dt-style-check-v1-10-4c546e2d9d51@jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260909-apple-dts-m3-dt-style-check-v1-10-4c546e2d9d51@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 9/9/26 12:27, Janne Grunau wrote:
> t8122-pmgr.dtsi is left unchanged because future additions or
> modifications will be sparse.
>
> Not fixed are
>
> | [property-order] property 'd-cache-size' out of canonical order (should sort before 'enable-method')
>
> for all CPU nodes to keep cache related properties together. A blank
> line is added before 'd-cache-size' to attenuate this grouping for human
> consumption.
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
[...]
>   
>   			status = "disabled";
> @@ -270,16 +278,16 @@ fpwm1: pwm@2a1044000 {
>   		serial0: serial@2a1200000 {
>   			compatible = "apple,s5l-uart";
>   			reg = <0x2 0xa1200000 0x0 0x1000>;
> -			reg-io-width = <4>;
> +			clocks = <&clkref>, <&clkref>;
> +			clock-names = "uart", "clk_uart_baud0";
>   			interrupt-parent = <&aic>;
>   			interrupts = <AIC_IRQ 757 IRQ_TYPE_LEVEL_HIGH>;
>   			/*
>   			 * TODO: figure out the clocking properly, there may
>   			 * be a third selectable clock.
>   			 */
> -			clocks = <&clkref>, <&clkref>;
> -			clock-names = "uart", "clk_uart_baud0";

Please also move the comment so that it stays together with clocks = ...;



Sven

