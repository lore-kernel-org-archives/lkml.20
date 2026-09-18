Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2304C502575
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 19:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789758327; cv=none; b=dGZCZlTFPdCtmDc1LH1kQCOQY6vx1QmQAAiH2PYT3hHhwv0q+q48xvA1G6LNERgN3qxzv7DAixK6FsmWZZl2uYsTifUNe9fTy9nf0t1UoCEQsgHn3WQOnIqT7M2CniZfmlTnx6lhF7vAczKasTqn4vfayqgzuvkJ93qOcRmgEy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789758327; c=relaxed/simple;
	bh=TkeK6vGmZcwODlJlEq5gVtqOmy+dm0WEcZnbleLPAiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h7zzoDAgCaKJOXJbhaMdOiUMvTlpl10zeCjSFyeFl/KwnqixMqCrM61LLoHE62Nh1Vybrkd5DxIddWGEYCIfg3GVtNPhdh+Nc7/n56IVqRM2bshp0Q1rgxmWxl/ueffoCvMo0k5kuKjEpegNOIVpBasez6b/B195oID1GeJPrYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zsFR+o6U; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zsFR+o6U"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a605844571so1452061a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789758318; x=1790363118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q3e71ONX+G/tBeD/v6Wra0d6veIuI4yfjRsJjDPREyI=;
        b=zsFR+o6UcRsLyw+Oe7joB2aAkjIxMXYd9XAEFxTIMw2aADg/QKDNFpQZ9s95P9Ah/Z
         +Mtu1yw0Flph4elbljzLl0eooc6l+Ets3xI0jS+HoSPt9lW/KROraX5zicVLO6epY0mH
         A9OP/W8oZjfWcXJz0IoRWv/XphoxLKFRQJaJRN9bpyodMRXJDaHzJDpfP1Ce4KXB1F3r
         MF4iCz0XyeGLBLLIOlui+J498mg5tYMLqtonmRZe1j9ZvItaNuwRTNzOiHMVOVngZ67M
         I+jULYgQH5/4BAaqlQCPHcyqlgJYmtH0bJFYz5JXKAm5JVJ5prBLUEjXEpSmXn1BGx93
         yhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789758318; x=1790363118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q3e71ONX+G/tBeD/v6Wra0d6veIuI4yfjRsJjDPREyI=;
        b=Ggznfo+tRDUF29Oy1ORToX8INAoNjliDyASKdDed1LD9g4qvjOXZsO+nUAs9U1fUux
         epVjEuvMpYQoD/qzD8NIL16VulY+W6UzgyQo0RvJHGKLVo7id/KLKEs7ZNXHgfRnkpOQ
         ZTbaWsxMpoSajWlC8rw+3rY5m4ud/hK3bfwaP8FZGFKsyOP4o4s78A5T66QvI9dXx2AP
         iADxcoojQOXjYTekDxyNWGFOkJm9AQWAONqAw6G+G+zienpmbCysb25jUMLdOM0ckAIC
         aHZvjysGrzsMbvkQXhZHZG8CaFVlrI+roZTRFf4gH1LHvsLrs8lTtEq2AFTeabgdJn7J
         uGAg==
X-Forwarded-Encrypted: i=1; AKwUvBw7WaVlZILWP3v2Tce+tqma/uXpmSt+WEJFp1CNXP4ynz6NCTTkfeHXc2idKDoJ+Kh11fkPLszF1lQsQaU=@vger.kernel.org
X-Gm-Message-State: AFuF++lLS7eOMcUHELpsQxY95+3oSQsHuTxN+AcdjV7R9cgUNaE2hObT
	oqQRXiLXJeEmC1CWRZkVedHpCL2kdgTn5S/pr+MkOs/5tY7PQHwk4+uJFuoX2ELMY9g=
