Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794068127;
	b=SS1i8ZLD6NZPgw++xznZ1ZcgJkSoDEyMu0NMMoW07nMHIemOXeiup4x8zrcXWtJtaKrB
	 pwdM8elrKq2XCxM7TGFmXGZKOqjJPS5TnY5NGOXtRlrmZsKh/ztzSxS187uZfIqCTseJT
	 godCE+KUtRxy9wllNhB58yr0GBAiBlgAPvKfTnZayGDyxMzflr3A2DgZ0FNE5PG+uson6
	 9i5nCwN2K//1CiwObhglvVad0KO3Pi81NHHAEJMHQVeFJ2disNDX0kSuIZuRXVSR3MynM
	 vqMNv7lrYnPVeCI/NHgYVHmj3BkfTHGCyHkQNO28RE82sHBLvvx5pSQ6ocwjHczIlAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794068127;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=cfjakNDYqOIUJ5jBDLV4ffBoYJr437U+OWvMCy/Q+u8=;
	b=H8aPk078i+TQiL9SVLmrY/EAttf2kBdAoJ43LHXcGn3inWo/0uRGQLSZoih2hGllBnFW
	 Od0HBKtrT0Gn5Y1o+a5ZwSOgjI6aVhwVHVbnCs1AcVu+1nVpzr/04cAW0+fjJeLF5v7Gc
	 nmg9yguSQpAIm+m2uh5Hii0CG/fr/ji8K9RcGiZ7I9pLdNgfsGEi6/2AAiHESTlmnNa0B
	 I9nuH/fhRXX20+ZwHhee+SZP9k0vAbtLZ4AD7eAZi+ge1YI3E6y6wWRH0TKI/UKLFJXMc
	 LySrXFQ/kqXkPFoIYqLdaZ+gezz6hBoKRzXNDi7IsW+FjwcYN+0lphQyTUCgOlwY2fw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=O88rj20X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.7
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011007.outbound.protection.outlook.com [52.101.57.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36F6606AC21;
	Sat,  7 Nov 2026 16:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E36F6606AC21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=O88rj20X
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnvMoNTlW/P9x5MMOUXibUEmyWycCrOYR5hnB1k5GkystA2kmF5fWetueql6Crvy5gaTtG/Q31M6/RRDYHvf31a/iw1grHjm99jjfqxfFcIYw0u1ASrJhv1GaOFUwTp/D4EvxCmN33p4ZRY5hprMwMV4oBU9hN44eoF5R7OSoHVNyUMVfa3X/3xnrC+n0LjOafgNsOK3wYBkBumznwoYUUqmgavvEnumgNm1EaerLzS1HSbN/Vddcz2bIrzt9TfZ4XcRq9SceXyZcWqTPxj5fD6rPkNHG0xm7o6qCPFuSVJ8xe+iQoZqdHLL8NKe/O46LdGcXZSWNapisHJ6NSJ4UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfjakNDYqOIUJ5jBDLV4ffBoYJr437U+OWvMCy/Q+u8=;
 b=TiVNKjajpt0+id61nbqqskNdSpaI18CQPrr2gm0VUPQAHkr+khmvdpy2yQpEVLJk+SOrZhjj+JnRCg+4WFB295NtUgJD2gB6vvN60trx4bJ3UkiPDGuQRIrQu6l0VvKLCsXeg89Cj90xEUEuIvzY4ltOin+0mP19gzvZnB9hPw7r6kqZt+7gJEmEILJlXEpqSRe5XUUJvznvpOl+QC1Rsg+CcKaHZoIWlIDk6IIakCUlopgSuRmIV/LZJYBYf6gzfT2mCbXxUNOx8BbgsEpqYThKTfEKmG5QlPd0fxqbUv+Ky/+i59cLnQZXCtGw0I0Y3fwUXkR6RHP5DuVIXcqzRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfjakNDYqOIUJ5jBDLV4ffBoYJr437U+OWvMCy/Q+u8=;
 b=O88rj20XzvOkSKoftPN/Pc9BlkhsPRCObjb3fyLnmrPfmF5ndsUEdP9i+GauONAG0knQRKVEcSBFqHxPs+wLbjDx2LrMZTvJpjQNU9528hi/g++S+R3i4WRj3YgffnafNjuxIg4QfhMLHKR6FKR8LnELFMGea/ITJIIjFbtk+eE=
Received: from MW4PR04CA0269.namprd04.prod.outlook.com (2603:10b6:303:88::34)
 by PH7PR12MB5654.namprd12.prod.outlook.com (2603:10b6:510:137::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 16:15:21 +0000
Received: from MWH0EPF000C618A.namprd02.prod.outlook.com
 (2603:10b6:303:88:cafe::1b) by MW4PR04CA0269.outlook.office365.com
 (2603:10b6:303:88::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 16:15:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C618A.mail.protection.outlook.com (10.167.249.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 16:15:20 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 10:15:10 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 10:15:10 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 10:15:06 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v3 05/11] soundwire: amd: remove unused AMD_SDW_MAX_FREQ_NUM define
Date: Sat, 7 Nov 2026 21:42:22 +0530
Message-ID: <20261107161345.3411491-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107161345.3411491-1-Vijendar.Mukunda@amd.com>
References: <20261107161345.3411491-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618A:EE_|PH7PR12MB5654:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aaf17d5-7ccb-40c9-b3a0-08df3cea523d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|261009223027099003|261026140227099003|261021123027099003|261028144727099003|261022105027099003|56012099006|10067099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	qZYG8vGaP1cTMetiXuomKiJi4c1bgc/LyCG9pDtAGHFmr2pGhgK2oPK1w0KtgrcdLwS/FLwxMtzVC2xTQSLaBhjWSa4TvnWM/nFmQN2YRhj0zAfNHC+VS6OGPPaVtpJ2G7HI4GAQDqUSW+XnkMqbvcKLI/X1ag43fhihKq1MQV8amt3xolZb8VdldeUV/yoqF3nusnEqa3gLu0LqqckZZXE4nR36qxFQgRo/DIh3ogeO0pMT3t2oraxqvogbc47NKLESmr3KbUBeXeuv8/rXJdNV0upfEwRiRJdvARYRk3kPqppuUFbRSY3c46Ik95H6S6DKvbVEajBuu92hY9adL5a8zniEwD/6Fm/2RRjKnv07rcegqDxMY15ALTZyv1m43yBjBkDheEJTGwFDfwNInRjHcFLW+3WAza+BF5oJ7c6JdRvH92wVi1kuqMpj7JU6kjFFYxkBcXaWngJaIAOmkL+W5uojhRF53c3KrgcRRloutnumJa4wlnDpI/pG9l4ho2+pksRZ/RaHfC0oVOdiWmyf+DY2R3sNNkMaSDUV+WD66+H+WPufop4PxEek4tkMBMEdH5kDRjtROje9oxcGzLy/rvksrBP+1y7r7WFOBWzWYKxUTIr7nn3caeEon9SbHXG78i14YIyWEYSJ6IEbAmdC6GVqCHsFbb/NaWD4GUxbWwlSEcdVpMBw1IDx5OA/VWMvLDLQunM03BjCZi9FLQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(261009223027099003)(261026140227099003)(261021123027099003)(261028144727099003)(261022105027099003)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cG64q7B1We3NeUb1J5QGpPe6JVbObe8Rrca2y6AMT/8MVjoVXeHnBEmxUXYaRESp/dZ7/7HWZWlWMbkGpmXbpEtKtnxb7qxUn+7DK0KOJs7+sTGhZhDxkBmqHcF92HKziCgqPuwIOJZ64Jdtc7PdyifIslPnv/TDrtxILRxpQ102qbv0esBSvRsRdnvzy7nkBz3xVQvA0bNc3NqCW/VLlCmG1OeaP0Ax7hbL9LUylElNKKoy54mzQSOBpUI7tFVgKynO3IVx8mugsmGRn8b+iS+VR0WdYoJ/iXDVpdmAlJMXkLYgcWONDkoA0RMyVq7rKHrLPLvXT2+22Uw5qb6L+2GmL659imT+sjTqxPEm94Iy3PwNj62wOoLw/DOsg4jDztDv+KAr5eWZaUIVBZS0D0p/gIkf83VI9WI6FzW06hZ4hJiC9oRhweg0LDdQayAR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 16:15:20.8327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aaf17d5-7ccb-40c9-b3a0-08df3cea523d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5654

The AMD_SDW_MAX_FREQ_NUM macro has no users anywhere in the driver.
Remove it as a straightforward cleanup with no functional change.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index 03d3fc2a9072..5e280fb542f8 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -157,7 +157,6 @@
 #define AMD_SDW_IRQ_MASK_0TO7		0x77777777
 #define AMD_SDW_IRQ_MASK_8TO11		0x000c7777
 #define AMD_SDW_IRQ_ERROR_MASK		0xff
-#define AMD_SDW_MAX_FREQ_NUM		1
 #define AMD_ACP63_SDW0_MAX_TX_PORTS		3
 #define AMD_ACP63_SDW0_MAX_RX_PORTS		3
 #define AMD_ACP63_SDW1_MAX_TX_PORTS		1
-- 
2.53.0

