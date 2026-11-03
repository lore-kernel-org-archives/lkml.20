Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742018;
	b=BIyvMWHYLjWBUZ8U1IveBx2UNQ3YwHcbX0nTByfHe42mSMLO2clHAHZq50Hq5I0g234Q
	 70tFrXKEwI9Sduylaj4SvjUBTD2Aiv0XkWazkxg1datMho5EUTbQsEM2PPa8/j6Y9VHeQ
	 +IvFpEO2bGP/bUbspmfWdGjdRy5qjvvV8FovYuItjwMJwgnUJHTbc5/LKkrNKdFDtSBAw
	 G5koHsDWIZ6KdsuSBm7XeAUVfeJ3saIMJjXrttuLf9VqtSpRmSSfDE1sgFdhGgYNRPvSm
	 ICkN4YlquNT/n0rHl2+qNZTEx3RSqjJzQBc3Bh5BQ2pccTtcatLGiw0MPjhcEsngKgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=aRqQDgQhXtc2io8t2nwzRELQbWhBlZAnTMTGCqc8nfs=;
	b=ZhuI7a267nGjnR7ctUvHMprL2+wlNMv2gMWVtaF192QSOzwAqfp2kdgjZhoouye8k50x
	 EXZEpoSgJo/7ADxH0fvtMI55/3YA2h1vskqgySARAxmDhaIAvITKRu4Sh6LD/5nss9LoU
	 oZ0v9KQHPFdiDw/iZ6qku5uSJtYTdxOc3oJre5lzPQNGQ7phFGS2s9x7P6tfHdV/xUnX/
	 Y6uS7UQw1qjnMquKcAv+PdVw9ESk+q4TA0hr/NxZ5IqvYMWkblBt4PXr/cWOkv4MIOa/C
	 QylXxfZIHsxY7crF9o0XJBaI7244R+AVQc8y/NhpSd4oTxQASJvtxnb7nvMjlQj5sPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=furl0n9h;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1A4606EEB7
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E1A4606EEB7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=furl0n9h
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so63518b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742017; x=1794346817; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aRqQDgQhXtc2io8t2nwzRELQbWhBlZAnTMTGCqc8nfs=;
        b=furl0n9hv3AfBCJWZBPeQMseF/sjLJddQ/67YYA48n1IV+Qkk6TDED1J5ac5L+sWU6
         CHOlDo7v6NSLP5LWMIWBimRrEkQF/bs/Fx+GFiN2jzzpNZAhq+PY8cKbkNMt1xPNPkmY
         sAe0/PoLMwy+25KOqOGNcoZu9xnhOC6uM/o6/XYp0dijzFCr0bFs+293HK8KowZMTXxr
         09LHP+AMCkiwHwWAAoNjgvTDnpWfQJRzWtK+PfbknEq0uc9my/fZxYDTkzWTMxk2Wxq9
         HLczZoMwKvVBOU4MVMpui0Qomvggyi9hk+RceG3kG06Bx0/j+ObaL4W5LoBi6S63RsOU
         8UmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742017; x=1794346817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aRqQDgQhXtc2io8t2nwzRELQbWhBlZAnTMTGCqc8nfs=;
        b=sOzI4ZVTBqzDrElAjuo/aH/hVj9LsqNC+PPtO/cUf0zDPrKi18lBrk8nycc38w3WT/
         Acof6KmStRU8Ozg/WsIto38vK1FY6ukDGjAe18Vjz1xF3AAR0c4ga+p+7Uk/FWuCY6mR
         4Vl1jpgv4o35t13UK/PBQkJioyqvqYdkYhhDPbXpEMuIcKQw3tgkzypo77WB7Tl6H/jr
         f+ioH4df89+mY3J9DGVsYR61M3c0I36/z0vDyUvrFrQzxJbCKqbE2QPjJ8n53EtQTPUJ
         GALNL2bbWU+W6ClmAsOnv8rBaaU6/Tfucqn2VDQnhrt9VT5Al+kUoO4RsuCFxD0Yk89I
         M2ZA==
