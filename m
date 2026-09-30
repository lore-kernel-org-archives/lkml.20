Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B33950254F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779180; cv=fail; b=e1lbVUzcMQTNOMdmhb7sHNsHYHSQyEjpaLEjtQX/qvoOwBkEJZKTd225o4E5Joh+VzWdioJAfuB3jgbTgByoYc8I8lnhghBcy1eyVAIPMlWXbp+nmnfal3lnOutoEbEcrbndcJkPilArQFCeT3lyc3gX6FNqxly+NTcNlqpNX6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779180; c=relaxed/simple;
	bh=HVY8vvqdWj8Bb7XXavm+XsFQ839AAGpul/i9X/+xGAA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=u+e0z1D7zBiPkSrshnZS+5kYhkPe9moT/ixDbwwQayKX831NCCLzuGB6PV4yVLHdTZfwlEpb4X1FYT0CzBY1FlDQsq7s4sNYLSuPBKbUA1t+9oJJsmyi0q8dctpUl6Jy7O09HS2EqgaBQrpbc53nTKEP2iMZqr5P+5EXwNwsAzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=HCqUyFMy; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=Z9FR6E6z; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="HCqUyFMy";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="Z9FR6E6z"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UE1Vvu3890152;
	Wed, 30 Sep 2026 09:39:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=n30qYjcXby6KQ
	ZATjQ1p4RNORFu4NYnzAVkeD8MRJ60=; b=HCqUyFMyJLUGhqZrUtZeO4fYJRkxa
	r5E8RSNRs5npxPblKq5DN930Av+nr/YTtyDNHecO6myAJ/ckmFCm1YrkUuEWAjhf
	pUP86iGDJasS5wpI5GPJ9EM5/LjNgmGkhEx1aFgMs0eOeVKlLI6hzToq0wmLx/RP
	wEaUnjobHIdqm1VPvtUUS1eWCrv9f7Hz9bZ5oGDyJicb77F/eCGO2nW1Hg6+tR4a
	C6wP4OIw68zb0US2iLiG6rEen63wBLcZoukxo5wTIVk5FlEvRd0wwAAeFjXoXtr0
	7ZXnv9kEWCFP4OdMN2r39y7H6k/FJ8yKbYj/No9aZX75o8dCMp9mTcBeA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012041.outbound.protection.outlook.com [40.93.195.41])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h10s21e5d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 09:39:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWtqLJg2rsUbIxaQXoIJ5PSWrWH+f8LAyqIT4hfw7oE/tYzMCC3dYnznP67HVbT5WKOoOeNw6dOC6imBCsKTeyaLS2nvJaiedXAN5I25kPjxTEI8wYOe1mmuKMm1XHEyp28a45Rw3mi5lXXj1qwUc3vw9Fc46PJUAfDDAO0Pad6UhFqkTDQvv/7P2wUnZoLzJAafZxCDvvZtF++L/ikQ0/J4wEsbNKkSC2eXQklC0UuAClk30pbxkqrgegCygVHyJyjHC6wp42ZEkWLhCLq7XmuR9UfK4PqByzi0gbfHIcjvHzsIitkOhVc3juiC2QXLqD2IRePRmmI7uDiyCPxtVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n30qYjcXby6KQZATjQ1p4RNORFu4NYnzAVkeD8MRJ60=;
 b=l1G/UC02FVMftt5dfiB7FI+j0P97AspCIUdGe/baZGc9uzRw1LBtNnDp3JLlio3GQ/o+Blw13eziwTXdpVMt/6Zlxlct5w0o0D5ghSSi4JycFrLOfV5xqvpYOrs2NAC7Xs/3FK/mwKz4AifyexZTKMaz3L89qQjvOz3npoyDyJ50Got+EEa2P+awo68a7yOtXxl49JxoKe5Fu2g1TrrwBm9h04Aa9LJWxgosMzk3ctVQr42ueQjCIfUDF6QvQ7L/3Y33wZxTSIsa7iR3k1I7DWjGzbLn4ETBVrLYLM+sMJEXMJa0CAvRSkrBtXl/LY0HD5GreL7ytb60fD66K0KSOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n30qYjcXby6KQZATjQ1p4RNORFu4NYnzAVkeD8MRJ60=;
 b=Z9FR6E6zzy8Sy+3LbA64+u4t8v1I1R6rw4lSrFG6JSVp0Q+KL5WtGdCHXlrnMJTh1eg4km+vOySpTjez+ewOPxzFrXELkK8tkeSjgcr8+Hh5YXvRPGquxj1nEh+hyOoBWfQiWIm/PSwQNTTek6YofUIuasdvKPIxhSSbGjpRGcU=
