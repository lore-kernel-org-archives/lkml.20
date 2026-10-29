Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793297596;
	b=qHKqT8mFtDda6I0UrcIlrA0uRI7DcPuBYmCPkV7A0rC51YZMcCC1tD9yWcf5oGiQgDLr
	 lK48805TH7cKmHPJnSmXUS8B7OXgDVCvsa6e03DuT6WSDBRivfKPlacnAzl0wGALB1oBw
	 wycIQm4szCtktTWuSuN1idL2EUrbyK5zZ09tKRrhDz3l3DPTS+u5YK5mr8QByf9y+KBic
	 mHkbWE2tZbZzUrd2oRP+R8+UmZqqISviXuEUjh1k/dOPmxUHAhJye9uyRrWp8PtiYlCFv
	 RA881FEwK0dzR8BKHLND6+aU9YqveZfRjusnQCRTIh+yfL1crMS5tgeWnHvBuu47oKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297596;
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
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2P3k/jUPvD7ipIPjYI3nmaYXsNQz29Z0IZpTqithjVE=;
	b=OdGO3PoZJ5bn6OZUIrdmVx5VVYaghNjN6uJP5W04lTifdOondG8BlNuANkx1bLwDpMBX
	 fLntqjK/AypWxjz/LZJmGF5GbrhHnCnRqUf1tAvcf0/AkVoMMfN6+TZx/NlU6KvzGNp2C
	 mDg9x5wKIVBvLGLT+XDqo5fjwalThZxJAnyh6aMFWEpB3riZhXQ5MhareH8eADLzfbB/j
	 hmNunW560YzzLJHaNplrsyVhEzSjnljgkE3IVKavwI0vkyQvKOAsHVIRBLFst1+bxaUO3
	 4WVWdqQWvPYNu5/Kjb8TKj2Wkc/6ILEFZKi1TVTbIk3Ljms2mm+Grg8ObD3+UWBo8AQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=BhK6TsLc;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=d4gKwIzQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719B3606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 719B3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=BhK6TsLc;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=d4gKwIzQ
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDbkH3224867;
	Thu, 29 Oct 2026 13:13:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=2P3k/jUPvD7ipIPjYI3nmaYXsNQz29Z0IZpTqithj
	VE=; b=BhK6TsLcDdYqrKfcnDYeY1hOMDjmz1BZVfxiQP3HMR74jEpCVtua5nr+s
	7yxH3Y5KeADVJ4Q2qiNywsnXzkdJJpbAq3SbHxjJVjpQtk1AFGG/GH99XtklkR6k
	5entbumNmsWLmD7gaymh5EyBQzk2/in7zS1NhBprjxKNNc9p1clCqiEsGP3BKO7+
	rExizxjDn+sqJWi25a+8tGt9WrKWFCKLa38W3/DgJ05xgSfpRQVkOe6dceE2jLzB
	GCwxgVakKNzNZYikxxnxkksUVnh3q+76j4W6Z/QTUc61kq3/ddJ79IuXnfU/Xi5G
	1sL2KfWtQg0Y8TmfZHA9wCkKRS3+Q==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010005.outbound.protection.outlook.com [40.93.198.5])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hm3h7kkjf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 13:13:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXVUfhibBWX52eC+wETJe/ApXshhPgH1X65p6ikgyv8xDhsh1HhnCyxc8OaC9VLVyPuPPE/j7leEKrJ9mVPOkerxIUU0510x3YxmG9pq1fmcsVMUw1zxEiSKapBYAlZlaMmgWwAbjcWt6BJoAfaJlSmir9o1o8aBJLWcxTRh40+36PGnfjF2IHHpJUPLG09lZKsPNYj1KLOrOp3f6SjEPB5TaBoZa0KTYj1kRjsmGNyAwApDExfTWI3Yxcs9sU40A66GnAFM1UVqUy/nsXEZRDPh7Gzf6hr5rSTnzrBX5YHNwZCSt0lMfQzkZhVf5/4f/7qDHz7ZPtLS/XqZ1qfGeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2P3k/jUPvD7ipIPjYI3nmaYXsNQz29Z0IZpTqithjVE=;
 b=c6bwObJE6su62C3ynXuhlORraQeQJbuvM8DIsqdIlEOTYu1ljXLC4QntksNGmrKxit5/6fwA1jzYCFZ85jyLuz64M8JjoGQeG/u1zsIKsCSwgxB7odZkduket8XTZcO3W6UzjlL03d2ZvlE9viwkDEyhZZRnFq4ugZdIQu6uEvLQH0W6N1d5ySKNaJcWT4Ey2OkVBYeTWgiqy9yg3OlvN4bJk0xTm7BYszPrfcwtmIJJyLWmZvCf6VhMPGQUFkSsIpTz0J1qXahNA7jArvxnhBb44p1pPp6t7ng9ozQ4iemJ2MpACPkH4FF4cYcQ6FfU2nobPcKGBJNzOmqohTfcgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2P3k/jUPvD7ipIPjYI3nmaYXsNQz29Z0IZpTqithjVE=;
 b=d4gKwIzQri12WMs9dy+O8Prjpe6mVQ+83/DrwuazbEB+g+VGQKfVjQhUUApdxgo78TQu0lx0HhlSizwPSvVW1IZUnBPOnDN/73qI4w2LNXQLxomjqrLq5fSBDN8nKt3j9sFDFe+uFkcZTUglPoEaGZOKAFy8ACkyYzKTNP5gito=
Received: from MN2PR15CA0049.namprd15.prod.outlook.com (2603:10b6:208:237::18)
 by FT1PR10MB627168.namprd10.prod.outlook.com (2603:10b6:170:2c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 18:12:59 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:208:237:cafe::8d) by MN2PR15CA0049.outlook.office365.com
 (2603:10b6:208:237::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.9 via Frontend Transport; Thu, 29
 Oct 2026 18:12:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 18:12:58 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:13 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 29 Oct 2026 13:12:13 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69TIBmM73408718;
	Thu, 29 Oct 2026 13:12:10 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v3 07/22] firmware: ti_sci: Pass request struct into ti_sci_do_xfer()
Date: Thu, 29 Oct 2026 23:41:32 +0530
Message-ID: <20261029181147.266771-8-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|FT1PR10MB627168:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b269569-4bcd-4a32-00c0-08df35e84304
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|22082099003|18002099003|56012099006|261022105027099003|261022115727099003|261022113327099003|261021123027099003|261028144727099003|261021121427099003|261022075727099003|261009223327099003|261021130227099003|261021135927099003|261021133027099003|10067099003|261009221227099003|261009221727099003|261009220027099003|261009223027099003|261026135527099003|261026130827099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	BvGOo6cBnReMKDbaG3isDe/7PPWp5PluGyCz5iBDzSrcjkqU/cVUIjnJJAhHT7f2mvdXMJ3mBWcoVu6P8x5wUunYwzI5HapqZewfXDoUM40zsSwOjejoqHvGA7RdU9O7e03PMbo6uBuHCoF3rNVsDfGdnlXt5W746t7qE8QS0/5BxpzkQl4/pFZV1w+DWxzmecr3gbbwNWSrXeOHrbQLqecUsRRFsIz9+3KiLXiREHAyXBStAd3bCDGa3n0uk3aPEqBJYPCkqKR1yjEm3AJuUF+Od7lDYRiO3FmMIXobEbeYkac30A5qfTfFccMgGSL/t7CJ+N4do5qWsbDyEeQ53pkTyTcvN7m+Bf1SAUTXQJpxb7igRPC4HiIIEzf4Mc60QKxwYe9xdNk6mNPTG2IkDjzquc4UA8X79X0W2UGth/YmhBjI+F0//XtQ1PQMmWk8bGpI4wgHV1suMU8hBkPFUmB1SpruizCPvZueyPhOp8mEoU7fy9uMUUrWx6oRG+aULikT/09gmcb9c33+D/CagLEiBDWRI/cf+a43sZcvrj3vdTBohsKUMJYwSUB7ArNjYJaQQ+9MfBwxACkzAJKT1gYG4Y/z+HheSiix/a+cnQo5tEy/tDsuRmb6kY/9AUuhXMohOQO0tc4Nun83+fO0soPrRkPTGrIauNimyxBE05w=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(261022105027099003)(261022115727099003)(261022113327099003)(261021123027099003)(261028144727099003)(261021121427099003)(261022075727099003)(261009223327099003)(261021130227099003)(261021135927099003)(261021133027099003)(10067099003)(261009221227099003)(261009221727099003)(261009220027099003)(261009223027099003)(261026135527099003)(261026130827099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	D5vi9IoMPb2N7N8B2pcwI3ovTj2MUKS+DTxxkG7uUQwvFfuFHv1OIyGM3rsdMn9iQSSG8fNtj7ymfhghmwnn4/F1BLR6uG82r820DmfMN8LdAyXTMm8c2hauG2yOZZ923yt/1JxbYlh4mik2ZI2Y9Gi/5huluuK0SJ5M2CTcN4jhG5TGcN4O/3NI5xGCxwj0Zz64m5dT7qu0ht1yn7PICr2eMciWMasCGtPtSeQUtD2i6q4dPiUUKWTwtqi2t9EPOwm2jwVMJ0UQw55jjJOxg9K2BA+RRdXuaXRiMTATTi5GspyRW5B4EKLZBM4lfUle87kDypF/mwM8/h/C0yu9HICf+Ue6CVYpxDPWbDM1gfZzM7PAeOAhv6kXYVFFPFayxsnMbpXFnS5nqJus/RjlD6B7QOcjYOqGOkc0VadMTLJ5cvVaRA3DObNzTvDR6q06
X-Exchange-RoutingPolicyChecked:
	NzBq4tM2EL6xKmDw3HYkX0Oede4ooE0XXILrSqyJO7DnMDW2Ajs8ZF1W1v/NYTJaCKCNJpohxBlqFf8UFI4nY3fRHHEzedSEPPxdtuwyNzWaeiD7rGTLKwvYE5akU9bUnd3k8tte95ektBtkm/becwD0xCbhawGIx2+2bbWk7t3MUddSr2hUSctK7UdrhICNoCUV1K1vdFc25eMYaBbj3BjRUQWVAMu/iS22p+gUwwZh7B44mM6rKq2h9TFM8JW8a9XfqsWwdh9xfaC5/1qwr90tikFONjzsYPQcGUqWKAIDfePstypjp+i47iHfjENSPRblgBnJvJqSW8pSpd1W7g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:12:58.1744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b269569-4bcd-4a32-00c0-08df35e84304
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR10MB627168
X-Authority-Analysis: v=2.4 cv=fv1J914f c=1 sm=1 tr=0 ts=6ae38caf cx=c_pps
 a=bt8r0o3PvT4lvF5YbTRm1A==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=P0kh-yUSKlPavfjvg1YA:9
X-Proofpoint-ORIG-GUID: n8aIU9-O0-KGvzB_Gnu_wfLjJqLfsChH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX0Pmv4zbXcJDH
 wsMjitvALl12Kp8AL+5eNoO/u8QNMlGgj22eNfW+4TTAp+gYCulam53ERkebGZlvl3PEjCf0/Vh
 Y+lBmBSYLL/lsPpu+4gbWEfJZHnXWZuhRDXN6zN7NnR5TMzYfA4El06pk+D9p8lCYxrhjpYAtUa
 HERFW9h0J2+r3XaaQbjHXZw+9pL7z/i9UF/+Om5z32Dxm5D2E0Dj4jAxmYzmHitj8hhf2gcQucr
 4Tt9qpCGvHuzKDyGvRpEDD/PMVr69IDTT/5iYdI+dm88Z+6cJoKiQ5sLAz0vm9sigLwYyCNVG4j
 JG59FFtD20/wUN1JNOzA0nVYn1ecgm+zE5UAYJsJAha5RCJGd1aVQ9K5kA1nNcVgUS60Sh9nHid
 hXts7i6ztFoaMK682VmPAB3bI/fWpg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX8QQgiWyaBymV
 BNiVcEdwV2euVjmY31vwi8pylwICbAQs1+WiVSocnGKQt5oz48nqH7BkAejMr9p1K74MgfCOmc2
 v89kLBn5NNsiLEP79BfxBjsxvb7921w=
X-Proofpoint-GUID: n8aIU9-O0-KGvzB_Gnu_wfLjJqLfsChH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290071

From: Andrew Davis <afd@ti.com>

In the same way the previous patch moved the response handling into
ti_sci_do_xfer(), we can do the same for the request data. While this
does add a memcpy() of a few additional bytes, that overhead is removed
in later patches, and the code cleanup it unlocks justifies it.

Note: Previously, callers built their requests directly in a buffer
handed out by ti_sci_get_one_xfer() from a pool that is allocated once
at probe time and reused for every message. This buffer is never cleared
between messages, so any request field that a caller did not explicitly
assign held leftover bytes from an earlier TI SCI message.

With this patch, callers build their requests in on-stack structs, so
such fields now hold uninitialized stack contents instead. The only
difference is where the leftover bytes come from (stack rather than a
reused message buffer); whether they are zero or not is unchanged. Hence
this patch does not change the data seen by the system firmware in any
meaningful way, and no memset() is added on the local request structs.

Signed-off-by: Andrew Davis <afd@ti.com>
Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v3: Changelog:
1. None to this patch.

Link to v2:
https://lore.kernel.org/all/20260930160607.2674980-8-b-padhi@ti.com/

v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-8-b-padhi@ti.com/

 drivers/firmware/ti_sci.c | 523 +++++++++++++++++++-------------------
 1 file changed, 266 insertions(+), 257 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index c1f783bc67353..83b2d4a50788f 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -43,6 +43,7 @@ static DEFINE_MUTEX(ti_sci_list_mutex);
 /**
  * struct ti_sci_xfer - Structure representing a message flow
  * @tx_message:	Transmit message
+ * @tx_buf:	Pointer to the message to send
  * @rx_buf:	Pointer to store received message
  * @rx_len:	Receive message length
  * @xfer_buf:	Preallocated buffer to store receive message
@@ -53,6 +54,7 @@ static DEFINE_MUTEX(ti_sci_list_mutex);
  */
 struct ti_sci_xfer {
 	struct ti_msgmgr_message tx_message;
+	void *tx_buf;
 	void *rx_buf;
 	u8 rx_len;
 	u8 *xfer_buf;
@@ -299,6 +301,7 @@ static void ti_sci_rx_callback(struct mbox_client *cl, void *m)
  * @info:	Pointer to SCI entity information
  * @msg_type:	Message type
  * @msg_flags:	Flag to set for the message
+ * @tx_message: transmit message storage location
  * @tx_message_size: transmit message size
  * @rx_message: receive message storage location
  * @rx_message_size: receive message size
@@ -314,7 +317,7 @@ static void ti_sci_rx_callback(struct mbox_client *cl, void *m)
  */
 static struct ti_sci_xfer *ti_sci_get_one_xfer(struct ti_sci_info *info,
 					       u16 msg_type, u32 msg_flags,
-					       size_t tx_message_size,
+					       void *tx_message, size_t tx_message_size,
 					       void *rx_message, size_t rx_message_size)
 {
 	struct ti_sci_xfers_info *minfo = &info->minfo;
@@ -371,6 +374,7 @@ static struct ti_sci_xfer *ti_sci_get_one_xfer(struct ti_sci_info *info,
 	xfer->tx_message.len = tx_message_size;
 	xfer->tx_message.chan_rx = info->chan_rx;
 	xfer->tx_message.timeout_rx_ms = info->desc->max_rx_timeout_ms;
+	xfer->tx_buf = tx_message;
 	xfer->rx_buf = rx_message;
 	xfer->rx_len = (u8)rx_message_size;
 
@@ -448,6 +452,10 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 	struct device *dev = info->dev;
 	bool done_state = true;
 
+	memcpy(xfer->xfer_buf + sizeof(struct ti_sci_msg_hdr),
+	       xfer->tx_buf + sizeof(struct ti_sci_msg_hdr),
+	       xfer->tx_message.len - sizeof(struct ti_sci_msg_hdr));
+
 	ret = mbox_send_message(info->chan_tx, &xfer->tx_message);
 	if (ret < 0) {
 		dev_err(dev, "Mbox send fail %d (caller: %pS)\n", ret, (void *)_RET_IP_);
@@ -516,13 +524,14 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 {
 	struct ti_sci_handle *handle = &info->handle;
 	struct ti_sci_version_info *ver = &handle->version;
+	struct ti_sci_msg_hdr req;
 	struct ti_sci_msg_resp_version resp;
 	struct ti_sci_xfer *xfer;
 	int ret;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_VERSION,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(struct ti_sci_msg_hdr),
+				   &req, sizeof(req),
 				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
@@ -553,7 +562,7 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 				   u32 id, u32 flags, u8 state)
 {
 	struct ti_sci_info *info;
-	struct ti_sci_msg_req_set_device_state *req;
+	struct ti_sci_msg_req_set_device_state req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -567,13 +576,13 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_DEVICE_STATE,
 				   flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_req_set_device_state *)xfer->xfer_buf;
-	req->id = id;
-	req->state = state;
+	req.id = id;
+	req.state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
@@ -598,7 +607,7 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 				    u8 *p_state,  u8 *c_state)
 {
 	struct ti_sci_info *info;
-	struct ti_sci_msg_req_get_device_state *req;
+	struct ti_sci_msg_req_get_device_state req;
 	struct ti_sci_msg_resp_get_device_state resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -615,12 +624,12 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_DEVICE_STATE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_req_get_device_state *)xfer->xfer_buf;
-	req->id = id;
+	req.id = id;
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
@@ -889,7 +898,7 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 					u32 id, u32 reset_state)
 {
 	struct ti_sci_info *info;
-	struct ti_sci_msg_req_set_device_resets *req;
+	struct ti_sci_msg_req_set_device_resets req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -903,13 +912,13 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_DEVICE_RESETS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_req_set_device_resets *)xfer->xfer_buf;
-	req->id = id;
-	req->resets = reset_state;
+	req.id = id;
+	req.resets = reset_state;
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
@@ -951,7 +960,7 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 				  u32 flags, u8 state)
 {
 	struct ti_sci_info *info;
-	struct ti_sci_msg_req_set_clock_state *req;
+	struct ti_sci_msg_req_set_clock_state req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -965,19 +974,19 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_STATE,
 				   flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_req_set_clock_state *)xfer->xfer_buf;
-	req->dev_id = dev_id;
+	req.dev_id = dev_id;
 	if (clk_id < 255) {
-		req->clk_id = clk_id;
+		req.clk_id = clk_id;
 	} else {
-		req->clk_id = 255;
-		req->clk_id_32 = clk_id;
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
 	}
-	req->request_state = state;
+	req.request_state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
@@ -1003,7 +1012,7 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 				      u8 *programmed_state, u8 *current_state)
 {
 	struct ti_sci_info *info;
-	struct ti_sci_msg_req_get_clock_state *req;
+	struct ti_sci_msg_req_get_clock_state req;
 	struct ti_sci_msg_resp_get_clock_state resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -1020,17 +1029,17 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_STATE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_req_get_clock_state *)xfer->xfer_buf;
