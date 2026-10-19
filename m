Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013002.outbound.protection.outlook.com [40.107.201.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2ED35DA77;
	Mon, 19 Oct 2026 05:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792388326; cv=fail; b=tILoeYqCr/vu3yH5THgunThDBBZFIdLdCPBKsR2RWJCleUbulPJSfosaIctxOZ/bYxGp3LEGcikY5aoVsKpM9p/pkTdqKRTLU34OYamRaqmSazKfAOM4vgHfAw/pB4/yd+Rgy6PQ1qYdnew74DJ30nYEfWcsVQsezr08z6Y1SXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792388326; c=relaxed/simple;
	bh=jBRLwf9jvlUq+kAkrVyou3SKP4S7bQTAroprkBI0+So=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=h9ilus5SB24J1gPqPUrD3Wr9kqleS4zJ0Ww9foY5BJjPZJVZQ1t1WCRS42jeQlLxXtChUn66CXPmmreVBAMXQa6T2QJ01ojOHZooyJRXDeWPQa3ZacqOvTd7HGEiw/38NsmkH34hSHMM/JtbQHV0d1gZdOkFsxVoKo5KltXMkDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=r39x5/vp; arc=fail smtp.client-ip=40.107.201.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="r39x5/vp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZdSB2eC8OtgwBEY2dqXsVvLn5bDa5KMgsW3J0hSHSDoNqKdQROGHtoc6WOCwmx/GnXO2AbD2JRvky4WXqMGelsolHajX5mWcpBuIuaN6fSrwXCHHzySVwbUVRs2cDpWq2M4r4w84sUZemVvLIMBsor0LLur3OSgk8IBQvA2KrsqwFrmDJxoaVGa3fw3M658m24kTKsdzs4TOjbMBkeRhPOsMyOoykUlcfw/199jqcDuj3J6ErOZRmYgjiHw/7vwKPU12TpjsP+kKYCjCOZKGYl4DTqujPNsY8ZHZYoNS5WhHOadi769TLOaxAl0+cTJ61u6hm5hFMlDjFIml55pFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBrhQ0v8ZwSFh8Wpiji4mLFvxc3x5XWFrxQFh9Po6rg=;
 b=RT2Sce44D2EH4SBj6P8svpMRYrKu6bxPfCY+UdQAThanrlz6SWZ1X1SRw5yycM1lqCnwf4BviuwaA2+tkup6kv6Uxo0kcS+amBTGmLSq7OyBanZ+LqqeRPVVxClBQE3Om0uxkcm39evsSDUnaBEcOvtavqsd+RXdDbrjKYHsBQLHXhRFExEmpEdh90Dsg4c1HzaQAtZblHpNDJmDqnaXB2HQ9s6Ljx450jxf//LKlZRYqywt6tn1SVzRUp2FK6Uepxw/RAvIn2XWXB9tHD+jqv9SG8aSRz3CQk+fIx+vk7k2oDPvil/TdTL/avtSe55NXNG5ONXuy9AlnWDsNFoN0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBrhQ0v8ZwSFh8Wpiji4mLFvxc3x5XWFrxQFh9Po6rg=;
 b=r39x5/vpvu6gb/oqKNezkfGY2Lgo0JnhKj0z7PNG3Es3P5yCjXthQvjM9eY4xgJvi3zahsR5njHG5XhgUdonUdQ5F18UrTuf5nFCMN+nyenTxKTqlSdmvpubu0DGGrsggYXIKvLpmzmwksUs0dILbsVUCjRC1UuHJ1P6QFZcHZg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 SN7PR12MB6742.namprd12.prod.outlook.com (2603:10b6:806:26e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 05:38:39 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%4]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 05:38:39 +0000
Message-ID: <52937a5b-1f5e-41ab-9340-76dd547a6c87@amd.com>
Date: Mon, 19 Oct 2026 11:10:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ASoC: amd: acp-config: force SoundWire probe on ASUS
 RC74XA
Content-Language: en-US
To: Matthew Schwartz <matthew.schwartz@linux.dev>, broonie@kernel.org
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261016232416.2628603-1-matthew.schwartz@linux.dev>
 <20261016232416.2628603-2-matthew.schwartz@linux.dev>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20261016232416.2628603-2-matthew.schwartz@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0195.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::20) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|SN7PR12MB6742:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a690bf6-1416-45b7-3e9c-08df2da33a7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|261009223027099003|10067099003|56012099006|3023799007|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	zneFQmAGGz2bWovjEC/Nf4L7yxiQUv7iR6JNOGzKvORVAHd78Qui0bIl807K8xd1+I7KxeCMp3nL3cTh79YAzjBn6150TNMIzfn6HG77bnoRXXyT/9yeeRreWkxgU4Dac6c+HBVgUnEA2i3iHz8a9vvND1OkDlvzdfeWkRgag/wpd0FaARxqQL4ks/oiPjb5k2o+qGisHeSyzGR+SlREtJE+G474ZHaaD26lYLitZ1uXpdjwITXUpfg7u5TN/36CKqg9JMDpCTbeRJbvVjWUi6SMLPRb3a7poMaVIMo2ELxHTGb4Lkyh+b3pQhFSp9QMNV/nZlH7LrMt0o0rvi9LFgbDBszVSAp8+XLv0+cnPJv4Xt76qkGjRINY1/H0QtHGeea3G2XcV36ZpBWeagvZequbmQHO4ePfKxlpvSoJa4G7zDRnP6hjstPVZq9MKwN7U5PAqtOnzufFDQYa1+7j6fKqurAFJgsXzDDoy75iHPy0EkHCCsJICs9EIVGbzOsVnKqG+ZzbRanFuLaX+p1iI61Rg7BGGKhP7xjzEw3tJ0ci3I2J3u2z0oH19aWAEBeywcsGzoE2M0s5JWjzQ7VQK1tZ7U2GGgbv/Wj7EMpymca61D9kS4BvB3lHuvArr0erEqAKifrP5ZW+Xe5TIoT8Br6ipdWS6vG9dsfftgmXSQc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261009223027099003)(10067099003)(56012099006)(3023799007)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDgvaGdET09ZdXl1T0llU25WY29FMmFWdW03OHVDd1VRdldYZ3Y4Q0lQa2lN?=
 =?utf-8?B?WTZESk94eTdpeVpwVmFHQlM2V05rTWlsdHBXNzVGd3hXM2NxNEU2THNlcGtX?=
 =?utf-8?B?dmNrZzRLb290L2RGS09ENzBnWEFIeFA5Q0dUdXhscTU1SGNUSzE1NWxOT3U1?=
 =?utf-8?B?N1FEbjlYV0Z4MVpRbHVyRGh2VjZqb1U3WmxvTEdxVlk1Wms4ZFZJa1lrK1NV?=
 =?utf-8?B?SjVvT1JuQ1F0ejhFY2RxdzhWYmFGdEo3b1k5ZGxId3d2VXRVWC9rTzZXUFFF?=
 =?utf-8?B?QXdERmsvcmJFTFlwRUVQMFFUbURaRitBTWlZYXRSSExHT1hrS3d3QmVCL01J?=
 =?utf-8?B?RnRhM1hHMTNHYkFMK1FKYm1wb09ObG5LZDdXc3J0RW5ZNkRaclVnSmZVOVF6?=
 =?utf-8?B?Y2UreFFFd2NCTUFSRHp3NDE5K1I1bGtERVpqK0RSVWsyNENsYWFvbWFibFJ4?=
 =?utf-8?B?UjFRUjFHM3paZEJsdzFROHNhNGR6ZjJvNkk2Z2ltTmhKaytHOTZySEQ2dDJT?=
 =?utf-8?B?czJOR2hKbG9kUi9pU1dTeFBBcmtUSjdoZDNaQ3JScjhpNmdTM2c4aVFYcjl5?=
 =?utf-8?B?RkFvTG50UVVyZlJNV1IvcUpjR1dUU1JPazNoSlZ6cE9Rak9iRlVwUmNZRGZs?=
 =?utf-8?B?VXM5RWVybkdEUkRsK2dBMlltMWZqSEVFd1RpNGxtZHVuSjFReUZMRXJnZGlN?=
 =?utf-8?B?VEtUWnFjMHRoUjlSdUM2VWFza0dXZ0hJNkQ2QmJ1RG9IMzVlWWxuM25WVXRQ?=
 =?utf-8?B?WlV3RGFjc0dFSm9uNFR3UHI1VGVjeEVWaU1lck5lMEI1b0NSMU53d0g2aW5a?=
 =?utf-8?B?ZEF1WFhCRzFZQUtNNk1XOHNKZnYzYXg5M0IvL0FGRFY0VmhwYmRGalppMk5D?=
 =?utf-8?B?R3dSejlTRDR4dEVXTmNPNmRnbWtqdG8wZFNoUDlJZTQ5dlNEUXcxQWtsVG13?=
 =?utf-8?B?UGZmNFI5bm5SeUJxKzJ5eThjODFhd1gyMGxuNzBHM1UvdHFqV3Z4ZXVLdWUv?=
 =?utf-8?B?MEdoZG9YeVh3OHNkalFJQXIwR2lkc2wwOE0zTEZtZ2l3bFZ0ZUVacTBrQWdV?=
 =?utf-8?B?cnlCY2VoanVHK09MaTVRL2VvY0hodXZXQUlrYUpSOE1JZHRPZGMrWWxqZE9G?=
 =?utf-8?B?Kys5ZVNpVG5ybHhSRk5HNVdZdFJWN0NIdU5Vd2VPSFErVVBrcnlJc0FBNkxr?=
 =?utf-8?B?N2p6VExWZG9VZEtvV3J2Wk9xMmpvbWJpSVFycnlvaWdLRkZDV1FNM2E4cTJF?=
 =?utf-8?B?RkNUQjdsV0VvUUxYOXlVWUcyNDA4bXl5SHVubTlROVBkbWNpMm1BbnVlMSs3?=
 =?utf-8?B?YnY4b0w1ZGp4Y2xCQVdiZXpPL0ZPaHZ4WklFUmNQUTgyeHIyNWQwMGxwTlZ3?=
 =?utf-8?B?RHJISXdMMjNhdUUzTUF5NWJzOVl3Q3Nzd1VROVR3V2tiWXR3bU9WZSsyZFp5?=
 =?utf-8?B?SEpXNmxUMStJK3Z0L2ptODRMeTUwYzVjbTdhT2V5c21iWG5acDZkVnZieHl1?=
 =?utf-8?B?K1p6NjlKckhjbGhqcjc5R3VPazBsY1JqUzFpODJEQnp4aFRqZUt0K3dndzly?=
 =?utf-8?B?R2orTmpsQ0hpUWJLRGJPK01ZTkVGbGdzRk1CZ1FZVnVwSDN1YjZneDczVy93?=
 =?utf-8?B?RnJQNzJvUmp2blIwZ1NnVlRRYWpNc2hLVTk1OVpYSlN4a1NMaW1JSWFFNGpm?=
 =?utf-8?B?aHNXY0piam5FU3hnTjRuWGVzenpIekkvMTFvZDRLQWpVdVUxY3Q0MlBkbTh6?=
 =?utf-8?B?TldRZlZvUWpRYUF6cGN3L2FzK1Y0VGVhSTNzWlhBWUZLZkliZWZTN25PcHhy?=
 =?utf-8?B?bzlqaUJaeEVOc3pSN2xaaCthaE84dHY2U2pKQk95cElXblVST1NWa2lyemgy?=
 =?utf-8?B?UmUvbUVBSTVrQjZOdCtUV1hnaWIreEhnZGZVM0FpN1ZZOEEvYWNIb3VmeS9V?=
 =?utf-8?B?NmswdDdGNXJpVkpPZTZ4QVAyeUp5NmVmZ0NwbDhkS0d4dUcwUVZnbjZlZXdZ?=
 =?utf-8?B?anEwNHI5OVNiS3NnekU3b0c4L2xxaWo1bmhxRVhGbUtsekQrbG9DZGZmeG1H?=
 =?utf-8?B?Q3R6dDFrVUtGQVVnblRjREtyMDFDZkpIRmtjVnpHZEJQSm9nYkJZcTlxNUZq?=
 =?utf-8?B?MkpmNDVsVXFQZk16c0dSbUw0Q21SUmJIWDZKK2VvQ1h1bm04OGpMd0NmQXc0?=
 =?utf-8?B?MVZOOS8weEhQNk5nNCsxOHBIc2pDb2xZMlJvSTZneDJxdW1iSHBtNFNlUWpt?=
 =?utf-8?B?V2hDZlBnazBVSUxzRXB6MmtlU1htZExBREY1bVprRWpQaVdJcUFZOWlSZUJy?=
 =?utf-8?B?enVhdDhtS29PSGI0RDVJNEZsYTBTNk1WQ1gvZzh6blNkOHEvNmFMdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a690bf6-1416-45b7-3e9c-08df2da33a7e
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 05:38:39.7457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XB5lgVK3+mDLoaMaGN9kacE+52X8+/jaqZ42CNtoFTWb9MZYCo2Mqa0wVs9ey8Hdtr5VY/SjCxNFDeJaO4dig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6742

On 17/10/26 04:54, Matthew Schwartz wrote:
> The ROG Xbox Ally X20 (RC74XA) BIOS reports acp-audio-config-flag 0x10
> (FLAG_AMD_LEGACY_ONLY_DMIC) in the ACP _DSD. snd_pci_ps then rejects
> the device, so the SoundWire links carrying the two TAS2783 amps and
> the RT721 are never scanned.
>
> Add the board to the ACP70 flag override table so snd_pci_ps probes.
>
> Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  sound/soc/amd/acp-config.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
> index 2fb9789cac0ac..858bb51fa0383 100644
> --- a/sound/soc/amd/acp-config.c
> +++ b/sound/soc/amd/acp-config.c
> @@ -105,6 +105,13 @@ static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "Dell 14S DS14265"),
>  		},
>  	},
> +	{
> +		/* ASUS ROG Xbox Ally X20 (Strix Point, ACP 7.0) */
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_BOARD_NAME, "RC74XA"),
> +		},
> +	},
>  	{}
>  };
>  

