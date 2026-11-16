Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794825101;
	b=Lp9/Tc6zkCPKgOQez735zwGhZwurOPHXgmiOikDdxWASL3JAdEV5o2qcz9vkYeS66xgj
	 1dvqRN/oe8fh9E8L6rPhJz+jq+IocudPHggSzqz7Eh4eZGtaXLEzLGuRs0QM44f7dUCFu
	 fs2WRReqPltOMG0sHh2jrMKyIPh3i9HuaUadRMHq4iT8HYKgU4OfA7q5ElYz9h+1sLerx
	 HeeTfJwgqfL6X1NfXmILF1N4TyFfkSpwUXPCUxrmoELfNZqlt2S/ZuW44kReW7YhhSJrW
	 3W/xF9HUs/RJpgm7i2vi1bG5xGdYZ6ny9moovvvBB7o4HBgnHOodg6rItgxB9Y0pGjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825101;
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
	bh=gQBoDpC6nb4OwnbAd9AVRUrP1PQ86qmvzaLd2InL8iQ=;
	b=jIqxA6aBmzfWlrcV2W3xGUwGxAvOvvBo9uD+1s4zBADgRXVFhvY0DUdZHILqcrESCRAP
	 4y5dOXxuTPPj1wTDOstXzlHd/LwbhW2h6TjZ2+qMTCswgcmjKA5u9WT9aYIfPufzNx6Mx
	 0QTobi3hLUDFty2PtxZWl1vHaRFLeEMe5JAggwzDVHw76FBP6KMTa1tLX1rBAQCsekIXT
	 rHBKouAycpLw9p8d21beIU0r7Fd9eHBcxIyoPIq5CZMUw+kp0AKEMHql42aDOP13bN52v
	 B7ggAK9EWrzuwzjF2DPI7LBeEH40Cq6rkhcqr+nTrkAizx2QPdVDMfXwChguNzDzvuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=iOF8PMx0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.55
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010055.outbound.protection.outlook.com [52.101.69.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95427606A330;
	Mon, 16 Nov 2026 10:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95427606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=iOF8PMx0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b84fVkFDduOg856fArUuJcY+gYQORSd/zn+iq+aC+csfT68iifAARd9zLJV70kx4XZ1k20Q9IleXNfDJ4TRZZd6EilnI03DSju3XN32iw2Dzs3QRL68j80O2FMHlIPEsNVXbU+GR4Mqp7VcMQC3ZwZszxWtks/4E7hsppEjAnpenSD44E/UOxwo5SKgJnmNfJJojrSgGggvVQgOYGApbSPgoLvj+eroBNlOuyIP6xzI8xWdGC2RmYgJleymphZ7Zc9gT4PLMWle75TvVaLPHdYmGigYEvwXo4dW1Jidxf0VSZ0ayxtkyC42FiYnu/XDZa6R1QaLD0I/i9it0/9IanQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQBoDpC6nb4OwnbAd9AVRUrP1PQ86qmvzaLd2InL8iQ=;
 b=kBRXlt1iTakYc/8Xmbg2TrfjzYhhjWt+I1jklU04Y/NmFXlrtdGqarNSdYiiEHdpCtYKtlilHPzGDbOM2Xxfud2fNHAsLYsK2KWFrdaUqrjFvcCBq6+zW8moQ9y3vdb1TIq2sCPd3WvptHzq27Vl8RwkyzCh/lxVYHUWg4c4fCR+68/F37/xEqmCpOKZQb9N3EwZ8ISPIAmdPJXiYV/p9Je+KZWkNQVTPE5bdOL1Iyvb4T4MRCyQeTueUd5w0xKn5SCPT/mMJbPODCXzpf3k1K+hMf6LwknwjQbbM2zlvRDmkVhip+vc8FzGGic2xt7bDcCcoQ7nOuRMUAE/qrG5Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQBoDpC6nb4OwnbAd9AVRUrP1PQ86qmvzaLd2InL8iQ=;
 b=iOF8PMx06zDH/HFkv8qMmLtigwaU7+qdq7ZqGYqJj6rofdxt/KrjGrmypKbgJsXm1J2VdJrp3Udk8izNEZpgY7nzV9zJK4GE+H+4yBq0uVvi8lUXfKSG4kB/kZx4o+A86szXyaLZQ+oqxK+YsrHXGt5xQBYIiGt/ETxx4AYrwBZLBb2Q/KSRLyeGFXxzUotNYZpBBj3sx2jedAwg8beMe9FHHocHomOhG6afBfrmCFIBpUxbPc7ZjhDuNTn9KRy0tkA8aKeeVMixTRDm9aMpQYFV9S/Td6aupYodIVosXbwgcX1BQZ9/QFDkpUQWOcwdJ+U759BRclayR0T6YbhloA==
Received: from AS9PR04CA0101.eurprd04.prod.outlook.com (2603:10a6:20b:50e::18)
 by PA4PR10MB5635.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:264::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Mon, 16 Nov
 2026 10:31:34 +0000
Received: from CPH1EPF0000051C.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e:cafe::78) by AS9PR04CA0101.outlook.office365.com
 (2603:10a6:20b:50e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 10:31:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 CPH1EPF0000051C.mail.protection.outlook.com (10.167.241.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 10:31:34 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 11:32:33 +0100
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 16 Nov
 2026 11:31:33 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 16 Nov 2026 11:31:12 +0100
Subject: [PATCH 1/3] arm64: dts: st: add delay on imx335 reset gpio on
 stm32mp257f-dk
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
Message-ID: <20261116-stm32mp-imx335-fix-v1-1-01f538260f00@foss.st.com>
References: <20261116-stm32mp-imx335-fix-v1-0-01f538260f00@foss.st.com>
In-Reply-To: <20261116-stm32mp-imx335-fix-v1-0-01f538260f00@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000051C:EE_|PA4PR10MB5635:EE_
X-MS-Office365-Filtering-Correlation-Id: 61002793-0960-4ede-7a01-08df43ccc990
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261026140227099003|261009223027099003|261102123227099003|261022105027099003|261022075727099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fzL1LLtSAu2SLeWO8WxJ9rXWcNjtKZuX3rw+iSFx+4myRA9+4jMJGxEKqInv4OyeVJavigMaYfmLDOULqanehhGJ8PRzbdqtsXXiH4fymHQ9r0Ke1OgdA9oDnkxSttdjgpRd4CqYvF6yKbkR7otUfVNRoNnFGX3ZD8+M0SuKsvWvpNkLTKw/C6Oziz3v0jV6nKvBRjMIz2R1dhgO2IDsjyJtrZOEy8I6ZbyaDECWnyhyv05nG62+vQW60lUzhJGRACPCZA3VFOT13tkmP/MPU/WT5D5opVsiznrr7zz+VW0TVls+aoPInsv8dTaZeLtZ9zD6JN0C1Pm3YlrtBl5wiipMNJFTJ07d+jkdzP4SFKg1wX0VL+SR4Ou6VvEBFH+q37SR75KnvnElPljbzJ7WRqA/P9gLcDcre2sIR4M3UyTU6lCOxUv7BtSdsJb7FEM0BhWhtgiP5Nge2xKMJWoc5YtF6wqPuNQw7fW1GeimgWK9AT10IwpTxAxvBYykC2BoDbzjUjLA8NQ/FhoO33KvkbF1C7TBV46byocz3g8S/+PbKw1Bfl3W3Zdzr1S8ZtUI4+EMLiRV2r49IXWxqBME+yXDWv54fO6Anoj95MnJd+eKqyxsr2VRXOzBS9Z5ad48yVIoaYeKoUwuGDU4DRKm4o7Pfq13uJKEkZk1XdgknuWI3ataDvOuVGtTd6U6gZLtI9v79xHW3hNmQ4JULAWB5A==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261026140227099003)(261009223027099003)(261102123227099003)(261022105027099003)(261022075727099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kPyp4Qxb0IpmY1QZmlDjunyB8SqKeBuu1EoPeFkghEgKuasIh6EoaTB5mHrffyVYeFjNI1jxYERxSpVDlgg2Mev8QN4Wcy4C2RbjYF96BHzeQR74c9qVUB6/7272M3aQZguY1rrxWg+4TX6//u5UzkdNoBk9zetbQb1USs5G3TW7IW1ChqoGk5Cy0Lah+PTTsXFPqovOqbsVLYaK+RE7W1XcKWs7+h+l5Oz5OtrUXzwWcFcy5Tgbut03T51XKrXC+xJb2mTUCYp7IFR6hYqvjsGP37K9fi57D2xGWUxZSB4A0ustG9dqR+m1Wc/ItTZ871nd3K2f29NoOtfilHnZmCNOnvYEe6QA/P8A9OR6xcYgnv9N9pjqYHb7xxqBne3Gm+W8ZSFWWz4nTH3IbrGvT8JnoROWjMCjX8dSav4fivSuMqQIIWX99lJk63lXnXgj
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 10:31:34.3003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61002793-0960-4ede-7a01-08df43ccc990
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF0000051C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5635

The imx335 reset gpio is connected to the sensor reset via an RC hence
a delay is needed in order to take into account the time needed to
reach the level for which the sensor sees the correct level.
This prevent having imx335 power-on issues due to the fact that the
driver is trying to access to the sensor while the reset hasn't been
yet properly handled.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index a8f18508db3e..ce7bb4a4d9a7 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -76,6 +76,13 @@ led-orange {
 		};
 	};
 
+	imx335_reset_delay: imx335-reset-delay {
+		compatible = "gpio-delay";
+		#gpio-cells = <3>;
+		gpio-controller;
+		gpios = <&gpiob 1 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
+	};
+
 	lpddr_channel: sdram-channel-0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -236,7 +243,7 @@ imx335: camera@1a {
 		avdd-supply = <&scmi_v3v3>;
 		ovdd-supply = <&scmi_v3v3>;
 		dvdd-supply = <&scmi_v3v3>;
-		reset-gpios = <&gpiob 1 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
+		reset-gpios = <&imx335_reset_delay 0 1000 1000>;
 
 		port {
 			imx335_ep: endpoint {

-- 
2.34.1

