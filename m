Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AD6549397
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713147; cv=fail; b=ictIR+jdYYqcMQ7MOP0TDe3i+CRcOp+ybSBZEfG53dtatqm+0U6p7ngONBX/095PAhfRb9agwIweoCWc0sZ+fsbXpyw+CVNWhOvSRsd+wRR3lLmlQsgjcgiuarEwpI88aoBrbm6bQbP3GnX81b1n8JOPIKY42V3R5LAo89FGY8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713147; c=relaxed/simple;
	bh=IXgX/p4R6U43F2kjsv2bJKkp2TcHLVRNZiVDw/gw2Xs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kq6QVNNPvHZ4JGFzrXnzIguLnyzEXLZZ01Dfm0M2WCeIxSPKC1SWtZEQZv57iwu0D9IIiKlSbZz8r4/6VMJFsPwj7FmWal/p53RplDptD1OfP2E+Cn/bAsicEqaq/9u/52/hmriPFzsCEG8coMFo3koEESsFhq8D9PwX3oHIo04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Vde2osGN; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=nJSybF14; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Vde2osGN";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="nJSybF14"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68TFer1w807503;
	Tue, 29 Sep 2026 15:18:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=CaqfoabwVVKTPq9d20C+FUk0YNu4BAxPNS9SXgzcQ
	wo=; b=Vde2osGNtgcFWv/z9P7PBU/7zXAH36IwUpvlqJM2KWrIiUtrQESg9Ky6c
	AA0DJV31v20dtu63GEu8wjVB3Co8dosDBXEHnoaoXjE7mdyGzW3G06Zi5XedbmC1
	Mbsy/syVqriS7rmzdPOqdyGPW3zxB+sN7+lWd6cR8+lzKd/csIWvlMdGwjFwMrKK
	NDiay98VXL+xP6ruwq92SYDNQhr45ysCdrZBVIEkOiEOx7BnIJ4NjUV5kP7JfMm/
	hd5cNCeNME3I5YYXftGRpiK1rx0pU2fpiyDk56aMkNHQhs4wDdE2fEAvIc9dfRvc
	MmGesj9BSaPR1mXZLK6mf6huIzHVw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013036.outbound.protection.outlook.com [40.93.201.36])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h02j6ej0t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 15:18:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMkwpfR3cZeyKL95/oOQcPf4tAZWLKfzw8tnzI5Swrgumvv/Hj+sSoeOQbZ+C9DxuTLtULMmNPSppfL8f72lCX9CDabjLEn8Xha7uiiV0x0cRAUeLUvcEIlt7yc90tcWkqDI5KbZQsac5hLJOqXQOZq9/6EJnsiz9pnBJGn14/rhlcFSR9Z64Kq6cLf2tvtZnUjyIPPmR8s5vMiGSULpViR7QEWLpa2pj9l4NGFyZFVGPdR7RjmLFH7L5sH9/kSV87y9rwVXZLzjjjOqM28vjFP0ruKr3LhxO7kqcHg0R2Mwb2aPaFO3ZTGIVOBBZBUvBC0p0/xTfxTkWHTgsAjLZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CaqfoabwVVKTPq9d20C+FUk0YNu4BAxPNS9SXgzcQwo=;
 b=Shd3A+x2X3J2L2/Argl2MsN04rgPavZImkUQEZoUpdhPs/kfqPPP/8MIOegiWqlCKJZ/q6DASVBEx9rjHtfBxa3Zsr9k1XVA+DliuzHHYWtmHl3p3VI8zFKx1ROYds7/53+wsqP13vgAyCIQJUKAbKvXlRBANVQLrQPHZVBigyyF5A5WL0p1hFz3xaoX9I3ZP+iPbX75M7HtCjB/LarQsQxufq5aUFimCWDBtH77jaKOq5EqKuwXmhwP9kIBFuJAENCo1SeZJqrzCbWbqKMZtC4bbVPFLCPrwEx0hVgCVVjAIkeY5m0ZS4Iw2pKKkoweI7VcCXqGCPOPsb3BVONFHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CaqfoabwVVKTPq9d20C+FUk0YNu4BAxPNS9SXgzcQwo=;
 b=nJSybF14qai7k+VeEpHJMF5L0aS6ljdyGf9oeQYMvVzp30i2CwW5asEt4nRAvs2O7b71MpQ1UfYERH/SDtG82OzZ/c84HDN7/ocxaGSpVl+Px+42vbpOMa34IzfKHnXO2QKrUZ/ynxYSfBdqtk4GMcXBcBoJC8XQ9wHQvGre3Zo=
