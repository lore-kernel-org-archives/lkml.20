Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793872939;
	b=czK4O9h7KSI7j0svuPAjFC7YsloCJmPWDNLjx8H+/NkxPzWqV0Ef/bOFxvy7AmaNi1SE
	 VKoEQlLruiFa8r+eVNelgYNv640gCzpbpZ01tNaOSuHAfp7zZxMSUMngZRR3nLHzh+ize
	 QHedqH/oxPRrIbzOn9etZ+brPK25jDayHgwMSBMGO0PQj9unUAKUNo3S6BHaKv4GLyyKh
	 jPS0WFX5GJqiKm46UJ/PuZajsVv2NBAeet6ekFHZwxsluUpe+aqXNeFC/eOOTg5c7SNkF
	 ygeszRTDNO19xNCEIfb0lA1HPorto07axHesfBpR2oDTHi4ltFJWeYwAixTAAiNgf5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872939;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
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
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=4p1VTP4LXSBbwiS7NM8jlUWoGCMymMKt+l3V2vFusMg=;
	b=3lUgWozCSusEywC/kJbmaSFDYHoJI037O43424nnXqnPWBM0DiBoUjLR9U8Bg2v7tss0
	 BBTIU6KT3V0kTo4EBMy5pkP7+B6oIMa5xPpSKZrv31IDqUxXvEcrDcS6NSYYWN3EH4Gj/
	 yf9GZf3scs5YGBp3eGJ7Io1CjfgVVQK7qX8WnXLEjpjN/XfPwBtTEKReU59da1HAAqpgG
	 V3g/C8AdP/CplxEx8xkINr/Ay9lZn5i8Kvqi/DgVAbWned4b/6q8ZEdC8c9wqxOx175v8
	 B917piytb/7AUlJIdWs9FCsnprBvE14kDhoPoktaW1kF76/VTfbu5QoKb6LzkwsTrJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=P9Hl7vK1;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=F+tbFnSH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0634F606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0634F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=P9Hl7vK1;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=F+tbFnSH
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A58nwcO1123136;
	Thu, 5 Nov 2026 04:02:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=4p1VTP4LXSBbwiS7NM
	8jlUWoGCMymMKt+l3V2vFusMg=; b=P9Hl7vK1EMii5rF8jFXQonwBQOusLOLeKY
	LRZZwOpyj4CYkn0gw9qlkY6x85HDlap2LMK31x56VqsoUQvAStU5/DZIdbWNzDTh
	j46w9k4V8vLfot7/VOPt15LhWkV6B/kfV+6pRCZ2c/zDyGJvMKnbyiulULvvZOb/
	AgcgRwDNW0X4JIwP+lK6SwnarSIBy9rZ7dqQQUUITYxqpwSIxW6c6VTH4tHWl+Rz
	Av+OUA4XfbgozUnhtDYPlwuqGsT/e9TyuWxHxsB/1x4ujomVBKzSuRik3fR/7DuJ
	uEQIdrYweg+nUDPwgt1H6027hFmtgrrESPTRUUCoZFbgi6JJ2WCg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022101.outbound.protection.outlook.com [52.101.48.101])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hr7c79d6r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 04:02:13 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hR9GCYYQJj/oxTi+sH72Xkbt3fVpSf5RejYJK2Sf0E9rI4B0LFN60Ig0DXgdJ7WJqG0pJsFIyMZWTcIP0gPKCGo2OMF/VPiLEgdgYIGZwdmMH0c6gvDPTyIJ40K7HZNpJQ8bNKgr9h1SeBK5xZovksmuy30RoYQ+Eekr+zX+j/PHUk+3C1jrcQsxJOU0E+EpB+HHuUItIf+T+elp7a5O3pDDhRGGu9XS53ez8cnAAYqQIF44QrD6lmYqSL+f/ZD902IGmVWL43x/hzbC3cCkOfhHSLsncm2ZqTMDZ68wJHdc59xP4uKJuwiz/aFCjr+KxkRef+/Qixulws/xKz2UtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4p1VTP4LXSBbwiS7NM8jlUWoGCMymMKt+l3V2vFusMg=;
 b=KYgnrxeHrZBUU+ObEuGITnFDYCVRjg5nP2jYkzjlzJoZo16UCTw3t1zK9s5qRZRObHqVEuy4hRMYCLBVvkLihHu3Z28W8vLPhi6PZanpiLQr7epRdYRu+Sb1EzhjfSl/H0vGE6VKZ2x5e0nHyOz/lv5JtqmI7fR0QI133ByhonKg3QKl6e92KfwRY93Yf1KcxYrNn0LE7DJVn86j7QcCta3+gdjnTChvcLdQ5A3ZVtPHON+xwuujI+iltkwwc+jEApdpq68Ew47T2ANerchnZHda0TOcVAXFGYc/6obBB5/SrrYmJ58pGv9YP90BzKujzGluSg60jvbN1bk5tUCDbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4p1VTP4LXSBbwiS7NM8jlUWoGCMymMKt+l3V2vFusMg=;
 b=F+tbFnSHTQ8sxVcgBNukoihAewEvqP7qPWptpsu6hwAfIfy5Q7ahCi6cEwOgyN0ZXcGAcBseDWJUlkv11PBdkVJDrvK2OZruYPBaeiVVcwIVqKGwaZWGBbdTp4YDXWHrm08zcx199QCQ2ExltPMenxXH278K61EkdAcHZqEbqL0=
