Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FE04BD79F;
	Mon,  5 Oct 2026 15:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215570; cv=fail; b=HSMXQvkvnQyEHSXIZq0fadW1A0ZO7p/XclEb7P+JNJC/yUzg7LPi4V+58usKPZC+5nil8cjuZenus6itRpeim9AhGb9tFlkIZo8yF4PxKvsG/XhCokktCsuOCp2jy+EolV5eLW2LAGGw9L4WGEjvbTtQtKreZW1WU12f7P4Jzr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215570; c=relaxed/simple;
	bh=XUu76V2NVcyz7dlOCO0CnyqRF6CnbgGgmvgW34ZBOLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qg8MEy/rUhv/VIRhmqnCfE3JaMCoHMAGOtGdL9ATLxKVo6fSqrpZZBwGiZdl4KYOzOYEpm8LdhC0Wee8wqT2cX9WPXYWqIRowOjbETgOA8JOERlaHaFfaQoWekEfxPoqtmcIg7B9q2rnXntJmOe7U9dozfiBZ+gumbJsiWew38I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hYn//AXg; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=IjMRqFGW; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hYn//AXg";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="IjMRqFGW"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695DUoAS1788942;
	Mon, 5 Oct 2026 10:52:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=9eY6dpfNRdG1pUfnpThq6u97Ygeo1BwXabkO8NWLhIE=; b=
	hYn//AXgAZ8yIUhGShPf42ATycYmfc2Ij1Vq/MvLet+Wyo04bzZDEaHpTL0NoUGH
	KmOh7gbvT7eLCL5zclWBVGaNtn2ip0GKCI3BpwlvenP02YVhySYkeIQXMG536Tss
	hBvKloY/R9md4BD+Pcrqul0fBCUnO7KLhh1owCx1fkHCjvH4Z5GyBq4FQ25/t+ge
	5kp9hhg3lv/4ibD7BqCD5FEhsN6+yxCEwlODLREq8YSUUgJ5XMIXdvHxwDjSPojf
	tLqr0wQMb5uMGHBjZkUPLf6xjb13acRdL9cxyOFhf0CMvVcxG5/Tc1x9aFW7K4yR
	JtAtKKrH9uerMOijk5AqCg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023072.outbound.protection.outlook.com [40.107.201.72])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4h2x4ha64d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 10:52:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfHfujKRWjJ5AEt5d9VKZi8zUrGRQeOJgroZ9USM5mU4iEUObYUnKWB0As1m2s3fzaWwu86TBIjgR8vkBbj5rDrGFTIXOU/QcySxZTNr71AEOXmUY/6HBsJ5oa8dqzJNUg6shjLm3FNVGkTUSnCCIICj0RsJX8IB/VoFm7yQ3p2ySgbHaVryhNpWzXubwL9xPMkR86yNPzGXrvhhWK+f7V3M8Ia8k1z8zmZju2RbZaUPbTz+O6aiOgx4cOQjy+xgQHYCPs8u/+KOgWl/9CPgMddRcgXvkgma1/to254h+LZTHDopTsul7uC2k5Zh4UlzvIpfQsfqJWu2cD0FeDHtcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9eY6dpfNRdG1pUfnpThq6u97Ygeo1BwXabkO8NWLhIE=;
 b=IuhOg6vhA557MyPMBtefa50PIhvmIwZyQY8FmwncbSLysKx6P2KILXFABcCqBbiTz1XJuD/V4c4l33y78oNjjsYAveweixdrX2nH43adBupZfTYPqQu0IGyD/dBiXylFgRUhF5POn6qnDmAOeexRVCvvyHYRhfe4k0PIkUrTrD8p3H2uVFfjX/1nEIiXgcuzloeBQLvRpPcsTUhbc7VG0KCjmgluDj4l9S5QX6oARMYNYCaf3WDXDDiSIhyYZD7StdVQeb2V+uD2J41DvaFSOERwoFBDVC3/bPqIBXCLgf64gDQN9RbYbqnLTq1PdUcSY6Wwf1E6J3CLR0Yqca7JXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9eY6dpfNRdG1pUfnpThq6u97Ygeo1BwXabkO8NWLhIE=;
 b=IjMRqFGWLdr7nxpEEonGCKAkY7mJMfnFtLVpavYxzvN9hRqph6pSssYQ6cMnFWJ969f3+9e8nijZ6nK5QbAifHFrAdiX52jU20TdHjgkvH1RPSzJYXLxO+AYciw2TR1/9ptoAxWd5VTF7WQzoJo6flsSX2oOeWlmoikKtEJOaRs=
Received: from BN1PR13CA0021.namprd13.prod.outlook.com (2603:10b6:408:e2::26)
 by SA1PR19MB5594.namprd19.prod.outlook.com (2603:10b6:806:229::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 15:52:38 +0000
Received: from BN7PEPF00000094.namprd03.prod.outlook.com
 (2603:10b6:408:e2:cafe::59) by BN1PR13CA0021.outlook.office365.com
 (2603:10b6:408:e2::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 5
 Oct 2026 15:52:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN7PEPF00000094.mail.protection.outlook.com (10.167.245.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 5 Oct 2026 15:52:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A940040654B;
	Mon,  5 Oct 2026 15:52:35 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 971C9822543;
	Mon,  5 Oct 2026 15:52:35 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/2] ASoC: sdw_utils: Switch CS35L56/57/62/63 to use OT25 DAI
Date: Mon,  5 Oct 2026 16:52:35 +0100
Message-ID: <20261005155235.1386525-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005155235.1386525-1-rf@opensource.cirrus.com>
References: <20261005155235.1386525-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF00000094:EE_|SA1PR19MB5594:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 07db956e-2cc1-40d2-5477-08df22f8adb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|82310400026|376014|23010399003|56012099006|11063799006|10067099003|22082099003|18002099003|16102099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	nfVYHESZmWysmLeoz/E8RE0ChTMXtrql5aToJOlkCupBvr85xBA2OcsVtT3L/zSoEAxh6R8JvmeukcvxNFtdK+yTeBcDZZHWQiMl6UCWlhxPs9hM3ZP2GdXAXBZeAjce/EgBdKU7UQuk6ciF/BJIn+Hvva2M6rbxYNAdr52T2ogqrBre+o/f2CS+ynfaChU14AzQ3QuwVX31N5eL7oAcR0WzhPTh9BnuAolOowVGebfEbU38pSPEAmkRm6wzp8uzZVbwZODPHaokiYjvrlnt5+TQe4/6rIS7glvf4z8pp9PUmcR9cZ6e3EgffjvNSGTRiKTPAP6LsAqzZYUgacjRkvMyMeMRyRV9IguXBtGCcTjFtBwX1rqovqKdjvRaGx/jieCNwVauSL10L5KnmYsrtzH9OMgh6u7gw8qsX1CgTIDhrBZndxs+l+faYdGfOae+ZnqqvaZKhp8XaDcrXi5P1aHI6HiLsIx5DTR+lN8W6KTP6HjgF4iuJcpuitsOtofsRofOpDV8x3KzRrrrHFpjDQ3HSU1ifT4A424SdSnI99TgFthPs2aKaTy/bPi8gMS6oWKulBmxIUyLQGRkjWXyjBu2M4/l0do6ytEY4NgouPWyN1bU19lawNdx8uvQefsLU0lhzI8jHJODxI7Nhd+kaNOWGaPY3EfmThylZ12DkhiuAgK9qSh0+C4pNOfzC1Hx/rZgecMuVNRWKtHxEkLHzQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(82310400026)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(16102099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zRoO10DU50ICPENO4+btF2EEZ/h0lozhmKANEz7tBhedyLh+4qESYJj/yoOyeb58idVzYFR2F4pGIRDyjiTm+/651wcefA3iRkE4V/gLMaWWaEoNqCKJlAQBvJBZIfFUM54zTcRn3WK+Z5PpoPBFr1L2O2qQyqFkOOd04CrknBh8AyXZ/7vLpg7n4nWgdnBYkHPYNh177+csrbj5XqQnXdCra2DsyMdnWYyKxkLurUB0hpLf7yWYYChGzTV0MhNm6Izpg9lbNq/WXRf1I+9EFWxcr2u8gSI6CFnw4J6htCZyAQJLBrdUo806vM6xfaxwy8MoVyLK6oKpMrfwD0TCAcyG1uX4K7qp/01tI4Bm696XO5f1728dYT1er2VW9amZ/YpBXFEEUDWGv8eyaFevJ671ckVgX6JUD2XzrMgDi5XjteLZXpif75rDEjCZHuEn
X-Exchange-RoutingPolicyChecked:
	AAtt/6mMMnvGPJ1XRtKvYvcbQp0n97WJX4HFvk+trMV5V5CAHtpZVIiwl/D/u/UJpUS7OMMYkGwRVmP/ovlGSXz2n4j2tVhRgQ6ZffvYsHf317aeaB1zqAguEUPmG9WAIM9rlcAzYw9rgxsXSGe1ZnUmilITeiaDoPoE5IyW+LAqKJgWLifXf8q5VfYF8+CeYiondmwZP4ezahER/6MCSL3v8YEMV6L+fObMW9+1DrWtEDZN2XQViaPsN3MHgoANT+0SyxtKEIOuKJJUOSy2gW9moqH7Y0U3pOiRtFkJkFXMczwQT6Fu8gwGGX/sR6q6tPx8faK5qz7A8nc8vdCBIg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 15:52:36.9542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07db956e-2cc1-40d2-5477-08df22f8adb8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN7PEPF00000094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5594
X-Authority-Analysis: v=2.4 cv=DuLDa2/+ c=1 sm=1 tr=0 ts=6ac3c7cd cx=c_pps
 a=loCFzqahDF5aMGY1sUDZAQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=rXw-W3I7gEtPLQ-LyacA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA2MSBTYWx0ZWRfX3L2LFLsteC2C
 JT30qXh7+KW4ibMcMGqk9+Gel0nPH6x4ZHN65Rn0cHrAnKaBK6ypIiecYZU9QdqidUX3xZKbZeW
 9aTrPc2A3v0hTDDKiBPIKF44GT+qcHQ+JdxXoZrS5CGUAH8fGOCFcOWvDl8bnXsviVXpO/MXL8R
 Pl0+XTGLnELbMAARySSwPFZXR2Wzv7AJMCsaXqbuOry3CqHmNnCXvGc1dPKr9O50w3LRZ9nZi/J
 ILjXFTVtsuBOKWtheRS3+4OHEzH2nycPYIzBeR4ZB0bYKFksRNzXybzBX/BrWAWT4GUkr6xm73w
 krzq3LH6XGI1j0G7tFp8RjzPM/N75sX/d65opY5sA8rFeU47S/TSzAOQdT+JdECs/YYFlex/SW4
 OmCqHpaH51X1qYkk0VFkhjKBC6R/BoM/qDmTN+tnmBj54ltuPysYt1/MYHIFp3kga8Jp3Xna5ql
 nUhuynqC2tIcNiRjj/A==
X-Proofpoint-ORIG-GUID: gbSwZevcIa2WJl8xR1aXpJVtW2Cdh5mF
X-Proofpoint-GUID: gbSwZevcIa2WJl8xR1aXpJVtW2Cdh5mF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA2MSBTYWx0ZWRfXyvrHNMlcHDGT
 KCBmhW1ZYCbeLFLTGnBZt7kDADF510xHOVwdcvtjwNKCYrTWwDYC6O5mIXm0JPt2egSI3sOFkX8
 dvacZE2C1TtpQlMI8bc+YnXQDeBSxVA=
X-Proofpoint-Spam-Reason: safe

Change the CS35L56/57/62/63 entries in codec_info_list[] to use
the OT25 DAI for amp feedback.

The AMP feedback was incorrectly using a DAI connected to DP3,
but that is reserved for SDCA companion amp. The correct amp
output is DP4, which is the SDCA OT25 feedback output.

Fixes: 898cd43bde307 ("ASoC: intel: sof_sdw: Add support for CS35L63 into machine driver")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 14aee10b40ba7..7a19de75f32b5 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1035,7 +1035,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			},
 			{
 				.direction = {false, true},
-				.dai_name = "cs35l56-sdw1c",
+				.dai_name = "cs35l56-ot25",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
 			},
@@ -1063,7 +1063,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			},
 			{
 				.direction = {false, true},
-				.dai_name = "cs35l56-sdw1c",
+				.dai_name = "cs35l56-ot25",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
 			},
@@ -1091,7 +1091,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			},
 			{
 				.direction = {false, true},
-				.dai_name = "cs35l56-sdw1c",
+				.dai_name = "cs35l56-ot25",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
 			},
@@ -1119,7 +1119,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			},
 			{
 				.direction = {false, true},
-				.dai_name = "cs35l56-sdw1c",
+				.dai_name = "cs35l56-ot25",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
 			},
-- 
2.47.3

