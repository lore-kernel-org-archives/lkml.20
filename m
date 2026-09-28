Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B50E547041;
	Mon, 28 Sep 2026 03:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790565339; cv=fail; b=SwHPDvTouaWpjSsbZbX595DhHthxgb4pD+mdLbFlgeSKgkr3RIIjFUJE9oZkpeX4ZqApbmr6Ec9g/740QB5tUoblfkVdo7elOvtI6bPrwEL8I5fBW7+FSG25/ry4Q0a5VeOetDVJQD9IwbLs9FEmSK818cWX1ej/BQTpy1yuvBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790565339; c=relaxed/simple;
	bh=ARcJtlSr5GxZ8kYyFiy8f4qK8AUImwStzHPPzWuXJL8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=teeow6b6yFnE5R/PGnYwyjilzGSeEbVVlKFmSrn6ljiAjsM9UWOy+fhzUnhwoaZED4IhV7gN2pQXFH1A9l3IMlXwltvAxjFdbIyU4b9jXsJQYARCsOT3FZdGGqSHZ+LVlAKNtoe0n3QDtFmMGhurW3PT/pYlRAcztlQoqmYnzAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=OnTxXpNX; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YubZVNXP; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="OnTxXpNX";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YubZVNXP"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68S0AbnX3708951;
	Sun, 27 Sep 2026 22:15:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Il/jahKkZPKax8PySGUQjdWMrlQTJmHASv/E3Ekcy
	hw=; b=OnTxXpNX3vNPRi6kPNO/8K1dVc1mbC0uKbmZLd8sUA+UFdmAOxJiKzWCl
	/y8TfHcAYhoOLvblzQOsdhvsJGFurhMoOTDGx7UFpJkz20UTztViqm7wfTu7QdQ5
	IJuNp9bCm7hvnlqzvRwS+5MaJeXBalYZWCg/Kci7JefOEqtBHO9FLWq2VCGE3BP+
	RSb8TfX/i2kWTCJic3GjOAq4NkiA1XD8xbSoRrGazjQ/ZxFxP3c2TupFW/i9Oh5z
	HxmsjaoGEEuzRmXy+7pe0DSH+uXMFqyLRXK+6TMV3+eTBBb6wu11DlWCN6SAMJV3
	/5Yi6ZsxZ1hYHChhddc3eqpM81nRg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010000.outbound.protection.outlook.com [52.101.85.0])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gy00nb3y6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 22:15:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SB/2qIbHtEmGBbD9vtholpeaUZtt5Dpzf8+pKIo6n4LEm1YiEQ8ttAzZ60MwWheWaUH3ooVJLdriRjmet9t1R4+kD2e5zi5MzFViOtHIs8lEDCyK+xsB0AsRbSZ6gZbjsvsNleaNx2XWDqE03LHUsF7qBAoH7UYlfYkvlVBR82bP/6v9QZWHxv9nZ9v14TKj3OybgE4yNjbRk/vmhhTvgSVtQhPalpvxAOyD4YhKTv8L2PT3hxyAM+hdDSSHL3l4aC8Fc5qzoBvIJ1OiJHNM8Txj96LoXrxMK2DoOMHEnvHuIbSozVRBJCIUZCJIBQc/HuEde7voufrGY0+XgZlgJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Il/jahKkZPKax8PySGUQjdWMrlQTJmHASv/E3Ekcyhw=;
 b=CeIsNzJVIb54OY9qa51mSToU9idYFkFRLwxMVfYE5kQaZvsqzEYHkcq7qjx4TRGIPI3JpgE0+718Uuf5DSIs9bhAzI5AiuCdRemNjgF6sH3+6PnGhxQofX/NoB0Lhuf/ArXIE4dwS1hjmcssGaq1s3RJ45Pu6HHC7BsUBnYyoWdeWT6PY7EL3yyEr50zZtSFFourv+1K3r2oM60WpgLWfFVqMWTCQU5mUS/tSwpoKFqayaAHz7QwnpWZ44NnKlq/KZ/ty0AtCRrkde63fntTOZ2SeDYq4ndgGNJ7GwRXY233t76WOk57vPzkATG00hXflLtL1Kkjc2EFLdaC0v9i9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Il/jahKkZPKax8PySGUQjdWMrlQTJmHASv/E3Ekcyhw=;
 b=YubZVNXPyAKbgH8zSZD7/dJHJqOlnJb6/arVWuyXDqLVkFWf0N77SFEnO2wn0fAtQt1SxNnHTjxrJ5KVVuoFh0DsF+uUG3OEsEqlJC1CFTyRn0XYqGjE9aJFGpNWVh71B+NgCfnOKiyHVDAgC7mLODo4xvQAEi0q22qp6CLOgHg=
