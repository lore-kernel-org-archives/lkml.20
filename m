Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A40C56B874
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713158; cv=fail; b=ND3bhxd9Njys0ayO79GMpUfPRmdbPMp0ZjZY5yYIytA2LHyJCxN4cW0FRAWIkT6MS4bIhfcfvawqTEmlDNt6CYDHc1hw3TNs1D8XPGNM34e7agxGb8xRFWZhKTN70vIC8TnHiCx8etizuA4npecZ77M0McDfGJC1BInS4awSi4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713158; c=relaxed/simple;
	bh=URo4tubjyWVj31aXyd4PXOakBvZ5EEOTotC2PMbTeIQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OBykaO811h8XaHUmpJzj7eXyt0oI9X/ujV1+yk/iKa0JNZLg4lIRupakmZWfluEuk1NMAK5DYTtD/WeC+9PTToRRBTfEdNFYycqrfOWzLKfjAW38JbINGcRCbouSbsWJ1WBw9/QEYCRz0/JrvBG9HZ8CWzqQt8LlAwYfO/ufKkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Fh3Bw0w/; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=jIsjYGHv; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Fh3Bw0w/";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="jIsjYGHv"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68TFgImi807515;
	Tue, 29 Sep 2026 15:18:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=uLp8nZvVRwckzv0vu+W8cq82j5UNDc+PTYrM//LU2
	QY=; b=Fh3Bw0w/OFzR48hEk0U2TqrSJ1H4xuAOtxaUDobwAYmFHU/FoKFX0fMAg
	MJxuVDk33uPw8cJBdOc6vGG1G/q8UfjJ/iWQbPGj2WZNMTvg992V16wLCU/ZFvem
	F1Zy7iojdJHtiKKWc5j3S6vyauySRe+r914kqG4CzsI1EY2n4S1883l/ZGSAW/3h
	aduNHVIf1I4nyx89aCoh9ZwxAKfSyligcZ1VZ4eZ+D1ckhw60VTIIKyknH+vDilu
	kFAA3KEOF+rXd3RJCIvQOiNcCQGT6GM2rBh9WCN80Lvgf51/HxN9mq/nxJYRF45Y
	AoRBh6LlKOoGl+4/zPtCuH9nmkR6Q==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012038.outbound.protection.outlook.com [40.107.200.38])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h02j6ej12-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 15:18:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hg8ULkmWnZkjzCqp3/JF41UeGzNTwEGCvKP4SVajiVRbSzLA9JarLVWOR0lJi/NJNvuzNBJ4GsuM3q5LPsywrZg3Jq+pSNISsg7XqthGF58ajrO8YPlRG0jawgTM1VUxO9BzU9GsHCxlnrOhp1pfKQ+ARQKO3qRpJSpzoi1Xw2gA0gPbrxVyHQ6M7Lgj7y5tPQWQuD+3iaz3Kx/6JT5wtovQ44YiHhWQA8eXUTEduz25Qg+02x52cqH7DXGpb3roeypmmcb49/MBy5dZVpNtPq57ZJ7CbKJcx/jknQbY1yMyLPEWZY6PMwrBTdBatwQZCKj6YVjCbXFBhF6HbgtTuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLp8nZvVRwckzv0vu+W8cq82j5UNDc+PTYrM//LU2QY=;
 b=ko90c3t8FwLRVPtegpLss6qjvW/ZhyfFpZJjamP08KKu9rHy7UTyhi9A+GBFXiYTEFrZeCrmQF1k8cherfE+wtL6KAKXZ6lVtMtIZjQjXkKim0RmtRvdhD1GCBsyopq5obR78xOxVck+wiL/7gGs/rXGr6HLqcTklRbWoXtywb0T7C+h9IRb/uQhAnPUCJYDw//utUEf8Yy0nuhWf3RlhKD9hchEvVnwSZMGGfD+a8X9TOrxYANy3gAFzrX5R6dzZijhsLyoFpFjh235AJ2/ScoWkQ4A49vBAKPeirMVFJIYM0myKDtEfu1T+xc+dpM/aW9kzSgjGluUnyjGPRHGxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLp8nZvVRwckzv0vu+W8cq82j5UNDc+PTYrM//LU2QY=;
 b=jIsjYGHv82N4xypVour/uIn4W4gro0ZOzTUpYYLUSfooZ/PAVnmcbCHOHh8f2V+oCeXNvaO3u5QRT8d4wrmC7YkR5sO0bNYKZRHPGA0Nb00ohfYsYIcJyuVKZHp723VhaQ2MsJL1K7EQYPfAUrVscu/f74gMf5WS9FlAFRas8O8=
