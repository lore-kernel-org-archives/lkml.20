Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBDD4DEC2E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161697; cv=none; b=YWbsO+/5G1lyq3T2V4LGNNZYXNNRBznxtJBfkiniWLTXb82XZez24mWCjTVbuC17Ipu2XwlRmX+GFh5+rMu6/ORSbzDdkmO95BaWiL/2Gimjy01tvGFUNh9dJGgFjH7rd78lK21q2d106U/wXIq8hyvcfjGJsncJwWmZrX2zmko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161697; c=relaxed/simple;
	bh=wsNbpek+NTljF03iIQXsxCSf3wSpZEAjJFyKvkVrFuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tM+qPQSXDbfM5WFWPyZvgOWewx2G+tMaaWNdbPRsVb+/MMGweEzG8QE/KgtPaFk3roJf7c6+WYfmp706KNJlHzp1Iy+i81s2yvACkT6Vga0c23BF+z77joMoZeyqLfR6uiG9mZjTPVYSE8lZj1PMImjAQQCr+j6Rn2yvP63p1eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SSxt70bD; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SSxt70bD"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e011d370dso512593f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161693; x=1792766493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4FV3FRgo5Fq9ibwyvwR+FrSwQlHm1b1ksNAl+GUkAY=;
        b=SSxt70bD4bqkBmgwcz9IBN9lCoxyLf11AfLQQinbW0rrXiAPWDKnmt1bBMknqDJnSt
         CgCeowANEP/Vfn37a71T7J7EGSVNRk3TQTVI4i99WcBo8zXxAab8Y1m2pT+Z2shuIrUG
         vycVxU32WwlCiLCS+OnnEbDcF/v7uccf2njaw0D+jsa44gncgiVcEuJ3nPq2V7IjKb3r
         jvvx5TWwoum/ZbVRxHBwTh42xVe/VLOAMddmfqb6bG4JzPaPQuXnjT5GufV+BBMjQR6t
         YW29mP7tKTGtVoOuf9D80L4PyrpUgsAGFCHDAWmtNy+W7rnWTOTHetE2+VUIU0uzwJoN
         2Hxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161693; x=1792766493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4FV3FRgo5Fq9ibwyvwR+FrSwQlHm1b1ksNAl+GUkAY=;
        b=XXNQOPM7ERCQ68mhm2PbqiCWUj8WEIL3Q4SqCLg1rAJRk8tuDHPC2nbu+kN0c4RVcQ
         J1/Z1y1y2Q1qjcqIy5+2O0psu/V4YCM4SJlzJCLrGDnE7lvEIiK1vXcnOCCVDN0otByG
         yA61nmqvD5wvDSrSzraXreRM5V/VXnCyNwy7IvBX8nS6hI0Mv8gYCDurLDltBsPFDsm1
         jRyNiaEQzDzdfTfikde0A6uWHBECKMqZ+1SwVLOVSkj9GBkOmLgyW+hXaF/O/ycFDgiR
         2IfcREfJVV4o5++9qYBnTxOdkIS86j+wte4sraPHct+SqgXh3HQ1cn3n16e1g144H/Ek
         hEOw==
X-Forwarded-Encrypted: i=1; AKwUvBw49m+plHiwCbyibTOPZGV0bLep8RVIrTbfcWwzxS+GWDfPqBEEZDXBp2IZRoyfMvltxiqoAAMKQBXk1ro=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+EMNp2GMF8ivdne1HAfl4eANqPHvmzoy6r8n9vKdaTiZMxtp4
	pL3x/nJxntm6dO3HLqmLvP4XMxLSWaf2+ak1M1PI2O2J6NLMYVbm1+hwiY6J7tXZzg0=
