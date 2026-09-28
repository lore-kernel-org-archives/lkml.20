Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFB754705E;
	Mon, 28 Sep 2026 03:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790566290; cv=fail; b=hwTLJNNveOUQBkIfIktu6n/aC6+ESOIKMr+7NHUV9K3Y0IYGAprdEoXIXiEeRSm7sohvqXBfoNvgALJs04WPyGd4gV7RN/lkYkD0wHk5DJo5Z2IhE1Yd5ngYuZGTcfGKaGkAlrgiesuoSJx8wJHX9/951s8okotIEK+V42wVHMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790566290; c=relaxed/simple;
	bh=d+YV7nPMGO4YBHjIyCa+TrvIFQvWRah2O/eV+TTcP7I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b/gySOArmzpdY2rhCVdx1mXpcLJ+Jx3b5eSW3K3ARLJbjj6YKGUTK1XMpFW25XLZXbT+hX1B1a7UMvN1IVATfpc9UZl8PVBLQXwOncnzuGTz8ig98OVj/C1ksl938k2oecQbVo9MTtbK2y5i0t1Y2N44f8ot+QiI9roDpTHWQ1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Pi8zgct4; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UGFuASYg; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Pi8zgct4";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UGFuASYg"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RLXfqp2284521;
	Sun, 27 Sep 2026 22:31:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=1gaITTSCWdu4fa9DWAo1nluX++v7j3PVrQiT4ayCN
	sI=; b=Pi8zgct4gxMlYMUQNiNltKL0h1ZCWq+otzJZuOvueqKNddALQy3K8/nAN
	DtxYzmaChmYamnAN7ESyqbrLKkxxSUCmSfaUg3GqDPrDf9kfV71Zy2TRr8BEgcY1
	Ly5jG9vBCSrE9N/DWe54q+f88t+vAd199ncrt+9gwA2aWmirTC7bp//K57OAnNTY
	RpNzOu8SK7BFPE9REQ7bmVsMIQi3pmKr58GN6dF/e3AymlSo7a5RwotTbU4kPkho
	L9mYs0KQxtWmZIevsjMgB1pwqkKtGbDOkmkrFE3Y+QFkOp5CbLC/ZPHQkSWkeNUN
	uBCfqhoCIQOe1RD5YVaiKeDsaAtvg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013049.outbound.protection.outlook.com [40.107.201.49])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxw6num69-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 22:31:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXQKTDX7TuYJZKDqC5zhzPycz5TqGq4T3ThyiOGRiQjwXYh8k+CI/qJpgZWGk63SXaAIt8So+lN7UDC1EbRAcGLs4tohSbmAUIU5OIYb9joRnp9DNUfxf4DBgK1bpUC9ty6hd7IGjn1GUHStCTLXZ/w9XHOgcapbRxbhX9rleriv0uOLgN2w0WPvWVZxK2msV7NKCtC+j/TDGeli5A8Xj1lfy0tELUEpqgI+y/IM5GlQcO9t3q6nH6vq850slqzzd8IhH75n4jYanSAP6tgH1aT6eaBmB7OkWuU6VLLS+y3m3LYq8TKx/hLHpHUyA/iAmruglWM9b4R94z8umR2vTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1gaITTSCWdu4fa9DWAo1nluX++v7j3PVrQiT4ayCNsI=;
 b=NvUf9RYkwXMht+7SEKWtgJjnopAY4eKQ5mcxyi+hlebAC2hNo8C4A8j1QdP/ngRnpqgTyIfPzRV07a5w+5ZCMcQ7DY22HHgHpY7e4eJuPbjCesxTJifCpl/Ih64siC7FHUzsZgqgSXCiTlh1IjolUifrmgVH06Unvq8GhnFIARIV0Xr95py2whD3oQV6+eksghXow1+iYnpBkjD8YBjuJx1lFtUepFi7vAONUznUJub1l1d+2JwyHsBdRVqri150z7LA4ECsR1G20hofo7jH3ErDlJRdC/feQ/Jt6A8AqS7Q8lNUrIxqWxAKb2c5x5p1Gz/507pRruke1uNV0uQOEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gaITTSCWdu4fa9DWAo1nluX++v7j3PVrQiT4ayCNsI=;
 b=UGFuASYgglX41Qm+79tw2LTdfZ+I39LJe6NEJpU0Fo+YIO2FxiaYtjlV7ppn9TgOS2GCWoUy9A5NlzK7v6+DdL52wJL9SyoTcZe9m+hVzI9fc36HTnFMm9/0Bi2wIXb9EQDOZF/HEYJag/p2wtsjn529u6kOkJjfB9I2pizKavI=
