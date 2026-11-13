Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794569697;
	b=H8aN2u+ET8noaVsqYZm8dpp1pdXsOj6oMLS0fi+yEnNaRmTGRjRuMRcFZubZICsFtqcf
	 2vdJr98RwQ606jEdHZds886Tg/KNS7MWnKBfudlrwe6DHt3iTKfc3zvQmnFa5WVZez9zy
	 d09IeQ0BBfLjM2IiJhw1sU8Jo119DEUd4RYwonblUz1fp9SLwCTB/DojG2rJ+pC/WQ0Is
	 DxSopfnXV3wUH6r0CzklKkqkewVy004S4jI0SF2mYvR56PNqtqSSbEXZBuzLY5Jh4ks0b
	 3iWWRODe9X5ixh/F1CiPvEq4eQCfhY2llEQ8+aWhQLwYF0h8orcm44apG4T/RjGt2zQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569697;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=ZCaib3ksxhaVCz0eJA0MvRSJQtlGLAiJl3K88rPNFcI=;
	b=BopT9EgEjXOLdQE0KAFmDLtyzLF/poTzt7QNxqj1cBvhetnUIFMc1pru/PwPGFtV2M91
	 XvttVPbrJriIHyGJsARqvnUt0qElL3Mngu36Q2UM2hcdSa4vKx/dBtMUeJYLEVKqU82PP
	 Rwu0UIfq8l2qCrDOZOwi55kJDncPt40BQDetrdDFFJ3y6Og1sFHZIsEP6QOLVq8J1umAN
	 z4rcQgL3PgXySFSqtRj1o0Uk3aPm8erJUcaJgiFMhn95eiZY10fPwsWcr0O7QH2wrZ+Ro
	 p43kLWG1BUgQZlE/Z/dewNW8+rt9F0ALvdvM5N6Qc9lsfKIiO2kI6DBDA9K0POEv4Pg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=kTf+Ymzw;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=VHHPgxEM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FAF606A31C;
	Fri, 13 Nov 2026 11:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9FAF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=kTf+Ymzw;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=VHHPgxEM
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADAgPua055774;
	Fri, 13 Nov 2026 05:34:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ZCaib3ksxhaVCz0eJA0MvRSJQtlGLAiJl3K88rPNFcI=; b=
	kTf+YmzwNBIXO4ejiBfI8tj/KgQ46LMbB6qJfCRR41qG6/URYZf40Vfv5u8EgB4O
	n9vFcAeFx6WN2ZoPQ8TP3UbsaSXp+/g+wjZj2+BYslx/C9baofCwyzxYvfvMAgj+
	qikqPvoI6kEA9YgfKDyr2WtuQJpR2VlEW9+SG36OGgYI6KTFLLfYLrU8kfbns1xB
	GnjSuE7VXbrL81uHoH2s9qhHPpAH41YlzHZ6yZyH+s3NxruqGmYPXDhC8zF/4u+0
	An8zOMImW2etgtw4Z+GS4bFcaGUcok9JW9O3ajPwyYrs2vit5+6G+IXNMPbo8vx0
	rXTppBz4GaQY6Mt5n/Dukw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020105.outbound.protection.outlook.com [52.101.193.105])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hwcfphnjb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 05:34:48 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KR4kszhOSLtxJs5jzFFsCik0/4s3c6C1QLAl7Sb5ZzFvFqXfUXgif05ZsxyN1lX6n0tNgZ3A/M1PZc317xuV/dIzrHXmET+pgIFLj+IN7u6QjmRTez5B3Shma/Dm8iY0OjoUlB45RKx6YN/PxMNs1vfVh0Vbx/o4mR0eNBrkERQTFh+WCv22AleetaZMJqwZyDb+1TDCyYt2CD8jMcThNQUZov3K/EhbLkFDveGTq3cLuxXmBrJ2T3OzoBjANogaofVjF39b+z87fRZhgr4PHWhQugt7AAOI/EBe2SKguaRz1ZTmFSzBcM+8rKrQ7s0brLVnHDMyyMeB8N9XC+Tx6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCaib3ksxhaVCz0eJA0MvRSJQtlGLAiJl3K88rPNFcI=;
 b=NXntE/AiM6ojes1jO71tKiPCGLKmJLGCzv/Akdqwvwg3j7YmQvUn29LIkxL/syinbbR3+pAUVSSJENW0rJMqRvNvl9sl9LR5cv9He90oEZh9tgmadBqayJks0T6FRpLH6gB2vqj1oJhvxyviOaGGa/D/cjf8OxEyRM0V1DaJA+POtJDGeWfbEFiAIsg3O9XRJzOqz8bXj9cSOXmWutWqSbSMESqca2YRS4X6HmztSFqgFbmq5JiOsdev3kp0Xy6Na8kBztoCERLB3wgAWxBtuOUNFm0zKx9uBnysiz7j1vHN1QyuzEiBQ64iFKXQGxIfgF5uimKnwKPqhzBiIs5N6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCaib3ksxhaVCz0eJA0MvRSJQtlGLAiJl3K88rPNFcI=;
 b=VHHPgxEMQBJBF5KN1KHB2hm+CfWWRxVG/4cTTAj1SOGo5i/CPx1OlnjIizdA2YVfP2fE973VTB0p5EqnwdwQQRdd6bsChyf9IwQmdAYtvC8Z1xMWxaEPu2yghogMYFyCivl/WHIizv20hSk7SRXGoHR7BvoCmgoFAwOLkhgxYp8=
