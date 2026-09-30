Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB923ED13E;
	Wed, 30 Sep 2026 19:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797368; cv=fail; b=WYjeIdWv97HZTtIRecip1rYSs8L00qQvego0iYePWV3FFhHIpM+bgR+0STuAgpOrmroF/y0xAG9vKqTOH0/oa9rr3pwPfYWy4fN1AnvGa2Y+SVnPU67ECUhG9CIJLE9Sh6ocfitVX10KwHwKow2HWAXU0MgcRlcTSvjilU0oEC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797368; c=relaxed/simple;
	bh=chdPT2Ol4GzdgihdaymOUx3q4QMKh97hbP0AUCV4H9M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NS5KkGg/SJ2XDr6OSi3wkZEBM9jqDsPx7mkwityxNgHkkSEXLyxtdyZIVjnWmnMVJfz06D3akvkjV5ZAPzeIgnIAsVQCQvStsn8TZBXh0YMFm7HRD5k+MF+fM+ldlag3/MkZWI3PlmH8mDrxoy941J5HuU4b2QqRMx+75k+LCZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Re8zIEJt; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=WhrqTMtU; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Re8zIEJt";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="WhrqTMtU"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UI6Bix3525221;
	Wed, 30 Sep 2026 14:42:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=dzaKvJlPoB+8LGShAiNZ51pJc/cQGbPqpjs44REgL
	JU=; b=Re8zIEJt7jULC0u4An/7kyYSdxIA/Hmv6mIGj/ATBzFDUmL6UNwMCDQj5
	NIpqPa01R1oWTf2ZGMycqBa0cn/Ljfolc8KDHfbodvj04ZeXv4E5RtmnwTdHlazI
	YQ/h8Q9GjI2dguGOJFYHYOxXSjwWynHFHk00vwoQi4zL95UDg4mxrsZhn2lJnwMR
	p+N7SDefCNJaaZTo3iRfCSWQa66FZcILdLXI3c4eKduCx5QFy8/DPcCXl5rIH046
	1MlHQi0OrFAQWZxPnSHXruouXKY/ordBoILj4PMfEF2R1tOnvOCTwddIllvk1rsf
	hrGGlbdWByvKSqyxpp0a/B8+jZfAA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011052.outbound.protection.outlook.com [40.107.208.52])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h17djrf3p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 14:42:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSjdqSJKr4ej2cpNKYzwkuLc2oGffom7L7pQlUO2I/QTLTdp4zAF8/tHkU+hghy7tedByaVFJxd4JSUzilJN1A4Gm7gFTWhxqpiGVE3AwCpaGGKOgOFNEu1RjRkH9h3prxHIHII2YuxjjvTpyftr9bHmjMxWWrPfng0/svQriUeS6bSVE9pzvDaAX6RS91v7tKP2AZbwrlOP+AKW0O1ujK2CN/kjQivQzob0BuHNHavx+x0uDbwYeZXmHemwRaHvELqnnhJr6ZFfmaUr6/TB5cmgaZgVttPFpDHOUZmVnUMRrko6iAXpZ12aZBLSNgaeZxcNMilqPULMcseDSbpGMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzaKvJlPoB+8LGShAiNZ51pJc/cQGbPqpjs44REgLJU=;
 b=lMAeqRftWHL1oU008ae+dW7Ldu2mXA9D4mCzuRSVy4L/SeilcooU6Cy9Lf5Vfn/PuJneK41BwkaVtEc7rqcmS6Ulp7GuAY4YT9PwU3H+0he7NXN6VZtAq7GfxgjkgvBI0652b1PceLVKOjGMzHzzN1A1r/aHTb9Bq+N4wOVkXG2MLM2QA9AYAt4zHSovqTARda6kl5Jsr/+zNAzXzzZYHdWmdddhxYVVp7hvc+2OGa2uqzWdGxzJ/NUm8Plz8XX3pz+sz6C/J6vHa146Z7Am+zlyz9+QC66M4NH+Hz/UuGgWpbeFb7mRLHXAGsHcHV8qYvbvDF7MAXJH+prk3wZ9xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzaKvJlPoB+8LGShAiNZ51pJc/cQGbPqpjs44REgLJU=;
 b=WhrqTMtUO8+FRiCi1ky0AXN7nugn381oWZRToU5rKMaDRYnFykD70Mw199Xb90XbyA78f7oM+0MRvfi6z6LzAr+zcRFgC6oeUi0sMlHOXbXks0ESQ7ORBvfsZFa7HdUYeapBuDQ91Kf3l7zCB5Iz+764hG3Tr3gdivKPHVu4kbA=
