Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31167472072;
	Mon,  5 Oct 2026 15:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215671; cv=fail; b=WRYPfakalr5BT+l/KJsajR5Xfo5U+wrTQuiVgs4lwq0ksDjKb2IPUJyptKiKkun6dGt+ZTDtB+Sgr4hR7QqxaBfxF8WC7X3WMKy1BMTLkO5+HnTopWkvBBglBlOghr8jmLIqxz++ZhArTNiKLLJt3LQyLgZCUsHHr90NV2wPQRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215671; c=relaxed/simple;
	bh=R2q4Nqg4JTaooyH30rEJp+gYZo2u1v6IqSdRnaQI8jM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XdOUvfXHMmnjlMsGkx1Zeyoaxqer80mozg+G6bJYfIgfLApvLgYO/KEoVGKpBE4D8PEMrfbXLRRBXdNmBR/Rv//KQMmmGqfdJK3QenHUWGiz6E5g/WFRaPsLEaOAdNE5UE9Inqr3GZSS4JLrZuzJDq2Xi9vKUOSjZv1QZgTaFLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PrbtaqTD; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=p00Y3C72; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="PrbtaqTD";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="p00Y3C72"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695DUpRw1788976;
	Mon, 5 Oct 2026 10:54:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=BR3jDmCBIoxB9jR0
	UOtlIrxqvWL9jEFzVQviVb1s4L8=; b=PrbtaqTDaGNGFAQeYjUSwjWrGxl7/WmY
	yr7xNWncUowyt1EF9x1toBHVfXTasE8ZnKhmxlICvrSws6ujsvtAZxQXbIWPpxX2
	BD0c41OV0piFPXo7dBvwblj5CywFFQ6V1aguNj0v05MDXfMZ2Qs6vpwFaNU/CB9f
	eOZjeZ0jTJCBtK6Ni/UTjdT7tVH2rCArTjSXgyS0Aabu/eyrjAC+63PlX/PF5oq5
	27Zy+8K3VxbY65XNzukUS8UUwVLZk0cjvR5tF95id8SjCKw7JHcF2uwsKO9Lw0rv
	YD18JjIwsjzFLBkA5jgdI+huP884f/+rPWezDLiuISgt6mOnXDTvrg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020097.outbound.protection.outlook.com [52.101.46.97])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4h2x4ha67t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 10:54:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6M7TSLVx8iMuqNRS4BZeReIWehQDm/IDxtP2W4OWaOR0eo/nea47zAx/NGil3V2RqIu0RAkMyavRqglbX/vZpM4XdBtfqjkIlpboo9S2BmW7IdBSssjrMe0Ed29Fryi2kTna/6jtDniSXwhgzd+G4aN49q4bGUJxge0Ph6SZv6NbTJqpMYaDmUx79UFbWaeykMrBoznxLEqBKlVntKpRKzI3MsO0kyxmjIN1qG+4CXm5+EMwT4DRXkaapGgDoKVN+cVAv8XsbGgRYUhi6nNBjye3SG35s+5aods/4VkrF0BoekJohvt6uwu5LpmAjUF8PDNcy5QAUw51T7xahn07A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BR3jDmCBIoxB9jR0UOtlIrxqvWL9jEFzVQviVb1s4L8=;
 b=m2rh30eS11XK4ZDxgW7eWvdVK7wEHdxEq3UyMicztv0r68VidFVHaAarYAz2uKdO37m1ruR9mGfP6rHKldwUrGpXmpbJ66sxNFjB3xYsUS7IrPjsJ6gIO3b/SPvsdHTycqvePBn+dfTeyg8+UAb+cRadkUBIu2TIakH5wCSj79itJes0NPK3+czxwlVUlFbbUk1fgF4VdfKO0b6Ln31cxpKjiR7BiD6gez9CKsvoLcyk9l+LzKMkyfifltzMzaZrjmvW+/inf3TRVz6JExnIXbHxR1x80sOsrtHPqfpmSKshKLLrpLq2rPEuFtcaDdkY1nMQ/WCz42l6B8Ww1lpu3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BR3jDmCBIoxB9jR0UOtlIrxqvWL9jEFzVQviVb1s4L8=;
 b=p00Y3C72xPPnvucDgKtm3yfmBqtLFljaIkJ4OyT9UMCu5EF8pC2+nZHPmJFqY9qDGRCBstok7ehVNcsW4Fkm3SgwebxWGToNH4PbWhvKyeHjjpRMRrkzraaxiHFm5mXTzfGLlpV5aBgku6uBMjhpDPxHpRikLX+rhCy0nn/A9rc=
