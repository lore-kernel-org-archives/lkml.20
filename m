Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA854F68C3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784484; cv=fail; b=aRg/KuO568JlVhdUdpJe425R65STp0y3grPW2Zflq9R0O1pJZhHUqN5S37dSipWJmcx1UOgoOo9z47+DsSFy3ghSZ3mBbZC0qqnTafr0p0GeKDIc7VdDPjH1425QT5X95v28prWtMMDfi+5t/XHQMahUjIh383wvR/ycGK+fT2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784484; c=relaxed/simple;
	bh=WIboTfEVsAU8Dxxj9Xg/rf41f+z35BRxN80lvGL0OvA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nTgl37fVB6/bdNpI2QHaY8sIT+eEl7YRTYtmmI7+uWp9n8WEfI477N3Zu8PJoHeboHLdESiDbPSyd82jgeSYomi7PwP1tVYBL5MSWCo0/VRUQH0nMmjCCodxF/OIXTl9vsF7zmaOb5C9tiFjWUGm34ywVrD5g+s7O2meejlCCGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=iYkhoDrM; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=ro5YhsUn; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="iYkhoDrM";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="ro5YhsUn"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UE1Iuo3333409;
	Wed, 30 Sep 2026 11:07:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=uY/4eQMUEPbPthux24k7ioD83L0KsqtOKU0+zgJXc
	1M=; b=iYkhoDrMEaYvjEtGlv2NZNTk45XRmS3lDpogvtLjq97lvj2BPhUUOThID
	6oqdaCgiNcHTVT6Q5beSDKPr2gQbDl9ztde7LbUO8ucZW5WmJpQxs4+NjaBk7DHc
	obidEvDz14wS1ZkBTW6Zz02lFh4wfewZwHRb+FNVrHhM5VXEEYEczqaokbfRPBil
	i+JM1i8jkkPQr1f2IuBSzmBRlpuFMCo9mfpxAh43m5xabB/UL7/zP8Xa0R6lZKSp
	RQklj6qCbwXSkPo+zdDyWOUJujYSlxi0lE5xbS20kQPDtnFEv/jhmZqhsOS8OIwu
	vwmiDiZCsdLc8anyXGYNi9OwUAOyQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012002.outbound.protection.outlook.com [52.101.43.2])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h10t1svvf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 11:07:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHOR9kSqSMLWXfYQUcrXG225v7ULj7zjC3O+1RpZCm3HR0sfNeCBr90KL12DajPOmRijFR8kLvCwpfyZbHeuqsOoEkBwMnsSoZg6Vt2z8tzW5a4WcM8KxpFHkJtPI3/XPooo1av/lIvwBjgxURm0dEStUBzwR0YoMTIlfsfPeShydig/v1vnARHW68UcLLoC7X0gpoumDA5YS/U/RZdvJniIFrMN+bSf47/JJABnkG6imEbhttvoRmcQQpGu/vEAJYbPBHl06UIk0/fuGE6s5Y0XRhKTaskXXKo75Eo5QvO7bCgAS3yFvFHE5wYzJeljvbWXLDXMoHSm984X+r4bjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uY/4eQMUEPbPthux24k7ioD83L0KsqtOKU0+zgJXc1M=;
 b=EAconDoj/2ESr9VrAbqd+rh8D1EdJ6QQ7QsE3209X3NlHtWktvuNp/Nu6lMZKMwWP+NlAczhogqJ+kD8xt1DhC3icNfr8+fKraa9ArNXZxK9WM7qMYqrKthAR8mm1Sq6qjK+XghZlmK+nQMJ4ZoxrxZ3Zy7MaXRldvSOrU5kFJJv7ymY5/HkTvFOwuOz2E6wI8GKF2FWgdVZYnAWFKDlVrqh+H4XGF6YN/YQIFRfu73ODV5MfPpfnAaOwjsjGOhZD51+Rf6tNNqoDK76l3bcFDCIW9t4VgA8hDFzH6FcJQFp8xIf4hRg57fAzXpUr4+ozjbdLGDSN6JOUff9H9AviA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uY/4eQMUEPbPthux24k7ioD83L0KsqtOKU0+zgJXc1M=;
 b=ro5YhsUnErhEdS6G5cGO9piY6IZROkAcaLym+tGtOQiyUuq3+w8PB/fvMeaRSNmp9NZfOc7I0fNJLuZycv6oWszLmWovSWKNZE1yQYiKTXRiwgn4Ywkzj9pigwXXsiYTqiFhbe4Ky001dfY4NPHEZH3c/a3SFwSGWOmwfaVzFlQ=
Received: from MN2PR14CA0028.namprd14.prod.outlook.com (2603:10b6:208:23e::33)
 by PH7PR10MB6204.namprd10.prod.outlook.com (2603:10b6:510:1f0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Wed, 30 Sep
 2026 16:07:44 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:208:23e:cafe::1d) by MN2PR14CA0028.outlook.office365.com
 (2603:10b6:208:23e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 16:07:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.3 via Frontend Transport; Wed, 30 Sep 2026 16:07:42 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:46 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:06:45 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UG68WE3425232;
	Wed, 30 Sep 2026 11:06:42 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v2 11/22] firmware: ti_sci: Use rx_message as message receive buffer
