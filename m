Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B3956C638
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713155; cv=fail; b=dOpN8iHV2y1+YyYiiPvw0yejSsiYaF6C4Xy8V4D2DJLjqqT7wOoIA+/MUOW8ZjAj1LFlIDdwPzf2KWlfRbsjWBRt0i6ZSdN3PpRxgAdFfLt9gmLPitEJdFiMQcZZUdz6UseSQDtde3f8K+bSqXd7Oh8NxDeWm/UH1cMHS3O/qpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713155; c=relaxed/simple;
	bh=BK8qeD4NpyTzvTp+1bLASRhJVT1ySg9dMC27j0PJvdo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AKdQWelFylBpbjVqm87N2YGTUsu1zQIHqvO9mlK/z9Dt9jGfBxBye4pGlTjy0duFSuVcnXZhkrwy9oeG26wgsGM+ggR+flwYvH0MH28nlyxYjbeW4a8tph1K6kkYSmuFRaw4pPJNtalHn1kw9DOiNEXuovyvmSsE9egb0UWHQwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=COivEHFo; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=U5dMNfGo; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="COivEHFo";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="U5dMNfGo"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68TFiDu2152296;
	Tue, 29 Sep 2026 15:18:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=k+LRpfOUpJP3ORTZh8MDbr/iiimom3DpG+tc/G2v/
	Fk=; b=COivEHFo032fbNAUAdUZs3GW+vumoNUjJxodBOMSwrnsLWTjrnONBreAQ
	DdnO7UhWWlnaCJzhMUcdkeTzqRkOq0MVBzvryK2kLRubX5CGlTcnCXQy2GzHS+3E
	GL+AiwxCrSXr6/LMdD4AgHOztwLRDNYya9MBeQxjDDdpBMPuzdV8H0Ww1XLDOx2R
	VIGAdOLFujvE4WVJNbLFDcmtkfVFQE6SriV2qjAQKFy/+CCYM2MbC20zXDMhVS7e
	0OA893nb89PUvzeof4/lhIo2o91YVtMJgth8zGfPNsolu60YiyHohLa5LP0A5rx4
	hHXUu31a447oGEg4Ovs5Joi323Vdg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013054.outbound.protection.outlook.com [40.107.201.54])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h099y45gy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 15:18:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RMSkTbohrip+8TuD+lD7mmSFvIgdwdjjzj4Yw1k6YIvgwk7thE8zqDOobdisv4S5xCZsxTAm16s6AG2OXdzLu/4Bo3aElyuYG7Zw3dLB8J72ghMM8oCuynLhVeNdUO2uws0YlWhFNEln7KwoNb7cnUeHvng1GIwt3zGAZnJFZvkK40gh22lINZcOZhDdK+e/2c1ZvjpjxQVoU+Z3S9osMin38iy0fcH/YZrSjy2ZvFpywzSiw+vDt6hEcaYMEifah0Gg1FVnRjrg2Ry9Sl29AcvI8HflfXimLgi8A8HV7yWg6eAo8sU+53AZdF2ShT5Jyapti9rwT+WXYPi9CqMjSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+LRpfOUpJP3ORTZh8MDbr/iiimom3DpG+tc/G2v/Fk=;
 b=n2iEq+xKvu96M+AXkfC32B9qVx858yoLrQeW7O6aj1sBdBcIi/u403MN1Vq5+WC9QpAaU5P4znJ0oghhn5AIXDe8lUgKxSdzmFkMQVlfeBB0IeaNScXh9tlDrwWtqF9slUtSUen8tWjZDepv+q6Vwlf3G+gwR4/lRjD/x6FJAWMht9tPuxhszTiBiCtLxAxZvsTe4RhK2yV5ls5K/jyA2bAPsxEI0gZpplDx9W+HRa3OvSDnivn79jQRokB9sZpTPWUlwaGK6VgaF9Wz71n/fNX9+eIPNayoCub3/wUksJA2MvbVyaPddkUflzENTLdAbDyXel2juxJtpcE4aVNKvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+LRpfOUpJP3ORTZh8MDbr/iiimom3DpG+tc/G2v/Fk=;
 b=U5dMNfGoIBfwMbBjMlqUpumouxtUvofv8N8x3Thq1jXMs08kYfMtPx2vWx0S18YOmCFRBEkNLBbN2MeNOXbkxFEY7aG4xSgAL80NYvUGBx6WlZcuklM4zktgeBguq3YbHV9sW50JvI0xSBHH7JBmmtDyhTNN9WU6tnHyAHk9vZU=
