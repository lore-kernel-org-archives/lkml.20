Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794474695;
	b=yVE+DRzgqYGqqp7DrnEtGX6CQweb2V2cN0UxvUV1nRfFx8/Zr6HdDByGAzaShNvVvY6x
	 c3KiJ+uq0R6G2nr0Rau4KSk/XnWfGxllLZTPqeSFlxz3rtIlbTfAf3Aw6FTq6MYyR/0Zc
	 Rrq6/3ynlZzO5Y7HNrRpifhwgml1Hp5oLD6XTUliRwt6ya8CoY/Pvylhy7MrYiaKRO0tJ
	 liwsqUVMPjsHKmbiYVg5YXAqDJZ8+DTBvaeg06a+AT51ql3hKqbgwAaqhXRNqyUTSHL0j
	 Zq8f6X2ImbgUxQ4Wf5KeOPYAdBwEZca/BZty++kN/15UYzbkiBvrtM/JJLoF75bi1GA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474695;
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
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ToJRzkJRAttHjc8pRps2NAIvRLJhJGT2hRq4VQdTW04=;
	b=bPE8XB9dCua8gyrLwtpzZvm8HXCm1oW/LnXmvoaRlB9KhnmXq7ns5pFLCs7bqrZnkJ8R
	 vjvxf7R81W2q1ODir3ROrmNBzBk6/vWe4KCM0OEP0BD1IPIR1Hqk2QouVVOkmMsuYehOr
	 IToAK/usgNHFotu7tQbYC//CQnGOj1rb2D/V12x87UqZPFuy3dkSG/f0QCx57zn8t4bXz
	 bkD59E9dxJVhFU6zL3ZQ6CTWSm1NGwMXvmTcFjeLMX+h0fY5wXN2Ho6gC26Rw8C7iknDw
	 zPOwukaTFOgE7TG4gL6e6n0iCQOKviiRyTV4hOI7q1pu4dGtLjDE+c/FAmM/E90WrCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b="Hp66YW/n";
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b="TU35ugw/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCAB606A31C;
	Thu, 12 Nov 2026 09:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CCAB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=Hp66YW/n;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=TU35ugw/
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AC5iq152297467;
	Thu, 12 Nov 2026 03:11:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ToJRzkJRAttHjc8pRps2NAIvRLJhJGT2hRq4VQdTW
	04=; b=Hp66YW/nRr8wIgVhjIWOOvyW+YnaE3hK+amLrdBpJk51brv+aN+8GL51M
	l8I1E/sSegoXX21i+R1qP8ejEdSWAr5PARCNCrcD6+E0eRQfK3ut6qzCf8j36sgl
	QfSZ/PYBsGZIovKNj5ef9EQeOYzU7BB2rh/ZAAIH/QTRAGL4g6LA1V+MAUmVQyKT
	PVmvM+D7eUqhILLjv9O0zsrdtAMOY6J8J8r3uK9esJgURMfGScwyE/Aq9Lz5Va5q
	HocUWgIy67HkiO6kAvEE8yazlPLS683+PfbaCNatDJZ+p9eeXASZVpRSkgzY5OAU
	kjWF+RVw3j80IJq+YR4QItJ/DNt+A==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013042.outbound.protection.outlook.com [40.93.196.42])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hw7k496ta-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 03:11:27 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DW6hKFoODFzOeW0qW9bH68roWhEcIOXZtjIDQfKBQhxjSoPii9NVdIfRHJNn8zpAgjVjmFoGWeGmCbGlALvHPLmFA7vKJrsRmNHB0mm35S5T6QUniRevEjN11/fiIHeRXdBTj2+L2UkLFGnm+IS0/PS/ae4Ne3M9YG32INySJbzevCjK7Ipur3S4kx5w0ZajhDDvpTLvN9k0Ei4ysfcRVKwhrmn5uZawBlvsu2GqUi1vLqnytoPjoccblzTqaGc7G5roEHrW2p135G0ipH8cb+cHesAPZ9D/MEi+pEcShXrq4HkhvzXMEeonTWVdLVTJQpQYbJE12DyJiwwYIkys9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToJRzkJRAttHjc8pRps2NAIvRLJhJGT2hRq4VQdTW04=;
 b=h53pz7mXMs/kDB5uQ4zkhZijS4nsnh6TlH2R556Bv5edoFgteKiRJdFJLEumbRFjxqkhPTZkUjYdUcH8k5jRwqVSy0ZxeWYlYA+iV8YKbg5XO38Gm7DJDS3XZbzoAWoiSr3vRHRwAXmC286WcGW5nbJqFN3vRGU94efzgQWOGGTG/U93jiI2Oo7uZV6nWhuSdkaDSBZ072qNv2J4BV2cDatIN9oBurmkDkW90mrtCf/LIdPNt9LUivEbdR3VxFAQn1+PGVvK4h7d0q05XoFDHqwQWxVvK6BmWpRe5oxlhxkfPNQId2Lm3O0adq//MzoSWTFyh/oZllWR6N/M8DzY0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToJRzkJRAttHjc8pRps2NAIvRLJhJGT2hRq4VQdTW04=;
 b=TU35ugw/yedxjOoxB/UV6OJRDE0jALRBEzlOk7W3aw29S/PE6Llc8quFDJgPh5/yI1Ek00BttlokhPFWiophOdgzYQwmqgiNH5/RT+AlfNLl9zDpzDlqmT6TFZZ2+b0yHnQzQsAzwAW4cahM4vGH+k5o3wfz5BAQ2mtkHwqGYgA=