-	req->dev_id = dev_id;
+	req.dev_id = dev_id;
 	if (clk_id < 255) {
-		req->clk_id = clk_id;
+		req.clk_id = clk_id;
 	} else {
-		req->clk_id = 255;
-		req->clk_id_32 = clk_id;
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
 	}
 
 	ret = ti_sci_do_xfer(info, xfer);
@@ -1221,7 +1230,7 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 				     u32 dev_id, u32 clk_id, u32 parent_id)
 {
 	struct ti_sci_info *info;
-	struct ti_sci_msg_req_set_clock_parent *req;
+	struct ti_sci_msg_req_set_clock_parent req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -1235,23 +1244,23 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_PARENT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_req_set_clock_parent *)xfer->xfer_buf;
-	req->dev_id = dev_id;
+	req.dev_id = dev_id;
 	if (clk_id < 255) {
-		req->clk_id = clk_id;
+		req.clk_id = clk_id;
 	} else {
-		req->clk_id = 255;
-		req->clk_id_32 = clk_id;
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
 	}
 	if (parent_id < 255) {
-		req->parent_id = parent_id;
+		req.parent_id = parent_id;
 	} else {
-		req->parent_id = 255;
-		req->parent_id_32 = parent_id;
+		req.parent_id = 255;
+		req.parent_id_32 = parent_id;
 	}
 
 	ret = ti_sci_do_xfer(info, xfer);
@@ -1276,7 +1285,7 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 				     u32 dev_id, u32 clk_id, u32 *parent_id)
 {
 	struct ti_sci_info *info;
-	struct ti_sci_msg_req_get_clock_parent *req;
+	struct ti_sci_msg_req_get_clock_parent req;
 	struct ti_sci_msg_resp_get_clock_parent resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -1290,17 +1299,17 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_PARENT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_req_get_clock_parent *)xfer->xfer_buf;
-	req->dev_id = dev_id;
+	req.dev_id = dev_id;
 	if (clk_id < 255) {
-		req->clk_id = clk_id;
+		req.clk_id = clk_id;
 	} else {
-		req->clk_id = 255;
-		req->clk_id_32 = clk_id;
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
 	}
 
 	ret = ti_sci_do_xfer(info, xfer);
@@ -1331,7 +1340,7 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 					  u32 *num_parents)
 {
 	struct ti_sci_info *info;
-	struct ti_sci_msg_req_get_clock_num_parents *req;
+	struct ti_sci_msg_req_get_clock_num_parents req;
 	struct ti_sci_msg_resp_get_clock_num_parents resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -1345,17 +1354,17 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_NUM_CLOCK_PARENTS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_req_get_clock_num_parents *)xfer->xfer_buf;
-	req->dev_id = dev_id;
+	req.dev_id = dev_id;
 	if (clk_id < 255) {
-		req->clk_id = clk_id;
+		req.clk_id = clk_id;
 	} else {
-		req->clk_id = 255;
-		req->clk_id_32 = clk_id;
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
 	}
 
 	ret = ti_sci_do_xfer(info, xfer);
@@ -1395,7 +1404,7 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 					 u64 *match_freq)
 {
 	struct ti_sci_info *info;
-	struct ti_sci_msg_req_query_clock_freq *req;
+	struct ti_sci_msg_req_query_clock_freq req;
 	struct ti_sci_msg_resp_query_clock_freq resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -1409,21 +1418,21 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_QUERY_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_req_query_clock_freq *)xfer->xfer_buf;
