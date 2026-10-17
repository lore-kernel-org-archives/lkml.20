Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010027.outbound.protection.outlook.com [52.101.56.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE88E23394D;
	Sat, 17 Oct 2026 15:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792249849; cv=fail; b=fr2vwtjywyl3GbNUQMtDQ+l64Wk9+c5PSNWHlQFCQbvTevV6W97tcehWNLCQIfEGNcOuUrf/7mfjgPPZavhRuzfoXUj7LBwjixS96jo8O3Y4XVxDggGTAnzCdxQvfQbB0GOuwV82mIXxPpRMUUvy5z9u2jMHGoPYtpsHWooGYzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792249849; c=relaxed/simple;
	bh=k3bkXDdjfas8ZxXLr1PCr4QJNetwzWkbbQb/vnfQT/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aTfsEXMYHUZtO5Ny+eeDLNI7O6gW0lLDTmwoZ89NhPk0Q0bq36+A5O2mJwU1PiIY7kUWEuDK+gglLErNzaxCG13HPPR5ciMnjfvJy7S7UVTZH3gfup29zUEouDMRGFrTKjMbQKT8SPrSVi5Jg3xEcSTleCTDw0dscn5bEct5M1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1B5Zh/3z; arc=fail smtp.client-ip=52.101.56.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1B5Zh/3z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RzM3Aq+x6b33sir4Jq64Y3oC0s3TKi9vTKtEY9QgNKdGjSQYztxOm8zEHKgMH8iXF7WfbnpxsVxlMEnDocpnW4Xzqxkiyxm3CjYYMcjN9sleKsL+1EtKasQnxsAkH1OyLuAT7ALUJjdNPMy7xzBg2W2FbAcm6iOuITnlq42iaCq1Iur9jiwU7kcXzWsSxsAPJmRk4rDyNuOSVTUqGPPVDXWHBRtJrccVwt5B2JIN5ycCOjUulA7VlpgWt5n3vw4WAZLRbJrDuXBb+mBq8Jh74r4MMmyvYxp9aQszHQ4XhQlBw+HxAQM2qUtkPkUhPNR5LEsVjkd0QBBUqNWRIuQ1JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5z4tUPfU4MPLegM7jTE687iyNESwwSoJ5AKlmIzdvc=;
 b=CRIeG1RAbat0bkfrSasNMv8xGyrMmZGvw/Bq4a0R6Zm2ge25IP+kny5aEHY3/X5f+/ROJIToupOKdZl5CJk6xmDNAWeE5AwNTcjFdqVZ8yec6V8wN9rQKJ5umEACcgFFM5fj+09GgLPa61wja9d2z40ZrdvUMi2+b9cOhDWYx0chgesSix8v5j9oLMGBTvWjj4QHhxvwA/QpYioGsdi4LRe+MzW2eh+O7zoGeTTP2EHK79HhdBG+chRQl3OjiK4Gbbud/BpMIS++XNnt4Tw4nGXWJAnmzpfVRWbAz11r6B7fi5W4mAmFkAWTmT37T995xpeeLj/qc9OIQbuLE6j5Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5z4tUPfU4MPLegM7jTE687iyNESwwSoJ5AKlmIzdvc=;
 b=1B5Zh/3ztYof6FJbSf+1LhS3XAC1jnBMru0aRVlBEeQLMZNDYRtVquMHLNwlNeeBfmSz3tR5eNWqd3GgUdOQrktdjbvwlQbmqe4K4mJs+KMHN0mJZmF3HIT3Lqqz7EqjsLye3nXi4E8lh2Bv6p9k00OIfP8GbEp1ZeT5exl/LY0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 DS7PR12MB8081.namprd12.prod.outlook.com (2603:10b6:8:e6::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.18; Sat, 17 Oct 2026 15:10:41 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0522.016; Sat, 17 Oct 2026
 15:10:41 +0000
Date: Sat, 17 Oct 2026 11:10:31 -0400
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
Subject: Re: [PATCH v7 2/7] x86/hygon: Map CPU NodeIds to DF nodes
Message-ID: <20261017151031.GB359037@yaz-khff2.amd.com>
References: <20261009090111.151878-1-wanglin@open-hieco.net>
 <20261009090111.151878-3-wanglin@open-hieco.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009090111.151878-3-wanglin@open-hieco.net>
X-ClientProxiedBy: CY8PR11CA0045.namprd11.prod.outlook.com
 (2603:10b6:930:4a::28) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|DS7PR12MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 598e2b27-58f6-49b8-e7e7-08df2c60cf1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|56012099006|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	zKgqEAGy1C/8IBUoWV3chJ4Jxbr0xvpchgBWn8M+X63p8mHikzwLzpL2RmYle3F1HkBvbVCbasF7rXZ7v69jBndFPUDf2tiHW5nUWkpeYD42llUDtAmxsa4C4kff7kwpkRyqw4p+JtWGqRHQvTzop97B1DCqvz6NuT0rZg7y34FKn67RL7wws8UxpD8vZhE4g9pSODJ037mVwnKEoP9MeZQr/MgV/nCroAG9Dd89s9dpoKVMXzIEWVsMnnUQ0MQAZuP2KKODio9qfnuv6a4gu2KfjDXjleUYxJ2e4E/MWLaTDHQZl0azJKFVrEuOhZdxExec5fD7+xE6PMzWCWRVywsfKYD3xo+8c8MLNYZy1BFTpDBeRP4tSk5aZyZcErufVHR02HfckvdUJqK30bHz+xkj/11ZX9g5dp6JqVmzfOH4askg7+9X5gGXjiidYPohZM87e+Eqq4JNziiRfnS1vFpv6dCwXySAxi8zeXDuRp2Zkv28/h8pUPhRsdH2kOHYEWXuQfm9anLHmnoBTDT3dcGOJ46tEYol9bSzUOD+Q5natCgkYDgNpoLXzVFNr68D8uoxLY4C2nytp+rLp4739wGjP3TnFqZz5Ce4ndqgSf0Jbn5N7pdWkZrNY16t+AKTQt6SbcmUTwwlYO2ddq7nYOzIz3N4N9EZAStw1DujG7Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E0sF1oLFdjuCLBoUDa2sHhVb9BWGIKxm9nte4IFaP2zBFWJWtGKiHggWfLUU?=
 =?us-ascii?Q?EGQway9cgLgcb/bolDh4pOh6edbCdvNMB6FDo+6Fy/QLfatAbRuccO1d5DNZ?=
 =?us-ascii?Q?5eY3buTKVAInNhPRUL532EJFlCMimtX1MXxdKKZUaUGd9iP2Uz+4JmCoWsjV?=
 =?us-ascii?Q?TY8A8PhoKUR1ksh1cKJh7SejhmT5ll8oHopI3z5ixZXwgxRF/c8mwhneH7Xd?=
 =?us-ascii?Q?p2T+QGAguY3pvMpyfs3P6N8UeCLRZk2YnSiQarjI1z8Ji1T1pOAsu5Bwhgv3?=
 =?us-ascii?Q?2TBZdcjjocZ14wksnr1D7lV5XovjlPd5hXGkSxuJam4d9WxUs9zHtVlYNx08?=
 =?us-ascii?Q?40HKyrPeJz/IDscYH/17dlGfw7Goze3UzC9afifCJ/wzNbbXT1NUYkYTRT04?=
 =?us-ascii?Q?/E7L7OBw2Pek41mCOIzFnuX8tfmbYEk5A66QPwwq3dUtzuvDBHmbhKCH865V?=
 =?us-ascii?Q?Pk7KJNK5Y9IJhrkh5frE+ePPzfnKYwmcWi3j8x92mXKakI/GEtNRRP367g8v?=
 =?us-ascii?Q?F92Ssc7UxLtLvq/5hHw7rPiHZMdecOnXQaf0+WmpgAQNEt2bsrw2ts4nd30d?=
 =?us-ascii?Q?im6yzWSS0JYj3sdeCmnnOqTBFEY0pIn/wKM1LW9NvEqDBtZ4t1deFwIFV2l1?=
 =?us-ascii?Q?uT5RkV7WIZk8rLbUz1E0DpSJfqH7q9VOvl4BX23dqjFi5QKcRfxQz8b/yOCh?=
 =?us-ascii?Q?jj3TvPMmTua+ZNptuuBFLaMDcSAvbhiwcbDizsvmjeGMGX7LzSWbG8FfRVgW?=
 =?us-ascii?Q?GEFLHIL2Tf3Fj7OJd1kIo3Fx3FlWxf1eIh877oucyX3PVPS9uVdMGJomgZGi?=
 =?us-ascii?Q?qVpaS92BY0sgl9bx5xK0bVg55+aKUaDhlSg2ekLqMYf8HbWiObLW1fo5dyLw?=
 =?us-ascii?Q?i8K87SZdFa7pydhzCBrlN2VPt8kn2D7pxUwaQaS2Sjs6upEqkef2ci27wO7G?=
 =?us-ascii?Q?Q6mWVihnEW3csUP5xa/IYXoW5YCugT7USsPZNakKv8aFiTezdznFSIm8f5My?=
 =?us-ascii?Q?zwwEs73VVNytwj/7B1lulGHzXJp7L5kfwq95NXspbP4V4peAn4HgnluXBnYr?=
 =?us-ascii?Q?B5FiVdL2rah+mM+/U3M0kd1b0RnJ6ioakpbQxQe2Xh+o7OHOHn1E+Xvv8z6Z?=
 =?us-ascii?Q?aQD6rrYTA7WxJKp06nZ08X9hs+m/YD5WXAmsN6YOG46Z8nYnA8ElDV11U3tT?=
 =?us-ascii?Q?UQfd/+ATnQVET78hVmhvWkAPVHU76+liFnM1GEBl8xVZmaJuqggZOOdewAJI?=
 =?us-ascii?Q?RGeEGeTFdalUJog2KzmYwWwbIUDS4QUgti7jNZLJnvUJNjSHn8mn8r18bg6M?=
 =?us-ascii?Q?OZx+a8BoGGuyPiUkdbcrBDCbXAEWLl1hRiYXiq8CbmwmsRi3mb6wSTKp4FW/?=
 =?us-ascii?Q?weXv3WLeep1rxlGhIsBglcx8k2CGoCjpQz6yp6mXzCSlBaXlDYdB7XGM9hkM?=
 =?us-ascii?Q?OAUFm9HUsUsaBiY8b+D1vDOW9fBW+u+imqsDH6XAxV/MnwA/5WDSrObcvUti?=
 =?us-ascii?Q?T+JgHqiQsceYnogXUxZRJ5ybZEOxm66jp9GWZIgAbd0dSP1B9OaaVfSW69HA?=
 =?us-ascii?Q?paUCqEfBpzQj9h9WFSu+s0fXwaZ+SQ9u+ZkLY3nxHyl9vthmv5JPd5+E9tiU?=
 =?us-ascii?Q?Z4LrxQeUJFTWkTBcEoM2wmVvX4qCHdSCSOy05/8i6grstfrf7a78+KGwcRGB?=
 =?us-ascii?Q?PTt7m6SnIHcqlxtu6sOFydmntlsKIdHurPUkSx+SNtL5uRna?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 598e2b27-58f6-49b8-e7e7-08df2c60cf1e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 15:10:41.5038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SHZ78q7mATXYaCMvRpYWXFgid9fmi49SQXwUXZAImV8zr1raqVgP7Tm4esoT4ldMaDMB5kKsxcxEzRsLwWTPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081

On Fri, Oct 09, 2026 at 05:01:06PM +0800, Lin Wang wrote:
> On bare-metal Hygon systems, CPUID 0x8000001E ECX[7:0] encodes a
> CPU's socket and local CDD ordinal. The value is sparse across sockets
> and cannot directly index the dense DF node cache.
> 
> Resolve the encoded socket and local ordinal against CDD entries in the
> cache, which are ordered by socket and DFID. The NodeId reported by
> CPUID in a guest may not describe the physical DF topology, so return
> -ENODEV in guests or when it does not identify an enumerated CDD.
> 
> Hygon EDAC and ATL support will use this mapping. Keep it local until
> that support is added.
> 
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>
> ---
>  arch/x86/kernel/hygon_node.c | 55 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/arch/x86/kernel/hygon_node.c b/arch/x86/kernel/hygon_node.c
> index b83b1c8c40ea..4d492513a433 100644
> --- a/arch/x86/kernel/hygon_node.c
> +++ b/arch/x86/kernel/hygon_node.c
> @@ -17,6 +17,7 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/bitops.h>
> +#include <linux/cpufeature.h>
>  #include <linux/export.h>
>  #include <linux/init.h>
>  #include <linux/pci.h>
> @@ -24,6 +25,7 @@
>  #include <linux/processor.h>
>  #include <linux/slab.h>
>  #include <linux/sort.h>
> +#include <linux/topology.h>
>  
>  #include <asm/cpu_device_id.h>
>  #include <asm/hygon/node.h>
> @@ -481,6 +483,44 @@ static int __init sort_and_classify(struct df_node_cache *cache)
>  	return 0;
>  }
>  
> +#define NODE_ID_SOCKET	GENMASK(7, 4)
> +#define NODE_ID_LOCAL	GENMASK(3, 0)
> +
> +/*
> + * Translate a Hygon Fam18h phys_node_id (CPUID 8000001E ECX[7:0]) to a
> + * dense DF CDD index. On supported models, CPUID reports this
> + * encoding:
> + *
> + *   phys_node_id = (socket_id << 4) | local_cdd_index_in_dfid_order
> + *
> + * The CDD region of df_cache.nodes[] is sorted by (socket_id, dfid), so
> + * return the index of the CDD whose socket_id matches and whose
> + * socket-local ordinal is @local.
> + *
> + * Return -ENODEV if the cache is unavailable or no CDD matches.
> + */
> +static int phys_nid_to_df_node(unsigned int phys_nid)
> +{
> +	unsigned int socket, local, ordinal = 0;
> +	u16 i;
> +
> +	socket = FIELD_GET(NODE_ID_SOCKET, phys_nid);
> +	local = FIELD_GET(NODE_ID_LOCAL, phys_nid);

Minor nit: align on the '='.

> +
> +	if (!df_cache.nodes)
> +		return -ENODEV;
> +
> +	for (i = 0; i < df_cache.num_cdd; i++) {
> +		if (df_cache.nodes[i].socket_id != socket)
> +			continue;
> +
> +		if (ordinal++ == local)
> +			return i;
> +	}
> +
> +	return -ENODEV;
> +}
> +
>  static int __init build_cache(void)
>  {
>  	struct df_node_cache cache = { };
> @@ -536,6 +576,21 @@ int hygon_node_get_info(u16 node, struct hygon_node_info *info)
>  }
>  EXPORT_SYMBOL_GPL(hygon_node_get_info);
>  
> +static int __maybe_unused cpu_to_df_node(unsigned int cpu)
> +{
> +	if (cpu >= nr_cpu_ids)
> +		return -EINVAL;
> +
> +	/*
> +	 * The NodeId reported by CPUID in a guest may not describe the
> +	 * physical DF topology.
> +	 */
> +	if (cpu_feature_enabled(X86_FEATURE_HYPERVISOR))
> +		return -ENODEV;
> +
> +	return phys_nid_to_df_node(topology_amd_node_id(cpu));
> +}
> +
>  struct pci_dev *hygon_node_get_func(u16 node, u8 func)
>  {
>  	if (!df_cache.nodes)
> -- 

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen
