Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792587470;
	b=TUoKCvCn+vZc9pV4x/EWRa2Ghxg4N0+MvOtSaJwvVC1AVTcTjQGZbC2cncCzItPMrQw6
	 KmGJ4MuwNC61dY24sSF0FXDlf6UFRrVf35gfmgIFB/CDSQrmbr5cywCs7okzGkMkhPH0f
	 CrZ2/aku6Fw0rqjC3P2Xk21JvCz1J9iaomzQMAS0uYlvj2/4AP5kMR7m+aoA95P+f1DtC
	 wx7x76LarX6wm2vIuB2Tv5GLzmDCUUdVTgmRBFkeBnXr63Mf59acSBi9ivKUYZuig2Kbf
	 K9pe63vsKlyRTcxhmjPpJL7LikkD7vx0qnzScDoRjcYSPQ+HZdLz91EQdG048ULjlDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587470;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
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
	bh=/vMQuVSAqorzQ/vh4hCuxQPpfm74t/XbbwGJQFol6qg=;
	b=pHoh8uqYIuyPu3OqHCza1r/yoIB1cQOr3c2JoHGsU9UtpWdP1rAMTMM2oPkHm4fcp4me
	 L4rf0gCmzkEooJemb8m6qg+Aa5CFd2mmTOkJeSnoV2S9cwxTskYUpBRJoA3jQCNgdo1YB
	 syCXIIvRH+/MfN2hBf9VFG6JbYSuCD8ZlS5vz7ZberuzkikiiZfPQJjKkcLaJJRIVcf/K
	 WEbfiQtGWc/sZCtkQdaVniQZ/Es5Anm5r8a0T8WfxDKuQkLIrOIMSdg2/dhISPWnl08ih
	 QHjyQ9qTMISR5RHdju/N0DpD5tm7c8wCYxsQMz44Ea3abzauxrMdXquOVBVLm6fJsIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="iMTZIW/r";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.4
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013004.outbound.protection.outlook.com [40.93.201.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13627606A33D;
	Wed, 21 Oct 2026 12:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13627606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=iMTZIW/r
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jf9/QSe1O2caYhSV7h00dWmThMVJqwS5P00+gn4lkMApQIU/35+dSeo+L/TwUm17cX2kOhrUHnLFVUAJKIPkMqolOfKge/y960DRTaxmoZY6Od3dVxSoj9/LlVNIO71D5a5gxu7cLRVPTplPtoZP/jB60T3k4ax3yqSBeh+X88PRmG8zHTFK86Z1gdffakBBO9UPNPLObnKBbPqtQvZc0DOHQpO3N6Ofm+AzXl3WTHk1HYAYu8rvyybBYbutkc5LEUXQBspNeimQv0wPwStwq0hldcFNp1hGDxXstK6vbwaXeOu2q/pOnzxffb8AFsHZd4BoUuwTQWPcVAbEjCjZ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vMQuVSAqorzQ/vh4hCuxQPpfm74t/XbbwGJQFol6qg=;
 b=yxnqYkDqz2CIsXl4NH04LHcpugvLNj7LlJhaqCxoCIUHvA+jBOJxhCpoRDp6+CBano+Cyim6FoZsHsevR5eEcoGKnvKSkuHGgAbk9FY3IYK2IvTERgEU4Nx5i87ypp5pfVANHFNU18939HrBn1kmBy4LYIVf2odOPB1MwP5GW774IYodOjZHOuA9yo6w1OAbHfs7PXyUoVjNkZ2mCf5Yai2iyYn87uvR+kMc1h0UV7g7rSvq7SrED0SyEuWesDjHqeMnnDjFDF0sGlKP7b/Q9C1bSIngsJyMd7iaopbPYIIu9W4OIHXULeoodmOZTGH6P0yup/r1np1fTP9gUV4EUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vMQuVSAqorzQ/vh4hCuxQPpfm74t/XbbwGJQFol6qg=;
 b=iMTZIW/rGJ6rF/jz8Yp0ohB2yWNTdgxzq/5hVjMk1GohHybxl0T5bXGRkqeFx6w3/3O6GRgl3qSWKdiB5r9IMENU6sGbJlXDb4Cc3jQU9tXxNl1g4Yo3hu0EHjAPmSbzB1jyNyCmY5hONJaNaSZrrZzJYfBerHSfTDG5XwV9gL4=
Received: from CH0P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::21)
 by CH2PR12MB4039.namprd12.prod.outlook.com (2603:10b6:610:a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 12:57:41 +0000
Received: from DM2PEPF00003FC3.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::4c) by CH0P221CA0020.outlook.office365.com
 (2603:10b6:610:11c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Wed,
 21 Oct 2026 12:57:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM2PEPF00003FC3.mail.protection.outlook.com (10.167.23.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 12:57:41 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 21 Oct
 2026 07:57:40 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 21 Oct
 2026 07:57:39 -0500
Received: from xhdrveggala50x.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Wed, 21 Oct 2026 07:57:36 -0500
From: Rama devi Veggalam <rama.devi.veggalam@amd.com>
To: <bp@alien8.de>, <tony.luck@intel.com>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <james.morse@arm.com>, <mchehab@kernel.org>,
	<rric@kernel.org>, <git@amd.com>, Rama devi Veggalam
	<rama.devi.veggalam@amd.com>
Subject: [PATCH v4 3/3] edac: xilinx: Add XilSEM CRAM/NPI error monitoring support
Date: Wed, 21 Oct 2026 18:27:22 +0530
Message-ID: <1792587442-2794880-4-git-send-email-rama.devi.veggalam@amd.com>
X-Mailer: git-send-email 1.9.5
In-Reply-To: <1792587442-2794880-1-git-send-email-rama.devi.veggalam@amd.com>
References: <1792587442-2794880-1-git-send-email-rama.devi.veggalam@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC3:EE_|CH2PR12MB4039:EE_
X-MS-Office365-Filtering-Correlation-Id: a84e65cb-49ef-4f21-8d6d-08df2f72e468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|7416014|6133799003|22082099003|18002099003|10067099003|3023799007|5023799004|11063799006|261009223027099003|261009221227099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	oPH1bRL0+sa/z9kyTeP4K9PoVlfJEla/TS9muBD8E8ubtu6ZCMPTG9/SNK2c/J/TGMOpAv3EbB1mWE/KeAujYd9wlsvMoIvqDv/K+/MQlprsh0muazmlMZveOP669N8+qjEn+xh6htTYb7hlz1IQXJPEZy0jMgH2G6Au9/vVBj/UDE9A+NVuHViVdVtJO7b4UrZ3y91AbI6P+g26XHus6HgCmR04XroD+/2mKsvrdO1t/iCQG/C0XspT1XAMXHxIiZahdLe7MAc6by59Nj6Ii9FkT9U15RpDI1s2jwoZ2TGW5/lRaSiYk0D+v7huCHUvdAC9mb1LNy3Q0fZwxrwxffv934LmwuYiXvlSFAX74HkIRlvWRzcQqdJAqFJBfDAd9L2FUicIRWK/S07b+/4UEf2lN6Y8tDl5n9AYGczuW9SPREaNed9GvQAVWvW+1pyAySyxq9QPYrT7PZmuEWQ2hSgTJujTCcmxgaexxpOhOIwhKi3wbU737fT9Q6QmYjKmm/4vtlS+c32nu5MZEIjoxbQlbdJ0ch6g7V1kx3uTYHFsREiWxVyWtHJn1aAaEVJhFo97qmnUCFG8IrYf6p4Rb/2mFwxBqZwrshGmu3NnyJnVrArTJ1yowXSy/scm0WCtc0AGi90PRdAlVNONkWviE0DUjjM+DJxq9THTv9wBIbEFsRouKNUVZqezkUAwWrpmhYcYf1pdeeOpzJ2OI3fvUw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(7416014)(6133799003)(22082099003)(18002099003)(10067099003)(3023799007)(5023799004)(11063799006)(261009223027099003)(261009221227099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YmDBpH5zpK8jqcvnhmf/CV410sltg9NaFB94PPZh23GggREK59MyuoO/IUURP8UOQmQab+ySuD4FVWRkKV5PRABBmt6nek69XWdYARuTgEX0OC6oqREsW0xk4zd0tshYnxo4N/UgfP7B4Gne++nda+He3OGGJS7hwtZHsMBs2wcrip4k4Za3fow8snj5oAEEKnPxuxBnNQnP5ZQq5njWQXR4/v4PFQHN0tkAzmqgP7yk4HwP4APyI71/H3/IviZkhto2aHLjOJ5P0pyfh99s84Rusbt2GmLPeeeJhbHF8OdvWeguNoe0Jq59ZhJQDsv9zOoL9xvzCLMO0P9cEx3qv6lxeLGsHSdpktp9TCNTjAywPgjdC7u0QUyZSJoNFT/dAk9ffCylPzkKhY6q3zGAb9OD+2aQ2kx7JtGgfF4G60gbRJQqoT8TFYWoqp5eKBGw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 12:57:41.3954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a84e65cb-49ef-4f21-8d6d-08df2f72e468
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4039

Add support for the "xlnx,versal-xilsem" compatible string to
the existing versal_edac driver, registering a second, independent
EDAC device for XilSEM (Xilinx Soft Error Mitigation), which monitors
Configuration RAM (CRAM) and the NoC Programming Interface (NPI) for
correctable and uncorrectable errors.

Add drivers/edac/xsem_edac.h with the register offsets and structure
definitions required for XilSEM, kept separate from the existing DDR
memory-controller (DDRMC) definitions in versal_edac.c.

Extend versal_edac.c with xsem_edac_probe()/xsem_edac_remove() and
the 8 xsem_* sysfs attributes for XilSEM scan control/status
operations.

Update the EDAC_VERSAL Kconfig help text to describe both device
types now handled by this driver, and update MAINTAINERS with the
new files and an additional maintainer.

Signed-off-by: Rama devi Veggalam <rama.devi.veggalam@amd.com>
---
Changes in v4:
- Registered a second, independent EDAC device for XilSEM alongside
  the existing DDRMC device, under the same driver module.
- Added drivers/edac/xsem_edac.h with XilSEM register/structure
  definitions.
- Added xsem_edac_probe()/xsem_edac_remove() and 8 xsem_* sysfs
  attributes, with matching ABI docs in sysfs-devices-versal-edac
  (same commit).
- Updated Kconfig help text and MAINTAINERS for the new files/
  maintainer.

Changes in v3:
- Merged Versal XilSem edac with Versal edac

Changes in v2:
- Patch created on top of dependent patch series "enhance zynqmp_pm_get_family_info()"
- Fixed maximum length warning in patch description
- Added details for eprobe_defer conditions
- Updated copyright information
- Removed ARCH_ZYNQMP in dependent list of XilSEM Kconfig
- Added error code for invalid versal device type
- Removed redundant sysfs details in function headers
- Included MAINTAINERS to this patch
- Added more description in commit message
- Removed print for probe success
- Removed function comments for xsem_edac_remove()
---
 .../ABI/testing/sysfs-devices-versal-edac          |  286 +++++
 MAINTAINERS                                        |    5 +
 drivers/edac/Kconfig                               |   17 +-
 drivers/edac/versal_edac.c                         | 1276 +++++++++++++++++++-
 drivers/edac/xsem_edac.h                           |  219 ++++
 5 files changed, 1781 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-versal-edac
 create mode 100644 drivers/edac/xsem_edac.h

diff --git a/Documentation/ABI/testing/sysfs-devices-versal-edac b/Documentation/ABI/testing/sysfs-devices-versal-edac
new file mode 100644
index 0000000..0bbe207
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-versal-edac
@@ -0,0 +1,286 @@
+What:		/sys/devices/system/edac/versal_xilsem/xsem_scan_control_ops
+Date:		October 2026
+Contact:	rama.devi.veggalam@amd.com
+Description:
+		It is a read/write file.
+		Writing to this file causes the software to initiate a
+		request to the firmware for doing requested scan operation in
+		Configuration RAM (CRAM) or NPI of Versal mono/SSIT devices.
+		User needs to provide scan operation id (init, start, stop) and
+		SLR id (Versal SSIT device) details. For Versal mono devices,
+		the SLR id should be 0.
+		Write format: <scan operation id> <SLR id>, space-separated,
+		each value in decimal or 0x-prefixed hex.
+		The scan operation id values are as given below:
+		1 - Initialize the scan
+		2 - Start CRAM scan
+		3 - Stop CRAM scan
+		5 - Start NPI scan
+		6 - Stop NPI scan
+		7 - Inject NPI error in first descriptor
+		Id 4 (CRAM error injection) is reserved for the separate
+		xsem_cram_injecterr attribute below; writing 4 here returns
+		-EINVAL.
+
+		When read, it shows the current scan status with error code.
+		The format is [header][error code][Slr ID][status word 1]
+		[status word 2][status word 3], where header is
+		(0x1030 | operation Id) and the three trailing status words
+		are additional firmware status data returned alongside the
+		error code.
+		The different error codes are as given below:
+		==========	=====
+		Error Code	Cause
+		==========	=====
+		0x0			Scan operation success
+		0x1			Failure in NPI scan
+		0x80		Calibration timeout
+		0x2000		Internal error
+		0x500000	CRAM initialization not yet done
+		0x600000	Start scan failed
+		0x700000	Stop scan failed
+		0xF00000	Active CRC/UE error
+		0x1000000	ECC/CRC error detected during calibration
+		==========	=====
+
+		Note: the result read back is the last command's result for
+		this attribute, held in state shared by every opener of this
+		file, not per-caller state. Concurrent writers must serialize
+		their own access if they need a guaranteed request/response
+		pairing.
+
+What:		/sys/devices/system/edac/versal_xilsem/xsem_cram_injecterr
+Date:		October 2026
+Contact:	rama.devi.veggalam@amd.com
+Description:
+		It is a read/write file.
+		Writing to this file causes the software to initiate a
+		request to the firmware for doing error injection in
+		Configuration RAM (CRAM) of Versal mono/SSIT devices.
+		User needs to provide the location details of CRAM
+		(frame, qword, bit number, row number) and
+		SLR id (Versal SSIT device) details to inject the error.
+		Write format: <frame> <qword> <bit number> <row number>
+		<SLR id>, space-separated, each value in decimal or
+		0x-prefixed hex.
+		For Versal mono devices, the SLR id should be 0.
+		When read, it shows the current error injection status. The
+		format is [header][error code][Slr ID].
+		Example: [0x10304][0x0][0x0]
+		The different error codes are as given below:
+		==========	=====
+		Error Code	Cause
+		==========	=====
+		0x0			Error injection success
+		0x2000		Internal NULL pointer error
+		0x500000	CRAM initialization not yet done
+		0x800000	Invalid row
+		0x900000	Invalid qword
+		0xA00000	Invalid bit
+		0xB00000	Invalid frame address
+		0xC00000	Unexpected bits flipped
+		0xD00000	Masked bit
+		0xE00000	Invalid block type
+		0xF00000	Active CRC/UE error in CRAM
+		==========	=====
+
+		Note: the result read back is the last command's result for
+		this attribute, held in state shared by every opener of this
+		file, not per-caller state. Concurrent writers must serialize
+		their own access if they need a guaranteed request/response
+		pairing.
+
+What:		/sys/devices/system/edac/versal_xilsem/xsem_cram_framecc_read
+Date:		October 2026
+Contact:	rama.devi.veggalam@amd.com
+Description:
+		It is a read/write file.
+		Writing to this file causes the software to initiate a
+		request to the firmware for reading frame ECC values in
+		Configuration RAM (CRAM) of Versal devices. User needs
+		to provide the location details of CRAM
+		(frame, row number, SLR id in SSIT device) to read the ECC values.
+		Write format: <frame> <row number> <SLR id>, space-separated,
+		each value in decimal or 0x-prefixed hex.
+		For Versal mono devices, SLR id should be 0.
+		When read, it shows the ECC values for the requested frame.
+		The format is <header> <ECC_0> <ECC_1> <status>
+		Example:
+		Read Frame ECC Cmd: [0x3030a]
+		Frame ECC Word_0: [0x52f245]
+		Frame ECC Word_1: [0x7c5a6b]
+		Cmd Status: [0x0]
+
+		Note: the result read back is the last command's result for
+		this attribute, held in state shared by every opener of this
+		file, not per-caller state. Concurrent writers must serialize
+		their own access if they need a guaranteed request/response
+		pairing. This file also returns multiple formatted values per
+		read(), rather than the single value per file recommended by
+		Documentation/filesystems/sysfs.rst.
+
+What:		/sys/devices/system/edac/versal_xilsem/xsem_read_config
+Date:		October 2026
+Contact:	rama.devi.veggalam@amd.com
+Description:
+		It is a read/write file.
+		Writing to this file causes the software to initiate a
+		request to the firmware for reading Xilsem configuration.
+		User needs to provide SLR id (Versal SSIT device) details.
+		For Versal mono devices, the SLR id should be 0.
+		Write format: <SLR id>, in decimal or 0x-prefixed hex.
+		When read, it shows the CRAM and NPI scan configuration.
+		The format is <header> <CRAM config> <NPI config> <status>
+		Example: Read Config Cmd: [0x30309]
+		CRAM Scan Config: [0x2e]
+		NPI Scan Config: [0x5016]
+		Cmd Status: [0x0]
+
+		Note: the result read back is the last command's result for
+		this attribute, held in state shared by every opener of this
+		file, not per-caller state. Concurrent writers must serialize
+		their own access if they need a guaranteed request/response
+		pairing. This file also returns multiple formatted values per
+		read(), rather than the single value per file recommended by
+		Documentation/filesystems/sysfs.rst.
+
+What:		/sys/devices/system/edac/versal_xilsem/xsem_read_status
+Date:		October 2026
+Contact:	rama.devi.veggalam@amd.com
+Description:
+		It is a read/write file.
+		Writing to this file causes the software to initiate a
+		request to read the Xilsem status. User needs to provide
+		the module id for status. The module id values are as given below:
+		1 - CRAM scan
+		2 - NPI scan
+		Write format: <module id>, in decimal or 0x-prefixed hex.
+		When read, it shows the status of the requested module. The
+		format is always [value 0][value 1][value 2].
+		For CRAM: value 0 is status, value 1 is CE count, value 2 is
+		always 0 (unused for this module).
+		Example: [0x10005][0x0][0x0]
+		For NPI: value 0 is status, value 1 is scan count, value 2 is
+		heartbeat count.
+		Example: [0xA01][0x10][0x1]
+
+		Note: the result read back is the last command's result for
+		this attribute, held in state shared by every opener of this
+		file, not per-caller state. Concurrent writers must serialize
+		their own access if they need a guaranteed request/response
+		pairing. This file also returns multiple formatted values per
+		read(), rather than the single value per file recommended by
+		Documentation/filesystems/sysfs.rst.
+
+What:		/sys/devices/system/edac/versal_xilsem/xsem_cram_ssit_getcrc
+Date:		October 2026
+Contact:	rama.devi.veggalam@amd.com
+Description:
+		It is a read/write file.
+		Writing to this file causes the software to initiate a
+		request to read CRC of a row in CRAM. User needs to provide
+		the row number and SLR id (Versal SSIT device) for which CRC
+		to be read. Write format: <row number> <SLR id>,
+		space-separated, each value in decimal or 0x-prefixed hex.
+		For Versal mono devices, SLR id should be 0.
+		When read, it shows the CRC of the requested row.
+		The format is: <Header> <CRC Word 0 to 3> <status>
+		Example: Read CRC Cmd:[0x1030c]
+		CRC_Word 0:[0x0]
+		CRC_Word 1:[0x1f72d881]
+		CRC_Word 2:[0x0]
+		CRC_Word 3:[0x0]
+		Cmd status: [0x0]
+
+		Note: the result read back is the last command's result for
+		this attribute, held in state shared by every opener of this
+		file, not per-caller state. Concurrent writers must serialize
+		their own access if they need a guaranteed request/response
+		pairing. This file also returns multiple formatted values per
+		read(), rather than the single value per file recommended by
+		Documentation/filesystems/sysfs.rst.
+
+What:		/sys/devices/system/edac/versal_xilsem/xsem_read_ssit_status
+Date:		October 2026
+Contact:	rama.devi.veggalam@amd.com
+Description:
+		It is a read/write file.
+		Writing to this file causes the software to initiate a
+		request to read CRAM and NPI scan status information in a given SLR.
+		User needs to provide SLR id in Versal SSIT device for which
+		XilSEM status to be read. Write format: <SLR id>, in decimal
+		or 0x-prefixed hex. When read, it shows
+		the XilSEM status of the requested SLR.
+		The format is: <Header> <SLR id> <NPI status info> <CRAM status info>
+		Example: Read SLR Status Cmd:[0x1030d]
+		SLR ID:[0x3]
+		NPI status:[0xa01]
+		NPI scan count:[0x413]
+		NPI Heartbeat count:[0x1150c]
+		NPI scan skip count 0 :[0x0]
+		NPI scan skip count 1 :[0x0]
+		NPI scan skip count 2 :[0x0]
+		NPI scan skip count 3 :[0x0]
+		NPI scan skip count 4 :[0x0]
+		NPI scan skip count 5 :[0x0]
+		NPI scan skip count 6 :[0x0]
+		NPI scan skip count 7 :[0x0]
+		NPI error info 0 :[0x0]
+		NPI error info 1 :[0x0]
+		CRAM status:[0x10005]
+		Error Location High 0: [0x0]
+		Error Location Low 0: [0x0]
+		Error Location High 1: [0x0]
+		Error Location Low 1: [0x0]
+		Error Location High 2: [0x0]
+		Error Location Low 2: [0x0]
+		Error Location High 3: [0x0]
+		Error Location Low 3: [0x0]
+		Error Location High 4: [0x0]
+		Error Location Low 4: [0x0]
+		Error Location High 5: [0x0]
+		Error Location Low 5: [0x0]
+		Error Location High 6: [0x0]
+		Error Location Low 6: [0x0]
+		CRAM scan CE count:[0x0]
+
+		Note: the result read back is the last command's result for
+		this attribute, held in state shared by every opener of this
+		file, not per-caller state. Concurrent writers must serialize
+		their own access if they need a guaranteed request/response
+		pairing. This file also returns many formatted values across
+		many lines per read(), rather than the single value per file
+		recommended by Documentation/filesystems/sysfs.rst.
+
+What:		/sys/devices/system/edac/versal_xilsem/xsem_total_cframes_ssit
+Date:		October 2026
+Contact:	rama.devi.veggalam@amd.com
+Description:
+		It is a read/write file.
+		Writing to this file causes the software to initiate a
+		request to read total cframes in a row in CRAM.
+		User needs to provide row number and SLR id in
+		Versal SSIT device for which total frames to be read.
+		Write format: <row number> <SLR id>, space-separated, each
+		value in decimal or 0x-prefixed hex.
+		When read, it shows total number of Cframes for the requested SLR.
+		The format is: <Header> <SLR id> <row> <total frames> <Cmd status>
+		Example: Read Total Frames Cmd : [0x4030e]
+		SLR ID : [0x3]
+		Row Index: [0x0]
+		Type[0] frame count: [38752]
+		Type[1] frame count: [262144]
+		Type[2] frame count: [20480]
+		Type[3] frame count: [16]
+		Type[4] frame count: [8]
+		Type[5] frame count: [0]
+		Type[6] frame count: [83]
+		Cmd Status: [0x0]
+
+		Note: the result read back is the last command's result for
+		this attribute, held in state shared by every opener of this
+		file, not per-caller state. Concurrent writers must serialize
+		their own access if they need a guaranteed request/response
+		pairing. This file also returns multiple formatted values per
+		read(), rather than the single value per file recommended by
+		Documentation/filesystems/sysfs.rst.
diff --git a/MAINTAINERS b/MAINTAINERS
index 7b5cab7..fc68e0e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29992,10 +29992,15 @@ F:	include/uapi/linux/xilinx-v4l2-controls.h
 XILINX VERSAL EDAC DRIVER
 M:	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
 M:	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
+M:	Rama Devi Veggalam <rama.devi.veggalam@amd.com>
 R:	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
 S:	Maintained
+F:	Documentation/ABI/testing/sysfs-devices-versal-edac
 F:	Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-edac.yaml
 F:	drivers/edac/versal_edac.c
+F:	drivers/edac/xsem_edac.h
+F:	drivers/firmware/xilinx/zynqmp-sem.c
+F:	include/linux/firmware/xlnx-zynqmp-sem.h
 
 XILINX VERSALNET EDAC DRIVER
 M:	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 4c70729..66090db 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -559,15 +559,20 @@ config EDAC_NPCM
 	  device used to store data is used for ECC storage).
 
 config EDAC_VERSAL
-	tristate "Xilinx Versal DDR Memory Controller"
+	tristate "Xilinx Versal DDR Memory Controller and XilSEM"
 	depends on ARCH_ZYNQMP || COMPILE_TEST
 	help
 	  Support for error detection and correction on the Xilinx Versal DDR
-	  memory controller.
-
-	  Report both single bit errors (CE) and double bit errors (UE).
-	  Support injecting both correctable and uncorrectable errors
-	  for debugging purposes.
+	  memory controller, and for the XilSEM (Soft Error Mitigation)
+	  monitor of configuration memory in the programmable logic (PL)
+	  fabric and NPI interconnect. These are two independent devices
+	  with independent probe paths, both handled by this one driver
+	  module.
+
+	  Report both single bit errors (CE) and double bit errors (UE) for
+	  DDR, and correctable/uncorrectable CRAM and NPI errors for XilSEM.
+	  Support injecting both correctable and uncorrectable errors for
+	  debugging purposes.
 
 config EDAC_LOONGSON
 	tristate "Loongson Memory Controller"
diff --git a/drivers/edac/versal_edac.c b/drivers/edac/versal_edac.c
index 5a43b5d..7a50243 100644
--- a/drivers/edac/versal_edac.c
+++ b/drivers/edac/versal_edac.c
@@ -1,11 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Xilinx Versal memory controller driver
- * Copyright (C) 2023 Advanced Micro Devices, Inc.
+ * Copyright (C) 2023 - 2026, Advanced Micro Devices, Inc.
  */
 #include <linux/bitfield.h>
+#include <linux/dma-mapping.h>
 #include <linux/edac.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -13,9 +15,13 @@
 #include <linux/platform_device.h>
 #include <linux/sizes.h>
 #include <linux/firmware/xlnx-zynqmp.h>
+#include <linux/firmware/xlnx-zynqmp-sem.h>
 #include <linux/firmware/xlnx-event-manager.h>
 
 #include "edac_module.h"
+#include "xsem_edac.h"
+
+#define EDAC_DEVICE	"Xilsem"
 
 /* Granularity of reported error in bytes */
 #define XDDR_EDAC_ERR_GRAIN			1
@@ -1038,14 +1044,17 @@ static void setup_address_map(struct edac_priv *priv)
 }
 #endif /* CONFIG_EDAC_DEBUG */
 
-static const struct of_device_id xlnx_edac_match[] = {
-	{ .compatible = "xlnx,versal-ddrmc", },
-	{
-		/* end of table */
-	}
-};
-
-MODULE_DEVICE_TABLE(of, xlnx_edac_match);
+/*
+ * emif_get_id - Return the DDR memory controller instance ID.
+ * @node:	Device node for the DDR memory controller.
+ *
+ * Scoped to "xlnx,versal-ddrmc" nodes only, so that once this driver
+ * also matches "xlnx,versal-xilsem" (see the combined
+ * xlnx_edac_match[] table below), XilSEM nodes never affect DDR memory
+ * controller instance numbering.
+ *
+ * Return: a unique ID for the given DDR memory controller.
+ */
 static u32 emif_get_id(struct device_node *node)
 {
 	u32 addr, my_addr, my_id = 0;
@@ -1055,7 +1064,7 @@ static u32 emif_get_id(struct device_node *node)
 	addrp = of_get_address(node, 0, NULL, NULL);
 	my_addr = (u32)of_translate_address(node, addrp);
 
-	for_each_matching_node(np, xlnx_edac_match) {
+	for_each_compatible_node(np, NULL, "xlnx,versal-ddrmc") {
 		if (np == node)
 			continue;
 
@@ -1073,7 +1082,7 @@ static u32 emif_get_id(struct device_node *node)
 	return my_id;
 }
 
-static int mc_probe(struct platform_device *pdev)
+static int ddrmc_probe(struct platform_device *pdev)
 {
 	void __iomem *ddrmc_baseaddr, *ddrmc_noc_baseaddr;
 	struct edac_mc_layer layers[2];
@@ -1162,7 +1171,7 @@ static int mc_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static void mc_remove(struct platform_device *pdev)
+static void ddrmc_remove(struct platform_device *pdev)
 {
 	struct mem_ctl_info *mci = platform_get_drvdata(pdev);
 	struct edac_priv *priv = mci->pvt_info;
@@ -1180,7 +1189,1242 @@ static void mc_remove(struct platform_device *pdev)
 	edac_mc_free(mci);
 }
 
-static struct platform_driver xilinx_ddr_edac_mc_driver = {
+/**
+ * xsem_scan_control_show - Shows scan control operation status
+ * @dci:	Pointer to the edac device struct
+ * @data:	Pointer to user data
+ *
+ * Shows the scan control operations status
+ * Return: Number of bytes copied.
+ */
+static ssize_t xsem_scan_control_show(struct edac_device_ctl_info *dci, char *data)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	int ret;
+
+	mutex_lock(&priv->lock);
+	ret = scnprintf(data, PAGE_SIZE, "[0x%x][0x%x][0x%x][0x%x][0x%x][0x%x]\n",
+			priv->scan_ctrl_status.hdr, priv->scan_ctrl_status.status,
+			priv->scan_ctrl_status.slrid, priv->scan_ctrl_status.status1,
+			priv->scan_ctrl_status.status2, priv->scan_ctrl_status.status3);
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+/**
+ * xsem_store_prep - Copy a sysfs store() write into a kernel buffer
+ * @data:	Pointer to user data
+ * @count:	Number of bytes written
+ *
+ * Return: Pointer to a NUL-terminated kernel copy of data, to be freed by
+ * the caller with kfree(), or NULL on allocation failure.
+ */
+static char *xsem_store_prep(const char *data, size_t count)
+{
+	char *kern_buff;
+
+	/*
+	 * Allocate one extra byte for the NUL terminator: strscpy() copies at
+	 * most (size-1) bytes from data and always writes the terminator at
+	 * kern_buff[size-1]. A "count"-sized buffer would silently drop the
+	 * last byte of a full, non-newline-terminated "count"-byte write.
+	 */
+	kern_buff = kzalloc(count + 1, GFP_KERNEL);
+	if (!kern_buff)
+		return NULL;
+
+	strscpy(kern_buff, data, count + 1);
+
+	return kern_buff;
+}
+
+/**
+ * xsem_parse_token - Parse the next space-separated token as an unsigned int
+ * @inbuf:	Pointer to the remaining unparsed buffer, advanced past the
+ *		consumed token
+ * @val:	Output value
+ *
+ * Return: 0 on success, -EINVAL if there is no token left or it is not a
+ * valid unsigned integer.
+ */
+static int xsem_parse_token(char **inbuf, u32 *val)
+{
+	char *tok;
+
+	tok = strsep(inbuf, " ");
+	if (!tok)
+		return -EINVAL;
+
+	if (kstrtouint(tok, 0, val))
+		return -EINVAL;
+
+	return 0;
+}
+
+/**
+ * xsem_scan_control_store - Set scan control operation
+ * @dci:	Pointer to the edac device struct
+ * @data:	Pointer to user data
+ * @count:	read the size bytes from buffer
+ *
+ * User-space interface for doing Xilsem scan operations
+ * (initialization, start, stop)
+ * Return: count argument if request succeeds, else error code
+ */
+static ssize_t xsem_scan_control_store(struct edac_device_ctl_info *dci,
+				       const char *data, size_t count)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	char *kern_buff, *inbuf;
+	u32 cmd;
+	u32 slrid;
+	int ret;
+
+	kern_buff = xsem_store_prep(data, count);
+	if (!kern_buff)
+		return -ENOMEM;
+
+	inbuf = kern_buff;
+
+	/* Read Scan command */
+	ret = xsem_parse_token(&inbuf, &cmd);
+	if (ret)
+		goto err;
+
+	/* Read SLR number */
+	ret = xsem_parse_token(&inbuf, &slrid);
+	if (ret)
+		goto err;
+
+	switch (cmd) {
+	case CRAM_INIT_SCAN:
+	case CRAM_START_SCAN:
+	case CRAM_STOP_SCAN:
+	case NPI_START_SCAN:
+	case NPI_STOP_SCAN:
+	case NPI_ERR_INJECT:
+		break;
+	default:
+		ret = -EINVAL;
+		goto err;
+	}
+
+	if (slrid > MAX_SLR_ID) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	mutex_lock(&priv->lock);
+	ret = zynqmp_pm_xilsem_cntrl_ops(cmd, slrid, &priv->scan_ctrl_status);
+	mutex_unlock(&priv->lock);
+err:
+	kfree(kern_buff);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/**
+ * xsem_cram_injecterr_show - Shows CRAM error injection status
+ * @dci:	Pointer to the edac device struct
+ * @data:	Pointer to user data
+ *
+ * Shows CRAM error injection status
+ * Return: Number of bytes copied.
+ */
+static ssize_t xsem_cram_injecterr_show(struct edac_device_ctl_info *dci, char *data)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	int ret;
+
+	mutex_lock(&priv->lock);
+	ret = scnprintf(data, PAGE_SIZE, "[0x%x][0x%x][0x%x]\n", priv->cram_errinj_status.hdr,
+			priv->cram_errinj_status.status, priv->cram_errinj_status.slrid);
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+/**
+ * xsem_cram_injecterr_store - Start error injection
+ * @dci:	Pointer to the edac device struct
+ * @data:	Pointer to user data
+ * @count:	read the size bytes from buffer
+ *
+ * User-space interface for doing CRAM error injection
+ * Return: count argument if request succeeds, else error code
+ */
+static ssize_t xsem_cram_injecterr_store(struct edac_device_ctl_info *dci,
+					 const char *data, size_t count)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	char *kern_buff, *inbuf;
+	u32 row, frame, qword, bitloc, slrid;
+	int ret;
+
+	kern_buff = xsem_store_prep(data, count);
+	if (!kern_buff)
+		return -ENOMEM;
+
+	inbuf = kern_buff;
+
+	/* Read Frame number */
+	ret = xsem_parse_token(&inbuf, &frame);
+	if (ret)
+		goto err;
+
+	/* Read Qword number */
+	ret = xsem_parse_token(&inbuf, &qword);
+	if (ret)
+		goto err;
+
+	/* Read Bit location */
+	ret = xsem_parse_token(&inbuf, &bitloc);
+	if (ret)
+		goto err;
+
+	/* Read Row number */
+	ret = xsem_parse_token(&inbuf, &row);
+	if (ret)
+		goto err;
+
+	/* Read slr id */
+	ret = xsem_parse_token(&inbuf, &slrid);
+	if (ret)
+		goto err;
+
+	if (slrid > MAX_SLR_ID || row > MAX_CFRAME_ROW_ID) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	mutex_lock(&priv->lock);
+	ret = zynqmp_pm_xilsem_cram_err_inj(slrid, frame, qword, bitloc, row,
+					    &priv->cram_errinj_status);
+	mutex_unlock(&priv->lock);
+err:
+	kfree(kern_buff);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/**
+ * xsem_cram_framecc_read_show - Shows CRAM Frame ECC
+ * @dci:	Pointer to the edac device struct
+ * @data:	Pointer to user data
+ *
+ * Shows CRAM Frame ECC value
+ * Return: Number of bytes copied.
+ */
+static ssize_t xsem_cram_framecc_read_show(struct edac_device_ctl_info *dci,
+					   char *data)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	int offset = 0;
+
+	mutex_lock(&priv->lock);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset,
+			    "Read Frame ECC Cmd: [0x%x]\n", priv->cram_frame_ecc.hdr);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset,
+			    "Frame ECC Word_0: [0x%x]\n", priv->cram_frame_ecc.ecc0);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset,
+			    "Frame ECC Word_1: [0x%x]\n", priv->cram_frame_ecc.ecc1);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset,
+			    "Cmd Status: [0x%x]\n", priv->cram_frame_ecc.status);
+	mutex_unlock(&priv->lock);
+
+	return offset;
+}
+
+/**
+ * xsem_cram_framecc_read_store - Read CRAM Frame ECC
+ * @dci:	Pointer to the edac device struct
+ * @data:	Pointer to user data
+ * @count:	read the size bytes from buffer
+ *
+ * User-space interface for reading CRAM frame ECC
+ * Return: count argument if request succeeds, else error code
+ */
+static ssize_t xsem_cram_framecc_read_store(struct edac_device_ctl_info *dci,
+					    const char *data, size_t count)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	char *kern_buff, *inbuf;
+	u32 frameaddr, row, slrid;
+	int ret;
+
+	kern_buff = xsem_store_prep(data, count);
+	if (!kern_buff)
+		return -ENOMEM;
+
+	inbuf = kern_buff;
+
+	/* Read Frame address */
+	ret = xsem_parse_token(&inbuf, &frameaddr);
+	if (ret)
+		goto err;
+
+	/* Read Row number */
+	ret = xsem_parse_token(&inbuf, &row);
+	if (ret)
+		goto err;
+
+	/* Read slr id */
+	ret = xsem_parse_token(&inbuf, &slrid);
+	if (ret)
+		goto err;
+
+	if (slrid > MAX_SLR_ID || row > MAX_CFRAME_ROW_ID) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	mutex_lock(&priv->lock);
+	ret = zynqmp_pm_xilsem_cram_read_ecc(slrid, frameaddr, row, &priv->cram_frame_ecc);
+	mutex_unlock(&priv->lock);
+err:
+	kfree(kern_buff);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/**
+ * xsem_cram_ssit_getcrc_show - Shows CRAM Row CRC
+ * @dci:	Pointer to the edac device struct
+ * @data:	Pointer to user data
+ *
+ * Shows CRAM Row CRC value
+ * Return: Number of bytes copied.
+ */
+static ssize_t xsem_cram_ssit_getcrc_show(struct edac_device_ctl_info *dci, char *data)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	int offset = 0;
+
+	mutex_lock(&priv->lock);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset, "Read CRC Cmd:[0x%x]\n",
+			    priv->cram_get_crc_status.hdr);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset, "CRC_Word %u:[0x%x]\n", 0U,
+			    priv->cram_get_crc_status.crc0);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset, "CRC_Word %u:[0x%x]\n", 1U,
+			    priv->cram_get_crc_status.crc1);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset, "CRC_Word %u:[0x%x]\n", 2U,
+			    priv->cram_get_crc_status.crc2);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset, "CRC_Word %u:[0x%x]\n", 3U,
+			    priv->cram_get_crc_status.crc3);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset, "Cmd status: [0x%x]\n",
+			    priv->cram_get_crc_status.status);
+	mutex_unlock(&priv->lock);
+
+	return offset;
+}
+
+/**
+ * xsem_cram_ssit_getcrc_store - Read CRAM row CRC
+ * @dci:	Pointer to the edac device struct
+ * @data:	Pointer to user data
+ * @count:	read the size bytes from buffer
+ *
+ * User-space interface for reading CRAM row CRC
+ * Return: count argument if request succeeds, else error code
+ */
+static ssize_t xsem_cram_ssit_getcrc_store(struct edac_device_ctl_info *dci, const char *data,
+					   size_t count)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	char *kern_buff, *inbuf;
+	u32 rowindex, slrid;
+	int ret;
+
+	kern_buff = xsem_store_prep(data, count);
+	if (!kern_buff)
+		return -ENOMEM;
+
+	inbuf = kern_buff;
+
+	/* Read Row number */
+	ret = xsem_parse_token(&inbuf, &rowindex);
+	if (ret)
+		goto err;
+
+	/* Read SLR Id */
+	ret = xsem_parse_token(&inbuf, &slrid);
+	if (ret)
+		goto err;
+
+	if (slrid > MAX_SLR_ID || rowindex > MAX_CFRAME_ROW_ID) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	mutex_lock(&priv->lock);
+	ret = zynqmp_pm_xilsem_cram_get_crc(slrid, rowindex, &priv->cram_get_crc_status);
+	mutex_unlock(&priv->lock);
+err:
+	kfree(kern_buff);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/**
+ * xsem_total_cframes_ssit_show - Shows total cframes
+ * @dci:	Pointer to the edac device struct
+ * @data:	Pointer to user data
+ *
+ * Shows CRAM total cframes
+ * Return: Number of bytes copied.
+ */
+static ssize_t xsem_total_cframes_ssit_show(struct edac_device_ctl_info *dci, char *data)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	const u32 *raw;
+	u32 decoded[CFRAME_MAX_TYPE];
+	u32 id;
+	int offset = 0;
+
+	mutex_lock(&priv->lock);
+
+	/*
+	 * Decode into a local array - cram_total_frames[] holds the raw
+	 * firmware response and must stay untouched, otherwise a second
+	 * read of this file would try to re-decode already-decoded values
+	 * and produce garbage.
+	 */
+	raw = priv->cram_total_frames;
+
+	/*
+	 * raw[3] and raw[6] are intentionally not read below - per the
+	 * CFRAME_REG register interface (LAST_FRAME_BOT/LAST_FRAME_TOP),
+	 * these words are entirely reserved.
+	 */
+	decoded[0]  = (raw[0] & CFRAME_TYPE_0_4_MASK);
+	decoded[1]  = (raw[0] & CFRAME_TYPE_1_5_MASK_L) >> CFRAME_TYPE_1_5_SHIFT_R;
+	decoded[1] |= (raw[1] & CFRAME_TYPE_1_5_MASK_H) << CFRAME_TYPE_1_5_SHIFT_L;
+	decoded[2]  = (raw[1] & CFRAME_TYPE_2_6_MASK) >> CFRAME_TYPE_2_6_SHIFT_R;
+	decoded[3]  = (raw[1] & CFRAME_TYPE_3_MASK_L) >> CFRAME_TYPE_3_SHIFT_R;
+	decoded[3] |= (raw[2] & CFRAME_TYPE_3_MASK_H) << CFRAME_TYPE_3_SHIFT_L;
+	decoded[4]  = (raw[4] & CFRAME_TYPE_0_4_MASK);
+	decoded[5]  = (raw[4] & CFRAME_TYPE_1_5_MASK_L) >> CFRAME_TYPE_1_5_SHIFT_R;
+	decoded[5] |= (raw[5] & CFRAME_TYPE_1_5_MASK_H) << CFRAME_TYPE_1_5_SHIFT_L;
+	decoded[6]  = (raw[5] & CFRAME_TYPE_2_6_MASK) >> CFRAME_TYPE_2_6_SHIFT_R;
+
+	offset += scnprintf(data + offset, PAGE_SIZE - offset, "Read Total Frames Cmd : [0x%x]\n",
+					  priv->cram_get_frames_status.hdr);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset, "SLR ID : [0x%x]\n",
+					  priv->cram_get_frames_status.slrid);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset, "Row Index: [0x%x]\n",
+					  priv->cram_get_frames_status.row);
+	for (id = 0; id < CFRAME_MAX_TYPE; id++)
+		offset += scnprintf(data + offset, PAGE_SIZE - offset,
+				    "Type[%u] frame count: [%u]\n", id, decoded[id]);
+
+	offset += scnprintf(data + offset, PAGE_SIZE - offset, "Cmd Status: [0x%x]\n",
+					  priv->cram_get_frames_status.status);
+	mutex_unlock(&priv->lock);
+
+	return offset;
+}
+
+/**
+ * xsem_total_cframes_ssit_store - Read total cframes in CRAM
+ * @dci:	Pointer to the edac device struct
+ * @data:	Pointer to user data
+ * @count:	read the size bytes from buffer
+ *
+ * User-space interface for reading CRAM total frames in ssit device
+ * Return: count argument if request succeeds, else error code
+ */
+static ssize_t xsem_total_cframes_ssit_store(struct edac_device_ctl_info *dci, const char *data,
+					     size_t count)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	char *kern_buff, *inbuf;
+	void *kbuf1;
+	dma_addr_t dma_addr = 0;
+	u32 row, slrid;
+	size_t dma_size;
+	int ret;
+
+	kern_buff = xsem_store_prep(data, count);
+	if (!kern_buff)
+		return -ENOMEM;
+
+	inbuf = kern_buff;
+
+	/* Read Row number */
+	ret = xsem_parse_token(&inbuf, &row);
+	if (ret)
+		goto err;
+
+	/* Read slr id */
+	ret = xsem_parse_token(&inbuf, &slrid);
+	if (ret)
+		goto err;
+
+	if (slrid > MAX_SLR_ID || row > MAX_CFRAME_ROW_ID) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	dma_size = sizeof(priv->cram_total_frames);
+	kbuf1 = dma_alloc_coherent(dci->dev, dma_size, &dma_addr, GFP_KERNEL);
+	if (!kbuf1) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	mutex_lock(&priv->lock);
+
+	ret = zynqmp_pm_xilsem_cram_ssit_tot_frames(slrid, row, dma_addr,
+						    &priv->cram_get_frames_status);
+	if (ret) {
+		edac_printk(KERN_ERR, EDAC_DEVICE, "ERROR: XilSEM Status PM API failed\n");
+		mutex_unlock(&priv->lock);
+		dma_free_coherent(dci->dev, dma_size, kbuf1, dma_addr);
+		goto err;
+	}
+
+	memcpy(priv->cram_total_frames, kbuf1, dma_size);
+	mutex_unlock(&priv->lock);
+	dma_free_coherent(dci->dev, dma_size, kbuf1, dma_addr);
+
+err:
+	kfree(kern_buff);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/**
+ * xsem_read_status_show - Shows CRAM & NPI scan status
+ * @dci:	Pointer to the edac device struct
+ * @data:	Pointer to user data
+ *
+ * Shows CRAM & NPI scan status
+ * Return: Number of bytes copied.
+ */
+static ssize_t xsem_read_status_show(struct edac_device_ctl_info *dci, char *data)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	int ret;
+
+	mutex_lock(&priv->lock);
+	ret = scnprintf(data, PAGE_SIZE, "[0x%x][0x%x][0x%x]\n",
+			priv->xilsem_status[0], priv->xilsem_status[1],
+			priv->xilsem_status[2]);
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+/**
+ * xsem_read_status_store - Read CRAM & NPI scan status
+ * @dci:	Pointer to the edac device struct
+ * @data:	Pointer to user data
+ * @count:	read the size bytes from buffer
+ *
+ * User-space interface for reading Xilsem status
+ * Return: count argument if read succeeds, else error code
+ */
+static ssize_t xsem_read_status_store(struct edac_device_ctl_info *dci,
+				      const char *data, size_t count)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	unsigned long flags;
+	u32 module;
+
+	if (!data)
+		return -EFAULT;
+
+	if (kstrtouint(data, 0, &module))
+		return -EINVAL;
+
+	if (module != CRAM_MOD_ID && module != NPI_MOD_ID) {
+		edac_printk(KERN_ERR, EDAC_DEVICE, "Invalid module %d\n", module);
+		return -EINVAL;
+	}
+
+	mutex_lock(&priv->lock);
+	/*
+	 * CRAM_STS_INFO_OFFSET/CRAM_CE_COUNT_OFFSET (CRAM_MOD_ID) and
+	 * priv->baseaddr's base register (NPI_MOD_ID) are also read from
+	 * hardirq context by xsem_geterror_info() via xsem_err_callback().
+	 * priv->lock is a mutex and provides no protection against that IRQ
+	 * preempting this critical section on the same CPU, so take the
+	 * same irq-safe cnt_lock xsem_err_callback() holds around its MMIO
+	 * reads to keep this snapshot consistent.
+	 */
+	raw_spin_lock_irqsave(&priv->cnt_lock, flags);
+	if (module == CRAM_MOD_ID) {
+		priv->xilsem_status[0] = readl(priv->baseaddr + CRAM_STS_INFO_OFFSET);
+		priv->xilsem_status[1] = readl(priv->baseaddr + CRAM_CE_COUNT_OFFSET);
+		priv->xilsem_status[2] = 0;
+	} else {
+		priv->xilsem_status[0] = readl(priv->baseaddr);
+		priv->xilsem_status[1] = readl(priv->baseaddr + NPI_SCAN_COUNT);
+		priv->xilsem_status[2] = readl(priv->baseaddr + NPI_SCAN_HB_COUNT);
+	}
+	raw_spin_unlock_irqrestore(&priv->cnt_lock, flags);
+	mutex_unlock(&priv->lock);
+
+	return count;
+}
+
+/**
+ * xsem_read_ssit_status_show - Shows CRAM & NPI scan for SSIT device
+ * @dci:	Pointer to the edac device struct
+ * @data:	Pointer to user data
+ *
+ * Shows CRAM & NPI scan status for given SLR
+ * Return: Number of bytes copied.
+ */
+static ssize_t xsem_read_ssit_status_show(struct edac_device_ctl_info *dci, char *data)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	int offset = 0;
+	int id;
+
+	if (!priv->slr_info)
+		return -EINVAL;
+
+	mutex_lock(&priv->lock);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset, "Read SLR Status Cmd:[0x%x]\n",
+			  priv->xilsem_ssit_status.hdr);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset, "SLR ID:[0x%x]\n",
+			    priv->xilsem_ssit_status.slrid);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset, "NPI status:[0x%x]\n",
+			    priv->slr_info->npi_status);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset, "NPI scan count:[0x%x]\n",
+			    priv->slr_info->scancnt);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset, "NPI Heartbeat count:[0x%x]\n",
+			    priv->slr_info->hbcnt);
+	for (id = 0; id < MAX_NPI_SLV_SKIP_CNT; id++)
+		offset += scnprintf(data + offset, PAGE_SIZE - offset,
+				    "NPI scan skip count %x :[0x%x]\n", id,
+				    priv->slr_info->slvskpcnt[id]);
+
+	for (id = 0; id < MAX_NPI_ERR_INFO_CNT; id++)
+		offset += scnprintf(data + offset, PAGE_SIZE - offset,
+				    "NPI error info %x :[0x%x]\n", id,
+				    priv->slr_info->err_info[id]);
+
+	offset += scnprintf(data + offset, PAGE_SIZE - offset, "CRAM status:[0x%x]\n",
+			    priv->slr_info->cram_status);
+
+	for (id = 0U; id < 7; id++) {
+		offset += scnprintf(data + offset, PAGE_SIZE - offset,
+				    "Error Location High %x: [0x%x]\n", id,
+				    priv->slr_info->err_addr[(id * 2) + 1]);
+		offset += scnprintf(data + offset, PAGE_SIZE - offset,
+				    "Error Location Low %x: [0x%x]\n", id,
+				    priv->slr_info->err_addr[id * 2]);
+	}
+	offset += scnprintf(data + offset, PAGE_SIZE - offset, "CRAM scan CE count:[0x%x]\n",
+			    priv->slr_info->errcnt);
+	mutex_unlock(&priv->lock);
+
+	return offset;
+}
+
+/**
+ * xsem_read_ssit_status_store - Read CRAM & NPI scan SSIT status
+ * @dci:	Pointer to the edac device struct
+ * @data:	Pointer to user data
+ * @count:	read the size bytes from buffer
+ *
+ * User-space interface for reading Xilsem status for SSIT device
+ * Return: count argument if read succeeds, else error code
+ */
+static ssize_t xsem_read_ssit_status_store(struct edac_device_ctl_info *dci, const char *data,
+					   size_t count)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	char *kern_buff, *inbuf;
+	void *kbuf1;
+	size_t dma_size;
+	dma_addr_t dma_addr = 0;
+	u32 slrid;
+	int ret;
+
+	if (!priv->slr_info)
+		return -EINVAL;
+
+	kern_buff = xsem_store_prep(data, count);
+	if (!kern_buff)
+		return -ENOMEM;
+
+	inbuf = kern_buff;
+
+	/* Read SLR ID */
+	ret = xsem_parse_token(&inbuf, &slrid);
+	if (ret)
+		goto err;
+
+	if (slrid > MAX_SLR_ID) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	dma_size  = sizeof(struct xsem_ssit_status);
+
+	kbuf1 = dma_alloc_coherent(dci->dev, dma_size, &dma_addr, GFP_KERNEL);
+	if (!kbuf1) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	mutex_lock(&priv->lock);
+
+	ret = zynqmp_pm_xilsem_read_ssit_status(slrid, dma_addr, &priv->xilsem_ssit_status);
+	if (ret) {
+		edac_printk(KERN_ERR, EDAC_DEVICE, "ERROR: XilSEM Status PM API failed\n");
+		mutex_unlock(&priv->lock);
+		dma_free_coherent(dci->dev, dma_size, kbuf1, dma_addr);
+		goto err;
+	}
+
+	memcpy(priv->slr_info, kbuf1, dma_size);
+	mutex_unlock(&priv->lock);
+
+	dma_free_coherent(dci->dev, dma_size, kbuf1, dma_addr);
+err:
+	kfree(kern_buff);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/**
+ * xsem_read_config_show - Shows CRAM & NPI configuration
+ * @dci:	Pointer to the edac device struct
+ * @data:	Pointer to user data
+ *
+ * Shows CRAM & NPI configuration
+ * Return: Number of bytes copied.
+ */
+static ssize_t xsem_read_config_show(struct edac_device_ctl_info *dci, char *data)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	int offset = 0;
+
+	mutex_lock(&priv->lock);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset, "Read Config Cmd: [0x%x]\n",
+			    priv->xilsem_cfg.hdr);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset, "CRAM Scan Config: [0x%x]\n",
+			    priv->xilsem_cfg.cram_cfg);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset, "NPI Scan Config: [0x%x]\n",
+			    priv->xilsem_cfg.npi_cfg);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset, "Cmd Status: [0x%x]\n",
+			    priv->xilsem_cfg.status);
+	mutex_unlock(&priv->lock);
+
+	return offset;
+}
+
+/**
+ * xsem_read_config_store - Read CRAM & NPI configuration
+ * @dci:	Pointer to the edac device struct
+ * @data:	Pointer to user data
+ * @count:	read the size bytes from buffer
+ *
+ * User-space interface for reading Xilsem configuration
+ * Return: count argument if request succeeds, else error code
+ */
+static ssize_t xsem_read_config_store(struct edac_device_ctl_info *dci,
+				      const char *data, size_t count)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	char *kern_buff, *inbuf;
+	u32 slrid;
+	int ret;
+
+	kern_buff = xsem_store_prep(data, count);
+	if (!kern_buff)
+		return -ENOMEM;
+
+	inbuf = kern_buff;
+
+	/* Read SLR id */
+	ret = xsem_parse_token(&inbuf, &slrid);
+	if (ret)
+		goto err;
+
+	if (slrid > MAX_SLR_ID) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	mutex_lock(&priv->lock);
+	ret = zynqmp_pm_xilsem_read_cfg(slrid, &priv->xilsem_cfg);
+	mutex_unlock(&priv->lock);
+
+err:
+	kfree(kern_buff);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/**
+ * xsem_handle_error - Handle XilSem error types CE and UE
+ * @dci:	Pointer to the edac device controller instance
+ * @p:		Pointer to the xilsem error status structure
+ *
+ * Handles the correctable and uncorrectable error.
+ */
+static void xsem_handle_error(struct edac_device_ctl_info *dci, struct xsem_error_status *p)
+{
+	struct xsem_ecc_error_info *pinf;
+	char message[VERSAL_XILSEM_EDAC_MSG_SIZE];
+
+	if (p->ce_cnt) {
+		pinf = &p->ceinfo;
+		snprintf(message, VERSAL_XILSEM_EDAC_MSG_SIZE,
+			 "\nXILSEM CRAM error type :%s\n"
+			 "\nFrame_Addr: [0x%X]\t Row_num: [0x%X]\t Bit_loc: [0x%X]\t Qword: [0x%X]\n",
+			 "CE", pinf->frame_addr, pinf->row_id,
+			 pinf->bit_loc, pinf->qword);
+		edac_device_handle_ce(dci, 0, 0, message);
+	}
+
+	/*
+	 * CRAM and NPI UEs are tracked in separate info structs (not one
+	 * shared field) and reported independently, so a callback that sees
+	 * both at once still reports both instead of one silently
+	 * overwriting the other.
+	 */
+	if (p->cram_ue) {
+		pinf = &p->cram_ueinfo;
+		snprintf(message, VERSAL_XILSEM_EDAC_MSG_SIZE,
+			 "\nXILSEM error type :%s\n"
+			 "status: [0x%X]\nError_Info0: [0x%X]\n"
+			 "Error_Info1: [0x%X]",
+			 "UE (CRAM)", pinf->status, pinf->data0, pinf->data1);
+		edac_device_handle_ue(dci, 0, 0, message);
+	}
+
+	if (p->npi_ue) {
+		pinf = &p->npi_ueinfo;
+		snprintf(message, VERSAL_XILSEM_EDAC_MSG_SIZE,
+			 "\nXILSEM error type :%s\n"
+			 "status: [0x%X]\nError_Info0: [0x%X]\n"
+			 "Error_Info1: [0x%X]",
+			 "UE (NPI)", pinf->status, pinf->data0, pinf->data1);
+		edac_device_handle_ue(dci, 0, 0, message);
+	}
+}
+
+/**
+ * xsem_geterror_info - Get the current ecc error info
+ * @dci:	Pointer to the edac device controller instance
+ * @p:		Pointer to the Xilsem error status structure
+ * @mask:	mask indicates the error type
+ *
+ * Determines there is any ecc error or not
+ */
+static void xsem_geterror_info(struct edac_device_ctl_info *dci, struct xsem_error_status *p,
+			       u32 mask)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	u32 error_word_0, error_word_1, ce_count;
+	u8 index;
+
+	if (mask & priv->cram_ce_mask) {
+		p->ce_cnt++;
+
+		/* Read CRAM total correctable error count */
+		ce_count = readl(priv->baseaddr + CRAM_CE_COUNT_OFFSET);
+		/* Calculate index for error log */
+		index = (ce_count % XILSEM_MAX_CE_LOG_CNT);
+		/*
+		 * Check if addr index is not 0
+		 * if yes, then decrement index, else set index as last entry
+		 */
+		if (index != 0U) {
+			/* Decrement Index */
+			--index;
+		} else {
+			/* Set log index to 6 (Max-1) */
+			index = (XILSEM_MAX_CE_LOG_CNT - 1);
+		}
+		error_word_0 = readl(priv->baseaddr + CRAM_CE_ADDRL0_OFFSET + (index * 8U));
+		error_word_1 = readl(priv->baseaddr + CRAM_CE_ADDRH0_OFFSET + (index * 8U));
+
+		/* Frame is at 22:0 bits of SEM_CRAMERR_ADDRH0 reg */
+		p->ceinfo.frame_addr = FIELD_GET(CRAM_ERR_FRAME_MASK, error_word_1);
+
+		/* row is at 26:23 bits of SEM_CRAMERR_ADDRH0 reg */
+		p->ceinfo.row_id = FIELD_GET(CRAM_ERR_ROW_MASK, error_word_1);
+
+		/* bit is at 22:16 bits of SEM_CRAMERR_ADDRL0 reg */
+		p->ceinfo.bit_loc = FIELD_GET(CRAM_ERR_BIT_MASK, error_word_0);
+
+		/* Qword is at 27:23 bits of SEM_CRAMERR_ADDRL0 reg */
+		p->ceinfo.qword = FIELD_GET(CRAM_ERR_QWRD_MASK, error_word_0);
+
+		/* Read CRAM status */
+		p->ceinfo.status = readl(priv->baseaddr + CRAM_STS_INFO_OFFSET);
+	}
+
+	/*
+	 * CE and UE bits are OR'd together into a single registered event
+	 * mask, so a single callback invocation can have both a CE bit and a
+	 * UE bit set at once - including both the CRAM UE and NPI UE bits
+	 * together. These are separate conditions, so a simultaneous CRAM UE
+	 * + NPI UE event still counts and reads both; each source writes its
+	 * own cram_ueinfo/npi_ueinfo rather than a shared field, so
+	 * xsem_handle_error() can report both separately.
+	 */
+	if (mask & priv->cram_ue_mask) {
+		p->ue_cnt++;
+		p->cram_ue = true;
+		p->cram_ueinfo.data0 = 0;
+		p->cram_ueinfo.data1 = 0;
+		p->cram_ueinfo.status = readl(priv->baseaddr + CRAM_STS_INFO_OFFSET);
+	}
+	if (mask & priv->npi_ue_mask) {
+		p->ue_cnt++;
+		p->npi_ue = true;
+		p->npi_ueinfo.data0 = readl(priv->baseaddr + NPI_ERR0_INFO_OFFSET);
+		p->npi_ueinfo.data1 = readl(priv->baseaddr + NPI_ERR1_INFO_OFFSET);
+		p->npi_ueinfo.status = readl(priv->baseaddr);
+	}
+
+	if (!(mask & (priv->cram_ce_mask | priv->cram_ue_mask | priv->npi_ue_mask)))
+		edac_printk(KERN_ERR, EDAC_DEVICE, "Invalid Event received %x\n", mask);
+}
+
+/**
+ * xsem_err_callback - Handle Correctable and Uncorrectable errors.
+ * @payload:	payload data.
+ * @data:	controller data.
+ *
+ * Handles ECC correctable and uncorrectable errors.
+ */
+static void xsem_err_callback(const u32 *payload, void *data)
+{
+	struct edac_device_ctl_info *dci = (struct edac_device_ctl_info *)data;
+	struct xsem_error_status stat;
+	struct xsem_edac_priv *priv;
+	unsigned long flags;
+	u32 event;
+
+	priv = dci->pvt_info;
+	memset(&stat, 0, sizeof(stat));
+	/* Read payload to get the event type */
+	event = payload[2];
+	edac_printk(KERN_INFO, EDAC_DEVICE, "Event received %x\n", event);
+
+	/*
+	 * Concurrent events (e.g. from different SLRs) can invoke this
+	 * callback on more than one CPU at once, and xsem_geterror_info()
+	 * reads MMIO registers (CRAM_CE_COUNT_OFFSET, CRAM_STS_INFO_OFFSET,
+	 * NPI_ERR0/1_INFO_OFFSET) that xsem_read_status_store() also reads
+	 * in process context under priv->lock alone - a mutex provides no
+	 * protection against this hardirq-context path preempting it on the
+	 * same CPU. Hold cnt_lock across the read, the += RMW below, and
+	 * xsem_handle_error() - the latter calls edac_device_handle_ce/ue(),
+	 * which bump plain (non-atomic) u32 counters in EDAC core state
+	 * shared across every instance of this callback; serializing here is
+	 * the only way to keep those updates from racing when this callback
+	 * runs concurrently on more than one CPU.
+	 */
+	raw_spin_lock_irqsave(&priv->cnt_lock, flags);
+	xsem_geterror_info(dci, &stat, event);
+	priv->ce_cnt += stat.ce_cnt;
+	priv->ue_cnt += stat.ue_cnt;
+	xsem_handle_error(dci, &stat);
+	raw_spin_unlock_irqrestore(&priv->cnt_lock, flags);
+}
+
+static const struct edac_dev_sysfs_attribute xsem_edac_sysfs_attributes[] = {
+	{
+		.attr = {
+			.name = "xsem_scan_control_ops",
+			.mode = (0644)
+		},
+		.show = xsem_scan_control_show,
+		.store = xsem_scan_control_store},
+	{
+		.attr = {
+			.name = "xsem_cram_injecterr",
+			.mode = (0644)
+		},
+		.show = xsem_cram_injecterr_show,
+		.store = xsem_cram_injecterr_store},
+	{
+		.attr = {
+			.name = "xsem_cram_framecc_read",
+			.mode = (0644)
+		},
+		.show = xsem_cram_framecc_read_show,
+		.store = xsem_cram_framecc_read_store},
+	{
+		.attr = {
+			.name = "xsem_cram_ssit_getcrc",
+			.mode = (0644)
+		},
+		.show = xsem_cram_ssit_getcrc_show,
+		.store = xsem_cram_ssit_getcrc_store},
+	{
+		.attr = {
+			.name = "xsem_read_status",
+			.mode = (0644)
+		},
+		.show = xsem_read_status_show,
+		.store = xsem_read_status_store},
+	{
+		.attr = {
+			.name = "xsem_read_ssit_status",
+			.mode = (0644)
+		},
+		.show = xsem_read_ssit_status_show,
+		.store = xsem_read_ssit_status_store},
+	{
+		.attr = {
+			.name = "xsem_total_cframes_ssit",
+			.mode = (0644)
+		},
+		.show = xsem_total_cframes_ssit_show,
+		.store = xsem_total_cframes_ssit_store},
+	{
+		.attr = {
+			.name = "xsem_read_config",
+			.mode = (0644)
+		},
+		.show = xsem_read_config_show,
+		.store = xsem_read_config_store},
+	{
+		.attr = {.name = NULL}
+	}
+};
+
+/**
+ * xsem_edac_probe - Check controller and bind driver.
+ * @pdev:	platform device.
+ *
+ * Probe a specific controller instance for binding with the driver.
+ *
+ * Return: 0 if the controller instance was successfully bound to the
+ * driver; otherwise, < 0 on error.
+ */
+static int xsem_edac_probe(struct platform_device *pdev)
+{
+	struct xsem_edac_priv *priv;
+	void __iomem *plmrtca_baseaddr;
+	struct edac_device_ctl_info *dci;
+	u32 family_code;
+	int rc;
+
+	plmrtca_baseaddr = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(plmrtca_baseaddr))
+		return PTR_ERR(plmrtca_baseaddr);
+
+	dci = edac_device_alloc_ctl_info(sizeof(*priv), VERSAL_XILSEM_EDAC_STRNG,
+					 1, VERSAL_XILSEM_EDAC_STRNG, 1, 0,
+					 edac_device_alloc_index());
+	if (!dci) {
+		edac_printk(KERN_ERR, EDAC_DEVICE, "Unable to allocate EDAC device\n");
+		return -ENOMEM;
+	}
+
+	priv = dci->pvt_info;
+	platform_set_drvdata(pdev, dci);
+	dci->dev = &pdev->dev;
+	priv->baseaddr = plmrtca_baseaddr;
+	dci->mod_name = "xlnx_xilsem_edac";
+	dci->ctl_name = VERSAL_XILSEM_EDAC_STRNG;
+	dci->dev_name = dev_name(&pdev->dev);
+
+	mutex_init(&priv->lock);
+	raw_spin_lock_init(&priv->cnt_lock);
+
+	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (rc < 0) {
+		edac_printk(KERN_ERR, EDAC_DEVICE, "no usable DMA configuration\n");
+		goto free_dev_ctl;
+	}
+
+	priv->slr_info = devm_kzalloc(&pdev->dev, sizeof(struct xsem_ssit_status), GFP_KERNEL);
+	if (!priv->slr_info) {
+		rc = -ENOMEM;
+		goto free_dev_ctl;
+	}
+
+	rc = zynqmp_pm_get_family_info(&family_code);
+	if (rc) {
+		/*
+		 * -ENODEV means the firmware driver hasn't registered yet on
+		 * a real ARCH_ZYNQMP build - defer and retry. On a
+		 * COMPILE_TEST build without CONFIG_ZYNQMP_FIRMWARE reachable
+		 * the stub always returns -ENODEV, so deferring would retry
+		 * forever for no reason; let it fail outright there instead.
+		 */
+		if (rc == -ENODEV && IS_REACHABLE(CONFIG_ZYNQMP_FIRMWARE))
+			rc = -EPROBE_DEFER;
+		goto free_dev_ctl;
+	}
+
+	if (family_code == PM_VERSAL_NET_FAMILY_CODE) {
+		priv->sw_event_node_id = VERSAL_NET_EVENT_ERROR_SW_ERR;
+		priv->cram_ce_mask = XPM_VERSAL_NET_EVENT_ERROR_MASK_XSEM_CRAM_CE;
+		priv->cram_ue_mask = XPM_VERSAL_NET_EVENT_ERROR_MASK_XSEM_CRAM_UE;
+		priv->npi_ue_mask = XPM_VERSAL_NET_EVENT_ERROR_MASK_XSEM_NPI_UE;
+	} else if (family_code == PM_VERSAL_FAMILY_CODE) {
+		priv->sw_event_node_id = VERSAL_EVENT_ERROR_SW_ERR;
+		priv->cram_ce_mask = XPM_VERSAL_EVENT_ERROR_MASK_XSEM_CRAM_CE_5;
+		priv->cram_ue_mask = XPM_VERSAL_EVENT_ERROR_MASK_XSEM_CRAM_UE_6;
+		priv->npi_ue_mask = XPM_VERSAL_EVENT_ERROR_MASK_XSEM_NPI_UE_7;
+	} else {
+		/*
+		 * Bail out here instead of continuing to register an event
+		 * with a node id/mask of 0 (whatever devm_kzalloc() happened
+		 * to leave in priv) for a family we don't recognize - unwind
+		 * instead.
+		 */
+		edac_printk(KERN_ERR, EDAC_DEVICE, "Invalid Device family code %d\n",
+			    family_code);
+		rc = -ENODEV;
+		goto free_dev_ctl;
+	}
+	rc = xlnx_register_event(PM_NOTIFY_CB, priv->sw_event_node_id,
+				 priv->cram_ce_mask | priv->cram_ue_mask | priv->npi_ue_mask,
+				 false, xsem_err_callback, dci);
+	if (rc) {
+		if (rc == -EACCES)
+			rc = -EPROBE_DEFER;
+		goto free_dev_ctl;
+	}
+
+	/*
+	 * Only publish the sysfs attributes once priv->slr_info is allocated,
+	 * priv->{sw_event_node_id,cram_ce_mask,cram_ue_mask,npi_ue_mask} are
+	 * resolved, and the error-event callback is registered - otherwise a
+	 * write to xsem_scan_control_ops (or any other attribute) from
+	 * userspace during probe could start hardware scanning, or observe
+	 * priv->slr_info as NULL, before this state exists.
+	 */
+	dci->sysfs_attributes = xsem_edac_sysfs_attributes;
+	rc = edac_device_add_device(dci);
+	if (rc) {
+		/* edac_device_add_device() returns a bare 1 on failure, not a negative errno */
+		rc = -ENODEV;
+		goto free_event;
+	}
+
+	edac_printk(KERN_DEBUG, EDAC_DEVICE, "%s success\n", __func__);
+	return rc;
+
+free_event:
+	xlnx_unregister_event(PM_NOTIFY_CB, priv->sw_event_node_id,
+			      priv->cram_ce_mask | priv->cram_ue_mask | priv->npi_ue_mask,
+			      xsem_err_callback, dci);
+free_dev_ctl:
+	edac_device_free_ctl_info(dci);
+
+	return rc;
+}
+
+/**
+ * xsem_edac_remove - Unbind driver from controller.
+ * @pdev:	Platform device.
+ *
+ * Return: Unconditionally 0
+ */
+static void xsem_edac_remove(struct platform_device *pdev)
+{
+	struct edac_device_ctl_info *dci = platform_get_drvdata(pdev);
+	struct xsem_edac_priv *priv = dci->pvt_info;
+
+	xlnx_unregister_event(PM_NOTIFY_CB, priv->sw_event_node_id,
+			      priv->cram_ce_mask | priv->cram_ue_mask | priv->npi_ue_mask,
+			      xsem_err_callback, dci);
+	edac_device_del_device(&pdev->dev);
+	edac_device_free_ctl_info(dci);
+}
+
+/**
+ * struct xlnx_edac_config - Per-compatible-string dispatch entry.
+ * @probe:	Probe function for this compatible string's device class.
+ * @remove:	Remove function for this compatible string's device class.
+ */
+struct xlnx_edac_config {
+	int (*probe)(struct platform_device *pdev);
+	void (*remove)(struct platform_device *pdev);
+};
+
+static const struct xlnx_edac_config ddrmc_edac_config = {
+	.probe = ddrmc_probe,
+	.remove = ddrmc_remove,
+};
+
+static const struct xlnx_edac_config xsem_edac_config = {
+	.probe = xsem_edac_probe,
+	.remove = xsem_edac_remove,
+};
+
+static const struct of_device_id xlnx_edac_match[] = {
+	{
+		.compatible = "xlnx,versal-ddrmc",
+		.data = &ddrmc_edac_config,
+	},
+	{
+		.compatible = "xlnx,versal-xilsem",
+		.data = &xsem_edac_config,
+	},
+	{
+		/* end of table */
+	}
+};
+
+MODULE_DEVICE_TABLE(of, xlnx_edac_match);
+
+static int mc_probe(struct platform_device *pdev)
+{
+	const struct of_device_id *match;
+	const struct xlnx_edac_config *config;
+
+	match = of_match_node(xlnx_edac_match, pdev->dev.of_node);
+	if (!match)
+		return -ENODEV;
+
+	config = match->data;
+
+	return config->probe(pdev);
+}
+
+static void mc_remove(struct platform_device *pdev)
+{
+	const struct of_device_id *match;
+	const struct xlnx_edac_config *config;
+
+	match = of_match_node(xlnx_edac_match, pdev->dev.of_node);
+	if (!match)
+		return;
+
+	config = match->data;
+	config->remove(pdev);
+}
+
+static struct platform_driver xilinx_edac_driver = {
 	.driver = {
 		.name = "xilinx-ddrmc-edac",
 		.of_match_table = xlnx_edac_match,
@@ -1189,8 +2433,8 @@ static void mc_remove(struct platform_device *pdev)
 	.remove = mc_remove,
 };
 
-module_platform_driver(xilinx_ddr_edac_mc_driver);
+module_platform_driver(xilinx_edac_driver);
 
-MODULE_AUTHOR("AMD Inc");
-MODULE_DESCRIPTION("Xilinx DDRMC ECC driver");
+MODULE_AUTHOR("Advanced Micro Devices, Inc.");
+MODULE_DESCRIPTION("Xilinx Versal DDRMC and XilSEM EDAC driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/edac/xsem_edac.h b/drivers/edac/xsem_edac.h
new file mode 100644
index 0000000..2b36e67
--- /dev/null
+++ b/drivers/edac/xsem_edac.h
@@ -0,0 +1,219 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Xilinx Versal XilSEM (Soft Error Mitigation) EDAC definitions
+ * Copyright (C) 2022 - 2026, Advanced Micro Devices, Inc.
+ *
+ * Constants and data structures for the "xlnx,versal-xilsem" compatible
+ * string in versal_edac.c (xsem_edac_probe(), xsem_edac_remove(), and the
+ * xsem_* sysfs attributes).
+ *
+ */
+#ifndef _XSEM_EDAC_V2_H
+#define _XSEM_EDAC_V2_H
+
+#include <linux/bitfield.h>
+#include <linux/firmware/xlnx-zynqmp-sem.h>
+#include <linux/io.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#define VERSAL_XILSEM_EDAC_MSG_SIZE	256
+#define VERSAL_XILSEM_EDAC_STRNG	"versal_xilsem"
+
+/* XilSem CE Error log count */
+#define XILSEM_MAX_CE_LOG_CNT	7
+
+/** Maximum CRAM error register count */
+#define MAX_CRAMERR_REG_CNT		14
+/** Maximum NPI slave skip count */
+#define MAX_NPI_SLV_SKIP_CNT	8
+/** Maximum NPI Error info count */
+#define MAX_NPI_ERR_INFO_CNT	2
+
+/* Maximum SLR count */
+#define MAX_SLR_ID	3
+
+/* Maximum CFRAME row number */
+#define MAX_CFRAME_ROW_ID	4
+
+/** Maximum number of cframe types  */
+#define CFRAME_MAX_TYPE	7
+
+/** Mask for getting Type_0, Type_4 frames */
+#define CFRAME_TYPE_0_4_MASK	GENMASK(19, 0)
+
+/** Low mask, High mask for getting Type_1, Type_5 frames */
+#define CFRAME_TYPE_1_5_MASK_L	GENMASK(31, 20)
+#define CFRAME_TYPE_1_5_MASK_H	GENMASK(7, 0)
+
+/** Shift for getting Type_1, Type_5 frames */
+#define CFRAME_TYPE_1_5_SHIFT_R		20
+#define CFRAME_TYPE_1_5_SHIFT_L		12
+
+/** Mask for getting Type_2, Type_6 frames */
+#define CFRAME_TYPE_2_6_MASK	GENMASK(27, 8)
+
+/** Shift for getting Type_2, Type_6 frames */
+#define CFRAME_TYPE_2_6_SHIFT_R		0x8
+
+/** Low mask, high mask for getting Type_3 frames */
+#define CFRAME_TYPE_3_MASK_L		GENMASK(31, 28)
+#define CFRAME_TYPE_3_MASK_H		GENMASK(15, 0)
+
+/** Shift for getting Type_3 */
+#define CFRAME_TYPE_3_SHIFT_R	28
+#define CFRAME_TYPE_3_SHIFT_L	0x4
+
+/* XilSem_CRAM scan error info registers */
+#define CRAM_STS_INFO_OFFSET	0x34
+#define CRAM_CE_ADDRL0_OFFSET	0x38
+#define CRAM_CE_ADDRH0_OFFSET	0x3C
+#define CRAM_CE_COUNT_OFFSET	0x70
+
+/* XilSem_NPI_Scan uncorrectable error info registers */
+#define NPI_SCAN_COUNT			0x24
+#define NPI_SCAN_HB_COUNT		0x28
+#define NPI_ERR0_INFO_OFFSET	0x2C
+#define NPI_ERR1_INFO_OFFSET	0x30
+
+/* XilSem bit masks for extracting error details */
+#define CRAM_ERR_ROW_MASK	GENMASK(26, 23)
+#define CRAM_ERR_BIT_MASK	GENMASK(22, 16)
+#define CRAM_ERR_QWRD_MASK	GENMASK(27, 23)
+#define CRAM_ERR_FRAME_MASK	GENMASK(22, 0)
+
+enum xsem_cmd_id {
+	CRAM_INIT_SCAN = 1, /* To initialize CRAM scan */
+	CRAM_START_SCAN = 2, /* To start CRAM scan */
+	CRAM_STOP_SCAN = 3, /* To stop CRAM scan */
+	CRAM_ERR_INJECT = 4, /* To inject CRAM error */
+	NPI_START_SCAN = 5, /* To start NPI scan */
+	NPI_STOP_SCAN = 6, /* To stop NPI scan */
+	NPI_ERR_INJECT = 7, /* To inject NPI error */
+};
+
+/* XilSem Module IDs */
+#define CRAM_MOD_ID			0x1
+#define NPI_MOD_ID			0x2
+
+/**
+ * struct xsem_ecc_error_info - ECC error log information
+ * @status:	CRAM/NPI scan error status
+ * @data0:	Checksum of the error descriptor
+ * @data1:	Index of the error descriptor
+ * @frame_addr:	Frame location at which error occurred
+ * @block_type:	Block type
+ * @row_id:	Row number
+ * @bit_loc:	Bit position in the Qword
+ * @qword:	Qword location in the frame
+ */
+struct xsem_ecc_error_info {
+	u32 status;
+	u32 data0;
+	u32 data1;
+	u32 frame_addr;
+	u8 block_type;
+	u8 row_id;
+	u8 bit_loc;
+	u8 qword;
+};
+
+/**
+ * struct xsem_error_status - ECC status information to report
+ * @ce_cnt:	Correctable error count
+ * @ue_cnt:	Uncorrectable error count
+ * @cram_ue:	True if a CRAM UE was seen in this callback
+ * @npi_ue:	True if an NPI UE was seen in this callback
+ * @ceinfo:	Correctable error log information
+ * @cram_ueinfo: CRAM uncorrectable error log information
+ * @npi_ueinfo:	NPI uncorrectable error log information
+ */
+struct xsem_error_status {
+	u32 ce_cnt;
+	u32 ue_cnt;
+	bool cram_ue;
+	bool npi_ue;
+	struct xsem_ecc_error_info ceinfo;
+	struct xsem_ecc_error_info cram_ueinfo;
+	struct xsem_ecc_error_info npi_ueinfo;
+};
+
+/**
+ * struct xsem_ssit_status - SSIT status information
+ * @npi_status: NPI Status
+ * @slvskpcnt: NPI Slave skip count
+ * @scancnt: NPI Scan count
+ * @hbcnt: NPI Heartbeat count
+ * @err_info: NPI Error Information
+ * @cram_status: Cram Status
+ * @err_addr: Address of corrected error location
+ * @errcnt: Corrected Error count.
+ */
+struct xsem_ssit_status {
+	u32 npi_status;
+	u32 slvskpcnt[MAX_NPI_SLV_SKIP_CNT];
+	u32 scancnt;
+	u32 hbcnt;
+	u32 err_info[MAX_NPI_ERR_INFO_CNT];
+	u32 cram_status;
+	u32 err_addr[MAX_CRAMERR_REG_CNT];
+	u32 errcnt;
+};
+
+/**
+ * struct xsem_edac_priv - Xilsem private instance data
+ * @baseaddr:	Base address of the XilSem PLM RTCA module
+ * @cram_get_frames_status:	Buffer for get total frames command
+ * @cram_get_crc_status:	Buffer for CRC read command
+ * @xilsem_ssit_status:	Buffer for SLR status command
+ * @cram_errinj_status:	Buffer for CRAM error injection
+ * @cram_total_frames:	Buffer for total cframes data
+ * @scan_ctrl_status:	Buffer for scan ctrl commands
+ * @cram_frame_ecc:	Buffer for CRAM frame ECC
+ * @xilsem_status:	Buffer for CRAM & NPI status
+ * @xilsem_cfg:	Buffer for CRAM & NPI configuration
+ * @sw_event_node_id:	Error event node Id
+ * @cram_ce_mask: Event bit mask for CRAM correctable error
+ * @cram_ue_mask: Event bit mask for CRAM uncorrectable error
+ * @npi_ue_mask: Event bit mask for NPI uncorrectable error
+ * @ce_cnt:	Correctable Error count
+ * @ue_cnt:	Uncorrectable Error count
+ * @slr_info:	Pointer to get SSIT status information
+ * @lock:	Serializes sysfs show/store access to the buffers above,
+ *		which are shared between all xsem_* sysfs callbacks.
+ * @cnt_lock:	irq-safe lock protecting ce_cnt/ue_cnt and the CRAM/NPI status
+ *		MMIO registers, which are read from both xsem_err_callback()
+ *		(hardirq context, via xsem_geterror_info()) and process
+ *		context (xsem_read_status_store()); priv->lock is a mutex
+ *		and cannot provide that protection. Also held across
+ *		xsem_handle_error() in xsem_err_callback(), since that calls
+ *		edac_device_handle_ce()/ue(), which update plain u32 counters
+ *		in EDAC core state with no locking of their own - without
+ *		this, two concurrent invocations of this callback (e.g. from
+ *		different SLRs, on different CPUs) could race on those
+ *		counters.
+ */
+struct xsem_edac_priv {
+	void __iomem *baseaddr;
+	struct xsem_cram_ssit_totframes_response cram_get_frames_status;
+	struct xsem_cram_getcrc_response cram_get_crc_status;
+	struct xsem_read_ssit_status_response xilsem_ssit_status;
+	struct xsem_cram_errinj_response cram_errinj_status;
+	u32 cram_total_frames[7];
+	struct xsem_cntrl_ops_response scan_ctrl_status;
+	struct xsem_cram_readecc_response cram_frame_ecc;
+	u32 xilsem_status[4];
+	struct xsem_read_cfg_response xilsem_cfg;
+	u32 sw_event_node_id;
+	u32 cram_ce_mask;
+	u32 cram_ue_mask;
+	u32 npi_ue_mask;
+	u32 ce_cnt;
+	u32 ue_cnt;
+	struct xsem_ssit_status *slr_info;
+	struct mutex lock;	/* protects the status fields above, read from sysfs show() */
+	raw_spinlock_t cnt_lock;	/* protects ce_cnt/ue_cnt and CRAM/NPI status regs */
+};
+
+#endif /* _XSEM_EDAC_V2_H */
-- 
1.9.5

