Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794902776;
	b=Ll7rT2V6DRW/vJ32R0/Shgg22qWd4TyxY91EfDW6yQTh0JRD0cgBgOLjhQiiuHnlH+bU
	 prjtjukDCp0mNirw8AVBQYn+JTC16Xv8fcttAZIlorSVfZrta9jFs4uR0pkFWFoiFb6bO
	 5m9Aju31dK+UpMP2K/Ia6s20t918aUOQz0D+I50h7XE47lxVlkfn/+tA7OyDfvI4q2axo
	 1yaKQtNjy21f1HP7V8cxEkxd53Qg7iB+9vsRWu5R8hNjKsskiFwZaUuza2yu1Hu1bq2Tk
	 sUICSC4P+kojRTv6+MZmt2Zruw1dq3uGgQvKa6Qy5U5kmsoTPXF1qE16+PE55IhNjKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902776;
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
	bh=hj3+PJuTAjlgtXwZw/+GTbfuH9+j6ar8VpULEtYFUdI=;
	b=2fL2EyaApsRPPn46SfMkQVT41d5f+ncSwpMW2jvcntOck+ck15pHoLL+AItKNP4O7SxT
	 wzBcSvEPP6TjEjQplEuGjzc8VEmc3pa6dE+cwUYSMmFB4FIv1n9qMuo38XIC+0LPwQt7w
	 zIi1eXYhA2HesFkb/iBS8n8D+/+tYd2CrEm1iK+XdNit3TMcMTbZ7cPXlh0AuSf2Kt+3A
	 DfOvKDotkr2mJ3RUbji0PNIGpzrQH4rrckMF/WWYNBC2QeRV78YW+F3cc7WMoFwdZalDK
	 rbHRRv3/bD2+xI+LTR0mprnqbx9PDqb4f+weX+N7w0qwVDWzW/DW8Y4TdNR6LJzYRJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yxSbvj4i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.17
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011017.outbound.protection.outlook.com [52.101.62.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B591C606A336;
	Tue, 17 Nov 2026 08:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B591C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yxSbvj4i
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzWZ9TLRU83TYPRTbzGU6sJoubqBwR+tHEXocyf6EF91CkRF9++bOyP7TGjxzz3kVoLtSf82TImsXSlBlzZjPaKTQ/XSlalZUeEtDDNBI3DYvzc1E6Ybzv9LS6bTVkwM99Ope4zZTtqRQcYymcobmoEN6Ih+5Fqu9sFb5xz1oCXAu78q0mUl3ND2gpq6kWC/NoFKzhNGisS5fS6+9Pm5WRBxA1X8jgWxL1PLE3K2Aki3/SFzupz9g4sdz8cGgHcwv2chU6OB2LYr47MJFdgr1SEAJeHlGqvsxOHNxcjAhWneyB10HhutSHzJzjGbo4Zjk2Ho8fBLdvu9EkfztPZ4YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hj3+PJuTAjlgtXwZw/+GTbfuH9+j6ar8VpULEtYFUdI=;
 b=ZG3iaPtrJSPTlkE+r6z8UwkzEau5h7gHc1BzyKBRBYjZHz/h9NyX3IU0upUQbhzfazW8QDX4GvS/NOGPjjnJNAs/8loKxe5LVFvnJUSiw+iF1RjGpuN2P+HcZtBZVJjNa+/vWk1Fo+bM532R33jHab7wtA3cW0uymoHPNB/9YfvMP0lh5DNiZJFTeSRt+Am80O1GtWkhEIrZqf6LR26p9GAA45+/BCxocKTYkxZmmX8Teb4zEJ+4swAta8hN3+kFC0vig+Gv4v+1nVyLh9p9JdPz/Qaj/RJhBsQExAzZYb45Rv8/8Tx1gRpzDALTGuwb7EX9zl6reGy7fnM8Av51Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hj3+PJuTAjlgtXwZw/+GTbfuH9+j6ar8VpULEtYFUdI=;
 b=yxSbvj4iSX6ygBp5o0O4Uk5z28CKmtikR8r9k0RLBM7Xa8YRAsP0HOMwJhPdBN3d/c/HItD/RUJ/+6dp+YYO85yliXnm4kxI7gqd8p5kQx7KCT19vnfd38gR9qRYNhHmsMDgg0nx/58+jABT/roNyiiaozVx94y7kzJXnms5i2g=
Received: from BN1PR13CA0001.namprd13.prod.outlook.com (2603:10b6:408:e2::6)
 by LV0PR12MB999067.namprd12.prod.outlook.com (2603:10b6:408:32d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 08:04:00 +0000
Received: from MN7PEPF0000014E.namprd04.prod.outlook.com
 (2603:10b6:408:e2:cafe::19) by BN1PR13CA0001.outlook.office365.com
 (2603:10b6:408:e2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.4 via Frontend Transport; Tue, 17
 Nov 2026 08:04:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN7PEPF0000014E.mail.protection.outlook.com (10.167.254.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 08:04:00 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 02:03:59 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 02:03:56 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v2 00/11] soundwire: amd: add ACP7B/7E/7F SoundWire manager support
Date: Tue, 17 Nov 2026 13:31:39 +0530
Message-ID: <20261117080239.918428-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN7PEPF0000014E:EE_|LV0PR12MB999067:EE_
X-MS-Office365-Filtering-Correlation-Id: 3038c207-e20b-4bc2-e4e7-08df44815693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|5023799004|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|10067099003|261022075727099003|261021123027099003|261022113327099003|261021121427099003|261022105027099003|261102130727099003|261102123227099003|261009223027099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	9lYz1Q9aRJhORVZYEuu46I/TghqKA01yS3xhgjOpX7caWDkAVzn5VwJZp304h2xGDxBPphJDqf+BUi3262BjPXNbp3iEq65IJUjttNxuibgTOeGcojL4+UyQt/mvhoPhljbJWCUhdBHYtY34/GrxEj/ttTjT58/EyDpRK7h/iu4gpcqH38KT3t99eeqgRdhPLQQ75tv9LmL02v/6H6cVIr1dQJOMainrF/IscRDelJS/hMwi7kuTss37Pwj3IuHzUMyF5THO7MX9S/n+wDo/tycMg3bP2qVKJrYoSqFdYsDQpvaavFdPJND7gJvn5hkH6TfaRs81gRc63Iv7UamhelQOQOMnjcQIBzgv0nDFpr0h4uymCttDNjVIidSXNZUTk1SUah0fbiWb53NDgcBah9whdz+6YlQBweQZR6QKEvps7bM0r0XwpYJkoWOJq8Iu8DUZX80QzdlmS/m/XN/XBi/Vw109c10eJIJfmVGulM+QhD+IqNIzxEsycv9PNIQNaV0xFIgqvDI1d44t3Uklzh1lAkGJHryy2nEGGmgqokTXpqsM9DILTuaZ9oSNMU3UEASirKR3BC2osAbX3qgQW5VMqGXyleEW6FkPujH1VxNQ1slledD3CIQNAT6WC2rK/vN7ZvlBYA72tp26mhzOCg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(5023799004)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(10067099003)(261022075727099003)(261021123027099003)(261022113327099003)(261021121427099003)(261022105027099003)(261102130727099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dBvllwS/3VZoBw2HBCTBSnVeDz7NhycEPpP/rosjsoACb+LgUy7G8UW9yFumNBYaDe6sRgWf9sNmSUY/OYwOaZfG2GWwam6V4SUlKXtoSkd43B8a0+YJ9IEWSReCZF0kYxqKV0IKcegfBoTtegU5DnNQ5n2M6Kh3WyT3Fh1tBiVVEaHlJTQ1GhPi6d2MRlj1z7+McpOeFkIyUOcl/rLwJZoS/X+Hi6xZvKr88Qi/p85nFbmSEvGoFtB95/xwDK1hOUAY2jHf8tid5dRqzNBsYSBj+wMrDOrbT4wVOVXwUgNoqQBffz/gYuUAseI+eaxrwbeQDdYUqEJKairg4QjXe3Vc+yo7L8PNODUqJDco9xF9l6lBMvathzxmMDo1S79Izqau96r2mGNyroMylFY4R/S+wEWl318TJECqI3EQ0QcnWn9+eprlViRYHP9snwTX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 08:04:00.3481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3038c207-e20b-4bc2-e4e7-08df44815693
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN7PEPF0000014E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999067

This is v2 of the AMD ACP7B/7E/7F SoundWire manager support series.
It incorporates review feedback from v1 and rebases on the updated fix
and refactor series. These revisions represent a significant hardware
evolution compared to the ACP7.0/7.1/7.2 generation:

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

Changes since v1:
- Rebase on AMD SoundWire fix series v6 (23 patches) and refactor
  series v4 (11 patches) in place of fix v5 (25 patches) and refactor
  v3 (11 patches); all context lines and base commit SHAs updated
  throughout.
- Patch 2: treat IMM status cleanup timeout as fatal: replace
  dev_warn() (non-fatal, residual bit comment) with dev_err() and
  return ret.
- Patch 4: add missing return -EINVAL after dev_err() for unexpected
  acp_rev in register_dais(); use local dev variable in the error
  message consistently.
- Patch 6: extend amd_sdw_clock_stop() wake_en_mask dispatch to cover
  the full set of supported revisions (ACP63/70/71/72/7B/7E/7F) with
  a default returning -EINVAL; required because refactor v4 simplified
  the existing code to a plain unconditional write, so this patch must
  rebuild the complete dispatch table.
- Patch 7: revise pad_fully_torn_down comment to be concise and
  accurate for the ACP7x context; rephrase interrupt_enabled comment
  to describe what the guard prevents more precisely.
- Patch 11: use WRITE_ONCE()/READ_ONCE() for all interrupt_enabled
  stores and loads; move the interrupt_enabled guard to the top of
  amd_acp7x_sdw_irq_thread() (before register reads) so the full
  IRQ thread body is gated, not just the schedule_work() call.
- Link to v1:
  https://lore.kernel.org/linux-sound/20261108213520.3570680-1-Vijendar.Mukunda@amd.com/

Dependencies:

This series applies on top of the AMD SoundWire fix series (v6,
23 patches) and the AMD SoundWire refactor series (v4, 11 patches):
https://lore.kernel.org/linux-sound/20261117070906.803139-1-Vijendar.Mukunda@amd.com
https://lore.kernel.org/linux-sound/20261117071927.830373-1-Vijendar.Mukunda@amd.com

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
 drivers/soundwire/amd_acp7x_manager.c         | 1162 +++++++++++++++++
 drivers/soundwire/amd_init.c                  |  365 +++++-
 drivers/soundwire/amd_init.h                  |   13 +
 drivers/soundwire/amd_manager.h               |  297 +++++
 drivers/soundwire/amd_manager_common.c        |  146 ++-
 drivers/soundwire/bus.h                       |   10 +
 .../soundwire/generic_bandwidth_allocation.c  |  129 +-
 include/linux/soundwire/sdw_amd.h             |   17 +
 9 files changed, 2124 insertions(+), 17 deletions(-)
 create mode 100644 drivers/soundwire/amd_acp7x_manager.c

-- 
2.53.0

