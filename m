Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0563453A48
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797381; cv=fail; b=dPFJQJgH9kGt1tcu9kpeock8LTSBv1c2kRXkjvJzAgSUZoCQWCrFJ3lbJX/Y0wJIwe/jhG+qYu8lbXdB34r7i+SELw2Dr81UHRP8qnhxP8+tldcgW6B7D46lWVm4K2itZmJyYcnytaNMxdxsCkSVNeEPEXpvwPKPPO75OGlCLhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797381; c=relaxed/simple;
	bh=VFbLTXEbjH+w1971Gx/6Zt8rdoTNnKc173pTfcIHIec=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G3nBsf48+FPTe3OyEQO0bkbLQ7+AopwJmXwpqmUuYpRpoGyy/SlW8ra7P7kPmMAl3XPozU5VMQ7iFU0DR29NUCHkz+5mslRsVzedzwWiJWe5YAP59Ky5En7pEsmezlKTOKJF9SZhvo04dvFFuZ1N5boM3NWpq3bcYLLXKJ2WywI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=pN9DtuWg; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=qE1fyN6J; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="pN9DtuWg";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="qE1fyN6J"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UHfGLg3755927;
	Wed, 30 Sep 2026 14:42:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=r8gNF56z5pwIKCxaUJxhdvZgZLj8GzdqbGOSZ0lu/
	vk=; b=pN9DtuWgVgOqqTaAcQn9ssPRe9t/r19cFjmcnCEXf4uVA5MwBZgxE+e0m
	LoSUbTYC4U4qsNWVVMt9j6GI4J9syr65zHNvGvnPTzvxnfBGJmnyLsPQ+oV8DBau
	6rqiuwD63Sn3bwnPF9FUtEAASXpeNKQY1Jd0JOFZgUigbSpOSByl55SMjcpW/MOI
	ywkWsAUg+crUFK2iObH5PSKjfDu/ooX9ARrk0f+OLhixwvCVeLuI/AWU7LBvC/+e
	gEXhYKLGt7WS41PZKQpWt62CXxzsM4tvXC0zQIJJEHTuZF/mgD0ni7DfEPrevyYP
	FLgOViluG1NKuc4+3I+DuQSdV0ZIg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012012.outbound.protection.outlook.com [40.93.195.12])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h10t1u255-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 14:42:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RKdsqka3zlyJldEnz/QZcB5D/xSUafXSVDDhYlozcGq8FLHks4rkY2dwu5YlkofX1USpNZUjLYzZp/PD2e985mEROU3Fydq6LUKK6aVDoRe5igh+X99yfbf/H51bJllC8SFup3CR5ktMDA2dRsqwBWXV8GUqbz5MYuN0s0bpwrLv5mUGMU39rEl9lbxaxZ8PTOka498xR8L0fInB4U+p5tF8DP1iYtZOTJ4vara0Xs+b1KM2WVTVoxqf+uQ/gi36MA45mWCA7u8FaKlEoJlVEzFWLXzDI6CuroZdsUyyXXaYyKrqtAPFjan6vKlNfhvKXwxd22GG87HJamzpwUaWWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8gNF56z5pwIKCxaUJxhdvZgZLj8GzdqbGOSZ0lu/vk=;
 b=xRk0vqJPAz2fr7VyzPh4LYKO1Kbu4E27qID7uxLhDCDfy0kRMhGoPtb65Azp4WqSyyCACNszYDUZsL07ipevWAJjdcviQCRun+ZiUfOOjz72zW9eHHLkMVc9f+FSw+z1sVVM6P15vTgDiENCsOMcIqOa3O0qN2FSR+vUKRMZrG2Q6Rr86jZQwT7hNBjLi0EsKjTps3b+zU1I+9C4FYhBS/e0EOeny9+jA9pqAAoC9bsvBjHkxh6l/H64obkGjH61o+CzRsECgC91wYje0OmGfGtmf5SLmykcivquE/dbFAOq93oZeQTw43joiwVjFzy66uXA+JqGcGqlur+nZNTJJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8gNF56z5pwIKCxaUJxhdvZgZLj8GzdqbGOSZ0lu/vk=;
 b=qE1fyN6J57qvbm364H69TaM80+4vKDHh7lJglyr1OAMtkLAGqwhTSr1nicD/VCV+bnZoixK9bz+F0eTyyuzvmhMXyV+XlXKwWK82dzuFeU8gaueR0OJtxMpnuiOVbtzjniW5D6Mtz8GfckyjmJIFUzDP1iHUSRXxT9MXuEcCPlc=
