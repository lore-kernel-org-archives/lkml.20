Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012026.outbound.protection.outlook.com [40.93.195.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC194CF477;
	Sat, 17 Oct 2026 15:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792250207; cv=fail; b=KRuxPdGJweumzbkAoT3T4+YO2aZvuuF69ahD7VP3z6oQstSdNO6kNu4M94zYOZP4Jz+lSGY+cR10LJ1RV+92BZ9JWeaE+y5s9IfeDrWkWwsqA4wss6XJ/n1Jd+pRLvxkZIhwE1VvyS33E6Ufe2p7maAlmtq4paz00mVMm3018+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792250207; c=relaxed/simple;
	bh=josM/6KsGbOZAqUD9jXdROZResECruYWFl7fchGmdV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=as2V+zKk1OTkYL/Dox9RyPafYB74pmrs+Ewo9lUmaL22jXEjedu+c8aZGdIjuNMix73WrycFkHPZWtA4Z6WV+67oyIGnf1GcUBHuN7ANFPcx5o9UQI3atkBrinhxZONNIBpMyzpmyDQL42YxL9DVvGN5UJ+vp5APJbuYgHdOvEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bKEGpEwb; arc=fail smtp.client-ip=40.93.195.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bKEGpEwb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewS2dwlCOfFZZDqD5wqObTP6P+qEwmw20zwksDa9RDHd70d6mxTjIv26OUf7iKlc9lWgSx0vEX0cEJ3baWHuGynsBu5iWF8MwxCC2zA9/IT3Kl9yz+MpfXVjN/o0t/lqlDyGX6AFAomLcUAp3HyBCQDgzvKoQ/2UjBjlEzCoxkj7dgDGdUhr1xX+DIEyx7sSgqHMujS9h9uh0DOQjff0pF/Zi7oh+I+06asjCr6FWsIq7hR/KOV5NvDJ3SYiOtoMJ0g1LwP/ulSs5Ah1yf5HOrCy75XJLyA8XlvWN2C5smrGgIYeBO6qDaWXJi4Ay6vCGdCLpqzSgrpCMpLpDazLPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I39IxhZ24NA3bArM1SStAIz2zYDBZRnTp1KB/x9gi48=;
 b=IwtJSOgHpNibK9dzpbEwqsGE0Qrknayfj5tOx/dmmB1f0ieKnXZVtTsdXztuHVBlBSkX3l1fbvGL5X/kVpsF4TJ83MYTG//DPxkOrh3mQjJT5uixtG4NWQcnFB2fU9hH7VsaSTRYQFbu5nVXX2O3Ep+P7JB0w71m1SuKn7SsdnozIw+WcPV7BgafCe7blqnjlljS+05aWNX9XeSA9WJ0Z0akBKYHDbg7+o0P+x0qFEAvAnPFNFELWlRzrDPp/V4LJ0z659eT+RcXAsyDFP0VLdqin0bjozFtZovqjBtN5+fReYf1Cvz9tJ0Ym0lPA6hn0pUDzKaDNnT2uO53lS/saw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I39IxhZ24NA3bArM1SStAIz2zYDBZRnTp1KB/x9gi48=;
 b=bKEGpEwbzmg+qyJljn+r+WJHav689k/LRsPZO8OM+KWQR6ukDoCgPwsUMd9iAKJSodtDwDHJogKsppt/SLn8XE8PxOSw/OkYypKcAdWgb/ICdvZz6r4+8ozlMd3eHqK84cbBy2W7SRfmir5h7d/git4Wc2fe+wLHztXIWiut1rU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 MN0PR12MB6174.namprd12.prod.outlook.com (2603:10b6:208:3c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Sat, 17 Oct
 2026 15:16:42 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0522.016; Sat, 17 Oct 2026
 15:16:42 +0000
Date: Sat, 17 Oct 2026 11:16:36 -0400
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
Subject: Re: [PATCH v7 3/7] EDAC/amd64: Stop matching Hygon CPUs
Message-ID: <20261017151636.GC359037@yaz-khff2.amd.com>
References: <20261009090111.151878-1-wanglin@open-hieco.net>
 <20261009090111.151878-4-wanglin@open-hieco.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009090111.151878-4-wanglin@open-hieco.net>
X-ClientProxiedBy: BN9PR03CA0112.namprd03.prod.outlook.com
 (2603:10b6:408:fd::27) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|MN0PR12MB6174:EE_
X-MS-Office365-Filtering-Correlation-Id: c5d59ea9-3bfe-4f53-abfc-08df2c61a5fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|11063799006|4143699003|56012099006|22082099003|18002099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	/ld+yCeuTTnKlfQVZY5zJFngQVy4wvNNsMz46JYJlXxIdGfqJ2iKBlRYcJp/IOMDenNcuao2hkNCcodk8OL7yQvH2kdjgFOhJjLN/HIUXALCB2/rWOUqjslMDMR8BkTpRQEC+AGSn7F5vDLrQaQJnMDk2Tka3dPggqGkQ0bqmBs8ZBGSLxfZmTfkfxShq7qP53ah7povv6fuwUZAPB6E9UPO+7UGHNarsFztiByLNYvGGumDR2Mt0wpy069sVTPUCvcXkR5U1WlXqvRggeAY45PWJIhoC2kBKlKHjSDHtxEkmdUKmlWnFZb19z0OjNMjBBfHmGgUiSQ1Nz9S5cSwx6553/zVfoY1Thaw2EgzFjQhXnCNaYh/IqaPD85BBEUdjMPYYdKEjyZFqOfNPCHHDws23eDUMpZm5D5kn7nBvVBv+UOl7kCHIMtxsfCd75IxlBmORX9SbxusPJxL6YO6L/RSFoVlSpocDXAXzhfv0qdIgE4rN0HePEf9jsxnQ/ZkfG04dePJuZpP0gm5/zadhb+0uHgrilVbVUScNlXf37YRy25D6VCWgYl8NnZPFms5qU5QZeGbzVq+cHzIMerwdhvVx7IHIyFvBJCua8b7Qj8pt+QZRA0hSuNiimBruNGoPtypDPVC/ENfhUJ/TKlEcpyamaL7FKiBj6D/HTWrkk4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3Pr22oudNtH7OFUncn9aunTAbvlADSZetGpgRE/hlI4K0iMZLYvQKwfs7URl?=
 =?us-ascii?Q?uW3wwnxTi3PcKNDed+OZj5NPO16HyNxCBCRigS2KMYNvSVyXsMbSsBS6zO9K?=
 =?us-ascii?Q?Gafqwky+xME5+eRYYNlu4z1HR1Xpr49PicZIFF8hc/P2BZHIBbG+O9GvJX3H?=
 =?us-ascii?Q?0zKhPlNBdIMrTcVsLwW+LelVDffz037GzCYJCRWmt6XYne7sBoX9oLxiero8?=
 =?us-ascii?Q?7ggITZEZY+Ysw3hMbvAB4QloJgVhlMz1lu+ZrXolJIIVWrJP8vTX83v4qiY9?=
 =?us-ascii?Q?ArH980H78kYvm/WB6y3MkOKiljhkGMRd6n1WfKd9UuWaC9275iZj3bg0ztdh?=
 =?us-ascii?Q?hku/iAp7wn7/kaUaLKKJol4ycOxZ+zOWCoszZF1pZUh53tzUoAJwxpiA27Ap?=
 =?us-ascii?Q?YCVjXhHFh2j93yQe0Ildpm1NVyoEkA0T4LBF/ao5i1NgoIRCRCGZQENK9HK3?=
 =?us-ascii?Q?m95T/YKvPlao3lZ5lZxUITN2RtK4CLe1w7iIl22QUvyTEk3firFuXJMg7R9K?=
 =?us-ascii?Q?McGJ1m3EewJjz+kL4o1zxOzQGbWb84LUwKae9SFvtLDPHcXtKv89J16B3fE6?=
 =?us-ascii?Q?DK9+tq2VACHx3rcqib5P8vXC01k06xRkRCvTQz+IbaUEKCMqRglY9zPC8UKm?=
 =?us-ascii?Q?rI4CcKhMp1lNWLLVmHXHcJ7BmcPBUSNn99Z7pjkU+POvPF6aeCAXzaiMsLZs?=
 =?us-ascii?Q?ie0aI7TASh1rux6v9WzdBfPhKuHxuy3Z9Fj+aKWqx17GrANuH2H7vDmJ4hmK?=
 =?us-ascii?Q?AfpGGnCu/uuDl8wRMfXpRSC8HYRNI3tMtxfRkTkQStcvT1ROpxaZWiVw7W03?=
 =?us-ascii?Q?WbdRDXC+T6irskbcIGsDzdCDOK0yycX/vcX00dq0zPeknLvujH+lI0UonIk5?=
 =?us-ascii?Q?+rOYW9zpUo79TYXwvV6SvulVJDgcrFufgOAHBzzwqzq/V0VI9iiGkIwwiEyy?=
 =?us-ascii?Q?1lnAeYQP2lQKSKoHO3jlsB44S6USZtSfd3g1OZyaA2Ht70wClojn+lG6RBz4?=
 =?us-ascii?Q?EoMrPwDn9L+bDbCLV2sXi1RMk5MvSAsYqB40q3/v1rPpXRJ6RXBeKU0W03lz?=
 =?us-ascii?Q?k3q6W+7H/31bnpKFi/MjTnAXYIaV+J2kyuH/qQ2CgnLSCUXJv08TKT2Tu9Xm?=
 =?us-ascii?Q?Ae3zYFw7hAm49djpFhcnWXbpJU/wVVizaKpgN+ljUXE/Cj6YxspCKBuMJWAU?=
 =?us-ascii?Q?jN4/t/45xh2wafhl5Naj9Iwm0a/HGf0cZYVmm0BDpgVWsxY8+7DXEBzq/Q6o?=
 =?us-ascii?Q?rC0PXhKMnjJjZHWU+rS2/VusDP1zrOuv6lmmIODU04y4FTKfitVSNWF5QFZI?=
 =?us-ascii?Q?ZnEheGYxBZMTt9556zOBBuc5MxPuf3mYhLAbC/Dx9DmklX8wZMYitRVRLZ2Y?=
 =?us-ascii?Q?LYnvctPZOC6IpR1FtQ7Xj2ZtxMb2CQ1zjqLR/eUPd8NQgOa9OiwvKwjjf7bV?=
 =?us-ascii?Q?+9iEAEL/3oJWsY46zWfxFM896lNpnf8ZphVfrOPd92OKNEqg3QHyNbdJvZr1?=
 =?us-ascii?Q?0eEFYloYBl+GZSGFhtDmZ/HJ+b+PDOd5kT3e0s4CdMzcn4SD0KrFWVBRn9+M?=
 =?us-ascii?Q?gpwaKYM2NVMmolNOXHWTZmQBgt5oxItk/BMiyKwI7JdwDOdtOMi/UyV2wZrl?=
 =?us-ascii?Q?WuzEYh9bLDnczWGaGbae0wD2f+ZgBC0mg3buPvOeL7irGsP0kOO3HtQerCUF?=
 =?us-ascii?Q?yOHjSBRieElizclk4haclfk3acNDwygWmXdyOvwbdMiBz2Vi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d59ea9-3bfe-4f53-abfc-08df2c61a5fe
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 15:16:42.0226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RuC8dTROgYhWLXFiq5hxgWAEGKEl71/jC9K9RdAFFzKtY0VL/uDqN9Au2hSUGfQ6v/U22ZwlDXD/S4xhED0q3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6174

On Fri, Oct 09, 2026 at 05:01:07PM +0800, Lin Wang wrote:
> amd64_edac gets its node count and DF devices from the AMD northbridge
> cache. Since commit 49b96fc0dddc ("x86/amd_nb: Simplify function 3
> search"), the cache finds function 3 only at the fixed PCI slots
> 0x18 + N. Hygon DF devices are not at those slots, so the cache is
> discarded on Hygon and amd64_edac_init() returns -ENODEV at its
> amd_nb_num() check.
> 
> Remove the Hygon match and the empty Family 0x18 case. MCE decoding
> in mce_amd.c is separate and unchanged. Hygon memory controller support
> will use the Hygon node interfaces in a separate series.
> 
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>
> ---
>  drivers/edac/amd64_edac.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
> index 475235c402e8..9e35098d3dd2 100644
> --- a/drivers/edac/amd64_edac.c
> +++ b/drivers/edac/amd64_edac.c
> @@ -3840,9 +3840,6 @@ static int per_family_init(struct amd64_pvt *pvt)
>  		}
>  		break;
>  
> -	case 0x18:
> -		break;
> -
>  	case 0x19:
>  		switch (pvt->model) {
>  		case 0x00 ... 0x0f:
> @@ -4120,7 +4117,6 @@ static const struct x86_cpu_id amd64_cpuids[] = {
>  	X86_MATCH_VENDOR_FAM(AMD,	0x15, NULL),
>  	X86_MATCH_VENDOR_FAM(AMD,	0x16, NULL),
>  	X86_MATCH_VENDOR_FAM(AMD,	0x17, NULL),
> -	X86_MATCH_VENDOR_FAM(HYGON,	0x18, NULL),
>  	X86_MATCH_VENDOR_FAM(AMD,	0x19, NULL),
>  	X86_MATCH_VENDOR_FAM(AMD,	0x1A, NULL),
>  	{ }
> -- 

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen
