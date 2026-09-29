Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CE556E048
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713187; cv=fail; b=fE24hijVxyHbYmPkaZpsKg6xs+RP/gADsKHYxin/aWW01y1imA9N4Yt/bie2RKVdvSzwHKCgXhGy2set5KNiM+u4rsF1FMrAZMjXPdqtOLSsbihd5Ewkah5VlVaGygd3CQMrvf3OXUisRvDCevfJEgyWH0nCLuHVVloi9DffSp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713187; c=relaxed/simple;
	bh=AlPZDBS0xrNWupKuSlleX47lAW/CBGfHwzgNcIKT7hM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FgIylD3RLS61WDxNUFrrPwlpnfcDyI4Qny+AI4airL3j/CFImtELh87Fr+chfQ1jcn9KZAWeVx1e9DvhLdZiRjhd7Y4OH6ni4FT9dqHQZxsOf7tV0i0/AT+QM5siA8eEz1PHh9emZ+63AGU6v4KujUedx50XCnpP1+22P+cdS28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=AR97SQQA; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=LM/XFkk3; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="AR97SQQA";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="LM/XFkk3"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68TFiDuB152296;
	Tue, 29 Sep 2026 15:19:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=fGrIDBAh+z3AyDcYrUaqkdnkpG2o1REee0rnpQU95
	/Q=; b=AR97SQQAHA8WCFQHqZGnSmYYRyOcBdRft9Gkv51FIxbVnT7Sr1pycnxhL
	dcSGpVNp4wXuvAU3D4j6Xjg3I2kuPI1FoqiNy2ddS3RpdLYsAPms4p1AdO8ydDZm
	jCiBS7XgnFe4ZsQJMySA3lbmKoACe3HXHo9RY89SgArlEQI1oA1gJ135ErZWTzce
	YJO/kirDfHosHw1luK/uO+SY9Vo61FRUMMv7QEmWCDsmjGKafTWsiLBOZfbbJldi
	k26CUJHxeVsrSntCay9I7cqrHYgRB607gEYV4QQ2OfverO8ESvKQV3K8UJeiWXgU
	I6qd9Uh0UpIXpLEzRlx91/9pbWCZQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013036.outbound.protection.outlook.com [40.107.201.36])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h099y45mr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 15:19:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZwKgzh3/oxQw/pKiKoLuZ//DgrC57Z+jk1EGCr2micCzFiYa3mGHKSZGm2+8rqt8YtgyCkyj2cwHwggZgrIqhzlX6ebcHRewZ6PQT4vcM8jSY10JcJSMiM3rCcmfESxOUuxd+x3P0UnNCMuWAW2A0z1m3aKk92q6RhLpwqqQyEeVKEW+P2fP2Ug+AQgrjDhHzQAkdhZnuNZhBMa9WybyMyPpfhuxgyAN95npSG7e8KG+oFivcbVaKnhtc/XGYEEppU48d7RB+SkU2+FfQhWBGi1qWuHAkBPBSDMR8BggFUxw9p+OgpV4+spQpOYgPN0Kp5JQ4MdibsBx3HnlSef0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGrIDBAh+z3AyDcYrUaqkdnkpG2o1REee0rnpQU95/Q=;
 b=DHLCI8MhFKyydjeKws9vG49UImoQdPWhtIpufl5kR0v8ccZR3PcAOaFVZ6a3LBcWCC1IRI4px/KUgtnNO5Pu2TVUrykVMQyXvEAyTcZI+cCAeUW993/40soX/kdKKfTkAeV9piivPYogW8sRF9GqW8qvWmaUJyiYRHTOjzL+LuIKi9UNW+CN4SbaKI+tNalMDtktx/Ur4eE/OUrbwt872S9K/2JFUcW7THGB9X7sI/iOk8WLYny+s74j39zMagtY1owB2xDq0acOQQFrz24hUh8JakP1jGkEF46UDo2fnAOhads/FXAyFO5DX5QWn70tqGAXxBLoCLGK8vXxMDmD5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGrIDBAh+z3AyDcYrUaqkdnkpG2o1REee0rnpQU95/Q=;
 b=LM/XFkk3CXVBypONuifslWmSgwnR+mT/MkkqMbelF7tXBJzTw8/jf5/anuCOsxfZhJz8bMaSRFCjKQbFOQs/1DmvYFI6WppRroqWf/eo7px9wFjsi0/ThXG3rdLtQcoN9LUzjumT7vAfQtT+QzEvnVe83DkCMPUpyiglW91TkkY=
Received: from DS7PR03CA0228.namprd03.prod.outlook.com (2603:10b6:5:3ba::23)
 by DM6PR10MB4268.namprd10.prod.outlook.com (2603:10b6:5:220::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Tue, 29 Sep
 2026 20:19:17 +0000
Received: from DS2PEPF000061C6.namprd02.prod.outlook.com
 (2603:10b6:5:3ba:cafe::6e) by DS7PR03CA0228.outlook.office365.com
 (2603:10b6:5:3ba::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Tue,
 29 Sep 2026 20:19:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF000061C6.mail.protection.outlook.com (10.167.23.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 20:19:15 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:49 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 15:18:49 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TKHlMr1688208;
	Tue, 29 Sep 2026 15:18:46 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH 19/22] firmware: ti: ti_sci_clock: Move clock ops into its own file
Date: Wed, 30 Sep 2026 01:47:43 +0530
Message-ID: <20260929201746.4078803-20-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C6:EE_|DM6PR10MB4268:EE_
X-MS-Office365-Filtering-Correlation-Id: b6fb034d-03e5-40ac-9881-08df1e66ef18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|10067099003|56012099006|3023799007|6133799003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	pErdU96tkDJrY3/vxvgyxfNKPZwHt4Pxx9J6kSO27kRdC3LLpy8toFRS6iNB4zz6b/MzWiB5Do08Xna7FeaEKWjtowFpzA7ByZBK46ZIJpCy+Fnk63j/OjxRtnLvCTQQAmOuKInDb3Ru8ye8Mz5+yYMi+EmI3b7oozXAWJTuv26+vgnriM+HfnE71GIOjH9C+IEhtGBxk0IvDJGcYiyfZbbjOFphdecTAwJaIhdk0Wz0QrJ6/Mu30RS51dy7hBPpDIX9Bzfe63wGCZSqLlT4c3A+P/iLDSJtGweQ0WpGLIw19jsJknHtsC8DQAbcbD2se+NRf7J6i2UT99CiJ0k3qUp7dd9UmmJSq1wXE41wF+cEoorsGDymJQSvDVpK6hcOYd8XQjFt1UjZ727hot+kr6czfD3mFbmFbzQSBf2vnn3t6nFTuXRU5gDAtA+1lf68GY/GvnC/V27in1Byguq+GQwJIPEAyNMB1dTZpYAUbk9QMIxsDf8aGFoYhk0Yk7N0lhd+QOr24VENYZi7oaP4vkM3QboTODXF0VnNJm/WKACtdyrTwBMm9mWwfJV0NPZqQbWeitklRvgqxKg8cDoFEQ42Br5TkNl6GiKckgilo+3Vo9pEfUmyY6+R8lLIEPA++xrx2yUWAv8KoK2bF/oVDg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(10067099003)(56012099006)(3023799007)(6133799003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PMqCSlSA+d28c0LRrkHDPC+/o7NjMvlD6CkJxOAGHucbcMmhDOtx0br4e7JlyUjTLnS3QEYVm8kJFoPt9al2G1XYmyJefeTu8rN+Eftp4Q9mHtldP3c7OB6KUqHQbaf7Dmf5WRuJTLWmW0Vf7kjLTSGd1bO2kq3bvxx2MGtfwCdKTsQTB/Rc6IObSP448/dUfx3y/jyT725OJuBcasPnoSzbng8FlIE+5r1VEPV83oluJOevMnmmQ5ZTlCxuR/A0nCZAQVVQ4zVvEkScXoh3vt7LGtOew7VqwzDIM1ZhUAOgJchLUR7l67gYXbYsUUYc2xQ6K4H3ePee0WmAKhVqTi9jQq6AhitvGJBhAzXgBzP/B7jRdH+MWxZBrW78mBuSoJNn+fjfno9/5bxYiftxETHbs7P9dFqawOkBiGuR7mYFdialXHv0BnNmiWG/GOsV
X-Exchange-RoutingPolicyChecked:
	tkgUIF9Ee1dfWjYUzrsrK1cz0amxpyEUMb3spuRkb79omrT8pGHqWdNS2nzOG66T6ncek2CdoVJ+wIuoEqEQwuobHjP7f7aPC4tPmvddh+GY9hiq/2DzmgO7rgEEAIaPvyIt5JwyaLgsm35pqObrrROkTm5RcHZtK82V+v6KLk3qhLxR6EYlLFwM9pNOv9cpSwp7sEEDvk8bPJ5trG8NwnuCQL43Cw+qXTL31A6jLtCZBrQX3Q35DkMJNm+mpTtCQPSvdGl6x7GjOeQh1HzGyEhElZ2QNSZNiGkFPPgk2q9MztigLesgV/bvBaGuXf9Ho3Zpk6SEnEuMm09u8ykQ1g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:19:15.5821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6fb034d-03e5-40ac-9881-08df1e66ef18
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4268
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX9DTsTBUm9wQM
 0NedXQjQ3womdMuo87IpnHa0mdPiixJ1ZwZdMNyg3ijoKLwIFLZD6ljcSddgpXISrivkr90MWtE
 N2GT6gzCUSf7N/0hHtoMDQRw9E2PCfadcmjXhn8Z7V7CtccBcD1WvnpwRyyShF5WBf/3L6i5NqY
 +nBpQldAcEcqn3nk8qumLTCk6UAWsvyAQE6sj0zX9IOuP+38LiNsuDfQHknNNDONP+4X71Shaya
 SJ8ZZ8LsiOJQz673IlUvDDfUpXceqpORcgkXxEJK2B228f6HBJRiERwytoeozE8JNd4SCKe8iFX
 1/f5bBaOqsmNcTTlvJj+JYkakwUQliYJ8BusfDOZEC4ouPQrY53SKeDnU6rieZSUp6xYjBb18BI
 K0ol2TpX7/fmapw1ILgMcZAnZgqWI6KQPI/mTsCXFoHkdtjkB/DQnhHOcMVqG50Vt1chqQTs2F5
 iYupkGvxzmN2MBl85ow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX4YAd769jgRDG
 aShDNr7QyMkRLpstfIngwEYtKjWjkohumt6yMY4KepHpR8Wk/DQa+fGefZfW3Q1aeFolTFry33k
 +2zz2bHFthRySGLV/ivo3sN2BhD/vtk=
X-Authority-Analysis: v=2.4 cv=GdGCDgXL c=1 sm=1 tr=0 ts=6abc1d4b cx=c_pps
 a=0RQO2klDQ5fyV1VIsLBujQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=myWusNq7Z1Ndx3JLH8AA:9 a=gmi4-QQ1WP2ud0j2:21
X-Proofpoint-GUID: NKMB60krV4UhrLZ61lPMjhXMCoXCXbzk
X-Proofpoint-ORIG-GUID: NKMB60krV4UhrLZ61lPMjhXMCoXCXbzk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290080

From: Andrew Davis <afd@ti.com>

Extract the clock operations related functions and services from
ti_sci_core.c into its own file. This breaks down the single large
file into smaller logical files for better readability and maintenance.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/firmware/ti/Makefile       |   1 +
 drivers/firmware/ti/ti_sci.h       |   1 +
 drivers/firmware/ti/ti_sci_clock.c | 553 +++++++++++++++++++++++++++++
 drivers/firmware/ti/ti_sci_core.c  | 535 +---------------------------
 4 files changed, 556 insertions(+), 534 deletions(-)
 create mode 100644 drivers/firmware/ti/ti_sci_clock.c

diff --git a/drivers/firmware/ti/Makefile b/drivers/firmware/ti/Makefile
index a3a056eedd9a5..c4233542ad57d 100644
--- a/drivers/firmware/ti/Makefile
+++ b/drivers/firmware/ti/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 ti_sci-y			:= ti_sci_core.o
+ti_sci-y			+= ti_sci_clock.o
 ti_sci-y			+= ti_sci_device.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
diff --git a/drivers/firmware/ti/ti_sci.h b/drivers/firmware/ti/ti_sci.h
index 79f56699faf29..cce59cac35ed6 100644
--- a/drivers/firmware/ti/ti_sci.h
+++ b/drivers/firmware/ti/ti_sci.h
@@ -1566,5 +1566,6 @@ int ti_sci_do_xfer(const struct ti_sci_handle *handle,
 		   void *rx_message, size_t rx_message_size);
 
 void ti_sci_setup_device_ops(struct ti_sci_dev_ops *dops);
+void ti_sci_setup_clock_ops(struct ti_sci_clk_ops *cops);
 
 #endif /* __TI_SCI_H */
diff --git a/drivers/firmware/ti/ti_sci_clock.c b/drivers/firmware/ti/ti_sci_clock.c
new file mode 100644
index 0000000000000..f266522fb7d08
--- /dev/null
+++ b/drivers/firmware/ti/ti_sci_clock.c
@@ -0,0 +1,553 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Texas Instruments System Control Interface Protocol Driver
+ *
+ * Copyright (C) 2015-2026 Texas Instruments Incorporated - https://www.ti.com/
+ *	Nishanth Menon
+ */
+
+#include <linux/errno.h>
+#include <linux/soc/ti/ti_sci_protocol.h>
+
+#include "ti_sci.h"
+
+/**
+ * ti_sci_set_clock_state() - Set clock state helper
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @flags:	Header flags as needed
+ * @state:	State to request for the clock.
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
+				  u32 dev_id, u32 clk_id,
+				  u32 flags, u8 state)
+{
+	struct ti_sci_msg_req_set_clock_state req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.dev_id = dev_id;
+	if (clk_id < 255) {
+		req.clk_id = clk_id;
+	} else {
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
+	}
+	req.request_state = state;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_STATE,
+			     flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_get_clock_state() - Get clock state helper
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @programmed_state:	State requested for clock to move to
+ * @current_state:	State that the clock is currently in
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
+				      u32 dev_id, u32 clk_id,
+				      u8 *programmed_state, u8 *current_state)
+{
+	struct ti_sci_msg_req_get_clock_state req;
+	struct ti_sci_msg_resp_get_clock_state resp;
+	int ret = 0;
+
+	if (!programmed_state && !current_state)
+		return -EINVAL;
+
+	req.dev_id = dev_id;
+	if (clk_id < 255) {
+		req.clk_id = clk_id;
+	} else {
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
+	}
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_STATE,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	if (programmed_state)
+		*programmed_state = resp.programmed_state;
+	if (current_state)
+		*current_state = resp.current_state;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_get_clock() - Get control of a clock from TI SCI
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @needs_ssc: 'true' if Spread Spectrum clock is desired, else 'false'
+ * @can_change_freq: 'true' if frequency change is desired, else 'false'
+ * @enable_input_term: 'true' if input termination is desired, else 'false'
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_get_clock(const struct ti_sci_handle *handle, u32 dev_id,
+				u32 clk_id, bool needs_ssc,
+				bool can_change_freq, bool enable_input_term)
+{
+	u32 flags = 0;
+
+	flags |= needs_ssc ? MSG_FLAG_CLOCK_ALLOW_SSC : 0;
+	flags |= can_change_freq ? MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE : 0;
+	flags |= enable_input_term ? MSG_FLAG_CLOCK_INPUT_TERM : 0;
+
+	return ti_sci_set_clock_state(handle, dev_id, clk_id, flags,
+				      MSG_CLOCK_SW_STATE_REQ);
+}
+
+/**
+ * ti_sci_cmd_idle_clock() - Idle a clock which is in our control
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ *
+ * NOTE: This clock must have been requested by get_clock previously.
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_idle_clock(const struct ti_sci_handle *handle,
+				 u32 dev_id, u32 clk_id)
+{
+	return ti_sci_set_clock_state(handle, dev_id, clk_id,
+				      MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE,
+				      MSG_CLOCK_SW_STATE_UNREQ);
+}
+
+/**
+ * ti_sci_cmd_put_clock() - Release a clock from our control back to TISCI
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ *
+ * NOTE: This clock must have been requested by get_clock previously.
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_put_clock(const struct ti_sci_handle *handle,
+				u32 dev_id, u32 clk_id)
+{
+	return ti_sci_set_clock_state(handle, dev_id, clk_id,
+				      MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE,
+				      MSG_CLOCK_SW_STATE_AUTO);
+}
+
+/**
+ * ti_sci_cmd_clk_is_auto() - Is the clock being auto managed
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @req_state: state indicating if the clock is auto managed
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_is_auto(const struct ti_sci_handle *handle,
+				  u32 dev_id, u32 clk_id, bool *req_state)
+{
+	u8 state = 0;
+	int ret;
+
+	if (!req_state)
+		return -EINVAL;
+
+	ret = ti_sci_cmd_get_clock_state(handle, dev_id, clk_id, &state, NULL);
+	if (ret)
+		return ret;
+
+	*req_state = (state == MSG_CLOCK_SW_STATE_AUTO);
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_clk_is_on() - Is the clock ON
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @req_state: state indicating if the clock is managed by us and enabled
+ * @curr_state: state indicating if the clock is ready for operation
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_is_on(const struct ti_sci_handle *handle, u32 dev_id,
+				u32 clk_id, bool *req_state, bool *curr_state)
+{
+	u8 c_state = 0, r_state = 0;
+	int ret;
+
+	if (!req_state && !curr_state)
+		return -EINVAL;
+
+	ret = ti_sci_cmd_get_clock_state(handle, dev_id, clk_id,
+					 &r_state, &c_state);
+	if (ret)
+		return ret;
+
+	if (req_state)
+		*req_state = (r_state == MSG_CLOCK_SW_STATE_REQ);
+	if (curr_state)
+		*curr_state = (c_state == MSG_CLOCK_HW_STATE_READY);
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_clk_is_off() - Is the clock OFF
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @req_state: state indicating if the clock is managed by us and disabled
+ * @curr_state: state indicating if the clock is NOT ready for operation
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_is_off(const struct ti_sci_handle *handle, u32 dev_id,
+				 u32 clk_id, bool *req_state, bool *curr_state)
+{
+	u8 c_state = 0, r_state = 0;
+	int ret;
+
+	if (!req_state && !curr_state)
+		return -EINVAL;
+
+	ret = ti_sci_cmd_get_clock_state(handle, dev_id, clk_id,
+					 &r_state, &c_state);
+	if (ret)
+		return ret;
+
+	if (req_state)
+		*req_state = (r_state == MSG_CLOCK_SW_STATE_UNREQ);
+	if (curr_state)
+		*curr_state = (c_state == MSG_CLOCK_HW_STATE_NOT_READY);
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_clk_set_parent() - Set the clock source of a specific device clock
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @parent_id:	Parent clock identifier to set
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
+				     u32 dev_id, u32 clk_id, u32 parent_id)
+{
+	struct ti_sci_msg_req_set_clock_parent req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.dev_id = dev_id;
+	if (clk_id < 255) {
+		req.clk_id = clk_id;
+	} else {
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
+	}
+	if (parent_id < 255) {
+		req.parent_id = parent_id;
+	} else {
+		req.parent_id = 255;
+		req.parent_id_32 = parent_id;
+	}
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_PARENT,
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
+ * ti_sci_cmd_clk_get_parent() - Get current parent clock source
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @parent_id:	Current clock parent
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
+				     u32 dev_id, u32 clk_id, u32 *parent_id)
+{
+	struct ti_sci_msg_req_get_clock_parent req;
+	struct ti_sci_msg_resp_get_clock_parent resp;
+	int ret = 0;
+
+	if (!parent_id)
+		return -EINVAL;
+
+	req.dev_id = dev_id;
+	if (clk_id < 255) {
+		req.clk_id = clk_id;
+	} else {
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
+	}
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_PARENT,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	if (resp.parent_id < 255)
+		*parent_id = resp.parent_id;
+	else
+		*parent_id = resp.parent_id_32;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_clk_get_num_parents() - Get num parents of the current clk source
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @num_parents: Returns he number of parents to the current clock.
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
+					  u32 dev_id, u32 clk_id,
+					  u32 *num_parents)
+{
+	struct ti_sci_msg_req_get_clock_num_parents req;
+	struct ti_sci_msg_resp_get_clock_num_parents resp;
+	int ret = 0;
+
+	if (!num_parents)
+		return -EINVAL;
+
+	req.dev_id = dev_id;
+	if (clk_id < 255) {
+		req.clk_id = clk_id;
+	} else {
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
+	}
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_NUM_CLOCK_PARENTS,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	if (resp.num_parents < 255)
+		*num_parents = resp.num_parents;
+	else
+		*num_parents = resp.num_parents_32;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_clk_get_match_freq() - Find a good match for frequency
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @min_freq:	The minimum allowable frequency in Hz. This is the minimum
+ *		allowable programmed frequency and does not account for clock
+ *		tolerances and jitter.
+ * @target_freq: The target clock frequency in Hz. A frequency will be
+ *		processed as close to this target frequency as possible.
+ * @max_freq:	The maximum allowable frequency in Hz. This is the maximum
+ *		allowable programmed frequency and does not account for clock
+ *		tolerances and jitter.
+ * @match_freq:	Frequency match in Hz response.
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
+					 u32 dev_id, u32 clk_id, u64 min_freq,
+					 u64 target_freq, u64 max_freq,
+					 u64 *match_freq)
+{
+	struct ti_sci_msg_req_query_clock_freq req;
+	struct ti_sci_msg_resp_query_clock_freq resp;
+	int ret = 0;
+
+	if (!match_freq)
+		return -EINVAL;
+
+	req.dev_id = dev_id;
+	if (clk_id < 255) {
+		req.clk_id = clk_id;
+	} else {
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
+	}
+	req.min_freq_hz = min_freq;
+	req.target_freq_hz = target_freq;
+	req.max_freq_hz = max_freq;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_QUERY_CLOCK_FREQ,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	*match_freq = resp.freq_hz;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_clk_set_freq() - Set a frequency for clock
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @min_freq:	The minimum allowable frequency in Hz. This is the minimum
+ *		allowable programmed frequency and does not account for clock
+ *		tolerances and jitter.
+ * @target_freq: The target clock frequency in Hz. A frequency will be
+ *		processed as close to this target frequency as possible.
+ * @max_freq:	The maximum allowable frequency in Hz. This is the maximum
+ *		allowable programmed frequency and does not account for clock
+ *		tolerances and jitter.
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
+				   u32 dev_id, u32 clk_id, u64 min_freq,
+				   u64 target_freq, u64 max_freq)
+{
+	struct ti_sci_msg_req_set_clock_freq req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.dev_id = dev_id;
+	if (clk_id < 255) {
+		req.clk_id = clk_id;
+	} else {
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
+	}
+	req.min_freq_hz = min_freq;
+	req.target_freq_hz = target_freq;
+	req.max_freq_hz = max_freq;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_FREQ,
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
+ * ti_sci_cmd_clk_get_freq() - Get current frequency
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @freq:	Currently frequency in Hz
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
+				   u32 dev_id, u32 clk_id, u64 *freq)
+{
+	struct ti_sci_msg_req_get_clock_freq req;
+	struct ti_sci_msg_resp_get_clock_freq resp;
+	int ret = 0;
+
+	if (!freq)
+		return -EINVAL;
+
+	req.dev_id = dev_id;
+	if (clk_id < 255) {
+		req.clk_id = clk_id;
+	} else {
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
+	}
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_FREQ,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	*freq = resp.freq_hz;
+
+	return 0;
+}
+
+/*
+ * ti_sci_setup_clock_ops() - Setup the clock operations structures
+ * @cops:	pointer to TISCI clock operations structure
+ */
+void ti_sci_setup_clock_ops(struct ti_sci_clk_ops *cops)
+{
+	cops->get_clock = ti_sci_cmd_get_clock;
+	cops->idle_clock = ti_sci_cmd_idle_clock;
+	cops->put_clock = ti_sci_cmd_put_clock;
+	cops->is_auto = ti_sci_cmd_clk_is_auto;
+	cops->is_on = ti_sci_cmd_clk_is_on;
+	cops->is_off = ti_sci_cmd_clk_is_off;
+
+	cops->set_parent = ti_sci_cmd_clk_set_parent;
+	cops->get_parent = ti_sci_cmd_clk_get_parent;
+	cops->get_num_parents = ti_sci_cmd_clk_get_num_parents;
+
+	cops->get_best_match_freq = ti_sci_cmd_clk_get_match_freq;
+	cops->set_freq = ti_sci_cmd_clk_set_freq;
+	cops->get_freq = ti_sci_cmd_clk_get_freq;
+}
diff --git a/drivers/firmware/ti/ti_sci_core.c b/drivers/firmware/ti/ti_sci_core.c
index e98bf3c5f9dc1..848c040f598e0 100644
--- a/drivers/firmware/ti/ti_sci_core.c
+++ b/drivers/firmware/ti/ti_sci_core.c
@@ -565,525 +565,6 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 	return 0;
 }
 
-/**
- * ti_sci_set_clock_state() - Set clock state helper
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @flags:	Header flags as needed
- * @state:	State to request for the clock.
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
-				  u32 dev_id, u32 clk_id,
-				  u32 flags, u8 state)
-{
-	struct ti_sci_msg_req_set_clock_state req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.dev_id = dev_id;
-	if (clk_id < 255) {
-		req.clk_id = clk_id;
-	} else {
-		req.clk_id = 255;
-		req.clk_id_32 = clk_id;
-	}
-	req.request_state = state;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_STATE,
-			     flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_get_clock_state() - Get clock state helper
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @programmed_state:	State requested for clock to move to
- * @current_state:	State that the clock is currently in
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
-				      u32 dev_id, u32 clk_id,
-				      u8 *programmed_state, u8 *current_state)
-{
-	struct ti_sci_msg_req_get_clock_state req;
-	struct ti_sci_msg_resp_get_clock_state resp;
-	int ret = 0;
-
-	if (!programmed_state && !current_state)
-		return -EINVAL;
-
-	req.dev_id = dev_id;
-	if (clk_id < 255) {
-		req.clk_id = clk_id;
-	} else {
-		req.clk_id = 255;
-		req.clk_id_32 = clk_id;
-	}
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_STATE,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	if (programmed_state)
-		*programmed_state = resp.programmed_state;
-	if (current_state)
-		*current_state = resp.current_state;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_get_clock() - Get control of a clock from TI SCI
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @needs_ssc: 'true' if Spread Spectrum clock is desired, else 'false'
- * @can_change_freq: 'true' if frequency change is desired, else 'false'
- * @enable_input_term: 'true' if input termination is desired, else 'false'
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_get_clock(const struct ti_sci_handle *handle, u32 dev_id,
-				u32 clk_id, bool needs_ssc,
-				bool can_change_freq, bool enable_input_term)
-{
-	u32 flags = 0;
-
-	flags |= needs_ssc ? MSG_FLAG_CLOCK_ALLOW_SSC : 0;
-	flags |= can_change_freq ? MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE : 0;
-	flags |= enable_input_term ? MSG_FLAG_CLOCK_INPUT_TERM : 0;
-
-	return ti_sci_set_clock_state(handle, dev_id, clk_id, flags,
-				      MSG_CLOCK_SW_STATE_REQ);
-}
-
-/**
- * ti_sci_cmd_idle_clock() - Idle a clock which is in our control
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- *
- * NOTE: This clock must have been requested by get_clock previously.
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_idle_clock(const struct ti_sci_handle *handle,
-				 u32 dev_id, u32 clk_id)
-{
-	return ti_sci_set_clock_state(handle, dev_id, clk_id,
-				      MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE,
-				      MSG_CLOCK_SW_STATE_UNREQ);
-}
-
-/**
- * ti_sci_cmd_put_clock() - Release a clock from our control back to TISCI
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- *
- * NOTE: This clock must have been requested by get_clock previously.
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_put_clock(const struct ti_sci_handle *handle,
-				u32 dev_id, u32 clk_id)
-{
-	return ti_sci_set_clock_state(handle, dev_id, clk_id,
-				      MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE,
-				      MSG_CLOCK_SW_STATE_AUTO);
-}
-
-/**
- * ti_sci_cmd_clk_is_auto() - Is the clock being auto managed
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @req_state: state indicating if the clock is auto managed
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_is_auto(const struct ti_sci_handle *handle,
-				  u32 dev_id, u32 clk_id, bool *req_state)
-{
-	u8 state = 0;
-	int ret;
-
-	if (!req_state)
-		return -EINVAL;
-
-	ret = ti_sci_cmd_get_clock_state(handle, dev_id, clk_id, &state, NULL);
-	if (ret)
-		return ret;
-
-	*req_state = (state == MSG_CLOCK_SW_STATE_AUTO);
-	return 0;
-}
-
-/**
- * ti_sci_cmd_clk_is_on() - Is the clock ON
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @req_state: state indicating if the clock is managed by us and enabled
- * @curr_state: state indicating if the clock is ready for operation
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_is_on(const struct ti_sci_handle *handle, u32 dev_id,
-				u32 clk_id, bool *req_state, bool *curr_state)
-{
-	u8 c_state = 0, r_state = 0;
-	int ret;
-
-	if (!req_state && !curr_state)
-		return -EINVAL;
-
-	ret = ti_sci_cmd_get_clock_state(handle, dev_id, clk_id,
-					 &r_state, &c_state);
-	if (ret)
-		return ret;
-
-	if (req_state)
-		*req_state = (r_state == MSG_CLOCK_SW_STATE_REQ);
-	if (curr_state)
-		*curr_state = (c_state == MSG_CLOCK_HW_STATE_READY);
-	return 0;
-}
-
-/**
- * ti_sci_cmd_clk_is_off() - Is the clock OFF
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @req_state: state indicating if the clock is managed by us and disabled
- * @curr_state: state indicating if the clock is NOT ready for operation
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_is_off(const struct ti_sci_handle *handle, u32 dev_id,
-				 u32 clk_id, bool *req_state, bool *curr_state)
-{
-	u8 c_state = 0, r_state = 0;
-	int ret;
-
-	if (!req_state && !curr_state)
-		return -EINVAL;
-
-	ret = ti_sci_cmd_get_clock_state(handle, dev_id, clk_id,
-					 &r_state, &c_state);
-	if (ret)
-		return ret;
-
-	if (req_state)
-		*req_state = (r_state == MSG_CLOCK_SW_STATE_UNREQ);
-	if (curr_state)
-		*curr_state = (c_state == MSG_CLOCK_HW_STATE_NOT_READY);
-	return 0;
-}
-
-/**
- * ti_sci_cmd_clk_set_parent() - Set the clock source of a specific device clock
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @parent_id:	Parent clock identifier to set
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
-				     u32 dev_id, u32 clk_id, u32 parent_id)
-{
-	struct ti_sci_msg_req_set_clock_parent req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.dev_id = dev_id;
-	if (clk_id < 255) {
-		req.clk_id = clk_id;
-	} else {
-		req.clk_id = 255;
-		req.clk_id_32 = clk_id;
-	}
-	if (parent_id < 255) {
-		req.parent_id = parent_id;
-	} else {
-		req.parent_id = 255;
-		req.parent_id_32 = parent_id;
-	}
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_PARENT,
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
- * ti_sci_cmd_clk_get_parent() - Get current parent clock source
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @parent_id:	Current clock parent
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
-				     u32 dev_id, u32 clk_id, u32 *parent_id)
-{
-	struct ti_sci_msg_req_get_clock_parent req;
-	struct ti_sci_msg_resp_get_clock_parent resp;
-	int ret = 0;
-
-	if (!parent_id)
-		return -EINVAL;
-
-	req.dev_id = dev_id;
-	if (clk_id < 255) {
-		req.clk_id = clk_id;
-	} else {
-		req.clk_id = 255;
-		req.clk_id_32 = clk_id;
-	}
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_PARENT,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	if (resp.parent_id < 255)
-		*parent_id = resp.parent_id;
-	else
-		*parent_id = resp.parent_id_32;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_clk_get_num_parents() - Get num parents of the current clk source
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @num_parents: Returns he number of parents to the current clock.
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
-					  u32 dev_id, u32 clk_id,
-					  u32 *num_parents)
-{
-	struct ti_sci_msg_req_get_clock_num_parents req;
-	struct ti_sci_msg_resp_get_clock_num_parents resp;
-	int ret = 0;
-
-	if (!num_parents)
-		return -EINVAL;
-
-	req.dev_id = dev_id;
-	if (clk_id < 255) {
-		req.clk_id = clk_id;
-	} else {
-		req.clk_id = 255;
-		req.clk_id_32 = clk_id;
-	}
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_NUM_CLOCK_PARENTS,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	if (resp.num_parents < 255)
-		*num_parents = resp.num_parents;
-	else
-		*num_parents = resp.num_parents_32;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_clk_get_match_freq() - Find a good match for frequency
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @min_freq:	The minimum allowable frequency in Hz. This is the minimum
- *		allowable programmed frequency and does not account for clock
- *		tolerances and jitter.
- * @target_freq: The target clock frequency in Hz. A frequency will be
- *		processed as close to this target frequency as possible.
- * @max_freq:	The maximum allowable frequency in Hz. This is the maximum
- *		allowable programmed frequency and does not account for clock
- *		tolerances and jitter.
- * @match_freq:	Frequency match in Hz response.
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
-					 u32 dev_id, u32 clk_id, u64 min_freq,
-					 u64 target_freq, u64 max_freq,
-					 u64 *match_freq)
-{
-	struct ti_sci_msg_req_query_clock_freq req;
-	struct ti_sci_msg_resp_query_clock_freq resp;
-	int ret = 0;
-
-	if (!match_freq)
-		return -EINVAL;
-
-	req.dev_id = dev_id;
-	if (clk_id < 255) {
-		req.clk_id = clk_id;
-	} else {
-		req.clk_id = 255;
-		req.clk_id_32 = clk_id;
-	}
-	req.min_freq_hz = min_freq;
-	req.target_freq_hz = target_freq;
-	req.max_freq_hz = max_freq;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_QUERY_CLOCK_FREQ,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	*match_freq = resp.freq_hz;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_clk_set_freq() - Set a frequency for clock
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @min_freq:	The minimum allowable frequency in Hz. This is the minimum
- *		allowable programmed frequency and does not account for clock
- *		tolerances and jitter.
- * @target_freq: The target clock frequency in Hz. A frequency will be
- *		processed as close to this target frequency as possible.
- * @max_freq:	The maximum allowable frequency in Hz. This is the maximum
- *		allowable programmed frequency and does not account for clock
- *		tolerances and jitter.
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
-				   u32 dev_id, u32 clk_id, u64 min_freq,
-				   u64 target_freq, u64 max_freq)
-{
-	struct ti_sci_msg_req_set_clock_freq req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.dev_id = dev_id;
-	if (clk_id < 255) {
-		req.clk_id = clk_id;
-	} else {
-		req.clk_id = 255;
-		req.clk_id_32 = clk_id;
-	}
-	req.min_freq_hz = min_freq;
-	req.target_freq_hz = target_freq;
-	req.max_freq_hz = max_freq;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_FREQ,
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
- * ti_sci_cmd_clk_get_freq() - Get current frequency
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @freq:	Currently frequency in Hz
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
-				   u32 dev_id, u32 clk_id, u64 *freq)
-{
-	struct ti_sci_msg_req_get_clock_freq req;
-	struct ti_sci_msg_resp_get_clock_freq resp;
-	int ret = 0;
-
-	if (!freq)
-		return -EINVAL;
-
-	req.dev_id = dev_id;
-	if (clk_id < 255) {
-		req.clk_id = clk_id;
-	} else {
-		req.clk_id = 255;
-		req.clk_id_32 = clk_id;
-	}
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_FREQ,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	*freq = resp.freq_hz;
-
-	return 0;
-}
-
 /**
  * ti_sci_cmd_prepare_sleep() - Prepare system for system suspend
  * @handle:		pointer to TI SCI handle
@@ -2223,21 +1704,7 @@ static void ti_sci_setup_ops(struct ti_sci_info *info)
 	struct ti_sci_proc_ops *pops = &ops->proc_ops;
 
 	ti_sci_setup_device_ops(dops);
-
-	cops->get_clock = ti_sci_cmd_get_clock;
-	cops->idle_clock = ti_sci_cmd_idle_clock;
-	cops->put_clock = ti_sci_cmd_put_clock;
-	cops->is_auto = ti_sci_cmd_clk_is_auto;
-	cops->is_on = ti_sci_cmd_clk_is_on;
-	cops->is_off = ti_sci_cmd_clk_is_off;
-
-	cops->set_parent = ti_sci_cmd_clk_set_parent;
-	cops->get_parent = ti_sci_cmd_clk_get_parent;
-	cops->get_num_parents = ti_sci_cmd_clk_get_num_parents;
-
-	cops->get_best_match_freq = ti_sci_cmd_clk_get_match_freq;
-	cops->set_freq = ti_sci_cmd_clk_set_freq;
-	cops->get_freq = ti_sci_cmd_clk_get_freq;
+	ti_sci_setup_clock_ops(cops);
 
 	if (info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED) {
 		pr_debug("detected DM managed LPM in fw_caps\n");
-- 
2.34.1

