Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794375662;
	b=faluyeCQBRuHV7rbJKsj2tM1+Pg1+IyH5Loi2/VpFpNgcF33prbfOTa/szOut0NoF+t/
	 Ap8S+CP3lLbJ+tyRfzn0Bls8xaXZQyXvly19FmyQiENvxRaa1r1aWRUJnKRZBFvH7dmd8
	 wBCWOUIoIJlUm5CIY7zf/66XHrgzeqXNvJ3ud6MW+YWFVPjinDU5+BMHOpPVRyQhjKT2E
	 oOEQFknUlSP7NIbmsaIfiFra0HlTChb+M3HigWfbFxbicqLsBGvmjRhcY1pZHm/wgzmt3
	 Bnh9ABG4FIbwUpk6/MuQO087KeYGuXdVjoqhXi8/iZyYPYsSoV3Ghudi4FVmfTuhlyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794375662;
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
	bh=KncumuSMsaLpZl+aCcQg7R/io8iaDV2qO0WnqdlSKhA=;
	b=LTqx7ap2gZ+nU+1+HHAFnXbVkqvygYaQNuoOKPJufehfMQsG1fp7tU5qs4kbDR0XOuIN
	 i1Sa5mti00YCslOwZMc1ZLGBwOv1fy50cK93RDXVMdraxMhL+7oW2CS/oNI0XH0ESEwd3
	 ISzs3dttcWZxwvWSDedJkv1MTa9dKV8CY3HoMXqCmmPCIp/Y/vpcGkWUggg2Tj+s4JJDh
	 Q6NN7eEOstMuKiuyPWdKoFvVqYIdVeGMnx1EO1sJUwKzhNhnFZvkTS3HIOiR+PV8KrMjz
	 fUsbKHRQQUirlE1wgA67DT68s+Uz7CIZCBSQmBdKno9BGAH0sa6N0cIcwbAZNb90Rew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lEtwmuia;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.36
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010036.outbound.protection.outlook.com [52.101.193.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2562E606A31C;
	Wed, 11 Nov 2026 05:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2562E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lEtwmuia
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vr9TAM+jo4iNBwrCCaPeDQ6S4IA/S8jGoHezC17d+G92KlLlAaDz7v151aX6qEyJpjgNdWfl43KPNI9P2IobCBkc1oBQvwisKqrYX3l+LzSPTty185g3ItNe67Orp/vYKNzChoRhiuaUvOz5tb4ccLYSza/v08fV5ckbPSM855UxoL27SoFlXRESy7VQesoEYpUqOT7ouYTHpp2N6mE3dnvXCQipqB8pyHtiCsdsBt8dHhCWGXhJcKjnYs1LhIqx6uqXslzdmdGKLQQdCoflSwUfsJ2wG98fXyzYKCX2LZhS7JsTVDL7QQL5QAqiA1FZ21Q8lZc3jGvk1I6kbJFnNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KncumuSMsaLpZl+aCcQg7R/io8iaDV2qO0WnqdlSKhA=;
 b=JUPGcXaZBc/zI2fnX4IFy848Tui8Gwr/3ywQ2FzTKtlZeRm09yk1/yXAXY3wIEUm3eUa/67UHXZSTbCJK6jm+0fJTUZr7y236B5I5ev/SVIPHu5D7TpQyy59OICKaKSA3XWQhT4yI57dzqyvLgduVat+P2A3n6W1gu5XmthvavkdzpOruL2R7Brc5XIiSRSwXjcY/jMLecY0SQGJ8kDGVAHzaRPQBkjbPb7Nyi6u9CJ616TlWaqSRFkXVc527fnXgflcYw0p77RUbHC6zUKtDXepKaVRz/ydR7aYMGh6qLLgZNKK99bH7ugEGSpLuChxaMAhwUvg09ki7h6+9UOa1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KncumuSMsaLpZl+aCcQg7R/io8iaDV2qO0WnqdlSKhA=;
 b=lEtwmuia2AttX1bLFwURKYMJ6hwIcu8ru644/kHyXM/vpZeIuyWySg3eOML7zDelGu0VP3VbQjm6TyUUqmRUlYWUv9H45eGyMbeLu4N3a8KlaCrzmaEChyPI7kS1DDXpknvaoGj3QrLelrpk2v1zCsyjvsrDAyvIOHNkiTCwVvo=
Received: from BN0PR07CA0024.namprd07.prod.outlook.com (2603:10b6:408:141::33)
 by PH8PR12MB6844.namprd12.prod.outlook.com (2603:10b6:510:1cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 05:40:56 +0000
Received: from BN3PEPF00022BCD.namprd03.prod.outlook.com
 (2603:10b6:408:141:cafe::7c) by BN0PR07CA0024.outlook.office365.com
 (2603:10b6:408:141::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 05:40:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BCD.mail.protection.outlook.com (10.167.248.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 05:40:56 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 10 Nov
 2026 23:40:53 -0600
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: <arnd@arndb.de>, <gregkh@linuxfoundation.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <linux@roeck-us.net>,
	<naveenkrishna.chatradhi@amd.com>, <Anand.Umarji@amd.com>, Prathima Lk
	<Prathima.Lk@amd.com>, Akshay Gupta <Akshay.Gupta@amd.com>
Subject: [PATCH v1 1/3] misc: amd-sbi: use sized DMA-safe I3C tx/rx buffers
Date: Wed, 11 Nov 2026 11:10:32 +0530
Message-ID: <20261111054034.2453874-2-Akshay.Gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCD:EE_|PH8PR12MB6844:EE_
X-MS-Office365-Filtering-Correlation-Id: 1866f91f-b082-4540-cdf6-08df3fb65bdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261026121527099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	G35+d0WUjq100eJOwhcNEOSfQLgZVyXoBCarqbeVkqOPSf3jlJk+ib7hQokQN7jG1TbT475Pf61vEkBgS7d3EfvQ/XyQIlooZ134uvJHH/Z4LjQDo5U84ecnY3mxyUwyUeMerd9d29HFW33jXP024T9e48cJng3NiQZQfxypfzRxnpaP9XTPSYPPyOLeclUZ5eFsBxNQdQGCLbT+t5RsZe0DMX6MvKnrbvLBX/eteKqzoVg5TgzII22/RQHYZu4xogw8Qt2joojUvK1aYFLf+h+5NlXpm+uZxSLrPG0cc1qzRVaTt/N0BvmF6TWcujsF+zBYTMRSGO90KQbEFbmHjEKAZtGC7lk9tA3pVxIPlIRj+SjXjXDdTR0fWSqaUgLA6n534/k8SeeO1BNcMzu/sjHuBxcf0v17L7wscbXSAoMPAu4yzAmpXlSmwNWw73R30N1N6hpv4PtKH5WIxFAS10dSP9wIypRbg5EhQMYgnIJevM5/bC3hZFIvV8Kwq9BKVvdqFXfRG0kI02NkgHOSz6ViqJZ9NJ8Fe5uMAI1nulHUob9j7O3ODxoRhmcagkE7Ufv8ZrCEXj6+jxXxgVWFLEZfeIQuCddNkhQw/KEZ2uQJ2FVzjr1tv9hY7fzO/oDnDjeogY3eikQYClPI0CKpVlVv/ofKn9A1JWWnaIAlgyPXPrlZ8V1gxhTrAG5SBeHvinhA7l1lTM3zCB5Qp6XgJQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	93kLok8K/dIMCpK+Dd7Y42CmyvnubuII6g3oRO69PT1bv85Lqak6IrtIXgisVYQj98oNbebvkO+89G4im6fwJj/lZ2f+Es4mM2J7lsVXy9hxqZ5aJoILs7sbQTB8fgDW645HTtrgvYXcvqQfm9yydP/01HFEw7d7x6Yvi49bjAaRjfGkTo+/Ik386zXZ5UqmTUKtJ2yShC37DIkdu1YPv4ke1j0jBzxoLfz/F3ATSSGFOUbTGh1HIUJxAsl/+dj5ZHP+mI40Rj228kx+jabCmcxqDXw1XCDnbIQARUoWzHl7oKWNOd4UgrtSh/nMx2edWeFgp4UOw11AdBvnjqlVSxGgIwAyBPBADlnssa5TflMVBzQxpO272D8mlRr3xRJoYi3N2BY+r+Cy6dQll8HNZw6DSdVfb60ukYZig3UBaMcDubcl4FFl/T2XQAvLdMid
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 05:40:56.7274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1866f91f-b082-4540-cdf6-08df3fb65bdc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BCD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6844

From: Prathima Lk <Prathima.Lk@amd.com>

This change replaces the open-coded tx[2] array and single-byte scalar rx
field in struct sbtsi_i3c_priv with named, sized buffers (SBTSI_TX_LEN and
SBTSI_RX_LEN) and makes rx a proper array. The motivation is an upcoming
patch adding the SB-TSI Trace Buffer Acquire Interface, which shares the
same I3C target core and needs larger buffers. Preparing the sizes now
lets that follow-up patch grow the buffers without reworking the struct or
register access code.
Each buffer stays aligned to ARCH_DMA_MINALIGN for
DMA safety on noncoherent platforms. Affected areas are tsi-core.c and
tsi-core.h.
Tested by building the driver and verifying I3C register reads
and writes still function correctly on the target hardware.

Signed-off-by: Prathima Lk <Prathima.Lk@amd.com>
Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
---
 drivers/misc/amd-sbi/tsi-core.c | 4 ++--
 drivers/misc/amd-sbi/tsi-core.h | 8 ++++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/amd-sbi/tsi-core.c b/drivers/misc/amd-sbi/tsi-core.c
index 5c178702c67a..1920e4dc7b67 100644
--- a/drivers/misc/amd-sbi/tsi-core.c
+++ b/drivers/misc/amd-sbi/tsi-core.c
@@ -60,13 +60,13 @@ static int sbtsi_i3c_read(struct sbtsi_data *data, u8 reg, u8 *val)
 	/* Read the data byte into a separate buffer (DMA_FROM_DEVICE). */
 	xfers[1].rnw = true;
 	xfers[1].len = 1;
-	xfers[1].data.in = &priv->rx;
+	xfers[1].data.in = priv->rx;
 
 	ret = i3c_device_do_xfers(data->i3cdev, xfers, 2, I3C_SDR);
 	if (ret)
 		return ret;
 
-	*val = priv->rx;
+	*val = priv->rx[0];
 	return ret;
 }
 
diff --git a/drivers/misc/amd-sbi/tsi-core.h b/drivers/misc/amd-sbi/tsi-core.h
index 4cf55c46230e..8efe7e220f4a 100644
--- a/drivers/misc/amd-sbi/tsi-core.h
+++ b/drivers/misc/amd-sbi/tsi-core.h
@@ -11,6 +11,10 @@
 #include <linux/cache.h>
 #include <linux/misc/tsi.h>
 
+/* SB-TSI register access transaction sizes in bytes. */
+#define SBTSI_TX_LEN	2	/* [0] register address, [1] value */
+#define SBTSI_RX_LEN	1	/* single data byte */
+
 /**
  * struct sbtsi_i3c_priv - per-device state for I3C SBTSI (includes DMA-safe buffers)
  * @data: public device state exposed via dev_set_drvdata()
@@ -19,8 +23,8 @@
  */
 struct sbtsi_i3c_priv {
 	struct sbtsi_data data;
-	u8 tx[2];
-	u8 rx __aligned(ARCH_DMA_MINALIGN);
+	u8 tx[SBTSI_TX_LEN] __aligned(ARCH_DMA_MINALIGN);
+	u8 rx[SBTSI_RX_LEN] __aligned(ARCH_DMA_MINALIGN);
 };
 
 int create_misc_tsi_device(struct sbtsi_data *data, struct device *dev);
-- 
2.34.1

