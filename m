Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124F34DE722
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784576; cv=fail; b=lMwl3KwEIhqlixURZKRfM/rnczcZ27tbbB/tGS/hSiJMM/KINPdZlm+X3asejmb0cbD2cdBrM+xwxFgUWJwQvAreeJ97UZwPWw8UKIOnoJ08JEg+4QvCZw87skruroEdsiQjfui8auYObC18GIesw2Z5MKfhZSXoyLq1k253sQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784576; c=relaxed/simple;
	bh=sPnbkXK+uHW+p1XIwi78bDNqzwWGyDLK2SQCfbdUkFw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t2U2uv7PIlJwCdrrWfSFiC1rttCBjoXC8j+deJ+7p5Mr3L/AoYvPiSizsym0IFQMr3X3P36vs3bGkMZablK6AstQeXLXshEPMt01A8aKG3ce60fqaZrMT3EEtzDDinbpmiWIIo8x9+mq2mfQ+/MsdTE4OW/+BBaLw7Mkx1uaqmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=IoVEEbDc; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=WLmRvtQT; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="IoVEEbDc";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="WLmRvtQT"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE1Jwu3057440;
	Wed, 30 Sep 2026 11:09:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=sYkzP86+/aeTVF0MVM4bXyvVG+iTjIL6M3Iy/Fof1
	C0=; b=IoVEEbDcT3zSbyX4fkhuUSl0TufvRFUXsSMsUDl4MZTbwteAd3Lc+28Mw
	y/u+fAo3tNL1cd27CkifYqbPwM13ENoy70Gax1WzEOz4Lm8Tc+nkRkt/zXYMfvsN
	DWS+JKKMFC6yS3tVV+sEJ//dmz+mB4iuBVoTvFeKdR++Uqsa2A7pOgRJ4zQPiMpM
	fcVRECnMWtqKXwbO3WUd9NHPySO2x9kklwV9Qs52YlW+33m9SNyVHT3zMsRinmJS
	8PzQNaMAs5N+RAy2tRo2FIRoylkN50h7esB5nlpFhTrNEd3EUowyj91ATx+tC6WG
	r8sAhCh7uElYX3wmVPLGOVtDGNjew==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011061.outbound.protection.outlook.com [52.101.62.61])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0m9fej77-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 11:08:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qBr7NL8asmMx1SEPqIj3ffZ/2scx0J++FX589dkiCrEhDw0jJOVvMY5vUVcYbPO13kIRc6dpSNhUKgoo5+OsUwRZNR9NdGH3tRUMYoQrtqj2pnqeqnHeZvOn6bSfHouGHdA5alVg0Yxl2qfCoNh3f8WVHYNdW9U6k+rFh6D41lt3VW0kpNG4Bvmn9KCxPLsqvvCeKwBeQhC240nZmv3q0SgqHAJMmDaqHiD5yBB61g4jvGqHlA3IeejTzGklrF8Ps5oYousyksxSjAnbLtrTn4dORATpynzYUoiV0BkDG3aZkG7UTEUZYxlUMDjbbMYMdX+pIBTvn7xVVf84eiKJYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYkzP86+/aeTVF0MVM4bXyvVG+iTjIL6M3Iy/Fof1C0=;
 b=MgXhLH30sb2JC0PwYv7rk+eGOF1W03Ye1DY4bvEEeAOTv+dfNADl8w9wk6nLkWa5gKG1ekhlh94PSL9esw1zuSq12M+IBgPZeKPRg9PDuI89YpOxjlHhC0dv41iPOaiJZhsKuShAjyg6U2yvp46uvn2eVaR7egkCGchlB5DYfEaXkJDkZ1SanNMEblI9rLj9b9EtaBKdENJtaJtw+LEJKp4VfrtXSN779MKfHfdt57GRIgOlsyRp6HbxPvDOQF9LfhJZwGKFvGRh22tA/lZQUCKJvBc9H0HmEKqZC7+igy2YHwNRc+jkYadruhoMbehk4x6enY8kKkeIb1wGtB5+Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYkzP86+/aeTVF0MVM4bXyvVG+iTjIL6M3Iy/Fof1C0=;
 b=WLmRvtQTf2QdldViSxCUQoc51XaX2LAyhF1sH6bI+7DKbN240GFVHBP+Gy2ES+T5A323+y9e82ZsFaj/PJm9Eo9Us3ssGyiIIO8oSHWMU8suMnqrHmerii2nJ/8YsDuldfOjtCIwHe1tv3AHwUqJjCt/X2LQmKAIaSfbW5MlwoA=
Received: from MN2PR14CA0002.namprd14.prod.outlook.com (2603:10b6:208:23e::7)
 by DS0PR10MB7221.namprd10.prod.outlook.com (2603:10b6:8:f1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Wed, 30 Sep
 2026 16:08:13 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:208:23e:cafe::8d) by MN2PR14CA0002.outlook.office365.com
 (2603:10b6:208:23e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 16:08:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.3 via Frontend Transport; Wed, 30 Sep 2026 16:08:11 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:07:16 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:07:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:07:16 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UG68WO3425232;
	Wed, 30 Sep 2026 11:07:13 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v2 21/22] firmware: ti: ti_sci_rm: Move rm ops into its own file
Date: Wed, 30 Sep 2026 21:36:06 +0530
Message-ID: <20260930160607.2674980-22-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930160607.2674980-1-b-padhi@ti.com>
References: <20260930160607.2674980-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|DS0PR10MB7221:EE_
X-MS-Office365-Filtering-Correlation-Id: 22e27bc7-c9ec-48f6-18cf-08df1f0d06c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|18002099003|22082099003|13003099007|3023799007|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	+VvQeLXaFlPUA3h6292YdDwpa9ue4JL48y/NUvO/NV7S9Ui+El98q746MgHx/cNWLlRoNHXw0p1qBtPFXWTS+4Jfrin0bitD7ELcnBIWlR69SA5mLWnehWBGGdPq13XwS46ldOvERD5NLPAdqO63ee0TNBb2Wjg4mSlZfhNZP5tI0zj+D76hfrvWztZXao6XtiwHGsO7sJiDJUHfpfwnNO6KeQTbdsKFnBzCv5PhaxtGDVmlN1PBHNY9qJeBdypepfg9jdx7vFdqx6VQC0cLbaQrkTcd6XWKYHEsTSEXcluopVBftVF98Uio3w8NzvU99O9ID4b0FzvJFR0f2f2eXRvGQwIqAqSvE0xtfnaLQgFV2FKPW4VGVtTC322TLb9ZSk865paJbTYx9e7Mafk61ZdAFaThp0i01coaGPPUpsJtJ2MwBjdOXmWhGtQsL0g2pC6BnLPqSHh4WFU06RC9mKDZ3/GkbK0GCj07oRrrL2vT7sI3s/L9L9kCU0aXBY9lCINxXYWeI7pnpyHRc7YNqEGUikeeokz1aGCHcbfyNeXDQHQ/0aa0chQgZAi1dc8WwPCcv6hq/I8iw6oFj9xuhOJttAT1IH9kLdjp1wAYyCRr8YcHzro6JEq/ZHxXMzrLOlt/BM4BIrj5lot/GqmSJQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(13003099007)(3023799007)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cTvtCvVFVGT6tQLvb3u73vTi5gUApJ8SFGDCkIAyDBkCglV4fMBwMsUzivU+Rm+2/DhbqyFd3aqfZM8J85fZMdVAeRSXWCVF2ZLZbQ+bTNavYNLsZ8KC/tiFY4q+sP/VzDhzyM1dlWjj+oH9QXr+sy9NIeEZNxD2n0wRnklduueAq+6jankJ3viltQWe38vJWQYCJ7ygfiKRDl56Qhx3Eckb/8JLebzdqay8ivb9TtYTNCn6io6alXC1iqIH4MU/niH23H2Uz82kh1jw3adbw2wB1R0nTv4BShS7PL9LYyuzHyyX0OPW1xYbCERtdgLXdidOYbA4yH85dF52hSFSUqFGrYYWpjO9wmsJqiWhh0fv6DwgFhwvgFvBvzo0f89P22sQIMh3WsSK/km9W0lmpy7DFyQ0jFVXRNOzu/S4oponOrdoZ1M5oyabHZ5X+f0/
X-Exchange-RoutingPolicyChecked:
	gsuKF+Xv/Pd0EIWOG9lELb7Oc4LUvTWotyxJXG7wiEMjmL2/e7H1LQ0rcqwXbw0YsHBtHd6ApNycxy6IuEmarj6fPTfX/xCYSo5P2GiGOhM/BmmFPS2K8noxK8W/wcmwXVCT2hNe4Op+j5Ncc1pqpJIiWwZmqaA0lybGnSToc0ophQwqjeHU0wxXwuEVfys+T7c7EUquOEibCtJqSIb+fhl0Ypr8va5U4PYuwy1Zmng/3/pECUAQ5piCBYdbzYuaWMq79JeLV8UfV6OV89BvqaETpH/itfih5DILyu/kJkAoYi8ZzhNRm5E+aRlsRZW2SiMbly+SL5i6dDdeA8WFhw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:08:11.7623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e27bc7-c9ec-48f6-18cf-08df1f0d06c9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7221
X-Authority-Analysis: v=2.4 cv=VfRir1p9 c=1 sm=1 tr=0 ts=6abd341b cx=c_pps
 a=WxwGY4H08PlrDVivH1wjUg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=enSiOKjvgJfWrRZtQzgA:9
X-Proofpoint-GUID: o17R5-maUwZr1c3F_ojHOFah7DJM5w6O
X-Proofpoint-ORIG-GUID: o17R5-maUwZr1c3F_ojHOFah7DJM5w6O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfXyNnSlwAxHekE
 wHKXvkuaILLWy0GqSiUKDqgXZX7nlh0Iq2K0ZU2lwEAESMHYZNP7myhLN1jcSAhtIixcbFcS/WT
 Z2lBdYK81SjGtBYnngKcR4jiRKptuST0KXMlNQlo+Hr2aseHS1EuCF9ldJu0aCk7JZrwrcGwwng
 YjS9s8Z5aoBwNzawS+pcBqUyfhc8QB+Qf6bqmKejif20hiC4FlWtxkvGRAEmPDpAMidnOKMmrji
 XMETmp9027QimLsZtPQGHD97YKvxSCCLc0c3PWRvVX/egJpkyyRiCRJWXRO93vbae4TY9CsNZIm
 3C8EgvdCrmZKgiIP0/VQTEWxqzHA1xvypRQ7ew2bLiIdOPHbUEpBfEXXbbYPkW4bYwEwDHGJfgc
 +8c8RXYruj54qdcrkCm+cNARBjIHjQvi4UERpshHmKNIELZWCogV/XFDajcnI5sVbLVVjuu5lPf
 cGVkf28fTW1xwS8bdGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfXyW+Lx/zbzVg+
 ZQC8ILLksQH8NDnBErK065wWx4bqlB/tjePbEEpG3W5MpXC84t2zRIfvFSaTbNL2ipZipCPypvK
 OnG6Vl/wS0jf22QEIEik7uUYY2H/G6o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

