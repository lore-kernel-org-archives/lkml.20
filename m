Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C53A568FB2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713148; cv=fail; b=dAEszFFwrLXwHE6g0CK5K555T0wz6gljFFcd6HSrsCmvUUuaB/K5NzGVHVz0l+M9NeFrO+yLYR5MxpIRBIHNinBgY0gHELhx+pvCJu7l4jFUCSm6Tov3ws2+mpYulz3tZjnKOb5rQyDJMa4PBAAoTapKO1KoJhhwbqELJYYgmPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713148; c=relaxed/simple;
	bh=LQTNrvV7vxL6rSuSFPYas/xORUhUMMts8hOgX81mvl0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bm3s6Aik5zpKf1EStdZetxSfSokUsiv0A6lqlrGEfdkU7wI2F88Jb7LV/gOslRilfSkKf43uZm8Xsb/mXzhVpnna+ZqskiOD2Xr2jYHGq3gzFfZM21Wl7MlEaiw+V/mRDMcfBgft0kUUzbKzCrD/0pHwMkJ4KWdI3NQEod/6BgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=p+/qxZZ2; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=meC6OnAZ; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="p+/qxZZ2";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="meC6OnAZ"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68TFgImh807515;
	Tue, 29 Sep 2026 15:18:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=yelg8g7Wlh8LovaLeUqjAa5Xi0NLFGAuZZj22WuZO
	Dw=; b=p+/qxZZ2IA0e9YDRPyHljXrbbamuE3v1ByyNgbSVTDrOZR2QfGEQCrqm7
	piXYnCFxWZGLdqeJDW16eWxcUu0/cRqr9Vqbe8MDrOHhwYADAQvKpMYXpSHPFGyo
	Ld1MHOYwy/Y7rl3oIXA2d3EYhxfrkq+ZP72SFOfxnc5U/tG4vTjUjuiMPjfKgUen
	TV7aW+4cR4yYeaYC9cNP63vs51ktkZw5SmD2Je08weV5TBi4aI7UEzAFe0/3s4O4
	ftffrlj6Nw+SE1BX2k79OrJnfVxTqtmDafwhz32/i1oFdRh4JG/Q2N1iC+oIun40
	abse7oCeUYDy6H9g5MJzxKy4VHsJw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010003.outbound.protection.outlook.com [40.93.198.3])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h02j6ej0y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 15:18:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WxIHUS9uCiK5kFqJUsElunX77rWya/kFMYjOpDyfDkFtOFjAWG6lINTbqTLZLfT8Ggd6X6DAjf6dEpNvo/N0Plum6IElRToM1NlgDPscgSzYfyu0e8sdAWE4guyS/XIR0tWbfygv16GBrKD8lY3ttH2C2Hei/iRtbqB16H6RFsxugftsgoHmPRy6lsaZSOkRfGbSS+PpgeUUGISjUCI7hD4HUtIyfw/OUvi1+JDyYRu3c3gMt+h3TemS3ivFw3t8afJARMAXtQ0uxir3RLl2RV8GkgzIuGgEjvNsXXfhjx6pyqo4a91KSoJMgbiOEl+KW3zY9K/gADfyBOvz9PBfqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yelg8g7Wlh8LovaLeUqjAa5Xi0NLFGAuZZj22WuZODw=;
 b=iIBKS2RngkZKKHYj5fgZ/8JH/SqyxBqLRthjv5zAJy5MN4V9Z8LS+p6PxBDp6HMzSCMAYLTUfXml4bUvKWVAtbMzQshRvVkcOw/A4IPP995B6Tl/DXspaTW55/Ug0Vf6Ose5O+FEsNjlo3slIOEzsdhgHFMqTuXIm/sSWbLe4YZ9lE6cioWfvLNYhTdQW25XiI8g1XMkeF0PgP/fTzCPGvBckCTTAEqwZkG9FwIc4nusfsufxCbJQHhDSRlMVCm/nnVJ/0J9slM08YZMsoOyGh5gaykEnu3qNJxeWsPJihnEjLZU+89W4wXYYLTQZ+pNAvzaGS4aRMoFRGYTBJCVOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yelg8g7Wlh8LovaLeUqjAa5Xi0NLFGAuZZj22WuZODw=;
 b=meC6OnAZaVyq1vwKr+fJI2v/cQjXmeshrkXtcbGrP9OB1UokomJAslHufgRtFoCXEX38dDbO5Zex4TFIFeEng6/GACHilgaqknv1wKCrMeLnwaAdLS7IUhGR59JAnqhTybOko1MlvWoo1D46eKhVSTguq0ULSyVtbumwmJSo3BM=
