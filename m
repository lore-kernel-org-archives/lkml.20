Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011018.outbound.protection.outlook.com [52.101.52.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E44E4A0F0C;
	Thu, 24 Sep 2026 15:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790264665; cv=fail; b=XXTBZ8mNNK4GVNfHDhLFLiyhetkkUoXG0NcrDcle4HhF3xoWuXGF1D8qyc1M6QaLuf7mfKJgtzhpDwFlAxjEvc+N/4o6WG4JoGKLjf/EzqjBxmCBHgAjTWT/q4JU2mOxtCo4WAPYukqz306pmMzK/8znP5/krTSsDNtp54cQbqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790264665; c=relaxed/simple;
	bh=DRE6LolWDJyl+9bCPDiChsQrUEU4xEy1VVhFdoMHgD4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XnobXTHjjUs2k7AMGOxlPpd7eLuDMsXfylQxz5mrI8G2iFrqNDMPxR/ctVUrrSXiv4/HTBe4ig1EjRYcLMT9ZoJtbkwLuHhaFK6VJkNn0LoXor0uKNUrMUIorjms03pNcQlca4TLw4YgV4LmAGK2Ba9qQoTelvCSBM/u1jhAp44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uHGNVDzW; arc=fail smtp.client-ip=52.101.52.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uHGNVDzW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tf6pKqZxIPBql2Ia8/rRnoAbUSUPOPo9Cj9Gw/G0qg1iM3/FyPrQRNW1vheHScRjs9MFrEMC4lXvX7LQfQoQ3t3sUIm4ELy7kZKtJ9GH5GxNowMZ5xK9lH++QzjMNWynpagkxGBVlwfwhvBhN8d/O9OFRwJZdeysvGIUTgrvOAWoYi/+gAacvHqvNxxhXg1pkXlOOiD0mvzXMBFDB7YaZSfgMIeXhNcPaENvlkdsy+GiPE7ZXyEWPOQn+u+3OlID2Z3csy3UwNIwI16G6c7+Vbe+2vXlCTj9MQClvu/mBdjfqR0QFhlyN9IA21k7mm9QkAxXbe7W5EQ2B35YkUQ+WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRW9wY4Z1+O6DWOU9N2SUhA4D6AxgLdH4aFsl5GVgJc=;
 b=Wm0nBcviOYWgA7/GZIU66aARPcWAFf/bXv4ePSEu+mWHUD8HL60EbZ9niD2N32S2EofjrOfMDFCr0boUwiWphrelLU5ClF4vnsrikvwSClLXtxr4hKlfdJOOVqH+y0j3A06i0RE5+V2E9VDqyc7uDxRMBkO2sBUy+H3EBBbpe0HWS8HzE8uzQtqSBgr5RlxY7UVzoyhfA1rWG+2VpTWcHEXzQcVk35ilcpVwjj0NLG8BrYRb1NdRKr00Yrgrw2CCkp8LJowC/SSnZCrXHkMC8IekxvT7lhYltII22JfhmjN3HDw8ZDhXVlHqd8o5Dk2Mog0i6psa6h0fKgcYBsgzBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRW9wY4Z1+O6DWOU9N2SUhA4D6AxgLdH4aFsl5GVgJc=;
 b=uHGNVDzWzqRRJtTotoON/aAtQjLiI7uO9MCs8VlsWcRaXXZ7gJYRmV7d6YIPXlOczgTBIRk+qa/0pMd9vF7OSVZMp5DnYvTj1ex6j9JxI7ydnSilmzu+AMrqeFyg+4pGxhukAtkZr0nGdbVUWDldhU24VCd5C7VrYk3b5HuVH9o=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by DS6PR12MB152050.namprd12.prod.outlook.com (2603:10b6:8:410::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 15:44:20 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 15:44:20 +0000
Message-ID: <a2f981e4-ac6a-4d1f-8c5c-bf529e0a16e2@amd.com>
Date: Thu, 24 Sep 2026 10:44:18 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: quirks: Ignore wakeup from the Valve Index HMD hub
Content-Language: en-US
To: Curtis Vogt <curtis.vogt@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michal Pecio <michal.pecio@gmail.com>
References: <20260924034200.421686-1-curtis.vogt@gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260924034200.421686-1-curtis.vogt@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR07CA0045.namprd07.prod.outlook.com
 (2603:10b6:610:5b::19) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|DS6PR12MB152050:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e1a0361-ad9b-496d-0dfc-08df1a52b320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|56012099006|5023799004|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	hzIe+QKO86Ys9knjQYPbrq0BwCiIi2gX9PQmlZiyX0HhbL2VV4qgEINV0dhSU7GsamqpJ7le5f46xvaE7kEW7XAvgjjpsigmF6BslC0Zg9+m3/MEqbpT35eojMGEGsWyA3726VO43dBsqrrG2fl7IHI0Yo9PjA2WSXVEeS3ePQwJpbmdY9cp0/iFbaO8r8jLzvxgC8001dRBes4jLpS/FZV85e4FRuq2t2Nqlyt7HRf3FA06GvDlt1xy3e4x2+9ud9YVxCwWQC8zhZ8T7urfyejBVBIeKhO3PDbaOE5YMowgFD/kr8wGRIT9dakWGYByyFZlNNALdySuq2u0Z3EQIogaH6xY/+GxaqYIS329dbfHse1ZqBqu4Gd9AO/9LVJAjlVvQe7QmGsaNfzBLgOUHIfYsURUAvxaPCQ/74eidYE73+efvBfVN9hpY4TTQx7AKTnUkRkEpA9mXSe6HYS0IIIhaPblIaVUG7qZkLyEPedr/rkfgmKuDTKnQAS7YX5A1qYmStUp4nW5Gvvu3UNut4+upiURCNKMuJgBH9q/lSBJOPTYi5J6/TuvG5NLHXCxcW+gJeG1bZiHv+wfI2na3JP+yEzhKpWQIfWB51NDlCg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzVsbVZyU0F2ODlYRXEzUytDR3pkeStKQ1hiNXQ1YjBZMUVleWpnTG1sVWlI?=
 =?utf-8?B?QVA2aWlGL1BjMmRZU0M4N2YxcVhxRnArK25IZTF6dldMdmV4bFowOWhJMW96?=
 =?utf-8?B?Y295emhjdDJJaG5NaFlQcTZWTkdhNkJQMXJrL3Q0M1QwWUVXbkRUM2VtdTNt?=
 =?utf-8?B?SklYY2crZHk2U0FwcVhYbGhaMWZFcVdnemp5TU1LMHpzbWVQWGlWWkVaVk1S?=
 =?utf-8?B?OGFQZllEN2NjMGt0YWV0RkV2M2FtVlF5SExkYWM0WmhLdEZ0MTJVUmVLdGkv?=
 =?utf-8?B?bHJKNmFNeUNSelZjaTMwNUVieS9aMVZ3OGsyRTE5aG9LWHJtZkhja1NBaFBs?=
 =?utf-8?B?S1p2WFNEMXljREw3RjFGdm9YQnpFT2VPV2Y4VlROVEtFTW0wcURhZFRZMC81?=
 =?utf-8?B?MUJCVmxObVpsaFp3RzJLTnBxbmI3OHVXTGFVU1g2LzlqZW9Oc0ZrUDRndnNs?=
 =?utf-8?B?UVZsV0R5N2UvVUJPQkk5QUs2Yjd0K3dkUmI3UlNraTlXc2FIVTZaRGFOZWUx?=
 =?utf-8?B?M0Q3Um1MdGxacU9Fcjcrd25ta2kwUitocDVCRlZxOTZtMzI0dzNJd1gxVEIw?=
 =?utf-8?B?K0xVa01YNDk1WVNEaDRFN29lbXhVcFJRNzVra2tpK0Z0cUNGTTNrVUdXdHg5?=
 =?utf-8?B?cmhPU2VzczNiMXdwNFppd0dKdFVDbHd4eEVLZ2s0WktOTklsbWV0UnMrN0Nk?=
 =?utf-8?B?NEZnemdXOWphRlBtenRBRGRTV3psNVp0ZXlQNlZncFcwcWV0RmhIMnlxdFM4?=
 =?utf-8?B?a2pXdU93eHladzBURWNxVFJoR3BQVlVHWFhvMENTeU9GK0UxdHhEaGVHSmpV?=
 =?utf-8?B?QlhFNStvNExSNFJ2ZHFnZVh0Q1lvak1WY2xKOWt1UllXRG82NWV2SXNqUlp0?=
 =?utf-8?B?eWZtY2x0TTRFK2htYW1vTHMwVWNSVVl0b25LOEZYWU5WOWFURHN3a0ZnS3dh?=
 =?utf-8?B?cGhCLy9QZ21MU0Y3ZGRrRk0wcGxOWVZ4MG8vRGdjVHJQa2YrMS8ycjR6N25L?=
 =?utf-8?B?YUdYekpMM2Zya2U4VU9FS2ZqbVBlRStMS3lBU1RYVlVHcVMxVzNJbnU4UThi?=
 =?utf-8?B?YlJVbVFRSFM5ZkpWVUlDTWtoMHlTMDl1OHA0YVhjZ0h2RTVQRjhaNmVScjlV?=
 =?utf-8?B?WTJWV1RKdnd3cmxmT2VuaXpRV1JZY3RhQ0c3SjUxVGJ5MHlWRU5WYTN5cS9S?=
 =?utf-8?B?SDJlQ0Z2Z012YVRZbzkzaUZGVjZFL1JnSHpvZmpFV0xCWWtZZUc4elVURjBw?=
 =?utf-8?B?YXI0bXZON2VvVlpEYktrRWdzTjQrcVlJZlhIUGd6dVVWOUdBbjRFT0Z4djBr?=
 =?utf-8?B?U1h1ZlQ0RXpRcFIxc2Yvd1hkNmpIcXFld0w5bm9Jblo0OEd1N0RuVDNzcnZa?=
 =?utf-8?B?Y3kwZnNoY1BxUnIvdk4vRDRVck9HYmttcGZxcEJ3K2ZyeGpvb3pXdFkxZ3ZK?=
 =?utf-8?B?MTZIYktCUmo5aUxseC93UHZySVMzbXNEYWFzdjc4Z2FrR2tVdHJmQ0dFaVVa?=
 =?utf-8?B?U0h5OEZoTTJ5V0NYdmZyZ0FGZ3RRKy9hYU5KZmplNE9MQWtobXcwU0FDRWJO?=
 =?utf-8?B?WjlmZ1g1dE1BYzBRcUVJWlZ3MXl0UDliWDVFUnRybE1hZHNKUWNLMGthOVpV?=
 =?utf-8?B?SDZZTGZYMXlNc3hVd0pvd2x5VGxEQ2sxRmNMRUU2Sk4rQ00vd3lhaHVWTkdp?=
 =?utf-8?B?Qk02WVNYUzhpWHdhemVwZGcyTTMvTFQycEV4N0JOWFFqK3FXVGNvQk5JYlI3?=
 =?utf-8?B?bFZaMWdIaW91THhFd29QWGNxbmUvbHpDZ01zSXJ1YWdjR3YrTE93ZEZlYWt6?=
 =?utf-8?B?dkpLNW9oLy9Td1RvaUpWb0s1WnNLL3hZLzV2R21pRFlUNFVCbDFnUklMRzVy?=
 =?utf-8?B?MFNqMXRGdHFFRTZtRVpXajJBMGlKRkRLckJrUElwZmZSQzE5alpFUTRHb0RN?=
 =?utf-8?B?WGc5MGprZFNPbWgxbTJ3K3JHeFV5Z0dzT3c4VndEK3JkTEZQMlBSR2JJV1pP?=
 =?utf-8?B?dDF6ZUtUWUNJTDNBRUJueStJNjBocnNaNnJpQUpjM3JiNUJkeXFDeWZkS1Vo?=
 =?utf-8?B?TW1KMGswYTROZmVPU3BHTHExZHZ0UWJ4czVTWUVQSXEvdTFRQXpWNVRDOXZm?=
 =?utf-8?B?blljUVZrLzUwaklqT1lSb2dyd2laMkJBSi9sS2RMck9FUHM5TmJvRVU3NjZT?=
 =?utf-8?B?WE5Mc3hwcU1oWUVHQjVneS92K2s4cEhvSWZtK0hUa2J2NlV2OW9UZFY0U1NT?=
 =?utf-8?B?SUtTQVZzcU9ic0Uyd0FMYWhNNjVRcjJmcGFTZHA3MlRFdStEY3RkVUNIMldM?=
 =?utf-8?B?Mnh6bFNGK0Z4dE1HTHZVZG1KZnF6WFRibzZOQ1doZDE3RkpjZ3RlZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1a0361-ad9b-496d-0dfc-08df1a52b320
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:44:20.6456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 20t6DS0MWAHrC67R6par1Y3WPM9xwm5Y2D6es4MZ5vtC1F29+fxoakiu2Lds/fXaCKKa8/ACSEgRwbiyDSGSSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB152050



On 9/23/26 22:41, Curtis Vogt wrote:
> The Valve Index HMD's onboard USB hub (28de:2613) asserts remote wakeup a
> few seconds after the host enters S3, so a system with the headset
> attached does not stay suspended. Observed on 7.3-rc2: every suspend
> attempt returned after ~6 seconds with wakeup events recorded from the
> hub. Disabling wakeup on the hub through sysfs allows the host to stay
> asleep until woken from the front panel. The headset most likely reacts to
> the DisplayPort link being taken down as the host suspends.
> 
> Nothing behind this hub is a device that should be able to wake the host.
> The headset includes a radio, microphone, and a downstream Microchip
> USB2744 hub.
> 
> Link: https://lore.kernel.org/all/20260910170254.833871-1-mario.limonciello@amd.com
> Signed-off-by: Curtis Vogt <curtis.vogt@gmail.com>

I guess this would make sense:

Closes: https://gitlab.freedesktop.org/drm/amd/-/work_items/4333

Thanks for the patch.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
>   drivers/usb/core/quirks.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index b5b577f0b931..7ededf8d9cfd 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -596,6 +596,10 @@ static const struct usb_device_id usb_quirk_list[] = {
>   	/* ShanWan Wireless Gamepad */
>   	{ USB_DEVICE(0x2563, 0x0575), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
>   
> +	/* Valve Index HMD hub */
> +	{ USB_DEVICE(0x28de, 0x2613), .driver_info =
> +			USB_QUIRK_IGNORE_REMOTE_WAKEUP },
> +
>   	/* UGREEN 35871 - BOS descriptor fetch hangs at SuperSpeed Plus */
>   	{ USB_DEVICE(0x2b89, 0x5871), .driver_info = USB_QUIRK_NO_BOS },
>   

