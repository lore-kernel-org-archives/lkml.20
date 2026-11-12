Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794474705;
	b=3Dr6nJV5l1ogZTFA7NHs5GYIPPhYyh/rNIXUOki6YkYmbo4cKphv/2luX4UMff7WoI4b
	 GhtZi/Lcw4A0USiJWUjpbF4v1BNIwMoQuYCZzTgj7k7zl9rUx7bLdFDePXml+51xBnZVq
	 EeUZcBypymi3PIbl2/M0Xfiv5UzDwyGZkqaL/X5mE6upUKN1hrNq08JgkFJSf0o1egenw
	 dGny9h649ZT75fZ4cnxJc8n3PS/8l6w9vqOglU8RfMsBIYSzvw/bHGxaWdLsMQnTuHrVl
	 Sm77q6i0otFEANQL/4YV8yGnr7r0kK8fN5OPOUE2bEFCDQGkb5kNx/K+y8j7l5lzqbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474705;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XnbqZMJu5u7bwwwaz4U0jx/6oO4kHMJQZtrQD/fZzvc=;
	b=vfpOWlrYvJ2quqUqPjX3dQljxcg/i/3nANjLRB78QeTmnW/PBMw0xy8kCbjcNdnfaCGe
	 PlenM7aNNsU4rJ1cIx0TU4hGO/LVYpVmuorHd/6VXRfXhQ2GG5A995FzspX2jXtghbKgC
	 ooGKI3IAqIWEpubNs0Y/d3z4BtqprDeIlA+jU2ID3fVzyry6a9STb/s7KloymRDxH3VR+
	 eevXCFON3AnySC/SwVO2Iak5SbunV3EPw6dI2ixe+4dj45bfvhflutWRIjiRDGszKdeFR
	 sxyBzgB1JoaLD0//s1mDPa8SQRNkFI//rRcOQmdV9FDUCkIvgSu0UpnGPnibEF6QXtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=MEatIkSv;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=bx8L0Ldx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12F9606A323;
	Thu, 12 Nov 2026 09:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B12F9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=MEatIkSv;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=bx8L0Ldx
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7oPKu2308560;
	Thu, 12 Nov 2026 03:11:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=XnbqZMJu5u7bwwwaz4U0jx/6oO4kHMJQZtrQD/fZz
	vc=; b=MEatIkSv+wguGYBTHb/G3R+BOVqX+PkG++hf0rOuo5kfkNGN1cqBdSm5I
	y2vEX4BPbPVSVMhUtCxwGfrXjJf7yKEijgeapjBU1vrdxkqxMXBwajs3IucVwvUY
	XEkHisGfY3UvLD1hCzno7/sT5vJS9UfPlE2/vz99plpyVfUkGN8nCjnA2JVGbPoy
	pjUTmuDFECPGm847x+luDxax+CFc5raYCoxq4BmuR7G0Fa4+6BY+ruhMHfGdWH6N
	uGSlMQEIQkS90xCv+6mGo0/nP0Vd2ArEzdfyt2Vg82sojfrg3SkhSg6WAa0bVnuQ
	t/JWG+nZob0iumfBgaa5cvJdyqnmQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011067.outbound.protection.outlook.com [52.101.52.67])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hvvr6vs1c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 03:11:36 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXRmwCIdQLffqMAhte1XkfkIJH0ALBgy+pEj0iw0u+g9LlpkRlKKUzgThUpr1V6KQiEzm70X2iaLudUwbE5NrWPqMKqU6n44P85VskqmJhCSnWkvJUvO3BxxBmtF7Ay7vxKwvxTdGtlR3Rr3yE2pRarZACT1wRtxDllBuPZxX2wEjiqDR+H7WJNknoDQm0FxSRrT6VjkztUMcn+O9GcGPiOVKMoIfI4RJ0grqckzgRbjvh7cJU+zhPyI7zJlIyqPUv73ZemuWqbB6kCS3SQ68Qgr3Ay6xbGqHN1mSZbzMwpJqwuOqDlDiapb+xxyI1W/sgYQzbAdcWgJiohJW6X6NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnbqZMJu5u7bwwwaz4U0jx/6oO4kHMJQZtrQD/fZzvc=;
 b=o8Croc8SvcqDWGUBZwDOydQUcoHXj951EPyipkwHkkbuynZ2DEOcr455Sv4D3klH/8SdXUouJ/r/LkTVC0NCsszcKqE4m/2VZ8QJaONayFhsmMK0OxrCVMsSlbtEJ48JXqb7IB4eQt4ogfch1dxsdZzBUrEpo6ubk9F7BCASfLjezeoKTFDN4IHZTbFab3evNgJ00UZACkUhZ1Tp+kHgZ4Fzf1Ke7Jq882Ons1w+RQOdbpA6rx3+bIeTjQVKpVibvapX0u7rAe72dv3yw2wESWh24hCPwWHDeF8EQs7bGfrbN05hk564Xplh6zKfsmFN4++XvR54X51cPVnfzT8C6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnbqZMJu5u7bwwwaz4U0jx/6oO4kHMJQZtrQD/fZzvc=;
 b=bx8L0LdxV7w4kom5OIuv6uqL32iDqbcfGd/EKeyls7hFUT5DRjOMFKT+A/FTjZ/6p5ANB54bSyUDj9P2+aYmQL5OCestb2JFql4UChmLVshzuPGBcrLDRT8r47LS2aeik/XlJTponaJ2rR0ryP3WW6SEHYmeNw9uCLkwZ+pTQHA=
