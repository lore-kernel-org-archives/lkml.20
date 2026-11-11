Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794416775;
	b=PobnaVn3UCuJeQyTxdgcgb5J7rhZQ2YtuDX4eNIaLN3s7ghgmkqkhcppCPwy0WQtAbj9
	 RZeTQ6Gd66gkIrxGeIWnt354SdhpATZjgloqiJ6z3HtX4P2hgMjSb0HSejeYiSSYZxJmc
	 Bx2SqOI3beYCw0aRpScJeNKdvAJpR2G/QT7ZnKa2BdHJt/G77pCgmjuWpx6UvdIZP/e+r
	 tW7M1uik/YOyToAPxkvvgLEhXo1PFMNTUNqOfzzheUPlVOhKG3pHGcMy79ThEAwlP5h9y
	 IszUJeNuoWahOTVqUcwqvcz3qWgJCpzMJhbDNytigCvFvgSh08cw0yCMrv1DX8US+xQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416775;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uDXZj+hXY+Gh4vZnRqxU+ks5jcrKxrNZjIzpAvGRE70=;
	b=D+lm8JbDN1twf/FYIovRzJHco812IIYpOew26+d2ZNvmgTafC00cNpRuKtU1ibH6Pj45
	 gx2WXJ2CLLAWNKNszqQVFD9ZplGMQU8LPdBA3b9uuuBm0MDav1SBEiA38RdcHsO5d9jzz
	 Wtjz8tXhkgP++NSTxDvCKKQYYu6FJxFucKunVxlTt+FbvhtwUFsDWDrpmigRpFZTuj6zp
	 6J5YuCf7zkHSIKK1Z394QOveyKkndoubNDi2uMk+N+wkPSh/RsQhetWZ7o7nV7ycfQox1
	 ndTmnwdpx9D1w8c7dZTRiKAOqz4BInH2BOU1o8wzds4hlHfjqLfvrjVBvk1vdMn0dIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=FQHyGbkr;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=at0NGhtu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3C9606A32A;
	Wed, 11 Nov 2026 17:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B3C9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=FQHyGbkr;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=at0NGhtu
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ABF2o62616812;
	Wed, 11 Nov 2026 11:06:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=uDXZj+hXY+Gh4
	vZnRqxU+ks5jcrKxrNZjIzpAvGRE70=; b=FQHyGbkr7Hx/1wgrl9/Gi755gWbuh
	ao9RnME31/ks3fHCpsCrA+g8LpOaGq3J2cr3FAbLu/WQn6+zZoYT+/Z8pfgTFAjS
	RIFHSjkEHWp0SjWJSukp1yDnv2XXeGVhheiLULwG70d47Kz2gp76h35dO+1eeThI
	TfW+6Xoz3oAzgSTQ2sCKjK9DWqc0W6goPa3racMM09KWGbZSud56+bM3FIK98S70
	j1iQb8SDm74UE9+xkD5PoHj6EYczEkKkWXtsEl8kVQBJEZtFsKcPW0B6RiJZl6IF
	Ylv/jM9ye5EQC+0TbIY1xFo3Ol8RlXNPh5UOrIscbEPbXSjPsoXZTg+OA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010056.outbound.protection.outlook.com [52.101.85.56])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hveupvpfh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 11:06:01 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q0bmyZvyub9mTnkIzuqqtM+1TRzj961wOlJQH8DXNQnrO2dkQQ3spgcvscUi07C4lpL42dF80yJHBQVXbt37KHeysOHQhOOrWDgPtDXtfrsNkiiuzc4WZK360K+598pymrlQ4GQV1xmdmq7N6u0xFzRVxAed5K4DR5GYueoBcN5N+CZrbCaGhPPb8cGCILYVzWD3nsQkwCOP3YkcsSgHKgBNhiEZISjUTKOSyTbVi1gpB2A8GCGsNZjn+sI+/T36OquQ+wqqGq0pY031PIMMZ7JOAlb+7tMxDWcYr1CWCpH5u5/5XqSLsS0K9UgJvCXdaBJY+tC81fcYyNStsxuiwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDXZj+hXY+Gh4vZnRqxU+ks5jcrKxrNZjIzpAvGRE70=;
 b=UsZPKpWU9c2H/D5fpLIJGGdvJcN37Fwr3XK051MPSKCRmULqjcOqYG1oyENEMK1hJfiPzQGq8KjW2TjSkoiGeHyv63fbkVlYt+ui4qeXlkievzbDUUX+skjx83NlxsfAxZKBlGu/evjyciRZgqQCzTj7g4ckU2lBj9v3yHBShK6Dnm1SnkkmwTrukN+TgiqDfk95TIWeGyOzYk54rcSwiVMrFdL/LL7lMNredKdKDipUysNQcWln8luOm/RV1NlehUEvnO4PJnptUGdxJ/fn3+nvL8rIWQMHr+yQIB5d2ulUbAU7iOAfpgf/WVop9X0M+owxXCCuNCq5KtlgcXsZYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDXZj+hXY+Gh4vZnRqxU+ks5jcrKxrNZjIzpAvGRE70=;
 b=at0NGhtuqjJYwtn46qKMcY7TyXcbEWlajGeTjT4n/NUzPQuEsKUWQ+534j7ghGC++srVeg59jN5XPs51ZxRycjbAZPt7vFN2fwNdu9xywSWzFFInI1drjb0As8pyMad3hf+VpycJ9nhBKidJ2bQHFK2VAkAhRoXxkGzeoCg5BbA=