Received: from CH2PR15CA0022.namprd15.prod.outlook.com (2603:10b6:610:51::32)
 by PH0PR10MB7006.namprd10.prod.outlook.com (2603:10b6:510:285::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Tue, 29 Sep
 2026 20:18:46 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::81) by CH2PR15CA0022.outlook.office365.com
 (2603:10b6:610:51::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 20:18:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 20:18:46 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:31 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 15:18:31 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TKHlMl1688208;
	Tue, 29 Sep 2026 15:18:28 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH 13/22] soc: ti: ti_sci_protocol.h: Add missing documentation for structs
Date: Wed, 30 Sep 2026 01:47:37 +0530
Message-ID: <20260929201746.4078803-14-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|PH0PR10MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: af7e9eed-4b6a-4b08-a0ff-08df1e66dda2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|10067099003|56012099006|6133799003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	emjo5iSZ9TBqSPkhKh8eWC446E2drnkjIP6qiCgekGzHy2UE2z9JrUP+zdkgkORWKlvP7/YjmdvsWOe7iMpHuCZohcij/mVvb0ZH1gKpR8a5VI7IRcCDTmsVRbDG7UwzWhzVOoVsQbSjdl526qf56XZ+KoS0mrUUWSNuHQRmmP4GPOBYeexG/2F2Dnyhsiqbh8xwgutWBypDsOnP7HXUyF3GewMyHD5vHWz6OmeObtsHc1PhXCOhsBUSNBi2ACDt/ZBkzY3YU2ceWWqTYhGVwl+ShCQWQdpXwTxSu0tt3gxMZUr5rRl1/q8YBS6ml5kwpcd+kjOQBJ0cJk2VBu6Sm7BvgVk6lv7OZtvhan2km5olBtgyuvC8OHAvOQx9x8Ey5lRILLW+hSU5VZ1x2wPZnc2O4dum6N3yq9hsPB9wUIBvy/fyEIxZnSyB2fy6GaYWALyBOf5qO5mxThLY1fSYdVThgS7E5yquKK0r6zyPP92o9YlQKT6NTXL68gBTt482KtG8AnVYJmhWuEfuG3pzwVqR+qAVLO4o/+luP6h34VRxE4zjL7sUTVcH/pErdCKlUOz/9JOHHwsWAtTHsOzOgNLCNnEPxJ00gRWAFK7CibFoQGA4Y5CWc7roxY+gX45uxs2WwxKb/QK1/oM/PUyHg8Eu9MwqasyTMZJtPTH1ZcljoTvYXyVquO21vLTx+2NLs8WfmLa3vBJ2AVj4alVTZA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(10067099003)(56012099006)(6133799003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Hu9PVlEjkFWFu7fW+roWqzjNUPqhk1epm/LAypH9TrY0zQTdXguJTQcAbSScgeopa5XmDd5gY8FuHcTa4ONXSdLwiwKzfFYQdt3WwjxXxFnCDPO26mP4+hUSmMp6k0HbR5MyA5r5eKg8ZDTFVWD20FL2u/L1Md5xJcU61XgzidTTgffgJN/NWsry/ntdd5ibw+kslbV5R+R2MNpI8T98LRdZMByCJifQXyIqenMwEZgVNHss2dg+z8t7BFT0Ldf66OyFvXdfxY7LUPKiPcj3eNS8wciSNxH8HZgPjrprc727ECDy/az21hah77FVf5Y+Ok4l/tO08VLTgYLX8ryrtSZCjtfkRGyR431NZF+o9r2ZWXenoVooxm8R/S9aIdEDTAplN21Gf8gKa1l9mQcK/Qi9rO8m+nTVwKXRlzKLdptJnYbVlD3bnwlaNaH31nQi
X-Exchange-RoutingPolicyChecked:
	J2lGwlQ28ulyOeUwAGpl2InPFPSVa5G42XkAg/3kUAnXe69NbdAVXM3UyoIN6OMLjFQka29jM8pk914Ubyn2XRBLkMhMDjNRYU2MIDY/Mjn6Kd3STgxcv9nPPeMnIaG/W+CG/wdw/zvM7BWkfky5RnC761kiZgdsSVpx1tgxX4oVX8BbdAHADuDpUtlM3yu2770i071kUi5scc13AJ17DDADSxp6zeAJruAzvRWmq6+q132sBUt6lO2Y0HCOxbqN8rJ13ccsKR2rLQDGMXUW0dr0oDY4eotz8ItxNKAQWwSbpuUjkSj8ZCEQ9bgqaair6P9oL5yhgITepNox9PnLmQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:18:46.2814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af7e9eed-4b6a-4b08-a0ff-08df1e66dda2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7006
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX1wkMftdL8RNj
 aYD7eEhBoyKGVLiOcfuPru4w6m+nwRgli2XNR2EVrFZpITV3iRUoXNfsrMTXe/ys1EpjfMuSJtf
 g8h8bmwzXUlST+aUWcgH7zcjPFyLMC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX+TkZMk/WDgxG
 3tIuWqiOtayJuv4xZYekl+khC16lZy4CQ5GDbPiwNo9zQKlA/H/hVRKFm0bn7XBFccsuRUy9TI6
 LkmVjz1PdcYvZmArAsxwdfQTDX/IXMU00v4iH+L9pw6MokGKFSSV5Blmfdi38Vp5TOeuCW4bglZ
 04ETPzvkK1ulDY3bSYS/osHzAfw/gakJIFbIDLgWv8WgTmeooQWwxQl06C74nxGWgYsO0350aNW
 FWSaM2KRD0qVGWbWo/nD9Zj6GWHWKqZhhbLBXZMgkh7m1fbBvorr5IDvPSIMEYtjbXVm69jaIKh
 NiKpVefs9u/wl+Qv4lWNMjHwf/vK5Mi9f8CEhdDLpDFuF+60ZBKd+/EYqV5Jnb4o8xfD5Lv85s0
 iSDRLW5FDW2+9Ur79XPTaoC5aPNpqJvqG58Se+Gp/lZJnKJcPk1uHmcx4cCP+uIZXCTOLzTRYhG
 KsqWIh+ayIqVdEu5Xjw==
X-Authority-Analysis: v=2.4 cv=Z4p5j3RA c=1 sm=1 tr=0 ts=6abc1d2e cx=c_pps
 a=xHz2x/H0+t1Z4EfVAX8SiQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=OrHHYe0rJBWiAmqXVPgA:9
X-Proofpoint-GUID: LlluZ9ckfyBv0QjO2dIhj7araHBIMIJl
X-Proofpoint-ORIG-GUID: LlluZ9ckfyBv0QjO2dIhj7araHBIMIJl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290080

Some of the structs defined in ti_sci_protocol.h were missing
documentation and some were not in correct style. Clean these up to
resolve static warnings.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 include/linux/soc/ti/ti_sci_protocol.h | 374 ++++++++++++++++++++++++-
 1 file changed, 363 insertions(+), 11 deletions(-)

diff --git a/include/linux/soc/ti/ti_sci_protocol.h b/include/linux/soc/ti/ti_sci_protocol.h
index fd104b6668364..471f5580787cf 100644
--- a/include/linux/soc/ti/ti_sci_protocol.h
+++ b/include/linux/soc/ti/ti_sci_protocol.h
@@ -42,9 +42,17 @@ struct ti_sci_core_ops {
  * @get_device: Command to request for device managed by TISCI
  *		Returns 0 for successful exclusive request, else returns
  *		corresponding error message.
+ * @get_device_exclusive: Command to request for device managed by TISCI that is
+ *		exclusively owned by the requesting host.
+ *		Returns 0 for successful exclusive request, else returns
+ *		corresponding error message.
  * @idle_device: Command to idle a device managed by TISCI
  *		Returns 0 for successful exclusive request, else returns
  *		corresponding error message.
+ * @idle_device_exclusive: Command to idle a device managed by TISCI that is
+ *		exclusively owned by requesting host.
+ *		Returns 0 for successful exclusive request, else returns
+ *		corresponding error message.
  * @put_device:	Command to release a device managed by TISCI
  *		Returns 0 for successful release, else returns corresponding
  *		error message.
@@ -243,7 +251,7 @@ struct ti_sci_resource_desc {
 /**
  * struct ti_sci_rm_core_ops - Resource management core operations
  * @get_range:		Get a range of resources belonging to ti sci host.
- * @get_rage_from_shost:	Get a range of resources belonging to
+ * @get_range_from_shost:	Get a range of resources belonging to
  *				specified host id.
  *			- s_host: Host processing entity to which the
  *				  resources are allocated
@@ -322,6 +330,35 @@ struct ti_sci_rm_irq_ops {
  *
  * Parameters for Navigator Subsystem ring configuration
  * See @ti_sci_msg_rm_ring_cfg_req
+ *
+ * @valid_params: Bitfield defining validity of ring configuration parameters.
+ *	The ring configuration fields are not valid, and will not be used for
+ *	ring configuration, if their corresponding valid bit is zero.
+ *	Valid bit usage:
+ *	0 - Valid bit for @addr_lo
+ *	1 - Valid bit for @addr_hi
+ *	2 - Valid bit for @count
+ *	3 - Valid bit for @mode
+ *	4 - Valid bit for @size
+ *	5 - Valid bit for @order_id
+ *	6 - Valid bit for @virtid
+ *	7 - Valid bit for @asel
+ * @nav_id: Device ID of Navigator Subsystem from which the ring is allocated
+ * @index: ring index to be configured.
+ * @addr_lo: 32 LSBs of ring base address to be programmed into the ring's
+ *	RING_BA_LO register
+ * @addr_hi: 16 MSBs of ring base address to be programmed into the ring's
+ *	RING_BA_HI register.
+ * @count: Number of ring elements. Must be even if mode is CREDENTIALS or QM
+ *	modes.
+ * @mode: Specifies the mode the ring is to be configured.
+ * @size: Specifies encoded ring element size. To calculate the encoded size use
+ *	the formula (log2(size_bytes) - 2), where size_bytes cannot be
+ *	greater than 256.
+ * @order_id: Specifies the ring's bus order ID.
+ * @virtid: Ring virt ID value
+ * @asel: Ring ASEL (address select) value to be set into the ASEL field of the
+ *	ring's RING_BA_HI register.
  */
 struct ti_sci_msg_rm_ring_cfg {
 	u32 valid_params;
@@ -397,10 +434,102 @@ struct ti_sci_rm_psil_ops {
 #define TI_SCI_MSG_VALUE_RM_UDMAP_CH_BURST_SIZE_VALID		BIT(14)
 
 /**
- * Configures a Navigator Subsystem UDMAP transmit channel
+ * struct ti_sci_msg_rm_udmap_tx_ch_cfg - Configures a Navigator Subsystem UDMAP
+ *					  transmit channel
+ *
+ * @valid_params: Bitfield defining validity of tx channel configuration
+ * parameters. The tx channel configuration fields are not valid, and will not
+ * be used for ch configuration, if their corresponding valid bit is zero.
+ * Valid bit usage:
+ *    0 - Valid bit for @tx_pause_on_err
+ *    1 - Valid bit for @tx_atype
+ *    2 - Valid bit for @tx_chan_type
+ *    3 - Valid bit for @tx_fetch_size
+ *    4 - Valid bit for @txcq_qnum
+ *    5 - Valid bit for @tx_priority
+ *    6 - Valid bit for @tx_qos
+ *    7 - Valid bit for @tx_orderid
+ *    8 - Valid bit for @tx_sched_priority
+ *    9 - Valid bit for @tx_filt_einfo
+ *   10 - Valid bit for @tx_filt_pswords
+ *   11 - Valid bit for @tx_supr_tdpkt
+ *   12 - Valid bit for @tx_credit_count
+ *   13 - Valid bit for @fdepth
+ *   14 - Valid bit for @tx_burst_size
+ *   15 - Valid bit for @tx_tdtype
+ *   16 - Valid bit for @extended_ch_type
+ *
+ * @nav_id: SoC device ID of Navigator Subsystem where tx channel is located
+ *
+ * @index: UDMAP transmit channel index.
+ *
+ * @tx_pause_on_err: UDMAP transmit channel pause on error configuration to
+ * be programmed into the tx_pause_on_err field of the channel's TCHAN_TCFG
+ * register.
+ *
+ * @tx_filt_einfo: UDMAP transmit channel extended packet information passing
+ * configuration to be programmed into the tx_filt_einfo field of the
+ * channel's TCHAN_TCFG register.
+ *
+ * @tx_filt_pswords: UDMAP transmit channel protocol specific word passing
+ * configuration to be programmed into the tx_filt_pswords field of the
+ * channel's TCHAN_TCFG register.
+ *
+ * @tx_atype: UDMAP transmit channel non Ring Accelerator access pointer
+ * interpretation configuration to be programmed into the tx_atype field of
+ * the channel's TCHAN_TCFG register.
+ *
+ * @tx_chan_type: UDMAP transmit channel functional channel type and work
+ * passing mechanism configuration to be programmed into the tx_chan_type
+ * field of the channel's TCHAN_TCFG register.
+ *
+ * @tx_supr_tdpkt: UDMAP transmit channel teardown packet generation suppression
+ * configuration to be programmed into the tx_supr_tdpkt field of the channel's
+ * TCHAN_TCFG register.
+ *
+ * @tx_fetch_size: UDMAP transmit channel number of 32-bit descriptor words to
+ * fetch configuration to be programmed into the tx_fetch_size field of the
+ * channel's TCHAN_TCFG register.  The user must make sure to set the maximum
+ * word count that can pass through the channel for any allowed descriptor type.
+ *
+ * @tx_credit_count: UDMAP transmit channel transfer request credit count
+ * configuration to be programmed into the count field of the TCHAN_TCREDIT
+ * register.  Specifies how many credits for complete TRs are available.
  *
- * Configures a Navigator Subsystem UDMAP transmit channel registers.
- * See @ti_sci_msg_rm_udmap_tx_ch_cfg_req
+ * @txcq_qnum: UDMAP transmit channel completion queue configuration to be
+ * programmed into the txcq_qnum field of the TCHAN_TCQ register. The specified
+ * completion queue must be assigned to the host, or a subordinate of the host,
+ * requesting configuration of the transmit channel.
+ *
+ * @tx_priority: UDMAP transmit channel transmit priority value to be programmed
+ * into the priority field of the channel's TCHAN_TPRI_CTRL register.
+ *
+ * @tx_qos: UDMAP transmit channel transmit qos value to be programmed into the
+ * qos field of the channel's TCHAN_TPRI_CTRL register.
+ *
+ * @tx_orderid: UDMAP transmit channel bus order id value to be programmed into
+ * the orderid field of the channel's TCHAN_TPRI_CTRL register.
+ *
+ * @fdepth: UDMAP transmit channel FIFO depth configuration to be programmed
+ * into the fdepth field of the TCHAN_TFIFO_DEPTH register. Sets the number of
+ * Tx FIFO bytes which are allowed to be stored for the channel. Check the UDMAP
+ * section of the TRM for restrictions regarding this parameter.
+ *
+ * @tx_sched_priority: UDMAP transmit channel tx scheduling priority
+ * configuration to be programmed into the priority field of the channel's
+ * TCHAN_TST_SCHED register.
+ *
+ * @tx_burst_size: UDMAP transmit channel burst size configuration to be
+ * programmed into the tx_burst_size field of the TCHAN_TCFG register.
+ *
+ * @tx_tdtype: UDMAP transmit channel teardown type configuration to be
+ * programmed into the tdtype field of the TCHAN_TCFG register:
+ * 0 - Return immediately
+ * 1 - Wait for completion message from remote peer
+ *
+ * @extended_ch_type: Valid for BCDMA.
+ * 0 - the channel is split tx channel (tchan)
+ * 1 - the channel is block copy channel (bchan)
  */
 struct ti_sci_msg_rm_udmap_tx_ch_cfg {
 	u32 valid_params;
@@ -433,10 +562,96 @@ struct ti_sci_msg_rm_udmap_tx_ch_cfg {
 };
 
 /**
- * Configures a Navigator Subsystem UDMAP receive channel
+ * struct ti_sci_msg_rm_udmap_rx_ch_cfg - Configures a Navigator Subsystem UDMAP
+ *					  receive channel
+ *
+ * @valid_params: Bitfield defining validity of rx channel configuration
+ * parameters.
+ * The rx channel configuration fields are not valid, and will not be used for
+ * ch configuration, if their corresponding valid bit is zero.
+ * Valid bit usage:
+ *    0 - Valid bit for @rx_pause_on_err
+ *    1 - Valid bit for @rx_atype
+ *    2 - Valid bit for @rx_chan_type
+ *    3 - Valid bit for @rx_fetch_size
+ *    4 - Valid bit for @rxcq_qnum
+ *    5 - Valid bit for @rx_priority
+ *    6 - Valid bit for @rx_qos
+ *    7 - Valid bit for @rx_orderid
+ *    8 - Valid bit for @rx_sched_priority
+ *    9 - Valid bit for @flowid_start
+ *   10 - Valid bit for @flowid_cnt
+ *   11 - Valid bit for @rx_ignore_short
+ *   12 - Valid bit for @rx_ignore_long
+ *   14 - Valid bit for @rx_burst_size
+ *
+ * @nav_id: SoC device ID of Navigator Subsystem where rx channel is located
+ *
+ * @index: UDMAP receive channel index.
+ *
+ * @rx_fetch_size: UDMAP receive channel number of 32-bit descriptor words to
+ * fetch configuration to be programmed into the rx_fetch_size field of the
+ * channel's RCHAN_RCFG register.
+ *
+ * @rxcq_qnum: UDMAP receive channel completion queue configuration to be
+ * programmed into the rxcq_qnum field of the RCHAN_RCQ register.
+ * The specified completion queue must be assigned to the host, or a subordinate
+ * of the host, requesting configuration of the receive channel.
+ *
+ * @rx_priority: UDMAP receive channel receive priority value to be programmed
+ * into the priority field of the channel's RCHAN_RPRI_CTRL register.
+ *
+ * @rx_qos: UDMAP receive channel receive qos value to be programmed into the
+ * qos field of the channel's RCHAN_RPRI_CTRL register.
  *
- * Configures a Navigator Subsystem UDMAP receive channel registers.
- * See @ti_sci_msg_rm_udmap_rx_ch_cfg_req
+ * @rx_orderid: UDMAP receive channel bus order id value to be programmed into
+ * the orderid field of the channel's RCHAN_RPRI_CTRL register.
+ *
+ * @rx_sched_priority: UDMAP receive channel rx scheduling priority
+ * configuration to be programmed into the priority field of the channel's
+ * RCHAN_RST_SCHED register.
+ *
+ * @flowid_start: UDMAP receive channel additional flows starting index
+ * configuration to program into the flow_start field of the RCHAN_RFLOW_RNG
+ * register. Specifies the starting index for flow IDs the receive channel is to
+ * make use of beyond the default flow. flowid_start and @flowid_cnt must be
+ * set as valid and configured together. The starting flow ID set by
+ * @flowid_start must be a flow index within the Navigator Subsystem's subset
+ * of flows beyond the default flows statically mapped to receive channels.
+ * The additional flows must be assigned to the host, or a subordinate of the
+ * host, requesting configuration of the receive channel.
+ *
+ * @flowid_cnt: UDMAP receive channel additional flows count configuration to
+ * program into the flowid_cnt field of the RCHAN_RFLOW_RNG register.
+ * This field specifies how many flow IDs are in the additional contiguous range
+ * of legal flow IDs for the channel.  @flowid_start and flowid_cnt must be
+ * set as valid and configured together. Disabling the valid_params field bit
+ * for flowid_cnt indicates no flow IDs other than the default are to be
+ * allocated and used by the receive channel. @flowid_start plus flowid_cnt
+ * cannot be greater than the number of receive flows in the receive channel's
+ * Navigator Subsystem.  The additional flows must be assigned to the host, or a
+ * subordinate of the host, requesting configuration of the receive channel.
+ *
+ * @rx_pause_on_err: UDMAP receive channel pause on error configuration to be
+ * programmed into the rx_pause_on_err field of the channel's RCHAN_RCFG
+ * register.
+ *
+ * @rx_atype: UDMAP receive channel non Ring Accelerator access pointer
+ * interpretation configuration to be programmed into the rx_atype field of the
+ * channel's RCHAN_RCFG register.
+ *
+ * @rx_chan_type: UDMAP receive channel functional channel type and work passing
+ * mechanism configuration to be programmed into the rx_chan_type field of the
+ * channel's RCHAN_RCFG register.
+ *
+ * @rx_ignore_short: UDMAP receive channel short packet treatment configuration
+ * to be programmed into the rx_ignore_short field of the RCHAN_RCFG register.
+ *
+ * @rx_ignore_long: UDMAP receive channel long packet treatment configuration to
+ * be programmed into the rx_ignore_long field of the RCHAN_RCFG register.
+ *
+ * @rx_burst_size: UDMAP receive channel burst size configuration to be
+ * programmed into the rx_burst_size field of the RCHAN_RCFG register.
  */
 struct ti_sci_msg_rm_udmap_rx_ch_cfg {
 	u32 valid_params;
@@ -463,10 +678,142 @@ struct ti_sci_msg_rm_udmap_rx_ch_cfg {
 };
 
 /**
- * Configures a Navigator Subsystem UDMAP receive flow
+ * struct ti_sci_msg_rm_udmap_flow_cfg - Configures a Navigator Subsystem UDMAP
+ *					 receive flow
+ *
+ * @valid_params:
+ * Bitfield defining validity of rx flow configuration parameters.  The
+ * rx flow configuration fields are not valid, and will not be used for flow
+ * configuration, if their corresponding valid bit is zero.  Valid bit usage:
+ *     0 - Valid bit for @rx_einfo_present
+ *     1 - Valid bit for @rx_psinfo_present
+ *     2 - Valid bit for @rx_error_handling
+ *     3 - Valid bit for @rx_desc_type
+ *     4 - Valid bit for @rx_sop_offset
+ *     5 - Valid bit for @rx_dest_qnum
+ *     6 - Valid bit for @rx_src_tag_hi
+ *     7 - Valid bit for @rx_src_tag_lo
+ *     8 - Valid bit for @rx_dest_tag_hi
+ *     9 - Valid bit for @rx_dest_tag_lo
+ *    10 - Valid bit for @rx_src_tag_hi_sel
+ *    11 - Valid bit for @rx_src_tag_lo_sel
+ *    12 - Valid bit for @rx_dest_tag_hi_sel
+ *    13 - Valid bit for @rx_dest_tag_lo_sel
+ *    14 - Valid bit for @rx_fdq0_sz0_qnum
+ *    15 - Valid bit for @rx_fdq1_qnum
+ *    16 - Valid bit for @rx_fdq2_qnum
+ *    17 - Valid bit for @rx_fdq3_qnum
+ *    18 - Valid bit for @rx_ps_location
+ *
+ * @nav_id: SoC device ID of Navigator Subsystem from which the receive flow is
+ * allocated
+ *
+ * @flow_index: UDMAP receive flow index for non-optional configuration.
+ *
+ * @rx_einfo_present:
+ * UDMAP receive flow extended packet info present configuration to be
+ * programmed into the rx_einfo_present field of the flow's RFLOW_RFA register.
+ *
+ * @rx_psinfo_present:
+ * UDMAP receive flow PS words present configuration to be programmed into the
+ * rx_psinfo_present field of the flow's RFLOW_RFA register.
+ *
+ * @rx_error_handling:
+ * UDMAP receive flow error handling configuration to be programmed into the
+ * rx_error_handling field of the flow's RFLOW_RFA register.
+ *
+ * @rx_desc_type:
+ * UDMAP receive flow descriptor type configuration to be programmed into the
+ * rx_desc_type field of the flow's RFLOW_RFA register.
+ *
+ * @rx_sop_offset:
+ * UDMAP receive flow start of packet offset configuration to be programmed
+ * into the rx_sop_offset field of the RFLOW_RFA register.  See the UDMAP
+ * section of the TRM for more information on this setting.  Valid values for
+ * this field are 0-255 bytes.
+ *
+ * @rx_dest_qnum:
+ * UDMAP receive flow destination queue configuration to be programmed into the
+ * rx_dest_qnum field of the flow's RFLOW_RFA register.  The specified
+ * destination queue must be valid within the Navigator Subsystem and must be
+ * owned by the host, or a subordinate of the host, requesting allocation and
+ * configuration of the receive flow.
+ *
+ * @rx_src_tag_hi:
+ * UDMAP receive flow source tag high byte constant configuration to be
+ * programmed into the rx_src_tag_hi field of the flow's RFLOW_RFB register.
+ * See the UDMAP section of the TRM for more information on this setting.
+ *
+ * @rx_src_tag_lo:
+ * UDMAP receive flow source tag low byte constant configuration to be
+ * programmed into the rx_src_tag_lo field of the flow's RFLOW_RFB register.
+ * See the UDMAP section of the TRM for more information on this setting.
+ *
+ * @rx_dest_tag_hi:
+ * UDMAP receive flow destination tag high byte constant configuration to be
+ * programmed into the rx_dest_tag_hi field of the flow's RFLOW_RFB register.
+ * See the UDMAP section of the TRM for more information on this setting.
+ *
+ * @rx_dest_tag_lo:
+ * UDMAP receive flow destination tag low byte constant configuration to be
+ * programmed into the rx_dest_tag_lo field of the flow's RFLOW_RFB register.
+ * See the UDMAP section of the TRM for more information on this setting.
+ *
+ * @rx_src_tag_hi_sel:
+ * UDMAP receive flow source tag high byte selector configuration to be
+ * programmed into the rx_src_tag_hi_sel field of the RFLOW_RFC register.  See
+ * the UDMAP section of the TRM for more information on this setting.
+ *
+ * @rx_src_tag_lo_sel:
+ * UDMAP receive flow source tag low byte selector configuration to be
+ * programmed into the rx_src_tag_lo_sel field of the RFLOW_RFC register.  See
+ * the UDMAP section of the TRM for more information on this setting.
+ *
+ * @rx_dest_tag_hi_sel:
+ * UDMAP receive flow destination tag high byte selector configuration to be
+ * programmed into the rx_dest_tag_hi_sel field of the RFLOW_RFC register.  See
+ * the UDMAP section of the TRM for more information on this setting.
+ *
+ * @rx_dest_tag_lo_sel:
+ * UDMAP receive flow destination tag low byte selector configuration to be
+ * programmed into the rx_dest_tag_lo_sel field of the RFLOW_RFC register.  See
+ * the UDMAP section of the TRM for more information on this setting.
+ *
+ * @rx_fdq0_sz0_qnum:
+ * UDMAP receive flow free descriptor queue 0 configuration to be programmed
+ * into the rx_fdq0_sz0_qnum field of the flow's RFLOW_RFD register.  See the
+ * UDMAP section of the TRM for more information on this setting. The specified
+ * free queue must be valid within the Navigator Subsystem and must be owned
+ * by the host, or a subordinate of the host, requesting allocation and
+ * configuration of the receive flow.
+ *
+ * @rx_fdq1_qnum:
+ * UDMAP receive flow free descriptor queue 1 configuration to be programmed
+ * into the rx_fdq1_qnum field of the flow's RFLOW_RFD register.  See the
+ * UDMAP section of the TRM for more information on this setting.  The specified
+ * free queue must be valid within the Navigator Subsystem and must be owned
+ * by the host, or a subordinate of the host, requesting allocation and
+ * configuration of the receive flow.
+ *
+ * @rx_fdq2_qnum:
+ * UDMAP receive flow free descriptor queue 2 configuration to be programmed
+ * into the rx_fdq2_qnum field of the flow's RFLOW_RFE register.  See the
+ * UDMAP section of the TRM for more information on this setting.  The specified
+ * free queue must be valid within the Navigator Subsystem and must be owned
+ * by the host, or a subordinate of the host, requesting allocation and
+ * configuration of the receive flow.
+ *
+ * @rx_fdq3_qnum:
+ * UDMAP receive flow free descriptor queue 3 configuration to be programmed
+ * into the rx_fdq3_qnum field of the flow's RFLOW_RFE register.  See the
+ * UDMAP section of the TRM for more information on this setting.  The specified
+ * free queue must be valid within the Navigator Subsystem and must be owned
+ * by the host, or a subordinate of the host, requesting allocation and
+ * configuration of the receive flow.
  *
- * Configures a Navigator Subsystem UDMAP receive flow's registers.
- * See @tis_ci_msg_rm_udmap_flow_cfg_req
+ * @rx_ps_location:
+ * UDMAP receive flow PS words location configuration to be programmed into the
+ * rx_ps_location field of the flow's RFLOW_RFA register.
  */
 struct ti_sci_msg_rm_udmap_flow_cfg {
 	u32 valid_params;
@@ -516,7 +863,7 @@ struct ti_sci_msg_rm_udmap_flow_cfg {
  * struct ti_sci_rm_udmap_ops - UDMA Management operations
  * @tx_ch_cfg: configure SoC Navigator Subsystem UDMA transmit channel.
  * @rx_ch_cfg: configure SoC Navigator Subsystem UDMA receive channel.
- * @rx_flow_cfg1: configure SoC Navigator Subsystem UDMA receive flow.
+ * @rx_flow_cfg: configure SoC Navigator Subsystem UDMA receive flow.
  */
 struct ti_sci_rm_udmap_ops {
 	int (*tx_ch_cfg)(const struct ti_sci_handle *handle,
@@ -558,10 +905,15 @@ struct ti_sci_proc_ops {
 
 /**
  * struct ti_sci_ops - Function support for TI SCI
+ * @core_ops:	SoC core operations
  * @dev_ops:	Device specific operations
  * @clk_ops:	Clock specific operations
+ * @pm_ops:	Low Power Mode (LPM) control operations
  * @rm_core_ops:	Resource management core operations.
  * @rm_irq_ops:		IRQ management specific operations
+ * @rm_ring_ops:	Ring Accelerator Management operations
+ * @rm_psil_ops:	PSI-L thread operations
+ * @rm_udmap_ops:	UDMA Management operations
  * @proc_ops:	Processor Control specific operations
  */
 struct ti_sci_ops {
-- 
2.34.1

