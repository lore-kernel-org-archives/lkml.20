Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B584F30C4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784505; cv=fail; b=g+IRClBv62tiIJCUHKfJHtqY12IvC5S4xOYhUlmhssUWYxkOWUwylnp43udN69KC3zxkCyWewiIDOixTFAPxK0FCDekaIoO3pIVv3wTS5IsxvRA9B6MtMcfTdlhv5Uyea8YtqujofGcI/P0Ow8blbhfW1iUZzJfIpKJYp0GX4C0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784505; c=relaxed/simple;
	bh=e33ajQUvo/jnsuSkkiPw5KiJ5EaKKbcWjvThXa7qJ84=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AUCYf61LQA75FcyKRqNo8zF5MGxZkfVfdPaYVslrig+0fd+9XmA6xCf3yJ1CD2XnHr4GdTImeSrg8r4s94KdhBezoO/rVEXQsYoip3PquuzPRha1xB3P13mCjdU3tClz3OxPoCANCdHQV7wYLhm9kRBuTpEGuxesa/J5T4xaIQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=mKeQgx3K; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=fgK5xJHn; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="mKeQgx3K";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="fgK5xJHn"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UE1GnG3333233;
	Wed, 30 Sep 2026 11:08:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=HMMwjiIjDACCJN+qCDebN0HWDecWMTlxsz2zrf709
	O8=; b=mKeQgx3KwFrWP8kF6qwDmfhha24ilx5Ho8voaoKxgnspZpoeH1VY38Bd7
	1lnKKRtM/dZwpOyamzhW5UXjTdpyhWjhiGtsJSb4NbITQiWnoPTM7sZpKdildgpc
	msSbkvvMNIyjEEM/fb+TGEoEC7eaSTM8CIJZmGRxUQQ4ZJDjh7getIODtWvtYaGq
	UQz0kvJ0R8p4tH20xXVfFy2VolpATBvUcDIIEJ0Z4IRlnpnDmcyC7Q3MDOOI1zW0
	b+Sa7Tdgt18b/fRBPqeDoUtjynQ5SLmTnLj2fUBNQWMpBun8sv4fNNu7C+bkXrlQ
	2oLk99KXhNocZHZWZScJuyZ37D3Cg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013071.outbound.protection.outlook.com [40.93.201.71])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h10t1svxp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 11:08:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndr40avrtmtdlL9ER9UF/49ANUDVoS3ez6ZhZ08NHyMGpgVcDNlEi87sk61KbZGzRlp/hb6iurUgPrDbTAYKOGqqACO58VbySq5+qAGbm/D+IPlfYI1felmU3Ma0NB1OOVXf9dAGwsnMiyHI8LzxFux4YodjDNwi1nlHwA5w7Lcvf2pcAFl5qjMVtYY7RJEdD8oOjfYUM7m2/r/s36dX7efvD17HXLjrxVFsui/pV8iQ3HGCf0MMgrQkxOsdqP+GnWPMnxXeB/TxyXrXVqwZZ5lhfBUw2FxGrSGgNszzepPjV1dLrEYsWhY8woIOgEdAQnRuGKr41c1PcpH7PLHpbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMMwjiIjDACCJN+qCDebN0HWDecWMTlxsz2zrf709O8=;
 b=yq+pNG9Wwgzy+QMgz2zYiqqE0j4s8xEfy+MBYlucK5ON1piVQOAR4NIo2Z7IdekS0ZP6Myjyd4d4jNWUaEmfcbvfvpCMOZohKHXghUKj99p/5IOF47peXKmNFiwqGtHTy82uqGATkEGBh8Qw6q53ItoLz5RqAXr/QZrJXjatFccp1U8d4Rap4E6JmtCnbMFT39sMa3/Yi2QZgeOwsMu9HQBEw389Lsr9H3ay6ttf4OhUbHucRxLYbSrQr4M/jNv2EC3SIlocWNgTOLUxpnbWubofDRMAdXL+TNKRFyUWvMRj68M8fXytJM2OmykeRp+fATgNRKjmkwocJE32cxETTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMMwjiIjDACCJN+qCDebN0HWDecWMTlxsz2zrf709O8=;
 b=fgK5xJHn6IDMBuHygZoc9hyC9B+56msByZDZCq38WW1HOehmOEJnkLyNZMiGqmIJI8A4fWG3H8fEuKEWu6hx+EDokhCMD0nqy256VEziNNl1SxYwKJoaLt54pcn8rokQ6/vDSIptLkrRq8lWAT4RV/G5mG2Q2KAgxyu/tlzC7Tk=
