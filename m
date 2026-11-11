Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794403267;
	b=Yhy4DKSTfRPbYtJt5HFjI2yVgXIndlfz271BXcPAoS35CLEX5T2IrMdKEnQSWi3sxTID
	 oRCjYLrSUAYtBIMX2GbT0f8O3Lu9CiaH5S4P6e6FGIiwwoRujX5kZaUp6HEI0KOLZiHDP
	 hquTH0HBkSgAU6J5YcSKxu485bKdPphAg6pSzpqbuFEiFBOLWPLqj4WTA/UMR2ex/1t/P
	 vpE4brvONdRsapABG5HqHmqohMYulmv+cnd0mm2QxEbiiw4g9mvY3zA5mGnQFlx6mLC2b
	 x2l07VaScegVWHVrd6hZVugST/ZzYYDkNhZfiEieHcm13rBLtsHwrbFGGC7J/lyJ3ug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403267;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-EOPAttributedMessage:
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
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=IS+PA+uE31Dr4KlDN7DSr5O1xwRXCTS91jTyEsl3YCA=;
	b=VchOxgFfQlXjDsut4C62KRkIccqswqG57Gmik+E9mw6vTjdC9p57Oqfsb0LLBwY//s8G
	 m10RTR9R/tB0H9LZ/XrBrq83ToFlR2I+O1Llzrvc7e5h6pxRdKDWDnzS0Xa9hZy6isOC1
	 2zdHFOJXU2VHEpnSpEE9AZdEYrFhs/smKCy/gdKR54qpgu+MQGerTw0QTQSLPQGcSp2/J
	 9IzcIasP4CDao1PYiqHqoeGzJSc6/FLJDNPfjWEvjH/lI5MuA1VewWMAwe1OY+/W0VK4x
	 Dw9xsXJFLWabDHeQpaz4r/iAZqApsPtLwMi38ZNp/J3JoEJPV0h/7lxXqoLw7Y/n1Bw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=TdfU3fi4;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b="p84/U0//";
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09221606A326;
	Wed, 11 Nov 2026 13:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09221606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=TdfU3fi4;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=p84/U0//
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABD4xJ63778547;
	Wed, 11 Nov 2026 07:20:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=IS+PA+uE31Dr4KlDN7DSr5O1xwRXCTS91jTyEsl3YCA=; b=
	TdfU3fi4HG+Ybi8irlAIboNfaTUktlmtLVAFSJuSvq1WR50mN+XawMZaptImXT17
	2ac8yJCGivDkHcR8ntKqLV2IBNrsuWzlrx35Z8sXlbzYI/fS0UaUsFUKiTkvpJmW
	b9+NIhn0WeJoMz5zEw0DOhyKsAWul1w3bDb8wFe0R1bTucW97qZ+XCB3k4TbC2pd
	w1fB2I+36poRDfGzAJh9PnF4PhiM3vzyWSt5fkA0oKesaFyu2iKkJa/KIUFldbP5
	v/33MwPd85/3psbJZ6nE9JYUkZfLNSUOs4B1vsvuCr/4p+vuBvlROM04QE1VmuP9
	906oneCun/o3uCBPIb2hVQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023143.outbound.protection.outlook.com [40.107.201.143])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hv7ursgk0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 07:20:28 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULVHBAIIwEAcLTXd2iqZnGM8K+cvwzlDlSJb7GtRDhVBI3i0Fo+EBrGfRwLW0HcSCA8Gb3I8INF6FSsjI9ypKACwRwkiKV2q5k4rNLh6DaVTPCv0UryHqye+c4g/JES7o5hAIyOcPOPiLr+SwxzihTCL9pM/U/dG4p84rmoZWdHGM1T5Lgy/3yUx6DM7lHbTCWy2pV1meXgOFMubLUGzbDZPqFXCTVurjIUdx5iLPrp0ciTkpPRWn1y6Old45pzSg9GWPJrX5CuTh2dePxitiWrrG68kPCTMtz2mOVQt49NCdBLuFAFzsafXe2KpOcIXK8xKgcrD+K6N7t9jX66SpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IS+PA+uE31Dr4KlDN7DSr5O1xwRXCTS91jTyEsl3YCA=;
 b=Z6ErbrQWnbDe0RAoE1Lk0eMYY/EX3vLi/r4ku1OKAWzN47GMXWAWnShmV58IgZvtmEQxxgO4f48yJ5KUT+dMOqyjqCzfHReMkdkmgvP5GWetAdJWy2tT9/Ub5r9tVIAGDll8Q9IEgXNT06qa1Ub4XaCpzNpYq0KYuMsB6UoYxZAZuBM5GB96OckGrysL5iapmpvYB/F4ZE2/W1TUv7AJCVzcKF2MjtpN5nnNLSRGK+lRvmwHSqqhx3rqIvLr4G6dTtLFYmUDTAQdyhRRnJkjD4V2puxHTXwpbhzHesCChED8STH52kVaxO1MeaexdfvbUwPzcF6v6t2t+RVucXMs9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=csspace.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IS+PA+uE31Dr4KlDN7DSr5O1xwRXCTS91jTyEsl3YCA=;
 b=p84/U0//AsJm1lDtzhluKyW5S5xy2qut+M/4pq9Axue4qP2VTSYUXQYzUDCwv9iuVaiHuDddQx5wm4ALzTfYxhApSsxfigjSezAfVpcFi64Dd/hVSbAd401GBW23fKZyghTvaR8wHXV4IlBYKSMT+fkathSqx/VRWvo820olWew=
