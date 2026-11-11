Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395246;
	b=KVDoaL//SM0d7TWRWktkmqUG4H1PFyCLvXKGFPqUQHBrNW8RQU3QHQscKQrFdxJkgiyo
	 h6ZsRO10G7c8XnswQjogav4Z1Dxo1+wS2D1Hl6/KQh+DKSF5N6hCYIGjXqsk4T0ZzZv4r
	 k2UPRXZEU7cu9uXwIN6tRzwdB4NSDeTeMzQHNsuu03s3DOUXW4l/XABOWyMwqTTS9rNLl
	 p8hzw5PvuffvTqCBfTYNbqbgK+Oda7OkMw7F1EPbp8DcV+Mumh8I2WdfHDA/QZ8whwDBQ
	 Xy7J2ECiuQyodloO62GjlpfOK6C/sLmkiXsUNkXFze/kwg+2qhlyqflHOdDoTSvsU9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=n7jE022UMmN+ZLB+al6dQVRyXDSvEj4PVxUiWuWub7w=;
	b=5NAwxwGPWFMSAhRP3IbGN3qNAdowJxEEJPU3gd64MO1F8RHrUxG17K8zo6r87Pr7Go5e
	 kOwX+lio2IxuO0DkUxqnTyqlfzLY4PG5hdZlusVkRT0Khc3dt24OMwneH6XvLMCjh3elq
	 UYmMSKeDqZqOF9CGnbCOzic6hZxBLGC2IDHrcDVIN2sjLybX3xkDGgZKhe/G9wnOT/YMT
	 0gerIwt5xxymuWzqaa/srdY9RjPcyzaOEPXdM250wKLId+v7sFEu+0siFAZJMUk9U6piN
	 hfTRzMcch833hvqZcS4zTEVQMZKgPFLv1/s2lbN+GBoyZKVVXCzTp1TfvBxR+cXODUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KV5BJQEa;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C27606A8A7
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36C27606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KV5BJQEa
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so30662015e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395245; x=1795000045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7jE022UMmN+ZLB+al6dQVRyXDSvEj4PVxUiWuWub7w=;
        b=KV5BJQEaU4htQDaRkbnxr7DuDzj4kgGeEfhToTDv1CrTxoIOjCIvWU3RBgL9h7DIgL
         O6wMLLwkNiBHGmNNJu7Tyy8SwnIl62SQ+7IKS6P6JBf6PoR9tWJptCpon2bwWsWqshKD
         y7JxqYFHyvdoC85pKBsbHEIVXnvHa7S8iQVQ4G6ofsFRtRgVYmQ1jLkhd7XmzWlgVq18
         LFznO4HsikwwUcUedN+JvAlG1eU++1ioINed2uxEzcVV1uQcsWLBDemePUSTN3ecXts2
         cIQfkjI28RD63/5CulQjxKYwgHxd6gcIoULHhGSq7T/TOvB5okJernHgXYLtXyfl9yHd
         YCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395245; x=1795000045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n7jE022UMmN+ZLB+al6dQVRyXDSvEj4PVxUiWuWub7w=;
        b=LS9MvNsi0m7F3iN1by8+VpHrs/V8jtggta1bxlQG+zWAjm6+gATuHXZDtAP2ca1xdu
         XoEIHByyO1SVLevyjhTfRK54g7RXkVRAo2LK9VYcL8ot3smFyhctsKJIRPEyLs8uXiiF
         Q6JyioGoos56Z4OabVaVIpnncZsn6dNT+3pY889tOmqwDPSRBmcWnSny6RGqiWhTx6vF
         VrCSCjkAO9qaI2PdtQgRX3WFoRL8bWU6w1F9ozYMbLHLUiIQbQaagyesNT0VS38XQkxh
         i12u3pYpllnt0rb1ldmfEhVx0o+T8WKilAfbAphPcdDkC6SuzsjsWCpZOzLbX05HveFy
         xLHg==
