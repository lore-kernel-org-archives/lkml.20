Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794569996;
	b=XHYKq/CbiwO85uSsCyvYu2zUZcyuMDo2XZRJOYpNqM4MIcH/P37OOtaiVk3YqO3a7QYU
	 FwfwpBp25U66bBe1hne1kotZCTn+ZW1xO8dw8tGn8klRvUE7LAQoGQgKzq6u8lcivRWbP
	 pr9mQSZCM1T+qVM8cOpGbQjE6AphB0w/oMApmYFnfrWOib8VqgvTVGuFoNDaWVeTtscXT
	 SSMOCDPWeynHb0cXYuoVIQKYvIZhpn9KZ16W5iycdjXJ39CaXBYmXgpKJArK7fjWQhwwj
	 xqyAI/ZOtmh4R5lWOC5jH7cXtD5ncpikot+suWDMk8idwEs3o+eDSXKQ1mmnFjm6mAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569996;
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
	bh=S/yxzZH0DtobECrTVNp3KUgeVtZf3iCUy+GM0Rlh5eY=;
	b=ji5VbIegxyMso67j5t+tO1sfdcouHLRZrdGmB1FLffgcikAnzQii5OJBP/VcciNRMB96
	 0d2iIz10NuVsCWMTz60x6DSkQwcigDrkInhX29QLrBOeM/EbuH6ERTCSJL6jslAcs0p+H
	 5AdWU0jk1itP3aqApsO61LfXc5ZrkbxMid2q8QdeoWAPxEMGQln0D70m4thSBRLAKkypi
	 hG9pVU1dNf1KKDJ5jjRUl1aUW3tYfTuupAVx+o0fPUORh0Gh36M5jy/DafslDvuYwkNa9
	 SqPn2GypveHzmvB/ro4B0QM6jMjJAlvAI4gFcQB5YMRamHqzwxoNHUdN4TtBJhI/tnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=RFikF7yQ;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=PK1X8BmM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26054606A321;
	Fri, 13 Nov 2026 11:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26054606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=RFikF7yQ;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=PK1X8BmM
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADAgPvb055774;
	Fri, 13 Nov 2026 05:39:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=S/yxzZH0DtobECrTVNp3KUgeVtZf3iCUy+GM0Rlh5eY=; b=
	RFikF7yQgzrRvLmaKVI/3nY1oVw+EYg+oUbzJQhX5/DSpGIXEWjkgB91ec9xV74A
	M8SURkcQW2JdlA6RYqxOFIpbJgNu/9ZW24KWKJDkgqKrNhY4ZPz1lDoCsAfbAJx/
	zNM9E2ihAzIyA8lHxvEPufXwEaL3vYxIvcy/YpQLlHf8ae21Iko7ev4TZzb3Ps4p
	QmA5UzkBmhTrYWE4cPpidIgicUxVXsNvxswv90p0Tn54R0F/ItW/diLWB6BlFyBT
	IbjWIJhqM/iSjxNTMZvQEMTgNpLPcbqpwnyDrs4l/gplNGeoJ/A04FkLIuwUqFKS
	8eRI3rSMya+mbXBQz9Pdxw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022123.outbound.protection.outlook.com [52.101.43.123])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hwcfphnpk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 05:39:53 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhZceCmys4DOZkeTgxgyn5C4/MQjt21F5kOwdkf/lypaT3SWj8QWn7DzF12HJ8UZqyYrOJCNrfNWYBx29E5NVGAXghic4YqSEH9fVs8ctshKMREkGPz4pqQf6s1lSf9fxA9N/TTkL9EbmDy0Djfiqn7f1UW2HETtjzkoltwjrQuIsu5UzpulhuZc7ySlOJBXtD7WO+9pPsGkweR0A4HYPZylPNx0OCUqYm7bewwyb7HPihwAwrom7sMm7Qrmn5SbAwOdueKuf6n7+GZzL4Nu7eXmT4JwI+htwu+mvyxs1T9S1MdL8jP91AJPBOaYxyz+SruTNRKHRHK6wI6pvlElvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/yxzZH0DtobECrTVNp3KUgeVtZf3iCUy+GM0Rlh5eY=;
 b=wSJFRpG0bZe5pO5EEuECQrQsYuqE7+Bl8O13Hag2lss+5+CATJ3/yXqfnWmui1A8/gE8SkfJMK1pQokunMNdQqw1XCdaQAXuqP+vmsyB8OI10UN/xJmcquPndvL/7Pv9gBKGO8Map0mB3z3cqopt7k/Gu74CSJHhnxEG3F/sgxrkN4KFCzIz5y4NZqeSiSNdNtPbjcDiXzHAMhHYTpOlB9l+qs38qzgXhrfIjLVIfgC0csZzkKFZKXFVjNQKrI2Do3ZEeC3td2nA7LAM3lk+8BoViYg7fsA6T2tDWckHQYeqtkBghjq69pAP1cyox+0jS2WzSzX+gzju1wxzvTeThA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/yxzZH0DtobECrTVNp3KUgeVtZf3iCUy+GM0Rlh5eY=;
 b=PK1X8BmM/ruMC13eRYjB9sAB5wexoSKOcDkjm0/H3ESSFJgBp2Hn2tiFkHx2hQ75OmEY4nKiuk+6AtAe+V0lsLKVL748GIO/avBW1IzHY62e5ZaideX413xtZw11CUJ1DKW5TJ2oWd+yWYu7PAvY7aD9Y683crKKt+Pz2TAd0HE=
