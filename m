Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793792182;
	b=jpqoEdAE6AAohnIl+F3hTUG6DkB3ebmfoKQ7yA/FwkLkq2+hu7Vb0T3sXKoZiu9GR3bP
	 BwpLdipyHcw3BGtr/SWu3qDcuZ8X47ldkvrNrdICbcl2J9jvS4DHIS4lYQMYVlvQKf4Ik
	 FK+qj1yXQqqWVPvWPnqTCfHnR16TgFvDwl4QZtTTmFejWkGJKODWVmOHc82rC6/pAmW+M
	 EYYTzJA+w1RXCYbzxiSQDUoq9YA/JRCKIYnjh5gRxcCIj2vPOSwwXHrDIkuSL0sXR8gqr
	 6NYJ3p0D9vRsArrOKt+TONz78aJc4mfXb/rTxfsCxyk5pKa8qNbLSBRO70OvS11u9cg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792182;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=oU8UQFhBMEXKFLdAB3VRH/U9Ph4A06iSurHhTDEUXNA=;
	b=wKL/2bO+QRs2Y1EENiLoLHV7DNRsgzX+SYlK0wO066/QW8gBveJSaF+IAvARulNJ50hg
	 Oxy5eOXwI/R3Xm9yY1bZIxHR/pFUA+dBF3V1xCDfwgN8jXQ3p0OsZ3QKLlNmm7fONP4CW
	 kiuLO8hOoO/qvry4MDLZWlRkjT3txv+P7pz0YWuWRt1HG54rqcMrTyD7DcV9oEkGqMmfr
	 GedGaWjp73shhxsGgpdq7HSE1H8Hqp+zqpyASywiISzqPcUBU0FelniDA8tNGoEu7TJqK
	 oJwh8tCHYfQu0GFjmRDbHbd1vyxGaYPYv9V0zydOenR+1/KLMDF2hx4pNcKjthwr2VQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=fdKiiTtN;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=RuBMTMbP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FFA606A31B;
	Wed,  4 Nov 2026 11:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78FFA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=fdKiiTtN;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=RuBMTMbP
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A43voAR2527180;
	Wed, 4 Nov 2026 05:36:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=oU8UQFhBMEXKFLdA
	B3VRH/U9Ph4A06iSurHhTDEUXNA=; b=fdKiiTtNs+4+o+kHL8UIJky/Gq4YKiyP
	O8umBwwhChUpEVBAF0XK2M4eaFBX4FtsLuOb23uITGn6FLqdtpgXWIgqu6HSlzkb
	FyztmY0ph+mKP8kxTKOD1uL+ObNGRDvWEK7Q8jOa9dBr4LXRK7LvGpa6XZ+FEV7p
	aIk9Nvikn9v+/gVwRD3fRkatoLkFhuwVNG4ZmO/jy1P2XRGldHK0fCSV5T0ZY1bo
	qi+v2uTL03/R9xqF0Otzrdfb0WZjkYk8pE9VF8MwmhrgrYrVkuVZYZi9OWvL66m8
	oP8Rhj1ExmgnZF1g0QozG4STtTLMkvDoNa9rGEOUYdEHWuXOymHThw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022134.outbound.protection.outlook.com [52.101.48.134])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hncrfwh8v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 05:36:18 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VnLh6gEcU0wKBDPhziJrwGgfjPu/wVBUBS6V45Fwph8TUkLYJEgBvSKcmoBDUgt6Sh5jv1aEwkCC8cQuD06+pCWdC/R8eIateE9P5hCVVcmev5ooWwppjrCtg8QJ5OwoQoZF3OCbTTNATaHHztzDlZD2lsDsdYOSVMK8YWQsWD4JRV0O/ZRaa2A6ke4vmCt0hWtb3D3K/0ki7wXBeRvD9KMw4eWZaJz5BMWCAb8bYfCr4a0LX1qUTCi7OCV4WIXBQJ9dKXlpjp/MwB2c6hADJ4rre66MXr4+qQqoxZIUwAq+UREcFsuzpBgGYdP+lT9p4FpwzY+gcuvl+jCRT3VHZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oU8UQFhBMEXKFLdAB3VRH/U9Ph4A06iSurHhTDEUXNA=;
 b=f4QPpu8C4T1wqtimEI0zM6XbFJKpYB2VuXxOVGUu/SdOeWaCryroKGM9jNPVng04opvE5MtwcuwYM7BhvO2T7DsEMb51NuvcTN1uExCp9r9kOgzZyT9Ss7EIm9Zt1fHjie/V3OiFt8WOMAntFyFuh84DiA5NEphyG5+RF5BplJf2A/EXQsTtsszVCz2GXtUzmfkOjHjtqQOlC94ckJp4fVKf2PwLTV/TMgTAq+Qk8TGLAU3CPXmvafcJ6QfbiAom58D5GfEvL4loI74HOuvb0lNUParpYSmNg8Mtdpe5Oiq7YuFr1u8ke8UVsVGReY8yp6nD+gLjJUqwRlR4aR8BVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oU8UQFhBMEXKFLdAB3VRH/U9Ph4A06iSurHhTDEUXNA=;
 b=RuBMTMbP2YoEaapL9aRVKqZt3hE7w43Y7VFiGkI/tYkH7WofaVBl8dT8EA6Q+XbKx/be+Z3A8V7syhbtbGeUR4MG79SAkUyVQnnPbKtnuwlfb3akD197zi72h/5OGTpBUHte0N468bYxwkMF9YVu8awOf0wo3MTyQscuA0iDEqQ=