Received: from GVZP280CA0044.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:26f::17)
 by DS0PR19MB7589.namprd19.prod.outlook.com (2603:10b6:8:149::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 11:29:46 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10a6:150:26f:cafe::38) by GVZP280CA0044.outlook.office365.com
 (2603:10a6:150:26f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Fri, 13
 Nov 2026 11:29:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Fri, 13 Nov 2026 11:29:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 13182408F29;
	Fri, 13 Nov 2026 11:29:36 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 03393822561;
	Fri, 13 Nov 2026 11:29:36 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/2] ASoC: cs35l56: Fix unwanted writes to ASP config registers
Date: Fri, 13 Nov 2026 11:29:35 +0000
Message-ID: <20261113112935.2926431-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113112935.2926431-1-rf@opensource.cirrus.com>
References: <20261113112935.2926431-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|DS0PR19MB7589:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 541c52f5-1323-4df3-ffa5-08df417966ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|61400799027|23010399003|18002099003|22082099003|16102099003|6133799003|261009223027099003|11063799006|56012099006|10067099003|261102123227099003|261102130727099003|261022105027099003|261026121527099003|261022075727099003|261028144727099003|261021121427099003|261026140227099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	bUpFH1M7EakwHo4COQxw6aKNd7pfiMPGcwn+7Io+SBENPVFpOPpHC8AEokflFcsgA80+DbOfZAGHaMRABL/hIlDKi2D+MoUSznejKcNq9f6DLTXTRXs/pvPEhZOzqVVzot7WsqHg5lTAR4Euc9S6OdpD1fg2+EomGufK96gOU6dZPnJ236ccG5IOsW10M6h2Gpi72IVojAQGNC4Xi6X+6xoxcawZ/Es3WMhwC6gnwqE9FL0BIo7aIEyGqUHbO5M96keWBnB+jAn08pqjh1EqCYvvxUgeWeZCs8iMgQ7DNE1/HX7yA5BKOcUS1CSkaSQHFermK3Zlino2S0L7KtyBlkId9cJU6NQW15ndyK/bry2qSe9ZABrDCAkA6+LnWkQLCMqDbPfgK3X1riuWbXwrDzNi/hF7k8D+S5a7Ny/A+EgqBebyGJ29e3YP87DwN8RB+/2Sr347Pe7cgQHOqt3v2XBTtYao+SYQ4RrvwdPr8JshZKur6PmR47BUcm/mEiOWlOIpx+LL0j7zpLBn99DRcjDYscDKTA6eu25L+UfTltKfqdKt9xIcgOBuTyAvSFQSeg1QG1eGrjTFp3NMRWDzwhSsH5Mfd7utSxYHDIysdefeKtUBxc5mpnfNIvT98ZGdvKWzg7KRrV/bQ+b2uDyDfNKxJldW3keqmSsuAVhCzq8ACDvqBBsqlB+Z5Q1dh7r03tenlYDRP2Z8CXa5KlceBQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(61400799027)(23010399003)(18002099003)(22082099003)(16102099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261102130727099003)(261022105027099003)(261026121527099003)(261022075727099003)(261028144727099003)(261021121427099003)(261026140227099003)(261021123027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	p1uw5ttBXCdVZyH7i0eJn9WiWLyBgk66vifdyIncO4nm6pWCeQ/RTUhfXKovQVBeAvYByfYztQl7qc0a94R6b4SYXfQH2Syy/zX1UCEkO2d75S3d6e4jUCmC1BEdp30HqvhpEayFBAdc0N7rOMYvY/9K9bisQSViNefTC4qA5cnIeChMALhp3txnLIsg3OVJavdK+xdkeM97RCe1iEyihuLKXPHFTqRODFrN3r8QTiBl2zVP7McAkiJijt8EMN7NT3CDUMU8++Y3HOPO2bya3hV6dudtTx/nVBLAkMP1XMz8EfJFDcgd2k0sB5OUaFvLz7RusuCMg+fT1e+EF6wRWsS5X/e6pllU81z1Ol8KB+PrTCiQW9of/eJulZNyD6ve4vaXaIXhHut29dX+gAnXCedtYG7jglBz+t6m4FSgiL9VcDEDhaoAM2o8hJ7kQUkj
X-Exchange-RoutingPolicyChecked:
	yvpCzA2kMEHqIYu9tn1ue2pcxgLYQl5Xel9ak9nwCFa2TWa6SGpKMS5gQYquK5GQ+eoIPFNjHk9ZRJiwkSkK688SmCMDW8MxdrcAA4jO6Rl2XGmNdybqEK4VWvPXhQLNyec2IeZn9QtoqCwlH9Pkps29t7peERLggAgXWVcp6xW+RNsZM9tbFEhioZq/jcdKj4w+UvkVm/fdEzi2ryxvl+Hzf42zoHck2irEu00Gw+4LCf/RuXGIpzShnCt10xwgsRFem2ief3tpay0103APnvZodVqz+xGOHTPbgGj2jkQAm2EIcznnPfdcmaiqzi93K2BDmfEJDArLL0++CLaACQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 11:29:37.8163
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 541c52f5-1323-4df3-ffa5-08df417966ca
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7589
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0NSBTYWx0ZWRfXxwnQMEjKgMJZ
 UtzORCyECauKsuFwTQzt3aiPBELSpH/t4SswjED22rytRI8weelybIBXXg7BSeB71f3irja/52o
 44C2OcdCixus6AlIjs6K57nqL918v1DEjMRnvuxtKB+VYK7WR5ghj+kvGz15cHRrNHcd28dN/qu
 Jb0vPZH3k/cF2Voaq/i3v1VSj+s/2Ukefk4j0qb08JuL1ZffBRELjg+EVk+kF3hh0a0R1jSTLpw
 6bPPCHPa/KoOKruGFoWJHcNIgH73dO7t7tFVaal4rTXFo+usznzRJOPAk16PqmUHRsotkV8OIdX
 xbnkA2SBWs5eIqfZb7QXjW8HBwBXf4KBGa/kps2FB0pBBBy1zX5Rp+tdlap3AWVpXguzcH4YCrB
 +yO/0CXegg9vnUc9+JC7eHJc/7oETUbypaiJRxxF+h6RAd9yBJLDpmpfI9thPfliSA7P0oeYZy5
 JPlZk6yuFE5jN9R78Xg==
X-Proofpoint-GUID: b7FIfLUXMI4ROeykVlx2SZjY7o_HjcTv
X-Proofpoint-ORIG-GUID: b7FIfLUXMI4ROeykVlx2SZjY7o_HjcTv
X-Authority-Analysis: v=2.4 cv=Woi+otfv c=1 sm=1 tr=0 ts=6af6f5d8 cx=c_pps
 a=XgnhveegYENUCV48Bsxjpw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22 a=w1d2syhTAAAA:8
 a=7oJWtJ7GNMHBuhZXj58A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0NSBTYWx0ZWRfXyIwz+ytLlj/m
 4Vkbb9IWJ77s62Mi7z+kihIrgPEf1ySl3V/lsfA4JV5LtG5s64JtsJ4aMvhlVKa44+JbcNKvnyR
 FO6djGWumQQIR57mwcO5kQOTcdmHWAw=
X-Proofpoint-Spam-Reason: safe

Remove the ASP config registers from the regmap defaults table and use
regmap_multi_reg_write() instead of regmap_register_patch() to write
default values. Use custom event handlers for the ASP1 widgets so
ASP1_ENABLES1 is only written if the ASP is used. Move the HIZ mode
write to ASP1_CONTROL3 into the register sequence instead of writing
it on every driver probe.

This is to prevent accidentally writing to these registers when the driver
does not own them.

The ASP config registers have multiple ownership. They can be owned and
written by the firmware on SKUs that use the ASP as a chip-to-chip audio
interface managed by the firmware. They can be owned and written by an MCU
through one of the other control ports. Or they can be owned by the ASoC
codec driver if they are used for the CPU->amp audio. Because of this
multiple ownership the codec driver must not write the registers if it
doesn't own control of the ASP.

Commit 9351cf3fd92dc ("ASoC: cs35l56: Only patch ASP registers if the DAI
is part of a DAIlink") attempted to deal with this by only writing default
values into the cache if the dai probe() callback was called (which only
happens when the DAI is part of a dailink). The intention was that the
cache values would only be populated if the driver owns the DAI. But this
commit was flawed in three ways:

1. A regcache_sync() without a regcache_mark_dirty() would write the
registers.

The cs35l56/57/62/63 amps are designed to preserve state across suspend
states, so the registers have not necessarily reset when the driver
resumes. For this reason the driver may call regcache_sync() without
regcache_mark_dirty() to sync any changes made while in cache-only.

Regmap pre-populates the cache from the values in the defaults table. So
the cache always contained values for these registers. The regmap cache
doesn't have a per-register dirty flag, only a global dirty. It will write
out everything in the cache if it is dirty. Filtering of cache values that
are at default only happens if regcache_mark_dirty() has been called. So
the ASP config registers were being written for every non-default cache
sync.

2. regmap_register_patch() writes to hardware

The intent was to populate the cache. But regmap_register_patch() disables
cache-only and tries to write the patch to hardware. The DAI probe() can
be called while in runtime-suspend with the hardware not accessible, so
this could fail. There is no need to write the registers to hardware at
this time, the only need is to populate the cache so that the register
settings can be accumulated in the cache as the DAI is configured.

3. ASP1_ENABLES1 was read into the cache during widget initialization

The ASP1 RX and TX widgets provided the address of ASP1_ENABLES1 for ASoC
to manage. But during widget initialization ASoC reads the initial value
of the registers. This meant that the cache was populated with a value
for ASP1_ENABLES1, so that would be written out by regcache_sync().

Fixes: 9351cf3fd92dc ("ASoC: cs35l56: Only patch ASP registers if the DAI is part of a DAIlink")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/cs35l56.h           |  2 +-
 sound/soc/codecs/cs35l56-shared.c | 26 +++----------
 sound/soc/codecs/cs35l56.c        | 63 ++++++++++++++++++++-----------
 3 files changed, 48 insertions(+), 43 deletions(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index e1b098d1d146..362dfa2761bc 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -412,7 +412,7 @@ extern const char * const cs35l56_cal_set_status_text[3];
 extern const char * const cs35l56_tx_input_texts[CS35L56_NUM_INPUT_SRC];
 extern const unsigned int cs35l56_tx_input_values[CS35L56_NUM_INPUT_SRC];
 
-int cs35l56_set_asp_patch(struct cs35l56_base *cs35l56_base);
+int cs35l56_set_asp_defaults(struct cs35l56_base *cs35l56_base);
 int cs35l56_set_patch(struct cs35l56_base *cs35l56_base);
 int cs35l56_mbox_send(struct cs35l56_base *cs35l56_base, unsigned int command);
 int cs35l56_firmware_shutdown(struct cs35l56_base *cs35l56_base);
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index c44bf8bc4e0c..4d76f1777927 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -34,19 +34,19 @@ static const struct reg_sequence cs35l56_asp_patch[] = {
 	{ CS35L56_ASP1_ENABLES1,		0x00000000 },
 	{ CS35L56_ASP1_CONTROL1,		0x00000028 },
 	{ CS35L56_ASP1_CONTROL2,		0x18180200 },
-	{ CS35L56_ASP1_CONTROL3,		0x00000002 },
+	{ CS35L56_ASP1_CONTROL3,		0x00000003 },
 	{ CS35L56_ASP1_FRAME_CONTROL1,		0x03020100 },
 	{ CS35L56_ASP1_FRAME_CONTROL5,		0x00020100 },
 	{ CS35L56_ASP1_DATA_CONTROL1,		0x00000018 },
 	{ CS35L56_ASP1_DATA_CONTROL5,		0x00000018 },
 };
 
-int cs35l56_set_asp_patch(struct cs35l56_base *cs35l56_base)
+int cs35l56_set_asp_defaults(struct cs35l56_base *cs35l56_base)
 {
-	return regmap_register_patch(cs35l56_base->regmap, cs35l56_asp_patch,
-				     ARRAY_SIZE(cs35l56_asp_patch));
+	return regmap_multi_reg_write(cs35l56_base->regmap, cs35l56_asp_patch,
+				      ARRAY_SIZE(cs35l56_asp_patch));
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_set_asp_patch, "SND_SOC_CS35L56_SHARED");
+EXPORT_SYMBOL_NS_GPL(cs35l56_set_asp_defaults, "SND_SOC_CS35L56_SHARED");
 
 static const struct reg_sequence cs35l56_patch[] = {
 	/*
@@ -105,14 +105,6 @@ int cs35l56_set_patch(struct cs35l56_base *cs35l56_base)
 EXPORT_SYMBOL_NS_GPL(cs35l56_set_patch, "SND_SOC_CS35L56_SHARED");
 
 static const struct reg_default cs35l56_reg_defaults[] = {
-	{ CS35L56_ASP1_ENABLES1,		0x00000000 },
-	{ CS35L56_ASP1_CONTROL1,		0x00000028 },
-	{ CS35L56_ASP1_CONTROL2,		0x18180200 },
-	{ CS35L56_ASP1_CONTROL3,		0x00000002 },
-	{ CS35L56_ASP1_FRAME_CONTROL1,		0x03020100 },
-	{ CS35L56_ASP1_FRAME_CONTROL5,		0x00020100 },
-	{ CS35L56_ASP1_DATA_CONTROL1,		0x00000018 },
-	{ CS35L56_ASP1_DATA_CONTROL5,		0x00000018 },
 	{ CS35L56_SWIRE_DP3_CH1_INPUT,		0x00000018 },
 	{ CS35L56_SWIRE_DP3_CH2_INPUT,		0x00000019 },
 	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
@@ -129,14 +121,6 @@ static const struct reg_default cs35l56_reg_defaults[] = {
 };
 
 static const struct reg_default cs35l63_reg_defaults[] = {
-	{ CS35L56_ASP1_ENABLES1,		0x00000000 },
-	{ CS35L56_ASP1_CONTROL1,		0x00000028 },
-	{ CS35L56_ASP1_CONTROL2,		0x18180200 },
-	{ CS35L56_ASP1_CONTROL3,		0x00000002 },
-	{ CS35L56_ASP1_FRAME_CONTROL1,		0x03020100 },
-	{ CS35L56_ASP1_FRAME_CONTROL5,		0x00020100 },
-	{ CS35L56_ASP1_DATA_CONTROL1,		0x00000018 },
-	{ CS35L56_ASP1_DATA_CONTROL5,		0x00000018 },
 	{ CS35L56_SWIRE_DP3_CH1_INPUT,		0x00000018 },
 	{ CS35L56_SWIRE_DP3_CH2_INPUT,		0x00000019 },
 	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 852491f8340b..ded8d1cdfd24 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -332,14 +332,38 @@ static int cs35l56_play_event(struct snd_soc_dapm_widget *w,
 	}
 }
 
+static int cs35l56_asp_event(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
+
+	return regmap_assign_bits(cs35l56->base.regmap, CS35L56_ASP1_ENABLES1,
+				  BIT(w->shift),
+				  SND_SOC_DAPM_EVENT_ON(event));
+}
+
 static int cs35l56_asp_tx_event(struct snd_soc_dapm_widget *w,
 				struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
+	int ret;
 
-	return regmap_write(cs35l56->base.regmap, CS35L56_ASP1TX1_INPUT + (4 * w->shift),
-			    cs35l56->asp_tx_input[w->shift]);
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		ret = regmap_write(cs35l56->base.regmap,
+				   CS35L56_ASP1TX1_INPUT + (4 * w->shift),
+				   cs35l56->asp_tx_input[w->shift]);
+		if (ret)
+			return ret;
+
+		break;
+	default:
+		break;
+	}
+
+	return cs35l56_asp_event(w, kcontrol, event);
 }
 
 static const struct snd_soc_dapm_widget cs35l56_dapm_widgets[] = {
@@ -355,22 +379,25 @@ static const struct snd_soc_dapm_widget cs35l56_dapm_widgets[] = {
 	SND_SOC_DAPM_PGA_E("DSP1", SND_SOC_NOPM, 0, 0, NULL, 0, cs35l56_dsp_event,
 			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
 
-	SND_SOC_DAPM_AIF_IN("ASP1RX1", NULL, 0, CS35L56_ASP1_ENABLES1,
-			    CS35L56_ASP_RX1_EN_SHIFT, 0),
-	SND_SOC_DAPM_AIF_IN("ASP1RX2", NULL, 1, CS35L56_ASP1_ENABLES1,
-			    CS35L56_ASP_RX2_EN_SHIFT, 0),
-	SND_SOC_DAPM_AIF_OUT_E("ASP1TX1", NULL, 0, CS35L56_ASP1_ENABLES1,
+	/* Avoid reading ASP1_ENABLES1 when DAPM initializes the widgets. */
+	SND_SOC_DAPM_AIF_IN_E("ASP1RX1", NULL, 0, SND_SOC_NOPM,
+			      CS35L56_ASP_RX1_EN_SHIFT, 0,
+			      cs35l56_asp_event, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_AIF_IN_E("ASP1RX2", NULL, 1, SND_SOC_NOPM,
+			      CS35L56_ASP_RX2_EN_SHIFT, 0,
+			      cs35l56_asp_event, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_AIF_OUT_E("ASP1TX1", NULL, 0, SND_SOC_NOPM,
 			       CS35L56_ASP_TX1_EN_SHIFT, 0,
-			       cs35l56_asp_tx_event, SND_SOC_DAPM_PRE_PMU),
-	SND_SOC_DAPM_AIF_OUT_E("ASP1TX2", NULL, 1, CS35L56_ASP1_ENABLES1,
+			       cs35l56_asp_tx_event, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_AIF_OUT_E("ASP1TX2", NULL, 1, SND_SOC_NOPM,
 			       CS35L56_ASP_TX2_EN_SHIFT, 0,
-			       cs35l56_asp_tx_event, SND_SOC_DAPM_PRE_PMU),
-	SND_SOC_DAPM_AIF_OUT_E("ASP1TX3", NULL, 2, CS35L56_ASP1_ENABLES1,
+			       cs35l56_asp_tx_event, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_AIF_OUT_E("ASP1TX3", NULL, 2, SND_SOC_NOPM,
 			       CS35L56_ASP_TX3_EN_SHIFT, 0,
-			       cs35l56_asp_tx_event, SND_SOC_DAPM_PRE_PMU),
-	SND_SOC_DAPM_AIF_OUT_E("ASP1TX4", NULL, 3, CS35L56_ASP1_ENABLES1,
+			       cs35l56_asp_tx_event, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_AIF_OUT_E("ASP1TX4", NULL, 3, SND_SOC_NOPM,
 			       CS35L56_ASP_TX4_EN_SHIFT, 0,
-			       cs35l56_asp_tx_event, SND_SOC_DAPM_PRE_PMU),
+			       cs35l56_asp_tx_event, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 
 	SND_SOC_DAPM_MUX("ASP1 TX1 Source", SND_SOC_NOPM, 0, 0, &asp1_tx1_mux),
 	SND_SOC_DAPM_MUX("ASP1 TX2 Source", SND_SOC_NOPM, 0, 0, &asp1_tx2_mux),
@@ -473,7 +500,7 @@ static int cs35l56_asp_dai_probe(struct snd_soc_dai *codec_dai)
 {
 	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(codec_dai->component);
 
-	return cs35l56_set_asp_patch(&cs35l56->base);
+	return cs35l56_set_asp_defaults(&cs35l56->base);
 }
 
 static int cs35l56_asp_dai_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
@@ -2315,12 +2342,6 @@ int cs35l56_init(struct cs35l56_private *cs35l56)
 	/* Registers could be dirty after soft reset or SoundWire enumeration */
 	regcache_sync(cs35l56->base.regmap);
 
-	/* Set ASP1 DOUT to high-impedance when it is not transmitting audio data. */
-	ret = regmap_set_bits(cs35l56->base.regmap, CS35L56_ASP1_CONTROL3,
-			      CS35L56_ASP1_DOUT_HIZ_CTRL_MASK);
-	if (ret)
-		return dev_err_probe(cs35l56->base.dev, ret, "Failed to write ASP1_CONTROL3\n");
-
 	cs35l56->needs_wait_for_fw_idle =
 		cs35l56_needs_wait_for_firmware_timer_expiry(&cs35l56->base);
 
-- 
2.47.3

