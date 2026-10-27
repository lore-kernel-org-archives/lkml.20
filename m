Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142352;
	b=VhndVS2m9r9reAMnOaZO2L1bD7wrevqwXyqGGUZWby4M6d+5QzXDvKXk3CS3PV5xLlrb
	 ZDJwTWZtPVx+qyaaRrIhCLH14H8elG51SwnUlvgYzv+nFJMsOdPblyvxEcTWxX4tIgrlB
	 0NaCy8oW3yrAUC1xBrX58UPeDNHapBNrC76RYXRvnXaKhdu078X885giDgxrvJlQVYegL
	 I3xzJsjeUXHSP658usYYuaA+yXnMgfjN1HUWa6y4yKFYBdlDGmgODVcLs7G9fC6xnlwUp
	 18K8D5NiqS/acn5ox/+fOG+06TDmXtJ1QibQDp1qvpLbEM0iIHNeHzy8x7fLZyItswA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
	b=eJVLz44OlQqHfqk3jmvathJ/0Yed/HsjHRzvN8ZBH2el++EawHppIx/MG60YIjRmKWcZ
	 7jj4ATCckTGxsNKVsZXjg5kuYNsvSg4dxK4uTQz31ByXR6TLwav4OnAl+u+ziY8c6l1P0
	 Dc2Yfo5C2L9SLeNVM5psDAs2xB4YlbSJq+ENEgO8vDHGLEn8daPcVV9F0NXbR9ZTyMlfr
	 ppC2If+2fTzbnuP9KsSnaRDUJHdTXnGG8JamHx12q+creLtdilD137a51SRZAj6GDuAF5
	 8nZltEpwkjezEWWSar+WSGzFQc9AJpypQJAtyxYVhJTgORgCjNpxEftrjZ8wkx45dhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BTwMwLy7;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F6360A2607
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75F6360A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BTwMwLy7
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-84621d8c7aaso194678a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142351; x=1793747151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
        b=BTwMwLy795IxvCyCky+Pk7z72sJK4KBOeoJ42+6BedLYvg4oYFf+UuIbuHZeVxfPV2
         d7qDMlLQwwJoUyXj4N4SloDAXHaD/sMxnFnnHwmGm5SGzsbOhk9pSkMD7+EJaAF2meNi
         ZglQOSlLrUTmTSi81d9XrdJsx3nUArwdyvaQvpbEBTKEVuFpX8bSgEu7zf4SpyPw3O3+
         /blqviH0NHF55bmYVE8NceW8P+/Lw26dSFz7Nh8NyTIn6LKYBUW7HbLtXkjvWAcLIR72
         CrcNuhoX55IZHiBPKv85D4KL4Imuphy9RddAMviJkZCMvYtFNbcXvcF7WtoqvSK+qCnn
         GP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142351; x=1793747151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
        b=MxWlUio/0Esqqjio+MlIzlHUYh3smgoUiEQh4BUzy+RUD4ahn0DCSPbge3Js/R8dXA
         0aYhu5jiD87mnoketjsbSjGax8y5N5hCbDDlFbL+/iK18B/eqnYuwMvIZHM+eVMrS2Kt
         NJh+eSRFgacxco0Laj1yKtcbp3BcwDsvy4AfQ/GGZxMm/wwZ0E8Bs1/+vYo0cH/R9Qa/
         W/vHyPE7f2F0emGLMhBDSaD0zAOxPDBJWtWqB7r6jrG1Ye7dxD7uDE1/IQ7AzAck71UY
         dNs4ELuiNfmZrF7B0z1jO+Rlnnfz4tA/VNtC9wj4c7Rgs8pqcLc+I8H2ujEw4BG8jfRz
         QOHQ==
X-Gm-Message-State: AFq9FYKD+lGUlYzZ40U/KaNqG2OoxM34vyArvGNlfMwD8NNmbR+MGYzN
	Htw9COottEo7f6z8hajolzKWZC9rZjzUgihymdXKKh0mowgShDcWPuPx
X-Gm-Gg: AYBFou0p+57nq1U+MmB/BDo7yd9GIyJ9tiCri8sB1Wu9nCx24Ozn5g3WSPx4Wc7COBo
	phm8TuEjoBNcyg9rLcL8EAiKxXNVlWKvm1Pn7E7yCSEJH0CuYHxwRFUkey63SSuMkDlTKtH+czY
	pr1iBk2pBvXQ7Ki9b+dl9ZPyAJ2ledcfU11jfl20FK6r9gmw+l3MXDhx8XMmMDCI/UVfIHZMS2R
	P0otgtOvSdhbeTTm50s8U+UH7O4cu7rsCYZscMjzptbJVR4Wg8MKqNkI7tsAsCNXGoiVlb6mytU
	IhNV9biwAp+7nkzT3sXeq97GnP6hhyB4yTcP4dgFXa1PDD4YzHGTuzPBeuuqJ/sL5DDnjeM+7/j
	S6EvrYLQHeDfhC9pYKTKcnHjhw7Of1XSaT7V8QniALiRDlLpxSDy5zt0laKepdij3KIzqVSyGtI
	Zjyw17sr9TD0MZBaD6IcfpEkcMb6sXHcA/rrRrCVHZnXNPMZpmKkBXSlL2k9dibOTgiZEv0qUrT
	tqIuAWreI1AOE3S12MfMrCY+CVRuZzb3UOdkEiG+5CW0uyxpi7WxOoZooHBgen1puMtdXi6NxRz
	HSmwvz22h3QcGyojMjJfs1/nvJZeN8pFt0UGkMcx2D7P4DzoIqRsrAi7QiCk/nxeXQmqvyzpsaq
	56frn9mJ6blGBGmFsaSSL6gzMHevFSwopcOgrRo+GHZv1duTct/nFw9MUFRa/1x0H37ObXyjCJ1
	s5uA==
X-Received: by 2002:a05:6830:2406:b0:805:8b7d:d8d7 with SMTP id 46e09a7af769-85abf964f20mr834577a34.7.1793142351612;
        Tue, 27 Oct 2026 16:05:51 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0741c9sm12093328a34.10.2026.10.27.16.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 17:05:33 -0600
Subject: [PATCH v4 5/5] arm64: dts: allwinner: h616: describe the UART
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
Message-Id: <20261027-submit-h616-uart-fifo-v1-v4-5-d37e018fd0a6@gmail.com>
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
In-Reply-To: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
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

Identify the H616 UART integration on each of the six controllers. The
specific compatible describes the fixed FIFO capacity, register layout
and receive-trigger mapping.

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

