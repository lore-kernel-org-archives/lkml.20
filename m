Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792766812;
	b=zW5rz0iu4N+1HHgz4eZVA0ntOGIDWuqYhIexIUWYsaz/4zL8op0/BobtgJOLPwO3bCHo
	 p+0wqahr46uIC0auZBK7q8CfXFTvJcJQ3hC9OTbljYZw/BaZ/WLcNSsDvP179Tfr5CAX1
	 DGMpAwQbbSqbTS0tjECenpluyY2CSdV9XyT66QaFxvwH35MkdrgRJJjcYZPyE0InoHYun
	 jsTohgJpxZwnZ2VBLj67o2GEZrTPFA8ouuyZleaEoQwESxvEXakvLxOCrnAm7T+8e1RrW
	 TRosdzc4AASW/lx2ZvWtkMYX586wJYyINm6HnS6m6p9vMyaJbkyxcvvaZAWj/2vQG9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792766812;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4xEnffrin1LY8Q7ze/wItnPyhArJqLNXZtgrBZLWHwo=;
	b=enl2AXawTjDcGNpU6m75tvfonhhjAIHOyhwCiWsvyT0OKY7XFG4jfmtx3rp7WtoJqzPa
	 7wKtfAOreyqo94uwbvMSAhBBqJnhiYwknRKrxWbGTMNsX+t+WPaR3sS0/yrblhEPe3QDP
	 aYPXb64Fdp0RupXTRF+iAs2I7aYxts49SkuQvIQJn9r/Gx4ErGx//BksUmMk+PdNgbVFu
	 dXqymyAmKSHL4jwfYESeIE3nqtrHhXGVArd6raOIignhA53ShlyrSWnAKLmxclCoIcbUN
	 0ioe94EyXwF4YjpGv3LKL+8AmT9lPyriHjkA3b7GLmWeNCGj8yFejUdjbuTMRJsZKqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=lovNdjtO;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=I2+jGdXx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1376E606A326;
	Fri, 23 Oct 2026 14:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1376E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=lovNdjtO;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=I2+jGdXx
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69NE5dZf1740039;
	Fri, 23 Oct 2026 09:46:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=4xEnffrin1LY8
	Q7ze/wItnPyhArJqLNXZtgrBZLWHwo=; b=lovNdjtOiUtsG6NbQPdlcry2jpbKP
	gDyjJhph+re/W3O0HFiM2TIpq6Dbg+bX0W+Rqn9a/l3muD5tFz3nGX4IExP7MswX
	0u+wgfbr3QmSjTXL1Hk6b+egAaOLR303hEOlzT7YImW7e5/ojm4UtINENcwi/hyk
	gW/IqwqpKG+aA7+GgNCBwe01mvlaBiJqsckAfYWt+nZcrPLo2MFrW3Z4k+djm2sq
	NmJ86ZxtESMcecS7UV92UClJFiDhd+3eCxcidW2CEDKybtSEwTwEtrqxfxS8OMuy
	TK6EooHyTbf/IVbtYFtVoLOkhQEXfutRpPl0Qv3WsBMyEI5Gm0e5xJxiQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011018.outbound.protection.outlook.com [52.101.62.18])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hfmg87402-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 09:46:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkDPZE5bnFRFjt2TK0gKwS84eFp3geR1LT6tHFqhHOe773BR2cugYaobKfQKMl7YtmzrjWQf1abLT3bxa22SeBsTbjq/aiUArEiy64i50bejHsFzRnNg/FhesMKTGQT8wmMYV82r6J7io9UKk89VPeI/5cpwhbkAHXDlIiKlm7wumPLwieomA7I0M/6wNqtdoc9oWEQhE/rKNhnkalmNW+8AhNV1h8RfGG4SkcpYMFtsOTFpKuvo5f+VhAgB2Lr6sVjXFNjL2Zt65t70tX7Oi8fGwqjfh5UtqrcNF83KPKOOq3KkPsKLjz1sFAUmrA9SYD8vmoXPI5jXba6OrQ7gIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xEnffrin1LY8Q7ze/wItnPyhArJqLNXZtgrBZLWHwo=;
 b=ul3O4r1DPZ2OiOxSuXzBz8Dy4sy09Npq1POppD3JFnvEnfJa68M373DeMDMWCXdM4Q4H3ElcN6kwhzaablJomh3eG8ocdHmfP+pTQT1ttZ5mJdhVLNC9PsgaKPRFUN9SGLE8hkBBq5DfdodT8Vr2W4xsGtYwtDRZhIYdTufwfWdsbget/ca9nT0KZK4cPZ67Xh3BEA1d03VgOYJab+tkNb9o4Q3G27Iy0Gns1d9bLW/cwwecMLxClwDFiBEcUDvP10apcDU60W6+avvbeLAkEIQ/DyGNr8nmFLclNK3pQCl0D0LIPzhc9rVNhuPqY+wAHuHqLtXeWTvWnyxEFz1TcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xEnffrin1LY8Q7ze/wItnPyhArJqLNXZtgrBZLWHwo=;
 b=I2+jGdXx/W6BuM/BtmetRhwBpvZ9QlYIOtqZnatcQIPX5u/G5yR9nYrkbMly/EOn8/hV+Em1IwLEEYA6Mm6OedOsZmbgvc7mOaITH/Xwv8fGCiPVCLNDaFpjQ6O5QHLvx5xlkjSnU6DFq9hiaiWa/xWX/gCj/5esI3K7yfH54Ls=
