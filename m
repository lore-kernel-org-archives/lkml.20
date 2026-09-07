Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011063.outbound.protection.outlook.com [40.93.194.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C64242910;
	Mon,  7 Sep 2026 08:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769771; cv=fail; b=di5I9ZXTi/J9rBcDA+DxXdQs3R3eptUuRPD+ngVrZU1iEwtUt+dNx5Y0I2CsBPRsR75VFZi9e9nTYvIGV7sC7dE37wuYKmn4/6jRJ3sj5XkSofva2SL7CPmA/CnSwAwjb+RB4+z57cfe7VblPuC/5hZb017t7QnEm9V1cpp5bnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769771; c=relaxed/simple;
	bh=Ftroh2uRPyb47ixP93gSLtsWYTFcvjOjeyd6I/chrPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dc5I/SxL63+HvICnpa1RGIGRFBccJVMjRWcaHqDvZ8nTwjBI5LBlcpGTvwfFDCuLDZdUHbwfdGy81F7UZ898+u3XcANc9jpiB4qLfRmixTZUDs8pD3PCOu6jaoCAqVPBZRInXw+aULCarbZmSyhDbP0ZYy9qMY/QV+vsVcdivpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=wDhtJRzI; arc=fail smtp.client-ip=40.93.194.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="wDhtJRzI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHYvjPFPqqorzzjSQ54mfq/ucSZs1MNgkzkyJ76s46vTFV97fR0fvQ3nKh+q6wu60XWHDe8cSfN5Z76lNONzufNVdrb4cCmc2z8WZCuhIBBcWRE8czHL/24xZCaEgJfjZVfpAdefoiWOPlG26/mjHdfdRW5YEG1EvDNo14lujg73Vs7bYX2SXjXKuDJ2XWs7E6lAUWhoqF7+jGXvOH/SATIjfIX9fpdZmjXeY8Bbiv3K1p4M+GT6FjIGLnXVL5wHOClMZs2jyh+jNsiS6S8ALU+4WccICbUuHyJcXFDE4kNplKKDDRfiUJthNsturO02oa3a/4M+CVW5zB3kjIsjoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JkhMotFQUkfLdCyzcrerndmBQ3oLNnXIsxclNSMtTc=;
 b=ANUfSzvYOLhfdjKXy+67hW+oW+mOi4u31Qm1G6D/FLPRhIGYcqu9H3DcYTLw1OOsQ2SywRv9UpYdF1N+YTfOxsUh+XSaWotxXNRYOitoB4kE59VIgm5I7KDhEixKSiHWkD1+DQ92PyjJTVW5mlBMy6LMGMlGnRbilpR5GjUY+zMcTheA6lEp7gs/3snKo9X9PI1BrPfZ/biqULAHLi1proqy/fMJc21pAT44/4ynZpIjFyZKob2ARPgb5i1UXhAzmwKQfyrmdPuHZvH8Sb13d33WyPX1OZcygwhovrN+7XjdPl6nRiMF7kqdu+CRJVJAt7gaqNR3ExMgOJuVx7QU0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JkhMotFQUkfLdCyzcrerndmBQ3oLNnXIsxclNSMtTc=;
 b=wDhtJRzIJY0ozOCCRIIFmpHb+udR0mnfxSUmJRMVmpqdOH7XkWrAVhIUi9hUJvD9FI1j/XaEVeVRORfE18M47Ed+W7OnpSpuhj6pgqjgxtpejTpAesGKMJ3T/D+4OZn2InTa7KEWQ343zn3ZEO+wn0KMFLBfjOWoYwIQ2L7J/uOZzA5vW8GtkY+F35qHO8dHItbF4XfIf7XewOy4F6dzaWPakHBSbzIOkxi234O0bmWJYQjWXeBl95ZcfAZJ7UDt/EEqLEH5FNuTBeu6R0Ais2KZKPBkx7B9Xj9+CS4MSOvuoILIEZO5dvZ7ski0MVZsSTjlDuT1IteEGQfTc60FEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CO1PR03MB5777.namprd03.prod.outlook.com (2603:10b6:303:9c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.15; Mon, 7 Sep 2026 08:29:24 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 08:29:24 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v3 3/4] firmware: stratix10-svc: add DMA coherent memory allocation for SMMU-enabled platforms
Date: Mon,  7 Sep 2026 16:20:26 +0800
Message-ID: <20260907082203.2639395-3-adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.v3.git.adrian.ho.yin.ng@altera.com>
References: <cover.v3.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0011.namprd07.prod.outlook.com
 (2603:10b6:a03:505::20) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|CO1PR03MB5777:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d526034-7a83-4854-e186-08df0cba1f5e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	+atr5BYhrEtz3PxBIXiogasEUdn3HVTd8P0uv5yMXhs8pZAkSneHXSqukirnfyvLc277W8JCBQ4R0AGcmuB4zKuUG2HlsHqXjuSuhhfnCFeZC1n3OMRoZ/W839Lc8u9Jdg/zRfzWzY2Vpo+On3TJLEBHjt/+8wmBwn++9tkIxqi6Z0KBRgraLqTobr+E8ko+SNTx3pcT1kkPmpavaIK7/jXhjoXB1+8EKR9EHsUazYnqP8ir/MYa3QYzYcZKpy/g7LfGEg7qjoZTOBA0CFzEaz6p0tpItUk60ZyrvrsitfcTW865HDwd7ShliTkd/vKeGG9/ZB0nWTX835pyuIGS4vDU355vq9eub+qWT06uFAEyqQPPwoCJBzctZt1r4uWGsNeC1XGdCAIxJdulbXgZjq/8Z7yFGb1tNpROrcmv3biJSbmsakDjwXyuU+tyKwVGSx72NPkz37HMPlMypAelD9SJTN6Z99VIofOVgYD33tWiTeAtuW9wneympwhoWZ4kWU5WmAWsdiMefDE/8+Wd1F58UmbqlkPLla3M7V9wFWb76v7Q223j0F5Cyvp/Z0Wf8RLBHvfExx3yJqfxn1g5P+pOW1SfwGr8/vcaaelIlOsPUl7gPiuKK2ItOYrWfO7N5ry3viWkwuPZjg4FCtuBQhD1DMGvsD3lICHZ51KQhcc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eqMbl83O0LUjmxagVMj96+1XSR7wuvl+gzz1NeGPUy9rOiBlyyuywmU34b6q?=
 =?us-ascii?Q?MBWxiLpn7V6Cwv3dA8N9uTK7zrqilgRYnNjUwq7MjvXyDtJNUxRzCZlOBzSA?=
 =?us-ascii?Q?f82BVCqMW6/1RqB/I+8mZIqbKNZ6mDvbM+LelyhlS7BxOw43RKi3mk/4ttOR?=
 =?us-ascii?Q?xMuL7OYP+g3n3S+xr6nY6UZvfSIIoOvqs6UV2gheuwCXfXzTC1XH+GDom4S1?=
 =?us-ascii?Q?WYEMppuwr2HGZxJMV6VtqfRRvtc1R9s/jQfjcy9JanGJVge26hftaXDi+6/v?=
 =?us-ascii?Q?KlOjyeGnGpxxULpJYyNLS910Wdf10g6DwSZnFNS50xk7ri5Qu9tnW15HNHPE?=
 =?us-ascii?Q?MOtZMczUbP4rifQIL3MxMGzMYI2Mj72TFRNv/w9E76CQ48fdQRRGaWmMXJgL?=
 =?us-ascii?Q?Y9fZAnAoOqO7t2RgdAlObpI5QJClCnud9X6VfF/1SXHusu0odrerykusROYR?=
 =?us-ascii?Q?PJeUUJXFD56Te3xItNYB/IU27nJqMLKUEGf+eN9PlK7met8pB5nOpn0v7Mf1?=
 =?us-ascii?Q?k6SXIsTvg8Yvm/skicUPnVWKLJTr8MWX5Di2h7Ht7IyQi1y56v4WVDojxOuX?=
 =?us-ascii?Q?cSdxLXrLvw/LPnfdiXSXhQS5poN5U9K70ss7AmqnLw60T5r3QP4XkkNNQpPr?=
 =?us-ascii?Q?qVLg3zOm4pr0TptyDOOlLaYX3nVxLDhQS5MrREhh0qcfzPP1mz41hWrD7fJH?=
 =?us-ascii?Q?npHemKJhjhCkZBL1th9nv3GR/ecZEaSnxCBaqVKAGORDXamirhj7bKPRlCru?=
 =?us-ascii?Q?8/AQDWg0M86RtbY3Hp0kzUHj1RRNI/owlDHGvJ+AlZyAcTBVzfPUng/lrn4J?=
 =?us-ascii?Q?oBh4uzhbNKwmQflSP3flzU6xSjaAV8l9JpsOcBEbC4DQKiL3Lbs5bxXUeIEt?=
 =?us-ascii?Q?G5ltpjW1BzzAg7XGO0x2t7S8qhQJhnAndK4g7/orZl+o9uNvT8kY9u0ne/Aw?=
 =?us-ascii?Q?wbFbu3VskFJ9P126lGmVe+S0g94t+mz7rLiFXbMjwVQDkd9XqrifaBSYSTQs?=
 =?us-ascii?Q?lyU8FfhdeYr+vaxHfXrqsHNRkCyz61BJPHvjvuxtn8Ov1Xh1wykClume96mg?=
 =?us-ascii?Q?1l9yxEuGo4aehWwFBg8iSkoZeuNy1l6I1fPlSw7hLRkgWNnCgT2lFUIXI8ar?=
 =?us-ascii?Q?1Al+Eq5sJppeZzKQiJJ7tL0AHG6nKC6RM56PQ6s1VZFtawCLro5sB3eCN6w8?=
 =?us-ascii?Q?mzwGXB5uARkltjzXXpb9lD33zpSQYDDzDYilEoltWTp77yuzYzQ/iINtWFGX?=
 =?us-ascii?Q?wVHdcjXrmzxeEh1ah6drqLkSLtGlcWLFfX9EuzFsGmoxBlPvvlI/V+g0kkgL?=
 =?us-ascii?Q?faALFY0jcTfQC14G9TXTwJfHXqAV2zOQJk5qyCCw1s4+93JsRDraX66Od5Yd?=
 =?us-ascii?Q?3RvJTqP9VrM/fs/6GmHYyWsbQEH4AmOkpVnJXXWLcn/1l1O/tfUcAQEkewR9?=
 =?us-ascii?Q?dsv1OxLk5SCRkLSG18OZVeYjWzoyLfkPNhnrQ2SYOH6q+pOf/5VmMuitizWx?=
 =?us-ascii?Q?bl2p9fqkXSBZVCt00lBhdY9DhlJWd+D+bXa/YT4ftDt3eEl7+PoYZCabFF8v?=
 =?us-ascii?Q?sdCfPHWg255LRV4exQq0zhGIhZandPRDGo7QUUaIpZtqkxT+kO9dJE2F2HrM?=
 =?us-ascii?Q?psdZu71AYjgioPTxTj1jAUVRdMmTSMBfjhJqfzXCvsFOQO/8KzcQ6zqnNWrE?=
 =?us-ascii?Q?fUuoyd47X2mwOe1PMZ9x9T6X7NCi3j446IkG6Qfbw1Ho5YQvoEuKVTWlZoCo?=
 =?us-ascii?Q?K9zNQk+cPEfO50qp7JQmcaP1p+Ku00g=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d526034-7a83-4854-e186-08df0cba1f5e
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:29:24.3941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdiutuKjW/+8k3UHOwSIhbNTOl4qVAy2aYQ27IDh8OY8B1h02i6r3Ij6tuTVu7cxIEkW5OpI/H/wO36Gdxp/6ZJCVr8nuUGwho6t1MBswtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5777

On Agilex5, DDR starts at 0x8000_0000 which is outside the SDM's
addressable range. When SMMU is active, the driver must allocate
DMA-coherent buffers and pass IOVAs (not physical addresses) to ATF.

Add SVC_SDM_DMA_ADDR_BITS (29) and SVC_SDM_DMA_ADDR_OFFSET
(0x8000_0000) to constrain IOVAs to the 0-512 MB window the SDM can
reach and to satisfy ATF's address range check respectively.

Extend struct stratix10_svc_data_mem with dma_addr to hold the raw
IOVA for teardown, and struct stratix10_svc_controller with use_dma_mem
and dma_addr_offset to select the DMA path at runtime.

Add svc_setup_dma_memory() to set the 29-bit DMA mask. Update
stratix10_svc_allocate_memory() and stratix10_svc_free_memory() with a
dma_alloc_coherent()/dma_free_coherent() branch, and adjust
svc_thread_cmd_data_claim() to reapply dma_addr_offset when resolving
ATF completion addresses back to virtual addresses.

Both new controller fields default to zero so existing gen_pool
platforms are unaffected.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 drivers/firmware/stratix10-svc.c | 146 +++++++++++++++++++++++++------
 1 file changed, 121 insertions(+), 25 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index 643cc008808e..d790ae239cf4 100644
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
@@ -149,18 +168,25 @@ struct stratix10_svc_sh_memory {
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
 
@@ -296,6 +322,15 @@ struct stratix10_svc_chan {
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
@@ -313,6 +348,8 @@ struct stratix10_svc_controller {
 	struct mutex sdm_lock;
 	struct stratix10_async_ctrl actrl;
 	struct notifier_block psci_reboot_nb;
+	bool use_dma_mem;
+	unsigned long dma_addr_offset;
 	struct stratix10_svc_chan chans[] __counted_by(num_chans);
 };
 
@@ -377,11 +414,17 @@ static void svc_thread_cmd_data_claim(struct stratix10_svc_controller *ctrl,
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
@@ -1052,6 +1095,38 @@ svc_create_memory_pool(struct platform_device *pdev,
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
@@ -1958,34 +2033,50 @@ EXPORT_SYMBOL_GPL(stratix10_svc_done);
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
 
-	memset((void *)va, 0, s);
-	pa = gen_pool_virt_to_phys(genpool, va);
+		pmem->vaddr = va;
+		pmem->paddr = dma_addr + ctrl->dma_addr_offset;
+		pmem->dma_addr = dma_addr;
+		pmem->size = size;
+	} else {
+		genpool = ctrl->genpool;
+		s = roundup(size, 1 << genpool->min_alloc_order);
 
-	pmem->vaddr = (void *)va;
-	pmem->paddr = pa;
-	pmem->size = s;
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
+
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
 
@@ -2007,8 +2098,13 @@ void stratix10_svc_free_memory(struct stratix10_svc_chan *chan, void *kaddr)
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
-- 
2.49.GIT

