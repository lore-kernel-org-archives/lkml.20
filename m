Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724483;
	b=Z49CcEOU5akdJjR9uUyw7P1EBdcPUhgF8/7pKEIlJUz0Og3jPTP9jbhSGOZ718OPKNQa
	 BCU9dBUUsKxxG5T4NHT6qGI6t9fV4pji6SIXWek1pskaEiF1mkn3krbedlMEMxlbbvhP9
	 mEKFYrzXcpp/C4UV/H4leB6k1JLG4xlRtcP/iBR/jSwgH0oCn6Bf1ugeiEcYM2WQnjWbu
	 uVU68i4GGeK66C6QeHJdNUIvFyPK5QUfdCLhOV9Q5Q3vxcWyp8QPYE99ftQcZ11EYJEfD
	 23CH8FwRfuIYdvMFSP3n8QhieQPATKvdLHwd6wwbSldvWUrVbFQnEwQDDlh3He7CM2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0DHqxRU3I3QAylUw75qoIBcYNwXHNjO4FsY2C/ZCxGk=;
	b=JD2JoEqFw8wPEf1MZqb8AlOH2cUiRN4wqIupRQf/gyHYLmfbShjPoBYroSf/r9wByxhr
	 MIkN0Tl67Ju/jf+dAy1v5OZZ2vBLTVG3HPS6fkQhMqYm1jvBsHsGeUX5wBlIycE5VbEUU
	 Ya5EgX26pg7/3BZlLy0RI6DjJaA6NngwCvXGx8/VXvRtRyLJvOG0frOkdD979JyOQkduY
	 CfATqvrV40th+jjlsd/8C2/9jwic/+WHO2bLkk5AZ0yfLP6NkiBZn2rlV+/mh/Ry6IO5y
	 jOURJrYGilUobXkkHq/Kb8bw66FbTgVF6G9rXFldVrnVcLpbnwfCBO/FVcPWu7DA8PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TeeHNMFq;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCAE606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BCAE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TeeHNMFq
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so43742525e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793724480; x=1794329280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0DHqxRU3I3QAylUw75qoIBcYNwXHNjO4FsY2C/ZCxGk=;
        b=TeeHNMFql7z/dmsDhMNob7K6l+sxr3dGrDQYy4AMO1t13woq6zGlwN6vk1pkxkwMp7
         7a9m2XWFjxq9xYWZouL701hCI3RdmZyV8iEN7Fiplv1Mv+UDCjEAF4KTcBdnEZ743pcx
         +8o2zBx1teVEfxt4yvSC2r4WMRsYqUS8unaKkLRtdwQ9jDj+jSDxXaaDDdx8c4ywtdgj
         wDE6JNwd98H9+hAY394lPPe+XDt5sFmgalZ2u1huCJgqnGyO+sNiWOQaDtza5BpQFnnr
         ROzuKCzzGhOwxSH/OYqGHpxkLMkN/QtdQ92XCoypAcfES4v8j1Ewye51T75/GlKfgw+i
         DqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793724480; x=1794329280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0DHqxRU3I3QAylUw75qoIBcYNwXHNjO4FsY2C/ZCxGk=;
        b=PR7NUXcdrroQAyBV1ccZYlGstOKVdRAq7uaHOECj093UGvmayMKuVXqYItclJXMI7/
         vKXa+GTnGF5+iZaOWFRmcr9CWjC6xxrNPCwArAOvbfGP04I0we9gB/AbXISPlpl03ztl
         qQagtH/MxvleJf+f5HEmpAQdrfL3s0+hyy0rf2n+EtvPmoxd12jk4Nh8IAxTk+Dl4Aic
         I1lA8h9jflsIV+Mqli6oz/D/Hrb+N8Qys8gjrRB++WfVpkdEnJ0PxK9bXMWreFG97gGY
         IuvaDKrlze6NioKxDDki2AYKABDP3B+KFcPb/4Uvhv2SRwX55Ct0zccGMj5gFgVwK+Ne
         04Pg==
X-Forwarded-Encrypted: i=1; AKwUvByhvSASBQ48xG38BQCRgX+eLJ9/+pP7m/TV2su1OFuwBgl/kuuEBtQPtt+xl84nYd/zOfkYHI8Pad/sAlA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ucQPbBp3DAP2rvpJ87BZKC3SRrAOkK+YpfUd4DDCDjSdC4wU9
	EtpNibZjksPTJWQQYxY4tSDp9Y1oFJdbeWCQz+2tTBJFNwwgWFOpEaVs
