Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99971455182
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713157; cv=fail; b=Aru7iD69MsYWtw6l5b5z5p1Ut9XbXbm7yjf+VGWKiu/HKrJ9dVN2pUCvu/XJ6vFfnf9H3knrWRThDT9aA+fTX6fTsfkFgHKofMOi4zOPNVl97xEFVhAQo4d1uYUdqine02cZq58Rmf5zJGrOji/oVAlZvLAm+2DnnYbKyRwd7F8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713157; c=relaxed/simple;
	bh=m/bVW0fp9fxPlfZr4j4N0SZ887OCoRO5TlqSSarOSKM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jw3JuvkeJUplpbmCHba9Drb8G0aEYoW3vL3zfa98UrUnIKnqYYm+TQz//Nl6LNgVj40kFpZgh9o4SRAYaUOh33cEqOjqN1FbU4lUKLi/TZIGt/76mg4cnERBlgnSVbN802lXwy8aLI/NwkFyp+jD69jWq3iiwU1m4cWGn6y/KAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=NztTJoxF; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=FKq97QPk; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="NztTJoxF";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="FKq97QPk"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TGJssd486747;
	Tue, 29 Sep 2026 15:19:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=AG9HuigJUQGaZdY0COUPT+GfVmYj5PTUy1CgGR8uL
	8U=; b=NztTJoxFSzSYCnJkI4myq8FVcojbtAMHRRDI39RS4/aVTR4O8SQlcLenu
	0Z9jgybItGA/wC9EwoUIjJdaT8NoAKkCRNDSuCBxMFYvobc8uQqafduUV4Ll0On9
	JsRZ7QwWjfol1V5jzvZbjOUE8giwfjfnCDBnTxHg/zYQrDQ23oU2R150iVstYx6F
	zk0Cz4r14HIwvzm2KfiSxByNQMfiqa33rMnlgsnZfCc/+Qx4GO6F5XBbMeeD1U+2
	WaD43h6LlDqe2uzeGBu61dMcLaDGHmDRU3uUlufgEA6jbMGxd3ktzrKDThxjS4M0
	8PGqfoG+N1LVeksTu9xmTrvm3iiyQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011026.outbound.protection.outlook.com [52.101.52.26])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0cpc3a1w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 15:18:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TY1DsRAeHAXN3/7yE9n9RMYIXv7JJJ1KQEyEafVyRn5hAqSDPqkOZMSMZNVobGr4ERArrdrLe/qxuOSSk/Y0UhyGS0CJb3hX12+fhrJ7ma2J8GO99sO94QWWXgXPQSvrmzlNBbfLf22iTEH9OmTHbAectjKRnzk78v8hJ8WILcy83akeYSpRtejVpoDwxwVvnA0Ix/+NH1EZfD7SQztvP1+1Y8z/dDNjJxUQz2cbN7KcIZd7yA7wRpw+IPWxcvYkzHFTBjF27xggDWhaZqK/X+Ffb03W/6Y9DrKY1x+XuQ7cC51vhdMRKupLABj9wUKkp9OpR1MZUu4PU50TzSv8YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AG9HuigJUQGaZdY0COUPT+GfVmYj5PTUy1CgGR8uL8U=;
 b=jvVybLWgwOWCg5izdW0KTFWjTGbmzigZD/6s43WLbplReWAc+OYMfHQe/1Gs+rm1q2AsuDGPHS/xAQzGQtLbMJ1OGfFZyMYWl7cVEkX8K5Vrcc3YYdLzavBXiCJ7a86gBn3W8laRYpaORkcOfAkzBgx9lMB/mIv+dCkch6DePNtGAyiP+xVoM3Zq/zQO9/mZ6J3c74h0Cr1u1ZTSG0TBPN58wbMgymZrYpNv2BXWY7wEqMZoduMsWfL8hiMvKfGEPFi3PI1B6FGgqgrIn0rITFvx5wr2njU129BHaUV9/pjgdgEKsOJlx6hXmeB/V45HLoSWubAXD3FZy/R6zq9Z+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AG9HuigJUQGaZdY0COUPT+GfVmYj5PTUy1CgGR8uL8U=;
 b=FKq97QPkLaCnpYyd1MlnXqt+Vi9bOAWkza3DZ83hxnVM4kR1dparamPVYkyfyEEmzyoHLj+hiLYfTq+gn2ggfYL4InSEac8+hVA3xSA3BL6NG7np5kTWFiPm7f3D72aAaIk4H1zlSkQd6O8IeoJ+dTxw3nUuUcX6wDmDEn63Nqk=
Received: from BN9PR03CA0397.namprd03.prod.outlook.com (2603:10b6:408:111::12)
 by SJ5PPF136884A98.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::78b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Tue, 29 Sep
 2026 20:18:55 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:408:111:cafe::64) by BN9PR03CA0397.outlook.office365.com
 (2603:10b6:408:111::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Tue,
 29 Sep 2026 20:18:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 20:18:54 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:40 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 15:18:40 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TKHlMo1688208;
	Tue, 29 Sep 2026 15:18:37 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH 16/22] firmware: ti_sci: Move the huge ti_sci file into its own directory
Date: Wed, 30 Sep 2026 01:47:40 +0530
Message-ID: <20260929201746.4078803-17-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929201746.4078803-1-b-padhi@ti.com>
References: <20260929201746.4078803-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|SJ5PPF136884A98:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d83476e-7e0f-4127-4535-08df1e66e253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|376014|30052699003|6133799003|22082099003|18002099003|3023799007|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	j0VnPNGJwFHkC9j66LcLvlV4V0Dxr+debbF/w/S3BQh9ctCFumUfgyqcmuXBuQMfrbuR3Op1oO3sNipgC71fAK40dUrl2HdFSSgRpmAFjkJfrCANAQqE89A9Idy1vffM265CDfBwaun9TOaNISk4RbKvG/FqflY89y2HKRpfXemlhHd5R+1GDHnzoqg/eM+8AFqAp1xHx9tfGbUHSnGVzft/gV3poMvg4QKkGNi3X9feRzas+eum1SxICXC3kxyloern0qYijnnRLHrzPzkL28CZQjV8+wPdqVpdrDV0SzUUpVPiVJDUmbogxVKt8MivvehXLSutp1L3O4FVF+XvOGiIwSPKIna+tVp09x8DxZE0UzqNu6QidVr1g9HAIuUBnbp+xvwVG6ThRVKC2CVG3l/f57yozhOQ/5f63vJD1VIGJsmh9x55UxjOGDVLHMH7iiDYd+eldsqyuIxPKNy2deAcgVt8lmMzq/j19mXveuYHHf3PTz3SMS36xMaUB+hEgxzFr81v4K6qWZc4HyqGKg4nQwh+uaXh3CB+TKPw/meRvmkcm4fUusi3rioC439Q/I1hWU2iSznhmrlYyLWbF6/cKmwx+sc7Pf8afMv2dTedHjcNQRipKCl8fkosdKYBqy+DMm3bAVyiQHLOoDweugIbo4i0t4Oucf3bdOzaL8yQGMhJEDlDxDeb6+GV1lLY0QfF7QS/aUQPYBff89xSwA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(376014)(30052699003)(6133799003)(22082099003)(18002099003)(3023799007)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AJ7uLEZK08ONHvcxzZEO8CzvDinUe+udhoxJPJbOJUVxJjVEiB6dvoxGziDZrwJhQQzXD4KNziyZQmg+fowUh+fu8kek7T9h07J63cmenXn/YOOjHisYDl2w2aYyXX3X2RjQSdKjN5VQBZO4bJadkpV6zRoI6CCg/uNXiRW0vMkONeK5r/fDSzUBQBt1M0K6dHGzhkVuEml8Qbbj3XIBUQrvefZaBi3OfyBAlaYqFqN0K54PohoBC1Ke41YWzxApdzCszH37MayeGmVfjWoE6v3IOH9ed1tst1L7FlIGhmoio5k6ei+p/IhU3oGlqX5k/uTZuaDrHACqt/BUz4AlW4Yez9+p45UrpuZNyITFDntQHyq9mj6ayJS173B1rMCG0yQn/x/dyh2Wt3g7AnPubz1Hz4tjFoCxFxS0UNsWIjNA/haU0XajPW6DuWqDHCGx
X-Exchange-RoutingPolicyChecked:
	HhQ6nJwRc3bEBLNQ1YmmL19pHDfLl2L0za3EqiM5L883ASSYpqCxVJsJmYKz4Xaus15xap994gICrf6MdGrUGEU2qGmIxztHpiMJ9EjJQ9TXeu5UWR5A/ESs/UyUKnYweJOLcWTkhZy15qAZWntfwUcqFw0Xq4GBTA/OIWKPlXW0ML4FrVohHkxX5OF0LCLeFs6bCDWE2bzxpNlwYWv9BNutYMMZmPNQG5oaAKDiMezvzRaMMB8Okf741A6m7kqmWuV4cxA3ndK1QZB9c2Rr8SsAoQspLpDLXAzHpsAemhK0zfd6cJB1ogGeeT3lqNyhsfsFCOO16I6FWXO16pcdig==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:18:54.1351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d83476e-7e0f-4127-4535-08df1e66e253
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF136884A98
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX35z6ymDEXlad
 UPPc6iEibYhQRii32p1CzSMZSsdtnR/vhr40ZGVlqsZrUWTDW6zoJfGsADvd4yLqL4ju3MM/FV2
 qJdNXjhVADRL5uyx+0IsB0tFPbkhFJY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX2jFvb3cgYnFK
 q+OMcSw4gVhQDCq93/4GwJU0kmKSEGk4CMDFWrhShdigootIfE10iZEOQkwIQwX6FGBo4HjtrEI
 2qDJGTc7qiC/NebBW741XuflcQzsDHs+CkvamEsVc2weXtSMxhxw4qKnLQd3GEeqOKyCRNGIiGH
 Kb2DHpKSekB0dBcSJZ0v33QUpezuHuZE6Egf6n+MRrncnCGUU/oPvdKXS72/v18nC/CnYB5V73Y
 quRv6Ybct/O2PWxK/S87mMfHFFTu4YOimBNg9D1UgKZq8Df+E8CvfLbF+erF2DFjvbnFCmTlw+7
 hUHCUFQVF50uG4d1tjHj8Twf8P4VsARTznEZvrpkVDsPM7WQoMlmSwf9aYL8O5qLyPmikIlhxW0
 dCOXDZ4zNnTgIobf5a6yiobcluiHI33ki3WufSihBxq73VtBRdYp0TtyGyxzrNfeD6T+foTOBQQ
 1gI+JevAMQqcF7fyFVQ==