-	req->dev_id = dev_id;
+	req.dev_id = dev_id;
 	if (clk_id < 255) {
-		req->clk_id = clk_id;
+		req.clk_id = clk_id;
 	} else {
-		req->clk_id = 255;
-		req->clk_id_32 = clk_id;
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
 	}
-	req->min_freq_hz = min_freq;
-	req->target_freq_hz = target_freq;
-	req->max_freq_hz = max_freq;
+	req.min_freq_hz = min_freq;
+	req.target_freq_hz = target_freq;
+	req.max_freq_hz = max_freq;
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
@@ -1457,7 +1466,7 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 				   u64 target_freq, u64 max_freq)
 {
 	struct ti_sci_info *info;
-	struct ti_sci_msg_req_set_clock_freq *req;
+	struct ti_sci_msg_req_set_clock_freq req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -1471,21 +1480,21 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_req_set_clock_freq *)xfer->xfer_buf;
-	req->dev_id = dev_id;
+	req.dev_id = dev_id;
 	if (clk_id < 255) {
-		req->clk_id = clk_id;
+		req.clk_id = clk_id;
 	} else {
-		req->clk_id = 255;
-		req->clk_id_32 = clk_id;
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
 	}
-	req->min_freq_hz = min_freq;
-	req->target_freq_hz = target_freq;
-	req->max_freq_hz = max_freq;
+	req.min_freq_hz = min_freq;
+	req.target_freq_hz = target_freq;
+	req.max_freq_hz = max_freq;
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
@@ -1509,7 +1518,7 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 				   u32 dev_id, u32 clk_id, u64 *freq)
 {
 	struct ti_sci_info *info;
-	struct ti_sci_msg_req_get_clock_freq *req;
+	struct ti_sci_msg_req_get_clock_freq req;
 	struct ti_sci_msg_resp_get_clock_freq resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -1523,17 +1532,17 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_req_get_clock_freq *)xfer->xfer_buf;
-	req->dev_id = dev_id;
+	req.dev_id = dev_id;
 	if (clk_id < 255) {
-		req->clk_id = clk_id;
+		req.clk_id = clk_id;
 	} else {
-		req->clk_id = 255;
-		req->clk_id_32 = clk_id;
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
 	}
 
 	ret = ti_sci_do_xfer(info, xfer);
@@ -1562,7 +1571,7 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 			TI_SCI_FLAG_REQ_GENERIC_NORESPONSE :
 			TI_SCI_FLAG_REQ_ACK_ON_PROCESSED;
 	struct ti_sci_info *info;
-	struct ti_sci_msg_req_prepare_sleep *req;
+	struct ti_sci_msg_req_prepare_sleep req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct device *dev;
@@ -1578,15 +1587,15 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PREPARE_SLEEP,
 				   msg_flags,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_req_prepare_sleep *)xfer->xfer_buf;
-	req->mode = mode;
-	req->ctx_lo = ctx_lo;
-	req->ctx_hi = ctx_hi;
-	req->debug_flags = debug_flags;
+	req.mode = mode;
+	req.ctx_lo = ctx_lo;
+	req.ctx_hi = ctx_hi;
+	req.debug_flags = debug_flags;
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
@@ -1613,6 +1622,7 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
+	struct ti_sci_msg_hdr req;
 	struct ti_sci_msg_resp_query_fw_caps resp;
 	struct device *dev;
 	int ret = 0;
@@ -1627,7 +1637,7 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_QUERY_FW_CAPS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(struct ti_sci_msg_hdr),
+				   &req, sizeof(req),
 				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
@@ -1655,7 +1665,7 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 				       u8 state)
 {
 	struct ti_sci_info *info;
-	struct ti_sci_msg_req_set_io_isolation *req;
+	struct ti_sci_msg_req_set_io_isolation req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct device *dev;
@@ -1671,12 +1681,12 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_IO_ISOLATION,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_req_set_io_isolation *)xfer->xfer_buf;
-	req->state = state;
+	req.state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
@@ -1702,6 +1712,7 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
+	struct ti_sci_msg_hdr req;
 	struct ti_sci_msg_resp_lpm_wake_reason resp;
 	struct device *dev;
 	int ret = 0;
@@ -1716,7 +1727,7 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_WAKE_REASON,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(struct ti_sci_msg_hdr),
+				   &req, sizeof(req),
 				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
