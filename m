Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012002.outbound.protection.outlook.com [52.101.53.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D774BD792;
	Wed, 14 Oct 2026 08:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791968265; cv=fail; b=gRlZ4RPi2D63U0VRF+W9wZ8XljE1y2Bz6OaNbH6jf/9pBl93xjau9C0Rp0fVQ61HQyqbbX1t1JRKwNmRFMz80HAFOMNbM7zMy3a698QR1vpK/Nq4x5nC3nzwGzBf8Y10sy8yZjQK/yUYS0mqpDUdCHlqLm8S7FFXGXUR/z0vXGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791968265; c=relaxed/simple;
	bh=+Knhir/vbXYY6Yba5Vw5HFCTRYKxOEbMoLCCy3m5cmA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LLHJQ1rypk9Sy7tITFvObOdvKJ9ug2AqcUOY3L18lC5oBPhcJ4zYfb8gR8d8sn2bHA5bxVp53ypmCSrtiZQRii8CvDva6RuMZu7TWP+FPmXzOsfP4RuUa82cuaqDHrY03vYplVZh6VGaIoLkW/zuaGT7B/I8Nmxlkqj2E9gRc1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=w4jg2BSP; arc=fail smtp.client-ip=52.101.53.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="w4jg2BSP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMzOqPJvjaEXKEKKCV/fi8Codr/d0AGilN/goF4ThTL5+gYXIGh+ecr98ijWxO+su2ND9/Eu+a7HggVWCI4MycYDhxwAvxKPR85I+cKH5XHNzWr1baXUnmAO1wmSvq0b3H2XtlhNtbyhkCvU4VTMcOKWz2xlKtyYdKbm92Fi+3ezPQS8f77k1K8bM3QRp3HXC0QAjXxR+qywJWcS0ZmmXbO/HpuMXunANkLD+tLUrKo//yc/YJWbbB5iSUBeQfTgMj4VC/WWwdltaQsDQcBCnaul5kkBx98mT+MI8SUibiqYTA1hy3eEu1Mu40rADoZQnG1nNdSO50ydHZjZ2XM99A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYX9nvbnPMopXNALIefnhq9po8beERbkpt1aFHLF/gQ=;
 b=KKmiuXEJmXsIMFYX/DKCuwo95eBdhVANEwY4LeCY6sQ8ZJw2MZMNs6QHcqUHw3lb/h6clJ0wix/k6F3ruErZiTetD2lnQsxhJ7bJEuXvEvEkQoCEgdUA0DNF2BS12UZtU1C0eTvTnY2ZiVQ1oQyI93iCW/2/Fy89CCOxKnPnL/ifg/bKN3OREhG64mm8Sp4gNnmSQSW+SaBrxpsor6qz8Oi2+KnBZ9NFFr25mujH/eagZ177MyaBFxy4qJSUk+X2f4wWwZ6W5dEOj1iL5GT6suEWzUKMmMZSKcOQZtI2wHyDvSNgp41GdAsX+whnyePhdNqplLRjFcjgIrqUIkMGLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYX9nvbnPMopXNALIefnhq9po8beERbkpt1aFHLF/gQ=;
 b=w4jg2BSPMaw04oa2g4DblF72F6iXUPFgct38ST9MGmvp16T1h9EqboTmVJ+BadFWJU2f83+FrlCAhoCISP3SpOU+XILs3PLuVkiW8phCXyTkUKTG29C3RDHrVefC8jvfHYZyiOhsl6IkLMSBRNd7wYgAa42Koeyzzp1yH6L9mu0=
Received: from SJ0PR05CA0158.namprd05.prod.outlook.com (2603:10b6:a03:339::13)
 by LV2PR12MB733495.namprd12.prod.outlook.com (2603:10b6:408:423::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Wed, 14 Oct
 2026 08:57:40 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:339:cafe::1f) by SJ0PR05CA0158.outlook.office365.com
 (2603:10b6:a03:339::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Wed,
 14 Oct 2026 08:57:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 08:57:39 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 03:57:31 -0500
From: Vishal Badole <Vishal.Badole@amd.com>
To: <bp@alien8.de>, <yazen.ghannam@amd.com>, <tony.luck@intel.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Vishal Badole <Vishal.Badole@amd.com>
Subject: [PATCH 0/2] EDAC/amd64: Consolidate Family 1Ah setup and add support for models 0x88 ... 0x8f
Date: Wed, 14 Oct 2026 14:27:18 +0530
Message-ID: <20261014085720.1471993-1-Vishal.Badole@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|LV2PR12MB733495:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d1a7ace-c9ee-4b97-0fd7-08df29d13377
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|376014|10067099003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	15oF5vHezjzvoiQtBdawjSMpoqdeM6G5dgKTMEprMbxOsSXz/M8L18ajJq8Bn2dSchlDmnAXZyfhPLqopUxHwIuqziBgZhhI12ILlT+eSL8aPobgwCKNQ2wVWWqO8yOcZaRIzSOp4HZwwMSLgNUlrSZajXeTfPlKXrTY9xFTDFf2uhc3gZ3A9rrd2lWOdqqJICzcJSx/5wMe2nR1Hk4B2AmXVzKB5SDP8QKOxaRGM9jasWQxu4NuJA1W6HL7Dilc5W2EcM+ASAv6dsB4vOnpGk9Lm8+VaZQmjPKQsP6X8OlzU/5SUB6+TgvqvBeBzjFYJwtUur/PCejOHAjcLnpuzDJg080KxOyhMxT9CTan+aqwW4JfktBgMPcjNrpgdqHG8PpAMTNpvFH2JEoAx64qc1PWUAb5eEbsi/1CApaaLdMLjTmFbWzVReycO56DIgy9gE8gjZ6QUklnYdur4LS5oXQMDPpYo20ONivyBzcWsIf3isoYYyv7zWsgSCcJYnhcaU7K12+OYx2zk7euaRcBWEs3/Gmz54SgVKUJkw+KfLn1VeQDloWj/it7FDpAp9f43cjaSbbU1R5LmN/9evnppPbWufw45Qm7O5TyBCIYr4QNl/Yl/J4K+osZNSUPR7etLuAWC75ulDGh2lyVymZHGZ4vGY3dVnfdTDWDm+olBLLgNbDlbMnsMKydjM32GskISiMQ+QDNWv9n/JzoXsCZOA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(376014)(10067099003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z9+me6GgYG5UQdAOTzOHQLAs9FVDWtG+kxqc/QNQyCJShz6heMtV2SEUYZ4QTjhrofdxsaGyXKW6S4NaLNmh+lBVIU97NL5Iz7qHogkDs0CGb/YXDwpga2xlOUGP/CpLFaRnPICDZoYyLDNbEbm/gk9vRmjU9a4vulYvrWHb0tHS3BFY9zQi6fe3YkyIS8rFGLeXD5CrfKOmrhI0hfxP5wDZpAwFQlFoStD2wXJHDpmdXbD0OdyGs8VLUfcF6O5OHLMepH/o8cCj0UmP/lqmvx4YXGHAVR2CAUWo5sirH3pLpboyo+QGhIu5+PVoTECF7J7cHA2aC/2YkmJK4EvtCRLa4Ysh3etmYsUwPfBISd7HOUSkMdnKlfsPqsKlQdjP8aR2xqDxpIPaE3rDNUUW17ecMhrH8SObr5SJHfj5WPKXyF8hbuPa+x9Ug9txhk8s
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 08:57:39.7221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1a7ace-c9ee-4b97-0fd7-08df29d13377
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB733495

This series cleans up the Family 1Ah model handling in amd64_edac and
then adds support for the 0x88 ... 0x8f models.

Patch 1 consolidates the Family 1Ah setup: select the v2 UMC register
layout once for the whole family instead of per model, and reject models
that are not known to work.

Patch 2 adds the 0x88 ... 0x8f models, which use the default Family 1Ah
settings (2 UMCs, v2 register layout), so the driver can decode and
report memory errors on them.

Vishal Badole (2):
  EDAC/amd64: Consolidate Family 1Ah model setup
  EDAC/amd64: Add support for Family 1Ah models 0x88 ... 0x8f

 drivers/edac/amd64_edac.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.34.1