X-Authority-Analysis: v=2.4 cv=Y4xtIReN c=1 sm=1 tr=0 ts=6abc1d33 cx=c_pps
 a=hWS9KTtKglmM4LJ/Q12dcg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=C_14pt-Im55hn5hAnpUA:9
X-Proofpoint-GUID: KnYkD1MVldnildDuICzU4wwexMA0p5KO
X-Proofpoint-ORIG-GUID: KnYkD1MVldnildDuICzU4wwexMA0p5KO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290080

From: Andrew Davis <afd@ti.com>

Move the huge ti_sci.c file and its header into its own "ti"
sub-directory. This allows for cleanups later where this file will be
broken down into smaller files tied to operations.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 MAINTAINERS                        |  2 +-
 drivers/firmware/Kconfig           | 17 +----------------
 drivers/firmware/Makefile          |  2 +-
 drivers/firmware/ti/Kconfig        | 17 +++++++++++++++++
 drivers/firmware/ti/Makefile       |  3 +++
 drivers/firmware/{ => ti}/ti_sci.c |  0
 drivers/firmware/{ => ti}/ti_sci.h |  0
 7 files changed, 23 insertions(+), 18 deletions(-)
 create mode 100644 drivers/firmware/ti/Kconfig
 create mode 100644 drivers/firmware/ti/Makefile
 rename drivers/firmware/{ => ti}/ti_sci.c (100%)
 rename drivers/firmware/{ => ti}/ti_sci.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2d137a3399408..0f0e4655f3cbd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27494,7 +27494,7 @@ F:	Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
 F:	Documentation/devicetree/bindings/reset/ti,sci-reset.yaml
 F:	Documentation/devicetree/bindings/soc/ti/sci-pm-domain.yaml
 F:	drivers/clk/keystone/sci-clk.c
