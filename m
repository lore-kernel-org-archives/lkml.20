Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793297578;
	b=djanIGzOxslErmbr/SnGRs7q6YTosi9NTZBTfsKLubMB0cF6zYvmhVshia67yXHnODy2
	 TJjyPRvPUlbsfrcy+O55BoQWWLjtLSTPR+taCsRh2cdyheWdGj7xk6Lj/YJs74HWVHrE+
	 1+hVdIR+kbMfqOqSJ7aR4v4he1YT5neyoEwixy1P9Ay34NjpuFY9pHftL/S5VdTXN9sge
	 3vARiCnS7Uo9O8QFbImW8aeTBLG26rYRlZ1xbPZKAMDPa0tDGBRtsOj9zKoyGDdnaQOOV
	 jAHd8rkNu2IpqDdBDOE8/ogFE/kscer8uSEAbgqkYMmtDKf8ueZIUva52eBzBdnQrpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297578;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ERAa8/aZkJjRulc/iI49xS2CEqnFfr2ZgPlPUWlqdiM=;
	b=GOchVrWoOa0IIJwXJsL/1xYykyX79/0SwuWhnB8EZAljOmrqjyweYgcq7h2eHygTj0Bv
	 P2R+duvPdcK2JpjucBOdGjurnhP9BCxnBdKZbAMHgurotzIGVtqJ38uX2RZ4acbS6BsyE
	 SYAC20fuGVmV/5ZH3ufAihKJ6IbYcF8C9xS9uM8fx3wnq3m1oj38z36RAOFinVY2GFvM1
	 9SfvadQ+gRs94CwjJlCcHUq2Gyh+K6b8s2fey1Wr1SuU9f4LF60dvd/2asiFiiPyF8WeG
	 IXLYZpyKtncPKNFwlqzvtsVDw0EsWIVC7fdb0i+sNDYxAeGx+P5yNDIkUhc6aEqR3qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=KJejvVsn;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=rplCj89+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14748606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14748606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=KJejvVsn;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=rplCj89+
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDii02604277;
	Thu, 29 Oct 2026 13:12:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ERAa8/aZkJjRulc/iI49xS2CEqnFfr2ZgPlPUWlqd
	iM=; b=KJejvVsnTgfcEwUon32rykZeDAbo7JUYUGbe9UCstTdHTjVC5RHnsXeDb
	GhJB3rKSxlR8f99Z+xuPmMdxz7FvDEn2BS+p0/Gsmq+VItpvY7dDZricPA7h/yQb
	xheyRaEkrs9Im5pJFsBD4d8TNjvNHGb2hiK9HQZ7Te9BUVkcjQofgFYupocNCVFx
	caqqTZEP6311na/wZkju/Wjc3lbiWYM3qOp0gnH0hoDy8jxDplnvYpBxbK2druXK
	PKWSGw7iWyYdWJWQUnSbja9DBuXIPmIM+rZQYvSycKM5InRSiTSKs5A1BVhSlSNz
	pAJA7inB2RBGBGMpCxONbRFil0mqQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010047.outbound.protection.outlook.com [52.101.193.47])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hm55ak3m8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 13:12:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mt8pQJrWuVoI621k+v9WDJjlqGHTXG5ADEE3ZWxyDMZg/OhNfL7SodvEo6S/Yr8VkHQ6UeQjoE7K7gZoKtYekgpBsbggnnqpJQDTDFgN6+LXT42R6H+FC+ChZsqibiyRLssy0hfN+zehNjXst2NU5trAtbaWmjmg9AsdKq1B+quTAeBhHpSM1o0uuI3s324hVvol9pbN9Y24ishOSwdUZ71PlcsI5avlQzXeeJ8vWJ7uXaIW1C+KQn754wlxLuRvyQcvPDwx2zHeDjyNKJaQUYuzK7Ko8xtrw/i2TpXsrvDBFhhuPfpwPeWIVBLHLINeD95DYVpZukn4MMQLvrLnBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERAa8/aZkJjRulc/iI49xS2CEqnFfr2ZgPlPUWlqdiM=;
 b=gkALu6F2zrO0TjDfxfRV4sI4IYj/zDkQN6LjbsLOpDUoctl3R6GF2SvXXIsO+/qOMPn/oKG2BVhw4SoRXEjvpEDFsC4cAW68nCfoW4I3/8Z+Hd4NHokXMt77tW6KiO8b3xmUXXu/kxk3aEvTZ0tqyJzXUIF8O4Fb6oHtXMFghC3i+80/PGT0W+TyqpNNnij5YbAuR4d2fWKQPYbhblyNLofjB52Y4opGQpoR1vGQKKbzhbD8PkwVRrHrUMtgrptDT61ffYzyVmhYY/qyrUBqc+mnoJAA57uYha2mOMLwYAVlPoMUTxOZh2P5NbwtKFgCthcx12lamUPlLacLXZhSTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERAa8/aZkJjRulc/iI49xS2CEqnFfr2ZgPlPUWlqdiM=;
 b=rplCj89+qc6NI+sjcY+6k4yAKx1lTGEQHuX6USn0h/mk4NU8Opys0yPrBLpliGiZHXCxBoUGsgP14vhfSBor3/XxjSwX7Tt56F9Dq/BkNmLg6ddAY3MVgQ1LDAksHBAJb4n2k2vthtx16s6m5aaJ8YOufnbrBPtCWwZbvg8kEgk=
