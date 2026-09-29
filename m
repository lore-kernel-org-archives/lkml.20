Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7D04F96A5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686134; cv=none; b=RYoFi+Ms6MDUT0qIAVIHUW8NjvBtpKoc3WuM9QrCPjuzwgccWcpKrefK7CbbmYSyPOgMdaP0APwNoEftBuboncZ884bpIoBCwTCgmrqApEd+m2TinDoN95JOopCCaPsRgE8fzcL5t5ekXs2vhIQDi4HUH5cOh0y4VrROwbSAAiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686134; c=relaxed/simple;
	bh=sodi5mo9+5hIVHzuNMklVU1zg22b234UU22ndIKPhl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KFIJ23oPRuKTL4Cl/c+BC79zSLzbUzi4tUVCc9epcPYvID0MwLqg11BeCszP4Sm8k9lyLJE/WzLkig6ZEz6SXVo24z4eqfktkhvf/VOz2KON8iw0RAYpeFUEV3tFwISu76Thz4hG7mm42tx1q49JYMn/PTmO2n8Dw4ilu9dhxlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ecVdvGLc; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ecVdvGLc"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b0219bso2038954f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790686130; x=1791290930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBS2cw32SoCGmB2dOwtN0oqVWveJEaVstinaAnXIBvY=;
        b=ecVdvGLct2ks37fQmwLqIKiJXXfcpVo13TtCumS1UbYpJRrRg4nETDuFt+TPSYqHs9
         qTjecNcGXmS+Atl4CiNFibuBU05u2XHCmbjHyonb+tv2cyhCl/RM9sDJgc7VXzrDbVMx
         MKoiOGQt4fJmjEyP/Ym7qEAUmYwCDaKAl6RnBxU/gZioAAhMnC3+ruA3U2FXZ9dtvaYa
         Z0/QyPiSXwyc+qvYEEB/y8lCc0eU3ROk7X85wvff9af15QqOg/mGboZVHurE8FKc8Ahc
         2Ir+U1JaRgSoj3iIx7Sk3q7UG+XliPkgKoZX7tXz1RLsH16Q6+8otfuf3SRE3UzGcvqF
         iAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686130; x=1791290930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KBS2cw32SoCGmB2dOwtN0oqVWveJEaVstinaAnXIBvY=;
        b=1dGFV/Kw/kLL+6bs7ZsSlSKdxcMwSb15xqlBkDC1x6YWbVkhULNGL23tYe5FeGWdxW
         tVH828BAgE8Y/2Vm5k6ce3x37/WRkVyNbft669L2cuCRkpIUD0pAQEG04vxGuGI26uj/
         yA6koKMbH66zr4Apj0wQD0v/AvQpqdnVJkdiU++jxprJJ4N41S715X6GFCYMwdX+QZNc
         iXEnV/C1YOGROIvd143PTjXKTQPiPYgGy2ivPR1UnmE2VI+hFEJ50wAtEBfMIaapg8IU
         q0P0xN5TXjjdkfyXIKpNUCAlX5Y+UkKoiAmsQzVHZT3Y/u+G2u5srme1XNgsxHRvs4S7
         KQKw==
X-Forwarded-Encrypted: i=1; AKwUvBx7gmWpQOkCfmG7S6JHmYPh67JOTi6xHO9LI1J6sWnkTjc2nmi7euSQs56qyPMFgHJV2U5c9grRAcENV34=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZgqDjtFm3GQx4q53z6cSgdeo94Sdm13FX9ZyM7Sjz3rzfQfQg
	a1fUjB9EYh6vuQJ3SOjCFNgEYLN58gYd00Rm4Y1QwD0IBbyLWho9/RLq
X-Gm-Gg: AYBFou2VW+sWI1DueejVRyBGvIMVKE9WDidspIqHZI0ndsJvD0vcu+UTyZnUAYXqICn
	BzUthcjgFCjMNSR3HxzKRc2sjyErZvITicP1AKhngkKAg45RY+6IKtPeMyxfI4F/Nqy+rM5S7Jp
	JMRoj0YENK6Dz64IhR/3eimFJVyKBNT9PWMnLar/hYWHhtRMelHlwqfn3ph94O//ksIJZGB1xTf
	+Vv9QdL0q8mNjN3LEnD60H0bc14mSyag7XL5dxn8aT5d7TYlLVsQ6x9pKTy2vjK+vb1L9ccNkQ4
	50MtcNeSmeid/5/mqubQXX0McdcCzQ6cIyg5c98QwLLUkSF3Oej5RToYTBcqTrksezk4uHqanw+
	bGI3t0AGlQBEd5ZLhF4gFcFbmbFRAB1oLzuAmTQs2FNZzUDstPrL7h49k2aES2Oq3XxSp+Ip2RN
	vbr0lruFaBBUWWptd2XXfdSz5NJxetcS+9D9LXiZmMx5Ja088GtDAeBISglOO8NVMpmn/uzw3lR
	gEPrTbkQdXoShElUCpHMvvrTLfGqJZqHukvOa+V7gDWIg7EVF7VJ0fJxPPvODNh67ryeGQj+1Uz
	fZ5tJ5mFsCWuHP3ZcLduhqAP0MuLUQ==
X-Received: by 2002:a05:6000:40e1:b0:488:5fca:a837 with SMTP id ffacd0b85a97d-4887da11182mr23608421f8f.20.1790686130281;
        Tue, 29 Sep 2026 05:48:50 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af50abad2sm3439942f8f.37.2026.09.29.05.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:48:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/4] arm64: dts: renesas: r9a09g057: Add ADC node
Date: Tue, 29 Sep 2026 13:48:26 +0100
Message-ID: <20260929124829.237997-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929124829.237997-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929124829.237997-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the ADC device node to the RZ/V2H(P) SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index bbaab75681c2..d40d38c6a31c 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -608,6 +608,54 @@ wdt1: watchdog@14400000 {
 			status = "disabled";
 		};
 
+		adc: adc@11c00000 {
+			compatible = "renesas,r9a09g057-adc";
+			reg = <0 0x11c00000 0 0x400>;
+			interrupts = <GIC_SPI 918 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 919 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 920 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "adi", "gbadi", "gcadi",
+					  "cmpai", "cmpbi";
+			clocks = <&cpg CPG_MOD 0x108>, <&cpg CPG_MOD 0x107>;
+			clock-names = "adclk", "pclk";
+			resets = <&cpg 0xf6>;
+			power-domains = <&cpg>;
+			dmas = <&dmac0 0x24c8>, <&dmac1 0x24c8>, <&dmac2 0x24c8>,
+			       <&dmac3 0x24c8>, <&dmac4 0x24c8>;
+			dma-names = "rx", "rx", "rx", "rx", "rx";
+			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			channel@0 {
+				reg = <0>;
+			};
+			channel@1 {
+				reg = <1>;
+			};
+			channel@2 {
+				reg = <2>;
+			};
+			channel@3 {
+				reg = <3>;
+			};
+			channel@4 {
+				reg = <4>;
+			};
+			channel@5 {
+				reg = <5>;
+			};
+			channel@6 {
+				reg = <6>;
+			};
+			channel@7 {
+				reg = <7>;
+			};
+		};
+
 		rtc: rtc@11c00800 {
 			compatible = "renesas,r9a09g057-rtca3", "renesas,rz-rtca3";
 			reg = <0 0x11c00800 0 0x400>;
-- 
2.55.0

