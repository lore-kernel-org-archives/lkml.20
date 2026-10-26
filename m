Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792990009;
	b=W5S+VfguJXXCdqWET9eoOMBJe/RicB9U/8VOBSlzq0btM7q/18qwJRatjeJQZ940qpMf
	 UKqaMJcvG3YGBG0eCO6pTktXTzSLJ43ELmTET2YklfGcergKwTMcCC6JfqU96X1pgjgDX
	 I+WZgm5VXjlgpUwdPL3nuXVZ5heWpPu1i7B99EedFUTnnTyZju5Fx0l7FtSnh1EL4yB2L
	 KwbdbeCE6iDOVOU6UyM103ER4PD9Vi8IlAPeCYUdw99r0PU65H3AMDFNWk7fv/gjF8Bds
	 74OKpd58xB5tPbus2UHxpiV2nH39YD7lFV4yXJvp+Cqy2nqJdU2DSEpSiiUK1b4/qXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792990009;
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
	bh=33l33zkeMBMEeEefMcklCnDbk6+wCvBqvPAZ2t2eN+8=;
	b=bhgzHp1X0SvZSR/aJE1TXBc6Y3hxOvqfwB3/4wLV07N8gQR+Sg50QqJpKFzCdLU6MfTN
	 E8aJ5tvM9YzoZKUT131xJl4FWDV2FYb425d1Z16YypC0WdB1WDee345rcBGCBFwnR0Is2
	 0NmCNs3a8HaqxShiCmgVKATiZcDrSHAnp3rpahrGnbubfSXpQ39+OafhwlkouG17bOAA3
	 TXrWQefZamuQDKzSr1/RwfgJKHFKt5EUqg6eC5vrgaMn4SytuFgyt3fRVIVLM6L5lBc9W
	 XbKWvAlW27e16qseB1gUckIylkApBggeO/+eAEXlPiVC/1LvXVxkR+wxCIkbZUy/JEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="mC/ztFIP";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.60
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011060.outbound.protection.outlook.com [40.93.194.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23112606A32C;
	Mon, 26 Oct 2026 04:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23112606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=mC/ztFIP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FKTu9L9pzqBmVyrgNZsdPYrBW8T03VaFEWwzuVW8YFp8vWDRYu2vN0zYhO6/2CAF2shKmZvtoxbVf6L8Jun+NEtS9W0yks1fR8w2lfmGpeSgdDy/nJpvA2ScWiEUtqIcxvuRKdKeeC2BVPvPMSNARNmYxo+LWOlGxq6daaLvR8K1TH3sgr8V2hMOFVAgomjdeBFVOZ/D+NQtNUzO/Lpi4QdwUPBqirJ6j7P+ak5AnBJ0mX93CjMPvw+88X6kVQOVzEpm3jKw74o2mH0pbHZHkoSv+x/5QsRth58ZKyyqzSA2nvSaLQKgBp/dQ48EJRFk9UYEvYrsShcv+dBh5Xsglw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33l33zkeMBMEeEefMcklCnDbk6+wCvBqvPAZ2t2eN+8=;
 b=ym3P+MWybvZDZFA7BfIpkCmXbLR37oci0FV10bNCyTqoZVEVLTdmJR6Bl7xotH3IGk0FYELepRQnc2QXdt8ByQO56nJZQbNpefxnKl+5Jr/8ogLZJAgNAqG/pZwshMsHqi8Hf18IXNxVjrNab4VfSyJWULpCnZHhDdfUUWS5Y+pOPa1h2C1dbz2/TNPVNZLddJ2K7ds4wNIjzWb6GxH+iR0KIoQYck+hYv01yAH+xqIZnVKh1pORWOT7195PQkKItgPFGkj9BXMCwIuwetjyq4rT49AMSOHVj3BPjOtPl1PsZLs/Mxby8Hyn6AU0o6ZsU/ono9iIbjfdqqbVnm3r6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33l33zkeMBMEeEefMcklCnDbk6+wCvBqvPAZ2t2eN+8=;
 b=mC/ztFIPswUzbsFRty2J0axHmJmhAAPzuDfHngGimS512rMHMJwmtjcWtbEszyzkgtCv5yLOrllRZXE6VlsO8WHq4HyA8L/23U2hMa0etqlXwILPdy8Gwg7zEs3Ray/uNQnspwgfzQFt788Bno11u0bS9/1DARX4XY2gHF3iXac=
Received: from BN9PR03CA0590.namprd03.prod.outlook.com (2603:10b6:408:10d::25)
 by LV0PR12MB259608.namprd12.prod.outlook.com (2603:10b6:408:3ef::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 04:46:45 +0000
Received: from LV8PEPF0000005C.namprd02.prod.outlook.com
 (2603:10b6:408:10d:cafe::8) by BN9PR03CA0590.outlook.office365.com
 (2603:10b6:408:10d::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 04:46:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 LV8PEPF0000005C.mail.protection.outlook.com (10.167.245.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 04:46:45 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:46:45 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:46:44 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sun, 25 Oct 2026 23:46:41 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 10/13] soundwire: amd: replace >= ACP70 with explicit switch/case in PM paths
Date: Mon, 26 Oct 2026 10:13:41 +0530
Message-ID: <20261026044507.2310694-11-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005C:EE_|LV0PR12MB259608:EE_
X-MS-Office365-Filtering-Correlation-Id: fdecb7a6-4929-4ca8-e2eb-08df331c2374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|11063799006|5023799004|56012099006|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	HqpLn4d9dyxhpU24bs71SKHfQ8UzuOJ+XOeTqNgTi2T15R0S9HpsUoy9F+cVJJiZjk72jGGB8cbTEU83rPureMyaVHuAXPyU2/sA29yBANE8ZXgs072zuDmvGXOLJxmM5Xllh1mWsEYUDJ2M14VX05xHNqtDt+SqYBsS5cP+3y6+jszFWl/AYSohiziOizSsjOfRZbpVO6jCkijyhZHupAenY2dDfFzoNO95a2UCpRxRmICo9rHdnI7jgHAEF/6CPiZLKnrHZo/25adgwEHyT2CuzlbO5BNWI3GCU468KdrNFCoeF40q5PF5kVJ68yXoGVKdFP6zebzW48uR0ee/fkvyQqhV0DBzPFAdsVq0Bmiq6a5uW87mI6OtvlM9tnMIyRTemLjL81E88xRjYFPIS8Mlh+K24o5yoRYasAd65CrPUIFfNlGMSL9S8qw/ri3PoOb2IRzFmwL/Aw1z+yAAhODB1aoxGazwvTXbLsQYDeCD/CHWEjXZPwPlew+HcBOubR0q7bxMdoJh6dusX0N3ttSU0babUd6nrFoa7AW+slHfO4lhcFWVj3RsYaTip4/xSKbU3U7DvHnletJmAQll3y5t4/40aN0qKFVnXRJkWIx9Sx+X8XIOjIbNS+ZfklP3j32m1LlBTgRp/0L4uosd5LyGa0usWA/AEwshQ9JREuJBnBuJ21XPkScfqXL2kkk1OIKcmPSKAFSU/89YcZ+GZg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(11063799006)(5023799004)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	S6UmLuMjvf27yf0gpOgjzjHzDSM5VXgFsi/HXRI5b5LeFJ/bKJp03zjkw+nLcDIWs8MRzY6SGA2ZOevwrRS9PLaE/stuHVboksmdNFBrKm6XPxkIMD+xe4RVqFMEoxcrYwq5DHhGp+dTlgpzY3VenPZde5j+pS0aJlk7UVAj0IMCJN9GWSvFTykuEOar1q8bAjiA4R73eTsJv+AknA+F+i8bk/Yqpc9PYHt6JdwWggvptVBgDito6YhsB8TfegTwb9FMORUKwyiDpPGDWm+eePJTTDAsCI7cA8I4bwHUFA7mF35UnFJ/qqh9qS1eh03dE0D6+AApzFm3qj3dKa+hm/loqCmesUwiSbGcR0XknD3jis+FOPlG6Byd/MZzbVEtMXdCLowpuQQdAdJZ0GWkYafLklfktYTgxHXRpY7z37BbhjA91wRocgsdV5221o89
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 04:46:45.6439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdecb7a6-4929-4ca8-e2eb-08df331c2374
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000005C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB259608

Replace open-ended acp_rev >= ACP70_PCI_REV_ID comparisons in
amd_suspend(), amd_suspend_runtime(), and amd_resume_runtime() with
explicit per-revision handling enumerating ACP63, ACP70, ACP71, and
ACP72, so that every supported revision is handled explicitly.

The host wake enable step is guarded by acp_rev at six PM call sites.
Factor that repeated block into amd_sdw_host_wake_enable_by_rev() to
avoid duplicating the switch/case at every site. The remaining device
state transitions keep an inline switch/case as one of them carries
additional PME handling.

An unrecognised revision cannot reach these PM callbacks because
amd_sdw_manager_probe() already validates acp_rev with the same switch
and fails registration for anything unknown. The switch default therefore
emits dev_err() and returns -EINVAL to make the unexpected case visible
while keeping the error path consistent across all PM operations.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 98 ++++++++++++++++++++++-----------
 1 file changed, 65 insertions(+), 33 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 570a4f0c8372..a685bd7da52b 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1288,6 +1288,23 @@ static int __maybe_unused amd_pm_prepare(struct device *dev)
 	return 0;
 }
 
+static int __maybe_unused amd_sdw_host_wake_enable_by_rev(struct amd_sdw_manager *amd_manager,
+							  bool enable)
+{
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
+		return amd_sdw_host_wake_enable(amd_manager, enable);
+	default:
+		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
+		return -EINVAL;
+	}
+	return 0;
+}
+
 static int __maybe_unused amd_suspend(struct device *dev)
 {
 	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
@@ -1303,22 +1320,18 @@ static int __maybe_unused amd_suspend(struct device *dev)
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
 		cancel_work_sync(&amd_manager->amd_sdw_work);
 		amd_sdw_wake_enable(amd_manager, false);
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
-			ret = amd_sdw_host_wake_enable(amd_manager, false);
-			if (ret)
-				return ret;
-		}
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
+		if (ret)
+			return ret;
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		cancel_work_sync(&amd_manager->amd_sdw_work);
 		amd_sdw_wake_enable(amd_manager, false);
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
-			ret = amd_sdw_host_wake_enable(amd_manager, false);
-			if (ret)
-				return ret;
-		}
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
+		if (ret)
+			return ret;
 		/*
 		 * As per hardware programming sequence on AMD platforms,
 		 * clock stop should be invoked first before powering-off
@@ -1331,10 +1344,19 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		if (ret)
 			return ret;
 	}
-	if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
 		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
 		if (ret)
 			return ret;
+		break;
+	default:
+		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
+		return -EINVAL;
 	}
 	return 0;
 }
@@ -1353,21 +1375,17 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 	}
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
 		amd_sdw_wake_enable(amd_manager, true);
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
-			ret = amd_sdw_host_wake_enable(amd_manager, true);
-			if (ret)
-				return ret;
-		}
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, true);
+		if (ret)
+			return ret;
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		amd_sdw_wake_enable(amd_manager, true);
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
-			ret = amd_sdw_host_wake_enable(amd_manager, true);
-			if (ret)
-				return ret;
-		}
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, true);
+		if (ret)
+			return ret;
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
@@ -1376,7 +1394,12 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		if (ret)
 			return ret;
 	}
-	if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
 		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
 		if (ret)
 			return ret;
@@ -1388,6 +1411,10 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 				dev_dbg(amd_manager->dev, "ACP_PME_EN:0x%x\n", val);
 			}
 		}
+		break;
+	default:
+		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
+		return -EINVAL;
 	}
 	return 0;
 }
@@ -1409,11 +1436,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 		ret = amd_sdw_clock_stop_exit(amd_manager);
 		if (ret)
 			return ret;
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
-			ret = amd_sdw_host_wake_enable(amd_manager, false);
-			if (ret)
-				return ret;
-		}
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
+		if (ret)
+			return ret;
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
 		/*
@@ -1427,11 +1452,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 		mutex_lock(&amd_manager->bus.msg_lock);
 		amd_manager->ping_slave_stat = U32_MAX;
 		mutex_unlock(&amd_manager->bus.msg_lock);
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
-			ret = amd_sdw_host_wake_enable(amd_manager, false);
-			if (ret)
-				return ret;
-		}
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
+		if (ret)
+			return ret;
 		val = readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
 		if (val) {
 			val |= AMD_SDW_CLK_RESUME_REQ;
@@ -1457,10 +1480,19 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 			return ret;
 		amd_sdw_set_frameshape(amd_manager);
 	}
-	if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
 		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D0);
 		if (ret)
 			return ret;
+		break;
+	default:
+		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
+		return -EINVAL;
 	}
 	return 0;
 }
-- 
2.53.0