@@ -1751,7 +1762,7 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 					    u32 id, u8 state)
 {
 	struct ti_sci_info *info;
-	struct ti_sci_msg_req_lpm_set_device_constraint *req;
+	struct ti_sci_msg_req_lpm_set_device_constraint req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct device *dev;
@@ -1767,13 +1778,13 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_req_lpm_set_device_constraint *)xfer->xfer_buf;
-	req->id = id;
-	req->state = state;
+	req.id = id;
+	req.state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
@@ -1796,7 +1807,7 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 					     u16 latency, u8 state)
 {
 	struct ti_sci_info *info;
-	struct ti_sci_msg_req_lpm_set_latency_constraint *req;
+	struct ti_sci_msg_req_lpm_set_latency_constraint req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct device *dev;
@@ -1812,13 +1823,13 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_req_lpm_set_latency_constraint *)xfer->xfer_buf;
-	req->latency = latency;
-	req->state = state;
+	req.latency = latency;
+	req.state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
@@ -1838,19 +1849,18 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 static int ti_sci_cmd_lpm_abort(struct device *dev)
 {
 	struct ti_sci_info *info = dev_get_drvdata(dev);
-	struct ti_sci_msg_hdr *req;
+	struct ti_sci_msg_hdr req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_ABORT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
 		return ret;
@@ -1861,7 +1871,7 @@ static int ti_sci_cmd_lpm_abort(struct device *dev)
 static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 {
 	struct ti_sci_info *info;
-	struct ti_sci_msg_req_reboot *req;
+	struct ti_sci_msg_req_reboot req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -1875,12 +1885,11 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SYS_RESET,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_req_reboot *)xfer->xfer_buf;
-
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
 		return ret;
@@ -1907,7 +1916,7 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 				     struct ti_sci_resource_desc *desc)
 {
 	struct ti_sci_msg_resp_get_resource_range resp;
-	struct ti_sci_msg_req_get_resource_range *req;
+	struct ti_sci_msg_req_get_resource_range req;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
@@ -1921,14 +1930,14 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_RESOURCE_RANGE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_req_get_resource_range *)xfer->xfer_buf;
-	req->secondary_host = s_host;
-	req->type = dev_id & MSG_RM_RESOURCE_TYPE_MASK;
-	req->subtype = subtype & MSG_RM_RESOURCE_SUBTYPE_MASK;
+	req.secondary_host = s_host;
+	req.type = dev_id & MSG_RM_RESOURCE_TYPE_MASK;
+	req.subtype = subtype & MSG_RM_RESOURCE_SUBTYPE_MASK;
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
@@ -2014,7 +2023,7 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 			     u16 global_event, u8 vint_status_bit, u8 s_host,
 			     u16 type)
 {
-	struct ti_sci_msg_req_manage_irq *req;
+	struct ti_sci_msg_req_manage_irq req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
@@ -2028,21 +2037,21 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 	info = handle_to_ti_sci_info(handle);
 
 	xfer = ti_sci_get_one_xfer(info, type, TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_req_manage_irq *)xfer->xfer_buf;
-	req->valid_params = valid_params;
-	req->src_id = src_id;
-	req->src_index = src_index;
-	req->dst_id = dst_id;
-	req->dst_host_irq = dst_host_irq;
-	req->ia_id = ia_id;
-	req->vint = vint;
-	req->global_event = global_event;
-	req->vint_status_bit = vint_status_bit;
-	req->secondary_host = s_host;
+	req.valid_params = valid_params;
+	req.src_id = src_id;
+	req.src_index = src_index;
+	req.dst_id = dst_id;
+	req.dst_host_irq = dst_host_irq;
+	req.ia_id = ia_id;
+	req.vint = vint;
+	req.global_event = global_event;
+	req.vint_status_bit = vint_status_bit;
+	req.secondary_host = s_host;
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
@@ -2326,7 +2335,7 @@ static int ti_sci_cmd_free_event_map(const struct ti_sci_handle *handle,
 static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 				  const struct ti_sci_msg_rm_ring_cfg *params)
 {
-	struct ti_sci_msg_rm_ring_cfg_req *req;
+	struct ti_sci_msg_rm_ring_cfg_req req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
@@ -2339,22 +2348,22 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_RING_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_rm_ring_cfg_req *)xfer->xfer_buf;
-	req->valid_params = params->valid_params;
-	req->nav_id = params->nav_id;
-	req->index = params->index;
-	req->addr_lo = params->addr_lo;
-	req->addr_hi = params->addr_hi;
-	req->count = params->count;
-	req->mode = params->mode;
-	req->size = params->size;
-	req->order_id = params->order_id;
-	req->virtid = params->virtid;
-	req->asel = params->asel;
+	req.valid_params = params->valid_params;
+	req.nav_id = params->nav_id;
+	req.index = params->index;
+	req.addr_lo = params->addr_lo;
+	req.addr_hi = params->addr_hi;
+	req.count = params->count;
+	req.mode = params->mode;
+	req.size = params->size;
+	req.order_id = params->order_id;
+	req.virtid = params->virtid;
+	req.asel = params->asel;
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
@@ -2376,7 +2385,7 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 				   u32 nav_id, u32 src_thread, u32 dst_thread)
 {
-	struct ti_sci_msg_psil_pair *req;
+	struct ti_sci_msg_psil_pair req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
@@ -2391,14 +2400,14 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_PSIL_PAIR,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_psil_pair *)xfer->xfer_buf;
-	req->nav_id = nav_id;
-	req->src_thread = src_thread;
-	req->dst_thread = dst_thread;
+	req.nav_id = nav_id;
+	req.src_thread = src_thread;
+	req.dst_thread = dst_thread;
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
@@ -2420,7 +2429,7 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 				     u32 nav_id, u32 src_thread, u32 dst_thread)
 {
-	struct ti_sci_msg_psil_unpair *req;
+	struct ti_sci_msg_psil_unpair req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
@@ -2435,14 +2444,14 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_PSIL_UNPAIR,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_psil_unpair *)xfer->xfer_buf;
-	req->nav_id = nav_id;
-	req->src_thread = src_thread;
-	req->dst_thread = dst_thread;
+	req.nav_id = nav_id;
+	req.src_thread = src_thread;
+	req.dst_thread = dst_thread;
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
@@ -2465,7 +2474,7 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 			const struct ti_sci_msg_rm_udmap_tx_ch_cfg *params)
 {
-	struct ti_sci_msg_rm_udmap_tx_ch_cfg_req *req;
+	struct ti_sci_msg_rm_udmap_tx_ch_cfg_req req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
@@ -2478,31 +2487,31 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_TX_CH_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_rm_udmap_tx_ch_cfg_req *)xfer->xfer_buf;
-	req->valid_params = params->valid_params;
-	req->nav_id = params->nav_id;
-	req->index = params->index;
-	req->tx_pause_on_err = params->tx_pause_on_err;
-	req->tx_filt_einfo = params->tx_filt_einfo;
-	req->tx_filt_pswords = params->tx_filt_pswords;
-	req->tx_atype = params->tx_atype;
-	req->tx_chan_type = params->tx_chan_type;
-	req->tx_supr_tdpkt = params->tx_supr_tdpkt;
-	req->tx_fetch_size = params->tx_fetch_size;
-	req->tx_credit_count = params->tx_credit_count;
-	req->txcq_qnum = params->txcq_qnum;
-	req->tx_priority = params->tx_priority;
-	req->tx_qos = params->tx_qos;
-	req->tx_orderid = params->tx_orderid;
-	req->fdepth = params->fdepth;
-	req->tx_sched_priority = params->tx_sched_priority;
-	req->tx_burst_size = params->tx_burst_size;
-	req->tx_tdtype = params->tx_tdtype;
-	req->extended_ch_type = params->extended_ch_type;
+	req.valid_params = params->valid_params;
+	req.nav_id = params->nav_id;
+	req.index = params->index;
+	req.tx_pause_on_err = params->tx_pause_on_err;
+	req.tx_filt_einfo = params->tx_filt_einfo;
+	req.tx_filt_pswords = params->tx_filt_pswords;
+	req.tx_atype = params->tx_atype;
+	req.tx_chan_type = params->tx_chan_type;
+	req.tx_supr_tdpkt = params->tx_supr_tdpkt;
+	req.tx_fetch_size = params->tx_fetch_size;
+	req.tx_credit_count = params->tx_credit_count;
+	req.txcq_qnum = params->txcq_qnum;
+	req.tx_priority = params->tx_priority;
+	req.tx_qos = params->tx_qos;
+	req.tx_orderid = params->tx_orderid;
+	req.fdepth = params->fdepth;
+	req.tx_sched_priority = params->tx_sched_priority;
+	req.tx_burst_size = params->tx_burst_size;
+	req.tx_tdtype = params->tx_tdtype;
+	req.extended_ch_type = params->extended_ch_type;
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
@@ -2525,7 +2534,7 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 			const struct ti_sci_msg_rm_udmap_rx_ch_cfg *params)
 {
-	struct ti_sci_msg_rm_udmap_rx_ch_cfg_req *req;
+	struct ti_sci_msg_rm_udmap_rx_ch_cfg_req req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
@@ -2538,28 +2547,28 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_RX_CH_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_rm_udmap_rx_ch_cfg_req *)xfer->xfer_buf;
-	req->valid_params = params->valid_params;
-	req->nav_id = params->nav_id;
-	req->index = params->index;
-	req->rx_fetch_size = params->rx_fetch_size;
-	req->rxcq_qnum = params->rxcq_qnum;
-	req->rx_priority = params->rx_priority;
-	req->rx_qos = params->rx_qos;
-	req->rx_orderid = params->rx_orderid;
-	req->rx_sched_priority = params->rx_sched_priority;
-	req->flowid_start = params->flowid_start;
-	req->flowid_cnt = params->flowid_cnt;
-	req->rx_pause_on_err = params->rx_pause_on_err;
-	req->rx_atype = params->rx_atype;
-	req->rx_chan_type = params->rx_chan_type;
-	req->rx_ignore_short = params->rx_ignore_short;
-	req->rx_ignore_long = params->rx_ignore_long;
-	req->rx_burst_size = params->rx_burst_size;
+	req.valid_params = params->valid_params;
+	req.nav_id = params->nav_id;
+	req.index = params->index;
+	req.rx_fetch_size = params->rx_fetch_size;
+	req.rxcq_qnum = params->rxcq_qnum;
+	req.rx_priority = params->rx_priority;
+	req.rx_qos = params->rx_qos;
+	req.rx_orderid = params->rx_orderid;
+	req.rx_sched_priority = params->rx_sched_priority;
+	req.flowid_start = params->flowid_start;
+	req.flowid_cnt = params->flowid_cnt;
+	req.rx_pause_on_err = params->rx_pause_on_err;
+	req.rx_atype = params->rx_atype;
+	req.rx_chan_type = params->rx_chan_type;
+	req.rx_ignore_short = params->rx_ignore_short;
+	req.rx_ignore_long = params->rx_ignore_long;
+	req.rx_burst_size = params->rx_burst_size;
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
@@ -2582,7 +2591,7 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 			const struct ti_sci_msg_rm_udmap_flow_cfg *params)
 {
-	struct ti_sci_msg_rm_udmap_flow_cfg_req *req;
+	struct ti_sci_msg_rm_udmap_flow_cfg_req req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
@@ -2595,33 +2604,33 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_FLOW_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_rm_udmap_flow_cfg_req *)xfer->xfer_buf;
-	req->valid_params = params->valid_params;
-	req->nav_id = params->nav_id;
-	req->flow_index = params->flow_index;
-	req->rx_einfo_present = params->rx_einfo_present;
-	req->rx_psinfo_present = params->rx_psinfo_present;
-	req->rx_error_handling = params->rx_error_handling;
-	req->rx_desc_type = params->rx_desc_type;
-	req->rx_sop_offset = params->rx_sop_offset;
-	req->rx_dest_qnum = params->rx_dest_qnum;
-	req->rx_src_tag_hi = params->rx_src_tag_hi;
-	req->rx_src_tag_lo = params->rx_src_tag_lo;
-	req->rx_dest_tag_hi = params->rx_dest_tag_hi;
-	req->rx_dest_tag_lo = params->rx_dest_tag_lo;
-	req->rx_src_tag_hi_sel = params->rx_src_tag_hi_sel;
-	req->rx_src_tag_lo_sel = params->rx_src_tag_lo_sel;
-	req->rx_dest_tag_hi_sel = params->rx_dest_tag_hi_sel;
-	req->rx_dest_tag_lo_sel = params->rx_dest_tag_lo_sel;
-	req->rx_fdq0_sz0_qnum = params->rx_fdq0_sz0_qnum;
-	req->rx_fdq1_qnum = params->rx_fdq1_qnum;
-	req->rx_fdq2_qnum = params->rx_fdq2_qnum;
-	req->rx_fdq3_qnum = params->rx_fdq3_qnum;
-	req->rx_ps_location = params->rx_ps_location;
+	req.valid_params = params->valid_params;
+	req.nav_id = params->nav_id;
+	req.flow_index = params->flow_index;
+	req.rx_einfo_present = params->rx_einfo_present;
+	req.rx_psinfo_present = params->rx_psinfo_present;
+	req.rx_error_handling = params->rx_error_handling;
+	req.rx_desc_type = params->rx_desc_type;
+	req.rx_sop_offset = params->rx_sop_offset;
+	req.rx_dest_qnum = params->rx_dest_qnum;
+	req.rx_src_tag_hi = params->rx_src_tag_hi;
+	req.rx_src_tag_lo = params->rx_src_tag_lo;
+	req.rx_dest_tag_hi = params->rx_dest_tag_hi;
+	req.rx_dest_tag_lo = params->rx_dest_tag_lo;
+	req.rx_src_tag_hi_sel = params->rx_src_tag_hi_sel;
+	req.rx_src_tag_lo_sel = params->rx_src_tag_lo_sel;
+	req.rx_dest_tag_hi_sel = params->rx_dest_tag_hi_sel;
+	req.rx_dest_tag_lo_sel = params->rx_dest_tag_lo_sel;
+	req.rx_fdq0_sz0_qnum = params->rx_fdq0_sz0_qnum;
+	req.rx_fdq1_qnum = params->rx_fdq1_qnum;
+	req.rx_fdq2_qnum = params->rx_fdq2_qnum;
+	req.rx_fdq3_qnum = params->rx_fdq3_qnum;
+	req.rx_ps_location = params->rx_ps_location;
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
@@ -2640,7 +2649,7 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 				   u8 proc_id)
 {
-	struct ti_sci_msg_req_proc_request *req;
+	struct ti_sci_msg_req_proc_request req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
@@ -2655,12 +2664,12 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_REQUEST,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_req_proc_request *)xfer->xfer_buf;
-	req->processor_id = proc_id;
+	req.processor_id = proc_id;
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
@@ -2679,7 +2688,7 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 				   u8 proc_id)
 {
-	struct ti_sci_msg_req_proc_release *req;
+	struct ti_sci_msg_req_proc_release req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
@@ -2694,12 +2703,12 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_RELEASE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_req_proc_release *)xfer->xfer_buf;
-	req->processor_id = proc_id;
+	req.processor_id = proc_id;
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
@@ -2721,7 +2730,7 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 				    u8 proc_id, u8 host_id)
 {
-	struct ti_sci_msg_req_proc_handover *req;
+	struct ti_sci_msg_req_proc_handover req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
@@ -2736,13 +2745,13 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_HANDOVER,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_req_proc_handover *)xfer->xfer_buf;
-	req->processor_id = proc_id;
-	req->host_id = host_id;
+	req.processor_id = proc_id;
+	req.host_id = host_id;
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
@@ -2767,7 +2776,7 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 				      u32 config_flags_set,
 				      u32 config_flags_clear)
 {
-	struct ti_sci_msg_req_set_config *req;
+	struct ti_sci_msg_req_set_config req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
@@ -2782,17 +2791,17 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CONFIG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_req_set_config *)xfer->xfer_buf;
-	req->processor_id = proc_id;
-	req->bootvector_low = bootvector & TI_SCI_ADDR_LOW_MASK;
-	req->bootvector_high = (bootvector & TI_SCI_ADDR_HIGH_MASK) >>
+	req.processor_id = proc_id;
+	req.bootvector_low = bootvector & TI_SCI_ADDR_LOW_MASK;
+	req.bootvector_high = (bootvector & TI_SCI_ADDR_HIGH_MASK) >>
 				TI_SCI_ADDR_HIGH_SHIFT;
