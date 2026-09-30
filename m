Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED565187EA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784477; cv=fail; b=fjy/JUQWyY8Qvw3BgYNzoEifnY/e5g9Nk3pAiojlMVeGFajtuIlPWnmjpAb9BCt5Oawo5OnUDR+clIW8QaXwhcHbg7Vp4mxLPLo29483pjhNymTxbPotpKQ4hh5Oj01ojmF3NR5oq4nm74RGsrr61gTQWv0/DgX+cSwq63uvtsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784477; c=relaxed/simple;
	bh=SKcxgHx+7o/02DntrlYqf+LW3mGMRXm/APtJEdhx5ok=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NHs7CintUyk1M2BYh97+/mVVckYzxFENzUmiXlLHeGCeh6Tf4VtBbnX+xSzyv7qdlgzG5yGlwzEL+Ywxc4f4L2DwzDiKVsVMmADYZjiSEHKLY/fGnZmvkJe6uM9S/yZKdWP+NipIiZO7HmdWNKtvKF+urOXiB3iuiJirbQW0KbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=JFhB0FwB; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=qESE0alL; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="JFhB0FwB";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="qESE0alL"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE1b0P3556035;
	Wed, 30 Sep 2026 11:07:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=5k22NRAAXjuwkvWHUySIQtpzi7xx0RaApR2O7juW3
	6U=; b=JFhB0FwBiTGSKsKWYjI+oTBSZHrYpDhoOKOHfXz8reUDQnqkT3V2NKgn3
	Miq8CCF0AvZ40xkAKSKyK2Y0b/B0GYD6VAZe5KdXJ6lWR16v/aDWbe5wbSfEh6sh
	22cInOAmvD48s5jtRN1vKurtl8huJtOxjwSv6fInRLzXGOriF+eE/VGalNlL3hHq
	uhZkCSir5AD4SGtqmbta0QPPduBB9HfEdpOELcyr3O4nIS9QWJwpcBarCH/8/0SC
	XbFceOfl7W9lptBaV/4T4/xE+q0lngOuXh39VPJNmHSV29LmKtVu2efe579zCjYt
	NRqRu0Sv0h3b/4Sfs8EE2m2diyS5g==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012020.outbound.protection.outlook.com [52.101.48.20])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0ydvacnq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 11:07:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IpOolZpOrkU+pcpc+PbfRnqvYHwD87ByHfIFDatK3mOxjs+Rz8SJ0ZFnT/SR+AHmXEEZdg0g0t0PU714nd+WzAgDmdn7IjCyZdmdzseAkc7U6JCNHsHCQrCPak3buy/ecOCz0RI6Zn2y/YAmD8qs/LMJf9FP0JZRWI9kynbFdFq6T5ix6O4VaW+fQpuiS6KCPSw72z+Ywrcip2prXjaGo0PouKmqV1+kjyyZCptV1PqAH2GfAc7AU8DggGeuyTl7StPQhyB3TBiVs1kEFht3n3+g37oOhXRNH6239+md7h+Ms5+ylvBevwZEdGpv2HPj/jBezX1c0ja+y40GJb0tRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5k22NRAAXjuwkvWHUySIQtpzi7xx0RaApR2O7juW36U=;
 b=GgNLKA3EXKE5hpVm6vnV1+bSRxOrY9F42kZ5DtaITjKSBgabNJo36EsDDkkfq5OjIQnASgbNI97CbFbZXWWzt/bvcfEc/jgf8L3K8P4cqQ4empChEIK3KljjGJdHPF8aoNqrRCp6RbUqOQlsjU/G2lNn7e+2Z9NLS7ppaYxkpj7W3ZfyjJCutINhhmau36JZUq5e4BokIAL9VpBuuApnybNfG0ucJUbV5I5JHC6GJsRsvVENUUZAJH/TX8mRERGughy8tH/4aFLM/9x/0ZZCdc5Vbuac4zpqjwoXiE0WLhTtKL/carMJlyBXpjwCQB506au93xoz6pyNegmhhq7lew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5k22NRAAXjuwkvWHUySIQtpzi7xx0RaApR2O7juW36U=;
 b=qESE0alLJ3JfVD6Gr9uFGSYYreN+HtzG2BoZ7/eSX5zD51wqidDD0HCVJilCSw7T7wbjphlKJ6fYCLmqUflKTy9tAkTH1kPQUCAgaiEWDmS5xMgPuawNKW69eKma2EgWZ6JZeLrKf1lIBCxMRZ7cGtK2dlKE3RaplvJyKg+EZ9Y=
Received: from MN2PR14CA0012.namprd14.prod.outlook.com (2603:10b6:208:23e::17)
 by DM6PR10MB4394.namprd10.prod.outlook.com (2603:10b6:5:221::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Wed, 30 Sep
 2026 16:07:29 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:208:23e:cafe::7c) by MN2PR14CA0012.outlook.office365.com
 (2603:10b6:208:23e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 16:07:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.3 via Frontend Transport; Wed, 30 Sep 2026 16:07:28 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:36 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:06:36 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UG68WB3425232;
	Wed, 30 Sep 2026 11:06:33 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v2 08/22] firmware: ti_sci: Combine xfer allocation and transfer functions
