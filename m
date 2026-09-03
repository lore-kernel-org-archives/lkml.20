Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013042.outbound.protection.outlook.com [40.107.44.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A557331209;
	Thu,  3 Sep 2026 03:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788406739; cv=fail; b=q/ZmV+di5TMTUrRw0I0+FvPo1hm7t3+pSH/CSPIRbVp0bkcAoPVaTPZ/tmwLGpU8Vo8UzL7pdVGpkJ9Eg1OgcbAXOvEahoXWk5LJctFLl6psROUc0t9KOAGZityH8LN0P96D6otv8VHwDZjdQkLYVQvud64I9J0sM3t3nWtqDDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788406739; c=relaxed/simple;
	bh=DziRhQJV4R4d79dR+FNMTeDbdNVfNlPxv6Vl1/YfwWQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J0+OH0p9zKdHhQvliZ5CddzSuhR2RtgTee0OoRkGJas2pKvpC10TZzZvKgfb30SX67Km/8Aart01D9//2Jh9jFvgy6hvU70X0MLSE2UFaDnjuCf45nAw4fk68u9CoOkcC3HDkTR3LUe3S2OhtshMgaJ011EjVnV5VPYvz882iX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com; spf=pass smtp.mailfrom=nuvoton.com; dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b=S33C4ZwS; arc=fail smtp.client-ip=40.107.44.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b="S33C4ZwS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wT4z72/oHpsDFrT7856stzMQfWI7gPMYpFEtNkTqjsWNLLgssk01YBKYHUhpoCS2liW2W3xljYqDBnU1UJ43pXG4axp+rBr3O12pjsYVjLm7vXz/a2fKW3DsIuIqBbwip1AWyebcAtH9b+vRaawmMIWuUBGYebZBTMzlkjZyW9mbC9dnF1WD4sMgNxAJtuMgTYt6R35Vrl5Q/PGw/AFiLJwRPh8HLgZaTTQbaJHznwyteYe+qBUeBqpyvnP4Uu4NOx+o028XMewnRoMBpWqjLO9jQmSmeVetEaqioCbVMzPch3bnzghAXp6xRaSaOojBQ68klRZ0QGfOskCXe28i8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGwqWbUmqdL5t/OuYRWH/pbfxzlJpeAtdwpoMXRhuhY=;
 b=odVNc+E6cvPIy46JU1i7zeAwYgpykeYCkBtuSGTxwmhwcYaq5t25NHiornimUxJxTuVenQ909orSb+03RgZvBzBM97VxS9+MQ+ou5f6JqznCI2tqA1bb5f0oEblLwu0Y25rvE7wYKkw0QQK+nYxkae8mrHI2shLyiqLtlvz5R1Go1iahtGjD7lKm8PkaRUuPg75vk+GW2WGn1F56GooKp8SBT/sniBTqX/c3t1Bphs4qQszbscs4SF2I5mFUM2b15syqSfzoPh9Zx3x6A5o8rhwDRM05PCGhp+O7EykZpYvEbHHkUhe474YxeTXLH2Yt5yW94gTkLVkt3zHdD5dHJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGwqWbUmqdL5t/OuYRWH/pbfxzlJpeAtdwpoMXRhuhY=;
 b=S33C4ZwSwOSTyY2Q3J4IUGPBrtulvZw/E29jstWFoHxiTWnK0Z1uNjTZWbGO3HOy0OdhlUdg7YhtpDP7bVtSJxFP3aU4FKPFTcyawAs+OrTf/WEXNNFHxC+KVqSOK43/nMiaf5pukU9qQX15NyvzgmEMDFhZDMwwugR0PRxvvIpHm7vdSdGEGXRxopFDjZGQFiBa3GWiuP+t2qxDCkfBHsMmK61IoUxVXEM7oQrBntq8FOB3dhwAQah3V0ntvEZRZuUsVd5Hr3b9up+DMJFwJjV7mLqyZK0fxLI0gYvs0faCn0PNryfGkbmsC8CFJXZVJOlf491beWAy/3Roasyacw==
Received: from TY4P286CA0032.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:2b2::10)
 by OSQPR03MB8385.apcprd03.prod.outlook.com (2603:1096:604:283::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 03:38:51 +0000
Received: from TY2PEPF0000AB85.apcprd03.prod.outlook.com
 (2603:1096:405:2b2:cafe::13) by TY4P286CA0032.outlook.office365.com
 (2603:1096:405:2b2::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 03:38:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 TY2PEPF0000AB85.mail.protection.outlook.com (10.167.253.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 03:38:51 +0000
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Thu, 3 Sep
 2026 11:38:49 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Thu, 3 Sep
 2026 11:38:49 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Thu, 3 Sep 2026 11:38:49 +0800
From: Neo Chang <YLCHANG2@nuvoton.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>
CC: <perex@perex.cz>, <krzysztof.kozlowski@oss.qualcomm.com>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<lkp@intel.com>, <neo.chang70@gmail.com>, <kchsu0@nuvoton.com>, Neo Chang
	<YLCHANG2@nuvoton.com>
Subject: [PATCH 2/2] ASoC: codecs: nau8360: Fix kernel-doc issues
Date: Thu, 3 Sep 2026 11:38:45 +0800
Message-ID: <20260903033845.76540-2-YLCHANG2@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260903033845.76540-1-YLCHANG2@nuvoton.com>
References: <20260903033845.76540-1-YLCHANG2@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB85:EE_|OSQPR03MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: d4033555-a811-462e-4fca-08df096cdef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|10067099003|3023799007|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	LZe/+TuzVm7takwRS1AiBGOVsqvq6v8EhSutapKH590SD71NjwK3qpW99ThNPq4+RwkLpllGqsRspINIsJ5mwCc7y5owMd/L7f05RSmLp/P86qWofVDopz6Cl0+l8lgx9aUkvfLT9/n6g5AL8C/25G4AybF70RUERTU4xCXoPcw2arS7J6/cbqpQr5v9tzjAKJIaYVWZVSqV/gidsVpj8nOi4E0D9t8YRI4nf+KQl91tXHWV2mJhHkbQ+DZc2WD6ZHO4yVMuDqrBq65pJ8xFCQGTXBDFbXsIzq3uv1S0ji119qSyRmvbzmq0SUcUlofHWq69PpPmzUU0frxUrpWd29IWwE/dmMJ5rVXnELpneEA12c50LkEYyfKE/duaYqfuMzS7nJFzQmSreUhyqOWa1UKp66f8Dj2xJ4W/kVXBrbcA/tGZc+AnRhqNm73ODPup2REQq5nyuH1lxqu4XZFsWq/hoRtMooT6Gx1TEPWvDNP/pw62EsVmIHcu9Awk3tYeeDWjT73qR/n5M6SldTGsp78Y2q9npD6Rm5soFKEWo3G1cuYqhd10kVEAHo2LvQmQvkHz13vsMAqQXVrM8cC7I25xKeBljNs815VEYT1FHiAI9rX+MN5tfs0F3nfgIibLR4XR6B0uGbDyBJNdG0Z1Y9VaD3O8IQKMus2iJmiOMV5wyOhIm0rRqPc2h0WJXpCGI3DwOMkLd1i+QNRmWeGGMQ==
X-Forefront-Antispam-Report:
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(10067099003)(3023799007)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	brP2Mj79qs8jIyKIbi9Gu1/EAyIFZORMbtBcud4kQBwl/B/Wwq9lqBaBnkCFGbUelNpcqhjxjwsvr7G7/QE1DI6NVdokBoq78Y28RmyshhZA+jyDlwPXZQFn8vzXgKg4u6QrUkWVygGUKkywqkuzZHegtwJch7RoHaSn/TJYcgWUmwj020AP0SxeYDb8wrcbAQ7OTLof+C7+iH8uN3AgsF0GC+2Gjzw2LLl0MckaNnG8D3paXSls4HsRPLvG9aF/zNmFy4skCnZ2O3FnJKM/LFgHdRske/EbQ9Z1AYl0kxf+pJKZuVpX11PDGP+6aoxYHwpHHtjF1lLu2SvzujUCtcdfBJkk2oH/n28gGbPp6q813c1cJ8ohn3vbRAnwrGGrJWX+bJb2PEIqJbfAbaAjLKhVL157Wo66dBgbaUmRueXQ3XzTKuZAbOBf2dnCx/Pr
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 03:38:51.0252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4033555-a811-462e-4fca-08df096cdef0
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB85.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8385

Fix various warnings reported by the kernel test robot:
Correct kernel-doc formatting and warnings.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609021537.D6X4Dz93-lkp@intel.com/
Signed-off-by: Neo Chang <YLCHANG2@nuvoton.com>
---
 sound/soc/codecs/nau8360-dsp.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/nau8360-dsp.c b/sound/soc/codecs/nau8360-dsp.c
index 41afccbea2c0..2e5b61bfc303 100644
--- a/sound/soc/codecs/nau8360-dsp.c
+++ b/sound/soc/codecs/nau8360-dsp.c
@@ -39,7 +39,7 @@ static int nau8360_dsp_chan_kcs_setup(struct snd_soc_component *cp,
 		.cmd_id = _id, \
 	}
 
-/**
+/*
  * Preamble Fragment Masks:
  * FIELD           | BITS   | SHIFT | MASK | DETAILS
  * ----------------|--------|-------|------|---------------------------------
@@ -53,7 +53,7 @@ static int nau8360_dsp_chan_kcs_setup(struct snd_soc_component *cp,
 #define NAU8360_HOST_LEN_LOW_MASK	GENMASK(17, 16)
 #define NAU8360_HOST_PREAMBLE_MASK	GENMASK(15, 0)
 
-/**
+/*
  * Payload Fragment Masks:
  * FIELD           | BITS   | SHIFT | MASK | DETAILS
  * ----------------|--------|-------|------|---------------------------------
@@ -63,7 +63,7 @@ static int nau8360_dsp_chan_kcs_setup(struct snd_soc_component *cp,
 #define NAU8360_HOST_PARAM_SIZE_MASK	GENMASK(31, 16)
 #define NAU8360_HOST_PARAM_OFFSET_MASK	GENMASK(15, 0)
 
-/**
+/*
  * Trailing Fragment Masks:
  * FIELD           | BITS   | SHIFT | MASK | DETAILS
  * ----------------|--------|-------|------|---------------------------------
@@ -76,7 +76,7 @@ static int nau8360_dsp_chan_kcs_setup(struct snd_soc_component *cp,
 #define NAU8360_TRAIL_PAD_MASK		GENMASK(13, 12)
 #define NAU8360_TRAIL_LEN_HIGH_MASK	GENMASK(15, 14)
 
-/**
+/*
  * Reply Preamble Masks:
  * FIELD           | BITS   | SHIFT | MASK | DETAILS
  * ----------------|--------|-------|------|---------------------------------
@@ -364,7 +364,7 @@ static int nau8360_reply_from_dsp(struct snd_soc_component *cp,
 /**
  * nau8360_send_dsp_command - Send command to DSP
  *
- * @component:  component to register
+ * @cp:  component to register
  * @cmd_id:  DSP supported command ID
  * @kcs_setup: KCS setup structure
  * @dsp_addr: DSP address
@@ -454,7 +454,7 @@ static inline int nau8360_send_dsp_broadcast(struct snd_soc_component *cp, int c
 /**
  * nau8360_dsp_kcs_setup - Send KCS setup command to DSP
  *
- * @component:  component to register
+ * @cp:  component to register
  * @offset: address offset relative to KCS start
  * @size: size of data writen to KCS
  * @data: data writen to KCS setup
-- 
2.25.1