Received: from CH0P221CA0035.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::22)
 by DM6PR19MB3833.namprd19.prod.outlook.com (2603:10b6:5:22a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 11:36:14 +0000
Received: from DM3PEPF000265AF.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::3c) by CH0P221CA0035.outlook.office365.com
 (2603:10b6:610:11d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 11:36:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DM3PEPF000265AF.mail.protection.outlook.com (10.167.23.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Wed, 4 Nov 2026 11:36:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9F3B4406544;
	Wed,  4 Nov 2026 11:36:10 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8EF71820273;
	Wed,  4 Nov 2026 11:36:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: tiwai@suse.com
Cc: navonjohnlukose@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH] ALSA: doc: cs35l56: Update calibration write failure message info
Date: Wed,  4 Nov 2026 11:36:10 +0000
Message-ID: <20261104113610.1057194-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
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
X-MS-TrafficTypeDiagnostic: DM3PEPF000265AF:EE_|DM6PR19MB3833:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d259e0dd-bf18-4d7a-02c8-08df3a67d408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|61400799027|82310400026|36860700016|11063799006|56012099006|261009223027099003|261021123027099003|261021135927099003|261021121427099003|261102123227099003|261022105027099003|261022075727099003|261028144727099003|261026140227099003|261026121527099003|10067099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	CsRjhdWVy8iUlCuDJVwTqe/haaoUkWO4MFSREQ8nwWFRSc9HZcjSDnq+IZL0CovlWEh3aG+/ccbR5Z00n/lXdqvpr+BwwMiogWgzTDOLJTlsXlaOA6X5BgIsWRdd6OfhYHjUDV14Gz7h20MKo9AmNQ6CAc8goIHVjgjUQD5fjBUDASw7TjleVoaghROUuNxjQwagDatVvF4QPQmPCRaNM0RJJkqm1+LhG+trt5+dwo+VYQ8Tff5WvTD59EvWsLW0xlky9P3ZwwrVgwDXuorEdDYCuZ8DGbJuXK8hd1jDcOLdczPEXTXQnRgrb7EJEUS4CrxLR+8C3GSWHlg1+Nxy70dmhONFhrgN2FvqKPVVEWahR0z5ySB3HKza25BBew8DKQP2uSMNUvjTO1b39sk/fImPcnRb1v+ZvZysbX+JWnR+4BE5vHEMtmZY8J8vWY1c4OyDlj4W42EZtCSb4CmLJRSX2ognG1dYoAAGzoYSZEBdpAhYh2DQfdS1bPqm/lCGuJDCql752RFgVJBCziqDT0H6uBjgmuNBrg8h2gvsKkEvWKUch+Dz7HjpPfKulvdMZWAQ/NDwqas4waAqnftrQZBRRvcHdlzUCFQsMu+3mr85vE59o/zKqGZnCGV7xEwtlNc2zoEIqUPwptE8KTy+BJa/ZomEJJqpPm5B70lEwldU36sHc4qgtmjEfEeOuFVeXRLL7H1Bjbk59Kf1WjcGGQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(61400799027)(82310400026)(36860700016)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261021135927099003)(261021121427099003)(261102123227099003)(261022105027099003)(261022075727099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xuhqjDejALvZll5wusIV0TLEQdNKr7FMoREaNTDG+yaxqcUBGknRLiMdrOAioUr9q15vYVKaEoJm2ytod7T45lmpe6//2Npcg9nbKVbe8o7EQCHDW2OJnLD48dL8qrZAQa35lW+gtxzcauwGVk+1l+7ZfrusYEEzJnU1PI11k/pdRWPdwH5iLAVGLQZeGgGWBpZkvncLwUJni0/aPH+rPRylIzYBAy6Knebrf+0RbgI0W+hYZ38UZWBx+1p4jvQAUJKnpkqUnvsQA3qqonfGCNoCCMdXEJ2hjNLSYgslRL8NXLs1SgkjACBHsiO7f0dcRUMrTjiajyJOXn49S9+IO3cG1Nt//X7LByfUmGe8GNTzKooyV3ZB5KblL/Malh9ugcec4wGZp0YupYhO7IpmJBCFKxRKCxbDwjrxkZzJJhoJ7HvX9alznk5aGoDS63x1
X-Exchange-RoutingPolicyChecked:
	RdvY/llJCUbgf4elPm0PxgMGVBBDxrVsDnCRf7uX1D4NVw+isBdBiPn9T2Bxey5iJNL6loqOgHSlqMxsMWBI3um2KDCIl6Z1uhTyoagH+mCIydRGKWU27JRk5FeV3HhC39sI3yNrJG14bMVnW2Y0OfE3I8vKP3KuTptnT7rZvH2944WHyGy7YkK6uzo4AK841roEE1+2nhcIsGmnxgZb6kV0Swi2Hstr6PxvIESVTzR56Jd5JwW8S4R8lvVp51p5KIwI0u9MJFhQzXRZ29+vZRtQLOArnD6aBX7HpLediUC15fjGzCR46HGLKppwgKONr25w5F87Yr9VFacTUkOcOg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:36:12.0492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d259e0dd-bf18-4d7a-02c8-08df3a67d408
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DM3PEPF000265AF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3833
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0NSBTYWx0ZWRfXzjNhFRJkwOmA
 WM3GwuzkUAZJkCWSS+jyQOWchH5Q5eM+qNhWnI7KTpK3ej0YuzdaJb8fUIJkvFNNu24EUhd6AnP
 g10r2vOW75dmu4QzzPgBRtQSZNOdbF042+DOHtVJ3JcHrirmD4XwmnTLW+Tyjb8prbd6GuDYlDZ
 anMffyGk5rYd8hbSTLKuqOFnUqrhqlfptE/jqhpSU+pyh+nRt5gkWF32RVILf2xQRQ13nJtcXVT
 GcrXxOgYdlqErOZmM1hiMzfEoNR60+MJtP4+1E8ob3pLv0XE18NAXLT7mBMnwCklQPejyIZmkIv
 ytQdVMic24GS8ppd/we98a1c/tdve3rN2kpHXJfY6GH4uqF15WsGxlF9bxmXNClnb9Zeim0PD+X
 Ygv8TNGs99B60zWn1IdMgCYFgshUndUMxpCIfKZPo62NT/eWGZfk455EsZh8Z7dEwImz1NXc4Bn
 wSN3ZZRdDZPdlT/XRew==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0NSBTYWx0ZWRfXyYlgls5rT4Dv
 BnkpsaXUDGIpypI4ROENPKb89ORszj/y+72OsEQfpQUAvLDM2IQ1ajDjbRqzsGVf0DPiewF0W1e
 +kONKcCaTflL9EQC4WuV88W4DxLvFxo=
X-Authority-Analysis: v=2.4 cv=LtgHWXdc c=1 sm=1 tr=0 ts=6aeb18b2 cx=c_pps
 a=xo3zWrN9qLO3Lphhql2lSw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22 a=w1d2syhTAAAA:8
 a=kzKsp2IhnQtnbxZlPUUA:9
X-Proofpoint-GUID: oaZYMii9XueiTXAwrKAssiF85d650je9
X-Proofpoint-ORIG-GUID: oaZYMii9XueiTXAwrKAssiF85d650je9
X-Proofpoint-Spam-Reason: safe

Update the descriptions of the "Failed to write calibration" and
"Calibration disabled due to missing firmware controls" error messages.

Originally "Failed to write calibration" was described as having the same
cause as "Calibration disabled due to missing firmware controls". This
was _typically_ true because the most likely cause of the write failure
was missing controls (because both messages would be logged in that case).
But it wasn't clear from the description that this was referring to the
_typical_ root cause being the same.

Reword the "Failed to write calibration" info to describe the possible
other reasons for this error.

Also slightly reword the description of "Calibration disabled due to
missing firmware controls" to say "firmware wmfw file" instead of only
"wmfw" and fix a missing "the" in the second bullet point. Also note
that this is not necessarily an error, only information.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 Documentation/sound/codecs/cs35l56.rst | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/Documentation/sound/codecs/cs35l56.rst b/Documentation/sound/codecs/cs35l56.rst
index b3f8c1c238518..ffbfbaed12714 100644
--- a/Documentation/sound/codecs/cs35l56.rst
+++ b/Documentation/sound/codecs/cs35l56.rst
@@ -235,19 +235,28 @@ No %s for algorithm %x
   HDA driver did not find a .bin file that matches this hardware.
 
 Calibration disabled due to missing firmware controls
-  Driver was not able to write EFI calibration data to firmware registers.
-  This typically means that either:
+  This isn't necessarily an error, only informative. The amplifier can
+  operate without calibration, as the firmware contains a default
+  calibration for the speakers, but it will tend to over-protect the
+  speakers.
 
-    * The driver did not find a suitable wmfw for this hardware, or
+  This message typically means that either:
+    * The driver did not find a suitable firmware .wmfw file for this
+      hardware, or
     * The amplifier has already been patched with firmware by something
       previously, and the driver does not have control of a hard RESET line
       to be able to reset the amplifier and download the firmware files it
       found. This situation is indicated by the device identification
-      string in the kernel log shows "(patched=1)"
+      string in the kernel log showing "(patched=1)"
 
 Failed to write calibration
-  Same meaning and cause as "Calibration disabled due to missing firmware
-  controls"
+  If the error code is -2 (ENOENT):
+    * The driver has been unbound and rebound without reprobing.
+    * The wrong firmware .wmfw file was loaded for this hardware so the
+      algorithm IDs in the firmware do not match what the driver is
+      looking for.
+
+  Other error codes likely indicate a problem communicating with the hardware.
 
 Failed to read calibration data from EFI
   Factory calibration data in EFI is missing, empty or corrupt.
-- 
2.47.3

