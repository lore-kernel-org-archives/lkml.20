Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E5B4457B7;
	Thu, 24 Sep 2026 09:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243741; cv=fail; b=i+1p8lqXYE5pq/LA8D2lBajZVarPMiZwquyZlQBbGkjoHkmGP8Mfs8eGKV6iPYWwhXQuXzZb7jBvqqfrJBJ70mH2294Su+dxS6O1zM3DYzAYDMU2KoK1MaDrlizlvXFtXfFEY6zf1McOMm5Y9r5MOvh47izyO8mCrHmqokAYZP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243741; c=relaxed/simple;
	bh=3YzMStqA9PuDdXi3aQ4y0b31X2RYnMfZM/MVHq9YAcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HrklhumpaxaIbSX+Mh9prkRJoJiiVspsyIw764/QuQfBAPm9LUjrBJlrbKaCU6nCJK6Nu+ivJu2oADcYiytWUKOIIxoNxknDBIy0ySkLXoxqC33rt9LC/1q6O4he9Ro0RI5dLtjCXAyvpLGKasi6Y+1vUdy/amQoHudvs54EmFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OguCdr5P; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=UiCFufN1; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OguCdr5P";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="UiCFufN1"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O3wBR73355040;
	Thu, 24 Sep 2026 04:55:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=qh5J3ABwaUTuDTInuNYaJOWBWD5+Lj3GBIbcRsTZL34=; b=
	OguCdr5PWzI9dWACzmk1rDtC/8ATUoJ6tyI7f9fruUm1+ZzDFPZprFQkQLZxCn2Y
	CEadgtA/kYsX8s6eZNQNLR6VGjaKgQ9BvXoNFdUetf1C5IfEABK+MuEarZ0CzRXJ
	Fi8QHxxczSYTZIDw7XJ5Xc0aOgAAJzX7k/AqfRSlh1B0Qm3KpQW26v506/2/5N9D
	DL3rRH572+XkIf6FA3xjw9Tc75Q6ipBnTSZu5hAsWhAHXnFvHL+RbUoFTFXcKhZp
	beyqOe3agi24foZb5Gwb1/CupoJosaihmtR/E8A3o2JClcGlNInoxqahzSpcw4sf
	0YCgpJdbIp3mZJXHgv6bZw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021072.outbound.protection.outlook.com [52.101.57.72])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gvkc594pe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 04:55:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MtdQmzfp0NQl0HD+igGMY4uJrbNT/WVWymRxiVBbl0vbc3VOpv1yiuFU/Jc818Rj9ivrlIQC5aV5OajaaNZe6CzNGeqlUDOnwVmor9H0YAz1BswhIzrr+ByWaYscS9aUAt0uHaD4fdGAAgNU2mHLXi+Ii+rxDDghZxU2jMQC9L3voN5QOFA869SRVXz0bnUhBajoQg9fOirFmsqWU8RNiijTbbocDamSoLBsL+OMncVHpd6fA7/dZ+S4jzAucqidoOv+pKbI2Fo/ck8gXxyGyehLJh+/7qb8TpwTfwvWISKEBTCo1Y6X1HD2fKo2JvWg+44U3KIjGUuQhitKKdGD4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qh5J3ABwaUTuDTInuNYaJOWBWD5+Lj3GBIbcRsTZL34=;
 b=sSbIJuWg1459SmQUfebaZ4c+a7H29yJveDJ21bWfmnpCMc4X90b0YgNlYahU7YtDxwREEsX6gGrxlxmlPbh5pbOIwnfvgRM/MFtxa70X/+WOBYc8Eid49FjGHNhUzfezOYNuDt2LZr5KInutDYHyK37e3hiMCASgfG8Le02t50t5A0DIyzYffqk11mBtNKpC0WsrznZ/T61zunRu6umqolJxpADNtphGnMRQO3wjOvbfqdnMuPlGNSjcnJkyQoNax3c4XxDh8p4j4JSge+2VWOOcRSZhUF1n4GLGBbujnfIRDE1KY+dmE6zF7FlIGu8Rm3apfLyNhEnGi495pV8NBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qh5J3ABwaUTuDTInuNYaJOWBWD5+Lj3GBIbcRsTZL34=;
 b=UiCFufN1lsKj+M2LlSD5WevB3Et82gHo8QzY7xIUBkhZrnArx0pbceOpYg53bC1TIyTmkmqy0z6cNGOSHbtrkJtnjFmjUR+ekE/+hqq/UCexst0JVq4EP5gVJEMKdczGHojzMzWq65ZMY1AxksM2Ztmv6wMn5atLCSe3KHTGeW0=
