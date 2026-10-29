Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299662;
	b=Br2d/ZvRYQk5LyWYppKkGZXSnbMCR/3zmX1ueDKuaaEUDnmfre8KQaUD04VlmNaM2I+/
	 Ebb+sxyRQnNrRPTOAdrreweNo0irRXKNUT1hnTOxP/7jJ8JHzmqT68IcosBI4vRR9idkT
	 efM594M96qwlhiev7DMlXCWcUP8OdvQW5ZNLkAGogDWuido0Wa5z9ylHe5A2swMAr4k+q
	 mY+tdV27XTYHVnMMtIlHXIwTjlcQmPVEUkIiyXjfUkj/uuhRttXHRzjT9cQHgDgUYojug
	 /6CLTClhADVtWJlIl3m51X0z6qzBCh6P/iV2jSvpR0gzg011F9cWbmNtPrypepBGcow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=NCqbgiCveDVRhli2P2PmmtvKmmMz/nrumey9OJpxfP4=;
	b=bzuCsFu2b7oehl5hed1eABry2S5XL0VY0Uv90B5OPDxH3zO849jGZ07BWG26bxDL6Q9y
	 DPb1HW2uC3RTkw5OuJdEJASyrKR/0WO80fAGHmIhLcdh5llv9zptFWJxg7m/tflIlcbQF
	 Udc9B1xipuoHSo8BLnr1xqC7juuPn7+fZRELipfn61Bue/a4aYzaLI1KYp4sOMsINMVa1
	 YgNLkIW3X7TDQND8pG5vFHOdRNTUrURQhoHQ6cOnH8HZFQOUeG17FcpXpqJnlXZp3GuWZ
	 p+KpmQU/7pFS1Jtw9cDZFX/oV2gVpPKzrUxjoOCdTH4CB+Claqd6dPUZGVuG6hBMVsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mgEfCHc9;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765CD60A3826
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 765CD60A3826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mgEfCHc9
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-85a5455bd3cso1574134a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299661; x=1793904461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NCqbgiCveDVRhli2P2PmmtvKmmMz/nrumey9OJpxfP4=;
        b=mgEfCHc9QsNK6XJOqY/q5OKZuaLnKglqbASo7K+bPQqZoyQcG6lWwdIFZf/XSYB9j4
         cwOZaDj53UstQv4V2RAD3ngIfPQJ/F6nSJcBfUh399Skq2gmSaH89w7H/FvE0L3L/1wR
         5YB01KQs+CQJ+BxLiQ1vdkIQFzJLwllQc+3fa/P8yJNUEGwoNeoGis8mlwKY0zoU4dBA
         bQAWa3oaWYS5shZpNDT7ZDn6fZ8SVVYc+z7ZMYN43ala+9W94C++qbPUM2Q4TiOTgr3W
         aSkbvaVUBlS51Onu+WdJ97L9UbvICJ881cNT1HYpnpkCKVsMBOsnoo+X5FHwp8ittDiA
         iXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299661; x=1793904461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NCqbgiCveDVRhli2P2PmmtvKmmMz/nrumey9OJpxfP4=;
        b=QHZouW/cqVRWUnrJXS5yFL8SrPdXNK7bvoRv1xboIARw8w2xNjwBr408kQI6Da4XFx
         HE4doA1HzbZ1y+/RX/KYwG0uBf3jOluyI1w7cqopDQyjrsY/AH9ZnYdriiUVUDZTSZCS
         CC0pCLo6jDDridWEwBdqN5EC2VBQyyCzi64vVu9p/+5wAWdALTYPzQGfBbxFVBslY3/d
         Wr3G/uNnrqNs1DVr6IE3cxPGk2Jkua51OpDdAwUTWR4fLBPV/f0Iy1+ZuPewKNUNdEgZ
         cS6inpmuVnRQwRQlL7wZIsgh2jtdADypZBbX7E/A78ofkuW2FNzWnsMUOC7frZHodPwP
         pKOw==
X-Gm-Message-State: AFq9FYJEcRwAbcCG42VlL4P0DrnYdG8PjM67m4VvKzFiqwLl+15hnyBX
	vMUvvcgvV9P2KJqq/vqMouLqYrruxLmSEYUN9k6d0qr1PVwLSehuX1ps
X-Gm-Gg: AYBFou2gfVzQi4U4rtf+wj1Zk7/RQnZ4VeCV1B8AV2+Uoz7+wzVP+uv6XBM2Dyj3hQJ
	Ac9CBSFI6X0NffvWgAC8vdN7VoqYEwHrEvZoS7x54EPl/ULn16Od3Rc0aeQBcAdt5ndvqcYMiOF
	hvDzAb4hCUxXGlKA+VogBOdRecKYwhxLPgG4bfme+KUVSLiaMqCF6o8Un8ToPUeU/x8vt8bt0z4
	FXrC74zNk1dFqP+a0FgP7rXqz7EYn2huimxoJ0w0GoXbYGQQcS6EMlPzh2uOGua48V0DzPwfkfp
	HRyFZnmgol6+Z+vsLwnq9zHhF0kXVAGo77HHTR6ag7obAfpJfltVLZ9Kfi7yNsQwcbMrHTSws1+
	Y5pfl/4wZfYmjtmFmkk9PbQBLtp6TmRUY6/Jc2Qwycv+VNDJMgYEMRofV7wdUks8JEG8dAL8vh4
	EyFB9WcG0CPcczoX31KRJX/FjY9GHQHtHqk3oxDtVOFnOMzMs8mtrfucIzHgKlbISXAH37bH+HU
	HkUGYJrM/4BsqEuXKOzzP1gf0omDxXRwTW/MEArfzJ2iMe4VcW/QODss+9hLRILIvvZ7EeLS3bm
	rm8XceMi2mlipzkeIrsSPsHME2ZdbLmwTEOLOhC/GxPGe8fC3SVn/zY5zgP5VrX6+W7jtwpspvO
	fPzYUWe8ItmCHV8krKhE4poYWME8nuxSAZWTA+eafffBJCZXxg7RRkKWIpTBOJqMXL02nuLUGYC
	pXWpTJov1ym7JkvpK2RiWuQfYGFG0t2pwBrR+KFgC/67/LE/AkKbU=
X-Received: by 2002:a05:6830:438b:b0:822:a76e:95c9 with SMTP id 46e09a7af769-85d364642f9mr40665a34.14.1793299661366;
        Thu, 29 Oct 2026 11:47:41 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:29 -0600
Subject: [PATCH v5 8/8] arm64: dts: allwinner: a523: describe the UART
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
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-8-53b433aebbf8@gmail.com>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
In-Reply-To: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
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
The specific compatible selects FIFO-depth discovery through FCC and the
Allwinner receive-trigger mapping. Each controller supplies its own depth,
so the same compatible covers the different FIFO capacities.

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

