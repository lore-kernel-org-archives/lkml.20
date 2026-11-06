Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793977793;
	b=RxuX4UX63/dAQAPH+9E9CiUMZL+cqAtoicA+kkmUN0NyGBBbMF5XB/5XC/JFokreVJSm
	 Vsq2dzpWWwRt1uNhsmaT1aRJK+dSwZLJE86tPWaG1xsqE7TlyOpS6FezD/9shUBLYrDCo
	 qrgQ/1btXTPGbODHjv6Yxa+YcjiielLEDUhxvBLJBXzZ3WDO0+pQqpSKT5DQpNiMc7t+R
	 oupQQZb1dSkh1tJIuY0DS7cTIsDUmHJjUmgP/OCuE3ABznSQzKCDnlxTJKSNXh+Bx2HOg
	 wCtRJU05M3SQ9TsuF/i7NU7OCFJQ4AsAwsP2XqgYpBxzcaiKmzr4C1vqQocz8uAzPqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977793;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
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
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=A624M8IQkfStP5xJI0d8cbA5ojGyta3FJqfVmInnCME=;
	b=dl5dvhPNtQ0qs5CxDe8/ZrUspwazxVLE8mF5eLp0Sm6aee3v95KWTNJZXiwcA99v78bO
	 SUFEhJYg/+6cUO9/G8bQQtfLrtyPSJFfMHh4lUKmtWI1fWJUqPT80fXbsPAqaDSebKVeb
	 +leIyxl4xyHvFKkYrozcHfxvn/IcLU0cIbbryrJJzDLhWneMJwZDlusNINmJfQNnNee2S
	 6XeEve7XPxjTeIZLXmPf7+LRc16StpTFnqFGPIugdT+LOLFQsV6cdsG9FBaw7JYqeyY1P
	 2S/T3YZpec2EFGWVAuxJiFDmQeS7y2ydqeudf9lGyQclu/3YTl+P9oDLFQqB/LG6e2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=ZiXpMVw6;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b="o/ITDvy0";
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F632606A32C;
	Fri,  6 Nov 2026 15:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F632606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=ZiXpMVw6;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=o/ITDvy0
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6ClMpL3837347;
	Fri, 6 Nov 2026 09:09:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=A624M8IQkfStP5xJI0d8cbA5ojGyta3FJqfVmInnCME=; b=
	ZiXpMVw6n6zxxSMcARXd4J+yOfBl/iicAerw4xErN57uohZYcdVJlRk3LTN2W63d
	4PMt8JXDJU8eAAI5UZBOwy33uCiFF/HQVYpA6Dtedbb3femkc9D4LuxecIa9sKW9
	a0a4nOij1VVq1ta/yr4rCHZ/NhLuSDlsXG4czl1dJp/sjmKekyHr4PB5oVPYuZPC
	kGqy4BcWFirjfQM//GUrlltC7d2K7nmL3ECeLjfCHqmSRT1gfvhq3PS9N4WajBIx
	vJA70oaF/VRq/kf8sTUy2RKw1r92PTh3C0Fw1GXmpPbdd3cNO6KHlRXCPv/m1ZeF
	feGaTpmYKJCpid44o/mDXw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021118.outbound.protection.outlook.com [52.101.62.118])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hs3rb0xh8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 09:09:46 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ihaafgad0nLUGc56knndbrM4y6r/5kFli8ZGyz5tZ4O3nDlef/gyMUPRWgAsYbCAUsVkhCqxT0UFuZsXP+gKa9DNqSOotfgDmrAAaAE8gqNnlAzuFeyPzZ/NmGULQl+cNOalSvMJNtDZdRnYA7PnH8h5kxlJu2Jc7BPpHg9wB4Dvgr2mTzRGLLOlHq7KlFDB247tJDGtH/5muz5iM20mHJwWVWkRjfgi2+V5e9+xzV/50eWO6iQCrIgWgnauNFHexXo1t8P+Po/QWLYvFOaVVyu3qjHL6rr1CsexEwUol7tDgR8Io9ZcpacYs8UI2jOslPcId2cooh89tnINsdQgWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A624M8IQkfStP5xJI0d8cbA5ojGyta3FJqfVmInnCME=;
 b=oYEpxgbO3U8YHuttxPZTa6WvUnqcbQySaSew6lGuohCtpqlTJGPhdOkycbdror9QZd7gP++/wbt9lncVyMNQ3jQnULz6/9bdwQckplm3JWX1TW0AEcoSfBvLIsQnHEO/0HkynyE6TA15JmdR1CJVFjv1Hc9Gd8mnBKk4FAgnN6rmxXcjFLOBhlnIUfyreUDYo734IWQVhKXa2MyRkncrvRCzTUIdoXi4vhw5bCG3UABAj/nzFFo29sTwUvSSlGnv2d7Ic70frR+fcYxv4YQ28eTl9h4nTYCZXQotlyGnEp8hmbED61UCnV7uhyu2b7n+8daPrlOlic9N+4jrLzAZ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A624M8IQkfStP5xJI0d8cbA5ojGyta3FJqfVmInnCME=;
 b=o/ITDvy0unGtPpzBELS2VYIZBCBRNsEkzDJyHaCilgY9LQbJ81id984/99Rk4yz5rmhG8vCroUimles4BMrx+arHC/5FekS/DXEl97AVIDm89ZERI4EHa/THSBknmwRrVSakoEyRu81i3FziNyjMBsnX3IzeUzTnVyEMvKMrd00=
