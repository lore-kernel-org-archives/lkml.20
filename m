Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD814446062;
	Wed,  7 Oct 2026 10:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791367708; cv=fail; b=rVMeztKIzISQ40CD4nKSjqnD8LpKUYYopNbOVgrQXaivVl/DP2j9XvbmfhuJ2z1Rn6cSTnprqFrdBjEoFmDqFpnRY09xoMQ/bs7kbJcT2selin7VvJh1dDcO35QZ1eUtDbOGICNEfjoxrB0gOS0XSfzFjfZYLpKTaz0q9V0vqbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791367708; c=relaxed/simple;
	bh=scBS92oYUkZkTlgx8ojs7pWuT8Vj2jMRucgpPCPx2cY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fgzK5zzRTRZptos22NJb8fSrTVquuXtSKcGEbq+krpqMsQt5tJmJvkDEKU9JF4olMWOHprN1w7Y102Iua/evvpTFuHF4Jptggtj9Kj7LNIZ7qpVc1N+7oTWd2wpxjqbTxtAEglDaF9toFELEvGYs5XaQ3E+dmkvuOWqNwFdI3uM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=OntgTPKY; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=IpJZL+5X; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="OntgTPKY";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="IpJZL+5X"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977k0pU753197;
	Wed, 7 Oct 2026 05:08:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=JY6G7Zw4BwNC1
	yuWnOW0WBa/F3fObAm1Ywhafa0+prA=; b=OntgTPKYifPxiyI/NaUxTUw0sxHLK
	rb5281nDz9LsZHpSkcOUkKkFG/2f+2Pk3tA4LEwnsvJKPKwMDqZsLKkvC8nGzDmP
	WqHwQOcnowqLnelr5+zJ57hs90PI01DbTS3524Ntuvco7OS4otmOMdtmIOESZAZx
	IyE7L5A1d29VgKEVHr0fAPXZvbsrm0I+QOKQCWuWSp8Nz91JaHfJcsHxHcNmitIo
	iJIca9XVWbEfa1LleC3nuqOgn6pbXmz4NYri2CrAzfH3Pyw5k30Es7AqTJFaQB3k
	jSszRvPyuS3FSfpN+hrJIlIGFmVPWcKxWaciQqE3r8wNoUAdEBWunvbrQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012049.outbound.protection.outlook.com [52.101.48.49])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h5hw78md5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 05:08:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gp8BmM0a54+3t5fiThR+pACksVacGacAqYQEe25aFfWmT3WrhFK10lnLJFcNW5Sgw+IwqwAFSK7Pep9eLR7B23HNdTZwsrPhqjnRtrEZbOF28D7zMi4/urUVW5l8C7bu/7FopUM12gPMQqe8Sy4Nap8zwKw8wH8b7XFrhOprofTWsyIlcjbdUd/ORcoBgQZCzRm5rDogHQ8ik/pEDgb9i5K9y5Qv5ZBND2l2yu5yUXijtTeoc+PeR8WVwXMoPCOkqX/tYMXsnkU60UE2XKbpOkXdnDbo+L+FNxVZgEI5FgmKGGX3VljRQ5hVrLNeeor1kbFmTxDrVKcUI6zHZmP1Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JY6G7Zw4BwNC1yuWnOW0WBa/F3fObAm1Ywhafa0+prA=;
 b=eLfPSq9J9uAfi5rPmUEPjm1a/ABx+chhogR3gLTnGG+8wAGG+GTadv4Jv9FcaKKUHXi0BAjaUfPvg7Xnv6yoSzvYqCf4ES4k5kC5kE663iQ8FooMjO1uCMeSFkO6P12yHLCstLC4+oF7pNuqpz1/HCym7sxQc+YfHlUvhXXhtx3OviyJ7EelteKKbWjF+s92mglJ4kwjpdEy5OxnGuRpr1SJSbyRyD2nd6x+FpqnN1EKd8hMLPrQ/8cuLZu4QBkRY2cZxIGC0aJV8MXESMjg/y6BR1ARbK/FhlihXqc08j2ZiU/hZ7nzsd0eXInW8RM224ahMDYBseD76ZJbkBRqpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JY6G7Zw4BwNC1yuWnOW0WBa/F3fObAm1Ywhafa0+prA=;
 b=IpJZL+5XVlAvQ8NehdNSOQhy+FmHvN/RB9w4slJyzZ5kNqPGEvfR73AnboQUs2jGBactI4/GxxYI34XujRYBeDDJ7QUjN1xLDYx8UHInVahukO2Eby4HbWHZJfdP+70jBc6lQvLaCOze9hou5sA317Mt8JcIrFblhkAESjqo80o=
