Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0681956C63D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713158; cv=fail; b=fsr+qgB1LC2vl3VpsKiQ/J9Ow5dtJzXGOt6gcvn7gwBxj218kYpcSLduZwFjGqZ1hoKlWZMl8O97393rpxBYzj5gYRRVJaf3UqUfQ1EGwL/PFOnjeUnK9WvPiktSnmFKsW45vg+q6Z/M2M+YIBC713l4iPRYnnsNdBaCA8A1UTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713158; c=relaxed/simple;
	bh=1T6BVsToD8RrAhy4TUM1EgoC0boCbz+Aqo5Xn6lULPU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ghZHq9Y3+a2OhaUv2IGB7AhwURDu0rDlsk/2CGAX4aQKsIMcZrPSspSUagkXHjg4S6Lz0ygmiQSfXSCXYyG9osEPuMkP16vrrAi8Ur2fbkXGwcDL3oF8gy5iH2jVDgafUwwJNyTXJEZXKoN7ye/Fm+Ks7XgD/ZsbWiD5mYoajRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=jb9FNtCc; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=mytPsuSl; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="jb9FNtCc";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="mytPsuSl"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TFgV124076706;
	Tue, 29 Sep 2026 15:18:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=zr0d/SnRQ9mzDq0EqG7SMM4wCS6AglgpUfX4885GU
	eg=; b=jb9FNtCcdhn2VFdkUP3Rzhe+lX7WRFb6zxXx/I0opysQdzWMR0GpmE4Vr
	PqD+B0gTGIDmdmbWFLrTAuYdSf31MaVbpvpeydHgUrA9toW5zKGVsHkiMyHX4rcB
	WyiztSLjROXcKOoPyS//hscdzRZEB+vYtqYuxw5FrsRoXhOx54uQUyuUKxu2UUV2
	Dk2rSh3Oc/E25yKTRFC/I7Ns9W7hzhnF9rAi4AUahXdc6mc/chOtvkIfMUoB5mFX
	zpE3kEhfu6okYngXgba/HZVWEKoaYhFG2BvpnO/T7lETWxpF95uLFaKKKGlWuc89
	g+apaa5+ATN35JNqvVgvaRZPGmIAA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010048.outbound.protection.outlook.com [52.101.85.48])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h03adehe2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 15:18:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IiQMLWXkQIcC+H9ksT4L2treN9GavQPjDFm5WfteMH9xdcPZUVlqUqGmjnkhptyy5RYFOsBRtcy0ASC8vSFaQjDqMgakTJTpKcTi5wG08yTLhvgsr5t2jGocNGCZmrECrICbtMdnPwOX/J3D/yT8jY8iG8VLQlL49tV0vJpd3gfjKRQn4QPlxV5wA9UFfdbn5zzgk6c7RsEDc7XZGI1CFMEHYWedadqIPCdHdrIQxscDcIzzm2+x07JPdxnnoM1GOT442+r1FDHRIdsvBf+pVq5wNyqVHsIi5EfQLl441cQjz29PaypJ10WfuX61zsYyvSHTDqv2Qqv7UoKqoQ3pwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zr0d/SnRQ9mzDq0EqG7SMM4wCS6AglgpUfX4885GUeg=;
 b=HljytQE8PWmYNYxwSrmPvt4y3oc+ZTR5zvFLsZXGatDZM6GhECSRZtY1BZu2opjMqDox/4wSxJmhoPkh2EDx/k/6Bb8cF/senPAA02rC+NZa6VmOls9bT0weYr0iDTd0rjAM1tSWwiQmG09SyxTyMR94+cFfNQefzGoqkc3S5j6HdWs7yBec16HtYuvqyO6rB5ZJnULcUvBSkDbCE8+nihGaI0GXO1gjgLwEyZQUebzbyHAVwJPQqmt/FCdhxGWG2PAd9k4+YdwvNCaWXBotfM3nKQHjdyRQ3jdl7clCpOv/VZ9QI5wCGLgVc0vt/QGRIV0ymnaTWyqDqp2ep7soDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zr0d/SnRQ9mzDq0EqG7SMM4wCS6AglgpUfX4885GUeg=;
 b=mytPsuSl7LkjekvDUrql4QOqpRpGUbevLzaDJEsjV6YkMEsZELkldn9NI9votZJumCV/B2CGVCz/2H6l+3oaAIQ2YTzXLFXzoutdIkSegDSS0JoQD1/xIa1TnKuugXVJQKdK/KqeROWD/AYPoc1+hdu4esauraDDf93raKKCw/U=
