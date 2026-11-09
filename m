Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794239489;
	b=Fr2/cKrNfhSN4Er5tAv5dY/zbv35kzfqVllaMc80Qdcziv8R8ukPg7g1K2n6C94lu9ZV
	 iJLlgw3Jh41FdDQPrJTC9f26NeqL5G56YYX8sbhiTN0xVl3Ydm2IXzC/LFbl1NGPFurXr
	 8frX54+kJ+NGp1aM8nsRwit8oIxSKRQiDbyHCs0EK1bCMbmfsC0LVbZQs3R/yHDhyCBTS
	 xsl2ksLVjxPBAXE75f+LUwY91vQqXWT4IfC4BJ+ne3RSQIQ8eLjyR+4cBjGtDzLn4esKV
	 a93UE7jnZLnzIa86Dpo+Vny0yWfiyh239VKGTbGbr0ebctYSxiLCPD1N8IHjeedzt1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239489;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Reason;
	bh=SDods1aVUW9+EDDZiiWuuQXWQQiWWpFdRxDxAN0grj8=;
	b=kFNhbjTTCgqv1neuk8s/pdTD7trf3jUabB82zpZooIpfqQB3Gbjqqm212bupcMwYDMnw
	 QH17n5aY9zuLly87/Q/Occ68hmpbAmcYBb3pzfOG81nTLA4S6D+W069dTvg/Dlarbkl23
	 zgVp+MU4groa6bDjoW8yw55XRgyv7uAbnpch1JKXVCKRyN8c989vl/ZXGtNFuWkUd/c5J
	 1nEHhLv5iwr49WStN2lGqSFawygVraYKNc2aKcXyBE2xaX1sScVGIHuiA0SkvLjY3cvd/
	 f/JFPwenvvqZGUMRydw+Os/ywTOidwfIInGN7B3+87kUnLAqGBUq7Nz5HRfLC9VkFDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Tyk0qpTU;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=pUmNuvEu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF2C606A33E;
	Mon,  9 Nov 2026 15:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CF2C606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Tyk0qpTU;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=pUmNuvEu
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9FgSEv3339458;
	Mon, 9 Nov 2026 09:51:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=SDods1aVUW9+EDDZiiWuuQXWQQiWWpFdRxDxAN0grj8=; b=
	Tyk0qpTUtUkfRVjV1JzFoLFZRRuULOglF4HjYQojJafNZeROSZKMJBCxPkbs+fX+
	PtflSVo6oj5N6NXfN/f1YEhcAYvKGAw/CsvMiuv9aR/CTuof10tCYXtfK4dSOweQ
	JQl0jWBIBRWB8ds8z7DeiUpSKovo0E65Vg36C6ORt3d2pS0AJD+K8t1Sxnp63MRs
	/SIrQUUKcqlPHbD8IEuFinNUfGpWKz+o6JxIGaeaUofKIc6Z1fw/6BdwNHIYI3Kr
	43O3TS/8J/3MPmDBNm+Hwp749dcQg+OQwHblEbvmywGGYGLZGZngL4Fpm+tXVUkR
	mfa8GXRgfFkSqUaW076prw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023120.outbound.protection.outlook.com [40.93.196.120])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ht19pacya-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 09:51:17 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LdY8cB7xGuddDhfzQ30gPRkadeGbe8L0MujwiY1TY/yvq4XGz8QMvUMDMAEAHSYKOwkQDyLY1uz40sVX6sAPIiCr6jW9YzfujyAjUWwoHwZWmWUEcRmQUZk/bmHN64xKnmols3wrAMGs+TM79TI9Uc1QMGeUYtJE0yBGn6+9kBQbFI4+4BRBchO+L8BVjwoEs2ylFoc2sxI7AXHO498vQv9ikLOyHENA1qnBTNQlBHOI5RK/yphq4AVMlvN1100STHl70AXeqgspg0OUj5HrbqEZQme3ZK7yfq7LcF6lNj9qgML8RKKXjlvj8tvULnkMdLkowSD4dFubHIThzYDzrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDods1aVUW9+EDDZiiWuuQXWQQiWWpFdRxDxAN0grj8=;
 b=hIQ7be9PHS8nI+TAgGnZNhvTDTVjOYrSxSZ39mZ/nujy9wIzvl10+lmM5EcTqKNSS8/8ORWvchvBM7+bhPpFnApWN5N6ZiD2/FnqZRg7I/ILr1PYu8N1rEZwmTNHi2CpGzo6mY3of6MHacBTaEVokcjcY84vA+e4avA73ANcLwyMXSb7YyyIUpZhmwK3YmCJmI6okF+aRYg6Nf5aawb4RJwSNz3BvLCDW/kA2E+rGBc+PKZxb99qyaZynIusijlGV6hhJ6bZHY3xafFmH2OtQC3YR28EUbZv99biMdem+Ndhaj2STd8De3/qfVzy5puA1Jc9NkdGCsMIn+MN5x8Xkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDods1aVUW9+EDDZiiWuuQXWQQiWWpFdRxDxAN0grj8=;
 b=pUmNuvEuqZ0yKG5ovHQm6Z+sPFltdm/juH+7AAh4imdH8p7oZ8N9hmPhvIzHWK9YUEv9UAfBWvVG/Wboy2lLj/dK5Kkxs8H2lJE8nA2i6FvtQFpITfQbXSzaFj97yKaNGonhPEEYH9wRJSMHFYQG9f24ST5xUl//4XqeHS1qTLY=