Received: from DS7PR03CA0228.namprd03.prod.outlook.com (2603:10b6:5:3ba::23)
 by SJ0PR10MB4685.namprd10.prod.outlook.com (2603:10b6:a03:2df::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Tue, 29 Sep
 2026 20:18:49 +0000
Received: from DS2PEPF000061C6.namprd02.prod.outlook.com
 (2603:10b6:5:3ba:cafe::6e) by DS7PR03CA0228.outlook.office365.com
 (2603:10b6:5:3ba::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Tue,
 29 Sep 2026 20:18:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF000061C6.mail.protection.outlook.com (10.167.23.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 20:18:47 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:09 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:09 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 15:18:09 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TKHlMe1688208;
	Tue, 29 Sep 2026 15:18:06 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH 06/22] firmware: ti_sci: Handle xfer cleanup inside ti_sci_do_xfer()
Date: Wed, 30 Sep 2026 01:47:30 +0530
Message-ID: <20260929201746.4078803-7-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C6:EE_|SJ0PR10MB4685:EE_
X-MS-Office365-Filtering-Correlation-Id: ccbd4e0c-8d19-44a8-aed7-08df1e66de4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|18002099003|22082099003|3023799007|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	FPpwzU12pIyZvlj3Jx4MiTYTQQR03mtUCl2+j73sh/OES02MP6vvdTLTPfDRTjr8aKVzPlEyiIlI1R+S97kFc+ujRCKKMH+lZsc63T3+IHLpOCiqOgWHmvujLnQcPshYlELu4tISr99sWiu1jSvZY8QZjs65OB3JrwjmJkDRwNZxB4DX0tD1ndt9uTnl6W8yBLpKM1uXzPH7judsXD3zeMrhSg3wqjUFFZY6V01EZ+jhnbooUEycHK0A+33WI4/nk0J5TeTX5GrACoehLOMs6+gi4eViVRFqMMCZ1yPJqXK1Aor8Ezh1NcdtT3br0uskXyEhbHK8gbcMTvBARsYS5KmnuQ8184TKqpQ8ncngmLbyzOIvk0QaR3T3M9Cew+Y1ilqxE1VeEZ7z+t+5OrZuQSLZSahV2dZhrmFyMDRX3n9/h0wby8CalawwuzJMIr9ZXwuXR6agP7Ozud4jCpU+3PnWVf5GEf7cWiqYuMNPtFitWJyZ9L91ivE9ZJIQPz1z+1v8SHmQ5AgZqCU0YI85/+DfAxSlKyuwKQs+67IpQIISljdSXF2tDSJQVDB03A2QT+MA/jpyNT+U81wAJr8q7Vxh09XJZxac2iqE0ANjJieqRaO3lpFYfE1L5JDRT5yjM9kMQbR/4wsIqsd5woIVBalPXfoMV+k1YOkSZdRSBjUbp3bIxqpT8J76CuFvo5074kRFP1YI9pg84xjeP/xULw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(3023799007)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2VsKIgeZuNYpX5tFmAUgCm5fJmkIn+62odGfEoQ/wF5SqeemdWVmIsYm7ypSUD5g/JUygtwkCVkcGVQxvDToYCnlrBgzqWh7jl25PzZIv0NxBPd9v8p3Wx9kfOTFDiK4AFRoW+IPQjRGcGVf3yD3EKv66uWCfSLKbkAhLE/3Ek4wyYgM5nNyyJOb7Ycq+cj1dmF2+Mi++OOOe3GLddh7Y36MYCmhiUvfaJKWK1Q/7ft6VPBhSzdRgVK4aWCbxjqlrvrEA0P4hrzDxEcbocyuYQBkCA81EZxrOrjwHM7ilo2390a4QBQZl847FQqaJgKNdRg7Pp1pRZr80VPIDIfanh6Mi2XB1mR6P1RgOdHcewjtIIbYGgHLXuMxyc/clhublkl2AvJa6W7Ldi4RGUwQ6PiDATANgVtYuiy171VCq0fx5OxAhSvPvZ9rQ2Ig0EBe
X-Exchange-RoutingPolicyChecked:
	jVT/bPH+rmb2OaIUbcWd6rrTCrcKfXQkxSBdh1FLJQAJepoHN1MbDJQn6/iKId8ZgOMO9pWrd092HkYmotMCIAlmbqDPWniuZQtciZYZbA9ev6MUl5eSLm6iV+kSodOagLmunipLp4qlPE0hTatsZBh6J6DJ5ixy1+/HNKoHm1zBHvGLIWe3gWigEM8OmFaS+ra1c6mDRKU4edttQ9SYo9Gf9ke1ILYY8K/1fZgeOVKEhTnLwLYsjf07G6MqxDn16w+XhNDuxJJ0VLz7BgyR2eV+jzofAQe3rhGvHVlro+tYVyWl6SscGgUHVesssrUTD1pumv68RDrXSvdqmxPxCg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:18:47.4204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccbd4e0c-8d19-44a8-aed7-08df1e66de4f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4685
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX4BZdpQJYPXIi
 QNq3OB/yIbA3Az5rfKmnOid4CUk5EMNuETU8U0Hc2tuQ0JTLWvYBxAzncGyBfhhlJnvx9KWlmzS
 nXblr6lTO7GkRoUAwwBNuZIvoC6iGHw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfXzf0bytLPmUv8
 Sm07S7pmuzShF/3H1ludjjFgZ/s78TrRyLaEtRp+aLvYFsKpkVGZD3vp0X958SOvUUXF+ClEMK0
 JZwSA8iB+85piliM88PWfQ6aS1zMUFeuDR3EjRRuD7Ocwh0haOIFxiFhDzR2w9AgADzz/pGGvDn
 lL40gz1DFsUUM0Ek/xB0xV9mCAk2syNRYFA2dqfSXJw5+N864doWOyH4c2g1AYbmJuoj/z3ejYH
 N1eEqa1n2fG4v4LM7BWLSS5i1192w97plFRjP3RVJOIFEUC/NNjH9YSDB3kEYOUBaqbDV4tcF1P
 GXK0f3YuP5rH86menkBqIoufOgk3Eey5JYKES0nZIPegzq4v6Qz29Gew9Jfr3GiugKg65iFSHFd
 P22pzNL3DrB44/oV1g//yuKZCc+8QQ2monOCN/T7hiPwI4MKeKi/m1Stm2HZ9bxX3TFqy7pj50m
 61BNZL2cQuzlB0yFAUQ==
X-Authority-Analysis: v=2.4 cv=Z4p5j3RA c=1 sm=1 tr=0 ts=6abc1d2d cx=c_pps
 a=u8Zh/y5cvmLMdp3U04oolg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=U3diLxmOwd7Fp4-x424A:9
X-Proofpoint-GUID: MnOGtVESz33q3CRTfnsfFCZTdfhvZ9ij
X-Proofpoint-ORIG-GUID: MnOGtVESz33q3CRTfnsfFCZTdfhvZ9ij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290080

From: Andrew Davis <afd@ti.com>

Pass the response struct to ti_sci_do_xfer() and have it fill it
when a response is received. This makes the xfer struct no longer needed
after this point and so it can be cleaned up after the transfer. This
prevents accidentally not freeing the xfer by the caller and after a
follow up patch makes allocation and free of xfers handled entirely
inside the ti_sci_do_xfer() function.

Signed-off-by: Andrew Davis <afd@ti.com>
Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/firmware/ti_sci.c | 471 +++++++++++++++-----------------------
 1 file changed, 179 insertions(+), 292 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 9081288bd133c..c1f783bc67353 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -43,6 +43,7 @@ static DEFINE_MUTEX(ti_sci_list_mutex);
 /**
  * struct ti_sci_xfer - Structure representing a message flow
  * @tx_message:	Transmit message
+ * @rx_buf:	Pointer to store received message
  * @rx_len:	Receive message length
  * @xfer_buf:	Preallocated buffer to store receive message
  *		Since we work with request-ACK protocol, we can
@@ -52,6 +53,7 @@ static DEFINE_MUTEX(ti_sci_list_mutex);
  */
 struct ti_sci_xfer {
 	struct ti_msgmgr_message tx_message;
+	void *rx_buf;
 	u8 rx_len;
 	u8 *xfer_buf;
 	struct completion done;
@@ -298,6 +300,7 @@ static void ti_sci_rx_callback(struct mbox_client *cl, void *m)
  * @msg_type:	Message type
  * @msg_flags:	Flag to set for the message
  * @tx_message_size: transmit message size
+ * @rx_message: receive message storage location
  * @rx_message_size: receive message size
  *
  * Helper function which is used by various command functions that are
@@ -312,7 +315,7 @@ static void ti_sci_rx_callback(struct mbox_client *cl, void *m)
 static struct ti_sci_xfer *ti_sci_get_one_xfer(struct ti_sci_info *info,
 					       u16 msg_type, u32 msg_flags,
 					       size_t tx_message_size,
-					       size_t rx_message_size)
+					       void *rx_message, size_t rx_message_size)
 {
 	struct ti_sci_xfers_info *minfo = &info->minfo;
 	struct device *dev = info->dev;
@@ -368,6 +371,7 @@ static struct ti_sci_xfer *ti_sci_get_one_xfer(struct ti_sci_info *info,
 	xfer->tx_message.len = tx_message_size;
 	xfer->tx_message.chan_rx = info->chan_rx;
 	xfer->tx_message.timeout_rx_ms = info->desc->max_rx_timeout_ms;
+	xfer->rx_buf = rx_message;
 	xfer->rx_len = (u8)rx_message_size;
 
 	reinit_completion(&xfer->done);
@@ -447,7 +451,7 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 	ret = mbox_send_message(info->chan_tx, &xfer->tx_message);
 	if (ret < 0) {
 		dev_err(dev, "Mbox send fail %d (caller: %pS)\n", ret, (void *)_RET_IP_);
-		return ret;
+		goto fail;
 	}
 
 	ret = 0;
@@ -489,9 +493,14 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 			dev_warn(dev, "Message response not acknowledged (caller: %pS)\n",
 				 (void *)_RET_IP_);
 			ret = -ENODEV;
+		} else {
+			memcpy(xfer->rx_buf, xfer->xfer_buf, xfer->rx_len);
 		}
 	}
 
+fail:
+	ti_sci_put_one_xfer(&info->minfo, xfer);
+
 	return ret;
 }
 
@@ -507,32 +516,28 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 {
 	struct ti_sci_handle *handle = &info->handle;
 	struct ti_sci_version_info *ver = &handle->version;
-	struct ti_sci_msg_resp_version *resp;
+	struct ti_sci_msg_resp_version resp;
 	struct ti_sci_xfer *xfer;
 	int ret;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_VERSION,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(struct ti_sci_msg_hdr),
-				   sizeof(*resp));
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_version *)xfer->xfer_buf;
+		return ret;
 