Received: from DUZPR01CA0162.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::10) by MW4PR19MB7078.namprd19.prod.outlook.com
 (2603:10b6:303:22f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 11:39:45 +0000
Received: from SJ1PEPF0000231D.namprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::48) by DUZPR01CA0162.outlook.office365.com
 (2603:10a6:10:4bd::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Fri,
 13 Nov 2026 11:39:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF0000231D.mail.protection.outlook.com (10.167.242.234) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Fri, 13 Nov 2026 11:39:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1224D4084BE;
	Fri, 13 Nov 2026 11:29:36 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E906F822540;
	Fri, 13 Nov 2026 11:29:35 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/2] ASoC: cs35l56: Only write ASP1TXn registers when widget is powered-up
Date: Fri, 13 Nov 2026 11:29:34 +0000
Message-ID: <20261113112935.2926431-2-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231D:EE_|MW4PR19MB7078:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a9da6d82-3818-477e-9897-08df417acad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|23010399003|376014|18002099003|16102099003|22082099003|261009223027099003|3023799007|11063799006|56012099006|261021121427099003|261021123027099003|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	3KIx/9HCC2KucCMUT9APcaT6fJZlY2avzEKGqcCANfoCVP3KjYN2SKssIzfBZ7LtE+74lg3aFXKZva1MBmYDEF+ccrAZS0S42c32gcG8/MC/wrhzDOgGses58KAi+6Je79CqHHVb0SeIbiV1+fOVL7LUjAnQH02ThawzGs7dFtFmBUtqS5ZtL/j0X9Jpeh1mcM8Xd3KENFczR1BsUBGo146X07rUUdcO3jbloBZnRKJksEKffBOKZUUW7KFDMmkyk45l6M3786GgxzP8KykPjV7gLHAbm6WpndlHcx94OFVihmPHswjqLuNY4OyWHPEYe2nTMhhCkEnoM+Fk5KGAz1bFuy6Tp64CF/QgpG2M+mXt70roy7fnE2DksOdNNyvWr4UCHkxLLUU2fqWo8O1eps9bjbh/Ep9t/M28xB7CnOJF2itJU3yxqBnAt+u35xykwkbmtZOIUj8wUtuWMd2G8XYr1zGgPhBl5tSKn45cyUkrHCrQ48SoNEK286nkjvYkJLfV28MpWhfkXKNywLwQk2YUV5f79x8bdl1evMXk5p/r1aRFmo8WOMkD1j83ZKfPmzZJO9hWyGT3/Jd4BjppECPrgKfKaRjqwA760E3+k2ru/hyFvKvl+LZ7DbhE3JmCQJqHIsOafhVxnav4VvVNseGgl8hUoL/AKw8kIKaEf3aD6xs+XyMMwUvWkS31eumpn2Qk3+GYu5N9xkScHEOb9g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(23010399003)(376014)(18002099003)(16102099003)(22082099003)(261009223027099003)(3023799007)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QD02BTGt9wa+SRXB8FSJ7Ew3TfqtOqX8tN5ggMsdQkdQAXS+5/lnmCS+FdG7E/ILsEYORkitJzToU8RhgIw5PNQZnzDupmRgwJZki4E3GpoSnEPWS0tbS+kV/OTJR35ONRKuhzx2cDJy+2KvBdyKtHHJ0Ey5NimR3zsdUn6yanp1wTViT8mZjt8Fp9sejw23ZeNWQixIWnGhJ5zt4r2kXSf2H9ZFRypxb3ozgJ+Jq+QOqhrxHjWObpIEAho/zVdXrvyyoWsZt164tB5yawBnhTnuShh8iF/vtB7lCFo/wjnMVJT1kaU8oICi6Vm5hjGf1CCTz1yVC3IMurgMoNfg7vZDxaR+sf1BQjvRtrpv9oRqa7po9yAOcuw3zB+UcBGCZtJFOn5xYc7xn8WOvlVz+1g+9KhFyCPQsCHUpScnV86hiGWAvr6Es1wFP36SnXSw
X-Exchange-RoutingPolicyChecked:
	4C5jPQLweizwlg2rvtTYEtrXHxsVgHROOlR74dXJxQp7Ab0bgS5e9H7iL5oUON7jTB4YCbBb778BszuteC+rcCOXvoIYKsJRDgxr4a2aygARfPR84fX94gHorIIw08n/LUWTZU99ijVcsChi0WoOcYkMHT7QMla9AH97G8T/8AOWZa7M+4hrlq8lk7m+DldnMSLoETPneccJ4Bc2U32WE9cshXrn1IowlyYQdMuUCr2BgHAYCs9CSUA9VEhFj546Bgy+4KYED1YWrZVSPa2w6vTbjxfMGQgUsjtEBeZ1KXFJZ4wdgGdIyBXa79wWAL/UFUm5Mlwez3CBaK5lZWXuXg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 11:39:35.1214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9da6d82-3818-477e-9897-08df417acad0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF0000231D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB7078
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0NiBTYWx0ZWRfX/CRD8IpfCqdi
 pRmrKtDTGRdDWvvZUbM3QB7+wB1O0SSrq+7lmTyMJNY+kxJdKVky926p0EQqJoTioYmyRuVvJSk
 sGIIp7kbRf5E5zI+zAIS2Q+y6luEmzf3YOou3QbB7kvG1L1OkxvyVCl1uHCO19H5js79BdyP9ij
 gh3B7nSB14426HS4h0NksVOwCYkM+DQmZXGxgXDOOqZrQBfW9/TCf7STpByNUGs3Zxqv1EEoL1P
 aSDxAPbt0DMVCRRnR+KHwh6mHKjMFXieHOsmGxQbjX06sEREp5IyNZnzWSeBo8MS4QEmuYVhzX8
 mSXTeggxXReEt18mUWH2MOLY+s2qfdeU9RarC+R3Cq6B5vPcCS2nQJECG5Nt5uZZbDiiaUh3hat
 OxcEDQmGNUgG5tX6B3MohIlBKxv+yljuQMqomiHRP7VxiIsO9+qNkO6YntW1YYEqSBL8njcppLN
 BNKYxZ2OAv1B2AQ/q9Q==
