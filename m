Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0DA3546F0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047927; cv=fail; b=g632oMRD0slLPhhGer1kf/klYoEauery8pEq8aqQG9CP7L6q+pyJS9ffa9KN9dAUPTHB8lnAci9H0wu8qCoPE0BQQrznkEOE+3WVs7BtsLGI8NqOhClcJtPDcx6lTXhTti1womYRooWCRubRK90jU4giNBquaqETdIhBRm232NQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047927; c=relaxed/simple;
	bh=UYUtAEC42eZ3kXw6ezBWfPAifLU8nNmZPL5kwCHzpUA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dhXAqajMx8+6GZ8hhSb3eNur2ulr4xAggDXwo/WzRpWn+vc5ZP+B4HgAOupNrVU8PhTlofAs6s/MWicd+SoyT3wex6BTiRDJ4SrtFtytwdsTeIXQUT1PEG4yLnWuTo1Bd94XIBbCltrcVB7vdHW5itY2CP6x54gPbmS+FNNK8e0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=IKDhpd4c; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NOAT59RZ; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="IKDhpd4c";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NOAT59RZ"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68AC9XaO1085740;
	Thu, 10 Sep 2026 08:44:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=KQxXhUSQqnQRY
	33aFcXayPIgvZ2x+iDK2sfU5SLLQZA=; b=IKDhpd4cBOE7f6F7ooVIuKemp9vbq
	v5djWYCTsQknTXgRc1fz//LLwAUvNqyXysULAh7iBnF5fxDAIOJ0FRj9l7GGlTNZ
	QDjCtwA7Gm+9u37cxnlvmRb8iXRBEwdH26CTsaoKFUF9RU8+FQP3/tF07ypeOqHG
	4PkoSJqOcSUiCf5xHgVmZzDWfDbeLlvILSL9jnHqw0jyuZWOVlMW0x1jZwLRTxCu
	UO51YJmoZRcrZ8JQExsHh0LsM2ejvsitd6T/S0rmg64wCWqTOtMLo+q6atVTbkKz
	yxJblNFm2llqIlYHsCY+mi20TKmqH3BDp0RzAxRtPs8ZJTltGQpv6S2/A==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012007.outbound.protection.outlook.com [52.101.48.7])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gkcxgdk59-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 08:44:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQOryLOkJwNsk51FdZInAT5m5AeXhaN63BNmtQRMieoHf6tBv6Q/5mm1Wd/x8QaVzNG6XfyiH+TBZSnD9IfcGP/OQAEg4zaY73Ms/0nZHFMKpRcwQHxuohU8vJgF110QQy34nySA9JZVheQhzSoSdqpY5MZNiev6pzrBK5ZAcw0vD3ePZrIewcQgRySdP5YPymkEObMQKKbqK7K7Z+ne300vytRSgAQIEheRYCqXmaQsnQ+EKuy44qJGyAf9emvy1FniyX7/tpHZeXEGID6ctG3eao4/ep6Dm1+uKe4LU2H+vnK6RZu5+xry5dHxyxiKOg11qbaNjZVWgQz+xtv1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQxXhUSQqnQRY33aFcXayPIgvZ2x+iDK2sfU5SLLQZA=;
 b=I9UCRoW+1HnGDDaCJ2IrLNNosvSiZHgDiu7Og2f/+CSOdjHpZcdbGW+E7qX4O2vBHhplOKKkS8v+VORzb6P+PbuhEpcPr1de5ygtuUu0U0UTpXumXfGL9ddfQxbpKi8TyEGiNWOAPMmTPxVo0qW3RUBPpBtAkokr60YRwdVN99DAC4SrSbQM65L5AsI2TRhhXURznSbVx/n9F4+86HqJ0IdJfO78F/WOFs+XhXERPt8imGkCedLzLhsMC93k6jbR03vXltvAgRuNKioVFqMr0R60Hu1+Lb/Jwzw3uqxa0cpKVWymXejYcnCBDYEnhRKigKxABL1VYqWxqIMjaHPqPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQxXhUSQqnQRY33aFcXayPIgvZ2x+iDK2sfU5SLLQZA=;
 b=NOAT59RZNCL5njCRintOZXPfjnBubltMMIDrfhjSm5lax51OJPSOT4oG/VokwUcfw6tMM1xyaQm1AYHWEd2FXL8zYtcYmajb7iZuKDKjKtOdhn+66lRgtpB12cjcoEfK0zrQKvEAcs+BRbGwPuxf7QHRZMgLqWDb/ZSoaqLGIfI=
