Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792989998;
	b=U8zCAnClLViWQHlBinVu/WGycOOPuiK6PCv9fvOTPUJeT8rYhuG9ZEFZeqVQUL1eKV+x
	 X5YRkiIGVeizKxBWPEsA1lIIzkMArIrJeRaJnhHEaNJVJ1gZ7KLiM0dCxDIsBD1hSd8+H
	 7Mj6OnEkRrs6KaJHhfz6WzD/Br4qbDG8pMOkhEKBwwN0MdCO+/ZUqX38nqtaaaPnivFQ8
	 MtaaS2Ko5ihZYUEi++DEksZHdQt6jJa6go8GrF6wp70c3xcNUjBVk7Kaf6p7qjHDL4Klm
	 8kvNejy4xCjnovshVPyDYmR4HUMLaYg8he/qurYrmnKWneQiunbqD2gXMXnGlmGRyiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989998;
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
	bh=gp6Kw+oQV77kmEmILxH6AvsLXhxqXhU1lJAvS+iRwrc=;
	b=NrP7LGdRt8kjczV7MF/gVsjtA99S0B5LU+WZd9u/hyCC5oWcS1nFs35U04Wcv0K174LZ
	 9hm6KLDoQV1LnghnjkG+tiRxL9Zh0ys+omnFK2b8wUuZZMfWyETiA0hFG4wcVPJCM5w7I
	 H4I/6IDbfQmcMBbkiSJ0SJ78KWrAm3d7prIRF4lq12OyvA8FerVrklnGABC23532iWuEO
	 CIq5LtTUF8RhQ6H8lDz2oqgy8dd2rGOJWVXU8TrRxKyHugOmqqNNi7ZCy9olG6MA7w3ye
	 iLEKwRqUEEmQFqvU8Bp3oJdRhsxjeZFBOdKN8NK7k20ZemyAbcmeXZkSmIndXZbAThQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=HlhQdyjW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.62
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012062.outbound.protection.outlook.com [40.107.209.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E48B606A31E;
	Mon, 26 Oct 2026 04:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E48B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=HlhQdyjW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPLHnja0dcz+h1q1lLkQy3M714wAtcLkU5nzbRQgnUGhZ/xl3hpjyMuuKFJ6X/M8Lp1z43O2mryDctKWxEHYpq8N3DYTI7UUqV11IQFBckqx9exxstkS9aNNATf91jwkDfrE/VBvWGq5AY6mUAvjH6Q/5lHbclQOB79w+hdrnJYxrsnOaYJIUNElcrA82Q/ZkK5L0LXTueCzDlMVXVVq/YJR4BbfE4myYyRl7GyCv791EMblVRC3gNUhoVv1s/H1RdUeDoQAZ/8U7Yj8Gc9EqxeOI22ScaGhJqpw7YRrTfwlC2z4nfsyAnrIGby/dypJ7BpYfhw/MJRTnpaWXDFp9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gp6Kw+oQV77kmEmILxH6AvsLXhxqXhU1lJAvS+iRwrc=;
 b=FnpAjv9hqihbVcfNCT8Z4oloJBR6yjtX8X+iEDEqH1Hc5GCpit/1fsBUqmAUsmROccnBpX5IbVuLiPQXepzeQEmw52TEEAqiWIWjszBb3jHxLys+COJdbmPylH7CpFLe1YgeIT8ZnLhOWnhwqd3xKF6YJSxzYh/DT/mb/AEclPMARfzRmFmvOUyXsaJJr9v3r3vYugx8mhS4erkpKUvt2tbLv0SL4FwPER0lCWe5CIH9JBQ4CjQqOcVt2htesE7XJ1h5JLREj2axG+RvBQvxg3wKczkCUEif4ldRATpGoXgcgY6WuPNmUdQC7xbzPVMqLWCbj6YPn923EPpjbztWuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gp6Kw+oQV77kmEmILxH6AvsLXhxqXhU1lJAvS+iRwrc=;
 b=HlhQdyjWp79m4CBx6UQVwGnVRfwsSQvadoLxhWrgiTZH1f+9I0ALvzpQxhUTUYsRPPgpDU+cEPJG+XqlA+LCqHlj0gd/mqdi68vNQQuLRrpRCBaa3BFtQyocDfd0Mq0lE/7qCWE1Amdw6gH6lsYcwQQm50cDlgqKxA5Oavt9MTM=
Received: from SJ0PR05CA0006.namprd05.prod.outlook.com (2603:10b6:a03:33b::11)
 by SA1PR12MB9546.namprd12.prod.outlook.com (2603:10b6:806:459::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.21; Mon, 26 Oct
 2026 04:46:35 +0000
Received: from MWH0EPF000C6191.namprd02.prod.outlook.com
 (2603:10b6:a03:33b:cafe::48) by SJ0PR05CA0006.outlook.office365.com
 (2603:10b6:a03:33b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.7 via Frontend Transport; Mon, 26
 Oct 2026 04:46:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6191.mail.protection.outlook.com (10.167.249.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 04:46:34 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:46:33 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:46:33 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sun, 25 Oct 2026 23:46:29 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 07/13] soundwire: amd: fix ctx leak when sdw_amd_startup() fails
Date: Mon, 26 Oct 2026 10:13:38 +0530
Message-ID: <20261026044507.2310694-8-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026044507.2310694-1-Vijendar.Mukunda@amd.com>
References: <20261026044507.2310694-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6191:EE_|SA1PR12MB9546:EE_
X-MS-Office365-Filtering-Correlation-Id: a1a96089-5f22-4320-a394-08df331c1d20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|56012099006|11063799006|261009223027099003|261021123027099003|261022105027099003|261021121427099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TH32U0CAjTJM90UvGUNzTU2XsQr/nVkTAliupaK+m1YAN3rJRVf2qhfKC+JtXbGyPayXP38/a0PBbmzMmJ/6vbuRnQF5AXz3bFmAAgPy+LzTMTmwdndNs4rRPg8k85FSwVYhuuyaJI2hf3o8WWHX0IdOucwBI2MVtLoQH8DNe+UZTFe/OTfdGSD6bi28Pihg32L2EC4EVSk8F4F0y7S2OBfsbr8+ihGxnlxlKCW2YD9OrWMU13sUVF1XD06rHpLFLRjGefWWo/nJhaY89KnGGgJWq6gJEm8A0KHSv+VjviJETmIGybo6+QecNYuVv8jjFxMVtHNX777LGQn3eehVw2doz/Z/tc03Qi1CBzltC8avL9ZvL47dEiAOdLH48lpeTKUJCaq8cP6p7w3IbOO9759GpDQMS2KtxuJmyHsQEyyGK1cb5johJi81GP4mKnv/oHe75EDAQ1Je3RE8IryoaQWxn7aaKBsaOe481Ov9D0NPlD7mDXPr1IMKvmmAuLJ/8Ivq7QMSfQNhHp7Wz+RXEw4Nay8D03sm37Jusch7Iam89LjjZIJZAx3QGwqQnxqpxab9NXVHA8Zw7O4z0CCSjhk7jByFDI2azLMjr5kuXS/cPRTOoUnff/Jt+Yw6y83qGQ06skIM/ZjwB9NsRjDqaGCjCQLF+bl7npfY5lqvAgd8AWBwGTU9ssorqJMLycPlGjZS6hLFOdluNO0F3VC+Bw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(56012099006)(11063799006)(261009223027099003)(261021123027099003)(261022105027099003)(261021121427099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Rc9molWJPlFyVn+izZAMGOfEOHg2LD5YazAfC4yReOKwtt91ZmFsNGze/TXP1EvjE30znSxfOBAVEt/aAuZg6nzZFt9/E3QQyOwhdkFvdV+hQej4ntM5m6mfLex+sEEChWJYdRVuhta++yJ2saCX2nMiGBo0GTiTlhIul4VzBtw7++rrfY/LSW7Z+IDXfb/S/ktU2kV7d3bRcf5uGeuMpOuHQhO4xn8oxVTYoeESLYh91bLr5wIk5MH57g2C0U4qTFf/tKoJHOuhmgDU6LTjwz5b/ihJCQe9Gb1Gqyrp0vvo272r99tzFCZ2ahpVNc4uDYKS00St3aIDj0SwoyHLSza8ZAryFxLMjQaFCeariM/lm+1qzMDSM4+4I1W5UsFzafFN88Fo3fNlhm9atg1+S7Qu0BEGvlBz/NuhihIDYR7KOnQW5Rav7vr4+ijFOq5d
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 04:46:34.9322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a96089-5f22-4320-a394-08df331c1d20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6191.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9546

sdw_amd_probe() allocates a context and registers platform devices via
sdw_amd_probe_controller(), then calls sdw_amd_startup() to start each
manager. If sdw_amd_startup() fails, the error was returned directly,
leaving *sdw_ctx non-NULL with the allocated context and its registered
platform devices leaked.

Call sdw_amd_exit() on the failure path to unregister the platform
devices and free ctx, then clear *sdw_ctx so callers observe a
consistent NULL on error.

Fixes: ed5e8741b8db ("soundwire: amd: refactor amd soundwire manager device node creation")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_init.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index 8e419ddfa516..88004d59322e 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -166,11 +166,18 @@ static int sdw_amd_startup(struct sdw_amd_ctx *ctx)
 
 int sdw_amd_probe(struct sdw_amd_res *res, struct sdw_amd_ctx **sdw_ctx)
 {
+	int ret;
+
 	*sdw_ctx = sdw_amd_probe_controller(res);
 	if (!*sdw_ctx)
 		return -ENODEV;
 
-	return sdw_amd_startup(*sdw_ctx);
+	ret = sdw_amd_startup(*sdw_ctx);
+	if (ret) {
+		sdw_amd_exit(*sdw_ctx);
+		*sdw_ctx = NULL;
+	}
+	return ret;
 }
 EXPORT_SYMBOL_NS(sdw_amd_probe, "SOUNDWIRE_AMD_INIT");
 
-- 
2.53.0