Received: from BL1P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::24)
 by SN7PR10MB6306.namprd10.prod.outlook.com (2603:10b6:806:272::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Mon, 28 Sep
 2026 03:15:31 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:208:2c5:cafe::39) by BL1P221CA0009.outlook.office365.com
 (2603:10b6:208:2c5::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 03:15:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 03:15:30 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 22:15:05 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 22:15:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 22:15:05 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S3ErDl2281678;
	Sun, 27 Sep 2026 22:15:02 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-adivi@ti.com>
CC: <hnagalla@ti.com>, <jm@ti.com>
Subject: [PATCH 2/2] arm64: dts: ti: k3-am62a-ti-ipc-firmware: MCU SRAM
Date: Mon, 28 Sep 2026 08:44:26 +0530
Message-ID: <20260928031440.1067076-3-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928031440.1067076-1-s-adivi@ti.com>
References: <20260928031440.1067076-1-s-adivi@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|SN7PR10MB6306:EE_
X-MS-Office365-Filtering-Correlation-Id: 4427f669-ed32-4925-7094-08df1d0ec05b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|10067099003|22082099003|18002099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	4Cdk5KJmpO5uZE+5FyMP5w0KLLkzz44WwmSU95dpjK6ThZn6DxRLKX3UZ9x3XgivgGt+CvEDBNS1dLca/1EQneaZ+i/E0dbSTDI26Tz223evzHd6uBUFcXZJU/DDyUvHDI1vVr7X1bb26LIq18gyJGGMv+qGYQwwCHFH0THY6LR+729p1Yp7gmHmihrrYgvnSmoo0N2BiCPv+1CdK8RrIk6o1XeIifZME2xs8IVHrfrvjlVrIPhbn2AcwVDvD4jOqUcG/hganUehO8BFGyqTkuHzsg9k8Yb/XB1uBl57oXgp5FwwasM/B3MQGsfMMU0Yd5HnNBvIDMUajibmSw41njfZfgr+jJrmQ6yuH+NDWnQClLHl0x0Y5P2n0Y1TXiihLJuy1sIkjFVRbKJZIZwI7ZONmoi+9Tt4yCYY6weNQhbk93H5FOpc3nE+o2B2jygrQSTJ2UdOaW/FrBl/hrpUg6QjPZIRYbgyquzEGXV7/21k8wDqMJ4oBG+j/IzJ45H1ZvGKyemklZKM7l/2h53B63pf7F36IdQBN8ra8NEjmuJUA5gvge/DyIWQazgfMEH93QY3Wq/mmWlsGJVwxYPeAxw+Q/WtPxuz+BRJ+znIpjuXFEwQa2HirnDibzWIXKNxpxq7EOCGC34xR+NWWcTlWlPOV9RVo9DaBp6lLBd35oM9s5BTqpw5/I6t/tZaqA9b7rPZVJfcPJLBuYI+CY09hFH3RbpLaumkoADZx615eu0V3UPJgg81/EQ27eyTLui5
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NgaCRqrHLw2yXzxYIXNVGv5mrknyCr/QDPZLG0dD7lEfJwBIVJl8pASjT8ydzfTS/3ikSnk4TlglsGE914O8HQtMPSBTGew6wBAiLXTfzYJDNJRIzBa8Sv6XwXWJvY0L0Y6Gg8SzCrpnWQP1cn6Zsgd01ZYKtGdc2gA47qGVnhAJtgC1FRuKFioxr7xrxOi9VN5zRAVAX8mM0OnZdxqciFq+yKBhAtNPL9btDURDMKdImZj7+2q8pFsfbFFE+d4rOX9Ctb2m4Y6pD+NNCpZAm2iz7IANt2Ur7CDI3cf4IfyE0Fu6PKTi/uy1+dIaOVKwNK51EgJXqayLO0CEelzu4EhUl4oMNIzR5CYY3uiTTvwLUD/7jbrfHLy2Fq2+FHBFVf3ytvxBxrTvCzenkimeZRbllT3BjSt8bK4MTbTlGJooarDLtJiRdA9R1pnSqgpj
X-Exchange-RoutingPolicyChecked:
	MARDU1DtjpUWYgYy6UygBkCU4ZTIpVJDrm8VYWp34A17FF4mcciBpeVLZQAt6xumek4oCSx7PNVwqVJRY4ZBc6aluZ+MQAjJOCR8MgpRoK8S2gNAh0VE6jgGY3nXgfnLZ9m2ULUhG7Ucm3UCr+toLmYV+F1J3VCKxuK3d59aZjF/VRF5DSq0k5EIWrZBnCNBPtvtKp4oyffZxRJpCWFhDk78koZx253ezJGDpjw8lJ8N6qmXRaU/m42Lvy8aYawmAG4I/vFs9U6p0nNrIxeq1OEDz63W/TQtxaj8vQ88/fYCLP9LmHf+TZheNXf3iGP4R53hmedTB7IWIMtRPVhRkg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 03:15:30.2756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4427f669-ed32-4925-7094-08df1d0ec05b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6306
X-Proofpoint-GUID: 1QpsM1iks1iWAbq9Lf6MBwduiA19pNJl
X-Authority-Analysis: v=2.4 cv=fKysTpae c=1 sm=1 tr=0 ts=6ab9dbd7 cx=c_pps
 a=UFaLwPLgEuA+t4da0Yst/w==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=FiYtWYSQbTkuRltHgm4A:9
X-Proofpoint-ORIG-GUID: 1QpsM1iks1iWAbq9Lf6MBwduiA19pNJl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMiBTYWx0ZWRfX0pn9CSdlvT1b
 4dnFIznpcyoYoDP+WYZyxJEuFv/P3FszRXIKLRNHv98YJLIYxiO5sNvhU6h8OV25Mf2rM9XnR0D
 qQmOdj3zFRVbPf95V4P0JDjpUQFT6Bk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMiBTYWx0ZWRfX9CF7lfEBbtDd
 XMiMueEDTh/S9DOhQdIhywKnWMETQSJYAtpsn1Sth7l0F8/3DaYwCXeXXwD3HRtgjNs6Mld/puU
 Z9auhwqY+c2psqJpeWJ2jIONXubLZChwB1DX8lyf1BqKX34xZrCWVW7MzjQ+FuChatixku10i7p
 Gd85MV7ACAIjSOJTf0acK87DnSmD3giY1FalEg2lLxrk6H6NmUzZDnNGbTP8NOhcODZ8/C7BbkL
 bRVVSmRhsRdIxaM265oWUe4UCPx1lwFFksE85E320UCGSOcL0lpmVwKFmgWxs0M08fRGsKlKFrN
 ysqgZ+UUuw2ziSifX90rJJNk9ZWTlSp6mVLV2rgZfV/GqPUcK4uW5wUxUkBNlTbxc/jhIPxfGEO
 bt34oX2QpSi25JNnaKalACHaSCgkPsKNJsrI9oFw2HQsRQebzVqoSJEf0vqZbZkcGYRUVst+jXp
 g8cbKDYqXS+u6uGJ/TA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280012

From: Hari Nagalla <hnagalla@ti.com>

TI MCU R5 firmware also uses MCU SRAM, hence make this SRAM
accessible to R5 remote proc for image loading.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
index 06d4e815b1670..b33613a21da22 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
@@ -75,6 +75,7 @@ &mcu_r5fss0 {
 };
 
 &mcu_r5fss0_core0 {
+	sram = <&mcu_ram>;
 	mboxes = <&mailbox0_cluster2>, <&mbox_mcu_r5_0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
-- 
2.54.0

