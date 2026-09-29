Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47E235295C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790712158; cv=fail; b=nFiMQySNwRnZjEUCtGho9Lq6irLWunzP5GEXYQd8Cp0Az8k8Z1FY8XTkP3VDQu+FNvUy0CrY0H1nLrMy7VUCohmhWgr+AdrEPf6I5LvQkHkN8Q5mT2QMICOdbuLNZzh5W6xjyKMeDUQGicDeUl6P3gEApibQspt2CvTT6IP4TxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790712158; c=relaxed/simple;
	bh=invYezHD9W1dBXIHxtne4PLh+jlB9oNM7LJ5C3JqO2U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pEaQU0ki2xXNxCiUChlaGaSIug2r2Yd1fvhVAfOA3MpJ0kc2g3JdAoSOxJbFsT0qMG81e5+jr3uLBmRVR5UxBW5OvGJmmwPDbVcLoOiGpc/ccr4y8WF4i5w0/5rAlN5S8px5axesUivw9l69iEo91HeskpUfovN4Ifb3TlTjkz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=iF+g1Nn5; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=kfZFwRV5; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="iF+g1Nn5";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="kfZFwRV5"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TFbbWh4077007;
	Tue, 29 Sep 2026 15:02:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=4QRGkkwmkEROXyMhAzGK/KUAW7Ly1XlsrMTQGccMX
	Ow=; b=iF+g1Nn5fp4gLp6GrLV1o4OjgxTBaDcY1X8+iEsYWf/cBo/mTXjk8ZAci
	CKyvjcdNmEDF1V5ttT8O0/zhe6gmuiGfW/rb9EpEiMzEt3rNw0tDoDbIC3AByegA
	Ki0E/gnmwXDd6vqqlNwfmvw+0HS1O+gNEO9JeiarQ95z7mMDKmzvGAOop12dFi63
	fsO1bMlAaCR8QUasCu8bO/cv460cfziZ8l93gWJItm/WhFjBM25KGwbQ9yl/rsh8
	UdoH3fFsUUUm9jaoKk0uUvE6+1szQEumZoF9Z8qH/EwmXinCpS4AJ/ntTvhz4nPz
	osNq0WuaKiOpAeQLekhbsljb7dmFA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013062.outbound.protection.outlook.com [40.93.196.62])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h03adeejr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 15:02:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k1yMi93OONfekucxqCeZF5mjWH8XV1+8s6WmCCPR9dBEfq+lw2U/jU6Rr4GZ1HJ1SxUL71c/uGxJNHzUSvMeTuYPEi3o06oKvX77xPwTwmG9JLeLiR52agsETPyybP9X1G5ON+eD3OdydzvNVVidGbrIsk6P9IEAYPXo0q+gnKfR+1D3GyxTex+r8hYRcVLWUNsq31tpr2OPzw+lHxz0oEofs/40w/52E4jbaXIq0KD6F5QZFlhzXQOw09GttKypSwarLXpwe4UMHJbeAeEHxj1jqth3dosnodThmJdAWobx1BdqfOd+JhO+tJe4/C1Yxt9Oug36rTs2eV2uiixn7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QRGkkwmkEROXyMhAzGK/KUAW7Ly1XlsrMTQGccMXOw=;
 b=fQKEv4Bd8SH6/Z0TT/VSmX8VpDqu7UnmquXVo5gZDgijyDM5ujrAkIIVQi4xvn1jZRlfDm0BfAAZD7m13+cnlWXIUTBRfPR89SsgMy5GKV2VVJTdE5P+FWmYU8Qdt//b6B2+2G/cWRboPfxb9c4tSJpc0ZJ2TGN/ZETsn8WlkQbxpPilLHX66JnNxZ3Xx3RWdcu6Jd8J5n1yxzLAelDD+s3UGGjb5LwjI4890EsaFu8gu7t1u0Cnap9MCT0nQUPS71gVadgeVal6jUm/TIO+TRXHaLaPJlt51WW+CcL5P73z9xspPJJQOrF8cCZChQ+TkTI5yqzwMlnAkTl0LiVySA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QRGkkwmkEROXyMhAzGK/KUAW7Ly1XlsrMTQGccMXOw=;
 b=kfZFwRV5RiKsuNCW7uLkin8LqwIZVn+1rRQi5cNJsqLVgKCT9cH+Z+fUuRGEbOTnHEahB1GMr/mnAO8suuDa7Ax6n8lF+QbeEjh20z+MdTNjXeSbnPJ7Oyt0PBtvb/8jI+7PrwwcUjs7RXNpkqX1D1vIlTKddytvA3HvyKLtACw=
