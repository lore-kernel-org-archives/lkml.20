Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0671E56B862
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713157; cv=fail; b=mcfwCphqPhiXr2czkV+QTmVYFMqMDBgvbQpKSPWEDwJmXYX0l813JZBWlyBIc+58NDfqF6prwkN6zmiOaKHTCqxuq8McYQzdqIA+ycgzwJcXAgjG3LHyIYEPn/vY2UOBa8PZar2RqBDfegviJDoHa3EMPCLa4gtojDhHNXJ9rfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713157; c=relaxed/simple;
	bh=MdkyBfXyF9BUBmXpEVdYlmkcBGhPMDPoTlMA27tI0vM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nrz3/zBqNqa6iy5bX7qMh3zJPRbSEViTSxh7bzoggX1zUIT7x0OYQvjZEtPPGLF2mIYuIWje76stL3CSj+YeIrxkDStj191+zXeF7P0EtyieLjMXC+wHF2p14jz/ZqzQfXIAP3IFId0UsD02xTXpn521Gr37kcXvo7zvxciUbU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Xc8U22Uk; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=skcXFI5T; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Xc8U22Uk";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="skcXFI5T"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TFZMiA4076699;
	Tue, 29 Sep 2026 15:18:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Gvhtm4am9MftDl2LlatwpDdm8uocJzk6kA4Ncp16/
	bw=; b=Xc8U22UkAOHBdydsiWDUEn4ge3E9MvyyNazxXsuplimKavxkkhRqNJYt9
	jutJDQ9hOMsFLaezY8hRM8p8eC9Qly9+PWPbphxO3/tsPbrFckNgs2OIaq8K284P
	0masEmfIHV+0ev6E6NZATBicraPY9fEtMpMWsCSJu3zyahTiiXyju4LsaBRYM922
	CfHxJ/wqfx4dWNelB3u34pPlvBswPT9ifaQ9oVciJ1+gw0QLXthA84eit6WPo4Sh
	T84hroWuNAd56p/hrOv3UaenPqH8Z4HsqOYaIqy9gDGgrYsvu04NlfcOVZ3iZsra
	hqbOAC3i5LSQBinE9NUtPHLrn5pEQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011019.outbound.protection.outlook.com [52.101.62.19])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h03adehc8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 15:18:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hjNijbS1iCKlJCoFly57AkmY7IDh/8Urq4mCsd6y8MKfh3ISaN7nPOvFMdT1ccFFey/a9IH+bJPoJ5iAeWL34wAPMxBkjX3SxrgVqfejQxQkZeL91gs0NoklZ9xOqaoLmZkMrOQnEzY+0OomoowMmh3Zoa7Ov2eqYbfHGoFfSQxk1+owee/upv0sVkgcRc2sZsLfFzBoarF5PteBXzhayPUX6EyTkkQe3vtoVxh9+Hx2gDvEM6S+VTeEppj+izsAkONCi7QOkLqbhmipbirUMkXy1S8WvG9kG+TjeBUxw4i8tlftqP3NAgqccC1Sxd8XXKwhtmqcZ7V3yldriQNxAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gvhtm4am9MftDl2LlatwpDdm8uocJzk6kA4Ncp16/bw=;
 b=swuxZLbVuZngjZhap0/IVOrmKuf49nGmbbUlHeG/nQcQPA8LtIHmqEIKcCxj7EwA3AdRw5viJaLnPPS2kBhvFlGL1mdUJQ+lNEF7W/1CMRKBkxBRodh26+njK8nCAm5OSkO+k62G1eJKt9mtONSLBCe2dpfQWCYMWqGyZjKyWy7w2X29LtuBfzaycRW1K6gkSLSTS8NbamZwL5sfuBYHHw+LUqQxqkgLBpuS+DUIho4pzkI9Mz5JDtcpwol4GshHqvM3F5q7900WsedlOUTKkfw4Mg4RyzTV/GW/wrMyAXJqOxjp2F8F8kcpeXnx284rNQ4kNQzV/sHcFsSaFLAVWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gvhtm4am9MftDl2LlatwpDdm8uocJzk6kA4Ncp16/bw=;
 b=skcXFI5TubkqVy8tr5T8uNQMQRnbFK9M857f28m6RXhOdHciOKvNjZlawv6JaganiUS0jKCYS0rm3sSVPyp4oPi1M7e6ciJP63+nfA5+4eu3cK8vUZBhxxWqyiyovnxmFKOpU2+Z4iwyiVeja+mUU9GjKwhdi+kbETam6lEok+4=
