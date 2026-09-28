Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059E625B088;
	Mon, 28 Sep 2026 12:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598984; cv=none; b=eah0mRGUy23D/v8SBtW5M24VskLWJgCxsGWNZbosWvntbtYO+B+sJqCoEkFhbKMxEgiIAWjiAWM35p1FdHBczX+lxmr2HCtPhTo/PxcCKrwU3ARW9Xk50tENw5WcPRITaIHiVKt80LclZWqb8YifuLod5ki7Z/JxbKOPVL6jmwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598984; c=relaxed/simple;
	bh=bwr6qMQFP+oa9Hv4juzQw10PhllAYFlDqmw8MFtXDHg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=j2hdxRb2sGmygA0Cs2m7gXdMCiY0dEwaSms7UtCxKq/SpfmwGEveOR9JWloYxckpBAhLPbriRvZfddlYg4ruun+6wj7gplpc/bjqja13qUXLvObjrEnGwTrzAfG42FBFNhsAnOs8hHcZwWk471KCNDIzmSox/c85iPbU3QKXKJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=XA0e57lU; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="XA0e57lU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Vkm7SHhLjq1OSn5E4JsUgyYWZpx99XHrbc4OM7+gChQ=; b=XA0e57lU+7IZ0t80d/jog2GGck
	UCdT2zZoj2UlgGvAjOpDy2nPyxJTG1jp/39ZPxthYiTVbkpwzJ0dxfuqdo1xtCVu2LykdTV0QgOCm
	1K1c3lSqzlE8r7Yv7l5LzNNA59ud123b91EKJl2I4sW1/SCsIjxQJwceLKeGrt/0ERKbnsWmwsuQ2
	m79/QJNpsiuhA+o1p7faQmfwO9ftAkWRcV8uSWcglRQZ4TmdS9iR0am3sqTFRJFxPjXC3RlLFVYET
	hCwMFwiXS4BtEQZ3BD/Y53kNHxA79tO3Uw6vphCmIPn5cHevs1EGikM9NYu51dRa/rP/L9uBeRIkm
	jwuh5zZg==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:35218 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xBAad-0000000Fp0t-1YMW;
	Mon, 28 Sep 2026 14:36:14 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH] ARM: dts: imx6dl-phytec-mira: Add phyBOARD-Mira-i.MX6DL with eMMC
Date: Mon, 28 Sep 2026 14:36:12 +0200
Message-Id: <20260928123612.2250601-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add device-tree for PHYTEC phyBOARD-Mira-i.MX6 DL board with eMMC. The
variant with NAND storage is already present in-tree. Now let's add the
eMMC variant for which the compatible string "imx6dl-pbac06-emmc"
already exists too but was not used until now.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  1 +
 .../nxp/imx/imx6dl-phytec-mira-rdk-emmc.dts   | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-emmc.dts

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index c5caca92ea10..4361708f70e3 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -136,6 +136,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-mba6b.dtb \
 	imx6dl-nit6xlite.dtb \
 	imx6dl-nitrogen6x.dtb \
+	imx6dl-phytec-mira-rdk-emmc.dtb \
 	imx6dl-phytec-mira-rdk-nand.dtb \
 	imx6dl-phytec-pbab01.dtb \
 	imx6dl-pico-dwarf.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-emmc.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-emmc.dts
new file mode 100644
index 000000000000..aa3239660bca
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-emmc.dts
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2018 PHYTEC Messtechnik GmbH
+ * Author: Christian Hemp <c.hemp@phytec.de>
+ */
+
+/dts-v1/;
+#include "imx6dl.dtsi"
+#include "imx6dl-phytec-phycore-som.dtsi"
+#include "imx6qdl-phytec-mira.dtsi"
+#include "imx6qdl-phytec-mira-peb-eval-01.dtsi"
+#include "imx6qdl-phytec-mira-peb-av-02.dtsi"
+#include "imx6qdl-phytec-mira-peb-wlbt-05.dtsi"
+
+/ {
+	model = "PHYTEC phyBOARD-Mira DualLite/Solo Carrier-Board with eMMC";
+	compatible = "phytec,imx6dl-pbac06-emmc", "phytec,imx6dl-pbac06",
+		     "phytec,imx6qdl-pcm058", "fsl,imx6dl";
+
+	chosen {
+		stdout-path = &uart2;
+	};
+};
+
+&can1 {
+	status = "okay";
+};
+
+&fec {
+	status = "okay";
+};
+
+&hdmi {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c_rtc {
+	status = "okay";
+};
+
+&m25p80 {
+	status = "okay";
+};
+
+&pcie {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
+
+&usbh1 {
+	status = "okay";
+};
+
+&usbotg {
+	status = "okay";
+};
+
+&usdhc1 {
+	status = "okay";
+};
+
+&usdhc4 {
+	status = "okay";
+};
-- 
2.34.1

