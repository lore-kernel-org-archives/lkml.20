Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740843;
	b=eAzUeVrQbgpjrX6rUOfHBPehyCN9pRr+yu1iyinT2Fn2tEf4igKZ3czIPnY4QrLzU3NM
	 116uxS8YVgKiNvTjpR2CB2+I+ZJp4vpWsUIeATkCVpZD2vtbtquR3B609JW9rbg+kgLaG
	 Ws1foPQRwD6VEFL/vz4XOABmhQCarpBUvflG75sIn4XZK9afG6Vjf9LHuokSDIdmvopNF
	 WkEL6VzaxZVmpXYs+J9sSoCWjdfkrhh4o2iFXypMioGEolc55aiYgu47rZ5wBTvnawsTt
	 0kj9u+0PFTq0XfdYttvTQ11sUikgyFHZ1zr6v5mvpiSkmGij4pDZqBw5SGYW6kMcMOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=hMLYY/97Uq9CVtG7QdmP7izisduGXF/upTM7pDvQJmw=;
	b=5ibapH804bhTU0ZXELtopXMyigI2suFFs8bX4ghCBibu0gL39mdJwTPq9koCMCD7Sxk3
	 tNPbInVas5oVY3350k2qwSSfrqMOXVFf3X1d+AuWDXQyoztyVMhYVVGaz1rKbwgednO4d
	 7s6b4+drCo31k27P1YpXprHoKR4oCwAdBYwsgwkECycwb0pTSx3UsYBJw2M8pnjQ1Fujz
	 P5+cd9nfWuaihVzdpS/rGIPZUOQp0Glmadfir70kzmDhY6r0VGoqeO5lNpABb32N8xo9W
	 KeV5Z/iXN7NLwqxoa9lq9Z+7CtEsE9uXbr1Wk6o+WjkdjfAxDY2nDenTLSqPxtiAe2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AE+5UgD5;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFB1606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CFB1606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AE+5UgD5
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4f14642adb4so312345b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740842; x=1793345642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hMLYY/97Uq9CVtG7QdmP7izisduGXF/upTM7pDvQJmw=;
        b=AE+5UgD5XLmund89M9O1VO1HJzardo2DXQUzwyptN++zcMGy12TXIXqAxCCwIvBzzJ
         Dp3S2aCqBjIDQhLAMjRR1ulBCzqKMiiAt5eTeaAvU3ky6iB4k+8lR5T3wQmcdUTzuu8D
         AIwf/du+/mq1+p53YUS7iHJSK2hPdd5Yj0ZJnjTvx+hxwSv39IsVwJYS+B9Rf0zZ7I+u
         nV9eL8e3upF+441sry0/P9AN8XRaJFlsoL7dnKjLnMerhUHWSPwErL2YRlNSJUscRnE9
         FP8KDdo4TpKlvJBj83bJgD33SXd9c/LH8lhMYe4U9b0njue1S9fvNQZjSEUJhqxTsKZ5
         zUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740842; x=1793345642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hMLYY/97Uq9CVtG7QdmP7izisduGXF/upTM7pDvQJmw=;
        b=Yr5swEtcfWWFYfWzjxbOWdWnJ/yu/LCltqA8E+iovbVEGlT+GycI5/YPq/cw4n7+fL
         q7pkJXWiHXDV8T8Bj/dm9EIGgrt4XkUzpulWm+3gLHUD7BtvspyQ92UhUJsZy7wjuNj0
         uKwWr6Lwbn/Z4Ty9XiFYEIZUvej5SwYByoh3fxh6Ei65MGB6DVx/X41Ik3VPCuzOh/kK
         MK/a6PAhT6JNBTc5tk+1F/IIpTzyd63gvOB1wWP78LACGAlWJZpE8se68dWd27pkee4J
         WIgnt81HOIS7ncbBopvbn35xqAyobqzdfjV1HOONqS2+O4S282CWuVqugeNDyWkqBmIs
         7LXg==
