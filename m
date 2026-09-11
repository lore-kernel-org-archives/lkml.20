Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012036.outbound.protection.outlook.com [40.93.195.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C157499F24
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141956; cv=fail; b=Ln5zDRAXbVXbjWkD9Zznf6DLtLwJLnzUhq3RKFgU310qcrSv8WKg7Bska66ax4xfVrcxIxvxKJGDDgufmuUCx+9WwmzD9kOdmcqTd3n/mSuYgr3qh5+y2BRfKHVi55QXqTyZo3RVyNJaxVTHPiCRD3Y9tGif5qyqi8g25jwHIMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141956; c=relaxed/simple;
	bh=vjZ/DDsEM0AQdB4UXIHRtR8vt+LBjeYCZgARI72cbIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gz2A6FrXklvzcsXaesrObFgx1JrtTfvF6dq4HlqPcpz0MQBYEZifJzhDL6lQ/JX66uZkuSmpMMgEebw3RiWRxZ8UKFuKCd/tZLMoyrtCUcvTiH1CR4uElA2Esep4YugbNXDbBnCTNbdt6MmHToVqyeXRIf2JFM/F38i3gXUYqAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=cVrVsscR; arc=fail smtp.client-ip=40.93.195.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="cVrVsscR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IqeN7Dzuw4E2NtwyqtyAWJLwVpF3bVf6MDfNAfOGoPCONx5SkEdpCa+Shjn/bwhSB47DHQ5xLlSn3CvksRcgCny2rVjtfUPem66xkU5dKJNjGqY7NvIH+Eqh4APjQnOiqDUWnxSDXFF38YSkFckyIKAOCDkRJh4UzMrso2RrZsRxhxJc00nwFCb/DDvoMDSY24NffeqzNg9Eiww3538rCF+yOJK7ZTOVIcqbSFWbrJfCBMEDuDrCPBxbP8KU+NAVmIPwWTcCP45aAfyWtEyZRpJLM6UQ90zgZphAE/Fl+8jsPj0m2nGLX9l8QWk15UZMIR4IVYuhmL9CVrs+fAcQWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAZYYB7R0o/UB/uQR2BPc4h0ITlhCCZ0D1KLfvSN/8A=;
 b=JL0HZvX3l/bECybrSuycJcrEZ2u+lxJds98YBAxXhqmfPjRWQ67yQS0RHEZMoC7LPPpNel7j/2jhdurEWjGtKqsIDEERXOwRcaGlFND6Ubdgh30iptI+gQnOC2hkAwuwaaMEk1LL4QGV75IRdpS0nhKGAaOjO9OdQdciCqe/Qdm9ZjX0Uae8QnM3k4sNFCXdJqs8OjdTz7JAe6Wm7HTGY0Dq+qKdroYCiPzQcoT9JJ1oyk9nLESOAxoVOdL39pboFHwAcDcwt6ljPM/pNyy02Ypn6HNJRjtUjxNQRe6uYBRivVYNNv4xCq36ObUQoG0r1ddWYDFpan2LYe6vRs7ibQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAZYYB7R0o/UB/uQR2BPc4h0ITlhCCZ0D1KLfvSN/8A=;
 b=cVrVsscRRcFmpfpMqonmGMWTe7CEIcVLGvXmKjUqGXrVckVQggrnsOfMW41WG+QS5p0wtF29efh5s7AZ6AhG2YfOiNfBXRHE6i+Orss+j6Be10XlHZMs9fDz3ggJyD96xBP0m9Qi503QKKaeGFfOPhsRvDgyMgWoYRcgJoWskbnvVJ6oz3+K1rlGNPUCyZ12/+teC29adtZ3NLjJHVY8z9H42I3hNrg5jQIsEKkh/RLgHMl5c/82XqWZGihXRnR2gSbTSvIgXQ/eTrUr/hj4wz243siJrC+syYvZC0HRi73gYf/iBxIARTiqKtyhlfGHtYB22VYhuZhiJmU0u0lnmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SA6PR03MB7878.namprd03.prod.outlook.com (2603:10b6:806:42e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 15:52:28 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 15:52:28 +0000
From: adrian.ho.yin.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v4 2/2] firmware: stratix10-svc: add Agilex5 SMMU DMA coherent support
Date: Fri, 11 Sep 2026 23:52:08 +0800
Message-ID: <f626f997145ff5aaf462604bc162207b9bb93ceb.1789141361.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1789141361.git.adrian.ho.yin.ng@altera.com>
References: <cover.1789141361.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SA6PR03MB7878:EE_
X-MS-Office365-Filtering-Correlation-Id: abc040e4-adbf-4b96-6dda-08df101cae5d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|55112099003|10067099003|11063799006|56012099006|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info:
	NJvnn7lqYK1Oy8s97i/BqdCjSyszi+bAyaCisjFl9p7jF8vuYveNU2ElG0pv3TAjli6GMAQzBRC91bAcDzkkQsa7mgknLperSkh20u7fKViOrhkkupzYbJ4nUnLkegzZ8pTy8LCpE6XZakDNNBLfwSyl1W3rezCjrexPrLcfVD++ZdImQpjS3JSbnqJt92csG1V9l7OhMadECP6KrC+6swe3FOiaS3dlgHpYdUFHFdASIZg5+wPe0jzSCPj8lMUZhLtvs30PEHquhncFk81aWQMNMAKxRGb6KcyI0eJwV9lhUMESo149w82rGS/PQj8JOBajmEC2UyXils6Vl63U8lQHIcYUh6IueiQBEeFWbXtDf/i0WPl7K87Z12/hQ5ON+Znj4KL3oUyyTh6YUDJKlwWK5606DeFb/CZiZtdlUIfDcR0OHhh97yKHKhQGxxv/8nhgXj6A2gXUMhUb7aYmiIFX2vz4rAV7MD9wbv410Q671Q49n2BLfy1lEYugqskx62J2mBPfSiILNOw7fyswZdagvYj859LofbwndbZEFgAQjBPBnWc3eX+1wjTbvFWtLGpnUsGfGVV56Eg+wVaRk14Lnhk2yz7+RVys3Lwo80xJzcHpT4p1MYjTAnZ6MlFNkiuR7zkLoVb5xwqSsWLs6gvi4R4+ZcSSdiN54Q24ZHI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(55112099003)(10067099003)(11063799006)(56012099006)(5023799004)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZIkWMciXd8ubErc6n8maIq4yeo+23ODTj/6FuHTCX1kTl9kJjsI0oxZrSdRA?=
 =?us-ascii?Q?gE4g12BNm3Hs0Js4b4ePsoIxXUNw/o9IAsXCutqBtw9wkoPcNxsRIC2xSO4m?=
 =?us-ascii?Q?fss34U8ZDCiPa6itpb5sHfVHKhBnapUXr0hSnoRJEPLHP6djFBv5xhmhZOgL?=
 =?us-ascii?Q?kou6aEeD8dJmqhl/h4YlTp57FDr1Cd5SEBtRnXc2TtCaEeUqNafaKmDidgWD?=
 =?us-ascii?Q?7Jk+23frGdd0IcjJyzALzdgF3DRupURYWB47n+zBaczEKDayIh8dC4pY8+8b?=
 =?us-ascii?Q?+OfpOHsEAbsisjHDEarYXUNc9jxEPNO6DY4kje7mX8uF7K9oJceUoDA9l+0e?=
 =?us-ascii?Q?Mrv067shEqq5oBz+PEAErfl+0umAVpIbdAZHVLsJti3eeU4AGROR3c0Q7ojI?=
 =?us-ascii?Q?66Ui7IhoTE/M/YlcOCoW5i7dw5qdiMFeEgG3HSBTgtoJtAJwa1v5Ru8i0GVy?=
 =?us-ascii?Q?JUBk+OAE5a4KRo8OvHKnY2mL4xvlIbckjiihKfDA83y9bvUg1u6uD8uOljKj?=
 =?us-ascii?Q?3Vd/CTKn+d7U8uxXgOUPq91ovrgJPg3kyLaEkbsuQNnvPg+UoBy+vY1fp5Yw?=
 =?us-ascii?Q?0XNFQdKwo+bXQDtF+Cab2eLVKa7JceBpewf2CCBkAellHqhuUVauN544L5jk?=
 =?us-ascii?Q?EeOYVlHyQnMXAineLH7GH72gKg+8n81PY6/jN0ni4KrU1Hc/xrcxWeKhd+WW?=
 =?us-ascii?Q?+kF576NvcW54bl2q4yFNRvFUL3YbPARD6Re0qJq2lu9eU/DEEQGBmZbp/u/g?=
 =?us-ascii?Q?SMQMBgFuWxJrn6gc9/HSjpQK/sbacpTQ2a04sVJAIRc3ZtLML2OiOoaRCvqI?=
 =?us-ascii?Q?IIUC2wto+c9pukgIsT/TksCvRknVOgGuJRmUrhTG4QP4RRhIubNltZYlK9do?=
 =?us-ascii?Q?3wzbNU3XP6ubrLnMmbiMNaVyndiS8ZMroRtN54yORwDESqoGA24983etyC05?=
 =?us-ascii?Q?m5FpT5Rvaime3hYNavLfkDxeCy2hei+sFbl27tzcgcaaWXWdqAsDgIYTISNv?=
 =?us-ascii?Q?6ANQav45k59dY0q2ADgHwNntnrTEIPuYMOp9VwI67cK8z9D5O4+MIDS2gEMS?=
 =?us-ascii?Q?OL8dpC+DK3rltQcqvaqnvO21h55348gjn3rBFuWou92elUoIdiPZxzXl6p/W?=
 =?us-ascii?Q?Fsrdv8GkU3Vma17Oy4NZ0ydtE0hzR/QiA4q+Dr/XwemzjJ9yk7jphI33vc8o?=
 =?us-ascii?Q?mvrGmU23gacdYGgnuteaz+wcjI/yDmMKdw4SPMBWVyZM2lmJ5zULmu0NJpLX?=
 =?us-ascii?Q?SEdrrXL/pu/s756hlwV2eeoD+71zssRtAez6l4yXxNh0tC/o6pfCskcthM5e?=
 =?us-ascii?Q?QH6e814+5+aaafS+aXEuzxpzUdRRTqYxoc8EB9cMK53/eXo804Ek/GNb08eK?=
 =?us-ascii?Q?R+P2bpKxlOJTH1a37HA3k2VBGLYFq1nz9NCSyCnBsRpnWQUf58EW2nMxIaJz?=
 =?us-ascii?Q?squ5WBfcZznM0OYv52SK6wYtjCa0AL/SPxGWlXXPNIzP6gkHRrg43JkxAD8Q?=
 =?us-ascii?Q?EdQWft6klXI3HuKU2N2Nc1RW49eXxth9NwBC3qkKh/0cNckvZcgZk30KGD86?=
 =?us-ascii?Q?HaWjGFw/RMDiQAKpwGdhJR/a5MYA+kDbds5apaM/kDcugAjZGT5mxGYc2JXK?=
 =?us-ascii?Q?yIHDQOACtS2ZizvM39o7g8J1gPXG9cYxw7y44IyLgUB6Hnkx7Liuv7z6GLVv?=
 =?us-ascii?Q?TtYwOYjqmvg7zHX9jo3e8f4opk+POiM26744YEdZLEGTsC4TRjIQ9P3qJySF?=
 =?us-ascii?Q?UEwm+noFRIa4bK7WaVz+v6OEibnjiTI=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abc040e4-adbf-4b96-6dda-08df101cae5d
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:52:28.1448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dN5rFWaWKVjb9VAwHEpBr9klY7OFLgEOBMj8FjGVaMs+y9YqgPUsGOIgWwiVR5oMjwvneGsIKD+Put/JmHUxRYLI5q/8Brhg1bayV7ssLAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7878

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

On Agilex5, DDR starts at 0x8000_0000 which is outside the SDM's
addressable range. When SMMU is active, the driver must allocate
DMA-coherent buffers and pass IOVAs (not physical addresses) to ATF.

Add SVC_SDM_DMA_ADDR_BITS (29) and SVC_SDM_DMA_ADDR_OFFSET
(0x8000_0000) to constrain IOVAs to the 0-512 MB window the SDM can
reach and to satisfy ATF's address range check respectively.

Extend struct stratix10_svc_data_mem with dma_addr, and
struct stratix10_svc_controller with use_dma_mem and dma_addr_offset.
Update allocate/free and svc_thread_cmd_data_claim() for the DMA path.

Wire the Agilex5 path in probe: require an IOMMU domain for
intel,agilex5-svc, bypass the SDM address remapper via
INTEL_SIP_SMC_SDM_REMAPPER_CONFIG, call svc_setup_dma_memory() to set
the 29-bit DMA mask, select the DMA path through stratix10_svc_pdata,
register a devm cleanup for leaked buffers, and guard err_destroy_pool
against a NULL genpool.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 drivers/firmware/stratix10-svc.c             | 229 ++++++++++++++++---
 include/linux/firmware/intel/stratix10-smc.h |  23 ++
 2 files changed, 215 insertions(+), 37 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index 643cc008808e..fa2335378536 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -7,10 +7,12 @@
 #include <linux/atomic.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
+#include <linux/dma-mapping.h>
 #include <linux/genalloc.h>
 #include <linux/hashtable.h>
 #include <linux/idr.h>
 #include <linux/io.h>
+#include <linux/iommu.h>
 #include <linux/kfifo.h>
 #include <linux/kthread.h>
 #include <linux/module.h>
@@ -48,6 +50,23 @@
 #define FPGA_CONFIG_STATUS_TIMEOUT_SEC		30
 #define BYTE_TO_WORD_SIZE              4
 
+/*
+ * SVC_SDM_DMA_ADDR_BITS - constrains the IOVA allocated by
+ * dma_alloc_coherent() to 29 bits (0x0000_0000 - 0x1FFF_FFFF)
+ * when SMMU is active on Agilex5. The SDM accesses these buffers
+ * via the SMMU using IOVAs, so the 29-bit limit keeps IOVAs within
+ * the SDM's addressable window.
+ *
+ * SVC_SDM_DMA_ADDR_OFFSET - ATF on Agilex5 distinguishes
+ * SMMU-mapped buffers from direct physical addresses by the
+ * presence of this offset. The driver adds it to the IOVA before
+ * passing the address to ATF via SMC; ATF strips it, translates
+ * the remaining IOVA through the SMMU, and the SDM accesses the
+ * underlying physical memory.
+ */
+#define SVC_SDM_DMA_ADDR_BITS			29
+#define SVC_SDM_DMA_ADDR_OFFSET			0x80000000UL
+
 /* stratix10 service layer clients */
 #define STRATIX10_RSU				"stratix10-rsu"
 #define SOCFPGA_HWMON				"socfpga-hwmon"
@@ -103,12 +122,17 @@
 
 struct stratix10_svc_pdata {
 	bool needs_psci_cpu_off;
+	bool use_dma_mem;
 };
 
 static const struct stratix10_svc_pdata psci_cpu_off_pdata = {
 	.needs_psci_cpu_off = true,
 };
 
+static const struct stratix10_svc_pdata agilex5_pdata = {
+	.use_dma_mem = true,
+};
+
 typedef void (svc_invoke_fn)(unsigned long, unsigned long, unsigned long,
 			     unsigned long, unsigned long, unsigned long,
 			     unsigned long, unsigned long,
@@ -149,18 +173,25 @@ struct stratix10_svc_sh_memory {
 /**
  * struct stratix10_svc_data_mem - service memory structure
  * @vaddr: virtual address
- * @paddr: physical address
+ * @paddr: address passed to ATF via SMC and echoed back in completion
+ *         notifications; used as the lookup key in svc_pa_to_va().
+ *         On the SMMU path this is (IOVA + %SVC_SDM_DMA_ADDR_OFFSET);
+ *         on the gen_pool path this equals the raw physical address.
  * @size: size of memory
+ * @dma_addr: IOVA returned by dma_alloc_coherent(); used to free the
+ *            mapping via dma_free_coherent() on the SMMU path.
  * @node: link list head node
  *
  * This struct is used in a list that keeps track of buffers which have
  * been allocated or freed from the memory pool. Service layer driver also
- * uses this struct to transfer physical address to virtual address.
+ * uses this struct to map the address returned by ATF back to a virtual
+ * address.
  */
 struct stratix10_svc_data_mem {
 	void *vaddr;
 	phys_addr_t paddr;
 	size_t size;
+	dma_addr_t dma_addr;
 	struct list_head node;
 };
 
@@ -296,6 +327,15 @@ struct stratix10_svc_chan {
  * @sdm_lock: only allows a single command single response to SDM
  * @actrl: async control structure
  * @psci_reboot_nb: reboot notifier for PSCI secondary CPU offlining
+ * @use_dma_mem: when true, buffers are allocated via dma_alloc_coherent()
+ *               instead of the ATF reserved-memory gen_pool.
+ * @dma_addr_offset: value added to the DMA address (IOVA) before passing it
+ *                   to ATF via SMC. ATF uses this offset to distinguish
+ *                   SMMU-mapped buffers from direct physical addresses; it
+ *                   strips the offset, translates the remaining IOVA through
+ *                   the SMMU, and the SDM accesses the underlying memory.
+ *                   Set to %SVC_SDM_DMA_ADDR_OFFSET on Agilex5 when SMMU is
+ *                   active; zero otherwise.
  * @chans: array of service channels
  *
  * This struct is used to create communication channels for service clients, to
@@ -313,6 +353,8 @@ struct stratix10_svc_controller {
 	struct mutex sdm_lock;
 	struct stratix10_async_ctrl actrl;
 	struct notifier_block psci_reboot_nb;
+	bool use_dma_mem;
+	unsigned long dma_addr_offset;
 	struct stratix10_svc_chan chans[] __counted_by(num_chans);
 };
 
@@ -377,11 +419,17 @@ static void svc_thread_cmd_data_claim(struct stratix10_svc_controller *ctrl,
 				break;
 			}
 			cb_data->status = BIT(SVC_STATUS_BUFFER_DONE);
-			cb_data->kaddr1 = svc_pa_to_va(res.a1);
+			/*
+			 * The firmware COMPLETED_WRITE response returns the
+			 * raw IOVA (without dma_addr_offset). Add it back to
+			 * match the key stored in pmem->paddr at allocation
+			 * time. dma_addr_offset is zero on non-SMMU paths.
+			 */
+			cb_data->kaddr1 = svc_pa_to_va(res.a1 + ctrl->dma_addr_offset);
 			cb_data->kaddr2 = (res.a2) ?
-					  svc_pa_to_va(res.a2) : NULL;
+					  svc_pa_to_va(res.a2 + ctrl->dma_addr_offset) : NULL;
 			cb_data->kaddr3 = (res.a3) ?
-					  svc_pa_to_va(res.a3) : NULL;
+					  svc_pa_to_va(res.a3 + ctrl->dma_addr_offset) : NULL;
 			p_data->chan->scl->receive_cb(p_data->chan->scl,
 						      cb_data);
 		} else {
@@ -1052,6 +1100,38 @@ svc_create_memory_pool(struct platform_device *pdev,
 	return genpool;
 }
 
+/**
+ * svc_setup_dma_memory() - configure the device for dynamic DMA allocation
+ * @pdev: pointer to service layer device
+ *
+ * Called instead of svc_get_sh_memory() + svc_create_memory_pool() when
+ * the device is behind an SMMU. Sets a 29-bit coherent DMA mask so that
+ * every subsequent dma_alloc_coherent() call yields an IOVA within the
+ * first 512MB (0x0000_0000 - 0x1FFF_FFFF). The driver then adds
+ * %SVC_SDM_DMA_ADDR_OFFSET to the IOVA before passing it to ATF; ATF
+ * strips the offset and uses the SMMU to translate the IOVA to the
+ * underlying physical memory for SDM access.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+static int svc_setup_dma_memory(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(SVC_SDM_DMA_ADDR_BITS));
+	if (ret) {
+		dev_err(dev,
+			"failed to set %u-bit DMA mask: %d\n",
+			SVC_SDM_DMA_ADDR_BITS, ret);
+		return ret;
+	}
+
+	dev_info(dev,
+		 "SMMU enabled: using dynamic DMA allocation (IOVA range 0-512MB)\n");
+	return 0;
+}
+
 /**
  * svc_smccc_smc() - secure monitor call between normal and secure world
  * @a0: argument passed in registers 0
@@ -1958,34 +2038,50 @@ EXPORT_SYMBOL_GPL(stratix10_svc_done);
 void *stratix10_svc_allocate_memory(struct stratix10_svc_chan *chan,
 				    size_t size)
 {
+	struct stratix10_svc_controller *ctrl = chan->ctrl;
 	struct stratix10_svc_data_mem *pmem;
-	unsigned long va;
-	phys_addr_t pa;
-	struct gen_pool *genpool = chan->ctrl->genpool;
-	size_t s = roundup(size, 1 << genpool->min_alloc_order);
+	struct gen_pool *genpool;
+	dma_addr_t dma_addr;
+	size_t s;
+	void *va;
 
 	pmem = kzalloc_obj(*pmem);
 	if (!pmem)
 		return ERR_PTR(-ENOMEM);
 
-	guard(mutex)(&svc_mem_lock);
-	va = gen_pool_alloc(genpool, s);
-	if (!va) {
-		kfree(pmem);
-		return ERR_PTR(-ENOMEM);
-	}
+	if (ctrl->use_dma_mem) {
+		va = dma_alloc_coherent(ctrl->dev, size, &dma_addr, GFP_KERNEL);
+		if (!va) {
+			kfree(pmem);
+			return ERR_PTR(-ENOMEM);
+		}
+
+		pmem->vaddr = va;
+		pmem->paddr = dma_addr + ctrl->dma_addr_offset;
+		pmem->dma_addr = dma_addr;
+		pmem->size = size;
+	} else {
+		genpool = ctrl->genpool;
+		s = roundup(size, 1 << genpool->min_alloc_order);
 
-	memset((void *)va, 0, s);
-	pa = gen_pool_virt_to_phys(genpool, va);
+		va = (void *)gen_pool_alloc(genpool, s);
+		if (!va) {
+			kfree(pmem);
+			return ERR_PTR(-ENOMEM);
+		}
+
+		memset(va, 0, s);
+		pmem->vaddr = va;
+		pmem->paddr = gen_pool_virt_to_phys(genpool, (unsigned long)va);
+		pmem->size = s;
+	}
 
-	pmem->vaddr = (void *)va;
-	pmem->paddr = pa;
-	pmem->size = s;
+	guard(mutex)(&svc_mem_lock);
 	list_add_tail(&pmem->node, &svc_data_mem);
-	pr_debug("%s: %s: va=%p, pa=0x%016x\n", __func__,
-		 chan->name, pmem->vaddr, (unsigned int)pmem->paddr);
+	pr_debug("%s: %s: va=%p, addr=0x%016llx\n", __func__,
+		 chan->name, pmem->vaddr, (unsigned long long)pmem->paddr);
 
-	return (void *)va;
+	return va;
 }
 EXPORT_SYMBOL_GPL(stratix10_svc_allocate_memory);
 
@@ -2007,8 +2103,13 @@ void stratix10_svc_free_memory(struct stratix10_svc_chan *chan, void *kaddr)
 		if (pmem->vaddr != kaddr)
 			continue;
 
-		gen_pool_free(ctrl->genpool, (unsigned long)kaddr, pmem->size);
-		pmem->vaddr = NULL;
+		if (ctrl->use_dma_mem) {
+			dma_free_coherent(ctrl->dev, pmem->size,
+					  pmem->vaddr, pmem->dma_addr);
+		} else {
+			gen_pool_free(ctrl->genpool,
+				      (unsigned long)kaddr, pmem->size);
+		}
 		list_del(&pmem->node);
 		kfree(pmem);
 		return;
@@ -2073,6 +2174,7 @@ static void psci_cpu_off_teardown(struct stratix10_svc_controller *ctrl)
 static const struct of_device_id stratix10_svc_drv_match[] = {
 	{ .compatible = "intel,stratix10-svc", .data = &psci_cpu_off_pdata },
 	{ .compatible = "intel,agilex-svc",    .data = &psci_cpu_off_pdata },
+	{ .compatible = "intel,agilex5-svc",   .data = &agilex5_pdata },
 	{},
 };
 
@@ -2083,14 +2185,38 @@ static const char * const chan_names[SVC_NUM_CHANNEL] = {
 	SVC_CLIENT_HWMON
 };
 
+static void svc_data_mem_cleanup(void *data)
+{
+	struct stratix10_svc_controller *ctrl = data;
+	struct stratix10_svc_data_mem *pmem, *tmp;
+
+	guard(mutex)(&svc_mem_lock);
+
+	list_for_each_entry_safe(pmem, tmp, &svc_data_mem, node) {
+		dev_warn(ctrl->dev, "leaked svc buffer %p, freeing on unbind\n",
+			 pmem->vaddr);
+		if (ctrl->use_dma_mem) {
+			dma_free_coherent(ctrl->dev, pmem->size,
+					  pmem->vaddr, pmem->dma_addr);
+		} else {
+			gen_pool_free(ctrl->genpool,
+				      (unsigned long)pmem->vaddr, pmem->size);
+		}
+		list_del(&pmem->node);
+		kfree(pmem);
+	}
+}
+
 static int stratix10_svc_drv_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct stratix10_svc_controller *controller;
-	struct gen_pool *genpool;
+	struct gen_pool *genpool = NULL;
 	struct stratix10_svc_sh_memory *sh_memory;
 	struct stratix10_svc *svc = NULL;
 	const struct stratix10_svc_pdata *pdata = of_device_get_match_data(dev);
+	struct arm_smccc_res res;
+	bool use_dma_mem = false;
 
 	svc_invoke_fn *invoke_fn;
 	size_t fifo_size;
@@ -2101,18 +2227,38 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 	if (IS_ERR(invoke_fn))
 		return -EINVAL;
 
-	sh_memory = devm_kzalloc(dev, sizeof(*sh_memory), GFP_KERNEL);
-	if (!sh_memory)
-		return -ENOMEM;
+	use_dma_mem = pdata && pdata->use_dma_mem;
 
-	sh_memory->invoke_fn = invoke_fn;
-	ret = svc_get_sh_memory(pdev, sh_memory);
-	if (ret)
-		return ret;
+	if (use_dma_mem) {
+		if (!iommu_get_domain_for_dev(dev)) {
+			dev_err(dev,
+				"SMMU is required for agilex5-svc but no IOMMU domain found\n");
+			dev_err(dev,
+				"Ensure the SMMU node is enabled in the device tree and 'iommus' is set for this node\n");
+			return -ENODEV;
+		}
 
-	genpool = svc_create_memory_pool(pdev, sh_memory);
-	if (IS_ERR(genpool))
-		return PTR_ERR(genpool);
+		invoke_fn(INTEL_SIP_SMC_SDM_REMAPPER_CONFIG,
+			  INTEL_SIP_SMC_SDM_REMAPPER_BYPASS,
+			  0, 0, 0, 0, 0, 0, &res);
+
+		ret = svc_setup_dma_memory(pdev);
+		if (ret)
+			return ret;
+	} else {
+		sh_memory = devm_kzalloc(dev, sizeof(*sh_memory), GFP_KERNEL);
+		if (!sh_memory)
+			return -ENOMEM;
+
+		sh_memory->invoke_fn = invoke_fn;
+		ret = svc_get_sh_memory(pdev, sh_memory);
+		if (ret)
+			return ret;
+
+		genpool = svc_create_memory_pool(pdev, sh_memory);
+		if (IS_ERR(genpool))
+			return PTR_ERR(genpool);
+	}
 
 	/* allocate service controller and supporting channel */
 	controller = devm_kzalloc(dev, struct_size(controller, chans, SVC_NUM_CHANNEL),
@@ -2127,9 +2273,17 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 	controller->num_active_client = 0;
 	controller->genpool = genpool;
 	controller->invoke_fn = invoke_fn;
+	controller->use_dma_mem = use_dma_mem;
+	controller->dma_addr_offset = use_dma_mem ? SVC_SDM_DMA_ADDR_OFFSET : 0;
 	INIT_LIST_HEAD(&controller->node);
 	init_completion(&controller->complete_status);
 
+	if (use_dma_mem) {
+		ret = devm_add_action_or_reset(dev, svc_data_mem_cleanup, controller);
+		if (ret)
+			goto err_destroy_pool;
+	}
+
 	if (pdata && pdata->needs_psci_cpu_off) {
 		controller->psci_reboot_nb.notifier_call =
 			psci_cpu_off_reboot_notifier;
@@ -2237,7 +2391,8 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 err_free_notifier:
 	psci_cpu_off_teardown(controller);
 err_destroy_pool:
-	gen_pool_destroy(genpool);
+	if (genpool)
+		gen_pool_destroy(genpool);
 
 	return ret;
 }
diff --git a/include/linux/firmware/intel/stratix10-smc.h b/include/linux/firmware/intel/stratix10-smc.h
index 366309260121..b0d42d585a75 100644
--- a/include/linux/firmware/intel/stratix10-smc.h
+++ b/include/linux/firmware/intel/stratix10-smc.h
@@ -813,4 +813,27 @@ INTEL_SIP_SMC_FAST_CALL_VAL(INTEL_SIP_SMC_FUNCID_FPGA_CONFIG_COMPLETED_WRITE)
 #define INTEL_SIP_SMC_ASYNC_FUNC_ID_RSU_NOTIFY (0xEC)
 #define INTEL_SIP_SMC_ASYNC_RSU_NOTIFY \
 	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_RSU_NOTIFY)
+
+/**
+ * Request INTEL_SIP_SMC_SDM_REMAPPER_CONFIG
+ *
+ * Sync call to configure the SDM address remapper. On Agilex5, the remapper
+ * must be bypassed when the SMMU is active to avoid conflicts with IOMMU
+ * address translation.
+ *
+ * Call register usage:
+ * a0: INTEL_SIP_SMC_SDM_REMAPPER_CONFIG
+ * a1: INTEL_SIP_SMC_SDM_REMAPPER_ENABLE or INTEL_SIP_SMC_SDM_REMAPPER_BYPASS
+ * a2-7: not used
+ *
+ * Return status:
+ * a0: INTEL_SIP_SMC_STATUS_OK
+ * a1-3: not used
+ */
+#define INTEL_SIP_SMC_FUNCID_SDM_REMAPPER_CONFIG	513
+#define INTEL_SIP_SMC_SDM_REMAPPER_CONFIG \
+	INTEL_SIP_SMC_FAST_CALL_VAL(INTEL_SIP_SMC_FUNCID_SDM_REMAPPER_CONFIG)
+#define INTEL_SIP_SMC_SDM_REMAPPER_ENABLE		0
+#define INTEL_SIP_SMC_SDM_REMAPPER_BYPASS		1
+
 #endif
-- 
2.49.GIT