Received: from SJ2PR07CA0017.namprd07.prod.outlook.com (2603:10b6:a03:505::17)
 by LV3PR10MB8178.namprd10.prod.outlook.com (2603:10b6:408:28c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Wed, 30 Sep
 2026 14:39:06 +0000
Received: from SJ1PEPF0000231D.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::59) by SJ2PR07CA0017.outlook.office365.com
 (2603:10b6:a03:505::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 14:39:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF0000231D.mail.protection.outlook.com (10.167.242.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 14:39:04 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 09:38:13 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 09:38:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 09:38:13 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UEcAmS3303811;
	Wed, 30 Sep 2026 09:38:11 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <jassisinghbrar@gmail.com>, <linux-kernel@vger.kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <b-padhi@ti.com>
Subject: [PATCH v2 0/2] mailbox: ti-msgmgr: Fixes for polled rx and trailing bytes
Date: Wed, 30 Sep 2026 20:08:08 +0530
Message-ID: <20260930143810.2419010-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231D:EE_|LV3PR10MB8178:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d84d749-47d1-41ce-ee32-08df1f0093a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	fxtiESdW3XOxrqm/t/aKDg7RF7iKxAPAcKXwyUXqJPusL40N3Qk6X+Au0mQjAsgiGCdjM8dlUq44hv/K1WhXXY88Zi1MQvVMnVvZ8C6Vd3mBvFxEEdkF9xTtUFMOV6hFlawUyx3u6ZkW7zaIjRUljJj0OWjW2/bT2PCgQ3JTdjEWLGD5qiSEyMOgd1cL0XLiTc/qQQfZAW68QDiwr83UsXgnyPI1w2lyxSWzHojipQ9muAiOSCB8JK72NokX4ufIbUYID5Qj8Vbig6kVS0owI2sORn/adv1nBWpFaYxWuv2v8CNcn6oRTuMbAmdXw3OZZWhZ4jJ/2GnUihnCq5pNRtQ0YMfW55XlsPWu5j+ZUwslg/e/TuEshJJFHdrBv1fPNvpNgVSgkuu6Bb4isl67vKu35Hp3pVWzD2JPCOqqeYcZX4REdl75Mlxaiwsa05+73+pKpz/QUXCYfto60fkUOFnFZ+gKtsBfaEKEigBg6lpFyGb7vmI1Iq/go9Id2BjyhVGYPBp+dHppWPL1z1Ei611MOqPOCvu/rhQu0+MhkpY0JJAUU+9U7S5PJeynILCK9ETXgYAsQY1zBLPhFLH9OxTD5/eJyuVTouv8D24nuSKlx6kU7bJKgiq+EY2Mn4j0kYM17pzMWo5epMaUYU+4dWap79rEXKmQyKguN9gzvEw=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8DZFKkZjPmryVjAYx4mOhJpRjhwtR6I95dm5zmvSnsXQsYAxpEbgwvLgzvD2MrNsty+F1uVusxct6BBwzCNQl5B2E1fUcYl2kIVf0fpIF4M2/2UTfvmDw33Cz7sQcQzGMCl7CJrdkOYeDnQskUaWHprQen0HzQLHZPaTuJ87v2Hz+VAh9XoWU5srTGxGpSjYSiDMK8/pLueB2xK+i8AKuMxkTf49dsDeGu2G9w0SAp/AF4YvmFN1M3Y5zI4td21s77T8PoqYhCAoLj8f6BAiXEO6eCApIA7Rvxk+k7REzbKCRJ8V5L/64BPKnkKi8eS2lPUWdrDw0KcAiN4ZZLGKk05n0Cx0EfeLr/3QTLAotxI7sg1TyX6oM6sOnxHRl2pye05kFR+o65lnQ6HpOe6aDBsh1dh4Frx9GF+zjeq7jaBHiPUO4B6R4uLIEyd1ia1U
X-Exchange-RoutingPolicyChecked:
	othuifqGnVdnvpirAaKVaDKmvrObn6uHtteIQo+4OMiZiC+5DZI56nKwHhtHr1uTSF7v8tZILSGylgSpq8mN/bD6KIpRxEl6Yu8cLtccEufrn2pJBGmkeDIY59jODNDB5q5OdfuoBUwxxAATO86TpDTCjD8P1GiwDdqU2RTYksdbV6yzCnxAp/RViucVGv21DR6M7dvXotMLOmqwlFscDpMNBWDXa8WXGgUa3TlsasjiLuOfnZCuw7Tf4oUMraTjWkvvKB9o0YT0WWl+vCErfnyJZhCSyRdzrsHhscMZ7fBwOkc/PmTCqpvPdoCXF13ORP2zzlju85rIYFORl3BTKA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 14:39:04.5715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d84d749-47d1-41ce-ee32-08df1f0093a0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8178
X-Proofpoint-GUID: l-dc-gmTIJ-1Xl89VHyegHmVHoAvl-fZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1OCBTYWx0ZWRfX9NAhu9j/dXgP
 g/gT/lJ24E+S6k7AXE9nWoCimOj4xHhxY4ydIDhAZWFj4IJ4cdiFgkBdM5ox/e1bSP2HOpfVf1u
 arDW/4NCUasvINGwuirJ0VEt26+StlA7H0oXiupDf0+D61S/xjySkTOL6kxD9Le3h53L7HzMcBc
 8sMfF+6moh1+Vnt53IfV4xVZUvN+N2o0IX504w1xPGp2kL5LoTrDZRHiCWroHuEg4sAyjmQZUEO
 1MSFqpFxwj2sDTPxTykWj1nPBT8s5RDiNEl8vlfPWXW5cs26yeTSEL5XV/XhuDSyNPP6XG8Byou
 NtIl+k+1vfMSL/1cwDSp0gIpHY0i4cqfCAyjNZI/TxQVwEFtZEVtTWOrUJUoyKCsYQM+YUmfb6U
 IeE4K1PI5tpS/WkurNZSfKzMloHNyVJavvBM1rmDiNZt8c3XcE9kImZQKfGneTyBxenHimUVaHL
 ryTeu/aO7ZrIrOkZ7Qg==
X-Proofpoint-ORIG-GUID: l-dc-gmTIJ-1Xl89VHyegHmVHoAvl-fZ
X-Authority-Analysis: v=2.4 cv=G6aJgNk5 c=1 sm=1 tr=0 ts=6abd1f0f cx=c_pps
 a=9jlK8eo7xmF8zH0m+f/LEA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8 a=OwONl8DW5uTMEadboLoA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1OCBTYWx0ZWRfXy7er9zNhpEq8
 TGDxINsJR6PV/nOytq6OhFuOFYqqzw42ADVmIAmd5bAWNbBXPYAKPny/Ct/g42hFowErpz9ENS2
 6RuhLmH7IDdcksiD5yMBte+4Bbu0ZF0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300058

This series fixes two issues in ti_msgmgr_send_data(), found while
refactoring the ti-msgmgr mbox client (TI-SCI).

Patch 1 fixes a duplicate message transmission in polled rx mode.
Patch 2 stops reading past the end of the message buffer when the
message length is not a multiple of 4. This is a preparatory patch for
when the mbox client can send data which is not a multiple of 4.

This series is independent and can be applied directly.

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

