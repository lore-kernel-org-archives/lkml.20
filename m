Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794375670;
	b=UmtWYP9u5KwDvoELWPp4yLcSvTY9KxcOBMI0OyEWGnzEtt17X33uMlr3wETAgQHBTYd2
	 +pzoM+0JDCJSIx1qRUP09eBKSpRtzlpqjHIjO7vThDWVg8T57ohFmgk1EGRo2I+LNliC4
	 qBchivwKVmg0TKPqku8SzVGW9JnOYf9hMij3FsC3GCVDg/dNK6Wp0I9tOGQQjhBqfBbIc
	 jhleSCSjJCy9aeaBZbwW6l4c+QHAT40DFYM9YL5e2qXyXMM+UHlnPe0CabY63TyEmc8+n
	 22qKCrNX7XEfQM4eAnNjHvGBQQ6qDhqgmZOKKi3UnAsma7YSAaAX1of4z/fs6DT0Ojw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794375670;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=A8Ae8zJ3NP40BHusQfTcfvmqyEP3O2x3WwKa4u7Wa0o=;
	b=GRNVTg+rNgfhTwffrYzHFNh/pHq/vudlKtIFvuw+ILLgpTKnrKCiQl9LeBWJ0BLxWJgS
	 eQolM6W78yJ2fQtU519FFSQ7aUeHYpCP+c+k6Hu6Le6mqNWpDpjzHfgBsiKCRl541CjIz
	 PDn/jeNPAcoKcnd7yq7taetUC3jXcmD3sGXq+TRtGJUjwZgdkNh53E/1Ptg5n3dCfQ23f
	 1wd2aQRuRaQEWuCMVZpgdoql0VdGEo6Gvux/SjBj25D1b0A5pLBVGjhHKZe5B1FEJuSTF
	 GNy0g9udZ8b4DTnNgXVcmAS8aTRaT12U+DYkYQoHGF6HUPEKM8JrgfSC5pOPHExWt1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=D4by6jRv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.13
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012013.outbound.protection.outlook.com [52.101.48.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58594606A31C;
	Wed, 11 Nov 2026 05:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58594606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=D4by6jRv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRby5PJfat0Tq+yaO9haGdN6WdhiH3VYAG3RKNO9VaF2ovgxvo27V12wBw2BgDatmK2/WjJJLyZpvBeZegaj4ugsn8MQ5P2bbFawP9k51dFzQUs8vrGd16SUwAZcjIP9jYfHK5rEB3M8XK29j5N3jEG3fSO6EJyKWizCk2i8vjwJPiTEaN6y4ybkCAg/1xMBvKWEcIamxK82Wh6gbWeE0yMt2MFg8lUfepH8E/mPP8/Vam8BgGwnjhKTYXUJ4Ka8iJzqRZU0Pk5vjhichRtdYEnrtJR66jOAwWtNqcLAmAvz36m1a9zMr75LgZqevGEkO7Vx5peCoXnwcPUIdkVz4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8Ae8zJ3NP40BHusQfTcfvmqyEP3O2x3WwKa4u7Wa0o=;
 b=OemvWARE5I4Vtr6bUiySgTywXVsQa/GLQutteLPRJy3Rde/ey+9eAeWKeHJlJUt/N/ifwynQLMgze0K4+cT0FFEb8K7r3fgfdv+w/dkT+AL4Jc27nS3vQ2CVkvuEzROmcL1woPolchpWZevGl09dkm0c4rkCgj1AvfSybj1dKFsdA35jD7RTX11Ia8+9cU+tHonLAYhSbwUcBanhPe1WhWKaRnrD78gff5NupIUeoMRO4RfZbsJggH9qClIMEuC0xj/nb4IhNepFMDYPNGZ1f021f6pAC5+Q/PIl3JXtRYzipRBGusELxdLeV8iZ0EYS/wVxRhIgJIvoGe0mEtvQ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8Ae8zJ3NP40BHusQfTcfvmqyEP3O2x3WwKa4u7Wa0o=;
 b=D4by6jRvnNz7BcG75y6WxsXYxqslu6Tr6KO3J/8r3jLFYraULblRbmuegAkNi7yy6nT0jxREddw50xY7y9iJXrmKwtM+Xm+riJ4tor4cm2f1/ef9R5a23Zlf0HKm1DmrS/3xOM4zS2XQ9dAEWgLpPVNerp90Rgs04uivfQq756E=
Received: from BN0PR02CA0012.namprd02.prod.outlook.com (2603:10b6:408:e4::17)
 by LV0PR12MB659346.namprd12.prod.outlook.com (2603:10b6:408:608::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 05:41:06 +0000
Received: from BN3PEPF00022BD0.namprd03.prod.outlook.com
 (2603:10b6:408:e4:cafe::32) by BN0PR02CA0012.outlook.office365.com
 (2603:10b6:408:e4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 05:41:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BD0.mail.protection.outlook.com (10.167.248.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 05:41:06 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 10 Nov
 2026 23:41:02 -0600
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: <arnd@arndb.de>, <gregkh@linuxfoundation.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <linux@roeck-us.net>,
	<naveenkrishna.chatradhi@amd.com>, <Anand.Umarji@amd.com>, Prathima Lk
	<Prathima.Lk@amd.com>, Akshay Gupta <Akshay.Gupta@amd.com>
Subject: [PATCH v1 3/3] docs: amd-sbi: document TBAI trace-buffer ioctl
Date: Wed, 11 Nov 2026 11:10:34 +0530
Message-ID: <20261111054034.2453874-4-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111054034.2453874-1-Akshay.Gupta@amd.com>
References: <20261111054034.2453874-1-Akshay.Gupta@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD0:EE_|LV0PR12MB659346:EE_
X-MS-Office365-Filtering-Correlation-Id: ae35c56b-1ab1-4488-161f-08df3fb66173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|261009223027099003|10067099003|3023799007|261022115727099003|261028144727099003|261102123227099003|261026140227099003|261026121527099003|261026130827099003|261021135927099003|261022113327099003|261021123027099003|261021121427099003|261022075727099003|261021130227099003|261022105027099003|5023799004|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5czNnn/3LjiMDvxbFTxuFVYaY4sk9lMQ4ob9M+Fakb+g9udjva26i3YgjRtShRuqxH7yFZfOYU14JBE5Iv/fN51YTKPhOxEgd99ScVLOC23mroNonLvn/fcqe8JzL4pP+nLtWYwE661woUfYgb4sBU1UMZSpOOvGB5o7+dIxt11hh8YIM4Z9XTj210Gd6iw2EusZ3gRjqZUivbp/JRhJTqs1kknrtCH/3BVtxt6vnbPEeTGEu7uxClF7MJK/qC+YlxwLMSfNvjAFSHwUIc183WTkievym11A3wL1Kcz4GblIXALK2U7QwBRFBZsrXYExhAQZlIeXmvLuarqmgOJtF6IUhj8hpXZEqUlIlnxhx/0DYmz3k9VgiC+wQSgtykR9dO6OqTix5JZWfdmSj/hh2Me5clhrY9cpLML+XGTztfA7zxazMBGJLcm0zH4cutybqVYuGueR1nKN/3DzN//R/i/LmAzxdsdJypgo0aRKMNWotsxjSIcIZIjmSpN/mlEbZGcvqjI+cfzdMCF8yow+100pjD5auxOHuKTI1pdtVg7/rC3xvfXbynnGJAihe9iujDJfsVnGo5yW+hHCShnf5XDIdZEZWEpaLCVeL9b6jyDJcncDTrdh5g2g4qZTam4FRooTERlUvpKhJHDFsBHzh3LZ4gbABmL9VA4phXRLnSfPlZ4kX1djxWYGI9/L/09obRATMoQN7wLXr+rfch+Zcw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(261009223027099003)(10067099003)(3023799007)(261022115727099003)(261028144727099003)(261102123227099003)(261026140227099003)(261026121527099003)(261026130827099003)(261021135927099003)(261022113327099003)(261021123027099003)(261021121427099003)(261022075727099003)(261021130227099003)(261022105027099003)(5023799004)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QwvK+P7Gm434JoW/IYgFFYTD1u1AIMnEKQ586C3kTW3veM2VgAV9I4iioCWSt5TLwTCiYG4VO6FRXcnRJ1/P1maozk+Ot6s2pOXoBqA28Dac32M7dYOrRqgcz+9wW9nxAa+3I9ra0jwFzfhpf7g04k08fG/YqfLQJ9YMUuUXRTkcZa5ltvN6PWHIu36jeC4YT11ppN2VJFzMdJ3auvYkHlAc6Hw1os3OZRnYd3q8BUnGShFPlcydGVe/OdAFU3ZfChVzWBcrKb1q43q07Uvw1p3yrM9vmPQMi/m3zcVuBg3onD8tRz90k2BgnvwJxUBLhBGiFdbxCn8yFUukTvmp1+4V7n3IHRP856+IFS/297csZvrzQj2EP0JiEiCOw8a5tGb/YpnTws5mVqb9m9MQwCN1DV1KPC9yc4IkjjQp+s3ggYVTnC1eGB9+KEQcxx5W
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 05:41:06.1001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae35c56b-1ab1-4488-161f-08df3fb66173
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB659346

From: Prathima Lk <Prathima.Lk@amd.com>

This change documents the SB-TSI Trace Buffer Acquire Interface (TBAI)
in the amd-sbi guide. It adds a prose section describing the shared
/dev/sbtsi-* node, the I3C-only requirement, the acquire and flush
operations, their return codes, and the serialization with register
access under the device lock.
It also adds the SBTBAI_IOCTL_CMD kernel-doc reference under Driver
IOCTLs and lists the ioctl define in the user-space usage list.
The documentation build was run locally to confirm the new section
and kernel-doc references render without warnings or errors.

Signed-off-by: Prathima Lk <Prathima.Lk@amd.com>
Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
---
 Documentation/misc-devices/amd-sbi.rst | 60 +++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/Documentation/misc-devices/amd-sbi.rst b/Documentation/misc-devices/amd-sbi.rst
index 648d743903b7..9cf7c003d00c 100644
--- a/Documentation/misc-devices/amd-sbi.rst
+++ b/Documentation/misc-devices/amd-sbi.rst
@@ -53,7 +53,7 @@ SBTSI device
 
 sbtsi driver under the drivers/misc/amd-sbi creates miscdevice
 /dev/sbtsi-* to let user space programs run APML TSI register transfer
-commands.
+and, on I3C targets, TBAI trace-buffer commands.
 
 The driver supports both I2C and I3C transports for SB-TSI targets.
 The transport is selected by the bus where the device is enumerated.
@@ -68,10 +68,64 @@ Misc device:
    crw-------    1 root     root       10, 116 Apr  2 05:22 /dev/sbtsi-4c
 
 
+Characteristics of the dev node:
+ * Different xfer protocols are defined:
+     * TSI register xfer (SBTSI_IOCTL_REG_XFER_CMD)
+     * TBAI trace-buffer access (SBTBAI_IOCTL_CMD), I3C only
+ * Requests from both ioctls are serialized under the same device lock.
+
 Access restrictions:
  * Only root user is allowed to open the file.
  * APML TSI Register transfer access is read-write.
 
+Trace Buffer Acquire Interface (TBAI)
+===========================================
+
+Trace Buffer Acquire Interface (TBAI) is defined in the Thermal
+Management (THM) block for the BMC(external controller) to access the
+Microprocessor's (MP) trace data, and the interface abstracts away the
+Trace buffer target address space for the trace buffer destination.
+
+Trace buffer target (TBT) refers to the on-die destination of a trace
+buffer entry.
+
+The Distributed Trace Buffer feature is to have a common debug tracing
+solution for all MPs, that is natively visible to the BMC (APML/MCTP).
+Each MP (bootcode and off-chip FW) puts trace logs into its local buffer
+and provides an interface called Debug Trace Buffer Acquire
+Interface using SB-TSI registers for the BMC to fetch the debug
+trace data through the THM out of band (OOB) I3C.
+
+TBAI is accessed with SBTBAI_IOCTL_CMD on the same /dev/sbtsi-* node
+as SBTSI_IOCTL_REG_XFER_CMD. It is only supported when the SB-TSI
+target is attached over I3C; on I2C the ioctl returns -EOPNOTSUPP.
+TBAI requests and TSI register transfers share the device lock, so
+they never interleave on the bus.
+
+Two operations are supported, selected by the command byte in the request:
+ * Trace Buffer Acquire (0x31): read 1 to 32 DWORDs of trace data from a
+   given look-up-table (LUT) index and entry offset.
+ * Trace Buffer Flush (0x32): reset the TBAI internal logic when the trace
+   buffer target does not respond. The 32-bit flush status (0xDEADBEEF)
+   is returned in the first DWORD of data_out, low byte first;
+   fw_ret_code is 0.
+
+The ioctl returns:
+ * 0: the request completed. All requested DWORDs are valid in the
+   fixed data_out array of struct apml_tbai_msg.
+ * -EPROTOTYPE: the trace buffer target reported an error. fw_ret_code
+   holds the AMD_SBI_TBAI_TBT_ERR* code and data_out is zeroed.
+ * -EMSGSIZE: the device returned less data than requested. Nothing is
+   copied back to the message.
+ * -EOPNOTSUPP: if the SB-TSI device is attached over I2C.
+
+After -EPROTOTYPE or -EMSGSIZE, issue a Trace Buffer Flush before
+retrying the acquire.
+
+reg_in[4] is the actual number of DWORDs to read, from 1 to
+AMD_SBI_MAX_TBAI_DWORDS. The driver handles the hardware encoding and
+splits requests larger than 8 DWORDs into multiple transactions.
+
 SBTSI hwmon interface
 =====================
 
@@ -126,6 +180,9 @@ Driver IOCTLs
 .. c:macro:: SBTSI_IOCTL_REG_XFER_CMD
 .. kernel-doc:: include/uapi/misc/amd-apml.h
    :doc: SBTSI_IOCTL_REG_XFER_CMD
+.. c:macro:: SBTBAI_IOCTL_CMD
+.. kernel-doc:: include/uapi/misc/amd-apml.h
+   :doc: SBTBAI_IOCTL_CMD
 
 User-space usage
 ================
@@ -166,6 +223,7 @@ The following IOCTLs are defined:
 ``#define SBRMI_IOCTL_MCAMSR_CMD	_IOWR(SB_BASE_IOCTL_NR, 2, struct apml_mcamsr_msg)``
 ``#define SBRMI_IOCTL_REG_XFER_CMD	_IOWR(SB_BASE_IOCTL_NR, 3, struct apml_reg_xfer_msg)``
 ``#define SBTSI_IOCTL_REG_XFER_CMD      _IOWR(SB_BASE_IOCTL_NR, 4, struct apml_tsi_xfer_msg)``
+``#define SBTBAI_IOCTL_CMD             _IOWR(SB_BASE_IOCTL_NR, 5, struct apml_tbai_msg)``
 
 
 User space C-APIs are made available by esmi_oob_library, hosted at
-- 
2.34.1

