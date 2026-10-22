Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792684711;
	b=riJjg4VRQXroW9cIT6+deEo1QuHCmSVf/g4UurkHU0ZQ0ZoYIfts+ZUOSxkwRL1DRH+h
	 9yjLvydqR1xa0p0iAi+xsufGACa0bHdyoS5K1deXjQEab8+iLtQ2KZCsmJ048kSi3fRQO
	 6UwPLM3e8nC91KZ45KHqJiqaD8wuNQlCxYP32PR++psjbGEes4zeti91bdz1BtVHuThae
	 oXxZCdq8OXwfc3EDAvKybH8RctXxRL0/CuldDdSQZVYkrW6UmLuTEhsY3uCJA2ssfgdTy
	 reXSy6oC1mzJLr76KorU4ysppk14PcdhQfHKRWvaNZ3f7vEwdpf9y5IXfwvlf1fRJwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684711;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
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
	bh=Q+iRucOpyzVZYqLOhtf2lLfuMQTWP6HMT9jJ94Hp2dQ=;
	b=JQIpQPJXkCfxlbTuQdqBnqKWbZnqMTqXdFtElqqkjl4HywZxkHCbPlV9s7sJswtvfA0W
	 FLIt8fqCE7MOFHiReK3ZfihPAX2yazGL876i6uhRaeSp7soKqrNnHODaLPas5somIHIh1
	 1FcEUFwK/njgFgH7/IYN0AUBtyaTfkT88kQRy5/+J2hUjG3Mvduq+PvJhrdpsnE/5tF5K
	 HJjERaADpbVfimb2NAXivUOEnYyKz1JW0QUXmW/ErNu4LZeJSY0aEG1fOlg2TYFt2DbH8
	 tPnJYn3c2dobfgAD0afl+o/GGl+tyRrjP6c6yKYZHXE5e1YIQCz8WTndvE3DjzlQDpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=YSsMAZsL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.1
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011001.outbound.protection.outlook.com [52.101.62.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D37D606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D37D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=YSsMAZsL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSXAP4TM1NASw3DjBQPbfhBT85ox/tH0jHk8RbSh3m0JoorrHkhIOuq5Fe73ZxuDoLetveYk1Ku0NWnvkvxRKPP86byp4ObNo6/+IAefxxEeJsvDhL0l8598TNL7FCsa4FtkvAxnpokahfYgWMaB/zcHxfWeWJ1G0SofNsKwXeKo5eoRcT9P6AwsYKqqMzR/sJtkDbWQeb5XNkvjc5Uxwnt6pGvajrJQkRu10NkNaicpnHHlGJBfVHLwRRquGUruchCgqgANI9fmfV6+DDpimYLRo+Ab4aFcdr4NuvrMn7Rc/jFJH0ATWMfDkiHiS/TrNVC3gBQvRnaLIv3x5xRfVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+iRucOpyzVZYqLOhtf2lLfuMQTWP6HMT9jJ94Hp2dQ=;
 b=upye9aE45WkTgw5iNfMPoqdXIzZNrfsS8xPquI9X0TFHGg0iiyWdqdNDlK18utMdXvbJDFU2q1h7wiCgTvTOZLFtUY7if4JyNeI3xx89DtxM3vHe/FLfoF+V75/KdoFRzpKiDqDkTgzN1N5YtYpCGdGO+BYTw56s7xAdf/KDC3mSnqmU2BRJjJkkWjSp5LifsEePDdzO1/pIbl7dRrhj5g8Cp17hHj8bizgOnMlE0JHWmUiJb5SJ+3j9L2X1agbXzoTiOoX7UHS4NxDaUdeS2dk3JvTgBzzEmm0lzhccyyp2+ZObfbPoG8jbRTDpopQj7qcroQJmToNDKQKKUo/3sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+iRucOpyzVZYqLOhtf2lLfuMQTWP6HMT9jJ94Hp2dQ=;
 b=YSsMAZsL9O1Yp5CsBAj8zD1cGe6YLSM8JVmip7o1j1uCl8tY5/Pi2kCCN+16ddl5e66auyWlFhmZnZhnD+yUFm+60jVxS4eh2fOiq6JNQIVGWECNOPKZkD6TwTeePiOFnTLzwaU/QhY/WvciZ4bAjISs+VX0gyCixBq67XnxA0U=
Received: from PH7P223CA0002.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::28)
 by DS5PR12MB575708.namprd12.prod.outlook.com (2603:10b6:8:47c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 15:58:14 +0000
Received: from CY8PEPF00000059.namprd21.prod.outlook.com
 (2603:10b6:510:338:cafe::51) by PH7P223CA0002.outlook.office365.com
 (2603:10b6:510:338::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 15:58:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY8PEPF00000059.mail.protection.outlook.com (10.167.247.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Thu, 22 Oct 2026 15:58:14 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 22 Oct
 2026 10:58:13 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 22 Oct
 2026 10:58:13 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 22 Oct 2026 10:58:12 -0500
From: Max Zhen <max.zhen@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>, <lizhi.hou@amd.com>,
	<dri-devel@lists.freedesktop.org>, <mario.limonciello@amd.com>,
	<karol.wachowski@linux.intel.com>
CC: Max Zhen <max.zhen@amd.com>, <linux-kernel@vger.kernel.org>,
	<sonal.santan@amd.com>, Umio Yasuno <coelacanth_dream@protonmail.com>
Subject: [PATCH V1 1/5] accel/amdxdna: Use compatible fdinfo engine key
Date: Thu, 22 Oct 2026 08:57:53 -0700
Message-ID: <20261022155753.232976-1-max.zhen@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CY8PEPF00000059:EE_|DS5PR12MB575708:EE_
X-MS-Office365-Filtering-Correlation-Id: 200b4cd7-f255-4913-e158-08df305547a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|261009223027099003|261021123027099003|261021121427099003|10067099003|56012099006|3023799007|6133799003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	83KqkgozhXnvMKxUVefjZPdq8lfikgjNg5KEcFO1PryiPapH3Kz66btd8JQ+kIXOEFCgHoq1M9aS6Qm5z1zHdMqUuOSDoVCEzoTj7rKYLhzkC1gOofsgM7RXOPI8fbzrcf3sCQjWswPOzPbbL3KFVFvH6pghYmTTotXnldvMY39ECh01vATqmESJwCJcbmgCMJ1hUz5BjZS1DPv4FbXSHvRZu/i7DERAdM/GKNFSHsYUomeC8c5uLYkALKm4QBnsuzUpmxLu2YktR1YZnjvijkj9qIOHUTWUhRdPjoe95+kNdpoFSJEh78TaXKc9MStUXOi79Pu59xhkmPxa92JlhZKAOtFLPj4bj8dLUI4fYEORNF+HOMv05yde44pSxGHWebkH4kacfF3u/NQG01cXFXTQXJivaqkeD2TMUXF0kioOn0cbDrggBjOJz/UOnuVsyhq5DNKSgFJQooKr0y0OJJJPGlsnRaDGRE1hhZhOMVn1GAIcU41XjvHJPFHzDpSNCy0+fwIAikLQogTRT6IrNhAEtxxqh9d4FhhKgzPh3PD+gsVi+Snwt8HsQNt2BTR+ZLrkNhj0bUWGW9zlIVit22TKJlns6g3eNNrxV+8gPWU0L6PaZz4bH7GqqS47k2DdhF9ub18wI/e5Z553Uj+3SuBDatXoinCIu6MX2mLicIzUdtH+4br9XMfBWW+m5yYFNLltwiw6lwegitUvT++HzA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(261009223027099003)(261021123027099003)(261021121427099003)(10067099003)(56012099006)(3023799007)(6133799003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fM/o4jP9Nm7WvDWP2BXutQ5c3IZT8INpSRt37+Qt95ztS3qogemUSyyQwzhry1yQSWH3LoC0joEiAXXidlnI5DgV6KptN9PgDvEcNCwlCzJju1h59inx/awPosVgNUEEteyiP/5QApU+y3g8DScMl3a5yWo7Ad9iekIaccmpREeoPkdPautsoYIQQ6uldOHNb/7+NFZXRjyNfTpx3cEd1rnlvMvBShIUZE7gyA3RwwDxtpHyvgPk//yKN1tgb9Xg2/7iRuf6KG4CR9Z5lvaHZlkzcbr+Q+lgf2yv3t1lwrbEhalM+kIpMSCPEDNj0UQ3giX8g3G2ynQ0Mgu20ChHdKtY6e7a7uixKExDjm+rMrWuhnjC5+5SJZRiA9E5BvdgrrebGstpEk2y0z3+z0Wse7Ydw+Ghgr4XDDLdCQWALpgnOJwF5+IjIFPcKbUPXScD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 15:58:14.1219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 200b4cd7-f255-4913-e158-08df305547a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF00000059.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PR12MB575708

The released out-of-tree amdxdna driver uses amdxdna_accel_driver as the
drm-engine key string, which is consumed by several applications.

Use the same key string in the upstream driver to maintain compatibility
with the out-of-tree driver.

Reported-by: Umio Yasuno <coelacanth_dream@protonmail.com>
Closes: https://github.com/amd/xdna-driver/issues/1754
Fixes: 489a8539ca6f ("accel/amdxdna: Expose NPU device busy time via DRM fdinfo")
Signed-off-by: Max Zhen <max.zhen@amd.com>
---
 Documentation/accel/amdxdna/amdnpu.rst  | 2 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/accel/amdxdna/amdnpu.rst b/Documentation/accel/amdxdna/amdnpu.rst
index d72af1b51ccf..b0cc481c73ae 100644
--- a/Documentation/accel/amdxdna/amdnpu.rst
+++ b/Documentation/accel/amdxdna/amdnpu.rst
@@ -289,7 +289,7 @@ Example of the output showing the implemented key value pairs:
         drm-driver:	amdxdna_accel_driver
         drm-client-id:	3219
         drm-pdev:	0000:c5:00.1
-        drm-engine-npu: 14003870 ns
+        drm-engine-amdxdna_accel_driver:        14003870 ns
         amdxdna_accel_driver-heap-alloc:	60 KiB
         amdxdna_accel_driver-internal-alloc:	67588 KiB
         amdxdna_accel_driver-external-alloc:	0
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index edf807c93144..f233eb70a295 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -284,9 +284,9 @@ static void amdxdna_show_fdinfo(struct drm_printer *p, struct drm_file *filp)
 {
 	struct amdxdna_client *client = filp->driver_priv;
 	size_t heap_usage, external_usage, internal_usage;
-	char *drv_name = filp->minor->dev->driver->name;
+	char *drv_name = "amdxdna_accel_driver";
 
-	drm_printf(p, "drm-engine-npu:\t%llu ns\n",
+	drm_printf(p, "drm-engine-%s:\t%llu ns\n", drv_name,
 		   amdxdna_io_stats_busy_time_ns(client));
 
 	mutex_lock(&client->mm_lock);
-- 
2.34.1

