Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794417047;
	b=GNuN3Veo7py5eh9MLlw3vkam5VrUak3snTOaDUD02hCQ4MmgBuxU8PUgw5zqfnYeHSiA
	 IxlQLGXg45Dd1tXUTr4hdzpJaOzjxdmlKglJmGCDYANIsXSu+6j4XiyQ/bKkcu+B4Xgl7
	 pTusOdc1rmNB1rKj/V2diM1Llj8wlD0UKXfrYhlY+L7UwpPZpvVzrkJ353LtXP1dunfjy
	 YJsCmgPI4woL+1D8gc7dM2LP0W9l4STnWQ8R0W/n40A4IQ6jKbXapmPGoJqdPVQGjLNPm
	 Kw5Zp+gPHAyeX+4rf91s3ZI93DAAh/ELe1glXIwWp7IrINicnwBygcklr64FtKtlF/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417047;
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
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Reason;
	bh=+tM4hy62gguqZVZdGEnhv+YJHahol6lFngzkhW0EDQ0=;
	b=zG0Hb+M9Bp07Ygwt1UtvPmD5cQjcMvu6S6B8NQ0ae66uC0P4WKLZjoYUnUi1H+ArE1mI
	 UOwIanfoLyiFJG4fpuNGF7C0KNUFeqQ5bHqLzrtgGq7Uzz0DOmELfjbm2sUwCGIjBhuRg
	 vTKxOkM+nJ7SiVs29U4xx+WlZUSASsqePVE4YR769GjvtjBiy25+DbAHrCWZIPyFFxE9U
	 UD4bP9bllFuueX7RodGW5/EfSgLpGuNKMyVsT+sxEqSiC3LQfdKybu7yYh/vFd48y/huA
	 pf3VilKOjy27Cy2ZMmjjwao39vwhLfXRrJKBIaBQn0VL+0g+1emisRY1pMD2rcVDwAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=TBD10lga;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=L4iPflvZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7246606A31C;
	Wed, 11 Nov 2026 17:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7246606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=TBD10lga;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=L4iPflvZ
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABGZIjj3202380;
	Wed, 11 Nov 2026 11:10:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=+tM4hy62gguqZVZdGEnhv+YJHahol6lFngzkhW0EDQ0=; b=
	TBD10lgaH/DuGch+fQrbrgkXXP8ToE7ase5SNyYkuQvruWxb3BYOThk0/7IRDhVO
	WEnO1IlB/lGPfeM978zguZi4CmBs3vz2MOVSQiTSN99h2G7hXIw+nkGWOLs+ivvx
	RHDqD8WL5ncPvRoad7mLOhmk3nQyrcGnE2VkBVOHrabMS8hB5YpIFIeuso9OmJNn
	fRZXHmASy6UXZr3Qzm2D0f42ASVW2pA3xisBdbCAI8A21EVpgJkx9Ac6+11gx1et
	R5WQYOuF0LIbUNEEQj7C0WodTcOP1B6EU6fZZdXIIP0Q/JDId1HNiOgTRWDr4Cw4
	pRJO6akf9i1PyZmx8r2nJw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021100.outbound.protection.outlook.com [40.107.208.100])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hv7rf9pf1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 11:10:43 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p060xu8Dv+T4dMu0ZRT9RoX7o/U62Bvfbag6pTF8E6BTbjOhSX5PO4U58QVVkEhFRBnFyKFkB11/7yp4iK5sGFIEyDFC19jmxdJtuDoOOx4dHuqv/Sf7WA9TX4AK+3sqZr8Vqfu5zqAz0dXny7tffzQc7lnPgCZZRvPwnZoZVkXGSREh53H+7GVtAaPxBrk8zbLix8vSJJyVetfi9MEcwYHo1TQyVW0rSSVBW4MC3xdueF8aoVRgGvwRdSBlkQqi0BJiSlibqavXcFGdnBDkfct9ekvtyeUPUyDaTb06IitbWopSgmnCedwH0vYsuOAMDRrKMtjSKFLyM3uoVP6OZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tM4hy62gguqZVZdGEnhv+YJHahol6lFngzkhW0EDQ0=;
 b=eUzq29940QGhjfLW+r5hR6FeZEsFBG+YZwda4V2TGYjw/Sm9fGVpDSl5uyW/s2/4Oo0Vhn6V2LqozX0og2m4C7k8Xg0afsnuvUQQ4XXXBan43zdf+LeVZ7/fsZhrAG8JS1vb8JTAZ869GGKP6IqaOLo6B3XJBrklMBsdZDlA3Ytc4jOlKg4r4Wl5rH0iGeMEcs4XCJPxCCqXWA1Qz2pv8m7HcbRdw3vbB4G+OtIBu41X20duZ03+8zzINMAWTKtL8jeFYkJC+wrTr+fS7srveCJ6FPSIop/sH+AlU97AZCmOsXgP2/BAe3h+3/wKNqQftpLe/+FeO6J9meMmB+6VnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tM4hy62gguqZVZdGEnhv+YJHahol6lFngzkhW0EDQ0=;
 b=L4iPflvZWuMjmYRprTDpkhyT6oDJzqbgvS3jfh27PfzSiPvwA5oina86l6WCv4UyE8xrruJcd8cJbj031S0hfkQ7b7efu5JAsH0SDeCXI0rwvFb99NODxHc/0tU2FylXcKQMB2qTEjFdgL9hsxlcH/6xyVHm2hxjZWZFQUmcveQ=
