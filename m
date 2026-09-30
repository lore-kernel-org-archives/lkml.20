Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD6836E467
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790798597; cv=fail; b=TaDOKw00PL6dg3PQkLVuSXABii6dURSDXXdyTTtoN1w9rSr91eWeyXUMNo+Ur1Zx8CzYwxq/d9yLZ66KdJPMD6Wh1s9kmh/yRPLYitP+w+XarlZBx9nTMa3e3vKhmdGiBgLKN5nAQY9FrKx5RX3rKZOXuArtEP3dkOKexwMJPsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790798597; c=relaxed/simple;
	bh=1tzMDOxIi+4xs6VWX1uMYijqiZuqCuurOQqjUk/F18g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eNmzRwr4AmyQsEM2xCup4P902DZfF+du9dVUr7lZQl8HqqLBryQjBMLVLtW51f/NkUz+FZEy4FbeKE+7xJwMXn48hX8ZgkxUNSvuVCp8n/VWzo/80l+8GEHulVmr+GXxEHX4g8HSmCaQGt5rLj3DQ9BZWky/SG+kFANQEO037bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=nB+lNwm5; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=nxw9ruxS; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="nB+lNwm5";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="nxw9ruxS"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UJtIZn032977;
	Wed, 30 Sep 2026 15:03:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=TFoUT63oZGKWo
	EZJmb2Qof2fwTKaplr51Cs9pcllAHE=; b=nB+lNwm5ZVyDQi0ZBb1N+36Rck0ix
	B9dqet3xNyMWtYMV4aNQAykdwsR7PNGrwfA+3VTlDnVxeDeLu5m5eSBjM74wxt83
	7qLbped+cx2XjTG7S4H7HG/98fmnWdM6ezuFK2pPnVjJt3grZ4H41T82N32E5J1E
	z+mylq0KS5zuPtZc/ltAAqStvgOP0dJdKD/Afx9rNcYKsUc8FOzRSESQu6tWyV8Y
	B9CIIlBnugu+bTOkVBgX14zNWeRxOIM/mXvs9ElUYgkFDY3VHpleZHRDYKC/uIZl
	V3IqFoJ3Pn7Yj2KPB/YzIc92xMylfX26TRwFrQ6P1xR9BCz+vs/8TM3aA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012061.outbound.protection.outlook.com [52.101.53.61])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0ydvbn9h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 15:03:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WD56qDIPf5TSVaq0Ankt1blhPLgAbDLYzvM25Uiusug+yhUrqEyJoXir+vB0rM1ViKbbXEWkXedip4LBuZBO+xVk71SH07EAbTLD7iayk1hHN7f/wqJnp0bVFnFqqwMPh5iYOjtbza+dzXAe1Mo3PuQ8ZMeF7sy1l7E792seFWKUayLiEUlIxte3MgREDmtbrhR5/afNKJv0vK7GYUpu+TbGxlv1/myPLaiNVR/pNdIuQ15igfDwGRc+RKchBeX7BZQo7w1K6xWv5epAYcRk/VxWFgYYQ7D+DMaPazoPfZmPDtajRu/X4Q0HRYxdHJrLDTeEwWcmgHvCQ1xBUrRp5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFoUT63oZGKWoEZJmb2Qof2fwTKaplr51Cs9pcllAHE=;
 b=rm6rXXXhZdOSsBr0MtEbJq5/tyKk9IoyvBe8Aiq5CbLDkqc0iFXSc/CpTWHTcgk9Qz/v64prwHFrGUTUEk4qWNN2jGtJ5AXdd27ckSqHgf+GFyfAs0THoTox+qp3hVvRN7efl3mf0EEg2p30dD+Zt+smeAsFfpRRXy4Wis3MgZu8roUAzQwmB/VADWAU99aYwpvU/DKdFgCn5WahKCIOH6MNx0x0H7QC0W6+UPaL0Qmda87wGSrj4jchx3nKO5mdKsPOVkTz8lFmWsHrL5k/fi6mMylKd9+X9VOefbQpHnhmDolCTgvnEy+MV0Poyf/cZf3k2ooOxdTFOJffhA24gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFoUT63oZGKWoEZJmb2Qof2fwTKaplr51Cs9pcllAHE=;
 b=nxw9ruxSkWO/3yia24gutzHv6SXbBT3L2pERKiI2OnwVtgIOKTH+vwBiGYnMEF3hbHLbRKj/CC9ZCdFX6fd5up3YxUTW+sL1mTiYmtic2ccLh5URfotlV83fYXT4t87s3GuP2lYOSBX4r3GD7JBpcyTP0Pfh1oQ6TD6WVURHTKw=
