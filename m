Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8183257EDAE;
	Tue,  8 Sep 2026 15:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883030; cv=none; b=cclY4qoHMiax5U90FWv0bj9818SNEJseUnvgqc0Q0ytLr4SaiCK1wEy4Du7r5tTFJUyKrw+CZ8Qu6qj7fEcc8mAsRtIpZb7BWUN7PO6VspBtwmxzynqHfsy2LOpT8p6JxVRx0EKHq3p+CsuoxvkGgmPijPFLr4m+EwiEswmQfOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883030; c=relaxed/simple;
	bh=ip+IpCmoBvVS9h9FdcjcfhqPGvlYkU27E5KbC/vmW3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FlUzAWG8ZZXqHOuRmPSMrfjI+nFrI5//e/9djXLt8JCNCyotS9l01XtPoX0vY3o07kP4UyU1xbbFeFJKm3TFx0LaQMGosAo1CDKj2Df/LhM/tKwE9vKErifgshfCe7Ldz1AOSmBT3suY3Ufj9pvdleTw1Ons6+jvf0GVBdvCESE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdaG1UPd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdaG1UPd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 441ECC2BD05;
	Tue,  8 Sep 2026 15:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788883030;
	bh=ip+IpCmoBvVS9h9FdcjcfhqPGvlYkU27E5KbC/vmW3U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OdaG1UPdcLRYSWQt1C08Y3BcLHxZgQRdjstO6DV1f8RqHwJkxme7Klqrq6TvhYhqg
	 mxHgmyIvKDZGGodq6TuK19rnZ0AqtMZuk8Sn7SSxhcqpFfOF4TR3To7y2uleHTPts1
	 gSycEmcCHStq3IglTjTSSHRaPIvm+xzinLqSc2QgFEFrv/+6Qz24OUiYjM1zyrxCW5
	 c3p12fZ0TephifZreL3S41a12h8TdP4IS7+FHSgDpo6IbSq4lbl3zFJMXJsqMDdMvC
	 gXdUSDHoj00Ziz5UGgAImqAHb7rvei8l+Q1cETkD8F9O5VrTSKZHt6yI6pIPvyJyxn
	 ItuSSEE8d4kvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A922C79FAF;
	Tue,  8 Sep 2026 15:57:10 +0000 (UTC)
From: =?utf-8?q?Dawid_Wr=C3=B3bel_via_B4_Relay?= <devnull+me.dawidwrobel.com@kernel.org>
Date: Tue, 08 Sep 2026 17:57:01 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8250: add device tree for the
 Xiaomi Mi Pad 5 Pro 5G
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260908-sm8250-xiaomi-enuma-v3-3-0198c3bf954a@dawidwrobel.com>
References: <20260908-sm8250-xiaomi-enuma-v3-0-0198c3bf954a@dawidwrobel.com>
In-Reply-To: <20260908-sm8250-xiaomi-enuma-v3-0-0198c3bf954a@dawidwrobel.com>
To: Jianhua Lu <lujianhua000@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 =?utf-8?q?Dawid_Wr=C3=B3bel?= <me@dawidwrobel.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2890; i=me@dawidwrobel.com;
 h=from:subject:message-id;
 bh=WjYBVrEZzP3ExAdg6WDhwCT+UwHmbXt9I8SNxESJ/BU=;
 b=owGbwMvMwCV2qrTGfeXVd28ZT6slMWQtMAiJPyGz9fSSzfH2R1vMX/KtE9EQK30gVfKTb+2Ok
 uK1sUUsHaUsDGJcDLJiiix6aUF7rIJffn/34nc4zBxWJpAhDFycAjCRvo8M/5Prfb86hXeUfvKI
 T/+ndmv3ZHmFKTumuTzN02Y/fVNaV5qR4fNdycKTqu1OzVXfb5iqla3fZ9NgW7fmzgaNxdND/s5
 ayAEA
X-Developer-Key: i=me@dawidwrobel.com; a=openpgp;
 fpr=B64A778E0E64049A70C831C8B7B81FA12B282A92
X-Endpoint-Received: by B4 Relay for me@dawidwrobel.com/default with
 auth_id=901
X-Original-From: =?utf-8?q?Dawid_Wr=C3=B3bel?= <me@dawidwrobel.com>
Reply-To: me@dawidwrobel.com

From: Dawid Wróbel <me@dawidwrobel.com>

The Mi Pad 5 Pro 5G (enuma, 2021) is the modem-equipped variant of the
Mi Pad 5 Pro. The board is otherwise the elish design, so describe it as
the common device tree plus its own board ID, panel compatible and WiFi
board data variant.

Unlike elish, this model shipped with a single display variant, so there
is one device tree rather than a per-panel pair.

The WiFi node in the common device tree gains a label, so this board can
override its calibration variant.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dawid Wróbel <me@dawidwrobel.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  1 +
 .../boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi  |  2 +-
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-enuma.dts   | 27 ++++++++++++++++++++++
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e05414290d8e..529e29ffb25a 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -369,6 +369,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx203.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx206.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-xiaomi-elish-boe.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-xiaomi-elish-csot.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-xiaomi-enuma.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-xiaomi-pipa.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-microsoft-surface-duo2.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 19aff83ecf7b..12a2ba48340f 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -817,7 +817,7 @@ &pcie0_phy {
 };
 
 &pcieport0 {
-	wifi@0 {
+	wifi_0: wifi@0 {
 		compatible = "pci17cb,1101";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
 
diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-enuma.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-enuma.dts
new file mode 100644
index 000000000000..45bcc0438138
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-enuma.dts
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025-2026 Dawid Wróbel <me@dawidwrobel.com>
+ */
+
+/dts-v1/;
+
+#include "sm8250-xiaomi-elish-common.dtsi"
+
+/ {
+	model = "Xiaomi Mi Pad 5 Pro 5G";
+	compatible = "xiaomi,enuma", "xiaomi,elish", "qcom,sm8250";
+
+	/* Platform type differs from elish; msm-id is inherited unchanged. */
+	qcom,board-id = <0x2e 0>;
+};
+
+&display_panel {
+	compatible = "xiaomi,enuma-csot-nt36523", "xiaomi,elish-csot-nt36523",
+		     "novatek,nt36523";
+
+	status = "okay";
+};
+
+&wifi_0 {
+	qcom,calibration-variant = "Xiaomi_Pad_5Pro_5G";
+};

-- 
2.55.0