-F:	drivers/firmware/ti_sci*
+F:	drivers/firmware/ti/*
 F:	drivers/irqchip/irq-ti-sci-inta.c
 F:	drivers/irqchip/irq-ti-sci-intr.c
 F:	drivers/reset/reset-ti-sci.c
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index c183d98c1e8f5..69cce12ae8651 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -233,22 +233,6 @@ config TH1520_AON_PROTOCOL
 	  the kernel through the Always-On protocol, using hardware mailbox as a medium.
 	  Say yes if you need such capabilities.
 
-config TI_SCI_PROTOCOL
-	tristate "TI System Control Interface (TISCI) Message Protocol"
-	depends on TI_MESSAGE_MANAGER
-	default ARCH_K3
-	help
-	  TI System Control Interface (TISCI) Message Protocol is used to manage
-	  compute systems such as ARM, DSP etc with the system controller in
-	  complex System on Chip(SoC) such as those found on certain keystone
-	  generation SoC from TI.
-
-	  System controller provides various facilities including power
-	  management function support.
-
-	  This protocol library is used by client drivers to use the features
-	  provided by the system controller.
-
 config TRUSTED_FOUNDATIONS
 	bool "Trusted Foundations secure monitor support"
 	depends on ARM && CPU_V7
@@ -309,6 +293,7 @@ source "drivers/firmware/qcom/Kconfig"
 source "drivers/firmware/samsung/Kconfig"
 source "drivers/firmware/smccc/Kconfig"
 source "drivers/firmware/tegra/Kconfig"
+source "drivers/firmware/ti/Kconfig"
 source "drivers/firmware/xilinx/Kconfig"
 source "drivers/firmware/arm_rmm/Kconfig"
 
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index a855d36961732..309145992ee5d 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -20,7 +20,6 @@ obj-$(CONFIG_FW_CFG_SYSFS)	+= qemu_fw_cfg.o
 obj-$(CONFIG_SYSFB)		+= sysfb.o
 obj-$(CONFIG_SYSFB_SIMPLEFB)	+= sysfb_simplefb.o
 obj-$(CONFIG_TH1520_AON_PROTOCOL) += thead,th1520-aon.o
-obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
 obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
 obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
 
@@ -38,5 +37,6 @@ obj-y				+= qcom/
 obj-y				+= samsung/
 obj-y				+= smccc/
 obj-y				+= tegra/
+obj-y				+= ti/
 obj-y				+= xilinx/
 obj-y				+= arm_rmm/
diff --git a/drivers/firmware/ti/Kconfig b/drivers/firmware/ti/Kconfig
new file mode 100644
index 0000000000000..07d7968f9cc8f
--- /dev/null
+++ b/drivers/firmware/ti/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config TI_SCI_PROTOCOL
+	tristate "TI System Control Interface (TISCI) Message Protocol"
+	depends on TI_MESSAGE_MANAGER
+	default ARCH_K3
+	help
+	  TI System Control Interface (TISCI) Message Protocol is used to manage
+	  compute systems such as ARM, DSP etc with the system controller in
+	  complex System on Chip(SoC) such as those found on certain keystone
+	  generation SoC from TI.
+
+	  System controller provides various facilities including power
+	  management function support.
+
+	  This protocol library is used by client drivers to use the features
+	  provided by the system controller.
diff --git a/drivers/firmware/ti/Makefile b/drivers/firmware/ti/Makefile
new file mode 100644
index 0000000000000..433b108782fbe
--- /dev/null
+++ b/drivers/firmware/ti/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti/ti_sci.c
similarity index 100%
rename from drivers/firmware/ti_sci.c
rename to drivers/firmware/ti/ti_sci.c
diff --git a/drivers/firmware/ti_sci.h b/drivers/firmware/ti/ti_sci.h
similarity index 100%
rename from drivers/firmware/ti_sci.h
rename to drivers/firmware/ti/ti_sci.h
-- 
2.34.1