Received: from CH2PR15CA0003.namprd15.prod.outlook.com (2603:10b6:610:51::13)
 by IA0PR10MB7641.namprd10.prod.outlook.com (2603:10b6:208:484::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Tue, 29 Sep
 2026 20:18:44 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::5f) by CH2PR15CA0003.outlook.office365.com
 (2603:10b6:610:51::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Tue,
 29 Sep 2026 20:18:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 20:18:44 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:27 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 15:18:27 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TKHlMk1688208;
	Tue, 29 Sep 2026 15:18:25 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH 12/22] firmware: ti_sci: Fix some kernel-doc references in structs
Date: Wed, 30 Sep 2026 01:47:36 +0530
Message-ID: <20260929201746.4078803-13-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|IA0PR10MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ceeb65a-2cb3-4d70-3f40-08df1e66dc4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|6133799003|22082099003|10067099003|18002099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	zz0pe7KaAs6xz+J5qSlzYRmqDh2bCXUqYZu+O9oKTdKrox8vypnhoSQFUbcpfVvR986LCZtDHMYNwuQoIKOieqw/HRZnLFXRQXv1lDNmlWRPCFlMzTuaLULY1EIgnjHAec68kRas1BWRadkvj1/zNxxXKk+XrI46O5/N+vNDauykjEM4foU8jWnKhCunGy90hJ1vOvT0gTSktWGmTagfj4CaPqRBniEeO+IUJeD4TqkrtHabyaxhYGR76a7XkY95G3hPQu0poy+E8BFcENE91kw85vFSM1/mkQOp+dmTQ4LajMYON2G3r4kauzFhLoaa60pYq+C1zAzz4BcpFm526SeUx5UVSC0oTvTyP4y8EajGsi/7QOkxT9mF1A9/+10OfCroGd6bTcTnKS4rML4zVF3//YIpNfQ6dFskziCFQSwFb29kzvOpwyzZEiYYfy6V5jMTQzSHKiP5YoFU6CsUyyi0w3PcPQKODh1/xprH4QLc0Kox+7aI7ZlK0g4np53+mHFrKjxEManWhy7HkIyvkRhSZofqNhjxYQe3zih1WZiBNo5I597FeyJnQlN5cGH8JZNhZK7U/rAE7nN5IHHkjrDPdwYWeK2fMhOd8C6R29MBEyJOskk3Xln/VxYv0lM83PkhLZrE84PKdCtks4TgMqhyf9WCnqoE65GmPtXuccs2vzPjou8zY6UolAE6JqC8odX1x2B6B0TfZs0eA4hXwg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(6133799003)(22082099003)(10067099003)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TWYGy7xJHKKqzeYWVv3yh0uyQ0/G3QCpofDQQenQfuITiP+xkAASVqx133IEV170VDx3RQpGqsb4KQFNpzwzHoRGeePtdjDz4P13kynYM/sW7/au5icedflWVkSMD2c8jBVnKu+zkcdK37ryPIewnE+JmLztqAr6r6bujg2SJ8MVBLzar9ibme+8vfGhaknbePmo9R+0K92m5grSmr5nE8M5v1RohYxmY5aE6UshCtaZ1m4C1fVyBz8v1I3JhDlxISC7U1NM5+ctovTlODzOeG/OYTnMEoppDgecoFDptwXgz9ruRpzUm9nxWPIb4PRx2FWlmdnpVFEglD8/uhjkK9vzChvDdf7lNN/fwox2egXHfGKDEezrpo0bgt8AxSPwggacHPIdZcM5kFeb8ESnpK5TUSY1UpOYlhMs6kVI33SXTX4xUz61pGd8qHcFQEiE
X-Exchange-RoutingPolicyChecked:
	dIGHhK7V1M6mvMRy/alo/WpTSBQDMCqQi5ZViAAAxRsCcWBW3jhXIlY+l4DLaZ+Sv5naWVCroLXX+UXrgrnLEU2JhHazSuQ18CZFgrUPSXlz7ZCcWfaYi/66Vbvf0tC0kbQpdMPwiick7skhvzIGgO69nmvvqW/JccYaJ8t/eFvz7c8QjSxARrUSYNNalYX7gDum9u5xeZGY3j3ZfZWwrKTgEcRAWhfc3b8gayHdH4ZcXXcnWQVZ+Flui3+YKPAXvaz1Km8A9oEXtkt5F0dexprKOkMSFXK+CQU/oDi7pPC0s5NyJLTuxm2HuNbSvV21fRvwiTMWa8dWnxcAihPNEQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:18:44.0617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ceeb65a-2cb3-4d70-3f40-08df1e66dc4e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7641
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX5msb4uGHVae6
 9DaE4P335Xx5AIa0h2MXID8SJGRf1A5QvpRiECiuqTgzaA74oKNWdW5lyHfIeFCK97ycs2QrJDU
 ccJ5YZc4x5UdL4oIkQeyp5APF56dR5Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX6hMt/KfsIdM2
 S/DSqA3A1t8E194T5HIX61y75JHplmG6HtieV8r/uSzLVkQ8vm+3IrkNRhrerHRXaapBT7FlM3E
 BTKYpKefkGW4oaiTr0NYlCW3SgDCKrYAh0fX1jpZazGJjteUOHlH/LrPWP5SlzDziygLY8e7DeX
 zyz6EHAeL7NX+UyFhN5zNythmLbQNOzTg9GiokxwOuaOPOCFc8NA/mBF9J3xPXwOgRWIlj8Om+W
 vIptcQGXzNm2ttUzMzBUJVD9Z3pYxJrYT4eAGQp9ru+7RFlud46U3G1YoUJg4C12dSUV/W/Lnov
 L1se4CAIhk7jc4Ms5MbXXZqFdmLlbaiMOmgKNq/PoV6VUhSwpI1rV2CwpLz5EY02kt6xoUh09mz
 dAv27qMWszliBUiVf2KktzVawUHAwP+I4MtqGXk1TgVXgH7HXN5Bmw28WjoCjF136TdUFKlK+Dn
 NouuQVOj6KYhX6SJkPA==