Received: from DS7PR03CA0224.namprd03.prod.outlook.com (2603:10b6:5:3ba::19)
 by SN4PR10MB997923.namprd10.prod.outlook.com (2603:10b6:806:4fe::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Tue, 29 Sep
 2026 20:18:49 +0000
Received: from DS2PEPF000061C6.namprd02.prod.outlook.com
 (2603:10b6:5:3ba:cafe::ab) by DS7PR03CA0224.outlook.office365.com
 (2603:10b6:5:3ba::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Tue,
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
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:15 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 15:18:15 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TKHlMg1688208;
	Tue, 29 Sep 2026 15:18:12 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH 08/22] firmware: ti_sci: Combine xfer allocation and transfer functions
Date: Wed, 30 Sep 2026 01:47:32 +0530
Message-ID: <20260929201746.4078803-9-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C6:EE_|SN4PR10MB997923:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aedbf31-a4bc-4847-807a-08df1e66de82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vH6bfyN13dcwn14/a0niST3KpgaChmEDJeZmNVPDnItyeqlhgpSpo7fymYtdo2mTCGi+gmXomq2bI4BjgxxP6pItze58DD9DWLj9PI4C3CH0LTjYuSLEWI7BgbODenWzYiNoFSNjLpHW2te5mcrtQXidXOZn0Da/JyXCz7y4SBzljuEHjHufYWvvpI6sfsJRpTz5HaTJZw/VlGZ+nNauG7ggNBVRRb/tfzPmPPHTiSU2IEetGR3MQ6o9aRTume4h5dedNRaAUd8OGSVVTElGyO17f1TG8ooYtjbj4C43siYQrEQMCwD4lKiuJhNqIXV7y0UbvoSBRYwwrZNMeFhi/2RBDfTxxu0j+QM6esBjMGE7CwXT0MUcNkiG/N9zh541WyQWeUs70yElGYTaVzN0GyYIab+Kyl7QAN7jIyE8eDMaz1eRG2GpUi2/RjhWz/g9+VN50QClL6tjADDq8qsWhQRB0fn2NdD8kdjh0F6RY7xnerGeVh6tjzQtEVvC90dE8yQiwptkpBg+H1DfT+LdKDH6tls8QVgDgtpIwWFCLTjsI6uaVTx9tjhWTJcX0RyHv0YkniS6ZHhIRrUko/DgguAYsa6Iuq6TtIulR4qfp/nmokrBaSKu3WH1pHMTb7n6xj/s58fXeM/p4iI78pjJJGJd/QzfbTNgKnHSKdPayHc7j3LQcjQUB1HhNMrwDVZmWPZStKDy7AaUGQtkNZ0rkA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fOVSxgPUbWYqgmvMgStF/8jla4GFAxxJ8fzyaoqzMwiKZLl/ug8nADtyPo0IXpEpttMejC3ub0R10/wy/cjcPBfKcDRTj/eTyyvEZF62cTT8PYeRJy8ilcTV2dHfRMHm/T3HivWmEaD3G+v29ILQ/578gY8+Aiyo84akYiVR+lQpPa7VY2V8/iFfxu03SZNozB57QqG3JDZ4sejBysv3zVcxdI5TjOLyYgmxPxLfgFt3sQboOj50+S/uKEjTAk03i5oYgZiYuirjdZ5kh5asFB3u9Pdkms5aWYcC4WxOTOcEVhthQ8Hocdv82v4mjgi6dpudYZhcxPut9a5OJ+klPB4Y4iW63gE9Fru2LRtGVsrNrBooDRmz5rECQT58nBI9WKYjl24rmSFaG3jACbkzQ6kRPTVObTGg+UsvWYBKwAHh4ho9gznBfuFBt8ROxHXU
X-Exchange-RoutingPolicyChecked:
	obAjrkK6OkCILe1sZPb3Haw1wADfHKl65ieepK5V9G76ew3OAZpvhU0w/xPxJQcpwjywfiiKC3R9yxh5YRgSlhOgFTUnbgpKg9sSzf2sTVMLopsitPMT3KghcuARZVmWU0UlHmsOLMyffYWynXhWZ7q96t8/ixrR7tHUALCuLSNZJpBguChBWL5KplHVwv4t9PvXBAUBIfeo57yWFFkYttlrA2cc6lMMdSxPEHcJweH8mykGPq2v8+63YgK1PvXyfVABGAubsTmJx9vSIFqaYvfuKA+xr/tn3sVuWcLEKfPtPuWGfk4GTm2v8RVE2+Hz1ThEOZahnqBS+7gzHSX1gQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:18:47.7863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aedbf31-a4bc-4847-807a-08df1e66de82
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB997923
X-Authority-Analysis: v=2.4 cv=c94+0h9l c=1 sm=1 tr=0 ts=6abc1d2a cx=c_pps
 a=INYzEgT09ABq+JfORImVWw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=ZiC-54knQkGZtKUq3l0A:9
X-Proofpoint-ORIG-GUID: siG2Cy5ydY8mfIZpDsfCKPdzg41-aG7F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX+p/AuncLBApy
 M1fv/C8jBvM6HcgquyjZfxezNhyVQJjWjSwREA/hMw9Lu/kqvcOFvxWmzZWwFHR+6wz4KBF76zx
 WkI72qQsPsur0B63nC9LSiu/cnNzBpZgkcX5lO+UWAuh6Ckg/i/2RJBoOMhIc7cbQHnGH+HQJA4
 oTKnmfvwFzPKN/DbZQ9qVAYnTKvbCzr4IBLx015ZaqihNVr1UmZ9y+yzq8bf/EW0g/PxxT3wcX4
 3gUBhLJ4T/7fIOjJwdEiOwUZlwoR3tdcdGPoAS0Xy5mlQsZuND1JZ4F9KRa+Oweq+qICqpMHuHO
 WXZxD9nqb5g10TXaA1/rflmKNrdmCo+Z+PohvZBDmzxevSNl4qmI6BLCT/Fnvuh1orPWQ/Bb+nY
 580p+hrMeEfgka6i8NCW6vvsCtRQD+1D6DUbiQDOPQ+ncmNRE3e1xbidC301N8b8X3zP6buaXFZ
 Wn9BSQhRSl1UA7MnKeQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfXwBlfYL75kfYU
 5eUNTODghaIL/dLNu4OdVMDm1UxWGHU36sXFw/K1O8ENj3kSrknQQqJrjGaRlmpD2QZmvA0FA2I
 SlABtWkBTYIINewB3HJBPzHovEhM4Eg=
X-Proofpoint-GUID: siG2Cy5ydY8mfIZpDsfCKPdzg41-aG7F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290080

From: Andrew Davis <afd@ti.com>

In each TI-SCI message function we allocate a xfer struct and use
it to perform a message transfer. There is now no reason to do these
in two steps. Instead make the ti_sci_do_xfer() function do the
allocation internally. That function already does the xfer free so
it make sense to have it also do the allocation. This reduces the
complexity of all the individual message functions.

Signed-off-by: Andrew Davis <afd@ti.com>
Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/firmware/ti_sci.c | 487 +++++++++++++-------------------------
 1 file changed, 170 insertions(+), 317 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 83b2d4a50788f..6d0ecb77d731e 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -305,6 +305,7 @@ static void ti_sci_rx_callback(struct mbox_client *cl, void *m)
  * @tx_message_size: transmit message size
  * @rx_message: receive message storage location
  * @rx_message_size: receive message size
+ * @caller:	Address of the command function, used in error messages
  *
  * Helper function which is used by various command functions that are
  * exposed to clients of this driver for allocating a message traffic event.
@@ -318,7 +319,8 @@ static void ti_sci_rx_callback(struct mbox_client *cl, void *m)
 static struct ti_sci_xfer *ti_sci_get_one_xfer(struct ti_sci_info *info,
 					       u16 msg_type, u32 msg_flags,
 					       void *tx_message, size_t tx_message_size,
-					       void *rx_message, size_t rx_message_size)
+					       void *rx_message, size_t rx_message_size,
+					       void *caller)
 {
 	struct ti_sci_xfers_info *minfo = &info->minfo;
 	struct device *dev = info->dev;
@@ -335,7 +337,7 @@ static struct ti_sci_xfer *ti_sci_get_one_xfer(struct ti_sci_info *info,
 	    tx_message_size > info->desc->max_msg_size ||
 	    rx_message_size < sizeof(*hdr) || tx_message_size < sizeof(*hdr)) {
 		dev_err(dev, "TI-SCI message size out of range (caller: %pS)\n",
-			(void *)_RET_IP_);
+			caller);
 		return ERR_PTR(-ERANGE);
 	}
 
