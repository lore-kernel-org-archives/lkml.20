Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23084B2CBB
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 15:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622363; cv=none; b=A0H12CEYZ9EQJK2jrsNtQL32cpaUQaV/+nyt0KskMTMWeuzmmA8tDX/8dlg4Gr2C0dSB90l9DHVseCL+LxlQQ4k9nB9WTA54wA0RxOn37PCamGyWUQFa6yRIXUJj5awg0q7x9Ocq126gwKqWLafDIJ/UmzBFUkanZZdJ2+mB9FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622363; c=relaxed/simple;
	bh=1vLHCU8lWJSitlPYnCaz7byT5JPQIj0L3X0Yw58PruY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tafkhDyUrSd91DFq5lOHp0WmttNkyXwtHl54MmCz4PJ7i2IN7of3y0dwc/4nM8xvYLNNtj2TDdt1JpR79kep6CNxEWwn7Bs9LkwmEH/kwn4vztTkAVf2uoXzxxHMwHZGEItNytwlWTXwooWfm4xQ+HUyws6oMe4v/u2sDRXy4/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso16264245e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 08:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622359; x=1789227159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n9Z1qKT7EogtF26L5TwSpOWlLsafa9aGvAtJ1Qh1QBg=;
        b=NM8zyQfxkRNa51P3wtvHOwfLXVTbFaAups5iVow6u0PDDAWRaYhabIJWM1cSsBKQUa
         bOZAWcoalvnEDXoc0zWfP8OW2k6mkSjrxgAqoamhYIdgZNjTfaOmn8vTb0oz0r2RzqZa
         UQqq6lEKrQr4ZYtAq8ivJ8fVpyPjYFmf+mt4ieCsjE9tZpWPr5LkKMqkDQcQsF/H7cuM
         I3wqfq445HtijhEso5dYVwk7Lhy8+X4HVGWLBtr6NycORmsTXYIbVWY50P9TVGG5x7wo
         AStXIlAVpkLE4K6+2xrcjydsluXMSzT3F52elpDx+mT8Y/czkknksbSYmnUz5nR1tOEA
         9Shg==
X-Forwarded-Encrypted: i=1; AKwUvBxV1cihoOeby6gFtX4+5A854xTs8cYGMMkro5SgK7F743vMazdfGt9cVv6UaeGV0uSnjw45Va8RDuuAQzg=@vger.kernel.org
X-Gm-Message-State: AFuF++ndDohByVdVyz5n1Mv0IpZ9Gbju5N07e1g8QS56pkRQDc3KcRc3
	9hfRgx83f9AiDtyupCdN/Kp0C46kPeJ0AcHV60JSG4rdmJp8DSLPR8/b
X-Gm-Gg: AYBFou1aMS3HtM5SxZRRCKbB1ulBwe0dJwN6DPs8yKO7Vg0/sr7qA27FiASZeUz0kQ1
	jnv3SDpMEf5tFxmwFyJ4skdk3BT4G8/SvEAL33ujGqvWuXKIMioAB92uXA8X99aXoXcF9Du6wOE
	Ac48JAqaA3rznoiqW1KSQlj6luoF/mjsr+e0+WDKkLlgSn+KZTRMSKAJ7UX/dMCXMGsJ0SD/2QU
	aGd7qLlDE8Qyo97tSLSd38wloTpA54EeKBxn9JHhLHXOB9wXetQ4yblusjlOhyeWIF6hPA0GmrV
	8J+/YgDdf+BbkdHN0gR1XBlA4S08hUN2R2dcrU4PM/Fa5G4ipgIzmhpp3aCr0SNqZGg5pibAUVi
	M9VSkIuvEJI7pcOobo+aMREgG8jj2u6ok1iS5HVdpk2yAkjnWD4lP6TGpXSQBI7UP63BqxysY3C
	SRmL85v1+JkpSTw8Am5BSrw+63EKPZdH/wNHlQgghrRMeU6huG3fzezLXrQ4uPJ5SqD1YysL4HY
	PVtoqbvr4l05xlhwtKWesa2ew==
X-Received: by 2002:a05:600c:a0a:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-49cf820ccdcmr130205405e9.7.1788622358693;
        Sat, 05 Sep 2026 08:32:38 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm16691913f8f.25.2026.09.05.08.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:32:38 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
Date: Sat,  5 Sep 2026 16:32:33 +0100
Message-ID: <20260905153234.133217-4-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
References: <20260905153234.133217-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SD/eMMC controllers reach the DRAM through a pipeline stage that
the hardware design inserts in the bus path to the NIC_MATRIX fabric,
clocked by CLKID_SYS_AMPIPE_NAND. When that clock is disabled, a
controller that starts a DMA transfer can never complete it.

Reference the clock from the three MMC controller nodes so the driver
keeps it running, instead of relying on the clock being marked critical
in the clock controller.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index c3dc479b137d..dbb4a95652c6 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -730,8 +730,9 @@ sd_emmc_a: mmc@88000 {
 				interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_A>,
 					 <&clkc_periphs CLKID_SD_EMMC_A>,
-					 <&scmi_clk CLKID_FCLK_DIV2>;
-				clock-names = "core", "clkin0", "clkin1";
+					 <&scmi_clk CLKID_FCLK_DIV2>,
+					 <&clkc_periphs CLKID_SYS_AMPIPE_NAND>;
+				clock-names = "core", "clkin0", "clkin1", "pipeline";
 				resets = <&reset RESET_SD_EMMC_A>;
 				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_A_SEL>;
 				assigned-clock-parents = <&xtal>;
@@ -744,8 +745,9 @@ sd_emmc_b: mmc@8a000 {
 				interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_B>,
 					 <&clkc_periphs CLKID_SD_EMMC_B>,
-					 <&scmi_clk CLKID_FCLK_DIV2>;
-				clock-names = "core", "clkin0", "clkin1";
+					 <&scmi_clk CLKID_FCLK_DIV2>,
+					 <&clkc_periphs CLKID_SYS_AMPIPE_NAND>;
+				clock-names = "core", "clkin0", "clkin1", "pipeline";
 				resets = <&reset RESET_SD_EMMC_B>;
 				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_B_SEL>;
 				assigned-clock-parents = <&xtal>;
@@ -758,8 +760,9 @@ sd_emmc_c: mmc@8c000 {
 				interrupts = <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_C>,
 					 <&clkc_periphs CLKID_SD_EMMC_C>,
-					 <&scmi_clk CLKID_FCLK_DIV2>;
-				clock-names = "core", "clkin0", "clkin1";
+					 <&scmi_clk CLKID_FCLK_DIV2>,
+					 <&clkc_periphs CLKID_SYS_AMPIPE_NAND>;
+				clock-names = "core", "clkin0", "clkin1", "pipeline";
 				resets = <&reset RESET_SD_EMMC_C>;
 				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C_SEL>;
 				assigned-clock-parents = <&xtal>;
-- 
2.55.0

