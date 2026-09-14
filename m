Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472A944BCA1;
	Mon, 14 Sep 2026 12:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388783; cv=fail; b=iGFKnkUmFbnhUJz4xO+9sLxTjX8Ykxjx/KhYmkjK0qnigcoBLpOZQcY92VWrDIlF8sY9NUktK0nvL01GOMjaLTRGaJCYobJpbuOtSzGGWkhuVeqj0ABsjDULnYKEnSdHwPa/8VA93zOIdbvPcSc6R+0QkFW3UzLzPQc696HsTeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388783; c=relaxed/simple;
	bh=6uYhY2K9gufzHzqXbmZjZlH6VsRhSqUYbVToxSX//cA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iFgyZEQBtyVlkxA53CN/ME85qCXt/Dt7T3CDOCheZb5xcVbJp2W44JCgZLUdspPXvOP8BktNBSZqWm/3DAazoC/YSimF+MJteQUhLmLdWZrTRVwRrBW/yKxCSMwJeUsMI767BvggmqH17mOdUU3nACj4eTUqsayjLxJEc12vs1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qLHuAOPx; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=UtgAQBAu; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="qLHuAOPx";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="UtgAQBAu"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E4CVG4218593;
	Mon, 14 Sep 2026 07:26:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=nIHHMwadeNaGcD1a
	thgdT5JoNIbnnbQp4f8ZQ3mXOJA=; b=qLHuAOPx6d7P19dAO8G5+otti/EVZLro
	LvVHO5LWo7g/s2ijx5+BYKI0BcMTqJMBeJ/tiQxoLgsgq2IyeCb/6XjdL9R49n/g
	3FVIcm4AELmBRUHRpeJr0QjpUFc5q9wOdtGM6YdNf1IZUxR02fJ3VfikCDnHswH/
	5LnFT/7+NC4vbc6hC9BdLvmXw7YXOy0KT4l3feemKRnar/V/AZyE8zwDWIIBo6ZA
	f0R5D9xE6aY/L8D2+v8ynAG8psYwclcBZVJZKiyvPjMtBrJu7CNzaafoziN5wSio
	LDammaVLWidgOlgivCeDf8/mx7K2ZsBTwEGP/UiPLRREKdaDGOr9Cw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020084.outbound.protection.outlook.com [52.101.85.84])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gn35h9u2w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 07:26:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNHd0Q6ZMO0yEmwnGho6EdmrD7X5lHVMSAoM4oRNgW8tQkh3C2mWKAhF9n/tJspQHshZVR3Khcr45zNWdaROv6I/1p9Quya+1xEnNRQvLfSqXb444LfyE8UznzfR+j5Q/ZvRdTcQ49vnTnoXbNQt2CmzpqsZOKWc6hfGP0POZ1khmNcwC6AiISR8cLPY57+Ue8suigMis8bKZMPgelnnt+9vLSLfW//Prw8np0CLJSwUQ2lw/v7AV6r9uk3FDhPbC68u8PWswdqO49Wu2AXPet9LNSem43F7lPQq7J4U8ddtyPoMwhF/e5fgcWRWz/dSveoAWs/wwgygEVCNGK2E7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIHHMwadeNaGcD1athgdT5JoNIbnnbQp4f8ZQ3mXOJA=;
 b=MixuAnAU9TVvH5sfc1sf5l3neVVPN0S7DALZOY0WlDgtztC9E4ArGG7meN2Q3WoOI8Ku9a4rO0Whwj+kD8h6SaLJXzyb+x8oxCTGJESEbGf0lImeH/giFCfhmGlSmU/2W5wHBPdEqItpoLA4vXMH1Arx7NhFG4Q0sGcGIkGKgnwBGSZbgf78Ez/gqr9kWtUrJaJCUGOMgzzCoXXaRUv8Sl3mzWdHhWyfhuqUZg5TO7/cba0dqe31XuGtG0FAUtFKttl+B9yeNe6JISYOV9xJWCdRZE2OTdql9Qk2+lAfcKC0rcTQ2ZopM4zHwK08rueNUxINtKjeSfRq7cpnEC1bZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIHHMwadeNaGcD1athgdT5JoNIbnnbQp4f8ZQ3mXOJA=;
 b=UtgAQBAuH4IYT8rwYfmv1Q8eRY8yD/yaz8uhydi5MMb8/bQC+YsqQVDPYCrZuD7V1bEyS2FQ3ZZ55GA6d4FY/R7ZFz8qXc4Vz9OhcSFpFxWD5z2z5C9efNStX9hVJj6Q7H1ktd3V/869AuOUTRf9Vzm0rsZZ6ldvNW8KqKC43j4=
Received: from BN0PR04CA0041.namprd04.prod.outlook.com (2603:10b6:408:e8::16)
 by BL1PR19MB6011.namprd19.prod.outlook.com (2603:10b6:208:39e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Mon, 14 Sep
 2026 12:26:13 +0000
Received: from BN3PEPF00022BC2.namprd05.prod.outlook.com
 (2603:10b6:408:e8:cafe::86) by BN0PR04CA0041.outlook.office365.com
 (2603:10b6:408:e8::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 12:26:13 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF00022BC2.mail.protection.outlook.com (10.167.248.213) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Mon, 14 Sep 2026 12:26:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 952A940655E;
	Mon, 14 Sep 2026 12:26:11 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 85A4A820244;
	Mon, 14 Sep 2026 12:26:11 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs-amp-lib: Prevent NULL pointer if efi variable is zero length
Date: Mon, 14 Sep 2026 13:26:11 +0100
Message-ID: <20260914122611.2783563-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC2:EE_|BL1PR19MB6011:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f853938d-f86f-4f77-fbbf-08df125b5d4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|61400799027|10067099003|18002099003|16102099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	sA6PDaXXCCIldtydHNQENywTfsk0NC2Ap09NHwMdUpu9XZie2LBqk8DUabbb4Nunj5gRoFetTkSkLcSz9zYS5Y0shI1/svcx8ot+p1arlUuWNekjqH0FLGUWtZX5FeeVPBEJ6XWCPIjW6gGFTyST3vyaY955CdpqbdJuGkHQ7s6GoAgQ2Y6xcgxAJUFxkhPlFm+OlDwxTJIBPlZ/R4ruFFooWhUgOcFAdJw2tZy1grz+Ll0WXgUMHZTEMBQTjbU/I6WKAU2lWNrotb+9fCbquUsBBJYhf+Pt41cEdci4uhO10aUJgYWljHuSXisXrKGUFNuvx+Wf0gAgYR+DL/NJa1CrA6jSC9WwisXul1VOZY9vco15ngLlL//NgnXq5nI741eFiBN4/c9/VETnM1HSgw8x7lbBE6SI8ZBt1+lhIn4oAbhHKiwDq3VGG/JNjCvEimC4VFfb0YXQPn9d0P3nM/cyIWIwx0fyFAVOgyXu3fIx2zw9hbURXp3SZCbnpabfGiWmcqprkjoA1Q0Wp5jSWl4XmjPJDLs4bwePctevHOSoei5SzqaczmR8Q8CqjIky1zVYjgDlzIU+blZQ6pdAtApFOooVdWcwCjp1xCTkPRONHH5oxPn6um2F6IsM/CEZPVpn1vsMB3PkUyjfmFAVoSXVL5hawx9xSGqNoeH/ft0rFUQS5YbkT2392NoD497tzpkg/vvfewMmoCvRmCKZ8w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(61400799027)(10067099003)(18002099003)(16102099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x8Jx18YieSULhgnPaJJGB7KTRNzq2FO3d44c3LbxgpzJMsRWgzXguarzGco4y9Zb+BeOIQTzmIvcI7mmp6l4VU2hH56gCXpWZbtRVZ8jV0oGcqDI9fXXZcj0UBFeL/02zItctLLHkLB9AMIhqUfedKRTbRrKAXV7VbEMnIqQsudvjEywgw0aLDq5uVJOZ/rnGzhoyc6M5jw1FBstKrrDGn+u9uTftV7rXq8r4s6POxWp/B6ttFJ3zEV0G+qs/yLE+PhNTtvtCu3xuoisMjG+zBAKH7k6eMH/g1+oJrkwLaAhh85SjU6lxlp6XHU82+SInnoHdFmIhw/YsAty7/2Q5JRBaVmPMIDw9RFpPcyP1cOi0t6bo9BPXZMCGZrFk9fXKzIuGM9ZvdLSOGpRAeMVWqWnmlaWbr4rhIykRbwyOB0PnZyRfFgk8VhHK3sTx1/N
X-Exchange-RoutingPolicyChecked:
	SEHH1d1arZAeSqZgeUoqLCKXTz0gVjcxRsXk1cC3A9r0Rfzev/4pgotmyF38H+ke0EmT6zCCCO0ifbw4mO5J7HDEB7lSxAeTmHEoqqQmZROkNi8sI/oSufMCWYVRreUKL/BonnzjSBlvQST1C5mmj5E7KyFtVnXVpHocHFzIc5kQKZpoymndqpNi7LU18h1/3gq9JiJcuDOEmxJsFdzFqjpNnWlmMo2copyV6ep8TPGdfbj+n5TlYZSCwoB/JIsxS4YcfuiEmlFzJzVe4c8j4H86lp/+TQgT0M+IR7EdtKkDYxNK7cnmwSxgCvcUEhZolNMnjUPoBPlPyAdNDqio8g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 12:26:12.4352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f853938d-f86f-4f77-fbbf-08df125b5d4b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF00022BC2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR19MB6011
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX/vks+/77mbFD
 eyHv5rREEiuU1J9HhZA2IhNVWqs/K1Fpe3u9jidKvmt/UG0tvhJ1EcPp5HW9S37ZtZi537RAjIO
 DnvISVEBJ/+FfAwbQw2IhphBndquB+Q=
X-Proofpoint-GUID: bLcnVBzIcWo16fYVzYW6WCZAE1rdwvlg
X-Proofpoint-ORIG-GUID: bLcnVBzIcWo16fYVzYW6WCZAE1rdwvlg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX5difHA8l3w7G
 7L3x2/yMfpMQJhH++cxZqrIRKN0HV6Gy0kkHtTW+Ff34ZczA4Oo7YxSFkobIcF2Xs62pS9eC3da
 6cFmvu2tAuaVCGbNYaaSmeizdPrZO1Pt//7ue6xTnqMcfrLdwwgth/n1EBkHX6qnxcXDLWoSsmR
 Gr0SelJFYGfLkoYYahYjwmXWSEsgIqFvlzRdf6Yk3XshHFlSzPWnqD6bQAlbx2bqFdsnNMTvX5G
 P0u+cANxWMfva1gu/t7aZWC0j8BMHobxNSH7RqRgPl9yFhneLzxU6NOjcsakgl5+bVplM0JfhV1
 tcQ+i3K7dL0mhR90fsCeNdI53t+WvaCVKxt5W56e5jIv0Av5vL+UEqlY45U3vZN9TEKZzqOe5E7
 nU/uhQ1bmYS20RTcaurWjrCJpqfAZEM4lKdPfAKGiaowWmtO1P/VPcu5jCa7BYH9RqzGzayx1vP
 9ckcMSUTxCEI2oyTmdA==
X-Authority-Analysis: v=2.4 cv=It6L47/g c=1 sm=1 tr=0 ts=6aa7e7eb cx=c_pps
 a=1XJinUMeHr/5msdtnNmmhA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=ocmVEvmWqlpl0qtXL2oA:9
X-Proofpoint-Spam-Reason: safe

In cs_amp_alloc_get_efi_variable() the first call to
cs_amp_get_efi_variable() might return EFI_SUCCESS if the variable
exists with zero length. Trap this and return -ENOENT to prevent
returning an unexpected NULL pointer.

The first cs_amp_get_efi_variable() call was assumed to return
EFI_BUFFER_TOO_SMALL if the variable existed, but if instead it
returned EFI_SUCCESS this would be converted to 0 by
cs_amp_convert_efi_status() and then be returned as a NULL pointer.

Fixes: 00fd40bc7acec ("ASoC: cs-amp-lib: Support Dell SSIDExV2 UEFI variable")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs-amp-lib.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
index 41a9a5b005c63..9bc19d2e16394 100644
--- a/sound/soc/codecs/cs-amp-lib.c
+++ b/sound/soc/codecs/cs-amp-lib.c
@@ -317,6 +317,8 @@ static void *cs_amp_alloc_get_efi_variable(efi_char16_t *name,
 	unsigned long size = 0;
 
 	status = cs_amp_get_efi_variable(name, guid, NULL, &size, NULL);
+	if (status == EFI_SUCCESS)
+		return ERR_PTR(-ENOENT);
 	if (status != EFI_BUFFER_TOO_SMALL)
 		return ERR_PTR(cs_amp_convert_efi_status(status));
 
-- 
2.47.3

