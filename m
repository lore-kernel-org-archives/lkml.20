Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793281302;
	b=Sh82c4sD0ez/zDiz2mAmJKENNrBX5Jm0WwIqrnRg7kWuNVHxwz/+wUlOOsPGjpOeiwo3
	 tnTkoxUZG/Vyv8GWbjNEjUwfHM8KHUwyTlT4J2UWtCbReYFTmQmTUOEq2YupIRZiOYtuB
	 mg89C3OKFsHR9WUqQiLH6Wh+Tnd+5UPHCutd7iGrJTiGVe0TUXrZii7W43FSX2akhXcR6
	 ZHOrvEjmM09zbFd6O28Os/uWJC0+L5okStgkAQmM9ZS6dVMfczVB02+LSZL4UZPbuSZPR
	 76Zv5cgN6scFtLmYxVFb/32FmXEM971SDuTbAJlNEN+F9zXBgf2pvzB/p2ApXi2+H0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281302;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=9kSpXbIl7uyCbma4TQ7vyMsXR0GriMgKcxLGj6DB5k8=;
	b=zIcGQ0ZginC9puyfgyeOgBXXJg7Xe/wHCwNVhShwV9WmnVzVqaiDO5TZIWuYxVZ131aS
	 KyDY56iTQbD7Ifk0MKA8Xus/Nh/nSMzdHZeLz/+IdJPCvnlcMYX1ds8a1HmHQChXwPDLr
	 l/vR0TYvOezGQMtGBtKGQCmwfTtCQIlg4Xbl7pBNg/+hE31oiZVuzxk2xB1rximyHDXRH
	 XzreC4x7T/tMszrj9+jNQJ3bOqNgRKfJ/uBa7AwiBhwT/Rscy+g9Ket9ejhuLQXzscZtc
	 wehKCOeJkID4IJWlJ+Vti2Nd59Y2oTdVlkTuY9qz9JHjeAf7MBnZGLnqF4xqv/i42aA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=amdcloud.onmicrosoft.com;
	dkim=pass header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com header.b=shglO6M8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.30
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013030.outbound.protection.outlook.com [40.93.201.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F84060A2618;
	Thu, 29 Oct 2026 13:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F84060A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amdcloud.onmicrosoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com header.b=shglO6M8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOkm54RDzH9PwkXIckRqLvywUrkGjHj2plqtyu8PBSf3VEVx+i0AKYePN3T+Ep57rRU8h/qtaAi2JfFoLKYbHcPfPf0g4GEoU6CWwpdV8TK1+i57aDP/tS2Llenr6j0fWCxLVQ4hC99Fj6hXeoYD4AC7XSwydX1PCt107EDWlkQkvHrYLboALAnkuGMBKHfU9aCcguUoue0YEyb+20KsuEMUvniLAXkDLZgexvGSnLDAGqJBVnd2f50bhkxC7cufvUJQaEtv7D25Ol0ctnmDjWSlcdi52/6ET4zB7RH0ZQJBLkr1CbuMNMbhVeV5LVl8AB9dQceraO2UT5SeM8foHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kSpXbIl7uyCbma4TQ7vyMsXR0GriMgKcxLGj6DB5k8=;
 b=YmCkCD5L/7iRBzdbRx7Jp+j54/t0mjrnpqdKwLo67AHapy5/v8vMKBGB4/0Iy6C5hu0mSveWSq1PLkKJ2UwTaQe5+hO7v2l0mDbOyYevHqB/funjxQYPhOkHcFcC2qxZq/VieRnGsemc6XCe8mJrp/16pp8WlsUt9eMzQkjRz19hmoqK0WSvuwoGjT2kkDy6uPHSZ5X2QS5TU4g3WVdx6SWENH0+Gr2bZcb+zlbh9o6QNS0T79jsSaT2+yxQ72YakWKAXaUZWl/McQjJ3PdL6x44+rBbtd4NWKu+i2vDRSZ6euQ1UgZ+p8xuH+UsGdVGGJISIBESUGzLgnpWGl6BsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=aspeedtech.com smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kSpXbIl7uyCbma4TQ7vyMsXR0GriMgKcxLGj6DB5k8=;
 b=shglO6M8LcmZm4jhHn9ianrDTcm6oXIkSTGVceqpl+p/bJM2mXG85hb8oBQqazM39RCdTzAq3NyWwvD21M2kdJAAidqBIld2ic7XLw2lMRCM5M5ZVssyIb29DWdqhP+B5bLyB44jC8AeH4IyRQdB+MPRM9hqf77Wt1ksB6BGfOxKZ2FSJHlMr+BNn+A8CMpK2rObtfKuGBLdAvkVhxHU2B2H1DceOGDrc9Pb3FGoxM1fXBx1agzCqExZxsoYK+96iw/OdTszhSComA20mBMM8pVODk65ctjvrCXgWIm1qgOaVyh0jjxzSjurfYdjbocENU9a54wkQhyhFO5T3F2yaw==
Received: from CH0PR04CA0001.namprd04.prod.outlook.com (2603:10b6:610:76::6)
 by CH3PR12MB9429.namprd12.prod.outlook.com (2603:10b6:610:1c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 13:41:34 +0000
Received: from DS2PEPF00006E26.namprd05.prod.outlook.com
 (2603:10b6:610:76:cafe::a6) by CH0PR04CA0001.outlook.office365.com
 (2603:10b6:610:76::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.7 via Frontend Transport; Thu, 29
 Oct 2026 13:41:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF00006E26.mail.protection.outlook.com (10.167.23.219) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 13:41:34 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 29 Oct
 2026 08:41:34 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 29 Oct
 2026 08:41:33 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 29 Oct 2026 08:41:31 -0500
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 29 Oct 2026 21:38:34 +0800
Subject: [PATCH v10 05/16] ARM: dts: aspeed: anacapa: Add eeprom device
 node for NFC adaptor board
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261029-anacapa-devlop-phase-devicetree-v10-5-26ee3cf9d9d0@gmail.com>
References: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
In-Reply-To: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>, Carl Lee
	<carl.lee@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281119; l=833;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=pAsMpGEbYbQLqQx0xG8zEgHoAeRohruYjFh5hP58kBE=;
 b=vmdceVSFuhE4Ir5bz2Si+47F6kDNwtJhhfBX3ndlln57Bw99usIbrEQSNgxbZKs8q9AT9Mlxv
 JzZoIJ8sQlkD52CrG7w2j7DSTMUp71fCrXpOL5ZnEDxjfbBZalf3cCU
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00006E26:EE_|CH3PR12MB9429:EE_
X-MS-Office365-Filtering-Correlation-Id: 4887cef8-023a-4485-9451-08df35c2593b
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|48200799018|61400799027|35950700016|7416014|7093399015|11063799006|56012099006|261009223027099003|10067099003|261021121427099003|16102099003|18002099003|22082099003|4128699003;
X-Microsoft-Antispam-Message-Info:
	0gTbvFaafa/vDQVsDGYIc60XxYD3aTDAwIbzn9KN1CIpbVlzspQaIbmoghIWK567I/usMaqnyjWDM0HVsmQe3HxQKAdP2llCrH6zoTUp30NAZ0h5Xzu52L8BHGQ52egNEb2ju/mSBRSzUUbzPs/W+ksDtLJXwtYLJ4regvPNV7wbW58FTf4cEqVu6+1wWWpuYCfsBtn2jS2mwhg4O18rQyQ7vfuRzDnJ5eVuRBSt9T1KJKDQ6eF06pvMeByDVkfTQevve+jwx1J/FJC6cuvTd2F8YZrIiGwR7GL5gOZxew1h7qNPZaDQnghI4PRZplV3q6h4hRIiIQgqJHn9ficLMCFXGjIbai4Ss5WdzSL/ElTf36GJYFqN/G/qJrJbqsclpp5d9kM16FevQRkVQwOyJ5wXIwV3a67wUIFmc9eipQUaio2YOA8FkXZGB40srUfCCz1i94wAiLrfZWJo9Szj5TM38n6e5+tZWd/D9nPty6tJi+zeoWL26jbGuw4U9P6jVn9utxI1LPn8+3Omu6oVjUMUvEGAcbRfuRFKby7UQBHkhedAqSvD6Pd5mhf2pswZirmd7p9+9Ns0NQe1hM2wedaSj/N0kqxX8W8lJohI20tbAKflEg2Q+OzxctZU4uORbGyb/qOAJxoaQh8VrixNqPBBpnkEou483HE/VJFDZa/MLDpJurfCVLORUbIlqtKvrTRIWjWHGCtHqp6Nj+nxmg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(48200799018)(61400799027)(35950700016)(7416014)(7093399015)(11063799006)(56012099006)(261009223027099003)(10067099003)(261021121427099003)(16102099003)(18002099003)(22082099003)(4128699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7WzxhhP7WKbBB0XKRIxeNRpTp4mXoJkW4PkJADnpg1IRfc7BXNj97QkwweWtmH2YnpjgsWK0s6Eau70KfEBxeNpvLHcmJRh2kwDpSP4/5/aLJVaLJtXWxIwncX2ksZs2Qh75MHycJ+ubydQU1QzoC1i2LkfqGaWKqIMODxs2hcb5i+SOo5jaBqi3Wm6ehLWs0mf5gz4MdGwoTxKrhQw0KwZYma7bW6M1A/C8mard4waD82jE8+pWAlHLv1OmgUOPKaeZ+delkWDimVrn/edX59W695ciPyRNGmkMzFLOMOdcmXu5rMUZUVYaMrabNbgPJau3ZauN0/uSdECoiWDE9R4Q3m7H1kNj8eUKXcU10SmIudfewIBs3/y+uKFzq+1D4b4ng9RFbbQjwo+wzMrrzdPW/bWkUcesg/PGw8n0xBDPp8LlR4CrOIcCtNF/oTiC
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:41:34.6012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4887cef8-023a-4485-9451-08df35c2593b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00006E26.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9429

From: Carl Lee <carl.lee@amd.com>

Add eeprom device node for NFC adaptor board FRU.

Signed-off-by: Carl Lee <carl.lee@amd.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
index 8c4a03a82d44..a2392f684b80 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
@@ -16,6 +16,19 @@ eeprom@51 {
 	};
 };
 
+// MB
+&i2c13 {
+	i2c-mux@70 {
+		i2c@7 {
+			// NFC adaptor board FRU
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+		};
+	};
+};
+
 &sgpiom0 {
 	gpio-line-names =
 	/*in - out */

-- 
2.34.1