-	ver->abi_major = resp->abi_major;
-	ver->abi_minor = resp->abi_minor;
-	ver->firmware_revision = resp->firmware_revision;
-	strscpy(ver->firmware_description, resp->firmware_description,
+	ver->abi_major = resp.abi_major;
+	ver->abi_minor = resp.abi_minor;
+	ver->firmware_revision = resp.firmware_revision;
+	strscpy(ver->firmware_description, resp.firmware_description,
 		sizeof(ver->firmware_description));
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-	return ret;
+	return 0;
 }
 
 /**
@@ -549,7 +554,7 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_device_state *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -562,7 +567,7 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_DEVICE_STATE,
 				   flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -572,12 +577,9 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -597,7 +599,7 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_device_state *req;
-	struct ti_sci_msg_resp_get_device_state *resp;
+	struct ti_sci_msg_resp_get_device_state resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -613,7 +615,7 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_DEVICE_STATE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -622,22 +624,18 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_get_device_state *)xfer->xfer_buf;
+		return ret;
 
 	if (clcnt)
-		*clcnt = resp->context_loss_count;
+		*clcnt = resp.context_loss_count;
 	if (resets)
-		*resets = resp->resets;
+		*resets = resp.resets;
 	if (p_state)
-		*p_state = resp->programmed_state;
+		*p_state = resp.programmed_state;
 	if (c_state)
-		*c_state = resp->current_state;
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		*c_state = resp.current_state;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -892,7 +890,7 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_device_resets *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -905,7 +903,7 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_DEVICE_RESETS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -915,12 +913,9 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -957,7 +952,7 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_clock_state *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -970,7 +965,7 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_STATE,
 				   flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -986,12 +981,9 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1012,7 +1004,7 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_state *req;
-	struct ti_sci_msg_resp_get_clock_state *resp;
+	struct ti_sci_msg_resp_get_clock_state resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -1028,7 +1020,7 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_STATE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1043,19 +1035,14 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_get_clock_state *)xfer->xfer_buf;
+		return ret;
 
 	if (programmed_state)
-		*programmed_state = resp->programmed_state;
+		*programmed_state = resp.programmed_state;
 	if (current_state)
-		*current_state = resp->current_state;
+		*current_state = resp.current_state;
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
-	return ret;
+	return 0;
 }
 
 /**
@@ -1235,7 +1222,7 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_clock_parent *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -1248,7 +1235,7 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_PARENT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1269,12 +1256,9 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1293,7 +1277,7 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_parent *req;
-	struct ti_sci_msg_resp_get_clock_parent *resp;
+	struct ti_sci_msg_resp_get_clock_parent resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -1306,7 +1290,7 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_PARENT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1321,19 +1305,14 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_get_clock_parent *)xfer->xfer_buf;
+		return ret;
 
-	if (resp->parent_id < 255)
-		*parent_id = resp->parent_id;
+	if (resp.parent_id < 255)
+		*parent_id = resp.parent_id;
 	else
-		*parent_id = resp->parent_id_32;
+		*parent_id = resp.parent_id_32;
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
-	return ret;
+	return 0;
 }
 
 /**
@@ -1353,7 +1332,7 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_num_parents *req;
-	struct ti_sci_msg_resp_get_clock_num_parents *resp;
+	struct ti_sci_msg_resp_get_clock_num_parents resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -1366,7 +1345,7 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_NUM_CLOCK_PARENTS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1381,19 +1360,14 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_get_clock_num_parents *)xfer->xfer_buf;
+		return ret;
 
-	if (resp->num_parents < 255)
-		*num_parents = resp->num_parents;
+	if (resp.num_parents < 255)
+		*num_parents = resp.num_parents;
 	else
-		*num_parents = resp->num_parents_32;
+		*num_parents = resp.num_parents_32;
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
-	return ret;
+	return 0;
 }
 
 /**
@@ -1422,7 +1396,7 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_query_clock_freq *req;
-	struct ti_sci_msg_resp_query_clock_freq *resp;
+	struct ti_sci_msg_resp_query_clock_freq resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -1435,7 +1409,7 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_QUERY_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1453,16 +1427,11 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_query_clock_freq *)xfer->xfer_buf;
-
-	*match_freq = resp->freq_hz;
+		return ret;
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+	*match_freq = resp.freq_hz;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1489,7 +1458,7 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_clock_freq *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -1502,7 +1471,7 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1520,12 +1489,9 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1544,7 +1510,7 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_freq *req;
-	struct ti_sci_msg_resp_get_clock_freq *resp;
+	struct ti_sci_msg_resp_get_clock_freq resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -1557,7 +1523,7 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1572,16 +1538,11 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_get_clock_freq *)xfer->xfer_buf;
-
-	*freq = resp->freq_hz;
+		return ret;
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+	*freq = resp.freq_hz;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1602,7 +1563,7 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 			TI_SCI_FLAG_REQ_ACK_ON_PROCESSED;
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_prepare_sleep *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct device *dev;
 	int ret = 0;
@@ -1617,7 +1578,7 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PREPARE_SLEEP,
 				   msg_flags,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1630,13 +1591,10 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
 		dev_err(dev, "Failed to prepare sleep\n");
-		goto fail;
+		return ret;
 	}
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
-	return ret;
+	return 0;
 }
 
 /**
@@ -1655,7 +1613,7 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
-	struct ti_sci_msg_resp_query_fw_caps *resp;
+	struct ti_sci_msg_resp_query_fw_caps resp;
 	struct device *dev;
 	int ret = 0;
 
@@ -1670,25 +1628,20 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_QUERY_FW_CAPS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(struct ti_sci_msg_hdr),
-				   sizeof(*resp));
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
 		dev_err(dev, "Failed to get capabilities\n");
-		goto fail;
+		return ret;
 	}
 
-	resp = (struct ti_sci_msg_resp_query_fw_caps *)xfer->xfer_buf;
-
 	if (fw_caps)
-		*fw_caps = resp->fw_caps;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		*fw_caps = resp.fw_caps;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1703,7 +1656,7 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_io_isolation *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct device *dev;
 	int ret = 0;
@@ -1718,7 +1671,7 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_IO_ISOLATION,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1728,13 +1681,10 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
 		dev_err(dev, "Failed to set IO isolation\n");
-		goto fail;
+		return ret;
 	}
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
-	return ret;
+	return 0;
 }
 
 /**
@@ -1752,7 +1702,7 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
-	struct ti_sci_msg_resp_lpm_wake_reason *resp;
+	struct ti_sci_msg_resp_lpm_wake_reason resp;
 	struct device *dev;
 	int ret = 0;
 
@@ -1767,31 +1717,26 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_WAKE_REASON,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(struct ti_sci_msg_hdr),
-				   sizeof(*resp));
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
 		dev_err(dev, "Failed to get wake reason\n");
-		goto fail;
+		return ret;
 	}
 
-	resp = (struct ti_sci_msg_resp_lpm_wake_reason *)xfer->xfer_buf;
-
 	if (source)
-		*source = resp->wake_source;
+		*source = resp.wake_source;
 	if (timestamp)
-		*timestamp = resp->wake_timestamp;
+		*timestamp = resp.wake_timestamp;
 	if (pin)
-		*pin = resp->wake_pin;
+		*pin = resp.wake_pin;
 	if (mode)
-		*mode = resp->mode;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		*mode = resp.mode;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1807,7 +1752,7 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_lpm_set_device_constraint *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct device *dev;
 	int ret = 0;
@@ -1822,7 +1767,7 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1833,13 +1778,10 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
 		dev_err(dev, "Failed to set device constraint\n");
-		goto fail;
+		return ret;
 	}
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
-	return ret;
+	return 0;
 }
 
 /**
@@ -1855,7 +1797,7 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_lpm_set_latency_constraint *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct device *dev;
 	int ret = 0;
@@ -1870,7 +1812,7 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1881,13 +1823,10 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
 		dev_err(dev, "Failed to set device constraint\n");
-		goto fail;
+		return ret;
 	}
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
-	return ret;
+	return 0;
 }
 
 /**
@@ -1900,13 +1839,13 @@ static int ti_sci_cmd_lpm_abort(struct device *dev)
 {
 	struct ti_sci_info *info = dev_get_drvdata(dev);
 	struct ti_sci_msg_hdr *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_ABORT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1914,19 +1853,16 @@ static int ti_sci_cmd_lpm_abort(struct device *dev)
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_reboot *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -1939,7 +1875,7 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SYS_RESET,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1947,12 +1883,9 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1973,7 +1906,7 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 				     u32 dev_id, u8 subtype, u8 s_host,
 				     struct ti_sci_resource_desc *desc)
 {
-	struct ti_sci_msg_resp_get_resource_range *resp;
+	struct ti_sci_msg_resp_get_resource_range resp;
 	struct ti_sci_msg_req_get_resource_range *req;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
@@ -1988,7 +1921,7 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_RESOURCE_RANGE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1999,23 +1932,18 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_get_resource_range *)xfer->xfer_buf;
+		return ret;
 
-	if (!resp->range_num && !resp->range_num_sec) {
+	if (!resp.range_num && !resp.range_num_sec) {
 		/* Neither of the two resource range is valid */
 		ret = -ENODEV;
 	} else {
-		desc->start = resp->range_start;
-		desc->num = resp->range_num;
-		desc->start_sec = resp->range_start_sec;
-		desc->num_sec = resp->range_num_sec;
+		desc->start = resp.range_start;
+		desc->num = resp.range_num;
+		desc->start_sec = resp.range_start_sec;
+		desc->num_sec = resp.range_num_sec;
 	}
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
 	return ret;
 }
 
