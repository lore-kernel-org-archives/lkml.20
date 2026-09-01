Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C497B33F368;
	Tue,  1 Sep 2026 12:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266363; cv=fail; b=s8Uj0xQNDgYUsjump59DE5QXRHzEg7N3Jp6rOX6WuUpG1mpVYyawftZsWE1ITsO8McZ8YnzQyXPKJAcfRBitKe4p2eF/ohW4JX4fDsFWbc3izYTpaK88WXWA7F7xApgRcDHF3CwbZEPLbIaPGdN3AWnQ9OmaXKQ+GQnQwfuAW+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266363; c=relaxed/simple;
	bh=xpDikgWmrmFJGX86lsJRHTHXZr1XXsoEwTiE9NNoenc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ReNDryWvpKk1j7L1QMmry8TFJuKFuk4bGz5dOxLOhWjeFhQUvNlZdjos5obFWbCYR3n5ZqMq/F4QDIdexhniUgem3+mWJFKjDKSrR4p7A8LUj/8jXBFaUvC4hgHxkAaoM75P/LmqyJIeYM0/NF9BEYVEFjjfh5YLFjDtPtQ3DjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Pl5Wq2mh; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=KO015kTH; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Pl5Wq2mh";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="KO015kTH"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VNltFK3328356;
	Tue, 1 Sep 2026 07:39:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=iXqRNJRivJM6EekB
	Yjh4j+PUczQHwoIkovrF/jInrtc=; b=Pl5Wq2mhDo6yp6CvWbUN2PcFBUpse47N
	JRvxiGX8aowmBT8KVAoJQyrZhQUP4sG73G5a8FVk9SAQ8iRa2UwhEYZBIlX9PWAY
	i3ADuT3aK7dRn7mZzC2+adHmLa5GNVmwjrD1gX9js5ViBxHWDC7Zb0ZaOHF393Fl
	u6xdtj/fNlo2nYaaxhSnMEK1kE9pUY5LthP0KK7tf/Y40B4XMTnA5TrVaSsPThzl
	TToNG9HnYrLipxT42SPgcmsbkJjYdz9Yzi3Y+3VOWEb9sZTepRy/xsQpvw0X7B3h
	QUr9koQvyS4glzAk7FAoMo3HEIDvsNtJsOpoTi/1AGnJwGs+F9glQA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azhn15010055.outbound.protection.outlook.com [52.102.136.55])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gbvtyuqt1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2026 07:39:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSKBbRP6UfYLBhUJC5FxOFiwPYvqV2PpcfOgWrm1G7wIjw8sIKtI1aiRKCkHk7jFlJhdXHRQwhArEvwoqM2uff2ayAgmiMwzffvepvhUFhAukQnvuG/OG9TyA82EEbg6eMX9A6OFCs2IlLQPSGtZqpJJ/CLQWTXDZ2DZalO7oxCfmCooo+u+khOOgW2d4NlME6j7bDB8Ffteh1636poSB+ALSnQavZf+H7PNz1H45+Yd3g/RvGdhGY34lOKgBnHkId1tA6zufTyOyWYkME30hAurKvF7R4eHHoHndQQHPpon/+0WrA/Xlxq7+Bywy5FsTXl9K2MHbS4ZTmc254hBlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXqRNJRivJM6EekBYjh4j+PUczQHwoIkovrF/jInrtc=;
 b=L6aPFpQR6pWr4WX1DzYKkNhEBpLKlqmA55+TRb9E76VmGFKu++G8kTpnx2uq4k0D0Vo6Hd7ll7uC/w8bEPGoooc67ArMrLdQ7vjCU+D9YL7A8KORAkqQ6o+kSN46edB3cpNcon9NPbLJuIcEMicnUlosyCZP74AjLcAwdqpoE0VLn5i+/qxR95T5D+OTnbsx/aNGrzV6/IS+duI78THgAofapF1GpaZuJ6k+RfCxABllTTqLK6CsZRnPQgHIFkoGs7iydGwpNy7AylnK9E0pQrYPLDqCjFSxtSS+eTiulFRItpvli7MjTiq1/7m942a3M/CIX+Oio50NVKQ/TpKG8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXqRNJRivJM6EekBYjh4j+PUczQHwoIkovrF/jInrtc=;
 b=KO015kTHAEo3ymPGSZPEt1H+8g0ddlLj9k7fqeTH5PFQN5peqkkqRI5GcPJSNWB9V3AkjA0LS7nGafxuNy+xBmvJR0gBZ9bO469jcIuyPQcwHrGhI5JBMf9lpjRqsxkGJ5EOLrQlRvPscGvokxiJpK/afTXmliW426X01HTIVvY=
