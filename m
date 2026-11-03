Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742014;
	b=Cl1BIT54k7/d1tQEvz/Mnq4w5tO9arw+LMCy/IhzMUDA2DARr962+0PYE92UBFFj4Ws0
	 YIlk5TNkNVg5QCLwUwoGlCqKIAosIAfcYlVgLfGmb8X6+1DkD8Ef2VGzUthZUzjLZzO5x
	 ZAHVHI/N2cvlVv6qRF2YprdiKOUxweHYuapYrtm/u4gJMY/Ug8kgoxW1JMJJeUI3l0X3B
	 +PlsFJzx890FTuNlDOk1eYGP40NcYo0Lvxo2e765mcc+DSrXdUskwj8RYvZFo0laHe4It
	 hwoR48p1iHTHNHSke7ohL2LCZEtaDgDzf4WU5/APy4ichZAuTh+Mdg/aDr6IvA0J3iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=0g1OT4dACORpc1EFN+wgx+XwdWT726Bj1M4N83rR7xA=;
	b=IIDjyvWbEgRVLLSW3j8KeXEH8nXrfKeCC7geP/39oTO2I+fS9lqvARZfbce3IKR9RUC9
	 AE6ztUPbujWtbTCk14ck3T2nBuH7s8mxYBjCnxjls5Y5br+f7+4S0P9C3ui9G4cN8H0Ev
	 zjPB74Qkok+bPwp8CnYx7Ukz/ArMzMGmVcI1Is9wd7NX0iB1HND/SLE/O7e+GNziaSeso
	 G+X/qrOTi4i/tTPsM6oGWUUD22P6N9F8ZfOSKk7wU5l0OPscJ0vnO/WREuRL7v0Fks5OF
	 bdrVxy6KjCiHrQk6MeupQuNonZ2ugUFyiWn5zvh62iJbWYdnf8Z+IfKrKZElVGDR7qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h2UYIqFd;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF3F606EE82
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FF3F606EE82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h2UYIqFd
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-85ac281604dso20073a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742013; x=1794346813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0g1OT4dACORpc1EFN+wgx+XwdWT726Bj1M4N83rR7xA=;
        b=h2UYIqFdlkbGXb8r+nRW7RUmVcFRGiuDeXRFkUkcabOf2xlyGIjS5PP0NCfs0SA+aQ
         bXfoQ/SjRVyC6Q0jCOHP6+iH+xk5yrC2F3Z3McWUQ10v2Hnsb1owzVqSGpI8qwZKVj3S
         ROX2njaoYLCgQrLywZgtPhG0JRStcOR3l6jA2qDXpz2Qhgi9oncRmd/ZSznchyuUhtMg
         HyEDpsLu1esInU3k7O6wdgEHDnRTT6KmUc3oh3hc73iRE29kDnOqwwbZKoCkzzWso6nS
         r5CbirMIiHBG369IEALegsgH5pQ5qZmuJPDQONYmhlDIrqBubi+zzJS5SuGFh18wi6tE
         tWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742013; x=1794346813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0g1OT4dACORpc1EFN+wgx+XwdWT726Bj1M4N83rR7xA=;
        b=IRNQhMsIMRd5rHoyND3SXUB4Xc52kescV4RNT5tn3DURPXO17AlVImZ2Aj56x5oweA
         O0phToSpdQz+/ZC9Y2xrw3gCjberSgOllCzAgdzFskGzf2QvS/Dxb+CveLpH9QxJj7mh
         nDpCCcx2lnypb6ODOMO31HpZ1atBXVNDrnNrSm6+Qvi5OTYeWYuu0iDx3JNRYcScbgk6
         se26pqud+86GBMm5ufCC8wrO2dy+PI/RmIknTEaPloFJxGoZv3W3lAMeQFb1drticOdu
         H+FxVQs94/aHp6OuzihK5XMtIPvWISKLKKTKTmcFWRFYQtytNgEQkkoIPaAbW0x+WQWm
         4+ZQ==