Received: from MW4PR03CA0349.namprd03.prod.outlook.com (2603:10b6:303:dc::24)
 by SJ0PR10MB4573.namprd10.prod.outlook.com (2603:10b6:a03:2ac::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.5; Thu, 10 Sep
 2026 13:44:21 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:303:dc:cafe::ac) by MW4PR03CA0349.outlook.office365.com
 (2603:10b6:303:dc::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Thu, 10
 Sep 2026 13:44:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 13:44:20 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 08:44:09 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 08:44:09 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 10 Sep 2026 08:44:09 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68ADi9Mh2432799;
	Thu, 10 Sep 2026 08:44:09 -0500
From: Nishanth Menon <nm@ti.com>
To: Nishanth Menon <nm@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        <alexander.sverdlin@siemens.com>, <jan.kiszka@siemens.com>,
        <ayush@beagleboard.org>, <robertcnelson@gmail.com>,
        <upstream@lists.phytec.de>, <francesco.dolcini@toradex.com>,
        <leonardo.costa@toradex.com>, <matthias.schiffer@ew.tq-group.com>,
        <stefano.r@variscite.com>, <eblanc@baylibre.com>, <msp@baylibre.com>,
        <thomas.richard@bootlin.com>, <miquel.raynal@bootlin.com>,
        <mwalle@kernel.org>
Subject: [PATCH] arm64: configs: defconfig: Convert TISCI to modules
Date: Thu, 10 Sep 2026 08:44:09 -0500
Message-ID: <20260910134409.1713610-1-nm@ti.com>
X-Mailer: git-send-email 2.47.0
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|SJ0PR10MB4573:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f562d52-6ed2-412c-4512-08df0f419e2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|7416014|82310400026|1800799024|10067099003|18002099003|6133799003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	oAAWP0k34nnZHy0OhQhgKpFTEZnPG7T/19lde+P3e8dG/3/Dxt75N9ZpsVU90tqBPkj4nqFDdiFiyDLC/EmyVKEDONzKB7ENJpaAv5MPnmAWzBxmm8br0K7bwpqK1D6894gsitRNBJ3vnCXwxzYve+B9fy5oxShLKJzeBu4cqL+c1RH7Xc75iBdCapQ3bNIBU6m8Q65WYjHSwyzu/3Jg/uUlTf7JwDfqd16ISswT3rkov4KIsUWbqIf6g5Sl+Evdt4dS4RT9mADgdeco5U/8dHx0G3S+C+dnsd/OyepksJ/PzI9ctD3XSpITLikz0AAWV/Pjm2Ug+3SCfwWr6BIfVcf9tzPLoTHm5x3MNgvEXbSb4EibEWfST/aHUVvbp9PWmGAhiCsn+rZjk/HHshnrD4g+3Kce9/w3dKhRNKBbtDr9YLtbBdWbkdwIQAHdWnRjvhrZTrmAzqXkGcqH5e6rtM7b283FQGi/g+qPVFZpg4FPaI1lgGqdkspOFhanfcsqPiyW3o5sDL3a3Ioi2HQqd00tc8yIvoqVwqIKvknGf7Qv5c5+GdneawVCeJCzE1ME+oAopdQUPbWmgR+i0FAqHNHOuDFpCquM4zWsmlP43vkY1Cy0ippkZm4liBa12z3R+j97Tiu+ePlRQJKteEYbtA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(7416014)(82310400026)(1800799024)(10067099003)(18002099003)(6133799003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ApuB4SPQZJKRVQc/lwjFClft8GgFUqyb8jbPBQuDdswqRfs4WyVl6MGu4oHQvBj+uAKXGnAWQx3sT8W18iVyEJ9s0KGESTN1aJlwywIsg0AorLuS5UNSYjBZWPGQg4Pd0G9pstpLXYbkvvH5N/NgcutXk5cTiiZOeMTpbruz0lwGpjEUWIF8QCzJtvNVnCNuc2Nrr9KOVoJOIbttda+N0tddyQB/q4UkShLYjHnCdZvdrRT6wp3kHz5JT/8+3XIMV4se39gFZSB8Nm2H+S8SjpKRPX9M2wYaHEYpGqICI/+u3Bo2xERjR3mEet4i+Pxi1Mg5YGfKOjnUPcgfCmBWA0aHe0t+P9N2gxr/flFmVYF/EZkQ+wR6H1ax/N8bSz2yGh1Lfon1XmIQT7OSIItzBFbEMrCvyqQOxlh6Wl9/K8zUrOKsQItCblx7XOFKR2m9
X-Exchange-RoutingPolicyChecked:
	FsC5pt+XkmfZ69GSzCpbVKr3a3qiaoAD/IdIIYKNo1iau7Eef0LjYSnugPp+24uej2yPIYJcPpxCdAwFqnhCCU/P8IKTYXfwLm2rz7XFg4vvU5eXj4RRBgYn/u8frEgtRUV7sHxik04P/A00TXB+dPGndnhJmSiNME0kSeQwpx57mb0EqRCfoVjpk7S7IOLhwr5i8hi1mZwnyHltNEMUWFJNAchBjGMkVmuNi12vSs9xXRvOSrsaufDLDhCAZMHIfEoPEM9M5+mNCP1+HDKVZDxDSns9Ir5XEc/E4VSQpGwWsyq8iGnN6V118iOnI79sD0fhfkIixWfTraKcpbCvew==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 13:44:20.9367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f562d52-6ed2-412c-4512-08df0f419e2a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4573
X-Proofpoint-ORIG-GUID: Ir6yxrI57yfFZ0IzRlXAOapPCBe-cNf3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2NSBTYWx0ZWRfX2YljUHBxiFjp
 TxMcv+kU58zFgHmRBN22b+msHZJvPQ58ij+NZCFKKzqt82u+3xLMDK5fOHVgGFrRFR2ixSV57+s
 UvBQEDe6R+mz+IE1L065FwTFHivRTR0=
X-Proofpoint-GUID: Ir6yxrI57yfFZ0IzRlXAOapPCBe-cNf3
X-Authority-Analysis: v=2.4 cv=MqbHeGae c=1 sm=1 tr=0 ts=6aa2b437 cx=c_pps
 a=F1HhE1toGRAZ88wdd1wKFg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=0Miry4rRAAAA:8 a=sozttTNsAAAA:8 a=7CQSdrXTAAAA:8 a=a_U1oVfrAAAA:8
 a=fGhLjsSNAAAA:8 a=pGLkceISAAAA:8 a=m8ToADvmAAAA:8 a=8f9FM25-AAAA:8
 a=cMDUSdu-AAAA:8 a=IpJZQVW2AAAA:8 a=P-IC7800AAAA:8 a=-oG_GxVZrpTI68_nl-sA:9
 a=UT1Yo3WijKgCWNxi40OF:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=LYKFdyShAPKLkGq8p7WX:22
 a=kCrBFHLFDAq2jDEeoMj9:22 a=uSNRK0Bqq4PXrUp6LDpb:22 a=QRaI_VI5Kbc4sAalow4w:22
 a=IawgGOuG5U0WyFbmm1f5:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2NSBTYWx0ZWRfX5MVyxQNZ/hWn
 2UCgGeyqF4BtysItjVkUJ9E22b7HT2jmq0hdtPaH2BG1oKh1fW/1YHqg8alXl88H3R23igmURnN
 MRPN6fe0XVczuxG/2kaqD9sdvZ9ctdplaD3+ZPNed9ajAFqLB1U3XwjRkd+KQqxZLCt99EcNYVH
 QFTdeE4YYdtAvRHs2n9PvBnkPwyka3bkAwMlPlAiZLjfVxqIbSb3y49D4Y0/bgF3CsWldC2/4wo
 ac0UDiR3uz7VIE5AZT97KmZnxGyrNEoeDplDyMBS0QG4w+W0JDVxqGoxIod3Aihjx4LYKXtQdBL
 wnfLNuH+w3WBy8sVEyBtFleLFL0wFC6wwp7QbsQRJ6klw4yfyQCiHEB+IZSzzr5otmQck9mOmIu
 ZPUkTb2gwT2gDXU+hyD99/UTefvvhRepBcXhMKJtHSnU9kNmrQ6/pWOTGOB7RRLZfe6wms8pvlr
 v7xTPtOPg8mez1CMtxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100165

Now that all relevant drivers have are ready, convert the
TISCI drivers to modules. This impacts all K3 platforms for
boot, recommendation (based on empirical evidence) is to use
deferred_probe_timeout=60 in kernel command line to allow for driver
probes to complete successfully based on the initrd used.

NET Savings: (Ubuntu Clang 23.0.0)
./scripts/bloat-o-meter vmlinux_previous vmlinux
add/remove: 4/380 grow/shrink: 0/5 up/down: 32/-143248 (-143216)

Signed-off-by: Nishanth Menon <nm@ti.com>
---

NOTE:
a) This patch is based off v7.3-rc1 and will create a merge conflict
  in linux-next (next-20260909), but the resolution is trivial (vs
  bd94bea7165be450903c6d64bbcb4862e36798f9).
b) Emperical experiments that Siddharth Vadapalli did,
  it seems like some driver probes might be taking much
  longer than the default deferred_probe_timeout of 10
  seconds that is used when CONFIG_MODULES=y. Testing log[1]
  a deferred_probe_timeout=60 seems to have worked fine.
