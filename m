Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960414FE2E5;
	Mon, 21 Sep 2026 18:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790016581; cv=fail; b=JczejT4nlNAVxFp4Ixk/xDKAtB6BTrLGYFWYv9TbK6LbYjp9A6ElWYpVJfvPVJL8NFM6tEiCSAoqMqBRxXgM7VQKGWBCWFprRCqCJS24aOu2xcBxBqxCD1iVAqaA4PcQ5h5/DCrrpwC91rgLx5dwBJvIL5unX27E26+xnqPQ3g0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790016581; c=relaxed/simple;
	bh=cHOcknTTCrsqdbcAhGaW4E3RV8/vVsWNNUTK5HWEVxg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LW4n4qEkddMWIqNgx9ZQNids3MI0DVte+2EqAtXIO9tG4mLHkg+nnGVvFBfdb+7zVj5scVwIlXJ3Z4muLJG7VASrUIPJk0xgBPqNhEHoq9c298jGa5GDwn+gMT0t6l4URFWHhBZsASrSo3+9Xg2ExEnV360Z76DdwzCG+nPe8Hs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=BQ+sv/ox; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=r5NYsH+n; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="BQ+sv/ox";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="r5NYsH+n"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LIUEfC605276;
	Mon, 21 Sep 2026 13:49:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=d6dahA9A3AhAimeyCh0+jGvRtisI/n3t6x/jMUTMm
	ZE=; b=BQ+sv/oxc2Utx6m63gKOzdaVsTEMB7HelaMAc3Qu92LcAnsueaTZ3z0Fd
	0KFEMbGjHojRImB3tvjypcp8VmkOnCe1vrz+u4gr4Xg40lNlO3i7AYbjfYbv1ken
	Tr640Mf7JU1ibv10exsC0mSUYvYJqhE4GtnCI/V2AO+cdUTUQbA82Y3hJJlGLs0H
	IY0w4M+nzRajokbBkFPKUF0V+08P3tVVH0A9YNv1q6zu1H83+jduvCXnUO7iOk1H
	AnvM2BXW/7GygVrVAh5VwN0SKsp9Csar90IDsxC4MdIqyFTqwn2RSS6D52xn69RQ
	vLOBpOuWoxjtn4b6H5/+mhUqSqfbA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011008.outbound.protection.outlook.com [40.107.208.8])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gt9s5s3p0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 21 Sep 2026 13:49:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tf5AJP5bKxD3tLNnEcaTCLV2OxzSPSaXPa5yhmB+whweRTQN4QEZV8tKhFUpcGD9scDciuvJbpYkABElR7Ejjxk6mxbbdiE2zbEB1cmyBfdHnwBYuxmoi0G2wth1cY36MVunwYSKYCkMI9xexck1dJ88N/MKlwrjjBFUrXvUsf8YN83bnG9EI95xMkIsAAIecmx2SXpTQPhehVqFahotJKTKLP1pIJuNUYj4xCNwIVY4OxRoXkuct1i9fVmCeQOxV+Pj90u9r/o02P6Ne3F7lkItqM+3EU4pc5LvBz8GzQ6mV4PZtbDUWGQHAuMaXTwuhZL+3tyGFNkOyQ5PADXMvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6dahA9A3AhAimeyCh0+jGvRtisI/n3t6x/jMUTMmZE=;
 b=E1SUmb/nPxP25da7b7udOzrFf27qlswBCpKgtYIYhwdUP1hYNx8X3Cijmrks7xDCxOuf44oHuFw5rzw5+wT4igqYYtuYCU6Mg5poFEl36Qd8BLN/XlEh/OZuuOa3EcGfJpiXR8TXNvL/n7wVI/tncoskJo89R5zVxQBRqDwTTX/xxOOZFpe4W6m1RdEYQwybVaHheNELkafHk7UW5ZWIWH6n2H6wHlhtJ2ZWsbbVP//u4wBMGC4sULJgJh8MXjLa+UT4oR8JbKWPj3HQ+wQ44lHm8zyU/75XApSi589F6BthvduybYNw+AP04JAdhHeemzmm8EzQHVq9Uh1PZaD+LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6dahA9A3AhAimeyCh0+jGvRtisI/n3t6x/jMUTMmZE=;
 b=r5NYsH+nPAUeSlJKn6wtoTaiBl8CdJdCzE4AMG3xyQgIYN/G1BYDoXLUA9KMybfG+5WzkykB3GB/FhMw6QPRNBjl7hwlUD3Ulq2DCFfcTnM97rcXt8fP3Jvl3GwUAF54PpDaK8akve1/xW0JxozBwwsSY7LJtXXAbVDebI+9f0c=
Received: from BN9PR03CA0546.namprd03.prod.outlook.com (2603:10b6:408:138::11)
 by DM4PR10MB6837.namprd10.prod.outlook.com (2603:10b6:8:107::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Mon, 21 Sep
 2026 18:49:22 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:408:138:cafe::45) by BN9PR03CA0546.outlook.office365.com
 (2603:10b6:408:138::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Mon,
 21 Sep 2026 18:49:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 18:49:22 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 13:49:01 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 13:49:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 21 Sep 2026 13:49:00 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68LImtig3523558;
	Mon, 21 Sep 2026 13:49:00 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <afd@ti.com>, <b-brnich@ti.com>
Subject: [PATCH v3 3/4] arm64: dts: ti: k3-am62a-main: Assign SRAM to VPU node
Date: Mon, 21 Sep 2026 13:48:49 -0500
Message-ID: <20260921184850.3810018-4-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921184850.3810018-1-b-brnich@ti.com>
References: <20260921184850.3810018-1-b-brnich@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|DM4PR10MB6837:EE_
X-MS-Office365-Filtering-Correlation-Id: 5285e467-ce88-49a9-7d62-08df18110cfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xpWK7remA05evVZh/+ly/NulmA+eXqU/F7P8zS2Euz1IyLKdEaZYC4LKhDIfzFIPwWATsWmyyi9JItoYVtdSFrpC0U0ZedN0yzUZLKUtPxJYOP+5MtsQWKf7gEyNMV7o+rj9Jhn8QudDHyOXoH9065WUvmtHqyS7D2D8707hf9S3+05pCGhN/ATRLimnUvM+D688SpDrIF7M5NuOR1xczwsmEUwdIVy7km25Aya664rHy9xUDrV1HmDDZMTUPf3Gr4XpSGVklfQ7ezoLE8DT8x5u0Xn2mQGpixLWqKQfYHoOUOY+RVIXxBJ5AIEf5ynJ9Z8LnQl1P1R/1OAochmPJPw9YNs9U7Qxu4lOLAljCxeu6uggsoCr45qJlHDps1+jo5hTVpv0vHJYLfLotwC4s6ciR/SdD700LW/OZeAKeXI0O7waMZ8mlxt1DK1dGVgFqTv98YGpmYK1Yhzk1N++11M2BTOtiZz+rgtJVeZ0SbMu8jf10/vTFh6/7/F5GMDwIxSkCm6PHUCPFpsxVYkBuYBGXW95skzUXGbZCdGHwgzki5zd+xDWdwdh/5rHFYR/X4zdY+C9l0FBzPL141wWvi8MsOSW9nWqAldBSjLYx5TdXEeZ8zDwbSAHtjBQogRvxqKvmmIxio7R4dFU+C7Vpziyx4GjQzxnscayRle61EPYo/SN7p2JsLHz+KCmWbgsYHWAj/1R5VAqYFgDZ5nhEA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XS8/X9ZrvI9yhrhLtoyCXL3nRUz2AirfX1XEVOvsk2kHjPYgqaPXRUvGPxfmmHK/0qy+V7gbtHcTb68JvhUtzs6wj9VQn8RfB+ssTV4IAaR3Eq9x29CUV9p3uo1k/MPzSwoyPQiG2Yzjj4whGF0FbcjLDFzZXpLFD6BWmeS/9FEa+uJZ/DEqXhTQpOljPMYkxOFEDqqGH8Rt8KJaALEBP3V4VP88ctojbN8oxOLavMgysoBGOmnbAxDHvsSjkAxEAL5aN3LsnST/BtDYj41Ja1fi8I5IsTIGYuu1H+YTvZPnNcBoCgSMpim8cAMJKoT+AT4S++beNGSr5YSU5+VIVz8XafUP8aSexTZfZ2MNSuq6900dd1FUdN9t+Gh+ZsOCK5mwYQ8MtTmQxVSKin5NZRsc3caEmlId4KAAnBY0C8R2P0fSC4yHtsgmepMY9tNu
X-Exchange-RoutingPolicyChecked:
	PCCBWoJwa6q2OefjHKWrd4VYnrtBcjhkdeSd5sT8aRAnpcPs3BCqP9cdwvDS5196Lw70NZHqyfTnyV63QNXoYuzkrpCIhNzTJ7RBrBWCOtUZJBIGUenClNOSVFAd9leB8jAuybS2g9fdbZKkJiP1X+dZ8T3xXAepWfNvnuU7fIjuBPlVydm0WGiZnA6b1B6FrqyY3j73nZNBoWXbNxNDbDf0ED+iXt593CjQON8Ed3L/YXOKByQw7gFmNtjMBBlmwG75aau0BydzUO6yuP0T/vGJLEOXtnv2STOpvd1lBaycZvHM5suXDbNKrcHU5MF8A0GwJmAcg8+ifgt3LElifQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 18:49:22.0186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5285e467-ce88-49a9-7d62-08df18110cfd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6837
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI3NCBTYWx0ZWRfX3ZOlbIN02a1f
 +JnyXWA2FzlD2jfaXncICKI4folhiyNibshwf1LjE6cF4p3NsIHe7F3218XxL93qJMsOygvWY/e
 eJNs9MQxaH31NFqGdGBdqVM/0miVLhH/Cq7YnHLNHpcH+JVXs9g2alo5BMIu6SI+sfnnXkGbtLn
 O82p3ff6dv/nO8PvtuUybUWcA2yTMzwvBnfmkaoYXDZY62GqNRCObI2IvVUbDiPmNbbBgEeOOEn
 4PvDH/k81kZO3mMPyt4pudheMilfDNOQRVkd2jgoaooPVqbNvD02Liv4cWRd1ToWC/OfYdxSmqr
 k/jQJCnIL8dd4sb3A1egF8jpY3NYK6baWb9ZfrBVmSl4xOTYC/VyE9+tZOO4jmM17c6a/KKLmYK
 uqvZklb9hIp8ubTyqy37tZmG6ZaYWiSKiJIBBwaV+hsLjO8VVOChfKQZTHAXa94W91ueoLJHr1B
 FtyZtQFC7VvxEfaoqqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI3NCBTYWx0ZWRfXyuaLTbd7Wg6c
 +I+CRwS751skfJtPri1b99cLsXk3K5K+89GXxpJZajVtB4JURWhI8BTa/97dj+pRlab2tDZo7HQ
 E5btSO5GjC8om/H8rHUVOQtlH8erBLE=
X-Proofpoint-GUID: rQMO76SxmKB7X9kHmQ881Ov20iAMSAqg
X-Proofpoint-ORIG-GUID: rQMO76SxmKB7X9kHmQ881Ov20iAMSAqg
X-Authority-Analysis: v=2.4 cv=X6rHu2Te c=1 sm=1 tr=0 ts=6ab17c3a cx=c_pps
 a=1GamL6rn6SUPLdETXxLFew==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=s826d0Vf4ljoQKYSzyQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210274

The Wave5 VPU supports connecting to on-chip SRAM through its secondary
AXI interface. This allows temporal buffers to be stored on a per-stream
basis, reducing DDR memory traffic.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
index 9e5b75a4e88e2..92dd1b96cef4d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
@@ -1149,6 +1149,7 @@ vpu: video-codec@30210000 {
 		reg = <0x00 0x30210000 0x00 0x10000>;
 		clocks = <&k3_clks 204 2>;
 		power-domains = <&k3_pds 204 TI_SCI_PD_EXCLUSIVE>;
+		sram = <&oc_sram>;
 	};
 
 	c7x_0: dsp@7e000000 {
-- 
2.43.0

