Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793970556;
	b=eQqJd7yJkOhbSL+dyUBso4UinQLzz8WYeyRSlNKTzQwn1wixx5gmOdduGtrgbjJpNryR
	 153C0gxrrozhWq2+Pdj1t4fYgTeZTYq2HgPNFFgHVbGY9x3ZpGoERt9LneA7/aFLHJB6A
	 0rZXP0/BOhVka5HigbNKH9efGBVy9c8dkr2G/CqGTqb2E2iSlXZ2Uw8TzZ+bx8zPrGSLu
	 8TKeq4SOKYObsxiBTxAq/69r9Htw/Pv6reQ+6sLHMppiFkrmMYsTgRc5mGwkZ6RhoeluF
	 +B43o1Z4UJywB2rGHSbckRD3aCCONUgAO0aPf6p7F6pylK1o+FBaYYp7MZPtW2ocbrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970556;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=LYbu9lNnuufTdNm40NF+BniAE6RjoYtO5APFa2JvuEA=;
	b=tgncMXvNscwiO6layovoKVaxl10G/YI3Yk7VniZw4Dly1Uy7cFrMFg8ZCYbW8HKor9Gc
	 muIvLCrqe7J5XqX61vBswfbvrO101xhMpDluZlHDGYEk/e+CYlwu4lDE8qiUflthri/nH
	 VUlpOKJ49mJ83pPIq/YbUl5ugDLiB7A2CiiDvAAq07xJXrFbuiPtXOWYLx/Jig6lGdSBi
	 AA7XfwOlL2m9MIOYOvpUvZ7CN8Z7FVEwE4UARrGbG69z9yw9kXHpDFJ1DeEpqWhzQPovq
	 i4E/Y4ElXTHaSrC61mnXut4Mgbrqqdo6UOj50sdPxoRi4WkIlbeg4ujyU5Stqvc2z4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=IqYIAI+5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.56
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013056.outbound.protection.outlook.com [40.93.196.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23813606A326;
	Fri,  6 Nov 2026 13:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23813606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=IqYIAI+5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fK7UcBSao5CCvpZvN9UW4M+eZ0rVIqv78p1nnI+AzwVMck/5EtKoL2299i+TERUSiY9xMP1HLqX53yuxbBXZWeEeqwdWWYpld30NkKhsjGb0aHIms9KDAGFLO3T5nj7ifarxUJshScMlmaFahtKBjRbkjnUc5brXh/KCF4pXsoPjV8rBJQ6m1zB6Y5xri6u49VFUeX6AobkQ1J3Y38VLfnYJuAt7biZ9oge56iqa7OLV5H7PM9i+idCgDiRIk6OrFLgICW258rTa0l7E8kyLId+NN7pqAMjzEO9mWtbHuCKpgxTuC1ebngXecNzbQzHgfqBmoGUWieBx0IY87xD5Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYbu9lNnuufTdNm40NF+BniAE6RjoYtO5APFa2JvuEA=;
 b=mNlDtahC+WuT2oFodnXL2yme2LUFxun61H5RfaKPgN6dju3Q2d/PQZ3S0W8GyESgUfzz5prWH3zpg49Le1KA49f4U4O8hRUroH4HolaBpLtxxW2PaOrDdnOhJHkQS0FPtuEHm3z/otFZpPBkndgO7RXpyL9NTMQ9JYkZmLuyNbaRI1L1FQ2LbYlSoto8wRDXfYeLyRG6leaIFfaVkJFRdFqv7lA8AyWVL81rPYfDpfa6cGKXkwRRt4+rp3vimvAeScNrqSaWDu0h8ALsIQrFG3uWR7MyIEHuCVPUxhVTmXUjnNVTL7mRB+dHR+8ULFOLDPd2V+1bJqGQWjeSd9iPxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYbu9lNnuufTdNm40NF+BniAE6RjoYtO5APFa2JvuEA=;
 b=IqYIAI+5znt7CfE7NaUhskIkVlHbdnVpE4TAtRql0siA3bKG7K6MPwn+LPoJOztY8gjAtPws1WPhlJXCdLrmDvMzilGpQyLe+WSbTMMYHsk+8tJD8MzmA95Ub6WhntvIngLyXdASvGDSRJxSC02Js0npfNVLLOsCPfEF0mp45Sw=
Received: from BN9PR03CA0749.namprd03.prod.outlook.com (2603:10b6:408:110::34)
 by CHBPR12MB435029.namprd12.prod.outlook.com (2603:10b6:610:33e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 13:09:10 +0000
Received: from BN1PEPF00018547.namprd05.prod.outlook.com
 (2603:10b6:408:110:cafe::12) by BN9PR03CA0749.outlook.office365.com
 (2603:10b6:408:110::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 13:09:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00018547.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 13:09:10 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 07:09:09 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 6 Nov 2026 07:09:05 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <pierre-louis.bossart@linux.dev>,
	<yung-chuan.liao@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <Vijendar.Mukunda@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] ASoC: amd: acp: supplement patches for ACP7.B/7.F SoundWire machine driver series
Date: Fri, 6 Nov 2026 18:37:27 +0530
Message-ID: <20261106130801.506026-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018547:EE_|CHBPR12MB435029:EE_
X-MS-Office365-Filtering-Correlation-Id: f0dd3a43-3904-4df1-f21f-08df3c0725aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|11063799006|56012099006|261022113327099003|261022105027099003|261021121427099003|261021123027099003|261009223027099003|261022075727099003|261102123227099003|261026140227099003|261026121527099003|261028144727099003|10067099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	y8unwAJxSzKztwMTzTCDmvCW2hI1HpiQdnwz2fvnqO0tWvdv8n8cO2F1GgH8aORL2clFT0ngUDyTY8XoE/ZVzjqirZV6dyDqxOmSmBidIMdRs0V2qx1yshBXstcDFwsRyn3MMBbB9F71VIdwRDntUCAmtpEy37JzKsH2afWgrYs78gIuUhqudCt0mu/sSoFopuIEThgvrip5cB/zZDAXkLFVmgmdARp9BHGn5qpea44v0zRiB6qMry57n+ws4LvrpwX5q9mzeeFLx4VvERnMP6sEThASgS6aL8ACBcOt4o1FE2qGrFq0ZrlZ0b3MTHhYBQI+jNeJ8Nxn2hJFmEMuZuEKEHFULWejt6cCDqJ8CTMjyNElb4TSDcR4aGo1BHfc54LlT58jPEGk8yZF2qAnazBaaBEj2adRLRQzyA/HZnFLntqKVBS8X5hsWfJDqLBu5cD+Y4p3J235xmv+31p1rvRl/hcsQhDccUa4QCqQp5zNUSM1KxnXmtxI/L5wQuxlm1IKltnWJsyu6oB88N+wJ3WAVFc1kMMjx1m6786e31H6/3kCiny9g98ByaHm4a3xzConZJvHgvHhcvP7JY8e5PFqdFqQNcHcSO+gExM2HP8/SXGojtcm0RAbQg2jYjKoyHmY7R4RNmbCDRg9QWUC4wYUM5dJgxrnL0iNchisMaQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(261022113327099003)(261022105027099003)(261021121427099003)(261021123027099003)(261009223027099003)(261022075727099003)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ShEmz9s9P5pf1P8HO3XX9i11rLHyVqJ+I2p8PGM0yaybZOExJaHYtgy/9R0RvTMlEwrJ+/VxdNbQswyJQyS0Nzrg1o8AHBFFVf0+Rbf/ldKM6mFjQvG3638PcQBN7Wnncsru6mNvHHAqqUNg0XO8oOyhg784ol8cyG/RmzckrEXYCGItNp/STln8KNjsb+SZzlAcuinjmT2yGwLKltvMK0PfAIN9pDcc1pH8FhWgLPC+OvLyBdng5STzmNQK+nJtWLjdCNz696UjkLqQ+fm5VckjF47GtSba/lA+X5qSx2QkXOTXPm9e5hcPuoPV/8ELs0hnh3i89li8Vwgy9K3w11h6FFiMcEq3PrHtlGg9XzI0+5yU/R3tedOT2YWQy2nio3BgK6wweWHrtjvFMXORDv1IDAoDyH9MKMR9HaUbF+2LW3YJ+l2Z3jZdsD1llV4E
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 13:09:10.3868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0dd3a43-3904-4df1-f21f-08df3c0725aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018547.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR12MB435029

These two patches address nit-picks raised in review of the ACP7.B/7.F
SoundWire machine driver series posted at:

  https://lore.kernel.org/all/20261030094714.1123396-1-Vijendar.Mukunda@amd.com/

These patches were previously posted as replies to the original
series. Posting them now as a standalone series to keep the dependency
clear and avoid threading new patches under the existing review.

Patch 1 renames three static adr_device arrays in amd-acp7x-acpi-match.c
to reflect their endpoint set rather than their structural role, making the
distinction between jack+dmic (combo with RT1320) and jack+amp+dmic
(standalone) self-explanatory.

Patch 2 adds a block comment above the ASOC_SDW_ACP_DMIC and
ASOC_SDW_ACP_DMIC1 quirk bit definitions to document the dual-PDM-
controller hardware model of ACP7.B/7.F, and annotates each bit with its
role.  ASOC_SDW_ACP_DMIC is a generic DMIC-enable flag on all ACP
platforms; on ACP7.B/7.F it additionally identifies the PDM0 controller.
ASOC_SDW_ACP_DMIC1 is ACP7.B/7.F-specific for PDM1.  BIOS wires exactly
one controller per platform.

Vijendar Mukunda (2):
  ASoC: amd: acp: fix adr_device naming in ACP7.x ACPI match table
  ASoC: amd: acp: document PDM controller topology for ACP7.B/7.F

 sound/soc/amd/acp/amd-acp7x-acpi-match.c | 22 +++++++++++-----------
 sound/soc/amd/acp/soc_amd_sdw_common.h   | 11 +++++++++--
 2 files changed, 20 insertions(+), 13 deletions(-)

-- 
2.53.0

