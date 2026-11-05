Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793880191;
	b=p0N/agkmgBdIjJNrqMc4rglkIH7SZrzNOHPEcduxy54f8X6rWX7gW59TJikjij0Im4Ec
	 BSkr6oa/d1aSDT0Z180FqpliVdCVXa/lqv645bZSCQR35WS9hUp/Zjidx+HeJG2uYn+xt
	 /T0rm/r5NwHwL2GCWQFJ5GMb1qj6bhy9SBcUKMM82MrvsLZXKuT61Efhqcb/UHHDOwCTA
	 cAsr/T6PufJ/fhEL+cla7q2GO4V17mOCeAV7x1HFhsMjKrLTo92/iVda+XgwH2F5kDGqR
	 h4/Wdqk8PDWmJx/izD2JG0fQ9cLLaMyHgTrNwCZ7OkYVoq/7XfqoF2HCLLlw5dOdxDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880191;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
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
	bh=Tp6aNA+99gIovrTYIbvbggc0NMQ1k2zHjaAq2GcyNHQ=;
	b=tERM5IbbWU5z3+AtgYFZVz4wSQUQnN93Z5hucEFNWIHaX9CqmAmczbMKeaJNrRycsfd8
	 tHMKaExqMe/XrLGKjv53RFW6UjIYflgehGZiAaUQMIi3s7H4kJLvwlINIWF+lEwyCRyZ9
	 9O3EQVvTict5BROaDCiO1+i/iVE4xlg1SqiaAxsLqphPol9GetOB3q0cMV/m6GkMC1jAO
	 w+vLjDsJbxPkLyKyYY2BV8kB0Y5GezPwi8VZnyFumj5+VrbueikB9fdLrfsuv+rgHCiyz
	 Sc+pwuY25mzsmWMBxKYfl8Cvi+FKRnuKYtaE0s+8xePleQXLv802/BFCHh2oNR0bwxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=KYtjXqbS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.25
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011025.outbound.protection.outlook.com [52.101.65.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D1D606D825;
	Thu,  5 Nov 2026 12:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61D1D606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=KYtjXqbS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2WI3v9rhBYIYvzCn8XIAAor726RiOKvoCe/bdUAHXAf/8WrP1iWMhXpERvf7ZvdKFh3rvgNzfxQhSB7T/gKdDj+/XXGYfpgddAc1ZUlGJksTzWarkhABlMUk0fk2v5Aw0LdkIctoEJfcDrbsz023EQZMwUskDg38WEqy8G4ePFbQ8XTTlboy5L21IDWH3E2GbLn2zD1aYA/y4Crcz6KYMxeRp/NzLJEsoTTuR0+Fvpck4RNJChQEUIVc/7rHW8cBYkmz/EQ3bcUEF4weTagtEffnzaGz4L5pUahH5ZaY/JI84KjsMcQH3wEzZDtRHzo5Qo48X8Z6tD7/x/PE9IIBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tp6aNA+99gIovrTYIbvbggc0NMQ1k2zHjaAq2GcyNHQ=;
 b=vojRaWv8uflRGwYpPhs9nF4WoAX0j+tu93F5Qc09MkpRgVovFLiUpx8lI96I7kpLhbl32dkd30vd3DVRJRXHIkDBwry/KgKduM3b5x65C5x21IrHTdhOaPYUiLkGzqADhdQiYRFA3LfDv4qwfTrw+m0+9VMpDnFS2lecYuvnaiEOMyYwdpP0+vjjkF2N9W4H4cDR97NbW5YpC+8s1vZoTy7v3RIoVQblIiFXocYltrqiB899bD93v3haNNSg0ciKLZ+/ERrhtS12wIT7bSUt12v/Hj6rMueBjn4l5iN7ZO0RiS4opGIzd6QAL4tKaY5VJXRH4BR8yWAxH0l5qIKv7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tp6aNA+99gIovrTYIbvbggc0NMQ1k2zHjaAq2GcyNHQ=;
 b=KYtjXqbSCDpI+ji9w1gL3cEtQlwLwesBVTFRx/q5gcb9auQP9L7XTGNq3zvFSfxqvpPyhQNMt9F67V/RnaXXE4Dl6qdyfPDAUe8AYSDLN0hE5181Mt+Ce6949PKhIavqQ4mUWgKcGElD1fOx/vGQf95HR5bD780e2KMYsAtmjGN7etOEdcM2duPZoBrarNyRnez95FrcPopbhUnsyhUiINNU11nLGHjGadBEAe6dp8ilnrpnTb0SWSQtprmVP8aTW4SnPKaT3bE7+QBeeadyfYmYQHSYaqxVzx2Nu3gO3Ij2O8AhHQyZ9hhV9lHk+ZlmvYajry10ubXwRM1JM34aQw==
Received: from PAZP264CA0123.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1ef::17)
 by PRAPR10MB5376.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:27b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Thu, 5 Nov 2026
 12:03:08 +0000
