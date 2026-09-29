Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB53D3A4F58
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713156; cv=fail; b=obj/+TgqR3nTZXtvYS1rmfDnyR0Zyg+Np3ESPUe8FplJeuGW/i73T/Jc7WIXCiXE9e+yPe8J4mvG9Dea9aq34kKwoD+T/IA7UgsQTcMolq2hjKKY+wVw28jiS/XHegnXw8PQWSNBxwsRazbk2IONXOoAhjWFqxvKhkYvurYuSkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713156; c=relaxed/simple;
	bh=uHs6hOlT3T82ScGKSfu9RoRrycEW06pTnR+3ujJ4ht4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BxcVyZTquJRYQ53yG/eqHf2R4WBSOO8wtKg/Q4TUVqrmDc4zsq6R+C5GsHvWkDIOVxdlHBF0LWiT/llgv/7GfkmsI41Qp582nk6KPvc1/9ARHAMWZAEq/z3ZG8IxXTNZzfX19WJ5fk8F9Nn6nEHhtNgkOPqvgxtvapsIz/vhv+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=WNoHSHWW; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=oBpHZaKa; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="WNoHSHWW";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="oBpHZaKa"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68TFkcwM152307;
	Tue, 29 Sep 2026 15:19:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=PjqNmhMXeYfrxc5jgiKL28kVrJDVBOqD0DBs79oNE
	Ys=; b=WNoHSHWWQb1M8wYlzyEz/6Szrox6iKrAFGaDfouFpLuKSMXxww3L4G6sN
	nwrxq6NVUHJSftSKvqucVyijHxWYQdysqxwme4KTJixpuDRMLA74MpeM7apQT7Jh
	kVZ4IrAMkWU+uah0sDeKoyL/T1pDs17HV/R6H0ypks7D3RA2dziL0Q5z+yy0uOwB
	/oIVxFGIeg2ZPLDjzave0r1bOCFAwlG76H2vzbfaYoHMSOfulc9epSOzD0oGnm5P
	Qc4AExe/Fmu2wbcCvJjUVDtLpI2cFUt5hN7BoTFfkBg5QJJhDzjmeqW5Drkx8KtO
	IdhywixgTB6wb1+4jA/mcYa6FF/qw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010064.outbound.protection.outlook.com [52.101.193.64])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h099y45jy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 15:19:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/2Iy7qEEvXM3j5ZJL6gIJpLvWhXNdH13whP6pojUJ7AxEyoFSpveiX+5axd1kXmKlaKHytnSTFgSKossjVIXEfCe/vO99yLr1a9bf1sx7sbuB8QBrrZwbSjQPAGfRqs4QwX48hl2EgsMFeVfrUEOUo0nZxcREwLkDfULbUNhf7QLC8dhJYWdHUgXsCcA4KPqFcOHKApqXpR2Y7VybDSdyIgxnDxboNRe15Sc0a0VA4qVC9NQhBj+l3vMj0bN3NVulHwg/vqu4ZMTN1stDh7aayMsBs2eoGzx/vcHIWHwlTb7EUkfSAidwaUjnSVVDCT0lXdSi4e0BIi/5C+PY3pNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjqNmhMXeYfrxc5jgiKL28kVrJDVBOqD0DBs79oNEYs=;
 b=MIzRNZ9HmUAtB0kAz2cyvp0By2bHwbFnkxM+iLcqPJsSF8uszFpzIGfbhexhTg1nySsmanDGWdRgGD89eAy1/+622/yaw/lmQUSO2OoLd+QTRKwJciZO1nET/JNiGgquSmYhNSla3lIZ1hEYJUR0faQeiG63ZrP4/pQ/IiC33lxU4x6Zv9nWvXm+/KKQQ5uh925e8nQ5fX3TBQJVO8uYqrHDVRijNRNiD0X3CWYT4Tu+4SBt8om1S5YngfYMw8VYZaV7LXWhqGc7XOQjUtlDBqR0Jhxntbg8yfZne7mrqi1AubLPKmu1WHyIi6Pb13oi2EAJfhbi5qAgQXEQfEzRgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjqNmhMXeYfrxc5jgiKL28kVrJDVBOqD0DBs79oNEYs=;
 b=oBpHZaKaafua0OypX75jd42hbXD7h4GzRxkC3L0nGRClfhjuqcWKST4V1bV2ub6b0QXNwj0qT2MY/5MXEOzGXu9lYKKqRdb7IYdNStRo4q4KQjhHPxuyw+HGQrQSGCN0y+ftm2yT8GXaAXhfKr1gqakLVmZbiMcdtNsxFGeS7KA=
Received: from BN9PR03CA0419.namprd03.prod.outlook.com (2603:10b6:408:111::34)
 by CC6PR10MB231600.namprd10.prod.outlook.com (2603:10b6:170:203::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Tue, 29 Sep
 2026 20:18:57 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:408:111:cafe::9) by BN9PR03CA0419.outlook.office365.com
 (2603:10b6:408:111::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Tue,
 29 Sep 2026 20:18:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 20:18:57 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:43 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 15:18:43 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TKHlMp1688208;
	Tue, 29 Sep 2026 15:18:40 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH 17/22] firmware: ti: ti_sci: Add missing includes for self-contained headers
Date: Wed, 30 Sep 2026 01:47:41 +0530
Message-ID: <20260929201746.4078803-18-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|CC6PR10MB231600:EE_
X-MS-Office365-Filtering-Correlation-Id: 93614726-e902-4723-b904-08df1e66e460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|18002099003|22082099003|3023799007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	5BygGLFGUyI4APQcHT/M55QkGZbKTB1Pt6p6iJZlJdDcFIN5alNUwnCJ681vegEnDIKtTGgVidQIuSF8ezKvJuYzYFL4aCw55OlrqTuhMN9axIF1blvGbwGQDoMA+mRmmMsz3gEY/DweyJv9QaP2bffdlE45ti2QjoMfBktEaMU0mj1M1T/SaxG6pbdWmou5GoZAHtCla3Kz4ZrpYwtBEaH4rqSzUVoyqvdznsrusRdw5gCIDGnvjb4EOjDEqWRoiih+ikv33r7RTkyO6qw8rJ/HuAZGS5u4LDQkmRDckw/UyGYXL1Z2BLFgeN+zGw9SBhBiD+RmFNG65uoJGlLPr7B9+nKeiB2fd0GVzBjqPz0hPV0dw/niwULU123Y47codh8jo6EAmvPWF/1UbCF60Ti2uUcG2jAm2GievB5uFJ5uDmJ852FxgJNNCfBijthyKuIcXMlFPzoI9qWIJjJIkVX7qhftHfA/iHi9kaH72JsRTN0gx0B4xneJ7yKhHG594WImrk51mvSutQlaGIFfwjS3O3eR9zESYp0WKricQVaTyz3alijSSHhYJ2c/eG2rs/A6+XVoALLB2MgdVRdT2OXRbtLJ03V7n+a2fOcUFct2h02k1amNvgmUD1fUUUvHML6ht1mjVeuBnKEghTJT8NAbbslvt/Pl+02kpGnsR1KOAOyrr1u6C9+3eRLMkHtoLWGxra7IXI6zkZ18bSK2bg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7btm5eJsOk/vha+zd+COXWI6ogO71lNc3xBGqNpGPngcpuI3ZPQoOvWAG/auS2aLz9x/rVqOLb0XRzcn4wLgOQBO5FVdifKfpsoajDd4ysVsFzaWepuupEhV5Be5TZhnFGIqQu62ljU5TIeMX+Pmv0CjcczZhazuZlQGQvEITqBfwiS4Qhpym+ti5YhXa1LDNZkovDhngou7rwECHxJCLsQWk7BVYwOJ1yppSQw+iXMfb4asRI7/nVkTaTERZtDjQjGxmx7gLVbow7K9+OM/ZHydXB3BZXDNAS06Di8LDPgtRJa45jH/jOh5IutCB41Y6YO8KY2W+MQCyhW4URA80tbACqTKYGFO3dEX7VDUTNfdA145f/KA/WgMzbDk39XleTa9lgEQgegyiR8kWMf8m02sJvSFUmDzniJ2wMehw6Ioit9B1Lxy0/JHwekDwl1n
X-Exchange-RoutingPolicyChecked:
	2yutSrklNK6bdtZzeBtyw4/1NXKosD3y1jUfzYWfBa46xjmbu056oRraZEc1/3qfVTMKAzr/beqkHHYScaQh79QXTJBBN91CKfWOSaWQmM+dvZpd9ABzMFjPrVXI+drFmBIVTVJxVMcgi1zW+XuMGLghOCahecbnaobSsKSjGohIWtOQ2acvY+pucsVeUa0Jv7KYgWfeONVla6YmqdFGTr44o8nEcHus7YotbS5gAu55qxTjeR/3ayCQmQb+Z4JYl2p8h9xrLC4g33s8VaTZA4yp4d444kJy5pIEqTQS6Zn3vRgSnbMdGmKuisHgcPIuJbToNhivAX+Ym2U5B9QOIw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:18:57.5701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93614726-e902-4723-b904-08df1e66e460
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CC6PR10MB231600
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX6TptR5JOUtSm
 eWuDXbdLN1rxFt6+56BT2T5h+ivK2H4u23XJdSkHbUbn+S5UNWMq85YWGJArwPJYsQyTxYJcFZW
 jdM5fGXuV/nuHASaZFXY9VuCCI1PvTMfwIiq4r/DYVLDL2hhg4dgoAOtci5a9wxjyDFxHaaiZ46
 Xr9sWKZ4IuJYGPIUPJ64DnnARI+pIVL+9bkM98tFkQR0i+UWLOpCD5XmhDggK9jlidP2EI14rdp
 GVdgkscOntfs8ZUZ2QeXq7zVTceCNRUCaTyzUnZAwd76qOHKDRxWHAoXUehjOYzvMcnbp/6lepd
 eSHxHoobhBLTE57aqJsfl6j4MvBFPbv+qw1uxJ0zyDo3vv0rk0xaNVxbgZF7DXbNiK1Qjj7ihZU
 RgWeTh5pnDcoJz1l6KxZqqLohlXV5awlDCr0hJtEfj+QOb9DEmuUIgRCp3Shx2KUBNPxyx76+cq
 Mwd+je13S18l6wYSy9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX5f8Z4XaLv8Yc
 rODI/34YgPFJPi4yjuqaAkmSkk8QO/yCaxNI+1WGeOX3YkLsBqaONnA1dIUfaPZZoTJ1jsRCj05
 xWl65qZo+2IAecJhckgqAiBQRq2skzQ=
X-Authority-Analysis: v=2.4 cv=GdGCDgXL c=1 sm=1 tr=0 ts=6abc1d35 cx=c_pps
 a=z9epfWMNo9LgPPq3nTJR4w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=qxQJPro2LbhhYBg5XAAA:9
X-Proofpoint-GUID: vOubTHk3T3-8j1C98plFdz48Th_zfT2g
X-Proofpoint-ORIG-GUID: vOubTHk3T3-8j1C98plFdz48Th_zfT2g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290080

From: Andrew Davis <afd@ti.com>

ti_sci.h and ti_sci_protocol.h do not directly include the headers that
define the types and helpers they use. They currently build only because
every file that includes them happens to also pull in
linux/mailbox_client.h or similar headers first, which transitively
provide these definitions.

Make both headers self-contained by adding the missing includes, so
that they no longer depend on include order or on other headers
being pulled in first. This is needed ahead of the following commits,
which split ti_sci.c into several new source files that will include
ti_sci.h directly.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/firmware/ti/ti_sci.h           | 3 +++
 include/linux/soc/ti/ti_sci_protocol.h | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/firmware/ti/ti_sci.h b/drivers/firmware/ti/ti_sci.h
index 34f7848073a0e..f2f17bcac39e4 100644
--- a/drivers/firmware/ti/ti_sci.h
+++ b/drivers/firmware/ti/ti_sci.h
@@ -12,6 +12,9 @@
 #ifndef __TI_SCI_H
 #define __TI_SCI_H
 
+#include <linux/compiler_types.h>
+#include <linux/types.h>
+
 /* Generic Messages */
 #define TI_SCI_MSG_ENABLE_WDT	0x0000
 #define TI_SCI_MSG_WAKE_RESET	0x0001
diff --git a/include/linux/soc/ti/ti_sci_protocol.h b/include/linux/soc/ti/ti_sci_protocol.h
index d8efddc1d4ca4..c7bcd9562a71a 100644
--- a/include/linux/soc/ti/ti_sci_protocol.h
+++ b/include/linux/soc/ti/ti_sci_protocol.h
@@ -9,6 +9,11 @@
 #ifndef __TISCI_PROTOCOL_H
 #define __TISCI_PROTOCOL_H
 
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/types.h>
+#include <linux/spinlock.h>
+
 /**
  * struct ti_sci_version_info - version information structure
  * @abi_major:	Major ABI version. Change here implies risk of backward
-- 
2.34.1