Received: from SJ2P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:a03:5db::17)
 by PH8PR19MB8150.namprd19.prod.outlook.com (2603:10b6:510:1bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 13:20:22 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:5db:cafe::48) by SJ2P221CA0005.outlook.office365.com
 (2603:10b6:a03:5db::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 13:20:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 13:20:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 36144406559;
	Wed, 11 Nov 2026 13:20:19 +0000 (UTC)
Received: from [198.61.68.159] (LONNCK4V044.ad.cirrus.com [198.61.68.159])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 124FE820273;
	Wed, 11 Nov 2026 13:20:19 +0000 (UTC)
Message-ID: <f21e12c0-8bd6-4ddf-8e59-7d9461828c89@opensource.cirrus.com>
Date: Wed, 11 Nov 2026 13:20:18 +0000
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
Subject: Re: [PATCH 1/4] ALSA: hda: cs35l41: Add support for ASUS ZenBook Pro
 Duo UX582ZM
To: Zhang Heng <zhangheng@kylinos.cn>, tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Samuele Carli <carlisamuele@csspace.net>
References: <20261111125637.1046581-1-zhangheng@kylinos.cn>
Content-Language: en-US
From: Stefan Binding <sbinding@opensource.cirrus.com>
In-Reply-To: <20261111125637.1046581-1-zhangheng@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|PH8PR19MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: 84dbdf76-b538-41c3-5a24-08df3ff689a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|61400799027|82310400026|36860700016|11063799006|261022105027099003|261021123027099003|261021121427099003|261026140227099003|56012099006|261028144727099003|261022075727099003|261009223027099003|261102123227099003|10067099003|18002099003|22082099003|16102099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	qDwaGvU8RAo0piWSjYh0fJuikWTXHJmNFQDXzRF1cnDvxcJjYRJl6C1lrVccqiEO6ozi83Yzvx3gWKY/V37/VUdhnLRotooBXMcNgRZX7zszrxrjR+CpbkJyfaAwsrUPMfM1SY2BQ3yxbN3TCRyMbUd+Ec2YG7/UdmWUekx1q2Ky53EpmYGCdoKekQFuEm0EMdquiJLGqg7VTsUba+9r+jq9CB05QQuhqgPnut4ccu+EK/3Xkzyw+biYWdAuFku9xumYMBRKwy/9HHc/x0ThyV1uPSdB/40qXgI+GmM3n1cD/N8CL1xz2dySGTgeKoZDZT+lh5U6kjOVKddi5G55GmDbWvfSIvr2iJwh/uIeGqO3oa4M+K6sHGu12KLFgHzGPbrPl9C9gFvjoGPRVyqQ6MmfYoLyIOWBItd6/1YkxBMvkEpH19cgbpF8w0n+DiQoq1hYiFJUHbfFydg1mt8VTsMpkplVtYfwJX0W97FVcPzKWlwrn7lXUHHtr7Hso9/ChZ7Km1GQ61avPd1+rwhH9zoRwEwfnRT8L/8PXuMV0zfRb71V0uc7EnkwSYkiBfj/VTwkVkmJ/YiMFKTcqoIPueRN0Lf/W8Gcz/gesR5PALsCpZqScIvtha7msCgs/MYBetsBK1cfaO7XBQ4XgOfx/Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(61400799027)(82310400026)(36860700016)(11063799006)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(56012099006)(261028144727099003)(261022075727099003)(261009223027099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(16102099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9iJ8jjIC9uGrCCpd3U74H8PsrwhUVZS4AhUtQg+Ym/edjINzTHZLi+UPmcDmLAJ5ZTCPDC90P/iXzlD2xpxEol884ZwTNzhhoeDu6xdSK1S9DqR9IpejprIwLNbWfQ+uGLLgb5fhe8VSeMkOHnjKFeF3usWMvWAhhXtZ/lIxLr6TIUe/vye5d8J18xmfivh3F6DYCHOX354c5CZFP3iCI7eEYzFjAaPRvnoNNY2R2kcGxgoBpf/WKh8VZ8HM6Kb3qwycCTdXgVl0Mc0/JkFTkUZ5+Th86QHQNaV8m2TVoW4cXmsh4SBmRpU8uMOO5OMunpdnreGBBhHwOpMthFsPCNAVD0WwYVqeTek+qVUxZnMdotgAKvi3QdosjhfMoWl7Inyl5zRu0kTVbeTICmySBPU2+Dxc34xf06V3q2gx93xh9qBcMmJ80VLim+quymMu
X-Exchange-RoutingPolicyChecked:
	ZkCuQPpG1TQwHMNxpHqUuBLAf02702gWr1+0m8F+iPtPw+DdAgRkBq0+rbU9Auf0n0OxUfjNBQXTx7n6CIf1kfNDVoIWicvEgsbnod63dWotKHNOzN5vpFO0BKgFId7e3z3VMyWzzTTuXzh5NiU9CxqFow9j2OJT9vlbnjJ/uD9FrKCI9UM0dlESvzOKQEwHKevZlLTyHYHCBdzdQLB0pso/SbfBYoY16UsKr7fjbjo1ozPxLwr/PlSkV5kf3r3ZoOzy7DWHnFVjlkfDcLhGxeMsMvOgI1QMYoaiyd1cycuLugl0Pkgd6DhIyRMHc7LisWHqoLpBU18kER8mKWicFw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 13:20:21.0377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84dbdf76-b538-41c3-5a24-08df3ff689a2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB8150
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX7MDd696cODyG
 00aymFj6jMWx5vP3Zq/xjmOsruHGRI1mcMeGWK/FpLh/NqUk9rUbTVmvOjHD+ajv+dN6FtawXxg
 67GeTla0bAsFO6McCbJNYwphxtaAzZbrYYwoqY6C8cH4edutqdaegMk6BQR+jvgYoCpkeF+JdRD
 p0eO66q/jtW2MAX6akRZe6Yg6y6SA12cm/c5hrOIz99WO05fHR9yduc6XlQDacpc0H+cG16Jno2
 Pd8IbhKmBmVgic/UTjZW2tM4clfhGAmyU7e2I2f5bq4vhut7QFUoWLF0/fboxd/htQvqYgacNp1
 HEwZUghI97pGLntgiQyJcM0c9NZ9fOwZ+h3a+rg+kQLOXKeceiOifWc73guqAMkqK/mDF60D7RY
 tETbvRp6lduaCmTDBdEGVYWjCRt4dy0nUOBUynpnNJpHCVeQ782RyqfCLUVv/bVooReJnEOx/dY
 Bfj6kh+/2vvoeFheguQ==
X-Proofpoint-ORIG-GUID: cTpH6_nuzJsx-vuBzwdeWCWNhkmZCNhg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX/Hn/P3ycfXag
 egP8g8RQHMM+PwP9XcuWbxYrAhQQ8xef9zim1B5QlOPw/3II4aFFpvy4dugg/jDZQ3OLg8maRet
 Q88AN2mOxli024gi2s5rysXwxrVpCnY=
X-Proofpoint-GUID: cTpH6_nuzJsx-vuBzwdeWCWNhkmZCNhg
X-Authority-Analysis: v=2.4 cv=JagpPkKV c=1 sm=1 tr=0 ts=6af46b9c cx=c_pps
 a=TDYc4WexHdh/ivIjU2umhQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=mVIoH_3tAAAA:8 a=9MC2tdR68sn2y48BmlwA:9
 a=QEXdDO2ut3YA:10 a=iuRnypM2cKLCuXRkTNnD:22
X-Proofpoint-Spam-Reason: safe

Hi,

This is an internal boost laptop not an external boost laptop.

I think someone previously sent up a patch for this laptop, with the correct settings:
https://lore.kernel.org/all/20261030170354.7427-1-slatonchristie@gmail.com/

Thanks,

Stefan

On 11/11/2026 12:56, Zhang Heng wrote:
> ASUS ZenBook Pro Duo UX582ZM (SSID 10431A8F) has two SPI CS35L41 amps
> but no _DSD for SPK1, causing -EINVAL on probe.  It matches
> 104316A3/10431DA2; add the missing config and prop-model entries.
>
> Reported-by: Samuele Carli <carlisamuele@csspace.net>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221981
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
> ---
>  sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> index a2e6b3024820..ab909218d0db 100644
> --- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> +++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> @@ -116,6 +116,7 @@ static const struct cs35l41_config
> cs35l41_config_table[] = {
>  	{ "10431863", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 },
> 1, 2, 0, 1000, 4500, 24 },
>  	{ "104318D3", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 },
> 0, 1, -1, 0, 0, 0 },
>  	{ "10431A83", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 },
> 0, 1, -1, 1000, 4500, 24 },
> +	{ "10431A8F", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 },
> 1, 2, 0, 0, 0, 0 },
>  	{ "10431B93", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 },
> 1, 2, 0, 1000, 4500, 24 },
>  	{ "10431C9F", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 },
> 1, 2, 0, 1000, 4500, 24 },
>  	{ "10431CAF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 },
> 1, 2, 0, 1000, 4500, 24 },
> @@ -587,6 +588,7 @@ static const struct cs35l41_prop_model
> cs35l41_prop_model_table[] = {
>  	{ "CSC3551", "104318D3", generic_dsd_config },
>  	{ "CSC3551", "10431A63", missing_speaker_id_gpio2 },
>  	{ "CSC3551", "10431A83", generic_dsd_config },
> +	{ "CSC3551", "10431A8F", generic_dsd_config },
>  	{ "CSC3551", "10431B93", generic_dsd_config },
>  	{ "CSC3551", "10431C9F", generic_dsd_config },
>  	{ "CSC3551", "10431CAF", generic_dsd_config },
