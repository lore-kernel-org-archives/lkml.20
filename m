Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794310962;
	b=pzO8rI4sZ31Sp+5IlFjLN78KxBT0yyeHMwAYtLdN8/JRE7A+33srRgiN+Sy8KpbcAGXJ
	 bLAW1DOxDoDCQlbkNjdLNYWAGBxk13lF3bNm5AE/jdsZJaNlSNJ79RpNppwWhefBjKCRO
	 ROUbuMJy79+Qf3hu/k0v4kbXhTkaOvptyd2WWDMh7mnwmNtN/T4B84ZfSH9M0kaVlcoOR
	 e7sjwv3BCHsithU8bT9rFcdZvL4R4HR+mRxXJcQLiyLkpTehHBrT4TfyaRb8uuBWFQVRJ
	 6SE8U1hiiGqruvJZT+Aq/bRos7q5yLvkbv8cPrKGZPnRQqZdkXYSwOLr7p4C8G0YKuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310962;
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
	bh=4C0B4C2KQxAZoFTWS67NxOcov5JZ2wsLiirWC9od6gk=;
	b=Bw0aCIOTkxF7U4iydhN5/aDoYKoQtW69mFMhWxtA//udYSukZaJry6DYlWFSiOLz3fmd
	 MBSJ+c6cYMAD5eJTk7PjKL+6C9EXdnNnyN1hqE1Xl39dEQRrgprW6Bg/plqJx0cOD3zgl
	 X63DbQseAO+TDmHAxq6PWE2nSDYS5SUGeyAuC+/5NW4S4vLIIncyf4DIX40Cvy6x7Cm/v
	 9JOC0BWnPyC9svF7wseK6hWhXzk0ZBmO2Izr7A/OTmnJvzUvd49SETlX0fdw1GJqwWzhJ
	 gbv9ucLG+vNHm2s8M/MoL1JBVIced0L3ve76jMDLiXHHr/g3bphA4Oik9jTRIXMQP9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=VGiH2OIg;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=x9ZOoLJQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC73606A31C;
	Tue, 10 Nov 2026 11:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FC73606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=VGiH2OIg;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=x9ZOoLJQ
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABOskU1154283;
	Tue, 10 Nov 2026 05:42:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=4C0B4C2KQxAZoFTWS67NxOcov5JZ2wsLiirWC9od6gk=; b=
	VGiH2OIgl+GZjtS5gF8Vsm7ZfpHiCaCwM1Gd4GjTJ4BK2jSoPzFkWHr+J6mM+ls6
	4Qp/zPCJlNVmpCb3UGJweg0sP3iUw6lc4D8uDIJ/XboQhAzqXH8X855i5FnNz/0v
	7q78Z2ORmfhzoBwHQEmjinFo3Lx3DlUlBL7JuvvIg04r4GKI4o16vjzslJgt7HiJ
	L599SWU6lrVWa6+UXqUrT1F1l4r3J3rS4g2YfskLerz/1te+rVRWBWC6Klgx+4Oe
	sgSi5SWmBQdot34Kzo6yRKLQF5ezn5EPLYUDiX3mwnOf6F99by9HnlIKEd86zxX3
	N673mOA5W0R4XxkZV8nanA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020117.outbound.protection.outlook.com [52.101.61.117])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ht19pbqdn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 05:42:19 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mujm37gybXaWU7LTNEHWejEKGphPYYyDpNcxBOn1tc1dUkkd6hH7XG3AzdgivmYleu7wOVRMKGETyOval63APnBrzjpF6UPmm7ycMygilnMN4UsjqEsn+tLL730g7h+ZsweyelKhNiBOVgYfru8cTClKdxvH5wmOtmmqZJqe7MfiDcngleWmkyTAZ0wqJp40773pias8+dcGboGD9yMUfnkAQ/XUjn1bcjqawDADyrcW7Ryj2V3VXVaAmgX+7h1BymcPOhTnbSjK5cOGPUwDixfYjSNvvoN8Ap+PkGci54Yfc+PT6ifU6zqstqCyDakipD4IOPxdBfuL3Rk4nAyJmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4C0B4C2KQxAZoFTWS67NxOcov5JZ2wsLiirWC9od6gk=;
 b=PRHPGeh/3PHYOCQHp1f581u7HJAcKfGE17FywbKsvSabrf1lWeSHWkWyNfYodhC7kXJDdhNHfVHcnPZBQz7wG2myDVp1Zw8b0KDu4Uc+JPOErbzXW+iZsd6yo/b2hehcB14jiqxPfSe6wyx9Z2Z+zDlY7Zf9mQgoxtw9imeAlAhHJZXis3qYM4E+fJQO9qQSyqMqG6dNSJuQh7I5aTe21ky/5wvGD9s7Rg4Dp1X2XB63zjXIYcm1/kXZdT1GWfc5QDTiKeaQCPKuCBzFpVcwc9V8elZ8rCHACazKBozfQpkTBbluEuZeVgRrgmbFxEj/4Si8zSMSouc0BIV1AFuATQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4C0B4C2KQxAZoFTWS67NxOcov5JZ2wsLiirWC9od6gk=;
 b=x9ZOoLJQCboVqERKkl7I6v4XWx3phEhCWAwdWQJO0xmHQy53GM9uyCFoDR6xl5AII3G/eFl9OU0deQ6CuP8/xDmCFnQsgU6a6pJBQ5900O/SpcmeBYJALgntr3WVmo8BzQv/Al75J7Y4Cl0bP3ooUMGGMd7DDC4n/SUvNGVqtus=
