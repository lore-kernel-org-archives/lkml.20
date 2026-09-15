Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010007.outbound.protection.outlook.com [52.101.61.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551AB3BBFAA
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494163; cv=fail; b=hNgEE+w0AocHG9di4D7aY023xyIEWYucfWm0FTDurB/f79wxioNKttUUE+r+5Q9KLEuDANvz2PwHoXfqQq7YUMXFUb5kRpgNgVOuiCUeLcq6hvY1pxinjpPlHo9bCvfyW/fczb3IUGs2UdzT0xM7Bafj3NiG25/z07VrqvM7Kig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494163; c=relaxed/simple;
	bh=vIqYTFDiXvX4XpPBNWGJ0iGrwCWIs/NevTPMN748ZP8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jfsgKDXll4MJeDM709RyZZMbGz8KgyzePwfrU46z0Uj/mD1kGCdtSQQTPtNaq8PiNMpcg0U4zoOvqkgM2SLct11GxfUtqtcKzxxHOuY759gBOue/3DEBBpVVKlksn6I2OUyfWA14SmflBiUbqvnL0gA8WO8QcYpXX9wZ7ooVGDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ulPs2zLz; arc=fail smtp.client-ip=52.101.61.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ulPs2zLz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZyGnb2hayb7e0fZgwx9i5Y7vLfrIkUuTVcy3zZro7vLI31QYh9XYcGlUdXcrrMFlJy8UHS0cSrbIa77QMTDZfYXB/B+mVNlgM93wzoFg78Y7Bo8wIvAAjkfdFcnQEaFNO10qGOMrRHYcqUylyxrQRHfKKgpTK66a2HfGNIobN43bPpD6sczrbFUBhIeYieA3M4QEI4WjADsRrfc36DFMw07mYkIU85+RIG1ses/PfMrGkGd03aTNrioz8T1ONJzfWnoynSgFKs0QtxTkUb5qV3w4Dka4mXa+GZuDjBbVTn04sw6mdKlHCMFnvOYte9Xo7slyzuXXlpCVzj/F9vhJUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HX3RfQsyxvrO3tw5vTW7yhRYt1Zn6Q4Ia8fmr6j/Qlc=;
 b=MOu9am7nmdhZD7biBvpFYx6/BbAuXARI366btoWjTSMSNgP/zuWSYOh2D0lTbjcR+HKVo8XaHZLb4Ej4PAGti/vAA0LgRaQkkn+UNMQqHS1xEYzhi5Z9Tq3rfKvxdARmODdsdfa0zaasnJDJwfq1Qw6CaoyvY6qlrLlpYFINcDu+x6OIXJ+hYwsn+hokQEzeo2OyZiFX0bysQZrh2xmplEUzUwW9S+N6fbwJHT4Y55CzJZ1HMIB1H07GMYcaxxHWqAInBPtWhldYyqrRnueM5HnVJheqlTAFqC3lM7Cjh1qUDAzMckdF4PLRWwZJEGKQEoKxkwEanuv/dwUrFy1+DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HX3RfQsyxvrO3tw5vTW7yhRYt1Zn6Q4Ia8fmr6j/Qlc=;
 b=ulPs2zLzc5vT3NKlXkWN7TT6wima85kI9E22LaGZq8ThOMPI4EGUCLJXm1JE+GWVlSNTObATufYSqw933Xm2p2w00OR8z42ygec/RhUkq03vwu5RYDtXRZcx+rDANjZ4mymAGkPMq8bKAo5T8Pw0kUDB1FR/JXVt54Z5D7RHnlA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by IA0PR12MB7507.namprd12.prod.outlook.com (2603:10b6:208:441::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 17:42:35 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 17:42:35 +0000
Message-ID: <f806520a-691e-4db1-a1eb-125ccfb55706@amd.com>
Date: Tue, 15 Sep 2026 12:42:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/amd/node: Release reserved config regions on init
 error
Content-Language: en-US
To: yolezz <yolezz.secret@gmail.com>, yazen.ghannam@amd.com
Cc: x86@kernel.org, linux-kernel@vger.kernel.org
References: <6bd2cad5-65ef-4f3d-a146-d91f120c86ad@amd.com>
 <20260915173644.107751-1-yolezz.secret@gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260915173644.107751-1-yolezz.secret@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0433.namprd03.prod.outlook.com
 (2603:10b6:610:10e::18) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|IA0PR12MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: 18df3fb3-60f7-423b-381b-08df1350ba18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|4143699003|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ZAetvJLqpekC5rlWmOQYg9Ux3mQRtROPktXu76ZIqjkRxpzGEqDJ0hwVmZtguK4Vff/HChELvPwRCBQaCapM7ofbKRVJtskR8ieKRp3RIqAGndvyocA1PZxG1EEo2sIin8KctUjy1O9tgIszjzMwYLQWcw6tcSKPGpkIa2o5vO1oHU7gufBh+fVK+xecxFOv6X8BtFhXmR2G6Bi4n3dwvI6EScrR3M1sePEDC397kQ5ZAigY+1eIGHlnoAjVBQ45b2dqy723BEHJ7a0+wGgC+bH4eLRV+yM4G2U/XSQ8tMPspbSJy8ud8Yt19PhfegA3IgZVj8VhcYATIL5DM8tl1kIdprunlo0CewDM0m+JfZgQ1NKTufR+TBGY/t0An+zAXOPWrGONHCD432xWL3ff8T35v1qHe9oej34Vv+hc2GVW6SBs/XaoiAdhYCvAZMDkCaTB6GVEFbU9fb6x+zFSwkXILG2JjjvuGNeEMb7OqC7SIzW77noejHiqXZ4xRQj/n+c6M4+ZiWli6y269J2oAxpAiC2l20mYb7Ch1ROYPtkg5MPDhpyDZcHGxdH9c+8krt4jmxt03cjuq5V8Qg0T+UruCWePGYut2iF+1yXa280P5sVf35fGuXpgfmwl194if/TIlYss8pqc4vGXd44SPUPBdOfWVWHkQCzzmifgkf0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVdNRE9YaTlSckpFZUJHZ1J6NG42YzB5bGFsN2xrNzYzRklsejU1dHlhaWpX?=
 =?utf-8?B?SHdUS0N0dHpYaWkvSGlNdmlaSDZnZk5YNktqelRCYTZZMk0xbXpFbHZVc1dS?=
 =?utf-8?B?S1QwbDE2Z1VIT2piTldVL0tHaWtEOHMvT0RtZVh0ZTcvbDJKbEFlVVljUVNQ?=
 =?utf-8?B?a0R3ZG5BYmkrV21KTThzRmlFblVRWTNoUEhQWEpZSVd2bnFPZDRYMkdMWVk3?=
 =?utf-8?B?UnRlOWZhY0ltUTNqUzV6K2N0SDVnSlpqRlFEWmtrVWxtc05oTysvdTZjMU5o?=
 =?utf-8?B?S0dMQUt3NmZLL2MxeGJIKzlFMjBpRU0xeU1QQlR3WDVzSng1Y3h1YUtyR3Zp?=
 =?utf-8?B?QXgrVk5KYTBXclhwMW5FT2RNUzVOQjBNWHRLajlndFh4QW5FRlhpc3AxdWRn?=
 =?utf-8?B?S1MxeWlmZk43WitqT25EdjkzcDZDRm9xTFgwR0Era2ZZSFZISUJscFp1S056?=
 =?utf-8?B?S0dzdXA0eWNPdGVSMkpibHUyV1pXUWNqQ0k3cnIrT1BDaUJhMk5iR0FqVjN1?=
 =?utf-8?B?Ny94WExjSmdoOWY2SFJLK3lEOFh4Vm5rRW5hWnJ4MkhSWmRiejRkcG95QUtL?=
 =?utf-8?B?QVpxT21BYkIvNU1xYUM5K0kzMGpXb2JVSmJWZlRxRnBVWjVYMnROWUJLcVRG?=
 =?utf-8?B?b1E4Mi82OFBqUHRBc2NuUHhJajlrQnd4RUtoTmZFUk5LQnBZZGhERG5pTElW?=
 =?utf-8?B?SWJ4MmM2ajlIYmNqT1VCMy9GVU0wejNUYVVzYnJSWldpcnhldkR1UFBsNU9C?=
 =?utf-8?B?cjc1S0lKSjhxZjZsbU0zSm5TRUxjZGpMdXZEUCtyVEhjUnRFTE9ibXZQRTNX?=
 =?utf-8?B?SVdjb012K2MzNDRIaXJyUEFUVUozVU5GbXZKZS9IT0VUcGllaUo0OElxU2No?=
 =?utf-8?B?UkExTGtUdEZoY2kvazRJekQ2QjUxK0hVdUZkdXVqUGJna1BzNlFlMGV2ZHg3?=
 =?utf-8?B?OXVGaWtXdjNRRktOSDJPWlc0SXlFdGNiNEttODBkRUdzK0RWQXdqNXpZSTRR?=
 =?utf-8?B?VDZVUkhNWHYxRjk5N1BMZDNQbjVxUFJiN0syUVFTd2NLbjRkT2V3RGhvWkw3?=
 =?utf-8?B?SkZuUWllNTZiakJpZjNvSmk1QjZIY3FmbWx6dmo4eVNEZzlCVWd6aVVRR1dH?=
 =?utf-8?B?eS9DZ3NTU3JlUDFhS2VOMHRKcFhJL1RhbGpqUjNZdmpDZGYwQ29QTnZ1ZEFw?=
 =?utf-8?B?d2ZNd09DS05vQ2NzZFBZSllYUnZwdGR2cThtRVNRWVRNZyt1cmF6Y2IzMmd3?=
 =?utf-8?B?WFhJRGFWc0pWbGp1ZnNMUmY0RlB6ODlHUlNXdGljYTNvNVZOam11cWZEOFhO?=
 =?utf-8?B?NGtuNDZTM2o2S0R4ZjR2cjVFZUVrY3d3a3hGVEV1VnF0YUszZ2lpK3dlRXFw?=
 =?utf-8?B?S241ekdoNDBoT0RJN3RMQzdReHY5dXBGS2ZYdjNLb3JBWmlrL1ZkOWdNN2Y5?=
 =?utf-8?B?dEJhT3h0enVtVFhlRkJTaldNM0hsME0zeHJYRjU3NEdQZ2Fvd3RhZjJVMXJr?=
 =?utf-8?B?NU9zcnBQOVZjclc4L3ZNLzErMmpEamJEa1IvY3pUc0REOVgxM2J4eUIwNUFx?=
 =?utf-8?B?Z21Gd2N5dnZJaGRrZTFtcnE5UnBDdHlFanh6M2FiMkEyenNoVkNwemZTcGRB?=
 =?utf-8?B?MlIwK0VsK0dnOFl4eVMydkZleVk4ZlRrbW1DeGFSWkZBaEFWN1VFek5RMEJx?=
 =?utf-8?B?MDNjVE0rUXRvYW80Zk5VeGMxMFJHeUdZWDVrZHNncHA2dnpqZitreHVVa20v?=
 =?utf-8?B?aE9wTWF2U21UY1RGWXN3MjlDU2xCUVBmd0U1RSsyYlphckdxWE1JeVY5aHFO?=
 =?utf-8?B?Z0JlRFk2UzVRM0l4dWgvUWJmdmMzVzhuUG42TUNzdjdCSlBLUWZDS0hmN1FU?=
 =?utf-8?B?TDBVWVNFdWVvb2RBN0d4T0FTM0lTcmZkSzRCNlIzUHlGamZvRlNBbDd2RmVt?=
 =?utf-8?B?dFQwQkQ5WHV4RER5SkwxdkVEYmRlWW1oMWU4SEZaRGtINzJvTkRTL2ZWaXhi?=
 =?utf-8?B?elR6enZmeWg1T1ZzTFhUb2dCTXVNS1hQQmwrSXNqOVAvS21hNG5WM0h2dGZk?=
 =?utf-8?B?c245aW1YM3dDbUdSSHBFcmxyMmJzTUhrODZzelRuYVhyY3I3OU53M0h6MDRR?=
 =?utf-8?B?UmZzNmhvcEx0aUFubEhveDQ1NllKcVhkTDU4VC9FV05PZTBqWUpRcmJZblR3?=
 =?utf-8?B?ZnFXd3pqL1FhdEpzVVdFUjluazNTRy8yRUJhYTdITHVZeUR3U3dkSlE5Q0U2?=
 =?utf-8?B?RDhsNzJGdVh1dXJKL1Vad0hHb3djaFRCcWp0Wlc0WCtFaVdVYS9VOTBiRFJP?=
 =?utf-8?B?cnBmd0tkVHpCTFAxdlFjcXNaWjR6a0F4N0pvcHM0VjVITXZNQlRmdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18df3fb3-60f7-423b-381b-08df1350ba18
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 17:42:35.2004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aXqosEsymSaKkjeqKSIIm1KhELA46c8MQQc38hBGbYip6aExuE6u7t9r4n3L66tD0YOssubjj1+NefyW6J7x7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7507



On 9/15/26 12:36, yolezz wrote:
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
> v3:
>   - Squash changes into a single standalone patch to fix multi-patch confusion.
> 
>   arch/x86/kernel/amd_node.c | 27 ++++++++++++++++++++++++---
>   1 file changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
> index b7926ba3610a..20451f0ad8c7 100644
> --- a/arch/x86/kernel/amd_node.c
> +++ b/arch/x86/kernel/amd_node.c
> @@ -239,6 +239,22 @@ static struct pci_dev *get_next_root(struct pci_dev *root)
>   	return root;
>   }
>   
> +static void amd_smn_release_config_regions(u16 *num_roots)
> +{
> +	struct pci_dev *root __free(pci_dev_put) = NULL;
> +
> +	if (!num_roots)
> +		return;
> +
> +	while (*num_roots && (root = get_next_root(root))) {
> +		pci_release_config_region(root, 0, PCI_CFG_SPACE_SIZE);
> +		(*num_roots)--;
> +	}
> +}
> +
> +DEFINE_FREE(amd_smn_release_config_regions, u16 *,
> +	    amd_smn_release_config_regions(_T));
> +
>   static bool enable_dfs;
>   
>   static int __init amd_smn_enable_dfs(char *str)
> @@ -250,9 +266,11 @@ __setup("amd_smn_debugfs_enable", amd_smn_enable_dfs);
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
> @@ -261,7 +279,8 @@ static int __init amd_smn_init(void)
>   	if (amd_roots)
>   		return 0;
>   
> -	num_roots = 0;
> +	config_regions = &num_roots;
> +
>   	while ((root = get_next_root(root))) {
>   		pci_dbg(root, "Reserving PCI config space\n");
>   
> @@ -286,8 +305,9 @@ static int __init amd_smn_init(void)
>   
>   	num_nodes = amd_num_nodes();
>   	amd_roots = kzalloc_objs(*amd_roots, num_nodes);
> -	if (!amd_roots)
> +	if (!amd_roots) {
>   		return -ENOMEM;
> +	}

Unnecessary braces

>   
>   	roots_per_node = num_roots / num_nodes;
>   	if (!roots_per_node) {
> @@ -315,6 +335,7 @@ static int __init amd_smn_init(void)
>   		debugfs_create_file("value",	0600, debugfs_dir, NULL, &smn_value_fops);
>   	}
>   
> +	config_regions = NULL;
>   	return 0;
>   }
>   

