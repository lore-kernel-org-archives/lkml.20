Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203590;
	b=y/duje78a60JAU1yEoJXip8yorL0Ew6GXUv3YpyRu1UXHOxa9c1UYqNhKYaeJ25UlKny
	 /lVKoOW0Xi2I8W5arxax69UbMnUfJoIPOLh5QtSuRALKNjueRucWsoCGzaDZsOEwLHrGk
	 Q9o8IOpTCFp4Vm97gZLynjttCCU1vuvTCOpTGp4qUcE0XEgDRXuHhPpudmCe8zeT176km
	 lCsiU32wPKggnYs87aXq+GDIqpGWk5zVVJH2kCMWrGxC9n79D3j5mYMjL77cHCkWqP99j
	 1AtoWqLRXKZ1WwDEMGU9D0XL/RDhqTBxnc3wtn3oSHB/Goj1HdDOPW2uSVYttKHuIMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bmYk/QrXu3XKmbnsirtQOZn7qp9VLhyQk3cehRblGvc=;
	b=mLFX2irZ/0dm9xSrBKcHiTfWPQ2kPJaXrdTcygh9jBobqCaQkNxAqsJ0OqEP/hpRvtwF
	 3yx8wcBUce6O6WM3x15LgsfmzmZlLdkkg7L5i8TKJ48kA5mdLJ8ZHOGLj2kE5kJ8oNLVI
	 tG51rO5zEJSpo95sUVh2ucb73+2cyxArDVGLn/2j/koq3Msthu9GG+00IfvcX1rclA02/
	 6RQWVfc5KGwOuzcxczrxPm5RRhqnrlWWWQ4tO9gZTwQiZjBL+ghdjEV+hQLSGO1FTSWCU
	 h+bn0FSWwE7JfXazzzGZ/T6Vu4Y4v42yCFimzVsbqMZDIn9imBWxGRV0qXuN+Yo2xAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="kJZHcB/5";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC66606B27D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DC66606B27D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kJZHcB/5
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so10268325e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203589; x=1793808389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bmYk/QrXu3XKmbnsirtQOZn7qp9VLhyQk3cehRblGvc=;
        b=kJZHcB/5WTqXVb1DvnmzR+CCnNkmEnR16lX9PHOvHguc8qaZsc/8rxdpfiB0j3/U9p
         kSJs2nBhLQnX4YbxVSdBgiv/vvZFj59os9lw+pm03L7/s2IV+ZqLG8AHx01OQjHjnSFh
         AiNYNqYp8I29RCDYTC9YOpPdZYORwfWRzNfH84uaT8yjcNPVIJwVAXMcBKP+lF6E/ONT
         X5fNtFcavNsgFa+0nkjZibrXfl6E7DmNvX4rbLTQJWuVFRZdGDvmzbfVzQtbMUevPJFA
         VYAZ6utGhLxvNvVlSxVLgOC2brMCiCAeDcoX9rd94x1XnlnS0rq/mlylrhUJL2uvuVm5
         OGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203589; x=1793808389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bmYk/QrXu3XKmbnsirtQOZn7qp9VLhyQk3cehRblGvc=;
        b=cl4I89GHNPatMojx8a/wh31bKN5tirCslQWyVvnaLXAQQOHHTkaBcWqJ+G5lpkFhI7
         GNb1ZjnkZHMgJK0wMHqwpLmFwNKuPXhICUjAarVnrQnXd0ZiZg1vLgdYE7V1aToU5ekr
         xiBD9SE84zmBbnMnZB4Gg+zuHIfQmFQAOT1EfJqqb/RIhtuTl2OllQQoFyzUbUIC3mJm
         o/5FK+ND3ttrwKQMKGBi7+PLEGZ2qlMKrDBoTqH1yqbbzTC2vxPJefMlbj7986/tCHfe
         qA+EHwDM3VbupkbNdBdY3XzyO8cmGEPrRzk+sp955TDzq5lNyOk9TXvBjNkeRvX1ot5R
         WEDQ==