Date: Wed, 30 Sep 2026 21:35:56 +0530
Message-ID: <20260930160607.2674980-12-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|PH7PR10MB6204:EE_
X-MS-Office365-Filtering-Correlation-Id: ba8d754c-f308-43a6-bcbb-08df1f0cf56d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|22082099003|18002099003|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	bhL3PlGeoyV15MLmR4j9csXZvwHTwYLlhuLvBo8QAixZJ1AbbpAFQUujPjCM2n5ALJaBMfsVIE6d6tlhzAtswARECQ4vdK+lOVeTufMjjdCSOfsbvf4Fl6231fVKxVFcLviFlwNRSIbb234QbwwinbXQXoTclqo+nK7DB8T3olySb6mOG90aLdn8Xg4OlFROrxaPYYSz8jRRMROvH/ajw/4XTdYj3ckMC30doAcAAI8liFMa++wmtb/UqJxWLQ5y01b2vcdyVIS+xa6hmHF+t0wCYQAiZv/GkNw32RH0nTh27pVeVU4ZQ451y4mru9q9S4eAIUVgoqF0n7KED77WR7auOpTr6xL5ggA9WWexNWTAW76B2Y+xEDmYYXBoGbSY7b8ZQ43QlqQWDQ1MsnjbfDBZNfiqJYLSMhSk4nAbUNb0PoNyB4ZXOf3eQQFr9r8rSdlo6R6/g8hoq3cnDJAwwuwyxBJdodSTcsyFlHqDeDhCyumxt9UbK3R6Z3iAPlO1lMAIYj/y0KiYs2csVeHTqH5SYNQzSpAEh+sbKO4L+QPv7l1GbncNTwba6WzhcyOiMzVLuwL4Y0YeVPmGnDIxEsi2WV7dlyR3ZDOeUQ9HpjmcJbuuiaTQqZ0AyLKMu1aHE4x6jRGyBEI7iDGPp+67MhBEC5tFpAmp8j3Mg/wIovNIFuesYKFpTOZeJ6E5lCCM8MzzOHJ+k0WI4qR9PdMqRg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(22082099003)(18002099003)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gE2urnBn9oNtfkACN9kQ5TqNzuFnFi/xHnm1E00IK1BEYfY088jFUuMDZyYZicqREhDCnVF8UlDCKy+ZbG9wE9ZPA9YMxFAFpvDgbFBbRxRJeuzhqYnVJTYO9h4kimSvWsYBP3HxTVsJcp612ZcZKjR/DqN3pDxLDe9LoYeHNaAOOCq/52zy+34eEsHn0BoMh5dR2jInTzmVdmbDEq29UESIWyRIn8+USDJgH1wZlugvEQ8TBoc12VxbV9t/cu3n+/aAuA+CA9040XJ8YrtlHBKIaT1pP9oUj+BY6ux57fRUThFKrg98lF6YkhFustIbjuBYnPAjBnEpubArzilI3V0tYRsnFBapMzXSdHwCAEUPBwtcVq4sSHuY3rx45GH9KqLSJscCD496rlHF1sOMPxRuopKpK2gZSEwg7PK2KktKT6hN2NlfE6Petez0kO6T
X-Exchange-RoutingPolicyChecked:
	mYX9gZFitZy2bEf8cKxt8he3SCEBkbegZXVwQoct8HSR5XvWBDHEGNkELw3ONiguIfn6txkyoUgya2PRlpNgQI6VwHdRjAIGQk93m1ze7hEFaSK80Nbb33xU7tjaHJyMq1IrvxI9zr3TtTvp7551wgErzyhhXWwzOtDvdcyEKtICQYM2vZnzh7/skKZJx9lpbpuWF+GTwhi6XfV51uhgrlvJi46CrqO725E1lpedUA5xHbgJldyi+u00g28XR8p57aQ6gCUtrs84YYQHcRyKqDugsSJgaYj039kqx3/M18dii+oGsEsTxV6t3obgeLl5sLaYa1Vq8wdpOiWDRDuIWw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:07:42.6432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8d754c-f308-43a6-bcbb-08df1f0cf56d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6204
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX29xGGcf8EBhR
 kOKGBRPqgjPEt2KdujXDq48BdugREtcIV4Ciwic7qO10HqZuBUZS9yrd0R9YZ1ifsEdWrusBP4E
 ubaQu/wjW+pDSZYjnndd6uk7Kc6kbDY=
X-Proofpoint-ORIG-GUID: N1NlErO_MDc0owTORhyfnFnPSyqcSYjz
X-Authority-Analysis: v=2.4 cv=C7R8WgP+ c=1 sm=1 tr=0 ts=6abd33d2 cx=c_pps
 a=E0F994Awt23I4DNeuEdoUA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=6xb-8MLe_s-5M6G4LukA:9
