Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BEE3CAA55
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713120; cv=fail; b=tmSn1d6DAx11ZC/LrzhA1ZMrQlvai1F9/5Cgi09gU1h7/fIKHOsAWa2MSSHJ+LkcTncbCa//kixDolPuhcfyxS2A3mktxEHJScT/rJEIS1erVM0DIe1n2pUEo3paU5XVKyDPnsBsHRcIpsZljVKBFYR92DKFbH62VgGNlVayaEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713120; c=relaxed/simple;
	bh=pjd/52FCJCRsOEIliHc2LWgya1wkWia6mHIbYsdrNow=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RZdqGX9qWxPRpkd0SUZruRouwgEGQNGBui7RADQlgmCpBCd0z1gDLCrQ5D07a13uE6QlUhtQokUC8t9LeUEJfwo0M+hS3ACQwMB5I4oMgrylPTCmHoH1UUJeLDKOq2fbRIMvns3jzYW6q+r+mUwWkWRa+9MIC9Poegct5rOVYZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ArtRIltr; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=MTPGnwn2; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ArtRIltr";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="MTPGnwn2"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68TFoRd7807529;
	Tue, 29 Sep 2026 15:18:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=94NaoJgvHOd7zjMN9y+CtP8wQDgZeCxgzs9cMvivJ
	rw=; b=ArtRIltrRF1XUT1Qgs9kPB6IxRN+JlUnuqdo86N5u6ZH9Vw5x9Zp9ErQN
	mabGeEYcYqxfos354MlCf7qoN0ocd1CA3eyucFkjGfkzRNB3S+k/EG8Cfv4K3uKv
	A+3fBrKa6eylycBS8fAL3cvqwYdark6TgqToNVJRVxEwHhFVy4ka3bVBhkGsnfYh
	sy+o4Eb+M8WkysetJkMhwzFmCztATfXyu97QSl6mU7aSG7LLMCkOYih8LbMOnunH
	eaW81EirXbgTSmJctq0dnD3JbRvV4tn/m6w5328k4hgD1tNNRzCblgXzWHDHUcKm
	IiOkW2mkfUrFOzEFbX6mbsqV/upcA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012006.outbound.protection.outlook.com [40.107.209.6])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h02j6ehx7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 15:18:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QfPecRJZdzPlBLA9efXv+dTxSIYfm2PKYwcBbmTFcdls8RYWgoXsXJQj3MFO0ELLetIBnLDUH742cj8oFrZo0pPtIsqVNvOidKkun70lXU10hRPr2+xxXIG8wyN/vmZbFW7IL2loCmyZCnr3oMJ+x5SODMe1QA3o7eambLa+ITmAFOU6/QNwPhJ4hVSX34XcRTLJELW+dc5d0gf+VzakJhaYpLyXCHhdL9JnyKjR3VX+6mbYneMlaQbzwwvNaSg4LEGOKt3XqzCWyEf1hem74BR2eGxwesBPVfigEmENXQviFQkhKup72ymsWuiCDvORkd5Sn5g+tL7pyEP/4JI5fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94NaoJgvHOd7zjMN9y+CtP8wQDgZeCxgzs9cMvivJrw=;
 b=jmf+cbbWKatGo/o7GCdHhuOAvntul4hCJsfYxqJfKDWP19W3vkz58LlwWWYWvq6rX1cf8mm9FlX9ryLajWKE/dOTyJCMOdVUoTOYm6hNsfYogSsOgTkYWooUqal0Eu8N3KoNdKGLS/kbHxosx2LkdMs48/dsD6jyx6oU6k40u3upOV6gxJEKw3wAezGIZdl4hfpV5CgqT1yIYVrjEjLzDneBhi/IfkW0oxNP0MN2XC9FSQJdTj9Ph4pgpAwacxvnsUn7ZIIlLtKB+ydMCxbzJ64CZDHOvdlDkYX4i/DoRKjfWdDAfRF5PoV0y4rSynWpVquqW77k1LvMHasirTEMaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94NaoJgvHOd7zjMN9y+CtP8wQDgZeCxgzs9cMvivJrw=;
 b=MTPGnwn2zT2e/HKXVkXY+ZUnpWD4NZMSNnlN8UVE718lb+4OEODWCVoF+E9YSfAM04S4Za0ZQ3PVk8O6AxHpZx1yxgExbHi6Oa3feMnVg4x3nuGUy4dMoUtSlVZZXlgTNoT29i8B+VdQlmVBs7elkxFsbJYB1TlHRoalk7Rl5LY=
Received: from CH2PR03CA0003.namprd03.prod.outlook.com (2603:10b6:610:59::13)
 by IA1PR10MB6196.namprd10.prod.outlook.com (2603:10b6:208:3a4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Tue, 29 Sep
 2026 20:18:29 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::3d) by CH2PR03CA0003.outlook.office365.com
 (2603:10b6:610:59::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 20:18:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 20:18:28 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:21 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 15:18:21 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TKHlMi1688208;
	Tue, 29 Sep 2026 15:18:18 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH 10/22] firmware: ti_sci: Use tx_message as message buffer directly