X-Gm-Gg: AYBFou0r3SFFrA4s5kEVim1MFc7StRdqDInnzrb2az0wrMecl9iRuuw6XTBdDnmie1g
	SAk24hzPl6EkKo1+9IbAxCXgE+PXst+FvtdsJGMwXNtS827CzXzt/fsJ3/jvs7eO1DLryImm5X/
	t1IegucX/YbkJ083Illqh7Q+mdQe5pzZS7sOaqF9JOZJNCWKEwIUA2dt8qEKiVKmcZQhuk0afIg
	EC+o374POCquNbMjWP9BVJNDLJDmVYlZHdmihYLSAdS19FIEykHEXiU/xoseLBPGJxUwuPd+hE6
	9+CGhfirnKdAueGX96pRFEXx+QSAzfIma3YBaaq/b08ypYE7guwuMxKlImGhJIOf0Qd1U7FpdjK
	sk0nMjA8Qn1DPTTLg80S6aAix2cMk3Nzy1EmnY+sdzn+CawUKTx2patLXKborTH0Z3Y2vv/BFAg
	uanpjwPg7N4STCAeXS11QKdoNQCAWJp5nunAmfCcyx2k2CAYIt8j7NLkZW8mr4DEqpioVSQsw5c
	1jO7Hnot7RUWwuAmeuXtlEmH059JJ1SFtVf4AE7ELOM56+2SHWBDZQVZpLLQewq02so0A==
X-Received: by 2002:a5d:6f13:0:b0:48d:ff71:dd97 with SMTP id ffacd0b85a97d-48dff71e2e3mr4135577f8f.7.1792161693523;
        Fri, 16 Oct 2026 07:41:33 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:33 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 16 Oct 2026 16:41:24 +0200
Subject: [PATCH 09/10] ARM: dts: omap: dm8168-evm: Correct SD card pinmux
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-9-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=2104;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=X4wb3xiiISYs6tuR/KwDk67KeYlf9Jq//WgEqEqzrr8=;
 b=A8n3VCROf6Kr5krycQ1d48B8SRfuPvwxe+ZIq5pENuMZnmBMSwf4Q8JrQ6EBlByjeeDxMVjWi
 OyHPdjXZG25B5q4bqtX9PIxqh81UtNS5KZj6mYT6wuQlhP936n3mKJx
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

The SD card lines use external pullups and so the internal pullups need
to be disabled so that they do not cause contention on the lines.
This bug was revealed by correcting the effective bit mask of
the pinctrl device. Use the correct macro for DM8168.

Also fix typo in comment SD_DAT2->SD_DAT3.

Fixes: 86800ffe84055 ("ARM: dts: omap: dm816x: Correct pinctrl register")

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
[ettore.chimenti@linaro.org: squashed after fixing DM816x macros ]
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm8168-evm.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
index 81450e15b889..a6d42766a496 100644
--- a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
@@ -45,13 +45,13 @@ DM816X_IOPAD(0x0aac, MUX_MODE0)			/* SPI_D1 */
 
 	mmc_pins: mmc-pins {
 		pinctrl-single,pins = <
-			DM816X_IOPAD(0x0a70, MUX_MODE0)			/* SD_POW */
-			DM816X_IOPAD(0x0a74, MUX_MODE0)			/* SD_CLK */
-			DM816X_IOPAD(0x0a78, MUX_MODE0)			/* SD_CMD */
-			DM816X_IOPAD(0x0a7C, MUX_MODE0)			/* SD_DAT0 */
-			DM816X_IOPAD(0x0a80, MUX_MODE0)			/* SD_DAT1 */
-			DM816X_IOPAD(0x0a84, MUX_MODE0)			/* SD_DAT2 */
-			DM816X_IOPAD(0x0a88, MUX_MODE0)			/* SD_DAT2 */
+			DM816X_IOPAD(0x0a70, PULL_DIS | MUX_MODE0)	/* SD_POW */
+			DM816X_IOPAD(0x0a74, PULL_DIS | MUX_MODE0)	/* SD_CLK */
+			DM816X_IOPAD(0x0a78, PULL_DIS | MUX_MODE0)	/* SD_CMD */
+			DM816X_IOPAD(0x0a7C, PULL_DIS | MUX_MODE0)	/* SD_DAT0 */
+			DM816X_IOPAD(0x0a80, PULL_DIS | MUX_MODE0)	/* SD_DAT1 */
+			DM816X_IOPAD(0x0a84, PULL_DIS | MUX_MODE0)	/* SD_DAT2 */
+			DM816X_IOPAD(0x0a88, PULL_DIS | MUX_MODE0)	/* SD_DAT3 */
 			DM816X_IOPAD(0x0a8c, MUX_MODE2)			/* GP1[7] */
 			DM816X_IOPAD(0x0a90, MUX_MODE2)			/* GP1[8] */
 		>;

-- 
2.56.0

