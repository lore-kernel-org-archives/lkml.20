Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792431524;
	b=KNBLgbf8MmV1BXLgyVTjYow9Sc7GZFRj3Mkx1DjRpH8amqXz/QqHliCA6Q1T94uYbI/q
	 STUvpfsYotAl8CUZ9m0BhtnGPG8VQS10x1xB0ohcWoy86dL86D5Mra24n2mceUtIRpus+
	 GoGTKxwcaOaiWSxNoTz8zSOorsJnIPsSs8mi0UV2ek0dez9uDh8kWrtWyQirrDeQ3kAGk
	 rja6aJR/iNFTxHTtDNEvwB67WTCSk6EdxZPY9ybKPvg2YrSR7MeVyb3RJTY2bIMgoiKUD
	 Pu4144t/sqh7iYk82usp1K7LMvM5F1YlgUZJQrI5NCaTDMaxkVF5JzzHixWOS23s/WA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792431524;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:CC:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5izV6+4tjoXa8Vi+iC0CZwQsDwCmHugup19Q5eZr2uo=;
	b=Lzv8GHTUTa18Dq4G4SPQoU+VKJ7F04UgJ7jy8diuDQFwOtArQffHlYPGErEtLi/+9fp/
	 ILNnKkeajfjAYyqNF89UjVNM1knj6sb3eIYJ6Z/YQU2Y0tPzz4kX0bUo2KYxmxtlRVwNW
	 oyv/N59vP1vxDzNi38g8GtgPqL+w/wHBTPCKs+L2y2NgjOo8tIm133GyTHEyQ00a4qHk7
	 AkygOlNi0LsSRXZlDSSzpqxTbu8fcmeOMUF/vVSIlLSjzSxcTyjbqNGeKQN9o0wNQ7jVD
	 s281Z/5HNLNkaJBWXYKQzXkBbrr9hKsQj9+Gwtya8WlxOgPKDiPBikuExzYBVwysuVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=JwEkFYRE;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=Y+BkH5Hl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62952606A335
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62952606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=JwEkFYRE;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=Y+BkH5Hl
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69JHCtDS3739058;
	Mon, 19 Oct 2026 12:38:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=5izV6+4tjoXa8Vi+iC0CZwQsDwCmHugup19Q5eZr2
	uo=; b=JwEkFYREtVAQ143XAsdBwFjNrsx35T9dPS5jAgqk3hAKlJoGmg7F9AktT
	Xk86/QpLDY7daqR+T+C0aCxTOtkoBcqg1Kg1nEvWw55cfTFqs/xRJMD+XHSH4K0X
	bW/XWS8miIJeksz3Oanyimw2Ou/MPkXa7mBV1nlPIqBRDBV89sktPUXrHwKnLoCb
	YTGAUrCiOA7SvPHovcOjUaj6wC01ipuGoK+1GzCyw6Fa2rDcNcDHe2ZiYfiRbdnu
	Da3YZfiiktWw/elG5aI/8dh/UuyIs04iZQvcEzeVbjsByRRH9OCEox7yj5w0EjWE
	/6IjM9otAatX15iR3EgoeyiXAUuwQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012044.outbound.protection.outlook.com [40.107.209.44])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hdjdaabeg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 12:38:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPGxW3hAmeTg/A84g3p32YGGct7qqf8VE43o4enZ54ufPtM/bFDbchSXogZM289jHy9LG/sCHZMNEuJ6T99XfvB76xa5Vrz2hlrG76y6Utxsk81a6WpmJIXcLCnrmmC9fCQxOx/cxWhs4wa0VHQyHfb3bmnrPTZtDoCZxyVAD+2+Wm7xPu4J9igQhNcfdPb/WK4Lif4ihyTMxrkryIX5vAqvJJlEtiShq6no3u0Ay62HiaqA8E72yqnvbvdPpXDM8syFnm+DKwivDg7xH8U76kKgnrefyIAggnQHMbDFTEHAXHN1O/50WcfrrtXH4tt9UQFOXJK3gF7IWPeOCbwb6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5izV6+4tjoXa8Vi+iC0CZwQsDwCmHugup19Q5eZr2uo=;
 b=iuiJDHn276PUOvFgxPkZWs83DFnSM1d3jihPqio/+t1yzhMJ+dXWM0x4arZTyWzO05saNqRJysf1R/GwCetATeH/xn8JowxuFymcWCBToDS2dXv4zfstW19IsTlCa+zuFnT1+QciD74QkUuOF7Yt+gnvPS1vq+NucfBW4LbnZqTaPwhsqFxEz48+MVtf+O7nZdXPxKk13GTCH7aiacN0sb0yd9WRIeDhokyvZ+xxtF1csGXFAPAPl3hndu+CIvZHnoB+IfA2BOzojB2EiBA1LQGHdAnRrmjqaKeNdRZu2ukFzVZlX4bmQmSCxQzuxbGoEkDBn7E6Ei1xaf9OqnqDZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5izV6+4tjoXa8Vi+iC0CZwQsDwCmHugup19Q5eZr2uo=;
 b=Y+BkH5Hlg62vcVRwNkAFEiBzEofNnD7ADDuv0rHtsFlPgUfUKauBmpY3iovY61dgPxSa7xqrJjhH1iIENGNpZj2zoqtfeon7NrauR7jkIJAU3d6c2ggldy2giGss93USmCbB7AzPzsM3s44UrY53isV2AF62g6P0i4lajoKJIyw=
