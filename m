Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012029.outbound.protection.outlook.com [52.101.43.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C8B3E716F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493548; cv=fail; b=IADp6fP0nrcjTEThofJMoJs/SS7B1ZTXzAkBOFP/cJ6YTOh686vPSrkD1+pzjOsSMFbct0xMX1k9EuuN/xt1MjcHV/qgRwSZr3d2bUT5SjMIvYkJ3F+lIshBTEDGokS4EHVzzGUeej82LEzqaiVYneZuCrUbYWcUf6UoCbB6LLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493548; c=relaxed/simple;
	bh=rQWgDrcEOY4v4XPkGEjKPsI3gS6pmnIu0el6mtfyYlg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rEstuTHa8G6wAeSOBGpUmmhjko9AWZoQB7tBfUQcvR99Ue+IXT1QRS8N7SJnle9Uy9DJvhYoNS/s999MJ5FhTcyq+LU0g/b2JbGRZ1LMPx3UVfhR4hzJFyjjfsu5xGP5RilZGT0C4VSIDlF1/iLofWq9L3Q9GoRoCxRpK58+nwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ysXtzWV2; arc=fail smtp.client-ip=52.101.43.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ysXtzWV2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p98fWA6Hai/qwTsrztDh6gN+ktwpFjkwT7NHix31eueEQ+3L+NCX6PN8tUMFe26KupF6XkIhGN1O6y5LPeNyrmV8eQ+avSJ0qmD0+0B5u/pgkzT8Dk0kmub3U5dZX3LxVu/IefdGCLPKwKPrEW3FZvcCfe/R3iOqw3cZMSB5yK+mX29crGPwHlnYcj1dw0X5dRiDAE/7QSbaVd92msNHdsXf4mIepm9m8u1IbkEyGC3yMk4PtMMZOxkwMkJ9Wcg7SyeEuKPCu3pa69EZJAbSJpWnjsNw/k6vLWy7tc3xca60OLwA7VYkc08BmsPe5LrKcB0Rs5ZLXLDbAS6jb0tyvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZplT11zZweqM+h4hywGHfSXfXx1EiBpG7Qyco7OdzE=;
 b=jSK+MyXzIgCekG/BGBFNSoKuEfTnLCWFryMdTqiZZcDZQBt+TF1TCIrNFr0NHhbucM4lbKppobAVOIq591mvSJpXmw9IQ/DVE41tDTWmSlW8rOCm89zjpHZiKYsvGsQHQhCB7keq8Tn+r2pLimUAwaqbRXYXj98krRtW/SBVjmf8Y9+OLwLCLEV5hGTlxLMC3WE3JEs+wcwbinHguDH4qUZS2hKsUH4yadUkIeyLZLvm1xR1E9sTPHnU/BwAmJqx75RVc07JHz4hWmVVEp2vLGA5pxfSz3HQyn3Pk3dzIMuuFdchEnrJXo6sUhcn2PeAHddAVxo5F5wM0orKmp939Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZplT11zZweqM+h4hywGHfSXfXx1EiBpG7Qyco7OdzE=;
 b=ysXtzWV2f7n427JnJ6Dqyq8KDE9dxyOxjDqWpK2BFOaHbli9VSqX+9pV+6klXwad2nht7FUT7NXfsT9dpeu2oKMhnwFaBxmnPgdt8y/ZBHXySGPWt6sRbn57mucp1Xhbvz1cR4E2LdVsxsWWzVjkocVtr4zXGWFIbw1PM+ndRek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by BY5PR12MB4177.namprd12.prod.outlook.com (2603:10b6:a03:201::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 17:32:24 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 17:32:24 +0000
Message-ID: <93fe08e6-264e-4bb4-b2fd-b1540663ce81@amd.com>
Date: Tue, 15 Sep 2026 12:32:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/amd/node: Release reserved config regions on init
 error
Content-Language: en-US
To: yolezz <yolezz.secret@gmail.com>, yazen.ghannam@amd.com
Cc: x86@kernel.org, linux-kernel@vger.kernel.org
References: <6bd2cad5-65ef-4f3d-a146-d91f120c86ad@amd.com>
 <20260915172355.104902-1-yolezz.secret@gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260915172355.104902-1-yolezz.secret@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0440.namprd03.prod.outlook.com
 (2603:10b6:610:10e::29) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|BY5PR12MB4177:EE_
X-MS-Office365-Filtering-Correlation-Id: 0069698e-db20-40c1-58c9-08df134f4db1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mF1nmzWvKi2GUb7s8XpjjtWf7gWtHZJa6sQewh1FQtSq8PaPYTOJrY0lyXA91BSxVomy98vPOPhs9Vu5EZK+4Mn1xFlLz/kLxmkrZyOdUrvKulUnkeKfoCT5aNKPk7fUzNl4hZWmvamrxrCmNLpb8HkNqytJWOyNjOYEvv3gd6jQu8CSL0Hmy+yQ3jH6XzXUREkez4tnmT/3e0LUN1Q7glcNAUEgUyZXd4sCu8ellPOwY7qCNiTy6Y8IOIqzDXsxbJThwpcqK1N2BWUcCJ5aeuF+CRQN+vSBxEcwesleYpvoBXFjd2evYTLg5z42AQ2LrFU152j6mDEVZO0R8/R5exlQpguwyiLZrmjR4a3ODM44AVE8x5i07nzomrl2AzQLMYQVS0iOr2hl2yJRpFxCvBP5uBxML+L8eSsZ7mZuFa/5cmDz/ljxBcaIGwAp0g9c8D1RXiLJluJK/g7wLrOYnw/4u/fBs1BvUZti2gwys3F8Q68wLp+j/L/J0qS5soF/1qVr4nWsciA6uqE/SOhYXUtKLJuO88PMfZk/+ZII8ZjM+UecYVg9ry4Iym1jj1l0DL9cyBZVLwfwx7mKq8yTSN2zMOO52PEAx365DeEIRUkZ2KG2Zd5kf8x/W/tng24n5+f94uBUfcnhJipuPRXNiw3xVdREL9PiNyuzzfo5ysI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVRYMTN6S0RCZERqMGZoSG9zOCtKU3llRk51WEs1eHZRMVJjbzJqOXFpYzJV?=
 =?utf-8?B?d1ZBeVNPVlpRcjRvWFVHYktubXU5d25OTFZWbXhMdVV4V2ZlT1pwWEQvQ0NV?=
 =?utf-8?B?d3hUVk0wNXRmNWlnQXAvMG04aW5URlIvZzlOSzBsbnhtbnVGYjVzenJqZ1dE?=
 =?utf-8?B?SnhIV1N2c1hBVi82UnVibGpqYm15dlZmZTU3cDlLMmVvUUttc1dOcmRUdXNW?=
 =?utf-8?B?c1J6L2xxR1lIZHBZeG9YWksycit2d1pjUmFpNXdhbGFaNlloZm9MYVlpZmFE?=
 =?utf-8?B?aTRJaGl6YVFiaEJNV01tck9acnB2OXZVbmg4VkFpa1kyVy9qY1ZnRkhQOUVi?=
 =?utf-8?B?b1pYOGw2VFhlTUlCTWFEUUxqWHBRMzBNRGFxODZCdElNWmRSc2ZtMVJ1VzNE?=
 =?utf-8?B?SEUxTCtSajNmZlQ2LytTclN0UFFCNVZHb1ZwSHFvSzNZdjFGM05tVDd3VGtt?=
 =?utf-8?B?RnAvd01TZk53TUFyMUl0ZnJTODBEZFBDbjM5aE5PTWZKeUE4MTY2V1FZT2wx?=
 =?utf-8?B?WXptVFl1ZkJocnN4MFovbHYyVzY2LzIrVUplTk1lbVJ5VGgrblhibVloWTVS?=
 =?utf-8?B?RUJQaDUvVFZsUk43U1EzY0hPYjdqODQ2VG9UYXRpTjc3eklaazJnN1VJVUxz?=
 =?utf-8?B?VFlSRlJZa1plcUYxT042aE1TMGFJa2txV1p4bGp2RmI5c0JtMnRtRGxpaDVV?=
 =?utf-8?B?bVhZd3ZheG5MM3FyMTlUVzJIY3lvTU5xQkM0ZWY4YW4yUDI1SkpQQ1I3T2Fn?=
 =?utf-8?B?c2pOOWF0L1Q0V01pd2pWWERYWmxjVmFWWTFydXRUL3U1SHdYVXBOUVN1YWZR?=
 =?utf-8?B?LzhvaS90UXhMMnVqUEtDQ2pJYVV4bWo5NVZ2VXdGVWpwNWg5NVN6b05JTDJn?=
 =?utf-8?B?UDhpRWRGQi9xNXJhck5nMVNDWVlWamVNQzhsZHFKSStJS2lDUUlxeUFMc2xq?=
 =?utf-8?B?R1lSZ0ZYODJOZTg1MGhyeUpEblRMa0VOZE9pYldTZ3dJSkNkZmFFMjVYNGZP?=
 =?utf-8?B?SXBUQXhSdnpKYkdRYTBFV3UzU282OXY0WHJPTnJSbitaN2dZRXp0SndFY21q?=
 =?utf-8?B?NkxseG9wTkZYZjdzdTNjN2pQbk5haTNPZWR3VVk1THNZSmF3aGFCQ3hkS2tw?=
 =?utf-8?B?bG5FVFAxT0g0WDhLUWo0Nk5IU0VicHZySzMwMzVrL3J5YlZLVTNsUW9YRUdt?=
 =?utf-8?B?UnViVkFVbFJ6ZGVkOEdCcWVoQnU4VEkrT29EaWtqL1NMTGxnK0FQTjFYcWRl?=
 =?utf-8?B?SUdKSmFxMTU5QW8zeDJXYUdPaTlzZE5VRFFSZndwLzhVUXhsdzlDT0JTdDF0?=
 =?utf-8?B?Zm5wSm12cmxrMHhHSVkvbzZTdkRKdnlMTGhKblBHZlVITjBKYlY1bmdybm4w?=
 =?utf-8?B?RnJRWjNVUExZNEFFMURsU0NLWEJ0MlBGWXk1OW1CNTBBYkVqV2hQelA0YS9E?=
 =?utf-8?B?Qi8vaWQvdGhpQm9uQVpLc1BjSE5KZVVLeW1RaFpuZ0xiUkVhQ2Q1eW9uclZs?=
 =?utf-8?B?cmkxUm8xSy9nakFPbUxndjRxb3Yva3JQNmlCUGNia1NyUExhWk9kc2VWdzgw?=
 =?utf-8?B?T1dkbUEwQTVDSTZob3JGUExIc3JCb1M3VWRrNUhNNy9wd254ZWRPZzM1Z0g5?=
 =?utf-8?B?Uk0xdTVzMmc3cnRpUHJWR0tkMWM4ZXljelMzNTBLbkRMb284dXFMT1BFSE9P?=
 =?utf-8?B?WmJzeXBteURwcE5sa0hXQ3BYOVh5NGdHTzE3L3BmZGtNTUJHbjg2QkFCMCtU?=
 =?utf-8?B?MzR3K1YxZUhnYmRLWnNUUG1oQXBKS1lVKzVRUUd4L0N5YzVyNTFYV0lvZTRO?=
 =?utf-8?B?V2Z4bDh5TEdMSHZsS0IwVHNlQXgrNzFUWWtHUHlhSFQ4Y2pnNDI3cTdVUHBF?=
 =?utf-8?B?UEJrSWNZSFhmM3BtYWJwT05PZXQ4QUwzUCs2MXpGbDJ5SEdDQTRxY2s4cTY3?=
 =?utf-8?B?VTUwTk5yQkJNbWQwRXBzaHNLNG5ZaGhmMmJ5Y0lZTVhrRktXOS9RZVhkR1p5?=
 =?utf-8?B?bWhRb0d6bUlTQ21QZk15eHFIbzc4bUw4OXRLQmZHTWM0SmxUVWRteEgwZFpS?=
 =?utf-8?B?UzRaRllKcHpxZmliKzlyM1JyRkdQT3VmOUdsVThMMENhRlUyNVl5UVlOTEdm?=
 =?utf-8?B?VmhUQVdZUWs0endVejFIMXdLR0FtWmJ1cmxUbUpIZ2JWeXJEYTVtZFhERWF6?=
 =?utf-8?B?eDRLbzlrZlhxSE4vd1pDMkIrUlRmQWUxdE53d3djLzdwU0VEemcrWEJtNG5p?=
 =?utf-8?B?aFBiVUxNZjRRMWh4RWU1dGhhY1JubEZqdUlCYXMzL01ZcFlIUGVLUjgxUWto?=
 =?utf-8?B?UjlLT09LaURaZUs4RHFCdnVnT2NvSzhidythODU4YUFjMnp1enU3UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0069698e-db20-40c1-58c9-08df134f4db1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 17:32:23.9259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kj8oyEbm2RaQ14k+6gf3cKg1E0llR/y6S69W4aTnI5cAEg+jfHTP2bMFKN35exlGXlJJJQaKfl611hFbxJXOOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4177



On 9/15/26 12:23, yolezz wrote:
> In amd_smn_init(), if pci_request_config_region_exclusive() fails or
> if kzalloc_objs() fails to allocate memory for amd_roots, the already
> reserved PCI config regions are left allocated.
> 
> Use a __free() cleanup helper to automatically release all reserved PCI
> config space regions on error exit paths.
> 
> Fixes: 83518453074d ("x86/amd_node: Add SMN offsets to exclusive region access")
> Signed-off-by: yolezz <yolezz.secret@gmail.com>
> ---
> v2:
>   - Use a __free() cleanup helper instead of manual error rollback, as suggested by Mario.
> 
>   arch/x86/kernel/amd_node.c | 23 ++++++++++++++++-------
>   1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
> index 6a96d888b5a7..20451f0ad8c7 100644
> --- a/arch/x86/kernel/amd_node.c
> +++ b/arch/x86/kernel/amd_node.c
> @@ -239,15 +239,22 @@ static struct pci_dev *get_next_root(struct pci_dev *root)
>   	return root;
>   }
>   
> -static void amd_smn_release_config_regions(u16 num_roots)
> +static void amd_smn_release_config_regions(u16 *num_roots)
>   {
>   	struct pci_dev *root __free(pci_dev_put) = NULL;
>   
> -	/* Release the PCI config space for each root device. */
> -	while (num_roots-- && (root = get_next_root(root)))
> +	if (!num_roots)
> +		return;
> +
> +	while (*num_roots && (root = get_next_root(root))) {
>   		pci_release_config_region(root, 0, PCI_CFG_SPACE_SIZE);
> +		(*num_roots)--;
> +	}
>   }
>   
> +DEFINE_FREE(amd_smn_release_config_regions, u16 *,
> +	    amd_smn_release_config_regions(_T));
> +
>   static bool enable_dfs;
>   
>   static int __init amd_smn_enable_dfs(char *str)
> @@ -259,9 +266,11 @@ __setup("amd_smn_debugfs_enable", amd_smn_enable_dfs);
>   
>   static int __init amd_smn_init(void)
>   {
> -	u16 count, num_roots, roots_per_node, node, num_nodes;
> +	u16 count, num_roots = 0, roots_per_node, node, num_nodes;
>   	struct pci_dev *root __free(pci_dev_put) = NULL;
>   
> +	u16 *config_regions __free(amd_smn_release_config_regions) = NULL;
> +
>   	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
>   		return 0;
>   
> @@ -270,7 +279,8 @@ static int __init amd_smn_init(void)
>   	if (amd_roots)
>   		return 0;
>   
> -	num_roots = 0;
> +	config_regions = &num_roots;
> +
>   	while ((root = get_next_root(root))) {
>   		pci_dbg(root, "Reserving PCI config space\n");
>   
> @@ -282,7 +292,6 @@ static int __init amd_smn_init(void)
>   		 */
>   		if (!pci_request_config_region_exclusive(root, 0, PCI_CFG_SPACE_SIZE, NULL)) {
>   			pci_err(root, "Failed to reserve config space\n");
> -			amd_smn_release_config_regions(num_roots);

Did you forget to "remove" your v1 from the tree?  You should squash 
your v1 and v2 together as though it's one patch, not as though your v1 
was accepted.

I would just do this as a v3.

>   			return -EEXIST;
>   		}
>   
> @@ -297,7 +306,6 @@ static int __init amd_smn_init(void)
>   	num_nodes = amd_num_nodes();
>   	amd_roots = kzalloc_objs(*amd_roots, num_nodes);
>   	if (!amd_roots) {
> -		amd_smn_release_config_regions(num_roots);
>   		return -ENOMEM;
>   	}
>   
> @@ -327,6 +335,7 @@ static int __init amd_smn_init(void)
>   		debugfs_create_file("value",	0600, debugfs_dir, NULL, &smn_value_fops);
>   	}
>   
> +	config_regions = NULL;
>   	return 0;
>   }
>   

