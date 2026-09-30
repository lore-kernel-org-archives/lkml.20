Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A864A3D4A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790798602; cv=fail; b=CVa+fgvUaxkaHJt8GeNXm9FDTqFoBHR5l3o9PNpQv3lAZi1mT5cdukKmE4EAn4QllpeYY5vD/iQTsLwEOm4PI47WJ8/94QhYjZ1/gEsXmI6ScOcLoDPagjFDT7AM0euCK/XzZqQ6AkeddSoWuZvAhn/x/ZrPyX0ivcTjYG2JQ28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790798602; c=relaxed/simple;
	bh=EXIak0etSzVPBPOQ9UXiUT2jLsKZ9P6D0Rm6MRnUbzY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y5PUVwh+pLWrHhpKQ1/XnPfFsa0MfJN6YoT4+vgMFhGh35mVYBBXOHX+i12ClIGSJ36AvH/N6uc7Q1+BqFOZ3kV/d4o3mtJstBRe6Q0IBUfwiow7IF/lNW8X8SDpNHwmWx4V6rRgM92HonLNBdM/u87SXP9tNOdRnaNzl4ZfFso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=cVdHYtDU; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=c+EC4PpS; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="cVdHYtDU";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="c+EC4PpS"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UJsmab347110;
	Wed, 30 Sep 2026 15:03:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=KBPTX6qZBnU1Jy9rEkI1H/DmsdwGTzWVTydMmFBgw
	VY=; b=cVdHYtDU9Q/6wdkG52+4+SIEgAjQw18gOcie7eLCooiV/QaG+4rFPW+zM
	nkzGk/73Vut6eLPcae4Ikew9yxp3n3fFtRyuD6laJIdjQIHPuPDp3L59T0jA4bVy
	924QHeYvZ28UU++XTDOehcR0UKuFQMOTYfsfnwUJ2rFHUT0PNKjfUxvRQhmOxDR7
	5T4MEYCiktcYt/7Zx2ulCnDr95o30d2bwJbYnivxDQ1AW3pGUFsRctlzraqXDDSE
	qI84hEU30g35RTTt7CwCejeEXGSagQAvwgu0mYI5/I+EkB3dLcQ0B56IDJF7fSOg
	KetMstP3LV9nVaXz3gNUqLXqCl0aA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012048.outbound.protection.outlook.com [52.101.48.48])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h10s237jh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 15:03:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjOUlxP1ogXLt9xShRFEoB52yEbhi0elcubhlJEcvc6gsAw8LrRI8si8T+n3LRW1z5jiYDy0i9ZrmgpV3plk5F6pDTmNbKmrAfUzhIPMpzYge04UtG3t+RseAH2TxzTFbAXIl+tqsAjkIi3njm82wwLg0L3NF8ikN7CCGYr3Lkxdei9V9mr1nA0CatcL2qefTXJ6+8RzWxahOGLpTiL9RDw8Uh+UujIhy2fSzlAWNROFfRLnkRDq9WCdKCXH3Wcl/jfrZknCSyTokDJ3su9D+jBInh2chPQIq4IKkg4CT56RkicrPdE/ecK+kbXiT1ztnQnD9BoqI8iGaHDv8xB/eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBPTX6qZBnU1Jy9rEkI1H/DmsdwGTzWVTydMmFBgwVY=;
 b=Iqn/hf1PI9ObhdSmQo0QL1lpc46nzVab0l87Qo7B/ZXdNFln9D7M4K9HuwFlPkQ5dojl3FQQOtnPkhD4tVdf/upuH8z247+61merVJwljO3HjXxcaGHOhGzPeugF+Ll+7fM0V9Nii3o8kRYYvPF8axHcAcj6a2rFDN16nk9pv8P6yY7GT6dmNUWve2ppm5U+nnUn9ez0kqlHNqlDbGK9nZCVyt7oDTva6GCs3sd9cbJfhEyzGQEqK6WeGMViZ1rtMrWzTv3ESaxQE5enMRR4KDHlltTQbNoL61Mn9MdmI8ERf78bbxYf2GHCgGx453ygbDgYwDQmVzhqspaM77BLLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBPTX6qZBnU1Jy9rEkI1H/DmsdwGTzWVTydMmFBgwVY=;
 b=c+EC4PpSDCbyLlOoY+N8MGMhfb7ERz1f8RSowuXkWz9vrtoCI+KUkHMTYqYfJYkcKQgCAquHdNpMPJYdlMtVy+hYtMNAg+GqcpsDF8krMRcx+SLFui2UQGIr1JWKstYiARW/mpBaMBVtOV9zWFy8/w7lL4Y6HCGXd3f35hD/cW4=