Date: Wed, 30 Sep 2026 01:47:34 +0530
Message-ID: <20260929201746.4078803-11-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|IA1PR10MB6196:EE_
X-MS-Office365-Filtering-Correlation-Id: 0572486c-ce33-43a2-c11f-08df1e66d2f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|13003099007|3023799007|5023799004|10067099003|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	IxNsZecpjEM5RVuXAXgDz1bW1458HJE64ZvhJK6jwPwbK/sNuiDrlf40W6AgY728Mz8WhoatM95U8/uvp1J6H8slKFRa/QBkiunmBnSCe1QChW87ahtdOrT+R7cCoDP0M/A9MVImE5psmkolHztT3yovtufqbQmspgq7ye9IJtd8nDnylMBA1Fe+3glw9Kiy/0xal6YJ/XWl++o/C9+ucEJobeNv7+WOmSJ6ijs/3z9/FDTdRPJnN1HVjdPksZFHtb4QYMm3UmR8e9ze3Js1tq/oG42640LfJcEqxuaiqdvSE5MgLbTjAkZ6GpMJr4FkMLro5Uf2zzR6AgCTLUr9b5831Feqk21FmmMTQeQcMaJVcKG9V2+NkPJoLsTLc7i8FrR16QB3uE3fU9K4BLRHDbPQPBY07KW5nOr8wX5hhHr7ztUAkz6GP7bQ8x6t2lyIOF0C92/uCh6bDI59nPcStifS0mJN3BsXTBIQY7/A8jNXOK5h0jPlDV3RZJP/MQMlPCdR2OAqP/zledRJD51lKQefVvxOWiUE86bZs/1sQIk8yxMVyzju9880D4anHvtuBF1HUg5o9juy5Q542q8loxtHH6MdTzSzU+iM/iohGXGv2IVKpSKE4EruGFbep4QRYAaKUwXIhD3KpKwdGnefAGf3LeE4KSJRHSzA2B4deM1CfdffoELrpv3Gnl44HcYpvGe2Z+Ra307/OyP0/QsciA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(13003099007)(3023799007)(5023799004)(10067099003)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	71OtfGlY6mGIub2AD0HqAqM+4u5ItUL3eM3QuvCWNUGmjZikE7KcgHm6a2dwoOWnDRgg/bqJ2zdKdcLIp9Uu42UT33CKaQ+abN5mCLNQXmF54uHgIgv8n47M+cnfKeYTTUdcWkm/5tt9iQbq8aN2EyHrv7Vnun12bZocYjmMzXar4EWlKMjtvkyqE5wq4i1l99o4An9Wfx5drMs7f34qgNsHQ9OGUb4RBkKqt8lPGuWto4ugTix0qz9mg2EDTDTQI/cifOZjhDqZh4GoWHQy4hJKKBAR44XQVuJl61uSkzZq9bJYEdQ81YznJBR84IXPPsDUgIgP2+K9xEgF359+3qn5aR4ooBa56ZA0RDEH4LNFLRXizDTJscHMzZJW/7Jdv/8QuxK1NQ5hAW8c5X3IuN9fXMYM8j/OE9uihtYc+rB+r7VdFypl5ercwas+OnXQ
X-Exchange-RoutingPolicyChecked:
	ij/MXQQmz7DlSHWwIwYXYBP/+547jmNLgfTFoH6voo9kNHQk8z0yRfErLyDGXtwFsWQ3reLzFUQGaReLrXgE+SeIz6Hk+Nhu9i8t5gPnyOwE3343cruC/pYnFgm8sNdJVbXsotpdQ5kiqy3cHyQR7r/b7l7AJgWE/hjEHfk6IYOWudOmlyZBsqOqa/vqQPakAzKRMTRkPD0Xaq2yOvlPD1zuvk/NSOU6EMie4LiSV85uvtJLZAbdb1w1uUfFcKc2AvHgElbl3OQ4wlv5soq5GjZWmPVhC0xViskez1aMW5BmLY/5MefZd3HuBqzAKJzQlBtGEAwrsQxnyZtNtHKzfQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:18:28.3648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0572486c-ce33-43a2-c11f-08df1e66d2f7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6196
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX1RnS7RCc+XQj
 7gktHFiC8QqCFFyU06s5TJrXAGkA5zUM2J9rF8aCS7PsttVTOvU4GIF+1EaBBod+lh/1wdoOJav
 We1E4rotTo3PkX3gefhGdONlKWsEye8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX4Hr32bsHZsE2
 bed2PfxW6y9cOEzaxeVIuiLBwCAD3Ny8BfYIwQKRT1WyGsDUhNT+a14xKWpVnXcf16uhkXGCc5J
 iy41T8dSNRtjuc0B74cRIzriik+LnWsEaCbtCxv4E+CKFSHbqtVdyhvQi8beWDST6jhLLZeRjjd
 ZzCMi71gsq3IzFckKnK8fhyuZSRLY4NFIIvR6nF3+oZYFQFn+J4mkKZ/TcYYyxGh/4psIAmpd8T
 Avni5ZvbI2KrfFR8z4/YZ/k0Gv2AOMwT1LGzJu8/ieu26F7yYagDm/E6BziU6M75vOhBxcUJsfO
 LmwWO7jJGYLH5Sbmi90PyWEOxeiv2vVsf4ralKFy6bjIif9muWZCB4+x9nKownCXaKUwCVYLMVH
 wbn4WqyMNJ1W6Bf3Vw4FWHa0XOI6H/xpzhvSIvu7mrrdzm2Hr6X3fCHG4SuO8M016gYSXTZteMH
 uxL+onxP8m7YeCB4lTA==