X-Forwarded-Encrypted: i=1; AKwUvByQ/3u0ewKRJjok8QRuJcaDzS/v0UKgGElWRIVRVB1RwzbvnR3iKf5FAzyE+zagBdIo7Cnecn/RrbE30h4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5E1/QsAquSbtSHAHmXJ9XMvarrWRSdoHNelcdcFJTmWeNhY9u
	/8O9yKDJkmZjNhWJFN11XSUCVThLjT20xUl+Lr8WPN2ALGyQ26pQU+vIepflx/HK5UE=
X-Gm-Gg: AYBFou3zBXQTJTQQP0RWm2JFsr2+tfo2enDnZgdQe6GJ34l1iWkZM7sPl77DyjMuj/Y
	7AinoWhHbLAuTHB4WhMnm7k/ovCvzMjVfSd4j6GM6XPVnWvOFUSoKnETM262SrRkBr7S7fzvOY5
	iXVE5t91ZxNj6GCGp7gbim9suvZBr6XK+7kKiHRBv5mB7khbtb/gx+rvcbxXLP2lubYNNdvy1+z
	evWGjGgklK8WA/1BYaDPzRqQRmhAR2htm8cuGm6OgK3RD6H+Ur2OSe1ELzZSkLSJLPAR96Hoprw
	KAazT4mvQmO9dttTUZypVOHaseVm2vxX29FUUwplm4YxqYPid2Yer+nQwbn5MDVT5EnEaq0DNbt
	OLro1IxqXQ9+UzmXHs26zpNUlwtEkNwwC8oRfdbxiKoHtU++V4EwY+XedkEI7F6G2ZjXH1hCIri
	nRSdVwys//RQ8M5XGUwB3Q10JxxbXWzoa5swzgFarYndxVHb/rGCevct8yiJp4/vJyzZfC58nrf
	s6wj2sZrbRjLA+TiOfZ0J4urcP8MXCGZdPegyqRwfcI9jnE/CF30/9PNCyNzmFU2N6lsz+NVQKf
	PYScxX9jHLvyQbyoj+j6MvSXVirKWIDsYBGiLY6SPrOYe9DPRKSgEW2AOMfsSJ0P41pJs6JZmo1
	guZ9JjlcmdFgN01Wk5LINs0V3ZQ==
X-Received: by 2002:a05:600c:1546:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4aa86a42518mr551525e9.2.1793203588489;
        Wed, 28 Oct 2026 09:06:28 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:28 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 17:06:05 +0100
Subject: [PATCH v2 4/9] ARM: dts: omap: dm816x: refactor and align MMC node
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
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-4-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=1896;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=IkyleFnGyybE4VzcWEWPfLI1Efue7Bk+OPR7RvuZIO0=;
 b=lIHp8XwSVWwwtqhg9KXgnsjTTPwk8NehLG81Fs5GcnUmU5x9Wem4sQ65vOXY3nTuDNjdInMfh
 QOUq/2ATOCpCsaCVOLmbWdkcluBE4eJ9hNEUFz9+CeuBmsqCH/yq6iJ
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

Update the MMC node in the TI Sitara DM816x device tree to align with
the structure used in other similar SoCs. The changes include
refactoring the node to better describe the target module and its
sub-nodes.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index fc124f9ecfa1..e3d49651b44e 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -423,13 +423,34 @@ &edma 20 0 &edma 21 0
 				    "tx2", "rx2", "tx3", "rx3";
 		};
 
-		mmc1: mmc@48060000 {
-			compatible = "ti,omap4-hsmmc";
-			reg = <0x48060000 0x11000>;
+		mmc1_target: target-module@48060000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
 			ti,hwmods = "mmc1";
-			interrupts = <64>;
-			dmas = <&edma 24 0 &edma 25 0>;
-			dma-names = "tx", "rx";
+			reg = <0x48060000 0x4>,
+			      <0x48060110 0x4>,
+			      <0x48060114 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
+					 SYSC_OMAP2_ENAWAKEUP |
+					 SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,syss-mask = <1>;
+			clocks = <&alwon_clkctrl DM816_MMC1_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x48060000 0x11000>;
+
+			mmc1: mmc@0 {
+				compatible = "ti,omap4-hsmmc";
+				reg = <0x0 0x11000>;
+				interrupts = <64>;
+				dmas = <&edma 24 0 &edma 25 0>;
+				dma-names = "tx", "rx";
+			};
 		};
 
 		timer1_target: target-module@4802e000 {

-- 
2.56.0