Received: from MW4PR03CA0332.namprd03.prod.outlook.com (2603:10b6:303:dc::7)
 by MN2PR19MB3998.namprd19.prod.outlook.com (2603:10b6:208:1e1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 15:52:38 +0000
Received: from CO1PEPF00018860.namprd02.prod.outlook.com
 (2603:10b6:303:dc:cafe::54) by MW4PR03CA0332.outlook.office365.com
 (2603:10b6:303:dc::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 15:52:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF00018860.mail.protection.outlook.com (10.167.249.249) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 5 Oct 2026 15:52:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 95E19406544;
	Mon,  5 Oct 2026 15:52:35 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7CDF282024C;
	Mon,  5 Oct 2026 15:52:35 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/2] ASoC: cs35l56/57/62/63: Use the correct SoundWire DP for feedback
Date: Mon,  5 Oct 2026 16:52:33 +0100
Message-ID: <20261005155235.1386525-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00018860:EE_|MN2PR19MB3998:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6ce4ed30-6917-4134-d14f-08df22f8ade1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|61400799027|18002099003|16102099003|10067099003|3023799007|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
 nbQgp7V4RQihuUuHeC0lhPi+JarFwiR7uVim3RleeVE2CNoEoXkj+Ba+kKStwubd+2phX4mTt9y12kBFQCU1SGNZohK6FsAku7tC/478cWgWEEMObmxnUxNhFElx0IARjINXi+Cjoxbz7XZMY6qRdTYZ5Asq5Oxm8jud3bLgLE1ggaMAaZEIeuxXEsMfj4jHWPXGbCnNtIDxEx0oRTF1ufkODpUj9tv4aBF3wDAleU/f4YQwfFlhfVkySX4CdYkfx/Zahp75AsrX/H4SIbdYcg+8injno7ksvgUM6GAPLbNWfDzsLTAeRYX9f7HfaaEbHTIYaRuh+6ACZJ+Pyk0IE/N7xIjxIrNKaEwIh0kdZBwila8f3E1t+kf/hnynG9r+c039RvtAepLFG+hNe5kwIMk2jwEzvkB90QadRn1cU4a7GUIgYaUswxAl899zrJrjPuwwUlTAj+qZyoVbLwypUPjlL3XnkpRJoBNeHKeFwLvmLYcuq7ZjZCoP/Q9Z9/+NmqrLFIPDjolTOV5c89D6dXSIWX0FW17i6DbgfBfBC//nv+cfAzLAQ+JMpJJeNGhzQsOuzovAPar+BEsH9J+A4zMGRPQsLvCdbO9BTwrfT2ARTmmVSC4/kLrqOaKv5cGu5gp2BAuEX3bQ9sGm1OHHGjr834wEy+HphZ438H3sTN53tZriqIgq+Wkbwg7Vf65a
X-Forefront-Antispam-Report:
 CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(61400799027)(18002099003)(16102099003)(10067099003)(3023799007)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 K3cG2tZMndHYG1itYOavRuDkyyUzzcPIxLsitZK9smk8z5wFyA1By7FSckprM8JZsqHawSS9hgnBiNwVcwNchE+E78Dzxl/Vu+N2M9VsdkFoXtFb1rnZI9VQkO82wb31pQBOSrknT1JsmgC708VXRyFKZyk6DWWoXBOYSbVvF0uwsSw2sAhFr/a1z/FMFEWXsm4VQHS97vr1wt8lT2CK/VKNy9HsiAJSimiNSvIvb6nyTbALvr6WJ2mfjx6xP/TNfsDMzx+hhlaeONTkYSxwgoUWb9rYyv6YwNQkJ8r9j/a+8lAVXYf7h5maCbqPG6SIRramNUNLMYijWz1z/Bhu0lFXBfI9477iTqJn87CGgrqp5FQA9KNgz9Wy3LDAbB0m4DbIQhmDy4jMjuOb0jzWqKI9h44tORgkqLaTHMuoLbLdr8qQoq4HQdaYnLD8czUs
X-Exchange-RoutingPolicyChecked:
 l+Pg4xTqTiMmGfIJEvjRfZiIN/3WumaEdyKdBKRKTeeOVdBGlRxSe1iXcaur6OXjBJEbAkhGIbS3F+lM2wjfdYMn8nuAmgz80p3ngNNDNPE5tAqvODNBQLBWMTTzYHFjuH4xDiUyEzK20dfHS9zV87oAOcVRT6FDFD7DUN54QNo3GpokjdMOq9rerSGhKOH1wkSFsRFUl0NI28s5z5El7UEPo34TQN0DRtW0XIX69uPscm1JSj8Xjxlpu98sl7TZB/yRglVPYBbRPNJ7WazxMLUacfn3rIJTwpc0qzD7cuHrHSgLkNlIJF4cpgjOuhmcj+Kes7aTgo4N3YEgzulK9g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 15:52:37.1238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce4ed30-6917-4134-d14f-08df22f8ade1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00018860.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB3998
X-Authority-Analysis: v=2.4 cv=DuLDa2/+ c=1 sm=1 tr=0 ts=6ac3c832 cx=c_pps
 a=R5cN8vbp9YvQ/U9ozU3BWw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=AR502l-gVjtyVmiZr24A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA2MiBTYWx0ZWRfX3F9DIhUQ2sYD
 pJ3rm9ByFTxlzIXRKmfcWctaW9WvmLAbb5GipRElHZ9PApwaSAUFLm3YvLOt2qfa3UyPfISuzNo
 jJ2ulBUAQ5706UV4VzvQKjVe+/Pkq3pNSiFLTBisN8tG4Wenp+5ioA5h5TsiSD/lI12/14jZwEU
 FmKm6SEqHLih2lEU4zVnlcspIxkGog+PSCsESPKTS/s7cBe+Ko5vi2kpaXwPaOsfqrms5H9Tvs2
 fKDEEa19pHb+Mx8td1CrGhC9swnXglUnKvm/YBpWLgMuulSoOKlLslw0WBdzUMoqX5WRRyZgh0F
 UeWeyHJXXEa6lI6v265O7Ltsudx+LWyr7lFjbP/v35sn8tmPjSbI+/5TSbQzK0QAjHEfJNWAOfM
 vmDs+pj8bpwjyDe8ajYyWuzjab+GwRGJj214B0eYrB2IINRffHTBQyl8PZ2zCemPSg0wH0Os+vq
 z4Jde9D2SLm5wfcixXQ==
X-Proofpoint-ORIG-GUID: gbqBA6ZcqwcvmedDTlwaJR04Gl2yV6CT
X-Proofpoint-GUID: gbqBA6ZcqwcvmedDTlwaJR04Gl2yV6CT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA2MiBTYWx0ZWRfXx1A8Qu5uOe/4
 SzD4cvdeUsXyx6nw9VJB9HqpCsTG03stfJPMfTpgfyhK6XCiCC0wMbYC947BA91LDgQbIEi1dHG
 2sCwZAOrqbC2IVlvyxsDbqKO0RSbRCE=
X-Proofpoint-Spam-Reason: safe

The amp feedback path (AEC) was incorrectly using SoundWire DP3.
The firmware outputs SDCA OT25 feedback on DP4. DP3 is reserved for
SDCA companion amp.

This series adds a DAI for OT25 and switches the sdw machine driver
to use the new DAI for the feedback path.

Richard Fitzgerald (2):
  ASoC: cs35l56: Add DAI for SDCA OT25 stream
  ASoC: sdw_utils: Switch CS35L56/57/62/63 to use OT25 DAI

 include/sound/cs35l56.h             |  1 +
 sound/soc/codecs/cs35l56-sdw.c      |  9 +++--
 sound/soc/codecs/cs35l56.c          | 54 +++++++++++++++++++++++++++++
 sound/soc/sdw_utils/soc_sdw_utils.c |  8 ++---
 4 files changed, 66 insertions(+), 6 deletions(-)

-- 
2.47.3