Received: from DS7PR03CA0060.namprd03.prod.outlook.com (2603:10b6:5:3b5::35)
 by IA4PR10MB243331.namprd10.prod.outlook.com (2603:10b6:207:103::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Mon, 19 Oct
 2026 17:38:18 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:5:3b5:cafe::42) by DS7PR03CA0060.outlook.office365.com
 (2603:10b6:5:3b5::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 17:38:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 17:38:17 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 12:38:02 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 12:38:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 19 Oct 2026 12:38:01 -0500
Received: from [10.249.32.38] ([10.249.32.38])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69JHc1Ia002041;
	Mon, 19 Oct 2026 12:38:01 -0500
Message-ID: <4f8ff34b-d16d-4215-b7ed-b23a0d8663f6@ti.com>
Date: Mon, 19 Oct 2026 12:38:01 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: ti: k3-socinfo: Export SoC registration helper
To: Moteen Shah <m-shah@ti.com>, <conor+dt@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <linux-kernel@vger.kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <u-kumar1@ti.com>, <gehariprasath@ti.com>, <vigneshr@ti.com>,
        <a-limaye@ti.com>, <y-abhilashchandra@ti.com>
References: <20261019080736.944127-1-m-shah@ti.com>
 <20261019080736.944127-3-m-shah@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20261019080736.944127-3-m-shah@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|IA4PR10MB243331:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c2f2399-601d-4549-5227-08df2e07c26c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|82310400026|1800799024|261009221227099003|261009223027099003|10067099003|56012099006|3023799007|18002099003|22082099003|13003099007|4143699003|5023799004;
X-Microsoft-Antispam-Message-Info:
	Qs+toQeMT6X7ULh1v4lDURqbYwd7sC94SXvU4D2ZVPytsN1Cix4KzJ3lJ3eLZqtImjeip3Fdk0+07OyL20S1cdg7vFgDbSxzcAywoT2tyDwjKyYZ4ckBYc3hnPSHXa4MwJl4567IfMYwgXWWzvyp/ZrrFHYLkQUn6DHy1cMxM2gLARK04FpVlgQenvvKzr9k9az0Gba2FjECGfIEaP9vuzVXRadXMicSa0KBz4GE7dDV360QyplMsaASbqXhMQOIvgu2eRVMe+bfOHNWqfRMJQGrQ79uhhM9MrZ2Ghyhi9zLun1NlOVBtm22bO3J+0ngeNPFFUt9QzBft7KespUVSMwr8I2yiOEaH7dAVQjrkFYEoOELXzfyINoM+z/bQuND+NlbSY+/I5tQp9fjXTnGHQUX3LrpL7n9XpEBTuPodXpFTC8hOp576y/v6nxvjziGGEowAkG0nJOwSRSblGWP/Pxt5CF3kT5k2uQJo8pDGWN4WmAg7/lKJxazHbWYg/cxCPWmL/SArutu81clc168zDiJkZiydfjWPP+XB8mROqqIl3FFJPaeY4+0bM+lGbAMVK4XorExPKx3eFepbkbGp3KIUNZmxSCczBhEPkkd6eCAg/JGj/lWC+z1NfKrqwPImj+++GFAd+Oo7j4JsA0aMg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(82310400026)(1800799024)(261009221227099003)(261009223027099003)(10067099003)(56012099006)(3023799007)(18002099003)(22082099003)(13003099007)(4143699003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ANmD3N45Nb0Cfh98BIPOuwU0r8xhylS35X5zOoTmv593xwzZ7n42Y7FFnMN7K+dfgcWhL4q27Ej0l2FUurSApVuow637KOXGlyYljXFDpg/e2UQ+GzWewPLOlPfncitOECIEh1cBw0/P0VR5vgPZIhsbXRFBuzuahhEPgoqzNHHZoUSzP/w6JDnwFPWeWPy3HA27qWLpGfBU7eAayc3GN+otSBrb7660fahC7jkbe0ZMM9QP+Pa5CpVMbh2RynDjRyrfKB1ZcZhrknrlzit28qpNU4NQGqiffEDfnOINg/qeHeXHtAPMS4Ygd7os3po8rKTxHeFQIZ0qQPoYjHIFIpa99FrBvJ8jrIFV/39YEEOz5iVx+FaDgUMIGQed4rIJpIFrw5sVQVzbN+kBbpPsZgA5MG7bty4WkakmG6A0frw25kb0l4SV3MWFkqVl14xs
X-Exchange-RoutingPolicyChecked:
	RrtKlaXQIIyEQ5tfpr6GjuaeDd+AHPfmTIeZz8IDrnMZo69FgKMDueh4KPsEyNhqcVTwBJsph/xHLtngx4j2xinq1XIwSP7057WmFtt8JHPpJ98JRfH25XB5a6SPoGVVyyWoq5+b1WxdDt2/Q2jOg5Z6QafAscrzlvLeU5s6YJHZ0nFd/FkqvGReYqpyMPKhaDtMs5ZOdQNdmGHtiQF+ko8ZDEs9RlO5xPRDpLQjuJsF9zMg9PiebEeA/EP1tJ8goUjJ5vOV99EvILVvWA4EeT1kO60axjB70dcc8v+oTIhdm3P3syXn2OYfIeEMsZ8cjynlp2fHZ9P/DFLBetihRQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 17:38:17.0302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c2f2399-601d-4549-5227-08df2e07c26c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB243331
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA3MCBTYWx0ZWRfX+1RMvm0yWLwO
 DcjsqERWaE7OVs7hl9h/BaYmZrN8OYa1AR8y7aNOxanl/1SYIJTzXXBKXokHT8NR1uRwP5C6fnn
 VDufrkhCwT6Dte7uIH/JThSMNccXWiXTq4cQcT5H1HBYPMuz3t1mFFgpbQzbWwynskL8leiDAjJ
 6puJz4849VVcpOeVNmNv0OJl6olDz6jsER+JiUTswHhQWffAjKdChd2ttkdgIvvpSn6cRKe1QIL
 AIe4CrviSjSEIOcsArB6DK7FJk3v91gzy00/FvOhGJ+/CC7TARdzohjmkg7I+MOIjHxMU9OnbN8
 gdaGjjDiEUs4G3YavsPdb0DWWCPA7BhlRuNJ3r37NtcneycVEHLgilwU9hq38REzUW0HIJAWQhK
 v6diI3ZPYsVgk3WVxSKbe4LsCldo3w+agyevRdu2/GdKxtWvDJRsBmysjIcSGgOWZ7aNm/Y3olg
 BgPtQu4bk/OGaDORZpQ==
X-Proofpoint-GUID: rV0DS-PZhZIHt6mZg01MfSXNTjNAGZ3N
X-Authority-Analysis: v=2.4 cv=HPNWhYtv c=1 sm=1 tr=0 ts=6ad6558d cx=c_pps
 a=rlKp08D5gBKtwCtLUzcdEg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=hW3AF2kSHox5Qd4oTxUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA3MCBTYWx0ZWRfX8EZZzG6QOoJ/
 mWEPu6Wpyc0fsnjUEJhrqAV3u8p4+QVOWQOKO0KnQ5BP725k5KfUTpwU7mtgYBJRjtOH4XAXkQz
 /FwxOIyz5NDcCeKwcRcqkA8KJOQ4KqA=
X-Proofpoint-ORIG-GUID: rV0DS-PZhZIHt6mZg01MfSXNTjNAGZ3N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190070

On 10/19/26 3:07 AM, Moteen Shah wrote:
> The k3-socinfo driver reads the JTAG ID through a dedicated MMIO region and
> then decodes it and registers the SoC device.
> 
> Newer TI SoCs like TDA54 use a different path for accessing the JTAG ID
> register, but the decoding of the JTAG ID into the SoC information remains
> the same.
> 
> Split the decode and registration part out of k3_chipinfo_probe() into
> k3_socinfo_register() and export it, so that other drivers can register the
> SoC device once they have read the JTAG ID through their own access path.
> 
> Since the helper can now be called from modular drivers, it must not leak
> the SoC device when the caller goes away. Tie the registration to the
> calling device with a devm action, which unregisters the SoC device and
> frees its attributes on unbind. Callers need no unregister counterpart and
> the helper keeps returning an int. If the soc bus is not up yet, the
> attributes are only parked for later registration and there is nothing to
> undo, so no action is added in that case.
> 
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
>   drivers/soc/ti/k3-socinfo.c       | 101 +++++++++++++++++++++++-------
>   include/linux/soc/ti/k3-socinfo.h |  11 ++++
>   2 files changed, 90 insertions(+), 22 deletions(-)
>   create mode 100644 include/linux/soc/ti/k3-socinfo.h
> 
> diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
> index 48dbef3acceb4..5fae03004e350 100644
> --- a/drivers/soc/ti/k3-socinfo.c
> +++ b/drivers/soc/ti/k3-socinfo.c
> @@ -5,6 +5,8 @@
>    * Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com
>    */
>   
> +#include <linux/device.h>
> +#include <linux/export.h>
>   #include <linux/mfd/syscon.h>
>   #include <linux/nvmem-consumer.h>
>   #include <linux/of.h>
> @@ -12,6 +14,7 @@
>   #include <linux/regmap.h>
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
> +#include <linux/soc/ti/k3-socinfo.h>
>   #include <linux/string.h>
>   #include <linux/sys_soc.h>
>   
> @@ -152,38 +155,44 @@ k3_chipinfo_variant_to_sr(struct device *dev, unsigned int partno,
>   	return -ENODEV;
>   }
>   
> -static const struct regmap_config k3_chipinfo_regmap_cfg = {
> -	.reg_bits = 32,
> -	.val_bits = 32,
> -	.reg_stride = 4,
> +struct k3_socinfo {
> +	struct soc_device *soc_dev;
> +	struct soc_device_attribute *soc_dev_attr;
>   };
>   
> -static int k3_chipinfo_probe(struct platform_device *pdev)
> +static void k3_socinfo_unregister(void *data)
> +{
> +	struct k3_socinfo *info = data;
> +
> +	soc_device_unregister(info->soc_dev);
> +	/* The attributes must only be freed after the unregister. */
> +	kfree(info->soc_dev_attr->revision);
> +	kfree(info->soc_dev_attr);
> +}
> +
> +/**
> + * k3_socinfo_register() - Decode a JTAG ID and register the SoC device
> + * @dev: device on whose behalf the SoC device is registered
> + * @jtag_id: raw JTAG ID register value read by the caller
> + *
> + * The registration is managed by @dev: the SoC device and its attributes are
> + * released automatically when @dev is unbound, so callers need no matching
> + * unregister call. If the soc bus is not yet available, the registration is
> + * deferred until it is and cannot be released by @dev.
> + *
> + * Return: 0 on success, negative errno on failure.
> + */
> +int k3_socinfo_register(struct device *dev, u32 jtag_id)
>   {
> -	struct device_node *node = pdev->dev.of_node;
> +	struct device_node *node;
> +	struct k3_socinfo *info;
>   	struct soc_device_attribute *soc_dev_attr;
> -	struct device *dev = &pdev->dev;
>   	struct soc_device *soc_dev;
> -	struct regmap *regmap;
> -	void __iomem *base;
>   	u32 partno_id;
>   	u32 variant;
> -	u32 jtag_id;
>   	u32 mfg;
>   	int ret;
>   
> -	base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(base))
> -		return PTR_ERR(base);
> -
> -	regmap = devm_regmap_init_mmio(dev, base, &k3_chipinfo_regmap_cfg);
> -	if (IS_ERR(regmap))
> -		return PTR_ERR(regmap);
> -
> -	ret = regmap_read(regmap, CTRLMMR_WKUP_JTAGID_REG, &jtag_id);
> -	if (ret < 0)
> -		return ret;
> -
>   	mfg = (jtag_id & CTRLMMR_WKUP_JTAGID_MFG_MASK) >>
>   	       CTRLMMR_WKUP_JTAGID_MFG_SHIFT;
>   
> @@ -198,6 +207,10 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
>   	partno_id = (jtag_id & CTRLMMR_WKUP_JTAGID_PARTNO_MASK) >>
>   		 CTRLMMR_WKUP_JTAGID_PARTNO_SHIFT;
>   
> +	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
>   	soc_dev_attr = kzalloc_obj(*soc_dev_attr);
>   	if (!soc_dev_attr)
>   		return -ENOMEM;
> @@ -224,6 +237,20 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
>   		goto err_free_rev;
>   	}
>   
> +	/*
> +	 * A NULL handle means the soc bus is not up yet and the attributes
> +	 * were parked for registration at soc bus init. They must stay
> +	 * allocated and cannot be unregistered, so there is nothing to undo.

This seems really messy, the only time drivers need to deal with this
early_soc_dev_attr hackyness is if they can register before the soc bus,
which only happens for drivers using early_initcall(), but that is
not the case for either driver using k3_socinfo_register().

Can you explain why you added all this?

Otherwise just allocate soc_dev_attr using devm, k3_socinfo_unregister()
action can be added unconditionally, and only needs to call
soc_device_unregister().

Andrew

> +	 */
> +	if (soc_dev) {
> +		info->soc_dev = soc_dev;
> +		info->soc_dev_attr = soc_dev_attr;
> +		ret = devm_add_action_or_reset(dev, k3_socinfo_unregister,
> +					       info);
> +		if (ret)
> +			return ret;
> +	}
> +
>   	dev_info(dev, "Family:%s rev:%s JTAGID[0x%08x] Detected\n",
>   		 soc_dev_attr->family,
>   		 soc_dev_attr->revision, jtag_id);
> @@ -236,6 +263,36 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
>   	kfree(soc_dev_attr);
>   	return ret;
>   }
> +EXPORT_SYMBOL_GPL(k3_socinfo_register);
> +
> +static const struct regmap_config k3_chipinfo_regmap_cfg = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +};
> +
> +static int k3_chipinfo_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap;
> +	void __iomem *base;
> +	u32 jtag_id;
> +	int ret;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	regmap = devm_regmap_init_mmio(dev, base, &k3_chipinfo_regmap_cfg);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	ret = regmap_read(regmap, CTRLMMR_WKUP_JTAGID_REG, &jtag_id);
> +	if (ret < 0)
> +		return ret;
> +
> +	return k3_socinfo_register(dev, jtag_id);
> +}
>   
>   static const struct of_device_id k3_chipinfo_of_match[] = {
>   	{ .compatible = "ti,am654-chipid", },
> diff --git a/include/linux/soc/ti/k3-socinfo.h b/include/linux/soc/ti/k3-socinfo.h
> new file mode 100644
> index 0000000000000..487e69d0069d1
> --- /dev/null
> +++ b/include/linux/soc/ti/k3-socinfo.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __LINUX_SOC_TI_K3_SOCINFO_H__
> +#define __LINUX_SOC_TI_K3_SOCINFO_H__
> +
> +#include <linux/types.h>
> +
> +struct device;
> +
> +int k3_socinfo_register(struct device *dev, u32 jtag_id);
> +
> +#endif /* __LINUX_SOC_TI_K3_SOCINFO_H__ */