@@ -2087,7 +2015,7 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 			     u16 type)
 {
 	struct ti_sci_msg_req_manage_irq *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
@@ -2100,7 +2028,7 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 	info = handle_to_ti_sci_info(handle);
 
 	xfer = ti_sci_get_one_xfer(info, type, TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2118,12 +2046,9 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2402,7 +2327,7 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 				  const struct ti_sci_msg_rm_ring_cfg *params)
 {
 	struct ti_sci_msg_rm_ring_cfg_req *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
@@ -2414,7 +2339,7 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_RING_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2433,12 +2358,9 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2455,7 +2377,7 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 				   u32 nav_id, u32 src_thread, u32 dst_thread)
 {
 	struct ti_sci_msg_psil_pair *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
@@ -2469,7 +2391,7 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_PSIL_PAIR,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2480,12 +2402,9 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2502,7 +2421,7 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 				     u32 nav_id, u32 src_thread, u32 dst_thread)
 {
 	struct ti_sci_msg_psil_unpair *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
@@ -2516,7 +2435,7 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_PSIL_UNPAIR,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2527,12 +2446,9 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2550,7 +2466,7 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 			const struct ti_sci_msg_rm_udmap_tx_ch_cfg *params)
 {
 	struct ti_sci_msg_rm_udmap_tx_ch_cfg_req *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
@@ -2562,7 +2478,7 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_TX_CH_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2590,12 +2506,9 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2613,7 +2526,7 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 			const struct ti_sci_msg_rm_udmap_rx_ch_cfg *params)
 {
 	struct ti_sci_msg_rm_udmap_rx_ch_cfg_req *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
@@ -2625,7 +2538,7 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_RX_CH_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2650,12 +2563,9 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2673,7 +2583,7 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 			const struct ti_sci_msg_rm_udmap_flow_cfg *params)
 {
 	struct ti_sci_msg_rm_udmap_flow_cfg_req *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
@@ -2685,7 +2595,7 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_FLOW_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2715,12 +2625,9 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2734,7 +2641,7 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 				   u8 proc_id)
 {
 	struct ti_sci_msg_req_proc_request *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -2748,7 +2655,7 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_REQUEST,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2757,12 +2664,9 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2776,7 +2680,7 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 				   u8 proc_id)
 {
 	struct ti_sci_msg_req_proc_release *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -2790,7 +2694,7 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_RELEASE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2799,12 +2703,9 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2821,7 +2722,7 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 				    u8 proc_id, u8 host_id)
 {
 	struct ti_sci_msg_req_proc_handover *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -2835,7 +2736,7 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_HANDOVER,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2845,12 +2746,9 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2870,7 +2768,7 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 				      u32 config_flags_clear)
 {
 	struct ti_sci_msg_req_set_config *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -2884,7 +2782,7 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CONFIG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2898,12 +2796,9 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2921,7 +2816,7 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 				       u32 control_flags_clear)
 {
 	struct ti_sci_msg_req_set_ctrl *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -2935,7 +2830,7 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CTRL,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2946,12 +2841,9 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2969,7 +2861,7 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 				      u8 proc_id, u64 *bv, u32 *cfg_flags,
 				      u32 *ctrl_flags, u32 *sts_flags)
 {
-	struct ti_sci_msg_resp_get_status *resp;
+	struct ti_sci_msg_resp_get_status resp;
 	struct ti_sci_msg_req_get_status *req;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
@@ -2984,7 +2876,7 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_STATUS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2993,21 +2885,16 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_get_status *)xfer->tx_message.buf;
+		return ret;
 
-	*bv = (resp->bootvector_low & TI_SCI_ADDR_LOW_MASK) |
-	      (((u64)resp->bootvector_high << TI_SCI_ADDR_HIGH_SHIFT) &
+	*bv = (resp.bootvector_low & TI_SCI_ADDR_LOW_MASK) |
+	      (((u64)resp.bootvector_high << TI_SCI_ADDR_HIGH_SHIFT) &
 	       TI_SCI_ADDR_HIGH_MASK);
-	*cfg_flags = resp->config_flags;
-	*ctrl_flags = resp->control_flags;
-	*sts_flags = resp->status_flags;
+	*cfg_flags = resp.config_flags;
+	*ctrl_flags = resp.control_flags;
+	*sts_flags = resp.status_flags;
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
-	return ret;
+	return 0;
 }
 
 /*
-- 
2.34.1

