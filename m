Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010031.outbound.protection.outlook.com [52.101.193.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C7537DAAD;
	Mon, 28 Sep 2026 18:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790619004; cv=fail; b=cJIDxzccXCPrNCmRnq9D9V/0MEg98r4IJZZQHu79hr9Cv3DkZ4e9Kxs/ATTjoaAeMY4uUXodEbEt62j8MCMEhABfW/DZe8DhSWT+sCQByY22BAK/wgAq1HK6OgxpSE08qcc5uK+7k3vwFKCpiYXmDcFwst5ukUbjFx9KMRvJY2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790619004; c=relaxed/simple;
	bh=uFb8ckMyzNiWiizEOxbPnUb3bSum72GGNUyttqonGUQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BRdq47HtOIsawcDPHzf/bsLipC3CZ+VhtS4qtJBL2bqpzSBmN1++NLByUxi/0RDZHcW6xGZkxBcZO9d/cCBtnqX2EWoF1BPAA+eQx5pEt2/f9xgq1mK5vIAD8L00uR+0pglhw5L/92chOTknD1SPJK4fdnUQfHxru4kJncAgZAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=c5tUIafy; arc=fail smtp.client-ip=52.101.193.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="c5tUIafy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xlyTFHDonC3cSFIXovs8Y7mliE9oIuPu4n5p8fHsLoJcS1ZfL+1sVy6K5x1hClBGDjsS/9uh6sQlN9dGc9ISudH/1oQg5RA3yczG/LxfQBOSWDxbqWVfnWm1+69aNhGwIAdjdORCcTabdY/nBzi5G1DSgSHJitnriFJP6K+C9/rOVxETQNnQVAMVgUMdcmQpoMdTTGFaAcGcKG/nrk82xjMKm5GmePQhQFvcmCxa6GTinBDjU+Xmryzhx7Fx8JX0nBHvdKS2nNgP/4wHls1JeE0t11DBBFxjkqgO4QtrimonUhmt5U5VOMmJISNGL5/Gc0cTSpoA4PJ+e3LOGZIBeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wij+m7MXB3QuqKgKhJzFcxZ6mq5m7+rNkkxRKJ+2Wk=;
 b=dTDh2JxJKeezpNut/YzF1jSqw2Lqe7c1m0QupR1HraiMXwrudW82fwkd19L7lDiK1eOen5lX3N49IBFXXD9ZNG+kvQ6S/LNkMCEll/0d0Ov80ozK0MtdDmybf/qDq1LnJnckmUFHNCUeCmSud6nkRc259TKmCTSGmUGP7N+UeiVEFJEabtxej7Qm7xJ4BGYzvWFhCJAZQ4RN6dCm5msZxCBUuLm7StRRe4sgPRQMh+Zdra9mBXS1MTprUs3ogViFxFVvyTX4Lds2e7EHOK/r2J7eeaSewnSRsU7yznosscUrieKzewdsFaNCz8qQBGgd/B5PEp+YM0hqbu6/YdMh3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wij+m7MXB3QuqKgKhJzFcxZ6mq5m7+rNkkxRKJ+2Wk=;
 b=c5tUIafymkDfSD645zjO9fIA/qiZ+c7g+JW/sC8xTcpQpFHtFnwAYi6GOHsnVS/8Ts9Dv7zyqRCTnkhzryvnF2BjcsvnbcPnEHpV5/IiZvmQwH4CZrgfWvFE+md0dzRiEhPnLbvxv1XA51eO5e/XWxnoLRVcWcIyv/Cotf+kp4g=
Received: from BN9PR03CA0861.namprd03.prod.outlook.com (2603:10b6:408:13d::26)
 by PH7PR12MB6693.namprd12.prod.outlook.com (2603:10b6:510:1b0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 18:09:58 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:408:13d:cafe::15) by BN9PR03CA0861.outlook.office365.com
 (2603:10b6:408:13d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 18:09:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.3 via Frontend Transport; Mon, 28 Sep 2026 18:09:58 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 13:09:55 -0500
From: Vishal Badole <Vishal.Badole@amd.com>
To: <bp@alien8.de>, <yazen.ghannam@amd.com>, <tony.luck@intel.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Vishal Badole <Vishal.Badole@amd.com>
Subject: [PATCH v2 2/2] EDAC/amd64: Set zn_regs_v2 for all Family 1Ah models
Date: Mon, 28 Sep 2026 23:39:35 +0530
Message-ID: <20260928180935.472319-3-Vishal.Badole@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928180935.472319-1-Vishal.Badole@amd.com>
References: <20260928180935.472319-1-Vishal.Badole@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|PH7PR12MB6693:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a5da635-d847-4cc3-8f6b-08df1d8bb4ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Hh8Z40trJsH5g8P1k4qNMB8ZkUDJmrNGZO0wTaxWUe7MEkryicr93d5MV9V+w95s2qNjszA8TBlGNHhzt3YS+UwRH6QRDq7CdoaCWmL0VrvSgfCHLB6SQfEbde+GEMXSYszsH8h3rUGFLwrSuX5KmtO8/3q6MMqEAPrq3cYvLlmAQX0ezuLnBzEAJTYrPB08ePIe6mbSXnM38EQvw1VsGrRTbKetY6U8oW/oYrFA/t/debxBQAI/Qyz8n6hKh7Mo+3Bqpyo95YnqpsjWk0Ya7QLi/VAeCnRSqbdqoYWjkz/hIqt7s0fpwMZW9POAwvX8vzk+3b5DVK6K3J2Dy3XpW09S3sS3ni3XzvXZOfRWsXNBnCZCNYBv1j+UajeJCVX+S6fsc75w/fPDJf8N5Fs5vJaCMxudICco4nyrDHZeTSETKdoOmvxpLd4x2Rvio2JlUchJIprYySVtIYPd2eT7SRwyhw6pUjSEkdvScXSmqvZpBIcnxyqlThn53O6qi+Iwj6iq9ZKn4lEg2V8L/dAWf1FZERtI3vFvTX7UFHxMGW2jwHFGgDc0QpHR9V1DjBaP2+kfuA1xihN6W7dlqpFD0MCOoyxPoVIaRn47qQ366KMsQqyVTzmt32vCDH88qZCVMW+XHdbqGhJ8z8hIvVsjRPAjjK0tCaZ8JwXzzmvs7HO4678kb46Kv9i5owypDwM7M4JsGykfyQTCvVEGFGf7mA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n4unwdQ1BP0nf0Tq7eYK3GfSKUVgvCR+PFl8IeeoYDeyaHCsrcOScc0fGuWYb6Ig2Rv+iQAAjqoNQIX39mI6pu3XN62wgFyUvVkzq6jthPtnFw6KIaPyndT8I5+qcvR5e4xX1rMQx9/py494I66aOKH3vWGpl5iooaK5IhSSi0fAaH9ksjkgMKGFoxitBHRXWTUo/8HI1rjbS5SngmbR8bjPPpz3w0ErWw6fDm/WZwludEeaH3sYGpYehnoyNVqXoB/7t6clz+P8wnZ9K9YJp/wHQz/gi0TKx1shRCeK8TZ4TIQC2+OQZ0oFceei3IuPH3tm8POnvEp+z+LPDA0LGlGw7aovX2Inynj4M3dOvgiwtc3JMQqhMElETqErWD9fYEVP+UQKnG/HGTj6hOdIfkd0txWA6imgaSmWeB7byHh7gdkWYLZ99LouRDrBSqMB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 18:09:58.2597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a5da635-d847-4cc3-8f6b-08df1d8bb4ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6693

All Family 1Ah models use the v2 register layout. Today zn_regs_v2 is
set in each model case. This works, but a new model could forget to set
it and read the UMC registers at the wrong offsets.

Set zn_regs_v2 once at the Family 1Ah level so it applies to all models
uniformly, and drop the per-model assignments.

No functional change intended.

Suggested-by: Yazen Ghannam <yazen.ghannam@amd.com>
Signed-off-by: Vishal Badole <Vishal.Badole@amd.com>
Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/edac/amd64_edac.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index ec4cc306b726..b69c3f51dd37 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -3887,23 +3887,19 @@ static int per_family_init(struct amd64_pvt *pvt)
 		break;
 
 	case 0x1A:
+		pvt->flags.zn_regs_v2   = 1;
+
 		switch (pvt->model) {
 		case 0x00 ... 0x1f:
 			pvt->max_mcs            = 12;
-			pvt->flags.zn_regs_v2   = 1;
-			break;
-		case 0x40 ... 0x4f:
-			pvt->flags.zn_regs_v2   = 1;
 			break;
 		case 0x50 ... 0x57:
 		case 0xc0 ... 0xc7:
 			pvt->max_mcs            = 16;
-			pvt->flags.zn_regs_v2   = 1;
 			break;
 		case 0x90 ... 0x9f:
 		case 0xa0 ... 0xaf:
 			pvt->max_mcs            = 8;
-			pvt->flags.zn_regs_v2   = 1;
 			break;
 		}
 		break;
-- 
2.34.1