Received: from CH2PR19CA0002.namprd19.prod.outlook.com (2603:10b6:610:4d::12)
 by DSAPR10MB857696.namprd10.prod.outlook.com (2603:10b6:8:51f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 09:11:25 +0000
Received: from BL6PEPF0006C3DF.namprd02.prod.outlook.com
 (2603:10b6:610:4d:cafe::6) by CH2PR19CA0002.outlook.office365.com
 (2603:10b6:610:4d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 09:11:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0006C3DF.mail.protection.outlook.com (10.167.249.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 09:11:22 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 03:10:44 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 03:10:44 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 12 Nov 2026 03:10:44 -0600
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AC9ARY01549289;
	Thu, 12 Nov 2026 03:10:39 -0600
From: Moteen Shah <m-shah@ti.com>
To: <conor+dt@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <nm@ti.com>, <ssantosh@kernel.org>
CC: <u-kumar1@ti.com>, <gehariprasath@ti.com>, <m-shah@ti.com>,
        <vigneshr@ti.com>, <afd@ti.com>, <a-limaye@ti.com>,
        <y-abhilashchandra@ti.com>, <johan@kernel.org>, <kees@kernel.org>,
        <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 2/4] soc: ti: k3-socinfo: Use device managed allocations and unregistration
Date: Thu, 12 Nov 2026 14:40:25 +0530
Message-ID: <20261112091027.1601122-3-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112091027.1601122-1-m-shah@ti.com>
References: <20261112091027.1601122-1-m-shah@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0006C3DF:EE_|DSAPR10MB857696:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a07939f-ff7e-4dd4-f5ca-08df409cec1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|22082099003|261009221227099003|261009223027099003|18002099003|261021121427099003|261102123227099003|261021123027099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	XYD5Q7Ti50fyO6ShJImdARp5a1xY6ILt/OFcEtgUy+9Xqk09jFQ6KNtLvpZPGrcYRpsbfpC2y6TjoV04Zq3afFmsrIT76ZhrB6BY8NU1AV57Y/sMjykm5kyMnR+6bwPYq7kMo0fbrxcZTc+u67W51KK9JWoZSyWqqP4pAlAg2iYzfzavouyBUvWylLRrcu/4Watla8prAkGkD8cjBkKXFU0IN7HfEkEemTFLiMNXMVd8C8i3CnT/ilotpza652BOTpNQ4n71i4obbMTemjkZWGG3qpE8AnaIrHirXT/0s6zmoZy05omdkaGIApbkEM86Ug5ExFenJXepYTfb1QB3Z8KZxg/r7hJrt3XztLvyq3+kXNRWyL0s5NsuH/SNffcbK8vsqjkgA/elsxUNv99KoZXsYvBIiYyJRjt5T9f/dY5TTRDIYJ5BUyrsTQwjPeKUzWEnyu7xlyR9f+8w6sTqpMPdfSTq9Ib/ilXUADNh7aglUhecekRYlCk0NjPymrrflVgbDFIz4dZmqo/L4GhrenBBsLssjTo1ugHjWI7A95oQtGXtpqKZd+0TjO4Cew5GHlj+5dNnmHP9oZKYYRgShjZ0OLF0SmNpvOV8zpnBx1mRmpUn7n/oLTT5aQGxe3FWBnEnBBDE8BzerT5WQaXhmBSsjsUmo63q7QQBlGM4GZnJ04uSYmg2wMJS8Bgh1z2GPGym0xOnvsPkX7UDvhx8Ag==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(22082099003)(261009221227099003)(261009223027099003)(18002099003)(261021121427099003)(261102123227099003)(261021123027099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	T7uOixpA19MOzOtdPKVHlY4IF9pYP0oQBxm+fTHLhMb8qQUmIB/OBmORVyVKFGxGVWR7yQXKq3Uw/XNGw2ScSmifTRi28K9zyJ5Bv26wtJw1GocKQ0v9asXFuuoJ9rUqiwrQny2L+WWo+4ZlAM34K0NMc64OGNDpOK3CC80nASeM32HB9xWvb1bfDeUBIN6ddb+tAWSkPDoMSgXF+fNGlt+OCyJUlWD5r4GzEOPtvDoRDUZ11JLzd9Lfa58RWNJOfKvpwUc9r6RaSUwiqSDqghd7iU8noUrrGE49s1S2gndNuyRfvBk6MRZJ8SvOQwML6Z5LkQeMskUG4iOQ+sYOq4JfDWAhBcK8ZuOaAYf5lHYLsmfKBdJQmhVCxpl7XpghYTKqs7P7X5D5wezANRba3zuxUVDewPaKXc4XmXNn1qAOHwlemSiYRvJQEVCDNuXR
X-Exchange-RoutingPolicyChecked:
	PZMPylJB1WFTIRfKY87RjeYh0VL6E5WaXWQy6nKaJBDCkGfj5D7V+vD+f5VJIVHh9ASUI/LVqq2QwupPfg1r5qs1pFr5ErxTvMiMPzEni5gmm2ZiPK71X/lAn4//fPOy1IT5V8GC/BvgryF9Ame4+lmA6QkKkoYzn4NZs14vplrRxyLpEDIJdaiBrLf+/EoqvRGOJxmo8ul+F54gOyVpx8QxAi9OPn4oWuzy/CGBQNs1mLhj8UQnyK/ZLxgUmVU9vo1PBsV9mkEQ4JIyKf0a4HeFxx3nTXSFH6O5jxugFkC/g+C4o8tj8RP5wrlP4Ter+uUJC4yPN73RPamOkTd5Hw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 09:11:22.9078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a07939f-ff7e-4dd4-f5ca-08df409cec1d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0006C3DF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSAPR10MB857696
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfXxDgAA4DHI4WQ
 WIqV4AjgKG/OxlUqfI8lAhUmrmrudPl2EN0w+sW85U4GxLNJE+gjM6BSodLzzxSmHlebOP6R633
 7BngLG/gTFp5kbGs8qhxJqDHrk0204Y=
X-Authority-Analysis: v=2.4 cv=fNCsTpae c=1 sm=1 tr=0 ts=6af582bf cx=c_pps
 a=BmBYDrMhH73hh332m6kGpQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=oI1EYUqv383xVCJDVaIA:9
X-Proofpoint-GUID: WdTaGFxwKTLcHx-qD0iZgHlRTMYH6oPy
X-Proofpoint-ORIG-GUID: WdTaGFxwKTLcHx-qD0iZgHlRTMYH6oPy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfXwU2S7FBwmW+b
 HgHmaNBPD3+nW1B+mu5odMbTpGxoY5RdV1mIGWKiR4lZiJ+Hg8ApydFrjvMlI7bO0dhgbe57MVh
 oXKyUj77lfHZQTv59FRLsvUHjT9JzUF/sJr+K+RAQYiHQpd7KwtOAhKWDD1dpObnRjl8hmpMZBQ
 Vuf/XH43V3NbHnJx/q+U9TdIyKxnz0/W+T9+C5Cyjw/WLMvHPAi4rrvRG15ReHqcmDPwMBCA7aq
 Dgru94bRjGRkm4NyizO5FVzoLNDUf63vHMTIIURy1YfLet06MkOqyfs9x7hq8L7GAPZGRYf0Xb8
 g9mZxBTSxDtuxJIOY2pU6zRHDDHzr+MeDrfDupTUyFosTZtsTcNiMqM1Kpk/BRbjZGcfrISyZX9
 /9iq218ygR78cLowGFRDSg//SOIE2KHu+c0Yy1bhLcJhbUfVHklsgdSqW2JYWlsOr59r/fTtdBZ
 +o8zfKbOExtl7Xl5JOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120036

Allocate the SoC attributes and revision string with devm and unregister
the SoC device through a devm action. This drops the manual error unwinding
in k3_chipinfo_probe().

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
Changelog:
- No changes since v3.

 drivers/soc/ti/k3-socinfo.c | 43 +++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
index 48dbef3acceb4..e21a2cd14c811 100644
--- a/drivers/soc/ti/k3-socinfo.c
+++ b/drivers/soc/ti/k3-socinfo.c
@@ -115,14 +115,14 @@ k3_chipinfo_variant_to_sr(struct device *dev, unsigned int partno,
 	case JTAG_ID_PARTNO_J721E:
 		if (variant >= ARRAY_SIZE(j721e_rev_string_map))
 			goto err_unknown_variant;
-		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
-						   j721e_rev_string_map[variant]);
+		soc_dev_attr->revision = devm_kasprintf(dev, GFP_KERNEL, "SR%s",
+							j721e_rev_string_map[variant]);
 		break;
 	case JTAG_ID_PARTNO_AM62LX:
 		if (variant >= ARRAY_SIZE(am62lx_rev_string_map))
 			goto err_unknown_variant;
-		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
-						   am62lx_rev_string_map[variant]);
+		soc_dev_attr->revision = devm_kasprintf(dev, GFP_KERNEL, "SR%s",
+							am62lx_rev_string_map[variant]);
 		break;
 	case JTAG_ID_PARTNO_AM62PX:
 		/* Check GP_SW1 for silicon revision */
@@ -134,13 +134,13 @@ k3_chipinfo_variant_to_sr(struct device *dev, unsigned int partno,
 				 gpsw_variant);
 			gpsw_variant = 0;
 		}
-		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
-						   am62p_gpsw_rev_string_map[gpsw_variant]);
+		soc_dev_attr->revision = devm_kasprintf(dev, GFP_KERNEL, "SR%s",
+							am62p_gpsw_rev_string_map[gpsw_variant]);
 		break;
 	default:
 		variant++;
