Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794068151;
	b=r1vT9QDduMinVXpxsim8xt63wZucexh/xefT/mh2yczceJJK2Fg4nlKhBQrqfukS4fEt
	 hLWFx62ynmAqNEyFq/CxfEG+7ye34LggDhWBN1jNw2YLKMwE2gMJbKn9pWeianMFNxjM4
	 +sx1ZTrxXLjqVT71aMYFEEO1tIwvSwOKZ5L+6jYrbZE/4wwgNUEPgULJTlFROD4vk2lf2
	 PmwU1pZJPIlX2qER7Vfl4EKxvKVIfRZz0cSJhqncqM5M1YfHdMpVyxkxS80uBAbRRXslS
	 MxiSYH55AVRvQbG89geVyBncE1eabFqVNrHKfjE6mxHINT/09nHy/3QNs+wpRTfKsVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794068151;
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
	bh=PFCjoZ8B0oFMSraWy50JsfxllNZ78boCBS8pMykc2Yc=;
	b=JeE/zbCwA0zvsLefw3gKmYu7kttBmFktIVFc4ZaZ5ng4yOzfeQvA/fDRGq2woyjvdxgn
	 SAr2XxexngAJMfWPBO4oizCgbwhcLX5EANsUxdE/jK+9VYIPE6zhGKYwAsygQvEb9xN9I
	 /b4pwLNhBzNskPGCAXJzQyYcPkoEKenO5MOqMqyrEgSSqULoiSb12TKbumSDs2slBxUt0
	 b7slF26QcQkfFfeHTnDlzk8cKPoxCC5sSUhQivakVt8A9TDhmNeqvPiZkLSwIN4OY4xeO
	 6jPIQ4NE1OamtyOhrweMW3dV9pzTBUBCEj8fiDzgQKMDDR8tIhXRgbbRiKp8DwSncfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zB1QBqHz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.38
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011038.outbound.protection.outlook.com [40.107.208.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911D2606D3F2;
	Sat,  7 Nov 2026 16:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 911D2606D3F2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zB1QBqHz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLDEhnEbJBkPeEpBr0VYDwS4XxACj4kMU4hTBojpVsSTTJ0I9dp8U4NJ3jMGOMKtuzN3DSYC+P9KAH6leJBGoLZ9UArimduDDI+CJbAkrtojOSi2oudpbjkFqR8JJYVPcu8k1k1IK8rMLZdG0mnXy3q1DUZq/6c8HbQi4g8A4ybj9Qc5yAiGB5jNno/x8FA3k/LCBetLXDe2JFJWuiL7yFavw85C5aTuSxmer0FJgFZn05rdz7V8YVs7h2QS1QG5zJ8dQQijxvPI2XviZjajQZlneou5sAj+IbLbgARJc4ZGyid3ekMC6Ib1tAhqY0f//GS6H4RzTAd8RrKmGwsMWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFCjoZ8B0oFMSraWy50JsfxllNZ78boCBS8pMykc2Yc=;
 b=LR9w2kYlmVqhRTUZdJg/PSCIKKZbw5eA2U7zDboWdVhskJAXV48bqnWabuTjKsE8dr6dd+43KQfacf1HVpFbdSN9LNBKTiH/jKe+fr9xY4Hgc+iCTfD3dEiS/VFtzLbTm+xrQf3NI52ub+mAbWWrtGWMGa8NgswdYpCpzEMYSpKHn+Uqn9PgrzB5xW4eItTix8TtTL/+lYwgED7RhhnMHRrGSfJWmJt+XDyRm63ZXlw61YeqRmPkS8e+I/LMBldrms5PWmcMHRhMoiKWcIJPtSf1SAZirGz5H40pGE6zYcS9dCliduG5kiu3Rn4lHksLrfeth9ATzDwvwgVjdEATfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFCjoZ8B0oFMSraWy50JsfxllNZ78boCBS8pMykc2Yc=;
 b=zB1QBqHz08tAeEpNXkI5pH1zYxTFCbmlWXEXflbcc2B19bKSnpAWjd0rcSPxsNS8sVWbQdaijP3NNaE8VaUcOZGJBluQmTQ+GaYBicMT10758U7Q79UAdf1ZkG7Bb97aR1gQR4cTDRsf9ae3+hpFDnof2zoX+8f3dnrn/j4JPNg=
Received: from PH7P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::16)
 by IA1PR12MB9737.namprd12.prod.outlook.com (2603:10b6:208:465::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 16:15:47 +0000
Received: from BY1PEPF0002696B.namprd05.prod.outlook.com
 (2603:10b6:510:326:cafe::63) by PH7P220CA0004.outlook.office365.com
 (2603:10b6:510:326::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 16:15:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0002696B.mail.protection.outlook.com (10.167.244.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 16:15:47 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 10:15:33 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 10:15:30 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v3 11/11] soundwire: amd: guard clock-stop register access by acp_rev
Date: Sat, 7 Nov 2026 21:42:28 +0530
Message-ID: <20261107161345.3411491-12-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0002696B:EE_|IA1PR12MB9737:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dc9e61a-9bbf-4d6e-eb5c-08df3cea61df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|11063799006|56012099006|261009223027099003|261021121427099003|261021123027099003|261022105027099003|261026140227099003|261102123227099003|261026121527099003|261028144727099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PKllGe0YetvX3ew5tvBoB7VL2BymIUUVxXXPWt6P9vJPj+eBpxMgy0rLaDDLh8IOJLl2STzxJAwf4OAURgWZ/ECAR3jP+4Hqo4jXu6kC2b3fVniVMJGKVJlx3w2LegiNNNTKPVXT8ENlxAcqtIATVCYwxO+3RA7nvRbcXRSB9gl1R2LhzQP4+VBV9P2W1UiBo2QqcuHLdVBWsRj99/+ykAAWT72S5cISVFUGpKPBUN9Z3j6OXg5HTH/b7f3tvm/jKjsXBczr6e36W66uqZZ6T+2TZZP5X21XACVJ++gbKoiPfgVcDRV4lYR/jMN0L+qUw+WK5OamtISxnR4Iy70jvSvLI6Vu/UBApAIF5nTzMIp58UBel6N9RfH0h6E71T5KUe/4dI+cUpqlcDFiAtgvKpSy4Bd8GFfRUuXchcCVVmROxp9ubsD8sx3L0kVueKpZUktarHYzcQUPj7t6v10VnSHjjWM5vOznKjukz0mhF8qntDVfeFPd+ptF9cIlcQdy4OEQN/gT635n70haQvpoQvjlo+jnpdNkTK118usawEGKe7msRrl2DWma5HPQL4EbZZCKroWlC2vdFBIi8vedlGO8xX8WHh85350Q8xfzLn135SQaV8xxb3FdU4VcALMry7Nxo6m24ThvfipSVzXvFlIGcUYCXH134CXvAm5QHfaoFVzp9GHxx2stvXEwmRt6rjn+ryOxvV9MKAsROOipcA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(261026140227099003)(261102123227099003)(261026121527099003)(261028144727099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	i0lQgaJgOhq1QYtyZhXfXfa7z1TkeDjEVsEyWlo3ajR19ZXXbPijq9ePrNOprvbgbL9o51/s2kZDYBvj4KLE9Zip2HRYIUz4vT0oYQv1QsL0YFiq7ER5k9H8fyED7I0hd3U66nehy2bm2RLjhzvbP8Q7r30CFrDuNqRkpl76F/bR7pM3VmjWzPqw0N30ZIEuvFzJw+rxJpvlLX7HzT0v5DJvio8XmW5pG6sqJgq7iJnT+RgDSHhztIEwL7lc3e8LINZfF4XpQ4R82Nys/plnkmcvb73uI7BFh7df3Q49VTKN1yc0suLqnxLi/m4GR/8ijyG20mnmNOdaAneEB+PIWLAvtLe/inbP0whEkIWy4D4En3HU8A7CRb/5G52z2MjFI801GP3Av54Px1d/d6KQPxssMrkYUI0+iP/WN4w1XTw1banDNWXAuGIEWSGdrqwX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 16:15:47.0948
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc9e61a-9bbf-4d6e-eb5c-08df3cea61df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0002696B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9737

Wrap the readl_poll_timeout and wake-enable writel calls in
amd_sdw_clock_stop() in explicit switch/case blocks on acp_rev
covering ACP63, ACP70, ACP71, and ACP72. An unrecognised revision
now returns -EINVAL rather than silently accessing register offsets
that may not apply to future hardware.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager_common.c | 35 ++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/amd_manager_common.c b/drivers/soundwire/amd_manager_common.c
index 4a414fc1b02d..7e3c9176e793 100644
--- a/drivers/soundwire/amd_manager_common.c
+++ b/drivers/soundwire/amd_manager_common.c
@@ -521,7 +521,7 @@ int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
  */
 int amd_sdw_clock_stop(struct amd_sdw_manager *amd_manager)
 {
-	u32 val;
+	u32 clk_resume_ctrl, val;
 	int ret;
 
 	ret = sdw_bus_prep_clk_stop(&amd_manager->bus);
@@ -535,16 +535,41 @@ int amd_sdw_clock_stop(struct amd_sdw_manager *amd_manager)
 		return 0;
 	}
 
-	ret = readl_poll_timeout(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL, val,
-				 (val & AMD_SDW_CLK_STOP_DONE), ACP_DELAY_US, AMD_SDW_TIMEOUT);
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
+		clk_resume_ctrl = ACP_SW_CLK_RESUME_CTRL;
+		break;
+	default:
+		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
+		return -EINVAL;
+	}
+
+	ret = readl_poll_timeout(amd_manager->mmio + clk_resume_ctrl, val,
+				 (val & AMD_SDW_CLK_STOP_DONE),
+				 ACP_DELAY_US, AMD_SDW_TIMEOUT);
 	if (ret) {
 		dev_err(amd_manager->dev, "SDW%x clock stop failed\n", amd_manager->instance);
 		return 0;
 	}
 
 	amd_manager->clk_stopped = true;
-	if (amd_manager->wake_en_mask)
-		writel(0x01, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
+	if (amd_manager->wake_en_mask) {
+		switch (amd_manager->acp_rev) {
+		case ACP63_PCI_REV_ID:
+		case ACP70_PCI_REV_ID:
+		case ACP71_PCI_REV_ID:
+		case ACP72_PCI_REV_ID:
+			writel(0x01, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
+			break;
+		default:
+			dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n",
+				amd_manager->acp_rev);
+			return -EINVAL;
+		}
+	}
 
 	dev_dbg(amd_manager->dev, "SDW%x clock stop successful\n", amd_manager->instance);
 	return 0;
-- 
2.53.0

