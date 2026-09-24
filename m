Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F183B47DD;
	Thu, 24 Sep 2026 09:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243733; cv=fail; b=KT7nQ+2jSdMPq0ZkhSvz676g6rdmaMPqxyakv7syLI9KVMp1Hq1Pind0r5+nacj2ApyNglHC79zwqD9FXd7IzXeDPzXAyJII+u8bCHDbJLdD+AtZYS2jfclqikzJ6RTKGFUMxC0kLG8b9je9xppY6brc8o+97qFWGE3ozqtAc34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243733; c=relaxed/simple;
	bh=LhDg1iQjCrckpmsoO8g/tPaasJvQ06bWIwuc3wNeda8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rMOEQZXMhUwYCT7mLjTPi3h497aLkGnjRORG+nMlNQHqA7+WKCY7VgFR61KiG4grDpKoJbsmABMq5sW3GE2Fkx9Gv25SU2l0V6HgkU7jKw82xN08cRqEKBMBo7JFujyaRTNGOs0y6163VXEgya8EKD5jl2HGtvbtwFjF1nFJuhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fWD0kGZ6; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=qY5JLq73; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fWD0kGZ6";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="qY5JLq73"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O4qIfB3664366;
	Thu, 24 Sep 2026 04:55:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=pzYMe75h9wKkMm48
	YGSuiuwiz0m+KbPveTpnXBHkHQE=; b=fWD0kGZ6+BTZ0oN9KGi6kmOsO/qqDfo+
	c0MP9PBCAXnlLBaXK9ePyAjeWE3hUbnY9+qCbMYXrY9WyBJweKsFBqjZqpaDNsqS
	awuVu/8RZQ5FXHnAkXR2fz80hSrYhw3SOqPLl4/U+idpWC81njH5TuDY86eOd4sS
	Ab+UD2OJn+5cJudvO/b4HkF6JKAA0yxXUxhXYuqDKf9L9lHHXzmiu1d6oFvkYeK5
	QKQPxKFs3Q2T+VEOaUNrJvm7WPqwMXCp29CZ3GUIWWEwxhy4z3ZpxcElc/8of7Qi
	mX8lDuamED2EVideXijwY9D8srJs/fmIYTTicJoiN5Ppmo0tFEvbpQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020138.outbound.protection.outlook.com [52.101.85.138])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gsptj7313-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 04:55:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kE5eDdKL8S5yP3gmZ75HkSfV1dh89PPO32djEAmL1eLYcBdmAE7DhXqKdCGqA8Ds1+56p8V++B36ZfHjG1DfdZZgYMc7pG7gPO5s8vxoFILNX4BMSV2CRzv1SyKruTXV5oIDAvbD8nXcQismjEpzYdehXEtulbFaUjzmthes/q53K6vVr9SFmpHW5JG5ipDY5pr4C4mzR3yJdrr1nvTdDg+k2xl8Cv1BlwvAJ7rbkebcYj5iGtIwb3jSFdtneudgU0LU7QuQ3WtcEeh+7RrIpYfgDJWp7MOJFVqm/rQWon1/y3JYtsmDDPRE69ZMtgjq3RlCiVB6gne04/ylUg63KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzYMe75h9wKkMm48YGSuiuwiz0m+KbPveTpnXBHkHQE=;
 b=xllxhLUI3f2aGQY8HDYOa+IouNnoQu9oi8NjiG/Wzaz30Bo3eVW1aZ7bvw0iDjaflrFWEZfKVRjuZCkeBc7p3HIfq8itjwIV9UZpuR/VkRteU5zV98CDQgvsUkrc3+oPnXZjm5dcg+Y2A/3Y/YEIItWG1CD04NtBT+0Rc7+LGxMG48QDjAnKO4sinM+CtUGopYWoGx3ikY5hTkRTWcbDU9alt1TAcOoxU34S13txdnKB5NITmMu4uIWbbz0I14QWxl/MaGXUg57Gx4msvnLfzE0Q6H9F6aZGxuWVvJfmRui8cbIyLsmWrSusVPotw9yZvdR8DrRRv2N1pXfE/qxG1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzYMe75h9wKkMm48YGSuiuwiz0m+KbPveTpnXBHkHQE=;
 b=qY5JLq7312jYpyY85m7LRsV+/k11ubklIOGAaBaOtJpxMdbvg35JlzvFKhfKlLPqUz0MsWUgUZYANfoQo5npalC4z44lmXvEBEganU3Z5XN5jR8BjsB4iogHvgrn4Ejgz2qar8eCcP59MjO2cgfL7kUz8mNIC93WPZlZBwY/nm0=
Received: from BN9PR03CA0087.namprd03.prod.outlook.com (2603:10b6:408:fc::32)
 by SA3PR19MB9215.namprd19.prod.outlook.com (2603:10b6:806:49a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 09:55:08 +0000
Received: from BN5PEPF0004698B.namprd02.prod.outlook.com
 (2603:10b6:408:fc:cafe::6c) by BN9PR03CA0087.outlook.office365.com
 (2603:10b6:408:fc::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.12 via Frontend Transport; Thu,
 24 Sep 2026 09:55:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN5PEPF0004698B.mail.protection.outlook.com (10.167.245.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Thu, 24 Sep 2026 09:55:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2E4A5406540;
	Thu, 24 Sep 2026 09:55:06 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.251.35])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0B13F820247;
	Thu, 24 Sep 2026 09:55:06 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH 0/2] ASoC: SDCA: Power management fixes for the class function driver
Date: Thu, 24 Sep 2026 10:54:56 +0100
Message-ID: <20260924095458.2683755-1-mstrozek@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698B:EE_|SA3PR19MB9215:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 009b700f-4456-4a47-ea1e-08df1a21ea09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|61400799027|376014|10067099003|11063799006|56012099006|18002099003|16102099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	YYvB2HPefPFzmPmIExQ5dHcFCFdbJB+bIKQgRpSE6QLCn2qwYUnSP5S4S/9NMT5bJY/OwQMIzgNu5hABtr0PrGBMEgGbvF4YcZny3pOxLBPkpg9QyBnxkMLqCMWkSbyW6R2XoT81eld3eUaF3teEXu/J0l4KgFJo05d2Orf51z9f0ZNQKsmZxqWt6cm3eLHzniG4x7bIdfSY5Ybr+wUfrfrjsa1ujHjGzSuWyspb4P4w76W6od7FzVOfJ2pgEK/+SmenIqCtkQCYWp7v66cYOXxdJUZ4mgdsgOsK62Gd14ojplXUXvy7n5OFMycCMiiVWzSWwNzP674GCQPz0zpZcGjNVW6sI3u6uCflIjR2nFu8vs1CbGS3q+ATGnujHcZLY2acHRO/NkRyxbjddjqz7pTq7o2ZYhyNOCYWbgDi2sI9nwAOerJIQvNLfQ8etE+hXAACgo5YLcoWAn/jrNQalDOl/ej1HVWe+myFYbdHwTPqivO/vAWVx6fBHth5V9cHuygfm3UJ4nam/mUBhUGNq147G2hZrKu7ItrV+FJqjxIh+JnQiR3dp6vq1bBEs5lga1OPk+vIY6yPus/z6xg6qOpAosnIRV2U741R0YgzkbZxWP/io7cTG4PhuGhBLPO66v+UUrctODWRWXBYmuZw8xzcVyHS0o7ELR/7aY/a5glhJ19Aboocdo9WRF80mX8d
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(61400799027)(376014)(10067099003)(11063799006)(56012099006)(18002099003)(16102099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sLHFQXdI5/jG+ovgCCEnMP2i/lcX15s8p96hAoUEvznbWYwYF+IBrnuEmtaOc5gTj6/99crqThHiD39hwPVDQEHhR8lEYvR6zyECqihzTtitwPj9APDW5oXKdssjXIE1VtmT352ZHEdkPrKbfQgwiReRLdl5cBvTf00OI3KkxcDALOyM/UBLOO+kBMGB78UZwCdwg6g/AJq0ibvt+qxB+VsYLGJC5kV328ql05Guu18qd0BsC3HF4y4YFqzEhmzmQf2JACgqzWgc6kB9+JS3GtYzHALJeQA1Jt4QuWYE1mbgglc4NEwD9cg1Sxwg6103f45OaJIef+i6JjnuUNTT0XsWFR4YdEVcF9JiNqj+76pIBfxsVJxPplTo/F6tT6HUcshpYZKLe3COqg4FNe7/n1w2mn3ct7kQ3Tlw2sfSr6VPCHIEp0dMhQLlkIdOmIgE
X-Exchange-RoutingPolicyChecked:
	npPaMBZDVDlhrLEsBGKilpVtYk7VT+wX0GJcVtWYHp1nCSlzIgquXzhMt7OSgP3AodrtGvVoF/N7JSOZN8Kq1OKOp0tp+Iks+8cNBKNLkM4PKNLdS2svkvTLjc0IWDbyNUlDOoAk0vxAIeYsDzIar9Os4YeAHa/ZPqaIMEjeND4MmFK+j7DJBPzgT/67bxus2+bPWM7seBbt0wI3cpOiHhJ66dwHhiM7wFa7ld1s7ZinMhXNNYIQo3HjqQNyIhZSg3KG+vA2e/WWPQbXseJKfvct4ZSRjvV/mq1ZXRo9vu7yY0Pzp9LzKsFhSy8t8NkfJ25Sxr2fYM0lueZdCeYIyA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 09:55:07.0523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 009b700f-4456-4a47-ea1e-08df1a21ea09
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN5PEPF0004698B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9215
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0MSBTYWx0ZWRfX3oWAyplq1o8m
 WMjFmzg3Iu/KI6cg/v2YQAC65qbqz2PFVSS0HDR1ZYcLVAEaNGcjwM1uSwOow7GloRWaWMIdtQp
 +4Mtq7FjMNjMigAst9iqb+NGosM8Ji8=
X-Authority-Analysis: v=2.4 cv=fuZJ914f c=1 sm=1 tr=0 ts=6ab4f37f cx=c_pps
 a=LJnPBYNXoDXf0nqqeknapg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=uqJQKOU5uV1npcw33twA:9 a=ZXulRonScM0A:10
X-Proofpoint-GUID: LoozJ85IUm_MISbqpgE6Rrepw_Qim7OY
X-Proofpoint-ORIG-GUID: LoozJ85IUm_MISbqpgE6Rrepw_Qim7OY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0MSBTYWx0ZWRfX4usBxI0RUhkH
 CPvvJpCQtfXgpQ+dIDPsS+lT8QVSx/k1HcUlfQhlKn1z7jLXgXLxfBBMPH88XR/fZJO4mOwcjEN
 NDcgeafgHjjVqU+NHi7uSr2rXe4td5aqP69XsezvE6+szn7LcLa8qmKOQVHHYDjLMQGwG8oVuqz
 pwKjiSBmRAKnEqB2Ys0nlxC6y8RWspB91lMGiE7Kg8h3B12ZF5X8IzOGZLLnDvcfAw867nMbj6f
 x6xvrbAcT6CxNXN1LKeQprBplb6ztYr62Jc5p0GGsfjCDRITDtTOtSOsFsrWqFzT4daU29zFWJx
 Fm379jRs2c+XnhCtuh7c+9X9zaXOtj34q07qQ90UMjunFlkEzjEBoFyZN/qUzo2dzCuZ1lxe7VV
 b9prbGiZh0JW6iZSok446Df8DJxfEm/1KulvNCYAJZXSA6QUILYzFX1FnU7TmrmBkPxvwp7i0h3
 kf7PPQVK56DCZNrsu7Q==
X-Proofpoint-Spam-Reason: safe

The first corrects the point at which the suspended flag is set during
system suspend, the second balances the runtime PM reference taken in
probe when one of the later probe steps fails.

Maciej Strozek (2):
  ASoC: SDCA: Set suspended flag after resuming within system suspend
  ASoC: SDCA: Add better pm_runtime error handling in func probe

 sound/soc/sdca/sdca_class_function.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)


base-commit: 782424a17d77ae6de07b490618b523066c528f59
-- 
2.47.3

