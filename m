Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA3144605C;
	Wed, 23 Sep 2026 07:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148798; cv=none; b=lwgJIedNinWlpxqkU+V0ajIld5dk3xqfYg9Pho9WwoEEY7auiWh1Nq3CXGjyzSRmGwc5rHGGQFUcfpTI6uo9S7IyC4bvDlZ2HRdwLLXCkY/0ZjMxqR3rouyS0r0VnLGugK9eA5F73dlIMsiLdSUo9Xa5D42Kh1ImSF5mEWCdw9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148798; c=relaxed/simple;
	bh=H/i46ZEr3cYoPOmosotiIgTDsLWT65bU2imKwJrUMSc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IiDiM11HwvxcXxoxcnsEEIm9K8coCUwSgwAQzJAz0DLtSucYYSodJMP5pmeMStJZSuMoxg8NuaKvYv0D5eHeRx6Cz9wFK5z8t0VQcWBXwX2yXc8i+fLTGdEgz3IQsBmCvWPllVGtzkOFH/wjKP6VgrUtybUTpWmq7norIOqY+Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=KMn/hMXt; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="KMn/hMXt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MefAjguMbqQ4/viHTQJIbvUgPj897M2EuwzDxdNr95o=; b=KMn/hMXtPGfonS1QS5B20jknRO
	5q5v7AaLz+/jIFTFVp+vZi2xp19OVBF7sjE7Khal3U84guLs7ucgbvbDeo2A2Whh2Zsv9u4Dy1+KZ
	IfwtIVwr0yuteFNs9K3jFT/oLmcfY3ugTILr7qFSG5yW+//G66We7sWrrQMueZMtuGaZgzBnWqdeV
	j5zgtN4QKpBYRhGcvkERzUFkWKijt2YolTWDmVPUp4+4L3BMN0zCZaulCMTDU1ZUNS6iueB5Zk4r2
	d7s1u3bF+TEq9Wi2JUT3hygmNDkSf/zDZv8UP0VfvVwWxJFJshRZBB4Yt8Zo/eylaYfvT4m26fR80
	MKit3r4A==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:33340 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100)
	(envelope-from <primoz.fiser@norik.com>)
	id 1x9H2S-00000009mhH-2s1H;
	Wed, 23 Sep 2026 09:05:07 +0200
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
	upstream@lists.phytec.de,
	Yunus Bas <y.bas@phytec.de>
Subject: [PATCH 2/2] ARM: dts: imx6qdl: phycore-som: Add custom volt/freq table
Date: Wed, 23 Sep 2026 09:05:05 +0200
Message-Id: <20260923070505.494949-3-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923070505.494949-1-primoz.fiser@norik.com>
References: <20260923070505.494949-1-primoz.fiser@norik.com>
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

From: Yunus Bas <y.bas@phytec.de>

The PHYTEC phyCORE-i.MX6QDL SOM-modules are operating with a slightly
different voltage and frequency values in contrast to the generic
i.MX6Q/DL tables. The values have been adjusted to achieve the most
stable condition for the PHYTEC-modules. Introduce imx6q- and
imx6dl-phycore dtsi files with the modified power tables.

Signed-off-by: Yunus Bas <y.bas@phytec.de>
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 .../nxp/imx/imx6dl-phytec-mira-rdk-nand.dts   |  2 +-
 .../nxp/imx/imx6dl-phytec-phycore-som.dtsi    | 23 ++++++
 .../nxp/imx/imx6q-phytec-mira-rdk-emmc.dts    |  2 +-
 .../nxp/imx/imx6q-phytec-mira-rdk-nand.dts    |  2 +-
 .../dts/nxp/imx/imx6q-phytec-phycore-som.dtsi | 75 +++++++++++++++++++
 5 files changed, 101 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-phytec-phycore-som.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-phytec-phycore-som.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts
index d906a7f05aaa..8ec27080ca1e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts
@@ -6,7 +6,7 @@
 
 /dts-v1/;
 #include "imx6dl.dtsi"
