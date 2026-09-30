Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B69C50EBE8
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784440; cv=fail; b=rAvIx1xetOfNK/F78nCuM271VrKH9/5vjkP8mzXgEnaCSQaEuDHHamMLWFmpj7d3iL5Qh3vlBRlyLwmlYALl7b8gUO/ICh4z2WArzcAWrF1OACdN42aL/HOdUcw5xVnFk1Yqpf1ryuw7duX2PycqgMYbnDKTJHzKZznxrsIRQRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784440; c=relaxed/simple;
	bh=LrY09fmwQseAiuFqrpwNXjVV8UiuVz02hFTEqok9cJ0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gweoGEkp9L+Zt6CBPYzYEQsUW/AXjBEgzwkXFFIIiPsVpjESFj2oZIlfgtp35EYSL8LeksIuwvpsW88LsLjhTD+PcKT/PqhXyDAdxo/YH7fS9HK0tcKIziQa7WkEGOEkmKg4yx+pY+DQI9FN36tIfUXQmIdLIa60dUIVS9DGoQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=OHcEL1v0; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=CCE9ys8q; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="OHcEL1v0";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="CCE9ys8q"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE1KUO3057450;
	Wed, 30 Sep 2026 11:07:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=l6RYAMlQzeB2D1ZF8Xw8MErC2vWg4I1iZYylpbdDl
	wU=; b=OHcEL1v0U2/P0bJZCxD0CbE/pARjGfSjhlslfcM9vsIY224D07wQfMDXx
	PVAwi5fjyLWdEzuoVXxTp/OLomWKkyoy6hCOmJV7B52l1GdNXbeVSI6UaAwW+ZwU
	gtf4uob2o3071zMAmdW0u8CX4at0ddUslcvhghD4BKP49nMRGv0LmD9NXiWAZXWx
	ePBoJSUNlSSNkEpM5970cO/Mt7coJN2AmV9FrftH3/2PyhpWAr522M6TmAgflHQo
	6qbZPMN1/jngWrBdzecZps8oURZ2uZVv+GYv4428t5sLMwcGwh8+nVAaarO0O18I
	eTTuBRICeXsl759Phmeo5vPWlsb7w==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012060.outbound.protection.outlook.com [52.101.48.60])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0m9fehtw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 11:07:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPq1pFDcnfG0zQKTS4wJxjiGoxugBBtSt6L/vEj2r2a00gKk0RK1sd+rbo/I3hvM6btiu0KFzq1WlGICd4t1YSeNn1GjrJ0XEG3k49TAk/7PSUgU/eIm3jvyyj9Fgp+naOOfXP+Aykprb0h5MV99G3pac6lf9w74GRhb70ENNqawvot9+or3ljT05t70ejUMY4Mp0itGg497mTOkRZcklRbkKTdBK3yYoEjpkNGuRsEIKR5JdbMJbUej4sZ6F4b4NtJGc+W7lRWQxXX1W+EphZJSTRT/B1rWMZuTg1HTgoVv06bsVQjpwik+FR2c/wjpiYd+x0ie9au0oxXlcGbNRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6RYAMlQzeB2D1ZF8Xw8MErC2vWg4I1iZYylpbdDlwU=;
 b=AoW7wust/mEbfikHum7SjP7oenACAATQAh7HwVZjsDqJJB7iMjKQaE3P+XGDhMoentnSeTeggs9pAcj87TXEU8lQsFDfOI/2d6T2RyeF3teoU+DYyO94h6dZK8RtMFSMkvVVwyZpEVEcPnLZK5JOwjKE6n3XjZ5K3q3o9jE6garzaHrsfYQr1Rzg/fkloFQfxPQnwW+/cad18xSH7lazJtTdJHLfJ3Om9KIyoGexyH9qeRAxPUq2w6YwHI1sn7t+pNzflBb9fybeKchdAWHmzHfoR8v2Dq4F6GgLhLDKktP1opSTulnYvn5iIb8fuoaDuu/oIgBaRj2fD1nL4WoopA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6RYAMlQzeB2D1ZF8Xw8MErC2vWg4I1iZYylpbdDlwU=;
 b=CCE9ys8qrhVu1Vb+jxRGy4ouGl6VQLIYVhEFVLbma8YX4QeuJn0Cx9pe8imX+ymu8g4eQ7AqBtcqGzklWl2hEMeWPXfdgbJY5SCtwF3MkQIhR93gmRJiMZVlflUCGgysE+VhM4919kNTKGIUcWB239tB6EJfzVM3EZL+rNGBuVw=