Received: from BN9PR03CA0558.namprd03.prod.outlook.com (2603:10b6:408:138::23)
 by SJ0PR10MB7690.namprd10.prod.outlook.com (2603:10b6:a03:51a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.6; Wed, 7 Oct 2026
 10:07:59 +0000
Received: from BN3PEPF00022BD0.namprd03.prod.outlook.com
 (2603:10b6:408:138:cafe::8e) by BN9PR03CA0558.outlook.office365.com
 (2603:10b6:408:138::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 10:07:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF00022BD0.mail.protection.outlook.com (10.167.248.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 10:07:58 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:07:12 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:07:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 05:07:11 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [10.24.52.205])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697A77rI4171897;
	Wed, 7 Oct 2026 05:07:08 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tomi.valkeinen@ideasonboard.com>
CC: <devarsht@ti.com>, <sebin.francis@ti.com>, <praneeth@ti.com>,
        <u-kumar1@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <s-jain1@ti.com>
Subject: [PATCH v6 0/2] Add DSS support for AM62L SoC
Date: Wed, 7 Oct 2026 15:37:05 +0530
Message-ID: <20261007100707.1065564-1-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD0:EE_|SJ0PR10MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: e16121a4-7815-48d5-bbe8-08df245add02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|6133799003|18002099003|10067099003|3023799007|13003099007|56012099006;
X-Microsoft-Antispam-Message-Info:
	znCSHMIpazPn5jh84HJn+p2MnRqYqsMZA9QZj1zEZCzGw7dhbgZGUz5ulWFV8Pv+1xkMBcf8cxMUCg7P6KLpnyZDsurUUggSCizXK+/W4hEEIM6nFFMddGO0HTdP97V3DSaqj8G/sBEkdoWytnAFJM+12PUcGvFfr052bIx0C+aI984CPdW8P3NuCIwFOuMxxgFrD5e/Hi6KU2RMDf1blIUx1qhVoxKB0ZuR596joCQArSLgcc2qnd2Qbj1yufIvdjx/36WP2TsHIyHtfthhL1o5j/x5X52Hg9U/kVDlMdrOgaPI8Xa0WJXAcMyaN5NNqxlftMCY+j5wXM1j2UcQx9TeyGc+71z/6Wk4cSqHvgZcDsxmq0qg/NtYHjGEJjy2AKScV+vsKJtaeylYvHMzLFUr+w6EAWo3bRXJiq5hpOcwmS4k+gSo8+dK+xK+SPpc75L5h3sP2y8z+iOjqUdUyWkViNbARwNOS1XLX3muxr5Ka0PpfWOgQMWC9aY8AOTVnRrweRx5Ayq1P1SsRIaY9lTkt4MzwBQ5aQ/cKP+KWnjCYLwJIbNaNzTo+uamy1d+dhKxZ91GKNpHZ8YG3jeliFFvTVOVR8lHaHtaLY6/Fc4OFPPnFo4Ocwr2+qIfz0CeSQH1dUNhTqYiOx3zaFu3BA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(6133799003)(18002099003)(10067099003)(3023799007)(13003099007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7J+O0t+5CDI4pFSevHu3RTObNkvMnlzrzo6qScBMw8E/9wYvt4Eat1zlJs+cp3CLE7kT51K4a24icCGPlcY0J/2WkQahaM0TiRiNFeL3fjqFwbPepQjDU8gPdfMtnuFojReSz5ONcEqnkrmTMZ+sz15AdoMNcX5HRbOOCuPlLSR7qQiYgvkT9VZkVryJs55S58oJJWG39xAnUicUjycMS5XAIXj6lkhL7U6k5FgIsHufI/gA5J51QIjErJrbSkhWG5hxxllwb7Epv16pH+Pa0wqnBPJj5Ld8SZ7U576JCH9UChdJ30Zo5S9iBXX39nV7VwXONHddpU1OY5VbaV4isbIFbCsmvVePTNdMnZvzoQktw+tRof9CTUGiF9IdMqIt3MbjAbm5miouobZxlpbmmtdmgn6vltSa3OmIKdxxmV4+q5f9aCi3GoXIQOoJbES5
X-Exchange-RoutingPolicyChecked:
	KFhtW2Uu2boolsTkh7zqngnvnLvlPiM3sqlyRHlV5Qy8X/OVN1R2dt3MpNEcjPgyaunI8CVg1A/KsARXO1B/rRr0KpIEqwBd0T7jIz5L+Hzg8JvSXgaEDsvK0qpoiSyk7/oncAeCdU0vd7LKtRwj5WyBqxCazEX5y0+8CEuIL9ZOou95gyQhKXF59g4J+cE+ENYLd8feKufaHCrvffTxmJhM6sYZdhdIBUs08lLMOlH9IqAGPMW2XJUWHYxD4pCLzs0KrGZqC1GJwl478poEe14HhvzqyqZzCR1bnXaeaTN/9XKd7AvDuxiw9nTycpswXIWuJ6fjABgQPoH7XMAzXg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:07:58.2416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e16121a4-7815-48d5-bbe8-08df245add02
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB7690
X-Authority-Analysis: v=2.4 cv=as8nmiZV c=1 sm=1 tr=0 ts=6ac61a02 cx=c_pps
 a=w9jTARCbdo3hRO6w7Rsibg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=JLQES9i2aRcSmLGWkN0A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MCBTYWx0ZWRfX5du792ftdTNO
 CK9CJL6lPlxo3LzpPRri3kOr5snv+jDCWCUWi1Cw7zgyffGNZWxCvSXK6xz1ndfoCkm4zjVRSR+
 UJNGw+aSsge+/7T8JGXrpm+PhkckDEo=
X-Proofpoint-ORIG-GUID: xANwJWKad86Nq7Vuxc-H72uYLJAezs4I
X-Proofpoint-GUID: xANwJWKad86Nq7Vuxc-H72uYLJAezs4I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MCBTYWx0ZWRfX5cVtZAA5wy7P
 QkombqACxPi7XV00/yrFCJsy8N2uvI/C+n2ora7plxXpWsqF16b30rRofBRV+NaKWYrWzUmsWa4
 sgWsGhl5ebRy3EoP73CT5CsVBZdSW+jXdAv/6h5+8MSRw17TlR/mtSYiYpgRM1zwCeaEWvhkM9H
 rVlHNx3BukVyLjWjwxoV4/NfrZWcxu60sZ5ZIx+vBRQVaCOBnM7WHjezdbz77K/0pmDoFHLSFgw
 bIY08pFf+czOI8JUiFz3at6QXyPAYY1nDBj5D5o0b1LyD3ZzFOSO7JhZbXOcMdxHBOzVQqueMgi
 dKneIb+nKVxayZFgpHu21r38h1EHniXmnCHtbQgPhjF62hCTjX7o1RtPs0rPzJMHB4S3G8Wwe9S
 IpGzpgxI42huslIZAmxEmHk0HeFUjkGAoGlQtw5lFSuTqz+VvjLIv+m9J5Y35o2rTJrjGFKEfKU
 6W9h+dSuj14hDZV0kzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070040

This series:
- Adds base support to enable Display on TI AM62L[1] SoCs
- Adds base support for DSI output
- Enables HDMI output out-of-box

[1]: https://www.ti.com/product/AM62L
---
Changelog:
v5->v6:
- Drop bootph-all from parent node if child node use the property
- Pick R-by tag

Link to v5: https://lore.kernel.org/all/20260923192643.1362891-1-s-jain1@ti.com/

v4->v5:
- Move pinctrl from sii9022 to dss
- Add bootph-all property to all display related nodes
- Pick R-by tag

Link to v4: https://lore.kernel.org/all/20260811130822.2324438-1-s-jain1@ti.com/

v3->v4:
- Change pin configuration from PIN_OUTPUT to PIN_INPUT for
  VOUT_EXTPCLKIN

Link to v3: https://lore.kernel.org/all/20260723102519.3581762-1-s-jain1@ti.com/

v2->v3:
- Split patches for SoC and EVM related changes
- Add dsi ports node
- Correct styling issues
- Drop GIC

Link to v2: https://lore.kernel.org/all/20260528133529.3476499-1-s-jain1@ti.com/

v1->v2:
- Update the commit message to elaborate more about the patch.
- Add dpi-pinctrl configuration.
- Update the interrupt routing index for HDMI interrupt line

Link to v1: https://lore.kernel.org/all/20260513210942.692269-1-s-jain1@ti.com/
---
Devarsh Thakkar (2):
  arm64: dts: ti: k3-am62l-main: Add DSS & DSI related nodes
  arm64: dts: ti: k3-am62l3-evm: Add HDMI support

 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi | 60 ++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts  | 97 +++++++++++++++++++++++
 2 files changed, 157 insertions(+)