Received: from CH0PR03CA0441.namprd03.prod.outlook.com (2603:10b6:610:10e::34)
 by CH3PR10MB7436.namprd10.prod.outlook.com (2603:10b6:610:158::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Tue, 29 Sep
 2026 20:18:10 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:10e:cafe::8a) by CH0PR03CA0441.outlook.office365.com
 (2603:10b6:610:10e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Tue,
 29 Sep 2026 20:18:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 20:18:09 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:00 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:17:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 15:17:59 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TKHlMb1688208;
	Tue, 29 Sep 2026 15:17:57 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH 03/22] firmware: ti_sci: Move check for ACK into ti_sci_do_xfer()
Date: Wed, 30 Sep 2026 01:47:27 +0530
Message-ID: <20260929201746.4078803-4-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|CH3PR10MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: 52a1b342-556b-4306-2ba8-08df1e66c7bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|18002099003|22082099003|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	0hBKeVOs/6lJ8DMsDl/A/FfUmNcYfpsGJBN5krU3Eq9IYFVHGerii58s8VGPIWgLOM4fx189VgJVLL8IaTVu2tU3xCnLHnGoG1iPoRyEojljFywfqRDkYNsyeA3aqMvTAP/JhRLHYsZKga+nkfrkSg764uQhqXrVV0nvJPToGrewHqi2RTWcJU/cF1W412poclk4qK6wB0bx8Djfcc+rCa0sHaVPuzxu9qArsZUWyvmdFNYPQhj9M3e4V4WpOuQUsoKtRvuS2Siz22T6IkbZlGjstdn+c1BZCkAqmdhZ1wIJhMj+C0d66IwC8CFJZjn5Y+rCiiXhdGszgv1C9K+rLSuFqvHpnGfZSJq846VOswBS2kkj0OuNtPEtqMEcmByNcCeVkX7Jq78bRTpeEJs+BFzAJ5C8e9WaxmQH6vqJB4V5NSNC0uqWckrSVWXlUfVICTIwtiI9m78j8e2bWMRTDYKkxP1G3WBagh78cFU++eGOdhddJyc48G3OAtwzyp7+iSDJgrAXdtkdOWkFLJ/XD8Zk6li2nmAEPi59SwgvpSPhLn8alAAPa8UuhfR2z1woOZmLDXN065LUCNIGaZ1bzc/BUQ27o3ZouAFWjxPWNsiRXmWrwA+LXQXOiUu1nkdtx+Ojcol6xKDtoMjWaCyquO3wfm25Vttqih5ernoGdIsbe+eYrNP4B+i5WJxPMGyL62UXRemvw55U8rGd8Wrd9A==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1umL1gsfmGvru7zyKevinae52k9iPT/2POtZhradTqlMZcQPrqHCHbLQjPj6dr9MwlHJenaI4VyPfML6V80NNbHEwG6rSAg2u0JW6WZGYSmhGxcVCb9z7xEy3YuDlgUX9n6u3XYFBq5hahOKM6e4QoQBSz02zms2RVfmh2wn/VLmYtQCK0NRCyLNfZ1ZtRPfDb6svmKWixGnFFN6Dp7gwNKuqEhxxkK3wceqXT7pi5VXLa+LjFrdooAB44NuT0/goUoGtlJFi+3iu1MTaPpo+AXWRmCHwlSLO/Sn2mHf2LRcI3H4SjfgPEJ4Z5edEflCs/ImoB1UYuHg+YBCjxYvJvLX9nE7OP9LfNNdctZe+ZY3YSHK/bnFymySkY0kVVTTVpuVtA+oJ/CxK1xa3j0PFhaVqTJyPWqN5Qtpv4SKDpDMCE6cQN4OzKv5/7rDbCOJ
X-Exchange-RoutingPolicyChecked:
	t6NGRGiY3fxTinbUfiHRyhLffD9hhXf7+Suws8cOB9D50v83CF7B3wATWR3sq5/NC/gF1gzt8TwCPI63bqjRampUzj4Si0qI+32K/dpkJx/Nw1Lps2KSgfjvRlgwV9hYFrdY2yrgJfTx04g9a6OvZ5uP8puq3fu850G470WmCvxE27I0UkI9u+wBZXgQIwRr1D3G2DCyETFtnjepJrAz0oeBipaQziFbGasO1nc3m6yz2M24ENj4cWpiKS+DapBpsc8PilCZTaST4awGovCEmsrZ1E4gyddI+/x5AeraUk2V2T+tE8BLd6uKUjnAF5Gx+rLLoTfJaM3qvAWwwsDauQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:18:09.5417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a1b342-556b-4306-2ba8-08df1e66c7bc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7436