Received: from PH5P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::7)
 by PH7PR10MB6355.namprd10.prod.outlook.com (2603:10b6:510:1b6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 19:42:36 +0000
Received: from BY1PEPF0002695D.namprd05.prod.outlook.com
 (2603:10b6:510:34b:cafe::11) by PH5P222CA0004.outlook.office365.com
 (2603:10b6:510:34b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 19:42:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BY1PEPF0002695D.mail.protection.outlook.com (10.167.244.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 19:42:34 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 14:41:53 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 14:41:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 14:41:52 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UJfbCg3734543;
	Wed, 30 Sep 2026 14:41:49 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <afd@ti.com>, <u-kumar1@ti.com>, <vigneshr@ti.com>, <b-padhi@ti.com>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 2/6] dt-bindings: arm: keystone: ti,sci: Add ti,tda54-sci-pdm compatible
Date: Thu, 1 Oct 2026 01:11:27 +0530
Message-ID: <20260930194131.117129-3-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930194131.117129-1-b-padhi@ti.com>
References: <20260930194131.117129-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0002695D:EE_|PH7PR10MB6355:EE_
X-MS-Office365-Filtering-Correlation-Id: 09be3480-54df-4237-6ee4-08df1f2af9ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|23010399003|56012099006|10067099003|6133799003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Kdltc2iM2udKd3G15siit0vdJXAuGPvljeIh4BmMDJEE8f3aQfNX4jQxV7EsVmf7WAuiHmbs9mQDIBeXoDNTE/FQ5POwZ9CHeFp+Q/9/duc+9gZxu3RopX5lgKoY7rsN7OSNJpBKA6D+uylz3pkmv4z12rSgjo9Vy0z3UyNwAB+GcIiJtcH3EdUdHCctxrQ6uAa0H3nrgLUGTIVQD1PVBN4NpC/XECkSoNaeHLsgNdU/oFkkt46Nvxq/3VHjVyuHjHafZyX98iTI6xDa6vRLyBF4VTsO7Z87D9y7IGNjQBZBrjaJrBecmlrEdZ3pDj94tfRkcQDFOFbbEtQaxPopMWplC8eCFIZaOG5oC6coxHLHaYDIaehANsHPaNRcrfxRn8fypRoTKA9hHsX5Y7dp7E4of9M9kQyIWGHakDG1gxyVyNf2nYSGN9nzm6vxQg5b1Y4XE49r4Pw68KE3TMMa0GcyE6Vtw5kFLNJXreClH0SCgTvlTZXV6nJtIuJeIk/QtkI/FrptO6GR19vTdU45MKkmPYfaSlX5VbgPpjJVbrowzCO5JDNtRLInZkagwgxWSemQZrpn9A3jCu2Dr3Oez5GcOVQFbAEYuUd7eNqnnuzQhMXxGeFvw47VTgKzRzgJYKV0ZNJWjpORjB3loXdbSZBHuToQCgEucuf4TlfSJqQ=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(23010399003)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wdhWz7O3w8Hy8+U41Y2lmlZ7EE4nmZGAJ680zz71E2ixc/cZlJFTR15YjumOkILzpImSeCdZ83Vi0Sf4djE4IoPRM3lVfXEN9joZIHcPO/YQH8rq8h9TeWT+4OydtKOtVxuxp1MicWtgrxeOqfoV0UnMwq792WAxbvaWRp48HosPw7p9KDe7LDM25rWGJ/EYjFOIRkr5gigZIORj+IF+OOb6tqbwF3El1+TFqlTDJ9xhYflba0ynBWxx6UkaGLXr/GSvrQVbodoNK3AAjVrzu+CnMYXXhN1xIyPVC1e/U7Lv6wEzc4McLlSdztiKtd5PuEXpAAYRugn3GX9S4FHUx/Q1lOdsH4zideOVbn+N3LYS69RS+LQLTSfRTV0azSo9lPxmTA2/R8D9qtYp5MKtLWeuvQxQjdCVBFiGUAu8pPj/D9UFgkoMERnri2/UYB4Z
X-Exchange-RoutingPolicyChecked:
	htSpe2XH7LxuRYP317jggkxYmImXluOJBnB+XIusX2gMvuFqUVbwzToHOQuvkDhr/FbrO8l4MrVmsku6GQIxgkzCYgiEFk2J9O6G1lbht9hCCwk9lTbBfhJPaBLcXY+v7z7MQMXZBRAKNeoxHA+738hxO4AW4dleSyAmrxu2wlPyNSfiTkCDbqknRmMllyzGKij2SldR0axNpmS5axnAilXBfh7ElhXAdI65+GyDhpB2RKtEqa7F8bKSucCEpxR9H2aJNjNdvC92PR21NvzIMytO0dHj+w/teRmSmEhZg1gOw0Xwx7v4k+YjCZPxD+KTb81uQSMyfHr+e5z+Uqp2bQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 19:42:34.6340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09be3480-54df-4237-6ee4-08df1f2af9ab
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0002695D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6355
X-Proofpoint-GUID: axIHDXJj4nD5SIJwzrAuQORGOcXtLMs0
X-Authority-Analysis: v=2.4 cv=aswnmiZV c=1 sm=1 tr=0 ts=6abd6631 cx=c_pps
 a=DEJEzXtY41/hIaqkAZCRpw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=MKc7lW1aU19znqC4lf0A:9
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: axIHDXJj4nD5SIJwzrAuQORGOcXtLMs0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA4MCBTYWx0ZWRfX9ROJKYuPO5WP
 bSC+gb0Beg/yFI0BjMytS3rIPiElFG1EW1oj3Famkjlv/5Xly0sZQgF8JvR0QJwx7s7vsQwpQYk
 dDsCH2lAH5eKFO2xfZCw2+VSkGQlsI4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA4MCBTYWx0ZWRfXydB+sn/xyan7
 ybWDxaJLR4CPPaISsjivSYJFNXYWQh09JnXPbFbXp5v7fUgqjwgmQF4rfoR8+VK5EOKh/OHErpI
 PLwGVLq7mLF8WIV6lZSjE7kFqH40ys0o4dnxBRw1IOS8sia7O/cry+ZWu6rggB0EV1xktYbaGsh
 z1px5Qke2ZV6ll7s4lMpQ3jgHGPz2YazDnWskmWqKUszPMJo7FfB+hOW99PSi3yc4skk+YOVyTD
 yM5OPAHrO10IpHm6FI7+u9Tgy1oMX/NYRfxQnL4La+GrIVQZcM+Zmo8skqgcANV7tS9mA1HCVGe
 Iyt7RW9Qr3clqgBwf87hOIDgC+ZIVD6uH0rJ2dhkEen9VCqAuIhgnU6RIAfsHD+oufezHabSZ1B
 ToY+XU4enuuRwzL2oo+Kisa15hmtF6Z9cL9R+GvNwpgZ6Q0XWTfOd2dBxp3dlvPfOp5x7dnG2hj
 2ZzzEKEn6Qd20dZJ3pA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300080

The previous TI K2G and K3 architectures were tightly coupled systems in
terms of Safety and Security. All the TI-SCI messages from HLOS (Linux)
were sent to a single sec proxy thread terminating at the core running
Safety service (DM). In K2G systems, DM handled both Safety & Security
requests by itself. Whereas in K3 systems, DM serviced the Safety
requests itself, and forwarded the Security requests to core running
Security service (TIFS) on the HLOS's behalf. This posed various
limitations:
   a. Increased latency: An extra forwarding hop through DM adds latency
      in requests and responses.
   b. Freedom From Interference (FFI) concerns: Having Safety service
      proxy Security's requests (& vice versa) undermines the isolation
      and FFI of the system.
   c. Potential Deadlock Scenario: Forwarding messages between Safety
      and Security cores can result in a deadlock if there are circular
      dependencies.

To eliminate all the above limitations, the TI TDA54 class of SoCs
introduce an architectural change: Isolation of Security and Safety
services. To realize this enhanced isolation in hardware, two
independent sec proxy threads are now provided for HLOS to communicate
separately with the Security and Safety cores respectively. And the
TI-SCI message forwarding has been eliminated in Software. The System
Firmware ABI5.0 version necessitates this improved isolation and FFI
change.

Add the compatible string for TI TDA54 SoC PDM system controller to
support ABI5.0 communication protocol.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
Note: This patch is independent and can be applied directly.

Cc: Nishanth Menon <nm@ti.com>
Cc: Tero Kristo <kristo@kernel.org>
Cc: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

 .../bindings/arm/keystone/ti,sci.yaml         | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
index 67acce8a559a1..f0548382f7d52 100644
--- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
+++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
@@ -20,6 +20,11 @@ description: |
   initialized early into boot process and provides services to Operating Systems
   on multiple processors including ones running Linux.
 
+  The TI TDA54 SoC, however, has two independent system controller instances - a
+  PDM (Power and Device Management) system controller, which handles Power,
+  Device, Clock, and Reset Management, and a separate SMS (Security Management
+  Subsystem) system controller, which handles security services.
+
   See https://software-dl.ti.com/tisci/esd/latest/index.html for protocol definition.
 
   The TI-SCI node describes the Texas Instrument's System Controller entity node.
@@ -40,6 +45,10 @@ properties:
       - description: System controller on TI AM654 SoC
         items:
           - const: ti,am654-sci
+      - description: |
+          System controller for Power and Device Management on TI TDA54 SoC
+        items:
+          - const: ti,tda54-sci-pdm
 
   reg-names:
     description: |
@@ -135,3 +144,27 @@ examples:
         #reset-cells = <2>;
       };
     };
+
+  - |
+    pdm: system-controller {
+      compatible = "ti,tda54-sci-pdm";
+      mbox-names = "rx", "tx";
+      mboxes = <&main_secure_proxy1 4>,
+               <&main_secure_proxy1 435>;
+      ti,host-id = <66>;
+
+      k3_pdm_pds: power-controller {
+        compatible = "ti,sci-pm-domain";
+        #power-domain-cells = <2>;
+      };
+
+      k3_pdm_clks: clock-controller {
+        compatible = "ti,k2g-sci-clk";
+        #clock-cells = <2>;
+      };
+
+      k3_pdm_reset: reset-controller {
+        compatible = "ti,sci-reset";
+        #reset-cells = <2>;
+      };
+    };
-- 
2.34.1