Received: from PH8PR02CA0045.namprd02.prod.outlook.com (2603:10b6:510:2da::33)
 by MN2PR10MB4397.namprd10.prod.outlook.com (2603:10b6:208:1d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 20:03:12 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:510:2da:cafe::90) by PH8PR02CA0045.outlook.office365.com
 (2603:10b6:510:2da::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 20:03:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 20:03:09 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 15:02:12 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 15:02:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 15:02:12 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UK20Nx513314;
	Wed, 30 Sep 2026 15:02:10 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <jassisinghbrar@gmail.com>, <nm@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <b-padhi@ti.com>, <vigneshr@ti.com>
Subject: [PATCH v3 2/2] mailbox: ti-msgmgr: Read exact number of trailing message bytes
Date: Thu, 1 Oct 2026 01:31:58 +0530
Message-ID: <20260930200158.174118-3-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930200158.174118-1-b-padhi@ti.com>
References: <20260930200158.174118-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|MN2PR10MB4397:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fb48321-2b2b-4c21-a01d-08df1f2dd9f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|10067099003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UX80HgZljSz+NcJLLSmW0DcQMt//3PjMKkFrM/h66ieQ6apKTuUOs7eYg2nKyE/ez/CJNDDKapkKBZzYQJK9gX7PbV3GbfU+MKHg5b1yIGHiZBSNIlEYEXEEeGkroV6ly0/fWi5ABiv9j5OtlOu+J0zV8vD7PKzu/1FiJWXJ2Y3rmtLqSDajxMaYt/v94IKbKGf1LHAfNLkfcN9ekSa9dgi+wel1ZAhHGsgZLQ4R6BgfHFhm7vX5VUtszoWhflxJgFioAlkFz2230qNtVXVdYIyK0y20+M0kE9Lfe9KU+BcUcej85/JNqYSMFcX9PjJt+XVywLZ5CFuTHTQYuRoLCCVw4DfTS5yH2l0eYh0ETKIWSlVgKY7CmpPTVGScJaoxDB9CHG/03j9B0Ddj9lMIGAOYjwssR23JUjU+cugJ6GrD2VnRCVtD0dxyoh+LmGfGd13abnKfC7Vd28YbRxT9QhPUBuJGT+e1Pv5UWw/hBouaCo+vlwH+cxdPBMjilqJW2oOFvP4AnyC/IktEsm4xU9dk7zG7yh+scjbFs7uTjizfB0XfxHFmdeL7Ekk9dpcURZBCKSlMK+25V3qaI+ao/jNRNAVDigpbUh9Q/nyFykGbJy2W4b9NpOAwIgjWgWbKz2s4XUeBrpWbHswnqwwrNjr8YdN7khA4ZjTzOpPGIi8XYXw229Yqa33ET3uX5AZEL7GyuU6DY87HvGLvFK13NQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	muSJk6n7O9sXqvDJo2ICxs5EfJrtEsYIrT0RJqm45RD8PfQw0pppLAeX6cVn7k9EaWMVC8SFMhALpzaCqR8q6pp3tnAYiR1Xm/mWxsKOs3iyRaMyRGhkcg+JITk4tGfxdjsc+/yHn/oaMLUPup+Ya9sIdAOO6fJFRVmvuVbVQ9D4QgPgHVN56XQ3AGBbxY6865oTN6SyQDqLSy3MeIfZFPvLWAy9y9Iuxotirb0nSILGEVpQXrEp1ApfszpA3B5nfOCQen1+59JlGozWsMamjRprPXH06APlBea+J69AY0bsfGDCoboXYYX53gf/huAW1KD0P+M251nUKZ3VK8wcimgOesXk22N143l+PcdP+ugVf2p3wmcsxvkLpJuUtEekerKuhc++6A+oDMS3QAi9gqQx6zkn/UNFZBu85vED+l4zSuXZ8OjED+N19DCcWAbQ
X-Exchange-RoutingPolicyChecked:
	nB19Lbet96MrKxZskhwHciOQ34axPbXZSJH6AXQouavBDAlJgu6md9G/QcbldE5/TI39UryHjTB1ez46ERTVPMnyXmqG/GAJEwk1BemAFYsYv3PATloPVccDGa3HPab/7wc2T7oXAExWqWfvzo5g77Ulj44XUxx1OkrX22HBKbBMK35UlLiKaVas1LpvMHmbx/Q6+IQOBky9S81zZLAFQu/oAygUr3iB3mBZ2bsf2J07dONT2AEl5oNGJpneLV82RSjwRwAwhuZDR9Y2YlAFN5dqyeEaagFD0KZ2dNHqlvZqo1KO6eBgCfkz8ndJvwH9M0aEJ8++Suc7pwtgSmBg+g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 20:03:09.9291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb48321-2b2b-4c21-a01d-08df1f2dd9f6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4397
X-Proofpoint-GUID: nEA9h5MR46MvTLA1fXqtbDU_ldBX6gq2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA4MSBTYWx0ZWRfXx84M6IjJ2sYf
 90KahAO+nrHuuvP9boWTksbYuUxG3Pd2s1xem0jM+A1GSSlwoYWsekuPSLHQaYMRaPGTveCKpSy
 aaqVfkLBCAiqaopFULtoYQFlvO7VUWIoWoqqOiCHVaZXpyMZvnlvEGrivRpwWfNz6RGvi8gKGhP
 0yIpKjtOGZXYaTidlI/V3OMHi8pHchYjqpQG0z2jxKzD71xrZBeQi5hK6zp9n3MofioH8MqqOYZ
 zduWIMI/DqEUHjG4adaCLjDLevnghwavapdnX5+08dNJ+aOQJipBOUpu5eCSQ3KkX/fl4S67Wtz
 x9r2AUFbiQdaHsgU07SqpakK2/Xvp2WffhTbvlYKDXgN9xAHL7fywwBI/KVfVD/BgBy9AeVor5T
 KckilDVHaUx+mdTnbG8X0FJuZnloxAIhfCP6snaNtytTWComGWY1P6SduUkiHVVrVHKhTRF3Lkv
 MZDU6NgdDzmpUWA8DDQ==
X-Proofpoint-ORIG-GUID: nEA9h5MR46MvTLA1fXqtbDU_ldBX6gq2
X-Authority-Analysis: v=2.4 cv=G6aJgNk5 c=1 sm=1 tr=0 ts=6abd6b04 cx=c_pps
 a=51LUNg6eRAGyxmNGkw1ZTQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=0KoXfk4BxXABeKFHTBYA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA4MSBTYWx0ZWRfX8ykxZcwBA5J+
 /AGMyY88XYKTsNZbs7g/ewW7ebwy5G4poWEBZmChV3W70spJQZ06U5F4WQd2AL3Mt554ovJzdeg
 tm+bF8xQ4rHq2qb1opm5ayAMA1jvvEw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300081

ti_msgmgr_send_data() copies the message to the data registers in u32
units. This has been harmless so far because the clients (TI-SCI)
always passed its preallocated message buffer, which is sized to the
maximum message size (60 or 64 bytes, a multiple of 4), so the extra
bytes read were still within the buffer. But, with a later TI-SCI
update, the message size can be varying now and not guaranteed to be a
multiple of 4, which would trigger KASAN out-of-bounds reports.

Therefore, memcpy() only the trailing bytes into a zeroed u32 before
writing it to the register. This is at most 3 bytes, so the overhead
is negligible.

Fixes: aace66b170ce ("mailbox: Introduce TI message manager driver")
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v3: Changelog:
1. Added Fixes tag in commit msg.

Link to v2:
https://lore.kernel.org/all/20260930143810.2419010-3-b-padhi@ti.com/

v2: Changelog:
1. Use memcpy() to construct the trailing word to handle host
endianness. (Sashiko bot)

Link to v1:
https://lore.kernel.org/all/20260929200159.4033010-3-b-padhi@ti.com/

 drivers/mailbox/ti-msgmgr.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/mailbox/ti-msgmgr.c b/drivers/mailbox/ti-msgmgr.c
index 425d5f9d9d0e3..e04b7f721ac8e 100644
--- a/drivers/mailbox/ti-msgmgr.c
+++ b/drivers/mailbox/ti-msgmgr.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/soc/ti/ti-msgmgr.h>
+#include <linux/string.h>
 
 #define Q_DATA_OFFSET(proxy, queue, reg)	\
 		     ((0x10000 * (proxy)) + (0x80 * (queue)) + ((reg) * 4))
@@ -425,10 +426,15 @@ static int ti_msgmgr_send_data(struct mbox_chan *chan, void *data)
 
 	trail_bytes = message->len % sizeof(u32);
 	if (trail_bytes) {
-		u32 data_trail = *word_data;
-
-		/* Ensure all unused data is 0 */
-		data_trail &= 0xFFFFFFFF >> (8 * (sizeof(u32) - trail_bytes));
+		/*
+		 * Copy only the trailing bytes instead of reading a full u32,
+		 * as the message buffer may end right after them and a u32
+		 * read would go past the end of it. This also leaves all
+		 * unused data as 0.
+		 */
+		u32 data_trail = 0;
+
+		memcpy(&data_trail, word_data, trail_bytes);
 		writel(data_trail, data_reg);
 		data_reg += sizeof(u32);
 	}
-- 
2.34.1

