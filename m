Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229EE47B43A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686135; cv=none; b=keoYxUKVeK6sKXKdm6v5YPlBJZ2RGhgWpHFoQbdTjrBox96weOzdXrENE2MAVHSLxgoyx7pJMnmrKFNay3onqNxCD9pHJfEkbSUHrEIsyNHGHr/qEaarvsFltxc/AThslo3EUorkw7qXCihkeANjGp2TWs+lx5QA7Z7OwmrkAhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686135; c=relaxed/simple;
	bh=wbHMaKaK45TOAQRLL1l/1fVGrxE2ehsU9nvptqFVQIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VY9rWJv6L0+2ZS207b02bp7hW+HyQTAodz6UQWBJ187vA7Lua3ut5tY0bDX5KCDXIhH9qoXXlBstXCh40j83I1ENp90PCRfBKa0/xjC/kHJU+Lcs9/DZg20Hdyi/IFebFWfefIYULQJE1oF7i9Kj9c/OSMnke848hsn9FeB/AgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTHJQH9y; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTHJQH9y"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885d4825adso2518267f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790686131; x=1791290931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bmzDllNwVcUBRIMWMvWOLZKFzcdqnhRBady0WsHfzZk=;
        b=UTHJQH9yNKhoZ5B5OR8+pB4xVQLe0MyaCmPxcrNOq51Nlf8VpnAD8jZMna0f/ayYdP
         D+ROwHuYmygaiiF55ndq4Ve3M3ITIzQlYBmW/FH0J2fa9Nim9zK5qfH3TPamqOLMrWSV
         4t3O/mtWwqMnPBd+UYPsuEyjVKM2kjIpYu/lhSpRCutzh7zwGz3xdzgTZyYsEzaf6Kce
         9bjDhEcdNIO4/gbBRDZCX/zSrcfAIfqO/sT4QuM2pKGniK+n7N1NBjLRcTfRlpdS4PTd
         Iyjq+45w4bfO8UHgEy6ClVSERyfL+vm3ShlcV+nLcUY4sxqFx4j9Dm3JzmBTLeAHzflS
         g6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686131; x=1791290931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bmzDllNwVcUBRIMWMvWOLZKFzcdqnhRBady0WsHfzZk=;
        b=l4n5KEIisw24iMn/GarzSYUAvu+BiLHdnM4Np8VV8bDW+79lbO+wXZEWJiaOYwEjOt
         iTLDtzeLbqstWnByz6FBvNsJnzZqTIdMwgdd3r5aDz9Zx9ZKGIbNdjXTMYgXGStI1yex
         ZU2iARE7bgQvL+ZrVsZc2rcHPrhwcsFuxdnVLGlzG6QeGk4X8EED/RlGI5fRvG5nDU1o
         CRqpEL+cT2/puRW60klixn8q+M1lNnVCa6UqEDVK33AdctvBzlGy/HsKicK37/ROCPHf
         4bN0ldpfFpEIPVQ7YM8HCzOtXI4/nfUNPhDyjc7kKkhl52QQua12lzaYiugKn0iVdKEs
         czTg==
X-Forwarded-Encrypted: i=1; AKwUvBxZndduqZDEuyPnTmnYW5/hrESbPszGtxsZKi6mV8Dr+hgY6xgCWs9d2uJK+0YtKWgzBzMnjI3uOyaIVlk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJzsT/fjJnr0uSIvl8FdUD3bzYo7ClLiN2QU8qDXHmKXaa+lam
	hISmOCSnXl/lwVhJpBINh+Ah3Ml3l3D0NiIvw7AR/L79mNo8prSdb7st