X-Authority-Analysis: v=2.4 cv=Z4p5j3RA c=1 sm=1 tr=0 ts=6abc1d1a cx=c_pps
 a=fq9WP/vNXoxpaIAZvvUcmQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=JzeuRgn41EPwZvIwv6EA:9
X-Proofpoint-GUID: goH68NOY_Ev8yX7jBQPTeDUy3jshyZkm
X-Proofpoint-ORIG-GUID: goH68NOY_Ev8yX7jBQPTeDUy3jshyZkm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290080

From: Andrew Davis <afd@ti.com>

As we now have the tx_message during the whole xfer process we can use
that as our message buffer to be sent. This removes an extra copy.

Note: the mailbox framework keeps only a pointer to tx_message and may
submit it after ti_sci_do_xfer() returns if it was queued behind
other messages. But, this cannot happen in practice: messages expecting
a response are always submitted before their callers return, and the
only no-response message (PREPARE_SLEEP for Partial-IO) is sent from the
power-off handler with other CPUs stopped, after which nothing else uses
the TX channel.

Signed-off-by: Andrew Davis <afd@ti.com>
Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
Note:
To avoid KASAN warnings, and possible duplicate message resend, it's
better for the following ti-msgmgr mbox patch series to be applied
before this one goes in:
https://lore.kernel.org/all/20260929200159.4033010-1-b-padhi@ti.com/

 drivers/firmware/ti_sci.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index dbe192142bf17..6ed67160c6a7f 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -43,18 +43,13 @@ static DEFINE_MUTEX(ti_sci_list_mutex);
 /**
  * struct ti_sci_xfer - Structure representing a message flow
  * @tx_message:	Transmit message
- * @tx_buf:	Pointer to the message to send
  * @rx_buf:	Pointer to store received message
  * @rx_len:	Receive message length
  * @xfer_buf:	Preallocated buffer to store receive message
- *		Since we work with request-ACK protocol, we can
- *		reuse the same buffer for the rx path as we
- *		use for the tx path.
  * @done:	completion event
  */
 struct ti_sci_xfer {
 	struct ti_msgmgr_message tx_message;
-	void *tx_buf;
 	void *rx_buf;
 	u8 rx_len;
 	u8 *xfer_buf;
@@ -372,16 +367,16 @@ static struct ti_sci_xfer *ti_sci_get_one_xfer(struct ti_sci_info *info,
 
 	xfer = &minfo->xfer_block[xfer_id];
 
-	hdr = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
 	xfer->tx_message.len = tx_message_size;
 	xfer->tx_message.chan_rx = info->chan_rx;
 	xfer->tx_message.timeout_rx_ms = info->desc->max_rx_timeout_ms;
-	xfer->tx_buf = tx_message;
+	xfer->tx_message.buf = tx_message;
 	xfer->rx_buf = rx_message;
 	xfer->rx_len = (u8)rx_message_size;
 
 	reinit_completion(&xfer->done);
 
+	hdr = (struct ti_sci_msg_hdr *)tx_message;
 	hdr->seq = xfer_id;
 	hdr->type = msg_type;
 	hdr->host = info->host_id;
@@ -487,10 +482,6 @@ static inline int ti_sci_do_xfer(const struct ti_sci_handle *handle,
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	memcpy(xfer->xfer_buf + sizeof(struct ti_sci_msg_hdr),
-	       xfer->tx_buf + sizeof(struct ti_sci_msg_hdr),
-	       xfer->tx_message.len - sizeof(struct ti_sci_msg_hdr));
-
 	ret = mbox_send_message(info->chan_tx, &xfer->tx_message);
 	if (ret < 0) {
 		dev_err(dev, "Mbox send fail %d (caller: %pS)\n", ret, caller);
@@ -3396,7 +3387,6 @@ static int ti_sci_probe(struct platform_device *pdev)
 		if (!xfer->xfer_buf)
 			return -ENOMEM;
 
-		xfer->tx_message.buf = xfer->xfer_buf;
 		init_completion(&xfer->done);
 	}
 
-- 
2.34.1

