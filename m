Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11012034.outbound.protection.outlook.com [40.107.168.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4961E3D88EC;
	Sun, 20 Sep 2026 18:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.168.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929727; cv=fail; b=TkXA5ONQ7yFEgp5Yr4R/tpjGsrjI3nBxcAUaJGgco5BiyRO77QuSf8oQW/7ebvWUNMfd+uOfJCRKw8E9VOzsPbxHk3fKG23ED40TYqlV7e/mzlERUh9vhq16CL4TYPAb+cWercKB4SHAwisgI2IBozld/cgotn+xO8UP/r5QYpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929727; c=relaxed/simple;
	bh=2q/z+rPOw1Sti2xkTwMOlVqpkvAzyotTv8AAi28z6Nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i2GHQtoVt7zNXiyenix5toe4oefgTIl7PY2EFDSVr7X2Jq5r/nEaCqD6li/h3xRdVLRKPFrHeiOLb0VD+jKpM55ff2rJzfDLEfYvOP3KdFWU4kknuVBW7cBM/lfplKFkQuxhfCgMC4pOO3x/XtDWUcQ+8kbwG8acddW2ccRbq9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch; spf=pass smtp.mailfrom=cern.ch; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=B+7Fww7c; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=B+7Fww7c; arc=fail smtp.client-ip=40.107.168.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cern.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="B+7Fww7c";
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="B+7Fww7c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0u5KIIaIE1tEDN+7ryoMPws3EaQpDRa8jpFOtIjX60Z/zjSB99WuKWkP/H+/tH/GfRVypm6od/xZohn/2C+owNwfOO1CvmkVSHiSggiKFaO0dwlDKrOgUDAKcyL5m/TajrypJkD8RFxpnTP6ZdrubHH3LPzT/kDi6hXx/GeHTwdwjzKScHZJmrrq18KHg9BynpsdKI063bHqJ3DSP27nk0vfGTQemhOoLSad/7rikl5mvC2ifR9hkWkW5uH8Y4jMpD2EicVpdXh/tDwCEoChd4aUAuNFKJ7ZSf1t3FJ/qeYAVqKtpkbkPcOjIG8y9j9WytVQmjvmm1AhYFJ/9R5bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5U7vHCSklMIe+qooQWw2Jmkc23yS+HsiJc4ksNSEVNQ=;
 b=e7NoXA3HBted0erfIhK92bD3qMg80U5cqHvQe2iW46qC6g+TZtWihfEKhily2DtUVnVjS7oCYytYPv+Um4r2bS9gdTbsnQo2fdlAJk8bGx83mbHGMP4cU/BsqcMcVYBOfOoNucjxU2loiY7I9hQkYujj1ZGWcSuq+qAyJBxQ3hE2P4VmwBVvytxc8JEodSaHGakS2qg9cic72AlFOc5qeHPF+vEo+G8Ae9yQ1r/0vwBkRfvNK6nzVll+cUBZAXZrIIs8jKlBTyKKA9+iakXCs2Zoiyizr1IIdSqjq12aukMKyAev1EmgGgr1JRExIDfUeY3MLY+6lxaeo9Hq5wZUqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.208.138.155) smtp.rcpttodomain=kernel.org smtp.mailfrom=cern.ch;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=cern.ch;
 dkim=pass (signature was verified) header.d=cern.ch; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5U7vHCSklMIe+qooQWw2Jmkc23yS+HsiJc4ksNSEVNQ=;
 b=B+7Fww7cLmVFI0pndMkzE0VTr54EaJU/1x6q+KMIR0oxqFsSFB1fL8P14FP6srMdCp9V754nTu7d+lZpeH7a+zY/Ws0vldb3uT6Gi+YFpCdHDS/I8YrAdtmpgBLje5hyY6q6RnNQWQ244UxQs4gU/lyr19IThczLUrrBJE2niik=
Received: from AM0PR02CA0117.eurprd02.prod.outlook.com (2603:10a6:20b:28c::14)
 by GV0P278MB1176.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:4f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 18:41:58 +0000
Received: from AM1PEPF000C1ADA.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c:cafe::45) by AM0PR02CA0117.outlook.office365.com
 (2603:10a6:20b:28c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.15 via Frontend Transport; Sun,
 20 Sep 2026 18:41:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.208.138.155)
 smtp.mailfrom=cern.ch; dkim=pass (signature was verified)
 header.d=cern.ch;dmarc=pass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 20.208.138.155 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.208.138.155; helo=mx3.crn.activeguard.cloud; pr=C