X-Authority-Analysis: v=2.4 cv=c94+0h9l c=1 sm=1 tr=0 ts=6abc1d17 cx=c_pps
 a=UyUtkpB65yKBl9uddpDweA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=C4LaqBg6sCNJR2sbnPEA:9
X-Proofpoint-ORIG-GUID: 8YFaSvUNk0AlW80Z2C0iqVsFzVFi_RYU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX/9+2hfgyw+Xh
 YOye2/d3BvOFK4B7C1a6dIuELVIrrSYJeL+t78eQSDCkFeJCuiz33sFAqv59vp2ndPYKb14I5PM
 CPs8R0SMIvkPM8+bcIfiWX1NDsBOX0nVtyjpH8QT+O0CG5FisLkRanZYOqo5t5+ABDh33/pSWHE
 oWFo7ySNGH3UsORRt7Kg6OmurVksZSv80ZdMkvMa059hRONqjlsFm/NqFS6R+8td3Er9Q4oSfpc
 5oNqJ4hZRSdvBlNyvjf6JpjjkWuzP/fQ+xpgvKIM2u87jZsMxp11GRkrlOzefFHN1FkoEWmIETI
 BU8iP0kjYPhZ5QGk/1FihWwkNlaytFn7RBcBqhShvcsqt04P26Ro+VBjhrnA48clAYlUaLP7Hw3
 SbI55a320x64iZI47fasj2q/qdsMb7yPXSJKwKpK168plv9X1KfkWuEnBREf5NVq37bNk8wqV0P
 JhMYCc/mPTdbKmHW+Qw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX2tt7X0wuT8fT
 lFDA0YTtU0+O0Xgbtf4ZSY5as3/CR9pjOrNMQeAUQN9sqbGVbTUiBEIKzd+BAtrGaA9fwEJc9UJ
 VREJnsQjwq8ntb1fxkOUreq0C9KDrmo=
X-Proofpoint-GUID: 8YFaSvUNk0AlW80Z2C0iqVsFzVFi_RYU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290080

From: Andrew Davis <afd@ti.com>

Move ti_sci_is_response_ack() function up so it can be used in
ti_sci_do_xfer(). As we know if a response is expected we can
check the response in one spot removing the need to check that
at every call site.

Note: This changes the error code returned on a NACK for the ring
config, PSI-L pair/unpair, and UDMAP TX/RX channel and RX flow config
helpers from -EINVAL to -ENODEV, making them consistent with all other
TI-SCI message helpers. The users of these helpers (k3-ringacc and
k3-udma) only check for a non-zero return and propagate it, so no
functional change.

Signed-off-by: Andrew Davis <afd@ti.com>
Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/firmware/ti_sci.c | 239 ++++++++++----------------------------
 1 file changed, 60 insertions(+), 179 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 3b58fee07c257..6ec16fe57f132 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -410,14 +410,28 @@ static void ti_sci_put_one_xfer(struct ti_sci_xfers_info *minfo,
 	up(&minfo->sem_xfer_count);
 }
 
+/**
+ * ti_sci_is_response_ack() - Generic ACK/NACK message checkup
+ * @r:	pointer to response buffer
+ *
+ * Return: true if the response was an ACK, else returns false.
+ */
+static inline bool ti_sci_is_response_ack(void *r)
+{
+	struct ti_sci_msg_hdr *hdr = r;
+
+	return hdr->flags & TI_SCI_FLAG_RESP_GENERIC_ACK ? true : false;
+}
+
 /**
  * ti_sci_do_xfer() - Do one transfer
  * @info:	Pointer to SCI entity information
  * @xfer:	Transfer to initiate and wait for response
  *
- * Return: -ETIMEDOUT in case of no response, if transmit error,
- *	   return corresponding error, else if all goes well,
- *	   return 0.
+ * Return: -ETIMEDOUT in case of no response, or
+ *         -ENODEV in case of a NACK response, or
+ *         corresponding error if transmit fails, or
+ *         return 0, if all goes well.
  */
 static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 				 struct ti_sci_xfer *xfer)
@@ -466,6 +480,18 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 	 */
 	mbox_client_txdone(info->chan_tx, ret);
 
