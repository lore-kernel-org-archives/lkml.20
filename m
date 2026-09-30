Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23F73CF69E;
	Wed, 30 Sep 2026 10:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763944; cv=none; b=UaiUVoGYMP+wwMzLkYywGg4wT8VnaAgy3atfdnFhQsOHJhHcrNd/4jNK3ekbbw85gq8EjR6ahpozKl9ZhEgq1KJhuO4b0BqKnrv7VOVVruDT+EeVbkuES9FQ5C8mjaC7T3cSvDxJbH2a/rTqF3VLIyXMC5jzbF5E/1JgNLTcnos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763944; c=relaxed/simple;
	bh=Z1n10XQpOuF7raG3CTNfEhwr+5P2EKILEeL0szwcVsk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZF3NJiI/bQblQVMA6bI1DMTmc4k8msFRs1j3VIloT2gunG/uqUSpEPG1nEczFlfrP7dRVZXZpJmv+hHVOknlkqAyPmPUfTyVX9ykQ2E/VCuOTNDAQpl1l2c0Vu8Tfl4r3W8Cz1ohNwWtqKVH6U85sIEGaO3Bzzwl407B0UucCRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=Zp1tXLbE; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="Zp1tXLbE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bMp4aGjtzMotrnNNRsA9Kf3RK8gVan/o3dMTlpzOrv4=; b=Zp1tXLbEUuy5SFEaukag1jTfJT
	rugtdnjEZhjAiyM9pwKPbx3XuSyM3BelvXe81o67QgAyvBBFEMp4yy2fEuseZQSFABksTAFvRcPH5
	Tj1fn18/LgBE37BXNseiljMQmNXaU6lIzYP5D2lKjgxkOcj+zyMU3IOp4/1laAGNSWQ9tkI7Fxgdj
	QcYPTArJoXUH1r5kaMLez+hdZVi60OMYhBt3XdUHpUUpR9sOjfTqpWP0NcY1o4uKzzxwci1eLfO8P
	9S/Oj541VkpIxbZVi4zAdg8+jhRpUgygh7SQqwHdEptAaZVB9endm+dy4mkQrZK84y0AT2Eh3F9Zv
	oQvoByYg==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:37230 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xBrVI-00000000YWu-2a7e;
	Wed, 30 Sep 2026 12:25:34 +0200
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
Subject: [PATCH 1/4] ARM: dts: imx6: phycore-som: Set PMIC watchdog alias as default
Date: Wed, 30 Sep 2026 12:25:29 +0200
Message-Id: <20260930102532.2262700-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930102532.2262700-1-primoz.fiser@norik.com>
References: <20260930102532.2262700-1-primoz.fiser@norik.com>
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

Pin the da9062 PMIC watchdog to /dev/watchdog0 via a DT alias, instead
of leaving it to be assigned dynamically by probe order. This SOM
already relies on the PMIC for reset (see commit aa4f48a4e06c ("ARM:
dts: imx6: phycore: Rely on PMIC reboot/reset handler")), so this
makes that the predictable, fixed watchdog device node.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
index ddbfecd591f5..205467fd223e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
@@ -11,6 +11,7 @@ / {
 	aliases {
 		rtc1 = &da9062_rtc;
 		rtc2 = &snvs_rtc;
+		watchdog0 = &da9062_wdog;
 	};
 
 	/*
@@ -112,7 +113,7 @@ da9062_onkey: onkey {
 			compatible = "dlg,da9062-onkey";
 		};
 
-		watchdog {
+		da9062_wdog: watchdog {
 			compatible = "dlg,da9062-watchdog";
 			dlg,use-sw-pm;
 			dlg,wdt-sd = <1>;
-- 
2.34.1