Received: from mx3.crn.activeguard.cloud (20.208.138.155) by
 AM1PEPF000C1ADA.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Sun, 20 Sep 2026 18:41:58 +0000
Authentication-Results-Original: auth.opendkim.xorlab.com;	dkim=pass (1024-bit
 key; unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256
 header.s=selector1 header.b=B+7Fww7c
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17011025.outbound.protection.outlook.com [40.93.85.25])
	by mx3.crn.activeguard.cloud (Postfix) with ESMTPS id 299927ECAD;
	Sun, 20 Sep 2026 20:41:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5U7vHCSklMIe+qooQWw2Jmkc23yS+HsiJc4ksNSEVNQ=;
 b=B+7Fww7cLmVFI0pndMkzE0VTr54EaJU/1x6q+KMIR0oxqFsSFB1fL8P14FP6srMdCp9V754nTu7d+lZpeH7a+zY/Ws0vldb3uT6Gi+YFpCdHDS/I8YrAdtmpgBLje5hyY6q6RnNQWQ244UxQs4gU/lyr19IThczLUrrBJE2niik=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cern.ch;
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5d::11)
 by GV0P278MB1174.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:4e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 18:41:55 +0000
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c]) by ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c%5]) with mapi id 15.21.0428.015; Sun, 20 Sep 2026
 18:41:55 +0000
From: Maxim Storetvedt <mstoretv@cern.ch>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: marcus@nazgul.ch,
	marijn.suijten@somainline.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	abel.vesa@linaro.org,
	abel.vesa@oss.qualcomm.com,
	johan@kernel.org,
	konradybcio@kernel.org,
	kirill@korins.ky