+	/*
+	 * If we expect a response and are not otherwise already in an error
+	 * state, then ensure that the response is an ACK
+	 */
+	if (response_expected && ret == 0) {
+		if (!ti_sci_is_response_ack(xfer->xfer_buf)) {
+			dev_warn(dev, "Message response not acknowledged (caller: %pS)\n",
+				 (void *)_RET_IP_);
+			ret = -ENODEV;
+		}
+	}
+
 	return ret;
 }
 
@@ -509,19 +535,6 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 	return ret;
 }
 
-/**
- * ti_sci_is_response_ack() - Generic ACK/NACK message checkup
- * @r:	pointer to response buffer
- *
- * Return: true if the response was an ACK, else returns false.
- */
-static inline bool ti_sci_is_response_ack(void *r)
-{
-	struct ti_sci_msg_hdr *hdr = r;
-
-	return hdr->flags & TI_SCI_FLAG_RESP_GENERIC_ACK ? true : false;
-}
-
 /**
  * ti_sci_set_device_state() - Set device state helper
  * @handle:	pointer to TI SCI handle
@@ -561,10 +574,6 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -616,10 +625,6 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 		goto fail;
 
 	resp = (struct ti_sci_msg_resp_get_device_state *)xfer->xfer_buf;
-	if (!ti_sci_is_response_ack(resp)) {
-		ret = -ENODEV;
-		goto fail;
-	}
 
 	if (clcnt)
 		*clcnt = resp->context_loss_count;
@@ -912,10 +917,6 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -987,10 +988,6 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -1050,11 +1047,6 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 
 	resp = (struct ti_sci_msg_resp_get_clock_state *)xfer->xfer_buf;
 
-	if (!ti_sci_is_response_ack(resp)) {
-		ret = -ENODEV;
-		goto fail;
-	}
-
 	if (programmed_state)
 		*programmed_state = resp->programmed_state;
 	if (current_state)
@@ -1279,10 +1271,6 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -1337,14 +1325,10 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 
 	resp = (struct ti_sci_msg_resp_get_clock_parent *)xfer->xfer_buf;
 
-	if (!ti_sci_is_response_ack(resp)) {
-		ret = -ENODEV;
-	} else {
-		if (resp->parent_id < 255)
-			*parent_id = resp->parent_id;
-		else
-			*parent_id = resp->parent_id_32;
-	}
+	if (resp->parent_id < 255)
+		*parent_id = resp->parent_id;
+	else
+		*parent_id = resp->parent_id_32;
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
@@ -1401,14 +1385,10 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 
 	resp = (struct ti_sci_msg_resp_get_clock_num_parents *)xfer->xfer_buf;
 
-	if (!ti_sci_is_response_ack(resp)) {
-		ret = -ENODEV;
-	} else {
-		if (resp->num_parents < 255)
-			*num_parents = resp->num_parents;
-		else
-			*num_parents = resp->num_parents_32;
-	}
+	if (resp->num_parents < 255)
+		*num_parents = resp->num_parents;
+	else
+		*num_parents = resp->num_parents_32;
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
@@ -1477,10 +1457,7 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 
 	resp = (struct ti_sci_msg_resp_query_clock_freq *)xfer->xfer_buf;
 
-	if (!ti_sci_is_response_ack(resp))
-		ret = -ENODEV;
-	else
-		*match_freq = resp->freq_hz;
+	*match_freq = resp->freq_hz;
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
@@ -1545,10 +1522,6 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -1603,10 +1576,7 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 
 	resp = (struct ti_sci_msg_resp_get_clock_freq *)xfer->xfer_buf;
 
-	if (!ti_sci_is_response_ack(resp))
-		ret = -ENODEV;
-	else
-		*freq = resp->freq_hz;
+	*freq = resp->freq_hz;
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
@@ -1658,15 +1628,9 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 	req->debug_flags = debug_flags;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret)
+	if (ret) {
+		dev_err(dev, "Failed to prepare sleep\n");
 		goto fail;
-
-	if (msg_flags == TI_SCI_FLAG_REQ_ACK_ON_PROCESSED) {
-		resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-		if (!ti_sci_is_response_ack(resp)) {
-			dev_err(dev, "Failed to prepare sleep\n");
-			ret = -ENODEV;
-		}
 	}
 
 fail:
@@ -1711,17 +1675,13 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_query_fw_caps *)xfer->xfer_buf;
-
-	if (!ti_sci_is_response_ack(resp)) {
+	if (ret) {
 		dev_err(dev, "Failed to get capabilities\n");
-		ret = -ENODEV;
 		goto fail;
 	}
 
+	resp = (struct ti_sci_msg_resp_query_fw_caps *)xfer->xfer_buf;
+
 	if (fw_caps)
 		*fw_caps = resp->fw_caps;
 
@@ -1766,14 +1726,9 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 	req->state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	if (!ti_sci_is_response_ack(resp)) {
+	if (ret) {
 		dev_err(dev, "Failed to set IO isolation\n");
-		ret = -ENODEV;
+		goto fail;
 	}
 
 fail:
@@ -1817,17 +1772,13 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_lpm_wake_reason *)xfer->xfer_buf;
-
-	if (!ti_sci_is_response_ack(resp)) {
+	if (ret) {
 		dev_err(dev, "Failed to get wake reason\n");
-		ret = -ENODEV;
 		goto fail;
 	}
 
+	resp = (struct ti_sci_msg_resp_lpm_wake_reason *)xfer->xfer_buf;
+
 	if (source)
 		*source = resp->wake_source;
 	if (timestamp)
@@ -1880,14 +1831,9 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 	req->state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	if (!ti_sci_is_response_ack(resp)) {
+	if (ret) {
 		dev_err(dev, "Failed to set device constraint\n");
-		ret = -ENODEV;
+		goto fail;
 	}
 
 fail:
@@ -1933,14 +1879,9 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 	req->state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	if (!ti_sci_is_response_ack(resp)) {
+	if (ret) {
 		dev_err(dev, "Failed to set device constraint\n");
-		ret = -ENODEV;
+		goto fail;
 	}
 
 fail:
@@ -1975,11 +1916,6 @@ static int ti_sci_cmd_lpm_abort(struct device *dev)
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	if (!ti_sci_is_response_ack(resp))
-		ret = -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -2013,13 +1949,6 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	if (!ti_sci_is_response_ack(resp))
-		ret = -ENODEV;
-	else
-		ret = 0;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -2074,9 +2003,7 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 
 	resp = (struct ti_sci_msg_resp_get_resource_range *)xfer->xfer_buf;
 
-	if (!ti_sci_is_response_ack(resp)) {
-		ret = -ENODEV;
-	} else if (!resp->range_num && !resp->range_num_sec) {
+	if (!resp->range_num && !resp->range_num_sec) {
 		/* Neither of the two resource range is valid */
 		ret = -ENODEV;
 	} else {
@@ -2193,10 +2120,6 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -2514,9 +2437,6 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 	dev_dbg(dev, "RM_RA:config ring %u ret:%d\n", params->index, ret);
@@ -2564,9 +2484,6 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -2614,9 +2531,6 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -2682,9 +2596,6 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 	dev_dbg(dev, "TX_CH_CFG: chn %u ret:%u\n", params->index, ret);
@@ -2747,9 +2658,6 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 	dev_dbg(dev, "RX_CH_CFG: chn %u ret:%d\n", params->index, ret);
@@ -2815,9 +2723,6 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 	dev_dbg(info->dev, "RX_FL_CFG: %u ret:%d\n", params->flow_index, ret);
@@ -2860,10 +2765,6 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -2906,10 +2807,6 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -2956,10 +2853,6 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -3013,10 +2906,6 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -3065,10 +2954,6 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -3118,16 +3003,12 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 
 	resp = (struct ti_sci_msg_resp_get_status *)xfer->tx_message.buf;
 
-	if (!ti_sci_is_response_ack(resp)) {
-		ret = -ENODEV;
-	} else {
-		*bv = (resp->bootvector_low & TI_SCI_ADDR_LOW_MASK) |
-		      (((u64)resp->bootvector_high << TI_SCI_ADDR_HIGH_SHIFT) &
-		       TI_SCI_ADDR_HIGH_MASK);
-		*cfg_flags = resp->config_flags;
-		*ctrl_flags = resp->control_flags;
-		*sts_flags = resp->status_flags;
-	}
+	*bv = (resp->bootvector_low & TI_SCI_ADDR_LOW_MASK) |
+	      (((u64)resp->bootvector_high << TI_SCI_ADDR_HIGH_SHIFT) &
+	       TI_SCI_ADDR_HIGH_MASK);
+	*cfg_flags = resp->config_flags;
+	*ctrl_flags = resp->control_flags;
+	*sts_flags = resp->status_flags;
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
-- 
2.34.1

