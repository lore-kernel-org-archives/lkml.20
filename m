Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE833B5301;
	Thu,  1 Oct 2026 15:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867697; cv=fail; b=t73kXbR15EIXszVgmIi8ejxN2oDXCDJKDZqvA8vT2XnDPu3NNGQLXOLgk0TB3YXncgPo20JGA5xdH0R7Gcw6lKWZ+4ZWWOJP/sZGGAxDbxLsKBv5LmShFUAoTyoPuQbCvnhhA/zrP+/9e1lUJnw0gTCl+y1rJhWHEFg+c722IG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867697; c=relaxed/simple;
	bh=TCdncEkL8jqMEesj39+xSBo4UQVevWGSTEWyjV8wlHo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pocs1mytpYbR2UmGIxe33q8pfDMbD53hTMeyLc2RHZvGFyXOk7wu4hn1lHLPHoseoeS7hNKC3LUSy3Iq/f+l+oeD3ICZ/F9YzSeLncyf4UBMYVIpO/rK2hVSMX2j6P8+hKJ5Ek1NJJ1SjRxsKmSI7KGzh8+aEYGb9to2PDArGzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Y106Wn4a; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=x6K+nSPr; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Y106Wn4a";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="x6K+nSPr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691D26JR3843571;
	Thu, 1 Oct 2026 10:14:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=DfIwWb66FJ3hASPm
	KqVNuK+nIFKuBybw01erJHIIIqg=; b=Y106Wn4akG4rr4kK5YqhglM3HnSn32DI
	6/Yy3EwCMT9uJ2Gn5L+vFUdE813GvQWRWLFbBmzkEbggUQouSsvBD3lzO+b7kHbg
	d6FVA6tD5YfF3wFQpgPck8BohQk+Icsm+uIAWkgjlBXnCWV/q80/oQ+hQXmx49sX
	t9kSHWeHEJ2XyM9VqlzqOqDH7qEFECTR7PUH9UMQJqf3rna9orMWbUhAOsCBioCV
	MJef5cSmMy0T0Nkfe2twI6cxG3eHzURZLfWEg8FDtTA+3Xzo7zfw/2gMcTNq3zHd
	nksJptMCfkfMBZIccnqQYIHYFEFCU01Z8BiBp9+v0ayHgVjqZFjIvg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021086.outbound.protection.outlook.com [52.101.57.86])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4h1gv7gq1g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 10:14:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cez2YJIJaMGT2JyRHkTdAFg3bxEV6NnVNvDVoz6FjpQpMmFYTjcKdHWpukCT8e7RLbawWCkDxwC6CdQALf709VrLgmo73esr+fZycYSbgJlzhZIXWsoaavxtS4bAo8P61D3zsCHaiC87LWm3wsVsIk8WemjQqySO8zn1ncsBpMIJXOG3W59yfHrDyf7nfkzjBoLjyntFUugRCQ3NmAEAtTBVVzTTbRwRUTT29ui9dv9RGj7Sz+UbKRyTsxSAAEwVINww1BiAgV7spzzkdk88oWuw56tAdM7HC5/3zd31I6pVlmtXQOpoTfBbIMd/TVm83Js1dhqY/UZBPSW9xORd+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfIwWb66FJ3hASPmKqVNuK+nIFKuBybw01erJHIIIqg=;
 b=IJof9EcOiceHou8XoXh7WurpiGslcJyd5Ed1Lkcs+iWFYmlfzrBKs7L90AHZLt/rPn7Y7mBHW39f0ujp8D3p3B9mY78PLn+CZQ4CH1lht+dE7l3szBMKffSfOG7fQYDHjUt6zw6pUL4rLwmtPg9UT7qF5alpaR/THDfurBnMyL4s04Ivvr0G+LpFhH4MYr3IJSLNJ0wzgyBQ8X3h6obBFpv0PYf+xrZ6DGC2+dO8TYu+7BVgK8DbYYp28d3kwwRNuYi49k9bmzHAMBJtKscO2qIWp5EZ8m2KZSP0DdVhIUZITXI6HDQqKp682oPGyp152du9Cx5UTPjYmzQov4xjIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DfIwWb66FJ3hASPmKqVNuK+nIFKuBybw01erJHIIIqg=;
 b=x6K+nSPrK4gA052zzQAJqsYKbxeNJsxCBU9+FY78b03flKwkjd5uSWwQZS6Ja6FutEGr2pTZOzWgKcnjnxJuQPUKgl9RVqtW5BD+1iVBrE9DEy8ZIjEH0e6rUOmegLZCIr5JDST1rAOoApCZQzq9Bob6wkyhWU7fxhh7Da4SvuQ=