X-Proofpoint-GUID: gipE5lr3XiJQGWAhtaa_MvCKIKMdEOEy
X-Proofpoint-ORIG-GUID: gipE5lr3XiJQGWAhtaa_MvCKIKMdEOEy
X-Authority-Analysis: v=2.4 cv=Woi+otfv c=1 sm=1 tr=0 ts=6af6f709 cx=c_pps
 a=0vj9JdGoO5ZFtW877mlItg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22 a=w1d2syhTAAAA:8
 a=DJewdLnBEc7raOykfXcA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0NiBTYWx0ZWRfX16IkoFKNLY4z
 QU8A6S6j8FvNT6Vmezv3hYJ4QhwqpnGZy/lndf+6hLJPREDnYEnZt1+dOrnKZFqF8V4GmP0InZH
 ze/8sm0+h5r6sohdU68Xz9lDH5FBGSY=
X-Proofpoint-Spam-Reason: safe

Cache the value written to the "ASP1 TXn Source" controls and write them
to registers only when the widget is powered-up. Remove them from the
regmap defaults table so regmap won't write them during a regcache_sync().

The ASP registers have multiple ownership, depending on the hardware
design. They can be owned by the firmware, or by a MCU on a secondary
control interface, or by the driver. If the driver doesn't own control
of the ASP it must not overwrite the registers.