Date: Wed, 30 Sep 2026 21:35:53 +0530
Message-ID: <20260930160607.2674980-9-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|DM6PR10MB4394:EE_
X-MS-Office365-Filtering-Correlation-Id: c8272e8e-cead-483d-e6f3-08df1f0cecf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|10067099003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ER/SEwDglyleKTu53LOLvlHHYVgGxizpNkNB0jjV8EkJi8GpBh5Olq3opsDu+U3Ok76lcZHNDDdfZ9ed8XEPDnhzZrpaF3U2X1lxvAV5rl1EcJ1WLRH6a6bdabJgREk6xclNyIOvidfeQpZn21xwqo/MyCEJCtuUe7hKVuY9UyR0+v/9frSlOGnE0hkZtTDeZBO+bIPWNPdN0xM7XvPA04RZABnJALRnIDvrrNf2ZOU9yZUjNMMvX2AK5+bdfM+iqS+Mb/klDfYVureICFHtxd8dJMDIHSUhbeZnr6JR3e43Go9xOk+88jrFGWg9Rv+iums7BX9rhC/Vt+5yyOPmLdK6iEKVzWIUCTELsxBnM8rdhudHbKYtCJLUljKk4jNQUopdJUSCHgZ7W5ajoCosjeiWsOxy88waBTseguopgA9Gu8lusKw8rpCbb154miN6tbNDm5DBTbTuaN8vMll7ervC1tNKSQJLnqEhlp6uzCGerfLkwAlrul/UosNeS2kc0M1ybODXzcpkflXHKVeTnSuVcRSpsGBbDMvM6SSOiIukxK/INXLx/+jKaiXiHCZhpFgXDjrAfq9V0u2t5PYlQ77aEjtjYk9blj3lJNLIHe/0yPP5d6/9BbbB59ez62XqSkKEqssF+32CMWYce+RxbEGr4eaNPfA3Nk8V+X3ERTpKzO9IfFiYsmnB3xcrbbQlkoQqb8elHSNUJnVvInqLcg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YwZ8tjgki7C9pigTtoZ5hfeIhG+Rj4aMfgJT6QZ1HV35OywHBpWjhdPjPV/G4bzb5HGiGY8OLHBQhDV3D4RgVkNpV0WxhHLEJcgTs6nDozbhH12xbDhED7jey2LwBHwyI6ytQzJLj9BCUdKXih8NuedSzkJ4W9GkmA/mBdqUkmGPrYG0Z7VG32zf//R4mtEL4ivtogN0Wo2L5HxTDomzQ1ewHY653R2gvK39kvMvtN5uNidTnjxvGBWX4DbQNpq8sCtHqgc8dsqW+XbJ95PsMzQ1tZQ7kHLNznHzHfDFb5uRaqRvd2QE6duHd7UGhoqpeLTumBpkCZOokQ/L56UizqdR19AXwDfuqtrr/ugXgcq+EwroT6UH44EReSE9RKD1OQN8YdLKGKuBXRqwzuCnSRXxeOBEX5+iqzvsGyYXBkJ0UtL849N/j91T31lpvouF
X-Exchange-RoutingPolicyChecked:
	Nlt/fE0CgmZU9lwyN5sSx2lwqPqkwYaRE3TYdbULyd9xCPaMa9ItejowHvW+SInA/+74IFxCivPx3dRQHqg59VSHKpIAmWHo9N/4B+fHJrRW6hlIDz5F+9FbSmBQQRwfytvwwwLR/yd3NIMnyj+Kzo1JDmBpAv3tbYMQnUIdjEQTtHl8TXH8aQJBalHTs1F29rgbpp7onBZF/Ykwnor236QLcrKRGa59yy9GApf2+WZaqoD1/Po6Wlr2/f73ZELmI2TW9niyPmVyncdz+604FaY6s2QneesjcLWHmr9I+g2TeQapNQaUHucFKocOK0z72h+UJashNG7kQyzcXCD90Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:07:28.4313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8272e8e-cead-483d-e6f3-08df1f0cecf4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4394
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX6J0mwaBcT3dB
 VNlarJ8MYEGZ6nqYDFPkWEPRpKXgyiGRGnWZ2ULETD3XbGyYO9UQ2GvIITchFnp4nIbzP6xlwgX
 iTBLp33iJo7NmfrTj9HDVzVqunKJSBY=
X-Proofpoint-GUID: 8e_jBO2UOy9zSB2DqqZnCqkVaEE1Qxkc
X-Authority-Analysis: v=2.4 cv=TegDJhQh c=1 sm=1 tr=0 ts=6abd33c4 cx=c_pps
 a=wPn5mG08gX1eKnPfDThLSw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=ZiC-54knQkGZtKUq3l0A:9
X-Proofpoint-ORIG-GUID: 8e_jBO2UOy9zSB2DqqZnCqkVaEE1Qxkc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX1nJbzv5CQiIG
 PQz2/SJKn91N8rCax8Rw5s9Qqrr/WFOuiM+u9mjUNXUOM+k+390x9CxUmiinoS1BoyOl1qsfuOO
 H+UNXzpvdkwPS1yr7ig4etB1RjTjm1W/cOjNedt/usvwVwB/txGR+n3BKv+Oe/IJq+5LPYtY/zB
 +O/P0yz0yIGQ9M2y/HpS2oF52531lml7Nkp6WJws/qPDROowEbruVgjTjZCBKKPq3s2f/w/2dNc
 FWFjqJDF3ndcBK8o3DC+nod8oxipXbFGdbymuP3m333pMhKmOGXzg0Tf2KYnXQbJMesDwbyy/eq
 6TANIV6XBx+JSLd/KXj49U6md+/l3tJ3WGC+As2NOdUB98SaEZhcwTBdl6YnlebokK89TxqRYO5
 HbIdiE5badOWR9aNqeDbV+rKqqWaNZGetWXMEV2dh5GS+5QE2apcxmdJUJjvk4eqD1tb23lidcU
 wNNnaU/h2eMqoEykZMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

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
v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-9-b-padhi@ti.com/

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