Received: from DS7PR03CA0171.namprd03.prod.outlook.com (2603:10b6:5:3b2::26)
 by DSVPR19MB026672.namprd19.prod.outlook.com (2603:10b6:8:37b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 17:10:39 +0000
Received: from PH2PEPF00048919.namprd05.prod.outlook.com
 (2603:10b6:5:3b2:cafe::67) by DS7PR03CA0171.outlook.office365.com
 (2603:10b6:5:3b2::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 17:10:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 PH2PEPF00048919.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 17:10:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 325C640655D;
	Wed, 11 Nov 2026 17:10:36 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1929A822540;
	Wed, 11 Nov 2026 17:10:36 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        patches@opensource.cirrus.com
Subject: [PATCH 1/2] mfd: cs42l43: Add load detection register needed for cs42l43b
Date: Wed, 11 Nov 2026 17:10:31 +0000
Message-ID: <20261111171032.1491717-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111171032.1491717-1-ckeepax@opensource.cirrus.com>
References: <20261111171032.1491717-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: PH2PEPF00048919:EE_|DSVPR19MB026672:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ba37be14-6b1e-4661-8e7c-08df4016b4d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|376014|36860700016|82310400026|10067099003|261009223027099003|261102123227099003|261022075727099003|261021121427099003|11063799006|56012099006|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	UfGeQELgSQiqQsNU9F9CP5QeiNVKOOEZbGYPZo1z/8hGj9rFGZ/n1+u1au8z/wQ7mEw/lj/0k/bDxxnDstmsKxKzc58yltrGKzDWNCKupPspgg2ONpFkzslXdQyaINftY8oHjvs368gKevozQV00oul7zAotZpZ8yZGUjHbB1u9FvLqLS+JbVA12JcUbtBf93vHa0Ntk59OuWYFZdahkKu0LBeN66AJQdvA4xWVKfLdK4anGLku2m/qHkjLSghh8/PlafspenLL8C44PBXwue7xLIUhjb1MdsqptWDYTspO3gMJ++JHutGTX938f+jgy7dKMWXAEvI+eP62xSxA/43067bt5ZcWdjKuT4TAzaSSOnncQuyo6UZVE8xQUMd20elDbTmGFiv9FdhnojTdtQx1DqgDhGTGah6YmfwV5X/2XFvHUJGzjlEMHrIIJlutigX+SvG1jqAEHAiUDRHztHGZXYWzFq/T5iwFBNZ6lu0+deWexteMoVnADbOlCDW/q98/tfOnm/n9AopLe8eifuJpMLI2ztr94tknuNA/DJR4QxO6aAd2ZmKybx7/PhEEtJpopNon+1YXb++M+PVtSidz50WrT/3n1qD2OUpRk048z29rKwZiI/yf51x60AuAr1NFlICQS3G3XKoxw05OfLDSn7OxIys2QV+SN1u/uD7LxWohXBjdMZquc7MY0obK5u4A4dBldjRrQ9Ct1D6YklQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(376014)(36860700016)(82310400026)(10067099003)(261009223027099003)(261102123227099003)(261022075727099003)(261021121427099003)(11063799006)(56012099006)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ooaj+BmOf9HEjm6anbvNGXGjUDHKgppY9nPQ0YRgpAIVPCehPCw4BlRjAQi3moehcJ1ql6GnmQUVaFfwAG085p9HsrfgLrIIzdKAHBqZuCxThj/amfbgG4X9pWhI2V7+2joFcpdjd1VM/WvwaBURUiqDF2O+FId/5iGVxRA//u4BOPjrn688DExKYoKpxkMlMarYFPkdCbQ75IlyjQvzN0OAwkctQHwhJwLZO1nsoSua7wtpcSRijudGKEoMYzZOROufbg697SNLDy20VTjhOO95OUsVSbQWQAzh9octaisNEugWdOkzyFtcPZ5mKC45CBfGbVMtn7l0FFmD3JiwheY3amfYsXSPoqPngj7I2byge0ZFwSPufXYgyX06PA9/mxZXYoeH0Q5s6U/LdPey6c2+LkP2LaZCNZh4wMqFWKqSZyQxjYlSM63A1/n6ltyj
X-Exchange-RoutingPolicyChecked:
	n5/JABx0CH+lXrvZBQbGH7Gd2E6Xmk/e5VqZfmOZhb4y44b3LPSK/bNxgLkK7Dsth7mkwAC2G/kPuL8BDFroLOgbTmLjFHRDuRUs9ueWor5Ck7h7JfdlqL51dbzPcpkT0IqN2PKFI5MgMsqA3nV0L0giRe11ZMohKQOVL2PimRjtY7MfCNlxo/naN0Fnh0pm4/pr+3gjue7ozMNF7h906QfJyC0v+PwU4h8nk7adTa3RnK87x9K3V0V/VNrmdEC5MLCTa4ELThb5X5X//rh9DVCRjENgy3KfqtGxYXdYYlmocNfDEp4VYjG6ppolR0FoJdGRoR8gle5Hi0VnGNxL7g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 17:10:37.4268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba37be14-6b1e-4661-8e7c-08df4016b4d6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-PH2PEPF00048919.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR19MB026672
X-Proofpoint-GUID: 5pOoiwqn9KEuQyNiXOdM8ytS6wqXzJnx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2OCBTYWx0ZWRfXzkRROBtq7v1S
 +kvW2rCQOSQX2ortUAPqlq0ryEleNgK6UCbxJmtJdRhpKJ0LJwhzW1LpN3QjFHZOJ8odY+l9bK1
 aRPe4mVGrvg6TQEsbEOjBLdnEKFGn4o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2OCBTYWx0ZWRfX+CPkfFazaT/r
 zYIsPZE9JeRBb25YubGuwZzgkq1KxbPrF6pmIoFHaYxJAHTUyRAfilFdLX5HGV76iac+3YVDhgK
 Aajr2N6bddEb8iybV2jaZi2wvf/t+oTXPbYute4xw+B2xeq6k8Lcy2O5cRAmrbf/oQAG+iX5GL4
 kEIXHfNArJgvIzCg++7Qf8Ke76LJILjxdB8C4Pa7K8N2kTW223Cj5XWN64vSiUZ+1d9Sj/PEmyD
 gFX8cgqQFt4By7mjxTdt8p/YhR77Sza8+4dLmKN+K7lf4QEKeDi/Qcadi+zF5PEDVb1yB2WWgPF
 H4z9eOBUujH87f2+HsGBSHBZwgChTRV+Map7cx0kAhyczcGcZtJNLUzXHrlT9rclCAuui5nzZKU
 fqMk8H+dwvPpHK7frBe7J0bPm32SRcYEP03fHRVQTMMta6fJ/7H6EN/6ZZHaVBqw4+a/1syi47v
 jYKP9qGunqWGwm72ZDA==
X-Authority-Analysis: v=2.4 cv=I6Hw19gg c=1 sm=1 tr=0 ts=6af4a193 cx=c_pps
 a=EgTKCgcPzLllfVGnvYq9fA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22 a=w1d2syhTAAAA:8
 a=9NuBHnHTQZfeG6L_SOUA:9
X-Proofpoint-ORIG-GUID: 5pOoiwqn9KEuQyNiXOdM8ytS6wqXzJnx
X-Proofpoint-Spam-Reason: safe

The headphone load detection procedure on cs42l43b is slightly different
and requires a register that wasn't used on previous versions of the
chip. Add that register into the driver.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/mfd/cs42l43.c            | 1 +
 include/linux/mfd/cs42l43-regs.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index a83b62064dae6..4e5d82c355ee3 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -425,6 +425,7 @@ bool cs42l43_precious_register(struct device *dev, unsigned int reg)
 	case CS42L43_RX_DATA:
 	case CS42L43_DECIM_INT ... CS42L43_HPOUT_INT:
 	case CS42L43_MCU_SW_REV ... CS42L43_MCU_RAM_MAX:
+	case CS42L43B_LOAD_DET_SEL:
 		return true;
 	default:
 		return false;
diff --git a/include/linux/mfd/cs42l43-regs.h b/include/linux/mfd/cs42l43-regs.h
index 4c00ceae8b461..924438655c630 100644
--- a/include/linux/mfd/cs42l43-regs.h
+++ b/include/linux/mfd/cs42l43-regs.h
@@ -1204,6 +1204,8 @@
 #define CS42L43B_ISRC2DEC3_INPUT1				0x0000C7A0
 #define CS42L43B_ISRC2DEC4_INPUT1				0x0000C7B0
 
+#define CS42L43B_LOAD_DET_SEL					0x000170E8
+
 #define CS42L43B_FW_MISSION_CTRL_NEED_CONFIGS			0x00117E00
 #define CS42L43B_FW_MISSION_CTRL_HAVE_CONFIGS			0x00117E04
 #define CS42L43B_FW_MISSION_CTRL_PATCH_START_ADDR_REG		0x00117E08
-- 
2.47.3

