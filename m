Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794579676;
	b=tjVGw1wStxJyo8I7Al4xkXPvU7jiad1lROgReBC7Ol5+4zWdGb0j8S7v6jE9yFZFw1+t
	 NwcFh2xbdiwmgcLGsgXc4eEgm6AEh1PVPPEsN8O8Wv2BtRICAy1cGZnVLM15PAoy6AoiM
	 IwkD7Ml6iex9epusDDLtHIuSAyPUnBTSkHJTepjasCzwxwqY46TMgtlD7o9urncb8/YER
	 hyOg5TUWj5Hu3ijrWWkgp9bvqQ+F3C9NZpovVjOQ/r8fImRmlYnZZX8V60QJqp5+uP0Kn
	 HmK4oQ6VAXSjZzWeiTuWAqr0OughbeoeF+KFbt0l6quTEhGHejKY+ziJz5wex3DCXsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794579676;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
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
	bh=hh4gi/A5MAP96JwUEmsKUducqUANYwAhvh0gkHOGeTc=;
	b=MyzBVDMwO+3WfUM/RVfwn++SP6WVuk9QFAxZ383XexkDlUyc+ZcvEgEn3GT4Ox41cKBZ
	 Mb8tE7/EViDMxNIfzQxWxucSCQ9wjoOH6LGHBdNptNYBkzzOqoJwQmaWyY5+HdRHlkYER
	 l5jZaj40slw7DQErIbBaUJeCPY4XCOMcStdFcR/AttJp+cOhaVyCuPbmvKpgXQPZCwDKN
	 HN/BYthmoW8ssrShpmgepKVjn0OeSm9JAybx9GX3Hxd26hOS9RUf5I1p43lW8VWwuru5P
	 25MoC2eYX4JHQBr5CshpVTZu/OYJcfdmhCjBleKO6L43HqgqNXM9OTrJtye7JOggOYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=ThBT3FJw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.46
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013046.outbound.protection.outlook.com [52.101.83.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBCD606A32E;
	Fri, 13 Nov 2026 14:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDBCD606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=ThBT3FJw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHhgiJeGggKBuB80NSDJXlw7VJcATElSggvchIr2Wacs1M2cgMtILZGmixKAc3NMGQioMqMGVVTu/usah6ytPhxpPJk1ZhjYjaH5XlVQHOIZY+86JEYwcl3OyONXbeSm7DLDyiwlNO+5YJrcPNQJkbTnPv71To9sNGeeNkp6QYT/7Tq8+p62mduBd7hrpWxMs9jzCByS4nxRky8bOOPj1NF/cx7Q1ofGgeg+J+Cqs1BXqC/b6LBXeaX4qZj7lF70SsBeR2cW9WEWRFzJmCwQreZiQ+ESEcEskj+tHs2fhod9KIiGr9EoT1PbN6HxfDYzgOOWGFoqefvBJXGuDehgxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hh4gi/A5MAP96JwUEmsKUducqUANYwAhvh0gkHOGeTc=;
 b=tH7XMx68p9nyoX/RMnpEeoj8ufUbEg2KqtwLcJbDiD8z12jtiZiEx91+BTTprHMF0arLSINwNSjA8xL+5OEX1F/Parplnr8IxaxDyfEhj3EsVJNb3JHcB4AKEGwuvgfYcvDUzQKBFPtZ9I94PtXZjBEHpggD72FNDTESo7yNwMfT55IF86zouB25pxHT6Ms4drSrwG+1cpRxs8foIzMr9/bt7EEpukj1BtQ+KJdnLwPDjWBbSx25egLs8/a8aVAqx0C8vDxH0Rzpd/lQkX9Z32krftnuo4LpD0LIQlQio7fmfhtcKX/inLavPqZNDLqU5w9Y5xcT0PLZDYvven+bTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hh4gi/A5MAP96JwUEmsKUducqUANYwAhvh0gkHOGeTc=;
 b=ThBT3FJwIGz1Ru6iJ4ZZoXGXIKr3Duoxm+fuaPNQdWheexzR+VvRXl7BoRvoFhRQ3EJy71r8Y6/So5BV86u6ypxCmaaFF7gYukCw5jKFBFzbp04UxKUMtHjd09vcT3MFWL1s+x4Q6SGAmJ+K0mXCUWXq0rcqWYAzcQacxOG7FXKbfrfhKPZOeeTDawFS+KrcCqmmY/D8PRa+4709bf/frLP6kGOrH4xlCIaR08ei1D08Lr7VWLvdLGbt2SiuoTZAA9kdpNTEE80mWXszXIqKLZ8iOUAA+wkwU45AKCymL7eod2xeROCyE8aiIhVnMDgyjX1vZ8+Z4rqBXGyCA5USjg==
Received: from DU7P190CA0021.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::17)
 by AM0PR10MB3650.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:153::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Fri, 13 Nov
 2026 14:21:12 +0000
