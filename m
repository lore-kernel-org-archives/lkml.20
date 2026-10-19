Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011016.outbound.protection.outlook.com [40.107.208.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81235496D53
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405298; cv=fail; b=Hdxfbs8N6XpO9KR6huaVPKkwTk5Li73GKiu7ZS0axd5le55PJgYwQRiNbgkT/98MVUXusclgFOJzk8o1+dZ+pys/PxaZ/24yNsOXLN4iDf4y90sB59mmPYzniqYgyK1AbSr+UdDK6JAm2MVHIQ7/6jNdvLhTLMKx0Mm35UINHlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405298; c=relaxed/simple;
	bh=b+YLoZHP+A4D5bj6DrppsZGABJ31M8xBav+Q2HFEWrI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YQDcc6YOyi25AsBZvQpeASZvon53tnhnhcvj1+HVGcduJYvtpgTh6alWsA1dxlaALLXi2ZgyLtFdEyufD7jBpCzIgwr+R+1/Izm8f5svM/NnI/VuMfhuXZcYj5S2EOn8fD9G55tjPFRndhH5VURH8vnFkWQAcY9QI6tP+hAAgGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AqxCj6rP; arc=fail smtp.client-ip=40.107.208.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AqxCj6rP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWWLeI5VpaIx9/n3so/b9ywRwAGZmJ87lmW32/zoSNkzf/IL+V5VJOYZBXlX/HLK3FmeVEqVlnPmEY8txzEvEcgbH4wRELg18mCmh3kzVTopoJqdnfSPTUTox9aC5qibyvG9BnR86SNDVrD3TWxvtFQu5Gjcv3edkwCvFUGWivMVlhBHbH9V1r1g6Clru8ObfMCEZXFhDZiTjVzhyGAQ25NG/ikk5O6MkWsD6CHEdSL0NYBnE8aYefRmJzU73yUVDrqZ3JWNiHhdfGAJncKEH3tsli+mVuuworfiyzKnbwAK1RKpHoj0zRe8scnFL32k8CZZvKKsJci4kdabkp1B0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGUmExTPYJ7zMQ9g0UaYVJffIywD1fd+HT5u//71rU8=;
 b=cu9fh2BYAtHfsfSmAi7c8b+uY1SjWorCdoJ0fDPtq/OH/S5R5x0GXoeF9andMTwY5vS6Sj0mzjXxEFS/4cNac0OnIuj0oJaHlgE3WfkkbjIsEw5wgtwaP5pyKFxQ2jhq9S+rv3jQgbS0xkm0RuBLKEyhcNYkcNNxlfyZmprLdcYOJWgwLCGiXsVZaU+9QF6QOXVGCgk19AfBvyRO3E2mwcIXtLCQs0JHwBA4SRaHY1Mv7rHP5SVQ6DUa1GwSg15jZL4E1dQFNB18d+ef7uPfoAOsmprD5Jr7CMbur3MdNqSfXdY3UeCsXDUH6Cwq4QdH+qfbVXDJ16cOnd+HoXBHUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGUmExTPYJ7zMQ9g0UaYVJffIywD1fd+HT5u//71rU8=;
 b=AqxCj6rPr/KfbI0z3S26ejQuVEvlV3GjkBi03yeW2dvv7ZE6nXfVExOVT9QYRLbpehbo6m6tMIHvBm2bZhT5+WDdVpwJQ6DYMf7EZ5HNlFU0OIVITNyw+WPL06/9LgfHyN7HAWOEYB5936I3ELGFEPsOMrv/SgmjiveRlbCBbV0=
Received: from BL1PR13CA0388.namprd13.prod.outlook.com (2603:10b6:208:2c0::33)
 by IA0PPF4D923B935.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bcd) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Mon, 19 Oct
 2026 10:21:33 +0000