X-Gm-Gg: AYBFou2/w8B76VD9Lenm5TQHcw7BZCfv78kALfbnYi24++miXhKnUl4ewS8xX1STwJE
	Se9oiZneIJdHgSeRhpWNhQfubUqNVWAhgWmZEdowvQGTnb2XzH2n9FjeW2XgjMRdgiiWx/zqtin
	WyDC9Z64VKGSsSRBJESf8y66f/Ptxi01Lye9pUCYBPIsq4OOgZvir38cc2KPE2kBFfwFyUrAIAn
	cjeLzA5s148/9U3OUHWh5AEuPbd3j6B6c92/mUTTDaCYhSm3p9laietlWi7ePVvNDtSzM6v7Njb
	63dcsmAiXD4y4Rup+dGc0buZiXJtFtOnyNcXGBetnE5yyOBrOCLNheUYBMq3OzYGB+Yu0lVeJWc
	F8lIWnqZCjGNxOT+l2UwMWYRxrrcfb8AstCiJRy87cvgtCNp53UFHaGAtBLajJ2EVPgtsSSfysH
	6ZpzqiipoW0W1vI212yrpAFIeANDNVVyfB5gIiUvX17P+AT2Fd17uLJriYxnzi8GCbinMpUXfyK
	M/ndlxcxtFOEc4Cmh0OeJ4T1Y+a+rjpTOMP8jgmrlicaCh3uKcB+ts64r790Y8D7kZ9GzpY8oxA
	Ns1OoBMzSq/FAx111w==
X-Received: by 2002:a05:6000:310f:b0:488:8b07:f3f5 with SMTP id ffacd0b85a97d-4888b07f881mr15858765f8f.27.1790686131008;
        Tue, 29 Sep 2026 05:48:51 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af50abad2sm3439942f8f.37.2026.09.29.05.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:48:50 -0700 (PDT)
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
Subject: [PATCH 2/4] arm64: dts: renesas: r9a09g056: Add ADC nodes
Date: Tue, 29 Sep 2026 13:48:27 +0100
Message-ID: <20260929124829.237997-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add the three ADC device nodes to the RZ/V2N SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 144 +++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 175e24c98e11..51370f38989d 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -626,6 +626,150 @@ wdt1: watchdog@14400000 {
 			status = "disabled";
 		};
 
+		adc0: adc@11c00000 {
+			compatible = "renesas,r9a09g056-adc", "renesas,r9a09g057-adc";
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
+		adc1: adc@11c02800 {
+			compatible = "renesas,r9a09g056-adc", "renesas,r9a09g057-adc";
+			reg = <0 0x11c02800 0 0x400>;
+			interrupts = <GIC_SPI 926 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 927 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 928 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 929 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 930 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "adi", "gbadi", "gcadi",
+					  "cmpai", "cmpbi";
+			clocks = <&cpg CPG_MOD 0x108>, <&cpg CPG_MOD 0x107>;
+			clock-names = "adclk", "pclk";
+			resets = <&cpg 0xf6>;
+			power-domains = <&cpg>;
+			dmas = <&dmac0 0x25b5>, <&dmac1 0x25b5>, <&dmac2 0x25b5>,
+			       <&dmac3 0x25b5>, <&dmac4 0x25b5>;
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
+		adc2: adc@11c02c00 {
+			compatible = "renesas,r9a09g056-adc", "renesas,r9a09g057-adc";
+			reg = <0 0x11c02c00 0 0x400>;
+			interrupts = <GIC_SPI 931 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 932 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 933 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 934 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 935 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "adi", "gbadi", "gcadi",
+					  "cmpai", "cmpbi";
+			clocks = <&cpg CPG_MOD 0x108>, <&cpg CPG_MOD 0x107>;
+			clock-names = "adclk", "pclk";
+			resets = <&cpg 0xf6>;
+			power-domains = <&cpg>;
+			dmas = <&dmac0 0x25ba>, <&dmac1 0x25ba>, <&dmac2 0x25ba>,
+			       <&dmac3 0x25ba>, <&dmac4 0x25ba>;
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
 			compatible = "renesas,r9a09g056-rtca3", "renesas,rz-rtca3";
 			reg = <0 0x11c00800 0 0x400>;
-- 
2.55.0

