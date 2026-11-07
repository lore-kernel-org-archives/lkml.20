Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794078311;
	b=JCPDhze2EZcj5Y9j6cjg9w/wN/oGvDW9fEZ0qOzShhOfR6dbYckBGOQpxsSzxW72zLkS
	 PXoNLQf7hySYtPosujubQywkvuSQfOGGfMBS8iXm7ztvDWBLLOTjua8kch5Xm6+VQMl9G
	 hgBsRaiU4J3qo5TNMQUPVIj0EcHvI8c6LfMz/4bo7aGhoEViUnHaZOVlBoBSmm9Z5MCDa
	 N9+tf4AWrssl0LAkQM51cdgnWVuxQRlBe+egFcg+9FhClcqFltJBchp9YTX5kaBgrbTjV
	 rVR99eAZtqH3lL2i8fqZQo/80gl9XOIKSfQu4BvR2WEGkHAu17QDLIQe4IeIqQOUr4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794078311;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=XSukMlI3p+vpgcaw+I/ycQQdp1KZceQVwp8I5dai4Kc=;
	b=gARo93ulYPBB3I8MvAVatAvFb4xWZdM682VkRzC4Pi72UFd2wzDYynkFaUev+bVpra2D
	 cS3gZRM80LGVhhXR3WfTiJgk0yReZYNFpe1h4VQg3EhvIurISe8BcLswivQeBfToAQB9U
	 F+u2qHWjOf26YzB/dsQsLnsTCVyziG6c4zgU6PNRjEH93vwu/gmL155APlcMZJ2AMrqTL
	 ml4NdpA51dijKdJ6Lw7cNRfxkXVBU+LYj7dQaEwaxXLW14MFt6aE4BorxHYww7U0pl1jt
	 io1Nq2chZo9q3zdedGDlX1O3FzOdYs0SHh82FRQkDHJ9PdmLV23boRzMLZsq9OjQpfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Rb1Ycnu/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E52606A326;
	Sat,  7 Nov 2026 19:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rb1Ycnu/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FBA81F0089F;
	Sat,  7 Nov 2026 19:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794078310;
	bh=XSukMlI3p+vpgcaw+I/ycQQdp1KZceQVwp8I5dai4Kc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Rb1Ycnu/TGYaoo9vfEigGMMp3/v0r4/jqvUXs9D/WOCkYS4gBGb/zQLcwZ02PFb07
	 io6Y+R64Ojc3PaSb+rGyorxqy1QZsGCXhk0ODZ1pqkyN3/MahHHcIepbjmA+kD6B5r
	 OhOc/tweGrSbFLDFwCqiQ6liVMpLPHRkeQqDtYzX1CEp3bOu/STAMnDbSAbeHIa8zv
	 bdBvHvho0nXKpse3BeVouFZVwHTYWi0uqfkyQuiR5V1dGH4yVVIahd7hIS1zY2HvKa
	 YNthqQkNhJwBzRn/XNdWcqT1rxE1lCOJ4U5AXnd/HpHclG0+HxIRxYMcmd2ZPSI7GU
	 L1NKitZTt93Yg==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/4] thunderbolt: add platform nhi driver
From: Sven Peter <sven@kernel.org>
To: Mika Westerberg <westeri@kernel.org>, konrad.dybcio@oss.qualcomm.com
Cc: Andreas Noever <andreas.noever@gmail.com>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>
In-Reply-To: <20261030082539.1208733-2-chunfeng.yun@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
 <20261030082539.1208733-2-chunfeng.yun@mediatek.com>
Date: Sat, 07 Nov 2026 20:04:31 +0100
Message-Id: <179407827117.165429.11777170722243752189.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1547; i=sven@kernel.org;
 h=from:subject:message-id; bh=YazX3QsxxVBhi3drvQLn+l2mg8cyp0jw3fckrLgjJMU=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9b7MtfydzmJvz5/q9/58EBG0vyNsnOimVVkhO+/YH94/
 I9GgUR3RykLgxgXg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAiVQ8Z/iccSb4j81g96/bb
 U8dvFQuphl18f+P7K+a6iXumT7K8EBTJ8N//yE7DPVZF03h5+cSSp26ayyeWtLJn3c9cBTuFOWw
 f7nICAA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93

> Add a new file plat.c to register platform NHI driver for MediaTek
> mt8901/mt8992 SoCs.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>

[...]

> +
> +static void nhi_plat_shutdown(struct platform_device *pdev)
> +{
> +	nhi_plat_do_remove(pdev, true);
> +}
> +
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id nhi_plat_of_match[] = {
> +	{ .compatible = "thunderbolt-platform" },

Do you already have hardware that probes via device tree? You'll have to
write bindings and get them reviewed before adding any compatible here.
Generic ones like you used here aren't usually allowed.

If you don't have a dts based platform I'd probably drop this, not much of
this code here is e.g. re-usable for Apple since they like to think very
different, see my series in [1] that I can pick up again now that we
made progress on how to represent connections between the NHI and the
protocol adapters.

Not sure about qualcom since I haven't seen a series for the NHI yet but
I'm sure Konrad can comment there. I kinda expect that it won't have
much shared code either.

Take a look at e.g. more recent drivers in drivers/usb/dwc3: They
usually add a dwc3-$vendor.c file that takes care of all the
vendor-specific quirks and that ends up being nicer than a single
platform.c file with tons of quirks and separate code paths for each and
every vendor.


Sven


[1] https://lore.kernel.org/asahi/20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org/

-- 
Sven Peter <sven@kernel.org>