Received: from PH7P221CA0031.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::26)
 by DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Wed, 11 Nov
 2026 17:05:58 +0000
Received: from CY7PEPF000000EC.namprd04.prod.outlook.com
 (2603:10b6:510:33c:cafe::7d) by PH7P221CA0031.outlook.office365.com
 (2603:10b6:510:33c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 17:05:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY7PEPF000000EC.mail.protection.outlook.com (10.167.247.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 17:05:58 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:05:32 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:05:32 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 11:05:32 -0600
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABH5WAp123833;
	Wed, 11 Nov 2026 11:05:32 -0600
From: Brandon Brnich <b-brnich@ti.com>
To: <devarsht@ti.com>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
        <benjamin.gaignard@collabora.com>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <k-willis@ti.com>, <jai.luthra@ideasonboard.com>,
        Brandon Brnich
	<b-brnich@ti.com>
Subject: [PATCH v9 0/4] E5010 Probe Cleanup and Adding autosuspend
Date: Wed, 11 Nov 2026 11:05:26 -0600
Message-ID: <20261111170530.809226-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: CY7PEPF000000EC:EE_|DS0PR10MB6271:EE_
X-MS-Office365-Filtering-Correlation-Id: b3ec788e-2c08-497d-8837-08df40160e65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|261102123227099003|261028144727099003|261009223027099003|261026140227099003|261022113327099003|261021123027099003|261021135927099003|261021121427099003|261022115727099003|261022105027099003|261022075727099003|3023799007|261026121527099003|56012099006|10067099003|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info:
	E0aK/tbLvj80kICOp+oAlyHoVWYl5gB6EHwPg4ZM+dJAYkh3vWVYUo6p0zRCWJpALARdmR8F0arancEHyFyfLWILfsCiwJ5LiM7vqxZLV456t05tUmxbgm4KHFGgcTp1RogBTF+3uwqEIfyFliclczxT4nEUdZ2srZJMOIi0X1Uux7TY4hMoNC00GepnLBck4VnI/OOQrpu0wWgEbMq92+PBohg3UXs1tQFin3ZOcEnqTv8SbNZeaMbPho670sNZzEk4c1RQHOm7l+NYLq2rRN9LiL3e8nLDLmEiBnadI7P+YGmUuZCdMmqqauklJbXRwOSFStwk5ee+y7iTXue3pcT+bGRgK+DN1rXrUgzIK41dHZjUEqoBxmLEnwi+7Jl/Dy7AmNVvO/xl50Rayu46xLLOx1aOEE9TA3ltGMyuvU9us77N/v94FeDo7Xk2JZGTc0T1LBLarTjlkMHFOQE4ZEfq8qm5KaCipZFp2FtB6GS7yEP9Y1r020zdcTCXM6RNkrDohpwsJAcS+hSD0i4yTIqIiX+RaWeoyo7027GL8JSHmq0xAEIxERnP7q6Obc8DR1GEm+mfhxD17S9RUH1TUZ+xWiMJ2d2ox7ueGtsbuvAn9DLVzLNTXaB12sHmS85hT1skZdyiPuHGYuTsHp7BoY8OtVekUuKcjRoyRlo43xA=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(261102123227099003)(261028144727099003)(261009223027099003)(261026140227099003)(261022113327099003)(261021123027099003)(261021135927099003)(261021121427099003)(261022115727099003)(261022105027099003)(261022075727099003)(3023799007)(261026121527099003)(56012099006)(10067099003)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8xEJPpD1M9mFHwQFwMuHcAvtP+vc2PXrkx8Yb1ro83OoSi/lIk/Phhpz3zwceqFJpoc0T0DCcH+CsCQ666RpMfp7ZqJ4TJOPCTUSKA3lbuvFSa/AeG/rJaWccnEZ+SpKIdZogxZGowJWoMDUqBiYHvzLXpLLSow5f/6c9geSYEvQg58OLNNOkAgA4200DCz2NDSknL1nc9As5ihupKxgIuLj55g34On6q49EpHR+NTUfRwbbqGy/D5BkgfbC5D1Zvcu1s5crouYbXjr6UnrimD9pfaBZOs68xhRJczlx0XHJ4ElMXbwPS/S9Wne/nZ9iGTFeMNmW6xxQ8tn9MzHb1rPnmlXPr6BM6Inr8ZDpv3g5LukGqK0IgHc/gMPuR0EJXwX/N1xdplGVun4ufedQ6IqemrQOeVUSWmen1FYZ7HkPP5v8dBEbGR6CmndpA93+
X-Exchange-RoutingPolicyChecked:
	k/6bjFi7a0cz0kqTYwH3eYRGzzddrm4Fz6V672+3glYqnXMJmOpiYW2r06mszP12wntjauzId1FIyVCR2lQfUlsZn1DVqYQDMbP5Q4e3cBzFRK4MXGmq0pR6neY0KzLrAIcvYiuOeNwrdMHs5+6SuIBIqUBCvabNDw3rUw3roOy8ti/PbKa0R3KzWNweUsxYaC1ZR0IkSnqiNBjDPtzZ+uEUhvWW4ZHbHyZHl2o1w+aSbp1fRDprbM/y1hQzDs2Owk+AXE8h381Hx5Bt2xHJTMJwmyzmszw0cCn4sXeMahz1ywhvHt2Lr0uRjMm9JuXCI2poV4SF0TpPB/OrcAHwZw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 17:05:58.4036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ec788e-2c08-497d-8837-08df40160e65
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000EC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6271
X-Authority-Analysis: v=2.4 cv=KeRHIgYD c=1 sm=1 tr=0 ts=6af4a079 cx=c_pps
 a=CnS1ju6qDdjTg6bRefQovg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=bhPt5b0YHANfMn-v9gAA:9
X-Proofpoint-ORIG-GUID: 2yknmShr8cr9mVy0T0m3DXcp16b78Khe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX4GUR1jTfUbpn
 1AVMeuYtx/9Pw/BtACobbblyNWfYHlR/ETfYCmuRLw//QyuoyOA8AgSl2YgtFlMFoKziJAHrxK1
 31A5mufIgM3vo9/y2Ef7cgi0c72ok5jCDuuMx653yf4l7WevoAi/JgjY3MJSYf12CxBSTI5VBwX
 vmBfIMuBQf+FMBeYA6yVTgjYQ3kal7yaYYcQEFN3VYt0ZRHEZuAEjBJSsuL2T3wCQ9EiWqqPjEp
 EU9RCNpB7mJNAJ1AO5YIn4e9T+Gmd2viR3sCdA6hmrOe8Ke9v3vfAKQShvTY29Berezk4znZfVW
 89NkV2bcE/+X/bcXJmrFYEDx0VKD6O//BMSAZo7How/BeGktDVslGtSBy5f82wPKqMSyHhn2LVu
 ftMG/sT6u2mts1blIa6bC5Z10lpucSOJhAp+sj6kZveml1YO0YmYY+4FNON9DfRZLNOaVeuKfwn
 mvSGm72X61QsRnxPooA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX1ZhtEwXD3P6I
 /QW82X2DrRAeGUH9LvnqHd+SSdb7IdPbWG944ie7HJ7XE726oTgkABmUAFCMNicrx/0bBG02iKy
 Hwo9ImWM4zNmCHiD76MVGZo0UpdehWs=
X-Proofpoint-GUID: 2yknmShr8cr9mVy0T0m3DXcp16b78Khe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110067

Hello all,

I noticed a report from the intel bot[0] which pointed out a valid issue
with the driver never calling e5010_init_device unless CONFIG_PM was
enabled. 

While looking at probe though, I noticed that the clk_enable was never
properly called. That has now been fixed with a proper remove path as
well.

Lastly, I cleaned up the goto jumps in probe to fix an issue where the
m2m_dev wasn't being freed.

The rest of the series is setting up the driver for properly adding in
support for autosuspend. Last patch adds in autosuspend support and
moves e5010_init_device into probe for cases where PM isn't enabled.

Changes since v8:

- Patch 2: deleted new line I added in e5010_remove
- Patch 3 and 4: no code changed just commit message updates

Changes since v7:

- patch 3 subject wasn't formatted correctly after I updated it so
  wasn't properly showing up

Changes since v6:

- Patch 2 changed order of calls during remove cleanup. video unregister
  now happens before pm disable
- patch 3 was updated to account for the case where a reset was called
  and the device was never properly reinitialized
- patch 3 has moved setting the last_run_context to NULL as well to
  always update QP values when device is turned back on/reinitialized
- removed the r-b by Kendall, Devarsh, and Jai since I have made a
  slight code change requested by Devarsh
- patch 4 remove the last_run_context in runtime resume hook that it had
  before because I moved it to patch 3
- patch 4 has updates to commit message to accurately reflect why
  init_device was added to probe
- patch 4 has updates where disable autosuspend now comes before disable
  pm

Changes since v5:

- Fix patch 1 not properly removing all references to the
  fail_after_video_register_device label

Changes since v4:

- Change authorship of patch 1 since Myeonghun sent a similar patch
  first
- addressed Devarsh's comments in Patch 1 to follow similar naming
  structure as rest of probe function
- Moved the clk_enable call after pm_runtime_enable here so I can check
  success of that call. If runtime pm is enabled then don't enable the
  clock here
- Patch 3 no changes
- Patch 4 I added the macro requested by Devarsh instead of using magic
  number
- failure to power on now goes through the existing no_ready_buf_err path,
  so buffers are marked as error and the job is finished

Changes since v3:

  - patches 1 and 2 are new in v4
  - patch 3 remains unchanged
  - patch 4:
      - updated goto to match changes in patch 1
      - update PM calls in probe

Best,
Brandon

[0]: https://lore.kernel.org/oe-kbuild-all/202608140323.qyc8mKlp-lkp@intel.com/


Brandon Brnich (3):
  media: imagination: e5010: Fix clk never enabled without CONFIG_PM
  media: imagination: e5010: Update e5010_init_device Call Sites to
    Ensure Proper Device State
  media: imagination: e5010: Enable autosuspend for runtime PM

Myeonghun Pak (1):
  media: imagination: e5010: release m2m device on probe failure

 .../platform/imagination/e5010-jpeg-enc.c     | 91 +++++++++++--------
 .../platform/imagination/e5010-jpeg-enc.h     |  1 +
 2 files changed, 56 insertions(+), 36 deletions(-)

-- 
2.43.0