Received: from CH2PR08CA0010.namprd08.prod.outlook.com (2603:10b6:610:5a::20)
 by SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 14:46:39 +0000
Received: from CH2PEPF000166BD.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::9b) by CH2PR08CA0010.outlook.office365.com
 (2603:10b6:610:5a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 14:46:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF000166BD.mail.protection.outlook.com (10.167.252.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 23 Oct 2026 14:46:39 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 09:46:21 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 09:46:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 23 Oct 2026 09:46:20 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69NEkKtK3571302;
	Fri, 23 Oct 2026 09:46:20 -0500
From: <b-brnich@ti.com>
To: <devarsht@ti.com>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
        <nicolas.dufresne@collabora.com>, <benjamin.gaignard@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <b-brnich@ti.com>
Subject: [PATCH v6 0/4] E5010 Probe Cleanup and Adding autosuspend
Date: Fri, 23 Oct 2026 09:46:14 -0500
Message-ID: <20261023144618.1652390-1-b-brnich@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF000166BD:EE_|SN7PR10MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: 899d4ee2-528c-4949-8469-08df3114723e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|56012099006|261021135927099003|261021123027099003|261021121427099003|261022115727099003|261022105027099003|261009223027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	scEuHNaRn+W+V+QrGzUiDhiheku6Rw3VcMoxbEjMma6QCB1BU/gZMcBRHvCPYdcksk9yTH4xvViyZM1eI031u81bSYrw5kMBKr8qT1xhZ3scLnPocpleqwQHCdw11KosT+8VGWS3s1H5fs356VSfDCtU5qXDrLgXOPK8HOucZgj+ZRfOvjwntXqCHeSvPdTRNaxvNNkAkgjvRksbAA+uIveT9PtTCoXXXB2kd8xeVt2WTGiY+RXwFu5o5zQxS/5i5TsPeh66ErKVMTrLEgLAZZjFxVLy4EeH8WwztH7idNE776gTQP1b7TIqIpXT6q8Nh3RwPpzHLIrLYylScXvKVquwF+3ZVf8bQ8+ulG4Gam6Zxp6N3QV5xwLaS9sd38YeDbJdmEHUYLLoewjNOL0L6v5h3/cLu6RQst09a6Efb5iZrcl2KCKrEjIl0fyT17k0Gu+QjO+JMARWyy3kKeC8uhLS+T9WVj0l1RkEJ3Vk4UYGxvpSVGhgdC6kE/uCWok09DG0Tz6xUbxPmalCwR/QEJ9bcx6HcJB/97t8VgLgQS1lsZheXrqJeXbuBATlPi9PJzl7Nb0jq5FGjg6dkICQGnABTkBO23vNs7ovZ+JH0MlvqOOTWxXF77me+tVwD6UCMKtWvqJyCaL8pKcumxETYaO52EDdqAIts3oJ2/KiZSM=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(56012099006)(261021135927099003)(261021123027099003)(261021121427099003)(261022115727099003)(261022105027099003)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oCvFMqKZddNm/qbe2wJZ1WbB8jNyGTJTG9plNkMNhApcdb+3VEqU1z6k3PYF0ELNdtaDPpkLO+1u0MRVGISh7edmybc5pBAEe3ENE4gcn255svz0S8yS957tQDh8OfaU+YO+fWNH6i1wD2mGMhMqfJ9KDxOK5jsvKF15olM156nPKr8RxvORlEgqJoETGZIMWrC2y4PSeAMbxBpobQCUeUYjKheud5xn43krfu8reZ8Q4j8o25PSL+bc+8scjwrcWX5T4DN56cnEYr4dNSf3K2TOKmu9lFU0uuNX++mDuePBdcwOMdm8DXH/OEnS0pnqQi5UOtY5iG4XxrzDuOWwpsygRlsd/IlKq04dUrPJi4Scpmw86ju3gm1SHFOc3Bb9KHhYbQi+QPAo4Qy04L6KsagOb88UZu0YKWWfhy/dLFEBg7FFMt+bfZYE/UYQi56g
X-Exchange-RoutingPolicyChecked:
	OYCtRCSHVbgGfj6ACiYhfT/WjVztmGf9zmho7YlOHrGQGDXnXjeLfY50gMUyfkh0kkvwfgALmv3lIItUCjHhH/8Tto0A39RR7DKJmpGFx0T25D5Z2AIo60xEIhGf3y0dRf0o4raFH99eoo7kcPoPZ6z7k0SrlHEYolEfJimBjdmg4/g0GzT45ApqEei5bSa8KGw3DrZXZdAgy59h/cGCpNh7BlMoIjHrtr9xEzxY7rLKocAYgUX/35Y1I4Yq1s7I8BtG+g2S/E9tbFCPZd7A3qcn0rDmPggt4DyXmZS4Xb5DW6XFPpk3U+HJfFd9/fGbWn1ke6gf2gvSdJ+4RD0JRQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 14:46:39.4666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 899d4ee2-528c-4949-8469-08df3114723e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000166BD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6287
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1NyBTYWx0ZWRfX2R2F2pMzRu2V
 +AHSxfqvKQwd8tKGYgUYfC++k6R4lshma1n1oXyT5OFl3AR+ZR7riGYILGNH6DVzxuvYFFDrZAw
 A6/4qXsgIOuxGgbHsiO5G6Hgeeffmc8=
X-Proofpoint-ORIG-GUID: szM_SQ8S3YAztkvoUHmkVC_Tksc3OMRt
X-Proofpoint-GUID: szM_SQ8S3YAztkvoUHmkVC_Tksc3OMRt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1NyBTYWx0ZWRfX2hsmd7ksXA2a
 emAmRwHkszu8guxpFAbA3NPOh7oMjo34Ax1EnpHfKnVH9af7J0cVA0lz05SagdzALMxVumBc5aF
 LxFMfUbUDTj4ggoKc8TyAGOiaYaqzF/0N5S41SZJI09JRjrl8zmKNhTYRkYANaxhKk0J9Nzr8Km
 UYMMx5sHeYkEBTv5sv8/FS5egHnc7Y2nS09i4tQU0sA0EJPsG9iLbXZ1ABkY81GxSZdMx3tsCtp
 M0K+/A2ymy8w+R9Cv7attyjDQvJNWh+D3cNN3NKvaAbg8fKh7GjlRI0lY3lhPpg5qFq8k35q2Pq
 VxWiRcdbOKYiteAiXwPMFJUNr4CrJah6iV4MDqZOnXbavoL2+oTlzDYJRAjzNuKwHbmGjbCTlVp
 YZcq/B92y+pZa+4X0YU4sa5RW4OZtmnUx/4LvVm2e5KYWLWS45yvtka9BiE/USj5iO3+7ezA9Bs
 jx7ujdpoNTt3jsUJOow==
X-Authority-Analysis: v=2.4 cv=H/1OUOYi c=1 sm=1 tr=0 ts=6adb7359 cx=c_pps
 a=QW6cWtaKxEx5aDBFEJsq+w==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=sozttTNsAAAA:8
 a=3KFijOh3VjW_D7tkKcMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230057

From: Brandon Brnich <b-brnich@ti.com>

Hello all,

I noticed a report from the intel bot[0] which pointed out a valid issue
with the driver never calling e5010_init_device unless CONFIG_PM was
enabled. 

While looking at probe though, I noticed that the clk_enable was never
properly called. That has now been fixed with a proper remove path as
well.

Lastly, I cleaned up the goto jumps in probe to fix an issue where the
m2m_dev wasn't being freed.

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
  media: imagination: e5010: Move e5010_init_device to Runtime Resume
    Hook
  media: imagination: e5010: Enable autosuspend for runtime PM

Myeonghun Pak (1):
  media: imagination: e5010: release m2m device on probe failure

 .../platform/imagination/e5010-jpeg-enc.c     | 86 +++++++++++--------
 .../platform/imagination/e5010-jpeg-enc.h     |  1 +
 2 files changed, 52 insertions(+), 35 deletions(-)

-- 
2.43.0