Received: from MN2PR05CA0055.namprd05.prod.outlook.com (2603:10b6:208:236::24)
 by SJ0PR10MB5664.namprd10.prod.outlook.com (2603:10b6:a03:3e2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 20:03:04 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:208:236:cafe::ad) by MN2PR05CA0055.outlook.office365.com
 (2603:10b6:208:236::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 20:03:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 20:03:02 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 15:02:03 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 15:02:03 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 15:02:03 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UK20Nv513314;
	Wed, 30 Sep 2026 15:02:01 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <jassisinghbrar@gmail.com>, <nm@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <b-padhi@ti.com>, <vigneshr@ti.com>
Subject: [PATCH v3 0/2] mailbox: ti-msgmgr: Fixes for polled rx and trailing bytes
Date: Thu, 1 Oct 2026 01:31:56 +0530
Message-ID: <20260930200158.174118-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|SJ0PR10MB5664:EE_
X-MS-Office365-Filtering-Correlation-Id: f42dc9a5-e017-4c5c-fb9d-08df1f2dd56c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|10067099003|56012099006|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	F4xRCOYKyooMk/lx81BWqaWJf0rEOWGNiS/WQEezjGCBOQaCVWRtJLHoURlOonZ4JJnAQj2jqx9pqd7JB88JDBoPZvSFIM58Wd7Fd+dJ8hAtkoajc0Dy5PujBs+ATxCUZgo3ffTaI3sMFWMzLaYb+jCIq64Ysb4zDu6gXy9PsS/gmv8bGkZAF+YwkXCrbTU/hMJ4/1nE7C7YEDd8KQYL2AhOBlxEQf5YnTrfGeIc/zSP7H6zhtqWgT64J+efNT+d5lDBW7283/yXm4bde5wXFowFyr2oW3KpYrDC97ZneJvLSirXCuvqyex5w+DfhtoEcBEBaCXOqkux6q+K6bJ5m9xwBtoPEO/MBE8Z4ybRbM06cFCVNR0Nzrju9TIeOCzhpc2r9UvSCWvbTn4eY1xw4xepwAvoRjwcq7Y/Y0PiPqKJqJkdJ9XYjm9gVWfDnY2enL35mISeXWtcmwoRB1TaZuh7Yif+8OP+EjqJHsVwz/QpcKXZeYpLa4fdARtjOdyZjTq+ZMzvjZMzdzo/t69tbT5W3Dc67L3BIzSl3MenQ9VvM+JHL5Duut29tVu4ueA6YYXJ7GWfgplBNZNR/2070PCpsvjsjnAQpUZVYXiuVAQiW1ttWyr4xqmkiT+QOu36ReRkoYIdnJQwgEUE/sh0CNnR+uhSLRZMHW+MD5CZr5M=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(10067099003)(56012099006)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	s164X3IEBuiSPC6ka9BiZr/WZn7JheFuTOxuFW6MibIa4uR0Vwq/3XF9mJT3ZLPanMwrLBq+dRJd3cstwZFNBr0mrtQTvSIS2wQpfXqMhCNtjA7QuVU+CApTxnyvtJJ+E5VVssSW+ATz4Gvnyb5PSBxAVVSZVA7ApNphZ7l8Am6KqwyqBG0RwBY/oNHLj9uT0pcYufIrqf64DzCSBZ79qAghazVVca1hpWE8AAZqyOb7lt2GndyVFQ/InYcORwMLpv0uVO3MFRIEWb5cib9ReSTIw1N5QZZXGLxeUSKFK8k04mP6UpdzLAF/H0KkjShH+Dy9AduawPtUXIiWQmv7wlSf+YEUd8wIhbOgeA615MkYkZt9kWR4Ws/jFBpdwzVjMUPcb9ndpQFvCok+Uxr3ZeYmjbSGKax8pyRZcwU0R+gMLGzycyjNvoucV1ocxciE
X-Exchange-RoutingPolicyChecked:
	JzLS9jUTEFz1n56EEsOoUiVNz3LH+MAK+X/te40fMXPdqWLn4rv4b2Spxbj8qLOO5EjhfbZuEaQ9ZCnYeQImvoYbrpkDNALs/BhY5U79Wyv7Ca6wtfAKCMezFogvzqhuIiliXfy0hvdc1+VveOVYqozWkfxm8npYXmSDcFaq7UlQ1rHk62gAyEeL+toP5akhkXqi5ejN2P2Ow5RwFeaNfaV9SV440dsKmSOPC1va+e8Us69CSl6+JksC5bjrustbH20ZyZSkiNgobzsjboqMiI1xud0Ag/+h77lxIZ9alYe3KGx+P31fF65qTRNU7DxpeHca89njg0NtJf8vO4Jt5A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 20:03:02.3424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f42dc9a5-e017-4c5c-fb9d-08df1f2dd56c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5664
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA4MSBTYWx0ZWRfX2MsE/1ZYOUqD
 sDWimAtO9n0ry8/of3dDA04hUNhfwTggGUc5zx+8opMuKl8/w2424E41T+6PaSK2XJnpNAB40aP
 Kozk5dAVnVfYdTPfGLPizLfsiC49dgY=
X-Proofpoint-GUID: RA0Z0FQdUxY2-swYA4pYe-SAV_hFLS7B
X-Authority-Analysis: v=2.4 cv=TegDJhQh c=1 sm=1 tr=0 ts=6abd6b02 cx=c_pps
 a=HO36DfDzC3pv6rVb14NK+A==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8 a=OwONl8DW5uTMEadboLoA:9
X-Proofpoint-ORIG-GUID: RA0Z0FQdUxY2-swYA4pYe-SAV_hFLS7B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA4MSBTYWx0ZWRfX1B3DfWxLkuKk
 6aS2lit+yL94Jz9rCsNjX8B/KnR4ISHVvEq7v1OrjMDh12BJS+05Pdvyfb+7sWZMv++HSPwHw7z
 CcC6YAjCtW7jraTQjDtO2MP6UMGAFRxRv4yCD9S3PZEp2uEEhF0IaCDPCollISSoyzw7DoP6YqS
 XRB/M0p3SJbja8MafNszyHLEJzu0Uaf1xM22C0e/CVXpigklbAO7EDtKyg2UIZXjx0TmYLGUT45
 TX8O6WbDdIQsENn4CdhNTVLKisB8CH+i+HmyE943N94bZYGXG4CmFaGhP53q/RjT2OJT14buIFj
 v+kJ9pNaSXCuQ8uoiJdEEaU9v1QBHpRRgF0EStPnxDwxtrCIaZynnXp5jcSiTGEOxhgw+Gz4OQY
 RNCqCgxyb6uF35Ufkf9w+7lFgbSs98z/lZQg2JiLjZwIQAbg3Cp/iWbgUDkO7O+kE5trfdm1A2Q
 Yol3FmYec6ZTDr32/wQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300081

This series fixes two issues in ti_msgmgr_send_data(), found while
refactoring the ti-msgmgr mbox client (TI-SCI).

Patch 1 fixes a duplicate message transmission in polled rx mode.
Patch 2 stops reading past the end of the message buffer when the
message length is not a multiple of 4. This is a preparatory patch for
when the mbox client can send data which is not a multiple of 4.

This series is independent and can be applied directly.

v3: Changelog:
1. Add Fixes: tag in [PATCH v3 2/2].

Link to v2:
https://lore.kernel.org/all/20260930143810.2419010-1-b-padhi@ti.com/

v2: Changelog:
1. Use memcpy() to construct the trailing word to handle host endianness
(Sashiko bot)

Link to v1:
https://lore.kernel.org/all/20260929200159.4033010-1-b-padhi@ti.com/#t

Testing Done:
 - Boot tested on all TI K3 SoCs.
 - Boot tested on keystone K2G EVMs.
 - Tested that these patches do not introduce any new warning or error.

Logs:
https://gist.github.com/3V3RYONE/18d0c3ce912ab208b53b5887435ff09a

Thanks,
Beleswar

Beleswar Padhi (2):
  mailbox: ti-msgmgr: Do not report rx poll timeout as a send failure
  mailbox: ti-msgmgr: Read exact number of trailing message bytes

 drivers/mailbox/ti-msgmgr.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

-- 
2.34.1

