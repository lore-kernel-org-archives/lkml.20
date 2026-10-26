Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792990004;
	b=U+SAmX/Tb0SXtpu/GMYx+OZ/OZ+e6Ey5RmIyLuLfgAqmPm74/AGovb2FGNTtV0kqiHsL
	 H0C6UCNWanIjZD6kEhLTqrQcljyGtwJ0jQMOjgom2HwubJykagGsUV4vrqEwhmcj+7QGQ
	 Gv1k7M9qFMVgdHgZEQ0H1kBmcIfYhrCslsF9nngaN8R5H8sbCfrBnaN0sSlmVQxESDOxY
	 W/lQiXlucdSarF6gGNdpgfLd+Lx6yxTATUWVeajEl5lXKeGtlRv/cEES1mT+BpgwSbezX
	 YXa1sZgKCYmmKSxaoX0DLF8TyV8Vw/TZU1wgagarsl5pjXyEHIz8ofNs+BrLesYYhCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792990004;
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
	bh=Ht8+AThpY03DZBr+poMzHD1WyeKQm4AA7I53oNk30bQ=;
	b=BJtn9C1GpAP6Zhjv67tWacWj9Cuv7KNdVeFMWjifK+oyBWp/TuxECI+8QJ+B7KtIUNG2
	 BWKkKHdFHmkxBAemHHy7rvGFXWG1r6hOcGYjBNH8DiAJ42AIA26EYsO63UBsLbTePb03P
	 mtzsvwuDLAWIV9tqI5lgWJVz1crJCi+53OPVdi7yqTZeayUuUsXqC+lAeOWgoE17VUe3O
	 LZSpFOdpfRu7f8CBbfsQj7TwjxD/cQp9FK+d+ZpSHIJp8PgAW4KNtHQ4TLq2ADSDH+yC3
	 8sDd7EVaSx34AC+fGgtgoCYVVblT1gsl874gmV+8fuYmZEkVjs0AfzZZPZafPfNGpbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Kw6tMlXu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.67
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010067.outbound.protection.outlook.com [52.101.85.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1756606A32D;
	Mon, 26 Oct 2026 04:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1756606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Kw6tMlXu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8ijWXeBaqHO+U20WuPlEZzYthYWnivSC5LyfzsMkDg50P0sQsArSkXp+Gj9diLiD27chrRB+b8YVbuZYceJZAlfVNkQB0cYWxR4g7o/3TFkNX9OuWel3+1FTxp+JxeCqbeYBMmXi/9iNbzMqvEIb7FwcJl5kiN1x8oktiPduMZizmKuS5xNluKgmZVpPkU4ThbN6p0oLwHU9Ctsc+DZ5+MYcx2XEUqSewZknKVH7GXGtPzGj9L21cAGalTRt4qHBcRQoeOcrB0HeFu1i9jOIZvhr9PwIsrwvHIf+dG/ZULfWQCBM4Gmi+ZtT6u9utr5c9ILGLSqvxzE+3TDCZ8NfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ht8+AThpY03DZBr+poMzHD1WyeKQm4AA7I53oNk30bQ=;
 b=UuWVbe5VUREHVw8vi0JFOR/ss/YIdzHHEMa00QVGubWI/sOeNt3W2EIDU1sjS5uaeNHBUllgZfGJs3rXb0HkmTfuMEyFwKIrOknEk45g7dpzbEmstK64fyDLkYG5IkoDuYGjQe0MifLWIHKVik//00UbjOuXtMXDIpnSG+24afwFITCajcUpNvkgfKmqcgVglmNM4B0AweeLH8OYAa9RxsC4kHS3MNhZQ9OO6sU/R22Fl/zUV+mh0rmkucfIerw6Z/uPTV4Z9wXYzQBAJxujx99X4YKAKtv+hwmB7Y2iuzMDEDElxMmquLxVgWLOv1Jh/MtB84+cevIuaZX6xnOvYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ht8+AThpY03DZBr+poMzHD1WyeKQm4AA7I53oNk30bQ=;
 b=Kw6tMlXu39ZJGr3N5x3CRQiptSFXxSZA2f0MeOQReYxCOZseuOC2r25K0rwYb3gKcjOyyD9hzmZcB4c8LF5HiyLwzhLvd/pPdQ4724vn9bpoVBnxH2kd834jmefRaquA+gzSR9b8NV448J218FB8/YpwF7XgAcXbGiTRF6JxOaA=
Received: from BN9PR03CA0109.namprd03.prod.outlook.com (2603:10b6:408:fd::24)
 by LV1PR12MB399762.namprd12.prod.outlook.com (2603:10b6:408:50f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 04:46:41 +0000
Received: from LV8PEPF0000005A.namprd02.prod.outlook.com
 (2603:10b6:408:fd:cafe::3d) by BN9PR03CA0109.outlook.office365.com
 (2603:10b6:408:fd::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 26
 Oct 2026 04:46:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 LV8PEPF0000005A.mail.protection.outlook.com (10.167.245.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 04:46:41 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:46:41 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sun, 25 Oct 2026 23:46:37 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 09/13] soundwire: amd: drop amd_deinit_sdw_manager() in POWER_OFF suspend
Date: Mon, 26 Oct 2026 10:13:40 +0530
Message-ID: <20261026044507.2310694-10-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005A:EE_|LV1PR12MB399762:EE_
X-MS-Office365-Filtering-Correlation-Id: b732a8a8-12ec-4166-efdc-08df331c2109
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|11063799006|56012099006|261009223027099003|261021121427099003|261021123027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	kA7BtPwPsI82i0cJWWprSsF4GBSsYI+jY0GRdJYgExsbPTsuDeTuX2OLynKcPw5CtDVPpzEMNUN8ZBwLgMouo8gnyGgn5ONjaDGlafD4tJkHykzJemufcsVHuddGUx1l1McgQrxCmkgymTLGC08GTM5D/6o3vHdThFwWmXESK9yBaj7GKstbUrQ2ErYhWtFjeeoExc7wLJu8J5euaSNpB3uHfjKJc+7O0qr7adPZCpCH83wcGe9BlX9s+hvnkzgizslrpX5h8FmBRq5MAKeQja/FYG0G9CADbzagtsEN14qd5ZpjTXeU4UwWh4BeBNRV9rJIa3xYxkSN2yYw4qag9XJCFGzeUSNrEklll8Yq3uESxcWvyhSWPh3VBjvSEGG004NaJJA3wiww+7osJ+iikhNG/DO1t3+lGpOPCpFY3BNpNwlttAZFFlvjLvWxAjEZpDlwU0RnHLy5HHM1H8IrTu92AxJmuQsaWov+xh46WGArntdsoEifHtYjFNiLFoVC2BV6K2E0O1lQG8yj4wPLL+oPgd46qlq77U2WbauLAdDNRV0cMygEw/s1cpaBjKLFme50gAflub2p0IWljaNsB5PNHwsoSdDgcN6l56xEKXwQSNF5yEf2wLRb4T/jD+RVcTfw1ODvmvBfhCQUd7lyIjoaJwGg+IgD+iIoiBcCaw/gfJguARE4xr4YzKavoZ9qVdNa2vNVlqHfGI3kLD2JOw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261021123027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	L4DIhq8o5R8Vz1AO3Gm1CpmluC/+633d7TbHGlj5GkSJ6jL/8Ib8sw4OewZA7oEL3I5sU5kL5ZxMIxNw7+wN4cBPZI4YFrv5Fr7Exb2CzOrPVW7PD5iD6hIRk1rfbYIQEtrvzN8oklpLeuI9KD0Yj9ArAH7bwS1IYrzx64HibuZ71rYkKQCONObF4/31qYgSdH4cJNfbGV3GskNnZvmur1n8JH9f++eAkj/hBuF5rnQau7Ps9aoq50wSQge2s792pOHRg28EWWIK5sXT1npKm5kMWZ5GyaGRQOZ1p9N1JimAgcrU8Ish0xdMhARm8dJbk16+Ed1IBI2rb0iik7VnrAgEeKlsP6Gbi+SA1VXJKUbHJdmTMaAVWVKUb3tQSIBePp7AdzDe9pXKA30N+bTnYHx/zB0zPwTnl7Ufp2/ooYduOONNMtR6OpppEv31gxgZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 04:46:41.5883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b732a8a8-12ec-4166-efdc-08df331c2109
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000005A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR12MB399762

amd_deinit_sdw_manager() was a small helper that bundled
amd_disable_sdw_interrupts() and amd_disable_sdw_manager() together.
Expand the two POWER_OFF_MODE call sites in amd_suspend() and
amd_suspend_runtime() to call those two functions directly, then remove
the helper. No functional change.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 8e1339ed44ad..570a4f0c8372 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -146,12 +146,6 @@ static void amd_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 	writel(0x00, amd_manager->mmio + ACP_SW_ERROR_INTR_MASK);
 }
 
-static int amd_deinit_sdw_manager(struct amd_sdw_manager *amd_manager)
-{
-	amd_disable_sdw_interrupts(amd_manager);
-	return amd_disable_sdw_manager(amd_manager);
-}
-
 static void amd_sdw_set_frameshape(struct amd_sdw_manager *amd_manager)
 {
 	u32 frame_size;
@@ -1332,7 +1326,8 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		ret = amd_deinit_sdw_manager(amd_manager);
+		amd_disable_sdw_interrupts(amd_manager);
+		ret = amd_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
 	}
@@ -1376,7 +1371,8 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		ret = amd_deinit_sdw_manager(amd_manager);
+		amd_disable_sdw_interrupts(amd_manager);
+		ret = amd_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
 	}
-- 
2.53.0