Received: from DS7PR03CA0216.namprd03.prod.outlook.com (2603:10b6:5:3ba::11)
 by PH7PR10MB6967.namprd10.prod.outlook.com (2603:10b6:510:271::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Tue, 29 Sep
 2026 20:18:41 +0000
Received: from DS2PEPF000061C6.namprd02.prod.outlook.com
 (2603:10b6:5:3ba:cafe::52) by DS7PR03CA0216.outlook.office365.com
 (2603:10b6:5:3ba::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 20:18:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF000061C6.mail.protection.outlook.com (10.167.23.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 20:18:39 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:03 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 15:18:02 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TKHlMc1688208;
	Tue, 29 Sep 2026 15:18:00 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH 04/22] firmware: ti_sci: Remove out of place RM debug messages
Date: Wed, 30 Sep 2026 01:47:28 +0530
Message-ID: <20260929201746.4078803-5-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C6:EE_|PH7PR10MB6967:EE_
X-MS-Office365-Filtering-Correlation-Id: e426bd6e-2203-4024-16bf-08df1e66d99a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|376014|36860700016|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	dZASl0/pcLJGgK7DhGVWk/gJfjTMykObUnoqqCFY2yHjfPI9yO2iI+/3Ndear22dFSYPGEYc4oM0TSXurIlRSL+9aDIgm5WEX/Dk6Pi5L/Jg2BnwuHLdckrqoGZadV5u1fcApQtFil4FfVtTiA3H3E94iNFWB/A6FEU9vHcwK1VV/vcw9qmr18gwH08AclnsLj6ecJ1CYSRn6F763sUqua0Nfk3+LyU04jWWM8Asi5TszyWOyIHfboVw66rwKMs5vCWygKM5P8C1NF3on1Zbb5zwzMd4aapHfxBdwBWtE62oh/jIwauAXpdnh0gsJEmJMkLsjqtJ+VFdHB7URtQizbDOaACpv1O9v+B+eWONe1W2fDyilbZNNjj2TDLriGD1+jQxYyxaHIolXAKfJ3Nb1vfvQ6bf8ivImcFPSWx/l85q/rS4wcvR6gzDhKH77uIWn15KYrkfWtTPM2BFePn2qApc2KSOPonNC35Q+GtcaRO0BvGMk4BeeTJNk2dS/XcHdi5WodDMyRkOm1okCSu/vxCPHqvTtT/Q+S59poHlKZg70QREgSw4B2qqMdxCcEga9TcHIey1DPHIqwuWtRNqV417bQNeGXOLXJ4Is7FVsm31NgvSRbh1cbwCqsARghrkYW29TqHXvXfm/ClYnqWieGJ2f8Tf1PLIkkSKr78m+C+ltWa4bpR9EkFk3gDVubWh2ga10aP1FYXaIrBNCPoDLA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(36860700016)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bjpEr4YHSq3h0iYUx2y2dt4qjNl/l6FA0SfSfxxYaZJXIkakQzrbH6mNwAe3A3KsqXg3J92yewZWSuN5VpDIF52VmQOgrRvT/C3XzmchVptATD54VWeJYSQGxWeIj8/cLjrIIDzpy9k0Nq//Kd1xyK3x2o/meXR/yefyeMSlAWXT1BZ9xMlPfPzHH3qaSN9I0I8X+jFmp36zPLEoeiNVyPDL8cn4k+a0C5ERUEmZHSgab7yRwygt3ofwhaDKWsu0oRi4sjpbRFllRwFCcFEiJHCkwIv34fDOr4E2NIXMV9t5LxaSgSuVAAnUeZ3SeivBUUuWzlM1zkGxSSQhVkUIdTN/Yl/1567GRRJHW/Uwn6E9D3Uh9Sh0QWAEHwezwEvKy2s3fz29337c7T1pELSEeOgSCCtzzOrrbvVd0b/SCFA4u+jwFerZYhlvGK+sO/uk
X-Exchange-RoutingPolicyChecked:
	wKyKF4M4VxSzcDb8UTy0d3x4Sf262V+tggFiG2Kto7V5uhC6k8cNITxP58vxhpNcLOMpPy+QUbvFN8IN05caw7ghpo918A+MqWHDMCz4enGjpWlL7rNZsoJ2QGsxfWrmIL3YQ7KQSlE3d5Ez4JOZXOm87z0JohkkszG3YYSajrv9+jgZK2LvNR9PG7OsZis8hleOFCFLDk3CQCgr9FmA7cemntAIRB2gQu8QLD8VZDaBsiz3AoIfkUSgWmdqvd0vfeA8hcth+NLV/b7VttRYiuQ03GO//OKc7ttRYh6qQT4ECK029be0qnq0h47TV1MJFYgvImg1SwBydO7YRIdxAg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:18:39.5260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e426bd6e-2203-4024-16bf-08df1e66d99a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6967
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX6ippYLBv24xY
 frhdke3B9LGEBEfKpy50Z2RBECYq8pqkK3Kk6foiK3y5fylEgTXMWGaAyuExYqCNEZPIFUpHltO
 D2g3R7Vc+XSeaK8EhxiDf6O+n4+5uf2h2ITfJeK+DSymb6W61DJ4yNSF4M/gdvcHLrRNlJfByzo
 KZI6qgfQ71rp2bs1EH3G8klY+iOWehu/shfOINaHHazOBjWDyyu+oGSQUMAE1OED4ynEjIsHV3q
 3/ESO0PevZBao0tZbdEHjGIkQUhjxRQosTo0t05z06dZEHV2NpzRETPC+n3pD8Oerjh9nLfxU35
 nwADJgINK+Il6C7p+39BTrItHCyaDUshnyPSICfK7U+Q/X1HnI6OMioGya1ep8hFB1RNFymoKuy
 ZsUZz5rMvSDJKAzmEWa6rL8eYTvyXcNxOERWL5x8JFndrQwPd3M9PKjvvJTk1IePHOQnv9sfZ7I
 EKOXa6tgYu/lqoJp9xA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfXz4fau3O5gQlB
 LtfF329+RoEXCYZQCt4FrU/GQ//NMr2snTZg6GwOBTJ7aY0OZ82mVDTRTtoKWEGHPdv2yuhzofk
 HEQNWFEwem0rQhR3yVHK1jgVPE7pkOw=
X-Authority-Analysis: v=2.4 cv=GdGCDgXL c=1 sm=1 tr=0 ts=6abc1d24 cx=c_pps
 a=ikWRpWbkSoEIfbFFe8At+Q==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=h3hOHIXeJSkHiXZvtOwA:9
X-Proofpoint-GUID: hi8N-wuMZvty7CL9-GCKLD1sgY6xPkPN
X-Proofpoint-ORIG-GUID: hi8N-wuMZvty7CL9-GCKLD1sgY6xPkPN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1011
 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290080

From: Andrew Davis <afd@ti.com>

These debug messages only print out the index param that was passed in
from the calling drivers. This does not add any additional info that
wouldn't work better in the calling drivers themselves (k3-ringacc.c and
k3-udma.c). These also make later cleanup around device fetching more
difficult, remove these debug prints.

Signed-off-by: Andrew Davis <afd@ti.com>
Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/firmware/ti_sci.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 6ec16fe57f132..a91db923c8939 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -2405,14 +2405,12 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR_OR_NULL(handle))
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_RING_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2439,7 +2437,7 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
-	dev_dbg(dev, "RM_RA:config ring %u ret:%d\n", params->index, ret);
+
 	return ret;
 }
 
@@ -2555,14 +2553,12 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR_OR_NULL(handle))
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_TX_CH_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2598,7 +2594,7 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
-	dev_dbg(dev, "TX_CH_CFG: chn %u ret:%u\n", params->index, ret);
+
 	return ret;
 }
 
@@ -2620,14 +2616,12 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR_OR_NULL(handle))
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_RX_CH_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2660,7 +2654,7 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
-	dev_dbg(dev, "RX_CH_CFG: chn %u ret:%d\n", params->index, ret);
+
 	return ret;
 }
 
@@ -2725,7 +2719,7 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
-	dev_dbg(info->dev, "RX_FL_CFG: %u ret:%d\n", params->flow_index, ret);
+
 	return ret;
 }
 
-- 
2.34.1