Received: from DM6PR02CA0110.namprd02.prod.outlook.com (2603:10b6:5:1b4::12)
 by PH8PR19MB7740.namprd19.prod.outlook.com (2603:10b6:510:25f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Thu, 1 Oct
 2026 15:14:38 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:5:1b4:cafe::6d) by DM6PR02CA0110.outlook.office365.com
 (2603:10b6:5:1b4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 15:14:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Thu, 1 Oct 2026 15:14:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A424B40654A;
	Thu,  1 Oct 2026 15:14:36 +0000 (UTC)
Received: from [172.17.0.2] (unknown [141.131.82.140])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7327882254F;
	Thu,  1 Oct 2026 15:14:34 +0000 (UTC)
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Subject: [PATCH 0/2] ASoC: cs35l45: Adds support for LDPM feature
Date: Thu, 01 Oct 2026 10:14:26 -0500
Message-Id: <20261001-cs35l45-ldpm-v1-0-545787a5afe5@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANJ4vmoC/3XM0Q6CIBiG4VtxHIcDQkOPuo/WAeP/STYVB8lqz
 nsP7aTaOny/7XsWEjE4jKQtFhIwuej8mIMfCmI6Pd6QOshNBBM1U6KiJh6rXla0h2mgVp9qg1w
 qrYHkyxTQusfOXa65OxfvPjx3PfFtfUMNl99Q4pRRVABgmUItzNlPOEY/B4OlcSHMsTR+IBuax
 Ack1A8kMiSV1By0xYbBP2hd1xeT5QY7/QAAAA==
To: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790867674; l=2011;
 i=rriveram@opensource.cirrus.com; s=20260821; h=from:subject:message-id;
 bh=TCdncEkL8jqMEesj39+xSBo4UQVevWGSTEWyjV8wlHo=;
 b=xQ8JHCuvxo89llbNAU3RsEbvFiRddHF4qXqOA6vLg+5yW25S4pKFOj/hoSQobZmWJSMJduXCe
 HqbC7a/XROFAmwX0cNC5zlfJ2DGubmWtH8XliWu8lH8rFqUGXu6jZHP
X-Developer-Key: i=rriveram@opensource.cirrus.com; a=ed25519;
 pk=PWYAqW73jQepp6ORjx3V81remQilskf6ccMx0Wc1wUA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|PH8PR19MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: b315ef4f-c2b2-4fdd-6073-08df1fceb582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|7416014|376014|36860700016|82310400026|3023799007|10067099003|11063799006|56012099006|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	SxpF+JUn7WOvTrxRk8jeWlqnqc/RjtxmjSTZputCaXfvy/j8DsYnvpoA5iPg6EIsZ0HgZHxkWl3cytVdeNTK7e1077MGyKyoRuAeO8GiJuI24QnI9uzN2YBr58+3VDJOwBWi7FiAkbL3I1Q8j3PY2X8Z961TLeZ25AehHJPn71UZrRqb6X6aAkm/qb6x15J9s/1xmf9mWTvAaFLczVkPW/iOp2c5bVcj8qin+jyfF3qMqliuaLgJd86UbHMnoE8aU/A2xqjIGzkdVdgUOkRssZ5AKRjX7GO2WQn+8Cgng24iqudLEcBkWVUiWO4ShvGRKOgxOI2UC6zj+zHxnC9cejs33tmF5bxSJy7Qqh2M0gQtB+WlqaB2rrOxqXW/oFgac0BMP1pltWOrS7J10P77vZBdc50nr0SRZ1WfDteV9RJ98EKRigOUfRr8w2X++63PtjcMJCPRx9RQ3/wENRy+eJlt2Leu4gxIyPEicSgf/xBZjSn1TmY9UclDzpLgi8Q7a/bcrPSfbcU7nztr/7MdDfXIvmAB8zn5XdoEjpRlmua+Cl3Qfr3FNGd8+t7n0iZ0HniiEE+vv6LbWsrfPRScy5/1qYzDWlr2xGsKBV0+zlCEb20HpuCb09IgbxV74oE4MBTKagm8lQpfbXgmA5mku1OjRHvuMfHAfhZmF0/qW3AbYpFdhi0/Cq/R4srxGwb6dhpoO21xUepyG9fLdXN4rA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(7416014)(376014)(36860700016)(82310400026)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	v3fV46bs77ohu9cBaNtdtRa9PoSvaxN7hIqw3od5RTRC2Z9v/nRlc6dhyhZKZrVEu+qNo7thd+5MwK7OdFT9wjnuWZ4k6bY87PzsJAZ7dbaWm378eQTQiTdim4KmKqiN9ZcZ6vTffDF+k0CCFDLnVDOKY3dyqu8tZz8QZL90AecigP9ekxWwp5Hg2M/Ttg3GM5PSoppw6KmbwcxHtanyrcXEs65Bj0ZM3vjtT9OK60AyCPsjxyiEcWNDoXuZoNSskGzDHasgjbGPep1+d5k57ELHUX6b+xmvzJmBH6z5CzliJNva2oraF1EBSHwepBgzBWhtJCxFW+i/S628SoFJN5PVPMzgNzKdCIxHJzYmQy042Nm7YEmxlaYb9FRhxpd2zpEkv5gxWZlRXRkmZ23eKVtTUeY+zjE7UpimzMrMF4/OEB4uPAm/TzAkFJtYatKd
X-Exchange-RoutingPolicyChecked:
	dGlWkwWS3x9OFiXJpUqn073+hnUg7+AJuKe4QQ3J89AyaErZSm1ygEpqmM20rvHtNRIMMMOqhNMuxN3LPPvq+AdYHLOAt2zLrGAOTKFs5kHE2S1xGUkhIsb5fZor0k+vWPyhb5VioF+ScbEs6bg2IRhe6DEYlqI13qIAW7+EOLFm8sq+1lI2iuwpOGl0ekYG4jIhGZPdqqtS70F7AGp/ZqWndlPG9QE17WGxWHyYGAlyKlxkkHGBm6NHLP275P5QjUjYRSfve0rf1ZalsZlhxDt+eMX471c+vVJF0FfIvyMtsU2K2bApBgf+8BMg3G81eaV3TWFTBUzA8c8N51CnfA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 15:14:37.6569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b315ef4f-c2b2-4fdd-6073-08df1fceb582
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB7740
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6abe78e3 cx=c_pps
 a=h6WcP6+I8dJy5ByhVghsJg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=iox4zFpeAAAA:8
 a=TeXvpLUcEHyDPP9jO_0A:9 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfXwJPPUHKWnE51
 cZXGWrNKYOVtoZM9jiMkhEyrpJhHhLDbwJh3A5WX5Zej1AmEu+q7JqU+BXuTyaRwdmHTDuOGSiI
 JUODA9NsKzVeLRwcv6DHaL8wj9dQSJe0n657SKUmvcnq9SXd+JfLs/nY/ay1UnPh8fPubQ9HpAb
 Dit+UpQXUWycao0T+ueSfBieUem0+XoOlPowSRM/Z5qdmSfPz8R/reIRV9wNKYWT07ayyNd2prN
 w2TRh1qERxlmhtAUK9dhlJearSB+iTQwx7FQOkt9uG4Q/Z4E7gwYw6FusSH4Dp2lIUrAiLl+/Rx
 d86y1HGuK4Tu1T6YkESPaeVIrv/bZk1pGtzryUgY/+yOerOHxpxR+n8ogAYwMfOt1Q8NqQBJvpR
 t8IBVyezHv+KyUBs2OCE7TpuwKnp0AEphFAcPG8tNxrBrgZUUtrpiykp9TUc7rUzxCCWPvSsUPB
 6dqnIgM/RpkreacfHww==
X-Proofpoint-ORIG-GUID: iLDT0unIOVcBPuTjM47cYxzrkFD_ykLd
X-Proofpoint-GUID: iLDT0unIOVcBPuTjM47cYxzrkFD_ykLd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX6KPCXE2f+jzj
 SE6LgVmF2LqmTo250gNi8ZSVVe/qsXpNhl1P/gb9f5/edJA0tgwHj6ZviXHlND8NPYuMpNLYM7I
 eGmWvC9NeYH4a4alcN/sZC7zjMhgR7I=
X-Proofpoint-Spam-Reason: safe

The CS35L45 has an input signal level dependent power
management (LDPM) feature. The feature is used to reduce
power consumption when the amplifier is playing sustained
low amplitude audio. This feature is made up of two
responding groups each with a distinct threshold level and
entry time delay.

Group 1 can issue a low power request to either or both the
integrated boost converter and amplifier output stage
functional blocks.

Group 2 can issue a low power request to either or both the
VMON and IMON functional blocks.

This patch series introduces support for this feature as
devicetree properties applied at boot time.

Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
---
To: David Rhodes <david.rhodes@cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Cc: patches@opensource.cirrus.com
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Ricardo Rivera-Matos (2):
      ASoC: dt-bindings: cs35l45: Adds LDPM settings
      ASoC: cs35l45: Adds support for LDPM feature

 .../devicetree/bindings/sound/cirrus,cs35l45.yaml  | 86 ++++++++++++++++++++++
 include/dt-bindings/sound/cs35l45.h                | 27 +++++++
 sound/soc/codecs/cs35l45-tables.c                  | 58 +++++++++++++++
 sound/soc/codecs/cs35l45.c                         | 80 ++++++++++++++++++++
 sound/soc/codecs/cs35l45.h                         | 30 ++++++++
 5 files changed, 281 insertions(+)
---
base-commit: ce6fa61a2681c73b48123bace344d984b917e623
change-id: 20260825-cs35l45-ldpm-fa76ce148aad

Best regards,
-- 
Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>