Received: from PH8PR07CA0015.namprd07.prod.outlook.com (2603:10b6:510:2cd::20)
 by SJ5PPFD6523AA75.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7d2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 16:06:49 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:510:2cd:cafe::66) by PH8PR07CA0015.outlook.office365.com
 (2603:10b6:510:2cd::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 16:06:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 16:06:49 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:14 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:06:14 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UG68W43425232;
	Wed, 30 Sep 2026 11:06:11 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v2 01/22] firmware: ti_sci: Move error message handling into ti_sci_get_one_xfer()
Date: Wed, 30 Sep 2026 21:35:46 +0530
Message-ID: <20260930160607.2674980-2-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|SJ5PPFD6523AA75:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f4d1c8c-12f0-4f66-44a3-08df1f0cd596
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|376014|36860700016|22082099003|18002099003|13003099007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Y5GFElDL0qDNzNjngT5JIQlxTPWdyv5Bw96o0NLi+/ERvBx3fLL9eWpxTs7xkfqHrvXAEn1dJqmONDihz44ZBrp+RIJyz1M8vkj7ReEjdioYxsYQpYOHwSmHOrPJUZQI2lizKOYPGjAM+tuVFxF+e31Hw8QkoNgQKzjdEVUQy4Hgil/bEQW++TNlQ6DS/HBKODWT2BR9fPyYWIB3OM0vgLwbpsXGgJvQT+rtwZuX1/eeRQBCc9Luj0pA8e/IMDcOtyE0IcTuWaMS/PNfxPjkeKUAyWyQA9tCZUZTBdWGr69iovSxIh07wdXKQ1OtbPbQtGERs7wfibduYh3iWdiN4omzq7yQdTACH13egK7zA+8rEpctNk/oU4w3+gaXFvl+P8gN+OTXsZcBjoVlzO2+JKvczQdsPBWLTaDV3V2s0YtkpnvxNFZx55FUCW2m8x+LwC+lHyTUkqdCfuotLfD2Be9yWr+jSvlNB8rUnLs+XlvYsZN2/YMLIri83f1TceSOFJFqYhagph90ZHmrCxbaLcnFZtJZ4gToZrQBkv2q3c23kjv0IsSJoDGMRoriyOg2Embk2DiqZuMWllRm2nipODk2lnqdA7eTsFdE1mTiDhpsgfxePxi8L0qs7/WKY/S7m8vseD9ouvhkOdt4IMA5BnKKu+YMJi4RzrycTm8MMTTTC9U2lWpTN78j3pT6pLGlsD7e9wyXNM9O3AQDkRxhWg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(22082099003)(18002099003)(13003099007)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kXPtm78QJTcaoObyhiooEOByUKQxU3OqJQyKo7DGteZHbzMglxvSy/E7K4pSO4pF4+bACoa9JE4U3YQhG2sTXUZ+KIwE8qj7Ap53+Y+JyepySoM6BWYE/1hF+kZ0npvozXMWm6bPxR/b5qRW5HY2aSuWW7gn10uPCfF75bMPex5KPqfCaK8mtif1U86kqgZ8k37gQU5I47Kh2/4ova0YIhtv7KBrQ5NoNbZPGa3CLacv3XcpeT5SHMl/pX8OCYuPg//pTz+AG+O3LbbcHmt9wU8symmMHWVu5rdXUDh9BTNSdJQKTuRp1ihjM9RrUAeax5vnfP7nVc2LLQCiroNzHI5BITn3SYTrTL1Y3rBKFei4j+N4oLUdzxN/afQQqsx8bV1UskqeG+7Pvhudwp4BnRxKKFLryDVRVDsRaS0ZZ4nueTjebhAHOi6Tq+ChnabJ
X-Exchange-RoutingPolicyChecked:
	y3LPHKTcC+iLPpOrZSMAH6xQGt+wYBfZm0GQ/Dzrukbx/2/iH02zAkR707ghwwBP1xhMEEpgZGYbWjDMFZwVsjGvJ7MkW8VgY4Axoe3Y0VNkmJ2Ba0okf0hVplQDJHC0hmaS2zm98u+pB4K7jzdg+c52rsZ2LF5HG0dnYjsH5pcITDvWmL12P4KG2BdeTKsDcx341TN0hlk4eMN4jt6WKW30bIXo2Nde8EhxiCwNtk+056LFkrcnf7/Hfy6BY3hIBXLyW1zVoUlPClBBmYKl1VzPL/mpbNBclFxE/NrAXnW4l9ZOwsV2CARTjGoK7++ZGQgdtTeYEO87TIG8Dk6u5A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:06:49.2122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f4d1c8c-12f0-4f66-44a3-08df1f0cd596
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD6523AA75
X-Authority-Analysis: v=2.4 cv=VfRir1p9 c=1 sm=1 tr=0 ts=6abd33aa cx=c_pps
 a=MzitxtHdenuwXKuz6QWlPg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=NjKYTb1M58wiEBSgNdIA:9