Received: from MAD0EPF000008C5.eurprd05.prod.outlook.com
 (2603:10a6:102:1ef:cafe::9) by PAZP264CA0123.outlook.office365.com
 (2603:10a6:102:1ef::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 12:03:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MAD0EPF000008C5.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 12:03:08 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 13:03:34 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 13:03:04 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 5 Nov 2026 13:03:04 +0100
Subject: [PATCH v5 6/8] arm64: dts: st: add TAMP backup register in
 stm32mp211.dtsi
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
Content-Transfer-Encoding: 8bit
Message-ID: <20261105-upstream_nvram_reworked-v5-6-ddf7dbf1b298@foss.st.com>
References: <20261105-upstream_nvram_reworked-v5-0-ddf7dbf1b298@foss.st.com>
In-Reply-To: <20261105-upstream_nvram_reworked-v5-0-ddf7dbf1b298@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>
CC: Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	=?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008C5:EE_|PRAPR10MB5376:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cf7cdad-ae3c-40a5-fe6d-08df3b34c1bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|18002099003|22082099003|10067099003|11063799006|261102123227099003|261022075727099003|56012099006|261009223027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	63qKOXvVThROoUWEobHWoMUG7kxs5urWv8NjZ5EXK//qtDQT2XSqd+mq9srOxb0ojd3pPXq0ZI7qqa14+3yjDElsAskpeeyuaYblR2GfXhsOg8nI5xrLYWyfG9KUUQ4AY1jBE37JO/MXDBp/Lu4ZvKcbyvhA0m1WSBdlcaz8QAuiip3Dlj02j4xaJUdA1zvpP0w4RwNiJakpi3SYrBR0oCoVcmSkzndFH+tzwX1buCpT+GLywU1o2Kz+uLjZzYzT6oqfRnsAVf/LzAzR8fWteOpJcGdtoTjXB9mXxDU8lW3L/K85L1FAStBS3pHMUB1OYxK3L7AR65V85JRiZiBSg8I36ffM/I2tTFNvVOZcjdwAyYSHrcMwJWe/Bb4g6cum6mTpC5i2o1ZeWobbJfrnjDQIUXQFrHItxer7vZTSzSY9ZktWLEg7ke2Vsyjl+aflVs/BPQe2m2fgGGTZj7oxKSe8iucP4DfXfOHqEm9CVBisWptU4eLj8Bk43jYMnjwPqUrSxof6LJbYH7Roc/ULgQGpTsxkzeE2U6hqbs0cAAFr5AFYV3diNcjP3Vx6eIotbUNTFaWRADUfH6ArOREcdmlABByzPOAWkZKwGFYBNUzHlZGFsumWj2Xj84+eIXbXLULLZKNpEV8Ov7AjfB4+yiZuM7K9EQt2DYzkkGVFZ9DuA2/BlspUfrtZIzbTuNw8zxIKnvWVOSYtU2dMWa0YxA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(10067099003)(11063799006)(261102123227099003)(261022075727099003)(56012099006)(261009223027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ow11KFdpSU5dladT1R48jSwYh4PiUOXU+skEJ1CAXw/KVKE7dY6MsBzxcAS/TLAm5953um1tpIUkUGAB8cC9smrkJ33/5y/nbrucva/Ca0vl662FojfBKFHlVdiHvwnt7qRLybh2BvoDdrhR0dVZB+SKZrIKsC3VbWREbVi1owlbLOrqRLLbTNRqVoTvm8iD1HSLiRrMyeMWmnBhgO2xqwh8xOyJP3WTcqrzQPz8+FTdAvsqDIK2Yk2gC7GhIUmsd+cSzjBrvNoCvnHTiO/A2rcRfs1kI4zsbC9nGwAB6UmCTORV1XhecFvBDXn9Icz5sMEciw5hr1rsXM68P9yYbKJ6qBtRGxyzHIu0vG7678Zz2yIdExhsUrbVkqmArDx23w3EkF3QENIFzye/PHkns4HnkH7AfLbKC4xoe4X/RnWLj/ZL4/RvBttjMXweZ/nU
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 12:03:08.3502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf7cdad-ae3c-40a5-fe6d-08df3b34c1bc
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008C5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5376

TAMP backup registers allow information sharing between different
software components/execution levels.
They are described individually as nvmem cells.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp211.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
index 4bfd58b26b51..f9fe99dc90a3 100644
--- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -133,6 +133,37 @@ syscfg: syscon@44230000 {
 			reg = <0x44230000 0x0 0x10000>;
 		};
 
+		tamp: tamp@46010000 {
+			compatible = "st,stm32-tamp", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <2>;
+			reg = <0x46010000 0x0 0x400>;
+			ranges;
+
+			nvram: nvram@46010100 {
+				compatible = "st,stm32mp25-tamp-nvram";
+				reg = <0x46010100 0x0 0x200>;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					boot_mode: tamp-bkp@180 {
+						reg = <0x180 0x4>;
+					};
+
+					rsc_tbl_addr: tamp-bkp@184 {
+						reg = <0x184 0x4>;
+					};
+
+					rsc_tbl_size: tamp-bkp@188 {
+						reg = <0x188 0x4>;
+					};
+				};
+			};
+		};
+
 		intc: interrupt-controller@4ac10000 {
 			compatible = "arm,gic-400";
 			reg = <0x4ac10000 0x0 0x1000>,

-- 
2.43.0