c) Full bloatometer report is available in [1] as well.
d) related lore discussions[2]

[1] https://gist.github.com/nmenon/5f1587b373e6ca27170593010188d968
[2] https://lore.kernel.org/all/20260429-defconfig-v2-5-e4ed4186028b@oss.qualcomm.com/
    See headsup I gave on #linux-ti irc channel https://libera.catirclogs.org/linux-ti/2026-05-20
    https://lore.kernel.org/linux-arm-kernel/20240821110054.35u5ubgaogzjv6c4@rover/
    (original thread that triggered various changes)

Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: alexander.sverdlin@siemens.com
Cc: jan.kiszka@siemens.com
Cc: ayush@beagleboard.org
Cc: robertcnelson@gmail.com
Cc: upstream@lists.phytec.de
Cc: francesco.dolcini@toradex.com
Cc: leonardo.costa@toradex.com
Cc: matthias.schiffer@ew.tq-group.com
Cc: stefano.r@variscite.com
Cc: eblanc@baylibre.com
Cc: msp@baylibre.com
Cc: thomas.richard@bootlin.com
Cc: miquel.raynal@bootlin.com
Cc: mwalle@kernel.org

 arch/arm64/configs/defconfig | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..ed5aebf96080 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -267,6 +267,7 @@ CONFIG_RASPBERRYPI_FIRMWARE=y
 CONFIG_INTEL_STRATIX10_SERVICE=y
 CONFIG_INTEL_STRATIX10_RSU=m
 CONFIG_MTK_ADSP_IPC=m
