Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010052.outbound.protection.outlook.com [52.101.61.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9713EAC8F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490120; cv=fail; b=IdNqt3qTJFBG1tDevGlXYmFdVc8F93esPSH+N+9Ho3UBzlvxq6iZnU4USgj0c2pcwIwhU83BkR1crSeLiDjdmCiMp6Q92lIbYDmGUsIvyWgczFuZgQC0SeRmo9Neb9/mq05qmhmHTM/BM1zm5xwoiUN03T7FUc/LujW8yoqnJ04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490120; c=relaxed/simple;
	bh=xJEgy8enl0iw1sZfuBuOUreQr4keuzF+V3WZHXi8vlU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jRbofV7LpoQSlCEdH+5yIgBdAjAiKdQOXc+y6c8xI7VUzM+EEVtjiUiLpd+s8iK+iLKZlo2pxhm0DuLxtYf1XGjFoAby7tlzvHZLx+ueAmSxXlBsGxFZX55//SfchcJECOrYJPxhM32IgiLEddPowbN6TAAdc6WA8sC05r9VXHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mm8gRfQ1; arc=fail smtp.client-ip=52.101.61.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mm8gRfQ1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOu3OCmedKqjMhnyR+66jhxQRMTpLvUXJRYwqrPM3EMu0Ey4M9frxWiPoXrb3ksiTLIjimRDQfYwUiT/I8N6U4Hxgrb2fQefC99wp97jLbTsMS+aDCwYjKCee1C47IwW/P9+EFCqotp6nSmUOjG2GWZk/BWg6TnNU19JKd3hzQWnBMspIDgRjQtKeMm5CLJCD7Y2CsTzdH2v0UC6/0UBAWf76iEegf96rnCoS/mIGUNQtAOmNqsadfDgMeia8ip3EFKbJBr3cq8tE7IGk3Z5SnUDEIaNc/0g3vjlD0fb8RjI37yZWq+jA0lp8fXvEVRCowu5pkvUaddYpYTqzGbTcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Itxq/90Sng+qGjlGRtrL92Wd1ojpareqz7tXPv2M4Hs=;
 b=nuo0wrYTI6g+poTlsDOfSARdFEggc6XzGeZIKpgkLVYxOCyDW7m9zU0oHJN2J3BQumrtIjeWgWOCiCwXyg94GaX3r1JJRvKy1rc5lPDIjV4hYKq9qyXGnLbdEC/9Dd+464AVP0jnZknhg3zmgCBsOhftpvXZMxhd46OMurrFaHRIvU+ACgmVZRY9RMVtbE0lfnr1imuvfGsVhChxOJ5ZK5bYeP9yYAuwFJVkxGwVPb5zB3gK96e5eQooTYFxYNJic+gGdMTCCiS0vfaAX5DB8QdgNEA4XRskj92Cko/MHQ2PNAXyPAHFqf3ZjZLbho8GW+LMdoxMMP5KdWOTd9yL2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Itxq/90Sng+qGjlGRtrL92Wd1ojpareqz7tXPv2M4Hs=;
 b=mm8gRfQ1WFmgG0SHcGakv9ZQYg14TaRt0mXJnNkUh7MKwi9+1uPu8TN6T6bKBVRFCmT5h6xNsUej3iBvrtcKaFDS30qEOcsi2TBzZCQ2SwT3pDZ4IghGfxLQZsJTXgyWqpo8KeqHvSvPk3aJjlo2pYCLedBrE1e2pX9NO/0NTbw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by LV8PR12MB9136.namprd12.prod.outlook.com (2603:10b6:408:18e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 16:35:16 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 16:35:14 +0000
Message-ID: <6bd2cad5-65ef-4f3d-a146-d91f120c86ad@amd.com>
Date: Tue, 15 Sep 2026 11:35:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/amd/node: Release reserved config regions on init
 error
Content-Language: en-US
To: yolezz <yolezz.secret@gmail.com>, yazen.ghannam@amd.com
Cc: x86@kernel.org, linux-kernel@vger.kernel.org
References: <20260915162238.77474-1-yolezz.secret@gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260915162238.77474-1-yolezz.secret@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:610:1f4::9) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|LV8PR12MB9136:EE_
X-MS-Office365-Filtering-Correlation-Id: 126fa732-e1ea-4a4d-3825-08df134751a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	zy4ZHU5S9uo6uM5CiZHzZ/2FTCXxi874FZ92pOu5+zt8/HXLJOK2H6cD6icQ3g4zqE32TKeUYPdNKsYdU3tuDusthL/6xuRksW+TfOAD2KnoTChmt9tjfUCBSrEPP+OMgV9B7AimohLBjREjB9bxFgd6cSD5cXQgDxzA2RTLV9rrVchaVpVkuOxtcLOeqGTVHxB2nLMdbP2pZxWaqoqHjsFuGQPhRArDDfvTx+GVlka/dD1QAkm7H9mYIyaIrmwO50nMgtpCps1Gw2YmFrMLTzf+MubIsKRADo2GAVnSh7BRgbycTi2o1n504J3Ht8ZHn4kr+dk1xoPhQJUl926p2U+tbR6gtm6hLZHoC0L9q5i6mBFMeTX/n9mhnPtOBWezX+CKWteyk1XDDB0JEns1VaftP9zPkwxW7nefkBGebpQn8L7GT19DJETHkAIvKriyTXAJtiHg5amgn90tnZBLyf0TgBHGNnDqt3Q+usTdCZwe7WGbe0aoy9kfZm53vi2qUMHAtwox46WPBsX619UzfiIOWqDVW1FrRZsZU4P+pSHgQJjkXw9ki4Dcgjm5u0CWfoOVKb8oiwhvFykRX3rsb4PfxNPJ+gq8dFeKugnkoCfT9Qrlbbtu9ZjkG5PGpLd2tNKX6kNuctxoAtJtZPuow/WKDZHOmZeOv3RGrLIIPus=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkVObmYzT2s2ZWJKclh5b0lrdm9oTnZ1eWd0RDFwNHVQR2FTUW1EdUMvRFRM?=
 =?utf-8?B?VFU4YzVFTDVDSFNzQTJ6bGpZU3BUMXNBeTluNDdaRGxFQjZvWUFvZkJIb2ZN?=
 =?utf-8?B?a0svbGJ4VW94ZkpkNnlwWHlTZ1AyOXQ2R3Q4SkRJa2toYythaS83YVRpdGNm?=
 =?utf-8?B?cEY1Z2ZBdG45UnVLTXZiL1FodTVnV3V0MXhPQ1pLa0dTY1A2cTExanJwcitE?=
 =?utf-8?B?cmhHSndtNFBCUkRhclk1djIwZGdOMWI0azl5TnpwNXJieHA3K0hyWEUwYU9s?=
 =?utf-8?B?TkJuSU9UMHZHSEdhRmtVeUNJanZRU3hCT1F5UnFWdDRtWngvL2lPeXlBWFJI?=
 =?utf-8?B?NnZ2OEswK2FlTTJlUWJub1Buc0w1SmhqQ0h6Zy83V3ZFNVlteUpDRk0wMkE1?=
 =?utf-8?B?eDROdzN0STgwcGp3S2JVeUlpaThHUGdLYUIrNHg3cVk2T2daelA1YThwc1VU?=
 =?utf-8?B?cnJJd0kwQkpWNmMwdlJuNVZyMklPSWpUZjRRQ0wxb1UxQWlrcE1ZL2RabzNZ?=
 =?utf-8?B?MWJMZmVVYXIwblR1SlhKUGpmK1pqTWQyS1N1aW1CVyszUmRFcm50Z3BjNHpK?=
 =?utf-8?B?UEZYaDZ4R0tyY2FOc29MQy9aSTl3NFZsaUV4WEhnYnFVOGVOYy94V2p2NFI5?=
 =?utf-8?B?dHlyQ1BHNjB2cGRHYk1xTndyM0RRaXRYZnRNamIxMXU3S3ZrZWNKZ21MWWZv?=
 =?utf-8?B?aUhCWS9CVnlSUlBWNUg1alp5RHZXZXdrSUg4V2NNREVKOFMyNUFiNllVT3lv?=
 =?utf-8?B?QW1OU0Z0NnMyd1RaWjFrSTk3dWNXckNCenBmdm8rc2pLYTlGMWcxd2U2LzZu?=
 =?utf-8?B?dWJxQnpIVFBIeitleE9UOElpNlpIcHdVS2I5UCtBaWwyOUUzMWZUdG52OFB2?=
 =?utf-8?B?QjE4dVh6K01JbnBuUGNOaHl0SjQ4V1I4WXVMTzFNK2U2em1SR0JsU2lEMk9y?=
 =?utf-8?B?TTRoTVZtaUlWdDVTdXNjMHRMUFpQU2FnWFVzamV3UDNDbnZoM3BUcDdLckly?=
 =?utf-8?B?OTYwUEh6empWdTBmcTNidHo2c3pDeUJiTUJ1V0VnQ3FEQzh2VXV6a1FaNnMr?=
 =?utf-8?B?MzduNmplNXhoUmQwQjg3b2FubndXcis5VmdHVmVHKzlEbGlVaWxXTVRoa3pP?=
 =?utf-8?B?V0xFeHhKVjc1dm5CQk54eHQzTVAzSUw2dzNsTHhBNzBvdEtTUU0xcEF3TE1q?=
 =?utf-8?B?M1V4dUdpZWZWZ0ZUM2w2QzVGMzh1aDBYOHJ5dm1xcTgxL0NpWFhsSkc4RDRZ?=
 =?utf-8?B?VWZFcWdWSi9RaDhoaTVnZ3JWQ3Y3bmptWCtGVTFlVzB5U2NkQ3dsME93RG8x?=
 =?utf-8?B?RXU5aCsrSVBqTm81bHRlUkw5dmhSYmRTL3hTUDVhTU5reUxrNUdTYmw1VE5s?=
 =?utf-8?B?N0k2UGRRNXlJbW01dUxCZzNIL1pIWDJITEpxRUY1ZGFWakVpV0NFdEszZEFY?=
 =?utf-8?B?eW41bTBxQUR2MWFyVlFSRzJKQmdDQUlsQTg4YTNKTldHU1hBVEdpUDZYWHY4?=
 =?utf-8?B?ZDBxTmxHOGNnVDVGaSsycmdlVldCRUdnNWMvN0I0U1A1UExKMHc5dmlmSWkw?=
 =?utf-8?B?Q1dVL2prZ2pVc3Jsb3Q3Wk43eG1sd01qN3dXajQrSUx3SFp3czdQS2tRQ3JS?=
 =?utf-8?B?S2MyNzROYTNUTTJaenF1d0xxVHNBWXN4NFFkMm05bkFjYTVLSmZjb291U25x?=
 =?utf-8?B?NnNmNFpmUzBYTVZDZEJXNG1sQ1gxRG84aHUvTmFUbk1KNHlzZ1BVKzNRa2pF?=
 =?utf-8?B?WWR4cjJ0bDVDSy9jZFpWb1JuRmNva01scUZEcG1MN1lZTUpCcldiQ3BURWlq?=
 =?utf-8?B?ZXBSZTAwVHp4MzJyOHhocnA0eVJON0VCOCtjWWFRTVo2eGxRVzd3OVFFdFlL?=
 =?utf-8?B?cTBaZ2JPZzV2ZHlwS0gyOGpncFRIMWlqNGs4Wnd2SlNaS0xEczRoVzg3ekxn?=
 =?utf-8?B?eWt1dlRIYU9IM1cvWFUwVlhuMkdaK0U3TDBzeHdNZ2o4N0V6aFphUWljWGhS?=
 =?utf-8?B?N1N3S1JraCtLYlc0VmJGUktHT2oybjI4RUJQRHdndDRaL0JCblFZaGk1MzBl?=
 =?utf-8?B?QVRLQ3NVK1cwb1hZNFBscittbmJDdXJrcGtRUUZwcDF1YUJ6NkVvMkU5QW8y?=
 =?utf-8?B?WTZPVHhybW1ycGZlOTF5aEpjeDNjSnA4UmVXdkM5cC9ITVl3ci9PWXZUN1gr?=
 =?utf-8?B?NVJnUFRoWTAxQzE0V1pJK2JTS0VpbmFYNHBsd1YxMS9EbDRLZmttWlNzaWdR?=
 =?utf-8?B?clBXZ0FXOElON2dZNEVBbURMUXhUNmFCM1k4bVcwK00xOXVMNzN3Uy9kc1o4?=
 =?utf-8?B?QzY0a2NNb0Q4R3BNcmtLdTZPUjJ2Z2t2SndNUEhQNFJ0VW9ZdE5hUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 126fa732-e1ea-4a4d-3825-08df134751a5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 16:35:14.6573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X0c3eq4qcP26vqtsn2EfqHJv7MxXhp9ihQiDjo7MWb3DXxzKkaXBvO4TmNjh1SgNLgJzPLitk6Fhvi/Z3YUzxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9136



On 9/15/26 11:22, yolezz wrote:
> In amd_smn_init(), if pci_request_config_region_exclusive() fails or
> if kzalloc_objs() fails to allocate memory for amd_roots, the already
> reserved PCI config regions are left allocated.
> 
> Add amd_smn_release_config_regions() to clean up and release all
> reserved PCI config space regions before returning an error code.
> 
> Signed-off-by: yolezz <yolezz.secret@gmail.com>
> ---
>   arch/x86/kernel/amd_node.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
> index b7926ba3610a..6a96d888b5a7 100644
> --- a/arch/x86/kernel/amd_node.c
> +++ b/arch/x86/kernel/amd_node.c
> @@ -239,6 +239,15 @@ static struct pci_dev *get_next_root(struct pci_dev *root)
>   	return root;
>   }
>   
> +static void amd_smn_release_config_regions(u16 num_roots)
> +{
> +	struct pci_dev *root __free(pci_dev_put) = NULL;
> +
> +	/* Release the PCI config space for each root device. */
> +	while (num_roots-- && (root = get_next_root(root)))
> +		pci_release_config_region(root, 0, PCI_CFG_SPACE_SIZE);
> +}
> +
>   static bool enable_dfs;
>   
>   static int __init amd_smn_enable_dfs(char *str)
> @@ -273,6 +282,7 @@ static int __init amd_smn_init(void)
>   		 */
>   		if (!pci_request_config_region_exclusive(root, 0, PCI_CFG_SPACE_SIZE, NULL)) {
>   			pci_err(root, "Failed to reserve config space\n");
> +			amd_smn_release_config_regions(num_roots);
>   			return -EEXIST;
>   		}
>   
> @@ -286,8 +296,10 @@ static int __init amd_smn_init(void)
>   
>   	num_nodes = amd_num_nodes();
>   	amd_roots = kzalloc_objs(*amd_roots, num_nodes);
> -	if (!amd_roots)
> +	if (!amd_roots) {
> +		amd_smn_release_config_regions(num_roots);
>   		return -ENOMEM;
> +	}
>   
>   	roots_per_node = num_roots / num_nodes;
>   	if (!roots_per_node) {

Given this is a cleanup on failure exit path, would it be better to use 
a __free() helper perhaps?  That would mean just needing to set it to 
NULL on the success path.
