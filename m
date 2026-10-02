Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD443B4E83;
	Fri,  2 Oct 2026 18:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790966209; cv=none; b=Gzwwg72t0uu9K98OQErxM1kiEG1ZdaECJQfkgbDeJysM4j/3h09PJaBWcO5w1bAJKqyCVDCixTWIvIZ9lu/EWj+1D1AzgEqO3tx4ZgNjHsKr32hXnE+ZqByIKaa8nDe9YffcEzwSVCvCrC5D29ziAFyexJPEels64Wbxi3gT7yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790966209; c=relaxed/simple;
	bh=8mabWkB1QZPyJ7jiMjDf5gavLVLq2c6UrjUxdragye4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VuFKu38rLH2/v5lP/awBgX+SNeFqF0XNokhUgeaGqEkkqUXBpNnZGckn5ZIivUar5jgOW72kUT09I+OcGKK7L2H/QhGbctUzcLtYEQFkqt6BhcSQIJFoAuBiQTPSRRj8iiql9wDSZVTEWDdMCX1X76wdK7SCUmuF6zJGv8pi8Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n7Awfpu2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n7Awfpu2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 613B3C4AF12;
	Fri,  2 Oct 2026 18:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790966208;
	bh=8mabWkB1QZPyJ7jiMjDf5gavLVLq2c6UrjUxdragye4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=n7Awfpu2dmdNiFu6cViMaG21x35x+yr4RpScNuFma48E99V/ZBlIUifzZ/AyLLlDQ
	 tdnP3kJFjHygH4+/wPcMn1nswygSl9PdngEVE9XhXkIaLJokRRy+h5gyZ8LDGhPdfN
	 NA1HMSWrqLi76d8UpbLDqW7KROG4p/AhzZ5wTBRNPDMmi9Yk3ZaXcfJtiNVH5jsHr4
	 GECGA2e01GwyDUPVI5D3KCTfC97UzxI8mN1cznDY9UKAxzC+YlvfxybhmrOTCOBdic
	 wc1RwY/MtvyggGGjFTTpyCptOX7BJpd5pzxfvUwQ9ZqMwXuPWL4aN/K2uiihtmwXPn
	 ucXMde+gKokug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D8ECA5FDD;
	Fri,  2 Oct 2026 18:36:48 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 02 Oct 2026 21:36:46 +0300
Subject: [PATCH v2 1/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: mux the
 SPI NOR HOLD# and WP# pins
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-hc4-spi-nor-v2-1-8366a4f91049@iav.lv>
References: <20261002-hc4-spi-nor-v2-0-8366a4f91049@iav.lv>
In-Reply-To: <20261002-hc4-spi-nor-v2-0-8366a4f91049@iav.lv>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2206; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=qv7t3hORjY3jRiTyrWVKO4vO2S8H8j7Lyh7tlemugqg=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFn7f+5ztuZMzuk5vvpavrRqh3LenYmnpr9U+basd5J2r
 uta3ssGHaUsDGJcDLJiiiwTDmncylhy9a+/h/kDmDmsTCBDGLg4BWAiE6cy/BWarM7zMb882Ear
 6ZTz3J+ZPv4xJbZTunWflPGeclJ8pMfw3z/Ljv8F4+3Mmq9HTQ6tu2v+KYJjxaU395Vtsma+3tJ
 uzw0A
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv

From: Igor Velkov <iav@iav.lv>

The SPI NOR flash uses six lines, but nor_pins covers only four: data,
clock and chip select. Nothing claims HOLD# (BOOT_3) and WP# (BOOT_7),
so they keep the boot ROM setting. After a boot from SPI they are in
the nor function and the flash works. After a boot from SD with the
button under the board, they stay eMMC data lines pulled low, and
spi-nor reports "unrecognized JEDEC id bytes: 00 00 00 00 00 00".

Add them as a separate group in meson-g12-common.dtsi rather than to
nor_pins: whether HOLD# and WP# reach the SoC depends on the board. The
HC4 has eMMC disabled and takes both groups.

Tested on ODROID-HC4: with BOOT_3 and BOOT_7 set back to eMMC with
pull-down and spifc rebound, the flash fails as above without this
patch and probes as a 16 MiB mtd0 with it.

Fixes: 7178f340e929 ("arm64: dts: meson-sm1-odroid-hc4: add spifc node to ODROID-HC4")
Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi    | 9 +++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 00609d2da674..3135566df880 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -615,6 +615,15 @@ mux {
 						};
 					};
 
+					nor_hold_wp_pins: nor-hold-wp {
+						mux {
+							groups = "nor_hold",
+							       "nor_wp";
+							function = "nor";
+							bias-disable;
+						};
+					};
+
 					pdm_din0_a_pins: pdm-din0-a {
 						mux {
 							groups = "pdm_din0_a";
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
index 3ece30a0a1ff..c4b93d6619f2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
@@ -126,7 +126,7 @@ &sd_emmc_c {
 
 &spifc {
 	status = "okay";
-	pinctrl-0 = <&nor_pins>;
+	pinctrl-0 = <&nor_pins>, <&nor_hold_wp_pins>;
 	pinctrl-names = "default";
 
 	flash@0 {

-- 
2.43.0