Received: from BL2PEPF000352CD.namprd02.prod.outlook.com
 (2603:10b6:208:2c0:cafe::7c) by BL1PR13CA0388.outlook.office365.com
 (2603:10b6:208:2c0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.9 via Frontend Transport; Mon, 19
 Oct 2026 10:21:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL2PEPF000352CD.mail.protection.outlook.com (10.167.249.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 10:21:33 +0000
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 19 Oct
 2026 05:21:17 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>
CC: <linux-arm-kernel@lists.infradead.org>, <git@amd.com>,
	<linux-kernel@vger.kernel.org>, <jay.buddhabhatti@amd.com>, "Radhey Shyam
 Pandey" <radhey.shyam.pandey@amd.com>
Subject: [PATCH v2] firmware: xilinx: Request pre-allocated peripheral nodes after bulk release
Date: Mon, 19 Oct 2026 03:21:10 -0700
Message-ID: <20261019102110.3448932-1-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923100343.3147243-1-jay.buddhabhatti@amd.com>
References: <20260923100343.3147243-1-jay.buddhabhatti@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL2PEPF000352CD:EE_|IA0PPF4D923B935:EE_
X-MS-Office365-Filtering-Correlation-Id: dc614225-6b27-42cb-5ccb-08df2dcabfb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|56012099006|261009223027099003|11063799006|22082099003|18002099003|10067099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	QJm2RjMrR+5SGks9imbQXX53wP0jf2N7l/G6ex01o/DRrx+2yJbH6fC+TTkzxrQU5X7FWOCusu+kdZ+PbBxtflahIltIOwAN2NPMfaULxrY8CRpSxvQBKZ7lHjmOhQ5OnVKsbIGPCp1OQKIN7qeE9qLDnU5mIBK8JqXIPAUHqh9i6anmgfrK692yemfec8UuXlsr0qwS/V6vtpuiAOin6n/y1dFPeXNHt7FRQ0fr1tBXQkKkauMYBgFquE0xpI1lLrQnogCFUnCfotSuy25SQac9QHQ8bbZvylTA2YB2iYMTr7mvY4xrI0bHZ+5UhnPXcORxF1Md9NpJI/iMZFXoA+uwvaiRLj5RcD6mYJmSSTIh237sL7bRLHar2YYWRp/sQvu8gyxDkuHESViDNJZg3inLW5bxgphDQAurshO+zhzVmvTsTN71+gXKALZflnhaEreSWRRCWgivVMSTEFek2KQL9VahsRfzjdlOX97N8mrvhawOZUnEXhxCECQ7899e6426qLH4B+q1IkH2FuzBgIMQ9CuzreBGVWDQd73jn/jBRdlXlbthxADKdw2YNhZsD7SXwMaxDr5GqZytoRSUGNj+ZrcCT6Pbi+F0A2AKYLrP1jftlwUKAgrySSEjW4k1x9VZdDZedyx7qMeOkKf248KBdxiL8o4mxAIdl440gtU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(56012099006)(261009223027099003)(11063799006)(22082099003)(18002099003)(10067099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dejVNmG7gAgLbAHF54v8CV1JujHQ67Gs6pN1Jm6dY4nMFiUCNAKiy5uuv5WLHiT1vcJ4jAxR/SBIM20yyw+MUX3dqBh/oGLeeSZ5KjK5r8uf8/VzW3gs0OAZbU9VLGUVILifuL+rO1vYS14w7uvk7Av4vjuaANBnxn9mUTwdvJBW8tV+Ei+1murZF0D+4rT+FmsgIG1bvImjUAYa5XdKvImMnvMmcaZScivHuJtWMuukhtkJkMqqNxMkrUbvzqy4HxbSRjcGguF8PrtN0NYfSINTKdtdm6UC3P7raJAptkaufrKPk5GK8o6tD1IYSu4WFCLvif+hOcyvTydS/pRx344ipvI8FoiqwnvkvMlW9CwW73OWx1oXxO7ZAyzP/MoK3ve4FJ3rjlMcF+LfHdLNtFOrHbY0ZcVroMk97ROeT9fMo3tEljjJ7YKLbwljCyfy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 10:21:33.2319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc614225-6b27-42cb-5ccb-08df2dcabfb3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2PEPF000352CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF4D923B935

During a kexec restart, zynqmp_clear_pm_state() releases all peripheral
devices via PM_DEV_ALL_PERIPH. Pre-allocated nodes are then left released,
so Linux no longer owns them and later peripheral access can fail.

Immediately re-request those nodes with zynqmp_pm_request_node(
PM_DEV_ALL_PERIPH, ...) so Linux retains ownership. On a graceful kexec
this runs from zynqmp_firmware_shutdown(). On a crash kernel restart it
runs from zynqmp_firmware_probe() in the reloaded kernel.

The bulk request depends on firmware support for PM_DEV_ALL_PERIPH
(PM_REQUEST_NODE feature check version >= PM_API_VERSION_3). On firmware
that does not implement it, the request is skipped and a warning is
logged. Errors are already logged inside zynqmp_clear_pm_state() and
zynqmp_firmware_probe() does not abort if the request fails.

Also, drop the redundant ret = 0 assignments whose value is overwritten
by the next do_feature_check_call()

Fixes: 84dbfa5519cf ("firmware: xilinx: Release all peripheral devices from firmware")
Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes in v2:
  - Add Fixes tag for the bulk peripheral release commit.
  - Add Reviewed-by from Radhey Shyam Pandey (v1 review).

Link: https://lore.kernel.org/r/20260923100343.3147243-1-jay.buddhabhatti@amd.com/
---
 drivers/firmware/xilinx/zynqmp.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index fe650747ac91..96dbb23eb673 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -2193,7 +2193,6 @@ static int zynqmp_clear_pm_state(struct device *dev)
 					"Failed to clear EL3 PM subsystem state: %d\n", ret);
 		} else {
 			dev_warn(dev, "TF_A_CLEAR_PM_STATE is not supported by EL3 firmware: %d\n", ret);
-			ret = 0;
 		}
 
 		/* Check if the firmware supports the PM_DEV_ALL_PERIPH node ID */
@@ -2206,7 +2205,19 @@ static int zynqmp_clear_pm_state(struct device *dev)
 		} else {
 			dev_warn(dev,
 				 "Bulk device release is not supported by firmware: %d\n", ret);
-			ret = 0;
+		}
+
+		/* Check if the firmware supports the PM_DEV_ALL_PERIPH node ID */
+		ret = do_feature_check_call(PM_REQUEST_NODE);
+		if (ret >= 0 && ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_3)) {
+			/* Attempt to request all nodes via firmware */
+			ret = zynqmp_pm_request_node(PM_DEV_ALL_PERIPH, 0, 0, 0);
+			if (ret)
+				dev_err(dev, "Failed to request all peripheral devices: %d\n", ret);
+		} else {
+			dev_warn(dev,
+				 "Firmware doesn't support request all peripheral devices at once: %d\n",
+				 ret);
 		}
 
 		/* Check if the firmware supports the PM_ALL_NOTIFIERS node ID */
-- 
2.54.0