Subject: [PATCH v7 1/3] dt-bindings: arm: Add Samsung Galaxy Book4 Edge
Date: Sun, 20 Sep 2026 20:41:02 +0200
Message-ID: <20260920184148.31541-2-mstoretv@cern.ch>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920184148.31541-1-mstoretv@cern.ch>
References: <20260920184148.31541-1-mstoretv@cern.ch>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0007.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::17) To ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:5d::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR2P278MB1053:EE_|GV0P278MB1174:EE_|AM1PEPF000C1ADA:EE_|GV0P278MB1176:EE_
X-MS-Office365-Filtering-Correlation-Id: 7430ad93-0474-4276-3a86-08df1746da47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|786006|23010399003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 YSKu6an0y045Llto/oRPsEEKX4EEDKGz5/QVekZb2TLUuwmkt0Jyb6g+HSTJTyvM7gbjtAdZyCGgYGuIsu7vmTZaVADBC/hGoyWDsajNyfY4kCzXhaisIGjYqP11Tb4P0d5PPwTpX0tmVpKCd9JUhjEKjj3SHdJk9drOC8RFMHaohy2eZYkfqBWYSS6BAb3CGoOLCgjJRkIOUF9dbXmJ7AdiLbH/XDP2vvC6Ew+ZYl8g4qH7lmKVGONTgSTI1NSMQSRSmwHYvpYbqRXcAesJsSaT6fSOS6l3E4IDJeJ0iQRaffRxrfH3sMv3bSOU/krpjL2+SIhAptRMD7zFOi9kg36khuz7w4g/Sa/wfW3H5OFmgWJnyYeIL+upQ9zZ0t8O9VRdLURbQEuazZ2qrfeFmfELntxKXju3gpyODwSsIxXyK0rs1uVxyfBA7+5eSdZnhY8xxcUmfakmOyg43Wn/P0varooyb/kGKMUVrW/36xlv2yDyNjC5W+nV4Xhhl4vjyCYwUUo8914l/Ng3Hou3xNwSfYk22jcBBzcpXeLplaaC+myjJNZNR4N/H3b/Gl7Q0unW08aAQvKTErlR163ilFwsZ26t6dC0aOOJxCXrt2IK7B5cB6u3fiXldoOCpBe9+9nKe0SAmclsurqfZTUdU3GDSuXLyC7bMJRIHZ4Cp3k=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(786006)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 j0KjgjW8lygaZRmwGt64bxkeR+suugPrVAEMLWv0r/KEMFEMfYXyFJDqWYReUeCvcuo5B+0vyG60031mdNS7dUF4gqs2ZZHvRj5WThcMsDNCDsW2z+EpKzBCmXQdjDSF/CCG+lYBa763VnQjYbL/w0mt0ifrKvq4DUijmVUJrY4JUUnxc22v+ZCd7Gj3rUrrCaYHcAOCqtPkahk72RaywWGtDyktJAwktl7+WXvkL9xEzo0WoUeIaN+gUo3jS+HMvzgPg2tdYQcRvQyZl4bOIHdTlVQT3L3Umu1PKE4wxmIUWEcHCQdppFFgV7bYnRrUSPbB8hamzzqRbZ1H829EjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1174
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000C1ADA.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6c99cee5-b7f4-4f1e-ff95-08df1746d83b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|14060799003|36860700016|35042699022|786006|19092799006|30052699003|7416014|376014|23010399003|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	drojvytMzs6Yu0kj2tATBD6bYr/MmTvk+MpxcS7iVDzdo5rH7mLUXFE6qmhtLHi8yhepUas14ZUtbiegSKEi52vv8krGJD5dOE2eqz5aoBpk8hydumODQgx+t6VX6d0pKGA2Lulfl4O2JY3ukg9Rv81PtL8Oi5ie1a8Y9Y7srzD9DgNpgtoExULDC4bu/rl/dcJMHjm/M9awNSqqc3umWX4JL+X59Pifv6yB3DjfCDYjDYC0vT6iGfjIF0auwtsW8QwuoZfHVcnxd0uRFtvfngoNk0IyfqWG5+L7j2dE0rBtLRoEBJRVVIpLzbmJ9UZ26dSLfHTJfRRRudg6Eal4vUHKOf/cc9xlqaqETmqt02VkQgWb5Kb1Evd3FdP91a6S28NlttdOVexHKzstj9/MQSZutKNpC1RCeM1yOSoJlHfHHV7GCb1KBuPpbKMtpjP2MNv6u7nkw341+kbgp6AMbV13lPl8Ce1sFX1QpqEj28wDCRC0mPiZe+P2OAcySZF+7VrBlSFHA642kLmou9olQHdc+oMLvtoGxQC8K16j5KAsYtBs70q8DjctAapW6+UpQW5dhhS1RXzoaibNVfY23HX14JOwtyVZVkBKD4m+CE6LPWRFgV3S/1/MOo/+aVYP5JyHoJai6DRkhh0nk+i32tkfA1QXnXcg74YZyEvPrTGZHn+GgIXMs8+GaJK+pTwpoYKe1uyb19U2qN6sqPpfJw==
X-Forefront-Antispam-Report:
	CIP:20.208.138.155;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mx3.crn.activeguard.cloud;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(14060799003)(36860700016)(35042699022)(786006)(19092799006)(30052699003)(7416014)(376014)(23010399003)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JDYwYmAQJ49FuBtTcDW+3eb5njIfwFSwfWpmVvJ+fIfEXkD0a1Sce/d9Y0M4R8hO160h7+I5hvrRRPYNMAuxGne+U4d7kAUWdlUD7FpQdzd6U0Cq7goW25Ge+6QAkV8IU+cQYWp+VP3SnLdLhCsCdk+2n4w+XsBH+KtjcUKF/XWJ160dlLgsTIweaGatifYSrNbyPIctL1ro8Bf3OK5vCloIEoWEVxLiUm7Z/uEW4/dUjrDXwnNVXSU+btdAm9SPoq34GUGalY8zfDYjpkquQa+0AChv5SfNjtXUlCbYlDgcsea0Cb8XA/kRtPwAbuvlj5duYPusvtKVb2psq4ZQbrHGCjDNErm7B0YRY0dYx5AElA43ZtsWTM8hQGSE7IxgD+aEWA/VeuC8d2fESD7pzdmCcu2f/5s4bjHTvvnR4ZxVnPd46dLPcBiOU/0VOgj9
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 18:41:58.6316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7430ad93-0474-4276-3a86-08df1746da47
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[20.208.138.155];Helo=[mx3.crn.activeguard.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000C1ADA.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1176

Add the Samsung Galaxy Book4 Edge compatibility bindings

Signed-off-by: Maxim Storetvedt <mstoretv@cern.ch>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index cf9d940f7..439ae9778 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1226,6 +1226,13 @@ properties:
               - qcom,x1e80100-qcp
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - samsung,galaxy-book4-edge-14
+              - samsung,galaxy-book4-edge-16
+          - const: samsung,galaxy-book4-edge
+          - const: qcom,x1e80100
+
       - items:
           - enum:
               - qcom,hamoa-iot-evk
-- 
2.43.0

