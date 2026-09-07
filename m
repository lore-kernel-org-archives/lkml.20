Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010008.outbound.protection.outlook.com [52.101.61.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2E8448399;
	Mon,  7 Sep 2026 08:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769773; cv=fail; b=CDrjfHMieIMFu9FAy+lihhwdgCkoauQuSWcD+B0mP3gn7T9x7VjMytGkGbhY3O+cXBcXyuaEhPRD8SJJsoQSfhBsacO9eidkxpffjqxnqsb841eo8/9J4D7KtqGZUNWqfQi6FAmPk/rjB/UA+sGVxMYro25v+DJEuwK0SdYudNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769773; c=relaxed/simple;
	bh=gI3JNoWGbuclnklgauIuzyum56MCYo3DcatLCITsXu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tRaCoYhtFpI1T6hRRgIhwOnxn5fA+13v0EwKUieMF1+wlcN7UcivxYPmIBq6feRow7lr85r+zRnvUcrikFxauPMvwDASkc6Vza0WA/s7jZmAHQHvJ0ts4/opMwYwVY5seaISiuyrc/e4dmgXa5p+O5E0lQawhStSBXcWBShvTDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=NfMX7qMz; arc=fail smtp.client-ip=52.101.61.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="NfMX7qMz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i6ZRCSfPgtmqoTf8GQEW88CGuloHTHlJbOE7M/vTRdwX0QJoz1xZte4/ZovQjl7hNNH93sSZAs9VweBLyKeS4dxUoZRezsuu64moXOVxfHDPrA6PEERIc0Qey/oLnfkfs6SfkRaUa/JKAgGlxDiworCfOlBK2LZlC1DmKki2pX+GSbzmvqkNYu/eAb1fB/cgxBWM7M1Fr2wnej3WvRrATCw+iiCA7+3J7G+E7KSxyUUfCDHL46bi0bYgki3TKnvZcXLgKLq9NlaLQT0t+PCSSENB1jXWaEjbgOFMNKoTGmVdZnT+g1rQZYe977yNQYaDrkxyPKAjepCwe9Po4+AYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+RfoZJlWax6qqGP3EUxzt8uht6KP1PvZjATXl+dBTcY=;
 b=mTf+0C1NyBpfhCZtOBE0IIeaV7dFfO8NGbDcO1ija9+8yvCH9e5/P+FO1wbIw6Ef1WG4JD0zziVtChXGDopNoMiGhA24PG52ez9TI6S5gorFPwFP04GwTS+POahru2vURWNNP+xuuVrx3ZYXeROw+8MlW9634+5wTh/024LvBIv05o9HHsJPuaUQWyEGPhqV62aibDnOpm4pZa0npFE35sYAwEfKcth3CJ23n6VKjjw8+PhL3NF9XqEahpRrS1BKclSTh4mbY1288IEHJYQzvPCLUeUyWSx9kJHt+QSOvnxmNZBvbYrjXgDUGqC1KYTVYkZHjWN9L+LpgRbKsF/D8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+RfoZJlWax6qqGP3EUxzt8uht6KP1PvZjATXl+dBTcY=;
 b=NfMX7qMzBzQXF5FnhX7fNe369pmQyCWhBLdBsFpiXE3fKPOyxnWX8vKEJU5RQdkCnIHH7WXDK+zJQE64wZtWycKM1KGYumoVYpfthGumspCzA0+GW3wKlHOAr3mtdsZSjbf+TofzVh++X6tquzzBsgFkwK/h7qc4epGuAGwFG7FRfA+x83JMuWDRKTvD8mSciqoE2GJ3TMUGvRhlNZMF4iNYif9haJxSSl19xNcDAQiYavVNVBhnZIUdaUQM/NNcQNemjxmVlKlNsLDlxzmOXtcwEE1Fh6Yiq7rsrLPNLrYzfKvZVrV4sRW/GsZflpqRLTRt5hirazLHDLuGugjHZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 DS2PR03MB8372.namprd03.prod.outlook.com (2603:10b6:8:32f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.15; Mon, 7 Sep 2026 08:29:27 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 08:29:27 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v3 4/4] firmware: stratix10-svc: enable Agilex5 SMMU support in probe
Date: Mon,  7 Sep 2026 16:20:27 +0800
Message-ID: <20260907082203.2639395-4-adrian.ho.yin.ng@altera.com>
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
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|DS2PR03MB8372:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bf40da7-7094-4f1b-c2e9-08df0cba20fb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|6133799003|10067099003|56012099006|5023799004|11063799006|22082099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	twtWOsRqE6Kb3YS5kBGwf4MQipSdpoK0WccA+M8zeyY61B6ea8jIegk6BX/8sgHB75072Nz0awFdSipuSVrHCC0g+4c1AkPXncHaxxdROonTM7wvY5RNfy4v+3lIcOO56bqT/k+EcMwuyrp1KFn7ua7vEPJVRPCqPTQiHPGsatPBIusWULS7GGE6i7a/9eQSixLczcKs1IpcUP6//QQTsLnXcQdRzYd4A2dabKfIMRr0rePFDGfBhMl8iTfbl5uCtXYP3R2s8jCavutvF6fYzF90pXIrrAjvivcN+pJM0R+jPHfRbGDgjZhuxpNp8Voj71mKeAxN83MpC8proeaOOpy54Js41/+I79kXc3ehDiIfVSCFLttDUL2EOfhofBsKsRo1rJih5Vb2bpgmVJVxKXZyFkSB8wiPao5oU64bNYLqRF1MjBPYsPlGHomX1dyUAF0fsxUQPdbXXse2Q4N9IshoCjqc0tsooHDP9S2fpuUutA+fFFFsLzxIFxT119zRoG2sYnslv20+K0QgVkzmXnJtdhb9V7b0UjhXumj3kw5vLXKFVaZ/yBcoXqwB3aCBjozKkJUlGn3p+jAE94WCswegpKiTqgsUxQkSWbxn++eLQdtkt08MfvP+B7LHiJUSbEv/MjrQ/Iu9dn58QNjEZtrVcW+ivUD7gBnvmhGQZCc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ct9Y7uMt4EWFhpOwXaq3v3Jh9R8TnCa/eB5Pj/2mTcTUqDozknTrZwTaaBMJ?=
 =?us-ascii?Q?8U143SFy5M9DDKUcqN8ZZRsOyReDS+XgA/ocYQKf2QbsVT9cYUxL4BIqOx36?=
 =?us-ascii?Q?z7iAplQW1WiusQpW09t0fCAPZCVFh5jKelXIxgcEbSo90T4ZJ7uXrasuw1zs?=
 =?us-ascii?Q?McGXfB58Hb7si75N85P/qDtnhEuPs5saqnsnvVeqDxedtG38nC/LMJzuNqI9?=
 =?us-ascii?Q?GIXpKdjJKxZT6uTqhozzf3qjnhUHMJrgpMXbVDnueH89NgW20pg4iHnaTdtJ?=
 =?us-ascii?Q?SO0sMB3I8RmnPJ2VXwOLbxjg32Xbn5Onfglr4g3ELeR+umTBpSehfY+h2c7s?=
 =?us-ascii?Q?AqoxSkl4Zbg1yuX8Ut18Tcz3C1LVgYr3c8GEN3ncAidh/9KTFA8g2iiayab8?=
 =?us-ascii?Q?iwRY68rCm6xkLPOSGvvEJwKypfj7YPEVofC0AsYeDx/AtmB5wk697cvebRAZ?=
 =?us-ascii?Q?h01hiP8tHugRxDr8YSc+OK5xT5jyqDqGQMoju4Tcp0QORgg8LCz+hcmRxlJH?=
 =?us-ascii?Q?xhBqEjLl4t1mf2VsBgbSadsQJQfsJnwdrj6WGapUqWhQ4KZ85BaWWKbIV20B?=
 =?us-ascii?Q?9TWSuMX03U3ZCa0tZJT5LsG2VVLzJEZdgIEu4jqns+r03j6005HKxLEBIVUF?=
 =?us-ascii?Q?XDbNzcvDyI0S8jatpZEVrmzRmcsWoYYpFXYNj8W8KS1D5lpG/5Z2STuz9dgJ?=
 =?us-ascii?Q?kEg0ubGQ6MWAM9Qgcc4Vauj0GIRvdCqLoN0f06xGAv1qvp31EU/PJR/DOn1F?=
 =?us-ascii?Q?1qk9jAqdU+q5BJkKoCs0TqUjkxXxy4M269IIiNxQ6Ifly+4WZljY3vvtUHU1?=
 =?us-ascii?Q?hOHOOfkq5HbrfG5CdhTFkmLK+6s/DO6o5cbYS6zjCSLu/UNlygBmG1Z4/616?=
 =?us-ascii?Q?xO1/5maP1CPeAPszLciPxnDraL0HCdUuurwNSl3aaF333+KBVQLJreQxqITW?=
 =?us-ascii?Q?smeUwDwme72E0xOa4HvVUJAmufYhIlMct4k10ZdyxzYyTm4upmRV2sQebATx?=
 =?us-ascii?Q?zFG9zDABcrzmfBzF9xlTTm9OuTEynt2k1EZLgCl8NpOBmEGOnQL+VGMrWU7V?=
 =?us-ascii?Q?EXMTQ9HQ0/eey7yd/HFsR71XyeatkkwOApxGOM9ULY5KeUM1ba7QHx3dCbXP?=
 =?us-ascii?Q?GLcfgSgpg/JPqpt0Uxjs4BUAILRbZUXN3GCV3qDPMIWo1g34mWZTDqYVi1id?=
 =?us-ascii?Q?fwwGvd4g2bqNdW/4IhRcLNAhKnbMRrYyxbAXzi4JGaly8efcEKiHhQQTFlZt?=
 =?us-ascii?Q?LwVHmzexpoPxJ5tu1VzQm8h/HC2H5mB2eF2fS+gPlfNKRRt9Bu3sDpm+IlRv?=
 =?us-ascii?Q?DJUo4KUbA/grBHtIc+1+R3z+Yne5Zo8q9hiRl0pTEzuUGnHm96vitACGfYJY?=
 =?us-ascii?Q?Iu9+2ALvw8rJlRyYm4Espy4wUXWhi83LVIMDZYVNQltSTUWFEx5vt+YVF8Az?=
 =?us-ascii?Q?PbempbPSKuCneRis6HWOoQyuNIvovZJKg39Fma8Gg4GpfTENdiNP12nuN5An?=
 =?us-ascii?Q?UCv9iumfzgZqw0J6w/Pll5QuaPEv11D6Gn2vqtO6HOWrbNiXewTZAp1w8NKO?=
 =?us-ascii?Q?kLNMpUnKKJ/wwNFFDLk9SbfAPQwMuB9K1ymnuvBkahjCY7+9gHtM/G+en4S/?=
 =?us-ascii?Q?TZiLqVK28627SvE99j0pj5sRp22RRuSE09QvAVrdt2wAOhmME86up+eE1v1l?=
 =?us-ascii?Q?ABo4fDlpIq9ls17r+7Sh7JzPX4r9rpn6aM5dSKwKSs63YOZiujrsxW59jSfE?=
 =?us-ascii?Q?3INXK0Cgyj/pNHVjY4vgK2udLokXal0=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf40da7-7094-4f1b-c2e9-08df0cba20fb
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:29:27.1287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8vbAYX7UN9/MWxRDVMr5arfXVgt9EpxSsZUu9It5MwvwzuxuQhKIAN8dhPLvC0BGeANPQS2hxk1DZQPiicyTE7wt527rvnQqXDVo0478JlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR03MB8372

Wire up the Agilex5-specific path in stratix10_svc_drv_probe().

Add INTEL_SIP_SMC_SDM_REMAPPER_CONFIG to stratix10-smc.h and issue
INTEL_SIP_SMC_SDM_REMAPPER_BYPASS from probe. On Agilex5 REV B the
hardware SDM address remapper must be bypassed when the SMMU is active
so no extra offset is applied on top of the IOVA translation.

Extend stratix10_svc_pdata with use_dma_mem and add intel,agilex5-svc to
the of_device_id match table with that flag set. Probe reads the flag via
of_device_get_match_data() so it shares the same pdata mechanism used for
needs_psci_cpu_off.

On Agilex5, DDR starts at 0x8000_0000 which is outside the SDM's
addressable range, making the SMMU mandatory. Fail probe with -ENODEV
if no IOMMU domain is attached to the device.

Register svc_data_mem_cleanup() as a devm action on the DMA path to
free any buffers leaked by service clients on driver unbind. Guard
err_destroy_pool against NULL genpool for the early-exit DMA path.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 drivers/firmware/stratix10-svc.c             | 83 +++++++++++++++++---
 include/linux/firmware/intel/stratix10-smc.h | 23 ++++++
 2 files changed, 94 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index d790ae239cf4..fa2335378536 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -122,12 +122,17 @@
 
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
@@ -2169,6 +2174,7 @@ static void psci_cpu_off_teardown(struct stratix10_svc_controller *ctrl)
 static const struct of_device_id stratix10_svc_drv_match[] = {
 	{ .compatible = "intel,stratix10-svc", .data = &psci_cpu_off_pdata },
 	{ .compatible = "intel,agilex-svc",    .data = &psci_cpu_off_pdata },
+	{ .compatible = "intel,agilex5-svc",   .data = &agilex5_pdata },
 	{},
 };
 
@@ -2179,14 +2185,38 @@ static const char * const chan_names[SVC_NUM_CHANNEL] = {
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
@@ -2197,18 +2227,38 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
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
+
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
 
-	genpool = svc_create_memory_pool(pdev, sh_memory);
-	if (IS_ERR(genpool))
-		return PTR_ERR(genpool);
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
@@ -2223,9 +2273,17 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
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
@@ -2333,7 +2391,8 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
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