Received: from MN0P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::8)
 by EAYPR19MB364612.namprd19.prod.outlook.com (2603:10b6:303:2dd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 12:39:03 +0000
Received: from BN6PEPF00000076.namprd03.prod.outlook.com
 (2603:10b6:208:531:cafe::1a) by MN0P222CA0005.outlook.office365.com
 (2603:10b6:208:531::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Tue, 1
 Sep 2026 12:39:02 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN6PEPF00000076.mail.protection.outlook.com (10.167.248.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Tue, 1 Sep 2026 12:39:01 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D12C8406544;
	Tue,  1 Sep 2026 12:39:00 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C0C5A820247;
	Tue,  1 Sep 2026 12:39:00 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: soc-ops: Clarify kernel doc for snd_soc_info_volsw_xs()
Date: Tue,  1 Sep 2026 13:38:57 +0100
Message-ID: <20260901123857.2338909-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN6PEPF00000076:EE_|EAYPR19MB364612:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e84b265e-e58a-4588-af93-08df08260090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|61400799027|36860700016|82310400026|34020700016|11063799006|10067099003|18002099003|16102099003|56012099006|12100799066;
X-Microsoft-Antispam-Message-Info:
	cadDBEKs6A/qX+9zHLEql8SeQsjoukklDzok58emZVfADIjl33dNDbgGAZP7Bze4oZnEqJMwx2VZFxIteggLsOS9ZdpOCfxSqDxO2UH5GhKJWC+xm6KKMm3TmI4q+8JTvG3t69DjgMkss7EGKSn/gGSj2/E8UDi45aqnmbdCzHSIFqTg8pqfPvz7B+0R79Gp83LqEAX7Ng+g1Q8tqfouEvOMewrgDjN4lC6QVLH/KQnsiLnCE2pPwA5bxg6fuXla+ez7CQVLKnL5K6Osgs9u1GIc+FvgRu9iJagOgcd5Zp88tf+kZ2Xgs1bPUOctTR/nLXkIhPLac3GiZS5QQ17Q2YKVWMKz/Lzc2wwNabHkdC9i1vQ7HWUiwyh5X6UMSH5Zs86vTBi+Ihk1IDhDnnUy6oWOK4m8KwwtviC4xXnfL6jwuDZAXW0UWHXoKbGVAyclRjhzgn0AGqLocSwvtQ+x885EOcQubPWC+mJ263fjpW2cNms81+LVitlZz+tSlp6to34bj0LvqdZiNICh1zv07+R8IAhk4hux44vqr1wUdUONGZqo+7iomGlhtR2Y2fqPDP64Ut3YzI/maEkuPlWGFc0ThCZtVLsSGNx0TX8KGb9FEMq+gfapDBIX5gUlefYtQ17ZzRyk5c4Ja3K8qIp88s9TDOauU8ogcJzVof2A5F+qS+mBKGSVJgtuyOEFBVUy3XNkJ00u7m7Vmoqf7bi17w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(61400799027)(36860700016)(82310400026)(34020700016)(11063799006)(10067099003)(18002099003)(16102099003)(56012099006)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	50H3/jw4ee/utsOh9G3qe88MeXwbjIk7GHX95N09t0txjlI+Z8au33OCOyqxWkTBcthpib2HaaJR6twGvP8t2Yspnc7/q1iePiRy0tZjZPxBh9suVJMYipOdQ6sD14HfLTqisco1i8IvnydSJuU4OaWC0Zk0ANjD5nswKVvNmLFt/gfSwCh/xkWMGFa6M7BQtERguzyGVWihtWHTHVDgkAescop/znUfo4DapBlUltoDijJGt32NTfrrh6Hlrrk6cF2ZEZoIQhHEDJ0k/0+UX+2+jHd1as5ooGn8jdXhiX9kb+d7OqQBgaxeZ+GyufQjz1abluEm8CRmY+1collCvghhpKJxFbsfbUaCWlQE0uvzIxhpnS03SM8unGAyqjqeliT2xYUzMJO2IMUF+S4YRK6wuO4VDDIOGj04RMVTIpdQdNxQl+g3+6OiR82FMSIZ
X-Exchange-RoutingPolicyChecked:
	yKj8ilqDgYru8r46N9UR45AXIn5ev9nk7fDTF8GA84kCiq/v2G3MXaSZvLF1oNR6Hh6FvMf2up2jyQ4M6brfj2+2+oV2ECmHVjjaAAJdbExfKxOPIvKeuGUiHmTonQw8BliAZQAZXnMfw5mBTI6kvO4CmC3mMxoRt/baPBLmEM6mtvIpj3Pdr6Bud/Als8a8k2t/vGFEhwu6h0O/Z5Ql6u8opi6/LBybUhb28AzGb0I3PgTMAsz6G93rCqLD7PFCG+Tg/t6XIn6xDvxs2nni5KaC9Hfav48RnjqIj6KVu+TNOY5H2xL2/t0XKnVCff4hdytHMIw3ubRPogOpNDQTyQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 12:39:01.8869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e84b265e-e58a-4588-af93-08df08260090
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN6PEPF00000076.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR19MB364612
X-Proofpoint-GUID: Sep13ViGH1ZP7kdI05e042VsiAroLc4J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExMiBTYWx0ZWRfXxUnZhC70AmBp
 i1NoIwEmlrERrPxpgq3ci/rLIZGChpCZDV6XnXy9hk5aGBE4jd9JXpswKhCLDwezCLNgp1sgPTJ
 glwXyuMXMu+ZNDKWSFXaFemS144QCcC+3DdYH1rgLNIHoFF+7zaUB+w8vtSDOpSmxJsGqInVE8M
 vgN0ZuyRsa/46xA05xwZToXXTDSNET2CQ53eaq0WhTmbcGA+Tel3/r6tfxDrDlioZpWWQJ/UGXi
 xE9hzcaGAMSAtHgSQu3ClGOcHLnH92b+NDpy4eL6mZZQqrDJOC2BLIXtdlcvCpWqRmdEVib+fJV
 jykFaLzdYYM04fnX85FjX+KGkjPdQqvEAkGcBX0J8ZQ3EbFoyfpq9wMRQfyPT4vRfVAp6yTEPj2
 /033jdXQYcl9Lp6tRphyjWtsoj8HCzHYstZYt3hI5F3EBmvGXkt4JMZwMqSZc6Ygwf7tcsRv/s6
 uE5AiXwkHM27u5m1ARg==
X-Authority-Analysis: v=2.4 cv=LcMMLDfi c=1 sm=1 tr=0 ts=6a96c769 cx=c_pps
 a=Fz5YytkcKkoVl4CHSA2Iqg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=SulTgn3xmM1sLg9kxAUA:9 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-ORIG-GUID: Sep13ViGH1ZP7kdI05e042VsiAroLc4J
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExMiBTYWx0ZWRfXwYK5313l1JpF
 jJEi8nn9hnV9T5yIv5IKvR7OJT3olyYQABJHqo+fhNP5ddsDb+5I6pQPu7rJAY63u3mmzlAK4B2
 /TPFTQ4izTaOBnUhOxViak8PbsvEyDQ=
X-Proofpoint-Spam-Reason: safe

The current comment describing the min member of struct
soc_mixer_control for SX controls is slightly open to
misinterpretation. It currently says "min is the minimum register
value", that could be interpreted as the lowest numerical value
the register can receive, whereas the intention is the value
equating to the lowest possible volume. These are often but
not always the same thing. Update the comment to be slightly
more explicit.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/soc-ops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index c935571d43e9d..142f407e39399 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -305,8 +305,8 @@ EXPORT_SYMBOL_GPL(snd_soc_info_volsw);
  * Callback to provide information about a single mixer control, or a double
  * mixer control that spans 2 registers of the SX TLV type. SX TLV controls
  * have a range that represents both positive and negative values either side
- * of zero but without a sign bit. min is the minimum register value, max is
- * the number of steps.
+ * of zero but without a sign bit. min is the register value representing the
+ * minimum volume, max is the number of volume steps.
  *
  * Returns 0 for success.
  */
-- 
2.47.3