X-Proofpoint-GUID: N1NlErO_MDc0owTORhyfnFnPSyqcSYjz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfXzu1dSUoA30Sc
 2Lhjgkk/dtRnK9gpPvfx9YMKUUYxjoQRU924CpgkDKrtlAWiNt3tWbRe79dQIaRcqf9OyiN3GWb
 tjmfQGaebnVQFAvG39PZzfK5fgNpeTPgyeooxjMRLnae7xZ0KJJRxeyeA1y6iQ2uCFbYCsq5izQ
 wubowF0wwsTyT/I5IiscKZZ6HrG0cKi9FILvdzqRF5f7TFNyhXrMwEZ2jU6blWjZTL6Cd/P5rHv
 NZ4rPXfOxIVpRYe56utORqP6tZ78NafuRMBgTuyUNlETWIPoYFYc2MckkVMIs+In4KI3aTdgJo2
 FQMMOyEysUj+z0G4IGjDls1IHzEUgOVh2Hqq6a74GzKlaGE/riOGhdAZzmuURGrcAhn643Us1nB
 3PMpYTS01CVb+0X/YQzFUdjdCeXx/MTRfOVwGgufYvu1gpxRyR8YCc9MlMCPCyCaHFZ+55jhQO/
 wWr7CFzUoPkIQgA+LtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

From: Andrew Davis <afd@ti.com>

Previously we allocated a message buffer big enough for the largest
message we could receive for every message we could have concurrently
in flight. Now have the rx_message buffer during the whole xfer process
we can use that as our message receive buffer. This removes an extra copy
and the amount of memory we need to pre-allocate.

Note: rx_buf now points to the caller's on-stack response buffer. If
the system firmware replies after ti_sci_do_xfer() has timed out, the
rx callback can race with the caller returning and write into a stale
stack frame. A reply that arrives after the timeout means the system
firmware is not responding within its specified bounds, after which the
system cannot be expected to operate correctly anyway, so this is not
handled.

Signed-off-by: Andrew Davis <afd@ti.com>
Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-12-b-padhi@ti.com/

 drivers/firmware/ti_sci.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 6ed67160c6a7f..fef7028d40e39 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -45,14 +45,12 @@ static DEFINE_MUTEX(ti_sci_list_mutex);
  * @tx_message:	Transmit message
  * @rx_buf:	Pointer to store received message
  * @rx_len:	Receive message length
- * @xfer_buf:	Preallocated buffer to store receive message
  * @done:	completion event
  */
 struct ti_sci_xfer {
 	struct ti_msgmgr_message tx_message;
 	void *rx_buf;
 	u8 rx_len;
-	u8 *xfer_buf;
 	struct completion done;
 };
 
@@ -287,7 +285,7 @@ static void ti_sci_rx_callback(struct mbox_client *cl, void *m)
 
 	ti_sci_dump_header_dbg(dev, hdr);
 	/* Take a copy to the rx buffer.. */
-	memcpy(xfer->xfer_buf, mbox_msg->buf, xfer->rx_len);
+	memcpy(xfer->rx_buf, mbox_msg->buf, xfer->rx_len);
 	complete(&xfer->done);
 }
 
@@ -522,12 +520,10 @@ static inline int ti_sci_do_xfer(const struct ti_sci_handle *handle,
 	 * state, then ensure that the response is an ACK
 	 */
 	if (response_expected && ret == 0) {
-		if (!ti_sci_is_response_ack(xfer->xfer_buf)) {
+		if (!ti_sci_is_response_ack(xfer->rx_buf)) {
 			dev_warn(dev, "Message response not acknowledged (caller: %pS)\n",
 				 caller);
 			ret = -ENODEV;
-		} else {
-			memcpy(xfer->rx_buf, xfer->xfer_buf, xfer->rx_len);
 		}
 	}
 
@@ -3326,7 +3322,6 @@ static int ti_sci_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct ti_sci_desc *desc;
-	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info = NULL;
 	struct ti_sci_xfers_info *minfo;
 	struct mbox_client *cl;
@@ -3380,15 +3375,9 @@ static int ti_sci_probe(struct platform_device *pdev)
 	if (!minfo->xfer_alloc_table)
 		return -ENOMEM;
 
-	/* Pre-initialize the buffer pointer to pre-allocated buffers */
-	for (i = 0, xfer = minfo->xfer_block; i < desc->max_msgs; i++, xfer++) {
-		xfer->xfer_buf = devm_kzalloc(dev, desc->max_msg_size,
-					      GFP_KERNEL);
-		if (!xfer->xfer_buf)
-			return -ENOMEM;
-
-		init_completion(&xfer->done);
-	}
+	/* Initialize the xfer completions */
+	for (i = 0; i < desc->max_msgs; i++)
+		init_completion(&minfo->xfer_block[i].done);
 
 	ret = ti_sci_debugfs_create(pdev, info);
 	if (ret)
-- 
2.34.1

