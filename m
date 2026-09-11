Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012036.outbound.protection.outlook.com [40.93.195.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB53423EAE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141950; cv=fail; b=kvfq/M88PzT6ZjgDY1BSiH6Sgr89KtfXQA4/UCFi7gtg9ACVbwo/+qwpqG5xy3+ar74zjUYHlhXBdzz5nGn84CA5Gz4BYq+oORjb0mnJ83jW2qKFiiap5NGdJ0WnVbxcUGe2PtmMoH5yK7JJchVhXeArklxmMDOF+IEOb2069Kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141950; c=relaxed/simple;
	bh=XG2kQF26/kTWYZ5BkQ3U4I+AHCFaWb8ccIvenSXkvjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eGr+ZmrdSZsS9LIVgyaq2HQBT7ffOMZvNhPcpFah4OMsq1YNgD2hBSiPRrb1hfmg/qw/r6pFv/jxolkJ7UR2drE2N6mocMZmdKUn9BH4yYdwi/gJMr5KgSKnJDBcwwPf0jfZt7m7kVAuZucupl8QQ4aoifeB0vc5UlMNwG1CaZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=mPA0xKU4; arc=fail smtp.client-ip=40.93.195.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="mPA0xKU4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6xWB3tVB35kHcLP46nrvEoGW/mcCvdYeXJLObmI5gqxqHXELlvQm0sPNAODszOOKv9gVZu8LbfMJCHNC01B5+gTcKNOid3wyOnMeSWhIAT5DJtn/gE/iYm1esU1UTNHASqScpN1XrYnSy7LPL78JPrqWeX+Ay/onFz4YgdYXL+mNIlz6ZvUGadHdpBJBPVG3VEreLDZvD+QpUNqDpxEHUmN1hc7rtjVfnanzbNo6Ca0Zb0erXj2XJAPpbxKOJi9oyiTq9i6IfcaNF4TtUFu3IpYWclISW5HdHpiOHETakBm2s+HLfMkfkLlRs2AVGtz+QmDIhOhxc+Y6v2qjkmkAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNdl1+OXRj9bSeI4ZOUJ/uIOUq+KYZUFdeodiX2dJL0=;
 b=nZ8ce0IjZS2E3LMWpli4om9UDjIGkshweDLVqh6JOS0o6lPWF5A2BdDBOXGAlRIQmlvsTZEg9C1WfXcJn0oI5PqvYg4lxPIPFL3GofBu0PuO72soczwEcQJqrPL/pRbyEke89n25SAaE9BOH8tyKq8mUABwJYrMKiAqzcjSp52ZdW5fMESI3ljraOuSQo5xzrbcABntaJ8EGsyLJpzka6nWSr4EVqIb13PnZdF/tOoN/Qjwo/LVU/HCqkLxJ2klUlfoJknkWWoD+jFWtsDNzh9oQqpUN6/eiofYVfJwJFf/MuH6ELVAyCnxeF72Ai/fsPSiKHgL0xk5I/LmpPqoeKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNdl1+OXRj9bSeI4ZOUJ/uIOUq+KYZUFdeodiX2dJL0=;
 b=mPA0xKU4Ma+p7MOQsg97l/J9E8jTXphdLn41jpLIzTfrLtnWWI6ZGAruX9zAwEulrSCKNBBCZuNNZwt5h0X94HjGrNIx4Gg4M89D9zlRPZNVtARt93cokoC20QUafIKTzBxU69FnOFkePF2AhlXE0RvxtAy+BhRoFKSFblsFXVf8JGPtIm6GwJ9bEP0Nbdpd4vKxGhphCpS+XbgqzI3H5RZb6LS9+qocB+NE52w0KDPBWoRzevd2rfU4gd8nrCbmMRNATaLXAmUnccASOoLwYO6C7mX7PKnuaKws+lztMz1cjAJKk6Bfztk/GIy+vIiEjklhGnkiynMAbS0UJCyXLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SA6PR03MB7878.namprd03.prod.outlook.com (2603:10b6:806:42e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 15:52:25 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 15:52:25 +0000
From: adrian.ho.yin.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v4 0/2] firmware: stratix10-svc: Agilex5 SMMU DMA coherent support
Date: Fri, 11 Sep 2026 23:52:06 +0800
Message-ID: <cover.1789141361.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.v3.git.adrian.ho.yin.ng@altera.com>
References: <cover.v3.git.adrian.ho.yin.ng@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: d83262d5-2419-40f3-4692-08df101cac6e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|55112099003|10067099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	5pw+yChx6kjWfxBrTGUXjm5Br3lYNDUvrP/zgnsYg+cxOEhU/lb1oeulY24r4ahHLxpo7QiVftQ2wa0Erd9A4iwcIim3bNeA/QfzeF97vXZOWULXsym57MK4yCK2PP+vOEtiLGcC1wm11hydm9kpsmaEK0gnfTvimYtr0PzIMX0Vv6tBByAuhkkPzeG93ehXI3uJJFEItEvlBtzNo55ICEXP69unALQySxsiZpD9oWeCfbjW4wdnxped7JJmYshWAf1bRarg/EtpDQeBTlDBtC532KBiq6aTMrOzP2IdxYzcq/BUf1kE/bo6zq7Wd5pIH89LTqLjmuzVJcOOqB5Elp19BdoD2HnoySbwVN+FCzm1GJWjQvilmKJvx78qlS5bB2lMUQA9GhPz6ZQDCe2f+r1cPTGHunnD8DUmzY2wrkemioqorXUzvOSAlq2hRRxerpEtlXxt5xtRFNjm4T0PIRxLLgZrXo4i4QWJFfxXQ2YCsJ8YU09vV6Y3ZD93wNprnYPQTk31LySkjWmxkNtQAVF6xhOZCSxQrh0tEhfmjmhlA0Aq340Yd7/481PMOedhKPfZOJY6n0XIGRgKLVIcb5Kd2P7v+q7PgePUukY+s9obaat2OlC7qiCq1Nud/Bcp65MIhC8oMbFmw7LuyEBBxspobS3XZ3QNdgb6Kxld/MU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(55112099003)(10067099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FKWa5GRMC1fNvm9Pdc/f6pMfQWHjlpYArWCzAYFlzD92zwSdnEPvWMEz+svg?=
 =?us-ascii?Q?RouIcis2gKxmibncpTTDzmbrBOFhgPkgrik627w+mucN28KX9/+pC1nnS34V?=
 =?us-ascii?Q?BPT677DvsCbyJQpqgVH4KQbdbalI8zwOJcaCGq7XpzM6KcFKtjmY33QOQdEU?=
 =?us-ascii?Q?rp7Uomfzxo51/sDZOILISMzGLVyjtgrkg8geyEn/40/6FCJxUsUprdRzBQBf?=
 =?us-ascii?Q?AjhUHYywBM+i/Yysp+ZB4TRX4BZ3dEe1ZUQeHpEc3aIchGCR1LBkznMclQl4?=
 =?us-ascii?Q?MRTEvv2wkIP08Odg/aDahWCS/jsomQP3BZXp0HWwHGGK8/k4RDGRZu5BXBD8?=
 =?us-ascii?Q?drGI+tz9uZr6CZYisDskliLgTZrBkIkHhuQWjOqo5lM/bloWTawwETx5qm2S?=
 =?us-ascii?Q?HbmCNKoc9uB7vgYhhvnAc67VKKAleeKPDPnNpQxXMFxX73ZD9Gozrx9wezlf?=
 =?us-ascii?Q?2RgkMt2GJ1L1Ww2m6NJvlmf5wjbYl5eCKOYOYBomVgn/iX92rPVf57ZIMbPE?=
 =?us-ascii?Q?Xrp7KFNCJUk2cGPIZC8Kq8ft2vimgTAcLL3g+BMn9t5TnA5ITBbRk+s27mRl?=
 =?us-ascii?Q?0Ks2q9iIQnisIyGUK9cHSqpKsSs2yuut39mwmZt5Yh+gu9MqqDIsE1gpYWuc?=
 =?us-ascii?Q?PMkkiSL7mfNQk/PpMfsJMS/yEex4qBJDFR3W2t1+WYhCJ2dO+VCPu13hjuNi?=
 =?us-ascii?Q?cbW4NL0wpGse8we2qTv205LEsl0m1vLRH2Se+9ejU9LfSdJ84XtklvAog+60?=
 =?us-ascii?Q?r2hdMHjSKgp0SKqo2s8EO0GDk+aYaDC/Gz6P6/0f+f2O81RBtLZhX+h1eCAg?=
 =?us-ascii?Q?KweUiuph6jZUVTQmX+6+hWpvOoaHNZrUiSp3hVcqguuJo6/8JV1HxpJfbZZs?=
 =?us-ascii?Q?a+3XT8O097lmF9rM+F9wdfQZE7KsznkTYWvIvACQhX6IPIrktVKJ0fdJEyMH?=
 =?us-ascii?Q?USHjvRK3q7uPEba9Yjx++Ly2nYBzX6ABm/lQ+4u5g1ynyC2eeyPf1xAIDdJR?=
 =?us-ascii?Q?RnpSDv4W+FBQRPS5rPuBWJAyvFY+7k+1wfclgbeNAr5mtzUDnnYlDOITZtvX?=
 =?us-ascii?Q?JI3DPbbUcHKvzz9DxKZuwr/0/E3csamF9Wbq1+yPLqM5YeMOG2hAzP7cNze5?=
 =?us-ascii?Q?gebeQwWM/WXvoRaNt3n8koLMXEgITyFp9yWWX1pMneu8MlG42buRpg6l7xbd?=
 =?us-ascii?Q?lMbii5BrNbEMjKX56hC8Ab+7pxuWez7+DgV4zDRkbS+MCKGHaj76GuX61fYd?=
 =?us-ascii?Q?WnQy23bV/gTj13/H7xjurMaSh6UCT9+4JblDDUKEOCSzTPaa82XaqO2GKLIJ?=
 =?us-ascii?Q?hOeabBGuy+xWZb1Y7/Zwjw6d0wsQxsnuCexdutZrSVeuJ9lifHBVqUEszqpP?=
 =?us-ascii?Q?NQvPM6+g2ZpYbz/4hOpvJvw563oqf+VWh1iBzEHYnoXGOJLIiVCrNeRkC2AI?=
 =?us-ascii?Q?h01zLKoUXTGlG7NzzWpVBWwIawX0FtyfYLVDX1e1tXDGS41dHhryw8vfysE+?=
 =?us-ascii?Q?gQKNEXmj7mxrSLRHyGAo/oNszr6k8TM9IsG8WFqzvg6558zLbVU+SxTPQcsh?=
 =?us-ascii?Q?SBmo0wFMgUQND0OGqmh8TagYz/ikQ/+f2HWD2jFqOi91CdrVzkjEpT+/4a82?=
 =?us-ascii?Q?6pG23/aU6883njwsWEvMt6cdPOmsxJLPE+4W7/sQCipEoTJJwqVezh2I7c9e?=
 =?us-ascii?Q?KCnf2fxJGn8AEz5sCu4Qcbk+RJeRLlW77d8Pyb0cJGCeMOZnaWmP0wQvAh3F?=
 =?us-ascii?Q?RorLw+KR5ml4CXxuPrge6EilEIPc+a0=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d83262d5-2419-40f3-4692-08df101cac6e
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:52:25.0104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B8/49BJpcJ01lSPv+fhBri0fjCKgNLa/eL8MR69YGQv4Pzjh8m6nSVGfazp4WAtKeMd1OxWfhl9Krc7ELcKoFExbyNajabw0wtD5h0GlXB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7878

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

This series adds Agilex5 SMMU DMA coherent support in the stratix10-svc
driver.

On Agilex5 the DDR base address starts at 0x8000_0000, which is
outside the addressable range of the SDM. When SMMU is active, the
driver must allocate DMA-coherent buffers and pass IOVAs within the
SDM-accessible 0-512MB window to ATF. Agilex5 REV B introduced a
hardware SDM address remapper, but it must be bypassed so no additional
offset is applied to the IOVA, keeping the implementation consistent
across all Agilex5 revisions.

Patch 1 reports unmatched frees in stratix10_svc_free_memory() with
dev_warn() and cleans up related coding style in svc_pa_to_va(). The
list-head corruption from list_del(&svc_data_mem) was already fixed by
commit 9119ceb76e98 ("firmware: stratix10-svc: fix memory leaks and list
corruption bugs").

Patch 2 adds the DMA coherent allocation path and wires Agilex5
enablement in probe: require an IOMMU domain for intel,agilex5-svc,
bypass the SDM address remapper via INTEL_SIP_SMC_SDM_REMAPPER_CONFIG,
set the 29-bit DMA mask, select the DMA path through
stratix10_svc_pdata, register a devm cleanup for leaked buffers, and
guard err_destroy_pool against a NULL genpool.

---
changelog:
v3 -> v4:
- Squash the DMA-allocation and Agilex5 probe enablement patches into
  one commit. Building the former alone triggered -Wunused-function on
  svc_setup_dma_memory() and left use_dma_mem false (inert).
- Drop the arm64 DTS patch from this series; resend firmware patches
  only.
- Drop Signed-off-by: Dinh Nguyen from patch 1; resending with author
  Signed-off-by only.

v2 -> v3:
- Squash former patch 2 (SMC remapper defines) into the probe enablement
  patch so the defines land with their first usage.
- Rebase on socfpga_firmware_for_v7.4.
- Drop the list_del(&svc_data_mem) fix already present in 9119ceb76e98;
  keep the unmatched-free warning and style cleanup.
- Adapt of_device_id.data usage to extend stratix10_svc_pdata (shared with
  needs_psci_cpu_off) instead of casting BIT flags into .data.
- Keep kzalloc_obj()/kfree() lifetime for pmem on both gen_pool and DMA
  paths after 9119ceb76e98.

v1 -> v2:
- split original patch into smaller patches for easier review and backporting.
- Fixed the Fixes: tag in patch 3 referencing 5a0793ac66ac
- Replaced of_device_is_compatible() with of_device_id.data + of_device_get_match_data()
- Various commit message improvements
---

Adrian Ng Ho Yin (2):
  firmware: stratix10-svc: warn on unmatched free in
    stratix10_svc_free_memory
  firmware: stratix10-svc: add Agilex5 SMMU DMA coherent support

 drivers/firmware/stratix10-svc.c             | 250 +++++++++++++++----
 include/linux/firmware/intel/stratix10-smc.h |  23 ++
 2 files changed, 228 insertions(+), 45 deletions(-)

-- 
2.49.GIT