-	req->config_flags_set = config_flags_set;
-	req->config_flags_clear = config_flags_clear;
+	req.config_flags_set = config_flags_set;
+	req.config_flags_clear = config_flags_clear;
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
@@ -2815,7 +2824,7 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 				       u8 proc_id, u32 control_flags_set,
 				       u32 control_flags_clear)
 {
-	struct ti_sci_msg_req_set_ctrl *req;
+	struct ti_sci_msg_req_set_ctrl req;
 	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
@@ -2830,14 +2839,14 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CTRL,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_req_set_ctrl *)xfer->xfer_buf;
-	req->processor_id = proc_id;
-	req->control_flags_set = control_flags_set;
-	req->control_flags_clear = control_flags_clear;
+	req.processor_id = proc_id;
+	req.control_flags_set = control_flags_set;
+	req.control_flags_clear = control_flags_clear;
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
@@ -2862,7 +2871,7 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 				      u32 *ctrl_flags, u32 *sts_flags)
 {
 	struct ti_sci_msg_resp_get_status resp;
-	struct ti_sci_msg_req_get_status *req;
+	struct ti_sci_msg_req_get_status req;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -2876,12 +2885,12 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_STATUS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), &resp, sizeof(resp));
+				   &req, sizeof(req),
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	req = (struct ti_sci_msg_req_get_status *)xfer->xfer_buf;
-	req->processor_id = proc_id;
+	req.processor_id = proc_id;
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-- 
2.34.1