Received: from MW4PR03CA0294.namprd03.prod.outlook.com (2603:10b6:303:b5::29)
 by CY8PR10MB7316.namprd10.prod.outlook.com (2603:10b6:930:7a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 18:12:40 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:303:b5:cafe::61) by MW4PR03CA0294.outlook.office365.com
 (2603:10b6:303:b5::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.7 via Frontend Transport; Thu, 29
 Oct 2026 18:12:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 18:12:40 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:16 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 29 Oct 2026 13:12:16 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69TIBmM83408718;
	Thu, 29 Oct 2026 13:12:13 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v3 08/22] firmware: ti_sci: Combine xfer allocation and transfer functions
Date: Thu, 29 Oct 2026 23:41:33 +0530
Message-ID: <20261029181147.266771-9-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029181147.266771-1-b-padhi@ti.com>
References: <20261029181147.266771-1-b-padhi@ti.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|CY8PR10MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: 818305b4-0d13-4160-9a1a-08df35e83839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|6133799003|261026135527099003|18002099003|22082099003|261026140227099003|261028144727099003|261026130827099003|261009220027099003|56012099006|261021133027099003|261009223027099003|261009223327099003|261021121427099003|261009221227099003|261021130227099003|261021123027099003|10067099003|261022113327099003|261022105027099003|261021135927099003|261022075727099003|261009221727099003|261022115727099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	75tcV4gsHaVmpSDCJm8GyinKC0oDKemvf+yy2pJ8AFZYez1e4MnzHYoodes+I55EHWjeR36KVLTuS6UCqDBrnicG+TKfgpxS8t4bviN3+eQGccPlYIW063mtZrthqiy79uDf6RWFBSdyLtvLNSQFOASYR+MWeOq4IbDmKQ2m0X3gC9BXxr7ZC/qcmDKytEdpE55BIK0zBv3h0pNbSDLtQKZzijWqHZ+guZlKQcuNe4u7kPF2xWTsWA9jpO9XsWepvMH7MhCLkpVYvfXeKhQPyfbb9VwbY3RTyN2oDTAKCr7+GhADqImRRmN2Vm4IlK8tllO6J99AVlhPGkRgdgopZh44eqGnAMLq8MdcsW8bsD6COYSe9aWxQ2bcNRgwN/h8SfZ2k+LALXpt7pYEXV94OllWC4bLjoKD5HXsosPijRpnNIfWubUEoiiLgeXD2/jPzzPNsdR4j0ujeIawUtx3bad+3nQT8imWSdqGfQAxNO7wlhnNY17FyWOHEQxBt2tniKXvMZ8rCzWbDqxtGdQFq3c/b0TtJnmTHn4cWe1Vk2bW9FVaHoBEorSi9YHsGzgZSLh6VQIz2IJL+xzzb1uWEvabcFaOhAKaL9zjZNSTNbQ6XES/An8HkKEkxdFkL6hpcBPmsodxPCP8HhOD+LdOKuTE/0FOkNRrTszDI9RpgwQ=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(6133799003)(261026135527099003)(18002099003)(22082099003)(261026140227099003)(261028144727099003)(261026130827099003)(261009220027099003)(56012099006)(261021133027099003)(261009223027099003)(261009223327099003)(261021121427099003)(261009221227099003)(261021130227099003)(261021123027099003)(10067099003)(261022113327099003)(261022105027099003)(261021135927099003)(261022075727099003)(261009221727099003)(261022115727099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4Nni3X1kGqrpG/o/m/IuW72g4pP/RB7/q1x8rzBKo4/qcG10zMy0FhiDXt2lT5NGfJC9d17Z5WgdpDnLG4SFEZ3Uuvf7brgjwbEUponYwp7j+mcgYZul1jNGnRon3VDpd8rfDuBRbSy9LrwvEfHHiot0bdOIXv4RTpyQ3ebptBUbtiMNhh2q9pABnrZOLD9SrWw/UH9LrPBVFrW2Od8H4Ri4vAzvpy0mRKtDWXW3DxbgjGjU3DwIyBs9YkMEK2EamLywzFd1hqtYjZ12CKKAoSlBnBpmhFCUzZQeFOYiAKGzAiC7A5i7V4i6JqtpfDSQoR2UKAbYSm6F2cMYvwCIfAithw1JA6Ahj75j3h4agyGmvYN7Hfcr1lQjgrI7ti/DHxJirxkToCeQAUNOEc0QhG5d9l0aaAdCecESKMA1Y18zKDCXGk19qNH0tnhFGivP
X-Exchange-RoutingPolicyChecked:
	VsxCEs3AsF5KkBlEIEUwHmy5aXeInX1Gvq/QCnQnNXRhxd19rUmCxUHBVTJy9tJ8WPUzIcdDB8qcz0AiL0wHbVvY6JGVOmnLCIpjTqtXy43CcRIeI7XcEBRM/EC8ZNem04XIyEh6Ns6SGm/7aaLZYTxo38KOJ58iJi8FQa/X1YeAEygFbIv8csAHyM3cGpbi+B7ydDpDv5KkX6s6iUxCg4o5OkZ34f5Q2/T5qp4sBH2bVkTN1AuEEmB4RLAGDQX5bia2jYWQXLQdTrq1ikDZJdTsb2baBpJ2QQJLB/wwWsB+LosnnXi7jaM6MIATlc0Ct1K1irmqLPlORqXCGCL/NA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:12:40.0652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 818305b4-0d13-4160-9a1a-08df35e83839
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7316
X-Proofpoint-ORIG-GUID: uKP43EM8IZL4zsuzjU-kwSYBl0484fP4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX+9SM+Uvnzv2z
 WvtBHoS/u7C3njheK32S6yKS+O1fIrL7fJBBBFMKdrDrUdH2bip0feMOb1PHfJqGj1IGvpr2TmL
 FH9mls4m4XTDp7dRNI7FDxJYzwBTqfJgBzl5qAql2QrHEbLHoB+3XgkLuJ7LbORCsX0nXik4Cui
 nMkIVMrmgBRjJ+XEp7Jvd19LUz2dc+hWD2akU6hNA0/1RCKq1WFuTg3kfNH1Gh4PrrYzCdO5eQp
 GxFrqGt3BGJXm9YPMKto3hLtxjsQclgv/AUKaf5ZerNbb/YgR292wbnOyZG4hAOkBbmApKjtJnq
 214apmy4ax5coY2iZhcpLUuyes+aVO4Q02s1sglarTf2/CZ1ma2VplJWviF2dijxDhnfrxvZLMW
 4PrS8KDblOm7GmQn7csY8H1vqwG9nA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX4UkHfD1a+Q39
 ZdX/PM664j26NiQ4YCW/2YMlQ0As0iVqdDeH88B16zim2vhr1XjbFio084HUe/wwH8NkPOL01My
 f6MsAjG2wbKOflqYx/vARScPZq5ViFA=
X-Proofpoint-GUID: uKP43EM8IZL4zsuzjU-kwSYBl0484fP4
X-Authority-Analysis: v=2.4 cv=eM2GH3p1 c=1 sm=1 tr=0 ts=6ae38c9f cx=c_pps
 a=vP0OKLXe+mBq485nSWAwQg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=ZiC-54knQkGZtKUq3l0A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610190000 definitions=main-2610290071

From: Andrew Davis <afd@ti.com>

In each TI-SCI message function we allocate a xfer struct and use
it to perform a message transfer. There is now no reason to do these
in two steps. Instead make the ti_sci_do_xfer() function do the
allocation internally. That function already does the xfer free so
it make sense to have it also do the allocation. This reduces the
complexity of all the individual message functions.

Signed-off-by: Andrew Davis <afd@ti.com>
Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v3: Changelog:
1. None to this patch.

Link to v2:
https://lore.kernel.org/all/20260930160607.2674980-9-b-padhi@ti.com/

v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-9-b-padhi@ti.com/

 drivers/firmware/ti_sci.c | 487 +++++++++++++-------------------------
 1 file changed, 170 insertions(+), 317 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 83b2d4a50788f..6d0ecb77d731e 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -305,6 +305,7 @@ static void ti_sci_rx_callback(struct mbox_client *cl, void *m)
  * @tx_message_size: transmit message size
  * @rx_message: receive message storage location
  * @rx_message_size: receive message size
+ * @caller:	Address of the command function, used in error messages
  *
  * Helper function which is used by various command functions that are
  * exposed to clients of this driver for allocating a message traffic event.
@@ -318,7 +319,8 @@ static void ti_sci_rx_callback(struct mbox_client *cl, void *m)
 static struct ti_sci_xfer *ti_sci_get_one_xfer(struct ti_sci_info *info,
 					       u16 msg_type, u32 msg_flags,
 					       void *tx_message, size_t tx_message_size,
-					       void *rx_message, size_t rx_message_size)
+					       void *rx_message, size_t rx_message_size,
+					       void *caller)
 {
 	struct ti_sci_xfers_info *minfo = &info->minfo;
 	struct device *dev = info->dev;
@@ -335,7 +337,7 @@ static struct ti_sci_xfer *ti_sci_get_one_xfer(struct ti_sci_info *info,
 	    tx_message_size > info->desc->max_msg_size ||
 	    rx_message_size < sizeof(*hdr) || tx_message_size < sizeof(*hdr)) {
 		dev_err(dev, "TI-SCI message size out of range (caller: %pS)\n",
-			(void *)_RET_IP_);
+			caller);
 		return ERR_PTR(-ERANGE);
 	}
 