X-Gm-Gg: AYBFou1Z9QE0utrsoT1wUpYfmUKBH9GZB7ouwjTqQi8EGc5gqKRHjjFibNWiVbLZJJ3
	ztpmqfWqSkPqMwyOmgiXCShF7MDqltNC05Tf+ncTWh9lppQcOoPq/3lBjcUroo0dFqlW/m3soc0
	RvGcsyCkY+lH1mbxvafpjepkIOHHlDgEj7gmyuEK4yCcCjK/Q66JmzrJntHnqvzGUKUPupaszls
	hHnLxN51ElulHMF2NkD3W0nrwm54ECVoT4xnJ1pKac88RvKCpWiJp641QWrYbQXzH2CCF6rNg81
	AlZexvXghre+3rUQ96fqXpIYZD/eUsgMRg3Y49eUIvreBh9my6pYi+rlyBLn2uEfEiiGnWwwByY
	87D+FRHg/0G6lARC+gxQCkDATsg0oWnkhuOOyJAG8R+9RegBIYPLu+p+oWfW/hQCumTRuTEVM2o
	8oXHXzqL2i8UrcxdDncAYXO7KQcVgNiCPFgevux0d/jpU1cLX17pvhYk9TyDAB/ILUO1vFA/ufZ
	YUeB8z82QTX8NY8MmoB8lV3Z3Nioxg+q5ISE+m+wPFoNhIial14jd8NUG8hhxcSqo04MMannpIr
	/BEKPDmkIstA3CFbIANOLTUVk62YqSO9MQ9ffie7OXSTbzfC2G6JOYimJOZMSTV+8IA=
X-Received: by 2002:a05:600c:8b85:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4ac1932b550mr276786925e9.28.1793724480320;
        Tue, 03 Nov 2026 08:48:00 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a555e59dsm79469835e9.0.2026.11.03.08.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:47:59 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH] arm64: dts: amlogic: khadas-vim3: add SPI NOR flash overlay
Date: Tue,  3 Nov 2026 17:47:30 +0100
Message-ID: <20261103164730.160593-1-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The Khadas VIM3 has a 16 MiB SPI NOR flash (W25Q128) whose data lines are
shared with the eMMC D4-D7 lines. Add an overlay that restricts the eMMC to
4-bit mode and enables the SPI NOR controller, exposing the flash as an MTD
device.

The flash HOLD#/WP# lines are wired to the eMMC D3/D7 nets, so the
nor_hold_wp_pins pinctrl group is intentionally not used.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  2 ++
 .../dts/amlogic/meson-khadas-vim3-spifc.dtso  | 24 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 57bc440fa55c..3714cbaaa03e 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -23,6 +23,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-bananapi-m2s.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-spifc.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-ts050.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-cm4io.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-mnt-reform2.dtb
@@ -104,5 +105,6 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
 # Overlays
 meson-g12a-fbx8am-brcm-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-brcm.dtbo
 meson-g12a-fbx8am-realtek-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-realtek.dtbo
+meson-g12b-a311d-khadas-vim3-spifc-dtbs := meson-g12b-a311d-khadas-vim3.dtb meson-khadas-vim3-spifc.dtbo
 meson-g12b-a311d-khadas-vim3-ts050-dtbs := meson-g12b-a311d-khadas-vim3.dtb meson-khadas-vim3-ts050.dtbo
 meson-sm1-khadas-vim3l-ts050-dtbs	:= meson-sm1-khadas-vim3l.dtb meson-khadas-vim3-ts050.dtbo
diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
new file mode 100644
index 000000000000..c70780b11b9b
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Jose Nieto <jnieto.alaber@gmail.com>
+ *
+ * The Khadas VIM3 on-board SPI NOR flash shares its data lines with the
+ * eMMC data lines 4-7. Restrict the eMMC to 4-bit mode to free D4-D7 and
+ * enable the SPI NOR controller, exposing the flash as an MTD device.
+ *
+ * The flash HOLD#/WP# lines are wired to the eMMC D3/D7 nets, so the
+ * nor_hold_wp_pins pinctrl group is intentionally not used.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&sd_emmc_c {
+	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_4b_pins>, <&emmc_ds_pins>;
+	bus-width = <4>;
+};
+
+&spifc {
+	status = "okay";
+};
+
-- 
2.47.3

