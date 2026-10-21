Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603180;
	b=YsK2p+hKAcebByZM4poWYf53+eN4ll67qzB06L4uPWTwoBEqBnkigbwj+ny4KOLDSTHC
	 vTvUY0CxE3gbT4wDk2hoAVlGQXCj0Jz5O4ggpfb3MoORnQ7YsylRXl/WH9Qe4r9kbeA/+
	 DsAsVkthLJOSweyuiMBeGEMXqBzuAtYIYwTjmiNP7uGyTzi2w5xY//PRDOJvqLffodINK
	 AlODGnmV/EjHDPKM2LhnYOKJM3ZmuAM5jPQJjopiCXydQ1AR5JyW3UiwhDBY4z8J2H+Hn
	 Km3XqyFMq6iYVADLYL/zIAEHIPozGMjjPPnvhKJYtOLtcfl0CU1OSdzuZckHSS85EnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603180;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=p/oEcNKqidn4ieT1WIF/VipiAVLf85drKemekyUd3/Y=;
	b=Kp35+iidKjU12r7+f8K4oecxTJjogiNS3mfUn5Uxdiaap6/3mGq1J3nSeWEk2igzJQi5
	 9/t4/b1+2fyKXoXeX7zGzgivxVzMQp4H30Di2bzWs73l2KUDCsccS9gnKZtHGtShfujTs
	 X/tqLmc1GlV92Km45Gw38+LwyJoJw5tr3sAi1q/btslE2NzCjgyVBR1H0ryf8ISBDMzo5
	 Tk2CjBw7N6rM7lL8tySTMzrr/zID173iEnJLDajb6govfl5e8KRsuULDq3frk1r9+/B6l
	 zZp+7cWQ3ldQbr5qGZq6Trz5pLukAJC7tNy8+gNQZq3DQl/Gt9wRMChuG79SWsKpmwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=VlfyyDlU;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36975606A319;
	Wed, 21 Oct 2026 17:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36975606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=VlfyyDlU
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 96C6D10A93D;
	Wed, 21 Oct 2026 19:19:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792603173;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=p/oEcNKqidn4ieT1WIF/VipiAVLf85drKemekyUd3/Y=;
	b=VlfyyDlUqMsVamAweIBx8XqfE3scpw/yiN1G5k6hPlSg7yEhTErIDLKCr7X/QugmOEc3SE
	Q0c/X9kPTLrw5X/fCxt+qPzOEivqk6RICAaNdcuXHKyVjPNk4ZFZ7pX3BJenR/BzlSvCjD
	jK2z/nldjYt7uAja1frN/uJ5tVL/czMUF+8Pybx2qbqS9jehqyRGfRu2z5Uyd1b5z6L/+0
	+B0pdA7MoDpuManAJuKsA+uRQVVclBB5x6ZKIWKNXna9ueFhsY6d+SWafizZLXhuDRuyeY
	fYBBdNIkyX842C97CG4ccd6KO+KdIEW7Ica6X+KctBsnj2/GuivdKL7lL2U7TA==
Message-ID: <1073daf0-3676-4123-9ca4-c182ea5883a3@nabladev.com>
Date: Wed, 21 Oct 2026 19:19:30 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: dts: imx6ull-dhcor-maveo-box: Remove unused SPI
 device
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, kernel@dh-electronics.com, linux-kernel@vger.kernel.org
References: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/21/26 3:44 PM, Christoph Niedermaier wrote:
> On the maveo box, the SPI pins are connected to connector X10,
> but no device is connected. The device "dhcom-board" was used
> only to test the hardware, but was not removed afterward. So
> remove this device to accurately represent the current hardware
> configuration here.
> 
> Fixes: 145e2732a5e9 ("ARM: dts: imx6ull-dhcor: Add Marantec maveo box")
> Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> ---
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Marek Vasut <marex@nabladev.com>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: kernel@dh-electronics.com
> Cc: linux-kernel@vger.kernel.org
> ---
>   arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
> index 047f7b2d8526..eb0b91040110 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
> @@ -60,14 +60,6 @@ &ecspi4 {
>   	pinctrl-0 = <&pinctrl_ecspi4>;
>   	pinctrl-names = "default";
>   	status = "okay";

Drop "status = "okay"" too , since this controller will be unused ?

[...]
