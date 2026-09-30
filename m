Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010036.outbound.protection.outlook.com [52.101.46.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB6438E5ED;
	Wed, 30 Sep 2026 06:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790748873; cv=fail; b=EMLdGfuAwxFUQN0JI6ucPGc4pb58eq3px5+qpDsLhq/eR+6GrArIGnssgW1kbAQhvSuqoIcw3Kf9v6CX75GpVPtVt21ZcsURw49Md22qGjSj49/T4pgMkgsrTXmEB09u2FcKg4O2zGM7CPi16aLnhtj65DhC4P1wbKx94rMVNLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790748873; c=relaxed/simple;
	bh=d78BMhYQt42FSplZpdDdzfXMLMgsl8ESZiBbFRA0Nzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=EEVovnsIa1yVCxLILvmt2E8Cp2c4189DkNTLaMaAACMg58Qp5gPwpNJiJRIU9VHlY8C3J+ehvFEs0O/oyWbAPxr6jG5O22gbAE6nt1PuUZT4Q1SL9iUfQ+zJuj2CYSWD8Fu67E+7nfqvkFf9KQiG/sge3jLNZjFGe+Q9Fkxnkxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=amdcloud.onmicrosoft.com; dkim=pass (2048-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b=vvcHmmhf; arc=fail smtp.client-ip=52.101.46.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amdcloud.onmicrosoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="vvcHmmhf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNqS/xa5QRiNQYBSbH+xjTIamsbL5TEpRP9CHMwKNofIXL7w3VUlmzRaaEyXnlWHJ1I/BDp/5fLV8K1B381GDpZLMpQGO6vE+JKKV8QRHurC1y3ivJFkoeOrTGg9MNCnPfnl5hW1vcrrhopCWG96TpCuL04QVrPLQrM4Y42umPCBAAtBgd5VELZNaXD0NfA//AuJe8tiLebVAqWLLn6mZ8HCCDlbyPOZiC9yXAd5Ge7f2a9Jbh68SuoPubCxBINA02WdMkbp3GQeAwC5KJximkK/JoLfYI/rE48oTKA05DYXVEBqDT0yx0EUhuWDCLAPlgbKym9LFORZYtSCDPKE0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZD1+yjCgidhuF5ukc+OaXEqTsgx+9T1dm+BqTBAVG4=;
 b=CAyAA0XYWyVzcooU9fWZ+TDm/ccwQY3DOIyWhQOxsc0mxJLY141iIcOuEQeQYuePWOnNdNMxPwLhqCYF6p+iTbAS4eRc/9IBuStO7lCIo7cRKyGX7cqsLWClahDPbZ3eqm3/VyZVs8r56x0rRMQ41HpiSyFAH1nLCRi+6UX1GTi5NYCleqOcge9yIuMbATqAL1DOFCevgZIaClARvOXTHtJo8wjy7pbWXZeCZHL9PSHvICqLjjuYzRB8XPEFCHmIGe3KYrDj5Gc4Cu6zKaFcUDcw9N/a/pZYDNAs8AC3pWxuat9w8Ilm3s0ohqIoVZh38meg9CUpdfIGgzaorYuc1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZD1+yjCgidhuF5ukc+OaXEqTsgx+9T1dm+BqTBAVG4=;
 b=vvcHmmhfQmpjXUDtVBb7/jdMCuxB00YAi8mzbTJc2UDbNT72EHC26ArIyqM2UDfqhVNMGZcfIcmOXPyLM/cMRTy5YB+CDscdSA3Gh6gIYmUA3l2pec+7badXuv88XGLjIfYc8r8mfH9keVFHhPCliC3stkqgWlCp8Ms+MRQBVpOWE5E6zsnCayn8UtqBOml+TbXMPn/aAOxPbDf3KliiE1HmLphFsLUH8iysPgN0ejy9SFhd4q2h7MhJsK0tVRobnK/wIoJPa8mgrabnn0bdz1jZAZPIeMcpFqUnLxmOYYaP89x5ZJk1Zfy3Dd9yA0EpXDb4NAQm4PuETf0DU0XCnA==
Received: from PH7PR03CA0003.namprd03.prod.outlook.com (2603:10b6:510:339::8)
 by LV8PR12MB9264.namprd12.prod.outlook.com (2603:10b6:408:1e8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 06:14:26 +0000
Received: from BY1PEPF000264AF.namprd02.prod.outlook.com
 (2603:10b6:510:339:cafe::99) by PH7PR03CA0003.outlook.office365.com
 (2603:10b6:510:339::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 06:14:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF000264AF.mail.protection.outlook.com (10.167.242.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 06:14:25 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 30 Sep
 2026 01:14:24 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 30 Sep 2026 01:14:21 -0500
From: Colin Huang <u8813345@gmail.com>
Date: Wed, 30 Sep 2026 14:10:23 +0800
Subject: [PATCH v9 15/15] ARM: dts: aspeed: anacapa: Add E1.S FRU EEPROMs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260930-anacapa-devlop-phase-devicetree-v9-15-f08aa0d7182d@gmail.com>
References: <20260930-anacapa-devlop-phase-devicetree-v9-0-f08aa0d7182d@gmail.com>
In-Reply-To: <20260930-anacapa-devlop-phase-devicetree-v9-0-f08aa0d7182d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790748641; l=1800;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=d78BMhYQt42FSplZpdDdzfXMLMgsl8ESZiBbFRA0Nzk=;
 b=nI8UaWz/Gn5sdoKs2TWH8egNFxUlW01Yk96zHIUYm7iXExLiAy4RaZO9Cn52Ea03JORLFEl+9
 gSVbN898zCvAoeuxES/ogaJzoRxjmLj7C3J1y2iupGuQdGZCQGJ71BU
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264AF:EE_|LV8PR12MB9264:EE_
X-MS-Office365-Filtering-Correlation-Id: d60e2106-571a-404d-0902-08df1eba13ff
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|7093399015|35950700016|61400799027|48200799018|82310400026|11063799006|4128699003|10067099003|56012099006|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DAMHq/068iQ9eGLkZVxYd8UAs3qHn3ed3YfQmIfRecPEly6iMARhXXLBxtFALdK4L5MOX557GwIomvZGDb3VnX5gLlukblKNRtqvd0O7SaGZp/PHT9bbNmsCYgQPkcosVRzIoNieArmNnefr0oiQzUct2BXJMkoxFdQYkA1E7aJY5g+a5gDzcnktVk422KjPNcCaIVCA/IvbZgjAr08e4YTC+WcgR9iDoShWBv0skzE8vZMR8lBVyc8VjNRgzAxSPag4p0Q1+qsk4nkE3vHaByErlMedGvq+7UFx2VNc0gB/4YFteWDAk0q0K/b8p8DjZanXnUBueKJg701mWFr5lwfIdoZaaUXIRoELqWrLRkCSXMBThWSB8pRG80RPgW6RpTaYs6NZUuQm+RCQlP4CG+LCi5OQqlawDSd2uQcisuNCQ8pCVu18rztc9d0P68CqmLWGCcuta8DA5Y4Tm0Rqmfttv0kCeTaM5B+Rzs/Ny3Vyl37WPyK35trLMCm18nr23M4KL/7hcUHe2SHvJg7/5abkufjbPJq0N3w5h68L7GWoOi2IJCmYx6M2T6nR2gu/n00nzv780bdKZZESlPDu21L7Fm4itnaVVw6tSZHnPDQarTwktaAmUmCuIyJ1Map6dxltZq6RLkK3VR1GBbt4n3vtJQEBfSmp9tLgmDuiIKjSAhMsympo7bqsGGIJSLx9ktJZsPxvvs72/MqetC8v3Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(7093399015)(35950700016)(61400799027)(48200799018)(82310400026)(11063799006)(4128699003)(10067099003)(56012099006)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oDizhW9Wvs2qvIO+riUsGSLcIjGeuBHP+8aYCxU/Bxn92h4E7SbS5HfQmXUWodoB2ENiK2iIZze7YrlpJDjUhCiqf5uoI0mOgonEk6tajl6LMDo4CNNrqlb+XhkEojTeahdrfjeaRp7qtpIMiAKEIlm5NV+oIHGph7yCo4RA4p09HHQ7TGjONRngoMuvDi3Ahy5gQ1BuztRp3lhECUoPd0Cvk60mak384qodCAXCeE+NwrlHLF7HtUYYVn36wb+f+Z2kxCnKuvLFczncv+6mrFu+U9zxUunEIjaGrcZDlDAWlRoE7adtkTaY5pEBlTSwb7yY8D/Pgy8iqbzxbeGwTfHz2YLErXx5ppetxRHSnhchAc/5T4TuEWzaUYKVv1AYPRhghjCsSECYeIGqwcQHv01vjkLwZ90ibN3h9L3i9CRFtnO43zzr9S73RA4xTEkG
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 06:14:25.7455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d60e2106-571a-404d-0902-08df1eba13ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264AF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9264

Add the FRU EEPROM definitions for the E1.S boot drive and the four
E1.S NVMe slots on Anacapa EVT1/EVT2 and DVT.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi   | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
index e429f7be46db..cd87ca27e18c 100644
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