Received: from BN9PR03CA0484.namprd03.prod.outlook.com (2603:10b6:408:130::9)
 by CY5PR19MB6412.namprd19.prod.outlook.com (2603:10b6:930:f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 10:02:04 +0000
Received: from BN2PEPF0000A895.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::92) by BN9PR03CA0484.outlook.office365.com
 (2603:10b6:408:130::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 10:02:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF0000A895.mail.protection.outlook.com (10.167.248.187) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Thu, 5 Nov 2026 10:02:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 70599406544;
	Thu,  5 Nov 2026 10:02:01 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4B51F820273;
	Thu,  5 Nov 2026 10:02:01 +0000 (UTC)
Date: Thu, 5 Nov 2026 10:02:00 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH] regulator: arizona-ldo1: Fix double gpiod_put() on
 enable GPIO
Message-ID: <auxUGE+zPcnAR49k@opensource.cirrus.com>
References: <20261104-arizona-ldo1-gpiod-fix-v1-1-5b3c02d8a4d0@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-arizona-ldo1-gpiod-fix-v1-1-5b3c02d8a4d0@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A895:EE_|CY5PR19MB6412:EE_
X-MS-Office365-Filtering-Correlation-Id: 903815ed-6ad0-4861-04fb-08df3b23d731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|61400799027|10067099003|16102099003|22082099003|18002099003|11063799006|261022105027099003|56012099006|261026121527099003|261026140227099003|261028144727099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	HllBjnTDxf6UMMcRx1Z0Z4q3JKxQjn5R3RHpduSbNwEpDxrwksW8KZX3bJW0ZWn/nVNP4WZ7S0y+WSZ893D0ljTiu9Hs2eQaZ5HACTILfBc6XfWqzlKO+L9zwveh23N6EBD9mdpweKThlvviqExMu/BXqW/xU7nJ5MD0ChQi+oGURrY5GGtwtCpsqwlWu4VuHy8FGfiPjOiDcjsKsdaNSY0TAIJMH5aBWQR4twIrySZf0uCwg1CrlBIROXMQOYf2itUI/xY5rpJv7z+KXD73DFjTgFizLpcZ5ZxqVjnaMuUfCSoTVByAnU+IBem5ZCwuahz1t9l0kO4L7wuVnvRajFRY5PWrqoh6lseOgjZ3EGvqt7OchPU8TNnUdv0rjwcxU6PHsNRyUPA9xIhh5XFFstPPdrwCsLzAKFYJQOaTtvrjrmSLgTRwEpgEA0/Gn0haIzlCmdShMnAq2hyq5sbj9TdLVD8lzX95bjhmqEmLZFfbFmMBtT/Ghmzt3gAvIOJ6VD7oboRMmNauq8JNbp0QVdPHcVgF2pqT/QtJcG0tRJhkg5vd1upUHeAVaqBLBnOBYenKnbVZv/lxCDD5HCHOFA5EO9kYquSEn1Nd7AMqSSHwKKszRRMdCDGzd/Bd7xTpC0/+tQOl7zoxeeQpOzcpVWALEzgXNn4h0n4ilEE7d7iXKtf6lpuz5BFrHPFJ4/i/oaWXFTLTJLL3b8uXb5f0BA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(61400799027)(10067099003)(16102099003)(22082099003)(18002099003)(11063799006)(261022105027099003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	a8642jTIq6PylJvOoS99w0LQC86OTZnn1RX8j024yZTe1PfY7WdY6tU7gyFW69r2t4WXNFJcI8Zg/vgX1vRNo4b2UMEcY1x/JqVci4rDlihzfNiusuSjwcVNO+3bsaA6tcZYAiC2QlKV0oz7iSnLIX0zBbAjLCShR+MiEd5P5B2REVjePMcF73cJk66hkJ8ls2nlq4cSzVNsFyIMwY9ryGawIishrWFOltVlaOGz6FIbA3Qaq28N7czZZByb++6SL3MKQR7nS6/ZxXjxap0DJ2kbxZwXVzZBCPj2Vaqun4l6cqUjwEfCkMJcSgXw+6Ggq59JfYS7KIweZJ46ddaG/5pgzP+/3pmus1c62NZlPVoMglnYgupM1Mordkf1ABQFlZw/UeZGUSyEf37gEy7f0cod4umNMIQLilKyEi78FawsVy+KZse9nW6bNP6Jmpor
X-Exchange-RoutingPolicyChecked:
	JZRLAOsYb7oJLnt5POvzwFusaR+6vE+SG/1+73rB7QC6wOvvAeITHNQRCYZQzg8vNoTzaiJUhFSSYiLqLi274JNWLbdTXaFxwbXlqZ1cDbHASCLyETtwD/11ia4CH6agLkF1emAl0I47HvZQPpzcjcnClmnacDVmqS5QRiRHszLn4jJnZ4PMIq5gJKYRsUYq0KGJFRau7sD8InRmrYkgukVSoOVbLFo4cZMA17byHhhKFv89gcjAoBcMaW2MTDvTquauzXLcounYQMEggBsU6aK0UvFHdILFfC38iDXN7OTL0yVoLj/wd8Em3RMEPSxIen0XeB2KKb9p3dTi0zseZw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 10:02:02.7974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 903815ed-6ad0-4861-04fb-08df3b23d731
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF0000A895.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR19MB6412
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzOSBTYWx0ZWRfXx/bAyEsPRlkA
 mWGYhoAH0sb+ohRu2JWSfmkM2T5PLaATgiE1ISugyF8irp/L5ixk3MlJRJK0qcuNF1du5RbiYg0
 JGA8ryM3Zz+/F5cmG1G32BA5jB/5aTIoZafaOfCnM2cCDKosZkeuDd8wunNLHosXuitEkXXGYkA
 jey489SMbDSMU5HrFYim2fyvzc2DNCXI9GBebkfnRSSdWE/25uXD7feMtTiXQcM3H2gdp2XNakS
 kuo2KkIRY+jMMVjKATl7FQMU/cw/M6SUiSQzR52VDe6/bRRQs4g3ggohTWM0oP/NZsP9Dy4wcYk
 hWQBpAIQ/KQ+NkzS2nMtrT5lXL9oU5cTdyHPcQCyWNuAt6UvnL4d/Qu1C7Y39xqT2gbHhuIU2Zg
 kHVa6ZLANh9qOsrepF8Dudk/tbKDopObav7uvAXJzfRiXunqyzenXcHPFJU7GxgHvGpsdqnNIsx
 LmYMobkPX91fdtOqKvQ==
X-Authority-Analysis: v=2.4 cv=Vr62kO2n c=1 sm=1 tr=0 ts=6aec5425 cx=c_pps
 a=RIagabVaACGLwgNc4eEF4A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=4WHG91N4W5Y8spwWpi8A:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: Ze2UxlF5IXUoTCETqBlZkwhmga9YKx36
X-Proofpoint-GUID: Ze2UxlF5IXUoTCETqBlZkwhmga9YKx36
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzOSBTYWx0ZWRfXx+luVxPBk0LN
 QaFPfHbVqAc83u/t47OuXglT0Jx7T6mGXU87CE2P1fmhXXm+fvEfd3U+s/ttyce6ec0JDushABj
 yHHAMdFDYpEQHVRvDHWIxkrXNYw7O+M=
X-Proofpoint-Spam-Reason: safe

On Wed, Nov 04, 2026 at 10:38:32PM -0800, Dmitry Torokhov wrote:
> When arizona-ldo1 registers the regulator, the regulator core takes
> ownership of the GPIO descriptor passed in regulator_config.ena_gpiod.
> The core frees this enable GPIO descriptor both on registration error
> and when the regulator device is unregistered.
> 
> Because the driver also tracked the descriptor and called gpiod_put()
> in its driver remove callback, unbinding the driver causes a duplicate
> gpiod_put(). Remove the driver remove callback and stop storing the
> enable GPIO descriptor in driver private data to avoid the double
> free.
> 
> Fixes: a9191579ba10 ("regulator: arizona-ldo1: Use correct device to get enable GPIO")
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