+CONFIG_TI_SCI_PROTOCOL=m
 CONFIG_GOOGLE_FIRMWARE=y
 CONFIG_GOOGLE_CBMEM=m
 CONFIG_GOOGLE_COREBOOT_TABLE=m
@@ -1403,8 +1404,8 @@ CONFIG_DW_EDMA=m
 CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=m
 CONFIG_RZ_DMAC=y
-CONFIG_TI_K3_UDMA=y
-CONFIG_TI_K3_UDMA_GLUE_LAYER=y
+CONFIG_TI_K3_UDMA=m
+CONFIG_TI_K3_UDMA_GLUE_LAYER=m
 CONFIG_STM32_DMA3=m
 CONFIG_DMABUF_HEAPS=y
 CONFIG_DMABUF_HEAPS_SYSTEM=m
@@ -1456,7 +1457,7 @@ CONFIG_CLK_IMX8QXP=y
 CONFIG_CLK_IMX8ULP=y
 CONFIG_CLK_IMX93=y
 CONFIG_CLK_IMX95_BLK_CTL=y
-CONFIG_TI_SCI_CLK=y
+CONFIG_TI_SCI_CLK=m
 CONFIG_COMMON_CLK_MT8192_AUDSYS=y
 CONFIG_COMMON_CLK_MT8192_CAMSYS=y
 CONFIG_COMMON_CLK_MT8192_IMGSYS=y
@@ -1678,7 +1679,7 @@ CONFIG_QCOM_CPR=y
 CONFIG_QCOM_RPMHPD=y
 CONFIG_QCOM_RPMPD=y
 CONFIG_ROCKCHIP_PM_DOMAINS=y
-CONFIG_TI_SCI_PM_DOMAINS=y
+CONFIG_TI_SCI_PM_DOMAINS=m
 CONFIG_ARM_IMX_BUS_DEVFREQ=y
 CONFIG_ARM_IMX8M_DDRC_DEVFREQ=m
 CONFIG_ARM_MEDIATEK_CCI_DEVFREQ=m
@@ -1745,15 +1746,15 @@ CONFIG_SL28CPLD_INTC=y
 CONFIG_XILINX_INTC=y
 CONFIG_QCOM_PDC=y
 CONFIG_QCOM_MPM=y
-CONFIG_TI_SCI_INTR_IRQCHIP=y
-CONFIG_TI_SCI_INTA_IRQCHIP=y
+CONFIG_TI_SCI_INTR_IRQCHIP=m
+CONFIG_TI_SCI_INTA_IRQCHIP=m
 CONFIG_RESET_GPIO=m
 CONFIG_RESET_IMX7=y
 CONFIG_RESET_QCOM_AOSS=y
 CONFIG_RESET_QCOM_PDC=m
 CONFIG_RESET_RZG2L_USBPHY_CTRL=y
 CONFIG_RESET_RZV2H_USB2PHY=m
-CONFIG_RESET_TI_SCI=y
+CONFIG_RESET_TI_SCI=m
 CONFIG_PHY_CAN_TRANSCEIVER=m
 CONFIG_PHY_NXP_PTN3222=m
 CONFIG_PHY_SNPS_EUSB2=m
-- 
2.47.0