X-Gm-Message-State: AFq9FYJTZxXGvJGJsXLWunaxJ0izC836VNBKBGbwvMPalMsThbQ7q3QQ
	vRaJW9KCpLTOPbW0x1A/mAJpnsSzWXvSip+mCecgJ5Wk3N8t/pgArgn/
X-Gm-Gg: AYBFou2B0l13u9A6ozPWe8za8cs4Mgo7CZDV/CgORAVcEpsOQycd4K6LYOtWCEFkZfQ
	hMjVYiQbLpUkuJSFjYmKBcV7g4F3LHoIWFqPvPcVE+oIRs5Gat5CjD7VylbBoFGpoVcYTYPiOYV
	fX2cP7TzhueVrp70wGTS4iBM16DR7jdhcqnW+SL5sxIX1DDCfjSymM9QxUz8YKoubRtEgciR/sD
	2VHbOAjf5FXCSI8jDCTQYCwIwtQsIR1BGN5NVe0vhheOk+Awdl+vIbL0hRbuTQAj5jVXtNtBIAo
	PbavcY7sMxtk9vfGWqDrgWWaW7JtRUs6EXCjom/1ZQf2cJKG5X7zjWPbpnO9oK8Cl/wE59c+fZV
	Gi5x9VfmEHlkNQhcx9+Ber3AKgj8MmbdGvNWb5WzkgLtZ/a/hHWOE3PhsoxjRcV1fnEqaVEKP1N
	yT6E3flg1MDqmVrwRGBHEjJ1vHvBfypRf6U5WNKTsvD4p8DAby4L1CdRIZTq6cXR2QROdzkQBHT
	SL1OYkSgMfjooTHiR4oTia1E0BbVTJ0h4dSNpyyrqpFkQAL1+zGgaWcboB8+vB90tlRruBTNJdO
	j+4YSGHjTEGRK17j27jGn/qsvgrM45ZEnC76R8R3sEYHlwxMnF6xonGUYUdc2Smi4X91nG4+BDV
	E5lXfgVe0zg88Md7Ea5kejHVc1UZdeu1OPeKHV74SABo0CsHOTznnqngQtCFb9TxHcUHd7LIVNX
	hXRKA=
X-Received: by 2002:a05:6808:5092:b0:4e8:3707:d4cf with SMTP id 5614622812f47-55be7a45f4cmr859576b6e.0.1792740842142;
        Fri, 23 Oct 2026 00:34:02 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55be9880a99sm909562b6e.14.2026.10.23.00.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:34:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 01:33:51 -0600
Subject: [PATCH 3/3] arm64: dts: allwinner: h616: identify the UART
 integration
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
Message-Id: <20261023-submit-h616-uart-fifo-v1-v1-3-e4a3bae2eba8@gmail.com>
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
In-Reply-To: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Use the H616 UART compatible for all six controllers so the driver can
select their fixed 256-byte FIFO configuration and register layout.
Retain the generic DesignWare compatible as a fallback for older kernels.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 1598e86259ab..6905c9eaa249 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -538,7 +538,7 @@ mmc2: mmc@4022000 {
 		};
 
 		uart0: serial@5000000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000000 0x400>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -551,7 +551,7 @@ uart0: serial@5000000 {
 		};
 
 		uart1: serial@5000400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000400 0x400>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -564,7 +564,7 @@ uart1: serial@5000400 {
 		};
 
 		uart2: serial@5000800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000800 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -577,7 +577,7 @@ uart2: serial@5000800 {
 		};
 
 		uart3: serial@5000c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000c00 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -590,7 +590,7 @@ uart3: serial@5000c00 {
 		};
 
 		uart4: serial@5001000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001000 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -603,7 +603,7 @@ uart4: serial@5001000 {
 		};
 
 		uart5: serial@5001400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001400 0x400>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;

-- 
2.53.0