ALSA control read/write now goes to cached values in struct
cs35l56_private. The values are written out if the widget powers up,
which can only happen if the machine driver has connected the ASP DAI in
a DAIlink. If the control value is changed while the widget is powered
the change will be deferred until the next widget power-up. Changing
the hardware mux on-the-fly while active is not supported.

Fixes: 9351cf3fd92dc ("ASoC: cs35l56: Only patch ASP registers if the DAI is part of a DAIlink")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-shared.c |  12 ----
 sound/soc/codecs/cs35l56.c        | 104 ++++++++++++++++++++++++------
 sound/soc/codecs/cs35l56.h        |   1 +
 3 files changed, 86 insertions(+), 31 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index b37f65cd4d33..c44bf8bc4e0c 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -39,10 +39,6 @@ static const struct reg_sequence cs35l56_asp_patch[] = {
 	{ CS35L56_ASP1_FRAME_CONTROL5,		0x00020100 },
 	{ CS35L56_ASP1_DATA_CONTROL1,		0x00000018 },
 	{ CS35L56_ASP1_DATA_CONTROL5,		0x00000018 },
-	{ CS35L56_ASP1TX1_INPUT,		0x00000000 },
-	{ CS35L56_ASP1TX2_INPUT,		0x00000000 },
-	{ CS35L56_ASP1TX3_INPUT,		0x00000000 },
-	{ CS35L56_ASP1TX4_INPUT,		0x00000000 },
 };
 
 int cs35l56_set_asp_patch(struct cs35l56_base *cs35l56_base)
@@ -117,10 +113,6 @@ static const struct reg_default cs35l56_reg_defaults[] = {
 	{ CS35L56_ASP1_FRAME_CONTROL5,		0x00020100 },
 	{ CS35L56_ASP1_DATA_CONTROL1,		0x00000018 },
 	{ CS35L56_ASP1_DATA_CONTROL5,		0x00000018 },
-	{ CS35L56_ASP1TX1_INPUT,		0x00000000 },
-	{ CS35L56_ASP1TX2_INPUT,		0x00000000 },
-	{ CS35L56_ASP1TX3_INPUT,		0x00000000 },
-	{ CS35L56_ASP1TX4_INPUT,		0x00000000 },
 	{ CS35L56_SWIRE_DP3_CH1_INPUT,		0x00000018 },
 	{ CS35L56_SWIRE_DP3_CH2_INPUT,		0x00000019 },
 	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
@@ -145,10 +137,6 @@ static const struct reg_default cs35l63_reg_defaults[] = {
 	{ CS35L56_ASP1_FRAME_CONTROL5,		0x00020100 },
 	{ CS35L56_ASP1_DATA_CONTROL1,		0x00000018 },
 	{ CS35L56_ASP1_DATA_CONTROL5,		0x00000018 },
-	{ CS35L56_ASP1TX1_INPUT,		0x00000000 },
-	{ CS35L56_ASP1TX2_INPUT,		0x00000000 },
-	{ CS35L56_ASP1TX3_INPUT,		0x00000000 },
-	{ CS35L56_ASP1TX4_INPUT,		0x00000000 },
 	{ CS35L56_SWIRE_DP3_CH1_INPUT,		0x00000018 },
 	{ CS35L56_SWIRE_DP3_CH2_INPUT,		0x00000019 },
 	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index a4d25c287941..852491f8340b 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -178,41 +178,91 @@ static const struct snd_kcontrol_new cs35l63_controls[] = {
 			 SNDRV_CTL_ELEM_ACCESS_READ | SNDRV_CTL_ELEM_ACCESS_VOLATILE),
 };
 
+static int cs35l56_asp_tx_get(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+
+	snd_soc_dapm_mutex_lock(dapm);
+	ucontrol->value.enumerated.item[0] =
+		snd_soc_enum_val_to_item(e, cs35l56->asp_tx_input[e->shift_l]);
+	snd_soc_dapm_mutex_unlock(dapm);
+
+	return 0;
+}
+
+static int cs35l56_asp_tx_put(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int item = ucontrol->value.enumerated.item[0];
+	unsigned int val;
+	bool change = false;
+
+	if (item >= e->items)
+		return -EINVAL;
+
+	val = snd_soc_enum_item_to_val(e, item);
+
+	snd_soc_dapm_mutex_lock(dapm);
+	if (cs35l56->asp_tx_input[e->shift_l] != val)
+		change = true;
+
+	cs35l56->asp_tx_input[e->shift_l] = val;
+	snd_soc_dapm_mutex_unlock(dapm);
+
+	if (change)
+		snd_soc_dapm_mux_update_power(dapm, kcontrol, item, e, NULL);
+
+	return change;
+}
+
+/* The shift field of each virtual enum holds the ASP TX channel index. */
 static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_asp1tx1_enum,
-				  CS35L56_ASP1TX1_INPUT,
+				  SND_SOC_NOPM,
 				  0, CS35L56_ASP_TXn_SRC_MASK,
 				  cs35l56_tx_input_texts,
 				  cs35l56_tx_input_values);
 
 static const struct snd_kcontrol_new asp1_tx1_mux =