X-Proofpoint-GUID: D8jYAAYTN7qGVngNTYJj-Gz5LfgvqH4r
X-Proofpoint-ORIG-GUID: D8jYAAYTN7qGVngNTYJj-Gz5LfgvqH4r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX62SqQuxFVfiD
 hFj1b9HsV97lmmzKPlxM6TmBCewDRtLQy9fvB4RuDNjsRZ5gXhNj5w+ulJ+R2zBrlsscFbpyCW7
 lEAlwMgt2tllEH0sf9KYioYcHPHDWv4S9SvUMSPtZzR2Pae3bsCHBbgv4uoOmjQGMunD5ynVM2q
 o4XT0C803q1AOdoiJ5DI6025kdN1K6OIghawXwet4+iTcVOwMRK/gAzq+1rnt49wEgp/sUNdL7L
 57YU5+UzjE6pDPt1HvfqzK3rrZpd9DBFHi67hNwZj9JSEOERS6QoQQzXrGVjNxAU44vY1ZtuKbu
 Q9Xz+aQ/f/CyD4OilfwmXmMu7UQciuKCvg3VTZk0pPcCHitSum7vaDhJLZCg1T5aSeOITwH+G8b
 9dkbzeSEHjMThmJ17jPmWaRrMt9aMrYi2tkA88/f4UpyC8blaCGCa2yiRV2aVMGM36yKNc+sFj6
 IrNQX2dvXl2ofTm2ZcA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX2YSsZbagYG0G
 FhIXY2Bbxmcg9iiaTmxc905k547RPCEr9z0gN68RlISM89r4/Z2P6ZbfmITepu4hal1B131Ij5E
 XEe2bgUtBAJPM5Rx5dXBxoUjKTkJgyw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

From: Andrew Davis <afd@ti.com>

