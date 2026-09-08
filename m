Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383DF598BF4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889478; cv=none; b=MOtnZTvX0p8d2QAz8tSq0+kuAlkIZ+gkpSBf3jy36dcfSwEQs3wRu9Jrv49aP/abTY6gblD5Csy6A4GOZvGd5kD1XEAtzZEGyAKl1X1DcbPKuC81jd/fupiCnGlCB6ktcWj2np++t3Kgk4Jyu6bZzxCZs9I/CIz/rhgCVlDV4Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889478; c=relaxed/simple;
	bh=tExviE9CW/8M7Prprq7bTs/MM5YZtoVL85qQ81yVr/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uSmXBm9h/IctoXmEEpNH7BjJAjWJS/0cDXZ80v8eLVZFLRqFWafmYyEcGjr//9F4cpDt1EKDvtFnzTfA+yIPzGd7vGygNlHBTvuaIYd/Meghi7KSHEpT3EwtR85IvPqupS+KkAGde8j8Ye0nprj8PaMSbuualZT+Dwu8YII4jyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZgsv7q1; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZgsv7q1"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so69906995e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889474; x=1789494274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fs2XBLRa4Y7GGFVavktwvzQaugjZopUPytcWu2OHTeo=;
        b=fZgsv7q1pEyxq/6KgemB/GBW6fOcVF2sLfDlktxgGQSFWBNL0ZogecbcAOCtlNLxg2
         Fa6md3mqcU5Yusg1qj4OnVpl6BKP2Pn76NW9UJRBvuPj4+hh0MMVbXMBhNBKg1gdRYLU
         XIUMldXUHuC11IN1cB7hodV0YzrmkqyEfqjqzkLDSrlXYUm1k6kZB7cVE/HbuhkiILl4
         Mv6mJjqAvYg0V6eb4Zy1YTTRQRX9l+AfwDiDr06bFZFvCMsieGSapa4xQhYWOxA2xNAq
         tDnWUGwj/FXfpTA6xjKTJY3WabPsGRC8POsuyCUOxSooag/QgeQM5uUjnRqDJVw/+CB/
         nidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889474; x=1789494274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fs2XBLRa4Y7GGFVavktwvzQaugjZopUPytcWu2OHTeo=;
        b=qTGBxsFvp6g377iqIwxszjENJQJifxaSiCedIjym3Nl8fr7DclR73+ACyG2O7E9pea
         wYV6YINAqQHEukQaHCk0jXfrLj0R0AGWyQ7q+2Jj1j5fZ/F7Fp/mtwmhsx1mu0HIn546
         XQoA96Uo45aKrk7jz0z9ScN9qlU63QbYS2SxZKP1ksoQ/ln1vbdFOmIYcb0KxEie9s6c
         9X/Ka7tp319oyGbzqTxnBOh27BVclN1Bvo6MjiSinxmHimWlHMTgKiLZ9GuqU9R2X6Zx
         2aW+Dn3u/+kuAiFfmiGLnB6Y5ZJHu+bCLptbmcxjKN56k5VTnQugwytQaXDiqV8hs1a/
         /7Kw==
X-Forwarded-Encrypted: i=1; AKwUvBwcFO1zqbTbamHnlE1J1yIl/Vt/j8t9ZmiKcDJgSfBiWEW6JQIsAFiGazg0opVpow8ZofmIdV4XTNK3qyQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lSv9oETG6T2sUa+QAjMDZTyh+RqfmgjDF32gBgj+PM5g7kMgrL
	eBniaws5wB+qHa5+5ItD6G9kfQD5kvK1I7u/s3rHUhbvMuR8U+gzoPop
X-Gm-Gg: AYBFou1F1jbDM0Gdh5XPBRXDEzX/QhP9OiRv2D5k5njhCv/DPU0TlM/bJbg8FipqqGX
	CspAB6ViSvo7cxcUMf+ZZTkQOZc9AIB+rSz0+K68AdtDusdI384tHDmeXoD+Rs+9exbMLyKeES/
	VLPHM46cGzQ3OYuh+qA8w/94FKfQAX1D0qPJl+/7wbU8fzooesnyGq4SAw0Ese5FEC6XeHXIfmT
	wnLIQpe8fOuo+8s1EDB9K3be7DooMTp9Dc2yLuwPMBkCk0NoPW5Qam8zkBjPM0K9ewVJvBrtLrA
	1nOGqOC2Z9k3c2A2BouDdxklVe90cqXB30jQFJoH/23a3LvrPKkhqZzX4qa8idlkrhIRd/DpjzX
	AfgOMFGHC2DgMbIP3DfAOELbYR+s1ewdyPVRp1yXwLo7Z75osbdb8RtqiMszEW8BukKZT1qlasK
	NeoO5Bbhfurz6LUD0J5Yp5f2h7uHpD6pzjI+3BJPLER/Nqgmg4Y10Zo8oF
X-Received: by 2002:a05:600c:3e06:b0:49d:99:1d98 with SMTP id 5b1f17b1804b1-49d00991db1mr238844095e9.9.1788889474128;
        Tue, 08 Sep 2026 10:44:34 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm487081105e9.15.2026.09.08.10.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:44:33 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 5/8] arm64: dts: mt8167: Properly describe the SoC watchdog resets
Date: Tue,  8 Sep 2026 19:38:32 +0200
Message-ID: <20260908174259.9009-6-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908174259.9009-1-l.scorcia@gmail.com>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 toprgu is not really compatible with mt6589 (it has 14 sw
resets instead of 12, and the reset IDs are different from mt6589).

Use the dedicated mediatek,mt8167-wdt compatible for the watchdog driver,
as it correctly describes the SoC resets.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 27cf32d7ae35..be215390730b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mt8167-clk.h>
 #include <dt-bindings/memory/mt8167-larb-port.h>
 #include <dt-bindings/power/mt8167-power.h>
+#include <dt-bindings/reset/mediatek,mt8167-wdt.h>
 
 #include "mt8167-pinfunc.h"
 
@@ -95,6 +96,13 @@ power-domain@MT8167_POWER_DOMAIN_CONN {
 			};
 		};
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8167-wdt";
+			reg = <0 0x10007000 0 0x1000>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
+			#reset-cells = <1>;
+		};
+
 		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8167-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
-- 
2.43.0

