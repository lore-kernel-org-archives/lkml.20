Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.132
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794393602;
	b=toX55UjfDMr/TzO8I6Jr+04gnZeXD86HDDPE67FkmuPv2YiOedbexGfpsOpl7r8NSvdj
	 VLHJoW0cbSni5Xj06dtJsOR63sApOmyYFHtrwOXTYqbhwCIMDK9EOe87M98oDkB0mCurx
	 ruyiC3aARkE9l/lCT9EL0NqzWYvwY7IJegf4lN8DvM7YCaKQQsvxLt302eq3uOlzjcmyY
	 QtjYZsMXFqv5sWL1UdtJDG5PNJN1hr/wwRxQrAcMC42Kwpi3pPgYz+6pv9rm9sOp2oL7D
	 AQdbNp2ERhvcjS3QX70LEYqKxKNS7qoGU0vakL7Uq/1dU2mgyfLCTxS5kQ3Xd8WdT7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393602;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=5dU63iyK2TdlVk8neNqkJILw/3rQx/WMk4I9zLgIavw=;
	b=giDpZT0VV7k1rd4Xo8EmdlGh2IoFiKZmOdvvMWkVZsK5MMLsZcY4FoW7jllUWH4gqOLN
	 z2U1T5jAHb8lRXXPq3SsZ9dPfBzn7SajNbGbhsScjEk2ImQyBdq4qTkRwAQHOAh4ldEQQ
	 iCrz9KqGC0dHqtHt1gR40ZyUv+YHdGeQpf1BHX//3ZD38kHb/MB6/+jCrLODN1GyN61wx
	 /bPbd0/U/mzzAI2/M+4R99qXpyfl8ws09Q+SbRNPn5IvOVzwEr+TXo24k8wWR6qRmE8IG
	 c8Z7OwYiGPpiRw1Bgd8ts7DI5K/844I5qYjuB2i578e/vjWbc2xKC8KBeWXSfRpmKoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.132
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023132.outbound.protection.outlook.com [52.101.127.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD75606A321;
	Wed, 11 Nov 2026 10:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCD75606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPIy8Q3iVrImABOuZZF695GXPDxwjhglQGpSr7OvKg48PMPRgN41XLw8ze9Ki517N0LAS8E7aOuY5umx3s4RecTTWqMURyibP3wUP5tNRTNgrXSHDJz/y5fuFpn1fRg7wgzpXwUFVv/J/fE5k1DaIQpIzr54pAf5BVTNglyooXwxUqJXn++nG9prOu4vsztt7HGQ5RqeviooBL329t+y2BliarbfHOS8ZBOtcPKwA8EIYAIVazcxSF0q3uMo4FG3z/GaZE8zFEnZgbpkYzfseECpnI9Yl9ePD7NMNfq9vvxvAKYp+uqax+76Z2lAHOnRz3AivhWR56idOxbErNu9Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dU63iyK2TdlVk8neNqkJILw/3rQx/WMk4I9zLgIavw=;
 b=KlgAzMSQc1T0cSMr5gTc7ayB2fMJnNh/M5YdX7WduxI03ichGUCKnyC298/nQLfWL5BzJDrIYCrNFHouagqmMJSuO1nln/b8S9N7+ghrLTnLEwUfqE8nL+0/A3JjZ83fWSZOzP4t1lLxBzUBS30yULUvwps54X1/2tlfMslBBFt5ZQ53X2h197d8JlFr/0u33eiPZ5uS6tMCBafwjWmHXr5/xNlYl7qAYjShOGu3KhhxS0M47RWTDHv98n7dZqEoGZ+USrRksVN03MEaZKR846U8KPPeOxo6aKH8G7ltGSY7V5kgvpm2LSwY+jz3GeNW3Chzm6QnwVmPEMDHsR/lGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR04CA0003.apcprd04.prod.outlook.com (2603:1096:4:197::23)
 by JH0PR06MB7295.apcprd06.prod.outlook.com (2603:1096:990:a9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.7; Wed, 11 Nov
 2026 10:39:57 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:197:cafe::30) by SI2PR04CA0003.outlook.office365.com
 (2603:1096:4:197::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 10:39:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 10:39:56 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 239674102E74;
	Wed, 11 Nov 2026 18:39:55 +0800 (CST)
From: joakim.zhang@cixtech.com
To: tiwai@suse.de,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: cix-kernel-upstream@cixtech.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH] ALSA: hda: dt-bindings: cix: add hda dma memory-region
Date: Wed, 11 Nov 2026 18:39:24 +0800
Message-ID: <20261111103924.3395516-1-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|JH0PR06MB7295:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5d0a490e-7db4-4882-475d-08df3fe0210f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|7416014|23010399003|1800799024|82310400026|10067099003|261026121527099003|261026140227099003|56012099006|261102123227099003|261022113327099003|261009223027099003|261022075727099003|261021123027099003|261028144727099003|261022105027099003|261021121427099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iy5/a4pXvnjUB1h89oNS1nDoawaOVoDjFCkZhdbONY9eTo2Hk3JH9pvGjpTWUOPRqPtxCrXl7M+XglbIhFCEt3ZfK4PqbJXLBHczRDEqrYc0gWEhLzVS1Hd/C3Y2vHR1nzJ5RM9nBzTYaNGhddXFb3a6v0tmfKt3Gy5+ZEsTFplwvJbxdQ4eoyB4QPWGT1YxQZgZ+7+MJnGoq3/50nwV63+aTa0JvSTRB0E2HYwYRKF6AWwS1Go+uxW/MmOonM81Z5Ka7IpVTcz7hlY7f5+/nluJAA7ZdDHpX8FFHp0qnR+Mf/yb+LMZyjnz4fIGqqhBM7Kkub0PRajyolDAN0+s6cVteudhqDr5vaSjE2KWyh0MJf2mMPrTEBMgA1p6gqO88raIXfvHRssZx4FMxTeVti60mrgVumqFwdYCUuWtSk3hkMmGcB2XmWXgPOnkea2h3x1jVOBEyANRkPAbznLg1ELo1jVU8Q0B+VY3EWm1j7wK99tNv77zvDc+IFU9/blSmv3UxBO2RhTCEb55XBC9mm/otRgDmDmV+AiXcEdtXLwDdWJKOJUZePw/3zUGZDO0dl25i8vOvH6zw0cN9o2jBOO4UdLoolSbzpS+XRwCsX4jMkSzQOIHJFQymPhn15qN+fVDwUS+L1Wtv+Q9oAdoRC4FN8qm/Yu6euAIIMsNySWlLAOA30Hty2sWHn4kQIUv5XBSgzdgbEs2BGrPz2ZY1w==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(7416014)(23010399003)(1800799024)(82310400026)(10067099003)(261026121527099003)(261026140227099003)(56012099006)(261102123227099003)(261022113327099003)(261009223027099003)(261022075727099003)(261021123027099003)(261028144727099003)(261022105027099003)(261021121427099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	v57NzvjQwG7RygBZ67M3639krswWEvkHKdwcBKyzYtm9f0OKR/JmD92KeRQfQzt4ozhpozR9fLWj1pI24S5c+mnIrRAxoLtBjWR38qUl8ZkpU61G34n9osRAEIbwRBgIAceBMYtK0c2iGr1chl85Vp9rz/hAHjtJm0jXYED42lESl0f7Rjelwg7v1KhdPwNI0bpA5MzBnZcM/i+XXvXuDI/mv6mRutukVOt+gxW1x2Bgbx+RhQ7taMOtWNMfw67pK/PZVUDx6ESzLXRJNhZYVMfrc/xxRBQnG8ANAgG1e7vhaTlOw/Kd0RJWIRjEsrK5IAPu4pXUeHHzJ+JhFundknP/8egsYVn1dpwwrKOLfAjdkLjBRUoc//dDpF+Yma/nN6mkv+TxV1gQ2gJC6VB8RbImG49JgRk6+c4iYP6ztvcFA+71Zv5UG3LN/nFLgU7+
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 10:39:56.7881
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0a490e-7db4-4882-475d-08df3fe0210f
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7295

From: Joakim Zhang <joakim.zhang@cixtech.com>

Document the reserved memory region used for IPBLOQ HDA DMA buffers,
since the memory accessed by HDA DMA has certain limitations.

The property is optional: the controller driver falls back to system
memory when it is absent, but the limited region should be used when
the platform provides one.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 .../devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml b/Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml
index 02ac5f1aa926..045e1a517f6f 100644
--- a/Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml
+++ b/Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml
@@ -36,6 +36,13 @@ properties:
   resets:
     maxItems: 1
 
+  memory-region:
+    maxItems: 1
+    description: |
+      Reserved memory region used for HDA DMA buffers. The property is
+      optional; the controller driver falls back to system memory when
+      it is absent.
+
 required:
   - compatible
   - reg
@@ -59,4 +66,5 @@ examples:
         clock-names = "ipg", "per";
         resets = <&audss_rst 14>;
         model = "CIX SKY1 EVB HDA";
+        memory-region = <&audio_alsa_hda>;
     };
-- 
2.50.1

