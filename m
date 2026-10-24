Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873361;
	b=U4xmR4c0YHLhnjqj6C8Ubj0i/BgwAdd2yj98EuSSlyQstMgxGdmyGL5wHRJcg+UzhPiQ
	 NgZjnUcubFBv0j1yk9n4MtT6XUU54Vy6aSqAUMYdQhTNliOhVV8fQbqq7fcwqSWBS0JLu
	 4+P8G5K+KlQmcht8TxESrY8d24NT9u5W6Sc6zfG9xW5BS9EeGZsZt36NAtL28O0B7eAX3
	 F6nChJXGiL5OvPKoLrHOCDo8AqIhRjbszPR0tOABk53E6AHAAvIq9XclAtPv0expF/qYI
	 7bPkwLazC3+lhZRNuBCaoq3MTTH+0360Db8hAX5Vlmix1baH4unH2rqfIfIopq/0R5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=t3d25DrrE5qm1Af0idWzUzDlmbOi3iKehZeUeGURamQ=;
	b=C/1VN5K6wHWQdXXfScwcAJ49JlNm4czXxf6va6X28uDD4EJbZTPTHryuav/9jpaXEqDI
	 lSXTOo8CeQy7t8GcEx2M+rz81WW++6vq4Z9A4j6eLjaU7TyIvOj5N3WPGf8fqe8kLNkIc
	 uL6Kq7FMNmrv5k6ML1mU2fS1WNzvY4H8GlyD60BPq4dLceLPeCF5UM5ldh87QqfZ11BBo
	 MJvQhY6ChoSP/5vB+BcpDlN2PY0SKm+dctJSlysZLj4bdEfixkvCI0KwASVR+LH6s7XI2
	 hmL3pEgH1wK7AZky2BQuRdhEhOzFN2ltc7FiHviKgYN+nvOt+V1rUL+8E3+PIF7LqtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WqIcS2ud;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E5F60A262D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9E5F60A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WqIcS2ud
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8490a7d6696so1074699a34.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792873359; x=1793478159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3d25DrrE5qm1Af0idWzUzDlmbOi3iKehZeUeGURamQ=;
        b=WqIcS2udx/nWAIpBgI4vxk7+jeyYJyEKEUUbPHZMbidORpLmfX20J8MT5vR9cEYmT4
         eYotdEVxMHfsys/m8CK42JgjE5ZWjOIsOAaPlUyF3I2oX886MgwO9gBIUo6bfkL8GU+Q
         OJtQOwReWnUrS8H1JAOn6P9Pi2KLROVObWXr4er0eZ63hJmEhTjnkR/0V9EDOXAChfJ9
         Akq2ncoTCcS34x4OYOQB8ram7ZRRBO6PhTB7x0jeGl2U/evir3RLVFr+ZnrZ75gzMmSr
         dflm3u/d5s2sNKmJwzIcY5mS4EHWb1XkGpPp5qKURt35r3ULutEwG1h3VpxyZsAqtepz
         d4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873359; x=1793478159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t3d25DrrE5qm1Af0idWzUzDlmbOi3iKehZeUeGURamQ=;
        b=sDHEeuWj0gmhVvOWTBg8dw5No1c9AcYjZjJl/BJ1tuXbRsRIaBeOouUfym8YTRZrod
         o55cXDrSSod3aN8cXU8yk/9ZmSTxqxrLJqz7F7q1H3TQQ/5SIZiTG659uoFS9hEV8NuD
         5CMXf1w5Jsu2EhNc1PUHBeMXUJem4u37T2mWDhnG4Dd3LwPGTPNhjYo62IGgw99anvoe
         HN+GCr/MljBqcZ4TpO9MRtSLVvP0TK0peb14FI9L42YCvxRx8OVYNG+QVKSe/eZeCfjq
         v+2CjCC3irw0aD6/wEq9twX6ZWud2EUf/rjLhZLJ39SCZ2jaZjscLJWFAuXsR0WWhPEC
         CkBQ==
X-Gm-Message-State: AFq9FYKvNoqyiSsgZ7jlmZUpf9S/mtRHbBJjJm1GKc36ZvLPlPTIyS0x
	7FpsWsubORW39ETCnAoAzbizmufpoN4BTuKxcJOpp3RKg05fOU/u5Fae
