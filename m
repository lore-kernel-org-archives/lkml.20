Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05AA3DEAE3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397312; cv=fail; b=AZhKF04V+7QivaM7De9W0ncQmzKWdnPL18uk5PeyZc30/9ee0ZrbsghHP2l+NBYRyLj/0er+ywwM8cM059sXuAyRmbN8PdaGYqEuWnwl4urfxvbZ9kP6HOumYnUTBlDdXc9z7X55LYK9BJHyEjbx4foWGmcneTZ+kmPc9LKstgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397312; c=relaxed/simple;
	bh=GtgOteyLUnfM48wvSxBbPcBn4jcYGPqlp7igMblZsZY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fI9cMgj3UvTbu+lOZqbIgXR5pJGuKv0uLsfY8OV2dc0kNHUMcsVzG6g2Fs9Sv2FFlDpzR3//FA/UkBNrNnsmeVkFt2lfmK0SePnSErYpDHyPKLnCTI4Qm4Tz0dpXovUWMERoLroHg2r4EBRsZE3z/XwOkL3XLCCp8KLDjJsaP9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=LoShDBUA; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=n2RYN7GW; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="LoShDBUA";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="n2RYN7GW"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4h4GD3015895;
	Mon, 19 Oct 2026 03:08:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=EroocoJWzdkZKR/SPwKKk8wS6yc5lBmWnTwWOzdSJ
	LI=; b=LoShDBUAegACukJTTgJf6uQlX0GgSYJ6ZMeYHykHod1HFKWf6RZUEuTLZ
	CzVYHqxL5vvzI9zGygnv5BIPIrlE+grSxeDeb32CkOvUJhfaMwQZD55zHcFZEBrd
	OdRd967UKPc5P4Ky3exjkvNiOnbR7mVhAAYjEqP79MXKA1p6h3OfVI8FDJfsvm+5
	UjpC0UVHTTFSKEtgJZtGn808AoNKDymh8641w3NZzvTur1yVmr+tnzH1PPPtlTH7
	MdS6A5Qb6H13QGjf1OK7+RiIJG20XAcqeem0LFhjbaiwVQMLdlckH/jU5i0SoBwO
	EjLwAqr6PXkOC+hudfHshLQCk3wEw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011036.outbound.protection.outlook.com [52.101.57.36])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hcr5p4k96-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 03:08:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akaRa/koBWPUnEszgbddC5/mZ8gqbJ0SNdeWigE431zS787i+Fqk+Dx1lCOHESJDtO2NIhploOGAhmH9NETTByXMFyVHVQfbjBVyid2Z/fABtEc5WSc5dOXB/VR/P/Zdj96vyk5eI7bcWyZK49NHhucLPdrP3KG0UVBEEJEjrIGX45ZXivOmDyXqZm6xog+C7K/hXKdOeG2boznYcAlzrd/XJKvmbuoijjh0CFNX70f72z6Sb+FKMhqYPOQbA/T7NlkpRzgblwfmXxBRFYs/GQJpMbhaK1MqYikNr5dIyoHuXFbc0XT4q4s9PJNf3Fh34lhMLkDpRvkNwdl9bDo6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EroocoJWzdkZKR/SPwKKk8wS6yc5lBmWnTwWOzdSJLI=;
 b=LL/CgVvnVyBdNCKVH18PFia9XIKRAuUl2gC3db5NO2HG0JmPVUQ7WaikXd9TzJx5vCqid6k+7YTFknYx36bzDEw5hAvm/RKQX3Mpcz2p/wi97rWntSfYIYiJSOa0hvxtAgLGQ41Hvrzu31DlglSauSu5Bj92pFvFR7dHWY3oBdRju5+Zw3kGL4fEqJl4Mnbr6RRVB3QaNgGZo1yJtbI5pRzgzLYt+ACRuIjFLEdvpnMbFxjvxCR6rdvEIyB/q0DeQhd2T6+AnpRq6+hlt85iN5zLmMXFszeEt+emGfLu8QVbn7fp8nKZf5Ym1Oz9osssHiDxPxg/yUR35R4XUR4XeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EroocoJWzdkZKR/SPwKKk8wS6yc5lBmWnTwWOzdSJLI=;
 b=n2RYN7GWbekYyUbDuH8xbUrpZxCDO4ht9jhb6u/OxSypUfWdPhDihehaQwj4dZuQTOi/Ky4572xOPSBJI8cGG0xCEmtej0DjHFv9/HwdEozTz6NSJLEYTX+Jo0Vpeh365svskq0nN+Yj8Cfcvlf9Egy7a+3FKLXVQStfYSlzt/Q=
