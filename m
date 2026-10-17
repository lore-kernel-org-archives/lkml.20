Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010067.outbound.protection.outlook.com [52.101.56.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1633367F23;
	Sat, 17 Oct 2026 14:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792248768; cv=fail; b=s2Sau/Ug06INgySfDBT2QrTGDWVJDUAcBUg6X35kEFzDDjZVyasGQ2PwemIU2J/9ocK7W00vHEufy+kMOsUUly7ENuaySVkc4msg9kxHeTVBTZNBVmSfYNldsPuOrW3eX+9+GzRlgjb5OXp48Q6wd49QdxSnn8y2vd4BY8fz07M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792248768; c=relaxed/simple;
	bh=hhqc9s5kAwwxLPjempAxnq9DFtkUUq0gaBTcGZZFZk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Gy/JL17mtZyQ5lTdn16pcNrahlYnJXi26fasttIhpaIF36e477uUQMc9dj4lP8YDhLXsiCm5CeKkPBDm1bzyXHb06wXLnaZh32XZ2l6eGE1GJqwZ9e5ZN+so5zMT7rXuccp0k/minv4PcD+G8dr70JvcrUdqJIksJhrX0eFe5w8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=s4BCOJsZ; arc=fail smtp.client-ip=52.101.56.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="s4BCOJsZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tNYYdRq80iWWv2huczaQBqOsSHyh+sz0ZEdn6YEFN5S/M48OBAcS71q32gTjJDDqLB9LfJCxFw0Wk5r6R9uey+wp1onXKvysFwDId+oZs0lSCSHYqCXedjHJD+xM9uGBZTzMSNqJVEP1IUS38H4zZGYgOix3dRbKeT3euE5f4uWrYNuaWukCODmMS6TTwlXeo5bUbL5ZfsScYb+EC35AaXHFK1u4OPscOYucFPSqpkWDUDKqUyMJY2dje21xeaTVsZeMmvCwyIIrbHwRJSRjNYtKMmGLfzXm2FbzCLcvEz/3JM8MejrI2Ba5+ohmf0BlXvUvAjG+6Zs5v6E19Kx1ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ciMXloz4qnPfxuuDTcp6M85cWHby0JmwgC/HJO9aCCE=;
 b=wsbcQVlOaeW6jjX36bPKr2fFFkQWkwa5QNFP9tXyqmry52p2uHEia2/gWlTARv6lH/SSpPM+EG5Qo9KrAYJdb36gIkTZcBvc89E8HWVAIgZmO7+smWe+ADNJhBFJHA2xLDSE06yjXLj6rpHDR+9Eoi6aHxc8K6dgs3yxccs7B47ttFu0npGLUBmmHjL0YWqWIovfg15no+oMWFC7ni3Xm4PmGlKUog95F1Di976kIMhe+4L+tr1ffY0dGX1P/HYww8aMJq2r9VhrP5RBKVTKvl6KOiIolsT8mpxWp2Mq0XXDHjypFskcuB5qBvks+l4OHf9dmWrAz7BUjLn1m3TS5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ciMXloz4qnPfxuuDTcp6M85cWHby0JmwgC/HJO9aCCE=;
 b=s4BCOJsZWLS2AM3WJPcosTBESRccUi0jFU/v5Qv6uttn2BY1kuJn7LY0eXKl0G+tMSq4gy8DqQYGefgJG2tLor3ihPRjA+bDcxAnXMJ+yBsKLXPy+2Qa5obv6KwowtaNdFE5vRCoXB83o1TC+dj7pm5slE8n+y0uIKWglmc1fHw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 DS2PR12MB9639.namprd12.prod.outlook.com (2603:10b6:8:27a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.18; Sat, 17 Oct 2026 14:52:39 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0522.016; Sat, 17 Oct 2026
 14:52:39 +0000
Date: Sat, 17 Oct 2026 10:52:26 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Lin Wang <wanglin@open-hieco.net>
Cc: Borislav Petkov <bp@alien8.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Pu Wen <puwen@hygon.cn>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Tony Luck <tony.luck@intel.com>,
	x86@kernel.org, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/7] x86/hygon: Add Family 0x18 DF node enumeration
Message-ID: <20261017145226.GA359037@yaz-khff2.amd.com>
References: <20261009090111.151878-1-wanglin@open-hieco.net>
 <20261009090111.151878-2-wanglin@open-hieco.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009090111.151878-2-wanglin@open-hieco.net>
X-ClientProxiedBy: BN1PR14CA0021.namprd14.prod.outlook.com
 (2603:10b6:408:e3::26) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|DS2PR12MB9639:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c6874c9-c2de-452d-56dd-08df2c5e49ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|56012099006|4143699003|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	x1PctSRY03EVnsxHS6t49SHwAFn7KRswNTFOapi3YvEQvCFLciRZCojOXLswB1Fig5LxmgAGAhNitWfzvfMzka45M7GJJQlgWivPDSEtAJI+Lmx/vVF8XXPw01DWXo2vJwnYeFX3JO94UMxIj8u+niIEHLI4wPiD2aTqQPOze1SUTAsYqQiiaH+m4blb31lo3cCIJhmsHahyo20z7ij6uwak1Ge+Gu1BMuI7cr9CSh2xuizfIy6lwmvwBOD3SjAGOSrleHVkEPdcvziS849d0j97eTMTu8NOfXz/mhdXoOLhG5UeseYvcmG+sQ9h7eHIptSEfG+yUYPPIRc1oIgSnjgn+edy5Kcy98FgHRAPCSA4oBYg3wevc/rDmZMuQAvXBdcmygzNlHQayZFhBkX+QZQQDC4YlLKKVhsVSnAIfEooSlEtdT/XT/EI+kkA9ErDRucsEMjxBerWP3ReMbFQxwV5APwH1MOjphu9YZqkeIKrxM2RZbSLlsL0byGOeXa1ykVJCxW6ZFjh/bg2Eo2j6yyyBUuOBwnTmCZt1kGEDEh6e18I3Taa+93eX62TnblL8G9wDdqvkJlXNdivuK6Vjav3Ul/0GGyjtzf68Gz6FS2LAuZCJMWxD7g0Yn5ieukYvqKRc8v2DUqEiQfSo/QMnF5C7boBd2iPTtj5BPFXYD4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d4Eb+NLXCS/T+Kra5mSW3/6aF2VDA7979vK1WSauctrWRJC/En5XKWXYAGPh?=
 =?us-ascii?Q?YR6+TFAyBTGKzn0ww8DFQc0jTOfHyJVTjJ1Ger5oMXaLYC2S/6Q2knobcbGZ?=
 =?us-ascii?Q?CEfH6rl7xvTq5e03aInqwSXb/U6FoAOklzJq3w7F/Af6YVMbp7ZJe7xOzRLI?=
 =?us-ascii?Q?55syp4Z7vdSVH/hpTGD8PPqQYyyi67Mr5h3Rv1c6aceeSMyrLRmspL+n5F6R?=
 =?us-ascii?Q?0jovCipqxMBtHPxCYy0/loNugVUeBJk9wi1Msi/0BY3P0cDNVnjkedAyZEP9?=
 =?us-ascii?Q?IUkut0MedI98Y2icGWn36kmaNU2uG1XJlZfDJBtYW2qq+LitBFDhLxjQOsS/?=
 =?us-ascii?Q?cC7PhwpjoByM0Mx5Ih9WaXOu79YDsou+dtK/DX3I0xkkRuCmXynQEnstNt0T?=
 =?us-ascii?Q?84a9+X53fTHNG8rwQwaSeUF17Eq8QAz7S1iJAQ3KTUb8mjYurzAmu+CKz2Gv?=
 =?us-ascii?Q?NUv+zkHw3FTwEf/lrfCz7TGLgS12Z/94R96SCSxS/4CpsKOMJJ1ZjLajchBj?=
 =?us-ascii?Q?Gt2n9aqPslyPCBtJvUIyxm6HsdU7+hQtcz02/hE+C5KX6iZ5BcKOGWz1OD5+?=
 =?us-ascii?Q?6vbLKi1vqIYO7p81AtGR6CVenRVgkCWpsTQ6GQE+EMnZPRPhhyezNoE32lP7?=
 =?us-ascii?Q?ds8gKXrFRizyzzGERHH1EspYFw1NYwKIveW2+TA6/r7QOvp9b+qsMeBQgkAg?=
 =?us-ascii?Q?/dD5ca3Q8dAtU/1m/J5kF777Ji9+0+bCSwdZqcwwAgzv7uWdI4vKuHrqCQND?=
 =?us-ascii?Q?cXBQxiXwai3OQ8xzmipDsGP3uZTSYD9OuG8+DmU7Uhm+f/23mnSkIJTJZHKa?=
 =?us-ascii?Q?MxVcQ0rETxhmt3DB39uxFf+YUWM4GnpYuTLJJl0kuK08sFIrIHAxH0iY9WKp?=
 =?us-ascii?Q?frFwO6KAi96wVwvAw3s++w92GXanEY6JS1FVRljyIS08qxTvMZeHC+75fVSK?=
 =?us-ascii?Q?GO9tJzGrdvq82OAO7vbSV5NzTQivYoJGyAFhdphNBd/CADADiK7gP0xXuzcH?=
 =?us-ascii?Q?50zr8FT94U8aZqxBK9k08VldjdAlEfZkfcQ7AF5qiP2qpQPS0yLXm8VVrBRL?=
 =?us-ascii?Q?Ihp/qedo4/7XXIL/nGZCUU22Xy2zJamTnhQ4CNWHUwpC8g6Z9o7Z1jrCPbFZ?=
 =?us-ascii?Q?k3slRzaJZIv/bTDTn8XOC1mAe5KTeLt6AtxoQgM0D0uyuDHzya2FBadLtphg?=
 =?us-ascii?Q?7gPIJmwzw+mxloj6wBcsimhKiJeY6cC1hGe0OstMjmRJQn0KmJELHkNCE0Xp?=
 =?us-ascii?Q?QHKryre/hOllgIQM++qFsMH4fLdDLDvmEePrO7YMdt3rzRYqGDOV7bJ6QcNW?=
 =?us-ascii?Q?63Ihs9D9wcSQ7vGKaQCw0Qv2T868kRzrey0MCol4SGGvhrADbzPyr4LE/p11?=
 =?us-ascii?Q?daO7sYdJfz3OhDJanxiL4te2UZlT3pmjxSXSYFsjh/YICoun/1D/8jE5weqQ?=
 =?us-ascii?Q?d6hOcYYHtXycnGkakvmRGtZS5CYsjDRfttmwoMKnWYIALV3LyXYcg5EOTH8k?=
 =?us-ascii?Q?iR5p0cWFrJwxxLCpeX0TC9CGrRpgdFpR2dwPMw5BGGB62JvKbe3AzYH6vvoc?=
 =?us-ascii?Q?Vnuc0kdxUF1Tjh1hShB+3qsoJxYWTyIYmVbkQy2k6DmVa/TXg9HTa8vOZcgA?=
 =?us-ascii?Q?itis/x4uA3hr31THbTbETHQOygx9FNOEAz6CX2+Ki8onZHus3yIWoL1nJKa0?=
 =?us-ascii?Q?EKWORaOl1EEtYConA/g5eQZ84CWKzQdChzGUeJi3E71xqpEw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c6874c9-c2de-452d-56dd-08df2c5e49ef
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 14:52:39.0875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bwaw/OJR8434db4bz3IKUpqyEd1EHt5VRCwl3IpIvW0UcUfdrOCFqKC1KqUEaTRjQSp5J6JwPUrbmCE44sQe5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9639

On Fri, Oct 09, 2026 at 05:01:05PM +0800, Lin Wang wrote:
> The AMD node code locates function 3 for node N at PCI slot 0x18 + N.
> Hygon has no equivalent node-index-to-slot mapping: DF F3 devices are
> discovered by PCI ID and the PCI BDF is only an access point.
> 
> Add a Hygon node cache that enumerates DF devices by PCI ID and obtains
> the socket ID and DFID for each node from DF configuration registers.
> Validate the enumerated socket set against the hardware-reported socket
> mask before making the cache available.
> 
> Place Core and DDR Dies (CDDs) before I/O Dies (IODs) and order each
> group by socket and DFID to provide dense node indices. Export
> interfaces for node counts and identity, F3/F4 lookup, and PCI
> device-to-node lookup.
> 
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>
> ---
>  MAINTAINERS                       |   3 +
>  arch/x86/Kconfig                  |   4 +
>  arch/x86/include/asm/hygon/node.h | 128 +++++++
>  arch/x86/kernel/Makefile          |   1 +
>  arch/x86/kernel/hygon_node.c      | 601 ++++++++++++++++++++++++++++++
>  5 files changed, 737 insertions(+)
>  create mode 100644 arch/x86/include/asm/hygon/node.h
>  create mode 100644 arch/x86/kernel/hygon_node.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f53047aa8d3c..1c5be275a28a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12137,9 +12137,12 @@ F:	drivers/input/touchscreen/hycon-hy46xx.c
>  
>  HYGON PROCESSOR SUPPORT
>  M:	Pu Wen <puwen@hygon.cn>
> +M:	Lin Wang <wanglin@open-hieco.net>

Any feedback from Pu Wen?

>  L:	linux-kernel@vger.kernel.org
>  S:	Maintained
> +F:	arch/x86/include/asm/hygon/
>  F:	arch/x86/kernel/cpu/hygon.c
> +F:	arch/x86/kernel/hygon_node.c
>  

[...]

> +
> +u16 hygon_node_num(void)
> +{
> +	return df_cache.num_nodes;
> +}
> +EXPORT_SYMBOL_GPL(hygon_node_num);
> +
> +u16 hygon_cdd_num(void)
> +{
> +	return df_cache.num_cdd;
> +}
> +EXPORT_SYMBOL_GPL(hygon_cdd_num);
> +
> +int hygon_node_get_info(u16 node, struct hygon_node_info *info)
> +{
> +	const struct df_node *n;
> +
> +	if (!info)
> +		return -EINVAL;
> +
> +	if (!df_cache.nodes)
> +		return -ENODEV;
> +
> +	if (node >= df_cache.num_nodes)
> +		return -EINVAL;
> +
> +	n = &df_cache.nodes[node];
> +	info->socket_id = n->socket_id;
> +	info->dfid = n->dfid;
> +	info->type = n->is_cdd ? HYGON_NODE_CDD : HYGON_NODE_IOD;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(hygon_node_get_info);
> +
> +struct pci_dev *hygon_node_get_func(u16 node, u8 func)
> +{
> +	if (!df_cache.nodes)
> +		return NULL;
> +
> +	if (node >= df_cache.num_nodes)
> +		return NULL;
> +
> +	switch (func) {
> +	case HYGON_DF_F3:
> +		return pci_dev_get(df_cache.nodes[node].misc);
> +	case HYGON_DF_F4:
> +		return pci_dev_get(df_cache.nodes[node].link);
> +	default:
> +		return NULL;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(hygon_node_get_func);
> +
> +int hygon_pci_dev_to_df_node(struct pci_dev *pdev)
> +{
> +	u16 i;
> +
> +	if (!pdev)
> +		return -EINVAL;
> +
> +	if (!df_cache.nodes)
> +		return -ENODEV;
> +
> +	for (i = 0; i < df_cache.num_nodes; i++) {
> +		struct pci_dev *misc = df_cache.nodes[i].misc;
> +
> +		if (pci_domain_nr(misc->bus) == pci_domain_nr(pdev->bus) &&
> +		    misc->bus->number == pdev->bus->number &&
> +		    PCI_SLOT(misc->devfn) == PCI_SLOT(pdev->devfn))
> +			return i;
> +	}
> +
> +	return -ENODEV;
> +}
> +EXPORT_SYMBOL_GPL(hygon_pci_dev_to_df_node);
> +

These exported functions don't have any callers in this set.

This issue was mentioned in the last revision for a different function.
But the guidance should be followed in general.

> +static int __init df_node_init(void)
> +{
> +	int ret;
> +
> +	if (!get_df_cfg())
> +		return 0;
> +
> +	ret = build_cache();
> +	if (ret) {
> +		pr_warn("DF node cache build failed: %d\n", ret);
> +		return ret;
> +	}
> +

Have you considered cases where the cache build fails but that are
expected?

We've had similar issues recently like this related to virtualization.

In summary: this failure is a true issue on bare metal, so the user
should be warned. But the failure is expected within a guest VM.

Thanks,
Yazen
