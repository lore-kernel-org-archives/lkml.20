Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012020.outbound.protection.outlook.com [52.101.48.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC4C374A17
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739178; cv=fail; b=Cnl6QMBp/5viWtFl4UJkbNFXhbu0mH68My/GUHcrQQYr3dPLQlB6c/sMmKWnpnhmWlpjMlu4zo3D0m3754Wbv8Se1qzq4pY1FQ6U2BWZ7JhH6lrBgXwuuHai66huwzTNbEG/0NgrC89OhaRH0qG/AC0z/X1GHJD3BzKOpyZ+4SA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739178; c=relaxed/simple;
	bh=iahwImrl+pMtH0jk0exXkG8XzDATeh3J9EcqIhAwVP8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kOKRIfhezJPx67xjwJGWafZKR14EW4eluT14Q4njNhlqzaAXMrN1Xe1oX07IlMF36tk28utPQ9AQ3Ic/uDEfMBFd7cyb43jEQe+pD3oVMndxLekh7JB/acIfXsQtOGy1d6Ag+S9ZI/nGw1nmrmbqoDetXZaZNNntGwKFqXEKSJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tNLyr4R7; arc=fail smtp.client-ip=52.101.48.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tNLyr4R7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAsp5gOjaXtNMYQ4KhGhhoA3hmfqCLzTwqLybAuQcidqOW2tRk/bT73OA3rWBZ0HuWTw82WZInC8JlC26teuqTCeEk3omB/J+Cnn4iPwKOVpLjCMtmDJ32orx6H9F9kxntDsvlQi+787vwV9AmC4jFTSvESZZ3bKP+RZbhq9ZFah0WtYVL9ZUWjcCW85gSE7ziAG2hGYEsfdGZD3isFGRsRdhovK8P14738QYvzw13gwVVTjP3JBTrA+pZGPt8MF5vOtmO+XtYAD+I3bTE0UvME4aCgzPGRBwwSDS3nFNB8bJ5X2tE84HCYijnHbbzr0GCTZPwzZkR1B/luflbDzxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMd77stDwg1rIk/EAzgTNpuSDbTKK2BzFTQ4vCJZtOk=;
 b=H2+X5WRlwM5mGWJc5SDEZrkek1rgNTIkMtAdAz7hHUgG9K4dR1XbQCIB4O4RhEIuUxZBVNbxXO2ks5AbquklMW9/XUMqv7wHJq0PPtBSIfT6OjyaOV2EqyDwH1wNk0+qv6azwH3IclR872BQrPkmfLfs6vkbPT81+spvAIQJkwP+FDQnxCOiACoafsolTOg8aV/UhfA4wmDTbOAsHTOIi7goC4K0ELCGTfdgdw1vnLngJ5BszNrjlvS95FUwFKBXN7oKjleQZohEy15xiSp5xPP4zeRqd0WCi6szRSVso5WKeUuQ8dCplO9PEs51datFcGnUz6n/2CUbT1c3inEX3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMd77stDwg1rIk/EAzgTNpuSDbTKK2BzFTQ4vCJZtOk=;
 b=tNLyr4R7hxIzGMY3EvPts9QUMXjA2iUH03H6K0dyBGPqHrrebsXpJs1EWAkvOxuG8X/ZHhwz0nF3mgVmvuJzjCIRnt6Tjs0ioM88zq0UaSuOImKxKqNLnpvWeHLpfHtaAjtnEwSPh0IkG1Qfyn3COvb+dgvsQgacj1zhaBkFV+U=
Received: from SJ0PR05CA0158.namprd05.prod.outlook.com (2603:10b6:a03:339::13)
 by CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 30 Sep
 2026 03:32:50 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::d) by SJ0PR05CA0158.outlook.office365.com
 (2603:10b6:a03:339::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Wed,
 30 Sep 2026 03:32:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 03:32:50 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 22:32:49 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 22:32:49 -0500
Received: from xsjdavidzha51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 29 Sep 2026 22:32:49 -0500
From: David Zhang <yidong.zhang@amd.com>
To: <quic_jhugo@quicinc.com>, <karol.wachowski@linux.intel.com>,
	<max.zhen@amd.com>, <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: David Zhang <yidong.zhang@amd.com>, <sonal.santan@amd.com>,
	<mario.limonciello@amd.com>
Subject: [PATCH V1 00/20] accel/amdxdna: Kernel submission and PM for AIE4
Date: Tue, 29 Sep 2026 20:32:13 -0700
Message-ID: <20260930033233.1727265-1-yidong.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <yidong.zhang@amd.com>
References: <yidong.zhang@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|CH2PR12MB4071:EE_
X-MS-Office365-Filtering-Correlation-Id: a079d1be-4fc6-4f8c-d399-08df1ea38118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|10067099003|56012099006|11063799006|3023799007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VAbVxSKVRar2u16Zdfv0eunHBpCAIAUqplLKijdkW+DzaTrzksQYGaEBVKPa3k1xTcdI+v98XrcHGg+RtVcwyIZn/c14jYGSMAIpQvsHUeL6zdF1EgXTQeAJjz5/XrrUgRFae58zRMLGLG0ZAoxF3wvYvepmsXTk+YuJTmfD0mKEiLbttJAr7Cm4zwLCgXum7RulC1QJCG3xlVkl+OCJ4pd3x32pBGVfZkq/uxzgC3fN2ZGimOCOZcGn61dcGTpaVeoX8x/Rs56QVlQkAQKyI4dmHLNqxYlsRJKaIm0RIIskZcxxb5Gl/625Uc+f1Gs/CSaiT/LoWXl1Vjpswa1/MI+R1i4H+MLZXdIIXjVnV9xIICdBmUJQap0feENKQGXOJqXkMfqExKLNeiKkZkRyu39rVQdKN/jMxTTzfF+zzy+fB3sCbPbHqKucPwq9DLRiFhIhrcK4UKolxFtlClD9gE7TNDTYQlFZu67rU5P5MPAq9xMHXWvNjmlOAfhU50txai6fo+NsZ0lCNIu/2Qj8nOhfmSJ3gJKYEgtcACLgZD5JY/dXPlXl2fxyjk6RYAjNwwiRez5szF2EsacfFz76K6JOW3CeFLX0aNIBSfZpSmIcbFkdl+ptSE0U23nh3CsTCkLbxtnyJ7KGDP1lOqifiMFiYLB/HPI6MzFcFcuPpTvo+x6mtJYhHETEIxA2Hz6hqx4qQe1s/WXq1YaFOrPzdA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(3023799007)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cduDf+gz0V1o/rqZpgh54CA8o8GMxUFuvffIB8WCqNvg9DlKiGndGm+MElPGXZmSin7xlxtXJfSlT6IY/Dx+/3uDGzoxMr1seksPbPi46yTysm9kxDCvYZsajU91fgOCbLrLMX+8GdGDUeu7cUZ1V8BNInf2Q6rMu0Ee+O0YGIaeM2Q9lAANFjldZNXkC4PVSIXztcJYSWU0SY25tonFbQz5+AB19fueH3SPIFJjzb6sqqZcMGVTQCyu76HaUdenf91uJhbXb3rHFBAQETAKJMNsKfJt0RmTAkx6yGmwnYu6LdS/6qQOteiefq4U8PZ5RtOU/LXq51tlXd2n86Oes8UMchHeGMNmzYkhYrTDs8Eb9vPkHnMyH7CQcTYnKp9DzB3ZZleL7Zcemjrxa31j91pIC8/mTjJeAG09jc/FimnQ583dILvsDNc5lPthsYEK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 03:32:50.3552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a079d1be-4fc6-4f8c-d399-08df1ea38118
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4071

This patch series extends the amdxdna accelerator driver to support
AMD AIE4 (NPU3) platforms with kernel-mode command submission (KMQ),
device telemetry queries, comprehensive system and runtime power
management, and NPU3 classic device support.

This series establishes kernel-mode submission as the default execution
path. Additionally, it implements suspend/resume and runtime power
management across Physical Functions (PF), Virtual Functions (VF), and
Classic devices.

Changes in v1:
- Firmware version 6.0: return IOMMU_PASID_INVALID from aie4_msg_pasid()
- Power mode: consolidate cached power mode override restoration on
  hardware start directly into the power mode introduction patch, and
  respect user buffer size.
- Transport hooks: fix header include to use <drm/amdxdna_accel.h>.
- Command submission & fencing:
  - Fold fence timeline naming (using dev_name() backed by struct
    device to avoid use-after-free) and unique timeline context allocation
    into the command submission patch.

Series structure:

1. Firmware Interfaces, Versioning & Compatibility (Patches 1-4)
   - Patch 1: Rename NPU3 firmware filenames to match official release
     binaries.
   - Patch 2: Remove userspace doorbell mmap and default to kernel
     submission.
   - Patch 3: Add CERT (Column Embedded Run Time) firmware version
     queries and protocol validation.
   - Patch 4: Upgrade firmware interface version to 6.0.

2. Device Operations, Telemetry & Power Modes (Patches 5-8)
   - Patch 5: Add NPU3 classic device operations, and remove device IDs
     0x1B0B and 0x1B0C.
   - Patch 6: Expose AIE and NPU firmware versions via GET_INFO ioctl.
   - Patch 7: Add power mode support, and restore cached user power mode.
   - Patch 8: Add clock metadata, DPM frequency table initialization,
     and hardware resource info queries.

3. Hardware Initialization & Transport Hooks (Patches 9-11)
   - Patch 9: Add context switch hysteresis configuration with debugfs
     control (ctx_switch_hysteresis_us) applied on hardware start.
   - Patch 10: Refactor AIE4 hardware initialization sequence into
     distinct modular phases (query_fw, config_fw, setup_aie) across
     PF, VF, and classic devices.
   - Patch 11: Decouple PCI doorbell and MSI-X notification transport
     hooks from transport-neutral context management code.

4. Kernel-Mode Command Submission & Fencing (Patches 12-14)
   - Patch 12: Implement kernel queue lifecycle, job workqueue, and
     memory layout for kernel-mode submission.
   - Patch 13: Prepare command submission structures.
   - Patch 14: Implement full command packet building (direct/indirect
     packets).

5. System & Runtime Power Management (Patches 15-18)
   - Patch 15: Fix runtime PM deadlock on device removal by finalizing
     RPM before acquiring dev_lock, and symmetrically initialize RPM
     during probe across all device types.
   - Patch 16: Implement system suspend and resume for PF, VF, and
     classic devices, restoring contexts.
   - Patch 17: Link SR-IOV VFs via device_link_add() to ensure the PM
     core suspends VFs before the PF and resumes the PF before VFs.
   - Patch 18: Implement runtime suspend and resume support.

6. Userspace ABI Compatibility (Patch 19)
   - Patch 19: Add a stub hwctx_config callback returning 0 to support
     the DRM_AMDXDNA_CONFIG_HWCTX ioctl, enabling userspace validation
     runtimes (such as XRT GEMM tests) to run unmodified.

7. Firmware Logging (Patch 20)
   - Patch 20: Allocate a DRAM buffer for firmware logging on PF and
     classic devices and register it at hardware start, with the log
     level set to the least verbose setting.

Testing:
- Tested on AMD AIE4/NPU3 hardware in both classic and SR-IOV (PF/VF)
  modes.
- Verified kernel-mode command submission with direct and indirect
  execution packets under concurrent workloads.
- Verified system suspend/resume (S2idle/S3) and runtime autosuspend
  cycles during idle and active command submission.
- Verified SR-IOV VF binding, execution, and PM dependency sequencing.
- Confirmed no regression on existing AIE2 devices (NPU1/NPU4).

David Zhang (20):
  accel/amdxdna: Rename NPU3 firmware files
  accel/amdxdna: Remove mmap for doorbell
  accel/amdxdna: Add CERT firmware version support
  accel/amdxdna: Upgrade firmware version to 6.0
  accel/amdxdna: Add NPU3 classic device support
  accel/amdxdna: Add AIE version query to aie4_get_info
  accel/amdxdna: Add get and set power_mode for AIE4
  accel/amdxdna: Add clock, DPM frequency, and resource info queries for
    AIE4
  accel/amdxdna: Add context switch hysteresis with debugfs control
  accel/amdxdna: Refactor AIE4 hardware initialization sequence
  accel/amdxdna: Decouple AIE4 doorbell and MSI-X notification transport
    hooks
  accel/amdxdna: Implement AIE4 kernel queue lifecycle and memory layout
  accel/amdxdna: Prepare for AIE4 command submission
  accel/amdxdna: Implement AIE4 command packet building and submission
  accel/amdxdna: Finalize runtime PM before acquiring dev_lock on
    removal
  accel/amdxdna: Implement AIE4 suspend and resume
  accel/amdxdna: Link SR-IOV VFs for power management sequencing
  accel/amdxdna: Implement runtime suspend and resume support
  accel/amdxdna: Add stub hwctx_config for AIE4
  accel/amdxdna: Enable AIE4 firmware logging to DRAM

 drivers/accel/amdxdna/aie.c             |   45 +-
 drivers/accel/amdxdna/aie.h             |   45 +-
 drivers/accel/amdxdna/aie2_message.c    |    4 +-
 drivers/accel/amdxdna/aie2_pci.c        |   65 +-
 drivers/accel/amdxdna/aie2_pci.h        |   39 +-
 drivers/accel/amdxdna/aie2_pm.c         |   10 +-
 drivers/accel/amdxdna/aie4_ctx.c        | 1086 +++++++++++++++++++++--
 drivers/accel/amdxdna/aie4_host_queue.h |   79 +-
 drivers/accel/amdxdna/aie4_message.c    |  237 +++++
 drivers/accel/amdxdna/aie4_msg_priv.h   |  161 +++-
 drivers/accel/amdxdna/aie4_pci.c        |  867 +++++++++++++++++-
 drivers/accel/amdxdna/aie4_pci.h        |  143 ++-
 drivers/accel/amdxdna/aie4_sriov.c      |  104 ++-
 drivers/accel/amdxdna/amdxdna_ctx.c     |   20 +-
 drivers/accel/amdxdna/amdxdna_ctx.h     |   22 +
 drivers/accel/amdxdna/amdxdna_debugfs.c |    3 +
 drivers/accel/amdxdna/amdxdna_pci_drv.c |   53 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.h |   18 +-
 drivers/accel/amdxdna/amdxdna_pm.c      |   35 +
 drivers/accel/amdxdna/amdxdna_pm.h      |    4 +-
 drivers/accel/amdxdna/amdxdna_sysfs.c   |    2 +-
 drivers/accel/amdxdna/npu1_regs.c       |   19 +-
 drivers/accel/amdxdna/npu3_regs.c       |   99 ++-
 drivers/accel/amdxdna/npu4_regs.c       |   30 +-
 24 files changed, 2907 insertions(+), 283 deletions(-)

-- 
2.34.1

