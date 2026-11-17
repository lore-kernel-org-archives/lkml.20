Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794899509;
	b=wlZ15o9VNqH1sMO6e/YBvLy2kkPE4ZzqV4S226w5kEd2gKRVELIa65jNg6m/uPUbABwN
	 F1LQm9AuXP7q5+8zkQZ8y723g4rhOGihuc2JEvtGBvXXcfItE+1fIdKtRAOlWd6DRSQPo
	 CPRNEgiCgcDoSPQ7qXPCBVMigCN0yuyjnnMbYtX0klYsCex2aEJCRE0sqGpX3Nk+M3xBp
	 cEtH21sPTKpB2wb/lZHVBsJ1Nu6dLOJqzLvOhWjVdhZPZ7u8g+jaVtbdqZyYuZzkWkTqH
	 fxwKCOZS188KZ0gqyZyf62nmsFVDm9+MVrNsQuv3+e/8m9PqRH3h77F3/5aD7HEzyCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899509;
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
	bh=l2MmDXV7Z2vE6SfFhPh4eA0c8JrFZlWe5BVvfhPO9c8=;
	b=zkGyrCNooXCcZdpiXHMkwm/2fAM4r1Jn3OotTbJlvdmAJPPf3m6cI8BaGKl1IchdhlwD
	 d6jEQ6YIkqpws560f+bwKoKiTu3+L2qVwq5Q/Ayru4q42OsG7WFaxik0Iwya4xUv9ESYh
	 vrgQEDTvNyqxIlxiOCm/0X6Grib8/4yO+SygRZoiVJwb/SxzYUHeBaQHeNJE8bWBbrlmy
	 PsBLnWJ3Zz690JilUeB+c/0IncT/w997y9t6s1+8mItKQYquvdJpupTRNZWKzvZfpwjSX
	 fAJI1WyYmY+XNl/kEpY9eEpHGWREnP5oAIkkT9+SMzzbPjNZpL690IQbDVglMDkkWNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5dh5LLDE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.44
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013044.outbound.protection.outlook.com [40.93.201.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A75606A331;
	Tue, 17 Nov 2026 07:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1A75606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5dh5LLDE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HSNlck8r1Cw0FsiTnj21V2CDu4GRq7HC7xzmly//UKOfrYHyvlXnySTe1B0hOkKBSYvhJXi9TtBns2OeF/HVU8BdIBeBsnwvOmcseIsREoNR5iprb+9bhFlZUlQWxLAon+Y8P9oMfYEE0sqZkYWDtNkSX/pOetUYXr8LnEI9alwyb6Y9Mus+/FI4gN+Y9W1J4W+/Gxsq3Ag0P2nqzbZ3v9UrBeQF4UPlUFOHHBvjdquBjvUrP9l7FnYp7XauSEym03L+Y+ZSQHaOOIMcA4U3Hvgcj/FzhXMiWr1hlTJTdMh6/nyJ8nji3C2FwGK5g6xnoUp2+j3H4XjFC+KUF968Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2MmDXV7Z2vE6SfFhPh4eA0c8JrFZlWe5BVvfhPO9c8=;
 b=pQkdEawec3tVVLOMmxTZukyYftnbGioBsnTer15d3csfmg+aqWGAX6mEiYQCCn7Rduy/2/WEDEvWfJ6CwNn7nZkT/DkqXgivNvii+VvG5HGuCokdblKB+faN2jqLc2olrUU+Z1XZxe5n9OCuTfIiEU+mjZVtZkwUSn9xmZKQdkDmBtyMvgw+nyLphU8a0E1TJHNXc4HEWbVUCiWIaNpBtFLBPpK1jodW8B2/zb/YsVIxzM7Ly/MAN4ABRA1O3v+LReCU4PMaIwjlttRQF9vnph1j2OTMb2l0vYyMxG9NbreIgsWG5GTK/bM0AGJU2KCgxO9QOctpJX9X9MduU599lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2MmDXV7Z2vE6SfFhPh4eA0c8JrFZlWe5BVvfhPO9c8=;
 b=5dh5LLDEZL9WIOu736CJseXBhe76NraLdC50KBbPVwyN4yTazZQ+xcFI2vtUMiMENJ75F7KYoPV9V4Tl3HYGJQR0vq8ow1kVK7vkp7N513UkWQnJL5m3whGTiKWt7TT/W5wQC4HwLwx7yJhJdxfsswH3MD4D79DoMrBRlgw9RzY=
Received: from CH0PR03CA0109.namprd03.prod.outlook.com (2603:10b6:610:cd::24)
 by MN2PR12MB4046.namprd12.prod.outlook.com (2603:10b6:208:1da::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:11:45 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:cd:cafe::2d) by CH0PR03CA0109.outlook.office365.com
 (2603:10b6:610:cd::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 07:11:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Tue, 17 Nov 2026 07:11:45 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:11:45 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:11:44 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:11:41 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v6 20/23] soundwire: amd: fix interrupt gate and work drain ordering in PM ops
Date: Tue, 17 Nov 2026 12:35:55 +0530
Message-ID: <20261117070906.803139-21-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
References: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|MN2PR12MB4046:EE_
X-MS-Office365-Filtering-Correlation-Id: 96ccd9f9-02a3-4829-8577-08df447a0a01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|376014|82310400026|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261022075727099003|261021123027099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	PSVlzE0QKW+8yjV9P1kOQKLL2pgSbPNDHtAleJb0KOkjuUozL3vWqN1rGfUt2KR2C7Hg+Vh1F8XoPxBNSgKMpRblSnOJNoyXn6CPhCp3b5LetjQIk1s7AO8frg4T3OkXzWwr3n3h3OZpP8UNUmBWys2Z04QfL+dNCJMhtPg3ihI8s/8neOTRpdKld8KkVOYt8jqw9x0eP8DBPU0IuYHy3gDxFrk/o5x7lQj+WWdR8d+jnF8jYbWq5ffGwS2hxQaUOpRTJq+BITDsatxSU8l/p+PwI5IbIqEp/VQaa0UpFCFTGNq4BSfqJjaQidj1dSEzeMokuWcxrEe7Jx/qrU3tt3rYqVGw3sLRUEDp8Pu+P5XOseFjWvqH2VAgCY505OUt+s6dJkWkOlvpRsZ8EQ1MB4ILA1WepfnKetUVe9npTdivfweRWkvNfbWQ4lu5sisqTozdkdxNkQqnJySXoTQsyj1fcV8NMgR5Lr7GpsvEzTt5JSEgfLm5xtdu1cK0YbPqeJdo+NpLGpahRdId4IMz1axyW8XUBdI6yAIbvLKvYJw6MI0BsPOHompur/xLFUa96iLUZfbSiTRXxNH+GvTgS/mtiS7JiLTG3QLR28mdEVua0XYpdcQx0R985i+CZxq9OJ/Z6lxqNkMwpr9Ogsl+8A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(376014)(82310400026)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8iangKKYc8/wAAV90vCQtMGjzXQ9o73CSlCkbyTL10mFAUPdY8s5dWvJloX2ARfysDRNX2xOGqFU8TY8lagNFdtXOhNZsZRfNC6v/zHAfkLTbTWiQZMpvnCRE8qWGZRkimjkbI1dZzB2nBIM93g4WSpMnPJB5MTyYs9Ju7AZ2ve6DOh0zeEwCdS/oMyXhpzkQA4BBVwufJHaZbiFrDMKtkGLmBtl6bwlBZpcdTfECuvVyl61Px8yAGAoeijSveTMml1PHrdhDnytzGesw1N9iRo+m+zpkAIAGNHP3jOq6OBcWPVSygahafkQOjktAo08nqORJfXScDhrieql1TywrYwTfGtWc/Dzk1ZqvjwIGXkh9NxEgvVYgkNW14fdRt8u1yMrzWmC+xdrn7pinZW3++dF3E3y3kzwuV7qJGwNnsIXKEQEbB5RcoCUiQloxi9h
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:11:45.3926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ccd9f9-02a3-4829-8577-08df447a0a01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4046

Fix ordering and sequencing bugs across the CLK_STOP_MODE and
POWER_OFF_MODE suspend paths:

amd_suspend():
- CLK_STOP_MODE: cancel_work_sync(&amd_sdw_work) ran without first
  closing the ACP_EXTERNAL_INTR_CNTL delivery gate or draining
  amd_sdw_irq_thread. An ISR already in flight when the drain
  completed could re-queue work after cancel_work_sync() returned,
  racing amd_sdw_clock_stop(). amd_sdw_wake_enable(false) preceding
  the work drain was also redundant: amd_disable_sdw_interrupts()
  already masks all SDW interrupt delivery including wake. The
  amd_enable_sdw_interrupts() call after clock stop restores all
  state-change, error, and delivery masks; in CLK_STOP_MODE only the
  SDW clock is gated so no state-change interrupt can be asserted after
  clock stop. The wake bit is not part of the restored masks; wake
  interrupts are only asserted when the system transitions to D3.
  If amd_sdw_host_wake_enable_by_rev() returns -EINVAL the operation
  aborts; this indicates an unrecognized acp_rev, which is an
  unsupported configuration on this driver.
- POWER_OFF_MODE: same missing gate closure and irq_thread drain
  before the work drain; a redundant amd_disable_sdw_interrupts()
  call was placed after clock stop instead of before the drains;
  amd_sdw_wake_enable(false) at the top of this branch was
  redundant because amd_disable_sdw_interrupts() (now moved first)
  already zeroes ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11, which
  covers the wake bit.

amd_suspend_runtime():
- CLK_STOP_MODE: neither amd_sdw_irq_thread nor amd_sdw_work was
  drained at all before amd_sdw_clock_stop(); the interrupt delivery
  gate was not closed before the drains and not reopened after clock
  stop; amd_sdw_wake_enable(true) was placed before the drains
  instead of after clock stop. If amd_sdw_host_wake_enable_by_rev()
  returns -EINVAL the operation aborts; this indicates an unrecognized
  acp_rev, which is an unsupported configuration on this driver.
- POWER_OFF_MODE: missing gate closure, irq_thread drain, and work
  drain before clock stop; amd_disable_sdw_interrupts() was placed
  after clock stop instead of before.

Fixes: 86a4371b7697 ("soundwire: amd: fix for handling slave alerts after link is down")
Reported-by: Lee Jones <lee@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-3b774ace-00cf-41e6-82eb-85cd43f5e1d6
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index ecef22baffc0..4f997198f5fe 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1431,17 +1431,20 @@ static int __maybe_unused amd_suspend(struct device *dev)
 	}
 
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
+		amd_disable_sdw_interrupts(amd_manager);
+		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 		cancel_work_sync(&amd_manager->amd_sdw_work);
-		amd_sdw_wake_enable(amd_manager, false);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
 		if (ret)
 			return ret;
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
+		amd_enable_sdw_interrupts(amd_manager);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
+		amd_disable_sdw_interrupts(amd_manager);
+		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 		cancel_work_sync(&amd_manager->amd_sdw_work);
-		amd_sdw_wake_enable(amd_manager, false);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
 		if (ret)
 			return ret;
@@ -1452,7 +1455,6 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		amd_disable_sdw_interrupts(amd_manager);
 		ret = amd_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
@@ -1492,18 +1494,24 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		return 0;
 	}
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
-		amd_sdw_wake_enable(amd_manager, true);
+		amd_disable_sdw_interrupts(amd_manager);
+		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
+		cancel_work_sync(&amd_manager->amd_sdw_work);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, true);
 		if (ret)
 			return ret;
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
+		amd_enable_sdw_interrupts(amd_manager);
+		amd_sdw_wake_enable(amd_manager, true);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
+		amd_disable_sdw_interrupts(amd_manager);
+		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
+		cancel_work_sync(&amd_manager->amd_sdw_work);
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		amd_disable_sdw_interrupts(amd_manager);
 		ret = amd_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
-- 
2.53.0