X-Gm-Message-State: APuU4Z8KR3fC6ZEF7ahr6nNWmjDOp8q3GJQ4aSHvHUEAzg9YhxF54p6H
	A+iMc0QNl3qYpZK1BQjOFg6ScOwmgqOi2K2nLkwQb2rvtwokrzpJ2V9h
X-Gm-Gg: AYBFou3B1l9R+AbY4h9jFIfPcwTDsA/yUyT+VaY+D1Ynh1QzgiSXjxInKmPNCKS2LJe
	Rw8p284781ns7ODJHORUaE575TjIKAhLdao2AqxBvzJLQMJWQhcwLVsaxEua3LtRWe8KH9E93eF
	n8A+UIEmnA9/eF3T2oiHgI0zxFbC93XAWIwLjDQvAlV+l5Pw1VI2EJPEXhmYhzGtA/6+qxpihrc
	w8KsTsZRpY8W35luKI4pn0ZUu0flS/FBSJCxnaofE58V1jUKbPTlljolGMyPShtyUpoJlEXBThj
	TilenZjz10Dq76gnMES/+EmQ0mQ4fdAipPSyXtS6Vfl5qZNU8Wg+KDLedaodz/E/x+Jp0JJdqcb
	y5t/UWWGReLaQA0SznYOcuMMFmwbLTVzVWkgpk58Vd9nkmryHBU8ud1EPZia5bjOCrgHHOsxNUN
	x8eZYNFd/WzsFjkgkpDge2fD1CtNbDwIGFSvZmLcVxnKz2dTs7cR0mZzSKvsFFK522vu5VQ8cF0
	8/YzChQZzJltGpM3XzbiAO3UKMwH1uKYY4ALGdmvVkApG8il2gQzqZhF9X+5G6UC4BTYRUFVfro
	w43TYJSRvGgoxUGtfL+cgZ4BEbVj+zmVDE6zkU8ugfGHZkloFqJXdrD2VC2mv/7PFrEjvsMr7ES
	wgwFNazAsP4+ko3Y2LC0C6c0TjpK7v2oex07UtvD3TtVeCjPTMKjkQGMtgmCubRX8N2LMSIfOfj
	/gwMmrsPOzeSmAw6daXG9/U20wiLV5HfYsYZwyySpYJq8UvQPQH51M
X-Received: by 2002:a05:6808:6f87:b0:55c:859:adc with SMTP id 5614622812f47-5640def4593mr9802652b6e.55.1793742013486;
        Tue, 03 Nov 2026 13:40:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:40:01 -0700
Subject: [PATCH v7 08/12] arm64: dts: allwinner: h616: describe the UART
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-8-c9e248d685c1@gmail.com>
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

Identify the H616 UART integration on each of the six controllers. The
specific compatible selects its fixed FIFO depth and integration-specific
register setup. The driver uses that depth to derive the shared DesignWare
receive thresholds.

Retain snps,dw-apb-uart as the generic fallback. H618 includes this DTSI
and uses the same UART integration.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index c6b3a3f8359a..b4b2f85726e0 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -550,7 +550,7 @@ mmc2: mmc@4022000 {
 		};
 
 		uart0: serial@5000000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000000 0x400>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -563,7 +563,7 @@ uart0: serial@5000000 {
 		};
 
 		uart1: serial@5000400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000400 0x400>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -576,7 +576,7 @@ uart1: serial@5000400 {
 		};
 
 		uart2: serial@5000800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000800 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -589,7 +589,7 @@ uart2: serial@5000800 {
 		};
 
 		uart3: serial@5000c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000c00 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -602,7 +602,7 @@ uart3: serial@5000c00 {
 		};
 
 		uart4: serial@5001000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001000 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -615,7 +615,7 @@ uart4: serial@5001000 {
 		};
 
 		uart5: serial@5001400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001400 0x400>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;

-- 
2.53.0

