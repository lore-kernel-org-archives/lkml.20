Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794262575;
	b=e5524nKvEtA816EDtJoBfOzenUKHOabfZQBcAYDs2Q6Z78dL5iRIZM9xE4D0RRX9MFua
	 ICrjdjPIZ2pJ5BE4MS+SSfylRFZmXC5e0MKrSUGuJ9bl5l/jRDP86w0UOBYf4KGzRzimQ
	 EgufV9sOG1S2aPbgBRsn0yEQ5XsGfkQj7ytA9rwmiD3fUTsUpBcOMVLMTeVrdNjSQQdlH
	 ZDLYi4KQqGFhi3DhHQyhoTduZrJgCWMdFxHaJPamD515IY/o7gxxLNqBsxOk978NOVEws
	 5scTOdS2HTdx7vVftKKM8jfAhA/z+rngKfrqH3yMdpT7AWupriRebVpT+pTyB6TL/pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262575;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4FemD5xhOYnoxUKsmEWJQcftEMPDrfhkiKUBcodzP0A=;
	b=s7m+s2rdGf3au+6hycd61DKRWh5zzPcsq5BeiU8w5OHWCj13Gx9UVvU9nKdFyP5vFei9
	 DXjcjAWsIoDV24ezwpGKJCyYCdfF30LpG5LYsjxSHhsIRank5XZae5Bwru6YqVwLvcDqQ
	 X36REDSQg9O/BaYIJqgCh1VL97YoqDFn5zPM7qdBiRqXtIQZ/NjteMOuJBtlgK1s3Mugy
	 EquVzvVg6g3LIgNx5M+NgyPOfSJPltB6S8+Cc9ZbjgpUqDcpJ5tqciFEv6pqsZuqovAYU
	 2AMvjkWCC8ZRNaQX3E8Z1J6op/YIzw6b2Flu9ZpbP1Amsi6bOpfoT48a24jjP4m7mBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	arc=none smtp.remote-ip=95.215.58.51
Received: from mta1.migadu.com (out-51.mta1.migadu.com [95.215.58.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5E3606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B5E3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bOWnTS1Ifi2XFoCDR3H2nfoH1oKDAc2ATIMj00qbqxU=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794262567; v=1; x=1794867367;
 b=M7yUFPbYbI4tJu+KAhWjCxC6vVrGHz33HpR7g4f4rxsPPqjidm+ZStA7H38/O2fEiEpN0UVU
 HNJWTbYsZ4FV65gAXo/WixFhG4tRfIsR7liiypo4mIz+w3KUEs53Lvg/wpcJbb8YEii3WodKsj0
 C2+n6HTfK2xpdC9E+XCIzGm7R023WUcc8oyRQqVaL9yOo7tWEK1BBSrQvo1bkdd6wd32dql32L/
 6o2mZgLSJhN/oFJkX+dj9nClR+xLuJuQX4WDwklVZ/cAR5QAY3ZFyq+VlfM48CMdbn/fcZvQQin
 +39sGvofwdRC7vFaoPWVr8FvApQFxMe4UI6eE8OGzp+3g==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e58252eef6db5d3f;
	Mon, 09 Nov 2026 22:16:07 +0000
X-Mizu-Trace-ID: e58252eef6db5d3f
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Michael McAllister <me@michaelmcallister.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] arm64: dts: qcom: sm6115: Add Motorola Moto G9 Power (cebu)
Date: Mon,  9 Nov 2026 19:14:35 -0300
Message-ID: <20261109221453.658316-7-val@packett.cool>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109221453.658316-1-val@packett.cool>
References: <20261109221453.658316-1-val@packett.cool>
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

Add a device tree for the Moto G9 Power with the Tianma display panel
based on the Novatek NT36525B DDIC. The panel driver will be added
and enabled here in separate commits.

Signed-off-by: Val Packett <val@packett.cool>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../dts/qcom/sm6115-motorola-cebu-tianma.dts  | 18 ++++++++
 .../boot/dts/qcom/sm6115-motorola-cebu.dtsi   | 43 +++++++++++++++++++
 3 files changed, 62 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-motorola-cebu-tianma.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-motorola-cebu.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6365f0ed0406..84ba824ed715 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -390,6 +390,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-xiaomi-lemon.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-motorola-cebu-tianma.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-motorola-guamp-holitech.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115p-lenovo-j606f.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-sony-xperia-seine-pdx201.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm6115-motorola-cebu-tianma.dts b/arch/arm64/boot/dts/qcom/sm6115-motorola-cebu-tianma.dts
new file mode 100644
index 000000000000..31ca51570ea2
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm6115-motorola-cebu-tianma.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2026, Val Packett <val@packett.cool>
+ */
+
+/dts-v1/;
+
+#include "sm6115-motorola-cebu.dtsi"
+
+/ {
+	model = "Motorola Moto G9 Power (Tianma)";
+	compatible = "motorola,cebu-tianma", "motorola,cebu", "qcom,sm6115";
+};
+
+&dispcc {
+	/* Preserve the bootloader display until the native panel is supported */
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/qcom/sm6115-motorola-cebu.dtsi b/arch/arm64/boot/dts/qcom/sm6115-motorola-cebu.dtsi
new file mode 100644
index 000000000000..6f5263a67319
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm6115-motorola-cebu.dtsi
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2026, Val Packett <val@packett.cool>
+ */
+
+#include "sm6115.dtsi"
+#include "sm6115-motorola-common.dtsi"
+
+&framebuffer0 {
+	height = <1640>;
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sm6115/Motorola/cebu/a610_zap.mbn";
+};
+
+&i2c1 {
+	/* awinic,aw99703 backlight @ 36 */
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sm6115/Motorola/cebu/adsp.mbn";
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/sm6115/Motorola/cebu/cdsp.mbn";
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/sm6115/Motorola/cebu/modem.mbn";
+	status = "okay";
+};
+
+&venus {
+	firmware-name = "qcom/sm6115/Motorola/cebu/venus.mbn";
+	status = "okay";
+};
+
+&wifi {
+	qcom,calibration-variant = "Motorola_cebu";
+};
-- 
2.56.0

