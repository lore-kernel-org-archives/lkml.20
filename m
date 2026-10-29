Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793281347;
	b=LvHicBfVYjxBS6iTv9mF0N8HztGAHnIFC4/GUojZHMjfhVTSbpLmkDMGFwzUXVM7Evzc
	 qZaEKCUuOKu6+Y16X5htyzsj8f0aJXI3P2tgtkTwfs5NjqkF5zJMMkc++nQ4RW8iXEeDJ
	 d/+cC3lT6dMvSkzXxmGjFjfRFFygeowjHkyOWc0ibbe+hJUgth4/yRRXEBmFd0SC4hWLg
	 f6kWQ8AQErytaGwZoeen1h3KmvnIPBi5gQefn74WFtXzZDcn79vtjJZbjONbx0CHrOFWF
	 zHEYy2gCJ/X/f7yNPajgwGaXMYsn5deaWqVBR+i1mlS4H2zFb3VWvzjIQnca0N6F8xA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281347;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
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
	bh=d0Ss/jHN0gD8nntXnawTWe7fsmC2YUBpZ4fCL+67+6o=;
	b=31QNUcxpIrUy4v/MWA+RC+31+EI7Hq3yzEWprbl1DR+97CG7CeOBMf6CgNzGOJo7uiVY
	 b/z+jGMT3NbHMQBgGC3+eJunOmjz9H1SHsx6VXS91hTqcsxUZNWkR0YJO9acH4Vv/vIOK
	 F8ewH7BaDxSp2qAnjRxOt9wLvsaUtMemC069vCier3fU+lXg/vzTSg+rl8xPSvnIssccG
	 2ByIjP2zwXyvlTjueBcTrNwbiAwqOwV5rY8li7h5JxUmewlisdw8hsk3ewXfXsGbfoOfd
	 z7q771am1WTQmUlc6IZ+bPr21PPLTmCnfnkjZkfszs+DRJaIrtihIMSlkfatY02uEkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=amdcloud.onmicrosoft.com;
	dkim=pass header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com header.b="dNJl/Cn8";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.52
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012052.outbound.protection.outlook.com [40.107.209.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBBC60A261A;
	Thu, 29 Oct 2026 13:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEBBC60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amdcloud.onmicrosoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com header.b=dNJl/Cn8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rQGN4GTJ26u6Q2Svrw9lj4POKMBsbGRu/ZYPfSOBy/T5uraJOZWKDKG4BD+Tqa1saX0Sud6TvRlmll+1nOHjyzE1CwtCmL1fh44JQ4MlCN6/qvUjMc/cwyuM3bSTSg3HXqrFtnzGfM6fWIFadeWHs57JQPlvvV9b2efGh2iioubFRFfWgjBZjd1qknxKDGVoVM4+efuitO6baqeFpfi1KDwrR0WwZuV1aYDIMO0nTsI8q7D1wZo25DaUU4Mc3S08eOmEh1pe6j3Zfwx4a/ilLpCKlwgrHzDGvrllysNmLR3eA43LLBUODE7Z/ke+Oh5svCKOGkG4Yhu7oyrvrmXEcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0Ss/jHN0gD8nntXnawTWe7fsmC2YUBpZ4fCL+67+6o=;
 b=RuQp8xikrcnvGt8Wu5iebRGv5jA0Z9ZcLIW5pDmJSK2Dd0g5fTAwInfxreOTOkJvBNiALck4VUGCAyc/MA52hoCGA1LBCGI+LydQ84eBOzTRsmM1Fq3NPStIO2f98YugcKKMBcSGdvkqJ6ivOVWUkHo2gelzQWhwZ9EI0AblbEcj5zdzT4JSc9C9TFLqFzTU58lHq6iP38g42jFMxw6LKoA9l6b1/EJ6L2ul1IsQmt+oDNcj8cz/qpEgpVgkeFtFZdRbb4nrCYjxTbbpu0bA8Tgubus8rwnKJuu8B06AmVm9RAQjPKlDaJSfiAf62VddabaKG4jzfR3Q4paDVML/PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=aspeedtech.com smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0Ss/jHN0gD8nntXnawTWe7fsmC2YUBpZ4fCL+67+6o=;
 b=dNJl/Cn8+NhEk50Gt/BjJ1srcbVz2mY6rsFy9rWbUkjND5EVt+zB6D/33l9w8XUsEwutyMuQVGtcSMMQmJpG8GFlAnpXH37z1MlCrRBKW/iwLBw+8fBX58A13a/sJGzpFyy0tgIOUaj7h9Gvntv4xfDy3IcgUO5muMhO/yRHRJV9s9paTcX1hb0M4nFM8m5cTthZttRCxgxilCVKbwdy5LfNgxtUG602J+mYbd2PSY/lqy9kTuUQTUhM4H+ekazNAT5bOV420J5wrggg9Pi2kkMW9cHy7fXT3KqRw+wpEwCymhuc8w2Xh+lYAO4flA4F95TTKKDcjD7z2wNO0J120Q==
Received: from PH7PR02CA0008.namprd02.prod.outlook.com (2603:10b6:510:33d::27)
 by MW4PR12MB6921.namprd12.prod.outlook.com (2603:10b6:303:208::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 13:42:20 +0000
Received: from PH3PEPF00059619.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::7f) by PH7PR02CA0008.outlook.office365.com
 (2603:10b6:510:33d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Thu,
 29 Oct 2026 13:42:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH3PEPF00059619.mail.protection.outlook.com (10.167.243.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 13:42:19 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 29 Oct
 2026 08:42:05 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 29 Oct 2026 08:42:02 -0500
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 29 Oct 2026 21:38:44 +0800
Subject: [PATCH v10 15/16] ARM: dts: aspeed: anacapa: Add E1.S FRU EEPROMs
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
Message-ID: <20261029-anacapa-devlop-phase-devicetree-v10-15-26ee3cf9d9d0@gmail.com>
References: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
In-Reply-To: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281119; l=1800;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=2kliQUULy8lLWicSSHzMuRcWpjJiX8vYuBhJaoJDw+o=;
 b=wse9HpR/Ul90+UvNSbn/i8neori2AiFGNlSNGkXuyC6Fi6pUuBSVKuD4UduEBOxf43aKOf7YC
 3GVKAAgAHjvBpXAo4CaOJN7pr4+2BWn+sv0wbG1hfKmw/La4+mBloqq
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF00059619:EE_|MW4PR12MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: d498e09a-4dc8-42f7-83fe-08df35c27404
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7093399015|376014|7416014|48200799018|82310400026|61400799027|35950700016|4128699003|16102099003|22082099003|18002099003|261028144727099003|56012099006|11063799006|10067099003|261026140227099003|261021121427099003|261022105027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	71W3aG1HlkRgZIMDeXEtnUUcfcySMP8UkruGhZ2Id8I4nVkCRPZHVco2wxr9bp4zZNHDbz2I1U2RnFmjGVNq6HWaQLibFgurB+xlLUFXf4Eo4bkOthVHgvJgxvqGTY56V1wOa2dKTNUdcwiV9Zv4cEpiYYFPXwWxnu+aCF3lolalwVjBFnzlcK0UVXAhZ6MDqDUJms6Ythw7m95WrIrBjd0rpSBLgGbbr5lHiOKako6xcCmFBqpSXnClbGn8bzJVASisZOxstXWSkRvpUNQGn4/7XFMcYkEKm7jGP5DpYPzop6eC8CAVZHFurcWxQ0EacEs8qYi3FFV9/iJ1hFYHL2gmknxbYCyIACHZODWzSEuHly5dMzZN5ujid+1/vr+C90M5VPMgj31w0f+e2psTyaWKyYNqWy8EZ6TSIs7NopCgy5xv5zVtTCD3CpXYsc/wXcQQmbngYKZaJaYduSLDLzkRwzuOfBmvEKe0tUZ+FPb08abRQ6FA2LaxvrGHM1wK5OWADNAIC9GpQUCL2Mvf8OjlU5XP7/IAaMsok9IVS4+Pv1xE3ed6azGKxn5/uZYJfyR7LOm0GcIBMSE5ac6pSD2qIq0asi62EvgAPC33QyNm+y2mJiryYb0ATS3CpIZd5bHp8KZPF/AaKVNHG7i4yYS/rowZ3cDzjlhETI/z9ifaCV/mwFjJi7uJcwPu9pnT0hzhUGGLkiJemoww3r77rg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7093399015)(376014)(7416014)(48200799018)(82310400026)(61400799027)(35950700016)(4128699003)(16102099003)(22082099003)(18002099003)(261028144727099003)(56012099006)(11063799006)(10067099003)(261026140227099003)(261021121427099003)(261022105027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	th4IClS4D/1iuPMwrVUqzubzLglaNuv6evAMIJHdtxyE6Hxw9JPC53LWlaHfT/Y9A2AWIVPFUnWAbgmDuMhrCAgAF7G32I3VWsFVU4AKtMfa7bYLXCBEkKoZ+x8hqbfXqHnVM3XCJfK3ELunQiBY6a/ilZ8fmj6AwE6F0oR5nnHM3h8TWisRmg/RPhlhf9RT3/WNiNKB199sH+bXCaBjn7qwIqb8aPZMXlgQFHgI3YBQPcsyjb+vl8lxNLPgugeFlv+iUAwVjnR9SeZy7WO0q1dh75WLCtFugA5hN0XNxq/YXfHCMzh7oKUrcygvNxFF0QaeIx/vn2tKOXxpCOgX4XUatOXcczXOQpNZlgdvNEygYVt7U8opPVd1EV9sh/XXV1qapBpoFvgUxlQ74jfzCWOtnKSuzPVaYRJHIR7vjiGz0vdFeNXo/p3BIG2qRuKD
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:42:19.5637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d498e09a-4dc8-42f7-83fe-08df35c27404
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF00059619.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6921

Add the FRU EEPROM definitions for the E1.S boot drive and the four
E1.S NVMe slots on Anacapa EVT1/EVT2 and DVT.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi   | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
index f61cf5b3718c..7745802d3640 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
@@ -404,30 +404,65 @@ i2c4mux0ch0: i2c@0 {
 			reg = <0>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			// E1S_Boot FRU
+			eeprom@53 {
+				compatible = "atmel,24c02";
+				reg = <0x53>;
+				pagesize = <16>;
+			};
 		};
 
 		i2c4mux0ch1: i2c@1 {
 			reg = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			// E1S_0 FRU
+			eeprom@53 {
+				compatible = "atmel,24c02";
+				reg = <0x53>;
+				pagesize = <16>;
+			};
 		};
 
 		i2c4mux0ch2: i2c@2 {
 			reg = <2>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			// E1S_1 FRU
+			eeprom@53 {
+				compatible = "atmel,24c02";
+				reg = <0x53>;
+				pagesize = <16>;
+			};
 		};
 
 		i2c4mux0ch3: i2c@3 {
 			reg = <3>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			// E1S_2 FRU
+			eeprom@53 {
+				compatible = "atmel,24c02";
+				reg = <0x53>;
+				pagesize = <16>;
+			};
 		};
 
 		i2c4mux0ch4: i2c@4 {
 			reg = <4>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			// E1S_3 FRU
+			eeprom@53 {
+				compatible = "atmel,24c02";
+				reg = <0x53>;
+				pagesize = <16>;
+			};
 		};
 
 		i2c4mux0ch5: i2c@5 {

-- 
2.34.1

