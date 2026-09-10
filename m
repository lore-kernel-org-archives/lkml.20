Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31F2456E19;
	Thu, 10 Sep 2026 12:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789042257; cv=fail; b=nObkIWeUrAw4n9Yv87JqNPAwDp2+RB0Mb6yrGCxQNJjjZvXLem90FpUoKah381gYMvbuLknvvR5vuX86v/0aDOw8mG6mIWbFLd5BsgO05N5RbTkapl8t/2tiYsD7XJLCjQxOINC9b52+rvlPm/RYPLiWfzLVDaw+uxk/gVE3DqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789042257; c=relaxed/simple;
	bh=Od4k589goQnqlBO3XRXdtWeFLJydK2XGXd3dJwuFt0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AZJdEmAj3/DX1w7yuKhmJWFExQBqIuSVGawoqwcXBJYRLvnDgz8Y+PBp4Ww/EhVMbKmwrUV78TD8pBAEpjCUwKwIsUzqcdUJCxTpkVOy3UloUlEgMK9B/mHn3MI0wc7ZqBp4iYEO3ZyP3XxTWUAWi+E+qj8SXa7ar/zmEori+L4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=E7YWs8Rt; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=PcYBEz80; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="E7YWs8Rt";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="PcYBEz80"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689Iggc73050653;
	Thu, 10 Sep 2026 07:10:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=e5nKZPM8pS3H4Y5Q
	oq7o9B3Ea9KW6eyQKqiKYVNJ5B8=; b=E7YWs8RtaJoHwGhF4/0tVRtoONzx0H3L
	JD/wz4EiSvrVlpp2yq9K/jSI3iuJeriRzTaRjtJmZSYr2hgy8vkJU9ivhWAEAws+
	R+DYRBFzmoisitW6vgBrkzDS9TsM0KXVTWTLe9DnjncvRWimE1xeStkDc8XaRpCg
	Xmi9uwjbVYm4OzKWoe9Jy11hsywKlvDONXj9oglNg7eyCjLayf2UeCG3+6BEtSQk
	5eTYmGTshCKGU6E2e4NXPkjEsNyFoTLvFI7a7Q0DBQpcSwkOju55XUIPEduBPJkN
	Szu6RB2C7Mqj3YZUu9zIKU40a5pluMq9KDWyJeie1dxKUXKX7jEWrg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020103.outbound.protection.outlook.com [52.101.85.103])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gkcyp93ee-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 07:10:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f96EePW1sNmqPK42tFfw5GCmjhEdMNRqf89P3QPGLDWl5SGti5p63AbVLVWcYj/GtGQMyJcLMXV3YXpWwj4tmANvIbqWmlypNpSNn0zxgHLyjZvkWvJVqIJqEj6KpotXQL2Gl1dv/bmk4lS0Intvdl57IBO0FgkT9YrwRYzv4U8jbopBUlg4dRemtUXhEwG4tkVPYeUKXlaNTN6BKoItMS5G8pctVKmv7r1fbnyDtilFu4kxzOXZXuGGi0VpxpuGicRpxpVidOUzmIdlPskTuR5cCukFbjaF1rt6b8ljKLxBRHT41+EXPFFk7wCd/bN4/OA/LAgN3Ng5fDulYti48Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5nKZPM8pS3H4Y5Qoq7o9B3Ea9KW6eyQKqiKYVNJ5B8=;
 b=v3R49ALNq5Ohf8OKt71Swe2dOTA/htH39njMq0Jx5CcMBvX1n5pbuOEtASGzxHx2wD7dWcXYY4B6BgaLgzoGrsJZIX4J5tcMoX/YBdENKEUTw2cp1k2CjMOSXZMRJHJz+aDSngCMcQVdUmV+Jug6y/zl7X1oyNZjf2PHsxN0eV0MvG9PCbLi6bYzel7A5iv6Y4HmaEq1XCc6Rt1u6F3rEzjzV83rNV7Fwj6nXBPh5/0nTjuixTOHaTmEUl7QCd7zoAxGdOEtjSI063Jez/a2BzYFgHk1T6qUWR3B83zdGwVVK+njLjjCB7AYikAVB7tggUu5QpQoIwBQOTeZUBuLIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5nKZPM8pS3H4Y5Qoq7o9B3Ea9KW6eyQKqiKYVNJ5B8=;
 b=PcYBEz80/qswe5exUs7WzTsoAL2kSTi8mKOa9FAw0sAvEpaE8kwN1Eir3iMK2XRYsxBKpDrCfSRhJYF/6blBsNRW0y2loszNLtOrsZIA+bMw8Re37lNtCig2pyWmA3xKNDvNjeUXspkxuKsP67qL/w2CvBi5Q/g2jWgQmd+MzGc=