This allows for more exact error message than just "Message alloc failed",
and also removes the redundant message printing code from each call site.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-2-b-padhi@ti.com/

 drivers/firmware/ti_sci.c | 278 +++++++++++++++-----------------------
 1 file changed, 106 insertions(+), 172 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 5fa63ff7c74a6..5e7d04754913e 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -315,6 +315,7 @@ static struct ti_sci_xfer *ti_sci_get_one_xfer(struct ti_sci_info *info,
 					       size_t rx_message_size)
 {
 	struct ti_sci_xfers_info *minfo = &info->minfo;
+	struct device *dev = info->dev;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_msg_hdr *hdr;
 	unsigned long flags;
@@ -326,8 +327,11 @@ static struct ti_sci_xfer *ti_sci_get_one_xfer(struct ti_sci_info *info,
 	/* Ensure we have sane transfer sizes */
 	if (rx_message_size > info->desc->max_msg_size ||
 	    tx_message_size > info->desc->max_msg_size ||
-	    rx_message_size < sizeof(*hdr) || tx_message_size < sizeof(*hdr))
+	    rx_message_size < sizeof(*hdr) || tx_message_size < sizeof(*hdr)) {
+		dev_err(dev, "TI-SCI message size out of range (caller: %pS)\n",
+			(void *)_RET_IP_);
 		return ERR_PTR(-ERANGE);
+	}
 
 	/*
 	 * Ensure we have only controlled number of pending messages.
@@ -336,8 +340,11 @@ static struct ti_sci_xfer *ti_sci_get_one_xfer(struct ti_sci_info *info,
 	 */
 	timeout = msecs_to_jiffies(info->desc->max_rx_timeout_ms) * 5;
 	ret = down_timeout(&minfo->sem_xfer_count, timeout);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(dev, "TI-SCI timeout waiting for transfer semaphore (caller: %pS)\n",
+			(void *)_RET_IP_);
 		return ERR_PTR(ret);
+	}
 
 	/* Keep the locked section as small as possible */
 	spin_lock_irqsave(&minfo->xfer_lock, flags);
@@ -481,11 +488,8 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(struct ti_sci_msg_hdr),
 				   sizeof(*rev_info));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
 
 	rev_info = (struct ti_sci_msg_resp_version *)xfer->xfer_buf;
 
@@ -549,11 +553,9 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_DEVICE_STATE,
 				   flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_set_device_state *)xfer->xfer_buf;
 	req->id = id;
 	req->state = state;
@@ -610,11 +612,9 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_DEVICE_STATE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_get_device_state *)xfer->xfer_buf;
 	req->id = id;
 
@@ -912,11 +912,9 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_DEVICE_RESETS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_set_device_resets *)xfer->xfer_buf;
 	req->id = id;
 	req->resets = reset_state;
@@ -987,11 +985,9 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_STATE,
 				   flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_set_clock_state *)xfer->xfer_buf;
 	req->dev_id = dev_id;
 	if (clk_id < 255) {
@@ -1055,11 +1051,9 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_STATE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_get_clock_state *)xfer->xfer_buf;
 	req->dev_id = dev_id;
 	if (clk_id < 255) {
@@ -1286,11 +1280,9 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_PARENT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_set_clock_parent *)xfer->xfer_buf;
 	req->dev_id = dev_id;
 	if (clk_id < 255) {
@@ -1354,11 +1346,9 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_PARENT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_get_clock_parent *)xfer->xfer_buf;
 	req->dev_id = dev_id;
 	if (clk_id < 255) {
@@ -1424,11 +1414,9 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_NUM_CLOCK_PARENTS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_get_clock_num_parents *)xfer->xfer_buf;
 	req->dev_id = dev_id;
 	if (clk_id < 255) {
@@ -1503,11 +1491,9 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_QUERY_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_query_clock_freq *)xfer->xfer_buf;
 	req->dev_id = dev_id;
 	if (clk_id < 255) {
@@ -1579,11 +1565,9 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_set_clock_freq *)xfer->xfer_buf;
 	req->dev_id = dev_id;
 	if (clk_id < 255) {
@@ -1644,11 +1628,9 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_get_clock_freq *)xfer->xfer_buf;
 	req->dev_id = dev_id;
 	if (clk_id < 255) {
@@ -1711,11 +1693,8 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PREPARE_SLEEP,
 				   msg_flags,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
 
 	req = (struct ti_sci_msg_req_prepare_sleep *)xfer->xfer_buf;
 	req->mode = mode;
@@ -1775,11 +1754,8 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(struct ti_sci_msg_hdr),
 				   sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
@@ -1832,11 +1808,9 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_IO_ISOLATION,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_set_io_isolation *)xfer->xfer_buf;
 	req->state = state;
 