Received: from CH0PR03CA0025.namprd03.prod.outlook.com (2603:10b6:610:b0::30)
 by DS7PR10MB4845.namprd10.prod.outlook.com (2603:10b6:5:38e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Wed, 30 Sep
 2026 19:42:47 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::a8) by CH0PR03CA0025.outlook.office365.com
 (2603:10b6:610:b0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Wed,
 30 Sep 2026 19:42:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 19:42:45 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 14:42:05 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 14:42:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 14:42:05 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UJfbCj3734543;
	Wed, 30 Sep 2026 14:42:03 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <afd@ti.com>, <u-kumar1@ti.com>, <vigneshr@ti.com>, <b-padhi@ti.com>
Subject: [PATCH 5/6] firmware: ti: ti_sci_clock: Add ABI5.0 compliant Clock APIs
Date: Thu, 1 Oct 2026 01:11:30 +0530
Message-ID: <20260930194131.117129-6-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|DS7PR10MB4845:EE_
X-MS-Office365-Filtering-Correlation-Id: fce36676-118e-4d81-e2fb-08df1f2b0048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|22082099003|13003099007|18002099003|3023799007|6133799003|10067099003|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	Ror9tZjW+sJtvx8oTKM4vRg9MYoEzRymLzv9+EX9UkFPHyZyyHAId9mLOV3JOkr2kA6fNWC7KYxmz1/gfcxxNml9q8oJZvEU2rGLaRb9fA1wzFttrJRDZCV2mBmbZe3uHAwKf2LL4Q3X+1wEeXQ9xHJFc+CShMSX3G03jilmyhi6FqFzsI+1RKgFTZqun4cDIqNWEJZddfqNzyCt8whL/zBxBOKBfcZx+9TvYheoKjD3uwQR2goeC45f8VIh7R4net0URyixLV7w58hwZ7/gq/yUONUolGA7dQ4rH174mRfCjJdVzTh0SvPUKr7GL0/mAB8id77R/io9PC0ISITz0fscUBsabWWqXALK5aBSlfKeiCan3hSS5MntotmNQlchifJToL0vICwGeklvma1kkOcheDgsjfwKIjIyjUhnM1RKM3tsvM0NlmNKUqSqBGo8K2wN6IOtTYVpxQzpXOuD/lyKmWLHPZGzMzZSvx06WSjdraFcGr1pKfWdi1JJDnGQUGpmGB0GsmFBsgY31wGqeUtlo8HEoGaY1FEP2vCq5JUiwydybu85WMW9D+rmusptGXMZonZ+426zcXuWyQUT/5cgi2vsFJRU71fXpnCzOSZrN9hYvASlio0uzsdc9HWrVIx+Px6KU11REzS7igdoKNNP+ZygDtb7TkRI5s7J4Jq4wVP58WapQBsBnCIs0KFPqO3JDaauCDL2i5jZ2MR77g==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(22082099003)(13003099007)(18002099003)(3023799007)(6133799003)(10067099003)(56012099006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	woNrFlFzb1LBX97OSV7JSCfYzfv/0p2hm2KQfY7Eig+K24DWySLvqKZHJeFqNUMJJqmSNOvKLDwp/nEJlaAcMTUamhTFC0EVRzLeuV7MWxeXm+vjO5sT2YQaxU81urUJ97kFrCL/vXKzevvEoytqcDD76g6boOLc6WSunxIeb8PZDsZQOx+WI6Dq+TFRDAFsz4rG1VIrtwEBKas1xVcXcBirDF2LcV9Gmpy982NPwbJyzZS4IlPreePNFKIMVBIs7pZEjAPyznRldg36lijFz0o7nD8qczSoTq/adz065ruwtbdDEhQ2DOd91JpB4a/m+cSQ0XUNobiGhbvAOWrFt7UdueNWpSoTesFnuoPSiD9+wPI0gJXd4HZ93v3Uc8dmFGSFDXIR6GAsSvRgZPPKzj47z4bJwgiAM9aI4lpArXuT0JMbUaaIjQZG37PLPs7J
X-Exchange-RoutingPolicyChecked:
	tAUE2YkoNW3Oo2L3p5E3DvJ7rGWqwispEEmF2hN4wHmNDSBdRhMHCgDKsSbk9LgHOFLNRFzlIhd3FNJXY2VcthSUhDQxa7tRe21Y/Fswt90C6YZfKf9wIWSOuZ3PaKVUszmzW/ml5nZcKRkFLCxXM31YOWYF7INxCRVhulxV3WFMqqRcdkbqGcSKlwnue/gU+5gtputc0LlsL6Nfc9hRsHbvkADKC8HP3SDJJ/dJQguh7sTIMQCR6R9gou4MyUHaMAHCB5SHtLnuBiErdWhw6VOBacLylavscCOQ+YXbxEjDZ/vxj/2DB0g5aVnrRENC1HGmXK78NMR24kGIyBbwjQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 19:42:45.7753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fce36676-118e-4d81-e2fb-08df1f2b0048
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4845
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA4MCBTYWx0ZWRfX/5AKA//8Rzs3
 X+vyGqsGhvSnetVZWgs0sPI6hO6fqoYrZEh+p8ygoY9vWtCQg5EEzrPNkmJ5hsmqbpLKWm5PQF8
 C8DC9WM92HYUnohovNVRaFJtx6BZiXo=
X-Proofpoint-ORIG-GUID: 7QMjFKW8Fne1V4evdhGKymEkfqnTxACN
X-Authority-Analysis: v=2.4 cv=C7R8WgP+ c=1 sm=1 tr=0 ts=6abd663d cx=c_pps
 a=AUi/O1gD07nBRLizZNiypw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=8B-c-QUMbtkX9bzFsmUA:9
X-Proofpoint-GUID: 7QMjFKW8Fne1V4evdhGKymEkfqnTxACN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA4MCBTYWx0ZWRfX+SabWnG884vH
 8JIqfw1kElT/x1GLe1ofhN1XfA2TtpIXImkzVmJ2FdAgzn1bURKJgk/t5QzISKqzHfu8zV+4pWi
 dQMryYA9PNNt5Jqf/gX1ChXv3UM/Y0k/7RRPjLRcyVntQNBH84rD8/2PPe5EOyD5OCwbS/1eGhC
 Wk+V/WDAN/rjKPCQXeiaAbpUGExUy1NnTgtzLzaZfxT7JMeNDJ8ef0JtGxQUYoK105PIg38KAnP
 w9jbYWD8go4fO/742OPV94lbPeaue0rFdtIKdihWuBjcASSLGnTk5AKjyYhX8Lz5uFPoW36lDml
 2kyF8HDjetQCMxFrPrnCw+4COErY7A2jOJqDqrflp/bp6DZidLOKBCg7uKWqhzKp9tYO07JAM+A
 ta+yO3n5kSGT0xBoBwfU01Djui3/6A12V43ToMGWe7ssP47quHEPsIC5oa1H9gPAiVebhq+gTw0
 XXxsHEaN6AsWAqaxh8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
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

In ABI5.0, the message structures for set_clock_state, get_clock_state,
query_clock_freq, set_clock_freq, and get_clock_freq APIs have been
updated to combine the existing u8 clk_id and u32 clk_id_32 into a
single u32 clk_id. This is a good cleanup that came as a by-product of
the major ABI update. So, add new ABI5.0 compliant APIs to account for
this change.

Note: The following TI-SCI messages are not supported with ABI5.0, since
parent clock configuration is done internally by PDM firmware:
TI_SCI_MSG_SET_CLOCK_PARENT, TI_SCI_MSG_GET_CLOCK_PARENT, and
TI_SCI_MSG_GET_NUM_CLOCK_PARENTS. Hence, the corresponding clock parent
ops are left unset. Also, SSC support is not enabled in hardware on the
TDA54 SoC, so the needs_ssc argument of get_clock is ignored.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
Note:
This patch is dependent on the following 2 series
1. https://lore.kernel.org/all/20260930172948.2901336-1-b-padhi@ti.com/
2. https://lore.kernel.org/all/20260930160607.2674980-1-b-padhi@ti.com/

 drivers/firmware/ti/ti_sci.h       | 138 +++++++++++
 drivers/firmware/ti/ti_sci_clock.c | 380 +++++++++++++++++++++++++++++
 drivers/firmware/ti/ti_sci_core.c  |   2 +
 3 files changed, 520 insertions(+)

diff --git a/drivers/firmware/ti/ti_sci.h b/drivers/firmware/ti/ti_sci.h
index 2f633aeab70b1..5e0a35b394d19 100644
--- a/drivers/firmware/ti/ti_sci.h
+++ b/drivers/firmware/ti/ti_sci.h
@@ -483,6 +483,34 @@ struct ti_sci_msg_req_set_clock_state {
 	u32 clk_id_32;
 } __packed;
 
+/**
+ * struct ti_sci_msg_req_set_clock_state_abi5_pdm - Request to setup a Clock state
+ * @hdr:	Generic Header, Certain flags can be set specific to the clocks.
+ *		Uses the MSG_FLAG_CLOCK_* flags defined for
+ *		&struct ti_sci_msg_req_set_clock_state.
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @request_state: Request the state for the clock to be set to.
+ *		Uses the MSG_CLOCK_SW_STATE_* values defined for
+ *		&struct ti_sci_msg_req_set_clock_state.
+ *
+ * Normally, all required clocks are managed by TISCI entity, this is used
+ * only for specific control *IF* required. Auto managed state is
+ * MSG_CLOCK_SW_STATE_AUTO, in other states, TISCI entity assume remote
+ * will explicitly control.
+ *
+ * Request type is TI_SCI_MSG_SET_CLOCK_STATE, response is a generic
+ * ACK or NACK message.
+ */
+struct ti_sci_msg_req_set_clock_state_abi5_pdm {
+	struct ti_sci_msg_hdr hdr;
+	u32 dev_id;
+	u32 clk_id;
+	u8 request_state;
+} __packed;
+
 /**
  * struct ti_sci_msg_req_get_clock_state - Request for clock state
  * @hdr:	Generic Header
@@ -505,6 +533,23 @@ struct ti_sci_msg_req_get_clock_state {
 	u32 clk_id_32;
 } __packed;
 
+/**
+ * struct ti_sci_msg_req_get_clock_state_abi5_pdm - Request for clock state
+ * @hdr:	Generic Header
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to get state of.
+ *
+ * Request type is TI_SCI_MSG_GET_CLOCK_STATE, response is state
+ * of the clock
+ */
+struct ti_sci_msg_req_get_clock_state_abi5_pdm {
+	struct ti_sci_msg_hdr hdr;
+	u32 dev_id;
+	u32 clk_id;
+} __packed;
+
 /**
  * struct ti_sci_msg_resp_get_clock_state - Response to get clock state
  * @hdr:	Generic Header
@@ -659,6 +704,37 @@ struct ti_sci_msg_req_query_clock_freq {
 	u32 clk_id_32;
 } __packed;
 
+/**
+ * struct ti_sci_msg_req_query_clock_freq_abi5_pdm - Request to query a frequency
+ * @hdr:	Generic Header
+ * @dev_id:	Device identifier this request is for
+ * @min_freq_hz: The minimum allowable frequency in Hz. This is the minimum
+ *		allowable programmed frequency and does not account for clock
+ *		tolerances and jitter.
+ * @target_freq_hz: The target clock frequency. A frequency will be found
+ *		as close to this target frequency as possible.
+ * @max_freq_hz: The maximum allowable frequency in Hz. This is the maximum
+ *		allowable programmed frequency and does not account for clock
+ *		tolerances and jitter.
+ * @clk_id:	Clock identifier for the device for this request.
+ *
+ * NOTE: Normally clock frequency management is automatically done by TISCI
+ * entity. In case of specific requests, TISCI evaluates capability to achieve
+ * requested frequency within provided range and responds with
+ * result message.
+ *
+ * Request type is TI_SCI_MSG_QUERY_CLOCK_FREQ, response is appropriate message,
+ * or NACK in case of inability to satisfy request.
+ */
+struct ti_sci_msg_req_query_clock_freq_abi5_pdm {
+	struct ti_sci_msg_hdr hdr;
+	u32 dev_id;
+	u64 min_freq_hz;
+	u64 target_freq_hz;
+	u64 max_freq_hz;
+	u32 clk_id;
+} __packed;
+
 /**
  * struct ti_sci_msg_resp_query_clock_freq - Response to a clock frequency query
  * @hdr:	Generic Header
@@ -718,6 +794,49 @@ struct ti_sci_msg_req_set_clock_freq {
 	u32 clk_id_32;
 } __packed;
 
+/**
+ * struct ti_sci_msg_req_set_clock_freq_abi5_pdm - Request to setup a clock frequency
+ * @hdr:	Generic Header
+ * @dev_id:	Device identifier this request is for
+ * @min_freq_hz: The minimum allowable frequency in Hz. This is the minimum
+ *		allowable programmed frequency and does not account for clock
+ *		tolerances and jitter.
+ * @target_freq_hz: The target clock frequency. The clock will be programmed
+ *		at a rate as close to this target frequency as possible.
+ * @max_freq_hz: The maximum allowable frequency in Hz. This is the maximum
+ *		allowable programmed frequency and does not account for clock
+ *		tolerances and jitter.
+ * @clk_id:	Clock identifier for the device for this request.
+ *
+ * NOTE: Normally clock frequency management is automatically done by TISCI
+ * entity. In case of specific requests, TISCI evaluates capability to achieve
+ * requested range and responds with success/failure message.
+ *
+ * This sets the desired frequency for a clock within an allowable
+ * range. This message will fail on an enabled clock unless
+ * MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE is set for the clock. Additionally,
+ * if other clocks have their frequency modified due to this message,
+ * they also must have the MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE or be disabled.
+ *
+ * Calling set frequency on a clock input to the SoC pseudo-device will
+ * inform the PMMC of that clock's frequency. Setting a frequency of
+ * zero will indicate the clock is disabled.
+ *
+ * Calling set frequency on clock outputs from the SoC pseudo-device will
+ * function similarly to setting the clock frequency on a device.
+ *
+ * Request type is TI_SCI_MSG_SET_CLOCK_FREQ, response is a generic ACK/NACK
+ * message.
+ */
+struct ti_sci_msg_req_set_clock_freq_abi5_pdm {
+	struct ti_sci_msg_hdr hdr;
+	u32 dev_id;
+	u64 min_freq_hz;
+	u64 target_freq_hz;
+	u64 max_freq_hz;
+	u32 clk_id;
+} __packed;
+
 /**
  * struct ti_sci_msg_req_get_clock_freq - Request to get the clock frequency
  * @hdr:	Generic Header
@@ -739,6 +858,24 @@ struct ti_sci_msg_req_get_clock_freq {
 	u32 clk_id_32;
 } __packed;
 
+/**
+ * struct ti_sci_msg_req_get_clock_freq_abi5_pdm - Request to get the clock frequency
+ * @hdr:	Generic Header
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *
+ * NOTE: Normally clock frequency management is automatically done by TISCI
+ * entity. In some cases, clock frequencies are configured by host.
+ *
+ * Request type is TI_SCI_MSG_GET_CLOCK_FREQ, responded with clock frequency
+ * that the clock is currently at.
+ */
+struct ti_sci_msg_req_get_clock_freq_abi5_pdm {
+	struct ti_sci_msg_hdr hdr;
+	u32 dev_id;
+	u32 clk_id;
+} __packed;
+
 /**
  * struct ti_sci_msg_resp_get_clock_freq - Response of clock frequency request
  * @hdr:	Generic Header
@@ -1738,6 +1875,7 @@ int ti_sci_do_xfer(const struct ti_sci_handle *handle,
 void ti_sci_setup_device_ops(struct ti_sci_dev_ops *dops);
 void ti_sci_setup_device_ops_abi5(struct ti_sci_dev_ops *dops);
 void ti_sci_setup_clock_ops(struct ti_sci_clk_ops *cops);
+void ti_sci_setup_clock_ops_abi5(struct ti_sci_clk_ops *cops);
 void ti_sci_setup_pm_ops(struct ti_sci_pm_ops *pmops);
 void ti_sci_setup_rm_core_ops(struct ti_sci_rm_core_ops *rm_core_ops);
 void ti_sci_setup_rm_irq_ops(struct ti_sci_rm_irq_ops *iops);
diff --git a/drivers/firmware/ti/ti_sci_clock.c b/drivers/firmware/ti/ti_sci_clock.c
index f266522fb7d08..faf37cc6df8d2 100644
--- a/drivers/firmware/ti/ti_sci_clock.c
+++ b/drivers/firmware/ti/ti_sci_clock.c
@@ -50,6 +50,40 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 	return 0;
 }
 
+/**
+ * ti_sci_set_clock_state_abi5_pdm() - Set clock state helper
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @flags:	Header flags as needed
+ * @state:	State to request for the clock.
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_set_clock_state_abi5_pdm(const struct ti_sci_handle *handle,
+					   u32 dev_id, u32 clk_id,
+					   u32 flags, u8 state)
+{
+	struct ti_sci_msg_req_set_clock_state_abi5_pdm req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.dev_id = dev_id;
+	req.clk_id = clk_id;
+	req.request_state = state;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_STATE,
+			     flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 /**
  * ti_sci_cmd_get_clock_state() - Get clock state helper
  * @handle:	pointer to TI SCI handle
@@ -96,6 +130,47 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 	return 0;
 }
 
+/**
+ * ti_sci_cmd_get_clock_state_abi5_pdm() - Get clock state helper
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @programmed_state:	State requested for clock to move to
+ * @current_state:	State that the clock is currently in
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_get_clock_state_abi5_pdm(const struct ti_sci_handle *handle,
+					       u32 dev_id, u32 clk_id,
+					       u8 *programmed_state, u8 *current_state)
+{
+	struct ti_sci_msg_req_get_clock_state_abi5_pdm req;
+	struct ti_sci_msg_resp_get_clock_state resp;
+	int ret = 0;
+
+	if (!programmed_state && !current_state)
+		return -EINVAL;
+
+	req.dev_id = dev_id;
+	req.clk_id = clk_id;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_STATE,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	if (programmed_state)
+		*programmed_state = resp.programmed_state;
+	if (current_state)
+		*current_state = resp.current_state;
+
+	return 0;
+}
+
 /**
  * ti_sci_cmd_get_clock() - Get control of a clock from TI SCI
  * @handle:	pointer to TI SCI handle
@@ -123,6 +198,32 @@ static int ti_sci_cmd_get_clock(const struct ti_sci_handle *handle, u32 dev_id,
 				      MSG_CLOCK_SW_STATE_REQ);
 }
 
+/**
+ * ti_sci_cmd_get_clock_abi5_pdm() - Get control of a clock from TI SCI
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @needs_ssc:	unused, SSC is not supported with ABI5
+ * @can_change_freq: 'true' if frequency change is desired, else 'false'
+ * @enable_input_term: 'true' if input termination is desired, else 'false'
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_get_clock_abi5_pdm(const struct ti_sci_handle *handle, u32 dev_id,
+					 u32 clk_id, bool needs_ssc,
+					 bool can_change_freq, bool enable_input_term)
+{
+	u32 flags = 0;
+
+	flags |= can_change_freq ? MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE : 0;
+	flags |= enable_input_term ? MSG_FLAG_CLOCK_INPUT_TERM : 0;
+
+	return ti_sci_set_clock_state_abi5_pdm(handle, dev_id, clk_id, flags,
+					       MSG_CLOCK_SW_STATE_REQ);
+}
+
 /**
  * ti_sci_cmd_idle_clock() - Idle a clock which is in our control
  * @handle:	pointer to TI SCI handle
@@ -143,6 +244,26 @@ static int ti_sci_cmd_idle_clock(const struct ti_sci_handle *handle,
 				      MSG_CLOCK_SW_STATE_UNREQ);
 }
 
+/**
+ * ti_sci_cmd_idle_clock_abi5_pdm() - Idle a clock which is in our control
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ *
+ * NOTE: This clock must have been requested by get_clock previously.
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_idle_clock_abi5_pdm(const struct ti_sci_handle *handle,
+					  u32 dev_id, u32 clk_id)
+{
+	return ti_sci_set_clock_state_abi5_pdm(handle, dev_id, clk_id,
+					       MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE,
+					       MSG_CLOCK_SW_STATE_UNREQ);
+}
+
 /**
  * ti_sci_cmd_put_clock() - Release a clock from our control back to TISCI
  * @handle:	pointer to TI SCI handle
@@ -163,6 +284,26 @@ static int ti_sci_cmd_put_clock(const struct ti_sci_handle *handle,
 				      MSG_CLOCK_SW_STATE_AUTO);
 }
 
+/**
+ * ti_sci_cmd_put_clock_abi5_pdm() - Release a clock from our control back to TISCI
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ *
+ * NOTE: This clock must have been requested by get_clock previously.
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_put_clock_abi5_pdm(const struct ti_sci_handle *handle,
+					 u32 dev_id, u32 clk_id)
+{
+	return ti_sci_set_clock_state_abi5_pdm(handle, dev_id, clk_id,
+					       MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE,
+					       MSG_CLOCK_SW_STATE_AUTO);
+}
+
 /**
  * ti_sci_cmd_clk_is_auto() - Is the clock being auto managed
  * @handle:	pointer to TI SCI handle
@@ -191,6 +332,34 @@ static int ti_sci_cmd_clk_is_auto(const struct ti_sci_handle *handle,
 	return 0;
 }
 
+/**
+ * ti_sci_cmd_clk_is_auto_abi5_pdm() - Is the clock being auto managed
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @req_state: state indicating if the clock is auto managed
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_is_auto_abi5_pdm(const struct ti_sci_handle *handle,
+					   u32 dev_id, u32 clk_id, bool *req_state)
+{
+	u8 state = 0;
+	int ret;
+
+	if (!req_state)
+		return -EINVAL;
+
+	ret = ti_sci_cmd_get_clock_state_abi5_pdm(handle, dev_id, clk_id, &state, NULL);
+	if (ret)
+		return ret;
+
+	*req_state = (state == MSG_CLOCK_SW_STATE_AUTO);
+	return 0;
+}
+
 /**
  * ti_sci_cmd_clk_is_on() - Is the clock ON
  * @handle:	pointer to TI SCI handle
@@ -224,6 +393,39 @@ static int ti_sci_cmd_clk_is_on(const struct ti_sci_handle *handle, u32 dev_id,
 	return 0;
 }
 
+/**
+ * ti_sci_cmd_clk_is_on_abi5_pdm() - Is the clock ON
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @req_state: state indicating if the clock is managed by us and enabled
+ * @curr_state: state indicating if the clock is ready for operation
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_is_on_abi5_pdm(const struct ti_sci_handle *handle, u32 dev_id,
+					 u32 clk_id, bool *req_state, bool *curr_state)
+{
+	u8 c_state = 0, r_state = 0;
+	int ret;
+
+	if (!req_state && !curr_state)
+		return -EINVAL;
+
+	ret = ti_sci_cmd_get_clock_state_abi5_pdm(handle, dev_id, clk_id,
+						  &r_state, &c_state);
+	if (ret)
+		return ret;
+
+	if (req_state)
+		*req_state = (r_state == MSG_CLOCK_SW_STATE_REQ);
+	if (curr_state)
+		*curr_state = (c_state == MSG_CLOCK_HW_STATE_READY);
+	return 0;
+}
+
 /**
  * ti_sci_cmd_clk_is_off() - Is the clock OFF
  * @handle:	pointer to TI SCI handle
@@ -257,6 +459,39 @@ static int ti_sci_cmd_clk_is_off(const struct ti_sci_handle *handle, u32 dev_id,
 	return 0;
 }
 
+/**
+ * ti_sci_cmd_clk_is_off_abi5_pdm() - Is the clock OFF
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @req_state: state indicating if the clock is managed by us and disabled
+ * @curr_state: state indicating if the clock is NOT ready for operation
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_is_off_abi5_pdm(const struct ti_sci_handle *handle, u32 dev_id,
+					  u32 clk_id, bool *req_state, bool *curr_state)
+{
+	u8 c_state = 0, r_state = 0;
+	int ret;
+
+	if (!req_state && !curr_state)
+		return -EINVAL;
+
+	ret = ti_sci_cmd_get_clock_state_abi5_pdm(handle, dev_id, clk_id,
+						  &r_state, &c_state);
+	if (ret)
+		return ret;
+
+	if (req_state)
+		*req_state = (r_state == MSG_CLOCK_SW_STATE_UNREQ);
+	if (curr_state)
+		*curr_state = (c_state == MSG_CLOCK_HW_STATE_NOT_READY);
+	return 0;
+}
+
 /**
  * ti_sci_cmd_clk_set_parent() - Set the clock source of a specific device clock
  * @handle:	pointer to TI SCI handle
@@ -442,6 +677,55 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 	return 0;
 }
 
+/**
+ * ti_sci_cmd_clk_get_match_freq_abi5_pdm() - Find a good match for frequency
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @min_freq:	The minimum allowable frequency in Hz. This is the minimum
+ *		allowable programmed frequency and does not account for clock
+ *		tolerances and jitter.
+ * @target_freq: The target clock frequency in Hz. A frequency will be
+ *		processed as close to this target frequency as possible.
+ * @max_freq:	The maximum allowable frequency in Hz. This is the maximum
+ *		allowable programmed frequency and does not account for clock
+ *		tolerances and jitter.
+ * @match_freq:	Frequency match in Hz response.
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_get_match_freq_abi5_pdm(const struct ti_sci_handle *handle,
+						  u32 dev_id, u32 clk_id, u64 min_freq,
+						  u64 target_freq, u64 max_freq,
+						  u64 *match_freq)
+{
+	struct ti_sci_msg_req_query_clock_freq_abi5_pdm req;
+	struct ti_sci_msg_resp_query_clock_freq resp;
+	int ret = 0;
+
+	if (!match_freq)
+		return -EINVAL;
+
+	req.dev_id = dev_id;
+	req.clk_id = clk_id;
+	req.min_freq_hz = min_freq;
+	req.target_freq_hz = target_freq;
+	req.max_freq_hz = max_freq;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_QUERY_CLOCK_FREQ,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	*match_freq = resp.freq_hz;
+
+	return 0;
+}
+
 /**
  * ti_sci_cmd_clk_set_freq() - Set a frequency for clock
  * @handle:	pointer to TI SCI handle
@@ -489,6 +773,48 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 	return 0;
 }
 
+/**
+ * ti_sci_cmd_clk_set_freq_abi5_pdm() - Set a frequency for clock
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @min_freq:	The minimum allowable frequency in Hz. This is the minimum
+ *		allowable programmed frequency and does not account for clock
+ *		tolerances and jitter.
+ * @target_freq: The target clock frequency in Hz. A frequency will be
+ *		processed as close to this target frequency as possible.
+ * @max_freq:	The maximum allowable frequency in Hz. This is the maximum
+ *		allowable programmed frequency and does not account for clock
+ *		tolerances and jitter.
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_set_freq_abi5_pdm(const struct ti_sci_handle *handle,
+					    u32 dev_id, u32 clk_id, u64 min_freq,
+					    u64 target_freq, u64 max_freq)
+{
+	struct ti_sci_msg_req_set_clock_freq_abi5_pdm req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.dev_id = dev_id;
+	req.clk_id = clk_id;
+	req.min_freq_hz = min_freq;
+	req.target_freq_hz = target_freq;
+	req.max_freq_hz = max_freq;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_FREQ,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 /**
  * ti_sci_cmd_clk_get_freq() - Get current frequency
  * @handle:	pointer to TI SCI handle
@@ -530,6 +856,42 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 	return 0;
 }
 
+/**
+ * ti_sci_cmd_clk_get_freq_abi5_pdm() - Get current frequency
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @freq:	Currently frequency in Hz
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_get_freq_abi5_pdm(const struct ti_sci_handle *handle,
+					    u32 dev_id, u32 clk_id, u64 *freq)
+{
+	struct ti_sci_msg_req_get_clock_freq_abi5_pdm req;
+	struct ti_sci_msg_resp_get_clock_freq resp;
+	int ret = 0;
+
+	if (!freq)
+		return -EINVAL;
+
+	req.dev_id = dev_id;
+	req.clk_id = clk_id;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_FREQ,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	*freq = resp.freq_hz;
+
+	return 0;
+}
+
 /*
  * ti_sci_setup_clock_ops() - Setup the clock operations structures
  * @cops:	pointer to TISCI clock operations structure
@@ -551,3 +913,21 @@ void ti_sci_setup_clock_ops(struct ti_sci_clk_ops *cops)
 	cops->set_freq = ti_sci_cmd_clk_set_freq;
 	cops->get_freq = ti_sci_cmd_clk_get_freq;
 }
+
+/*
+ * ti_sci_setup_clock_ops_abi5() - Setup the clock operations structures (ABI5)
+ * @cops:	pointer to TISCI clock operations structure
+ */
+void ti_sci_setup_clock_ops_abi5(struct ti_sci_clk_ops *cops)
+{
+	cops->get_clock = ti_sci_cmd_get_clock_abi5_pdm;
+	cops->idle_clock = ti_sci_cmd_idle_clock_abi5_pdm;
+	cops->put_clock = ti_sci_cmd_put_clock_abi5_pdm;
+	cops->is_auto = ti_sci_cmd_clk_is_auto_abi5_pdm;
+	cops->is_on = ti_sci_cmd_clk_is_on_abi5_pdm;
+	cops->is_off = ti_sci_cmd_clk_is_off_abi5_pdm;
+
+	cops->get_best_match_freq = ti_sci_cmd_clk_get_match_freq_abi5_pdm;
+	cops->set_freq = ti_sci_cmd_clk_set_freq_abi5_pdm;
+	cops->get_freq = ti_sci_cmd_clk_get_freq_abi5_pdm;
+}
diff --git a/drivers/firmware/ti/ti_sci_core.c b/drivers/firmware/ti/ti_sci_core.c
index cea4339ac0af2..a8135e611a515 100644
--- a/drivers/firmware/ti/ti_sci_core.c
+++ b/drivers/firmware/ti/ti_sci_core.c
@@ -715,8 +715,10 @@ static void ti_sci_setup_ops_abi5(struct ti_sci_info *info)
 {
 	struct ti_sci_ops *ops = &info->handle.ops;
 	struct ti_sci_dev_ops *dops = &ops->dev_ops;
+	struct ti_sci_clk_ops *cops = &ops->clk_ops;
 
 	ti_sci_setup_device_ops_abi5(dops);
+	ti_sci_setup_clock_ops_abi5(cops);
 }
 
 /**
-- 
2.34.1

