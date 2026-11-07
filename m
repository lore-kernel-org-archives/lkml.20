Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794068152;
	b=cxbp5yS137KT4Ji923vShS84o3hRjv4voZiSr9pH8eHAwCSadWMpXA135ALU4t/wIpm5
	 8Zym8hp2Q4XkMwrFCvKyfRBB45uHb9S0qCWA5WupJt8/OWugK+1PQ0gU3W00ii+eShdVE
	 Wb2Y66Frq1Ir2NgXdPJH3tDGtrbLZjSMt7502AJveQoP5dipM+KmjENRglyKt2jxvAt9R
	 Yj2BIlP9IPmEz0XUhTqS38aZ+sNgZ8/DCHWq1JN1z/qS2rERLm2J0BULiAN8qTCdK35p6
	 BPpS9dp46HOeduHLn91q2qcmmrc+VKsMvJLNcCvrOBGRw8QSn1aJNemtf5jIpxYfN6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794068152;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
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
	bh=bg2eA7X7w3Fqetj4s+ZZrYy3UsoemBsUTStTrzg131s=;
	b=DSBXKY4bWATJ7HXseP7wy8KT01if3D7+yt4KgdakBzfzJVE+KnG2xT7FIdX1QlvcbpL4
	 QZWS4arwl7Lu49XPXbh4Eeg5OwKWLb9Hj9tjZxuB2cxbeaHzmYzIaUQ1NILGiDAO8eGTE
	 U9iUDFw0T04KGXGqV53RTQBu0cm5+bnxIH171CHiqRUINhpvRSGAoRvkA08HXPL2GPgvx
	 PSU+7L6MYTIo8MOmy9Nvuz0j2qllb7K+KKNn1b1ZKKHXBnOsLwt+d2+7vKFvA+8rk7zeL
	 Sbx2eyja8DtcJLu/S+FH+gpANXbpw5/5hV1WYjTGwIefjhf29XUIwYzsPPf+1pLMWxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VnatHUjW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.48
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013048.outbound.protection.outlook.com [40.93.196.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01AC606D837;
	Sat,  7 Nov 2026 16:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B01AC606D837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VnatHUjW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjbvMJrFgoW91SKzWGX9JwVEOWlmdJHLG0vcEF39lhYrKm7s3ZkTx/6Th1ciOLgsOPFBi1B42fZYtR9t8kYfOVHPHqqqwifGxm4zs1AG2D/0IlYf0QIKa78kqKqBFa6+XQt51g8iIfWqMINs7341pJn/zQk0RTiBEeomY+UbEzJQAtVhj/eFY+Y32EVClGlcrCPgoAvZlF3hwq/UqOaWet65ygXi0o8QLeYMhaPhuXD3FETb89fQXnL80iw92APj/TVD6nS4JF+FMV/iHFH1x/J9BQFg6BfEHibmTMpNTNIXy2Bz8rXbN7dG0dCMjODJZT/0jC09d8gy58+oitKoJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bg2eA7X7w3Fqetj4s+ZZrYy3UsoemBsUTStTrzg131s=;
 b=iYCKKF/mcXEByFpUd1308HEd0zedpz1DcmvjeC+tuhotkXHBaNrENecPXrrox9TOQSYe+0eXwlUL/JB0TaqAXlOZo+NaJNeqzb3aSAoPh+pmorAIT+HCE2PnPftdDE15y2ekzQYXDIWj2T+qBD2XkzLo3iyAIvOhpp4mhB9D+WVvvkUxO1beWFu/IDs9TwkD66HCwpJ8xWqQRjtgpv8wmJC8KrSq1apD3SurUK3VKa3N+5S+YhTpWp9JWhM2LIqwuFSFuB2QRPLRAvkx/OTv2Mt/6XurHVKeAiDcEovgufdGol9FprcbgpWThG7GBrk5EjVF/m/1UeADJx0WNv1uCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bg2eA7X7w3Fqetj4s+ZZrYy3UsoemBsUTStTrzg131s=;
 b=VnatHUjWg2YTuKBCWDTBPq3b68w5zAuRqlXH3eA9WB35aEZlFbKiHccsSGpwS2gROGKvecVxlFvACJcXzN+/pLxHiJW3tLI4gZEEKXsO6RZr9nbZPOaIZ2txozP9PL4LILrcWpiFBD4FgGVqf7pIoldnA3IqMWGIK0Ri0u4YIDU=
Received: from PH7P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::19)
 by IA0PPFFEC453979.namprd12.prod.outlook.com (2603:10b6:20f:fc04::beb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 16:15:46 +0000
Received: from BY1PEPF0002696B.namprd05.prod.outlook.com
 (2603:10b6:510:326:cafe::4) by PH7P220CA0012.outlook.office365.com
 (2603:10b6:510:326::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 16:15:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0002696B.mail.protection.outlook.com (10.167.244.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 16:15:46 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 10:15:30 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 10:15:26 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v3 10/11] soundwire: amd: guard DAI PCM caps by acp_rev in register_dais()
Date: Sat, 7 Nov 2026 21:42:27 +0530
Message-ID: <20261107161345.3411491-11-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0002696B:EE_|IA0PPFFEC453979:EE_
X-MS-Office365-Filtering-Correlation-Id: b906fe1f-f744-4df7-7e0e-08df3cea614f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|18002099003|22082099003|6133799003|10067099003|56012099006|11063799006|261028144727099003|261102123227099003|261026140227099003|261022105027099003|261021123027099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	z+h5Yo3Qn6hgXR94SJYfgJmPkOFAsrCZcfDnipJAagBhUrZAJ6qtBhEGU0a1fnAvQazsCK9dkIoBBeo97dT3v2m8xemGdvUjggqQUFvdFC24DBmWeh+y0nV5lPiEPPExvkEUzEej+E2PtY0/YOtjJA2QqHiNkxHDPvqYQeh5Io97plD2D8rdi14wfI4BnsKJzgOsUwbURlOuuTh+xeAXz2lOMCfrKgJg5xfqYJS6rnwbUmemouGeZXPCrws8qDOnP6W6hgt2zETCjKi1sDp4fkbl0IwOxxrV62cQkARJ2PLAdsTleTNEiSc5e/wcWkMUsM8O5KP5kH805eRTj+HK9tzlFKwuCvMHcdXAFeMq8/2COG+BnJdenvkwuHmYLUbRqoI4qxbVV5cimM//WgAkGRgOYDbJi9AXydCcV96khsldbgWo6ggSCD3gofZe3tCTViuDAWVFrhkuc+07ps2zzzdUYMCl/aHIhtHvWDGZNVCif51QO64lZVI5T6Eq9wQdvHuC1DszGPoRTv0z/P/ryMGuIu37t4zf8tw8Hj8I/90Gi1cTlAVlNar5KCkHXDs/RCZjU0GMNXlDgKyOTcActer6AzqlniYHE8oxbO9c9hjm1uM14imXiPArnhMOYDgl8r4b5kyeUXzpwrer4CA6BWWkcrTyvsnJb9DwgtpHUtyEFtzgT98aEesdt1/nbMlK5pl0eCmTEnZm6st3fOJIqQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(10067099003)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261026140227099003)(261022105027099003)(261021123027099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1xm9S5Xv20SW+syV8wx6OYaKXPvTxW5MBHN41uSGqwFmxG+rg+4rVm+95DwAnN6svGzSzy2FfJ0TB/Nbh8ehCOOpKfx7dpihVJUD6ZRoBBTDrVShhwbniMqkwphba5yvudrmLFgpCun1yKsG3ckT0hhoh1dZGpWOWZlLPJ4ab0E+tzHQQ508ZSmo0sRz6UU4FTjTducxag1LuN3mbZn58E80hPXzcSwobqTiI3F0hr97KU8ztUTOzlMgBp6LOIXQCwYnNi9/qdVZc+up+V7mQlVzYhIIALfNVpglMq4eDCMZ+GuBNA+kG/SnFnVD+/uq3rH4GV9iKNMwxVxiL7xhW2Qt4hKLMUF8RUtefCYC7QPp/XIF0uvZqwhLl9bFQaU7CKSAtP9TFEVtOaB/GB/uiW3jUlIEaT/8s1+RBYtkuLfKtuyG77pRp51bE4MlPtIx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 16:15:46.1487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b906fe1f-f744-4df7-7e0e-08df3cea614f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0002696B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFFEC453979

Replace the bare stream->rates and stream->formats assignments in
amd_sdw_register_dais() with an explicit switch/case on acp_rev
covering ACP63, ACP70, ACP71, and ACP72. An unrecognised revision
now returns -EINVAL at DAI registration time rather than silently
inheriting capabilities that may not apply to future hardware.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager_common.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/amd_manager_common.c b/drivers/soundwire/amd_manager_common.c
index 06aef9c03f18..4a414fc1b02d 100644
--- a/drivers/soundwire/amd_manager_common.c
+++ b/drivers/soundwire/amd_manager_common.c
@@ -403,8 +403,19 @@ static int amd_sdw_register_dais(struct amd_sdw_manager *amd_manager)
 
 		stream->channels_min = 2;
 		stream->channels_max = 2;
-		stream->rates = SNDRV_PCM_RATE_48000;
-		stream->formats = SNDRV_PCM_FMTBIT_S16_LE;
+		switch (amd_manager->acp_rev) {
+		case ACP63_PCI_REV_ID:
+		case ACP70_PCI_REV_ID:
+		case ACP71_PCI_REV_ID:
+		case ACP72_PCI_REV_ID:
+			stream->rates = SNDRV_PCM_RATE_48000;
+			stream->formats = SNDRV_PCM_FMTBIT_S16_LE;
+			break;
+		default:
+			dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n",
+				amd_manager->acp_rev);
+			return -EINVAL;
+		}
 
 		dais[i].ops = &amd_sdw_dai_ops;
 		dais[i].id = i;
-- 
2.53.0