Received: from SJ0P220CA0028.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::11)
 by LY0PR10MB001655.namprd10.prod.outlook.com (2603:10b6:404:22b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Mon, 19 Oct
 2026 08:08:14 +0000
Received: from CO1PEPF00012E63.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::92) by SJ0P220CA0028.outlook.office365.com
 (2603:10b6:a03:41b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 08:08:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E63.mail.protection.outlook.com (10.167.249.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 08:08:13 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 03:07:55 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 03:07:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 19 Oct 2026 03:07:54 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69J87aSs3342624;
	Mon, 19 Oct 2026 03:07:51 -0500
From: Moteen Shah <m-shah@ti.com>
To: <conor+dt@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <u-kumar1@ti.com>, <gehariprasath@ti.com>, <m-shah@ti.com>,
        <vigneshr@ti.com>, <afd@ti.com>, <a-limaye@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH 3/3] soc: ti: Add TDA54 SCM configuration syscon support
Date: Mon, 19 Oct 2026 13:37:36 +0530
Message-ID: <20261019080736.944127-4-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019080736.944127-1-m-shah@ti.com>
References: <20261019080736.944127-1-m-shah@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E63:EE_|LY0PR10MB001655:EE_
X-MS-Office365-Filtering-Correlation-Id: a5fb16e9-7b1a-4835-260a-08df2db81f92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|56012099006|5023799004|261009223027099003|261009221227099003|10067099003|18002099003|22082099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	aK86+Vv8cfiVUMmIH6+J+CcZnxQLLvocOdBAARzUwpZYOzNdu7LOk7cHcWIttrN11IYvUpLPHZ695KzoAx1le4nefcvtdy8rKnZnqtuOv4FxViEWEecJugpfKm35GnOKs3nPWS4wqzKHZSokSSJbKB7TpAjkkXB2XR0B7CKgAfhroZAIifG/QuYlTD/CpAhAIfWMbLWr9LlEOBD1QcFEVTCw2F7QmuLwwxSTYsnP7N5kkwMX6jShJ5hQSWqQSSNsTC2+fB1MVupm3qhk6qUiL2rIHCueRZrqlKx5p32BVJm8jJN+eZRwGeOdh3DklLGmkMLwmfdVcmhlCtjxPqWZFGfSELhrvyNxkMUB6ieccn9Y3Zb59oPW+v5MBecZRidryaS8tAVVpjM/kXIXhC/MNs+YgyFTvgOBKkCfpAxxJqL+TB/ggmETZ919WvcHtHP9riG87uaceOZ6QgvwhBiHenwAVPbW+hesQNLbhw1Clq6xLpS4CqaE6evGnoQ8zB7ifZLzvi+kmIfANE3GGRtliCvkK2mBJMs1Dru3jHe3ezCJ81ZshySJ9e3qU3JeP80clctZQfhxQJ90foSIzVwcraOEtMa9QiqNDP6zKvJHoK3DxCzgtKbZELNuUbKkdhB2NLle5pE1hbxRu5SEgGhf6A==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(56012099006)(5023799004)(261009223027099003)(261009221227099003)(10067099003)(18002099003)(22082099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	itSxd9HTB0PY/fSuUOxgNjdzO9rx/1S3NcBzxvSI2COU1MvSZWuTtML7LeFtQfKVZpuuk2eJCGVF0iNP5byKFfqx2DPr4/NlU1jrXxYL6CuaShGa4dKRhTGKCZX2me2V1hQ4X7KTCBkbF66DWl/jv8uQO3AQUbgjk1VjD9vpLgtLsD4CSJ8xwQhwexg+fpu7WADIUaEe3xgPRdOKlgBjydGvtagkMuDyAwlXz4SrfBKObUZzVYZuf/D/XJd7/kNCvUq3osd1Tf7GBAPBzvXhqaT4F5bY0t4Qnhcbw8Gq3q99hqm3MMi/h0zUuJ98JCM6en/0/tXiQvqTDwgLiLQ4nac4BiKbIcFC98fdHP7oWBCbGmabGov6rrm8wL/pa0Gf738ZJyDrB2PQWMiVNQ7JPitTFLjqBdq9FTbbT6exKPhQhxiVWIUNADTAw2EM8Y6l
X-Exchange-RoutingPolicyChecked:
	dXStNg8rDyJK+KaEG8CyL4HWW2EVeZknpSDOAjlYyuvtgE031GoBRhBcYviXRSzkXukeUg8u4GzB7szHdVKpIqX16O3zIVywwBbTwDawMdjnXUVhnDu3Pr4yq/Xsd/wTY4D5VUpxyYWaG2I4Rgs2XZlS+GYfrBFeWFI3KjhYthWnY1ARAGvfLM11gwijiorhYevOQHl3wykCKo3G1zgkgRsHitnQq41GvcSJMCznOFFfu956PPkGG3WXvCN9+oBYBncpay6Qe/kmomq7wr0VVACjEhoB5rXS0tb7lU41ZNBSStVmAAyUWKn4oCDWWATybRJdjkqv7xFa46A+WPIqew==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 08:08:13.5435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5fb16e9-7b1a-4835-260a-08df2db81f92
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E63.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR10MB001655
X-Proofpoint-ORIG-GUID: mdXI7fV6k2a6SLzi9zA25dSSb4x7EQYS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMiBTYWx0ZWRfX5XjTFEOKzTpB
 13Tx3PqkumdI35Dx3nHXN25vDJ1EkcvOuY2OoL8NABALRfx8cq6/67jBNZHY7UDVJwHwqoBSzdN
 GkzgxrmfgUA2FFn/c1jXiFffYDWMpl0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMiBTYWx0ZWRfXwdYK2ObW43Aw
 B//JXZZS9qvO1EXb2e8yLUfS9Zc/GLr1Mew7YnoE66HpM2exiK0e14TpwQ2H/C0FOalPxnojxBf
 rqsXt+qtAcqjklLeNFzYXYhqhS6XUXV2KqWX49J9A8OCpZSJWL33urO49cViAfja4dZPdBmakF6
 tK3ZP/Di4Whzff8nLDPuE8LqkyLlghfMUO3ilPe92eGcTy9F2VHNbbkVEVZFPaUU4zPwwt1pod8
 O96IfU6ersZZs8TF6udLmghX6qy68vS66RIV8mkjpVSixgfiRQIHwF5MFcBjInje/nkqwIqUtSv
 vPoqzZvfGk94waj0vPsb9mvUnfadefZPVezGzLZTFaqCN5vn92cowyV3c7M8nPMpl18exjF5SZS
 Q/iT7ofOXFOQ6uEknhZU6mLC8eiHk2pi475yfFGDnVBgUxqXAntL0+AsgI3Rj+RqXDN5IFr5S1L
 CHlNyImupobjSoHQN2Q==
X-Authority-Analysis: v=2.4 cv=Fp2QbGrq c=1 sm=1 tr=0 ts=6ad5cff0 cx=c_pps
 a=9qX6K/GtqWsr64T/c6OOlw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=hU-JDQfdbdCR0hOrdIMA:9
X-Proofpoint-GUID: mdXI7fV6k2a6SLzi9zA25dSSb4x7EQYS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190032

Add the TDA54 SCM configuration driver providing access to the SCM register
space through regmap/syscon.

The driver handles proxy-based register access and SCM unlock/claim
handling, and registers TDA54 SoC information using the common K3 SoC
info helper exported by k3-socinfo, for which the TDA54 part number is
added to the SoC ID table.

Default the option to m on ARCH_K3, so that the driver gets built for TDA54
boards without requiring a defconfig change.

Signed-off-by: Moteen Shah <m-shah@ti.com>
Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 drivers/soc/ti/Kconfig             |  16 +++
 drivers/soc/ti/Makefile            |   1 +
 drivers/soc/ti/k3-socinfo.c        |   2 +
 drivers/soc/ti/tda54-mcu-sysconf.c | 216 +++++++++++++++++++++++++++++
 4 files changed, 235 insertions(+)
 create mode 100644 drivers/soc/ti/tda54-mcu-sysconf.c

diff --git a/drivers/soc/ti/Kconfig b/drivers/soc/ti/Kconfig
index 163aadd589d3a..ea5da6722da29 100644
--- a/drivers/soc/ti/Kconfig
+++ b/drivers/soc/ti/Kconfig
@@ -82,6 +82,22 @@ config TI_PRUSS
 	  processors on various TI SoCs. It's safe to say N here if you're
 	  not interested in the PRU or if you are unsure.
 
+config TI_TDA54_MCU_SYSCONF
+	tristate "TI TDA54 SCM configuration controller"
+	depends on ARCH_K3 || COMPILE_TEST
+	depends on OF
+	default m if ARCH_K3
+	select MFD_SYSCON
+	select TI_K3_SOCINFO
+	help
+	  Support the SCM configuration controller found on TI TDA54.
+	  The controller provides a syscon regmap and is also the
+	  hardware access path used to obtain and register K3 SoC
+	  identification information.
+
+	  This driver can be built as a module, in which case the module
+	  will be called tda54-mcu-sysconf.
+
 endif # SOC_TI
 
 config TI_SCI_INTA_MSI_DOMAIN
diff --git a/drivers/soc/ti/Makefile b/drivers/soc/ti/Makefile
index cb800a745e66d..33f4ddca32ed6 100644
--- a/drivers/soc/ti/Makefile
+++ b/drivers/soc/ti/Makefile
@@ -11,4 +11,5 @@ obj-$(CONFIG_TI_SCI_INTA_MSI_DOMAIN)	+= ti_sci_inta_msi.o
 obj-$(CONFIG_TI_K3_RINGACC)		+= k3-ringacc.o
 obj-$(CONFIG_TI_K3_SOCINFO)		+= k3-socinfo.o
 obj-$(CONFIG_TI_PRUSS)			+= pruss.o
+obj-$(CONFIG_TI_TDA54_MCU_SYSCONF)	+= tda54-mcu-sysconf.o
 obj-$(CONFIG_POWER_AVS_OMAP)		+= smartreflex.o
diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
index 5fae03004e350..9869dd6358d1f 100644
--- a/drivers/soc/ti/k3-socinfo.c
+++ b/drivers/soc/ti/k3-socinfo.c
@@ -50,6 +50,7 @@
 #define JTAG_ID_PARTNO_AM62PX		0xBB9D
 #define JTAG_ID_PARTNO_J722S		0xBBA0
 #define JTAG_ID_PARTNO_AM62LX		0xBBA7
+#define JTAG_ID_PARTNO_TDA54		0xBBC1
 
 static const struct k3_soc_id {
 	unsigned int id;
@@ -66,6 +67,7 @@ static const struct k3_soc_id {
 	{ JTAG_ID_PARTNO_AM62PX, "AM62PX" },
 	{ JTAG_ID_PARTNO_J722S, "J722S" },
 	{ JTAG_ID_PARTNO_AM62LX, "AM62LX" },
+	{ JTAG_ID_PARTNO_TDA54, "TDA54" },
 };
 
 static const char * const j721e_rev_string_map[] = {
diff --git a/drivers/soc/ti/tda54-mcu-sysconf.c b/drivers/soc/ti/tda54-mcu-sysconf.c
new file mode 100644
index 0000000000000..8598080f6c48e
--- /dev/null
+++ b/drivers/soc/ti/tda54-mcu-sysconf.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TDA54 SCM Configuration syscon driver
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ */
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/soc/ti/k3-socinfo.h>
+#include <linux/types.h>
+
+/* Size of a single proxy window into the scm_conf register space */
+#define TDA54_SCM_CONF_PROXY_STRIDE		0x4000
+
+#define TDA54_JTAG_ID_REG_OFFSET		0x14
+
+#define TDA54_SCM_CONF_LOCK_KICK0_UNLOCK_VAL	0x68EF3490
+#define TDA54_SCM_CONF_LOCK_KICK1_UNLOCK_VAL	0xD172BC5A
+
+/*
+ * Claim registers start at 0x3100. Claim register i holds the claim bit
+ * for each of the 32 registers in the (i * TDA54_SCM_CONF_CLAIM_BLOCK_SIZE)
+ * .. (i * TDA54_SCM_CONF_CLAIM_BLOCK_SIZE + 0x7c) block, one bit per
+ * register, i.e. bit b of claim register i corresponds to the register at
+ * offset i * TDA54_SCM_CONF_CLAIM_BLOCK_SIZE + b * 4.
+ */
+#define TDA54_SCM_CONF_CLAIM_REG_STRIDE		0x4
+#define TDA54_SCM_CONF_CLAIM_REGS_PER_WORD	32
+#define TDA54_SCM_CONF_CLAIM_BLOCK_SIZE		\
+	(TDA54_SCM_CONF_CLAIM_REGS_PER_WORD * 0x4)
+
+/* Per-SoC register offset data (platform data) */
+struct tda54_scm_conf_data {
+	u32 lock_offset;
+	u32 claim_offset;
+	u32 claim_status_offset;
+};
+
+static const struct tda54_scm_conf_data tda54_scm_conf_data = {
+	.lock_offset		= 0x3008,
+	.claim_offset		= 0x3100,
+	.claim_status_offset	= 0x3300,
+};
+
+struct tda54_scm_conf {
+	void __iomem *base;
+	u32 proxy;
+	const struct tda54_scm_conf_data *pdata;
+};
+
+/*
+ * Make @reg writable through this proxy.
+ *
+ * Proxy 0 is the default access proxy for all unclaimed registers. Its claim
+ * bits are tied low, so it cannot claim anything and needs no claim to write;
+ * it can write @reg unless another proxy has claimed it, which is reported by
+ * the claim status.
+ *
+ * Any other proxy has to claim @reg first. Registers claimed by a proxy can no
+ * longer be written through any other proxy's address, until that proxy
+ * releases the claim. The claim status is set once any proxy owns @reg, so
+ * read the claim register back to check that the claim is held by this proxy.
+ */
+static int tda54_scm_conf_claim(struct tda54_scm_conf *scm, unsigned int reg)
+{
+	unsigned int block = reg / TDA54_SCM_CONF_CLAIM_BLOCK_SIZE;
+	unsigned int bit = (reg % TDA54_SCM_CONF_CLAIM_BLOCK_SIZE) /
+			   TDA54_SCM_CONF_CLAIM_REG_STRIDE;
+	unsigned int claim_reg = scm->pdata->claim_offset +
+				 block * TDA54_SCM_CONF_CLAIM_REG_STRIDE;
+	unsigned int status_reg = scm->pdata->claim_status_offset +
+				  block * TDA54_SCM_CONF_CLAIM_REG_STRIDE;
+	u32 val;
+
+	if (!scm->proxy) {
+		if (readl(scm->base + status_reg) & BIT(bit))
+			return -EBUSY;
+
+		return 0;
+	}
+
+	val = readl(scm->base + claim_reg);
+	val |= BIT(bit);
+	writel(val, scm->base + claim_reg);
+
+	if (!(readl(scm->base + claim_reg) & BIT(bit)))
+		return -EBUSY;
+
+	return 0;
+}
+
+static int tda54_scm_conf_reg_read(void *context, unsigned int reg,
+				   unsigned int *val)
+{
+	struct tda54_scm_conf *scm = context;
+
+	*val = readl(scm->base + reg);
+
+	return 0;
+}
+
+static int tda54_scm_conf_reg_write(void *context, unsigned int reg,
+				    unsigned int val)
+{
+	struct tda54_scm_conf *scm = context;
+	int ret;
+
+	ret = tda54_scm_conf_claim(scm, reg);
+	if (ret)
+		return ret;
+
+	writel(val, scm->base + reg);
+
+	return 0;
+}
+
+static const struct regmap_config tda54_scm_conf_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.reg_read = tda54_scm_conf_reg_read,
+	.reg_write = tda54_scm_conf_reg_write,
+};
+
+static int tda54_scm_conf_register_socinfo(struct device *dev,
+					   struct regmap *regmap)
+{
+	u32 jtag_id;
+	int ret;
+
+	ret = regmap_read(regmap, TDA54_JTAG_ID_REG_OFFSET, &jtag_id);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read JTAG ID\n");
+
+	return k3_socinfo_register(dev, jtag_id);
+}
+
+static int tda54_scm_conf_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tda54_scm_conf *scm;
+	struct regmap *regmap;
+	void __iomem *base;
+	int ret;
+
+	scm = devm_kzalloc(dev, sizeof(*scm), GFP_KERNEL);
+	if (!scm)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	if (of_property_read_u32(dev->of_node, "ti,proxy-id", &scm->proxy))
+		return dev_err_probe(dev, -ENODATA, "missing ti,proxy-id property\n");
+
+	if (scm->proxy >= 8)
+		return dev_err_probe(dev, -EINVAL,
+				     "ti,proxy-id must be between 0 and 7\n");
+
+	scm->base = base + scm->proxy * TDA54_SCM_CONF_PROXY_STRIDE;
+
+	/* Get register offsets from driver data (matched by compatible) */
+	scm->pdata = of_device_get_match_data(dev);
+
+	regmap = devm_regmap_init(dev, NULL, scm, &tda54_scm_conf_regmap_cfg);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	writel(TDA54_SCM_CONF_LOCK_KICK0_UNLOCK_VAL, scm->base + scm->pdata->lock_offset);
+	writel(TDA54_SCM_CONF_LOCK_KICK1_UNLOCK_VAL, scm->base + scm->pdata->lock_offset + 4);
+
+	/*
+	 * There is no way to unregister a syscon regmap, so publish it only
+	 * once nothing else in probe can fail.
+	 */
+	ret = of_syscon_register_regmap(dev->of_node, regmap);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register syscon regmap\n");
+
+	/*
+	 * SoC identification is informational, so a failure here must not fail
+	 * the probe. It is registered last and released through devres.
+	 */
+	ret = tda54_scm_conf_register_socinfo(dev, regmap);
+	if (ret)
+		dev_warn(dev, "SoC info not registered: %d\n", ret);
+
+	return 0;
+}
+
+static const struct of_device_id tda54_scm_conf_of_match[] = {
+	{ .compatible = "ti,tda54-mcu-scm-conf", .data = &tda54_scm_conf_data },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, tda54_scm_conf_of_match);
+
+static struct platform_driver tda54_scm_conf_driver = {
+	.probe = tda54_scm_conf_probe,
+	.driver = {
+		.name = "k3-tda54-scm-conf",
+		.of_match_table = tda54_scm_conf_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+module_platform_driver(tda54_scm_conf_driver);
+
+MODULE_AUTHOR("Moteen Shah <m-shah@ti.com>");
+MODULE_DESCRIPTION("TDA54 SCM Configuration syscon driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

