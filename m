Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A6A20D4FF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789752414; cv=none; b=c2fh2ogyAgqo3HuFzX8d/mmceMKH6dIbQ0NxPFXHVPtsZ3G2sxTbS3O5GJIu1D/jVlJTaWDFtCgn2VD60Q/ZV0sV4RuwtEc8oEk9EGB/QBt9Cn+xqP6/7jPx9mZzcEKOYkxdCoFyF94mqwyEhz0wj4w1Mw6xKA3OBmFHfTpHjeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789752414; c=relaxed/simple;
	bh=TkeK6vGmZcwODlJlEq5gVtqOmy+dm0WEcZnbleLPAiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jBYxYuVY9hQGpLpG47MqL2O1pak1lPUlAg9iZ0H7jp/2cM4EJlEUdBJHm5tG2HxxEu0H422154tf9eVdlmB+rdDhppRNDEyxrOJlAty+vOjzJj/RIkhZ+Z1OQyrQLfpPthHqGBKeav/N6do9trk0Jo4/iVp3VgRG3+17imbA7Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vxs55Z9x; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vxs55Z9x"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c254fa663bfso177715166b.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789752410; x=1790357210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q3e71ONX+G/tBeD/v6Wra0d6veIuI4yfjRsJjDPREyI=;
        b=vxs55Z9xi9wugrsytye6hhdbZIl/R1uEzeAMk2toOHeK8dYe1+DDRpwRJnf6rO1QEh
         LipXK3vIV0HEIVRSUAmj+8tevWT15rSFzwfcTFMZo36+tt6l+Sb8lbyU7Jy+remGTWHV
         1oxHXQkZSZf/gP6+YrwqN4JFg1M8FEaOtsCN938r1O+2weIOJVyo4Ct5gS9pDaogAY3y
         BfGYB22u0OYa81x3Z2XGxk+l1kSop9HvzyDiymPRqVzrckJ/OG8fLcQ7xabm08Ugvkky
         tdOVkHyTDShmT7Ff5xS1xNTLGEWfAvfp0LBxc+bRjEBEhcHPYob7YePvgGYCtLqkPHZX
         UVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789752410; x=1790357210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q3e71ONX+G/tBeD/v6Wra0d6veIuI4yfjRsJjDPREyI=;
        b=Uyli4/BNTp9dqIJ8Of7IjKYbiuA6gaCnK9VfoV6tvwDOGbYr3cbdzBqvRWnXpOVNvH
         JF8V4oDucjRv7MYHuAgOW+NX8JiVBPPK1oorMaLeYc1NWafbZdWFFjpXzO87A1fTC4Gk
         ddqE3do0hYprj5tHThfRRuRvfcT+O9tMyjQvoLP0tlBGr75hXmf0m8vxyiAb1yGQE68M
         tZ1Tm/FGxLelyEerpEPKj60r7j8rlamE6KStzhOhaG3XyVFBT3Ztrs6/BWZej/Q9E2SC
         8IWgyUgvLqAqvl15yyGQ34jioDbxqCK+AFZ136nJhr0sZ/TQOCXYglcI5qTE+TDSW7Cw
         t9sw==
X-Forwarded-Encrypted: i=1; AKwUvBwzHAKP4pU5gPh2nu1EOP5UCWoX0yzzO9cm7mpjfDwTZM9b4IXrAl2seR3SLUTQcMcuKtHIW4aSoxoUNzs=@vger.kernel.org
X-Gm-Message-State: AFuF++nhXa0M6iBCgMPT5D1Oj+HyQ7x/5L0E+eCV8HHwoopc5lEMO6VS
	lk8zdGTv2fypa2uZf45AUBBB59ovmTYM79QwdZ5Xwfv61IVMfKC6++6JNkVRPz+5F2c=
X-Gm-Gg: AYBFou3mcTCOyDYh6DyKWM3o3KvY+MH663fBtAzrk39tj0XB+EkWMx7kKOutg8LBniB
	f/SwfQFQOsiGE6r+vtKTlbXMnNUnIcM8LDqAI4RHOXiBcYYMyXK7DwulTG8Vhyyw01tmLtQgswZ
	FsBh1WA9DZIqmVa0+IhXKUJSZMsizQRWBlajmS/+ScaGw9g5fI9GUnhwmhtSLHz8CEEzJgJFDsp
	slQvJnt5p1gH32oAwsbrHFsO3RIc61OvfP+j25S6epX/66cM1rF383MMrLGPaxIhauDpR5NN8k+
	+1nHfKz+vFzNn8FKVvOFtkjBb+IW2LIYjL9SaylsdcVcSUNfEwOeAv7WxbbVG/cAM4pYLOCvPq0
	PtxRhEaLmrCyCwIm9p/++ML/qlAkYBT0ZKvyvNbBmorcS9Sf2bL2eLnFcI5tnmtrXJnzxHpn6Ib
	aBZ8R+ZX2cjdBGV7ifLH2Vs2UFkapMSiqxGS318ScB7PeaWWvD9ZvtAjFqKYrVJ8tA3vfpUMvNp
	OMRCSmUdWukvlYbkXNcthTpLs1obwu80ogtzTULUnHZFSlrMUPWhGraZDA+3ayu4A==
