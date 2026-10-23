Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792738409;
	b=L7iGpJuj8wl+Lcsu05Hd+/Pn2DIwcckPtcFo5fSW10D2MhvzuW80XRxdy7wGT2G1yX9D
	 Uze9NmcV2H9Fsi87Sc/2JlrEGAlOf9zuA0Kr69ctPZ3mya2E9zMcp8W0dc7f+W/eGqqE+
	 nTKnF1n7372YOAq3Nuea6sGQy1ppbvEzUelJKk63XtBVg6GIckKByC8ZY82/QRpBh528N
	 pAS6sZUygNWMxpml7IKNChXbT5rrGPh12LVK3jcZPnaUeesdzIvFHJGQ8Svn274Mf1gor
	 xqPPONvs7YD5ErDxwKmDkYlQMhRnuC0o/hTXLzWB9dNS4jpU8AlR8VoF7kOFhJaqfog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738409;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=xW0t08T3eXO8aE7D8JUTNr5x7tETOmwjFZgq1YBq/sI=;
	b=KRKHZ0fLYRJYWyfiqY5FophlaBqVMDnsS+fRHFy89KZZVFcdgTr08ZLO+SqAlYv7wRaY
	 E7iS+CoqPEHhfxfJqYX3fQpGmkoLJbucTWZduP6bS4ptuG/4D+ZoXHZ9eCUacNKh6DfA9
	 7xZdiqKSxXumvyonGQjSgBB+wj8WF1z6k8UCH0ta0IC6shRL7Dmqe1nZRYd6IHZW0hX3L
	 YC26nuEnh8hrOBz3VdC7kUBUSSiKsS6ZdfTPymtO4ENCIzDw6gKegvQkMQT9E8N9CVbxz
	 VRN3FjMExzx7BTs5a/uJar79giAAxa2DyRMW3xcSLpquqVa0/0cMVGlIlywtpDOy/nw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="VyIZc3/k";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.27
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010027.outbound.protection.outlook.com [52.101.56.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B06606A31A;
	Fri, 23 Oct 2026 06:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48B06606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VyIZc3/k
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqusxnB28Vsk7A9FQXxp1bOJO+Fz1mRqQo6hwk1fCKA/RC9eJT4zQaW87UnpnYEPyWa8JdxJNS1Ar9jFXJvvScZJHfj4g7qlJzqIHLioJLNravzSR5LzjxEIf0MqpZIUNIjiEe3Wzt6mXZ1QUKkdJ8OPVN81qeEZKd/myEG4UwZeAU8jE4m5yBQ3ZtTbjo040Jh4abZl3DE49AKlwnthEiO4Pemv5mGJVhI/Hxhvcp2v0bqySpw7cuPz4eponmr+vRdO3NYCtHs8CBu5KfN5t38VV+7+btmDzvOyrP6cQDEvIez4reVHBm+7oGzVnU84uAtEC0gsC+/2+8vZPvb4zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xW0t08T3eXO8aE7D8JUTNr5x7tETOmwjFZgq1YBq/sI=;
 b=wY442Bh4e5a2jCgPC7Iv3N9k//9nOHE4x7sPjMuMxBlwxg6oirvWnkl0cGGb4fuLZnPzwEkfLWN9iQbZvAtkyIsrKCl2ONI8HqD1IDxE75GieQ8kNOaIpexY4+I60vw2Imgt1pm35kNzmhcMz6Re0EgBAACjpp+Ck+6FrNigu69q5dfjAkKSzDXsFTymfoImGY5tX50Fc9i8c7DAAJpIVKorG27NU5OrkIChQjq1MrXSizw9PAXXYaG/49QmxIAi3T0L5vtie2hdFaQEYKLBDnCr5YEmq+7xvEofIxPhIViyJkSjk3jvxyJ/gE6rftJj/jhjbSYPJCG/LyhLuNrOjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xW0t08T3eXO8aE7D8JUTNr5x7tETOmwjFZgq1YBq/sI=;
 b=VyIZc3/kuIr9RrrAGXltvDttWxNUr1KCvMROr5NU+tziP2KO0X/L3wVHE+iEmHfvth+Ie6Ngf4zadfB+wQmsYCcb9SXtbuGko9pbVMu3d5QBoslSQXT2tgkmvw1kpAn2ZBybZ+WuaoAMqs88lP/RYi2oVQPuCJrLCNcgfSPPrxI=
Received: from MW4PR03CA0316.namprd03.prod.outlook.com (2603:10b6:303:dd::21)
 by PHXPR12MB999255.namprd12.prod.outlook.com (2603:10b6:510:3ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Fri, 23 Oct
 2026 06:53:25 +0000
Received: from CO1PEPF00012E65.namprd05.prod.outlook.com
 (2603:10b6:303:dd:cafe::7c) by MW4PR03CA0316.outlook.office365.com
 (2603:10b6:303:dd::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Fri,
 23 Oct 2026 06:53:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E65.mail.protection.outlook.com (10.167.249.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 06:53:24 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 23 Oct
 2026 01:53:24 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 23 Oct
 2026 01:53:23 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 23 Oct 2026 01:53:19 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <pierre-louis.bossart@linux.dev>,
	<yung-chuan.liao@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <Vijendar.Mukunda@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>
Subject: [PATCH v3 00/13] ASoC: amd: acp: ACP7.B/7.F SoundWire machine driver support
Date: Fri, 23 Oct 2026 12:20:36 +0530
Message-ID: <20261023065216.3473883-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E65:EE_|PHXPR12MB999255:EE_
X-MS-Office365-Filtering-Correlation-Id: 90d8e44b-a0f3-4066-ab35-08df30d255a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|376014|7416014|82310400026|261021123027099003|261022105027099003|261022075727099003|56012099006|11063799006|261009223027099003|10067099003|18002099003|261021121427099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	eYpOWn8i6aD5BNRGq9u5idhoupsbH+rWPxC0987sFH6leN6J0UfANgvN+kbkFioqsW6HGGTrD1evvCFH7q5Q8c2jK8qBqF3ilEORNtmjKinxM5e1vM6oY6mn5kprcXUd3XOdSoOOpPo9zlHMb6nKPjDlTh12mD5NaXrB2qkNg+Dg2H6G96BIbj0kdBwlUMy7HknJlqdbbMZfmLhMGjEYgeXzXMv8ekmtI8NroWLVLZcPV7oz3WcT/d0AZ0xPH0TIPOncUtvLX7wPLgjWnppdu0A/oU67QQgN1BZOayu9qRmmoKbcCHnP176ILX/5i/mYHe8YQ2ZtNoLIlVGdnur9qIDgtzLYpNOTkw94WpbESbE8RqujZuoWzoMzLJpTo/+euCljy2hrW3fC3P2q8l3A2BnA2BZqw1LmPLWsBzmelW40MfkRFBZJgoP26EU9jTwrWydK+cbruuSjBhAP0RfyxGGngLJ89o62NmsOwXlOacf2GJefxJ8BCk/NuHnx1qMVDqPfrOT60VYtt/x2QDlyIr79LYG6rqv6r4mU9r4FPfsIjFo+l34QG5zulYklXF6IAIyj4vBza7kMpxQOxtnrdWjziDyEZQSsMbUWJW30sfACYhbldxYVzHvSVKUIc69149uFp2IJYyhncxEVHMDQatgobUu/MQ5TFIH89FHVv7vJ1WaDxQ8xXn0JEys1zYp6wuxriwYcBOjs7UCLZGyPhQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(7416014)(82310400026)(261021123027099003)(261022105027099003)(261022075727099003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(261021121427099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QDq+6cMEd2ya8jEGB5HgXyzFfkTpUAycQN/SCOJPEoTI99B73cysmvXZK5Nf3/6o4WM+rTiyffdZYPLaXw9pplSVxq1X6UsGnTHqUEmw8Ta6fbKvjZbCWfn3ps7x51I1LPGWndbEJYlF2tLy59xZuGgvTwpfsvmnnluGkQojZeKkWraRDv7vXeYm2ehFxkDsKSzSnpn8pj5zdhACTdmeJFvslS52RMSEjXkvq5hSNRQ0WNAKZZzni79oE27SJAnYzx4aZQQaofu0ipJuP4unXc7H89W3CiRtdUpu8bKH27wrjAjZc3WyHn/ayGf4VXxtP6baZSsRa1UZgOZTTyyyi3xII5LqjcWsrZervj1XUsZ5uRZ25dvKLwWNia8E4mdj9/x0q1FmwyP3fAHzIxNP9Asbn/Z1/pbJDuzqSrSksI5Mf4SIAy3zeOCHWuVuutYO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 06:53:24.6994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d8e44b-a0f3-4066-ab35-08df30d255a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E65.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR12MB999255

This series adds SoundWire machine driver support for ACP7.B and ACP7.F
platforms. It extends the existing AMD ACP SoundWire infrastructure with
per-platform CPU pin ID lookup, PDM controller selection via ACPI and DMI
quirks, DMIC DAI link and components string handling, PCI subsystem ID
propagation, and ACPI machine tables for RT721/RT722/RT1320 codec
configurations on both platforms.

Changes in v3:
  - Patch 3: update subject and changelog to accurately describe the new
    PDM controller selection infrastructure being added, as pointed out
    by Sashiko review tool.
  - Patch 5: fix commit subject prefix from "amd: acp7x:" to "amd: acp:"
    since the change is in the generic ACP SoundWire machine driver
    (acp-sdw-sof-mach.c), not the ACP7x-specific SOF driver.

Changes in v2:
  - Patch 6: simplify the DMIC enable condition as suggested by Pierre:
    evaluate the three-way boolean once and nest the ignore_internal_dmic
    check inside, avoiding the double-tested condition from v1.

Vijendar Mukunda (13):
  ASoC: amd: acp: add ACP7.B/7.F SoundWire link count for machine driver
  ASoC: amd: acp: add ACP7.B/7.F SoundWire DAI link support
  ASoC: amd: acp: add PDM controller selection for ACP7.B/7.F SoundWire
    machine driver
  ASoC: amd: acp: log ASOC_SDW_ACP_DMIC1 quirk in SOF SoundWire machine
    driver
  ASoC: amd: acp: enable DMIC DAI link based on PDM controller selection
  ASoC: amd: acp: move ignore_internal_dmic gate to DMIC enable
    condition
  ASoC: amd: acp: add DMIC components string for SOF SoundWire machine
    driver
  ASoC: amd: acp: set PCI subsystem ID for SOF SoundWire machine driver
  ASoC: amd: acp: fix MODULE_AUTHOR missing closing angle bracket
  ASoC: amd: acp: add ACPI machine tables for ACP7.F SoundWire
  ASoC: SOF: amd: add alt_machines for ACP7.F SOF SoundWire
  ASoC: amd: acp: add SoundWire machine table for ACP7.B platform
  ASoC: SOF: amd: register SoundWire alt_machines for ACP7.B

 sound/soc/amd/acp/Makefile               |   2 +-
 sound/soc/amd/acp/acp-sdw-mach-common.c  |  36 +++++
 sound/soc/amd/acp/acp-sdw-sof-mach.c     | 103 ++++++++++--
 sound/soc/amd/acp/amd-acp7x-acpi-match.c | 198 +++++++++++++++++++++++
 sound/soc/amd/acp/soc_amd_sdw_common.h   |  32 ++++
 sound/soc/amd/mach-config.h              |   2 +
 sound/soc/sof/amd/pci-acp7x.c            |   2 +
 7 files changed, 361 insertions(+), 14 deletions(-)
 create mode 100644 sound/soc/amd/acp/amd-acp7x-acpi-match.c

-- 
2.48.1