Received: from BN9PR03CA0055.namprd03.prod.outlook.com (2603:10b6:408:fb::30)
 by DS7PR19MB5879.namprd19.prod.outlook.com (2603:10b6:8:7e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 15:09:33 +0000
Received: from BN2PEPF0000A893.namprd04.prod.outlook.com
 (2603:10b6:408:fb:cafe::18) by BN9PR03CA0055.outlook.office365.com
 (2603:10b6:408:fb::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 15:09:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF0000A893.mail.protection.outlook.com (10.167.248.185) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Fri, 6 Nov 2026 15:09:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A32EE406544;
	Fri,  6 Nov 2026 15:09:29 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 89F5D822540;
	Fri,  6 Nov 2026 15:09:29 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 1/3] ASoC: SDCA: Move DAI constraint allocation
Date: Fri,  6 Nov 2026 15:09:24 +0000
Message-ID: <20261106150926.2587108-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106150926.2587108-1-ckeepax@opensource.cirrus.com>
References: <20261106150926.2587108-1-ckeepax@opensource.cirrus.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A893:EE_|DS7PR19MB5879:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b23cfe5a-1672-4ed1-2ddf-08df3c17f598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|23010399003|82310400026|36860700016|5023799004|11063799006|56012099006|261021135927099003|261022105027099003|261021121427099003|261021123027099003|261009223027099003|261102130727099003|261102123227099003|261026140227099003|261026121527099003|261028144727099003|10067099003|22082099003|18002099003|16102099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	R/0r9wIdND4JBI1Ocjaz70cgZTrteZ9n36yM3OqPt9tvNz1YTYaM4Rv1Nxl0sRuBXrTWk3HKTH0su5JUz89nsXrW0KA3ttj0tPJe3DfFSLK8u0M8sVg9W62RHcZL8epq39uTkGPcr/PRIeHzoDLbnlBavn5csacfYjNNLEkV7vifSnoxyRCKiv4hGCVUvf+7xO2Zho8WWb2T/78ShDPai5nrbHX7RyInUXhmNrSEAkWJt/EBHauzI4BP80MlaChc7gS1Qk6n3gpJ4zR5HHpP0tqXEal+vQCgE11r0N7jnsOhWKvnRgz8PaRJmH5pSxo1zJnVUM5mFp1lJ5/00LPprL1HwHeH/RxL3/mYaKX/Ozn4Y10AS1j2dCn2bi7D7PCmEUixIHiI6U1jkl5TKjyy/89UIlyN/hyvs8Le4LTCTYCLTSygQKNn1HBGFT1KC9OABvaCqEyzfL5lLRcM+IsEivb3EEmKJcKZosRQ71z6Z15wFi9g7eto5BjLUlKOJAOoFYa8U6jzsMHxjYBjy49aUvU7x/aHodITZ41DOYd3mRxvTUb6yFXnRpe2gb3ukTGXD4SnrIEJ96Eo59TqrWXzaaEsyyipHx0jajKmSuw7gVxJhUi6FQ9o5juJzbCw6Nz1TmcVt5rx1mHn6dwy4edaNVUgQstbNW7PvQ0M4l3wwIyw6EGECVbXmbcJwbsdM8MRVIHF7LbOpKGmPeMNrrZP+g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(23010399003)(82310400026)(36860700016)(5023799004)(11063799006)(56012099006)(261021135927099003)(261022105027099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102130727099003)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(22082099003)(18002099003)(16102099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E0oQCaimWTViC47WsYUnuSrQPUAqffQ3JZ978hhfsGUBCIa209jCnP3ZOTrgAdIaMhHsYHVCYtgVMB7HfpxLFZRzonOR/0YjyncE9NLTs9vi7DzBu8YpRNeHduxVj6r3igO8E78WuhhVqIcY1Dw6SMhH8uhCZ/WF9dZZpJXP3JWAogv1VMKBMO1VreeX86P2CrxhPYa2Atp69pBvu7eF8IpLyV8G19fU82ISvlkChzc3o2lek4dPcTUFErhP2pJUZp0RPR3LEkJYCwymt5c1SdBHs8ctgtleXi+kBNIaAvV+yhbr2+hL6oZvPH7IqBJfiwss59N9idMKrA2W0f/Me8XauSSbGbAQ6SMdYQ44NGtWCwO6ERpoWerxhjk5zKZbO55yCm/vGFBCD/pBNFt4JsCm8VPpTNPuBis90vf9hMQm0gcyzIwOE265TqO1jKyJ
X-Exchange-RoutingPolicyChecked:
	1++igW5A93KCkVjId/mgYxgcBXjspBJaPXfd1zj82xqrl5Ersh7e5tIenLuQiTQ7KqCp02wZ40kDP23auNJR4+nl+SBbBiwVyr1CgMM/yX3Wna9GfcJcCJqGvJjfZvuCWdpf+dNZUYRDb45ftndCP4ssEdqgO1W6Cb03EWc7ICW3MnTc474hUY4C4ReCX6uB4NS5ZUgY3y8p0RW0SyA2dv+TNAPJhVcoW+oLUZb33yYognaJdK+41aUiuIHx3JcR5dbAfOhsZXHmoxdqo9GYldTTLZqCMoiGAYhOVvNkX8NsuqdplNPrzNe33iYeFaIC46DZVU50wv5yJtzwKwxxZQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 15:09:31.0064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b23cfe5a-1672-4ed1-2ddf-08df3c17f598
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF0000A893.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB5879
X-Authority-Analysis: v=2.4 cv=G6aJgNk5 c=1 sm=1 tr=0 ts=6aededba cx=c_pps
 a=faNChB6ooTmYohDsr5IHEw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=GrZW1Cnu5S3xz4JwhSoA:9
X-Proofpoint-GUID: APks-djnjAKLalZIf-1-z-l3CH9iuL1m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MCBTYWx0ZWRfX1wIW7k7HMG0p
 AeBTDQw1exkZkPOvrUDeXAGx3I8gHS1KDNK0NkQwOvM9tmm0TfQcPXm1CUDa7sx3Ss5jSu+4fuS
 Vc4DsGeB4E4psO1Edk4L1zPXLIHIOBY20IDF2cpJp+uHk1bQLq31SRnpSMFvrzAf++oNyms6Z1m
 0cIdKTER/OPEceyvB4MPS20fdiMXViW1HDOcpj3vkQE5m+37M+8q5IhDMIaqXyuliTBCrqCYl2v
 6HazZpb8V2WB9YphoCLX0IXqXgPUtquceWjoyLbFSXazIl8imjEWwaSjbhYHFUOGpUilavZJihP
 ofjO5MO0ir2Ax8/U/EeXSh47GU7FvER2R8pG1Ak4+i8QyJDpI5efQ3Q59W9dpnWkFVmxlliI6kh
 NbTl+4OolaHKZrmjZOocbMOZDCE1MMRDg2FaRjpk1QLMIAX2G5WbP7YqGsffg3Mbms9BRzFxgb6
 UPPen78ZF0BV9RYKotg==
X-Proofpoint-ORIG-GUID: APks-djnjAKLalZIf-1-z-l3CH9iuL1m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MCBTYWx0ZWRfX99FkoJNerKYd
 ZgdHM9nk9kqV4uh2q7qSsBRA1N2l+fb6t+VPiqNftr2KpPX2FC6jDJdQqXZXLlcyTsw71x57mlt
 j8+LtsYzlD7Sq+e7mBuP7q3p1I5O7Rc=
X-Proofpoint-Spam-Reason: safe

It isn't necessary to allocate memory for constraints every time a DAI
link is opened. It is faster to allocate them once when the DAI link
is probed, update the SDCA code to do so.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v1.

This patch should fix the Sashiko complain about a potential
access after free on the first constraint if the second one
errors. Technically I think that complain wasn't really valid,
as if the open fails (when the constraints are added), then
nothing will go on to use those constraints.

However, in the process of re-assuring myself of everything I
realised it is probably just faster to alloc the constraints at
probe time rather than on each open anyway. Hence the extra patch.

 include/sound/sdca_asoc.h            |  5 +-
 sound/soc/sdca/sdca_asoc.c           | 75 +++++++++++++++++-----------
 sound/soc/sdca/sdca_class_function.c |  3 +-
 3 files changed, 52 insertions(+), 31 deletions(-)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index 599a72f335153..236a441ec9d89 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -89,12 +89,13 @@ int sdca_asoc_populate_rate_format(struct device *dev,
 				struct sdca_entity *entity,
 				struct snd_soc_pcm_stream *stream);
 
+int sdca_asoc_alloc_constraints(struct snd_soc_dai *dai);
+int sdca_asoc_free_constraints(struct snd_soc_dai *dai);
 int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
 			      struct sdca_function_data *function,
 			      struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai);
-void sdca_asoc_free_constraints(struct snd_pcm_substream *substream,
-				struct snd_soc_dai *dai);
+
 int sdca_asoc_get_port(struct device *dev, struct regmap *regmap,
 		       struct sdca_function_data *function,
 		       struct snd_soc_dai *dai);
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index ccc579f878ff1..b8bde56298706 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -1434,6 +1434,48 @@ int sdca_asoc_populate_component(struct device *dev,
 }
 EXPORT_SYMBOL_NS(sdca_asoc_populate_component, "SND_SOC_SDCA");
 
+struct sdca_asoc_constraints {
+	struct snd_pcm_hw_constraint_list channels;
+};
+
+/**
+ * sdca_asoc_alloc_constraints - allocate a constraint structure on the DAI
+ * @dai: Pointer to the ASoC DAI.
+ *
+ * Typically called from DAI probe().
+ *
+ * Return: Returns zero on success, and a negative error code on failure.
+ */
+int sdca_asoc_alloc_constraints(struct snd_soc_dai *dai)
+{
+	struct sdca_asoc_constraints *constraints;
+
+	constraints = kzalloc_obj(*constraints);
+	if (!constraints)
+		return -ENOMEM;
+
+	snd_soc_dai_set_priv(dai, constraints);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_asoc_alloc_constraints, "SND_SOC_SDCA");
+
+/**
+ * sdca_asoc_free_constraints - free constraint allocations
+ * @dai: Pointer to the ASoC DAI.
+ *
+ * Typically called from DAI remove().
+ *
+ * Return: Returns zero on success, and a negative error code on failure.
+ */
+int sdca_asoc_free_constraints(struct snd_soc_dai *dai)
+{
+	kfree(snd_soc_dai_to_priv(dai));
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_asoc_free_constraints, "SND_SOC_SDCA");
+
 /**
  * sdca_asoc_set_constraints - constrain channels available on a DAI
  * @dev: Pointer to the device, used for error messages.
@@ -1455,8 +1497,8 @@ int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
 		 1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16,
 		17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
 	};
+	struct sdca_asoc_constraints *constraints = snd_soc_dai_to_priv(dai);
 	struct sdca_entity *entity = &function->entities[dai->id];
-	struct snd_pcm_hw_constraint_list *constraint;
 	struct sdca_control_range *range;
 	struct sdca_control *control;
 	unsigned int channel_mask = 0;
@@ -1490,45 +1532,22 @@ int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
 	dev_dbg(dev, "%s: set channel constraint mask: %#x\n",
 		entity->label, channel_mask);
 
-	constraint = kzalloc_obj(*constraint);
-	if (!constraint)
-		return -ENOMEM;
-
-	constraint->count = ARRAY_SIZE(channel_list);
-	constraint->list = channel_list;
-	constraint->mask = channel_mask;
+	constraints->channels.count = ARRAY_SIZE(channel_list);
+	constraints->channels.list = channel_list;
+	constraints->channels.mask = channel_mask;
 
 	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
 					 SNDRV_PCM_HW_PARAM_CHANNELS,
-					 constraint);
+					 &constraints->channels);
 	if (ret) {
 		dev_err(dev, "%s: failed to add constraint: %d\n", entity->label, ret);
-		kfree(constraint);
 		return ret;
 	}
 
-	snd_soc_dai_set_priv(dai, constraint);
-
 	return 0;
 }
 EXPORT_SYMBOL_NS(sdca_asoc_set_constraints, "SND_SOC_SDCA");
 
-/**
- * sdca_asoc_free_constraints - free constraint allocations
- * @substream: Pointer to the PCM substream.
- * @dai: Pointer to the ASoC DAI.
- *
- * Typically called from shutdown().
- */
-void sdca_asoc_free_constraints(struct snd_pcm_substream *substream,
-				struct snd_soc_dai *dai)
-{
-	struct snd_pcm_hw_constraint_list *constraint = snd_soc_dai_to_priv(dai);
-
-	kfree(constraint);
-}
-EXPORT_SYMBOL_NS(sdca_asoc_free_constraints, "SND_SOC_SDCA");
-
 /**
  * sdca_asoc_get_port - return SoundWire port for a DAI
  * @dev: Pointer to the device, used for error messages.
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 13b70f0f0dbf7..6406c9d0f6119 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -184,8 +184,9 @@ static int class_function_sdw_set_stream(struct snd_soc_dai *dai, void *sdw_stre
 }
 
 static const struct snd_soc_dai_ops class_function_sdw_ops = {
+	.probe		= sdca_asoc_alloc_constraints,
+	.remove		= sdca_asoc_free_constraints,
 	.startup	= class_function_startup,
-	.shutdown	= sdca_asoc_free_constraints,
 	.set_stream	= class_function_sdw_set_stream,
 	.hw_params	= class_function_sdw_add_peripheral,
 	.hw_free	= class_function_sdw_remove_peripheral,
-- 
2.47.3