Received: from CH5PR05CA0003.namprd05.prod.outlook.com (2603:10b6:610:1f0::16)
 by SN7PR10MB7074.namprd10.prod.outlook.com (2603:10b6:806:34c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Tue, 29 Sep
 2026 20:02:32 +0000
Received: from BN2PEPF0000A804.namprd02.prod.outlook.com
 (2603:10b6:610:1f0:cafe::3f) by CH5PR05CA0003.outlook.office365.com
 (2603:10b6:610:1f0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Tue,
 29 Sep 2026 20:02:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF0000A804.mail.protection.outlook.com (10.167.245.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 20:02:31 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:02:08 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:02:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 15:02:07 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TK1xGh1665878;
	Tue, 29 Sep 2026 15:02:05 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <jassisinghbrar@gmail.com>, <linux-kernel@vger.kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <b-padhi@ti.com>
Subject: [PATCH 2/2] mailbox: ti-msgmgr: Read exact number of trailing message bytes
Date: Wed, 30 Sep 2026 01:31:59 +0530
Message-ID: <20260929200159.4033010-3-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929200159.4033010-1-b-padhi@ti.com>
References: <20260929200159.4033010-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A804:EE_|SN7PR10MB7074:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e7f4b10-03dc-407c-ed9d-08df1e649860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	s+naOYZsZFOVXm3qlyu7Zh8xYKfnD/IKB1FFCMaPGAJPf6eEU7/LkN98fA/nwRld5GmzI0HrLWfN2n2jQJgK+xyjmN1ceAyE5NbpHfnMYbP0NASCbKWc8Ip4/TajzWS1YcD9/TaX/AnnYPDCMN0NRt6hxAJlS2ycW8Bc4+HAaYdRQRGmoP8NWFwAEhHhY9pn9etXND2hOt/WdKgK9AxqWQxhfiLpZYF5G3JJAHKgWQHzQIEaS9xvIUaWGLcFgZFICgqpazflEL7p0DspdBbH0yJQtXvALPsBW3jHimNvsz+DRR8rCaFt8ejmmyVSNUL1xI+wO3gN3S/rgag2eV9EN3axp2KVTlfIe+I4EdwC2PUEFOhVH4X9cWMwdjeWttBbZDACfhaNZLAKG9ozjek2wqyRLVWfCeod76kMEH7lj2qjyS6u3WajTISq3FeBAmUkKztcWZplqmUd28ertCfsWJFH2b0brWRZQfchNClEbEjSX17NEs8cLpaXkv7EJjBGWWgf7meVjG8iAaZt+BY4WGZdosqpZP2Bk+xCcOhEqwB3MuxM2QlwCPt+7VxNSbi43tCGEoG0vN4kCoglh0f073wHGPDNvUXNkWTfWVFOzhzXhxelOSn4sJ+Cd4/3kuZMi25z0zAKqYYJ7wkKpKYDM7NLGNfgQyJQE30Qd5p+mnnBzOZlIgrCjtUROfzVyfDkt5PjsVnukRxGV0y1l/be/A==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PMe8Pchc6PZjy4MMyG34oevwkKUSw5qt2Yei0a9d4zS3J5tdOi6TPdMGc0fAa3aFlZmJWg5V4RTxUrXNQVOsVwWLEtFC+zcA68VpzxCH9td/Y76vAHKfbpQ+iOl4cv0xsushTCjkNlvN7TgPI8/Ugheu9uQxYKuNsrvZdAvC8O7x10uCPLIEu7+xRc44+ngT4dU4PnG2INYwlrdclVlPWQS7N6Byc4BocwlxAOCIWdVmGjiZokHDtBoeuvFv5fcNoVRE5wO+ijjoeFedH00PQKOT+c8M+pLrLu9jT3+L+yV7+E52VyqVnAtRYAAOf+lHIbi1eD3KpPRUZLt2BWk5F6qsC1w4tcVbF5DIClpAmGxMixFelVYHWwiaC19ueczl4HvAkhjjKecU4bDy/p+itzh7dQs00n8a/p8338nEEk1x9xSJcU++papSm9TXygQg
X-Exchange-RoutingPolicyChecked:
	Xs6kqW8Kcs0nHGEbJXJA+7mMTnUHJJEX5NdMLnM+O8oG7IZ5a7QbUN9YOtt9bSIgMwIb3ZsZkMmTqBk0Ie6U36vJKctGY/dUQkmFUIMbnN3PTpzfzuNsGfyaGbSv0qUcozOC9BU6IGuFRYxzuRRnnDZu5icwnAA3Snv57RsfX7cQ0mjFTbNzvkXVMJiMKKSu1SoJyCI2ijFbW7FJAYnbukBDAcHL3nsbMxescg1lDke4B+JiUjjzmVVGaS7RwE/GBLMZrlsrMyYv9aUSlJRBj3FB0T6BTll+v2mzJZ6FQZS/0TlPflZFY0+Ci2mQPEGPhJk2ZRSHIAjHeU7xLUu3fQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:02:31.0782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e7f4b10-03dc-407c-ed9d-08df1e649860
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A804.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7074
X-Authority-Analysis: v=2.4 cv=c94+0h9l c=1 sm=1 tr=0 ts=6abc195a cx=c_pps
 a=NNTlVNVDZfSUkWkRvmJkNA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=0jiadBwdcez82Pvrbo4A:9
X-Proofpoint-ORIG-GUID: Y87DlfJF4hapYjtTPSc2Rz6nuqrpWgYa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA3OSBTYWx0ZWRfX3HDhu3nate/4
 knG0HHf+hnxQ3Lf3IjRkrbsuhIPH0VmdGTqPEG/OaLkCe9VYeF1T2cVrun4k4AQK3Nh2RyKg+nF
 KcVEoLJ8QKUDbSPp/z38C4ZX/XQjjDaGzI0WuQVDyKNtKpJrH4jIAURCigShOj31332cdEshCHn
 e/C5IzFLqqcoyM6fkM2XoyF0zif4tq5WmOe4PVxfunBMhzkLOMqQ6/WyGeAveIonvD333WAkhWw
 cglSNpIOIJ7RKP4ygegqq+o73HsPEL2Hr9VN99lagriuWb/u62WOrZTeYyI9dMvMA9sS4hQT4lc
 sAVoOfed3APCPjSjuQBudLSobD98bHcIHp/MZwcVwHc6u+dTd/xfUzAa9fl2+kGokqEt8errrWx
 w44zSsflvPgzWmGa4owaGHxfwVhWNdw9wOgxPVY6gcFGj2BrkfLXezjiVFqZWLPFj489LxTG2TO
 IqxiYLC6LDUMFn/5EXw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA3OSBTYWx0ZWRfX6hSPCoQonus2
 E7DYTABEuEmxWNwpO/V0eBZorxqd1e31tJK6CWpQsj0FEJRKXWdded9raUUBMSCmVmWBu7bYEm8
 gJTqYO+ozybQ7Xt435q3grIbkaw2LaY=
X-Proofpoint-GUID: Y87DlfJF4hapYjtTPSc2Rz6nuqrpWgYa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290079

ti_msgmgr_send_data() copies the message to the data registers in u32
units. This has been harmless so far because the clients (TI-SCI)
always passed its preallocated message buffer, which is sized to the
maximum message size (60 or 64 bytes, a multiple of 4), so the extra
bytes read were still within the buffer. But, with a later TI-SCI
update, the message size can be varying now and not guaranteed to be a
multiple of 4, which would trigger KASAN out-of-bounds reports.

Therefore, Build the trailing word by reading one byte at a time, only
up to the message length. The value written to the register is
unchanged.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/mailbox/ti-msgmgr.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/mailbox/ti-msgmgr.c b/drivers/mailbox/ti-msgmgr.c
index 425d5f9d9d0e3..44457a896510f 100644
--- a/drivers/mailbox/ti-msgmgr.c
+++ b/drivers/mailbox/ti-msgmgr.c
@@ -425,10 +425,18 @@ static int ti_msgmgr_send_data(struct mbox_chan *chan, void *data)
 
 	trail_bytes = message->len % sizeof(u32);
 	if (trail_bytes) {
-		u32 data_trail = *word_data;
-
-		/* Ensure all unused data is 0 */
-		data_trail &= 0xFFFFFFFF >> (8 * (sizeof(u32) - trail_bytes));
+		/*
+		 * Read the trailing bytes one at a time instead of as a full
+		 * u32, as the message buffer may end right after them and a
+		 * u32 read would go past the end of it. This also leaves all
+		 * unused data as 0.
+		 */
+		u8 *byte_data = (u8 *)word_data;
+		u32 data_trail = 0;
+		int i;
+
+		for (i = 0; i < trail_bytes; i++)
+			data_trail |= byte_data[i] << (8 * i);
 		writel(data_trail, data_reg);
 		data_reg += sizeof(u32);
 	}
-- 
2.34.1

