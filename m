Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013066.outbound.protection.outlook.com [40.107.201.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60420224D6;
	Sat, 17 Oct 2026 15:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792251219; cv=fail; b=VZ83o0ip4yD+2c2wY8CUqL/SM41nYAKwYIFyrS+gN18YnQU+pn9B98LdwVtEd3DZlUdW+nMDHa/yYmJQcSuUSfBNhrAx3Fj6F0XTjM803ZKv+PNlXRsTtOOkQFJHMJ9TFfO3PIxcCa/GXfyvV9OuqUXru9radqF7W+9CrhGNVOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792251219; c=relaxed/simple;
	bh=jJ97gZSfJT5DojwE+V9ygaANR7PTsr4P041LWXNE8xA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HsP0eZP20tsOUlb0AR/t9QeZ3fn9oCpCBRg471W44GhXH9uuIzAtGwzvmKQ2wz3nRVuNPnVowjcHrv/YLfOSbpWF/sUqO6i3SdeB/PS9dPp3OYM6XfpxHI330WYUb6aWP3N6jAzYXGJVhzcawIq3ogv1DHAn2m0Z+MfPCpLsZeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=29IlFVf/; arc=fail smtp.client-ip=40.107.201.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="29IlFVf/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQcYKvr7yBI3YHt2/S/qNtaxkTmQLb4ClVyDQPkNWfVuCRdCfc0+FQ3CVKJpPtkntMKJbXPny5qtbCFXxWSSzmoYwnnU/x7c1KM5XSfJ/R11LfoHsW0do6yHjgt5LU0o9SfjP9t5zh1sWifzXWreED2QBecH46bHCS8j6ImaNUFONl043uqgvMTtQC8XlYtUEvIGCVVJIl2rEFo2SqSrkjl76hzxJYwllKmGKOGHWGOFba4jup+C1DrapsLnP/de7Hgefnws5djtn/SNvQf557AUrn0ioPpSeyJpRMOTTqnjD8rs6gLa5bWlkjJXwUpFhxNAi4ytRg9uKVMB8CETuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMfax36ZnOCcC3wD4eCRfHtNV2fvZARr73a43x+0/dg=;
 b=Tq1CGCmAh8fPEpkYcSK2d4vcyDgytK74yMI/EPhjI3+xp+gc0Zo8xP354bH3qXDqUzB8NcM/aPjbds8hHdAOhNxN7cj+tJzfxU7TbPQwvcbzjJHKnTQWdaBDT9KmNI942vK6pkFhY8MEKw750+rkX71nHv383QZTsoQoNPsTiqsAya+qaSmfUMoArlvelfgqfl8alPBYV4dxiFM7Duf4PZEbG+tlEE7sbllB13wLKRo0AqxwT8MOQ38vY18lfmppaQ0oYvSXSRdDji5kmjvwQRXx03uZDp5WFi0St5SNKZGfZ8m+4ts6vxE/tEfJ1HzC3rgZeOzAT6HgP++ZB64xfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMfax36ZnOCcC3wD4eCRfHtNV2fvZARr73a43x+0/dg=;
 b=29IlFVf/VF2p5TKoymmR6F03KuJ/FNG2itmyujii92UFMZJmxHkVwC08KQsHEtjenVTIHcFFyG/iAD+PW5c99jRsDGzQS9LHhCDBAvgtZcig+Vh9/8GjszSjiOvJBncdbiP3LqsfZPXgzU7y3do4s1dlt9S8D1I7vC7DOerHzyo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 MW4PR12MB7214.namprd12.prod.outlook.com (2603:10b6:303:229::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.13; Sat, 17 Oct 2026 15:33:31 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0522.016; Sat, 17 Oct 2026
 15:33:30 +0000
Date: Sat, 17 Oct 2026 11:33:08 -0400
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
Subject: Re: [PATCH v7 6/7] x86/amd_node: Restrict SMN setup to AMD CPUs
Message-ID: <20261017153308.GE359037@yaz-khff2.amd.com>
References: <20261009090111.151878-1-wanglin@open-hieco.net>
 <20261009090111.151878-7-wanglin@open-hieco.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009090111.151878-7-wanglin@open-hieco.net>
X-ClientProxiedBy: BN1PR13CA0019.namprd13.prod.outlook.com
 (2603:10b6:408:e2::24) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|MW4PR12MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b889e1d-9d36-45b0-1456-08df2c63ff4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|22082099003|18002099003|10067099003|3023799007|11063799006|261009223027099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	HJi0SayVarwv2/3p55ngM1L65neen67bRXqA4xrarEh+q2cs4k/0JRiq0p2K0g7PyvT55Ujw8qc1Wq4iRoexR0gYn1qxXg9E7+3gRYBGAryeO7DB96U7wA5Gieus3XXYV8VWcDSqjQLjFSDcTDKZWjwNdGPFFL4VBSy4UHbvInEpTiKG/h8d0A1N6f71lG/pgCSTDWUWVX711Y3bWQAWRHe6wrkFDbT325NXmKFpP4Hd7UB1Q9faj77o+NWqivf0whAvWut958dy34kzVqYR3BEa/edHB2tvAcVCZ1lj5QZ21ttSQwC9OZLMg5y/68av0w+6Rx3SKGIVTto/36Pom1akJ0Uaq+Sj/u4R78M+IeBQErWDJTsQ1E/kFdhzLGR+fbp0ZcHKyja0ssuw55rMAx+EKc41/dsGrlyKP38FkN6XgId74UGHIyw0cdrrkIxaXHxPI9orHeq7OXyuxutuQPa9ROYprGWfvfhdAetT5zCl2Pk9E6hzkJRuigXI8xici3n4AiuoehPkFMoGxu9+4eXgp6stXk1LRqIloaizUenCHnCAYnXRvtDF2iLVfzbUFOwCCunG0CY87+j5EoG4CEftywme7LKn4u2nntzhHnfLijIFcokYOQPw9bs8GRUEHW8qhFGdisDwrdr/lPryC3lFSYpb72paZ7j1EL8AGrI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(10067099003)(3023799007)(11063799006)(261009223027099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eqMpG3MfMdCPcwb4tgYqLCL0QkjmR9xqtVOUl1vFJEgft1g+MvO6EEPv7Nzb?=
 =?us-ascii?Q?I6l5vI5Fimx16hVMvbtgJFdbpeaIxldhONQtWSb+VAIGSSzsXOWjiGm4CZNd?=
 =?us-ascii?Q?MNqJ1g/iVvtmLSR0hqWbBA0H6m9iXmpZUlqEcfFsCHEKPLLsRSXfogDcMZwW?=
 =?us-ascii?Q?v56x7n3k5gEyuZJTQ3vc0428zF96V3yKc4nd1gtaTVdBLo3Nr29xHA+OLP7K?=
 =?us-ascii?Q?2igH7qNRPMnpSaK2my2s8dzDsf5sxyxubIAJ9ddPNA+mk6LrtxUkbpAWPayN?=
 =?us-ascii?Q?qZxhUcXKwILE3GeAjol75eBWpT5l429jPKYbfUGcuDhG2YBo5EOmv314iw6W?=
 =?us-ascii?Q?1nN8IBzL2+speZVWzU+2n8V2kY7zZWX6SleEk+upmi+t2IR71ul9q0lKcNJy?=
 =?us-ascii?Q?pz8p0fjzRF7KSHTRtdgU7EsccvHnzC4nz1wxzIkCYCSWO0bI3jG0Vy+Lvg5W?=
 =?us-ascii?Q?sNNl6PHQr9ft9SpN0lV+fwkc03aq3zQi/pLZfH8/2iORd5F1vuBaV57qLqxH?=
 =?us-ascii?Q?OyyxTTJbkQJQY6lGBoTo/ZVmpHgYFSLlEJiS6oP0Pwnls+MEMltDatr1tD4B?=
 =?us-ascii?Q?Xwl5EPFm+82IyyO6nWAUiEVvLpnYk31STPHhiQh23OxKMLOOtNh742jDeYGp?=
 =?us-ascii?Q?zkFvTZ9Fe6mUxcqFUCOjz+g6d22eZ50eu48lV3m3E1pdCzvr7ZTO7DRcVmKa?=
 =?us-ascii?Q?rzqnQm+Au/lo8sl+Lej7Dxs4layy2xIxnHuxjcZNtZJoUxscwjCd3VjmIE0W?=
 =?us-ascii?Q?f36+fUGPlJmaqZKVPXwzytSrHHF+XtHsD8dp0hig8HYMw//MX2fuk2gNp2IQ?=
 =?us-ascii?Q?EuyKg5awOPbCzPiMhXxcf+KV7amXrNnAa4XUKafrCUdi18aGH6UH1VG+6GWs?=
 =?us-ascii?Q?/lwbI51o6J8UIkDkQAS01erOBUU4jNtMIU583B3Cel0pUmN8Dmm3H6ku1kWp?=
 =?us-ascii?Q?52Cdw31tc1Mm0BYlX85lHmA2030zLCQvhX8rBYE3l8PRDeWfAWcTTwvPJVgO?=
 =?us-ascii?Q?nN4U3NCGtXD3M+hkPiX8Fx8skzhS9ig/f0RUHQ6oDoV7TlgSRmzn6595srOM?=
 =?us-ascii?Q?XiCIGRtKN2Tda1q/C4foPf1Lwf2WJAEYTer6FYa9F35GezupFZwy3yz7+jr9?=
 =?us-ascii?Q?ubrPeiUijced0etSQd0gt+GofcXERyRH9PWkD5N/mei+cJOSOkjeODc23cqC?=
 =?us-ascii?Q?W14ehmfCaBY215dvi74u/W32HUUQFyRfdrjv3s+xtJmy97AxgEtFMKOrhP6Z?=
 =?us-ascii?Q?CCEqZ87RlXLYr4jeoIk41gLApO5ZDpf327/s5dnedCDBIVQS1FzllyqFPoEo?=
 =?us-ascii?Q?+pCJEEH9hyWLc3ayzsrc5A+/3fSYQE0PSlIZudadpaEcwfebcKHxbDTxfGxQ?=
 =?us-ascii?Q?qYYkCbdnNF4NO9JPP6AjEFSrScSJHILg1PK7Ik4jIpLip1+npLg82mRNfYwz?=
 =?us-ascii?Q?NPbnJ2NYGMBqwYVB1nAjae2sWHg8Yo7d00qjcH1970s8cppDF99+qxjUEn8F?=
 =?us-ascii?Q?xEwgxGQg755HnHM5Y8FaSjLieGhP3/peYunVuId9PlwvOML6RCsMQ39JdQaL?=
 =?us-ascii?Q?R0NoPQndyBdA8P/PNvk1WC2oow29jgPJ1BN8Ho4BQSwAwIm88Tr481Xew40E?=
 =?us-ascii?Q?Xa4lht3B6G5mqYLPwzfRUMpM5U+6WzDV6090A4aKkdGPNwnmtVgUxSsGk9cK?=
 =?us-ascii?Q?t38SkEnyN51/u5Brp31QNbG2a0f5QDk77aMr8VXreNz/SsY8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b889e1d-9d36-45b0-1456-08df2c63ff4a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 15:33:30.7716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90Gcrx2xZyMe2D9eojU5+ShrOP6WSfIYiDnmB2lcS6mfR/kNJCcFAFqsNyqoRWkOigadM6jC64O6OoubGBG7aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7214

On Fri, Oct 09, 2026 at 05:01:10PM +0800, Lin Wang wrote:
> amd_smn_init() also runs on Hygon because Hygon sets X86_FEATURE_ZEN.
> It reserves config space on the matching host-bridge roots and groups
> them by the CPU-derived node count. Hygon DF nodes are enumerated by
> PCI ID, CPU NodeIds are sparse, and the nodes in a socket share one SMN
> ingress, so the resulting root map is wrong on Hygon. These reservations
> also prevent the Hygon node layer from claiming roots for its own
> node-to-root mapping.
> 
> The preceding patches remove the Hygon matches from amd64_edac and ATL.
> This change also requires "hwmon: (k10temp) Stop matching Hygon devices".

Suggestion:
"Hygon vendor matching has been removed from amd64_edac, amd_atl, and
k10temp modules."

I think the note below is suffient for the k10temp patch dependency.

> The remaining users match AMD PCI IDs or check for an AMD CPU.
> With these changes in place, no in-tree Hygon driver uses the AMD
> SMN accessors.
> 
> Restrict SMN setup and root discovery to AMD CPUs.
> 
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>
> ---
> 
> Notes (hygon-node-deps):
>     Depends on commit 08e6615c909b ("hwmon: (k10temp) Stop matching Hygon
>     devices") in hwmon-next, which is not in mainline yet. It must be merged
>     before this patch.
> 
>  arch/x86/kernel/amd_node.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
> index b7926ba3610a..c36b410d04a4 100644
> --- a/arch/x86/kernel/amd_node.c
> +++ b/arch/x86/kernel/amd_node.c
> @@ -229,8 +229,7 @@ static struct pci_dev *get_next_root(struct pci_dev *root)
>  		if (root->devfn)
>  			continue;
>  
> -		if (root->vendor != PCI_VENDOR_ID_AMD &&
> -		    root->vendor != PCI_VENDOR_ID_HYGON)
> +		if (root->vendor != PCI_VENDOR_ID_AMD)
>  			continue;
>  
>  		break;
> @@ -253,6 +252,9 @@ static int __init amd_smn_init(void)
>  	u16 count, num_roots, roots_per_node, node, num_nodes;
>  	struct pci_dev *root __free(pci_dev_put) = NULL;
>  
> +	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
> +		return 0;
> +
>  	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
>  		return 0;
>  
> -- 

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen
