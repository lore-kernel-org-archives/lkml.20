Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1747CA6B;
	Tue,  1 Sep 2026 12:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265617; cv=fail; b=FhoUH/2+FlTfTZlLZVJsaiBsaW0yfNHLaKDFm1iDNO0Mmv2Vh045vHbUZ2J+HEpvCl5AlIWEq9CB7Hlb+k6Ig/09WuMgvV6XmZ27mE3PPCttJT8gDYBxKJUlP4wesoMNEu63iHXCdwIRSZESJ7IpLIZ8+huLxB7nuFbTNyk/un8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265617; c=relaxed/simple;
	bh=OFy9r4a9wdHMjaIifPo/VDt7mnGD/Pi8hiQMgbA4AqI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R+xnhKfRY1iCPRNqJHPTE1eFZzd0mwQlwAk5Iwp4RQn4a92H1k60Bq9G8uhMEuKA4iCVXn5ogy2qUX9q28XKwMA+9UxraXeUgwbNwG1c9YyVr4gt6tIrT+f6M6PWoYWUz9WyQJ2ccZUXOkD0sCnYG/0N39VRHUTEB6yNfpqMbsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DuyeR7VN; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=xqtql49+; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DuyeR7VN";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="xqtql49+"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6818xFr52588332;
	Tue, 1 Sep 2026 07:26:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=XOfhIW+SEY7B4fBK
	D1Qz5kWhWmmj/tp63lASBhYHxyk=; b=DuyeR7VNW82VJ708gzHSPQhrOKcGj9Sa
	Iufo5AVKYLl5sxMtSJtOgSu30cP/+hqpCBXzDWFfdzWSsVrVcSfmuDKUmSzCDjTK
	d3CoI4RIFc1VkCefN7yEcjiLpmBUoD4ZGwGY8zqAEsbxSbRrH7KdiT9zSkzaULm6
	tInFWpC6V6SCwJDvKtAH8GHsal7Zp2u0TDsjlcfz3gxyIT1tlGpflDnGBZ47MT27
	NlCAfK3in8jSk4wjxjmkEYeV/J+PKQrws0mBsmjQoZfip5Gx+bFSWbqfpPsM/ApD
	yrvhRijrnacmOE7BklNmsC5molKK8GAG9GcUgXHGsJDRlrTAHxMsRA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022139.outbound.protection.outlook.com [40.107.200.139])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gduntg7mp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2026 07:26:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wb42iQ4RDOkt0zChvTl+/IxweVpG1vL+zMZ7T9b9BtxX3Y/g5SXK363d7enpYcAfwblcRHGNzTmWkAvamCbuV0TQqKgAnVc+CWmZhSNHoty0hBUUpzFPAf2l44L2qIL2+aA0WnzCoMMM1BGDb0DiNpNDTT9eNJhryAFsGgRNqOOkvcHZoXF+jQAZk8+IQSaSft68Yw37PY1CgaWvEJ3jQT7FrEvaymf+npsm5kiI9xyQv4jt4z/KQQfqppm+rZxNyYmBOJZt6q0xdKULaMytEiq0d+HbXpVGC0h7GhukjIFEIYbTf9H9WODRBAnlywpoCibSvuJDPV9NmJfAIfztdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOfhIW+SEY7B4fBKD1Qz5kWhWmmj/tp63lASBhYHxyk=;
 b=KPcVCu0TqMYzrQ3g9OmJ/IE27Hqt0PVALi1jDw5204/WAOehnABZHxhqmGMvN5pOYF5/qj6cZjfGc4CD4CwdHSdfxf0Th4J1/f0NJmm6XJJinUrCru4Yb/I5UlvRRS6AL4277eaT0VyxA/GNxHiYuxVmbSp031Q1TVk7BgSa1+vw81Tx6mFe5OLpU2CrmdPYs8oEOf8PGWG+doPAwyQ7M2rkbbBXoctVs32Emojc2LoP5sEX4jE48u3le70pDkZ18dsrHDC1Wy+jnv0gTmJG5sxCS925GiQUCjvSoO7ssL5+nW2LmMzJRH0gGpMX3d5wYt8WNnruE1QGd0YeB5Z72A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOfhIW+SEY7B4fBKD1Qz5kWhWmmj/tp63lASBhYHxyk=;
 b=xqtql49+SlJ0/v8v3XeQDoBcl6p8eGTbtMAljV55PMmeN5KrySA6sA9brsCJSxWzPcYVmonqZTkl3SxvnHUKl29VHZXFNVfTzUiYnISIYaby9oDy49MnRXGI4EeNc4AUUSv2uNUHkZmrN753MDqtVkhyucdtKhsqaHHa5DHgGfQ=
Received: from CH2PR12CA0030.namprd12.prod.outlook.com (2603:10b6:610:57::40)
 by CY5PR19MB6469.namprd19.prod.outlook.com (2603:10b6:930:3b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 12:26:47 +0000
Received: from BN2PEPF0000A801.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::2b) by CH2PR12CA0030.outlook.office365.com
 (2603:10b6:610:57::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Tue, 1
 Sep 2026 12:26:47 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF0000A801.mail.protection.outlook.com (10.167.245.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Tue, 1 Sep 2026 12:26:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 49676406544;
	Tue,  1 Sep 2026 12:26:45 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3A654820247;
	Tue,  1 Sep 2026 12:26:45 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3] ASoC: cs35l56: Fix probe deadlock waiting for SoundWire enumeration
Date: Tue,  1 Sep 2026 13:26:44 +0100
Message-ID: <20260901122644.634494-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A801:EE_|CY5PR19MB6469:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c9fda7e9-a00b-4560-7e26-08df08244a48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|36860700016|61400799027|82310400026|23010399003|376014|10067099003|6133799003|3023799007|16102099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	/9sGoeSNqI1war+x7OFuK8IL2XyCj0qkIFktfuNFeAGqf+CqDmcQIAJhhd2y9xggITB79BwxfGA8wCHEktQy5qvsw/MSiIEoVff/6Q2uabDlJug7aaVkwAjdXxm/prrg2bQsOXMzfgK2nq+ka0ctnO/UH1x9krPbhxbzR9n8rWzmuF6gIyawgau0gnHX67LZVJs7iyJiyO6A5OG9EM7l3uNynaxj4i8kDJJhOTcGebTBsCGfzSL5sCKXM37xkF4Yz8TMIebP+uCvG/N+h5MCEF+mGGHmuY4U6SfrP35rqWrWMbCSQALsa3rHDN86KqqGRH5+chuS6OVltxSBATILmJOIsjok+gZ7IDB3CTrIJ1Qyg0UaNaL+dYaalDQ6O1s1nqpk4dF0Dh87gk4CDbHVxH5+7wlx9XYEAAuYW2WdDBvS9iszcNRmtIWs//SgiyixnFteUHyp/9HA5VgGF/BZTHTJ3r/F/3IdR3IDI00/wda8pVeE64Nbvl+AfZRT1GIPaVS3QJ90PcOyXcHfKQzTx4jzi25BwWvuSaHaPM9LiXo2+SnCAWGxeRgsx3qEdJuHov5JatjJBiCgqMIs2i/qvy4RyP3q8ClcRBnCj+ItVL4Rhpj1Job22IZLk4Iphy6i71jo11uoq1fga50t8gp+TPi6eyQC5hsioyYWCK+9q6K0K12qtZQD94NSSLE0wrYEUdBFlLP8sVgvi9NbL14ryw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(36860700016)(61400799027)(82310400026)(23010399003)(376014)(10067099003)(6133799003)(3023799007)(16102099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6fxa05GFF7Mp83cg2Q4WSTyYpyRZTGjRfw0wcEXCq0Ij0hNKe5IlMdJ3VFu3+4oe1w/LqAAsZG2QKARE4VSfQyd00bPIbCVI4x/Vs7d70i19kawUSKCWGn6UFi0rC2GDOtuRRb9R0qJVjQRDQeOTElo4Kk7xKMa7NBAs9Mee6BQzPivKppTXPVTXDhfiKTpMLLJsphXDrtOHKgkxJSQTcxVb152AN7Hs9ududzjpQgtgn2OcD7VmW45MoxCjIatKtiioqzSVwv2YvTa8twUI92YuPwhLiYptWeAdg2gNmFl7cg6Jn3Dy8wnLpQwhihhnwgVI23A1kivNUn3VXnpClAxro1van55DVI/1F8yqRjZ9hhKJvRvJ0y8s5ekZ3xA0OJH/MX9y4gvglpm4i7AETgf9h30sFwHTg2GqP2W1xOmD5qkFKT2ZduBw1jHqeeoe
X-Exchange-RoutingPolicyChecked:
	DDg4CXX7rQb7i7rskfa5oa+WFW3ByuME/+kD2tHRzu21EoPAsIYhmSt45dTlj5lrh5W2uEj2MwCkQq3Qwz8lQtT5e1ezkYbbJ40YbkmRkyHYzldc6ACA29NHoF3hvw2lzOBC5HRGpOh8YX8PlE81Fi/PcG3kQZXdonCOo0I16AM3/tdqrzyuFSJXFQBeyGL+0TB/TxUB7dQm5OxIqsBO5A6yvVPxVL3Cw1Zh54CseGxz5wL51BZxoLVcEvS44fe0kQnRn3DYfZ8lIZmnQN9iFjB8I9OxnjYJ+Bev0rnezkpIuifa4H13jG9nwxswM4VAciW8A661kQgIk4m4o2UT7w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 12:26:46.5756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9fda7e9-a00b-4560-7e26-08df08244a48
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF0000A801.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR19MB6469
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExMCBTYWx0ZWRfXxqm8k0zCQVhc
 UZy0UTH3i5Q49/y0hT/+hQwNVli3HGjcCn1OsWFraVZgEWuCLB0v3U+7zhy9u2oduCFBCKC7qI1
 fp2BzyNY5cHx8CgYWc5C9rHtLeWqgCyUvDHGmGTzLd2FIzrHId13ORpm7jMidbFpMDCEgq6UPpY
 2C3Ge2zeHPfcBzlpQnCIZQ2pFocTPNjQkpurLuKiES1rkjwcfhyv6XSwsfD4bht6Uul1T8Dszc2
 eKZEPzt20aE+91p+TxLOloEWgjfU7wHV1k1dSFHmzfh4cpWYzKg4YjHmxddm29hwfqmzGqP5GHR
 pDemdU+pf4URGgZ1Hf1fhaCornj7/45UiOhqzt1ym5se4gvcKw/ckVxkh9TtfPOPbVtl0+3XGT/
 iOfujtesfRqER0JeNkNFuTiqhTXMYvye/yWevXsqz21OB+CrDB0nNs0QUYl4teVMrl47zu/pFkH
 v0Tx5sNZHS1xqwuplZw==
X-Authority-Analysis: v=2.4 cv=X4Zi7mTe c=1 sm=1 tr=0 ts=6a96c48c cx=c_pps
 a=3IUGx84TntR8WEbolwO0nA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=Ov1Kam30li43I9cxH3sA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExMCBTYWx0ZWRfXxlWAbYOvF2ib
 tZaOSMFfUSHtG0i4ZWOfZ1rgFvVPtYIAAORizl7J/g9ghL71MUgTcCeb6Fo1zIlCvI8XsHcUva+
 OjG2ops+jDLNuz4kTsb3AC5ZK7WR9QE=
X-Proofpoint-ORIG-GUID: -vin33ou3H6GjeKoOJ1-GeY9UFa-XcuZ
X-Proofpoint-GUID: -vin33ou3H6GjeKoOJ1-GeY9UFa-XcuZ
X-Proofpoint-Spam-Reason: safe

On SoundWire, don't call snd_soc_register_component() from driver probe().
Instead, queue a work item after first SoundWire attach to call
snd_soc_register_component(). This prevents a deadlock if
snd_soc_register_component() directly calls cs35l56_component_probe().

On SoundWire, the registers are not accessible during driver probe().
Drivers must return from their probe() and wait for the SoundWire core
to call their update_status() callback to report an ATTACHED status. The
cs35l56 driver handled this by calling snd_soc_register_component() from
driver probe() as usual, and cs35l56_component_probe() waited for
init_completion to be signalled. A SoundWire attach calls cs35l56_init()
which then signals init_completion.

This created a deadlock if this was the last component needed to complete
a card. In that case, snd_soc_register_component() directly called
cs35l56_component_probe() which led to this:

    driver probe()
        calls snd_soc_register_component()
            calls cs35l56_component_probe()
                waits for init_completion

In this case the driver probe() has not returned, so the SoundWire core
would not call update_status() and init_completion would not be signalled.

Fortunately, snd_soc_register_component() never returns -EPROBE_DEFER, so
it doesn't need to be called from a driver probe(). It can be deferred to
a work item. This work is queued after the first completed pass through
cs35l56_init(), so there is no need for it to wait for init_completion.
snd_soc_register_component() isn't called directly from cs35l56_init()
because cs35l56_init() runs in the SoundWire bus driver thread, and there
would be a risk of nested locking or lock inversion.

The work item is queued on a freezable workqueue to prevent a race between
the work item and system_suspend of another instance. If the workqueue
were not frozen it would be possible for the work item of one driver
instance to call snd_soc_register_component() which then calls
cs35l56_component_probe() of another instance while that instance is
already executing its system suspend functions.

The non-SoundWire case still calls snd_soc_register_component() from
cs35l56_common_probe() so that it is the last initialization action.
There's no need defer the call for I2S/SPI buses so we can also leave it
able to return errors during probe.

Fixes: 440c2d38950f7 ("ASoC: cs35l56: Wait for init_complete in cs35l56_component_probe()")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
Changes in V3:
Rewritten to defer snd_soc_register_component() to a work item and only
queue the item after the device has enumerated.

Changes in V2:
- Fixed missing flush_work() in cs35l56_system_suspend() by calling
  cs35l56_wait_dsp_ready() which already does the correct flushes.

 sound/soc/codecs/cs35l56.c | 71 +++++++++++++++++++++++++++++++-------
 sound/soc/codecs/cs35l56.h |  2 ++
 2 files changed, 60 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index b9118ad8fab54..890429ab0dfba 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1365,12 +1365,6 @@ static int _cs35l56_component_probe(struct snd_soc_component *component)
 
 	BUILD_BUG_ON(ARRAY_SIZE(cs35l56_tx_input_texts) != ARRAY_SIZE(cs35l56_tx_input_values));
 
-	if (!wait_for_completion_timeout(&cs35l56->init_completion,
-					 msecs_to_jiffies(5000))) {
-		dev_err(cs35l56->base.dev, "%s: init_completion timed out\n", __func__);
-		return -ENODEV;
-	}
-
 	cs35l56->dsp.part = kasprintf(GFP_KERNEL, "cs35l%02x", cs35l56->base.type);
 	if (!cs35l56->dsp.part)
 		return -ENOMEM;
@@ -1939,6 +1933,40 @@ static int cs35l56_try_get_broken_sdca_spkid_gpio(struct cs35l56_private *cs35l5
 	return ret;
 }
 
+static int cs35l56_component_register(struct cs35l56_private *cs35l56)
+{
+	int ret;
+
+	ret = snd_soc_register_component(cs35l56->base.dev,
+					 &soc_component_dev_cs35l56,
+					 cs35l56_dai, ARRAY_SIZE(cs35l56_dai));
+	if (ret < 0) {
+		dev_err(cs35l56->base.dev, "Register codec failed: %d\n", ret);
+		return ret;
+	}
+
+	cs35l56->component_registered = true;
+
+	return 0;
+}
+
+static void cs35l56_component_register_work(struct work_struct *work)
+{
+	struct cs35l56_private *cs35l56 = container_of(work,
+						       struct cs35l56_private,
+						       component_register_work);
+	int ret;
+
+	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(cs35l56->base.dev, pm_err);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm_err);
+	if (ret) {
+		dev_err(cs35l56->base.dev, "register_work failed to get pm_runtime: %d\n", ret);
+		return;
+	}
+
+	cs35l56_component_register(cs35l56);
+}
+
 int cs35l56_common_probe(struct cs35l56_private *cs35l56, int irq)
 {
 	int ret;
@@ -1947,6 +1975,7 @@ int cs35l56_common_probe(struct cs35l56_private *cs35l56, int irq)
 	mutex_init(&cs35l56->base.irq_lock);
 	cs35l56->base.cal_index = -1;
 	cs35l56->speaker_id = -ENOENT;
+	INIT_WORK(&cs35l56->component_register_work, cs35l56_component_register_work);
 
 	dev_set_drvdata(cs35l56->base.dev, cs35l56);
 
@@ -2020,12 +2049,17 @@ int cs35l56_common_probe(struct cs35l56_private *cs35l56, int irq)
 	if (ret)
 		goto err_remove_wm_adsp;
 
-	ret = snd_soc_register_component(cs35l56->base.dev,
-					 &soc_component_dev_cs35l56,
-					 cs35l56_dai, ARRAY_SIZE(cs35l56_dai));
-	if (ret < 0) {
-		dev_err_probe(cs35l56->base.dev, ret, "Register codec failed\n");
-		goto err_free_irq;
+	/*
+	 * Defer calling snd_soc_register_component() on SoundWire to prevent
+	 * a deadlock where it calls our component_probe(), which requires the
+	 * SoundWire enumeration to complete, but because we are still in probe()
+	 * the SoundWire core will not call the update_status() callback. At time
+	 * of writing snd_soc_register_component() never returns EPROBE_DEFER.
+	 */
+	if (!cs35l56->sdw_peripheral) {
+		ret = cs35l56_component_register(cs35l56);
+		if (ret < 0)
+			goto err_free_irq;
 	}
 
 	return 0;
@@ -2055,6 +2089,7 @@ EXPORT_SYMBOL_NS_GPL(cs35l56_common_probe, "SND_SOC_CS35L56_CORE");
 
 int cs35l56_init(struct cs35l56_private *cs35l56)
 {
+	bool first_time_init = !cs35l56->base.init_done;
 	int ret;
 
 	/*
@@ -2131,13 +2166,23 @@ int cs35l56_init(struct cs35l56_private *cs35l56)
 	cs35l56->base.init_done = true;
 	complete_all(&cs35l56->init_completion);
 
+	if (cs35l56->sdw_peripheral && first_time_init) {
+		/*
+		 * Hardware now accessible, queue work to call
+		 * snd_soc_register_component().
+		 */
+		queue_work(system_freezable_wq, &cs35l56->component_register_work);
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_init, "SND_SOC_CS35L56_CORE");
 
 void cs35l56_remove(struct cs35l56_private *cs35l56)
 {
-	snd_soc_unregister_component(cs35l56->base.dev);
+	cancel_work_sync(&cs35l56->component_register_work);
+	if (cs35l56->component_registered)
+		snd_soc_unregister_component(cs35l56->base.dev);
 
 	cs35l56->base.init_done = false;
 
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index 35c02ae17de3d..f7cf8aa653e28 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -32,6 +32,7 @@ struct sdw_slave;
 struct cs35l56_private {
 	struct wm_adsp dsp; /* must be first member */
 	struct cs35l56_base base;
+	struct work_struct component_register_work;
 	struct work_struct dsp_work;
 	struct workqueue_struct *dsp_wq;
 	struct snd_soc_component *component;
@@ -41,6 +42,7 @@ struct cs35l56_private {
 	const char *fallback_fw_suffix;
 	bool soft_resetting;
 	bool sdw_attached;
+	bool component_registered;
 	struct completion init_completion;
 
 	int speaker_id;
-- 
2.47.3

