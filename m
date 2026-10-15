Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012051.outbound.protection.outlook.com [40.107.209.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2777C3EAC74;
	Thu, 15 Oct 2026 05:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792042165; cv=fail; b=XyDTgdTjNFAf1bgbes757qlmXCQ/zhPPVPHIpaYrfOym2SrpEBVmDItwnfhPIdRQ3Wiws49XFa6Yc939dCCuwaHIUYWr1rqZyb4mswqNe4YDVayOE6asLG4PUJq9Ac7LC6ATsO1g5F3Ye1oYxDxUBfg6GmRNoNke/1BU+pz/K24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792042165; c=relaxed/simple;
	bh=7VWr9PUOcjJ70fsVuYvKuW/DBrZc4jXpg2LxSOBNF1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eKKsZ16F/rKBRLcfyteH+DFeVL1b7VKv7EIQ70X4fFNhm1YAMzP10FeRdNn3zUu8c1tmLiUj522urFFXSzaqwUaDPE20oFmz4VEZg24p1bx2ow+XxHdINkowS6OyzpQZAk9vXoYyVdpCW+UjANwUl1toUiYbJLodLq0FUyUZP+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=XxACR4ew; arc=fail smtp.client-ip=40.107.209.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="XxACR4ew"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXyIDtZuoaMGYoTKrKDUSrZFEabT0tMHb7EE7scuupLX/WsYpy9+B+K0fCAsem2/gMx5mzsxyMtRZ3VysB5FUSkvi4MB7XZ4vZpRjuHIpOkuZ70IzrOxkGMa5A+hoDTMseZEvzB+Rf+s9kfvGYb0cmi9j/01PO8to4EU1zlQ3dm+3aSPDpCr4iW+jZgtH9pS8VPQfpmlu3WiQdM//RlAiRbCsQMTQgWQ8CnVuoJaKnI8+P0OFkUbGs1syX71WxESJMVlMjc7rjHPIM5dDcXrq+jJf4xmG1tgVKRSvM2XMMAq674N0zqN64ooatBLTQFsZc7AVTRr70CpMQje8apP8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/occHS/qxiEV5iyQbJWhUR6oX0snGm/bUlcQ5fwlLs=;
 b=IK9MLhPYfGe/vHnUNLJOOD6HbtEFWQZn242kEbhfElf9gS3oz4/6MnEoEPxgJ7jCWOpDLkJmG/QTzPWzRE5uRDXyXwqn4i2J0fIdE7onD77BVGPQW8FxqICDcWwSMb88w1cxPbpj3o18nUtqRggnwDvDjn6I2ZCc/YUpYQ6jQCbN6pHyZTdGRKUSff1Img9gEgf3n3CgTB1ZF89wloPZrjXX1O8hrZisbk61hBQNueyD7RevR2wQJbO9cx6NRV2iqDiV7A6lPBTjff2WVKopn/r9q2vDRhAux0kNUxaMtpON19s1NRnMlQIPo7o5VErHwTu47Tk7C6/g8AM0W5Zvyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/occHS/qxiEV5iyQbJWhUR6oX0snGm/bUlcQ5fwlLs=;
 b=XxACR4ewTVPN01lZn7+OQdsn/saV7ENrz9PIQYsfrtmYqXi+G7liMV02crRE+hHKK696pCiY9O6mYtc938T85n6gc6RoIv/gFILEqNHRhB/wHGPzXcL6uIocAV2MWHx0CmeCTaJnclb+2YCCt94dgkMxlX/A8b27Wo0riCTKeP6rvazmsxy+WrcTXlASmeto2JFtl6gHABy2c5y81hChu9XsguM/aX/oYaTsHek+3H+EputYdAwrh5UgEsdBLe5VEi1NLUfsdNT9SvsmqM8lBfwjdeoQG7qYC/jPJkaGraepOO7jxdm54SKautxV9XZxmuiEORBwilTRTIaj3ErTMA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DS3PR03MB097838.namprd03.prod.outlook.com (2603:10b6:8:546::7)
 by BLAPR03MB5602.namprd03.prod.outlook.com (2603:10b6:208:284::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 05:29:20 +0000
Received: from DS3PR03MB097838.namprd03.prod.outlook.com
 ([fe80::fa39:2c18:c265:1d59]) by DS3PR03MB097838.namprd03.prod.outlook.com
 ([fe80::fa39:2c18:c265:1d59%6]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 05:29:20 +0000
From: hang.suan.wang@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Ahsan Atta <ahsan.atta@intel.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Gabriel Whigham <gabewhigham@gmail.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Will Deacon <will@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-doc@vger.kernel.org
Cc: muhammad.nazim.amirul.nazle.asmade@altera.com,
	tze.yee.ng@altera.com,
	chee.nouk.phoon@altera.com,
	genevieve.chan@altera.com,
	adrian.ho.yin.ng@altera.com
Subject: [PATCH v7 2/3] firmware: stratix10-svc: add FCS crypto-service commands for Agilex 5
Date: Wed, 14 Oct 2026 22:29:12 -0700
Message-ID: <0a4c0b71ec076cb467dd409249e3a7466b541084.1792034130.git.hang.suan.wang@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1792034130.git.hang.suan.wang@altera.com>
References: <cover.1792034130.git.hang.suan.wang@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::34) To DS3PR03MB097838.namprd03.prod.outlook.com
 (2603:10b6:8:546::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PR03MB097838:EE_|BLAPR03MB5602:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c75030f-7c70-4f11-c0f3-08df2a7d4356
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|6133799003|22082099003|55112099003|10067099003|3023799007|18002099003|921020|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	RCldie3vUWV6ZuEop3fmhyZzoRZArzd1c8TYD43279eVuaIvOO30qZ2CKB2HdkTXH0N4RchMsAivZ9xSuWaxhBxq9gKiIxu1CLjQhYRz460fI1Wduox2C4UNmh4S3mE39aICykaIdvyZHOL/K1+i90WOe+roXYVz0DJ5MnWZHcsrH4+zez7tAhhXq8SifaRUKFeL5OdfvDtJ/h8y3NUdfM8fJzhtWBAZxQ1/382LhrGvAT4jlvR29WRgN8dRwI3OowPLuXomyAHUXoTd0P/5it9sTwK+yxJg3kcwpN6PJ2dBAGCbEb3kd4kJjw79Rrzc+uKeaEyN5f2/OLmyYtf0eOwSZgMv+1Flug/VwZY4Yh0hDL+yLcT5/s9Hmw0AcySB+HOqF6jwnyHDpPUwnt2BxQd+FSWawdq9+lzbplw9j152h1cULYcLRukns0UBvYJmWn9DIHkRRjIdKfNIx2kaqN6bzD3wGpnxxl8izQvYtWRno6MVcvb+nhdInLOrgOjHaZ4ATlJCm0yo/CABS00cSolqftTi3fqJADJOQRMQP1IZiGcZBdvy/VjPrbW43gnGOa3QCgolmtLLag60XDU0N8oy+XLafNHpcLhSslCE2NRSAbdZq95+uFBiv0R0By49tmnT0pJqCzgueCyrHw6abXwmvoN3pMtKRtLm7Ik8xDmKTD1hreDpEtTT0RTh0N6Ij0xH1apcXsOh5EyxnsGhtQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS3PR03MB097838.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(6133799003)(22082099003)(55112099003)(10067099003)(3023799007)(18002099003)(921020)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f9fTQ5IEV0pgoOqTNePGi3hRNzd9+LvsljZBcMw3+nTsC+RbJzVw8/4akQi3?=
 =?us-ascii?Q?6jPv+fC2RiD6LfwLYSJXz6BPd5WCjwlwUuvGf+AGCR63ZRvjOSNAMZuiIDiX?=
 =?us-ascii?Q?xJgFUy6MJI++18tOuNdZ6g2VjkTaPpCnCI3+787syb/3ogGHGgogFIishglp?=
 =?us-ascii?Q?rqlTsOk3XehRyFyJnMAZuR2/Nhyx3YTRPVxPibSJetuvdtCjxUXh5Fy4TBYh?=
 =?us-ascii?Q?HrzqJLVgyt+Jx42Mwi9h51LkffwklKkgThn7FbtiPazR3SSC1Tp2uMX+i6EN?=
 =?us-ascii?Q?6D9nfluco/ZaPM9DwMvg0HPLaKH+MUPIaM1BzVQJ1GZs7zNDpOBXQUzbtyEv?=
 =?us-ascii?Q?nuptnHPCn1bQUy8RxOdsP6H9pybkzEYPGAupCSbG7/U4R326w2z+Voc9q4zu?=
 =?us-ascii?Q?xpvQsvWk9jhjfOpoftZUOjM6xuk2zeYyfnG5ZdbDyOMVD7WdcBgKkOqYGAHC?=
 =?us-ascii?Q?H/zLzouKx5c5Pd2oiZWz6lYcFWz/i3Z/NwwOj+wZEsYVDkGpA5sFwHBLAllg?=
 =?us-ascii?Q?GEUWIZCnEo7f9UMwRpPokTQc7jt6kNRWglIhVB9hrxi6e0p3hDCY+KWjQX0L?=
 =?us-ascii?Q?YE6iOCb5CCZCEKoG1JC08teNsP4sJernPeZyihOWk9bDsXEuSkH1UdogpaDK?=
 =?us-ascii?Q?5jN4cLkQMRd92zs1ATMLEvbuyeLCw1ReEMPDV64a3SLHhPcCmIL8aCbhFepE?=
 =?us-ascii?Q?tCC1krjFwWSOGyingREfjwHUQR/WKxLNmeyCxolq0ZzOlZF84v9VVGLbKxJj?=
 =?us-ascii?Q?Goe9BDHTfbIiF2dfDzXujF8xjTnXSpPTMLW1gGtsOGGBpj/pTKRy1PK+UiZR?=
 =?us-ascii?Q?3FwjPiNWKp/Rg36drVE5k7ZZDENat6coUZFWoOAmUcgGzisC8kdFE1zBDs45?=
 =?us-ascii?Q?DxvIqwylSBj2JmiMkrzPKtxti5BVeVZHKbGrZRRvlo4Nx55+lKyRbILw9BWG?=
 =?us-ascii?Q?GPj/1t9BjeJOxPMb8HwUgRxvPrp3RSUCmdZy1Y+LNZXeZvkp+222e+Q/xzOQ?=
 =?us-ascii?Q?daoXCTDCP9jQ54ch2RIKTgohQopr9SbC9qrEKrebKPwK4VBeSNB5CPZ9HCAd?=
 =?us-ascii?Q?e+Bnpp0w3Rux0iAs6cnQyvCg2/zcVcEekngRz5gAK6faVSMM32ozHN0q0yHG?=
 =?us-ascii?Q?ysMwZ4/bdnGL+nuMBV1GRjBkAv2tsek3s10x8EjH1PlDDAmDhiAHFurlg0vn?=
 =?us-ascii?Q?kLdOoPpq81eYsOrKjsN6zSKLxpfL7pldK1vn7m6CP5LZFt7+LbdLWvLYw0V8?=
 =?us-ascii?Q?jbIrO8tJg63Blq/2vakIImzO+y3v9IqLqCmVVniuZtln/X9Mq+AmkSF6buQq?=
 =?us-ascii?Q?EBoFd5767lEU6S1MBJL/1yfY39+6g8OK1Hnt3nlxK1dD7qEWXyKfmpwivnXi?=
 =?us-ascii?Q?QSTQfew+rx2ga1JYRxNF4znkFBbQOCbrQdNc8dPcZMxh7LxK5e0v/lQ5CBsc?=
 =?us-ascii?Q?XwbSZTI7TSctyVoN/UVlB9o+BsJ4OS45Glk110HxWPDm0/wYwv8qmyAXuz+O?=
 =?us-ascii?Q?+I+BUe3FzpT6gmM4clK62ZQb5L5tWJqi1ex7YdlrEn7IktPLifp4ITCvVhfy?=
 =?us-ascii?Q?HkhixXsOsD158Vy/ew30XOHDBB9IbakOcj8a/8OW+Sj0zeERjnpT/oGOCOJe?=
 =?us-ascii?Q?cwv4nQ44NSYlLxYTha06Cak/vrttWMCtyTWGoTD4dbU3GGAvOLcaqiERXG07?=
 =?us-ascii?Q?lxgkpT4WRDkgJ+4qKJfJdd6Yl2eyuHT8YyBQtlRWrVUC+XRga30pj1SoW9PN?=
 =?us-ascii?Q?9t4dnp8ke1iAU13eTJ7+7D/VRz9mWFM=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c75030f-7c70-4f11-c0f3-08df2a7d4356
X-MS-Exchange-CrossTenant-AuthSource: DS3PR03MB097838.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 05:29:19.9838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P3maTKiR4X38iz34UNuBFpycE3Pggfn8YorCTYZayTVf1czScjpsjH6jwTGdmu+/kQl8zgTVTAHhJ0qAvJDTm7shB07b6Mie6nY8kE0RPIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5602

From: Hang Suan Wang <hang.suan.wang@altera.com>

The Agilex 5 Secure Device Manager (SDM 1.5) exposes an FPGA Crypto
Service (FCS) over the existing SIP SMC mailbox: a session-based
interface for crypto primitives such as SDOS (Secure Data Object
Service) encrypt/decrypt. The service layer has no command to drive it
yet.

Configure stratix10-svc about this interface so an in-kernel FCS client
can use it:

  - add the client command codes COMMAND_FCS_CRYPTO_OPEN_SESSION,
    COMMAND_FCS_CRYPTO_CLOSE_SESSION and COMMAND_FCS_SDOS_DATA_EXT (all
    asynchronous)

  - add the matching asynchronous SIP SMC function IDs
    (INTEL_SIP_SMC_ASYNC_FCS_OPEN_CS_SESSION,
    INTEL_SIP_SMC_ASYNC_FCS_CLOSE_CS_SESSION and
    INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT) with their register-usage
    documentation;

  - match "intel,agilex5-svc" and register a "stratix10-fcs" child
    platform device, mirroring the existing RSU child, so an FCS client
    driver can bind without a dedicated device-tree node;

The transport is unchanged: Agilex 5 reuses the SIP SMC calling
convention and async mailbox ABI the driver already implements, so no
new transport mechanism is required.

The command COMMAND_FCS_SDOS_DATA_EXT takes 2 types of buffer which are
the physical address of the source and destination, and SMMU remapped
address. Like other device in the market, Agilex 5 drives the SDM through
an SMMU. The remapped address carry the IOVA returned by the DMA allocator,
and the physical slots carry the address backing it, resolved with
iommu_iova_to_phys().

The SDM can only reach 32-bit physical addresses, but dma_alloc_coherent()
has no way to ask for that directly. Once an IOMMU is involved, it drops
the __GFP_DMA and __GFP_DMA32 flags and adds __GFP_HIGHMEM instead. It
assumes the IOMMU can map any page, so address range no longer matters to
it. The only attribute that skips this behavior is
DMA_ATTR_FORCE_CONTIGUOUS, which pulls memory from CMA instead. On arm64,
CMA happens to be reserved below the DMA zone limit, so it ends up
32-bit-reachable. The contiguous part is not actually what we need it's
just a side effect of using CMA. Apply this attribute only to channels
whose commands carry a physical address, and track which attributes each
buffer was allocated with so it's freed the same way.

This is a prerequisite for the SoCFPGA FCS driver, the first in-tree
consumer of these commands.

Signed-off-by: Hang Suan Wang <hang.suan.wang@altera.com>
---
 drivers/firmware/stratix10-svc.c              | 178 +++++++++++++++++-
 include/linux/firmware/intel/stratix10-smc.h  |  64 +++++++
 .../firmware/intel/stratix10-svc-client.h     |  14 ++
 3 files changed, 247 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index 8f07b945392a..15af21203c8f 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -72,6 +72,7 @@
 
 /* stratix10 service layer clients */
 #define STRATIX10_RSU				"stratix10-rsu"
+#define STRATIX10_FCS				"stratix10-fcs"
 #define SOCFPGA_HWMON				"socfpga-hwmon"
 
 /* Maximum number of SDM client IDs. */
@@ -145,10 +146,12 @@ struct stratix10_svc_chan;
 /**
  * struct stratix10_svc - svc private data
  * @stratix10_svc_rsu: pointer to stratix10 RSU device
+ * @stratix10_svc_fcs: pointer to stratix10 FCS device
  * @stratix10_svc_hwmon: pointer to stratix10 HWMON device
  */
 struct stratix10_svc {
 	struct platform_device *stratix10_svc_rsu;
+	struct platform_device *stratix10_svc_fcs;
 	struct platform_device *stratix10_svc_hwmon;
 };
 
@@ -181,8 +184,10 @@ struct stratix10_svc_sh_memory {
  *         On the SMMU path this is (IOVA + %SVC_SDM_DMA_ADDR_OFFSET);
  *         on the gen_pool path this equals the raw physical address.
  * @size: size of memory
- * @dma_addr: IOVA returned by dma_alloc_coherent(); used to free the
- *            mapping via dma_free_coherent() on the SMMU path.
+ * @dma_addr: IOVA returned by the DMA allocator; used to release the
+ *            mapping again on the SMMU path.
+ * @attrs: DMA attributes the buffer was allocated with, passed back to
+ *         dma_free_attrs() so that the release matches the allocation.
  * @node: link list head node
  *
  * This struct is used in a list that keeps track of buffers which have
@@ -195,6 +200,7 @@ struct stratix10_svc_data_mem {
 	phys_addr_t paddr;
 	size_t size;
 	dma_addr_t dma_addr;
+	unsigned long attrs;
 	struct list_head node;
 };
 
@@ -306,6 +312,10 @@ struct stratix10_async_ctrl {
  * @svc_fifo_lock: protect access to service message data queue (locking pending fifo)
  * @lock: protect access to the channel
  * @async_chan: reference to asynchronous channel object for this channel
+ * @mem_contiguous: when true, buffers for this channel are allocated so that
+ *                  their physical address is reachable by the SDM, which is
+ *                  required by commands passing a physical address rather
+ *                  than an IOVA.
  *
  * This struct is used by service client to communicate with service layer.
  * Each service client has its own channel created by service controller.
@@ -319,6 +329,7 @@ struct stratix10_svc_chan {
 	spinlock_t svc_fifo_lock;
 	spinlock_t lock;
 	struct stratix10_async_chan *async_chan;
+	bool mem_contiguous;
 };
 
 /**
@@ -336,6 +347,8 @@ struct stratix10_svc_chan {
  * @psci_reboot_nb: reboot notifier for PSCI secondary CPU offlining
  * @use_dma_mem: when true, buffers are allocated via dma_alloc_coherent()
  *               instead of the ATF reserved-memory gen_pool.
+ * @domain: IOMMU domain the SDM-visible buffers are mapped into; used to
+ *          resolve a buffer's IOVA back to the physical address ATF expects.
  * @dma_addr_offset: value added to the DMA address (IOVA) before passing it
  *                   to ATF via SMC. ATF uses this offset to distinguish
  *                   SMMU-mapped buffers from direct physical addresses; it
@@ -361,6 +374,7 @@ struct stratix10_svc_controller {
 	struct stratix10_async_ctrl actrl;
 	struct notifier_block psci_reboot_nb;
 	bool use_dma_mem;
+	struct iommu_domain *domain;
 	unsigned long dma_addr_offset;
 	struct stratix10_svc_chan chans[] __counted_by(num_chans);
 };
@@ -396,6 +410,88 @@ static void *svc_pa_to_va(unsigned long addr)
 	return NULL;
 }
 
+/**
+ * svc_va_to_pa() - translate virtual address to physical address
+ * @ctrl: pointer to service layer controller
+ * @vaddr: buffer returned by stratix10_svc_allocate_memory()
+ *
+ * Provides the physical address arguments of an SMC call. On the SMMU path
+ * ATF expects the address backing the buffer's IOVA here, with the IOVA
+ * itself supplied separately by svc_va_to_iova(). The backing address is
+ * resolved through the device's IOMMU domain, since dma_alloc_coherent()
+ * returns a remapped virtual address that virt_to_phys() cannot translate.
+ * On the gen_pool path the stored address is already a physical address.
+ *
+ * The SDM can only reach a 32-bit physical address, so reject anything
+ * beyond that rather than letting the SDM fail the command later.
+ *
+ * Return: physical address of the buffer, or 0 if the provided virtual
+ * address doesn't exist or is not reachable by the SDM.
+ */
+static unsigned long svc_va_to_pa(struct stratix10_svc_controller *ctrl,
+				  void *vaddr)
+{
+	struct stratix10_svc_data_mem *pmem;
+	phys_addr_t pa;
+
+	if (!vaddr)
+		return 0;
+
+	guard(mutex)(&svc_mem_lock);
+	list_for_each_entry(pmem, &svc_data_mem, node) {
+		if (pmem->vaddr != vaddr)
+			continue;
+
+		if (!ctrl->use_dma_mem)
+			return pmem->paddr;
+
+		pa = iommu_iova_to_phys(ctrl->domain, pmem->dma_addr);
+		if (!pa || pa > U32_MAX) {
+			dev_err(ctrl->dev,
+				"payload %p resolved to %pa, which the SDM cannot reach\n",
+				vaddr, &pa);
+			return 0;
+		}
+
+		return pa;
+	}
+
+	dev_err(ctrl->dev, "payload %p is not a service layer buffer\n", vaddr);
+	return 0;
+}
+
+/**
+ * svc_va_to_iova() - translate virtual address to SMMU remapped address
+ * @ctrl: pointer to service layer controller
+ * @vaddr: buffer returned by stratix10_svc_allocate_memory()
+ *
+ * Provides the SMMU remapped address arguments of an SMC call. Without an
+ * SMMU there is no separate remapped address, and ATF expects these
+ * arguments to repeat the physical address.
+ *
+ * Return: IOVA of the buffer on the SMMU path, its physical address on the
+ * gen_pool path, or 0 if the provided virtual address doesn't exist.
+ */
+static unsigned long svc_va_to_iova(struct stratix10_svc_controller *ctrl,
+				    void *vaddr)
+{
+	struct stratix10_svc_data_mem *pmem;
+
+	if (!vaddr)
+		return 0;
+
+	guard(mutex)(&svc_mem_lock);
+	list_for_each_entry(pmem, &svc_data_mem, node) {
+		if (pmem->vaddr != vaddr)
+			continue;
+
+		return ctrl->use_dma_mem ? pmem->dma_addr : pmem->paddr;
+	}
+
+	dev_err(ctrl->dev, "payload %p is not a service layer buffer\n", vaddr);
+	return 0;
+}
+
 /**
  * svc_thread_cmd_data_claim() - claim back buffer from the secure world
  * @ctrl: pointer to service layer controller
@@ -1492,6 +1588,26 @@ int stratix10_svc_async_send(struct stratix10_svc_chan *chan, void *msg,
 		STRATIX10_SIP_SMC_SET_TRANSACTIONID_X1(handle->transaction_id);
 
 	switch (p_msg->command) {
+	case COMMAND_FCS_CRYPTO_OPEN_SESSION:
+		args.a0 = INTEL_SIP_SMC_ASYNC_FCS_OPEN_CS_SESSION;
+		break;
+	case COMMAND_FCS_CRYPTO_CLOSE_SESSION:
+		args.a0 = INTEL_SIP_SMC_ASYNC_FCS_CLOSE_CS_SESSION;
+		args.a2 = p_msg->arg[0];
+		break;
+	case COMMAND_FCS_SDOS_DATA_EXT:
+		args.a0 = INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT;
+		args.a2 = p_msg->arg[0];
+		args.a3 = p_msg->arg[1];
+		args.a4 = p_msg->arg[2];
+		args.a5 = svc_va_to_pa(ctrl, p_msg->payload);
+		args.a6 = p_msg->payload_length;
+		args.a7 = svc_va_to_pa(ctrl, p_msg->payload_output);
+		args.a8 = p_msg->payload_length_output;
+		args.a9 = p_msg->arg[3];
+		args.a10 = svc_va_to_iova(ctrl, p_msg->payload);
+		args.a11 = svc_va_to_iova(ctrl, p_msg->payload_output);
+		break;
 	case COMMAND_RSU_GET_SPT_TABLE:
 		args.a0 = INTEL_SIP_SMC_ASYNC_RSU_GET_SPT;
 		break;
@@ -1589,8 +1705,13 @@ static int stratix10_svc_async_prepare_response(struct stratix10_svc_chan *chan,
 	data->status = STRATIX10_GET_SDM_STATUS_CODE(handle->res.a1);
 
 	switch (p_msg->command) {
+	case COMMAND_FCS_CRYPTO_CLOSE_SESSION:
 	case COMMAND_RSU_NOTIFY:
 		break;
+	case COMMAND_FCS_CRYPTO_OPEN_SESSION:
+	case COMMAND_FCS_SDOS_DATA_EXT:
+		data->kaddr1 = (void *)&handle->res.a2;
+		break;
 	case COMMAND_RSU_GET_SPT_TABLE:
 		data->kaddr1 = (void *)&handle->res.a2;
 		data->kaddr2 = (void *)&handle->res.a3;
@@ -2157,7 +2278,25 @@ void *stratix10_svc_allocate_memory(struct stratix10_svc_chan *chan,
 		return ERR_PTR(-ENOMEM);
 
 	if (ctrl->use_dma_mem) {
-		va = dma_alloc_coherent(ctrl->dev, size, &dma_addr, GFP_KERNEL);
+		pmem->attrs = 0;
+		if (chan->mem_contiguous) {
+			/*
+			 * Some SMC calls take a buffer's physical address and
+			 * its SMMU remapped address in separate arguments, and
+			 * the SDM has to reach the physical one (see
+			 * INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT). The default
+			 * allocator path adds __GFP_HIGHMEM, so route the
+			 * allocation through CMA instead, which arm64 reserves
+			 * below the DMA zone limit.
+			 */
+			if (size <= PAGE_SIZE)
+				size = PAGE_SIZE * 2;
+			pmem->attrs = DMA_ATTR_FORCE_CONTIGUOUS;
+			va = dma_alloc_attrs(ctrl->dev, size, &dma_addr, GFP_KERNEL,
+					     pmem->attrs);
+		} else {
+			va = dma_alloc_coherent(ctrl->dev, size, &dma_addr, GFP_KERNEL);
+		}
 		if (!va) {
 			kfree(pmem);
 			return ERR_PTR(-ENOMEM);
@@ -2211,8 +2350,8 @@ void stratix10_svc_free_memory(struct stratix10_svc_chan *chan, void *kaddr)
 			continue;
 
 		if (ctrl->use_dma_mem) {
-			dma_free_coherent(ctrl->dev, pmem->size,
-					  pmem->vaddr, pmem->dma_addr);
+			dma_free_attrs(ctrl->dev, pmem->size, pmem->vaddr,
+				       pmem->dma_addr, pmem->attrs);
 		} else {
 			gen_pool_free(ctrl->genpool,
 				      (unsigned long)kaddr, pmem->size);
@@ -2303,8 +2442,8 @@ static void svc_data_mem_cleanup(void *data)
 		dev_warn(ctrl->dev, "leaked svc buffer %p, freeing on unbind\n",
 			 pmem->vaddr);
 		if (ctrl->use_dma_mem) {
-			dma_free_coherent(ctrl->dev, pmem->size,
-					  pmem->vaddr, pmem->dma_addr);
+			dma_free_attrs(ctrl->dev, pmem->size, pmem->vaddr,
+				       pmem->dma_addr, pmem->attrs);
 		} else {
 			gen_pool_free(ctrl->genpool,
 				      (unsigned long)pmem->vaddr, pmem->size);
@@ -2386,6 +2525,8 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 	init_completion(&controller->complete_status);
 
 	if (use_dma_mem) {
+		controller->domain = iommu_get_domain_for_dev(dev);
+
 		ret = devm_add_action_or_reset(dev, svc_data_mem_cleanup, controller);
 		if (ret)
 			goto err_destroy_pool;
@@ -2421,6 +2562,8 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 		controller->chans[i].scl = NULL;
 		controller->chans[i].ctrl = controller;
 		controller->chans[i].name = (char *)chan_names[i];
+		controller->chans[i].mem_contiguous =
+			!strcmp(controller->chans[i].name, SVC_CLIENT_FCS);
 		spin_lock_init(&controller->chans[i].lock);
 		ret = kfifo_alloc(&controller->chans[i].svc_fifo, fifo_size, GFP_KERNEL);
 		if (ret) {
@@ -2448,9 +2591,20 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 		goto err_free_fifos;
 	}
 
+	svc->stratix10_svc_fcs = platform_device_alloc(STRATIX10_FCS, 0);
+	if (!svc->stratix10_svc_fcs) {
+		dev_err(dev, "failed to allocate %s device\n", STRATIX10_FCS);
+		ret = -ENOMEM;
+		goto err_unregister_clients;
+	}
+
 	ret = platform_device_add(svc->stratix10_svc_rsu);
 	if (ret)
-		goto err_put_device;
+		goto err_put_rsu;
+
+	ret = platform_device_add(svc->stratix10_svc_fcs);
+	if (ret)
+		goto err_put_fcs;
 
 	if (IS_ENABLED(CONFIG_SENSORS_ALTERA_SOCFPGA_HWMON)) {
 		svc->stratix10_svc_hwmon =
@@ -2484,9 +2638,13 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 		platform_device_unregister(svc->stratix10_svc_hwmon);
 	if (svc->stratix10_svc_rsu)
 		platform_device_unregister(svc->stratix10_svc_rsu);
+	if (svc->stratix10_svc_fcs)
+		platform_device_unregister(svc->stratix10_svc_fcs);
 	goto err_free_fifos;
-err_put_device:
+err_put_rsu:
 	platform_device_put(svc->stratix10_svc_rsu);
+err_put_fcs:
+	platform_device_put(svc->stratix10_svc_fcs);
 err_free_fifos:
 	/* only remove from list if list_add_tail() was reached */
 	if (!list_empty(&controller->node))
@@ -2513,6 +2671,8 @@ static void stratix10_svc_drv_remove(struct platform_device *pdev)
 	platform_device_unregister(svc->stratix10_svc_rsu);
 	if (svc->stratix10_svc_hwmon)
 		platform_device_unregister(svc->stratix10_svc_hwmon);
+	if (svc->stratix10_svc_fcs)
+		platform_device_unregister(svc->stratix10_svc_fcs);
 
 	psci_cpu_off_teardown(ctrl);
 
diff --git a/include/linux/firmware/intel/stratix10-smc.h b/include/linux/firmware/intel/stratix10-smc.h
index 6a6fa51ad39e..fb01116c1cb9 100644
--- a/include/linux/firmware/intel/stratix10-smc.h
+++ b/include/linux/firmware/intel/stratix10-smc.h
@@ -669,6 +669,70 @@ INTEL_SIP_SMC_FAST_CALL_VAL(INTEL_SIP_SMC_FUNCID_FPGA_CONFIG_COMPLETED_WRITE)
 #define INTEL_SIP_SMC_FCS_GET_PROVISION_DATA \
 	INTEL_SIP_SMC_STD_CALL_VAL(INTEL_SIP_SMC_FUNCID_FCS_GET_PROVISION_DATA)
 
+/**
+ * Request INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT
+ * Async call to perform encryption/decryption
+ *
+ * Call register usage:
+ * a0 INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT
+ * a1 transaction job id
+ * a2 session ID
+ * a3 context ID
+ * a4 cryption operating mode (1 for encryption and 0 for decryption)
+ * a5 physical address of source
+ * a6 size of source
+ * a7 physical address of destination
+ * a8 size of destination
+ * a9 sdos ownership
+ * a10 smmu remapped address of source
+ * a11 smmu remapped address of destination
+ * a12-a17 not used
+ *
+ * Return status:
+ * a0 INTEL_SIP_SMC_STATUS_OK or INTEL_SIP_SMC_STATUS_ERROR
+ * a1-a17 not used
+ */
+#define INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_CRYPTION_EXT (0x12F)
+#define INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT \
+	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_CRYPTION_EXT)
+
+/**
+ * Request INTEL_SIP_SMC_ASYNC_FCS_OPEN_CS_SESSION
+ * Async call to open and establish a crypto service session with firmware
+ *
+ * Call register usage:
+ * a0 INTEL_SIP_SMC_FCS_OPEN_CRYPTO_SERVICE_SESSION
+ * a1 transaction job id
+ * a2-a17 not used
+ *
+ * Return status:
+ * a0 INTEL_SIP_SMC_STATUS_OK ,INTEL_SIP_SMC_STATUS_REJECTED
+ * or INTEL_SIP_SMC_STATUS_BUSY
+ * a1-a17 not used
+ */
+#define INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_OPEN_CS_SESSION (0x13A)
+#define INTEL_SIP_SMC_ASYNC_FCS_OPEN_CS_SESSION \
+	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_OPEN_CS_SESSION)
+
+/**
+ * Request INTEL_SIP_SMC_ASYNC_FCS_CLOSE_CS_SESSION
+ * Async call to close a service session
+ *
+ * Call register usage:
+ * a0 INTEL_SIP_SMC_ASYNC_FCS_CLOSE_CS_SESSION
+ * a1 transaction job id
+ * a2 session ID
+ * a3-a17 not used
+ *
+ * Return status:
+ * a0 INTEL_SIP_SMC_STATUS_OK ,INTEL_SIP_SMC_STATUS_REJECTED
+ * or INTEL_SIP_SMC_STATUS_BUSY
+ * a1-a17 not used
+ */
+#define INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_CLOSE_CS_SESSION (0x13B)
+#define INTEL_SIP_SMC_ASYNC_FCS_CLOSE_CS_SESSION \
+	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_CLOSE_CS_SESSION)
+
 /**
  * Request INTEL_SIP_SMC_HWMON_READTEMP
  * Sync call to request temperature
diff --git a/include/linux/firmware/intel/stratix10-svc-client.h b/include/linux/firmware/intel/stratix10-svc-client.h
index 9bb46c3cb0f8..edd7953d5d08 100644
--- a/include/linux/firmware/intel/stratix10-svc-client.h
+++ b/include/linux/firmware/intel/stratix10-svc-client.h
@@ -122,6 +122,15 @@ struct stratix10_svc_chan;
  * @COMMAND_SMC_SVC_VERSION: Non-mailbox SMC SVC API Version,
  * return status is SVC_STATUS_OK
  *
+ * @COMMAND_FCS_CRYPTO_OPEN_SESSION: open the crypto service session(s),
+ * return status is SVC_STATUS_OK or SVC_STATUS_ERROR
+ *
+ * @COMMAND_FCS_CRYPTO_CLOSE_SESSION: close the crypto service session(s),
+ * return status is SVC_STATUS_OK or SVC_STATUS_ERROR
+ *
+ * @COMMAND_FCS_SDOS_DATA_EXT: extend SDOS data encryption & decryption,
+ * return status is SVC_STATUS_OK or SVC_STATUS_ERROR
+ *
  * @COMMAND_MBOX_SEND_CMD: send generic mailbox command, return status is
  * SVC_STATUS_OK or SVC_STATUS_ERROR
  *
@@ -190,6 +199,11 @@ enum stratix10_svc_command_code {
 	COMMAND_FCS_RANDOM_NUMBER_GEN,
 	/* for general status poll */
 	COMMAND_POLL_SERVICE_STATUS = 40,
+	/* for crypto service */
+	COMMAND_FCS_CRYPTO_OPEN_SESSION = 50,
+	COMMAND_FCS_CRYPTO_CLOSE_SESSION,
+	/* for extended SDOS encrypt/decrypt */
+	COMMAND_FCS_SDOS_DATA_EXT = 82,
 	/* for generic mailbox send command */
 	COMMAND_MBOX_SEND_CMD = 100,
 	/* Non-mailbox SMC Call */
-- 
2.43.7