X-Gm-Message-State: APuU4Z9wRFTE/SZ0NzV+iDias85GAVoDeWEORBbn3nSEKtkfeFoiZ6m4
	7iQD5XxZX4rbKa1SclTsHYIqkvU4YayZ8JSGgyD95aZomCXPSZO5r1e9
X-Gm-Gg: AYBFou3YbHmmu36fEOrbODMBopb8bstQqyeJblCFwHuF1ilI/JDsNf/Bhzbt3joZUe0
	y8LJw7UbXTNJowM3rufPQEt59RVyeuqJVmNRab1ECKdF4impiziN07aKl4y3J+flXLpNbnk2XwU
	9Gf1F6ETG4hmaDj3OFpmNjpnSRZ5TYZPVKS4eRkCAaaut/BPPBHWZgG69N3+uTdqBGrncfn8ryu
	caKjQ3nkIv8rqID7HLI4P2IyuZbvJNFgbZ/RqbwRRw+nEyldcwV4Dizw1B3REvNyPdgsrg9msqH
	1VR51HyxGiLdoFA1W0ER0YcNjCfCPd3QJzxFoUsdAq9/Oa9gpuLd1+0B6IPlk+Jc0TdvyHKsGJq
	LaR6wD050WjOh1rVyslndF7HI1BVpbhUZTKtjfAFji2ZGrRebGZs9td5B/mTs8C4Im6SZihlw56
	D0Wl76eL/jYIbQ9P1UzHUTl/c2X756w6ynVHlIGiL5tD0tpbluh02cQWJkpD6+08q50SvhjYFUr
	HF8J0fmUZ2JbgRu9/2Vb2hNQc7/EsIi025w3DuoFeaOU4PL4bn0lg1IloWEDwvZf/EaF9jkRV4S
	B1N1yuwGlxT7zRIFoDvG8T/445oxlgRvL6EjhQzRCWs+XlETD8dLV5/WG7y8z4liRsobWWfKzi8
	00UfD/V0+5AbkzA1uvO/d9zC/WaRdirH7uJmln24NbV6hWpAaDbo6OC88kyT7W2ElqxHvmnMKBb
	YqWy9tMVF7vy/lgcAfy0JpUeU9/WxP6Rnw7eEuwabtAti2dZPw9mIe
X-Received: by 2002:a05:6808:66c5:b0:567:605a:b8a6 with SMTP id 5614622812f47-567605ac3f9mr743665b6e.41.1793742017040;
        Tue, 03 Nov 2026 13:40:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:40:04 -0700
Subject: [PATCH v7 11/12] arm64: dts: allwinner: a523: describe the UART
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-11-c9e248d685c1@gmail.com>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Identify the Allwinner UART integration on all eight CPUX controllers.
The specific compatible selects FIFO-depth discovery through FCC,
allowing the driver to derive the shared DesignWare receive thresholds
from each controller's FIFO capacity.

Retain snps,dw-apb-uart as a fallback. The common SoC description supplies
these UART nodes to the A527 and T527 boards as well.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..23340b9f58cb 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -390,7 +390,7 @@ wdt: watchdog@2050000 {
 		};
 
 		uart0: serial@2500000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500000 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -403,7 +403,7 @@ uart0: serial@2500000 {
 		};
 
 		uart1: serial@2500400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500400 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -416,7 +416,7 @@ uart1: serial@2500400 {
 		};
 
 		uart2: serial@2500800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500800 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -429,7 +429,7 @@ uart2: serial@2500800 {
 		};
 
 		uart3: serial@2500c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500c00 0x400>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -442,7 +442,7 @@ uart3: serial@2500c00 {
 		};
 
 		uart4: serial@2501000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501000 0x400>;
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -455,7 +455,7 @@ uart4: serial@2501000 {
 		};
 
 		uart5: serial@2501400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501400 0x400>;
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -468,7 +468,7 @@ uart5: serial@2501400 {
 		};
 
 		uart6: serial@2501800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501800 0x400>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -481,7 +481,7 @@ uart6: serial@2501800 {
 		};
 
 		uart7: serial@2501c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501c00 0x400>;
 			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;

-- 
2.53.0

