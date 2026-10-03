Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC3517A586;
	Sat,  3 Oct 2026 03:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790997307; cv=none; b=uI4Z08XpPZ9un/VPvgrLM0IeE1c4ZyHzQ0DDSO6aoWi5ZT/Iaf2VunmLvpl+5tY/d/xsWUs+y/OmjrxLsxp96Irc3VNqls/BhaTnN2b+rbtba8WlCPGN3xnxKnpO1ZuvtY1vKVoIQThUSZhf6F/llK9/VPrQAOg8qu38NVjQqc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790997307; c=relaxed/simple;
	bh=5T+24V9e8z5HCcVYrnNkaJSm+elLVTowiHzkPZ1WEDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CskDbVaJbqdjxy7ZVIaWdThvg9IJYxosjkHZcatpaKXSE7YQg9LwA/UnYRt7H/g0bYVKc9r08xlk3KOS1aV9swd4/OGQDbQL3CMsoi1Wh2UH2jXr5tVzs56BCDswJ/uZpB4S0/1loqhZlNG2zAVWI52ketlaBREjNrMhwIOb8Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDYztaxF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDYztaxF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02881C2BCF4;
	Sat,  3 Oct 2026 03:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790997307;
	bh=5T+24V9e8z5HCcVYrnNkaJSm+elLVTowiHzkPZ1WEDA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=BDYztaxF0fBSUzUoc0fJ88KeJqIG+gyLyxHi70UVRctQQOlJKx/MC3CPhFeOhvjiE
	 UO00/4ZwEqSHbnf+C5dkGgrP+L2HeEcB/3kexFjQjmZqOzWmvIZm3AmxAWpM+EP8Xu
	 d7/4F6cQVeEmSECs2BHdPIY+rPgG9dikpBilfFfWl0Nf/9VdsHWVCoLfz52ylWLVKO
	 n/AqN0YxVsjrR/DHcfVzhkUTDNBBMv7o79DHmMXr8wlvn6nCEwwb5i8Yy40ivmpBKr
	 yuod/wkn4msxyz/AOeGYU+FSdxD+oXmPTT3Z9foe2wYoTZMDfnyObppnE+eG7viX87
	 j7tlyF/njuN7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E19C1CA5FDD;
	Sat,  3 Oct 2026 03:15:06 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Sat, 03 Oct 2026 06:15:05 +0300
Subject: [PATCH] arm64: dts: amlogic: meson-sm1-odroid: let the SD card be
 powered down
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-hc4-sd-power-off-v1-1-f7ffba01b348@iav.lv>
X-B4-Tracking: v=1; b=H4sIADhzwGoC/x3MTQqAIBBA4avErBvQ7I+uEi1CZ2o2KgoVSHdPW
 n6L9wpkSkIZlqZAokuyBF+h2wbsufuDUFw1dKobtVIGT9tjdhjDTQkDM46TMzzMrI3qoWYxEcv
 zL9ftfT8AAcz0YgAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Dongjin Kim <tobetter@gmail.com>, 
 Eric Neulight <Eric.Neulight@linuxdev.slmail.me>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1814; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=DXX3IOmUgvr4GKV8MwPySwGHNkc4UtI5AabTLkv0Z0E=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFkHii1ZN5pd3bp57Xa/9BMGS0Q/Nyxizfx87ucKy5m/h
 LYd9XL63VHKwiDGxSArpsgy4ZDGrYwlV//6e5g/gJnDygQyhIGLUwAm8siT4RdTE0fb5E2HJZm/
 t+actL/EXKd+772c6JWvkemOi7mL+psZ/hmbnPd+9vHr6sPOBx/57bo4Rb5yZufzaUxCu65zPav
 lTGEHAA==
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv

From: Igor Velkov <iav@iav.lv>

A warm reboot leaves the ODROID-HC4 in the bootloader: the card is still
detected - CID and CSD read fine - but data transfers fail, and both
U-Boot and the boot ROM give up on CMD18. A cold power cycle always
recovers it.

The card is left in UHS mode at 1.8 V, and nothing after Linux brings it
back to 3.3 V: the bootloader resets the controller, not the card. The
kernel does try to cut the power on the way out - mmc_bus_shutdown() ends
in _mmc_sd_suspend(), which calls mmc_power_off(), and meson-gx-mmc then
disables the vmmc regulator - but TFLASH_VDD is marked
regulator-always-on, so the regulator core keeps it enabled and the card
keeps its supply.

Drop the property. The regulator has a consumer that manages it, and
regulator-boot-on already describes the state it comes up in.

Tested on ODROID-HC4 with a card that reproduces the failure. Not tested
on ODROID-C4, which shares this file.

Fixes: 326e57518b0d ("arm64: dts: meson-sm1: add support for Hardkernel ODROID-C4")
Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index e6f02d738a21..7dbc75bfaea2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -38,7 +38,6 @@ tflash_vdd: regulator-tflash-vdd {
 		gpio = <&gpio_ao GPIOAO_3 GPIO_OPEN_DRAIN>;
 		enable-active-high;
 		regulator-boot-on;
-		regulator-always-on;
 	};
 
 	tf_io: gpio-regulator-tf-io {

---
base-commit: b44e2be772f866985cafdf90355285069ea68495
change-id: 20261003-hc4-sd-power-off-67d3f58f1304

Best regards,
-- 
Igor Velkov <iav@iav.lv>


