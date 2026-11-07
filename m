Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794089430;
	b=2fwATNbnpp5CD4ffSejIsovEg+ySG8VQgA79LP4LcA8cax1g4cfnkIJ5YrYKNXoEBfQM
	 wDeIIUgRiU8HSXATl4xWqpR3oCfkOcNtW/s6wem/7NqznACmcIcod8q3myDdSgqpd6n7B
	 XldspDL2l2iw5N1Su/VlgWSY5aKq+Hzb9twY3EXA2JXteNYIT74PkUL8iZUfDa1o/JKxL
	 TLHvMC4a051oKgguF/7zP+pMMsF0eH+Sl464Gqpr/VK001srVF2QAPuEuC9s8Jl0BGLTM
	 BGtp3KQY0/BZQdk3A7dj38XnkNm9T2gOzF0dQWNXktHM0imUJdbAOLulp0YMph6dr5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794089430;
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
	bh=4qN4+XiKgnam41YJvbSfNKoynRY55QvirOz34MVirg0=;
	b=lVpiIJWcMgwG/0ypcMWmdpZJA7Y1it2v+zcyPtb6GFEean7NNsIVvUb6RYFDS66fJNOV
	 TAtJHY9DP7ZgcaglrEgzRUTTiB6fxDZNJqfTPLLNfrcst3kKN9iKd0SAO28tkeKJZM8kt
	 z8apaTQEO1mQ9g1+o4Swfn/qd2zFoluqc7eTjk1Ayll4w+PGQLERc6LunglCzO9+Q1tIW
	 pgh3My/b32dJ1QqsU2hv5JeB3osgjOviUAFqov0A8bCe/XsafefFWREjg252XvlUL9wY7
	 ncy/Ansc3eVrcKPS8Jn6pcDCHtTj0mpDnpTNfTSH2LeYmv3NTNciAKVnQIPIOC0NUqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=M6LA9WyH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.30
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013030.outbound.protection.outlook.com [40.107.201.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B2F606A326;
	Sat,  7 Nov 2026 22:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25B2F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=M6LA9WyH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KSZ8wcIUL9Pmdyp6sDIqQGSDUOWX9jtHrPQZDzgsg+y/GaEQeH0QwajIYOx5h8tWYioofWhaM1+8XroDngJtzKs511YQu67W/ho20SP3FCSfB9BZ7hB5a/VY5DHZSYwzNik5v7TRdheo51dmRea9US5WEQwp4QBFdn6BVbH1bHg3yG9x8dZ+pBDZtHb4Eqr/No29QEgFtJbRpbkUzXTLfxig0wlLdIQj6jYASeK/GyNkP5TsuUtMMwJnkcHVPXSPZ0nKO0VsI1v2HaJsR352JcAQ6Gk7gT+r7iuCTrBViXXlzXYVrQ6qDdHDSSr267coQiYGjl36u3p+6PGyuyY7gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qN4+XiKgnam41YJvbSfNKoynRY55QvirOz34MVirg0=;
 b=dx12K0MeYlhX2fxYic4PnW46pV1RHnZ0P1hox/UUbHjbSawaHdwktSof7L4BM+Lasrh5B58svzpC0BTs2VRR30N7NLs8n7vF00ZvmhsBgZt4VT36pSW83NTMUVCLOI4vGkJA01/b3ILJqiHZ+e0pV/yP6n37iQrJeEEBOS00unlCfIuCCJ5Xl/8htK/GWWcep6vXo1xPe1jtAauy7VqVx9lfQwhpwBBgxKOxjQRnuo1oWoDjptGWClFKQsNPzYMSlKX5hScSorKZRPPnu1NMir0Tmby/qt0Hk6ZcyrX5bWTz0aC309gzOJ978fvZ8raxL+TvSECagRt5r1PP9N2KVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qN4+XiKgnam41YJvbSfNKoynRY55QvirOz34MVirg0=;
 b=M6LA9WyHMWA07ScuzDXpk14y5L8fKvKMgpzBSQdRJ8J6nGW7rCuuvPfwMifOwFQA5l4tq26paq0ifNjTJXsEiorFM1tRJ3COPXMK6k5OOhSNgdMdcO9wLRgTIyh7O08cQz9oR6UI2nbzXjZaLkMNkHzAc7ceyiJbXGojIWabMbk=
Received: from CH0PR03CA0033.namprd03.prod.outlook.com (2603:10b6:610:b3::8)
 by IA0PR12MB8864.namprd12.prod.outlook.com (2603:10b6:208:485::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Sat, 7 Nov
 2026 22:10:24 +0000
Received: from CH2PEPF000166C5.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::3f) by CH0PR03CA0033.outlook.office365.com
 (2603:10b6:610:b3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 22:10:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF000166C5.mail.protection.outlook.com (10.167.244.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 22:10:24 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 16:10:23 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 16:10:23 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 16:10:19 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>, <Poojitha.N@amd.com>,
	<sravisar@amd.com>, <Richard.Gong@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 00/11] soundwire: amd: add ACP7B/7E/7F SoundWire manager support
Date: Sun, 8 Nov 2026 03:37:55 +0530
Message-ID: <20261107220913.4058072-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF000166C5:EE_|IA0PR12MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: 2035cc9b-9804-4f99-2152-08df3d1bec05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|1800799024|18002099003|6133799003|3023799007|13003099007|11063799006|56012099006|10067099003|261028144727099003|261026140227099003|261102123227099003|261102130727099003|261022075727099003|261022105027099003|261021123027099003|261021121427099003|261026121527099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	7nn6MhSClYMu6yKVoiFO16WMfOtiuYyfyKVoCJzi7tkOBvmn8cgz4XIIzGTOHSKeLg8ionDkDqL3bIwSXr5Fvw+D04NI9fENsk146QyGotilwfKTFnTOASzhhAYLa1eZ4gpN7f6u30gNQZqGot7OiHlLbMjV1py2KzE96QZfcH/1LuE5krWM8a2pCb21Ai5/h8AXr4u0f2U5zyGrtoSmgEWNkFuW8qvGal8bnALWS8T/nuss1te/DC0wGMrgD0SUjSEMkFi8UEdyjTv4OsMR5ewl4T6XbCur1G0SnTw++wjfHFuicDuay6N2PpeTiclXiBCSClyF2msfDdfsc4uDBpTl4ClaJjuAAt4wA46RoXPGGwLm5ur8jvfuSDShBAUiK+HIeiqyW/b6ADnNDjHYcCvcdsasPSJT/ekhEammA1D5TF18spLtTMC5K7s1+6ZGf8txQxnvaiMILYP+S2cfvWQzZY2THPmuqSq36CgLAUFZsIwQdfFMnYbnKd0OUMuvM9uyievgXLn2WhE8501GGCoNY0nHznrGn3/o5zhwpqVGmdRowNIz43N1hpjzaLFn5CCRdaofa2iyZJfjMIr8aiqivu8gnU8rn0YXLxxkLzCVFqjr8CqaDIlZOTzMfZl66Y5ovkTfOAOwDWikPZdUpDE9kCTRxAIYNtQyT8GDqXY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(1800799024)(18002099003)(6133799003)(3023799007)(13003099007)(11063799006)(56012099006)(10067099003)(261028144727099003)(261026140227099003)(261102123227099003)(261102130727099003)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026121527099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	f4lRuLY5/g7JEpbBQ2uSQW4315wEdHZWpewScYCSwa0jIopxtWlWndg/YhjzSatPjaZyRCqUZaOnpdPsVwhvS366YAve20G/L6tVFxNBimoYUoi/Lsg/wKQBtUV1cloqvH/NmYea2G9wupyeI1VYTTMALguDwzHiQpgKjvASi+Cq+uEm+VSLhQy1r3mYjrsL8t9ptj4Npu37Y3hVb1RAF9elpJ87aAwogJhr7NfiAgQCJssChLDNxK6M3VDF7EB6w0rCnb0pk7V5Aq1MAyIm+1rTgGNng7yyYGl6p0o+oEHUIcWZiwQhcXWpQb4485PlGOXyDTjtSI3zVMmOnhsvVe1a8KNMyBUzdcX3tPzQmv9uLRT53g5c4UxGauf/7qgE2jRmGsPacOcZRwFeFY/VfjKzCzRq2MyFyO3hkdYM6BfbVB4/mbRyxdoUE53Xaxng
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 22:10:24.2503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2035cc9b-9804-4f99-2152-08df3d1bec05
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000166C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8864

This series adds the first drop of SoundWire manager support for AMD
ACP7B, ACP7E, and ACP7F platforms. These revisions represent a
significant hardware evolution compared to the ACP7.0/7.1/7.2
generation:

- Up to four SoundWire manager instances (ACP_SDW0 through ACP_SDW3),
  compared to two in earlier generations.
- Banked registers on the manager side for clock frequency and frame
  shape parameters, enabling seamless transitions without bus
  re-enumeration.
- Dynamic clock scaling with both fixed frame shape and dynamic frame
  shape selection, enabling efficient bandwidth use across a wider
  range of bus clock frequencies.
- Extended sample rate and bit-depth support (48/96/192 kHz,
  S16/S24/S32) and a broader set of supported bus clock frequencies
  compared to ACP7.0/7.1/7.2.
- Up to 22 DAIs per manager with 11 TX and 11 RX data ports and
  8 TX and 8 RX DMA channels, compared to fewer ports and DMAs
  in earlier generations.
- SSP synchronisation tag propagation per bus transfer, required by
  the ACP7B/7E/7F hardware and absent in older revisions.
- Shared per-platform wake enable control across all manager instances
  with software serialisation to prevent races between concurrent
  managers during clock stop.
- Separate wake and bus-event IRQ paths, giving cleaner interrupt
  handling compared to earlier generations.
- Per-revision IO pad pin assignments with hardware-required restore
  order on D0 resume after power-off (ACP7B, ACP7E, and ACP7F each
  have distinct physical SoundWire clock and data pin mappings).
- Custom bandwidth allocation with dynamic frame-shape selection
  across candidate clock frequencies.

The new backend amd_acp7x_manager.c plugs into the hw_ops dispatch
framework introduced by the refactor series. It handles the full
driver lifecycle: IRQ handling and slave status processing, port
configuration, DAI PCM capability registration, host wake
enable/disable, clock-stop suspend and resume, and IO pad management.

Multi-manager synchronisation (GSYNC) is planned for a future series
once the required design work is complete; the existing implementation
is structured to accommodate it incrementally.

Two patches to generic_bandwidth_allocation.c are included: one
fixes the hwidth computation for the skipped block-offset slot
(a correctness fix relevant to any user of the generic algorithm),
and one exports the bandwidth helper functions needed by the new
ACP7x compute_params callback.

The interrupt_enabled guard used by ACP6.3/7.0/7.1/7.2 to prevent
new work from being queued during teardown is mirrored in the ACP7x
enable/disable and IRQ thread paths. The corresponding ASoC-side
patches that guard interrupt_enabled checks in the ACP7B/7E/7F IRQ
handler are not included in this series and will be posted separately.

Dependencies:

This series applies on top of the AMD SoundWire fix series (v5,
25 patches) and the AMD SoundWire refactor series (v3, 11 patches):
  https://lore.kernel.org/linux-sound/20261107154659.3358223-1-Vijendar.Mukunda@amd.com/
  https://lore.kernel.org/linux-sound/20261107161345.3411491-1-Vijendar.Mukunda@amd.com/

Vijendar Mukunda (11):
  soundwire: amd: add ACP7B/7E/7F register definitions and revision IDs
  soundwire: amd: add ACP7B/7E/7F hardware backend
  soundwire: amd: extend ctl_word_prep to set SSP_TAG for ACP7B/7E/7F
  soundwire: amd: add ACP7B/7E/7F DAI PCM capabilities in
    register_dais()
  soundwire: amd: enable host wake support for ACP7B/7E/7F
  soundwire: amd: add ACP7B/7E/7F clock-stop support
  soundwire: amd: add IO pad enable/disable for ACP7B/7E/7F D0/D3
    sequence
  soundwire: generic_bandwidth_allocation: fix hwidth for skipped block
    offset
  soundwire: generic_bandwidth_allocation: export bandwidth helper
    functions
  soundwire: amd: add ACP7x generic bandwidth allocation support
  soundwire: amd: add interrupt_enabled synchronization for ACP7B/7E/7F

 drivers/soundwire/Makefile                    |    2 +-
 drivers/soundwire/amd_acp7x_manager.c         | 1163 +++++++++++++++++
 drivers/soundwire/amd_init.c                  |  365 +++++-
 drivers/soundwire/amd_init.h                  |   13 +
 drivers/soundwire/amd_manager.h               |  297 +++++
 drivers/soundwire/amd_manager_common.c        |  130 +-
 drivers/soundwire/bus.h                       |   10 +
 .../soundwire/generic_bandwidth_allocation.c  |  129 +-
 include/linux/soundwire/sdw_amd.h             |   28 +-
 9 files changed, 2116 insertions(+), 21 deletions(-)
 create mode 100644 drivers/soundwire/amd_acp7x_manager.c

-- 
2.53.0