-#include "imx6qdl-phytec-phycore-som.dtsi"
+#include "imx6dl-phytec-phycore-som.dtsi"
 #include "imx6qdl-phytec-mira.dtsi"
 #include "imx6qdl-phytec-mira-peb-eval-01.dtsi"
 #include "imx6qdl-phytec-mira-peb-av-02.dtsi"
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-phycore-som.dtsi
new file mode 100644
index 000000000000..de85c084ac8d
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-phycore-som.dtsi
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2021 PHYTEC Messtechnik GmbH
+ * Author: Yunus Bas <y.bas@phytec.de>
+ */
+
+#include "imx6qdl-phytec-phycore-som.dtsi"
+
+&cpu0 {
+	operating-points =
+		/* kHz    uV */
+		<996000 1275000>,
+		<792000 1175000>,
+		<396000 1150000>;
+};
+
+&cpu1 {
+	operating-points =
+		/* kHz    uV */
+		<996000 1275000>,
+		<792000 1175000>,
+		<396000 1150000>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-phytec-mira-rdk-emmc.dts b/arch/arm/boot/dts/nxp/imx/imx6q-phytec-mira-rdk-emmc.dts
index 322f071d972f..7d947762f3b9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-phytec-mira-rdk-emmc.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-phytec-mira-rdk-emmc.dts
@@ -6,7 +6,7 @@
 
 /dts-v1/;
 #include "imx6q.dtsi"
-#include "imx6qdl-phytec-phycore-som.dtsi"
+#include "imx6q-phytec-phycore-som.dtsi"
 #include "imx6qdl-phytec-mira.dtsi"
 #include "imx6qdl-phytec-mira-peb-eval-01.dtsi"
 #include "imx6qdl-phytec-mira-peb-av-02.dtsi"
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-phytec-mira-rdk-nand.dts b/arch/arm/boot/dts/nxp/imx/imx6q-phytec-mira-rdk-nand.dts
index 3f13726c8058..afbb6681a6b5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-phytec-mira-rdk-nand.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-phytec-mira-rdk-nand.dts
@@ -6,7 +6,7 @@
 
 /dts-v1/;
 #include "imx6q.dtsi"
-#include "imx6qdl-phytec-phycore-som.dtsi"
+#include "imx6q-phytec-phycore-som.dtsi"
 #include "imx6qdl-phytec-mira.dtsi"
 #include "imx6qdl-phytec-mira-peb-eval-01.dtsi"
 #include "imx6qdl-phytec-mira-peb-av-02.dtsi"
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-phytec-phycore-som.dtsi
new file mode 100644
index 000000000000..ebe05d764357
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-phytec-phycore-som.dtsi
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2021 PHYTEC Messtechnik GmbH
+ * Author: Yunus Bas <y.bas@phytec.de>
+ */
+
+#include "imx6qdl-phytec-phycore-som.dtsi"
+
+&cpu0 {
+	operating-points =
+		/* kHz    uV */
+		<1200000 1300000>,
+		<996000  1250000>,
+		<852000  1250000>,
+		<792000  1175000>,
+		<396000  1075000>;
+	fsl,soc-operating-points =
+		/* ARM kHz  SOC-PU uV */
+		<1200000 1275000>,
+		<996000  1250000>,
+		<852000  1250000>,
+		<792000  1250000>,
+		<396000  1250000>;
+};
+
+&cpu1 {
+	operating-points =
+		/* kHz    uV */
+		<1200000 1300000>,
+		<996000  1250000>,
+		<852000  1250000>,
+		<792000  1175000>,
+		<396000  1075000>;
+	fsl,soc-operating-points =
+		/* ARM kHz  SOC-PU uV */
+		<1200000 1275000>,
+		<996000  1250000>,
+		<852000  1250000>,
+		<792000  1250000>,
+		<396000  1250000>;
+};
+
+&cpu2 {
+	operating-points =
+		/* kHz    uV */
+		<1200000 1300000>,
+		<996000  1250000>,
+		<852000  1250000>,
+		<792000  1175000>,
+		<396000  1075000>;
+	fsl,soc-operating-points =
+		/* ARM kHz  SOC-PU uV */
+		<1200000 1275000>,
+		<996000  1250000>,
+		<852000  1250000>,
+		<792000  1250000>,
+		<396000  1250000>;
+};
+
+&cpu3 {
+	operating-points =
+		/* kHz    uV */
+		<1200000 1300000>,
+		<996000  1250000>,
+		<852000  1250000>,
+		<792000  1175000>,
+		<396000  1075000>;
+	fsl,soc-operating-points =
+		/* ARM kHz  SOC-PU uV */
+		<1200000 1275000>,
+		<996000  1250000>,
+		<852000  1250000>,
+		<792000  1250000>,
+		<396000  1250000>;
+};
-- 
2.34.1

