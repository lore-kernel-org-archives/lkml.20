Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378156;
	b=2bFk+2K7ric09t3pn0zSWKFH0O2FAH37cfVXyiCNPnxNvfykmSGVbmvzQWKq8WLmzq9g
	 Pdb10kiHO751Dx7PiQU2y8bQ9rZCU0GNuX2FCfXK6HZdYGQoeH8m6AJHRfTXrpCYR9Frp
	 jO1tqKnqRI8uznoA6clghjpls2oLMKz0oDnpahQCnkrsmr8QU+i/iiDlw9/mAqCvST4xV
	 8HwMYUPfKFRvkXxV/IobJF7Y7KRh/onqO5pzsri2W+gg7g+qtJZAeZvlrz6J3G1d4Be38
	 1OvV3l2ZS46zORiSfCPzyKZuF3e3Sh3Tnhr48aqRRmEmm09iE5jQF3ZFa14t2fJaq9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pOuTQAzIAgHcyD+89OKp4L/Cpx4sAMbE9RsI11vwmkw=;
	b=4lUSuHdSmLQjs9VQJfI/LEhTrGg8qvSkDOzLeYFeFZfkQgXaU1r1vJj6gDL+SawjfIm2
	 lmrM3ayHJiNIIoBJDmCrlSOeIS4gHKWrVOre/nRP1BcMGdjOnFzVYOnuasYlKcgf8BOjS
	 3l8IYl6SpICOG0uyPH63OnGrAW1QXUd6PzkPI14aP8r/j00nENMEESof+NSPooeGO4yCb
	 xOl7ksIpOIKiqhCWG/r6Dk3fwMwqSo+CXBOuqRXgW3lxS4uWkmrN2MJGZs16UBsHSp1S4
	 CsQbBsR99cH6dgVvMOb4asXWaFSdybsVb+ZyzGJ/gc5G4ybcU4KMpwtTgUQe5vbmPpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=QIGZErHp;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E380606A331
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E380606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=QIGZErHp
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so8520435e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793378154; x=1793982954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pOuTQAzIAgHcyD+89OKp4L/Cpx4sAMbE9RsI11vwmkw=;
        b=QIGZErHpvzxqaGa+rfbEtHPUs0SroWsOnAvpavbA8Z3W46csMPaaDCBoGv0rU8GIf5
         7vG3b6W2c4OKkb9g3PKAQMnahAt70gtMcuMtqqWeOvFUnC6LpzYhFbkgEX40Hl8J1R+z
         bdevsf3U/Ksp9ouemuljSiWC3bfec2V7+kFMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378154; x=1793982954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pOuTQAzIAgHcyD+89OKp4L/Cpx4sAMbE9RsI11vwmkw=;
        b=GynSEBdqYkxKdyzuUP9BJpDJ4DxtD47ZOh3d93TTnVzaSGsZCc+oZRraVU79a1292W
         UepSMlRWfmKSoJy03UhYe1BuSY2XdhgJTCFWZTwz5sGMuccxtpsTLCqWI7kiZimfX1GI
         VRgfUddUKKtMY1AyyKmrAwDJdS0f5jp30tg8cdb0ooZUSily6j33SsZd5XNRPypdG3Tz
         ZW3vDtZNUfpNZ2uDYkJ7RnRixgX2H6h1GBnGeRZr+4M2FsuKMaXQkAd/AxzRgUW0BKIq
         Jo8/82v7uvGFdwmJF+Zj6+y/W5Jz7gFr+t7f4FqOk8lJshdT8BHvFO5AlPJJXUU1swuU
         U/3Q==
X-Gm-Message-State: AFq9FYKjsfuyegNdikpFoh/knYWvasOCoiUob6NP1g/pEjbcDXXdC6JN
	RHhqIs+c31blcyUKCbaa9j1dzDxtKitY+EJpv3Q70UTdrHmuHOLGy5PoMy+s4VxFYgdQV4d223c
	nUvFr
X-Gm-Gg: AYBFou1bEc7I3J9OMT/7+rSYj39gMXUyN+VHT9bMvx2QefZUOXPkhzQtBZLIWR775KM
	bvwsz/7CihcuTawcS3ejMwQXsEyEeS0rKaa8HxHxpUyxtzCQMJDuXmKN3SlT+Y4gOMV9FzABRch
	x5J1YGymG5RKRR5MtLIwORFgw5X7+3RH5KLKlYDhcHXlICE75OhQ1lSY4WzvSuErx4Dj7IsGGea
	F3BB++4edhdg6vtH9ptU265unvYqyJ1cr9VpdXiVcuc4rv8Gbz0mv44NBgriYizC1w+OL4De/tO
	vm7z/z79kt5HxnulI1LruD/c5D08irOb9BjcqWK4JzaBDcHMxefh/AhWCR9ardgQulG2iuBCBxL
	dQRF+pLEJRu+NEdTe/ffp4JpVw7yALvMhvVLpN+Z/TJiRIxqvvGmrJF06YkmX5mvzqvGcenoriA
	2vzjwPbJzurY8MelRRSIA9N9ogE8xo2eyN6EnoW9Dp4JPxuQD2L3Jqu96vGRQ0e0zGTqH/tTXH6
	R7OpYGGspxjelbd2hHl0PoIqsJBvXBg/9Zs4CTeJmcFfXszIuimADCFi4nCTli6UbFgcklLMPw3
	PBzOp8uW8NNuS2E+7kHJV9md19jFqIyqAJAq5lH87IoNBQblu1pjglcQmto3tOS4u9J+k3JLXLs
	8jtr2A9V0Ur4XPoO7xkaFsokAZqOrNuyGyUp4Lau2RSCbYWKh+pKbJG9pcg4YEjEqNgyHDopHLc
	8Su2UPmJvu17VK8KLkrIK18TLM9w==
X-Received: by 2002:a05:600c:83c3:b0:4a9:18f4:925e with SMTP id 5b1f17b1804b1-4ac174711afmr61029555e9.18.1793378154030;
        Fri, 30 Oct 2026 09:35:54 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723fcsm4084806f8f.14.2026.10.30.09.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:35:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/5] arm64: dts: imx8mp-icore-mx8mp: enable the watchdog
Date: Fri, 30 Oct 2026 17:35:40 +0100
Message-ID: <20261030163547.2682583-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
References: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
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

Enable the watchdog, asserting WDOG_B on timeout. On the SoM the signal
is connected to the PMIC, which resets the whole board.

Tested on the i.Core MX8M Plus Fast Ethernet variant.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../boot/dts/freescale/imx8mp-icore-mx8mp.dtsi      | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
index affcc20b20c7..33066247cd2c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
@@ -122,6 +122,13 @@ &usdhc3 {
 	status = "okay";
 };
 
+&wdog1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog>;
+	fsl,ext-reset-output;
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
@@ -183,4 +190,10 @@ MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d6
 			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x196
 		>;
 	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B	0xc6
+		>;
+	};
 };
-- 
2.43.0

