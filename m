Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AF04E06C2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161699; cv=none; b=XZ17Udcn96GGvBnR8T1SdMh7dODFfztq8VUgrPV5EIVhsUHuMSeg+s2G00gGVuZ5BaLoJwhgBopkCkKJEcL8KRk1aiMGq9PcKp35nmYucIy37F0F9PkEA/LTDhslQkpoZBoMTzQQurrq3hECX2ch1It+gJsvmlwi3enpZ4qVP7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161699; c=relaxed/simple;
	bh=SgeS6Wx04l21w7+E85JZhYiHkaCAmNtxI6p7FjL7HSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pd7kY5oav6KAdFE9r3zvFZ9f4iCRkkwLXHfStfQQ+ayfLx09n9PuYbrkrTB9ajOrUQBAQFfapSYe1ZhPLH6iXqJbdyILybsKXdKx0J3lrTmyJlkuJzkzRl+5hwrlQuKV5LPDer1FzwurxzOW4XY5tBxhz4T7EoioJ/VKFJYMeVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y1ZmdaRG; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y1ZmdaRG"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48afbd2c386so3899478f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161695; x=1792766495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z8/Xk2PZDV84vw6TpgqIZSg/Fqm5aTct485yHDlUUv0=;
        b=Y1ZmdaRGgZVOuiIdORsh2qByqIpWxBsial3MnHrFiJwNkpEoA8RQHsqH+bCJ35aL7L
         sQOR0Zaa3zTGrIFNveuZvZjJKakabk0qmxQm7dVh1QvdnnLC3+fIMXA+DTJgGBaFHhpw
         7f0GHtd73oZ+x2XgBZHnxHXt1oUal2RrlAasxFgm1QsqRH4G1K6zPf75CZHmxDQ7/hLS
         wk6V/FvwWPrvGdetA2N+VDHoeooxddWcn7ljySkz1Wv+thAAVabeilkgX20PbNxRYb76
         s2IwQeJQ16MbEuY3fXsLMtHwdcFxqPytqBCb1+C6nni1jshE3xmjQgXD70X3L8OsBSJb
         4r4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161695; x=1792766495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8/Xk2PZDV84vw6TpgqIZSg/Fqm5aTct485yHDlUUv0=;
        b=FJXwg1XlZYY4YMuaVz33Yxain2ltk/4aERFL8g13hVwlDC7qel7Hwk5f+nZNdK9q8h
         iV+sxmFofSd8ALZRaaEBlLeiR70/De9/Q6WdFiFz1FeKaMyfEaJI5Wik6HXLTqFDQJwX
         Y/8+Lx52Ztis6TDGXs7m2HarrcguJNhDJ+cl1WOmkMMF/GcmoJWMGRz5bNQM7Fv5Eym5
         kdJWP8xv9wwL37oplMy12wwr8F4erEm3DAtK3/vNGkZMatZqjYxI3W8OQ/c20UFsKaBd
         BROS9ppRl5HHFMYPXPrwUBntIxBHAOVHXrph0yEvzcRuwPxHTEf3gRBLFiPt/yibJevb
         p7zA==
X-Forwarded-Encrypted: i=1; AKwUvBwJYjPOiVItGwHXl+gwBx1+8/jSFFA29KvxudE2+DXdBfWioDL3x2QQwon0u1zfi3hKrLFLQTmL8iYvqfo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/kymOtrbEUSbsi5YJ/gKghNeKpG2/QXSYycdxLs4X5ZsSMPG9
	bEMzd85hD7Kd+DX8WZyEhk0E0IwLJSjAc1lfnSggu5ncqu2izdQATnAnHtudTvwu6Ns=
X-Gm-Gg: AYBFou1JC8GUNDKdjyUPVth6cBDleIjrwTldZHvFZOOnTCnXKNvVs1o3h/pd4ZRlTEZ
	NfP7zunB0oDNnvR6RbqEF/r+FhY0hf48OEZVgYW9yHTtXNX+IAu6S0cMmDOEb+UdQIcvJxzeJbO
	/AMGSma1ubgg50eDhNKqIErvdnF3oE+KqW7PslOO6G1whqPzYz8+hKgpgEkqZuexVZ42pzUQ5GX
	GWOf+yrXx6VOxc/vu0WiPjUQjPBfryzll73JHlNfmRg9DrdAlUfx3yyfGXwVhdGkvm9vXmsam4E
	jvM+4nMwuniOwgvrNOTrSsIog+mnQj5cMU97TTedNHBOnVBAQi34HDpvSmA0ieNe/6irdt1B7G3
	7Zqh2NjcPSsnm913hE1OXshPAQns5vL3SxnWZbNPcLPLxaH6z3ydLcgpOdqH5FiYfiweLakgkRv
	LDXTN3BCJQj/W2kpEV5LUMQeU08XsSeGW6D3AXrE9OqAGJH2WBS/PfjT0ccPkAqvt7zpDhbWGrP
	kEvmH/+exGbSDRmgyOl4sZoVgnmVjpdcZICNE1JnpMG82j/TlgdGiMNCIAK6gxrcuUqOgw=
X-Received: by 2002:a05:6000:1788:b0:48d:dc6f:219a with SMTP id ffacd0b85a97d-48ddc6f2463mr32085591f8f.27.1792161694722;
        Fri, 16 Oct 2026 07:41:34 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:34 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 16 Oct 2026 16:41:25 +0200
Subject: [PATCH 10/10] ARM: dts: omap: dm8168-evm: enable MUSB multipoint
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-10-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=1428;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=T/OTFeU/v/eoDvotZ5j14Er/J0T6ty7EyR4RK8RPU/Y=;
 b=El6cBgAWcx1/Y1oiKVFS0M3auY1+K99qcECWB2yFtM7I86gnakEGU9Bvizfq9fy23L7kDfbMS
 ScFiJnh5fvIBHFd2bCgcrvsyWrFDxrSkC7g69bVRVa/PyuUddV23MyM
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Christopher Obbard <christopher.obbard@linaro.org>

The DM8168 USB controllers are used in host mode and must advertise
multipoint support to the MUSB core. Without this the kernel disables
external hub support and warns:

    musb-hdrc: kernel must disable external hubs, please fix the
	configuration

On the affected board this also prevents devices from enumerating
reliably, with descriptor reads failing with -EPROTO:

    usb 1-1: device descriptor read/all, error -71

Set mentor,multipoint to the default value of 1 for both MUSB instances.
With this enabled, USB devices enumerate successfully on the host ports.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm8168-evm.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
index a6d42766a496..4b4e4d850231 100644
--- a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
@@ -198,17 +198,14 @@ &mmc1 {
 	wp-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
 };
 
-/* At least dm8168-evm rev c won't support multipoint, later may */
 &usb0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb0_pins>;
-	mentor,multipoint = <0>;
 };
 
 &usb1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb1_pins>;
-	mentor,multipoint = <0>;
 };
 
 &sata {

-- 
2.56.0