-	SOC_DAPM_ENUM("ASP1TX1 SRC", cs35l56_asp1tx1_enum);
+	SOC_DAPM_ENUM_EXT("ASP1TX1 SRC", cs35l56_asp1tx1_enum,
+			  cs35l56_asp_tx_get, cs35l56_asp_tx_put);
 
 static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_asp1tx2_enum,
-				  CS35L56_ASP1TX2_INPUT,
-				  0, CS35L56_ASP_TXn_SRC_MASK,
+				  SND_SOC_NOPM,
+				  1, CS35L56_ASP_TXn_SRC_MASK,
 				  cs35l56_tx_input_texts,
 				  cs35l56_tx_input_values);
 
 static const struct snd_kcontrol_new asp1_tx2_mux =
-	SOC_DAPM_ENUM("ASP1TX2 SRC", cs35l56_asp1tx2_enum);
+	SOC_DAPM_ENUM_EXT("ASP1TX2 SRC", cs35l56_asp1tx2_enum,
+			  cs35l56_asp_tx_get, cs35l56_asp_tx_put);
 
 static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_asp1tx3_enum,
-				  CS35L56_ASP1TX3_INPUT,
-				  0, CS35L56_ASP_TXn_SRC_MASK,
+				  SND_SOC_NOPM,
+				  2, CS35L56_ASP_TXn_SRC_MASK,
 				  cs35l56_tx_input_texts,
 				  cs35l56_tx_input_values);
 
 static const struct snd_kcontrol_new asp1_tx3_mux =
-	SOC_DAPM_ENUM("ASP1TX3 SRC", cs35l56_asp1tx3_enum);
+	SOC_DAPM_ENUM_EXT("ASP1TX3 SRC", cs35l56_asp1tx3_enum,
+			  cs35l56_asp_tx_get, cs35l56_asp_tx_put);
 
 static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_asp1tx4_enum,
-				  CS35L56_ASP1TX4_INPUT,
-				  0, CS35L56_ASP_TXn_SRC_MASK,
+				  SND_SOC_NOPM,
+				  3, CS35L56_ASP_TXn_SRC_MASK,
 				  cs35l56_tx_input_texts,
 				  cs35l56_tx_input_values);
 
 static const struct snd_kcontrol_new asp1_tx4_mux =
-	SOC_DAPM_ENUM("ASP1TX4 SRC", cs35l56_asp1tx4_enum);
+	SOC_DAPM_ENUM_EXT("ASP1TX4 SRC", cs35l56_asp1tx4_enum,
+			  cs35l56_asp_tx_get, cs35l56_asp_tx_put);
 
 static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_sdw1tx1_enum,
 				CS35L56_SWIRE_DP3_CH1_INPUT,
@@ -282,6 +332,16 @@ static int cs35l56_play_event(struct snd_soc_dapm_widget *w,
 	}
 }
 
