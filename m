Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395246;
	b=MQvaXOXA8EqiIv/lrZAXUUR3oOl3JYumgpMd2A+DCdmhiCQPxejkatwDs7uJ34X4dzyL
	 x9zinw4zuPcK5oHb6KqDw3Yexy9K2m3LMgSJ00mj8i6Nm5z8ynRR52Q0HIRPbCuO53Gsp
	 PB/YMd7YDQIUutpThnWBLl4JzvbZZU/8Xbktx5cNMMUdNN4FIC9ocAgjRwmBUtHjCUCIY
	 DPE+iItdN5NEJs2Z0fWBUGS0lk/DYbXbsTBz25UKZe2XKMoNx6nHvD3MQdBFujn2XWGzI
	 8qvsRoXXW98QHSajrz3E/9KiLRfAX9aZLyzctPdTUaZbJwQBg9yu3CXHtiIBiiIaC8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=1DKdyJESssw+eqxRBb106Pb/gP3e4B2hJY3u/Tbu8Oo=;
	b=gUHDbqxA1V2UkRqDryoKZ6pdiYW6UWd6FWdHEfT6lmDucpHrbEiJ/oLniXDsJOVDk/Xp
	 xxPyCC8o3qYHnJXthD2oGEsKpkVVe+wzE9T+rVhTC3/rbca+0/nhQq9y2xtVMzIbhTyle
	 u2zLMIrBrwoNU8rBEV6v9KMfmwzD88gvoiumklKRUUy/vJPjVVq8IqEYbwAGfM3botiVQ
	 7veWZFBNaV2n7oD6uhoBXqjaiPpBGRKFMWLbfIkWOddwug/cKxU2ntxuVgmCJmk+LAQmd
	 ze1hWYK5IHblj47Wm44vHnP51zjOe1G12/z56jF7K21AX7TLwnZIh/xqnhDZEVXFIuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hZbazZ2x;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DF3606A898
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70DF3606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hZbazZ2x
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so38583775e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395244; x=1795000044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DKdyJESssw+eqxRBb106Pb/gP3e4B2hJY3u/Tbu8Oo=;
        b=hZbazZ2xx1xzRrcV2f+dFJ2skZ2Lu5V8v37Yd3xAvwy6+zV3qt9jdA3Y51aNt8JDqm
         GB3STnUMinZtNkXoIyPF8xoVeX97EPsffn4uNE82NmBLDRD4aP5P0ZdqCIqzlJ/po07W
         JI0EJTonArtRGK/2hss6Oy5v4S0jOZfaQG4TF/mDN/CFY0IUR5kvAJU1SzPUgqgyhOSt
         1AlzMu2GjwleFEAw7pmj/Gs27zS2/hbN0O1lLNWiU90tiL2wehYxPCWopVqPLPevXmeX
         pTkEmOetKS3TYYcbXr+IiLbI5czzgttJSokxjR9OeQetqaDWVkpM82qBMB7cbSQi4Rof
         jAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395244; x=1795000044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1DKdyJESssw+eqxRBb106Pb/gP3e4B2hJY3u/Tbu8Oo=;
        b=wOc47eqQqBq1n/gjbgpimL6LQwTDyh5ubImo/Te954yt16opDK7QQkUzPvJQysQxfd
         N7g9MQAXGGpzKjpJ1wFq/ojh9rIjYoBK+VoeFBWlddLnvDIvmkyKvFWejsY5mbMOl2F/
         VGNKdQIqQe9b1iXqKDP65bevxyGWqhPslD3zWW5bM6v+ECbhw7GzblzsU/5hLPb/bEIw
         fxN9xWRVMj/F3A0H1fQofHKe4zBrelErtv1s7OEpZ6Xp3GkfQWO/cvyJS71jw0L2IBVi
         QzuKmdluWJ7dw8F/HMZyeSIb/Jui2GHspsHM0C9f0FxExBdd7fiAiT5txx92Q/7bExkx
         KRzQ==
X-Forwarded-Encrypted: i=1; AL+hErE+NUFmJlUu9GlYU7jASVUlARRF25bsQqyX3SlEOxSRySb1hoIH9VOMQaIi9kRrmyUsGnT8otfi9gtgnXw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gpkaDzAA7Xscu8922Pg5eH8x2L9/aN7dNlW+sN+r8vYXUzG5Z
	M8q/DYrQT9XaHdM1xZvVJYtcv0+32yur33HQMfCqdZq+FJIC2/zDOV38
