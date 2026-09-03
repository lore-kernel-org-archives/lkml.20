Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023099.outbound.protection.outlook.com [40.107.159.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6F5271464;
	Thu,  3 Sep 2026 15:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449606; cv=fail; b=NmFF7evJNMqjOtAZE15vVolcZfsMEC/7Ark+AUiVgWLhvg7OBr6aeOyFyZ9M5ccLzIG2l3HE7DtahEtO8syRVFuLVMMI55BMDtfNdJ5M+2LSNqL5hfI6SYcbdKf+yNys5KTMkO13DZtGMLjOpz4RwdKKC6J6qxrhBGAsyfSehp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449606; c=relaxed/simple;
	bh=pnlZlZpoFTU5WKL8lLa3fhR8saf0hi/P4EoTcjV0Jww=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fiq2R4SW34gBVkiREFZg35IznWX9gTzKucWSImwgNjWhV1HuOKguUBo1HGzLG6xFsGQ8M5JrSzf9Bvksw3dCUa1CXIGCDnJnnOqV+3Gc+ebhbm62RDvZzAIqqegWHZtk8j9u9x19V1cvyVkd/pzclXdLGXUYzh3oRT4ribBLk+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.com; spf=pass smtp.mailfrom=phytec.com; dkim=pass (2048-bit key) header.d=phytec.com header.i=@phytec.com header.b=OkF2Q3M4; arc=fail smtp.client-ip=40.107.159.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.com header.i=@phytec.com header.b="OkF2Q3M4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IjYGwx2PdLMCsQCNK2PHu8aicP9sksCJXldDG3clPIKkuB5erjE/6eT+/7WWKbqDSXCGWV4f0YBzaqZqqoL72iAvOi/HgBFCNFDX62UJCLCsBdI7xoY9AbrKkNain1oSMWgw4198P/JAQC1UJdtAm45ZBYzo6aR1eGOfY/k3ajXTb2zeHkX8jm8/iTGNrrSeOICMTcSfv5cV9ebttIrr/oLzCcTsjdo6VQqm7DWUdAb5TsJQV1L+dY2iVSEbV3QuNSLvSKjof+AiFTN+ym6VxchkQMtmUWkRofy6vRNMqOXTZqHFwcMLf2SjsS19KsGza6Yt+3qpYgaA42wy9MpEUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dmPDtuIGYYb1djiNVAWxV/VHYFfNosUYg3iUOAklBc=;
 b=aCV2wpz6WO2z/tMqH6PUCf3vHoYSJrBIuJDsfhxek/KH23OxPyx44RBdPjLqP5qGv5AEEg8u/pagP2JPdo4Kmo5ZGGmPug/i8X3ksq7+ijHjHWWAw4wmVtXo8pv4EQpwil57stfCJ+cZRa7HeQtz1e8WhceqrZTOKjCm2Yye3gUsv+sM5ZnvoeRJ3uED27lCRizDCB/GDXaYLd3vI5SyWfPB1oeD68BQwoBKChB4rGcgYjxBVX7EUdD6e9zGUfO9Dbll+ARlUEdPI3erVpRwt/HglCRavBmwez9TWEclvRzDvjwWng7kSDwd5SWjFj8RNyek0+GIZpqqchcQ+rFzsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dmPDtuIGYYb1djiNVAWxV/VHYFfNosUYg3iUOAklBc=;
 b=OkF2Q3M4qI1wzWr3g4peGeACyHbo8cdU8fMe7GpSOn1KuTtx/K9gdBKQOWBSyTxL5I7VZvAugowUvbFcv6qJcKeVdov2uy++gIkhz7u1AzeoB/a6QuYfSCFgBS/62ZtluWeBTuX1nJmRFoh5QwtDLIqpzMWx7tKPN/lTUushMUZFAjUOhYbWYcQoy2oesBnN9HsYntejCHEq++QgQugzcx7JW38To9uQC8BEDAYRGqXDqbyGl3tHywN6SD/rg2JLoA9QKUAo5bv8zoQ1jC+QNlJN7Ej3ke/AlVebR4pAG2RNnep1Gpj9nw+WvE3PntClKGdkHHD0uMRFzf9qXbzPaQ==
Received: from AS4P250CA0007.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5df::11)
 by AS2P195MB2364.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:641::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 15:33:19 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:20b:5df:cafe::39) by AS4P250CA0007.outlook.office365.com
 (2603:10a6:20b:5df::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 15:33:19 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.com discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 15:33:18 +0000
Received: from phytec.com (172.25.39.17) by Postix.phytec.de (172.25.0.11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 17:33:15 +0200
From: Nathan Morrisson <nmorrisson@phytec.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <sashiko-reviews@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>,
	<w.egorov@phytec.de>
Subject: [PATCH v5 1/2] dt-bindings: arm: ti: Add bindings for PHYTEC AM67x based hardware
Date: Thu, 3 Sep 2026 08:33:03 -0700
Message-ID: <20260903153304.2823245-1-nmorrisson@phytec.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F9:EE_|AS2P195MB2364:EE_
X-MS-Office365-Filtering-Correlation-Id: b78eb365-47bb-43ff-14bb-08df09d0ae23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|82310400026|36860700016|11063799006|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	3Mq8KgB2QIcXSVEmcdC5zCRg3KTh6xGFmbYDsellafv97ME3SlVj1AVoVMRoLCn8CmXezwdC/3uyk/WHUIPNuc2/fjrmp8U29wzkut83WIBj8QD/lbHV20fjC5JpWAxYCy/NmJzoLKihDOPhgUpUsSG3QktKkYq7kHeHbM4wKb//Q4iPz9uETD9TYmGNK5p9A7NXCjbwus4SWPwjp2drQaiwQR1zPrQrZ6Xi8UI0FptL4SqNH6gur2tKs+drfzyliz2H396mT/aeAxfSJDetw8p1E0CIkqc4+eQVxv4EqFRi4tqueFuo2J9UyTZJT8KdRmA6v61MTN7kqfnWQbCc5s9tHqCqr4gcwjmwN+Ifh5ucX3cDF/cCvl2s+EC7cRQ8WSztEbcVaz57n7IwCpV1PLLFQI7eoQ2lrZKh4WgBL159B2DKy1VaK+sJ43GWsAb+gLC/qpA3NFtkUHflj0L6DmXPCaowh0TUL67Pbs32NGFqocDG+kQlj27hnJ1L58mcNi9gXPuX7s4wI99OJJDks0VEuXxl2HeeqUyHaUQc0vrnPP+iONMtjNiKMu8Iz6UNJU91lo50WvADFetq2jRaHl123h1LSGtre+aXr06+GVhZBrFpde+SmyZahVs4IA6AW2TZ0Tu4VL9xsAvRM8MxsqseBivpbYwii9tGdLksXRWfogsCz2DVonow2QNPxwdIeUuT0e5e+sQuol4So41Ptw==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(82310400026)(36860700016)(11063799006)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QP6CaGA0JWIVHIoLWG/8m5MqUdFJz8nnDDF6KkxrY9c2vdJunTXuBMxRNsOZvMDBiRKTSJOeqFgwtHseTPCFELU2toKmpgIn2HLbF5/gPclhyCkL0mle/MxCLCCc0L/QbR4H4mRoANTFl5/Z7Voj+LYxFDL5ViKcrDDxtrxpsBwta45jDqRx72ruh/AQMoN7scrFS6Mf1cL9C7rDeodAwcOhPMEW5MDb+OGjo8IEHj5POF97aqoYeO6LYDTufkgsisfUR9ZjsRq+qW0+WYXpddly6P9ypJ/N97zBaRRnPBbisqQfqUaT5+j9EiwyJZ+WSZ8GuqXkzeIoDWlU/CziasnFLUsCA/1595bKpMImANG/9UvzAcSDpysj6kQFHIn9F/Idz+pd2lmxuQ302XPsrp+DmjS7QW98ZsXgtBzZe7uif3UJgPvOMBLkMomY+wdX
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 15:33:18.8584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b78eb365-47bb-43ff-14bb-08df09d0ae23
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P195MB2364

Add device tree bindings for the AM67x based phyCORE-AM67x SoM and
phyBOARD-Rigel.

Signed-off-by: Nathan Morrisson <nmorrisson@phytec.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v5:
* Rebased on rc7.3-rc1

 Documentation/devicetree/bindings/arm/ti/k3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index eebb3523303c..9a0d62234058 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -229,6 +229,13 @@ properties:
               - ti,j722s-evm
           - const: ti,j722s
 
+      - description: K3 AM67 SoC PHYTEC phyBOARD-Rigel
+        items:
+          - enum:
+              - phytec,am6754-phyboard-rigel
+          - const: phytec,am67-phycore-som
+          - const: ti,j722s
+
       - description: K3 J742S2 SoC
         items:
           - enum:
-- 
2.43.0