+static int cs35l56_asp_tx_event(struct snd_soc_dapm_widget *w,
+				struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
+
+	return regmap_write(cs35l56->base.regmap, CS35L56_ASP1TX1_INPUT + (4 * w->shift),
+			    cs35l56->asp_tx_input[w->shift]);
+}
+
 static const struct snd_soc_dapm_widget cs35l56_dapm_widgets[] = {
 	SND_SOC_DAPM_REGULATOR_SUPPLY("VDD_B", 0, 0),
 	SND_SOC_DAPM_REGULATOR_SUPPLY("VDD_AMP", 0, 0),
@@ -299,14 +359,18 @@ static const struct snd_soc_dapm_widget cs35l56_dapm_widgets[] = {
 			    CS35L56_ASP_RX1_EN_SHIFT, 0),
 	SND_SOC_DAPM_AIF_IN("ASP1RX2", NULL, 1, CS35L56_ASP1_ENABLES1,
 			    CS35L56_ASP_RX2_EN_SHIFT, 0),
-	SND_SOC_DAPM_AIF_OUT("ASP1TX1", NULL, 0, CS35L56_ASP1_ENABLES1,
-			     CS35L56_ASP_TX1_EN_SHIFT, 0),
-	SND_SOC_DAPM_AIF_OUT("ASP1TX2", NULL, 1, CS35L56_ASP1_ENABLES1,
-			     CS35L56_ASP_TX2_EN_SHIFT, 0),
-	SND_SOC_DAPM_AIF_OUT("ASP1TX3", NULL, 2, CS35L56_ASP1_ENABLES1,
-			     CS35L56_ASP_TX3_EN_SHIFT, 0),
-	SND_SOC_DAPM_AIF_OUT("ASP1TX4", NULL, 3, CS35L56_ASP1_ENABLES1,
-			     CS35L56_ASP_TX4_EN_SHIFT, 0),
+	SND_SOC_DAPM_AIF_OUT_E("ASP1TX1", NULL, 0, CS35L56_ASP1_ENABLES1,
+			       CS35L56_ASP_TX1_EN_SHIFT, 0,
+			       cs35l56_asp_tx_event, SND_SOC_DAPM_PRE_PMU),
+	SND_SOC_DAPM_AIF_OUT_E("ASP1TX2", NULL, 1, CS35L56_ASP1_ENABLES1,
+			       CS35L56_ASP_TX2_EN_SHIFT, 0,
+			       cs35l56_asp_tx_event, SND_SOC_DAPM_PRE_PMU),
+	SND_SOC_DAPM_AIF_OUT_E("ASP1TX3", NULL, 2, CS35L56_ASP1_ENABLES1,
+			       CS35L56_ASP_TX3_EN_SHIFT, 0,
+			       cs35l56_asp_tx_event, SND_SOC_DAPM_PRE_PMU),
+	SND_SOC_DAPM_AIF_OUT_E("ASP1TX4", NULL, 3, CS35L56_ASP1_ENABLES1,
+			       CS35L56_ASP_TX4_EN_SHIFT, 0,
+			       cs35l56_asp_tx_event, SND_SOC_DAPM_PRE_PMU),
 
 	SND_SOC_DAPM_MUX("ASP1 TX1 Source", SND_SOC_NOPM, 0, 0, &asp1_tx1_mux),
 	SND_SOC_DAPM_MUX("ASP1 TX2 Source", SND_SOC_NOPM, 0, 0, &asp1_tx2_mux),
@@ -1438,6 +1502,8 @@ static int _cs35l56_component_probe(struct snd_soc_component *component)
 
 	BUILD_BUG_ON(ARRAY_SIZE(cs35l56_tx_input_texts) != ARRAY_SIZE(cs35l56_tx_input_values));
 
+	memset(&cs35l56->asp_tx_input, 0, sizeof(cs35l56->asp_tx_input));
+
 	cs35l56->dsp.part = kasprintf(GFP_KERNEL, "cs35l%02x", cs35l56->base.type);
 	if (!cs35l56->dsp.part)
 		return -ENOMEM;
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index b46f410f0e09..020bee21c806 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -49,6 +49,7 @@ struct cs35l56_private {
 	int speaker_id;
 	u32 rx_mask;
 	u32 tx_mask;
+	u8 asp_tx_input[4];
 	u8 asp_slot_width;
 	u8 asp_slot_count;
 	bool tdm_mode;
-- 
2.47.3