X-Gm-Gg: AYBFou0jemSyfDHY3+0jaBR30Lgb/VwrKR4KVAxD6zR0au5r3YTtB7Teyi0EFkqZiRC
	4RV4U6WaCS4yJ6/WbsQDI57QE0FwrWFcKi7dQSY/p9sVokYbYgrIAvq4isSpD/IQw7NKmUqJP31
	hSnJ1IQuMGJp/HGcq3AA0WNpj5LQ481yAEP2H3nyd5EbvsPzNfOB3fgRVggFavbtffDTyRRCrW6
	bUEc0ztEra5YCOG+tNJMqPR1kMwiBPuuooHqSsTMl2qmLecwpYCtN3nJC9fkO4+b41VcWcv1tlB
	gyzkM2ULXM/zTtPccrgCfJusuVvZlryvruXvW/SG28buyprcIGv/bFzeNrZWDRJ1xdZzX8xxOo8
	iN+1Aul7EdSrRYhL7ZBYK6vg7s3hPaKaEUNeGtWpxVhuqO0cq3Ps99hkui1pinVhYuhHog0gZF+
	Q8AjrHGn95NViR6a01av0wXBt8m5T8OzbpFY/HtnKRCdPk0IQvnrxvKLj/S4ze5z2AdKCdiOmFS
	D3zFvNtnv182IyRxbGs2IO6xSeMou1gRkhnn+qG0TGzB7Ub9573kcbvy2cBrTdeMOnvpep3yT0b
	pPGZ5upbZJZ735GncSkhJWzpdKfMSQTmuPhkVVzGmtlBvQiyWTO4kTg3b7EVhO8M4JhCsXqNy6F
	eSKnT+ug1iEMifHeHqpTNjQ6Tmn+1BWQD9pT70Qu+f7Igh7x52zkGs8KcJv4zCTc3wrHVf/WcJ4
	KF3Mg41m+I
X-Received: by 2002:a05:600c:1986:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4ba09377221mr34575625e9.9.1794395243848;
        Wed, 11 Nov 2026 03:07:23 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:783d:786e:fe55:f40d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0203a6b0sm146727295e9.5.2026.11.11.03.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:07:23 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 3/4] arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
Date: Wed, 11 Nov 2026 11:06:59 +0000
Message-ID: <20261111110700.3331225-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111110700.3331225-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261111110700.3331225-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The WDTDCR registers for wdt0-wdt5 reside in the second register region of
the CPG/MSSR block. This multi-function block is now exposed via a unified
syscon regmap interface.

Replace the direct mapping of the individual WDTDCR registers with the
new "renesas,sysc" phandle property pointing to the CPG/MSSR block syscon
node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v8->v9
- No change

v7->v8:
- No change

v6->v7:
- No change

v5->v6:
- No change

v4->v5:
- Added review-by tag.

v3->v4:
- No change

v2->v3:
- Renamed the "renesas,sys" property to "renesas,sysc"
- Updated commit message

v1->v2:
- No change.
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 258c74c57b75..472cafe7d4b2 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -327,61 +327,61 @@ channel1 {
 
 		wdt0: watchdog@80082000 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082000 0 0x400>,
-			      <0 0x81295100 0 0x04>;
+			reg = <0 0x80082000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 0>;
 			status = "disabled";
 		};
 
 		wdt1: watchdog@80082400 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082400 0 0x400>,
-			      <0 0x81295104 0 0x04>;
+			reg = <0 0x80082400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 1>;
 			status = "disabled";
 		};
 
 		wdt2: watchdog@80082800 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082800 0 0x400>,
-			      <0 0x81295108 0 0x04>;
+			reg = <0 0x80082800 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 2>;
 			status = "disabled";
 		};
 
 		wdt3: watchdog@80082c00 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082c00 0 0x400>,
-			      <0 0x8129510c 0 0x04>;
+			reg = <0 0x80082c00 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 3>;
 			status = "disabled";
 		};
 
 		wdt4: watchdog@80083000 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80083000 0 0x400>,
-			      <0 0x81295110 0 0x04>;
+			reg = <0 0x80083000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 4>;
 			status = "disabled";
 		};
 
 		wdt5: watchdog@80083400 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80083400 0 0x400>,
-			      <0 0x81295114 0 0x04>;
+			reg = <0 0x80083400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 5>;
 			status = "disabled";
 		};
 
-- 
2.56.1