Received: from SJ0PR13CA0180.namprd13.prod.outlook.com (2603:10b6:a03:2c7::35)
 by PH8PR19MB997659.namprd19.prod.outlook.com (2603:10b6:510:424::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 12:10:50 +0000
Received: from BY1PEPF000264AF.namprd02.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::1) by SJ0PR13CA0180.outlook.office365.com
 (2603:10b6:a03:2c7::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.5 via Frontend Transport; Thu, 10
 Sep 2026 12:10:50 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF000264AF.mail.protection.outlook.com (10.167.242.116) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Thu, 10 Sep 2026 12:10:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 43E6D406559;
	Thu, 10 Sep 2026 12:10:47 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2CBC582026C;
	Thu, 10 Sep 2026 12:10:47 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: wm_adsp: Firmware search progress log should not look like an error
Date: Thu, 10 Sep 2026 13:10:46 +0100
Message-ID: <20260910121047.1592541-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264AF:EE_|PH8PR19MB997659:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 23bdce65-51ca-4263-f763-08df0f348d67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|61400799027|82310400026|10067099003|56012099006|11063799006|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	h8yDjOES5iGQqRX3eaV1Co1qbnYpEyI/1vm4mCOJ5K9f/VSVrA17BWamSUGYA3qJVgdxzEtHZNA2eI0pB0cM1fnRvfBbIAhbxO11AWPPZop11Ugbi74Ze6IMB54abQoInELUzSAimJNyXem0DKoR5V89L5vAwN+gqJvXMmP3gaWLeN5Ct7MZFGpILadtZEmrcCBI767YofCUaAXwuBFQSO+vykzfKLGJ+DcNH1AAaA/JsyitF7PC7+OUPRz8L1YgU+E/WYgTdOr2lAdNfYJN0Xd0odV4pK54035NY1cLTUKk7s2AyaZte/fhB4qnKQhy27NT3oUAn5C6v/k+96j9J4m6xHcKS7/J5qxS5MjWXyfSGba4Hfi49mipZuINJIx0Hgb/E7vR+pP9TOVLNFO3XibS4j6M48e/vyy/Hk2qg6flIC97L9I8lY+cJye3mmjrmIi5DbkvuKbxb1F78305IMGGDeci0FCuqRyS7ntPh12N0+t/mVJ0l6yLSkB+Ms7c6MOqPic8WCZEuXUlzloT4UxBFF+yVEIE1tUiQqSJR/frAxE0wWnOyMNCVga70vvAKAvttbW7/9Itsx+mu9yPYlqFXwVkoAT1sPCzZ4hiHUvWepCd3fUrshlkzBO+kHhZtFPPBB4Xqy8pIZ1fJheepFVJkW340HqjBAXrIlIP5uLkxvjpEpxOhT4vZ9A/rUhG/BaykuulzzoNlFtOxYS8ew==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(61400799027)(82310400026)(10067099003)(56012099006)(11063799006)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	s255IBUFCxNr1r1lCC2wcqD4ji9wQ9AdHiFLBWi+a7uHydh9zXzmSNB/FjP26lkmWy3JnW/x1jBKsfuLfXuKO3Ot8488M6eQO3DDfCeyjGsexSSDszGxzDl/xVyXN+YL/ZsE2eVXLL8E7wLgsu5StLBOLhatHyq/BA6P8YBTg43dqZ2jJt6cv5LSY4HI9YpFtvpBQMPnu9wzxxkPP6EYQ9OJ5bSjKEyuYTAA5Scis1vmFJV+7MhV8rg9ygrUyvtTeuq3w6S4F13hW0aKAeFQoBZ4obxRlQsSEhG/F6yYIjbVAda8tRiWAFSzHr3VD2BjQJlHiAkKMeOp0ERXE3OzBrVPKwEMJUrsB46BI6cdZNAmNbfjomNcZme8lmHms4P8wZIS9M+5OVU0XkW5Qt1/H2vZN5jLgNnJ+lw+R0qAgkAmxIuKP72Ia9Ey7qavu78X
X-Exchange-RoutingPolicyChecked:
	mCkNpA8GHymqTe/8kMHRCIzpmhUYpFW09X+uEU4URtcrvYYd7vj5MPNaVaJVQfi2vAJFRKp7BUf5xRUDS0npreKVYz+c3zjcTzpBqTk4IEuFGSMPBfTmBAmxX89b168yifeI+SrslS1N9cMkWAsQKfVq4oSp7qYeub2DYMz/xCojZArhSCNV3Z8LzC1V/mnn8TZPKr7LUmkY3H97RkFcDj3Q+95Tm1w49PSDRVbDoZzo/i5cOs3+CVRBk2B3CQNOxbeipY2btCfTkraWUNDFPkM5vd0Hn/wloSNd2mAM8r80N3jfF8x1GKZz4sww3CWgjeQ5P+aeAW8rROa5cMJ/9w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 12:10:49.1771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23bdce65-51ca-4263-f763-08df0f348d67
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF000264AF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB997659
X-Authority-Analysis: v=2.4 cv=f9Xdl+yM c=1 sm=1 tr=0 ts=6aa29e4d cx=c_pps
 a=/LfXjj9SJEtuRzurF2V9tA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=tBzL2TjyK1JLrqLo:21 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=chACzCfcUWqPI-Sypl4A:9
X-Proofpoint-ORIG-GUID: jv-toGaN0hd44VrS6AeGJHDL0ElieLSh
X-Proofpoint-GUID: jv-toGaN0hd44VrS6AeGJHDL0ElieLSh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE0NCBTYWx0ZWRfX4B5WApYEIvQn
 yRdkMquDiFDb8k3XRlESCM+AXViJja7SKEf1CjAX8u0wnl65E3XoGL17089VM/v/YiJuHwLui1e
 3ce3wMqOsYjzYBTHdQXyKyKm4d0Q4vejAacbVwvQVvN5gF5a1jtnDFLhRsQMSs4GEUGgFryAqlz
 AG+VBY+xjaa2LrvBhr6ZDD+PBpo6V/tyGUDh9QSr6K4Qk25YR1VufwxjpBRNJr1TgvU+ECN+ArZ
 iCPN8jzUA27Fz49Ksl2DNfE7SqGM5nxoKEzSWovYVeOCO9uh3Y9B+QEM62yk8jdJVmn32uG1L76
 M59bsq8BcFoL7rb5WmOcBoFxk73fFmXl7OplfjINIem2LaNNtcQ7FWd5/0hSOnZ8eAqSlA6fc2Y
 gL/jQrgm0NHNjQn64KA3Vj3LKGQEKrHNxuSEn6qXHqRBOHucshif3GOAmuRrx/FzzlCchOIsdlt
 nD26oBjtyrqF78RVXYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE0NCBTYWx0ZWRfX23DofnziBJpJ
 01NNyLSwzuPlNOtEhW0NcJox8F5XIc93TiKV/GHcLrT3eDQVeIHM6byYIS+Kk86C/ij5PNAmaCH
 H4+kVQK6ytZLap1xdDXmJwOtZsDaklw=
X-Proofpoint-Spam-Reason: safe

In wm_adsp_request_firmware_file() only log the "Failed to request
FILENAME" message when there is a real error (not when the file is
missing). Add a new debug message to log the sequence of filenames tried
during the file search.

People have enabled debug messages, seen the "Failed to request" messages
that are only logging the normal file search sequence, and reported them
as errors.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 90c24c4b318e..b8f3035af3ba 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -775,9 +775,12 @@ static int wm_adsp_request_firmware_file(struct wm_adsp *dsp,
 		s++;
 	}
 
+	adsp_dbg(dsp, "Try '%s'\n", fw->filename);
 	ret = wm_adsp_firmware_request(&fw->firmware, fw->filename, cs_dsp->dev);
 	if (ret < 0) {
-		adsp_dbg(dsp, "Failed to request '%s': %d\n", fw->filename, ret);
+		if (ret != -ENOENT)
+			adsp_dbg(dsp, "Failed to request '%s': %d\n", fw->filename, ret);
+
 		kfree(fw->filename);
 		fw->filename = NULL;
 		if (ret != -ENOENT)
-- 
2.47.3