X-Gm-Gg: AYBFou2dGB5cdXjDzn3jnzlaOG5mLEABRzJZ78O8C8nLm0puCUPkvqse/F8KoI9jQpF
	MY3pU86PEhGifBX08avM4g+gWoWRNBkvyRmzJi+oDRsxFXMh7YiLqrvlgBZxcLckN2XOL0Q0sv9
	ZNWYien/QoHLMQxGLAk8jWti/t5iX4kKJxYC6cuDWSUMrT7dgS5I8yK7+kjplXxAGBx574C2Tfu
	4GWPRxbVu+4jUMBpTZOofNjyW823jXClQ/hVoD96JuwwHNIWA1Nux7qp7qJycN/VdEUYhT+greH
	vJEk2WnvWG4lENp+OWsSJQ7ZQAfHKc7kZlcIFuk2Sj8uN7gkc+ux656peUycxYbqnQ/NYsCKQqp
	1xqxw4qqpvFDPZOn0YHEMyd25YEYT5s7Cq3fQNHVdEaPIlOHFooY94s4GVyQY711qIADpV8TOky
	pB6+5ReEStYpg/6rq1A3zbbkQOLPNiaz1MqNJ3FByQsjL8U2hGrFK1bXSByjtl8mkcbSxo1D2+Z
	iGn1Y4ghiR/7k+7q0gXj/t4fIdRcuOMw5jh5ui829e9QipsBv0RhjrHlHA0gLI2EFKPHxcW8jrZ
	SGfZKo07zneUXUDeZoQ9Jl5DKW9+eBL+tnu/+q/tSfvZm7334znXiIXyRRCeS6Th0MQXbzRYd0D
	qwRPcoc90pDaSYIQ3SJnfSOnIQktGnQocUxk3AitJ7AZZvSZ6LTqtkMgTpognjqrEZ11jlnLddk
	WU5J1nbG6FuPEkEfTnKp3JEw8/
X-Received: by 2002:a05:6808:3099:b0:4c4:8ace:cce8 with SMTP id 5614622812f47-55bfff7e006mr2363837b6e.8.1792873359652;
        Sat, 24 Oct 2026 13:22:39 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424775dsm1815063b6e.5.2026.10.24.13.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:22:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 24 Oct 2026 14:22:26 -0600
Subject: [PATCH v3 4/4] arm64: dts: allwinner: h616: describe the UART
 integration and FIFO size
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
Message-Id: <20261024-submit-h616-uart-fifo-v1-v3-4-286fc1b8c3c1@gmail.com>
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
In-Reply-To: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
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

Identify the H616 UART integration and describe its 256-byte transmit and
receive FIFOs on each of the six controllers. The specific compatible
selects the register layout and receive-trigger mapping, while fifo-size
provides the capacity that the component parameter register cannot report.

Retain snps,dw-apb-uart as the generic fallback. H618 includes this DTSI
and uses the same UART integration.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 1598e86259ab..a80f26ee0970 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -538,11 +538,12 @@ mmc2: mmc@4022000 {
 		};
 
 		uart0: serial@5000000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000000 0x400>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			fifo-size = <256>;
 			clocks = <&ccu CLK_BUS_UART0>;
 			dmas = <&dma 14>, <&dma 14>;
 			dma-names = "tx", "rx";
@@ -551,11 +552,12 @@ uart0: serial@5000000 {
 		};
 
 		uart1: serial@5000400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000400 0x400>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			fifo-size = <256>;
 			clocks = <&ccu CLK_BUS_UART1>;
 			dmas = <&dma 15>, <&dma 15>;
 			dma-names = "tx", "rx";
@@ -564,11 +566,12 @@ uart1: serial@5000400 {
 		};
 
 		uart2: serial@5000800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000800 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			fifo-size = <256>;
 			clocks = <&ccu CLK_BUS_UART2>;
 			dmas = <&dma 16>, <&dma 16>;
 			dma-names = "tx", "rx";
@@ -577,11 +580,12 @@ uart2: serial@5000800 {
 		};
 
 		uart3: serial@5000c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000c00 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			fifo-size = <256>;
 			clocks = <&ccu CLK_BUS_UART3>;
 			dmas = <&dma 17>, <&dma 17>;
 			dma-names = "tx", "rx";
@@ -590,11 +594,12 @@ uart3: serial@5000c00 {
 		};
 
 		uart4: serial@5001000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001000 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			fifo-size = <256>;
 			clocks = <&ccu CLK_BUS_UART4>;
 			dmas = <&dma 18>, <&dma 18>;
 			dma-names = "tx", "rx";
@@ -603,11 +608,12 @@ uart4: serial@5001000 {
 		};
 
 		uart5: serial@5001400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001400 0x400>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			fifo-size = <256>;
 			clocks = <&ccu CLK_BUS_UART5>;
 			dmas = <&dma 19>, <&dma 19>;
 			dma-names = "tx", "rx";

-- 
2.53.0

