Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B75548EBEA;
	Thu, 17 Sep 2026 10:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789641288; cv=fail; b=mSIwnVbwj0hAAja2rSANrpEuNeV7UudKh3qbceRBHlMzBQgZIXroQkV9cYiXIXt+RAWD+4hUswobGKhEVz8CZ8xM7Y9uffsiTli9RJGzFwXgKpQ8e7UjRGWoXRP8O4h1oszGlfFr8ObB7zNMmDF7qyepX7AFsI+xDN7F5MiiSeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789641288; c=relaxed/simple;
	bh=KL038tSbdjYv9ZPHEH2UUPDfs51canBmBPZ5gVGrq78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RuxYaEwCwodZ46oQot3FuMe8SEJmRb5Iik8iJNQAZE9aM3KBtDiMKe+RMIH+xFkyrNS4NCTfDWmg6qx3jVh/vvurncaE1bSWZD9VaKH+m0F8ow4he2ThG2E3TXBAuTszCLKf99+TvLch9VRgvaUn+m5OPj4qura0tb05umrHAqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=CB+L6J2y; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=qyrfD46a; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="CB+L6J2y";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="qyrfD46a"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H6FRj83579972;
	Thu, 17 Sep 2026 05:34:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=MscOEVNJ7JDpDhAM/MCsQa/pJGeqQW+MeNtniEAv+6c=; b=
	CB+L6J2yOfnqsZkowpZQPb62c3sxiy08pU5pWY4oYYu8gzo60ekSpc3Zq9sHW398
	lueh5ldb/APHFcmyNbCYvZ1slcQTXEhswO8iXzd4dzsOAkx2kNvFAPLGmFdBSA9q
	He+z/bhAvOI17rwNfmi5evJabkWmC38/RWEb+p7qz3LrYyontDbXllum/9UjDMXU
	YlgilTMuDwKEAszTtrGV3PUBwbhg0/oJ3HkrakkVGHOY/ekMMuVxi7x+FbydSOpY
	qXf2dtaXAcLIWIdKDA7Rd+eLVPTs5srn61wcCLIiG9ZW7FVRL0tEBtrX/IknEfS2
	qG79Wt+zpeQ9SiCHyHmG4g==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023122.outbound.protection.outlook.com [40.107.201.122])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gn35henge-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 05:34:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YamaF30cDq5khFltDOwvQ/tyqME9hFLNcYKC+4kWZElB0533J6flj0SSQJ6giEM03pRl81ABsx7bn4ukKYYlH608L9J3VOtk9927bs0cJfIR2UCPVmnxp48Yl5WdjDP7JeYctLnEyd7/9IjrpLE8K2r7zzhXTsYkx0l2BKLaJBRGOYkpg2oWlSQr4AlWAWMEuucyGV/ZyfLRyBZivu8LR8GdCrpyIn98ztKIXqp0vxIXieHQixkwzbIa1ZLPf0pq7jZhib6iTqK25Fvf9gy5Xr17Q1kVDscDiaIH4MFGgr9fZJt9NPFupeCyqrQpX0yNYXJgTDZ4lwajOQMURvBrog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MscOEVNJ7JDpDhAM/MCsQa/pJGeqQW+MeNtniEAv+6c=;
 b=RcU5X/+bd4Cinfzw719iPnadcnyrAPuVzAmuOHhbl5z/Xeq/zQf72UmydetZEtWfzgwRAP9NRbsc0CSN5RGBfjEn/TZy/fslSD8fipP3ro4npZDh+244npo5x828xrtEGjD/XUrGPgqPzh59pM/f1U+NRsaxcMkTPpO712vSMRGC3BagT84iwZTvqdfOJPeyk5wsIZ+5ZaDZs6fV4Cc+yTo/AIBMXLbxhbiRTermHDq4HGfX6v698pCJSIMV2r9rK6SHCLKt02esE8VrbUXcIGrotBNydEvKEBS3fCnl2eDCkR1AoU6y0t6Hy/qLiDYGK00qJqjdB+KMUVXmMDLHXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MscOEVNJ7JDpDhAM/MCsQa/pJGeqQW+MeNtniEAv+6c=;
 b=qyrfD46aHnZSMWqcHc5LKp5GDA36lP84cglO5rbhFpV9+iNDwE7R4d2bM7SRjKtirGClWBnclHXFLHXJ6z1EUlCmoUrMESB0hHbODdvG2a0khsH2ymbwHcyR2pAAYaa6KAC0vGwb/E2GIBreGRFzlpcI5883peuh8sOKZFiw+H0=