From: Andrew Davis <afd@ti.com>

Extract the resource management operations related functions and
services from ti_sci_core.c into its own file. This breaks down the
single large file into smaller logical files for better readability
and maintenance.

Signed-off-by: Andrew Davis <afd@ti.com>
Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. Include headers: <linux/bitmap.h>, <linux/of.h> and <linux/slab.h> to
be able to build ti_sci_rm.c standalone for arm32 platforms like
keystone.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-22-b-padhi@ti.com/

 drivers/firmware/ti/Makefile      |   1 +
 drivers/firmware/ti/ti_sci.h      |  20 +
 drivers/firmware/ti/ti_sci_core.c | 875 +---------------------------
 drivers/firmware/ti/ti_sci_rm.c   | 910 ++++++++++++++++++++++++++++++
 4 files changed, 936 insertions(+), 870 deletions(-)
 create mode 100644 drivers/firmware/ti/ti_sci_rm.c

diff --git a/drivers/firmware/ti/Makefile b/drivers/firmware/ti/Makefile
index bbfe73587a3c7..7d9c2a73bf5a6 100644
--- a/drivers/firmware/ti/Makefile
+++ b/drivers/firmware/ti/Makefile
@@ -4,4 +4,5 @@ ti_sci-y			:= ti_sci_core.o
 ti_sci-y			+= ti_sci_clock.o
 ti_sci-y			+= ti_sci_device.o
 ti_sci-y			+= ti_sci_pm.o
+ti_sci-y			+= ti_sci_rm.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
diff --git a/drivers/firmware/ti/ti_sci.h b/drivers/firmware/ti/ti_sci.h
index 7a707c632276e..e8d6589eec0e9 100644
--- a/drivers/firmware/ti/ti_sci.h
+++ b/drivers/firmware/ti/ti_sci.h
@@ -112,6 +112,7 @@ struct ti_sci_info {
 	int users;
 };
 
+#define cl_to_ti_sci_info(c)	container_of(c, struct ti_sci_info, cl)
 #define handle_to_ti_sci_info(h) container_of(h, struct ti_sci_info, handle)
 
 /* Generic Messages */
@@ -906,6 +907,16 @@ struct ti_sci_msg_req_manage_irq {
 	u8 secondary_host;
 } __packed;
 
+/**
+ * struct ti_sci_irq - Description of allocated irqs
+ * @node: Link to hash table
+ * @desc: Description of the irq
+ */
+struct ti_sci_irq {
+	struct hlist_node node;
+	struct ti_sci_msg_req_manage_irq desc;
+};
+
 /**
  * struct ti_sci_msg_rm_ring_cfg_req - Configure a Navigator Subsystem ring
  *
@@ -1667,5 +1678,14 @@ int ti_sci_do_xfer(const struct ti_sci_handle *handle,
 void ti_sci_setup_device_ops(struct ti_sci_dev_ops *dops);
 void ti_sci_setup_clock_ops(struct ti_sci_clk_ops *cops);
 void ti_sci_setup_pm_ops(struct ti_sci_pm_ops *pmops);
+void ti_sci_setup_rm_core_ops(struct ti_sci_rm_core_ops *rm_core_ops);
+void ti_sci_setup_rm_irq_ops(struct ti_sci_rm_irq_ops *iops);
+void ti_sci_setup_rm_ringacc_ops(struct ti_sci_rm_ringacc_ops *rops);
+void ti_sci_setup_rm_psil_ops(struct ti_sci_rm_psil_ops *psilops);
+void ti_sci_setup_rm_udmap_ops(struct ti_sci_rm_udmap_ops *udmap_ops);
+int ti_sci_manage_irq(const struct ti_sci_handle *handle, u32 valid_params,
+		      u16 src_id, u16 src_index, u16 dst_id, u16 dst_host_irq,
+		      u16 ia_id, u16 vint, u16 global_event, u8 vint_status_bit,
+		      u8 s_host, u16 type);
 
 #endif /* __TI_SCI_H */
diff --git a/drivers/firmware/ti/ti_sci_core.c b/drivers/firmware/ti/ti_sci_core.c
index 60d0d64ac4ae8..b1345e06341db 100644
--- a/drivers/firmware/ti/ti_sci_core.c
+++ b/drivers/firmware/ti/ti_sci_core.c
@@ -35,18 +35,6 @@ static LIST_HEAD(ti_sci_list);
 /* Protection for the entire list */
 static DEFINE_MUTEX(ti_sci_list_mutex);
 
