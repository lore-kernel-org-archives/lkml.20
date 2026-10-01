Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04AA3C10B9;
	Thu,  1 Oct 2026 07:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790838594; cv=none; b=RfboaMZR6rdN4N5o1rciLgCnHagkH9SDB6k6BvjAKBR60kmpCEoUl0Yb9hXbNunRPlOx83qbDbsCcMXiPfS2rw3CfO3VS5pPrE05ge0G5kvZFOjgMMVqV0GKmdpYx5a8aUKUKCOFViXTTiP4rCgl/EqKrxRZ+gFV302GyM4koMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790838594; c=relaxed/simple;
	bh=tpqG2YliUNexWLHZmB2+lpt04BHTxv8k575uHSa/lao=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t9/nUSpYi4rqp+4nWK7rTkBv8yJp4LW8MMDVhGnyPAcDaktTsBQKwmzvPlk9RL38xBp4dQj9s/OGBnlw5QPkoD7K8AebIaI7DCCuAbejIDl03DycNd7gYPI6kHAlDnqfHsrYtDuvwOFng7KrteEgMhAruPg5BDlY3ZHFiqlHzuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:41660 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xCAvR-00000001Ztc-1QzD;
	Thu, 01 Oct 2026 09:09:50 +0200
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
Subject: [PATCH v2 2/3] ARM: dts: imx6: phycore-som: Increase PMIC max SOC and ARM voltage
Date: Thu,  1 Oct 2026 09:09:46 +0200
Message-Id: <20261001070947.1815279-3-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261001070947.1815279-1-primoz.fiser@norik.com>
References: <20261001070947.1815279-1-primoz.fiser@norik.com>
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

The i.MX 6Quad with 1.2 GHz needs 1.4-1.5 V supply voltage for the 1.2
GHz operating point. Therefore this patch increases the maximum output
voltage of the PMIC's SOC and ARM core supply regulators to 1.5 V.
Otherwise transition to 1.2 GHz OPP fails (with the 125 mV anatop LDO
dropout taken into account).

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- no changes

 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
index 205467fd223e..9070388eecb0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
@@ -133,7 +133,7 @@ regulators {
 			vdd_arm: buck1 {
 				regulator-name = "vdd_arm";
 				regulator-min-microvolt = <925000>;
-				regulator-max-microvolt = <1380000>;
+				regulator-max-microvolt = <1500000>;
 				regulator-initial-mode = <DA9063_BUCK_MODE_SYNC>;
 				regulator-always-on;
 			};
@@ -141,7 +141,7 @@ vdd_arm: buck1 {
 			vdd_soc: buck2 {
 				regulator-name = "vdd_soc";
 				regulator-min-microvolt = <1150000>;
-				regulator-max-microvolt = <1380000>;
+				regulator-max-microvolt = <1500000>;
 				regulator-initial-mode = <DA9063_BUCK_MODE_SYNC>;
 				regulator-always-on;
 			};
-- 
2.34.1