Received: from BN9P221CA0019.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::34)
 by SJ0PR19MB6655.namprd19.prod.outlook.com (2603:10b6:a03:44b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 11:38:48 +0000
Received: from BN3PEPF00022BD7.namprd03.prod.outlook.com
 (2603:10b6:408:10a:cafe::3a) by BN9P221CA0019.outlook.office365.com
 (2603:10b6:408:10a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 10
 Nov 2026 11:38:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF00022BD7.mail.protection.outlook.com (10.167.248.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 10 Nov 2026 11:38:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F2B31406645;
	Tue, 10 Nov 2026 11:38:45 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D88AA822561;
	Tue, 10 Nov 2026 11:38:45 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 2/2] soundwire: Assume default maximum valid channel if not specified
Date: Tue, 10 Nov 2026 11:38:42 +0000
Message-ID: <20261110113842.347883-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110113842.347883-1-ckeepax@opensource.cirrus.com>
References: <20261110113842.347883-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD7:EE_|SJ0PR19MB6655:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a420481e-f06d-4d7e-c294-08df3f1f2f15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|82310400026|23010399003|376014|11063799006|56012099006|16102099003|22082099003|18002099003|10067099003|261102123227099003|261021123027099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	TZsaKfPFUBew0ufKfMMwg16cORINCO6WyjZlPmLt8ZYScyMGgzaEjDXblzFZmQV1Q/+ZBLA8/nmC45o0JwRQQQlhXd0pULhxwszpr6FKlqTRrRVCniQVM53wueREhbK4b3LMAeQDWzvZ5+o6K3lkZn9T3FiqndN9mlwhxLe3rTW6a11tUHrHT6Dug5NKzKDC38ZlJ7KtIKJjijUkih58xXGL73ZMmJTCD0HBoh0XhXO4G16vN5EFJNy26K6mptRSmcUia7SxQwaw8+hZ2pnrJsVzB7mYbpSKmwLWrvz/59cpCf0G1+UFRwklvEQ5/Tro1TxwQVti5XFWoWAZoINa0LEb8cNpcIKBjk7O+TpEymrQFv1TQBZV5rsEVrIJ4hD+6U9kumYdMZHPmFs3LVWoUXG7Y4CMKUoZ8JSqqZfg0ogoBuQ9HtJK6KMRN1sBQpowoNOGiYwwU3ismMrsir7JP956i2MbLZFov1DZULov26wmnp6m+eqHqozGXiFiHKKxuO4dVucAfNyEoNcRnWDPzNuUrwPUOJmM735IZmbEJb3hbo1rY2zxq9tpTj7Tg3DDwW6wwACkb8JFXW5qnqPEKMRdUMxku2wTM16isdWQcEaMeOhPs+8KZmB9S/yxUxG++Qozz5ANZfgows8WDblrolViexY8Bd5DjEOarbsiSRBcZ2M8jHo1/ovJtm2mNAKM1V4J0rGVdNz5xp+XbQ2HLg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(82310400026)(23010399003)(376014)(11063799006)(56012099006)(16102099003)(22082099003)(18002099003)(10067099003)(261102123227099003)(261021123027099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4hT7hzPFUAJgHQO/1LvX3QjX2XDUPYAAPaiS8M99ixKYuxoKD0Vn05jLR6kzyVcY3xlhZjdUF0j5x/muHk306cTKzA7CmsrIcpprg6g9GH4OYyotNdCd6inYN1Muo+NO09fTW9Kwb2t1YPefdHn+k9LI/FApaATuN9q3sMVscSAijCX6W+kZRAusWasYKNa4adEZBT3pfQJYqgL7Iee85EyG26P1aHCp4EeXQA6VzL0FkL7jzwq1ItecF8k6wLlYSlpDa5eztfXP8EVw4BmIFC8EFNsL8BdnhljgAV0Vco6wa0j134eAN1BjB7CmGu7K1Ap5/Ddl035kLsTZLUGQyr1zCcomHN2zvg2ko623mlwuswCbeqiz3Eaa0OdsL4A8kPGMJQnEc1w4Y2Qd+YIpmm/c25VxsycCK0rCP+/aYshkb9PN6s6jQQJzYpGtX6LU
X-Exchange-RoutingPolicyChecked:
	U4LturB62Z0zuiTys+FslNFA17POLNVrya0M/4SRfVdmL6bd40/CMOTEFxX9dBfo/bSp3YJt+7vFzpWNv4Q5e3Z4hfQvuumeOu0U60zcFV9PFp8+XTUQo558e4qPW5ieiDe4N/i9JdpquOjFfzUQrQ4bUmhrQim5J2F/o2rVMJZBLvit5wgd6cz3RkQA5ivQMAY12HBF/QR3IiXiCTo5ZhgHXFiSNsL60R0CM28NHK7PEwN5trLxl2wkv2ksbnDhScI66oiH94f72QHcpDguyYxYHxAlDd50K0vXiAPr/RFvS4hL9gCy7h5pVt1Bw2C77ogBo+L3flCmskfP+8Bxqg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 11:38:47.4261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a420481e-f06d-4d7e-c294-08df3f1f2f15
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF00022BD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB6655
X-Proofpoint-GUID: THPHUgF-dTGUcHWEBfj8CHFqRsbkFRef
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NiBTYWx0ZWRfX0a/bm00bWY2u
 FS/eN5yeE1itwdwdBg8ogiG5WOf6S4QyXTBOi/LKxKxEAtmypKoYpWdVZGXaq8BHWFEYhB3aWi0
 ukacsiIxDtPu37+a26wkl/etf/3XfLU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NiBTYWx0ZWRfX0oYBOZbDiO0m
 /WS1aQk0QZWr02yp9eyxeHi9SoH40eTLQsePh/JLp2h1KnFJiprEmBfXARB6MU2VsPtcfwmJsML
 ngV7imXqkyBH2uZXSm9sWTMdjsgIIvW/Unf5xO7k1G8Xw4+ORtbkOgQYaJEq+jPT8ZZJ1onQ4Ut
 +aguyDiANGZvjLzWNyJIdzOuisuORcd6ccZKlmPul4Gups2jv9XAEWEGlC7mHwgiilJhUy34+Gf
 VlSEGFYa1ZcBZPgqILY25/fG08JgPZpQa3gqYcmf98BayMEYOeLtpT6TuQqJwA/UrBgSEVRevu1
 I8qta/3dWWDOiLXdX6I6u7fJ7Iy6gaF0Mp2r2RAl0nlkCofhdIzvEOOSF1p3+biJLhiby48nPmw
 8kTskL7Rx9JeEcGsy84PJoSJtPtUyQ0P2NppQcpL1k83QPy/9tR+Ylhfz60Pl9Sk7p2j03t0tAB
 v08dYPJmht7zKFl4xWQ==
X-Proofpoint-ORIG-GUID: THPHUgF-dTGUcHWEBfj8CHFqRsbkFRef
X-Authority-Analysis: v=2.4 cv=NK5AaE6g c=1 sm=1 tr=0 ts=6af3031b cx=c_pps
 a=zbd7yB0EajPYIcOkJMaukQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=PMFnPxJB3WFXUYLKLW4A:9
X-Proofpoint-Spam-Reason: safe

The SoundWire/DisCo specification defines all the supported channel
properties as optional and states that in the case none are specified
defaults of min_ch=0 and max_ch=7 should be used. If both properties
are not present in the DisCo the current code results in min_ch=0
and max_ch=0. As min_ch and max_ch are both channel indexes, users
can't discern if they should interpret this as the default case
(1-8 channels supported) or the DisCo specified a single valid
channel of 0 (1 channel supported).

In the case there are no valid supported channel properties populate
max_ch with 7 as the specification suggests, to avoid the ambiguity.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 drivers/soundwire/mipi_disco.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/mipi_disco.c b/drivers/soundwire/mipi_disco.c
index 259ad98b5b7a9..eadbda55f377f 100644
--- a/drivers/soundwire/mipi_disco.c
+++ b/drivers/soundwire/mipi_disco.c
@@ -284,12 +284,6 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 				"mipi-sdw-imp-def-dpn-interrupts-supported",
 				&dpn[i].imp_def_interrupts);
 
-		fwnode_property_read_u32(node, "mipi-sdw-min-channel-number",
-					 &dpn[i].min_ch);
-
-		fwnode_property_read_u32(node, "mipi-sdw-max-channel-number",
-					 &dpn[i].max_ch);
-
 		nval = fwnode_property_count_u32(node, "mipi-sdw-channel-number-list");
 		if (nval > 0) {
 			dpn[i].num_channels = nval;
@@ -309,6 +303,14 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 				return ret;
 		}
 
+		fwnode_property_read_u32(node, "mipi-sdw-min-channel-number",
+					 &dpn[i].min_ch);
+
+		ret = fwnode_property_read_u32(node, "mipi-sdw-max-channel-number",
+					       &dpn[i].max_ch);
+		if (ret && !dpn[i].num_channels)
+			dpn[i].max_ch = 7;
+
 		nval = fwnode_property_count_u32(node, "mipi-sdw-channel-combination-list");
 		if (nval > 0) {
 			dpn[i].num_ch_combinations = nval;
-- 
2.47.3