-		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%x.0",
-						   variant);
+		soc_dev_attr->revision = devm_kasprintf(dev, GFP_KERNEL, "SR%x.0",
+							variant);
 	}
 
 	if (!soc_dev_attr->revision)
@@ -158,6 +158,11 @@ static const struct regmap_config k3_chipinfo_regmap_cfg = {
 	.reg_stride = 4,
 };
 
+static void k3_chipinfo_unregister(void *data)
+{
+	soc_device_unregister(data);
+}
+
 static int k3_chipinfo_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
@@ -198,20 +203,20 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
 	partno_id = (jtag_id & CTRLMMR_WKUP_JTAGID_PARTNO_MASK) >>
 		 CTRLMMR_WKUP_JTAGID_PARTNO_SHIFT;
 
-	soc_dev_attr = kzalloc_obj(*soc_dev_attr);
+	soc_dev_attr = devm_kzalloc(dev, sizeof(*soc_dev_attr), GFP_KERNEL);
 	if (!soc_dev_attr)
 		return -ENOMEM;
 
 	ret = k3_chipinfo_partno_to_names(partno_id, soc_dev_attr);
 	if (ret) {
 		dev_err(dev, "Unknown SoC JTAGID[0x%08X]: %d\n", jtag_id, ret);
-		goto err;
+		return ret;
 	}
 
 	ret = k3_chipinfo_variant_to_sr(dev, partno_id, variant, soc_dev_attr);
 	if (ret) {
 		dev_err(dev, "Unknown SoC SR[0x%08X]: %d\n", jtag_id, ret);
-		goto err;
+		return ret;
 	}
 
 	node = of_find_node_by_path("/");
@@ -219,22 +224,18 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
 	of_node_put(node);
 
 	soc_dev = soc_device_register(soc_dev_attr);
-	if (IS_ERR(soc_dev)) {
-		ret = PTR_ERR(soc_dev);
-		goto err_free_rev;
-	}
+	if (IS_ERR(soc_dev))
+		return PTR_ERR(soc_dev);
+
+	ret = devm_add_action_or_reset(dev, k3_chipinfo_unregister, soc_dev);
+	if (ret)
+		return ret;
 
 	dev_info(dev, "Family:%s rev:%s JTAGID[0x%08x] Detected\n",
 		 soc_dev_attr->family,
 		 soc_dev_attr->revision, jtag_id);
 
 	return 0;
-
-err_free_rev:
-	kfree(soc_dev_attr->revision);
-err:
-	kfree(soc_dev_attr);
-	return ret;
 }
 
 static const struct of_device_id k3_chipinfo_of_match[] = {
-- 
2.34.1

