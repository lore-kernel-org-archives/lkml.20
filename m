Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649216;
	b=MIxpLuLYPQfID9T8zJGITO5wuJHTe1OpX9jUMafkk5wcojrgRTcB20F7Pwq3z+IihIcE
	 jCgnubSVu4vIhT1xnPYg8aKrvzij46I01M9JhCL8ts3BPYXonzlMJJNyW4mje9Dmz4Q/R
	 c9oTuuz5AKVZ9wMR1uBLL2grVSR8tcMNOw1T1hJw0Do/SklxG+NC4TUlD9TAGwT6xL5nO
	 sNpTaBtSohoaj9n+uAom9ld5tZkWimcp8v7Vg1L3EqmawZw9ftNWHotT0UiFaa3lB2hG9
	 6U3GPXj0V8CfVnbtNpxhthUjlyD5myVBeZ3nK2fmp9lRWowMot/P9h6+SfIFgScO2Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+9P+XFabd3/lMfZildnkql+5b4VafOMg3FdmCUFYRsA=;
	b=RAoGCqaFHcz2Vidz6KBXUUuaR7Fe/EuSh4HKF/A0fsPOUkTwACMSDvfKFRxKt0hPaxl9
	 bJ9n3OXwYqsKieh0nbj9wZ46u7LD4+QhqxEYbvqmpVF98QfSEthuvDoxUOzsFrMDpUsK4
	 CZEnT1o+dytnJSz0cY7S53n/Bh4B2cjWVBy5cgWFa4X333RVKai13SDu0oT0wmbk+qKC2
	 5IqCDksK984XJHDkg7q1Kmy+M4aIisVXsLIA4EIdPuqzBK69bwDOt7+rF1GKFfJgdzTSY
	 AxiZbDBltFzf85VTbyzRrk/HJIPrbrxbCp5zTfTqTKeqDGAbL45h+DNs2ZMyXJnZkXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FoCqqck0;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F7E606D83A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5F7E606D83A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FoCqqck0
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so35662005e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649214; x=1794254014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+9P+XFabd3/lMfZildnkql+5b4VafOMg3FdmCUFYRsA=;
        b=FoCqqck0/dIk0nU084gpT85Js5tHZSIV1oXLpFmipeZ0Rpn5fP4jLpFezanr70Ucpu
         T/aAGutYE5cAuhSnbawxfCU1njLQRYd9Kq6+Yw4yE18Z5co/FYN9ENntj/JHwI8mBZ31
         9DUCuUWcv9y52j8Bg4bEnlcCRornP77F8Qo2AtCtEEhSr2jsb2t/jyDJ7KFjBksIz3co
         8CXAXV08RiAYZQPPkCMT+tsXP2uoj7ccnV1otmxxbyFq7+5/ZRhofZqV/zPscBUJO3iv
         W//V/Dqq5Dpx9j9UKmcAU7j/wVadte72HBx14no7EzCGtSmQ2ZSPwLKWt5ZRL/KDzET+
         XerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649214; x=1794254014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9P+XFabd3/lMfZildnkql+5b4VafOMg3FdmCUFYRsA=;
        b=JDcqQD0VsZGVVv3GeSuJQqu9W8p7QwnCsWCBq+j6abDNx65NneFVGKwD/cmjsRoRZw
         sjZlWZROlJA1NGVzXufXZ8OLQhBpWfjwywy+ByapnjOXuP/2/AOzrxR+H0fZZaUxTq6f
         3cO/w7pkMUUGYHUkYIdVAKVdtniKCJ5CZRcdrl8ropyZ7qoaXrlYv4LGzWhnab2w70sl
         TzEEsZE3uXYwMk8TxJUJVTL1EfXSoDPctnoNPdlTQJ65MwaLFOYS/wpPTHoO0T1WU+qz
         GK7aXzVbAq2L+m2eUqBbxvN6jBI3pV5sDTiWc+81Ui/Yq4qjAlILvS94xjtgZzyHeWyL
         YoDA==