Received: from BN0PR04CA0058.namprd04.prod.outlook.com (2603:10b6:408:e8::33)
 by PH8PR10MB998089.namprd10.prod.outlook.com (2603:10b6:510:40c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 03:31:12 +0000
Received: from BN1PEPF0001854C.namprd05.prod.outlook.com
 (2603:10b6:408:e8:cafe::21) by BN0PR04CA0058.outlook.office365.com
 (2603:10b6:408:e8::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 03:31:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF0001854C.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 03:31:10 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 22:30:38 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 22:30:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 22:30:38 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S3UUvc2302035;
	Sun, 27 Sep 2026 22:30:34 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-adivi@ti.com>
CC: <hnagalla@ti.com>, <jm@ti.com>
Subject: [PATCH 1/2] arm64: dts: ti: k3-am64: Drop MMC CLKLB config
Date: Mon, 28 Sep 2026 09:00:17 +0530
Message-ID: <20260928033027.1077689-2-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928033027.1077689-1-s-adivi@ti.com>
References: <20260928033027.1077689-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0001854C:EE_|PH8PR10MB998089:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ad92a9f-fb11-4d31-a0cb-08df1d10f098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|921020|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GBjz1ph03mOj7QaLni766673rOxJRqCRwn0iccwSXLsFStUDfQgDS4ktLHquI8FNsCeEiGQJMFOvim57SZMZtERKxuDCroGTPox6jKUM+TPGmwWog3o/lw8jtAIYjZ7ar63QA/N4SZOGuY+d77OJjSv6YwpZ8l6h8W88NHl5YCURoo7rcDZJL27ggvzcHwv67LoESBdln+Ec6S13ZqYuJVBvtXLAcsrzSdxesfVc8uQHza8IqZP55fqGqCev5hT5OtY7AuZYahsPt6yx3LbdzFJl6Q56w6EvEl9UT9saefIccccfVm86kaflu52s+RcmikcDnT3oJjpI6nKxiTpgQgFfC2wq1eEJOVNDhzeG1ZoXuqtUbzATOvaL3Wl5Qn2IoB2loj7lHEh/yV8bmDPedPNVaF4NTV5HLKPE+A8l82UpbJbkVbOnEQRc8LQnJDWyDJoWvoTCBNZZo+a32fs0oQt7nS/ifd9ITOhD8p2am+1I2D6ZchVgBw/K8S/FrSwdGjvo61dLDEU8mqqOv7NjXVAOOWHW6dFpQ9WLLOidyYRnjIRsZduAY2iaAL/bMD+KAauZikoYmigUw8iwUPNlP2ALO08vvp4zxvZWOa1uwJ7smnR9OfR6mzlyF6M4PzFEHZ2gQq/m1B0E3sXuMz0nxpmxEvxs1gWr6e8/rPwZZc8qGa7y4Z3hFj9nHR4t6gHbIsK8OtTrmP47q9EtKglS3RWMgUBXiuhG+TnAGFezd1vUxGWlnjDSGcqoUjW/U3hN
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(921020)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4nDvL8LHG/WQAX+JvAtRx487GiXDK5QvR6XrKg9ffQ56CwW5g+kV2QkIEKaj35bzAfz0Vwg6OVdU3Z6BwvwUlSPf4eC06VfnVpjYYMpxx8EdkmznLYV+hkmXTSvDlXR4SjiOqC2fpY6mZuOAAQiPx+OaKcd8hrzllG/Splx18VuiEUk6xm7OMmBT1+4uf9vGrW8K4LMcfQj7F4murefUtLgLqlmyR09MjiKbMurPm6Tvwd/QuhSyHh91QjcYoFzxRKInPv7h98AYDTu3ygqC3DSXSkfp5V6/kLtcoDNHRsyR3yJixdhPgfZgDKKcJ6ZenIFJl72wwsABZYD3u3TqwMoiZX8WHGg6eJkbFtFguXQGxEHb/rRj2YWDNYr9OmmgPuhDD9N6Mfvho0M1wKFvazzKBdUWUacf76nmrH0FXyDkT9O4lWeu610oDsNAMlJS
X-Exchange-RoutingPolicyChecked:
	vxgQ8F5Qw15mKdWT/4bnqylycoZcdSMcYBQumQ7qfBQU+Gnoz4kmmzs4+VCc4jtOkcMX7lZ7QUmF8RJBLpWc/TVzHpVoQvJx6zuj4uFTKrYDjZEtxOsQgd9e11aExEYR5fy1z01UcXOlQFq4lkS8QrCAp3XFNgY19QC9dZh48g2hNUfa03eP44+WaxQR6/sbAb5IyVZcAFKVpB/7cZTeprBfRhr+eJqCdatn9Yr6ip4ye4mjaaBpSdmfmL/qexlMFdnZaYNlf0BJq3yVtav2q5k5/BGIQtprzoaPR13zfszpoSlNXVdZy6V0Lnnb9OwbIEU7HS4B2k7iok+mXySvAg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 03:31:10.2004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad92a9f-fb11-4d31-a0cb-08df1d10f098
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0001854C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB998089
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX5/7Ys+Nzxn9O
 vI8z5PtNeN4nUkhOg9GAZSg6lHrFD8q+0Ci+vkZ9BQ5E4JL0+LxaTcAEWT/xoFIDZe6/sKpmXHW
 atvY+yU7o7dc6ArNIKVyj4RglDxTlvM=
X-Authority-Analysis: v=2.4 cv=dbkVTnXe c=1 sm=1 tr=0 ts=6ab9df83 cx=c_pps
 a=Yfwwr8Yczqb7c+94X7Exug==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=sJlLEdIlWDMzqQUrJloA:9
X-Proofpoint-ORIG-GUID: REGiiJT-2gBSV1d-R4PrQZ41nO0PqOUh
X-Proofpoint-GUID: REGiiJT-2gBSV1d-R4PrQZ41nO0PqOUh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX+WoILEaxngEF
 /oj7XmCn25FnTqU67ffBNu1x652QP179wvXlw1pXegM9p6rUtkbHXF/vH4prvogArru71c9OLJg
 APMO2jgOHzhvEIVIIO6reHIy6kChZy40tv2cDVivZsc+QSdODlkvx4mfCZCeRB6V2oBl7SAKye/
 cSpEzIGI3sOVTzX7JufXB5QbMuUpD7NFqZC5yHCWpMbBIyTEtiS6lghqgmCvvKwGJgvOD13Qbxk
 hLsdVZZc2yJ+l0ajfHp4Qgo9KWs6Oldi9NxjtlRhknOlyUkBMf8BXNF0WAeApwXUO0Si7qcmWtL
 H9S/+Na3PFBpfLHga1JuFOR013udFgk1ZquiPB37JIx46Lweuea+H48NMIQ8lSgL6DIA12S51jh
 BPQLI3/sw2XPGIHZU8xFs2Ags2Ptl4TY6i9gRKyE16VLXPmga04ibXED84H6fU14EOFDuF3upub
 3wIMSPvTgONBEbQQcHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280013

From: Judith Mendez <jm@ti.com>

MMC CLKLB pins should be left at default state since it is set
to the correct default values after reset on the supported
sillicon versions.

Signed-off-by: Judith Mendez <jm@ti.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am642-evm.dts | 1 -
 arch/arm64/boot/dts/ti/k3-am642-sk.dts  | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
index bc4347cf71140..a8c256269859e 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
@@ -260,7 +260,6 @@ AM64X_IOPAD(0x0280, PIN_INPUT_PULLUP, 0) /* (K19) MMC1_DAT2 */
 			AM64X_IOPAD(0x027c, PIN_INPUT_PULLUP, 0) /* (K18) MMC1_DAT3 */
 			AM64X_IOPAD(0x0298, PIN_INPUT_PULLUP, 0) /* (D19) MMC1_SDCD */
 			AM64X_IOPAD(0x029c, PIN_INPUT, 0) /* (C20) MMC1_SDWP */
-			AM64X_IOPAD(0x0290, PIN_INPUT, 0) /* MMC1_CLKLB */
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
index d28a38c87f32a..6b50997780448 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
@@ -201,7 +201,6 @@ main_mmc1_pins_default: main-mmc1-default-pins {
 			AM64X_IOPAD(0x029c, PIN_INPUT_PULLUP, 0) /* (C20) MMC1_SDWP */
 			AM64X_IOPAD(0x0298, PIN_INPUT_PULLUP, 0) /* (D19) MMC1_SDCD */
 			AM64X_IOPAD(0x0294, PIN_INPUT_PULLUP, 0) /* (J19) MMC1_CMD */
-			AM64X_IOPAD(0x0290, PIN_INPUT, 0) /* (#N/A) MMC1_CLKLB */
 			AM64X_IOPAD(0x028c, PIN_INPUT_PULLDOWN, 0) /* (L20) MMC1_CLK */
 			AM64X_IOPAD(0x0288, PIN_INPUT_PULLUP, 0) /* (K21) MMC1_DAT0 */
 			AM64X_IOPAD(0x0284, PIN_INPUT_PULLUP, 0) /* (L21) MMC1_DAT1 */
-- 
2.54.0