@@ -348,7 +350,7 @@ static struct ti_sci_xfer *ti_sci_get_one_xfer(struct ti_sci_info *info,
 	ret = down_timeout(&minfo->sem_xfer_count, timeout);
 	if (ret < 0) {
 		dev_err(dev, "TI-SCI timeout waiting for transfer semaphore (caller: %pS)\n",
-			(void *)_RET_IP_);
+			caller);
 		return ERR_PTR(ret);
 	}
 
@@ -434,23 +436,45 @@ static inline bool ti_sci_is_response_ack(void *r)
 /**
  * ti_sci_do_xfer() - Do one transfer
  * @info:	Pointer to SCI entity information
- * @xfer:	Transfer to initiate and wait for response
+ * @msg_type:	Message type
+ * @msg_flags:	Flag to set for the message
+ * @tx_message: transmit message storage location
+ * @tx_message_size: transmit message size
+ * @rx_message: receive message storage location
+ * @rx_message_size: receive message size
  *
  * Return: -ETIMEDOUT in case of no response, or
  *         -ENODEV in case of a NACK response, or
+ *         corresponding error if xfer allocation fails, or
  *         corresponding error if transmit fails, or
  *         return 0, if all goes well.
  */
 static inline int ti_sci_do_xfer(struct ti_sci_info *info,
-				 struct ti_sci_xfer *xfer)
+				 u16 msg_type, u32 msg_flags,
+				 void *tx_message, size_t tx_message_size,
+				 void *rx_message, size_t rx_message_size)
 {
-	struct ti_sci_msg_hdr *hdr = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
-	bool response_expected = !!(hdr->flags & (TI_SCI_FLAG_REQ_ACK_ON_PROCESSED |
-						  TI_SCI_FLAG_REQ_ACK_ON_RECEIVED));
+	struct ti_sci_xfer *xfer;
+	bool response_expected = !!(msg_flags & (TI_SCI_FLAG_REQ_ACK_ON_PROCESSED |
+						 TI_SCI_FLAG_REQ_ACK_ON_RECEIVED));
 	int ret;
 	int timeout;
 	struct device *dev = info->dev;
 	bool done_state = true;
+	void *caller;
+
+	/*
+	 * Address of the TI SCI command function, used in error messages.
+	 * This is only accurate if this function is not inlined, otherwise
+	 * the caller of the command function is reported instead.
+	 */
+	caller = (void *)_RET_IP_;
+
+	xfer = ti_sci_get_one_xfer(info, msg_type, msg_flags,
+				   tx_message, tx_message_size,
+				   rx_message, rx_message_size, caller);
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
 
 	memcpy(xfer->xfer_buf + sizeof(struct ti_sci_msg_hdr),
 	       xfer->tx_buf + sizeof(struct ti_sci_msg_hdr),
@@ -458,7 +482,7 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 
 	ret = mbox_send_message(info->chan_tx, &xfer->tx_message);
 	if (ret < 0) {
-		dev_err(dev, "Mbox send fail %d (caller: %pS)\n", ret, (void *)_RET_IP_);
+		dev_err(dev, "Mbox send fail %d (caller: %pS)\n", ret, caller);
 		goto fail;
 	}
 
@@ -481,8 +505,7 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 	}
 
 	if (ret == -ETIMEDOUT)
-		dev_err(dev, "Mbox timedout in resp(caller: %pS)\n",
-			(void *)_RET_IP_);
+		dev_err(dev, "Mbox timedout in resp(caller: %pS)\n", caller);
 
 	/*
 	 * NOTE: we might prefer not to need the mailbox ticker to manage the
@@ -499,7 +522,7 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 	if (response_expected && ret == 0) {
 		if (!ti_sci_is_response_ack(xfer->xfer_buf)) {
 			dev_warn(dev, "Message response not acknowledged (caller: %pS)\n",
-				 (void *)_RET_IP_);
+				 caller);
 			ret = -ENODEV;
 		} else {
 			memcpy(xfer->rx_buf, xfer->xfer_buf, xfer->rx_len);
@@ -526,17 +549,12 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 	struct ti_sci_version_info *ver = &handle->version;
 	struct ti_sci_msg_hdr req;
 	struct ti_sci_msg_resp_version resp;
-	struct ti_sci_xfer *xfer;
 	int ret;
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_VERSION,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_VERSION,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -564,7 +582,6 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_device_state req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -574,17 +591,13 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_DEVICE_STATE,
-				   flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.id = id;
 	req.state = state;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_DEVICE_STATE,
+			     flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -609,7 +622,6 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_device_state req;
 	struct ti_sci_msg_resp_get_device_state resp;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -622,16 +634,12 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_DEVICE_STATE,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.id = id;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_DEVICE_STATE,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -900,7 +908,6 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_device_resets req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -910,17 +917,13 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_DEVICE_RESETS,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.id = id;
 	req.resets = reset_state;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_DEVICE_RESETS,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -962,7 +965,6 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_clock_state req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -972,13 +974,6 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_STATE,
-				   flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -988,7 +983,10 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 	}
 	req.request_state = state;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_CLOCK_STATE,
+			     flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -1014,7 +1012,6 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_state req;
 	struct ti_sci_msg_resp_get_clock_state resp;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1027,13 +1024,6 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_STATE,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1042,7 +1032,10 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 		req.clk_id_32 = clk_id;
 	}
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_CLOCK_STATE,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -1232,7 +1225,6 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_clock_parent req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1242,13 +1234,6 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_PARENT,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1263,7 +1248,10 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 		req.parent_id_32 = parent_id;
 	}
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_CLOCK_PARENT,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -1287,7 +1275,6 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_parent req;
 	struct ti_sci_msg_resp_get_clock_parent resp;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1297,13 +1284,6 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_PARENT,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1312,7 +1292,10 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 		req.clk_id_32 = clk_id;
 	}
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_CLOCK_PARENT,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -1342,7 +1325,6 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_num_parents req;
 	struct ti_sci_msg_resp_get_clock_num_parents resp;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1352,13 +1334,6 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_NUM_CLOCK_PARENTS,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1367,7 +1342,10 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 		req.clk_id_32 = clk_id;
 	}
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_NUM_CLOCK_PARENTS,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -1406,7 +1384,6 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_query_clock_freq req;
 	struct ti_sci_msg_resp_query_clock_freq resp;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1416,13 +1393,6 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_QUERY_CLOCK_FREQ,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1434,7 +1404,10 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 	req.target_freq_hz = target_freq;
 	req.max_freq_hz = max_freq;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_QUERY_CLOCK_FREQ,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -1468,7 +1441,6 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_clock_freq req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1478,13 +1450,6 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_FREQ,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1496,7 +1461,10 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 	req.target_freq_hz = target_freq;
 	req.max_freq_hz = max_freq;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_CLOCK_FREQ,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -1520,7 +1488,6 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_freq req;
 	struct ti_sci_msg_resp_get_clock_freq resp;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1530,13 +1497,6 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_FREQ,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1545,7 +1505,10 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 		req.clk_id_32 = clk_id;
 	}
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_CLOCK_FREQ,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -1573,7 +1536,6 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_prepare_sleep req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	struct device *dev;
 	int ret = 0;
 
@@ -1585,19 +1547,15 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 	info = handle_to_ti_sci_info(handle);
 	dev = info->dev;
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PREPARE_SLEEP,
-				   msg_flags,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.mode = mode;
 	req.ctx_lo = ctx_lo;
 	req.ctx_hi = ctx_hi;
 	req.debug_flags = debug_flags;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_PREPARE_SLEEP,
+			     msg_flags,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret) {
 		dev_err(dev, "Failed to prepare sleep\n");
 		return ret;
@@ -1621,7 +1579,6 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 					u64 *fw_caps)
 {
 	struct ti_sci_info *info;
-	struct ti_sci_xfer *xfer;
 	struct ti_sci_msg_hdr req;
 	struct ti_sci_msg_resp_query_fw_caps resp;
 	struct device *dev;
@@ -1635,14 +1592,10 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 	info = handle_to_ti_sci_info(handle);
 	dev = info->dev;
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_QUERY_FW_CAPS,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_QUERY_FW_CAPS,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret) {
 		dev_err(dev, "Failed to get capabilities\n");
 		return ret;
@@ -1667,7 +1620,6 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_io_isolation req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	struct device *dev;
 	int ret = 0;
 
@@ -1679,16 +1631,12 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 	info = handle_to_ti_sci_info(handle);
 	dev = info->dev;
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_IO_ISOLATION,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.state = state;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_IO_ISOLATION,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret) {
 		dev_err(dev, "Failed to set IO isolation\n");
 		return ret;
@@ -1711,7 +1659,6 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 					  u32 *source, u64 *timestamp, u8 *pin, u8 *mode)
 {
 	struct ti_sci_info *info;
-	struct ti_sci_xfer *xfer;
 	struct ti_sci_msg_hdr req;
 	struct ti_sci_msg_resp_lpm_wake_reason resp;
 	struct device *dev;
@@ -1725,14 +1672,10 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 	info = handle_to_ti_sci_info(handle);
 	dev = info->dev;
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_WAKE_REASON,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_LPM_WAKE_REASON,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret) {
 		dev_err(dev, "Failed to get wake reason\n");
 		return ret;
@@ -1764,7 +1707,6 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_lpm_set_device_constraint req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	struct device *dev;
 	int ret = 0;
 
@@ -1776,17 +1718,13 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 	info = handle_to_ti_sci_info(handle);
 	dev = info->dev;
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.id = id;
 	req.state = state;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret) {
 		dev_err(dev, "Failed to set device constraint\n");
 		return ret;
@@ -1809,7 +1747,6 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_lpm_set_latency_constraint req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	struct device *dev;
 	int ret = 0;
 
@@ -1821,17 +1758,13 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 	info = handle_to_ti_sci_info(handle);
 	dev = info->dev;
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.latency = latency;
 	req.state = state;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret) {
 		dev_err(dev, "Failed to set device constraint\n");
 		return ret;
@@ -1851,17 +1784,12 @@ static int ti_sci_cmd_lpm_abort(struct device *dev)
 	struct ti_sci_info *info = dev_get_drvdata(dev);
 	struct ti_sci_msg_hdr req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_ABORT,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_LPM_ABORT,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -1873,7 +1801,6 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_reboot req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1883,14 +1810,10 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SYS_RESET,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SYS_RESET,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -1917,7 +1840,6 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_resp_get_resource_range resp;
 	struct ti_sci_msg_req_get_resource_range req;
-	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
 
@@ -1928,18 +1850,14 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_RESOURCE_RANGE,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.secondary_host = s_host;
 	req.type = dev_id & MSG_RM_RESOURCE_TYPE_MASK;
 	req.subtype = subtype & MSG_RM_RESOURCE_SUBTYPE_MASK;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_RESOURCE_RANGE,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -2025,7 +1943,6 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_req_manage_irq req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
 
@@ -2036,12 +1953,6 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, type, TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.valid_params = valid_params;
 	req.src_id = src_id;
 	req.src_index = src_index;
@@ -2053,7 +1964,9 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 	req.vint_status_bit = vint_status_bit;
 	req.secondary_host = s_host;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, type, TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -2337,7 +2250,6 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_rm_ring_cfg_req req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
 
@@ -2346,13 +2258,6 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_RING_CFG,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.valid_params = params->valid_params;
 	req.nav_id = params->nav_id;
 	req.index = params->index;
@@ -2365,7 +2270,10 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 	req.virtid = params->virtid;
 	req.asel = params->asel;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_RM_RING_CFG,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -2387,7 +2295,6 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_psil_pair req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
 
@@ -2398,18 +2305,14 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_PSIL_PAIR,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.nav_id = nav_id;
 	req.src_thread = src_thread;
 	req.dst_thread = dst_thread;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_RM_PSIL_PAIR,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -2431,7 +2334,6 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_psil_unpair req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
 
@@ -2442,18 +2344,14 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_PSIL_UNPAIR,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.nav_id = nav_id;
 	req.src_thread = src_thread;
 	req.dst_thread = dst_thread;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_RM_PSIL_UNPAIR,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -2476,7 +2374,6 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_rm_udmap_tx_ch_cfg_req req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
 
@@ -2485,13 +2382,6 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_TX_CH_CFG,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.valid_params = params->valid_params;
 	req.nav_id = params->nav_id;
 	req.index = params->index;
@@ -2513,7 +2403,10 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 	req.tx_tdtype = params->tx_tdtype;
 	req.extended_ch_type = params->extended_ch_type;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TISCI_MSG_RM_UDMAP_TX_CH_CFG,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -2536,7 +2429,6 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_rm_udmap_rx_ch_cfg_req req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
 
@@ -2545,13 +2437,6 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_RX_CH_CFG,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.valid_params = params->valid_params;
 	req.nav_id = params->nav_id;
 	req.index = params->index;
@@ -2570,7 +2455,10 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 	req.rx_ignore_long = params->rx_ignore_long;
 	req.rx_burst_size = params->rx_burst_size;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TISCI_MSG_RM_UDMAP_RX_CH_CFG,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -2593,7 +2481,6 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_rm_udmap_flow_cfg_req req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
 
@@ -2602,13 +2489,6 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_FLOW_CFG,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.valid_params = params->valid_params;
 	req.nav_id = params->nav_id;
 	req.flow_index = params->flow_index;
@@ -2632,7 +2512,10 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 	req.rx_fdq3_qnum = params->rx_fdq3_qnum;
 	req.rx_ps_location = params->rx_ps_location;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TISCI_MSG_RM_UDMAP_FLOW_CFG,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -2652,7 +2535,6 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_proc_request req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (!handle)
@@ -2662,16 +2544,12 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_REQUEST,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.processor_id = proc_id;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_PROC_REQUEST,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -2691,7 +2569,6 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_proc_release req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (!handle)
@@ -2701,16 +2578,12 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_RELEASE,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.processor_id = proc_id;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_PROC_RELEASE,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -2733,7 +2606,6 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_proc_handover req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (!handle)
@@ -2743,17 +2615,13 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_HANDOVER,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.processor_id = proc_id;
 	req.host_id = host_id;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_PROC_HANDOVER,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -2779,7 +2647,6 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_set_config req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (!handle)
@@ -2789,13 +2656,6 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CONFIG,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.processor_id = proc_id;
 	req.bootvector_low = bootvector & TI_SCI_ADDR_LOW_MASK;
 	req.bootvector_high = (bootvector & TI_SCI_ADDR_HIGH_MASK) >>
@@ -2803,7 +2663,10 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 	req.config_flags_set = config_flags_set;
 	req.config_flags_clear = config_flags_clear;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_CONFIG,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -2827,7 +2690,6 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_set_ctrl req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (!handle)
@@ -2837,18 +2699,14 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CTRL,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.processor_id = proc_id;
 	req.control_flags_set = control_flags_set;
 	req.control_flags_clear = control_flags_clear;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_CTRL,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -2873,7 +2731,6 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_resp_get_status resp;
 	struct ti_sci_msg_req_get_status req;
 	struct ti_sci_info *info;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (!handle)
@@ -2883,16 +2740,12 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_STATUS,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.processor_id = proc_id;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_STATUS,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
-- 
2.34.1

