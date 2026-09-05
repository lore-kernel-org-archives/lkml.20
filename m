Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DA12D9797;
	Sat,  5 Sep 2026 09:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788600558; cv=none; b=cVogJ9n+hPcEnBYXRJ218IOuVEm6wGbb/5RZi61WiNyejjdL5xvJjNMZ/p0a1kY9Fpm4J2TmSIyiWtfQ2M1sPRaKkPsXCsCqkfcwhMxanW+jurteBT3j+HUveeKhNDruXBC2iPlEegUj+izU3UamAN2c9uFuBUM/QBiEyvaFDEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788600558; c=relaxed/simple;
	bh=0mBiiHnZxdafP968u2EZeYqOw9HJexG73qrieg9fcLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XiS1C7fcJptUuGPgCq+IQ51TAw+muROtw9uJy72xYeObZH3i/GJwZM0wrQowTLyTpbhbHlCs4fQ+oEcrGdloniJYYS7ZE/9Hp5qaFS19mla1pY8y6hGwB6hwj/EmNsYaUlhNFGDA0a9qwDxQL76NgHw2vAPAV+XRK3dp5C5NjQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eyhvhk+e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eyhvhk+e"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7E65C2BCFD;
	Sat,  5 Sep 2026 09:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788600557;
	bh=0mBiiHnZxdafP968u2EZeYqOw9HJexG73qrieg9fcLs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Eyhvhk+et8CdGncQD1DOZkWXdHcEauzuPjA96seQXtq+RJN3FMyQrpx2P5kh2n6Bw
	 Ta2rRrhJS/5Grc3adpMb4iSsB8Y4LvK54XsLRv+EB++XbzXLqd8jojmYjc+mew8aB4
	 cl587JmJ1JwyhV4eK+GhVA7SLue0CjFj42HQGgNeA+CySRdmxxS4QsU/mZlIx1o///
	 qXaZkUCpc67gaqekGFhOdsvy+zthsF7YDSklRyLjtAQTaUeIR9cxQBzqACa5DbL0ty
	 XJ/jXAoqNCfWYIlpmH1OfOhbhYaeGY3Eg/mXq/qTrUYJ44ropkIS4Qz3qtn9zlgF6C
	 hTlfPi4prwVaA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E81C624DB;
	Sat,  5 Sep 2026 09:29:17 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 05 Sep 2026 11:28:58 +0200
Subject: [PATCH 3/7] arm64: dts: qcom: Add Purwa IdeaCentre Mini 01Q8X10
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-x1-ideacentre-mini-prettify-v1-3-9a87882973bb@oldschoolsolutions.biz>
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788600555; l=2667;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=xRPp6vTMGEB2dFChuAvE6BAHSXu1b2qzIsMaG+/+CO8=;
 b=ehnQzhlDgvcTv3e5Y8hpS3o1+1K4nncUc0cu4+OKCbAgcMwN8aadSyeLRPCpuD4CW0bm+uA7K
 8SqERos7WoECAWYBFKIYEmasN1ZwCpOiswFuUe+ZuZCKwdI4sIypY2d
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Add the Purwa SKU of the Lenovo IdeaCentre Mini 01Q8X10. The chassis is
the common x1-lenovo-ideacentre-mini-01q8x10DTSI; this file supplies the
Purwa SoC include, firmware paths, and the PMC8380_6 nodes that are
absent on this board.

Assisted-by: Grok 4.5 (xAI)
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 +-
 .../qcom/purwa-lenovo-ideacentre-mini-01q8x10.dts  | 42 ++++++++++++++++++++++
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6c2ac11133ca7..e6105e5790954 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -167,7 +167,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-xiaomi-sagit.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk.dtb
 
-purwa-iot-evk-el2-dtbs	:= purwa-iot-evk.dtb x1-el2.dtbo
+purwa-lenovo-ideacentre-mini-01q8x10-el2-dtbs := purwa-lenovo-ideacentre-mini-01q8x10.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= purwa-lenovo-ideacentre-mini-01q8x10.dtb purwa-lenovo-ideacentre-mini-01q8x10-el2.dtb
 
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-fairphone-fp5.dtb
diff --git a/arch/arm64/boot/dts/qcom/purwa-lenovo-ideacentre-mini-01q8x10.dts b/arch/arm64/boot/dts/qcom/purwa-lenovo-ideacentre-mini-01q8x10.dts
new file mode 100644
index 0000000000000..9813a570cf690
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/purwa-lenovo-ideacentre-mini-01q8x10.dts
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ * Copyright (c) Jens Glathe
+ */
+
+/dts-v1/;
+
+#include "purwa.dtsi"
+#include "x1-lenovo-ideacentre-mini-01q8x10.dtsi"
+
+/delete-node/ &pmc8380_6;
+/delete-node/ &pmc8380_6_thermal;
+
+/ {
+	model = "Lenovo IdeaCentre Mini 01Q8X10 (Purwa)";
+	compatible = "lenovo,purwa-ideacentre-mini-01q8x10", "lenovo,ideacentre-mini-01q8x10", "qcom,x1p42100";
+};
+
+&iris {
+	firmware-name = "qcom/x1p42100/LENOVO/91B6/qcvss8380_pa.mbn";
+
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/x1p42100/LENOVO/91B6/qcdxkmsucpurwa.mbn";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/x1p42100/LENOVO/91B6/qcadsp8380.mbn",
+			"qcom/x1p42100/LENOVO/91B6/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/x1p42100/LENOVO/91B6/qccdsp8380.mbn",
+			"qcom/x1p42100/LENOVO/91B6/cdsp_dtbs.elf";
+
+	status = "okay";
+};

-- 
2.53.0


