Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792990002;
	b=Y08302WOq6JSYPCeQg/1UzSSqhJSfsY9L+jxv0wB8mHVX1cF2VijMCxcSI9neT819KPB
	 Ro8BJXsfz8LbkHFSMgl4M4D2mCYLquV2YmrdivLyr6Mwlw0sBMhbl+hAYpxoT/ZE4fkxq
	 PT4TBdds5ZR4hjM7mst5RZCGrbpPkTtH9ugFxJQ5lzxqJjL42CaH7gKa/PVXPkcCKQy1u
	 ZlM/jQEW2iLltp8r4ofMM2jCFakrDpSHcelF7pBefa9Aomd56RzHIL13VjM+hejZfHwRL
	 KvDNZGc3EK/TC/T1Ky/Lqx3JgRhmw2IniJ9vkAYJsjjQJEwKh33920HdTq8UaDZQa5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792990002;
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
	bh=jrQvENxo2C2izterAEOUX10dy2hz2HhcG6Vg97vREUE=;
	b=MRWH56zJmP5mfniJHSee8OSiPHYioI83+CvZKo+x5RxoUNATh3oo58zoJFfLBpcBala0
	 9Xsci6pu/LHQQck8LBFUbhHD6FEpDbrsIPNKfDg7McxELcM/5hb4PO0zSxUH6EFwkQaXj
	 HB5F1ORUlAaUCPxPAgRV4a5e1YDBymX0fAXk2lKEjcI43s2gMkBu9XTZe/zt0lfszZNf2
	 GGIHHLmvNEK6z1ha0ufNwFeuFyd2ikivrIjjiMDwH8XjgyDjcxOPUwPB0GNdcFYPqk57c
	 6hgyHBHA17jxslzBVJKuWUdvReNwwdmPsp9OY6NXqXlIJAsOMXLDFVDHkwMkwkxPgCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=c8dIjLJG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.66
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011066.outbound.protection.outlook.com [40.93.194.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8995A606A335;
	Mon, 26 Oct 2026 04:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8995A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=c8dIjLJG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcF6MngxSiFLNNPFNya7cxF8j+ao2WaEEr+jWw9vUF1haLTdMzhs57AyOnjccwcc7Y0Eil+pmFOi6JvdVR9kJ1kDxi5hIUh1lQtXlS32DUrg91QyHiU5liB9OnA3YY2guNcnSb6P0e9ShGUUwIgRYx0KpoGvMAzyYN5nhsHA/62zt8ALiHwP0YWa0gXODlGp4sKHsMuUotMJi/VLRO8W5CCsdbPmeVyKb+GfO31My/ikLB/KmuPwJyHR7V2PoRRgTiZloAZTN2xE6Dmw2SXCmUAgBH0JpXYbs2gyF296bJMc9dnh53odmVwV4nr6GRMmxx9czxarHGZNqWDNh++27A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrQvENxo2C2izterAEOUX10dy2hz2HhcG6Vg97vREUE=;
 b=H0+MLj0aOAmUb1YMP96U8E8UhgVfjl/HBZRG7samXwBz+wdE0KaKSDcyVG/TjrqJ0se/ObsH3Ce8Sqibm3NRr7XXeYC69S6TMOx+8OR4K5L9W/PEa8zFzW4S3RjxRgtjzxwwIjaYON2hJuahQH3/Kq2InbQOMrrEECrQS73/y8EvJOxBTX88o7+0GkfJH7hG7Bhh7gFfhIodyURXRHZpifUNnF+0Bap/y+d/xwX623+twdo+LWWdlqrF4vPmICO0olKpq+JJaJWLtETXj1orGS76cWkXhVQXlg4nLiiR9TRejrBhPyn8dooB/WpI8CODrybk9l8XAkLXgQY54Lgpag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrQvENxo2C2izterAEOUX10dy2hz2HhcG6Vg97vREUE=;
 b=c8dIjLJG6mvvjch1GFDbV18J1ujTA+4A2dSg2+ZePXKlNTCvV1cwAO+Jh+NzB//b6blCwV+KfCLVsuvFQTIfY2M936gqknposmhsTj+l4gsD48U7sHTPDNtdgbizPywDcGHKfe579igAg8qlkDSE9BNbGgL+9IpE+VMU/zW9Ov0=
Received: from BY1P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::7)
 by SA3PR12MB598757.namprd12.prod.outlook.com (2603:10b6:806:52d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 04:46:39 +0000
Received: from MWH0EPF000C6190.namprd02.prod.outlook.com
 (2603:10b6:a03:59d:cafe::32) by BY1P220CA0009.outlook.office365.com
 (2603:10b6:a03:59d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 04:46:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6190.mail.protection.outlook.com (10.167.249.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 04:46:38 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:46:37 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:46:37 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sun, 25 Oct 2026 23:46:33 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 08/13] soundwire: amd: propagate amd_init_sdw_manager() error on resume
Date: Mon, 26 Oct 2026 10:13:39 +0530
Message-ID: <20261026044507.2310694-9-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6190:EE_|SA3PR12MB598757:EE_
X-MS-Office365-Filtering-Correlation-Id: 08addd52-dabd-4f85-c100-08df331c1f1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|261009223027099003|261021121427099003|261021123027099003|261022105027099003|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	kPrJ3tbaT30+WNVzruIbqvMZvfzlFmXOaPADYj4LPgVIuRfZ8t+CIVcGBg2UiIqVGKUm7ncl85TErotNFcI6IVbXXl5yzSV+hdITiT/6K6J85rRMgsQ7yhLlHFDuQ9IB38yf0LA7qb7bAMF8S6TFE+naJBam42txVLWWyQt6RonUBQiHmmMO8FHqmVs/TljLZ2vOfRYZ7jfmu2eTv8+HEYO1Nfbu+E2e65WtyJfd6RASKNYqu3qj9mjlQ3MIG6OHd+jBlGFlFHDmu3YApVwzXeYN7hpgCvwgVZIbqpulDgqoh3+CO2IpLppnLCkG08gcJnvVFxGqRLlt/dqB16h3N2V9H8OFvL3icgBJP1Ya8B3IzlEz0owOx/Sm6u8+FQ9slC3eTgHgI3hsfhHW37dvq0mw+rYXdFPGshJaCnUqVhsSIT8kcFFnFF/LJSIDdmEsuha1hL/MUbfjHSJutldoWwytBBOv+4hW/cERkyH1KY80P4ehLJVRbljHQeuOKxhxn5vBlks/jEP48Fdwm1kEN7SYN8hQZzBKijIjmX5U6QZTA29CW8z5WittU/cameiJbU8GGPmrZhflR8pOyIRvt9YRaLbHrrP3kAdpeZg7k82AKowBKSU394aFY0ypQEmNStLVJ+MW1hdu9CTGH2dQ/m5nyHobTTukG56m/Zis+p+64jhayW+Fot0RbGkGkv1fYcvkrJLs7tDt+IwQUgDFCg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nvjlqpBbYYPJBG6u8+zC1kOiJ9MCpDZh48Yq8bw0wuz8XDT48lNViIcqPmYkv5G1w87YFoogVi0KEGvLMEz2Str7HC20yDMjsjy5ksGML/ws7ki/Klfnj7Hg68MJmqXyk0vCjTTmMAYx8/wOnodeDGFRz2sV+W12+Kn7SGUUYJjol4wsEKXojQH5QnCYnP6WlS6QsabsMhtPNLmk9akz+6lk6wgqWd9o6bbZIoGY7jFbLaweObbnEboKmZ03rt1UqRD46T4ii2B8HKzTAcRpI7FIF3kMCatBscvAuR8Ipt+9THIJxGLFGxyWnCM89gV1KWPzYCNNS9CDdcON4vf7KNA3TzjBTCc3CMXitHFoxHn7IJD4YvGdUiJNiY+1WntDZooEKMFthOuUXesbJeOdRpFu4Aj1jKa6cx03W8AWaQf9JGxYoSLDmq6FTUpdHr76
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 04:46:38.2653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08addd52-dabd-4f85-c100-08df331c1f1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6190.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB598757

In amd_resume_runtime() POWER_OFF_MODE, amd_init_sdw_manager() was
called without capturing its return value. The function performs
hardware bus resets using readl_poll_timeout() and can return
-ETIMEDOUT if the hardware does not respond. When that happens,
execution fell through to amd_enable_sdw_interrupts() and
amd_enable_sdw_manager() on hardware that may still be in a broken
reset state.

Fix by capturing the return value and returning early on failure.

Fixes: 81ff58ff71ad ("soundwire: amd: add runtime pm ops for AMD SoundWire manager driver")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index ccd97bc6b757..8e1339ed44ad 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1452,7 +1452,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 		ret = amd_sdw_clk_init_ctrl(amd_manager);
 		if (ret)
 			return ret;
-		amd_init_sdw_manager(amd_manager);
+		ret = amd_init_sdw_manager(amd_manager);
+		if (ret)
+			return ret;
 		amd_enable_sdw_interrupts(amd_manager);
 		ret = amd_enable_sdw_manager(amd_manager);
 		if (ret)
-- 
2.53.0

