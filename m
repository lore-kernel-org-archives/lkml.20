Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793596803;
	b=b3ErF6+weLpOPzTiArryOOUV23pc01pRyVbdKvmxzZs0iXUPgwEtiObVsAbkei0X8qXt
	 MmjCgstF7gjMOs5OAW3dvrYg//iXJT0z07vIYJY4RxJlgj4RCXxdlpch8FnpbHJUtm7Su
	 qhT8g0A7PI3FosH67B6sNQH9VqlZ+9SCJurAkx9z71mwNibWMO6Lmvpe2fsBd+3AHn1Dd
	 tw6uur20w/Er5M4U/olGZqxBvcwnCgkCg3gPbdMPcB4V5Y2dCxVlnNfU7n+XvOJOX3gQ6
	 sI/CB7J2fk++B73FVSQyUc4EJjysmMagYyhVAznan/4B+QSpeJEF1iyS7MG0qModB2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793596803;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-NV-OnPremToCloud:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=NibUw+juMaROznuktjkyvqh1cx7Y/iy2UPvcljfBXqQ=;
	b=aSKx+dVSiQ3nGx1h0++8ipE3wYnk4HBvan+7cXkJsw2+pYyYwYAVjSOcfCh5ySOBxtP2
	 aw+7NbHdN45LmZxz4FlcNKjpspVhGxxL1Ng3MeYuAo3XjbPDcDolGKjeeRmQhRkr4GS0A
	 JY1w5b0soJStJNdp+4NtOAqtzB4kFakHn7NYzL7nhJboP46eS5a1fCH3lcROrrBb4DZBL
	 Vi0ykGzh9o7xWnEOno1nvcPzlfX/R6Z2uQGh9ViWJ3plwHoVxYFv0ZyUgiZZ2DBwPkmj3
	 iTT+PGI9/xZxRrmKtoAuny3jOsiKsYFcvhUlBhDvcAZgsPZkkfuSjsP9Hb/3SK+Ei/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=In2wB9ZD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.62
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011062.outbound.protection.outlook.com [52.101.62.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2F8606A334
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 05:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED2F8606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=In2wB9ZD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYQkV3RJTSicts+Jdyx6jTl0oPOwYgj8TSwar6JtKsmmrOZSQYTZCRiIcx5dioNICmDw2e5gT8g0vjxvKt98W5jQ2B7gRhDiQRuShY/UOz6yZwACtSKNdO4YIZuo95WrbTJqNtV2a9al2bEuUU52NyxUJuS88FQtXB0TOcc3C85JSSwVGHmPw4KugTotUdXq4Vmdc7VraZfk6A5VxraQJxAKQ3ESr8lNpzfR1yMBr1IsmWACmRb9bcTMjtjYVSfQdBH3/DIPL+ycZ+ve1mbDezOBt7QeL9RP+ce9nrtn5zeSaSnFd6IJhBdwqkD1LJZjQ8QK3bShn2p5CIQ8SwZfhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NibUw+juMaROznuktjkyvqh1cx7Y/iy2UPvcljfBXqQ=;
 b=UbGRjxxr34KoUhlQXBo5mkT4zBapv1mFCvqBObwmDnuTGynUGXGP3k7YYeLJhN41jKsNccI5/aYrZ/zq7iUhQ0JrZnTLdiFENuMNxc1dfPISIq0ZWwssqA+HHOSj8+WkEEuvL++1rFsq0M7UyKVTogdfGV8k9iTmVoXa3WXaU1OpLMKXPY+PV68LBAG9ehoOygWZfQt5Zu9mvrtEaXPw6Y2gJapYvTyu8RQB7CBnD7DAQnCQSTkGJyyebC36UMtMHVERq62peh6pbUtUhBBkqouG2C4PHozKCPJJn9rR0CEGn72hppAG3PpBN12V1ySizJAHu526nhDULTvfmd4Scw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NibUw+juMaROznuktjkyvqh1cx7Y/iy2UPvcljfBXqQ=;
 b=In2wB9ZDOycH16Cb5ymzssP8mR4iZXWUSSTD99KG2sANesRaC284RfrI6u1h3kcKJrYpOIOEFY8efrDt3h8IyyphnkXkDkuNjHuD6J+XNerQ/MNROW9IWhA0Nrub4c7MaRBlGpYP++XfBGxhtp9VM9XoNBMVHnZaKgZnH2h7khs5G2mRJ4zeLi3oRVkL/pHzAOa4Eytka/DNDCPko5r8ZCmGbDpNt0uVAAJUUUYmet0GuXYb5s3rcX/FyLykT5YiH+M585BuVFIWbuqEY1ooN6UBBeVMZ14mGRRVDn5ZpCS8QmGy+3asHfEqyfUNMbNKoMcIldGO+ByGqxj5RQkeNA==
Received: from MW4PR04CA0146.namprd04.prod.outlook.com (2603:10b6:303:84::31)
 by MN0PR12MB5930.namprd12.prod.outlook.com (2603:10b6:208:37d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 05:19:45 +0000
Received: from BY1PEPF00026964.namprd05.prod.outlook.com
 (2603:10b6:303:84:cafe::af) by MW4PR04CA0146.outlook.office365.com
 (2603:10b6:303:84::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 05:19:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BY1PEPF00026964.mail.protection.outlook.com (10.167.244.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 05:19:44 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Sun, 1 Nov
 2026 21:19:33 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Sun, 1 Nov
 2026 21:19:33 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Sun, 1 Nov 2026 21:19:32 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <jgg@nvidia.com>
CC: <robin.murphy@arm.com>, <joro@8bytes.org>, <praan@google.com>,
	<kevin.tian@intel.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <jamien@nvidia.com>, <kas@kernel.org>,
	Cristian Prundeanu <cpru@amazon.com>, Breno Leitao <leitao@kernel.org>,
	<xueshuai@linux.alibaba.com>, <john.garry@arm.com>
Subject: [PATCH v12 04/12] iommu/arm-smmu-v3: Pack the MSI vectors of the used sources
Date: Sun, 1 Nov 2026 21:19:12 -0800
Message-ID: <0d28afd67694fc6882e0ff5f054027488b1cf816.1793593923.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793593923.git.nicolinc@nvidia.com>
References: <cover.1793593923.git.nicolinc@nvidia.com>
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
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026964:EE_|MN0PR12MB5930:EE_
X-MS-Office365-Filtering-Correlation-Id: 5678ee76-bc21-46ff-6636-08df38a0e81e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|36860700016|82310400026|11063799006|56012099006|261009223027099003|261021121427099003|261021123027099003|261021135927099003|261026121527099003|261022075727099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	OWWZEf1NGCdnPnaPIbiZkkdxsSri4duXOQCSjtfrk1fygHP7UmQF40IXIRR0ExpcpJ5SYK1odwXGr4AtBlFwlhZD2uJ5EuRFDSzXoPGhWw+2nZnsxpE3ObP9UeG1IWjI5gN5nZne36KZjsehr67oiS+OBcYVaTTkFnyvwoE4Oikrn7xcSITkHeRoIsrYJuK2k9BjxZmFjUhys2EGekVqXqo0WP5q12Qmd10NWmFV8B7fQ4tD+X6L7VJ2gPzQQQ5HuITTw6eTjjxG/HhuftvyEVCqXAEHqGWAwvCcbhpNF2axkwyLmSOBPL49H3q0zwQDJ3ZZsmKhs8wEEPwnj2znts4ndEgHX8UynfnnPOQu2DGsetNn992Eb+QZXP29BIMpL9dHlLtTHuhPZidgdyFxsEHzIqz3xo5xL5EDmXjsZ72eibsF9pd2yuNDEXXfavBnAU9lMDwhaVTjQuvQ0FDeboPBWSFDXbTlfpvdpck20khxpohiDVGRUFNOYwmsh3fsMA1OY/6xgezRumaj/g+WCsnPGUv4Iv4zx3Idy+PyemYeFtn7T18SH6EZoXL4jvIn8MNQesBQf7UrYWXK2fiNGrsVf+JIeHy3tSd1YNGj4JUmia1JCBNNkXfMmrbPFQihgsDNfsRk0BABr9OBzwuI9WmOXBqj8gaM1RESQ0JmrxiHH6XOOuDN7u0dPL83XeIwtQKONEjlAN0FHjkSP0tfqA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261021123027099003)(261021135927099003)(261026121527099003)(261022075727099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ACf99DkI5W80SPs6/H3L+OGIW3bIuvbmoz3v6S0YOykOQJuAgv0Qe1OaNgIP85Yhzj+193j07rzPZr+NrTyUt1nOp96XI4qGX/MZRPnId4RzLkmwblOJ6kY/bYoJucWZsdH+5+5fQPPpOM2cEn/46H7PQoCJC0XyWojhgz75OD5mpssqd99GR6m4vQ6ovA52FEaWkJQaunRGnehnw9hFTmEyhQHDhuLuLYwgsd/6PSGZMphStPkLw+FpO7eR/ig8Y+hcguzgEc/mmVA0o44IKShVpnaMKMCDYs/UBr81MoNm44JkcatV2XztJl9VCK0qc4J08bcmvNvuMwtLZaXsGbHjTVZIgXb7qcam7RNKcYY1LQNmDxuQo4PGvt5/3JOnaaUPWxarPQyRYpGAGrQUk+9n5v19K88ZsSdJgkxCDG1ixgZYAJqTX10k+a077lwO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 05:19:44.9732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5678ee76-bc21-46ff-6636-08df38a0e81e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026964.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5930

arm_smmu_setup_msis() skips the PRIQ vector by decreasing nvec, which only
works since PRIQ_MSI_INDEX is the last index. A subsequent change will make
the EVTQ optional for kdump, whose index is 0, so that trick won't work.

Pack the vectors of the used sources instead, and record the source of each
vector in a new msi_map, for arm_smmu_write_msi_msg() to find the register
set, regardless of the sources in use.

No functional change intended.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  9 +++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 42 +++++++++++----------
 2 files changed, 32 insertions(+), 19 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 8f2c0b1cc4a8d..bce592fff0b12 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -936,6 +936,13 @@ struct arm_smmu_impl_ops {
 			  const struct iommu_user_data *user_data);
 };
 
+enum arm_smmu_msi_index {
+	EVTQ_MSI_INDEX,
+	GERROR_MSI_INDEX,
+	PRIQ_MSI_INDEX,
+	ARM_SMMU_MAX_MSIS,
+};
+
 /* An SMMUv3 instance */
 struct arm_smmu_device {
 	struct device			*dev;
@@ -993,6 +1000,8 @@ struct arm_smmu_device {
 
 	int				gerr_irq;
 	int				combined_irq;
+	/* MSI vector index to enum arm_smmu_msi_index */
+	u8				msi_map[ARM_SMMU_MAX_MSIS];
 
 	unsigned long			oas; /* PA */
 	unsigned long			pgsize_bitmap;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index cb45bd154c9e5..a312984bc6a0e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -56,13 +56,6 @@ static struct iommu_dirty_ops arm_smmu_dirty_ops;
  */
 static DEFINE_STATIC_KEY_FALSE(arm_smmu_erratum_repeat_tlbi_cfgi_key);
 
-enum arm_smmu_msi_index {
-	EVTQ_MSI_INDEX,
-	GERROR_MSI_INDEX,
-	PRIQ_MSI_INDEX,
-	ARM_SMMU_MAX_MSIS,
-};
-
 #define NUM_ENTRY_QWORDS 8
 static_assert(sizeof(struct arm_smmu_ste) == NUM_ENTRY_QWORDS * sizeof(u64));
 static_assert(sizeof(struct arm_smmu_cd) == NUM_ENTRY_QWORDS * sizeof(u64));
@@ -4933,7 +4926,7 @@ static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
 	phys_addr_t doorbell;
 	struct device *dev = msi_desc_to_dev(desc);
 	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
-	phys_addr_t *cfg = arm_smmu_msi_cfg[desc->msi_index];
+	phys_addr_t *cfg = arm_smmu_msi_cfg[smmu->msi_map[desc->msi_index]];
 
 	doorbell = (((u64)msg->address_hi) << 32) | msg->address_lo;
 	doorbell &= MSI_CFG0_ADDR_MASK;
@@ -4943,19 +4936,29 @@ static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
 	writel_relaxed(ARM_SMMU_MEMATTR_DEVICE_nGnRE, smmu->base + cfg[2]);
 }
 
+static void arm_smmu_setup_msi_vector(struct arm_smmu_device *smmu,
+				      unsigned int *vec, unsigned int *nvec,
+				      enum arm_smmu_msi_index index)
+{
+	writeq_relaxed(0, smmu->base + arm_smmu_msi_cfg[index][0]);
+	vec[index] = *nvec;
+	smmu->msi_map[(*nvec)++] = index;
+}
+
 static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 {
-	int ret, nvec = ARM_SMMU_MAX_MSIS;
+	unsigned int vec[ARM_SMMU_MAX_MSIS] = {
+		/* An unused source maps to a vector past nvec */
+		[0 ... ARM_SMMU_MAX_MSIS - 1] = ARM_SMMU_MAX_MSIS,
+	};
 	struct device *dev = smmu->dev;
+	unsigned int nvec = 0;
+	int ret;
 
-	/* Clear the MSI address regs */
-	writeq_relaxed(0, smmu->base + ARM_SMMU_GERROR_IRQ_CFG0);
-	writeq_relaxed(0, smmu->base + ARM_SMMU_EVTQ_IRQ_CFG0);
-
+	arm_smmu_setup_msi_vector(smmu, vec, &nvec, EVTQ_MSI_INDEX);
+	arm_smmu_setup_msi_vector(smmu, vec, &nvec, GERROR_MSI_INDEX);
 	if (smmu->features & ARM_SMMU_FEAT_PRI)
-		writeq_relaxed(0, smmu->base + ARM_SMMU_PRIQ_IRQ_CFG0);
-	else
-		nvec--;
+		arm_smmu_setup_msi_vector(smmu, vec, &nvec, PRIQ_MSI_INDEX);
 
 	if (!(smmu->features & ARM_SMMU_FEAT_MSI))
 		return;
@@ -4972,9 +4975,10 @@ static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 		return;
 	}
 
-	smmu->evtq.q.irq = msi_get_virq(dev, EVTQ_MSI_INDEX);
-	smmu->gerr_irq = msi_get_virq(dev, GERROR_MSI_INDEX);
-	smmu->priq.q.irq = msi_get_virq(dev, PRIQ_MSI_INDEX);
+	/* msi_get_virq() returns 0 for an unused source that has no vector */
+	smmu->evtq.q.irq = msi_get_virq(dev, vec[EVTQ_MSI_INDEX]);
+	smmu->gerr_irq = msi_get_virq(dev, vec[GERROR_MSI_INDEX]);
+	smmu->priq.q.irq = msi_get_virq(dev, vec[PRIQ_MSI_INDEX]);
 
 	/* Add callback to free MSIs on teardown */
 	devm_add_action_or_reset(dev, arm_smmu_free_msis, dev);
-- 
2.43.0

