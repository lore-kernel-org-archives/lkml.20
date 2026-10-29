Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299659;
	b=zy5kRa5KaKdwbd/SUP8oLdGxBILwK7m5QmXQc2aqbaBhM3ZU4pLCwMXl1bjLI+5vZKDb
	 7xJklxIGnFHzw3LPTs2Gh8MLL3IGP1SAlASUsuoDc/YqiY9lq2+DPWMezJXWWU10SDIsX
	 0MpoUKGPnsWOshm3/mitrs1PM49vMEcttCVVqP6WXQOm9ZcIKs4MeuQnHdnIUKvI/zwfb
	 NFi7vH1l+W9XUlAb1/zBEimATzkUj9iIflF2jfFm81PhrKoiPkCRID60O4h0cXBlckv/1
	 bDaQLiHXhtjT0iHhkJGtX1kYLn9ZO/ycjo+NLNjox6GMaZ5hC34okC8qMzzz7GgRy2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
	b=ZPd4W80POO3HEpam4aSJjKXJAwv1pwzpoE1Cd/In1PUq8tpt5nYETIeQx50eYv7GzyaF
	 DMLS8vkoKUpWQmCtK30o/69g1OBSu8YrHLeByo4FoAM28x2/XlRayv8+c2E25cLo41jns
	 fpDz8SdJib1lrp5J2j6M/Riy8cMqHkggEn4VoJzqhY02CeSLT/aHs1fUMkTPPD8SlAqVj
	 V0/6TN8s1QOFpB7Eer8F0i7KQgA+sUbccIB74DYEmOhXcwhv/NLxBrXgqIy9AW1ZHpKkk
	 l2xBelZVe5HmKyHmxkTDTxc9x+lafHtDRLkKYNsCwkh4v3Hqe5AxUC1fN0AAS2Hp3xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hXQJRQj9;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752E460A2621
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 752E460A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hXQJRQj9
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6d68de53053so1294233eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299658; x=1793904458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
        b=hXQJRQj9rDCCM54LxLJ0O0GcaUqZZ1vbaf5ccd7XzTXCcm8o5nGy6Yj3i6MRM2zDbs
         Tt/NJX9+NBWqKZlukA/OBfyPR9mRBJOoBoljBFdXLsS9JPCZLf1a9mTy1FHcgcPrTbqa
         TQSEbJo3AD7U3WXbfzRQmvfJ0g5CSN2ixjJPG7nxPDJ7fhItwAHIZqA2ZQW1hKQ97XyJ
         PsQIKLyCbU85mm7xGRHOsZruQYUjZJk/rFe3agJ9uS3l+4VtC+BFK1RP1lx0KdiQGpR6
         SYDXeEH6YhKijleqGgsdlQs6Xh1Icotrg14Ukr6vyk33OZiok526+TaFA4MegRsvIjma
         +gJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299658; x=1793904458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
        b=SIPeYaXnsGSkHbiguMSfTE0VhqPaZG2hNrzwAw6FKboL5e68rJRMSHXY4PywJOLQEX
         T0ivYq8wEQdW8Y2OLFicXKvSF3/qHJdO0LDf5l/PNGWFBNONqUZxvOJcRyvf/JU3kNYR
         D43zHgvZ5npcqgNNgDvJNaY3DUAr4kL2ZYvdah98rqmzGqXW1ayNOHL9P31fdHBU0j30
         9Oqh0Mc+0FQU2WfbxghWeD+j7pzOlRlSgVPqgt9p3tzkm2nBf256Izagx4dgddJWcj02
         cJFXUSNjrCGPK1iq77MISdW1uyali4CSIRxyELpkN8Xx2rxNhtzZ7/dcxXw372scVQ60
         AnOw==
X-Gm-Message-State: AFq9FYLP6A40HuA843jxuk0GmS6yqetx6XZfNml6xZ2wZswrVYReERO9
	0NiCZFBQFfDG+gl6ss2Bny+SlI6yYsQq3ycGv1HHebi92cuYLs4C3d3W
X-Gm-Gg: AYBFou3cMjmQCBhZXSrcIdPOkHiRVKo2xkZuVoYSkYQs1hejmSMNnB25+S+QJh78KBC
	ic/tDsJ6pzDzFF3/uox7X4sN9ZtX05cmcVx2zykDZpNHBgubMxgLrIw75cwhNiKb4lKFL3Sma+w
	vvr2ScApIZci/a0JlKuA9d+Cv1dMpSegyX8lgzLuPDfdHAjWoVop8EVfrM8Q2fkwIL+Lyb29TrA
	vXmeO9GZyj7h8v3dAAryJjT0PHq9kRojFCtY8tWAOAUderx3GH9tnMRfHeUkYpk7PHJUWtiQtOe
	25kPmQxaAceLokMjTt2X+udodVrAWK9W4yTIVtMElxnIiJ+RFtQjy9XSbcKyQvQauoj+7M2SiBS
	BfNY8PvCr7WDDcsXhIWRSZTAL/SysXWBwfIZgCZ+YW6DtqrtcDMuOpS5T07bcr461UZ/zfJqk1Z
	HsM5F7RwvDeFT3KYMj59H1Hs+tZL1atcaLh3Aam2aYo4k4gkIC42spsc4/pRGAmjj6Ui2jIrjP1
	txR6zQuEz6nTlPwznh6EgLHQnHjrlP19FSmzHM9Q04lRIIiimQ58n5zPilcrlCBdSsRK0z4l78e
	95fYHY5R2W0CyFoO/+gcR8xF2W889RaCFoLVexzW1NbiqGKU93QFBG4pAG7ULGEmrzPBaCKeQm0
	blx4rbFKm34kJKkSh7xsNQ0VoOJdXTmCfGFqtPqELkjQfLJE1utS1UTbXCme7SCwixnd7H6CDXN
	zVDDK3p1b1JvHLuw1hYC2YlcOuaCCgcePYW9dISw4hCgNuI6OM2gqJTsbXKXUSLPVW0Ep3k8rh
X-Received: by 2002:a05:6820:c44b:10b0:70e:1dd8:6712 with SMTP id 006d021491bc7-714f29f3ee8mr66212eaf.72.1793299658351;
        Thu, 29 Oct 2026 11:47:38 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:26 -0600
Subject: [PATCH v5 5/8] arm64: dts: allwinner: h616: describe the UART
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
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-5-53b433aebbf8@gmail.com>
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