-/**
- * struct ti_sci_irq - Description of allocated irqs
- * @node: Link to hash table
- * @desc: Description of the irq
- */
-struct ti_sci_irq {
-	struct hlist_node node;
-	struct ti_sci_msg_req_manage_irq desc;
-};
-
-#define cl_to_ti_sci_info(c)	container_of(c, struct ti_sci_info, cl)
-
 #ifdef CONFIG_DEBUG_FS
 
 /**
@@ -632,655 +620,6 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 	return 0;
 }
 
-/**
- * ti_sci_get_resource_range - Helper to get a range of resources assigned
- *			       to a host. Resource is uniquely identified by
- *			       type and subtype.
- * @handle:		Pointer to TISCI handle.
- * @dev_id:		TISCI device ID.
- * @subtype:		Resource assignment subtype that is being requested
- *			from the given device.
- * @s_host:		Host processor ID to which the resources are allocated
- * @desc:		Pointer to ti_sci_resource_desc to be updated with the
- *			resource range start index and number of resources
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
-				     u32 dev_id, u8 subtype, u8 s_host,
-				     struct ti_sci_resource_desc *desc)
-{
-	struct ti_sci_msg_resp_get_resource_range resp;
-	struct ti_sci_msg_req_get_resource_range req;
-	int ret = 0;
-
-	if (!desc)
-		return -EINVAL;
-
-	req.secondary_host = s_host;
-	req.type = dev_id & MSG_RM_RESOURCE_TYPE_MASK;
-	req.subtype = subtype & MSG_RM_RESOURCE_SUBTYPE_MASK;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_RESOURCE_RANGE,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	if (!resp.range_num && !resp.range_num_sec) {
-		/* Neither of the two resource range is valid */
-		ret = -ENODEV;
-	} else {
-		desc->start = resp.range_start;
-		desc->num = resp.range_num;
-		desc->start_sec = resp.range_start_sec;
-		desc->num_sec = resp.range_num_sec;
-	}
-
-	return ret;
-}
-
-/**
- * ti_sci_cmd_get_resource_range - Get a range of resources assigned to host
- *				   that is same as ti sci interface host.
- * @handle:		Pointer to TISCI handle.
- * @dev_id:		TISCI device ID.
- * @subtype:		Resource assignment subtype that is being requested
- *			from the given device.
- * @desc:		Pointer to ti_sci_resource_desc to be updated with the
- *			resource range start index and number of resources
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_get_resource_range(const struct ti_sci_handle *handle,
-					 u32 dev_id, u8 subtype,
-					 struct ti_sci_resource_desc *desc)
-{
-	return ti_sci_get_resource_range(handle, dev_id, subtype,
-					 TI_SCI_IRQ_SECONDARY_HOST_INVALID,
-					 desc);
-}
-
-/**
- * ti_sci_cmd_get_resource_range_from_shost - Get a range of resources
- *					      assigned to a specified host.
- * @handle:		Pointer to TISCI handle.
- * @dev_id:		TISCI device ID.
- * @subtype:		Resource assignment subtype that is being requested
- *			from the given device.
- * @s_host:		Host processor ID to which the resources are allocated
- * @desc:		Pointer to ti_sci_resource_desc to be updated with the
- *			resource range start index and number of resources
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static
-int ti_sci_cmd_get_resource_range_from_shost(const struct ti_sci_handle *handle,
-					     u32 dev_id, u8 subtype, u8 s_host,
-					     struct ti_sci_resource_desc *desc)
-{
-	return ti_sci_get_resource_range(handle, dev_id, subtype, s_host, desc);
-}
-
-/**
- * ti_sci_manage_irq() - Helper api to configure/release the irq route between
- *			 the requested source and destination
- * @handle:		Pointer to TISCI handle.
- * @valid_params:	Bit fields defining the validity of certain params
- * @src_id:		Device ID of the IRQ source
- * @src_index:		IRQ source index within the source device
- * @dst_id:		Device ID of the IRQ destination
- * @dst_host_irq:	IRQ number of the destination device
- * @ia_id:		Device ID of the IA, if the IRQ flows through this IA
- * @vint:		Virtual interrupt to be used within the IA
- * @global_event:	Global event number to be used for the requesting event
- * @vint_status_bit:	Virtual interrupt status bit to be used for the event
- * @s_host:		Secondary host ID to which the irq/event is being
- *			requested for.
- * @type:		Request type irq set or release.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
-			     u32 valid_params, u16 src_id, u16 src_index,
-			     u16 dst_id, u16 dst_host_irq, u16 ia_id, u16 vint,
-			     u16 global_event, u8 vint_status_bit, u8 s_host,
-			     u16 type)
-{
-	struct ti_sci_msg_req_manage_irq req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.valid_params = valid_params;
-	req.src_id = src_id;
-	req.src_index = src_index;
-	req.dst_id = dst_id;
-	req.dst_host_irq = dst_host_irq;
-	req.ia_id = ia_id;
-	req.vint = vint;
-	req.global_event = global_event;
-	req.vint_status_bit = vint_status_bit;
-	req.secondary_host = s_host;
-
-	ret = ti_sci_do_xfer(handle, type, TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_irq_hash() - Helper API to compute irq hash for the hash table.
- * @irq:	irq to hash
- *
- * Return: the computed hash value.
- */
-static int ti_sci_irq_hash(struct ti_sci_msg_req_manage_irq *irq)
-{
-	return irq->src_id ^ irq->src_index;
-}
-
-/**
- * ti_sci_irq_equal() - Helper API to compare two irqs (generic headers are not
- *                       compared)
- * @irq_a:	irq_a to compare
- * @irq_b:	irq_b to compare
- *
- * Return: true if the two irqs are equal, else false.
- */
-static bool ti_sci_irq_equal(struct ti_sci_msg_req_manage_irq *irq_a,
-			     struct ti_sci_msg_req_manage_irq *irq_b)
-{
-	return !memcmp(&irq_a->valid_params, &irq_b->valid_params,
-		       sizeof(*irq_a) - sizeof(irq_a->hdr));
-}
-
-/**
- * ti_sci_set_irq() - Helper api to configure the irq route between the
- *		      requested source and destination
- * @handle:		Pointer to TISCI handle.
- * @valid_params:	Bit fields defining the validity of certain params
- * @src_id:		Device ID of the IRQ source
- * @src_index:		IRQ source index within the source device
- * @dst_id:		Device ID of the IRQ destination
- * @dst_host_irq:	IRQ number of the destination device
- * @ia_id:		Device ID of the IA, if the IRQ flows through this IA
- * @vint:		Virtual interrupt to be used within the IA
- * @global_event:	Global event number to be used for the requesting event
- * @vint_status_bit:	Virtual interrupt status bit to be used for the event
- * @s_host:		Secondary host ID to which the irq/event is being
- *			requested for.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_set_irq(const struct ti_sci_handle *handle, u32 valid_params,
-			  u16 src_id, u16 src_index, u16 dst_id,
-			  u16 dst_host_irq, u16 ia_id, u16 vint,
-			  u16 global_event, u8 vint_status_bit, u8 s_host)
-{
-	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
-	struct ti_sci_msg_req_manage_irq *desc;
-	struct ti_sci_irq *irq;
-	int ret;
-
-	/* Lock for set_irq() and free_irq() to keep the IRQ hash list consistent */
-	guard(mutex)(&info->irq_lock);
-
-	pr_debug("%s: IRQ set with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d,via ia_id = %d, vint = %d, global event = %d,status_bit = %d\n",
-		 __func__, valid_params, src_id, src_index,
-		 dst_id, dst_host_irq, ia_id, vint, global_event,
-		 vint_status_bit);
-
-	ret = ti_sci_manage_irq(handle, valid_params, src_id, src_index,
-				dst_id, dst_host_irq, ia_id, vint,
-				global_event, vint_status_bit, s_host,
-				TI_SCI_MSG_SET_IRQ);
-
-	if (ret || !(info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST))
-		goto end;
-
-	irq = kzalloc_obj(*irq);
-	if (!irq) {
-		ti_sci_manage_irq(handle, valid_params, src_id, src_index,
-				  dst_id, dst_host_irq, ia_id, vint,
-				  global_event, vint_status_bit, s_host,
-				  TI_SCI_MSG_FREE_IRQ);
-		ret = -ENOMEM;
-		goto end;
-	}
-
-	desc = &irq->desc;
-	desc->valid_params = valid_params;
-	desc->src_id = src_id;
-	desc->src_index = src_index;
-	desc->dst_id = dst_id;
-	desc->dst_host_irq = dst_host_irq;
-	desc->ia_id = ia_id;
-	desc->vint = vint;
-	desc->global_event = global_event;
-	desc->vint_status_bit = vint_status_bit;
-	desc->secondary_host = s_host;
-
-	hash_add(info->irqs, &irq->node, ti_sci_irq_hash(desc));
-
-end:
-	return ret;
-}
-
-/**
- * ti_sci_free_irq() - Helper api to free the irq route between the
- *			   requested source and destination
- * @handle:		Pointer to TISCI handle.
- * @valid_params:	Bit fields defining the validity of certain params
- * @src_id:		Device ID of the IRQ source
- * @src_index:		IRQ source index within the source device
- * @dst_id:		Device ID of the IRQ destination
- * @dst_host_irq:	IRQ number of the destination device
- * @ia_id:		Device ID of the IA, if the IRQ flows through this IA
- * @vint:		Virtual interrupt to be used within the IA
- * @global_event:	Global event number to be used for the requesting event
- * @vint_status_bit:	Virtual interrupt status bit to be used for the event
- * @s_host:		Secondary host ID to which the irq/event is being
- *			requested for.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_free_irq(const struct ti_sci_handle *handle, u32 valid_params,
-			   u16 src_id, u16 src_index, u16 dst_id,
-			   u16 dst_host_irq, u16 ia_id, u16 vint,
-			   u16 global_event, u8 vint_status_bit, u8 s_host)
-{
-	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
-	struct ti_sci_msg_req_manage_irq irq_desc;
-	struct device *dev = info->dev;
-	struct ti_sci_irq *this_irq;
-	struct hlist_node *tmp_node;
-	int ret;
-
-	guard(mutex)(&info->irq_lock);
-
-	pr_debug("%s: IRQ release with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d,via ia_id = %d, vint = %d, global event = %d,status_bit = %d\n",
-		 __func__, valid_params, src_id, src_index,
-		 dst_id, dst_host_irq, ia_id, vint, global_event,
-		 vint_status_bit);
-
-	ret = ti_sci_manage_irq(handle, valid_params, src_id, src_index,
-				dst_id, dst_host_irq, ia_id, vint,
-				global_event, vint_status_bit, s_host,
-				TI_SCI_MSG_FREE_IRQ);
-
-	if (ret || !(info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST))
-		goto end;
-
-	irq_desc.valid_params = valid_params;
-	irq_desc.src_id = src_id;
-	irq_desc.src_index = src_index;
-	irq_desc.dst_id = dst_id;
-	irq_desc.dst_host_irq = dst_host_irq;
-	irq_desc.ia_id = ia_id;
-	irq_desc.vint = vint;
-	irq_desc.global_event = global_event;
-	irq_desc.vint_status_bit = vint_status_bit;
-	irq_desc.secondary_host = s_host;
-
-	hash_for_each_possible_safe(info->irqs, this_irq, tmp_node, node,
-				    ti_sci_irq_hash(&irq_desc)) {
-		if (ti_sci_irq_equal(&irq_desc, &this_irq->desc)) {
-			hlist_del(&this_irq->node);
-			kfree(this_irq);
-			goto end;
-		}
-	}
-
-	dev_warn(dev, "%s: should not be here, IRQ was not found in hash list\n",
-		 __func__);
-
-end:
-	return ret;
-}
-
-/**
- * ti_sci_cmd_set_irq() - Configure a host irq route between the requested
- *			  source and destination.
- * @handle:		Pointer to TISCI handle.
- * @src_id:		Device ID of the IRQ source
- * @src_index:		IRQ source index within the source device
- * @dst_id:		Device ID of the IRQ destination
- * @dst_host_irq:	IRQ number of the destination device
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_set_irq(const struct ti_sci_handle *handle, u16 src_id,
-			      u16 src_index, u16 dst_id, u16 dst_host_irq)
-{
-	u32 valid_params = MSG_FLAG_DST_ID_VALID | MSG_FLAG_DST_HOST_IRQ_VALID;
-
-	return ti_sci_set_irq(handle, valid_params, src_id, src_index, dst_id,
-			      dst_host_irq, 0, 0, 0, 0, 0);
-}
-
-/**
- * ti_sci_cmd_set_event_map() - Configure an event based irq route between the
- *				requested source and Interrupt Aggregator.
- * @handle:		Pointer to TISCI handle.
- * @src_id:		Device ID of the IRQ source
- * @src_index:		IRQ source index within the source device
- * @ia_id:		Device ID of the IA, if the IRQ flows through this IA
- * @vint:		Virtual interrupt to be used within the IA
- * @global_event:	Global event number to be used for the requesting event
- * @vint_status_bit:	Virtual interrupt status bit to be used for the event
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_set_event_map(const struct ti_sci_handle *handle,
-				    u16 src_id, u16 src_index, u16 ia_id,
-				    u16 vint, u16 global_event,
-				    u8 vint_status_bit)
-{
-	u32 valid_params = MSG_FLAG_IA_ID_VALID | MSG_FLAG_VINT_VALID |
-			   MSG_FLAG_GLB_EVNT_VALID |
-			   MSG_FLAG_VINT_STS_BIT_VALID;
-
-	return ti_sci_set_irq(handle, valid_params, src_id, src_index, 0, 0,
-			      ia_id, vint, global_event, vint_status_bit, 0);
-}
-
-/**
- * ti_sci_cmd_free_irq() - Free a host irq route between the between the
- *			   requested source and destination.
- * @handle:		Pointer to TISCI handle.
- * @src_id:		Device ID of the IRQ source
- * @src_index:		IRQ source index within the source device
- * @dst_id:		Device ID of the IRQ destination
- * @dst_host_irq:	IRQ number of the destination device
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_free_irq(const struct ti_sci_handle *handle, u16 src_id,
-			       u16 src_index, u16 dst_id, u16 dst_host_irq)
-{
-	u32 valid_params = MSG_FLAG_DST_ID_VALID | MSG_FLAG_DST_HOST_IRQ_VALID;
-
-	return ti_sci_free_irq(handle, valid_params, src_id, src_index, dst_id,
-			       dst_host_irq, 0, 0, 0, 0, 0);
-}
-
-/**
- * ti_sci_cmd_free_event_map() - Free an event map between the requested source
- *				 and Interrupt Aggregator.
- * @handle:		Pointer to TISCI handle.
- * @src_id:		Device ID of the IRQ source
- * @src_index:		IRQ source index within the source device
- * @ia_id:		Device ID of the IA, if the IRQ flows through this IA
- * @vint:		Virtual interrupt to be used within the IA
- * @global_event:	Global event number to be used for the requesting event
- * @vint_status_bit:	Virtual interrupt status bit to be used for the event
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_free_event_map(const struct ti_sci_handle *handle,
-				     u16 src_id, u16 src_index, u16 ia_id,
-				     u16 vint, u16 global_event,
-				     u8 vint_status_bit)
-{
-	u32 valid_params = MSG_FLAG_IA_ID_VALID |
-			   MSG_FLAG_VINT_VALID | MSG_FLAG_GLB_EVNT_VALID |
-			   MSG_FLAG_VINT_STS_BIT_VALID;
-
-	return ti_sci_free_irq(handle, valid_params, src_id, src_index, 0, 0,
-			       ia_id, vint, global_event, vint_status_bit, 0);
-}
-
-/**
- * ti_sci_cmd_rm_ring_cfg() - Configure a NAVSS ring
- * @handle:	Pointer to TI SCI handle.
- * @params:	Pointer to ti_sci_msg_rm_ring_cfg ring config structure
- *
- * Return: 0 if all went well, else returns appropriate error value.
- *
- * See @ti_sci_msg_rm_ring_cfg and @ti_sci_msg_rm_ring_cfg_req for
- * more info.
- */
-static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
-				  const struct ti_sci_msg_rm_ring_cfg *params)
-{
-	struct ti_sci_msg_rm_ring_cfg_req req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.valid_params = params->valid_params;
-	req.nav_id = params->nav_id;
-	req.index = params->index;
-	req.addr_lo = params->addr_lo;
-	req.addr_hi = params->addr_hi;
-	req.count = params->count;
-	req.mode = params->mode;
-	req.size = params->size;
-	req.order_id = params->order_id;
-	req.virtid = params->virtid;
-	req.asel = params->asel;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_RM_RING_CFG,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_rm_psil_pair() - Pair PSI-L source to destination thread
- * @handle:	Pointer to TI SCI handle.
- * @nav_id:	Device ID of Navigator Subsystem which should be used for
- *		pairing
- * @src_thread:	Source PSI-L thread ID
- * @dst_thread: Destination PSI-L thread ID
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
-				   u32 nav_id, u32 src_thread, u32 dst_thread)
-{
-	struct ti_sci_msg_psil_pair req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.nav_id = nav_id;
-	req.src_thread = src_thread;
-	req.dst_thread = dst_thread;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_RM_PSIL_PAIR,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_rm_psil_unpair() - Unpair PSI-L source from destination thread
- * @handle:	Pointer to TI SCI handle.
- * @nav_id:	Device ID of Navigator Subsystem which should be used for
- *		unpairing
- * @src_thread:	Source PSI-L thread ID
- * @dst_thread:	Destination PSI-L thread ID
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
-				     u32 nav_id, u32 src_thread, u32 dst_thread)
-{
-	struct ti_sci_msg_psil_unpair req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.nav_id = nav_id;
-	req.src_thread = src_thread;
-	req.dst_thread = dst_thread;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_RM_PSIL_UNPAIR,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_rm_udmap_tx_ch_cfg() - Configure a UDMAP TX channel
- * @handle:	Pointer to TI SCI handle.
- * @params:	Pointer to ti_sci_msg_rm_udmap_tx_ch_cfg TX channel config
- *		structure
- *
- * Return: 0 if all went well, else returns appropriate error value.
- *
- * See @ti_sci_msg_rm_udmap_tx_ch_cfg and @ti_sci_msg_rm_udmap_tx_ch_cfg_req for
- * more info.
- */
-static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
-			const struct ti_sci_msg_rm_udmap_tx_ch_cfg *params)
-{
-	struct ti_sci_msg_rm_udmap_tx_ch_cfg_req req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.valid_params = params->valid_params;
-	req.nav_id = params->nav_id;
-	req.index = params->index;
-	req.tx_pause_on_err = params->tx_pause_on_err;
-	req.tx_filt_einfo = params->tx_filt_einfo;
-	req.tx_filt_pswords = params->tx_filt_pswords;
-	req.tx_atype = params->tx_atype;
-	req.tx_chan_type = params->tx_chan_type;
-	req.tx_supr_tdpkt = params->tx_supr_tdpkt;
-	req.tx_fetch_size = params->tx_fetch_size;
-	req.tx_credit_count = params->tx_credit_count;
-	req.txcq_qnum = params->txcq_qnum;
-	req.tx_priority = params->tx_priority;
-	req.tx_qos = params->tx_qos;
-	req.tx_orderid = params->tx_orderid;
-	req.fdepth = params->fdepth;
-	req.tx_sched_priority = params->tx_sched_priority;
-	req.tx_burst_size = params->tx_burst_size;
-	req.tx_tdtype = params->tx_tdtype;
-	req.extended_ch_type = params->extended_ch_type;
-
-	ret = ti_sci_do_xfer(handle, TISCI_MSG_RM_UDMAP_TX_CH_CFG,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_rm_udmap_rx_ch_cfg() - Configure a UDMAP RX channel
- * @handle:	Pointer to TI SCI handle.
- * @params:	Pointer to ti_sci_msg_rm_udmap_rx_ch_cfg RX channel config
- *		structure
- *
- * Return: 0 if all went well, else returns appropriate error value.
- *
- * See @ti_sci_msg_rm_udmap_rx_ch_cfg and @ti_sci_msg_rm_udmap_rx_ch_cfg_req for
- * more info.
- */
-static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
-			const struct ti_sci_msg_rm_udmap_rx_ch_cfg *params)
-{
-	struct ti_sci_msg_rm_udmap_rx_ch_cfg_req req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.valid_params = params->valid_params;
-	req.nav_id = params->nav_id;
-	req.index = params->index;
-	req.rx_fetch_size = params->rx_fetch_size;
-	req.rxcq_qnum = params->rxcq_qnum;
-	req.rx_priority = params->rx_priority;
-	req.rx_qos = params->rx_qos;
-	req.rx_orderid = params->rx_orderid;
-	req.rx_sched_priority = params->rx_sched_priority;
-	req.flowid_start = params->flowid_start;
-	req.flowid_cnt = params->flowid_cnt;
-	req.rx_pause_on_err = params->rx_pause_on_err;
-	req.rx_atype = params->rx_atype;
-	req.rx_chan_type = params->rx_chan_type;
-	req.rx_ignore_short = params->rx_ignore_short;
-	req.rx_ignore_long = params->rx_ignore_long;
-	req.rx_burst_size = params->rx_burst_size;
-
-	ret = ti_sci_do_xfer(handle, TISCI_MSG_RM_UDMAP_RX_CH_CFG,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_rm_udmap_rx_flow_cfg() - Configure UDMAP RX FLOW
- * @handle:	Pointer to TI SCI handle.
- * @params:	Pointer to ti_sci_msg_rm_udmap_flow_cfg RX FLOW config
- *		structure
- *
- * Return: 0 if all went well, else returns appropriate error value.
- *
- * See @ti_sci_msg_rm_udmap_flow_cfg and @ti_sci_msg_rm_udmap_flow_cfg_req for
- * more info.
- */
-static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
-			const struct ti_sci_msg_rm_udmap_flow_cfg *params)
-{
-	struct ti_sci_msg_rm_udmap_flow_cfg_req req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.valid_params = params->valid_params;
-	req.nav_id = params->nav_id;
-	req.flow_index = params->flow_index;
-	req.rx_einfo_present = params->rx_einfo_present;
-	req.rx_psinfo_present = params->rx_psinfo_present;
-	req.rx_error_handling = params->rx_error_handling;
-	req.rx_desc_type = params->rx_desc_type;
-	req.rx_sop_offset = params->rx_sop_offset;
-	req.rx_dest_qnum = params->rx_dest_qnum;
-	req.rx_src_tag_hi = params->rx_src_tag_hi;
-	req.rx_src_tag_lo = params->rx_src_tag_lo;
-	req.rx_dest_tag_hi = params->rx_dest_tag_hi;
-	req.rx_dest_tag_lo = params->rx_dest_tag_lo;
-	req.rx_src_tag_hi_sel = params->rx_src_tag_hi_sel;
-	req.rx_src_tag_lo_sel = params->rx_src_tag_lo_sel;
-	req.rx_dest_tag_hi_sel = params->rx_dest_tag_hi_sel;
-	req.rx_dest_tag_lo_sel = params->rx_dest_tag_lo_sel;
-	req.rx_fdq0_sz0_qnum = params->rx_fdq0_sz0_qnum;
-	req.rx_fdq1_qnum = params->rx_fdq1_qnum;
-	req.rx_fdq2_qnum = params->rx_fdq2_qnum;
-	req.rx_fdq3_qnum = params->rx_fdq3_qnum;
-	req.rx_ps_location = params->rx_ps_location;
-
-	ret = ti_sci_do_xfer(handle, TISCI_MSG_RM_UDMAP_FLOW_CFG,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
 /**
  * ti_sci_cmd_proc_request() - Command to request a physical processor control
  * @handle:	Pointer to TI SCI handle
@@ -1495,23 +834,11 @@ static void ti_sci_setup_ops(struct ti_sci_info *info)
 		ti_sci_setup_pm_ops(pmops);
 	}
 
-	rm_core_ops->get_range = ti_sci_cmd_get_resource_range;
-	rm_core_ops->get_range_from_shost =
-				ti_sci_cmd_get_resource_range_from_shost;
-
-	iops->set_irq = ti_sci_cmd_set_irq;
-	iops->set_event_map = ti_sci_cmd_set_event_map;
-	iops->free_irq = ti_sci_cmd_free_irq;
-	iops->free_event_map = ti_sci_cmd_free_event_map;
-
-	rops->set_cfg = ti_sci_cmd_rm_ring_cfg;
-
-	psilops->pair = ti_sci_cmd_rm_psil_pair;
-	psilops->unpair = ti_sci_cmd_rm_psil_unpair;
-
-	udmap_ops->tx_ch_cfg = ti_sci_cmd_rm_udmap_tx_ch_cfg;
-	udmap_ops->rx_ch_cfg = ti_sci_cmd_rm_udmap_rx_ch_cfg;
-	udmap_ops->rx_flow_cfg = ti_sci_cmd_rm_udmap_rx_flow_cfg;
+	ti_sci_setup_rm_core_ops(rm_core_ops);
+	ti_sci_setup_rm_irq_ops(iops);
+	ti_sci_setup_rm_ringacc_ops(rops);
+	ti_sci_setup_rm_psil_ops(psilops);
+	ti_sci_setup_rm_udmap_ops(udmap_ops);
 
 	pops->request = ti_sci_cmd_proc_request;
 	pops->release = ti_sci_cmd_proc_release;
@@ -1722,198 +1049,6 @@ const struct ti_sci_handle *devm_ti_sci_get_by_phandle(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_ti_sci_get_by_phandle);
 
-/**
- * ti_sci_get_free_resource() - Get a free resource from TISCI resource.
- * @res:	Pointer to the TISCI resource
- *
- * Return: resource num if all went ok else TI_SCI_RESOURCE_NULL.
- */
-u16 ti_sci_get_free_resource(struct ti_sci_resource *res)
-{
-	unsigned long flags;
-	u16 set, free_bit;
-
-	raw_spin_lock_irqsave(&res->lock, flags);
-	for (set = 0; set < res->sets; set++) {
-		struct ti_sci_resource_desc *desc = &res->desc[set];
-		int res_count = desc->num + desc->num_sec;
-
-		free_bit = find_first_zero_bit(desc->res_map, res_count);
-		if (free_bit != res_count) {
-			__set_bit(free_bit, desc->res_map);
-			raw_spin_unlock_irqrestore(&res->lock, flags);
-
-			if (desc->num && free_bit < desc->num)
-				return desc->start + free_bit;
-			else
-				return desc->start_sec + free_bit;
-		}
-	}
-	raw_spin_unlock_irqrestore(&res->lock, flags);
-
-	return TI_SCI_RESOURCE_NULL;
-}
-EXPORT_SYMBOL_GPL(ti_sci_get_free_resource);
-
-/**
- * ti_sci_release_resource() - Release a resource from TISCI resource.
- * @res:	Pointer to the TISCI resource
- * @id:		Resource id to be released.
- */
-void ti_sci_release_resource(struct ti_sci_resource *res, u16 id)
-{
-	unsigned long flags;
-	u16 set;
-
-	raw_spin_lock_irqsave(&res->lock, flags);
-	for (set = 0; set < res->sets; set++) {
-		struct ti_sci_resource_desc *desc = &res->desc[set];
-
-		if (desc->num && desc->start <= id &&
-		    (desc->start + desc->num) > id)
-			__clear_bit(id - desc->start, desc->res_map);
-		else if (desc->num_sec && desc->start_sec <= id &&
-			 (desc->start_sec + desc->num_sec) > id)
-			__clear_bit(id - desc->start_sec, desc->res_map);
-	}
-	raw_spin_unlock_irqrestore(&res->lock, flags);
-}
-EXPORT_SYMBOL_GPL(ti_sci_release_resource);
-
-/**
- * ti_sci_get_num_resources() - Get the number of resources in TISCI resource
- * @res:	Pointer to the TISCI resource
- *
- * Return: Total number of available resources.
- */
-u32 ti_sci_get_num_resources(struct ti_sci_resource *res)
-{
-	u32 set, count = 0;
-
-	for (set = 0; set < res->sets; set++)
-		count += res->desc[set].num + res->desc[set].num_sec;
-
-	return count;
-}
-EXPORT_SYMBOL_GPL(ti_sci_get_num_resources);
-
-/**
- * devm_ti_sci_get_resource_sets() - Get a TISCI resources assigned to a device
- * @handle:	TISCI handle
- * @dev:	Device pointer to which the resource is assigned
- * @dev_id:	TISCI device id to which the resource is assigned
- * @sub_types:	Array of sub_types assigned corresponding to device
- * @sets:	Number of sub_types
- *
- * Return: Pointer to ti_sci_resource if all went well else appropriate
- *	   error pointer.
- */
-static struct ti_sci_resource *
-devm_ti_sci_get_resource_sets(const struct ti_sci_handle *handle,
-			      struct device *dev, u32 dev_id, u32 *sub_types,
-			      u32 sets)
-{
-	struct ti_sci_resource *res;
-	bool valid_set = false;
-	int i, ret, res_count;
-
-	res = devm_kzalloc(dev, sizeof(*res), GFP_KERNEL);
-	if (!res)
-		return ERR_PTR(-ENOMEM);
-
-	res->sets = sets;
-	res->desc = devm_kcalloc(dev, res->sets, sizeof(*res->desc),
-				 GFP_KERNEL);
-	if (!res->desc)
-		return ERR_PTR(-ENOMEM);
-
-	for (i = 0; i < res->sets; i++) {
-		ret = handle->ops.rm_core_ops.get_range(handle, dev_id,
-							sub_types[i],
-							&res->desc[i]);
-		if (ret) {
-			dev_dbg(dev, "dev = %d subtype %d not allocated for this host\n",
-				dev_id, sub_types[i]);
-			memset(&res->desc[i], 0, sizeof(res->desc[i]));
-			continue;
-		}
-
-		dev_dbg(dev, "dev/sub_type: %d/%d, start/num: %d/%d | %d/%d\n",
-			dev_id, sub_types[i], res->desc[i].start,
-			res->desc[i].num, res->desc[i].start_sec,
-			res->desc[i].num_sec);
-
-		valid_set = true;
-		res_count = res->desc[i].num + res->desc[i].num_sec;
-		res->desc[i].res_map = devm_bitmap_zalloc(dev, res_count,
-							  GFP_KERNEL);
-		if (!res->desc[i].res_map)
-			return ERR_PTR(-ENOMEM);
-	}
-	raw_spin_lock_init(&res->lock);
-
-	if (valid_set)
-		return res;
-
-	return ERR_PTR(-EINVAL);
-}
-
-/**
- * devm_ti_sci_get_of_resource() - Get a TISCI resource assigned to a device
- * @handle:	TISCI handle
- * @dev:	Device pointer to which the resource is assigned
- * @dev_id:	TISCI device id to which the resource is assigned
- * @of_prop:	property name by which the resource are represented
- *
- * Return: Pointer to ti_sci_resource if all went well else appropriate
- *	   error pointer.
- */
-struct ti_sci_resource *
-devm_ti_sci_get_of_resource(const struct ti_sci_handle *handle,
-			    struct device *dev, u32 dev_id, char *of_prop)
-{
-	struct ti_sci_resource *res;
-	u32 *sub_types;
-	int sets;
-
-	sets = of_property_count_elems_of_size(dev_of_node(dev), of_prop,
-					       sizeof(u32));
-	if (sets < 0) {
-		dev_err(dev, "%s resource type ids not available\n", of_prop);
-		return ERR_PTR(sets);
-	}
-
-	sub_types = kcalloc(sets, sizeof(*sub_types), GFP_KERNEL);
-	if (!sub_types)
-		return ERR_PTR(-ENOMEM);
-
-	of_property_read_u32_array(dev_of_node(dev), of_prop, sub_types, sets);
-	res = devm_ti_sci_get_resource_sets(handle, dev, dev_id, sub_types,
-					    sets);
-
-	kfree(sub_types);
-	return res;
-}
-EXPORT_SYMBOL_GPL(devm_ti_sci_get_of_resource);
-
-/**
- * devm_ti_sci_get_resource() - Get a resource range assigned to the device
- * @handle:	TISCI handle
- * @dev:	Device pointer to which the resource is assigned
- * @dev_id:	TISCI device id to which the resource is assigned
- * @sub_type:	TISCI resource subytpe representing the resource.
- *
- * Return: Pointer to ti_sci_resource if all went well else appropriate
- *	   error pointer.
- */
-struct ti_sci_resource *
-devm_ti_sci_get_resource(const struct ti_sci_handle *handle, struct device *dev,
-			 u32 dev_id, u32 sub_type)
-{
-	return devm_ti_sci_get_resource_sets(handle, dev, dev_id, &sub_type, 1);
-}
-EXPORT_SYMBOL_GPL(devm_ti_sci_get_resource);
-
 /*
  * Iterate all device nodes that have a wakeup-source property and check if one
  * of the possible phandles points to a Partial-IO system state. If it
diff --git a/drivers/firmware/ti/ti_sci_rm.c b/drivers/firmware/ti/ti_sci_rm.c
new file mode 100644
index 0000000000000..87f2ef5785e09
--- /dev/null
+++ b/drivers/firmware/ti/ti_sci_rm.c
@@ -0,0 +1,910 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Texas Instruments System Control Interface Protocol Driver
+ *
+ * Copyright (C) 2015-2026 Texas Instruments Incorporated - https://www.ti.com/
+ *	Nishanth Menon
+ */
+
+#include <linux/bitmap.h>
+#include <linux/errno.h>
+#include <linux/export.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include <linux/soc/ti/ti_sci_protocol.h>
+
+#include "ti_sci.h"
+
+/**
+ * ti_sci_get_resource_range - Helper to get a range of resources assigned
+ *			       to a host. Resource is uniquely identified by
+ *			       type and subtype.
+ * @handle:		Pointer to TISCI handle.
+ * @dev_id:		TISCI device ID.
+ * @subtype:		Resource assignment subtype that is being requested
+ *			from the given device.
+ * @s_host:		Host processor ID to which the resources are allocated
+ * @desc:		Pointer to ti_sci_resource_desc to be updated with the
+ *			resource range start index and number of resources
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
+				     u32 dev_id, u8 subtype, u8 s_host,
+				     struct ti_sci_resource_desc *desc)
+{
+	struct ti_sci_msg_resp_get_resource_range resp;
+	struct ti_sci_msg_req_get_resource_range req;
+	int ret = 0;
+
+	if (!desc)
+		return -EINVAL;
+
+	req.secondary_host = s_host;
+	req.type = dev_id & MSG_RM_RESOURCE_TYPE_MASK;
+	req.subtype = subtype & MSG_RM_RESOURCE_SUBTYPE_MASK;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_RESOURCE_RANGE,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	if (!resp.range_num && !resp.range_num_sec) {
+		/* Neither of the two resource range is valid */
+		ret = -ENODEV;
+	} else {
+		desc->start = resp.range_start;
+		desc->num = resp.range_num;
+		desc->start_sec = resp.range_start_sec;
+		desc->num_sec = resp.range_num_sec;
+	}
+
+	return ret;
+}
+
+/**
+ * ti_sci_cmd_get_resource_range - Get a range of resources assigned to host
+ *				   that is same as ti sci interface host.
+ * @handle:		Pointer to TISCI handle.
+ * @dev_id:		TISCI device ID.
+ * @subtype:		Resource assignment subtype that is being requested
+ *			from the given device.
+ * @desc:		Pointer to ti_sci_resource_desc to be updated with the
+ *			resource range start index and number of resources
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_get_resource_range(const struct ti_sci_handle *handle,
+					 u32 dev_id, u8 subtype,
+					 struct ti_sci_resource_desc *desc)
+{
+	return ti_sci_get_resource_range(handle, dev_id, subtype,
+					 TI_SCI_IRQ_SECONDARY_HOST_INVALID,
+					 desc);
+}
+
+/**
+ * ti_sci_cmd_get_resource_range_from_shost - Get a range of resources
+ *					      assigned to a specified host.
+ * @handle:		Pointer to TISCI handle.
+ * @dev_id:		TISCI device ID.
+ * @subtype:		Resource assignment subtype that is being requested
+ *			from the given device.
+ * @s_host:		Host processor ID to which the resources are allocated
+ * @desc:		Pointer to ti_sci_resource_desc to be updated with the
+ *			resource range start index and number of resources
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static
+int ti_sci_cmd_get_resource_range_from_shost(const struct ti_sci_handle *handle,
+					     u32 dev_id, u8 subtype, u8 s_host,
+					     struct ti_sci_resource_desc *desc)
+{
+	return ti_sci_get_resource_range(handle, dev_id, subtype, s_host, desc);
+}
+
+/**
+ * ti_sci_manage_irq() - Helper api to configure/release the irq route between
+ *			 the requested source and destination
+ * @handle:		Pointer to TISCI handle.
+ * @valid_params:	Bit fields defining the validity of certain params
+ * @src_id:		Device ID of the IRQ source
+ * @src_index:		IRQ source index within the source device
+ * @dst_id:		Device ID of the IRQ destination
+ * @dst_host_irq:	IRQ number of the destination device
+ * @ia_id:		Device ID of the IA, if the IRQ flows through this IA
+ * @vint:		Virtual interrupt to be used within the IA
+ * @global_event:	Global event number to be used for the requesting event
+ * @vint_status_bit:	Virtual interrupt status bit to be used for the event
+ * @s_host:		Secondary host ID to which the irq/event is being
+ *			requested for.
+ * @type:		Request type irq set or release.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+int ti_sci_manage_irq(const struct ti_sci_handle *handle,
+		      u32 valid_params, u16 src_id, u16 src_index,
+		      u16 dst_id, u16 dst_host_irq, u16 ia_id, u16 vint,
+		      u16 global_event, u8 vint_status_bit, u8 s_host,
+		      u16 type)
+{
+	struct ti_sci_msg_req_manage_irq req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.valid_params = valid_params;
+	req.src_id = src_id;
+	req.src_index = src_index;
+	req.dst_id = dst_id;
+	req.dst_host_irq = dst_host_irq;
+	req.ia_id = ia_id;
+	req.vint = vint;
+	req.global_event = global_event;
+	req.vint_status_bit = vint_status_bit;
+	req.secondary_host = s_host;
+
+	ret = ti_sci_do_xfer(handle, type, TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_irq_hash() - Helper API to compute irq hash for the hash table.
+ * @irq:	irq to hash
+ *
+ * Return: the computed hash value.
+ */
+static int ti_sci_irq_hash(struct ti_sci_msg_req_manage_irq *irq)
+{
+	return irq->src_id ^ irq->src_index;
+}
+
+/**
+ * ti_sci_irq_equal() - Helper API to compare two irqs (generic headers are not
+ *                       compared)
+ * @irq_a:	irq_a to compare
+ * @irq_b:	irq_b to compare
+ *
+ * Return: true if the two irqs are equal, else false.
+ */
+static bool ti_sci_irq_equal(struct ti_sci_msg_req_manage_irq *irq_a,
+			     struct ti_sci_msg_req_manage_irq *irq_b)
+{
+	return !memcmp(&irq_a->valid_params, &irq_b->valid_params,
+		       sizeof(*irq_a) - sizeof(irq_a->hdr));
+}
+
+/**
+ * ti_sci_set_irq() - Helper api to configure the irq route between the
+ *		      requested source and destination
+ * @handle:		Pointer to TISCI handle.
+ * @valid_params:	Bit fields defining the validity of certain params
+ * @src_id:		Device ID of the IRQ source
+ * @src_index:		IRQ source index within the source device
+ * @dst_id:		Device ID of the IRQ destination
+ * @dst_host_irq:	IRQ number of the destination device
+ * @ia_id:		Device ID of the IA, if the IRQ flows through this IA
+ * @vint:		Virtual interrupt to be used within the IA
+ * @global_event:	Global event number to be used for the requesting event
+ * @vint_status_bit:	Virtual interrupt status bit to be used for the event
+ * @s_host:		Secondary host ID to which the irq/event is being
+ *			requested for.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_set_irq(const struct ti_sci_handle *handle, u32 valid_params,
+			  u16 src_id, u16 src_index, u16 dst_id,
+			  u16 dst_host_irq, u16 ia_id, u16 vint,
+			  u16 global_event, u8 vint_status_bit, u8 s_host)
+{
+	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
+	struct ti_sci_msg_req_manage_irq *desc;
+	struct ti_sci_irq *irq;
+	int ret;
+
+	/* Lock for set_irq() and free_irq() to keep the IRQ hash list consistent */
+	guard(mutex)(&info->irq_lock);
+
+	pr_debug("%s: IRQ set with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d,via ia_id = %d, vint = %d, global event = %d,status_bit = %d\n",
+		 __func__, valid_params, src_id, src_index,
+		 dst_id, dst_host_irq, ia_id, vint, global_event,
+		 vint_status_bit);
+
+	ret = ti_sci_manage_irq(handle, valid_params, src_id, src_index,
+				dst_id, dst_host_irq, ia_id, vint,
+				global_event, vint_status_bit, s_host,
+				TI_SCI_MSG_SET_IRQ);
+
+	if (ret || !(info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST))
+		goto end;
+
+	irq = kzalloc_obj(*irq);
+	if (!irq) {
+		ti_sci_manage_irq(handle, valid_params, src_id, src_index,
+				  dst_id, dst_host_irq, ia_id, vint,
+				  global_event, vint_status_bit, s_host,
+				  TI_SCI_MSG_FREE_IRQ);
+		ret = -ENOMEM;
+		goto end;
+	}
+
+	desc = &irq->desc;
+	desc->valid_params = valid_params;
+	desc->src_id = src_id;
+	desc->src_index = src_index;
+	desc->dst_id = dst_id;
+	desc->dst_host_irq = dst_host_irq;
+	desc->ia_id = ia_id;
+	desc->vint = vint;
+	desc->global_event = global_event;
+	desc->vint_status_bit = vint_status_bit;
+	desc->secondary_host = s_host;
+
+	hash_add(info->irqs, &irq->node, ti_sci_irq_hash(desc));
+
+end:
+	return ret;
+}
+
+/**
+ * ti_sci_free_irq() - Helper api to free the irq route between the
+ *			   requested source and destination
+ * @handle:		Pointer to TISCI handle.
+ * @valid_params:	Bit fields defining the validity of certain params
+ * @src_id:		Device ID of the IRQ source
+ * @src_index:		IRQ source index within the source device
+ * @dst_id:		Device ID of the IRQ destination
+ * @dst_host_irq:	IRQ number of the destination device
+ * @ia_id:		Device ID of the IA, if the IRQ flows through this IA
+ * @vint:		Virtual interrupt to be used within the IA
+ * @global_event:	Global event number to be used for the requesting event
+ * @vint_status_bit:	Virtual interrupt status bit to be used for the event
+ * @s_host:		Secondary host ID to which the irq/event is being
+ *			requested for.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_free_irq(const struct ti_sci_handle *handle, u32 valid_params,
+			   u16 src_id, u16 src_index, u16 dst_id,
+			   u16 dst_host_irq, u16 ia_id, u16 vint,
+			   u16 global_event, u8 vint_status_bit, u8 s_host)
+{
+	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
+	struct ti_sci_msg_req_manage_irq irq_desc;
+	struct device *dev = info->dev;
+	struct ti_sci_irq *this_irq;
+	struct hlist_node *tmp_node;
+	int ret;
+
+	guard(mutex)(&info->irq_lock);
+
+	pr_debug("%s: IRQ release with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d,via ia_id = %d, vint = %d, global event = %d,status_bit = %d\n",
+		 __func__, valid_params, src_id, src_index,
+		 dst_id, dst_host_irq, ia_id, vint, global_event,
+		 vint_status_bit);
+
+	ret = ti_sci_manage_irq(handle, valid_params, src_id, src_index,
+				dst_id, dst_host_irq, ia_id, vint,
+				global_event, vint_status_bit, s_host,
+				TI_SCI_MSG_FREE_IRQ);
+
+	if (ret || !(info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST))
+		goto end;
+
+	irq_desc.valid_params = valid_params;
+	irq_desc.src_id = src_id;
+	irq_desc.src_index = src_index;
+	irq_desc.dst_id = dst_id;
+	irq_desc.dst_host_irq = dst_host_irq;
+	irq_desc.ia_id = ia_id;
+	irq_desc.vint = vint;
+	irq_desc.global_event = global_event;
+	irq_desc.vint_status_bit = vint_status_bit;
+	irq_desc.secondary_host = s_host;
+
+	hash_for_each_possible_safe(info->irqs, this_irq, tmp_node, node,
+				    ti_sci_irq_hash(&irq_desc)) {
+		if (ti_sci_irq_equal(&irq_desc, &this_irq->desc)) {
+			hlist_del(&this_irq->node);
+			kfree(this_irq);
+			goto end;
+		}
+	}
+
+	dev_warn(dev, "%s: should not be here, IRQ was not found in hash list\n",
+		 __func__);
+
+end:
+	return ret;
+}
+
+/**
+ * ti_sci_cmd_set_irq() - Configure a host irq route between the requested
+ *			  source and destination.
+ * @handle:		Pointer to TISCI handle.
+ * @src_id:		Device ID of the IRQ source
+ * @src_index:		IRQ source index within the source device
+ * @dst_id:		Device ID of the IRQ destination
+ * @dst_host_irq:	IRQ number of the destination device
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_set_irq(const struct ti_sci_handle *handle, u16 src_id,
+			      u16 src_index, u16 dst_id, u16 dst_host_irq)
+{
+	u32 valid_params = MSG_FLAG_DST_ID_VALID | MSG_FLAG_DST_HOST_IRQ_VALID;
+
+	return ti_sci_set_irq(handle, valid_params, src_id, src_index, dst_id,
+			      dst_host_irq, 0, 0, 0, 0, 0);
+}
+
+/**
+ * ti_sci_cmd_set_event_map() - Configure an event based irq route between the
+ *				requested source and Interrupt Aggregator.
+ * @handle:		Pointer to TISCI handle.
+ * @src_id:		Device ID of the IRQ source
+ * @src_index:		IRQ source index within the source device
+ * @ia_id:		Device ID of the IA, if the IRQ flows through this IA
+ * @vint:		Virtual interrupt to be used within the IA
+ * @global_event:	Global event number to be used for the requesting event
+ * @vint_status_bit:	Virtual interrupt status bit to be used for the event
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_set_event_map(const struct ti_sci_handle *handle,
+				    u16 src_id, u16 src_index, u16 ia_id,
+				    u16 vint, u16 global_event,
+				    u8 vint_status_bit)
+{
+	u32 valid_params = MSG_FLAG_IA_ID_VALID | MSG_FLAG_VINT_VALID |
+			   MSG_FLAG_GLB_EVNT_VALID |
+			   MSG_FLAG_VINT_STS_BIT_VALID;
+
+	return ti_sci_set_irq(handle, valid_params, src_id, src_index, 0, 0,
+			      ia_id, vint, global_event, vint_status_bit, 0);
+}
+
+/**
+ * ti_sci_cmd_free_irq() - Free a host irq route between the between the
+ *			   requested source and destination.
+ * @handle:		Pointer to TISCI handle.
+ * @src_id:		Device ID of the IRQ source
+ * @src_index:		IRQ source index within the source device
+ * @dst_id:		Device ID of the IRQ destination
+ * @dst_host_irq:	IRQ number of the destination device
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_free_irq(const struct ti_sci_handle *handle, u16 src_id,
+			       u16 src_index, u16 dst_id, u16 dst_host_irq)
+{
+	u32 valid_params = MSG_FLAG_DST_ID_VALID | MSG_FLAG_DST_HOST_IRQ_VALID;
+
+	return ti_sci_free_irq(handle, valid_params, src_id, src_index, dst_id,
+			       dst_host_irq, 0, 0, 0, 0, 0);
+}
+
+/**
+ * ti_sci_cmd_free_event_map() - Free an event map between the requested source
+ *				 and Interrupt Aggregator.
+ * @handle:		Pointer to TISCI handle.
+ * @src_id:		Device ID of the IRQ source
+ * @src_index:		IRQ source index within the source device
+ * @ia_id:		Device ID of the IA, if the IRQ flows through this IA
+ * @vint:		Virtual interrupt to be used within the IA
+ * @global_event:	Global event number to be used for the requesting event
+ * @vint_status_bit:	Virtual interrupt status bit to be used for the event
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_free_event_map(const struct ti_sci_handle *handle,
+				     u16 src_id, u16 src_index, u16 ia_id,
+				     u16 vint, u16 global_event,
+				     u8 vint_status_bit)
+{
+	u32 valid_params = MSG_FLAG_IA_ID_VALID |
+			   MSG_FLAG_VINT_VALID | MSG_FLAG_GLB_EVNT_VALID |
+			   MSG_FLAG_VINT_STS_BIT_VALID;
+
+	return ti_sci_free_irq(handle, valid_params, src_id, src_index, 0, 0,
+			       ia_id, vint, global_event, vint_status_bit, 0);
+}
+
+/**
+ * ti_sci_cmd_rm_ring_cfg() - Configure a NAVSS ring
+ * @handle:	Pointer to TI SCI handle.
+ * @params:	Pointer to ti_sci_msg_rm_ring_cfg ring config structure
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ *
+ * See @ti_sci_msg_rm_ring_cfg and @ti_sci_msg_rm_ring_cfg_req for
+ * more info.
+ */
+static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
+				  const struct ti_sci_msg_rm_ring_cfg *params)
+{
+	struct ti_sci_msg_rm_ring_cfg_req req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.valid_params = params->valid_params;
+	req.nav_id = params->nav_id;
+	req.index = params->index;
+	req.addr_lo = params->addr_lo;
+	req.addr_hi = params->addr_hi;
+	req.count = params->count;
+	req.mode = params->mode;
+	req.size = params->size;
+	req.order_id = params->order_id;
+	req.virtid = params->virtid;
+	req.asel = params->asel;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_RM_RING_CFG,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_rm_psil_pair() - Pair PSI-L source to destination thread
+ * @handle:	Pointer to TI SCI handle.
+ * @nav_id:	Device ID of Navigator Subsystem which should be used for
+ *		pairing
+ * @src_thread:	Source PSI-L thread ID
+ * @dst_thread: Destination PSI-L thread ID
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
+				   u32 nav_id, u32 src_thread, u32 dst_thread)
+{
+	struct ti_sci_msg_psil_pair req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.nav_id = nav_id;
+	req.src_thread = src_thread;
+	req.dst_thread = dst_thread;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_RM_PSIL_PAIR,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_rm_psil_unpair() - Unpair PSI-L source from destination thread
+ * @handle:	Pointer to TI SCI handle.
+ * @nav_id:	Device ID of Navigator Subsystem which should be used for
+ *		unpairing
+ * @src_thread:	Source PSI-L thread ID
+ * @dst_thread:	Destination PSI-L thread ID
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
+				     u32 nav_id, u32 src_thread, u32 dst_thread)
+{
+	struct ti_sci_msg_psil_unpair req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.nav_id = nav_id;
+	req.src_thread = src_thread;
+	req.dst_thread = dst_thread;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_RM_PSIL_UNPAIR,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_rm_udmap_tx_ch_cfg() - Configure a UDMAP TX channel
+ * @handle:	Pointer to TI SCI handle.
+ * @params:	Pointer to ti_sci_msg_rm_udmap_tx_ch_cfg TX channel config
+ *		structure
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ *
+ * See @ti_sci_msg_rm_udmap_tx_ch_cfg and @ti_sci_msg_rm_udmap_tx_ch_cfg_req for
+ * more info.
+ */
+static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
+					 const struct ti_sci_msg_rm_udmap_tx_ch_cfg *params)
+{
+	struct ti_sci_msg_rm_udmap_tx_ch_cfg_req req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.valid_params = params->valid_params;
+	req.nav_id = params->nav_id;
+	req.index = params->index;
+	req.tx_pause_on_err = params->tx_pause_on_err;
+	req.tx_filt_einfo = params->tx_filt_einfo;
+	req.tx_filt_pswords = params->tx_filt_pswords;
+	req.tx_atype = params->tx_atype;
+	req.tx_chan_type = params->tx_chan_type;
+	req.tx_supr_tdpkt = params->tx_supr_tdpkt;
+	req.tx_fetch_size = params->tx_fetch_size;
+	req.tx_credit_count = params->tx_credit_count;
+	req.txcq_qnum = params->txcq_qnum;
+	req.tx_priority = params->tx_priority;
+	req.tx_qos = params->tx_qos;
+	req.tx_orderid = params->tx_orderid;
+	req.fdepth = params->fdepth;
+	req.tx_sched_priority = params->tx_sched_priority;
+	req.tx_burst_size = params->tx_burst_size;
+	req.tx_tdtype = params->tx_tdtype;
+	req.extended_ch_type = params->extended_ch_type;
+
+	ret = ti_sci_do_xfer(handle, TISCI_MSG_RM_UDMAP_TX_CH_CFG,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_rm_udmap_rx_ch_cfg() - Configure a UDMAP RX channel
+ * @handle:	Pointer to TI SCI handle.
+ * @params:	Pointer to ti_sci_msg_rm_udmap_rx_ch_cfg RX channel config
+ *		structure
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ *
+ * See @ti_sci_msg_rm_udmap_rx_ch_cfg and @ti_sci_msg_rm_udmap_rx_ch_cfg_req for
+ * more info.
+ */
+static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
+					 const struct ti_sci_msg_rm_udmap_rx_ch_cfg *params)
+{
+	struct ti_sci_msg_rm_udmap_rx_ch_cfg_req req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.valid_params = params->valid_params;
+	req.nav_id = params->nav_id;
+	req.index = params->index;
+	req.rx_fetch_size = params->rx_fetch_size;
+	req.rxcq_qnum = params->rxcq_qnum;
+	req.rx_priority = params->rx_priority;
+	req.rx_qos = params->rx_qos;
+	req.rx_orderid = params->rx_orderid;
+	req.rx_sched_priority = params->rx_sched_priority;
+	req.flowid_start = params->flowid_start;
+	req.flowid_cnt = params->flowid_cnt;
+	req.rx_pause_on_err = params->rx_pause_on_err;
+	req.rx_atype = params->rx_atype;
+	req.rx_chan_type = params->rx_chan_type;
+	req.rx_ignore_short = params->rx_ignore_short;
+	req.rx_ignore_long = params->rx_ignore_long;
+	req.rx_burst_size = params->rx_burst_size;
+
+	ret = ti_sci_do_xfer(handle, TISCI_MSG_RM_UDMAP_RX_CH_CFG,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_rm_udmap_rx_flow_cfg() - Configure UDMAP RX FLOW
+ * @handle:	Pointer to TI SCI handle.
+ * @params:	Pointer to ti_sci_msg_rm_udmap_flow_cfg RX FLOW config
+ *		structure
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ *
+ * See @ti_sci_msg_rm_udmap_flow_cfg and @ti_sci_msg_rm_udmap_flow_cfg_req for
+ * more info.
+ */
+static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
+					   const struct ti_sci_msg_rm_udmap_flow_cfg *params)
+{
+	struct ti_sci_msg_rm_udmap_flow_cfg_req req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.valid_params = params->valid_params;
+	req.nav_id = params->nav_id;
+	req.flow_index = params->flow_index;
+	req.rx_einfo_present = params->rx_einfo_present;
+	req.rx_psinfo_present = params->rx_psinfo_present;
+	req.rx_error_handling = params->rx_error_handling;
+	req.rx_desc_type = params->rx_desc_type;
+	req.rx_sop_offset = params->rx_sop_offset;
+	req.rx_dest_qnum = params->rx_dest_qnum;
+	req.rx_src_tag_hi = params->rx_src_tag_hi;
+	req.rx_src_tag_lo = params->rx_src_tag_lo;
+	req.rx_dest_tag_hi = params->rx_dest_tag_hi;
+	req.rx_dest_tag_lo = params->rx_dest_tag_lo;
+	req.rx_src_tag_hi_sel = params->rx_src_tag_hi_sel;
+	req.rx_src_tag_lo_sel = params->rx_src_tag_lo_sel;
+	req.rx_dest_tag_hi_sel = params->rx_dest_tag_hi_sel;
+	req.rx_dest_tag_lo_sel = params->rx_dest_tag_lo_sel;
+	req.rx_fdq0_sz0_qnum = params->rx_fdq0_sz0_qnum;
+	req.rx_fdq1_qnum = params->rx_fdq1_qnum;
+	req.rx_fdq2_qnum = params->rx_fdq2_qnum;
+	req.rx_fdq3_qnum = params->rx_fdq3_qnum;
+	req.rx_ps_location = params->rx_ps_location;
+
+	ret = ti_sci_do_xfer(handle, TISCI_MSG_RM_UDMAP_FLOW_CFG,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_get_free_resource() - Get a free resource from TISCI resource.
+ * @res:	Pointer to the TISCI resource
+ *
+ * Return: resource num if all went ok else TI_SCI_RESOURCE_NULL.
+ */
+u16 ti_sci_get_free_resource(struct ti_sci_resource *res)
+{
+	unsigned long flags;
+	u16 set, free_bit;
+
+	raw_spin_lock_irqsave(&res->lock, flags);
+	for (set = 0; set < res->sets; set++) {
+		struct ti_sci_resource_desc *desc = &res->desc[set];
+		int res_count = desc->num + desc->num_sec;
+
+		free_bit = find_first_zero_bit(desc->res_map, res_count);
+		if (free_bit != res_count) {
+			__set_bit(free_bit, desc->res_map);
+			raw_spin_unlock_irqrestore(&res->lock, flags);
+
+			if (desc->num && free_bit < desc->num)
+				return desc->start + free_bit;
+			else
+				return desc->start_sec + free_bit;
+		}
+	}
+	raw_spin_unlock_irqrestore(&res->lock, flags);
+
+	return TI_SCI_RESOURCE_NULL;
+}
+EXPORT_SYMBOL_GPL(ti_sci_get_free_resource);
+
+/**
+ * ti_sci_release_resource() - Release a resource from TISCI resource.
+ * @res:	Pointer to the TISCI resource
+ * @id:		Resource id to be released.
+ */
+void ti_sci_release_resource(struct ti_sci_resource *res, u16 id)
+{
+	unsigned long flags;
+	u16 set;
+
+	raw_spin_lock_irqsave(&res->lock, flags);
+	for (set = 0; set < res->sets; set++) {
+		struct ti_sci_resource_desc *desc = &res->desc[set];
+
+		if (desc->num && desc->start <= id &&
+		    (desc->start + desc->num) > id)
+			__clear_bit(id - desc->start, desc->res_map);
+		else if (desc->num_sec && desc->start_sec <= id &&
+			 (desc->start_sec + desc->num_sec) > id)
+			__clear_bit(id - desc->start_sec, desc->res_map);
+	}
+	raw_spin_unlock_irqrestore(&res->lock, flags);
+}
+EXPORT_SYMBOL_GPL(ti_sci_release_resource);
+
+/**
+ * ti_sci_get_num_resources() - Get the number of resources in TISCI resource
+ * @res:	Pointer to the TISCI resource
+ *
+ * Return: Total number of available resources.
+ */
+u32 ti_sci_get_num_resources(struct ti_sci_resource *res)
+{
+	u32 set, count = 0;
+
+	for (set = 0; set < res->sets; set++)
+		count += res->desc[set].num + res->desc[set].num_sec;
+
+	return count;
+}
+EXPORT_SYMBOL_GPL(ti_sci_get_num_resources);
+
+/**
+ * devm_ti_sci_get_resource_sets() - Get a TISCI resources assigned to a device
+ * @handle:	TISCI handle
+ * @dev:	Device pointer to which the resource is assigned
+ * @dev_id:	TISCI device id to which the resource is assigned
+ * @sub_types:	Array of sub_types assigned corresponding to device
+ * @sets:	Number of sub_types
+ *
+ * Return: Pointer to ti_sci_resource if all went well else appropriate
+ *	   error pointer.
+ */
+static struct ti_sci_resource *
+devm_ti_sci_get_resource_sets(const struct ti_sci_handle *handle,
+			      struct device *dev, u32 dev_id, u32 *sub_types,
+			      u32 sets)
+{
+	struct ti_sci_resource *res;
+	bool valid_set = false;
+	int i, ret, res_count;
+
+	res = devm_kzalloc(dev, sizeof(*res), GFP_KERNEL);
+	if (!res)
+		return ERR_PTR(-ENOMEM);
+
+	res->sets = sets;
+	res->desc = devm_kcalloc(dev, res->sets, sizeof(*res->desc),
+				 GFP_KERNEL);
+	if (!res->desc)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < res->sets; i++) {
+		ret = handle->ops.rm_core_ops.get_range(handle, dev_id,
+							sub_types[i],
+							&res->desc[i]);
+		if (ret) {
+			dev_dbg(dev, "dev = %d subtype %d not allocated for this host\n",
+				dev_id, sub_types[i]);
+			memset(&res->desc[i], 0, sizeof(res->desc[i]));
+			continue;
+		}
+
+		dev_dbg(dev, "dev/sub_type: %d/%d, start/num: %d/%d | %d/%d\n",
+			dev_id, sub_types[i], res->desc[i].start,
+			res->desc[i].num, res->desc[i].start_sec,
+			res->desc[i].num_sec);
+
+		valid_set = true;
+		res_count = res->desc[i].num + res->desc[i].num_sec;
+		res->desc[i].res_map = devm_bitmap_zalloc(dev, res_count,
+							  GFP_KERNEL);
+		if (!res->desc[i].res_map)
+			return ERR_PTR(-ENOMEM);
+	}
+	raw_spin_lock_init(&res->lock);
+
+	if (valid_set)
+		return res;
+
+	return ERR_PTR(-EINVAL);
+}
+
+/**
+ * devm_ti_sci_get_of_resource() - Get a TISCI resource assigned to a device
+ * @handle:	TISCI handle
+ * @dev:	Device pointer to which the resource is assigned
+ * @dev_id:	TISCI device id to which the resource is assigned
+ * @of_prop:	property name by which the resource are represented
+ *
+ * Return: Pointer to ti_sci_resource if all went well else appropriate
+ *	   error pointer.
+ */
+struct ti_sci_resource *
+devm_ti_sci_get_of_resource(const struct ti_sci_handle *handle,
+			    struct device *dev, u32 dev_id, char *of_prop)
+{
+	struct ti_sci_resource *res;
+	u32 *sub_types;
+	int sets;
+
+	sets = of_property_count_elems_of_size(dev_of_node(dev), of_prop,
+					       sizeof(u32));
+	if (sets < 0) {
+		dev_err(dev, "%s resource type ids not available\n", of_prop);
+		return ERR_PTR(sets);
+	}
+
+	sub_types = kcalloc(sets, sizeof(*sub_types), GFP_KERNEL);
+	if (!sub_types)
+		return ERR_PTR(-ENOMEM);
+
+	of_property_read_u32_array(dev_of_node(dev), of_prop, sub_types, sets);
+	res = devm_ti_sci_get_resource_sets(handle, dev, dev_id, sub_types,
+					    sets);
+
+	kfree(sub_types);
+	return res;
+}
+EXPORT_SYMBOL_GPL(devm_ti_sci_get_of_resource);
+
+/**
+ * devm_ti_sci_get_resource() - Get a resource range assigned to the device
+ * @handle:	TISCI handle
+ * @dev:	Device pointer to which the resource is assigned
+ * @dev_id:	TISCI device id to which the resource is assigned
+ * @sub_type:	TISCI resource subytpe representing the resource.
+ *
+ * Return: Pointer to ti_sci_resource if all went well else appropriate
+ *	   error pointer.
+ */
+struct ti_sci_resource *
+devm_ti_sci_get_resource(const struct ti_sci_handle *handle, struct device *dev,
+			 u32 dev_id, u32 sub_type)
+{
+	return devm_ti_sci_get_resource_sets(handle, dev, dev_id, &sub_type, 1);
+}
+EXPORT_SYMBOL_GPL(devm_ti_sci_get_resource);
+
+/*
+ * ti_sci_setup_rm_core_ops() - Setup the Resource Management core operations structures
+ * @rm_core_ops:	pointer to TISCI rm core ops structure
+ */
+void ti_sci_setup_rm_core_ops(struct ti_sci_rm_core_ops *rm_core_ops)
+{
+	rm_core_ops->get_range = ti_sci_cmd_get_resource_range;
+	rm_core_ops->get_range_from_shost =
+		ti_sci_cmd_get_resource_range_from_shost;
+}
+
+/*
+ * ti_sci_setup_rm_irq_ops() - Setup the Resource Management IRQ operations structures
+ * @iops:	pointer to TISCI rm irq ops structure
+ */
+void ti_sci_setup_rm_irq_ops(struct ti_sci_rm_irq_ops *iops)
+{
+	iops->set_irq = ti_sci_cmd_set_irq;
+	iops->set_event_map = ti_sci_cmd_set_event_map;
+	iops->free_irq = ti_sci_cmd_free_irq;
+	iops->free_event_map = ti_sci_cmd_free_event_map;
+}
+
+/*
+ * ti_sci_setup_rm_ringacc_ops() - Setup the Resource Management RINGACC operations structures
+ * @rops:	pointer to TISCI rm ringacc ops structure
+ */
+void ti_sci_setup_rm_ringacc_ops(struct ti_sci_rm_ringacc_ops *rops)
+{
+	rops->set_cfg = ti_sci_cmd_rm_ring_cfg;
+}
+
+/*
+ * ti_sci_setup_rm_psil_ops() - Setup the Resource Management PSIL operations structures
+ * @psilops:	pointer to TISCI rm psil ops structure
+ */
+void ti_sci_setup_rm_psil_ops(struct ti_sci_rm_psil_ops *psilops)
+{
+	psilops->pair = ti_sci_cmd_rm_psil_pair;
+	psilops->unpair = ti_sci_cmd_rm_psil_unpair;
+}
+
+/*
+ * ti_sci_setup_rm_udmap_ops() - Setup the Resource Management UDMAP operations structures
+ * @udmap_ops:	pointer to TISCI rm udmap ops structure
+ */
+void ti_sci_setup_rm_udmap_ops(struct ti_sci_rm_udmap_ops *udmap_ops)
+{
+	udmap_ops->tx_ch_cfg = ti_sci_cmd_rm_udmap_tx_ch_cfg;
+	udmap_ops->rx_ch_cfg = ti_sci_cmd_rm_udmap_rx_ch_cfg;
+	udmap_ops->rx_flow_cfg = ti_sci_cmd_rm_udmap_rx_flow_cfg;
+}
-- 
2.34.1