X-Authority-Analysis: v=2.4 cv=Z4p5j3RA c=1 sm=1 tr=0 ts=6abc1d2b cx=c_pps
 a=5gC0q5i1d38FX/YauR05nw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=GOjBpkPxkVgeuWNzjYAA:9
X-Proofpoint-GUID: AJbu_1O2R-LTy048Ldj7M1i8B13rQWeX
X-Proofpoint-ORIG-GUID: AJbu_1O2R-LTy048Ldj7M1i8B13rQWeX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290080

The valid_params descriptions of the RM ring and UDMAP tx/rx channel
and rx flow config messages refer to struct members through structs
that do not exist, the wrong struct, or syntax that kernel-doc does not
understand. Refer to the members of the struct being documented directly
instead.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/firmware/ti_sci.h | 126 +++++++++++++++++++-------------------
 1 file changed, 63 insertions(+), 63 deletions(-)

diff --git a/drivers/firmware/ti_sci.h b/drivers/firmware/ti_sci.h
index 8fccbcd1c9a2c..34f7848073a0e 100644
--- a/drivers/firmware/ti_sci.h
+++ b/drivers/firmware/ti_sci.h
@@ -813,14 +813,14 @@ struct ti_sci_msg_req_manage_irq {
  *	The ring configuration fields are not valid, and will not be used for
  *	ring configuration, if their corresponding valid bit is zero.
  *	Valid bit usage:
- *	0 - Valid bit for @tisci_msg_rm_ring_cfg_req addr_lo
- *	1 - Valid bit for @tisci_msg_rm_ring_cfg_req addr_hi
- *	2 - Valid bit for @tisci_msg_rm_ring_cfg_req count
- *	3 - Valid bit for @tisci_msg_rm_ring_cfg_req mode
- *	4 - Valid bit for @tisci_msg_rm_ring_cfg_req size
- *	5 - Valid bit for @tisci_msg_rm_ring_cfg_req order_id
- *	6 - Valid bit for @tisci_msg_rm_ring_cfg_req virtid
- *	7 - Valid bit for @tisci_msg_rm_ring_cfg_req ASEL
+ *	0 - Valid bit for @addr_lo
+ *	1 - Valid bit for @addr_hi
+ *	2 - Valid bit for @count
+ *	3 - Valid bit for @mode
+ *	4 - Valid bit for @size
+ *	5 - Valid bit for @order_id
+ *	6 - Valid bit for @virtid
+ *	7 - Valid bit for @asel
  * @nav_id: Device ID of Navigator Subsystem from which the ring is allocated
  * @index: ring index to be configured.
  * @addr_lo: 32 LSBs of ring base address to be programmed into the ring's
@@ -1023,23 +1023,23 @@ struct rm_ti_sci_msg_udmap_rx_flow_opt_cfg {
  * parameters. The tx channel configuration fields are not valid, and will not
  * be used for ch configuration, if their corresponding valid bit is zero.
  * Valid bit usage:
- *    0 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_pause_on_err
- *    1 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_atype
- *    2 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_chan_type
- *    3 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_fetch_size
- *    4 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::txcq_qnum
- *    5 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_priority
- *    6 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_qos
- *    7 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_orderid
- *    8 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_sched_priority
- *    9 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_filt_einfo
- *   10 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_filt_pswords
- *   11 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_supr_tdpkt
- *   12 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_credit_count
- *   13 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::fdepth
- *   14 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_burst_size
- *   15 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_tdtype
- *   16 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::extended_ch_type
+ *    0 - Valid bit for @tx_pause_on_err
+ *    1 - Valid bit for @tx_atype
+ *    2 - Valid bit for @tx_chan_type
+ *    3 - Valid bit for @tx_fetch_size
+ *    4 - Valid bit for @txcq_qnum
+ *    5 - Valid bit for @tx_priority
+ *    6 - Valid bit for @tx_qos
+ *    7 - Valid bit for @tx_orderid
+ *    8 - Valid bit for @tx_sched_priority
+ *    9 - Valid bit for @tx_filt_einfo
+ *   10 - Valid bit for @tx_filt_pswords
+ *   11 - Valid bit for @tx_supr_tdpkt
+ *   12 - Valid bit for @tx_credit_count
+ *   13 - Valid bit for @fdepth
+ *   14 - Valid bit for @tx_burst_size
+ *   15 - Valid bit for @tx_tdtype
+ *   16 - Valid bit for @extended_ch_type
  *
  * @nav_id: SoC device ID of Navigator Subsystem where tx channel is located
  *
@@ -1153,20 +1153,20 @@ struct ti_sci_msg_rm_udmap_tx_ch_cfg_req {
  * The rx channel configuration fields are not valid, and will not be used for
  * ch configuration, if their corresponding valid bit is zero.
  * Valid bit usage:
- *    0 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_pause_on_err
- *    1 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_atype
- *    2 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_chan_type
- *    3 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_fetch_size
- *    4 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rxcq_qnum
- *    5 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_priority
- *    6 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_qos
- *    7 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_orderid
- *    8 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_sched_priority
- *    9 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::flowid_start
- *   10 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::flowid_cnt
- *   11 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_ignore_short
- *   12 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_ignore_long
- *   14 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_burst_size
+ *    0 - Valid bit for @rx_pause_on_err
+ *    1 - Valid bit for @rx_atype
+ *    2 - Valid bit for @rx_chan_type
+ *    3 - Valid bit for @rx_fetch_size
+ *    4 - Valid bit for @rxcq_qnum
+ *    5 - Valid bit for @rx_priority
+ *    6 - Valid bit for @rx_qos
+ *    7 - Valid bit for @rx_orderid
+ *    8 - Valid bit for @rx_sched_priority
+ *    9 - Valid bit for @flowid_start
+ *   10 - Valid bit for @flowid_cnt
+ *   11 - Valid bit for @rx_ignore_short
+ *   12 - Valid bit for @rx_ignore_long
+ *   14 - Valid bit for @rx_burst_size
  *
  * @nav_id: SoC device ID of Navigator Subsystem where rx channel is located
  *
@@ -1197,9 +1197,9 @@ struct ti_sci_msg_rm_udmap_tx_ch_cfg_req {
  * @flowid_start: UDMAP receive channel additional flows starting index
  * configuration to program into the flow_start field of the RCHAN_RFLOW_RNG
  * register. Specifies the starting index for flow IDs the receive channel is to
- * make use of beyond the default flow. flowid_start and @ref flowid_cnt must be
+ * make use of beyond the default flow. flowid_start and @flowid_cnt must be
  * set as valid and configured together. The starting flow ID set by
- * @ref flowid_cnt must be a flow index within the Navigator Subsystem's subset
+ * @flowid_start must be a flow index within the Navigator Subsystem's subset
  * of flows beyond the default flows statically mapped to receive channels.
  * The additional flows must be assigned to the host, or a subordinate of the
  * host, requesting configuration of the receive channel.
@@ -1207,10 +1207,10 @@ struct ti_sci_msg_rm_udmap_tx_ch_cfg_req {
  * @flowid_cnt: UDMAP receive channel additional flows count configuration to
  * program into the flowid_cnt field of the RCHAN_RFLOW_RNG register.
  * This field specifies how many flow IDs are in the additional contiguous range
- * of legal flow IDs for the channel.  @ref flowid_start and flowid_cnt must be
+ * of legal flow IDs for the channel.  @flowid_start and flowid_cnt must be
  * set as valid and configured together. Disabling the valid_params field bit
  * for flowid_cnt indicates no flow IDs other than the default are to be
- * allocated and used by the receive channel. @ref flowid_start plus flowid_cnt
+ * allocated and used by the receive channel. @flowid_start plus flowid_cnt
  * cannot be greater than the number of receive flows in the receive channel's
  * Navigator Subsystem.  The additional flows must be assigned to the host, or a
  * subordinate of the host, requesting configuration of the receive channel.
@@ -1274,25 +1274,25 @@ struct ti_sci_msg_rm_udmap_rx_ch_cfg_req {
  * Bitfield defining validity of rx flow configuration parameters.  The
  * rx flow configuration fields are not valid, and will not be used for flow
  * configuration, if their corresponding valid bit is zero.  Valid bit usage:
- *     0 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_einfo_present
- *     1 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_psinfo_present
- *     2 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_error_handling
- *     3 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_desc_type
- *     4 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_sop_offset
- *     5 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_dest_qnum
- *     6 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_src_tag_hi
- *     7 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_src_tag_lo
- *     8 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_dest_tag_hi
- *     9 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_dest_tag_lo
- *    10 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_src_tag_hi_sel
- *    11 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_src_tag_lo_sel
- *    12 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_dest_tag_hi_sel
- *    13 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_dest_tag_lo_sel
- *    14 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_fdq0_sz0_qnum
- *    15 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_fdq1_sz0_qnum
- *    16 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_fdq2_sz0_qnum
- *    17 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_fdq3_sz0_qnum
- *    18 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_ps_location
+ *     0 - Valid bit for @rx_einfo_present
+ *     1 - Valid bit for @rx_psinfo_present
+ *     2 - Valid bit for @rx_error_handling
+ *     3 - Valid bit for @rx_desc_type
+ *     4 - Valid bit for @rx_sop_offset
+ *     5 - Valid bit for @rx_dest_qnum
+ *     6 - Valid bit for @rx_src_tag_hi
+ *     7 - Valid bit for @rx_src_tag_lo
+ *     8 - Valid bit for @rx_dest_tag_hi
+ *     9 - Valid bit for @rx_dest_tag_lo
+ *    10 - Valid bit for @rx_src_tag_hi_sel
+ *    11 - Valid bit for @rx_src_tag_lo_sel
+ *    12 - Valid bit for @rx_dest_tag_hi_sel
+ *    13 - Valid bit for @rx_dest_tag_lo_sel
+ *    14 - Valid bit for @rx_fdq0_sz0_qnum
+ *    15 - Valid bit for @rx_fdq1_qnum
+ *    16 - Valid bit for @rx_fdq2_qnum
+ *    17 - Valid bit for @rx_fdq3_qnum
+ *    18 - Valid bit for @rx_ps_location
  *
  * @nav_id: SoC device ID of Navigator Subsystem from which the receive flow is
  * allocated
@@ -1313,7 +1313,7 @@ struct ti_sci_msg_rm_udmap_rx_ch_cfg_req {
  *
  * @rx_desc_type:
  * UDMAP receive flow descriptor type configuration to be programmed into the
- * rx_desc_type field field of the flow's RFLOW_RFA register.
+ * rx_desc_type field of the flow's RFLOW_RFA register.
  *
  * @rx_sop_offset:
  * UDMAP receive flow start of packet offset configuration to be programmed
-- 
2.34.1

