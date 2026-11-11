Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794375672;
	b=bZ+L7jy37qLvSL/sBKfr4pvUM2I5qUbGJUQOJ2MFZ7wbD+0KqW45kFg41cB0UVDkV3uW
	 rc8APdMAHCKovtXkr0FUArL9uO3oH7daYOkuJi+uDq7OZFFZUy5yEVOwsvwwqbnwYdM+J
	 cxOh5I7WsUmQ42WAa32IfNLbpK9LQSMhekzNKfWYzSf3nsY9MzljChn6xcqWJLycqNQ1G
	 IaIf3ryHR4tyYgswm5VfToA5381BzAHsf5Le9wOkO6SdsT0ZeGs4cibiJWFtUObZYLOp4
	 gW0gPqutYC3UiajpfQ9p7rtNu36x3MJxT4pTwggESBCWRNHYI7+FGHJ6uixWGJcw5kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794375672;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
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
	bh=G4NF4a2iXvd6LYaYPg0p+RvEk3BvIcGLp+nmCIXAMEo=;
	b=PlRJz18gbLWVAfn3kVJLFyb4N18HUbGlmJ5AwGFfPfWdXBpXHjIQF4HerReFkv3t06tq
	 wRcP7TPk4I7t2umEBWPxEgXUB6l0yUIQ999B119xBHOj54lpj2MDboF433BN36H6t5xvU
	 Rhx75tZNBLKdCO4sHHehn+sn5+NXhV4a7TVxOw5/fh0q3c5QERy3bhcds1aFqsWyw32AT
	 Wbu2BHOgjkughhyJfnuHNXKrF4a6T3lfjIID/nsgY3V6wzUutV58DUak3ENNzseO8kYze
	 qEBg0C7xRtOn7oC8+cc9pQflELhIRVMnM62A7231cdvcUi8fSwczGcW5fAsCbvHJFWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="XvqE/VWq";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.53
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011053.outbound.protection.outlook.com [40.93.194.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810D1606A32D;
	Wed, 11 Nov 2026 05:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 810D1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XvqE/VWq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zF+PEjawdL02wPx0xmsVEB9k1OThLECtkpaGraQhxTl1PIeNyIWTvr4M4XlZpA4UdYCNpNuh7dUDwrLl6jg4JWyay7AlzecdCnyU3BaYhPDPAKAD0YV5nYDPa5E1ZFUPgWnfWQsXHxp0WZ0+ys9OsEUEat0Xepbwwpu6+m+OLSAiTCr5tezbvZXUzeWvVU3nSd/I6yj7aquhWIG6GY1aEPu3Pzp/zidgCVyzSsE3R2WiEdCoh9Z+HJcUL7fmdyIuQX2mkN0vu3d+YkoVz5H9BkGcefVIqxF2XoBA08jdBg91E6DdzsNFiut2JDKvZv0E2UZK9IwtCuHl2NISjRxwCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4NF4a2iXvd6LYaYPg0p+RvEk3BvIcGLp+nmCIXAMEo=;
 b=Delrh/vi94DVOoFcCpvyU5v7DmlMf71q521IErBZ1M0+GnsQ6VQWKQf8enPOiEAXVHuuNgtWvTjFpzayhtptuXacfckCOqyyp2Xicnl8Q1UA2BsruszvYKtheRwpshp3kdi9F+LNvJ/AGK4vXoG8/onT1D/GdMO3Cbpm6Z2ZBljoMpuVaiGndP22JxWmtenrfzK5sesoKhJ/7YC31ipACBqtMtvHRefIc+IZHETvtRQ1V+dRioe7ZaSAK5kgqMknCikxr94JozZQoON1u134lu2pEXJ+ccCKzKEYHsJgAF+XU3GlwazrjuHQxvwyQ/F+OzP+acS6QYM/7eUexjU1QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4NF4a2iXvd6LYaYPg0p+RvEk3BvIcGLp+nmCIXAMEo=;
 b=XvqE/VWq9pdvG7mQ7ovAeJJCVQAiXRaxhczfLroV11Rs6cgJ3NWj2qGB+2P/klM70POaYktkpMuKSmjoxJlchJw+zKwTxmdVgtMLwUBxluUJBUq4L3liuyjT6GRNmRj6tMHFjU2wYvXu0A614FUlpn7gkQuty12mf7wndJ8F7Ro=
Received: from BN0PR04CA0178.namprd04.prod.outlook.com (2603:10b6:408:eb::33)
 by SN7PR12MB6792.namprd12.prod.outlook.com (2603:10b6:806:267::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 05:41:01 +0000
Received: from BN3PEPF00022BCE.namprd03.prod.outlook.com
 (2603:10b6:408:eb:cafe::95) by BN0PR04CA0178.outlook.office365.com
 (2603:10b6:408:eb::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 05:41:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BCE.mail.protection.outlook.com (10.167.248.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 05:41:01 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 10 Nov
 2026 23:40:57 -0600
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: <arnd@arndb.de>, <gregkh@linuxfoundation.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <linux@roeck-us.net>,
	<naveenkrishna.chatradhi@amd.com>, <Anand.Umarji@amd.com>, Akshay Gupta
	<Akshay.Gupta@amd.com>, Prathima Lk <Prathima.Lk@amd.com>
Subject: [PATCH v1 2/3] misc: amd-sbi: Add TBAI trace-buffer access over I3C
Date: Wed, 11 Nov 2026 11:10:33 +0530
Message-ID: <20261111054034.2453874-3-Akshay.Gupta@amd.com>
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCE:EE_|SN7PR12MB6792:EE_
X-MS-Office365-Filtering-Correlation-Id: 93653d3b-430f-416d-08bf-08df3fb65eb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|10067099003|11063799006|56012099006|261022105027099003|261022113327099003|261022115727099003|261022075727099003|261021123027099003|261021121427099003|261026121527099003|261021130227099003|261026140227099003|261026135527099003|261021135927099003|261021133027099003|261026130827099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	araud3LQDr+29ndQDrF1CcSfKEtJKBgJJVpM/NOIEuRSJHGIYCiv3LiFc4yvNLvMOaO9sEzgduUuyWjOXWN5D5hXjahvT7k6QeXHU03CJgWax4Uy1CrZwf1tYK1pCOTWBXIIe6RZYMMv3BYRUyvutjULUgOG2r9lu0z7fgXLAaXNkfwdUy3CXL5pfgLzpWM37HUqWgxVzEGajRgnK/LZcOwRVRCSUEgrzd0cuvn2JYXqF5nyNPbg0KKadbwpxyW9kmDgG/X+/RvnBKKEURPnOTA0tNz1gxR/kvnEOZEIi11txnnrD2BR21S0D40T0uKwYnbWzJ9PqiG+PmNPpP44dl9s3xDJZzeKVlgljfS56qv4vLVMMOdt+tJro5V5fGPTXJcwCACVUZUDMnNIXJkR5wdY9Oe0MQy+XnZn6NTOKqPolHeWz6xnfE1s+i9jXV9Ci61S+X6ePhbPTrf3pgt+Lbp2tJPyTQmCUjVieUfEG7oi1WUbyorhMmkAevbWj2eIyCueSlvGkxg7WqyyuuEPz+xrOxA4UFPS+gKRQ4Yn86z49Vfc7H/de0QSvFOKHBLZs//4KLve6+irBVRRC+bC9R2hEV5Z2bfU1VPv8wDnTRJeTwwhxCzcWi2doT0FmlO43W9qMYeptMif06OKeP+lzSV2xBHtGQW+PYROXxMI3AJDR9e20LIT/99f+tGsnU9Hoy0PpVUSCFmxLmrigAaUeg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(261022105027099003)(261022113327099003)(261022115727099003)(261022075727099003)(261021123027099003)(261021121427099003)(261026121527099003)(261021130227099003)(261026140227099003)(261026135527099003)(261021135927099003)(261021133027099003)(261026130827099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HMmtX0/O5zL3R/L+r9dr6BGlIMxt8yDjcqccNPoFo7jBYwSeooNkpZsKe1f3jBEux0X2xNQkfe2+IQbQovYT9kguxyAdH0ufHWLo31LVS9heArLMwzvvbjIsRVyVSp1zpsdLGjP96g2zXgyUkyG0foi0/jc8QzyB9U9rJs2c1ONtD1H5DcVmYghl72Wr4gF8yOIt8xHG7HmE5KTlUlT9sUmtvqdneJtAMBMZwd6bxOjGGI0zbN8wdGBM13Kfdx7Lfju8IR2vtuY1EqiL2XjmtO2mYIBY2ga4TVi2EzuxDoCARZzJLhuZOfhoTZeEh8Evao0OLpaZRpLtE9elgMNovXSjDd+4uKOhTS9up28sHRot4jhpNMtnLyxIEouI/LvLH6ZDiZQ/TlKQVWCAET1pjIJFzrGIK59IsKmMHvGlSt6domWMqtLff+SUL7K75GWF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 05:41:01.5292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93653d3b-430f-416d-08bf-08df3fb65eb9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BCE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6792

The Trace Buffer Acquire Interface (TBAI) in the Thermal Management
(THM) block allows the Board Management Controller (BMC) to access
MP trace data without managing the trace buffer's destination address
space.

Add TBAI support to the amd-sbi driver through a new SBTBAI_IOCTL_CMD
ioctl for acquire and flush operations. The ioctl is supported only
when the SB-TSI device is attached over I3C.

The acquire operation reads trace data in chunks of up to 32 dwords,
advances the entry offset between chunks, and reports trace-buffer
target errors returned in fw_ret_code. Add the corresponding UAPI
structures, command indices, and error codes, and enlarge the shared
I3C buffers to accommodate TBAI transfers.

Tested on I3C hardware with acquire, flush, short-read, and
trace-buffer target error cases. Confirmed that the I2C path returns
-EOPNOTSUPP.

Co-developed-by: Prathima Lk <Prathima.Lk@amd.com>
Signed-off-by: Prathima Lk <Prathima.Lk@amd.com>
Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
---
 drivers/misc/amd-sbi/tsi-core.c | 194 ++++++++++++++++++++++++++++++++
 drivers/misc/amd-sbi/tsi-core.h |  13 ++-
 include/uapi/misc/amd-apml.h    |  78 +++++++++++++
 3 files changed, 280 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/amd-sbi/tsi-core.c b/drivers/misc/amd-sbi/tsi-core.c
index 1920e4dc7b67..7e79c7eb3fde 100644
--- a/drivers/misc/amd-sbi/tsi-core.c
+++ b/drivers/misc/amd-sbi/tsi-core.c
@@ -8,11 +8,29 @@
 
 #include <linux/fs.h>
 #include <linux/ioctl.h>
+#include <linux/limits.h>
 #include <linux/module.h>
+#include <linux/slab.h>
 #include <linux/uaccess.h>
+#include <linux/unaligned.h>
 #include <uapi/misc/amd-apml.h>
 #include "tsi-core.h"
 
+#define TBAI_WR_LEN			0x4  /* Input length (excludes command byte) */
+#define TBAI_REQ_LEN			0x5  /* Full request: command byte + TBAI_WR_LEN */
+#define TBAI_FLUSH_RD_LEN		0x4  /* flush buffer read length */
+#define MAX_PROTO_RD_SZ			32   /* Maximum bytes read in one transaction */
+#define BYTES_PER_DWORD			0x4  /* Number of bytes in dword */
+
+#define TBAI_IN_LUT_INDEX		0
+#define TBAI_IN_OFF_LO			1
+#define TBAI_IN_OFF_HI			2
+#define TBAI_IN_DWORD_COUNT		3
+
+/* Maximum dwords possible to read in one transaction */
+#define MAX_DWORDS_READ			0x8
+#define TBAI_OFFSET_HI_SHIFT		8    /* offset high byte bit position */
+
 static inline struct sbtsi_i3c_priv *to_sbtsi_i3c_priv(struct sbtsi_data *data)
 {
 	return container_of(data, struct sbtsi_i3c_priv, data);
@@ -136,6 +154,180 @@ static int apml_tsi_reg_xfer(struct sbtsi_data *data,
 	return ret;
 }
 
+/* True if the single-dword reply is a trace buffer target (TBT) error status word */
+static bool tbai_is_tbt_err(u32 status)
+{
+	switch (status) {
+	case AMD_SBI_TBAI_TBT_ERR0:
+	case AMD_SBI_TBAI_TBT_ERR1:
+	case AMD_SBI_TBAI_TBT_ERR2:
+	case AMD_SBI_TBAI_TBT_ERR5:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int tbai_protocol(struct sbtsi_data *data, u8 cmd, u8 *input, u8 count,
+			 u8 *output, u16 *transferred_len)
+{
+	struct sbtsi_i3c_priv *priv = to_sbtsi_i3c_priv(data);
+	struct i3c_xfer xfers[2] = { };
+	int ret;
+
+	if (count > MAX_PROTO_RD_SZ)
+		return -EINVAL;
+
+	priv->tx[0] = cmd;
+	memcpy(&priv->tx[1], input, TBAI_WR_LEN);
+	xfers[0].len = TBAI_REQ_LEN;
+	xfers[0].data.out = priv->tx;
+	xfers[1].rnw = true;
+	xfers[1].len = count;
+	xfers[1].data.in = priv->rx;
+	memset(priv->rx, 0, count);
+
+	ret = i3c_device_do_xfers(data->i3cdev, xfers, ARRAY_SIZE(xfers), I3C_SDR);
+	if (ret)
+		return ret;
+	/* The I3C master returns the received length in xfers.len */
+	*transferred_len = xfers[1].len;
+	memcpy(output, priv->rx, count);
+	return 0;
+}
+
+static int flush_trace_buffer(struct sbtsi_data *data,
+			      struct apml_tbai_msg *msg)
+{
+	/* Flush resets the whole TBAI logic; request bytes 2-5 are reserved */
+	u8 input[TBAI_WR_LEN] = { };
+	u16 transferred_len;
+	int ret;
+
+	msg->fw_ret_code = 0;
+
+	ret = tbai_protocol(data, msg->reg_in[AMD_SBI_TBAI_CMD_INDEX], input,
+			    TBAI_FLUSH_RD_LEN, msg->data_out.bytes_out,
+			    &transferred_len);
+	if (ret)
+		return ret;
+
+	if (transferred_len != TBAI_FLUSH_RD_LEN)
+		ret = -EMSGSIZE;
+
+	return ret;
+}
+
+static int acquire_trace_buffer(struct sbtsi_data *data,
+				struct apml_tbai_msg *msg)
+{
+	u32 total_dwords, expected_len, data_read = 0, status = 0;
+	u16 offset, offset_new, transferred_len;
+	u8 input[TBAI_WR_LEN] = { };
+	int dword_read, i, ret = 0, dword_remain;
+
+	msg->fw_ret_code = 0;
+	/* Dwords to read from user*/
+	total_dwords = msg->reg_in[AMD_SBI_TBAI_DWORD_RD_INDEX];
+	dword_remain = total_dwords;
+	/* Extract the offset to update, if more than 8 Dwords require to read */
+	offset = (u16)msg->reg_in[AMD_SBI_TBAI_OFFSET_LO] |
+		 ((u16)msg->reg_in[AMD_SBI_TBAI_OFFSET_HI] << TBAI_OFFSET_HI_SHIFT);
+
+	/* If Dwords to read is 0 or more than 32, return */
+	if (!total_dwords || total_dwords > AMD_SBI_MAX_TBAI_DWORDS)
+		return -EINVAL;
+
+	/* Offset of the last chunk must fit in the 16-bit entry offset */
+	if ((u32)offset + (total_dwords - 1) / MAX_DWORDS_READ * MAX_PROTO_RD_SZ > U16_MAX)
+		return -EINVAL;
+
+	/*
+	 * Set required variables to read dwords
+	 * Maximum dwords supported from TBAI protocol is 8
+	 */
+	for (i = 0; i <= total_dwords / MAX_DWORDS_READ && dword_remain > 0; i++) {
+		if (dword_remain > MAX_DWORDS_READ) {
+			dword_remain -= MAX_DWORDS_READ;
+			dword_read = MAX_DWORDS_READ;
+		} else {
+			dword_read = dword_remain;
+			dword_remain = 0;
+		}
+		/* update offset if more than 8 Dwords require to read */
+		offset_new = i * MAX_PROTO_RD_SZ + offset;
+		input[TBAI_IN_LUT_INDEX] = msg->reg_in[AMD_SBI_TBAI_LUT_INDEX];
+		input[TBAI_IN_OFF_LO] = offset_new & U8_MAX;
+		input[TBAI_IN_OFF_HI] = (offset_new >> TBAI_OFFSET_HI_SHIFT) & U8_MAX;
+		input[TBAI_IN_DWORD_COUNT] = dword_read - 1;
+
+		expected_len = dword_read * BYTES_PER_DWORD;
+		ret = tbai_protocol(data, msg->reg_in[AMD_SBI_TBAI_CMD_INDEX], input,
+				    expected_len,
+				    &msg->data_out.bytes_out[i * MAX_PROTO_RD_SZ],
+				    &transferred_len);
+		if (ret)
+			return ret;
+
+		data_read += transferred_len;
+		/* A 1-dword reply matching a TBT error code is always taken as an error */
+		if (transferred_len == BYTES_PER_DWORD) {
+			status = get_unaligned_le32(&msg->data_out.bytes_out[i * MAX_PROTO_RD_SZ]);
+			if (tbai_is_tbt_err(status)) {
+				msg->fw_ret_code = status;
+				/* No trace data is returned on error, as with -EMSGSIZE */
+				memset(&msg->data_out, 0, sizeof(msg->data_out));
+				ret = -EPROTOTYPE;
+				return ret;
+			}
+		}
+
+		if (transferred_len < expected_len)
+			break;
+	}
+	if (data_read != (total_dwords * BYTES_PER_DWORD))
+		ret = -EMSGSIZE;
+
+	return ret;
+}
+
+static int apml_tbai_reg_xfer(struct sbtsi_data *data,
+			      struct apml_tbai_msg __user *arg)
+{
+	struct apml_tbai_msg msg = { };
+	int ret;
+
+	/* TBAI is only available over I3C */
+	if (!data->is_i3c)
+		return -EOPNOTSUPP;
+
+	if (copy_from_user(&msg, arg, sizeof(struct apml_tbai_msg)))
+		return -EFAULT;
+	if (msg.logging_en || msg.pad[0] || msg.pad[1] || msg.pad[2])
+		return -EINVAL;
+
+	scoped_guard(sbtsi, data) {
+		if (data->detached)
+			return -ENODEV;
+
+		if (msg.reg_in[AMD_SBI_TBAI_CMD_INDEX] == AMD_SBI_TBAI_ACQUIRE)
+			ret = acquire_trace_buffer(data, &msg);
+		else if (msg.reg_in[AMD_SBI_TBAI_CMD_INDEX] == AMD_SBI_TBAI_FLUSH)
+			ret = flush_trace_buffer(data, &msg);
+		else
+			ret = -EINVAL;
+	}
+
+	/* Partial data is not returned on a short read */
+	if (ret && ret != -EPROTOTYPE)
+		return ret;
+
+	if (copy_to_user(arg, &msg, sizeof(struct apml_tbai_msg)))
+		return -EFAULT;
+
+	return ret;
+}
+
 static int sbtsi_open(struct inode *inode, struct file *fp)
 {
 	struct sbtsi_data *data;
@@ -169,6 +361,8 @@ static long sbtsi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 	switch (cmd) {
 	case SBTSI_IOCTL_REG_XFER_CMD:
 		return apml_tsi_reg_xfer(data, argp);
+	case SBTBAI_IOCTL_CMD:
+		return apml_tbai_reg_xfer(data, argp);
 	default:
 		return -ENOTTY;
 	}
diff --git a/drivers/misc/amd-sbi/tsi-core.h b/drivers/misc/amd-sbi/tsi-core.h
index 8efe7e220f4a..0b38c0b60b8f 100644
--- a/drivers/misc/amd-sbi/tsi-core.h
+++ b/drivers/misc/amd-sbi/tsi-core.h
@@ -11,15 +11,18 @@
 #include <linux/cache.h>
 #include <linux/misc/tsi.h>
 
-/* SB-TSI register access transaction sizes in bytes. */
-#define SBTSI_TX_LEN	2	/* [0] register address, [1] value */
-#define SBTSI_RX_LEN	1	/* single data byte */
+/* Maximum SB-TSI I3C transaction sizes in bytes (register access and TBAI). */
+#define SBTSI_TX_LEN	5
+#define SBTSI_RX_LEN	32
 
 /**
  * struct sbtsi_i3c_priv - per-device state for I3C SBTSI (includes DMA-safe buffers)
  * @data: public device state exposed via dev_set_drvdata()
- * @tx:   outgoing I3C bytes (DMA_TO_DEVICE); [0] register address, [1] value
- * @rx:   incoming I3C data byte (DMA_FROM_DEVICE)
+ * @tx:   outgoing I3C bytes (DMA_TO_DEVICE); for TSI register access
+ *        [0] register address, [1] value; for TBAI [0] command,
+ *        [1..4] input
+ * @rx:   incoming I3C data bytes (DMA_FROM_DEVICE); TSI register read
+ *        returns one byte, TBAI returns up to SBTSI_RX_LEN bytes
  */
 struct sbtsi_i3c_priv {
 	struct sbtsi_data data;
diff --git a/include/uapi/misc/amd-apml.h b/include/uapi/misc/amd-apml.h
index 8a85f79b0938..85741b8f4c21 100644
--- a/include/uapi/misc/amd-apml.h
+++ b/include/uapi/misc/amd-apml.h
@@ -10,6 +10,24 @@
 /* Mailbox data size for data_in and data_out */
 #define AMD_SBI_MB_DATA_SIZE		4
 
+/* TBAI trace-buffer access message. */
+#define AMD_SBI_MAX_TBAI_DWORDS         32
+#define AMD_SBI_MAX_TBAI_BYTES          128
+#define AMD_SBI_TBAI_INPUT_BYTES        5
+#define AMD_SBI_TBAI_CMD_INDEX          0
+#define AMD_SBI_TBAI_LUT_INDEX          1
+#define AMD_SBI_TBAI_OFFSET_LO          2
+#define AMD_SBI_TBAI_OFFSET_HI          3
+#define AMD_SBI_TBAI_DWORD_RD_INDEX     4
+#define AMD_SBI_TBAI_ACQUIRE            0x31
+#define AMD_SBI_TBAI_FLUSH              0x32
+
+/* Trace buffer target error status reported in fw_ret_code */
+#define AMD_SBI_TBAI_TBT_ERR0        0xDEADBEE0
+#define AMD_SBI_TBAI_TBT_ERR1        0xDEADBEE1
+#define AMD_SBI_TBAI_TBT_ERR2        0xDEADBEE2
+#define AMD_SBI_TBAI_TBT_ERR5        0xDEADBEE5
+
 struct apml_mbox_msg {
 	/*
 	 * Mailbox Message ID
@@ -80,6 +98,35 @@ struct apml_tsi_xfer_msg {
 	__u8 pad;		/* Explicit padding */
 };
 
+/* TBAI trace-buffer access message. */
+struct apml_tbai_msg {
+	/*
+	 * Output trace-buffer data read back; accessed either as dwords_out
+	 * (up to AMD_SBI_MAX_TBAI_DWORDS dwords) or bytes_out
+	 * (up to AMD_SBI_MAX_TBAI_BYTES bytes)
+	 */
+	union {
+		__u32 dwords_out[AMD_SBI_MAX_TBAI_DWORDS];
+		__u8 bytes_out[AMD_SBI_MAX_TBAI_BYTES];
+	} data_out;
+	__u32 logging_en;	/* Reserved, must be zero */
+	__u32 fw_ret_code;	/* TBT error status */
+	/*
+	 * Input register bytes written to the device:
+	 * [0] command ID (AMD_SBI_TBAI_ACQUIRE: acquire buffer,
+	 *     AMD_SBI_TBAI_FLUSH: flush/clear buffer)
+	 * [1] LUT index; the LUT holds the programmed destination trace
+	 *     buffer target (TBT) address for each TraceBufferIndex
+	 * [2] entry offset low byte
+	 * [3] entry offset high byte
+	 * [4] Dwords to read (1 to AMD_SBI_MAX_TBAI_DWORDS)
+	 * [1]...[4] are used only by AMD_SBI_TBAI_ACQUIRE; flush ignores
+	 * them as it resets the TBAI logic for all LUT indices.
+	 */
+	__u8 reg_in[AMD_SBI_TBAI_INPUT_BYTES];
+	__u8 pad[3];		/* Explicit padding */
+};
+
 /*
  * AMD sideband interface base IOCTL
  */
@@ -172,4 +219,35 @@ struct apml_tsi_xfer_msg {
  */
 #define SBTSI_IOCTL_REG_XFER_CMD	_IOWR(SB_BASE_IOCTL_NR, 4, struct apml_tsi_xfer_msg)
 
+/**
+ * DOC: SBTBAI_IOCTL_CMD
+ *
+ * @Parameters
+ *
+ * @struct apml_tbai_msg
+ *      Pointer to the &struct apml_tbai_msg that will contain the trace-buffer
+ *      access information
+ *
+ * @Description
+ * IOCTL command for APML TBAI messages using generic _IOWR
+ * The IOCTL provides userspace APML TBAI trace-buffer access.
+ * TBAI is only available when the SB-TSI device is attached over I3C.
+ *
+ * @Return
+ * 0 on a full read/flush, otherwise:
+ *
+ * * -EOPNOTSUPP: the SB-TSI device is attached over I2C.
+ *
+ * The following are TBAI operation-status codes reported for the
+ * acquire/flush request itself; they are not generic ioctl(2) errors:
+ *
+ * * -EMSGSIZE: short read; less data returned than requested.
+ *   data_out is not updated.
+ * * -EPROTOTYPE: trace buffer target (TBT) error; fw_ret_code holds the
+ *   AMD_SBI_TBAI_TBT_ERR* code and data_out is zeroed. A 1-dword reply
+ *   carrying one of these values cannot be told apart from trace data
+ *   and is always reported as an error.
+ */
+#define SBTBAI_IOCTL_CMD         _IOWR(SB_BASE_IOCTL_NR, 5, struct apml_tbai_msg)
+
 #endif /*_AMD_APML_H_*/
-- 
2.34.1

