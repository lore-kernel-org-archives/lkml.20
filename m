Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011062.outbound.protection.outlook.com [40.93.194.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3D64A2A4A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529660; cv=fail; b=k9R/+lRjQw8YtRy0DnFgYklJZ3TO93Bf/bkJBaJ7IkkPLGMN7QiLxOfB7jEMw9hSNxY8WzBkN8qIWxgPvOxiuLp4WXbssPjFJjh1DD63HMUmQ8DbtvnPk7JjESHWAtQpsBzQpUHdHuhZTadTq+UVwNjge/wrg6xXa12zFuUPcqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529660; c=relaxed/simple;
	bh=B6ikz5hAbcxh2cXZlu2tB/hUkZCTH+LbCVotfRGNgos=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cnMRW4PHoK7pdkR8af7dr9nlOfZcp/Tocre/2fm92RJTFt3inwLzsnhApsz+GCz2+w15zqq0TF9IiMAzsGt6WZNaYlMQ8SD4MM/Ez9wDW3NpTiVvp4SstG/vI8kIQ343y6kBRpycWOk6gmVnRCss8cttzyqt1sBGoK0hb+6CufY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Wzuh1kR/; arc=fail smtp.client-ip=40.93.194.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Wzuh1kR/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VGpLtEH9/3sfMB0yXS3TiCWSUgXO5lAtLNz9eCk5uhe0rotpaEj75l4zvaXHRYXZSR4IxDkMcOnOJvC5K4KnDA0yDEANJg7ajlsuvkHBhoJfHa1FRGVGSlpr7V+U7cxWp1fPCmphVoYr2a07UDo30Kkb6Tq5XranwIqfhYNoVh0bHBuKGKML3dC4iStc+/M1WuWADvHFpnREu5UMbYJaQNsjQL5r+nLEDsJHw5DRpDLQWxNHkp2TtNjUHjt5RuEw9Qi+r8tf2RVp3FquAkkvxIDzgYatqOFtFCdRjYyj5PTbL/EQIEWtE/quDIqnGGlmVfAs5TwcAhN8OJYIRKIWTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsQDOKnarTwrUDGQ2U+bLqis69ZNlKfbR8RvMDybLro=;
 b=ho4jhlDBxvOli9J0iojhWi8rst7egs1kZOi3ORwFdN5FL8BY4a5Jw92fGXkHhsJD0sN6uRBRbxjYumsHjQ6rVgh4zpiAAp1/su6KUqzoArFxcvg+YDqsQn/L7g6NYxj9cxEhky7UOjaYH7SeMYVZVe4RY3IiLCdpLUJrLia15ijg0dO/UM5uCb1vDtE51utGTD5k+d9GcABpTTZE5gTWS4okeQ41psEWF83rdWlSbL+xLH69UmH69SLrtF/JJ/D2D2p8SI3ZEfTjgCxeWIEVCr1DEU250lheCaRv7Sc1Ny8Mw+LOR/pLzaXKCx3nWj8NArl9k7kpDW07mdseN8vxBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsQDOKnarTwrUDGQ2U+bLqis69ZNlKfbR8RvMDybLro=;
 b=Wzuh1kR/Ahw3XqtHT3kVGsZjTvcTmA7rbr4/xPB6MQbFs7tbjNf+2YOQeFZR4V7PACBdrexNV2aoa2qaSlrYo33Q1MAPuk65S7/Z+P56zP64FmD2K8Ha5pmZo67X87kwaJZ8I/CRpjNiOrDxMwl1Ch7D2UXHpqqAPJ0gzR9Fj6L3UHFq/iFlYZTn4LA5S6aTRkZIuPH2Pm0bjDJZyK3Zo/dCOqHrT3PedFhAiUf1S15Q1T+Ys2IlI2nPF6xQdokA94ZuIBPC92t7tCJXP7bKNXsey2L0VmNOMBgNH+7gra9ZC+FhsStzp3Rz/gGKrTK4B52/TErv/o4/cGexmsixlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB6744.namprd12.prod.outlook.com (2603:10b6:806:26c::13)
 by SJ0PR12MB7458.namprd12.prod.outlook.com (2603:10b6:a03:48d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 13:47:35 +0000
Received: from SN7PR12MB6744.namprd12.prod.outlook.com
 ([fe80::28d5:2119:63f5:9961]) by SN7PR12MB6744.namprd12.prod.outlook.com
 ([fe80::28d5:2119:63f5:9961%7]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 13:47:33 +0000
From: Mahantesh Salimath <mahantesh@nvidia.com>
To: Jens Wiklander <jenswi@kernel.org>
Cc: Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tee: optee: ffa: support shared memory offsets on large-page kernels
Date: Fri,  4 Sep 2026 13:47:32 +0000
Message-ID: <20260904134732.1072541-1-mahantesh@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0009.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::14) To SN7PR12MB6744.namprd12.prod.outlook.com
 (2603:10b6:806:26c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6744:EE_|SJ0PR12MB7458:EE_
X-MS-Office365-Filtering-Correlation-Id: f2e8a766-8db8-4548-771b-08df0a8b1274
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|56012099006|11063799006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	hKvUvLhn5336j7IHemFyBhnmoyaTxgkC37ZXBD247Lw6hya/2LcT+H+7YX0DoddCgJaq5rpHpyQYfN5fT852uJGAU6527xG5+tAOqQnqY4LixQiWpYLv+JhFmv8nuPfAbuwyKOemanKxi6lGMG0tSDzPTYpHbDcwdU4ohMIVeddtCz7UiOWoQkcXlFpm915Abnjr3sqN4heHgF65VmwayR9X6cm50d0rdfQeSO0jzq2f/RPbv9yL5NlPSg6WWWh9pU0ePH6H563fw05xUEoM6y8vEdgV6jzA460aFrsK7CVijS9waJyKk7Dt8lsiCLvN69+cux9D9cbqFwYAogm+TtOPhiK0PmHCR0pKHv4RXith8pl3guLrUrKQhO+NUuUwVFP5ZZpoUmaX+LpN3ouXV181oFYtxNUcbveeZbnzL8HDBXxFXZIaAGQDbUwzuD4JyrbxGtE+Yt1Neb0IxYz5QfD2dylc1StoyUNCQYXntXKu5sVJkppiun+BKG8kLOxnEXB38CkG5YFnz9vFZwyr8u1qGCs1XGa7WsELsKDlLI8g8PTQB1JBR0Dj7TmK3FhISdEvwg8llWte3DGRKG4jGa96nitfubIjabc6qVFNb/HqctMdhCOLUCL4OA79p4tv6JHQK/VB8OOVxobOOYg8LswOlmnH1nUHZJiTqF8WyoI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB6744.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(56012099006)(11063799006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5bSIsFPhox4nKD1MEe2Sjhg27Pjf4Cfwz4mLWjMFPfQ0mTlhZngkfiAqnb9u?=
 =?us-ascii?Q?7Gk8QEue1pkr29tVn1PiOkdASrkkx0pOdAqs5sqoXN8idqKDORtb4h71RMGT?=
 =?us-ascii?Q?Q65D11rhJXK+Vzsv/AdALkg23LTJgJJogqMkIYnTh4pTi4zyIPrbL+jkKYc9?=
 =?us-ascii?Q?LL6iuJPyUin8IJpLfi/ZuPf0w7hQQZQmu1oeKXRh0s18GafqOA5UrqhWif5F?=
 =?us-ascii?Q?MdjAzOI1OfOGZcuReGET0cttSsxQe/bJWmfsolisVNc2TbPsRaicQ50+SbFx?=
 =?us-ascii?Q?4eFbdZ830OHEEqKTWkNsEDTOKw0H4u+L92NXlWFDZS6PGg6GJZ/4Is+rh6dZ?=
 =?us-ascii?Q?4MMzaM8QMbyX58ADn4Fo1VbCO/F0GIxtSLVcFqe6jKbjbKrsXwRyRA8UQTCH?=
 =?us-ascii?Q?QPlfNTOkWTRJOK7EwfMZcRPR0fKhLpkNLVzwH0MO+UwVDPqVsDFyN1cnXtbC?=
 =?us-ascii?Q?ny0jlj3R4+SuySV0C2UscN68CPcaaOSo0FhJKcRGnfrJIp9RkMGb7e8cCDRZ?=
 =?us-ascii?Q?0RUVIn/16KS66np2HuunIrGDaAGZDVkXVWaVmjB03d2To9Dn6d5oaGJMh3AD?=
 =?us-ascii?Q?A4pNLzPqCVg3O2+2zNfcqN40IKzrwHaj25L7vy0C3xooWoI2txkTZPIOTq05?=
 =?us-ascii?Q?ZpbvMATJ47Lr0EQGb5ljd2+pqqhomylkHkunsq2fpPzVXH29QQ2Y7SpWZ05r?=
 =?us-ascii?Q?2ofbExku385OEI4nHtTz8Up/+7VKzuadADHiSTZBqwgWzQ319MYH3PTbOZ1X?=
 =?us-ascii?Q?FhweC836nqDSlbbCza75XxvRNZxB6g74qk8QY5hh6c7aIhaxX85B+Un6w+fQ?=
 =?us-ascii?Q?htVxYD8JCU6emFXEj9NWM1fv26OqNPp4ExX6/s1vUkGEBSvS3B0ogVEF69Ks?=
 =?us-ascii?Q?KrQ743ED5zImFdvPp3A27ELbOLaZGNU8lMWsIAwfqgwFiweWdUc5awxKoqcK?=
 =?us-ascii?Q?JNbYJvQuDYrYbDrH6EzRhsrUklP9ac9ZwhFjiL3L6t3AhOLuW/iVhokqX7cv?=
 =?us-ascii?Q?FqpI5um5gcpIrA3lnNHq0ZUj+qv+Yyl4nxM+aFkV9JbNn3F21fe2nw19/JiZ?=
 =?us-ascii?Q?glYjTnN6GzHrHrNEfeC/NL3hBEcFbsXj8C6sjwGzMtAOOZqAuO/zk25zqGSK?=
 =?us-ascii?Q?MRRBcwPEYLEbYGMxGhOTbFrh0Cebkkx94n4g8+s449LCs90PHFQPukJV97i7?=
 =?us-ascii?Q?09WbWbHEZufGpC5Arl1EgR8flCtD+ZN9URPErLLGx+SSQybiBMXKAbLKkHYk?=
 =?us-ascii?Q?BJALQu9eTfn3F7hfYcF9u6ZrTObIMhLmcczHolBh4hd/kJhG+lIhxi5sYm8u?=
 =?us-ascii?Q?BZd0jE3TJ7rH2wuIrOZES49Ch4L4WqkuVsjnJS3HsQ7nBqV9NBR6RBfcIne5?=
 =?us-ascii?Q?LnrgOGyLkZKOjB35rrLG0iopbWp4HIwlEIbIyqYMUf73DkISz9PaY/Zmq9vg?=
 =?us-ascii?Q?09/P4DZFkmwF6iEJF1ufOOo1dPHCpbyRgp5gST2cAQ8ifUmuIwUMWKlknh9G?=
 =?us-ascii?Q?utKrz6KsLiqfHEPocv3f5G4Gm7f+UFc+pj1LRdWzOsF9JnoJrvbTNxcgD/Qi?=
 =?us-ascii?Q?tWrOTzf2vNYhVTBxO+tdo98LPDq0ZSDOPzx4ub7jSUPTDZKLZ+PIGUHnp6SW?=
 =?us-ascii?Q?iMBYiAJsuB/S79NalQ4tdQvazHj2l3sc/EBUoqhphtAmZ3iNqrO+6fIJYRJj?=
 =?us-ascii?Q?WslvuTM6V+7sLJ+gTuvNtFwMWSM2D91T6iFFSzZd3MMhnfjr9pbbPYyiL2L/?=
 =?us-ascii?Q?YgvAMxogBw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2e8a766-8db8-4548-771b-08df0a8b1274
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6744.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 13:47:33.7874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p7wEZoCGsaKm0lrs3j32Fdi/csVmCWyGYYIan/k+C64Ye4u7AEbhx8l48qAQ+dzM9uFYgJFV/SUIOeOHtTc+Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7458

OP-TEE FF-A memory objects use 4 KiB pages, while the kernel page
size may be larger. Consequently, tee_shm->offset can be greater than
or equal to FFA_PAGE_SIZE, but OP-TEE rejects such a value in
internal_offs.

Do not encode the excess page offset in offs_low/offs_high. Those
fields describe the logical memref offset and are copied back into
tee_param->shm_offs on return. Folding the page offset into them breaks
parameter round trips when a memref is reused. They are also ignored by
the OPTEE_RPC_CMD_SHM_ALLOC response path, which uses only global_id and
internal_offs to construct the shared-memory mobj.

Instead, start the FF-A descriptor at the 4 KiB page containing the
shared buffer, the same approach as optee_fill_pages_list() in the SMC
ABI. Store the remaining in-page offset in internal_offs and preserve
shm_offs in offs_low/offs_high. This keeps internal_offs within the
FF-A page size, maps RPC allocations at the correct address, and
preserves normal memref offsets across repeated invocations.

Tested on ARMv8-A with 64 KiB PAGE_SIZE. OP-TEE OS ran as a secure
partition under Hafnium (SPMC) over FF-A. Verified registered shared
memory with tee_shm->offset >= 4 KiB, memref reuse on the same
TEEC_Operation, and RPC OPTEE_RPC_CMD_SHM_ALLOC (xtest regression
6007-6009). optee_hello_world, optee_aes, and xtest regression 1005,
1007, 1008, 4001-4003 and 6001-6003 also passed.

Fixes: 4615e5a34b95 ("optee: add FF-A support")
Acked-by: Liming Sun <limings@nvidia.com>
Acked-by: James Hurley <jahurley@nvidia.com>
Acked-by: Dave Thompson <davthompson@nvidia.com>
Signed-off-by: Mahantesh Salimath <mahantesh@nvidia.com>
---
 drivers/tee/optee/ffa_abi.c   | 66 +++++++++++++++++++++++++++++------
 drivers/tee/optee/optee_msg.h |  4 +--
 2 files changed, 57 insertions(+), 13 deletions(-)

diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
index 633715b98625..2a37e4899dc6 100644
--- a/drivers/tee/optee/ffa_abi.c
+++ b/drivers/tee/optee/ffa_abi.c
@@ -187,6 +187,40 @@ static int optee_ffa_from_msg_param(struct optee *optee,
 	return 0;
 }
 
+/*
+ * OP-TEE FF-A memory objects use 4 KiB pages while the kernel page size may
+ * be larger, for example 64 KiB on arm64. The FF-A descriptor is registered
+ * from the 4 KiB page containing the start of the shared buffer, so
+ * internal_offs is the offset into that page.
+ */
+static void optee_ffa_set_internal_offs(struct optee_msg_param_fmem *fmem,
+					struct tee_shm *shm)
+{
+	size_t page_offs = tee_shm_get_page_offset(shm);
+
+	BUILD_BUG_ON(PAGE_SIZE < FFA_PAGE_SIZE);
+
+	fmem->internal_offs = page_offs & (FFA_PAGE_SIZE - 1);
+}
+
+/*
+ * Keep shm_offs unchanged in offs_low/offs_high: it is returned to callers
+ * and may be reused for a subsequent invocation.
+ */
+static int optee_ffa_set_fmem_offsets(struct optee_msg_param_fmem *fmem,
+				      struct tee_shm *shm, u64 shm_offs)
+{
+	optee_ffa_set_internal_offs(fmem, shm);
+
+	fmem->offs_low = shm_offs;
+	fmem->offs_high = shm_offs >> 32;
+	/* Check that the entire offset could be stored. */
+	if (fmem->offs_high != shm_offs >> 32)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
 				const struct tee_param *p)
 {
@@ -196,14 +230,8 @@ static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
 		   TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
 
 	if (shm) {
-		u64 shm_offs = p->u.memref.shm_offs;
-
-		mp->u.fmem.internal_offs = shm->offset;
-
-		mp->u.fmem.offs_low = shm_offs;
-		mp->u.fmem.offs_high = shm_offs >> 32;
-		/* Check that the entire offset could be stored. */
-		if (mp->u.fmem.offs_high != shm_offs >> 32)
+		if (optee_ffa_set_fmem_offsets(&mp->u.fmem, shm,
+					       p->u.memref.shm_offs))
 			return -EINVAL;
 
 		mp->u.fmem.global_id = shm->sec_world_id;
@@ -284,14 +312,30 @@ static int optee_ffa_shm_register(struct tee_context *ctx, struct tee_shm *shm,
 		.nattrs = 1,
 	};
 	struct sg_table sgt;
+	size_t page_offs;
+	size_t ffa_offs;
+	size_t ffa_size;
 	int rc;
 
+	if (!num_pages)
+		return -EINVAL;
+
 	rc = optee_check_mem_type(start, num_pages);
 	if (rc)
 		return rc;
 
-	rc = sg_alloc_table_from_pages(&sgt, pages, num_pages, 0,
-				       num_pages * PAGE_SIZE, GFP_KERNEL);
+	page_offs = tee_shm_get_page_offset(shm);
+	ffa_offs = round_down(page_offs, FFA_PAGE_SIZE);
+	ffa_size = num_pages * PAGE_SIZE - ffa_offs;
+
+	/*
+	 * Start the FF-A descriptor at the 4 KiB page containing the shared
+	 * buffer, skipping unused leading 4 KiB pages when PAGE_SIZE is
+	 * larger. Same approach as optee_fill_pages_list() in the SMC ABI.
+	 * This leaves only page_offs & (FFA_PAGE_SIZE - 1) for internal_offs.
+	 */
+	rc = sg_alloc_table_from_pages(&sgt, pages, num_pages, ffa_offs,
+				       ffa_size, GFP_KERNEL);
 	if (rc)
 		return rc;
 	args.sg = sgt.sgl;
@@ -458,8 +502,8 @@ static void handle_ffa_rpc_func_cmd_shm_alloc(struct tee_context *ctx,
 		.attr = OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT,
 		.u.fmem.size = tee_shm_get_size(shm),
 		.u.fmem.global_id = shm->sec_world_id,
-		.u.fmem.internal_offs = shm->offset,
 	};
+	optee_ffa_set_internal_offs(&arg->params[0].u.fmem, shm);
 
 	arg->ret = TEEC_SUCCESS;
 }
diff --git a/drivers/tee/optee/optee_msg.h b/drivers/tee/optee/optee_msg.h
index 7d9b12e71c03..6c3043f8da33 100644
--- a/drivers/tee/optee/optee_msg.h
+++ b/drivers/tee/optee/optee_msg.h
@@ -136,8 +136,8 @@ struct optee_msg_param_rmem {
  * struct optee_msg_param_fmem - FF-A memory reference parameter
  * @offs_low:		lower bits of offset into shared memory reference
  * @offs_high:		higher bits of offset into shared memory reference
- * @internal_offs:	internal offset into the first page of shared memory
- *			reference
+ * @internal_offs:	offset into the first 4 KiB page of the FF-A shared
+ *			memory region
  * @size:		size of the buffer
  * @global_id:		global identifier of the shared memory
  */
-- 
2.43.0