Received: from DU2PEPF00028CFF.eurprd03.prod.outlook.com
 (2603:10a6:10:550:cafe::4d) by DU7P190CA0021.outlook.office365.com
 (2603:10a6:10:550::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Fri, 13
 Nov 2026 14:21:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028CFF.mail.protection.outlook.com (10.167.242.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 14:21:11 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 13 Nov
 2026 15:22:05 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 13 Nov
 2026 15:20:34 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, Patrick Delaunay
	<patrick.delaunay@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] arm64: dts: st: add SCMI regulators for stm32mp215f-dk board
Date: Fri, 13 Nov 2026 15:10:41 +0100
Message-ID: <20261113151038.3.I2f210226b26e3b5a80ad5207860a15fa657b55de@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113141342.557258-1-patrick.delaunay@foss.st.com>
References: <20261113141342.557258-1-patrick.delaunay@foss.st.com>
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
Content-Type: text/plain
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFF:EE_|AM0PR10MB3650:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b404df6-1a2e-420a-4325-08df41915e0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|261009223027099003|11063799006|56012099006|261021123027099003|261026121527099003|261102123227099003|261021121427099003|18002099003|22082099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	55evdmRz08YPrSi9QcSRCXIt9rD+NlBO84cSYboMsL1MDPJzyVIl8SxLafGcUBHGOcmo4D1Q0bSixCyUufKaPeS+usBKnv4Dxt0UGzXuhYkWPe+m8A3GQ3ubqdWA1fraaEs+pgPr/Z4LtSfPwb9qUCSpoAodlNrVY/0E951iiW0KlOtI4MKefE+MgipDmT+lsn7H6n1q5NrZcA/uBZ6cPPRGgOivPQ0x9IpX4iLMnq/OYzTlP0Z4Bc9fM7ycpbi/UkYhrczfvIVgByNl0vj54YRxcl0nfKyV0lIeKculPBhm63PT3JSAWoVGd/meaow2bDvHa8J9mnakWUU238LsnquQOd4GvYEroEq9GHJw2yk3XCBO1gxpNQYYfXdRY6dAR8BcXtRaEI9r04oG9FUjBbaAE0rMNdkfYmDLsPyoKwImeYNU8sxkxCwmgoN+TzpjNPxAFbW9SKgRN+KsYGG15v5coggQQ9BmQzZrBj4JRiL8e9aN0u+2HYr+iY6uJSuzZh4LBgpNQ18QJYBcRNZG0sHiuc41/BFfhNlCIIzAXYtlJQXE7GvhvMfG+PDAXrRXX5p1gweBjXdDMfovtOLXF+0IO68MxszD9CsOpuPyjGfX1iKYJU8uGvhpHBYJWiBYlX40B912wgYvzVR+qzihrsjIXSgcS3m7jTj6cSIkyHhr1YmFcC2MnRZ+djfluBzZ75bk/SahruzxFuD6i6k4pA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(261009223027099003)(11063799006)(56012099006)(261021123027099003)(261026121527099003)(261102123227099003)(261021121427099003)(18002099003)(22082099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FLqZ7jbUtZnZOFKsgEe5y39d2BTSU9QNHjPUfcZtfmGi6YGL1XeFGxk1LGX3x+4fFko/uoDMraat245l6Qle+D+kKQuB4LJtwoVsOccxvOlSaznoO+nkKp/np5aAmTBqt3h9rDq9rogq3dXkIbj/zTgxH7CgecEHPlbhxB+CBysdkgvOaSP+1zMs9Z4/DbkL4QzXNcYitnY1eaqQSCW2poNM6J9zaz7f4Xi5cWUfIOxRUC9nYKkwy1/9uxXvEc8oQ79009XtHRqSA295DmEH61HxAGTHvqTAUtvwaYC4B0jXaU199HTaw0I9Rg+kK0r873eocVNqgzTH/J5p0Tq7dBbJlzJ/z2Ude7fVyG+gQohbmq9qFDadYlAbAz5o0QRzqqHZ/qU717irFfuGFO6zxi/B0e/hQd5M7tT/ariae5uTfXACIGByqrj44ofp0mL8
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 14:21:11.2781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b404df6-1a2e-420a-4325-08df41915e0d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3650

Add SCMI-based regulator nodes:
- vddcore (BUCK1)
- vdd3v3_usb (LDO4)
- vdd_flash (LDO5)
- vdda_1v8 (LDO6)
- v3v3 (GPO1)

These regulators are provided through the SCMI voltage protocol
and will be used by on-board peripherals.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm64/boot/dts/st/stm32mp215f-dk.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp215f-dk.dts b/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
index a1285abc80ca..fc7010bf8d88 100644
--- a/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
@@ -48,6 +48,29 @@ &bsec {
 	bootph-all;
 };
 
+&scmi_regu {
+	scmi_vddcore: regulator@5 {
+		reg = <VOLTD_SCMI_STPMIC_BUCK1>;
+		regulator-name = "vddcore";
+	};
+	scmi_vdd3v3_usb: regulator@f {
+		reg = <VOLTD_SCMI_STPMIC_LDO4>;
+		regulator-name = "vdd3v3_usb";
+	};
+	scmi_vdd_flash: regulator@10 {
+		reg = <VOLTD_SCMI_STPMIC_LDO5>;
+		regulator-name = "vdd_flash";
+	};
+	scmi_vdda_1v8: regulator@11 {
+		reg = <VOLTD_SCMI_STPMIC_LDO6>;
+		regulator-name = "vdda_1v8";
+	};
+	scmi_v3v3: regulator@15 {
+		reg = <VOLTD_SCMI_STPMIC_GPO1>;
+		regulator-name = "v3v3";
+	};
+};
+
 &usart2 {
 	status = "okay";
 };
-- 
2.43.0