Received: from BLAPR03CA0081.namprd03.prod.outlook.com (2603:10b6:208:329::26)
 by SN4PR10MB5638.namprd10.prod.outlook.com (2603:10b6:806:209::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 16:08:02 +0000
Received: from BN1PEPF00018546.namprd05.prod.outlook.com
 (2603:10b6:208:329:cafe::3d) by BLAPR03CA0081.outlook.office365.com
 (2603:10b6:208:329::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 16:08:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00018546.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 16:08:01 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:07:07 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:07:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:07:06 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UG68WL3425232;
	Wed, 30 Sep 2026 11:07:04 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v2 18/22] firmware: ti: ti_sci_device: Move device ops into its own file
Date: Wed, 30 Sep 2026 21:36:03 +0530
Message-ID: <20260930160607.2674980-19-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018546:EE_|SN4PR10MB5638:EE_
X-MS-Office365-Filtering-Correlation-Id: 52e14655-4cb5-4703-2dad-08df1f0d0066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|18002099003|22082099003|13003099007|56012099006|6133799003|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	vKqSOhlhpvhL7MTEXbI1O5NYHYqWUn/OiaXODjsPiIFAxAyyK+LeHaefC1HGxWnbx9q0S3VG6VtJaOvnG2qTE2/W0xzhmmqHcP5DdfkGy0+fgvHoTkr+2T5YREBTbWJq+TOFGj63l/jJJtLTpw80Cr4oGtK2eNXSceRt4FexKf48xDu9k0GVjYPyPDn//OdQt/W5vbEfCwkc0GI4tz5RNNkQwgIGP2f4OCHtQPVtal0iXYu9Prk2nGS7sw9Qfb8jSubyBaOxJRjkTz2ujUs+jy3S2qSwugu7lqbA0jqs1wveT6/pU5O5FSHfKsWCvJ6gythZsIj3ChkGlk71bELiR5HSZfLkdQNKLNklEUK12qdks7pk7ty38aCGPXdKeReXmZqX7NKea3VrqbGwfYmQeQ0V8ptijPtvChzjR+NjD0EJTFB9NOxlP4Q7/r4VYpyZwmSQnGv8/Q1jZzAfdhsTYtVZd7Y9+KPeKrANzTPEAQ+me+pyJ2rvmQmcP96PvaYmWO6q1FhF2xpyU/XReeqL+Gufu7yrnl7SEGozfKPk9lGrPK9lf+5j2L1qndlFF6cBxDZLkyP58lOQ+IahT/YzewptFTwXidp0SdjcIQvxEqWJZPveXtL1Y7uXEIUh5Q4PwMQcyWzHg9Kdx10404guJw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(13003099007)(56012099006)(6133799003)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AXQiIXMiUsuoiCcLdE194H3TMb6VJdAKF+h7ONVkRMz/pS+KtDg2STmOXgaLH8WCwNjlRAr4GLHPek5GfS/N0wUWcxhVN2r1bPdCHbhvnYTecvz/BlwXn48wZMFQy57Vjkz85+HtOdUL4ccFkEFQ8o/BcmOYO6aFXUdKm5oKh1Fllao4mQ4TKU6+9bBOzj4nz8rmBBA9JefJwV/Oq7mqyVbfkFz2LBtH3MNqMqQXA/Flr+u68SZwRC837N6ooK3pTnv+Nv8DxAH6fggl/qUJoTtEWJPWgYGq04IKmwI8UrE1QHtjWpnMqEw3HbeCrb8qdQKANfkJa6dGm2M9pA2qeymglh6xBUtDFQdSpTabTQ7F/801RIKonwMOgMPY210JrGfvYyuNa0tZrKoWFueMUrvO347bHGOPgK4zlCn+TLsmmJgQoxZumchMCL1tESz6
X-Exchange-RoutingPolicyChecked:
	MECZH+o2GCOxxgRUKw+Ad5Lw4svKOxB0rJ70hhsOPvmYI2l3CVTJYWriGW+vsy8JFYlFBz32hSVinSNs8mU0wVn1LMuCOcMVm+ZvPLFv4PpfSr1liE8H6mZzORQW+X05xhG1HO9qlDpGCfryLbCtF0bumYdInE9LHL3n0uXlJnh2TdJq2Xi/NidHTB0bMr4ieSvRKK8ta7cgj5BKkc7W4YLe0QhLpRUcLJuc9Ce/f1bW0rH/h3dKJxXj8TmkOJaRZAvBL6W2Us1MaCk79O/mH0Yuj99hXblmv6LSZW8sy7tfEljUbZQ6OVkhIT+ua8CFpJyYZzgOLXPCnzM+kdzUNw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:08:01.0516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52e14655-4cb5-4703-2dad-08df1f0d0066
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018546.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5638
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX/B0oRqpGjLcV
 lJl7DgA/C0YkdgK9Q1djLR4JUswanl/trZP7IIwODc171mbVXoUE6pZUeUBOQOEKKyFKRuYnUpe
 ncDlDqPwDM8GHmH0/AYkV5nuJMejBeg=
X-Proofpoint-ORIG-GUID: OWm_hffusOvphMcf30yzrOylss-nFo-Q
X-Authority-Analysis: v=2.4 cv=C7R8WgP+ c=1 sm=1 tr=0 ts=6abd33ea cx=c_pps
 a=J0RhwYao4za//xiv/28V8w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=-OrfxRuxSJ2hv7tAG5wA:9
X-Proofpoint-GUID: OWm_hffusOvphMcf30yzrOylss-nFo-Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX8SkJMevvmcE5
 6Li9GZDwd0iM7ZE72kU8HkG93Y49ybMsL9LyRQstGhxXjKrwbiWhKhC/4jocuYAjS6hRyX3h+Xa
 CqYCxWYtlqVUpyjrj8+K7ZIcHdwmUvIxnO0j2KalNA+KmuunW/58/8aW3ahG+IeqYEpiFhtiv6k
 t9HaFwfUDX6Ig8S4S4yS15v6MPoXmnQHyoixZ1GC4G34o9GTHImd4WFuDO3oHKT6veQ0LRUFXMP
 DMiKIsV6YCaLMBdgcyK2V6dUGMZuLzfGdzvHrKHnao/gt8gmR8XmdVw9UWSSUn10Z0ZKlVvn70W
 TyvPQ+2c1bnz9+gFSPLCASaWC5HuhN8Owye3SYFgbi84pajHASTFyyoyVKmfsPyuJiCSAuKzmUC
 OZNnWZe8qmwmNmmC9Dowf+cEz5rM9/0JRv+0d99rBRd31iedUT3ou4VYeCfaiOO/fkv/bVXFoi/
 ZrX+x75Kt3TqYJqQy/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

From: Andrew Davis <afd@ti.com>

Extract the device operations related functions and services from
ti_sci.c into its own file. This breaks down the single large file
into smaller logical files for better readability and maintenance.

As the module is now built from multiple objects, rename ti_sci.c to
ti_sci_core.c so the resulting module keeps its ti_sci name. Also drop
the static inline from ti_sci_do_xfer() and declare it in ti_sci.h so
that it can be shared with the new file.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-19-b-padhi@ti.com/

 drivers/firmware/ti/Makefile                  |   2 +
 drivers/firmware/ti/ti_sci.h                  |   7 +
 .../firmware/ti/{ti_sci.c => ti_sci_core.c}   | 378 +----------------
 drivers/firmware/ti/ti_sci_device.c           | 388 ++++++++++++++++++
 4 files changed, 402 insertions(+), 373 deletions(-)
 rename drivers/firmware/ti/{ti_sci.c => ti_sci_core.c} (89%)
 create mode 100644 drivers/firmware/ti/ti_sci_device.c

diff --git a/drivers/firmware/ti/Makefile b/drivers/firmware/ti/Makefile
index 433b108782fbe..a3a056eedd9a5 100644
--- a/drivers/firmware/ti/Makefile
+++ b/drivers/firmware/ti/Makefile
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+ti_sci-y			:= ti_sci_core.o
+ti_sci-y			+= ti_sci_device.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
diff --git a/drivers/firmware/ti/ti_sci.h b/drivers/firmware/ti/ti_sci.h
index f2f17bcac39e4..79f56699faf29 100644
--- a/drivers/firmware/ti/ti_sci.h
+++ b/drivers/firmware/ti/ti_sci.h
@@ -1560,4 +1560,11 @@ struct ti_sci_msg_resp_get_status {
 	u32 status_flags;
 } __packed;
 
+int ti_sci_do_xfer(const struct ti_sci_handle *handle,
+		   u16 msg_type, u32 msg_flags,
+		   void *tx_message, size_t tx_message_size,
+		   void *rx_message, size_t rx_message_size);
+
+void ti_sci_setup_device_ops(struct ti_sci_dev_ops *dops);
+
 #endif /* __TI_SCI_H */
diff --git a/drivers/firmware/ti/ti_sci.c b/drivers/firmware/ti/ti_sci_core.c
similarity index 89%
rename from drivers/firmware/ti/ti_sci.c
rename to drivers/firmware/ti/ti_sci_core.c
index 5d3151571ac33..e98bf3c5f9dc1 100644
--- a/drivers/firmware/ti/ti_sci.c
+++ b/drivers/firmware/ti/ti_sci_core.c
@@ -444,10 +444,10 @@ static inline bool ti_sci_is_response_ack(void *r)
  *         corresponding error if transmit fails, or
  *         return 0, if all goes well.
  */
-static inline int ti_sci_do_xfer(const struct ti_sci_handle *handle,
-				 u16 msg_type, u32 msg_flags,
-				 void *tx_message, size_t tx_message_size,
-				 void *rx_message, size_t rx_message_size)
+int ti_sci_do_xfer(const struct ti_sci_handle *handle,
+		   u16 msg_type, u32 msg_flags,
+		   void *tx_message, size_t tx_message_size,
+		   void *rx_message, size_t rx_message_size)
 {
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
@@ -565,361 +565,6 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 	return 0;
 }
 
-/**
- * ti_sci_set_device_state() - Set device state helper
- * @handle:	pointer to TI SCI handle
- * @id:		Device identifier
- * @flags:	flags to setup for the device
- * @state:	State to move the device to
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
-				   u32 id, u32 flags, u8 state)
-{
-	struct ti_sci_msg_req_set_device_state req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.id = id;
-	req.state = state;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_DEVICE_STATE,
-			     flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_get_device_state() - Get device state helper
- * @handle:	Handle to the device
- * @id:		Device Identifier
- * @clcnt:	Pointer to Context Loss Count
- * @resets:	pointer to resets
- * @p_state:	pointer to p_state
- * @c_state:	pointer to c_state
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
-				   u32 id,  u32 *clcnt,  u32 *resets,
-				    u8 *p_state,  u8 *c_state)
-{
-	struct ti_sci_msg_req_get_device_state req;
-	struct ti_sci_msg_resp_get_device_state resp;
-	int ret = 0;
-
-	if (!clcnt && !resets && !p_state && !c_state)
-		return -EINVAL;
-
-	req.id = id;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_DEVICE_STATE,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	if (clcnt)
-		*clcnt = resp.context_loss_count;
-	if (resets)
-		*resets = resp.resets;
-	if (p_state)
-		*p_state = resp.programmed_state;
-	if (c_state)
-		*c_state = resp.current_state;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_get_device() - command to request for device managed by TISCI
- *			     that can be shared with other hosts.
- * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
- * @id:		Device Identifier
- *
- * Request for the device - NOTE: the client MUST maintain integrity of
- * usage count by balancing get_device with put_device. No refcounting is
- * managed by driver for that purpose.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_get_device(const struct ti_sci_handle *handle, u32 id)
-{
-	return ti_sci_set_device_state(handle, id, 0,
-				       MSG_DEVICE_SW_STATE_ON);
-}
-
-/**
- * ti_sci_cmd_get_device_exclusive() - command to request for device managed by
- *				       TISCI that is exclusively owned by the
- *				       requesting host.
- * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
- * @id:		Device Identifier
- *
- * Request for the device - NOTE: the client MUST maintain integrity of
- * usage count by balancing get_device with put_device. No refcounting is
- * managed by driver for that purpose.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_get_device_exclusive(const struct ti_sci_handle *handle,
-					   u32 id)
-{
-	return ti_sci_set_device_state(handle, id,
-				       MSG_FLAG_DEVICE_EXCLUSIVE,
-				       MSG_DEVICE_SW_STATE_ON);
-}
-
-/**
- * ti_sci_cmd_idle_device() - Command to idle a device managed by TISCI
- * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
- * @id:		Device Identifier
- *
- * Request for the device - NOTE: the client MUST maintain integrity of
- * usage count by balancing get_device with put_device. No refcounting is
- * managed by driver for that purpose.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_idle_device(const struct ti_sci_handle *handle, u32 id)
-{
-	return ti_sci_set_device_state(handle, id, 0,
-				       MSG_DEVICE_SW_STATE_RETENTION);
-}
-
-/**
- * ti_sci_cmd_idle_device_exclusive() - Command to idle a device managed by
- *					TISCI that is exclusively owned by
- *					requesting host.
- * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
- * @id:		Device Identifier
- *
- * Request for the device - NOTE: the client MUST maintain integrity of
- * usage count by balancing get_device with put_device. No refcounting is
- * managed by driver for that purpose.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_idle_device_exclusive(const struct ti_sci_handle *handle,
-					    u32 id)
-{
-	return ti_sci_set_device_state(handle, id,
-				       MSG_FLAG_DEVICE_EXCLUSIVE,
-				       MSG_DEVICE_SW_STATE_RETENTION);
-}
-
-/**
- * ti_sci_cmd_put_device() - command to release a device managed by TISCI
- * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
- * @id:		Device Identifier
- *
- * Request for the device - NOTE: the client MUST maintain integrity of
- * usage count by balancing get_device with put_device. No refcounting is
- * managed by driver for that purpose.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_put_device(const struct ti_sci_handle *handle, u32 id)
-{
-	return ti_sci_set_device_state(handle, id,
-				       0, MSG_DEVICE_SW_STATE_AUTO_OFF);
-}
-
-/**
- * ti_sci_cmd_dev_is_valid() - Is the device valid
- * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
- * @id:		Device Identifier
- *
- * Return: 0 if all went fine and the device ID is valid, else return
- * appropriate error.
- */
-static int ti_sci_cmd_dev_is_valid(const struct ti_sci_handle *handle, u32 id)
-{
-	u8 unused;
-
-	/* check the device state which will also tell us if the ID is valid */
-	return ti_sci_get_device_state(handle, id, NULL, NULL, NULL, &unused);
-}
-
-/**
- * ti_sci_cmd_dev_get_clcnt() - Get context loss counter
- * @handle:	Pointer to TISCI handle
- * @id:		Device Identifier
- * @count:	Pointer to Context Loss counter to populate
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_dev_get_clcnt(const struct ti_sci_handle *handle, u32 id,
-				    u32 *count)
-{
-	return ti_sci_get_device_state(handle, id, count, NULL, NULL, NULL);
-}
-
-/**
- * ti_sci_cmd_dev_is_idle() - Check if the device is requested to be idle
- * @handle:	Pointer to TISCI handle
- * @id:		Device Identifier
- * @r_state:	true if requested to be idle
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_dev_is_idle(const struct ti_sci_handle *handle, u32 id,
-				  bool *r_state)
-{
-	int ret;
-	u8 state;
-
-	if (!r_state)
-		return -EINVAL;
-
-	ret = ti_sci_get_device_state(handle, id, NULL, NULL, &state, NULL);
-	if (ret)
-		return ret;
-
-	*r_state = (state == MSG_DEVICE_SW_STATE_RETENTION);
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_dev_is_stop() - Check if the device is requested to be stopped
- * @handle:	Pointer to TISCI handle
- * @id:		Device Identifier
- * @r_state:	true if requested to be stopped
- * @curr_state:	true if currently stopped.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_dev_is_stop(const struct ti_sci_handle *handle, u32 id,
-				  bool *r_state,  bool *curr_state)
-{
-	int ret;
-	u8 p_state, c_state;
-
-	if (!r_state && !curr_state)
-		return -EINVAL;
-
-	ret =
-	    ti_sci_get_device_state(handle, id, NULL, NULL, &p_state, &c_state);
-	if (ret)
-		return ret;
-
-	if (r_state)
-		*r_state = (p_state == MSG_DEVICE_SW_STATE_AUTO_OFF);
-	if (curr_state)
-		*curr_state = (c_state == MSG_DEVICE_HW_STATE_OFF);
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_dev_is_on() - Check if the device is requested to be ON
- * @handle:	Pointer to TISCI handle
- * @id:		Device Identifier
- * @r_state:	true if requested to be ON
- * @curr_state:	true if currently ON and active
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_dev_is_on(const struct ti_sci_handle *handle, u32 id,
-				bool *r_state,  bool *curr_state)
-{
-	int ret;
-	u8 p_state, c_state;
-
-	if (!r_state && !curr_state)
-		return -EINVAL;
-
-	ret =
-	    ti_sci_get_device_state(handle, id, NULL, NULL, &p_state, &c_state);
-	if (ret)
-		return ret;
-
-	if (r_state)
-		*r_state = (p_state == MSG_DEVICE_SW_STATE_ON);
-	if (curr_state)
-		*curr_state = (c_state == MSG_DEVICE_HW_STATE_ON);
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_dev_is_trans() - Check if the device is currently transitioning
- * @handle:	Pointer to TISCI handle
- * @id:		Device Identifier
- * @curr_state:	true if currently transitioning.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_dev_is_trans(const struct ti_sci_handle *handle, u32 id,
-				   bool *curr_state)
-{
-	int ret;
-	u8 state;
-
-	if (!curr_state)
-		return -EINVAL;
-
-	ret = ti_sci_get_device_state(handle, id, NULL, NULL, NULL, &state);
-	if (ret)
-		return ret;
-
-	*curr_state = (state == MSG_DEVICE_HW_STATE_TRANS);
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_set_device_resets() - command to set resets for device managed
- *				    by TISCI
- * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
- * @id:		Device Identifier
- * @reset_state: Device specific reset bit field
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
-					u32 id, u32 reset_state)
-{
-	struct ti_sci_msg_req_set_device_resets req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.id = id;
-	req.resets = reset_state;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_DEVICE_RESETS,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_get_device_resets() - Get reset state for device managed
- *				    by TISCI
- * @handle:		Pointer to TISCI handle
- * @id:			Device Identifier
- * @reset_state:	Pointer to reset state to populate
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_get_device_resets(const struct ti_sci_handle *handle,
-					u32 id, u32 *reset_state)
-{
-	return ti_sci_get_device_state(handle, id, NULL, reset_state, NULL,
-				       NULL);
-}
-
 /**
  * ti_sci_set_clock_state() - Set clock state helper
  * @handle:	pointer to TI SCI handle
@@ -2577,20 +2222,7 @@ static void ti_sci_setup_ops(struct ti_sci_info *info)
 	struct ti_sci_rm_udmap_ops *udmap_ops = &ops->rm_udmap_ops;
 	struct ti_sci_proc_ops *pops = &ops->proc_ops;
 
-	dops->get_device = ti_sci_cmd_get_device;
-	dops->get_device_exclusive = ti_sci_cmd_get_device_exclusive;
-	dops->idle_device = ti_sci_cmd_idle_device;
-	dops->idle_device_exclusive = ti_sci_cmd_idle_device_exclusive;
-	dops->put_device = ti_sci_cmd_put_device;
-
-	dops->is_valid = ti_sci_cmd_dev_is_valid;
-	dops->get_context_loss_count = ti_sci_cmd_dev_get_clcnt;
-	dops->is_idle = ti_sci_cmd_dev_is_idle;
-	dops->is_stop = ti_sci_cmd_dev_is_stop;
-	dops->is_on = ti_sci_cmd_dev_is_on;
-	dops->is_transitioning = ti_sci_cmd_dev_is_trans;
-	dops->set_device_resets = ti_sci_cmd_set_device_resets;
-	dops->get_device_resets = ti_sci_cmd_get_device_resets;
+	ti_sci_setup_device_ops(dops);
 
 	cops->get_clock = ti_sci_cmd_get_clock;
 	cops->idle_clock = ti_sci_cmd_idle_clock;
diff --git a/drivers/firmware/ti/ti_sci_device.c b/drivers/firmware/ti/ti_sci_device.c
new file mode 100644
index 0000000000000..cb9888ca54a35
--- /dev/null
+++ b/drivers/firmware/ti/ti_sci_device.c
@@ -0,0 +1,388 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Texas Instruments System Control Interface Protocol Driver
+ *
+ * Copyright (C) 2015-2026 Texas Instruments Incorporated - https://www.ti.com/
+ *	Nishanth Menon
+ */
+
+#include <linux/soc/ti/ti_sci_protocol.h>
+
+#include "ti_sci.h"
+
+/**
+ * ti_sci_set_device_state() - Set device state helper
+ * @handle:	pointer to TI SCI handle
+ * @id:		Device identifier
+ * @flags:	flags to setup for the device
+ * @state:	State to move the device to
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
+				   u32 id, u32 flags, u8 state)
+{
+	struct ti_sci_msg_req_set_device_state req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.id = id;
+	req.state = state;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_DEVICE_STATE,
+			     flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_get_device_state() - Get device state helper
+ * @handle:	Handle to the device
+ * @id:		Device Identifier
+ * @clcnt:	Pointer to Context Loss Count
+ * @resets:	pointer to resets
+ * @p_state:	pointer to p_state
+ * @c_state:	pointer to c_state
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
+				   u32 id,  u32 *clcnt,  u32 *resets,
+				    u8 *p_state,  u8 *c_state)
+{
+	struct ti_sci_msg_req_get_device_state req;
+	struct ti_sci_msg_resp_get_device_state resp;
+	int ret = 0;
+
+	if (!clcnt && !resets && !p_state && !c_state)
+		return -EINVAL;
+
+	req.id = id;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_DEVICE_STATE,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	if (clcnt)
+		*clcnt = resp.context_loss_count;
+	if (resets)
+		*resets = resp.resets;
+	if (p_state)
+		*p_state = resp.programmed_state;
+	if (c_state)
+		*c_state = resp.current_state;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_get_device() - command to request for device managed by TISCI
+ *			     that can be shared with other hosts.
+ * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
+ * @id:		Device Identifier
+ *
+ * Request for the device - NOTE: the client MUST maintain integrity of
+ * usage count by balancing get_device with put_device. No refcounting is
+ * managed by driver for that purpose.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_get_device(const struct ti_sci_handle *handle, u32 id)
+{
+	return ti_sci_set_device_state(handle, id, 0,
+				       MSG_DEVICE_SW_STATE_ON);
+}
+
+/**
+ * ti_sci_cmd_get_device_exclusive() - command to request for device managed by
+ *				       TISCI that is exclusively owned by the
+ *				       requesting host.
+ * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
+ * @id:		Device Identifier
+ *
+ * Request for the device - NOTE: the client MUST maintain integrity of
+ * usage count by balancing get_device with put_device. No refcounting is
+ * managed by driver for that purpose.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_get_device_exclusive(const struct ti_sci_handle *handle,
+					   u32 id)
+{
+	return ti_sci_set_device_state(handle, id,
+				       MSG_FLAG_DEVICE_EXCLUSIVE,
+				       MSG_DEVICE_SW_STATE_ON);
+}
+
+/**
+ * ti_sci_cmd_idle_device() - Command to idle a device managed by TISCI
+ * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
+ * @id:		Device Identifier
+ *
+ * Request for the device - NOTE: the client MUST maintain integrity of
+ * usage count by balancing get_device with put_device. No refcounting is
+ * managed by driver for that purpose.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_idle_device(const struct ti_sci_handle *handle, u32 id)
+{
+	return ti_sci_set_device_state(handle, id, 0,
+				       MSG_DEVICE_SW_STATE_RETENTION);
+}
+
+/**
+ * ti_sci_cmd_idle_device_exclusive() - Command to idle a device managed by
+ *					TISCI that is exclusively owned by
+ *					requesting host.
+ * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
+ * @id:		Device Identifier
+ *
+ * Request for the device - NOTE: the client MUST maintain integrity of
+ * usage count by balancing get_device with put_device. No refcounting is
+ * managed by driver for that purpose.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_idle_device_exclusive(const struct ti_sci_handle *handle,
+					    u32 id)
+{
+	return ti_sci_set_device_state(handle, id,
+				       MSG_FLAG_DEVICE_EXCLUSIVE,
+				       MSG_DEVICE_SW_STATE_RETENTION);
+}
+
+/**
+ * ti_sci_cmd_put_device() - command to release a device managed by TISCI
+ * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
+ * @id:		Device Identifier
+ *
+ * Request for the device - NOTE: the client MUST maintain integrity of
+ * usage count by balancing get_device with put_device. No refcounting is
+ * managed by driver for that purpose.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_put_device(const struct ti_sci_handle *handle, u32 id)
+{
+	return ti_sci_set_device_state(handle, id,
+				       0, MSG_DEVICE_SW_STATE_AUTO_OFF);
+}
+
+/**
+ * ti_sci_cmd_dev_is_valid() - Is the device valid
+ * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
+ * @id:		Device Identifier
+ *
+ * Return: 0 if all went fine and the device ID is valid, else return
+ * appropriate error.
+ */
+static int ti_sci_cmd_dev_is_valid(const struct ti_sci_handle *handle, u32 id)
+{
+	u8 unused;
+
+	/* check the device state which will also tell us if the ID is valid */
+	return ti_sci_get_device_state(handle, id, NULL, NULL, NULL, &unused);
+}
+
+/**
+ * ti_sci_cmd_dev_get_clcnt() - Get context loss counter
+ * @handle:	Pointer to TISCI handle
+ * @id:		Device Identifier
+ * @count:	Pointer to Context Loss counter to populate
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_dev_get_clcnt(const struct ti_sci_handle *handle, u32 id,
+				    u32 *count)
+{
+	return ti_sci_get_device_state(handle, id, count, NULL, NULL, NULL);
+}
+
+/**
+ * ti_sci_cmd_dev_is_idle() - Check if the device is requested to be idle
+ * @handle:	Pointer to TISCI handle
+ * @id:		Device Identifier
+ * @r_state:	true if requested to be idle
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_dev_is_idle(const struct ti_sci_handle *handle, u32 id,
+				  bool *r_state)
+{
+	int ret;
+	u8 state;
+
+	if (!r_state)
+		return -EINVAL;
+
+	ret = ti_sci_get_device_state(handle, id, NULL, NULL, &state, NULL);
+	if (ret)
+		return ret;
+
+	*r_state = (state == MSG_DEVICE_SW_STATE_RETENTION);
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_dev_is_stop() - Check if the device is requested to be stopped
+ * @handle:	Pointer to TISCI handle
+ * @id:		Device Identifier
+ * @r_state:	true if requested to be stopped
+ * @curr_state:	true if currently stopped.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_dev_is_stop(const struct ti_sci_handle *handle, u32 id,
+				  bool *r_state,  bool *curr_state)
+{
+	int ret;
+	u8 p_state, c_state;
+
+	if (!r_state && !curr_state)
+		return -EINVAL;
+
+	ret =
+	    ti_sci_get_device_state(handle, id, NULL, NULL, &p_state, &c_state);
+	if (ret)
+		return ret;
+
+	if (r_state)
+		*r_state = (p_state == MSG_DEVICE_SW_STATE_AUTO_OFF);
+	if (curr_state)
+		*curr_state = (c_state == MSG_DEVICE_HW_STATE_OFF);
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_dev_is_on() - Check if the device is requested to be ON
+ * @handle:	Pointer to TISCI handle
+ * @id:		Device Identifier
+ * @r_state:	true if requested to be ON
+ * @curr_state:	true if currently ON and active
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_dev_is_on(const struct ti_sci_handle *handle, u32 id,
+				bool *r_state,  bool *curr_state)
+{
+	int ret;
+	u8 p_state, c_state;
+
+	if (!r_state && !curr_state)
+		return -EINVAL;
+
+	ret =
+	    ti_sci_get_device_state(handle, id, NULL, NULL, &p_state, &c_state);
+	if (ret)
+		return ret;
+
+	if (r_state)
+		*r_state = (p_state == MSG_DEVICE_SW_STATE_ON);
+	if (curr_state)
+		*curr_state = (c_state == MSG_DEVICE_HW_STATE_ON);
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_dev_is_trans() - Check if the device is currently transitioning
+ * @handle:	Pointer to TISCI handle
+ * @id:		Device Identifier
+ * @curr_state:	true if currently transitioning.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_dev_is_trans(const struct ti_sci_handle *handle, u32 id,
+				   bool *curr_state)
+{
+	int ret;
+	u8 state;
+
+	if (!curr_state)
+		return -EINVAL;
+
+	ret = ti_sci_get_device_state(handle, id, NULL, NULL, NULL, &state);
+	if (ret)
+		return ret;
+
+	*curr_state = (state == MSG_DEVICE_HW_STATE_TRANS);
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_set_device_resets() - command to set resets for device managed
+ *				    by TISCI
+ * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
+ * @id:		Device Identifier
+ * @reset_state: Device specific reset bit field
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
+					u32 id, u32 reset_state)
+{
+	struct ti_sci_msg_req_set_device_resets req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.id = id;
+	req.resets = reset_state;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_DEVICE_RESETS,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_get_device_resets() - Get reset state for device managed
+ *				    by TISCI
+ * @handle:		Pointer to TISCI handle
+ * @id:			Device Identifier
+ * @reset_state:	Pointer to reset state to populate
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_get_device_resets(const struct ti_sci_handle *handle,
+					u32 id, u32 *reset_state)
+{
+	return ti_sci_get_device_state(handle, id, NULL, reset_state, NULL,
+				       NULL);
+}
+
+/*
+ * ti_sci_setup_device_ops() - Setup the device operations structures
+ * @dops:	pointer to TISCI device ops structure
+ */
+void ti_sci_setup_device_ops(struct ti_sci_dev_ops *dops)
+{
+	dops->get_device = ti_sci_cmd_get_device;
+	dops->get_device_exclusive = ti_sci_cmd_get_device_exclusive;
+	dops->idle_device = ti_sci_cmd_idle_device;
+	dops->idle_device_exclusive = ti_sci_cmd_idle_device_exclusive;
+	dops->put_device = ti_sci_cmd_put_device;
+
+	dops->is_valid = ti_sci_cmd_dev_is_valid;
+	dops->get_context_loss_count = ti_sci_cmd_dev_get_clcnt;
+	dops->is_idle = ti_sci_cmd_dev_is_idle;
+	dops->is_stop = ti_sci_cmd_dev_is_stop;
+	dops->is_on = ti_sci_cmd_dev_is_on;
+	dops->is_transitioning = ti_sci_cmd_dev_is_trans;
+	dops->set_device_resets = ti_sci_cmd_set_device_resets;
+	dops->get_device_resets = ti_sci_cmd_get_device_resets;
+}
-- 
2.34.1