X-Gm-Gg: AYBFou1a7mo9cfUMoPx5lqdK5ty4YnFuJPkfIDYkBFdcv/uRRDRpqzTbzOIaEg7KRqz
	Ry8hL25KSUhdHsAUaEdRklZbI7BS03rEH3Lt7j8JOoc8tWD5gIeKBH0QSaubrReTBEaG7niWDDG
	WucNAUOfFLIo2IwZSQy/lfO2A5/u8sAY3ibyYHj65mLYGCPJpdADBN7GbUTTFUDmhQQ4vvQEOZm
	APCPCG4q2h4UrSQ55QbD72l5fjYmu/8bmYp6K8d2LjA5h4E1lLdW/rgC6SIUfIPyDS72ySfkObD
	KCttnn1VV7VPr7DA/6/NwNn0O1Iig0sRYKRH6WUVrPQz6f8qmZBYvSQvwQEgDAvfpSMN5Lyuvz5
	8zudzWAc1W5v35nMuzCeyuJhb1o/T8EvqbYhEOphgGLPMqxTeyFzjBZyWLF1WpSGAt95pDu1Nnu
	DVW1eEmXMqsKsqTlrxln+leEqboc5REy5Z1XxI11MFZufAzP1x/U8UhmPYCy/T5+jZSylmaIXQW
	LHEV2Y6KUNiWbz9PvWnscOT3Zy3li4WAU/zNpAs95n8dRb6ITmePSl6OEyHSDA5lA==
X-Received: by 2002:a05:6402:44d1:b0:6a9:864c:9d94 with SMTP id 4fb4d7f45d1cf-6aa5478c375mr2128847a12.28.1789758317951;
        Fri, 18 Sep 2026 12:05:17 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67d816b5sm276250a12.7.2026.09.18.12.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 12:05:17 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 18 Sep 2026 19:05:03 +0000
Subject: [PATCH v4 2/4] arm64: dts: google: Add dts directory for
 Google-designed silicon
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-contrib-pg-pixel10-initial-dts-v4-2-745eaca28b1a@linaro.org>
References: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
In-Reply-To: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
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
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqrYtr5aHSDKl9noo06BNkd8osr/Plkk20PdGfz
 j0SOaUFP8eJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaq2LawAKCRDO6LjWAjRy
 urjGEACe2s54bcgCahpxj0EnmR+fOJnSwf4ZNZ9wVRtqSfL8ilwhKiumwUxwy2YxgTpk5bpWT/3
 1vZJxrf2LvN6AYhh3ep9mgX2BiamhruP/E21D5Tr6etaFpLJBGTaoYyv1yMwJku7CbTHpbmtqUL
 PhPcQ6O5HmE0c2hH6Q4FxUH9ttGQPOHuXEOiHvW5Lx5DFTosZEF02Oqkd6j8pnAEsxfV01f4lhL
 iFOfysPwUtOmmRMjsd/Mw/EKaUUSBzUKCeKJfmYvl3GtHS/wLs1znPgC3tlgaMNN4MITbdFSkjh
 RrcW1yI7pXCGBLxVfGEAYuT5VoKuctsq/P9Pxd6TqAo1t8scng5yfntyB+Q0/8An8Qe1IktP5ZO
 zw1/jsLGtv3Zt/Rn9mTzf2chHSZn7ZjMxbhaGOjmCQZ2kacipfNhw2UGWCllzlVpRWAP2RRX0yB
 U4BP6v1ajteQlwkl7zFcxziy0078mVaerRjB0eQ4lUK0YIGVycznhxt0eA0A6+iFBnz09ORugMK
 SW8iSjINmQEpRDL1ZWYahwmTAyS7aPoHAqggEffadBhG2X7/KT4ptnvgD2iJw2LpXpCV7xyllNz
 Ggx37X4pYHc9p6J7ArFQnTRTH4s/JhFBcff9hlkJVzWOdvi80uetjTK4niGSmnwD3TX6oIQlCwe
 +lDj6JP/5sACyjQ==
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