@@ -348,7 +350,7 @@ static struct ti_sci_xfer *ti_sci_get_one_xfer(struct ti_sci_info *info,
 	ret = down_timeout(&minfo->sem_xfer_count, timeout);
 	if (ret < 0) {
 		dev_err(dev, "TI-SCI timeout waiting for transfer semaphore (caller: %pS)\n",
-			(void *)_RET_IP_);
+			caller);
 		return ERR_PTR(ret);
 	}
 
@@ -434,23 +436,45 @@ static inline bool ti_sci_is_response_ack(void *r)
 /**
  * ti_sci_do_xfer() - Do one transfer
  * @info:	Pointer to SCI entity information
- * @xfer:	Transfer to initiate and wait for response
+ * @msg_type:	Message type
+ * @msg_flags:	Flag to set for the message
+ * @tx_message: transmit message storage location
+ * @tx_message_size: transmit message size
+ * @rx_message: receive message storage location
+ * @rx_message_size: receive message size
  *
  * Return: -ETIMEDOUT in case of no response, or
  *         -ENODEV in case of a NACK response, or
+ *         corresponding error if xfer allocation fails, or
  *         corresponding error if transmit fails, or
  *         return 0, if all goes well.
  */
 static inline int ti_sci_do_xfer(struct ti_sci_info *info,
-				 struct ti_sci_xfer *xfer)
+				 u16 msg_type, u32 msg_flags,
+				 void *tx_message, size_t tx_message_size,
+				 void *rx_message, size_t rx_message_size)
 {
-	struct ti_sci_msg_hdr *hdr = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
-	bool response_expected = !!(hdr->flags & (TI_SCI_FLAG_REQ_ACK_ON_PROCESSED |
-						  TI_SCI_FLAG_REQ_ACK_ON_RECEIVED));
+	struct ti_sci_xfer *xfer;
+	bool response_expected = !!(msg_flags & (TI_SCI_FLAG_REQ_ACK_ON_PROCESSED |
+						 TI_SCI_FLAG_REQ_ACK_ON_RECEIVED));
 	int ret;
 	int timeout;
 	struct device *dev = info->dev;
 	bool done_state = true;
+	void *caller;
+
+	/*
+	 * Address of the TI SCI command function, used in error messages.
+	 * This is only accurate if this function is not inlined, otherwise
+	 * the caller of the command function is reported instead.
+	 */
+	caller = (void *)_RET_IP_;
+
+	xfer = ti_sci_get_one_xfer(info, msg_type, msg_flags,
+				   tx_message, tx_message_size,
+				   rx_message, rx_message_size, caller);
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
 
 	memcpy(xfer->xfer_buf + sizeof(struct ti_sci_msg_hdr),
 	       xfer->tx_buf + sizeof(struct ti_sci_msg_hdr),
@@ -458,7 +482,7 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 
 	ret = mbox_send_message(info->chan_tx, &xfer->tx_message);
 	if (ret < 0) {
-		dev_err(dev, "Mbox send fail %d (caller: %pS)\n", ret, (void *)_RET_IP_);
+		dev_err(dev, "Mbox send fail %d (caller: %pS)\n", ret, caller);
 		goto fail;
 	}
 
@@ -481,8 +505,7 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 	}
 
 	if (ret == -ETIMEDOUT)
-		dev_err(dev, "Mbox timedout in resp(caller: %pS)\n",
-			(void *)_RET_IP_);
+		dev_err(dev, "Mbox timedout in resp(caller: %pS)\n", caller);
 
 	/*
 	 * NOTE: we might prefer not to need the mailbox ticker to manage the
@@ -499,7 +522,7 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 	if (response_expected && ret == 0) {
 		if (!ti_sci_is_response_ack(xfer->xfer_buf)) {
 			dev_warn(dev, "Message response not acknowledged (caller: %pS)\n",
-				 (void *)_RET_IP_);
+				 caller);
 			ret = -ENODEV;
 		} else {
 			memcpy(xfer->rx_buf, xfer->xfer_buf, xfer->rx_len);
@@ -526,17 +549,12 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 	struct ti_sci_version_info *ver = &handle->version;
 	struct ti_sci_msg_hdr req;
 	struct ti_sci_msg_resp_version resp;
-	struct ti_sci_xfer *xfer;
 	int ret;
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_VERSION,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_VERSION,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -564,7 +582,6 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_device_state req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -574,17 +591,13 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_DEVICE_STATE,
-				   flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.id = id;
 	req.state = state;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_DEVICE_STATE,
+			     flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -609,7 +622,6 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_device_state req;
 	struct ti_sci_msg_resp_get_device_state resp;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -622,16 +634,12 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_DEVICE_STATE,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.id = id;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_DEVICE_STATE,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -900,7 +908,6 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_device_resets req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -910,17 +917,13 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_DEVICE_RESETS,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.id = id;
 	req.resets = reset_state;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_DEVICE_RESETS,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -962,7 +965,6 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_clock_state req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -972,13 +974,6 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_STATE,
-				   flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -988,7 +983,10 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 	}
 	req.request_state = state;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_CLOCK_STATE,
+			     flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -1014,7 +1012,6 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_state req;
 	struct ti_sci_msg_resp_get_clock_state resp;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1027,13 +1024,6 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_STATE,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1042,7 +1032,10 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 		req.clk_id_32 = clk_id;
 	}
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_CLOCK_STATE,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -1232,7 +1225,6 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_clock_parent req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1242,13 +1234,6 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_PARENT,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1263,7 +1248,10 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 		req.parent_id_32 = parent_id;
 	}
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_CLOCK_PARENT,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -1287,7 +1275,6 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_parent req;
 	struct ti_sci_msg_resp_get_clock_parent resp;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1297,13 +1284,6 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_PARENT,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1312,7 +1292,10 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 		req.clk_id_32 = clk_id;
 	}
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_CLOCK_PARENT,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -1342,7 +1325,6 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_num_parents req;
 	struct ti_sci_msg_resp_get_clock_num_parents resp;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1352,13 +1334,6 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_NUM_CLOCK_PARENTS,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1367,7 +1342,10 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 		req.clk_id_32 = clk_id;
 	}
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_NUM_CLOCK_PARENTS,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -1406,7 +1384,6 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_query_clock_freq req;
 	struct ti_sci_msg_resp_query_clock_freq resp;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1416,13 +1393,6 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_QUERY_CLOCK_FREQ,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1434,7 +1404,10 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 	req.target_freq_hz = target_freq;
 	req.max_freq_hz = max_freq;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_QUERY_CLOCK_FREQ,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -1468,7 +1441,6 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_clock_freq req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1478,13 +1450,6 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_FREQ,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1496,7 +1461,10 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 	req.target_freq_hz = target_freq;
 	req.max_freq_hz = max_freq;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_CLOCK_FREQ,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -1520,7 +1488,6 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_freq req;
 	struct ti_sci_msg_resp_get_clock_freq resp;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1530,13 +1497,6 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_FREQ,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1545,7 +1505,10 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 		req.clk_id_32 = clk_id;
 	}
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_CLOCK_FREQ,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -1573,7 +1536,6 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_prepare_sleep req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	struct device *dev;
 	int ret = 0;
 
@@ -1585,19 +1547,15 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 	info = handle_to_ti_sci_info(handle);
 	dev = info->dev;
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PREPARE_SLEEP,
-				   msg_flags,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.mode = mode;
 	req.ctx_lo = ctx_lo;
 	req.ctx_hi = ctx_hi;
 	req.debug_flags = debug_flags;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_PREPARE_SLEEP,
+			     msg_flags,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret) {
 		dev_err(dev, "Failed to prepare sleep\n");
 		return ret;
@@ -1621,7 +1579,6 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 					u64 *fw_caps)
 {
 	struct ti_sci_info *info;
-	struct ti_sci_xfer *xfer;
 	struct ti_sci_msg_hdr req;
 	struct ti_sci_msg_resp_query_fw_caps resp;
 	struct device *dev;
@@ -1635,14 +1592,10 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 	info = handle_to_ti_sci_info(handle);
 	dev = info->dev;
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_QUERY_FW_CAPS,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_QUERY_FW_CAPS,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret) {
 		dev_err(dev, "Failed to get capabilities\n");
 		return ret;
@@ -1667,7 +1620,6 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_io_isolation req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	struct device *dev;
 	int ret = 0;
 
@@ -1679,16 +1631,12 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 	info = handle_to_ti_sci_info(handle);
 	dev = info->dev;
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_IO_ISOLATION,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.state = state;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_IO_ISOLATION,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret) {
 		dev_err(dev, "Failed to set IO isolation\n");
 		return ret;
@@ -1711,7 +1659,6 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 					  u32 *source, u64 *timestamp, u8 *pin, u8 *mode)
 {
 	struct ti_sci_info *info;
-	struct ti_sci_xfer *xfer;
 	struct ti_sci_msg_hdr req;
 	struct ti_sci_msg_resp_lpm_wake_reason resp;
 	struct device *dev;
@@ -1725,14 +1672,10 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 	info = handle_to_ti_sci_info(handle);
 	dev = info->dev;
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_WAKE_REASON,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_LPM_WAKE_REASON,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret) {
 		dev_err(dev, "Failed to get wake reason\n");
 		return ret;
@@ -1764,7 +1707,6 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_lpm_set_device_constraint req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	struct device *dev;
 	int ret = 0;
 
@@ -1776,17 +1718,13 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 	info = handle_to_ti_sci_info(handle);
 	dev = info->dev;
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.id = id;
 	req.state = state;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret) {
 		dev_err(dev, "Failed to set device constraint\n");
 		return ret;
@@ -1809,7 +1747,6 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_lpm_set_latency_constraint req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	struct device *dev;
 	int ret = 0;
 
@@ -1821,17 +1758,13 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 	info = handle_to_ti_sci_info(handle);
 	dev = info->dev;
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.latency = latency;
 	req.state = state;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret) {
 		dev_err(dev, "Failed to set device constraint\n");
 		return ret;
@@ -1851,17 +1784,12 @@ static int ti_sci_cmd_lpm_abort(struct device *dev)
 	struct ti_sci_info *info = dev_get_drvdata(dev);
 	struct ti_sci_msg_hdr req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_ABORT,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_LPM_ABORT,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -1873,7 +1801,6 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_reboot req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1883,14 +1810,10 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SYS_RESET,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SYS_RESET,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -1917,7 +1840,6 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_resp_get_resource_range resp;
 	struct ti_sci_msg_req_get_resource_range req;
-	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
 
@@ -1928,18 +1850,14 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_RESOURCE_RANGE,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.secondary_host = s_host;
 	req.type = dev_id & MSG_RM_RESOURCE_TYPE_MASK;
 	req.subtype = subtype & MSG_RM_RESOURCE_SUBTYPE_MASK;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_RESOURCE_RANGE,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -2025,7 +1943,6 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_req_manage_irq req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
 
@@ -2036,12 +1953,6 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, type, TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.valid_params = valid_params;
 	req.src_id = src_id;
 	req.src_index = src_index;
@@ -2053,7 +1964,9 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 	req.vint_status_bit = vint_status_bit;
 	req.secondary_host = s_host;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, type, TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -2337,7 +2250,6 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_rm_ring_cfg_req req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
 
@@ -2346,13 +2258,6 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_RING_CFG,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.valid_params = params->valid_params;
 	req.nav_id = params->nav_id;
 	req.index = params->index;
@@ -2365,7 +2270,10 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 	req.virtid = params->virtid;
 	req.asel = params->asel;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_RM_RING_CFG,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -2387,7 +2295,6 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_psil_pair req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
 
@@ -2398,18 +2305,14 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_PSIL_PAIR,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.nav_id = nav_id;
 	req.src_thread = src_thread;
 	req.dst_thread = dst_thread;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_RM_PSIL_PAIR,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -2431,7 +2334,6 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_psil_unpair req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
 
@@ -2442,18 +2344,14 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_PSIL_UNPAIR,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.nav_id = nav_id;
 	req.src_thread = src_thread;
 	req.dst_thread = dst_thread;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_RM_PSIL_UNPAIR,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -2476,7 +2374,6 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_rm_udmap_tx_ch_cfg_req req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
 
@@ -2485,13 +2382,6 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_TX_CH_CFG,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.valid_params = params->valid_params;
 	req.nav_id = params->nav_id;
 	req.index = params->index;
@@ -2513,7 +2403,10 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 	req.tx_tdtype = params->tx_tdtype;
 	req.extended_ch_type = params->extended_ch_type;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TISCI_MSG_RM_UDMAP_TX_CH_CFG,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -2536,7 +2429,6 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_rm_udmap_rx_ch_cfg_req req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
 
@@ -2545,13 +2437,6 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_RX_CH_CFG,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.valid_params = params->valid_params;
 	req.nav_id = params->nav_id;
 	req.index = params->index;
@@ -2570,7 +2455,10 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 	req.rx_ignore_long = params->rx_ignore_long;
 	req.rx_burst_size = params->rx_burst_size;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TISCI_MSG_RM_UDMAP_RX_CH_CFG,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -2593,7 +2481,6 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_rm_udmap_flow_cfg_req req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
 
@@ -2602,13 +2489,6 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_FLOW_CFG,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.valid_params = params->valid_params;
 	req.nav_id = params->nav_id;
 	req.flow_index = params->flow_index;
@@ -2632,7 +2512,10 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 	req.rx_fdq3_qnum = params->rx_fdq3_qnum;
 	req.rx_ps_location = params->rx_ps_location;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TISCI_MSG_RM_UDMAP_FLOW_CFG,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -2652,7 +2535,6 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_proc_request req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (!handle)
@@ -2662,16 +2544,12 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_REQUEST,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.processor_id = proc_id;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_PROC_REQUEST,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -2691,7 +2569,6 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_proc_release req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (!handle)
@@ -2701,16 +2578,12 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_RELEASE,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.processor_id = proc_id;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_PROC_RELEASE,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -2733,7 +2606,6 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_proc_handover req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (!handle)
@@ -2743,17 +2615,13 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_HANDOVER,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.processor_id = proc_id;
 	req.host_id = host_id;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_PROC_HANDOVER,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -2779,7 +2647,6 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_set_config req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (!handle)
@@ -2789,13 +2656,6 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CONFIG,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.processor_id = proc_id;
 	req.bootvector_low = bootvector & TI_SCI_ADDR_LOW_MASK;
 	req.bootvector_high = (bootvector & TI_SCI_ADDR_HIGH_MASK) >>
@@ -2803,7 +2663,10 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 	req.config_flags_set = config_flags_set;
 	req.config_flags_clear = config_flags_clear;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_CONFIG,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -2827,7 +2690,6 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_set_ctrl req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (!handle)
@@ -2837,18 +2699,14 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CTRL,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.processor_id = proc_id;
 	req.control_flags_set = control_flags_set;
 	req.control_flags_clear = control_flags_clear;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_CTRL,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
@@ -2873,7 +2731,6 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_resp_get_status resp;
 	struct ti_sci_msg_req_get_status req;
 	struct ti_sci_info *info;
-	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	if (!handle)
@@ -2883,16 +2740,12 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 
 	info = handle_to_ti_sci_info(handle);
 
-	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_STATUS,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   &req, sizeof(req),
-				   &resp, sizeof(resp));
-	if (IS_ERR(xfer))
-		return PTR_ERR(xfer);
-
 	req.processor_id = proc_id;
 
-	ret = ti_sci_do_xfer(info, xfer);
+	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_STATUS,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
-- 
2.34.1

