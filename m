Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794066519;
	b=V6b4kirN8Zm9wSnHSxIofbkmPIaQgTsF3oFpcea2UjDxs8uqascr/m1Ovo86ga6TrZGl
	 LhoSh2ocvQ63FbgkNFOWloC2WH4bffdm+bF7/znulaem9ZB7MYn3jmWC17x9ndHxGNUdZ
	 93aHkr+IDHmThXGM1urtjjqzgEjxO+4uOzM7vuGGKlEIv9e92oJhjIhkLJL6HAuZZ62B7
	 go7oKaBxsclNYf1V7clnRHeI4lhfrtj1NKRI4rWYis5NGQ5QVqCF6lP1fCNo499Vlz2rG
	 JAFx6/T6EaKb57ti0gpfqXwdvZ7/kurcuTwlUa11wGAD2n5BZ9k+ckGOoYQ6j9LxjeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066519;
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
	bh=hba/4DLpukgFxN09f9SIv+Uf3GEnrlHD8EHZzBzElzY=;
	b=WkIVtpyiMdL7VurpVDX22ASQZ6bG8zPVslkDQvE6LnVv1dgHjX2oOMsPMz1kkzem26Hw
	 ApY1WlXF8/u4qT6bMI5zueChtsQyb7nLrhZ/IfXgUBY5k/54HSb3s0QC0WoaIp0lABCSs
	 sTVxjCBfPKVcbtxsXH7lC0WGxInDUkdKviI/45B1T/uq/Xa8nx6YXaXVV9Vqvv3nlGXNI
	 nXPBEAr+kextNBqlDSjEdJF49bQDmfOTzWkYYPfwvWqLNzc5FMpIzrKMA3ubTIGZHhHXi
	 qP8R8MCKZK6awhsa3byC6M9b47qvtaIHSnDiJaekvVnoM1hoBWnEO/jxarMhVjkkAYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=k2TuQt9Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.4
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012004.outbound.protection.outlook.com [40.107.200.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46396082BFE;
	Sat,  7 Nov 2026 15:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C46396082BFE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=k2TuQt9Q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nx7L/aZtt0KJ/72jRzWhObViwl6r6xD/42ThzNqLeaJp47PzNVa1J4pyROnHI7NtMIfs/Itm8XCR6qDAfU6FChQlGmHnMDO0s0jKhNginKOZPJIxEx93UroLJApGlkw31tKHHP4/JeKNoYuIBw8AvFBhjV3TVOheZgJXmVMxqMt1zdoTRNrw0jqIC9f3GIBQ3qW6Qofn3WVsU40Vojqex0314ErhB3qagfM+5cgLH8nYzeamiid7uLfNBvcajWDQk4DV6ADQ8VKL1neYbYyMIUEFzRRQbt4mDYYlNvCHTNx3aSN1cIGARsF2sUFmZozTJ2+blKqXLlaMX6R+XymULw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hba/4DLpukgFxN09f9SIv+Uf3GEnrlHD8EHZzBzElzY=;
 b=uFBs4eCChoUpVdxKFjfDfDORpMSnbhQzqzsgGIcvqQHfMofSTVKsIprRJP1X4xOhPLImn67HMAeYjl1S71nUxg/hK9kSoODHsijYblQx7ziKCsgUlBEyd5JoOXtyJmAWUQ6XX11GVuHVKP/9URrUjbGHa+3F1Rmyrmdq1F6oQolrwobTljYujOig23l60FfGn84mExLlt8ktMvqQfn1i9TjBIlJguXgaUOnVp9wbQ6HssMU47dRhuZ6DcCZKSV+MrX2gaIYPK8ab0IejPSAHJ1Z0vJDaPL+fNr4u7Lwa9bppS2stXBQLVnVuw+OCeHX5buN5rvrzDPNwpvf/No98og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hba/4DLpukgFxN09f9SIv+Uf3GEnrlHD8EHZzBzElzY=;
 b=k2TuQt9QEaKGQWHdobsmmtUpgjaLQnqN3jc8xnqY/ZXec2CXdLmXb0QRphUzGeydsr3OR9e7nycG0vaLBtg++n8u6h6mZ/wy0n+ZvIYjewWRApXtwOeUJFCWfRc5I4zcHXB0e45EUVjpysMXcywACztCFcinfMH3bOoD28mSCs4=
Received: from SJ0PR03CA0202.namprd03.prod.outlook.com (2603:10b6:a03:2ef::27)
 by LV1PR12MB663552.namprd12.prod.outlook.com (2603:10b6:408:514::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Sat, 7 Nov 2026
 15:48:35 +0000
Received: from BY1PEPF00026968.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::71) by SJ0PR03CA0202.outlook.office365.com
 (2603:10b6:a03:2ef::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Sat, 7
 Nov 2026 15:48:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026968.mail.protection.outlook.com (10.167.244.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 15:48:34 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:48:34 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 09:48:30 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <lee@kernel.org>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v5 07/25] soundwire: amd: remove STATUS_8TO11 clear from amd_sdw_process_wake_event()
Date: Sat, 7 Nov 2026 21:15:16 +0530
Message-ID: <20261107154659.3358223-8-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
References: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF00026968:EE_|LV1PR12MB663552:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc4f462-f795-4d73-fc5a-08df3ce6950d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|10067099003|22082099003|18002099003|261022105027099003|11063799006|56012099006|261028144727099003|261026140227099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	rAfXQpzo2cvUjXA6RSAR4pT5Vfaokxv7OSvQE7m145eRscRFHoRHQpV5m862E4LKUwmFnunSeBTpD934OHBHFplMTj34kqHALvunyDFYByZGhQ+qcUoj1pHO4U3ny4Rn9JIK5uUpxT8nBEGicRy5gWHw6nHLI8QS35d9G1lM/FGhLuI1yyOs0X8GZ7gdpnH3eDMS2HHorAuGiF0mOflyQZN6mC/K57yAh8ezqgnU/Xllsxg1F9+WmKBZOELCoCxXS6tgKPtA1/eT1di08fcBPMhFYnOy6ZaUuLRU4YUaTFoAd+90tlvgqcKqo8SP8RVq4w5Vj3AN56LHi3V9QEDo/FGmTZkUw4j7Lu/IvaHwM5LMFF1KR6QhUNoOHwRFvSX5H9c46MOhHD94+ctLQE7vRcYSe5ZIoQc/x5iI0qylcpAjYRH7NKx+vuDkY4WpY2JfyKx9LASsCHG14jFpPyRQ2WPJ03KddV5ko5Q0WzF4gckLR2b5ojnTh8FgeXMB2+7d0TvFCxvnUd4+Ki5isO7RwoiPxA5iJ7VRvn85dfP/ODrLl/4pGnwXqFUFhwuW20I2e//FWoOGDE7YkVuxuhe96rusVm5quvoEbSkr2Dj1+WsYgAvf5omg1VfWPqn7yMjS0Qb6xT5yr4Ju6yxB5xkE116ggJpCv3Z4Ficjju+oP1Ulr63OV5YdeOjNnutR9nk5cCmmWrhcrTcXdi5LnCtnOA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(261022105027099003)(11063799006)(56012099006)(261028144727099003)(261026140227099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lpTXCi7uEWc08ZAUAhC0TR066Zlnpg5uLqcqUvC7lYgYshCQD8hD3ZTJWCK2G16xybmJrwccDERcL/nQsWXRtnJ+ty3GjGOXsYP5+bFM1cZ5eZcbfNiYFlMzSdTU6D+ggD5SZYDKZcoTsROfst9e7wpgY7m5T8Sr/3O+XXja8ACeeibFQi8g4VF3UDa+MPYHG+ruytASspneLwvExgDLsCiXp1xdRxzgFjNRmgBWM65S4h1dAz2yFh0eIVdkn6ncgiRz71yBI79kHATq696sHSmB+GZVCgnnSK5EUhztgBOhZtrGaAZkzgx+co5nn8M4Kt83Ivo9GpV73LlQ+uhrLKV/PrfYycEZi1OVKPZ0GaUsacvh+iaARACc9cXgq5GugCXuu8vMBapqYEJDjet7+a33DeLRhxt+9Q7j4weX0hbnDgsd1WOKXGzHg+G8uu0E
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 15:48:34.9481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc4f462-f795-4d73-fc5a-08df3ce6950d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026968.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR12MB663552

amd_sdw_irq_thread() falls through after handling a wake event to
process any coalesced PREQ or peripheral status events, rather than
returning early. With the fall-through in place, both
amd_sdw_process_wake_event() and the tail of amd_sdw_irq_thread() write
0x00 to ACP_SW_STATE_CHANGE_STATUS_8TO11 in the same invocation.
Any status bit asserted by hardware between those two writes would be
lost before the next invocation reads the register.

Remove the writel() from amd_sdw_process_wake_event() so that
ACP_SW_STATE_CHANGE_STATUS_8TO11 is cleared exactly once per invocation
by the tail of amd_sdw_irq_thread().

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Fixes: 66c878838f37 ("soundwire: amd: handle SoundWire wake enable interrupt")
---
 drivers/soundwire/amd_manager.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 65626ca590c9..438cf52a212c 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1093,7 +1093,6 @@ static void amd_sdw_process_wake_event(struct amd_sdw_manager *amd_manager)
 	dev_dbg(amd_manager->dev, "SoundWire Wake event reported\n");
 	pm_request_resume(amd_manager->dev);
 	writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
-	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
 }
 
 static void amd_sdw_irq_thread(struct work_struct *work)
-- 
2.53.0