Received: from DS3P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:45f::12) by
 DM3PPF4F5DEDFA4.namprd19.prod.outlook.com (2603:10b6:f:fc00::720) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Thu, 17 Sep
 2026 10:34:26 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:8:45f:cafe::6a) by DS3P220CA0006.outlook.office365.com
 (2603:10b6:8:45f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.12 via Frontend Transport; Thu,
 17 Sep 2026 10:34:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8 via
 Frontend Transport; Thu, 17 Sep 2026 10:34:25 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F3F46406543;
	Thu, 17 Sep 2026 10:34:23 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.251.35])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EB9BE820247;
	Thu, 17 Sep 2026 10:34:23 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH 2/2] ASoC: SDCA: Check return value on a missing FDL_Set_Index Range
Date: Thu, 17 Sep 2026 11:34:00 +0100
Message-ID: <20260917103400.2032913-2-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917103400.2032913-1-mstrozek@opensource.cirrus.com>
References: <20260917103400.2032913-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|DM3PPF4F5DEDFA4:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8c2cb19c-cc97-4653-166e-08df14a73ed4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|23010399003|36860700016|6133799003|16102099003|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	CkFUqsTnVFH1VYqPAIaLjo0gPIuQUOLO3kM8Mn6+2fzY9tJLLgQhvi94nCpEHkhDFdi6aim4oeqw+jNMi1Rxv5Eu+3aI94/aYWXGIYPREIrWIb7yKXqbyuYSYnMHwttwgjTR8Wlibi+n4PIzqkuoWE17F4X0wzx107MPf9faxPprKYooJ5DsA3j9fHXhu/iobCIIsUJmc68qLsuD64bl2WeQMZfD4DnL1kzbhiGDPSNI0QolvjD5z+4sJpz8em45Ttzy4g2E8ZLyUWAd9AJUoGgL/6h/5CF1tm58SUSPSBJWYaNpBB5z9sCWqGEk6fRjuWCu/rAo29NrRS8h/0EcDlkyARlBjH+OnIsT9XhH0hlIVxkdudm8c4gD6GU0Z3CU5sSqZ9+Xt/sfXqjhXhqvQRy6wab24goZxdQzs8mndhKmp5HpGGwQk4r/Itv6R0n0ggk3yF3X+UkyunwtyCce5owfizwgrIU2WtFK3laTfEY+vqFUqoz6xLyUY0m2PMwnt/3gX7XNhqjosdplp16vN5Fn07GESVdK+AOWjTTJGEoO4jglX3pIr0FoGCbKv+ICadFhMPcngqZ7cjmvXiZHNzFHaXCDxh6Pl2UpUhjjMpmqBPW+DmKvpONydCAdGDXjC1tTXINFBDjIkCDUmh7xFAVcspJVY2m1asXjSZp0kjOre6Z2JVroS53rtiPE9CazrLruqAIdvEEUG9l6ORFI9g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(23010399003)(36860700016)(6133799003)(16102099003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UZ5soqNKMPVWZzmAnuJktMutDS8FPbIhTMHhmX4T1Rk0gLqpnusZE4dHWT7LdYrQtPJ5yeg8KBLfz3NA+67/S4ok7q81P1Rgc9FPP2qUEcJVsePo1dCBoXwYHZou1oAqrY/8nhWhwo9iDp0r9ioOOs2pXEnw3qgdE+GbAj8r2sdkX42oJ3aWsdTISr8fJkNyIJsV64I/cunBHCp/zpJGhckm5ZHU6X8ZWR9whSR1/k85jBD87xSzL/x3Ctjl09A77c/6hvz71drUqiCZFaRkMiREbI1/1XcMzdAOlqXlNKc7Q5iPxxUBqaM8JSil4jxOXnFTtRwuMlBUDJstqbUO/IbXj+KMNwW7s6l3Som3WFUpHTRlPZw9S/IUDHTOohN6EPljFdYjrDtFgQnruvO5kJhFJSCau8BXHiHljkI6/DyFj9MlVMQy3QXSk7fIkj9p
X-Exchange-RoutingPolicyChecked:
	s6hFcw9uOLhFzeYF82z4AoAJvG1O1xMrVfU6QxCggVcxRpJmL66yQrlGkRSlYPT54QacsAqzWFfDc1HUFGLJR2gVrGhyJuHI93YXAkgY51vzzCmAHrRfmt+zFR9I6yAlLgYKPYbydfYZCDG2l6F0rm6sGOpWkRhB4/gPTU9HiNJ1IP4XhyoJVQaLsYOKuVdrilY+Zpc9aek10lwF1H5jFdaKPHleJZQq/rqYG6cVTA3jxxwbd/uIXC64srxJH+cTH1vyQ9kFod+PbJmWhxo+8Qlv6HhKvkQUm1xzsx5mV3hhFPoX4fgHeFki6PzrNLKsyHb6cq0elJKl8V88dowV8w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 10:34:25.3471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c2cb19c-cc97-4653-166e-08df14a73ed4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF4F5DEDFA4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE0NSBTYWx0ZWRfX7PWVqXC/jY8m
 EGE5Fwj6aeEBHYU2kBvv7lujAxEpxDe2Z+ML3zaz9DxGZwM5LZ0l7PuoUbVXDfzqnDHyAcn0UaF
 iKHlBIGzE1tcvhc4yVDYOucgiJetAFo=
X-Proofpoint-GUID: 7E9KJ6e3Q6B3iLEQ-YJDbUxQClDohl6C
X-Proofpoint-ORIG-GUID: 7E9KJ6e3Q6B3iLEQ-YJDbUxQClDohl6C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE0NSBTYWx0ZWRfX4yXOuzUPNrVn
 VHShGQmT2KXxBSf/oea9Ln6/LqXJGL2g6jF+jgXCXqYTDVSt+O6WsMjuQLvxdKdEchij7+0BCv1
 0+kQsNjZ+hiPl9gS6sgXY43pspn4Wyd4WQ6sNZ4hq9evJbDLjvEICx8SrAt2Q2EwFtZqWXw5WRO
 K1tHlQBPrQb7/tpw91UFMpFd/F2wsImTDs7+txkMBqTVd+HP+LGscUU96S1JUDP1wTolrJGObNs
 WeuUeC0iCNKlwR2vbqONzv0azmGzoLdVbMM5sBXDXYjcuLXeh19R8QS96c0wbfo5DbYyHzMji5t
 2iZWTJ8sFcF21cmVo6dBIYCoTVTDEpf7h5hlGfxZ7JlSm8AoyERvzWZqNW+bB2nw9wkQoe9sALr
 awchqRrfa+Pf3GgdXczthiNjDcGoqIxDmZ2e4xZKDF/IwwZgKvGukoAssyRrEDeIZ3BLpBAGxvv
 UX9ikVEGqjJUdvlQ9rA==
X-Authority-Analysis: v=2.4 cv=It6L47/g c=1 sm=1 tr=0 ts=6aabc236 cx=c_pps
 a=1IaZlVIhgsmdv03QAtF1KQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=sxmFWbAEUWzSpRddSM8A:9 a=0lgtpPvCYYIA:10
X-Proofpoint-Spam-Reason: safe

In case of a missing FDL_Set_Index control the return value can be NULL,
ensure the functions returns before passing it on to range search.

Fixes: 71f7990a34cd ("ASoC: SDCA: Add FDL library for XU entities")
Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_fdl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sdca/sdca_fdl.c b/sound/soc/sdca/sdca_fdl.c
index e08a553e0eab0..7fc809707944d 100644
--- a/sound/soc/sdca/sdca_fdl.c
+++ b/sound/soc/sdca/sdca_fdl.c
@@ -301,6 +301,8 @@ static struct sdca_fdl_set *fdl_get_set(struct sdca_interrupt *interrupt)
 
 	range = sdca_selector_find_range(dev, xu, SDCA_CTL_XU_FDL_SET_INDEX,
 					 SDCA_FDL_SET_INDEX_NCOLS, 0);
+	if (!range)
+		return NULL;
 
 	val = sdca_range_search(range, SDCA_FDL_SET_INDEX_SET_NUMBER,
 				val, SDCA_FDL_SET_INDEX_FILE_SET_ID);
-- 
2.47.3