Received: from DS7PR03CA0177.namprd03.prod.outlook.com (2603:10b6:5:3b2::32)
 by IA0PR10MB6916.namprd10.prod.outlook.com (2603:10b6:208:430::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Thu, 12 Nov
 2026 09:11:31 +0000
Received: from DS2PEPF0000710C.namprd05.prod.outlook.com
 (2603:10b6:5:3b2:cafe::8) by DS7PR03CA0177.outlook.office365.com
 (2603:10b6:5:3b2::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 09:11:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF0000710C.mail.protection.outlook.com (10.167.23.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 09:11:29 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 03:10:55 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 03:10:55 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 12 Nov 2026 03:10:55 -0600
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AC9ARY21549289;
	Thu, 12 Nov 2026 03:10:49 -0600
From: Moteen Shah <m-shah@ti.com>
To: <conor+dt@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <nm@ti.com>, <ssantosh@kernel.org>
CC: <u-kumar1@ti.com>, <gehariprasath@ti.com>, <m-shah@ti.com>,
        <vigneshr@ti.com>, <afd@ti.com>, <a-limaye@ti.com>,
        <y-abhilashchandra@ti.com>, <johan@kernel.org>, <kees@kernel.org>,
        <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 4/4] soc: ti: Add TDA54 SCM configuration syscon support
Date: Thu, 12 Nov 2026 14:40:27 +0530
Message-ID: <20261112091027.1601122-5-m-shah@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000710C:EE_|IA0PR10MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fbd80b5-fc19-4ed7-c916-08df409cefe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|3023799007|18002099003|22082099003|6133799003|10067099003|13003099007|5023799004|261028144727099003|261022075727099003|261009221227099003|261026121527099003|261009223027099003|261102130727099003|261102123227099003|261022113327099003|56012099006|261021121427099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	IwPUkDwNS+ZmqgC1b1VAKdAjflKhF1337lgBGd+uxIn15a4h94Dpeiqkt9A5cxBEfjoQJIIuEPcoYdBfvm8gMQpd/TDIhh2T6IeGP3pzgwfLkiGjuWTTjpxktdUMqaenrcr77R4otl3JaPuNmGGRJa0DuwpEPwsHT3GGEfCZcPCuEXmhuDGgDXIDbLMC1s3XvuGd+nBxLjNhqIjCTThZ+PYzynKDpWfFoJUMAwmo8U/M/xyBCFy6YrghSfKWJzFB4vrR2C1zUNfVv6iJD83JM43eE4usUpYZbeFxAKo7V2lFk88bvBbGYfDAzFlQvgLuxB0cIIuUxd/RPZGi9KoF2wdHzEFgOTYSaK2f9XNgkmamPrgjq2hpJ3rqPxgArv/z8G5IjRgehBc/BCe2ILPWrXULyoBZ6bRqGaT+ZmRbdsla5Z4Rqg9NlIKcmv2JEKa5gKSeP0uax+x9u6ttHLA8mdH4w0OLPn2cUDa4626L0jxy8UFmHqhnYuOy8/odMUBnDGMgz5QJ7xHjB6n8ExvuiGnALOETyedku4wjhGsnyvG25yEaCoia8nz3WMZVHLnRi5Fhfkab+gV5kjcINT9+KeYN6SXR91iTyPlgKNmkIwVk1VsM7X1olLtZ8h+oU7Uuwa8qRcumr1WoV7gI7hLLvQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(3023799007)(18002099003)(22082099003)(6133799003)(10067099003)(13003099007)(5023799004)(261028144727099003)(261022075727099003)(261009221227099003)(261026121527099003)(261009223027099003)(261102130727099003)(261102123227099003)(261022113327099003)(56012099006)(261021121427099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	c8Z/JMXVuB1PjUQhQFYiRe8nRw4Y/mXACfpSzIGvVZyEXOpKpVBRsJLLg0Pbqxk3IHQUNoXD8GGs6m+CGgEbB9FeKUaRWzoD0hmvM5fQ4wv+CNohROkU78958Uo1t37waDgxQwdWxpOmpwhwzMhmnmAZvwYb9Mb/vtgWAGQy2cCh+a9/MrzanLlDyzF+00LiuD9bIYwVGL8hZdcsnOuwSLzoXwU4WSIZPH6qHPWhUo04qcZfnUAgOPXuXyNMR4ca50UglbpmRx2xUzQjTQ0zsecE/b8Z9oT8MBdnui86UBp2573zwHHPFhmlK+3T6zYe+k1uwXa4ChijqJMJGym3+LeRRRzSXvqJYUSDY+BID5bDadCbH/65gtbgjJA6wo3J4c5qDvuZxrfFI/73QKpjLlI9ZWvXYpmvZ3FVMHDOo3KGkiJqKygXzOEwJpRuh4To
X-Exchange-RoutingPolicyChecked:
	jomFxXGm5jNUkKyoA0KnIRq4YhuwG+XGHQicivAe3UBCHx1X7goZ2fjxDCZlFGMEcXXRDqGF6au4sHWUXwyPcNhoGwk9iTJg/SC48ZAtPPfHUlkNgI9lsgq7nbbaLnFQheMmf1ToCpnuzJBGFOl4Pz0BnvsCYZ/u0owVekaqQpyNmhVCA9qdTgYnuyl6+ByGr4lTuQzofyrNYzsxzpuvm7pN14nlV9hiYbQxCwrScch/tS4duDwFbzNH0sKADDEbsWzx8XsuseBvcZEucD2X5egz6lqiUYYNWoCtkDbJDm0+RALrlGcp1B2i4AtcUhcrNYaJe4HCMenRifDeWhDL9g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 09:11:29.2689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fbd80b5-fc19-4ed7-c916-08df409cefe4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000710C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6916
X-Proofpoint-ORIG-GUID: tMhXj1O9lcQA6pzyTVxbOaPrpzOrrF3v
X-Proofpoint-GUID: tMhXj1O9lcQA6pzyTVxbOaPrpzOrrF3v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfXxjfzWfS6erRp
 WMjTLEDxYpkYmVdA0dJbg3BS3Lpcgf49WRSDWRq5XoLmGcFwlE34NSuEb3M9J22gkZzBNPRpzjX
 AOaqSD4vfAAPhEW9Wsi4eEpBMFFv0y8TkD7xgBdyyRaWmFtSThah83ZeqUfTgBvuDvBe3qCUkvp
 EzgatIMJivl2nHWoGB7aQwIB+HETzxX3QH/BeZ1A5nEf+Wj+op4QUDk94MIoh3RPCf3LAXgqEcm
 4UuhlPTbiXgO3Vyln0nGcAGkSSAK77Yz0XhAfTRwjXY8xHSCuiYgiT90DdTvaxJj4q1iNgrOGLq
 h1Itkk6+Cbio1vmqla5yQKVMV22xYzPLzrjNj38uXd9JAO3xakg64kI4e6Njl1MFkgrkgpQNikR
 PVn+4iyvhhTTxiIYihkwwTW2xJSM0GolmLZ4I5mm66jmTtK684TSl7zLmYXk7k+TKj0eM045+qM
 fgwCJz/sY4w9hDMTmzw==
X-Authority-Analysis: v=2.4 cv=MpLHeGae c=1 sm=1 tr=0 ts=6af582c8 cx=c_pps
 a=UcHwULevSueSKPp+kiqIJg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=hU-JDQfdbdCR0hOrdIMA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfX5/21YlUsEb0P
 0oWs4nzJpK/yUoGgrlSekMZYdwEU/fdKTIQ5NVGbp85PVidLbN/WIju8HzbWFf2jjC4Rp+1Ydsw
 kVQDxSHM/LlP+5N6DdT0I7vTAJ0/J4o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120036

Add the TDA54 SCM configuration driver providing access to the SCM register
space through regmap/syscon.

The driver handles proxy-based register access and SCM unlock/claim
handling, and registers TDA54 SoC information using the common K3 SoC
info helper exported by k3-socinfo, for which the TDA54 part number is
added to the SoC ID table.

Default the option to m on ARCH_K3, so that the driver gets built for TDA54
boards without requiring a defconfig change.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
Changelog:
- No change since v3.

 drivers/soc/ti/Kconfig             |  16 +++
 drivers/soc/ti/Makefile            |   1 +
 drivers/soc/ti/k3-socinfo.c        |   2 +
 drivers/soc/ti/tda54-mcu-sysconf.c | 217 +++++++++++++++++++++++++++++
 4 files changed, 236 insertions(+)
 create mode 100644 drivers/soc/ti/tda54-mcu-sysconf.c

diff --git a/drivers/soc/ti/Kconfig b/drivers/soc/ti/Kconfig
index 163aadd589d3a..ea5da6722da29 100644
--- a/drivers/soc/ti/Kconfig
+++ b/drivers/soc/ti/Kconfig
@@ -82,6 +82,22 @@ config TI_PRUSS
 	  processors on various TI SoCs. It's safe to say N here if you're
 	  not interested in the PRU or if you are unsure.
 
+config TI_TDA54_MCU_SYSCONF
+	tristate "TI TDA54 SCM configuration controller"
+	depends on ARCH_K3 || COMPILE_TEST
+	depends on OF
+	default m if ARCH_K3
+	select MFD_SYSCON
+	select TI_K3_SOCINFO
+	help
+	  Support the SCM configuration controller found on TI TDA54.
+	  The controller provides a syscon regmap and is also the
+	  hardware access path used to obtain and register K3 SoC
+	  identification information.
+
+	  This driver can be built as a module, in which case the module
+	  will be called tda54-mcu-sysconf.
+
 endif # SOC_TI
 
 config TI_SCI_INTA_MSI_DOMAIN
diff --git a/drivers/soc/ti/Makefile b/drivers/soc/ti/Makefile
index cb800a745e66d..33f4ddca32ed6 100644
--- a/drivers/soc/ti/Makefile
+++ b/drivers/soc/ti/Makefile
@@ -11,4 +11,5 @@ obj-$(CONFIG_TI_SCI_INTA_MSI_DOMAIN)	+= ti_sci_inta_msi.o
 obj-$(CONFIG_TI_K3_RINGACC)		+= k3-ringacc.o
 obj-$(CONFIG_TI_K3_SOCINFO)		+= k3-socinfo.o
 obj-$(CONFIG_TI_PRUSS)			+= pruss.o
+obj-$(CONFIG_TI_TDA54_MCU_SYSCONF)	+= tda54-mcu-sysconf.o
 obj-$(CONFIG_POWER_AVS_OMAP)		+= smartreflex.o
diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
index bf0829fb1d61c..a42c195557266 100644
--- a/drivers/soc/ti/k3-socinfo.c
+++ b/drivers/soc/ti/k3-socinfo.c
@@ -50,6 +50,7 @@
 #define JTAG_ID_PARTNO_AM62PX		0xBB9D
 #define JTAG_ID_PARTNO_J722S		0xBBA0
 #define JTAG_ID_PARTNO_AM62LX		0xBBA7
+#define JTAG_ID_PARTNO_TDA54		0xBBC1
 
 static const struct k3_soc_id {
 	unsigned int id;
@@ -66,6 +67,7 @@ static const struct k3_soc_id {
 	{ JTAG_ID_PARTNO_AM62PX, "AM62PX" },
 	{ JTAG_ID_PARTNO_J722S, "J722S" },
 	{ JTAG_ID_PARTNO_AM62LX, "AM62LX" },
+	{ JTAG_ID_PARTNO_TDA54, "TDA54" },
 };
 
 static const char * const j721e_rev_string_map[] = {
diff --git a/drivers/soc/ti/tda54-mcu-sysconf.c b/drivers/soc/ti/tda54-mcu-sysconf.c
new file mode 100644
index 0000000000000..3ef82e737d095
--- /dev/null
+++ b/drivers/soc/ti/tda54-mcu-sysconf.c
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TDA54 SCM Configuration syscon driver
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ */
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/soc/ti/k3-socinfo.h>
+#include <linux/types.h>
+
+/* Size of a single proxy window into the scm_conf register space */
+#define TDA54_SCM_CONF_PROXY_STRIDE		0x4000
+
+#define TDA54_JTAG_ID_REG_OFFSET		0x14
+
+#define TDA54_SCM_CONF_LOCK_KICK0_UNLOCK_VAL	0x68EF3490
+#define TDA54_SCM_CONF_LOCK_KICK1_UNLOCK_VAL	0xD172BC5A
+
+/*
+ * Claim registers start at 0x3100. Claim register i holds the claim bit
+ * for each of the 32 registers in the (i * TDA54_SCM_CONF_CLAIM_BLOCK_SIZE)
+ * .. (i * TDA54_SCM_CONF_CLAIM_BLOCK_SIZE + 0x7c) block, one bit per
+ * register, i.e. bit b of claim register i corresponds to the register at
+ * offset i * TDA54_SCM_CONF_CLAIM_BLOCK_SIZE + b * 4.
+ */
+#define TDA54_SCM_CONF_CLAIM_REG_STRIDE		0x4
+#define TDA54_SCM_CONF_CLAIM_REGS_PER_WORD	32
+#define TDA54_SCM_CONF_CLAIM_BLOCK_SIZE		\
+	(TDA54_SCM_CONF_CLAIM_REGS_PER_WORD * 0x4)
+
+/* Per-SoC register offset data (platform data) */
+struct tda54_scm_conf_data {
+	u32 lock_offset;
+	u32 claim_offset;
+	u32 claim_status_offset;
+};
+
+static const struct tda54_scm_conf_data tda54_scm_conf_data = {
+	.lock_offset		= 0x3008,
+	.claim_offset		= 0x3100,
+	.claim_status_offset	= 0x3300,
+};
+
+struct tda54_scm_conf {
+	void __iomem *base;
+	u32 proxy;
+	const struct tda54_scm_conf_data *pdata;
+};
+
+/*
+ * Make @reg writable through this proxy.
+ *
+ * Proxy 0 is the default access proxy for all unclaimed registers. Its claim
+ * bits are tied low, so it cannot claim anything and needs no claim to write;
+ * it can write @reg unless another proxy has claimed it, which is reported by
+ * the claim status.
+ *
+ * Any other proxy has to claim @reg first. Registers claimed by a proxy can no
+ * longer be written through any other proxy's address, until that proxy
+ * releases the claim. The claim status is set once any proxy owns @reg, so
+ * read the claim register back to check that the claim is held by this proxy.
+ */
+static int tda54_scm_conf_claim(struct tda54_scm_conf *scm, unsigned int reg)
+{
+	unsigned int block = reg / TDA54_SCM_CONF_CLAIM_BLOCK_SIZE;
+	unsigned int bit = (reg % TDA54_SCM_CONF_CLAIM_BLOCK_SIZE) /
+			   TDA54_SCM_CONF_CLAIM_REG_STRIDE;
+	unsigned int claim_reg = scm->pdata->claim_offset +
+				 block * TDA54_SCM_CONF_CLAIM_REG_STRIDE;
+	unsigned int status_reg = scm->pdata->claim_status_offset +
+				  block * TDA54_SCM_CONF_CLAIM_REG_STRIDE;
+	u32 val;
+
+	if (!scm->proxy) {
+		if (readl(scm->base + status_reg) & BIT(bit))
+			return -EBUSY;
+
+		return 0;
+	}
+
+	val = readl(scm->base + claim_reg);
+	val |= BIT(bit);
+	writel(val, scm->base + claim_reg);
+
+	if (!(readl(scm->base + claim_reg) & BIT(bit)))
+		return -EBUSY;
+
+	return 0;
+}
+
+static int tda54_scm_conf_reg_read(void *context, unsigned int reg,
+				   unsigned int *val)
+{
+	struct tda54_scm_conf *scm = context;
+
+	*val = readl(scm->base + reg);
+
+	return 0;
+}
+
+static int tda54_scm_conf_reg_write(void *context, unsigned int reg,
+				    unsigned int val)
+{
+	struct tda54_scm_conf *scm = context;
+	int ret;
+
+	ret = tda54_scm_conf_claim(scm, reg);
+	if (ret)
+		return ret;
+
+	writel(val, scm->base + reg);
+
+	return 0;
+}
+
+static const struct regmap_config tda54_scm_conf_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.fast_io = true,
+	.reg_read = tda54_scm_conf_reg_read,
+	.reg_write = tda54_scm_conf_reg_write,
+};
+
+static int tda54_scm_conf_register_socinfo(struct device *dev,
+					   struct regmap *regmap)
+{
+	u32 jtag_id;
+	int ret;
+
+	ret = regmap_read(regmap, TDA54_JTAG_ID_REG_OFFSET, &jtag_id);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read JTAG ID\n");
+
+	return k3_socinfo_register(dev, jtag_id);
+}
+
+static int tda54_scm_conf_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tda54_scm_conf *scm;
+	struct regmap *regmap;
+	void __iomem *base;
+	int ret;
+
+	scm = devm_kzalloc(dev, sizeof(*scm), GFP_KERNEL);
+	if (!scm)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	if (of_property_read_u32(dev->of_node, "ti,proxy-id", &scm->proxy))
+		return dev_err_probe(dev, -ENODATA, "missing ti,proxy-id property\n");
+
+	if (scm->proxy >= 8)
+		return dev_err_probe(dev, -EINVAL,
+				     "ti,proxy-id must be between 0 and 7\n");
+
+	scm->base = base + scm->proxy * TDA54_SCM_CONF_PROXY_STRIDE;
+
+	/* Get register offsets from driver data (matched by compatible) */
+	scm->pdata = of_device_get_match_data(dev);
+
+	regmap = devm_regmap_init(dev, NULL, scm, &tda54_scm_conf_regmap_cfg);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	writel(TDA54_SCM_CONF_LOCK_KICK0_UNLOCK_VAL, scm->base + scm->pdata->lock_offset);
+	writel(TDA54_SCM_CONF_LOCK_KICK1_UNLOCK_VAL, scm->base + scm->pdata->lock_offset + 4);
+
+	/*
+	 * There is no way to unregister a syscon regmap, so publish it only
+	 * once nothing else in probe can fail.
+	 */
+	ret = of_syscon_register_regmap(dev->of_node, regmap);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register syscon regmap\n");
+
+	/*
+	 * SoC identification is informational, so a failure here must not fail
+	 * the probe. It is registered last and released through devres.
+	 */
+	ret = tda54_scm_conf_register_socinfo(dev, regmap);
+	if (ret)
+		dev_warn(dev, "SoC info not registered: %d\n", ret);
+
+	return 0;
+}
+
+static const struct of_device_id tda54_scm_conf_of_match[] = {
+	{ .compatible = "ti,tda54-mcu-scm-conf", .data = &tda54_scm_conf_data },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, tda54_scm_conf_of_match);
+
+static struct platform_driver tda54_scm_conf_driver = {
+	.probe = tda54_scm_conf_probe,
+	.driver = {
+		.name = "k3-tda54-scm-conf",
+		.of_match_table = tda54_scm_conf_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+module_platform_driver(tda54_scm_conf_driver);
+
+MODULE_AUTHOR("Moteen Shah <m-shah@ti.com>");
+MODULE_DESCRIPTION("TDA54 SCM Configuration syscon driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