X-Forwarded-Encrypted: i=1; AKwUvByK/SrDQBEgkN+xoQRuJtntXNIA0z7aUcjmcvMWCQcoErL0HDUZjFO4pv5txa0VVbXEL3PwA/4X5zU4WZU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMomUWfFlTRDwBXdYFRS6HzhUmpWzqAuDpZzJFNaKlQxxLwuBt
	OEu3p3Q5C+O2hfeA7gyVvpnVZGXratI/AVcatkSUS9ElAMIRrrheB/Qn8xzZaqjWEhY=
X-Gm-Gg: AYBFou3ml2ZaR7XfXp1KGRyNQuem3T7LbUPA64m1b+NsVo50nN9JkdNeK+8vsVbQQoC
	t+HIS2lxaq/DdoTbP5vX/FKxoE8WjkTWmoUtVyJoyYEK2WyZJBd7atkt0/WQeL1yLTKD6TYDwHW
	ZNWEZytqVx6zAsPas4k/crOo3NprE50BCj1pa+Hl6PwP9FsgltXHirAeEOcWYNL2y7NIF7ufRaX
	D0g+chOT0ln5QqmAenBfS52l1iTmu6V7h8Lp5zDXcg7SFlT4WZqCeL2jbZOAEtZH5rTKhn8ALIJ
	5USRmeGyXmEZgShawmeJjtnkpnZ5qJ+pc1RlN3z4D4NFDIPFEOhDdTdJ1EWm/IQFBLEqNkxmq3c
	PAJzVx1op/O4hluF7kkxl6YJTY7fHuWBADBi+Oudu96pH1mcNfSOuHEQHpyFbO9j0VjyuCIu1ff
	x+rR0VWy+d2Ce0plJ5YnHzGd/iKnvkEOMJL7iOFykLplP7o0ojeiNcr9OPTCLKDH8gLzuYwTaun
	zXcFFL1q0cHVRrmCUz3Wyoeiqu2YltVxv9qntVaScvc8fAV/4oa+ou6+L3Ytm24mxpvvMeRymsR
	i7PzShva+Etj3xZfUr9KRZr1+36PAdDLde9p0ejUGFtpFRSOt3nHN58DAPZiO2VTUcTza2qTM5i
	/RDfJM9dADL1mPxv2HlZgdBMtFpY=
X-Received: by 2002:a05:600c:1f96:b0:4a2:1a:a129 with SMTP id 5b1f17b1804b1-4ac185bd363mr252112485e9.35.1793649214314;
        Mon, 02 Nov 2026 11:53:34 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:33 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:50 +0100
Subject: [PATCH v3 4/9] ARM: dts: omap: dm816x: refactor and align MMC node
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
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-4-9bd6d1d128f2@linaro.org>
References: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
In-Reply-To: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=1985;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=5OVt9RjfkAFqWjQ3y/ErVKQtmPA4J8c1AJHBN4H3pf4=;
 b=AtG3GnlBQFbMH1PqTI381XfB9i4KjV0cI4wKuxJY5/nlIHUOkkQSmKRvpDLY3ROqT8xei72e3
 IwrjiwzwAOnC35m2raB40VjsNgf1dswgTA6Jx6kpswL9jPVXjmTUIhd
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

Update the MMC node in the TI Sitara DM816x device tree to align with
the structure used in other similar SoCs. The changes include
refactoring the node to better describe the target module and its
sub-nodes. Also removing deprecated MMC `ti,hwmods` property in favour of
ti-sysc implementation.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index fc124f9ecfa1..1e8d225dfb2c 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -423,13 +423,33 @@ &edma 20 0 &edma 21 0
 				    "tx2", "rx2", "tx3", "rx3";
 		};
 
-		mmc1: mmc@48060000 {
-			compatible = "ti,omap4-hsmmc";
-			reg = <0x48060000 0x11000>;
-			ti,hwmods = "mmc1";
-			interrupts = <64>;
-			dmas = <&edma 24 0 &edma 25 0>;
-			dma-names = "tx", "rx";
+		mmc1_target: target-module@48060000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
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