Received: from BN9PR03CA0088.namprd03.prod.outlook.com (2603:10b6:408:fc::33)
 by DS7PR19MB4599.namprd19.prod.outlook.com (2603:10b6:5:2c0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.22; Thu, 24 Sep
 2026 09:55:07 +0000
Received: from BN5PEPF0004698B.namprd02.prod.outlook.com
 (2603:10b6:408:fc:cafe::a) by BN9PR03CA0088.outlook.office365.com
 (2603:10b6:408:fc::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Thu,
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
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 43B07406542;
	Thu, 24 Sep 2026 09:55:06 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.251.35])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 287D782024C;
	Thu, 24 Sep 2026 09:55:06 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH 2/2] ASoC: SDCA: Add better pm_runtime error handling in func probe
Date: Thu, 24 Sep 2026 10:54:58 +0100
Message-ID: <20260924095458.2683755-3-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924095458.2683755-1-mstrozek@opensource.cirrus.com>
References: <20260924095458.2683755-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698B:EE_|DS7PR19MB4599:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ec1cf9db-5437-407f-6d7f-08df1a21ea10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|23010399003|36860700016|10067099003|56012099006|22082099003|18002099003|16102099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	pWaNFlPINEBw8M8U+Qs08XluSSJGDJX/o9xHxZlJJi+w780nYkYooIMVILyZNbrDbZLt1JgVPccaYi2G9OlNqh8LXPJXdel82lvvAx6JFYogmw03OYFWbI8ESYY7NWWSPrpQCooWQYaUBmwMkXfL10i2r15ZGvidkBhOmd7CcJweDo/mooc/gTe22+05cA2dyNzOGldOuOWw33OT7S/32pqc/2cTpaErboNA6NJ8azCkaG0rmy0w+HFZiT3Zxa6LLgTZ0CqF+wG8GzjWvZZC4Xf0/SBhVkMHSctAZqlnTTHlw8T/HQ9iGmGN2jlrGU0H2DduyBhDBfb66USUUkR48gdMlZ5KMoO+VSFTakQOQ7RZiODeoOq2j3geLamsv5CixpUyJl7W80fONraYckDiurpWg4mdaIbNuoNHOpVR/6FMT3o2bdyWcgppRkv5XfVJZpCtYft5P2m31ii2UG1PI5M4QHJTuk0tPy4jmAkvcOdq5xLvv6pdnAHCDBNkRwh0S0UWtDkblj9x7Xv+Ng4PcLRnXF5ygngMZpc46R1NQDSWojzRNa8tC7aNvJjNJUKSJi2fCy2WF7nYy1sQ2rqjD3zCaA8U4kNgA3JWoT5ViXZmO8EGuhEmw15AGzv84O/bk1BqJlBTXemd0SGTRi6PuFr0plnwn5UE9o+yZsipJJZilcYBKGQXF4uBdZ5LZgMTEvdPqvB//ft86+nDrqQt0Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(23010399003)(36860700016)(10067099003)(56012099006)(22082099003)(18002099003)(16102099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	z6K1Y3YuqWMYB0x8yiJk2Mhx5JV+RJUXIG8GeG1XL6hlhYvTA6sN/c2utgcLgjNXu1aPBTjfIUNwVQWRO89LvL2kfBG0ojXOrXF51YVbr1xWLi7BBEP9xWmK0AlTVA8Uds1fGZZXIEjBsUsZxmUHYHlfxYXT2tOdnAfUKNenD3ME4qvX7Yj/VLX9rw5S4c68i2vb3R9Qyu6HgmD/InEO1I6YyHNsjo9sulFuAINVIjL4UErZrUm0zqv8WG+2aB4EqkP1Y3C8hotaxhrRTzy8RaIoav/vnq3Ln8Ophcz8nVGfrrCWT4Z85zmMXJhH0g2h39nqM4aLhTWRw/8FDVRLxj9yRPjR1KymJmQ2A50Nh+MzFfAjy6mnxQYSogEUcAM1oKmjI3JYWW9+crJIW+buG3Nyd1kqWkkQwuZqTdg73BXvnYecSs6tCr8SrRgFNXa6
X-Exchange-RoutingPolicyChecked:
	yNwG4e2+mm2iHphus80bOvIZjMM6HEQSBCHh/rQ7dxJMlUv5Bm/XpAeSBKaFyfUPl829vJAextvXAOgP/uCZxc8Rk+p6sX4PZlYe8HB4LglJWScYt4TDxiZOmnVxi+Yjs2k0bkdHq5toQbVU3D8AOf4hE92iREUgNfoUL41xa7D/8xN/WdduZEtBLB3kbBkedTQKqEj0CmQuhxurU0W8z/5jktq5kBLUcV392GbcjyILcDoJDx9dTLrmnWlE6P/rZ0VrIoaQypDkhVAq4kRCdbTRenacvhMUGDtbuZ4HgtAcIqJri6yCek6iqyAHyvqzVaZQBNffNlzT9BnbHnvynw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 09:55:07.0953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec1cf9db-5437-407f-6d7f-08df1a21ea10
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN5PEPF0004698B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB4599
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0MSBTYWx0ZWRfX7yzz9Hlwmb1N
 f45gUUFjR7MYZQ3qiY5WJ62XkNSYTNhYG91bH1RPuD/sGw8Ca26NM6HeNzjFvL4lC9N4hdNSTvg
 /km+qARcV/dHgZMK/MfZvy7x5p94Dh01s2ee1jIUKaHSxbwQCGdr5gIjz/MZMeJIu82vtDRaVwn
 TL2wwOsGA2XEts0nQ3OxOY9DoXa7v2NpX8Ug2BepYK/Mp1kxaRiNoNwGTOiem0a0slvV3skVO+A
 qQLncG+FivfiVNpArOKhZ21WsiEQx3Ni6VLqa1B1MaL4DT0aJOzSWUgPKUTvZQ7zgnttK0bNP39
 4xyDGdphQ4wze9dCeT4EfJUZ/iqca5AixQwPRhnqdTEgC3C99ux1W8lJsCcESeqRat2kQ42lCU/
 cr4F6b+UMHAjXBgc92HqFTIiy3+8gM+3Yw04bgYjzVZDqOMVLjHOoIhh4xejM59iI1jyHqnCJN+
 wbDkHWcuauW65i1G/CA==
X-Authority-Analysis: v=2.4 cv=ZcyIpcVA c=1 sm=1 tr=0 ts=6ab4f37f cx=c_pps
 a=Tmenz91GMLKLa+Z4vsoKoQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=5P2MgWG7Kaxx_i5x2yAA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0MSBTYWx0ZWRfX1OZDMjDO4qii
 EitLxbERaOyrEB/BzsIH2pcS0x1dkpOvgR+nykgYXrGOZs26P1/5AuTVd0HlxkF4wYhAAKbydA6
 jI+EjpWkSDLF7swQ85uWIB9ZkjMjz00=
X-Proofpoint-GUID: -rvs8Y73llXCCnBpIvh7-GF-MF0wcpkU
X-Proofpoint-ORIG-GUID: -rvs8Y73llXCCnBpIvh7-GF-MF0wcpkU
X-Proofpoint-Spam-Reason: safe

Add a common error path in probe that balances the runtime PM reference.

Fixes: 3af1815a2f9c ("ASoC: SDCA: Add basic SDCA function driver")
Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_class_function.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 1a7167aafa910..bbc825e05e37a 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -389,20 +389,27 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
-		return ret;
+		goto err_pm;
 
 	ret = class_function_boot(drv);
 	if (ret)
-		return ret;
+		goto err_pm;
 
 	ret = devm_snd_soc_register_component(dev, cmp_drv, dais, num_dais);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to register component\n");
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to register component\n");
+		goto err_pm;
+	}
 
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
+
+err_pm:
+	pm_runtime_put_sync(dev);
+
+	return ret;
 }
 
 static void class_function_remove(struct auxiliary_device *auxdev)
-- 
2.47.3