Received: from PH8PR21CA0001.namprd21.prod.outlook.com (2603:10b6:510:2ce::25)
 by SA3PR19MB672122.namprd19.prod.outlook.com (2603:10b6:806:52d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 15:51:14 +0000
Received: from BY1PEPF000264B5.namprd02.prod.outlook.com
 (2603:10b6:510:2ce:cafe::a5) by PH8PR21CA0001.outlook.office365.com
 (2603:10b6:510:2ce::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Mon, 9
 Nov 2026 15:51:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF000264B5.mail.protection.outlook.com (10.167.242.122) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 9 Nov 2026 15:51:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BD5C0406553;
	Mon,  9 Nov 2026 15:51:10 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 973BE822563;
	Mon,  9 Nov 2026 15:51:10 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 2/3] ASoC: SDCA: Factor out helper for creating mask of Cluster channels
Date: Mon,  9 Nov 2026 15:51:05 +0000
Message-ID: <20261109155106.3727597-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109155106.3727597-1-ckeepax@opensource.cirrus.com>
References: <20261109155106.3727597-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B5:EE_|SA3PR19MB672122:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b6332bd7-5aba-4b0d-3da4-08df3e7947f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|61400799027|18002099003|16102099003|22082099003|10067099003|3023799007|56012099006|261009223027099003|11063799006|261026121527099003|261102130727099003|261028144727099003|261102123227099003|261022105027099003|261021123027099003|261021121427099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	5DbmADRSrVW7VF4exIvnHUd2T6p2E8wWfvCDzSWeUZyzpxw2GITkDnTFgo2L1bAFKEZb+7Zb2jeCqJomscbKGN2q8tGloSWTfE15ZBAoHJPQMCrNxibXq2XUt1cepc0ZROZAxyvCywOsz49Xtbga9PJIPgxkZhdGIYhQ29r26VaB5dNZnJLG5YkdDuvIX7aIVwK/eS5LwC1sOTwDd9D88uSo6IFg0a+8qYDt9v7BRG5WQvh12MkJAxknXYH3U0+PJOLbcS3JE5SBsBgiKDUZ6nNajb+mfCU2uC6MuyGefJFlsjesUPD1hYfAUIahxXIRtbhy0u7Nrd9bR+sizNm3224aakFwBYIuFQ3zV0USMgtQYfCcTFg54q5z/RpfKGMFVSUyGNjn4su/nFIN7jFeBBDGwM9mTAe2wfta1f8tjC8n9VzHlV1ETjxVq8FP669zx2+nibQC20cP58KiwCrqfg4nmxVKnY4Eu9z7GAMKezCM+M7YfZIUE82fFYhFe1d/gPlqfY0QnSCJFXFAK+5lPPGuuAkapsr9Sjyo70fVyWiruYTCLsqo0Mff6zw3LG7FGM7fTeOhsrtrQnqI73H/Rvyy3L7ABhFuwTjMtIcSpHI46gnNcdxIjFLZfqioh53P5/QjdeeXUswplFTaScCL2Ij0i6rsREsbCQfcMSiabXqwZlRNgrnmfUyA0XHez5zMJfl611VHJ7f6iwcyduMN7g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(61400799027)(18002099003)(16102099003)(22082099003)(10067099003)(3023799007)(56012099006)(261009223027099003)(11063799006)(261026121527099003)(261102130727099003)(261028144727099003)(261102123227099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IwNIIo5AHkn0mZS9pMNYJfgmxfpEGGWmEv7Uq5pHay8keV9gxseFgbmU3sjfTBLKJtAqxjkXo6HN6N80YhugUN6j7RMCNcIW/ERyfdkf3L8/lMbeFuYnDhvPJ9xLkLOL+mkL81c18C2HDPm+gK69bjoqNwfEvkG2e2/XwZVGdZmFoQGvn4LDCQsy6EoFVNvKDcPZoeN0hfFoXttir/2Ufkj5YWyfv7itkJ/9azLIZZrxqiWgo1SfQIyPbjCLnwfHUaiF9L3v7/QwgsxPYiebAu3PQVn7wUYV6L8ZFcjI5BCgN0/dl9mda9a/HkubqaqYYsdJkDTXYwAF4CHUCnEZCnXmHKnW2dzqR0YiWdFrdjMNjBhr8aCg3yJeTKoVyJ1KCAaMsrH4ny3eeoQ+kywRrpbBeZIhWUKVR0+z6Yvj0pwGI1Wh+ey+bsLZAeYupmws
X-Exchange-RoutingPolicyChecked:
	nfmoz0kghypmgMf5nsaWX67bXGdu5zw85bxS1CK92hs1fr0zpNCM4X56N+avBwG+A3ZSDMMGiudJronDtVggN/B1YgXVWDCZMHeDu6aihFEx+BZ0k5yt7/S2UkEPwB6hHmN7yRwoN+LOwLW4t60SnSCtYhXvAppFunY4YAiFCQ5ipbWI5kvhqUyOxPGZdMZweHh141hVQtGwKNfKrOXjlnkdtMx2TdRzeEcjvKsByAVKk4vxOQl9qEBUtze1MXtijCjEtPzE3RJ+bbyZHyKYzIIvxSD9/leCgqGBIv1UWgoHTXf719DvSHrzUNkSt1W5Ni7WVGQSMLyEbdeUz1Z4iA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 15:51:12.5945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6332bd7-5aba-4b0d-3da4-08df3e7947f9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF000264B5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB672122
X-Proofpoint-GUID: KnRYnwGFngIhl_dbLD18iyJgRYUtZAI-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MiBTYWx0ZWRfX2ddwAj4x96ex
 6lZNRJPsM9U53RICRAZInWnXcCPuUbfZuPp842hthuEIHrbTD4yoo8wyiWaZjfK6ZXyyDCBbulK
 sFIVHJ1OVXFhhHbzfty+waqV9BpYEYI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MiBTYWx0ZWRfX4lvv+aXtOwj6
 jXy8ERd0iL7hUNNkVVli7hqvy2TsDyU9Y6vASG6OrQevGdrud7WSOGtybbMPRjg2TJQlmj3xvrw
 qIeBeVcmT6X+daAr/TClwZmoUup0oIQGyn1CWYQmWUqesifqtkUYpz3PJDWdsm+GrHehdPMi3JE
 zITzVdOtrsyTWqMhxdHxt9Goe9bxJJ05Em/AWxHj2frcFfA4WxI98GQjMJjMn2gNzyNwLvMNjxl
 tmIThHIleBDz/0n6MRptFE4lWyf99GSZlIH9C4m1GhcSifV6kCjNbXPfSAzPDtNjkPL47eVlPDP
 gaXqZLAmXVvAYPaYA9Blmd4ge8EgTWFV/sdXYglCUnCKmT9+RhQTAJMWZH7X6vzUAi/OEAzBW7R
 qmmS0NUDIhZmfNib8ZR/I3sx1eir+U0ih9zWvi7Oc7ctDOX6re40PdjlPLLf/SYhHH7Oencwn19
 vwPjzP0kfERzS6qhrqg==
X-Proofpoint-ORIG-GUID: KnRYnwGFngIhl_dbLD18iyJgRYUtZAI-
X-Authority-Analysis: v=2.4 cv=NK5AaE6g c=1 sm=1 tr=0 ts=6af1ebf5 cx=c_pps
 a=obCHicajeL4Z6yanQ/wdqw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=oHLFO8r6Pw0-5CqiDFUA:9
X-Proofpoint-Spam-Reason: safe

Factor out the code that builds a mask of the allowed channels from the
Cluster information. This is slightly cleaner and prepares for
additional constraints to be added to sdca_asoc_set_constraints().

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 sound/soc/sdca/sdca_asoc.c | 64 +++++++++++++++++++++++---------------
 1 file changed, 39 insertions(+), 25 deletions(-)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index b8bde56298706..be1b4c0075796 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -1476,6 +1476,37 @@ int sdca_asoc_free_constraints(struct snd_soc_dai *dai)
 }
 EXPORT_SYMBOL_NS(sdca_asoc_free_constraints, "SND_SOC_SDCA");
 
+static int get_cluster_mask(struct device *dev, struct sdca_function_data *function,
+			    struct sdca_entity *entity, unsigned int *ch_mask)
+{
+	struct sdca_control_range *range;
+	struct sdca_control *control;
+	int i;
+
+	control = sdca_selector_find_control(dev, entity, SDCA_CTL_IT_CLUSTERINDEX);
+	if (!control)
+		return -EINVAL;
+
+	range = sdca_control_find_range(dev, entity, control, SDCA_CLUSTER_NCOLS, 0);
+	if (!range)
+		return -EINVAL;
+
+	*ch_mask = 0;
+
+	for (i = 0; i < range->rows; i++) {
+		int clusterid = sdca_range(range, SDCA_CLUSTER_CLUSTERID, i);
+		struct sdca_cluster *cluster;
+
+		cluster = sdca_id_find_cluster(dev, function, clusterid);
+		if (!cluster)
+			return -ENODEV;
+
+		*ch_mask |= BIT(cluster->num_channels - 1);
+	}
+
+	return 0;
+}
+
 /**
  * sdca_asoc_set_constraints - constrain channels available on a DAI
  * @dev: Pointer to the device, used for error messages.
@@ -1499,42 +1530,25 @@ int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
 	};
 	struct sdca_asoc_constraints *constraints = snd_soc_dai_to_priv(dai);
 	struct sdca_entity *entity = &function->entities[dai->id];
-	struct sdca_control_range *range;
-	struct sdca_control *control;
-	unsigned int channel_mask = 0;
-	int i, ret;
+	unsigned int cluster_ch_mask;
+	int ret;
 
 	static_assert(ARRAY_SIZE(channel_list) == SDCA_MAX_CHANNEL_COUNT);
-	static_assert(sizeof(channel_mask) * BITS_PER_BYTE >= SDCA_MAX_CHANNEL_COUNT);
+	static_assert(sizeof(cluster_ch_mask) * BITS_PER_BYTE >= SDCA_MAX_CHANNEL_COUNT);
 
 	if (entity->type != SDCA_ENTITY_TYPE_IT)
 		return 0;
 
-	control = sdca_selector_find_control(dev, entity, SDCA_CTL_IT_CLUSTERINDEX);
-	if (!control)
-		return -EINVAL;
-
-	range = sdca_control_find_range(dev, entity, control, SDCA_CLUSTER_NCOLS, 0);
-	if (!range)
-		return -EINVAL;
-
-	for (i = 0; i < range->rows; i++) {
-		int clusterid = sdca_range(range, SDCA_CLUSTER_CLUSTERID, i);
-		struct sdca_cluster *cluster;
-
-		cluster = sdca_id_find_cluster(dev, function, clusterid);
-		if (!cluster)
-			return -ENODEV;
-
-		channel_mask |= (1 << (cluster->num_channels - 1));
-	}
+	ret = get_cluster_mask(dev, function, entity, &cluster_ch_mask);
+	if (ret)
+		return ret;
 
 	dev_dbg(dev, "%s: set channel constraint mask: %#x\n",
-		entity->label, channel_mask);
+		entity->label, cluster_ch_mask);
 
 	constraints->channels.count = ARRAY_SIZE(channel_list);
 	constraints->channels.list = channel_list;
-	constraints->channels.mask = channel_mask;
+	constraints->channels.mask = cluster_ch_mask;
 
 	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
 					 SNDRV_PCM_HW_PARAM_CHANNELS,
-- 
2.47.3