X-Forwarded-Encrypted: i=1; AL+hErEFhECi2Gn56vQgBGUeNh1xd4QrEAe7PLpYCk1bCB/1DHRvn5heBNPdybSvgb8+4NwlPdZ9prIlWdBI/QE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cCvkbE7sEMgAm/J24OD6HgOjgiOh6doNKi/8a76ZNyt7XWPuj
	8/RdzxwG2hC04Qz9DYPCUqL9+deR2jtQ2s0H9krRfZonVEHRukYPGkMz
X-Gm-Gg: AYBFou1TvT5nTZHOObKkNlFVPhKpArbm+Iwmzk1bGewGmpjqFQ+I3KcVwp9q13iNzA7
	ptmdniE2Y8KBKygQI1eFhb0iL6RIeuMIOghOCZTIsCqn2QVe8rr+HAnsGbBXA/twpH+ZJ92l6mT
	lzCbY8Ud2nl1uzG4/InBrkK/6NvFFQ7kwh9mexSYNr+kgXRT9QfAFiRUZphRIqe2m6fQrYvFD8T
	0oQzKv7+GkWRD3uO++XvhG/Wjfc2+TKea7Ls9fgMpwDLsgJxXSla1d8McZLRJTyTCxQPpHjTj50
	ITXLrGENi9lfd3N47rJh6lKWql4eKY+Do3HEsWr41ACZJ/YJ7bmacOFs0wR2urVk3PjrOQn/cdm
	TIyGWguTyO0F29rfXoD+XRtSmSdj5pPBYAp2XcKIpep7KaDZEZWA+jst12uWuNx0sXCC83lKaiP
	LoZSKz6I3sohAZBlkcg7Ma5G5ZnISEjrVb1acxrdj44tCBi7GyoQr4P+M2rHwz5sts7D5hU9ooP
	XU/mWOSWS50zXS4kQONgS2RoXCyNj5UMXU1pB/t44K/ALvhxrXpgl/UPvIRJncpQQB32ea/G2rp
	DmdyOZUPCnqH4yowEqtc5WoUq+6Vu72Q4oFdLou3piO6cf4ZGuR3sgeOfLulPVea3B9B+ipWnst
	qIltHI5I0JmCVAAq4+IceojWzFO2wtkBgvjjHV+dLSDFfvh8fW9KPIZLZ0sKD5wJuI10MB/uLtY
	HrJZa0jx4t
X-Received: by 2002:a05:600c:4f10:b0:4b6:267a:dd6e with SMTP id 5b1f17b1804b1-4ba093c53e1mr41140325e9.28.1794395244647;
        Wed, 11 Nov 2026 03:07:24 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:783d:786e:fe55:f40d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0203a6b0sm146727295e9.5.2026.11.11.03.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:07:24 -0800 (PST)
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
Subject: [PATCH v9 4/4] arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
Date: Wed, 11 Nov 2026 11:07:00 +0000
Message-ID: <20261111110700.3331225-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v8->v9:
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
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 243b851cc0f1..9056df917a2e 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -327,61 +327,61 @@ channel1 {
 
 		wdt0: watchdog@80082000 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082000 0 0x400>,
-			      <0 0x81295100 0 0x04>;
+			reg = <0 0x80082000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 0>;
 			status = "disabled";
 		};
 
 		wdt1: watchdog@80082400 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082400 0 0x400>,
-			      <0 0x81295104 0 0x04>;
+			reg = <0 0x80082400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 1>;
 			status = "disabled";
 		};
 
 		wdt2: watchdog@80082800 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082800 0 0x400>,
-			      <0 0x81295108 0 0x04>;
+			reg = <0 0x80082800 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 2>;
 			status = "disabled";
 		};
 
 		wdt3: watchdog@80082c00 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082c00 0 0x400>,
-			      <0 0x8129510c 0 0x04>;
+			reg = <0 0x80082c00 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 3>;
 			status = "disabled";
 		};
 
 		wdt4: watchdog@80083000 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80083000 0 0x400>,
-			      <0 0x81295110 0 0x04>;
+			reg = <0 0x80083000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 4>;
 			status = "disabled";
 		};
 
 		wdt5: watchdog@80083400 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80083400 0 0x400>,
-			      <0 0x81295114 0 0x04>;
+			reg = <0 0x80083400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 5>;
 			status = "disabled";
 		};
 
-- 
2.56.1