X-Received: by 2002:a17:907:971e:b0:c25:fdbc:52df with SMTP id a640c23a62f3a-c2a15699d4cmr283478866b.10.1789752410253;
        Fri, 18 Sep 2026 10:26:50 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a35701d8bsm902966b.27.2026.09.18.10.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:26:49 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 18 Sep 2026 17:26:35 +0000
Subject: [PATCH v3 2/4] arm64: dts: google: Add dts directory for
 Google-designed silicon
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-contrib-pg-pixel10-initial-dts-v3-2-c94e51140509@linaro.org>
References: <20260918-contrib-pg-pixel10-initial-dts-v3-0-c94e51140509@linaro.org>
In-Reply-To: <20260918-contrib-pg-pixel10-initial-dts-v3-0-c94e51140509@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 soc@lists.linux.dev, Douglas Anderson <dianders@chromium.org>, 
 Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
 Brian Norris <briannorris@google.com>, 
 William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-serial@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Brian Norris <briannorris@chromium.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2879;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=prHtn5W9Y5dmFFjTBpt1J6sbCTHN8IgoPCiN1ehs4ME=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqrXRXFTEYAGEsoS7MUfIrg6CjdIOaifPmsSFmo
 QQ8leTp7q6JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaq10VwAKCRDO6LjWAjRy
 ug/fD/9Urr6DgBP6/xSBuCZzkbqwlAfIRnR0z+L2WO+ksdtXeV/usopNI2AWlnxNecYkTWIZGJa
 nEg5M1CL0S432JJKZVtOBTqNyd3O3himpBwj8neXDBebwgX61R3vSYad2+Ux1jX1O/Klpi4qnPb
 oOqdhdPqvqxSOVUE2sk8HR53f0KERaeGyP0yrfXHq+bYR1M/KtSQoUGXuqfDH/0dIHedUIYy/dh
 X5jFUZvD4fhLsridougvieTgMWG79r/RcfaeeakcMYvEjU2eOgZWA2vxlhQpsHd/T0aBahZhRHr
 VYTEMfKs2DWxuMakwGN39vpfRy630y/vqTowyXYfAUZqFM8Iw/frDfJTm61WD6dvAB3rVU6ToZt
 pEcem4gWuKQcuROBYfK3PepyoPV2dWpA+kwsYy3tMGkw5z334AP7kqOxBt5A83YssgBip21tv9+
 Fp2Fwgi7hYNtNCTiGOEn9mqSsp6ysDQYA9mf/0b7wIehZUycnJrVRAYijVrhOH2K62bvqeMH7ZA
 8Ini+nFiLhcz+uYLVsqNuJfSY8lZ185M79jJY9EzEVarntgmQhWexSBmttBx74LR64QRnudxm1i
 f5x2MsrmsBrVPnJIml/VkouixLbIM9jrTMEqGSfCLiDTtIrDIP1Bh5z7dE3Icy1rqDk8mVlHF51
 btmyUow4Did/arA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

From: Douglas Anderson <dianders@chromium.org>

The first four Google Tensor SoCs were offshoots of Samsung Exynos
SoCs and their device trees were organized under the "exynos/google"
directory. Starting with the Google Tensor G5 SoC in Pixel 10 phones,
Google Tensor SoCs are now of Google's own design. Add a location in
the tree to store these device tree files.

Changes by Peter Griffin
 * update config symbol help with at least 4 lines to avoid checkpatch
   warning

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Tested-by: Brian Norris <briannorris@chromium.org>
Reviewed-by: Brian Norris <briannorris@chromium.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS                         | 1 +
 arch/arm64/Kconfig.platforms        | 8 ++++++++
 arch/arm64/boot/dts/Makefile        | 1 +
 arch/arm64/boot/dts/google/Makefile | 1 +
 4 files changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 06760c45c582c..bee67180e93e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11245,6 +11245,7 @@ F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
+F:	arch/arm64/boot/dts/google/
 F:	drivers/clk/samsung/clk-gs101.c
 F:	drivers/phy/phy-google-usb.c
 F:	drivers/soc/samsung/gs101-pmu.c
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 1489bad527d8e..c52dc955df5f0 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -154,6 +154,14 @@ config ARCH_EXYNOS
 	help
 	  This enables support for ARMv8 based Samsung Exynos SoC family.
 
+config ARCH_GOOGLE
+	bool "Google-Designed SoC family"
+	help
+	  This enables support for Google Tensor SoCs starting at the
+	  Google Tensor G5 (Laguna) found in Pixel 10 and later phones.
+	  Tensor G1 to G4 are offshoots of the Exynos family and are
+	  enabled via ARCH_EXYNOS.
+
 config ARCH_K3
 	bool "Texas Instruments Inc. K3 multicore SoC architecture"
 	select SOC_TI
diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index fc726b215f125..f2d7cd6eb5695 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -19,6 +19,7 @@ subdir-y += cavium
 subdir-y += cix
 subdir-y += exynos
 subdir-y += freescale
+subdir-y += google
 subdir-y += hisilicon
 subdir-y += intel
 subdir-y += lg
diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dts/google/Makefile
new file mode 100644
index 0000000000000..a6b187e2d6318
--- /dev/null
+++ b/arch/arm64/boot/dts/google/Makefile
@@ -0,0 +1 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)

-- 
2.55.0.1082.g2b9226bbc0-goog