@@ -1890,11 +1864,8 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(struct ti_sci_msg_hdr),
 				   sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
@@ -1954,11 +1925,9 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_lpm_set_device_constraint *)xfer->xfer_buf;
 	req->id = id;
 	req->state = state;
@@ -2011,11 +1980,9 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_lpm_set_latency_constraint *)xfer->xfer_buf;
 	req->latency = latency;
 	req->state = state;
@@ -2056,11 +2023,9 @@ static int ti_sci_cmd_lpm_abort(struct device *dev)
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_ABORT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
 	ret = ti_sci_do_xfer(info, xfer);
@@ -2100,11 +2065,9 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SYS_RESET,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_reboot *)xfer->xfer_buf;
 
 	ret = ti_sci_do_xfer(info, xfer);
@@ -2162,11 +2125,8 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_RESOURCE_RANGE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
 
 	req = (struct ti_sci_msg_req_get_resource_range *)xfer->xfer_buf;
 	req->secondary_host = s_host;
@@ -2283,11 +2243,9 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, type, TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_manage_irq *)xfer->xfer_buf;
 	req->valid_params = valid_params;
 	req->src_id = src_id;
@@ -2607,11 +2565,9 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_RING_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "RM_RA:Message config failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_rm_ring_cfg_req *)xfer->xfer_buf;
 	req->valid_params = params->valid_params;
 	req->nav_id = params->nav_id;
@@ -2671,11 +2627,9 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_PSIL_PAIR,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "RM_PSIL:Message reconfig failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_psil_pair *)xfer->xfer_buf;
 	req->nav_id = nav_id;
 	req->src_thread = src_thread;
@@ -2727,11 +2681,9 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_PSIL_UNPAIR,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "RM_PSIL:Message reconfig failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_psil_unpair *)xfer->xfer_buf;
 	req->nav_id = nav_id;
 	req->src_thread = src_thread;
@@ -2782,11 +2734,9 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_TX_CH_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message TX_CH_CFG alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_rm_udmap_tx_ch_cfg_req *)xfer->xfer_buf;
 	req->valid_params = params->valid_params;
 	req->nav_id = params->nav_id;
@@ -2854,11 +2804,9 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_RX_CH_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message RX_CH_CFG alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_rm_udmap_rx_ch_cfg_req *)xfer->xfer_buf;
 	req->valid_params = params->valid_params;
 	req->nav_id = params->nav_id;
@@ -2923,11 +2871,9 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_FLOW_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "RX_FL_CFG: Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_rm_udmap_flow_cfg_req *)xfer->xfer_buf;
 	req->valid_params = params->valid_params;
 	req->nav_id = params->nav_id;
@@ -2995,11 +2941,9 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_REQUEST,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_proc_request *)xfer->xfer_buf;
 	req->processor_id = proc_id;
 
@@ -3047,11 +2991,9 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_RELEASE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_proc_release *)xfer->xfer_buf;
 	req->processor_id = proc_id;
 
@@ -3102,11 +3044,9 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_HANDOVER,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_proc_handover *)xfer->xfer_buf;
 	req->processor_id = proc_id;
 	req->host_id = host_id;
@@ -3161,11 +3101,9 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CONFIG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_set_config *)xfer->xfer_buf;
 	req->processor_id = proc_id;
 	req->bootvector_low = bootvector & TI_SCI_ADDR_LOW_MASK;
@@ -3222,11 +3160,9 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CTRL,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_set_ctrl *)xfer->xfer_buf;
 	req->processor_id = proc_id;
 	req->control_flags_set = control_flags_set;
@@ -3281,11 +3217,9 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_STATUS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_get_status *)xfer->xfer_buf;
 	req->processor_id = proc_id;
 
-- 
2.34.1

