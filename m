Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649221;
	b=5saqgY3y2ERFNj9X1PDQUDKexBkQdzuk7yqDCnTzOBSqD0rh0pdPDJ0hX9u6ybQLFaJ4
	 oVO4e4Qh5FPcnQWvYdjkbPRyTOUTNJSKLGyDD9Nv1/nMvUpeUcAyzg8AW04QPu74cYjM/
	 BIPqbMbXaU11Y2F/YFX+qSozmQ4sgdqoiSNr4m6f/DdDanpLH9a5b934IPz7tbJGXRMwv
	 B/brgQuKawpBgkJD7xOzf1aQnfIrJ8eVR1+TRsffM9lg9YMrBG5znEc4yWFOOKhMzd3wx
	 mZ0vFrBy5xaUxBmuaDWU3A3dDZ7F1rnH6BqG+gPxrF50Qhzs+9GH1uhkrIWa5hRvfWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6xc/z4mGViwNXCDInd4Dq6eMgtyQh/VWtUKTEtky+Fs=;
	b=Ak00gk0oFEv2lU0Jzc1+bRLFE68NMTNXyL0X8udzNSR07ZVvPr3uIEjD/3Np8epvf2so
	 uD5xQtuoayLO8JDAfD81fhDsh+5pGZTJFhHOyDMULDcJUxlfajO80VGPah29N/Uk+hAC+
	 RZG0cIwvz48GZoLWC9/czXyUWFY+45948qm9Tn7ms/2Y2kTqTveCyE4ODZVzELGlJfNbT
	 FrI3bMnqIkQwg4nMPPHlNBYPCTUX2qXdb4SiaR0RR4k5xkUtm7Ii/uIbJYg97WRdkv7DT
	 6BlqpGJfXSrWw71G49ObLGuboAPFcS+wFLeqp2HCsx3XopRDcvFeJ0XlbyNDGKGzOmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CZG30O0e;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C35606EEBA
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65C35606EEBA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CZG30O0e
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c45111bebso1464505f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649219; x=1794254019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xc/z4mGViwNXCDInd4Dq6eMgtyQh/VWtUKTEtky+Fs=;
        b=CZG30O0eHcF47HD6dmaY2YcHN9EgyPb001GjtcfZ205JKhcdOmziqN4UL9ap9Xl4xO
         +gCMpO8Sp+aQAWjErgpSQvMRoDOmekLjOrqzm4Zras78P9UttQCpq+fZiNt9qQg9hNDs
         kcvhcsXlVp6bBlaO3RHZOnBBzT2MuJ5wxHSIzrTLHQ+lkMfqTjQKitU2j1xjNmNTwo9O
         C4EEhMEqBMaCZrbC403Gh8m82711y0quJpU9u5dJ34zFsyQIsUD78FMH88SCIPGgo99R
         ilTtyLjE4GFbNtLcgwO4vuJZHUkl+7oZkCiEuTRt/tgZkugTfXOpwIifo6fESTaiKL8U
         ye7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649219; x=1794254019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6xc/z4mGViwNXCDInd4Dq6eMgtyQh/VWtUKTEtky+Fs=;
        b=cted/8XwCLvVflWjpqrI6nUx6AmwJr7t+WU8bSJD2w0tevwHDqOWr0GldR+gfb6V/d
         FZk05x9JeFGPKv7yBszNinjQfJtGQuVWv5R8I5RzIYEqzqcWFYNTsW22yFHpfPotWACU
         SpI0HzwnNRQ9AZZi4b2NwzhN8TMAuG1/+H4aOqk+ESGXjtDTVJmQjuUyzWmdkipeISZ9
         1JPYbAVchJ/z2IJJdNmrEQsrsN4fQxrOGYkUefxyRpZQptxe8JOuQ6DQQWArIQSpwL1Z
         VI+JRc2e6Hc+b4eQqqd1g+uBwe1VaX4J63jEoR+gmhNa1OLeQGqxIUvjri3lEZOhgKVz
         wo8A==
X-Forwarded-Encrypted: i=1; AKwUvBylpagZ04c12Clouqk7eGhcFnRpuQjrrlvsxNXaUHyFNna6+F/TCwvFhZKYdPvRNBJQppd8w2lFl0JSNJA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HKLKzmPEBVUu1ZDPsEOGRuPap5wvsnWyqreNAN2LLC6GFURCF
	VI7uyuwK3YrjQvJzKpZkABQuhiS//2sP22ENADvBNYOyH4glwoo9mihpgz+YqtoH4+IlJOGqpzy
	IknNJwMBwUw==
X-Gm-Gg: AYBFou3vPBqdVY/5VzKllksdzhTprl41VGkbwDMaaTZ5oorNOdB2NaRvsS52Bih94zD
	CICCfXd+KFDEl5KXAGsIatzrzQ9kdcI2v5rlImjJ9kzObpPcdz+2wrPZJY9yv9eYTmq4l7S0Cj5
	qMIcpqcYkeEJ0NJJoZm8SCqvCMF4BeGBAkcANFNvPMMV82UsXP5r2nYFRCRPULhaeD+Qst21mGP
	1q3mUB27s6i46SxgeBzoqQjJ8KX6ex4UpmMHJGEJowGjPOgQ/5Lo3ngVioGFOeY6QxjgZwi8LpF
	KthaDWnDS0J3Yi4uzpZFtwxD5q80usJxMJAOhRWyU5T67pwX1GfOnDMdEBaJLLMOaJpQYscluf8
	IFHTmJUjF92XYGr8AUlpamQMTHJsWDTLQzHmNKoGpzjXESmrpOoJ3+5vjdtR51w2J/5bW04mV0U
	sFF0FTYHQ68G+Yy1G5cXkAzo9o/CVbbmO6z4fDNWp0lrpxz5wnbIEFv4eUuIm/HCJN8R1l/izQH
	JKNqPC3YQDsAsaN3OkhSCvOxpJBu5/cgjLv1xXc6GJIExiU5VL5mhEMtYPXFEDBdnB135UoG4pc
	NekmtL9LUXhNC//KOFFgaN/9lb9n92FSVEEadqQJXNkVcxhqEY8Xo2L9jtKrYjt4eeQNH23GvYI
	hWwlNEZKYnXUEUW//YGIJKcyGmAo=
X-Received: by 2002:a05:6000:260d:b0:487:1256:ab80 with SMTP id ffacd0b85a97d-48e6e521406mr25540676f8f.57.1793649218827;
        Mon, 02 Nov 2026 11:53:38 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:38 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:54 +0100
Subject: [PATCH v3 8/9] ARM: dts: omap: dm8168-evm: Correct SD card pinmux
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
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-8-9bd6d1d128f2@linaro.org>
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
 Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=2155;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=83Hmt2YYwsYCIfUczSaxPVDOXa1KO6SZNJLSBdpkV5o=;
 b=TLBdM1+sU+wTuaQpo94tDJqhnYNjg8MUQxSIk4PZnYVzOAOkVVw7lGekklx4Cq3Ehj9UD9D0n
 dl2n0uUP2tLBPCNhdpI91bIrVmPTfvcydc/9Amkd5hC+OuD442bSYeU
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
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
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

