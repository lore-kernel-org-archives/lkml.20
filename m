Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012060.outbound.protection.outlook.com [52.101.48.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDF03115A2;
	Sun,  6 Sep 2026 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788699393; cv=fail; b=uaEAdJD0qOWF9PlJtpjZo0r2VX+ZoKmn+nKQiuWQPNLTAKI0pMIFEDe7gepM7jyqFdaQ8T6g2kfGSfz5cZTsFn/N2ebBHE3Sje8Th9k4Q0zBQ5vq/WNZqcy2v70bJHeqYAAc1jcrufomLYC39nl42RhBywdCZw1EEsQz49s+uo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788699393; c=relaxed/simple;
	bh=cPtrpER3w7pQ61MBhanwbgpuOABpKBMJiaAjFNN9cZg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gHE2sbuLqdvYA3GTzkaHZjVV6HnVLCKzSXnvClr2Tbc4MgK+pDR48IIRg33nmMDFvoXJGITeGRuIwkEnI41rc5qw55nXEnFfcYTRUiHnvmgmeOSvl1QVbqQ0SfVMkEJQDUCe3S3cRTfkpEhYHrs1wksrVgxpm1IOsARjsDGWwWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PqBfGwUQ; arc=fail smtp.client-ip=52.101.48.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PqBfGwUQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zHbCANYOy+9XL6RQ4zX7Dlo6dPrT45cjvAXTqK1hg2yY3QZqkb9WhEQ7nWSEbEgnPW6QUuNfanrZbzl7/C+wNdwr+qlXweG1QpnrLPsYNtAoS0olNdtiPyORf3kAovCtW5uPIhFKIDBppF2Bm/bm8e0ddkYe51l6SpJJuEW0ChM+WnaJtVy6y4Ou8+0LAoCN7ZncCWtDN5ABm2dkNQHS6jlHuIlqiilvKsqctpBgEFgmhjhgVhrJONP0Zt93ElFkl5jJGhYvQ1r0VNXYOOHyb1D3KLhumqEgRGYDi6SADRFc82Js4/nQqDD974SdbBjJgFS1VpkVBzzuW78MDz/p6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vANDqO1s7gz0DtgMbhQF15nsepstnmkbmqMcgu18Fw=;
 b=R0mGIyLXhTzLfGwg2De46XF7R4m/jjs1r9LBiCyZbpYjuQsyqpmbMl+Snu8Kh/1KutglN2SE1JcULvTXriOa1SaU97yBNxUhffnC5Ss90Pk3WxpDhAaEi88SNaypViXlL6pmPGLglrJ67RM3eOo7RDu3g68Xcx4DG3jGX4JWqXriVCFK9QAR18bmWmbS6a18wLr4quIIBdMOdZb73dqDJnR5zxQ6t/7nCJmOgpy7b4ssEHAwe3U7Wr21MkPdS/QrrOmGBb49BBgrLyzAh1gpCBYq+ND+0Fr1Bu0wz3g4dk3m23iUmhO7xMRwUjDvDjrH+jJeF88eOsfmSwx2u00VGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vANDqO1s7gz0DtgMbhQF15nsepstnmkbmqMcgu18Fw=;
 b=PqBfGwUQdKJtbx1vz+mtaHOfWBp4k0jGXYXFgHwv6m53k4Lxpcbyo9r0W3xfclpIq9QaI5OjNbRJ5MhHwKYddtctr2jvKoQyqwutp2Ft1sQIPJBH7SrPQSebPBBbvevglMCvq4G6zdRLnKwPRPX7TwrvQgmfbMMuSvboWR6YETg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by IA1PR12MB310634.namprd12.prod.outlook.com (2603:10b6:208:5a2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Sun, 6 Sep
 2026 12:56:29 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0382.014; Sun, 6 Sep 2026
 12:56:29 +0000
Message-ID: <5e125a63-b82b-48cf-a8b7-74515424423a@amd.com>
Date: Sun, 6 Sep 2026 18:26:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: tipd: Zero-initialize CD321x partner
 descriptor
To: Sven Peter <sven@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: asahi@lists.linux.dev, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260906-b4-tipd-partner-desc-v1-1-073559f142ff@kernel.org>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260906-b4-tipd-partner-desc-v1-1-073559f142ff@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0223.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::10) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|IA1PR12MB310634:EE_
X-MS-Office365-Filtering-Correlation-Id: e0d65b69-101f-4fc0-7bd4-08df0c1644be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cMoHPKYMWf8YxmkjKtENrcgh2O5XT1Wxg7PHNUjL56pfsGSJgSXN4lFJiOdUHwxMWoVCxQHNdWcyUM3S+W84162RlSwUTgV9EurLTqDp8ltLFwXCm/aWD0B568Sac6aDJpMlmR7TipUSwSt26QUGUeEn6SGZ4wQzgb4HSKbWJ74ZjixJccT4GaVHaLGlM+kgc+XbcTa9RrPHgaL4wS/cfy777bDtOAqjJodx4Dy9BgJHb0QHpgNVbLzfyII9AnjbfMUBrgwK62xe8QoUoxFySh51u1adUAgALpIpjsgzE/3tko+wpl/TNso0xKa9Eh7lEfrBTpX6/GjlZahcJ+Htr9Oa3YxeFf/icm8XIuN38tOfUbAR66FjlKvl6wO3EWLKZ5sJiJHm2s1bzENowzD/TRKAJMWszVejHad/qqYr7bK26PVwr5cv/3S/rNntObNmlQynyP8CGGM8j500YxyXuvJA7h2E9gBOFS4hUCyRxznZfA+zauQTh90I2uKHUkNfUMuCCk2HCASxmlnDVdGRB1+MH1YZR+yb5A9rVczWRmR6pd7EBXV/fOPfoVYfzuBPTS7TTDhhZtmcDOdjfusneG9mGJzyuHmwIlPri1x7pCBVpFo7foygTNCwhjCcnS+LTFyihFuviswoay7mm7zqhVny5Uu0baXcFQVuHLGcOAY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUEzYTR1bU9Wd0tLb0VjQTBtWkFibktFbi9hNFZvVGpvb0MxNWNUUFc1QS8z?=
 =?utf-8?B?K1dMdFpBZnBIbzZtUFZGUVBzSFBLM0RsaThrSmNKVlhvYUJ0RWVWcTlTS2hQ?=
 =?utf-8?B?QmpTRXBkRlp3OWo0bENFclljYWhocnpCMGl1aWN1SEQwOUMwTk5SaU1ZdzNE?=
 =?utf-8?B?Z0x5eHZJWFUzZFlLWXZkVlZpVitPQlBsNGswS3A4YVJOK3R5Q2FzY2RXamZw?=
 =?utf-8?B?bStlbHZMcGtOZ0dzY2luYlFZdURodmd4TWJNKzg3b1ZJWUZvU3RNcXRZMkFu?=
 =?utf-8?B?ak5nQmVPZk9CM2RxOUduTlk1bmFiZWkvL3lyS1A1YkdWcE1tV2N2K1B0Umsy?=
 =?utf-8?B?bG1UN1B1cmZQdzdwellJUjlaR3BiL1FtQldSY1BiUWc1U2ErQUVVc1Y2VG9j?=
 =?utf-8?B?YTNGZXUvZmdjMm43dnI1eEl2dUhYWURKSjNrMVBkZ3hHTFppWjZLL2ZiMmNm?=
 =?utf-8?B?Tm9nMHlhZ3hIM0RvRDAwT3dRYTc2dENwQmNHK0dYVkpRWmxydnFYQWNla0Fp?=
 =?utf-8?B?Ujc1L01mNjYyWnRvNDBQbVc3Wkk2ZzQ3eWw2MURGbEtZOTZJZ0hLY082eFVK?=
 =?utf-8?B?MGF3cEh1bUZIU2hGbXlIcGpTTWxHWENWWXMrbGFtWWlRVXhaZmpjUHdJeTRP?=
 =?utf-8?B?RlpTb1lxSUlXN1EvMTdXaFdBdnBjTG9XQU9lZGxnRytZd2t4d0NRTHA5YWpR?=
 =?utf-8?B?WGxRazNWVExUTkNCazk3SW9Cc2NHNnc4VUpjWUxZZGhBQnhhNU1VYmFRaEhQ?=
 =?utf-8?B?ZTg0ZUpDa2lWQ1RyWlhEazI4SVBhY1JGZEpYalExUEd1WW5McnluSFVqV1JK?=
 =?utf-8?B?N0FzSlFlWVR6WjVWbXAzTFgraEVhQkZ5YmZsQ3ZjYVJlOVRDTHJpT3Z3UWpF?=
 =?utf-8?B?eldtVFVPNGRrczExTS9pZHZOSG45eHIybHQxRVZ2eHR6dmNScXlseUE1cUZD?=
 =?utf-8?B?WTNpNEZUZEtDMnc2UkNOZEplUm5wRFhkSVlhZWZZK3YrM1Z2aSsxVXY1Rng0?=
 =?utf-8?B?dFFQczNQTVFGWHhQTzdTZkl5V0RVZm5YNWRMYVJ5VVg5SmxPZkhUemtDWkNv?=
 =?utf-8?B?TlpEcWdsWm9Za3krdW5TRTBPU2FxbnJqRDkzbkF2c0NRN3RURjlXSTJ1NTgy?=
 =?utf-8?B?Y2RyT2xKRit1b05KSjJzekF5WnhVNGoxVGNMVTVtRnhIWE1ZU0oxTGtxWm9P?=
 =?utf-8?B?S2RtbzRmOVBaZnhwdlFWZUVuS1M4dHJidVZjVHJiVWdMaHBaOHY5RlU1V0tw?=
 =?utf-8?B?endkcHNxcmVSWjdTQUQwVW1zazZoTEFBcjBQRjJlOW1VU3I1R3RGVWZsV2E4?=
 =?utf-8?B?ZFZqN0JlMDc2cTZOTCtJNTNKN0N0dUpqaDdvTm1rVm9tV2pYVkpyM3AvRUJ1?=
 =?utf-8?B?RHcxTHdLVy8yd0xWcFM2b25IK3VFUTU2WmJIRVhCanRPRHZBT1IxandCdUJT?=
 =?utf-8?B?azdCdEJZR1ZhelMyL0YxN0Z6dHBxNTYxYmgxN0RCOG85bVlVc2dPVGh0Q25r?=
 =?utf-8?B?V29YNzZDWFhrajhBT3BHMW50RUQwMHQzcWFIUUJ5OXpwUm5iTkpydTBiNHZU?=
 =?utf-8?B?ejNDaWtOdzZwemx5U1VqOURxd3QwRGNvUktZQ0c5YzlQMW80dGVYT3dlc0Zo?=
 =?utf-8?B?MmhHZ1I2ajdndDRXTis4ajZadkoydjdUTThYZkdpMHdjWlhrcDBKM2hNMWhK?=
 =?utf-8?B?SEtrWXNKeHRkVUFUejZVVTVyd1FyaktUY1lBSFI4L050MTFadmQ1ZjM4MG1D?=
 =?utf-8?B?WVhjRjB6bGZHSjMrcjRDOTV4THJGVmdoMFh0Z3YzWGhPck0vcStEcXFDZVJq?=
 =?utf-8?B?S09QKy94RGNORGpCQ3VMaTg2cDdZSkxBbTg0WlFqMVUyamdmeXJGOUxQZFJC?=
 =?utf-8?B?bm02YTAvRHRGRzN6aHNjanFKVVdrTGdLVUFSNzdibnZtb2hTSEpCcjRwVTRF?=
 =?utf-8?B?c3RoL0RUZUQ1QnAzM0VUOVNsOGhRanNZelE5NjdQTGtUQ3V5REdrY1JWRUNi?=
 =?utf-8?B?SGZ4Y29qaEZGOFpVakRHS1dqeDBaeWZlbVA0YUQ3U1FHQ0loU0RKRTViN2s0?=
 =?utf-8?B?cUUzOVMxckxzS1RDS1VRQ3BPMEEzRk1UUEpSMWxBYjg0c2tNK1ZramM1UGZu?=
 =?utf-8?B?Qml5TzdIUU03UElYYXB0VzF2bzA0cjZtRDd3MVptUTJ6d0dxeXdqMWF1VlFl?=
 =?utf-8?B?OGhBdks1TGRiRmQ3eTB4NXNTNjJLbTBIMy93OHJma2V0ZUZuZExoaE5sNEF0?=
 =?utf-8?B?cFdOSVc0blZNOW5zUE9oa1dtWk56NHRQbUlpVDUwdGVPZURtRGFHY0U5QXJ6?=
 =?utf-8?Q?ngCHSMhQ9Z+R4sVP6L?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d65b69-101f-4fc0-7bd4-08df0c1644be
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 12:56:29.2701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwSOwkbdl9YV1rxLxgqxmwL3wEWaDa4iIk6EKnorS9svS/WnbWBbVnw1rzACdzTa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB310634

On 9/6/2026 6:13 PM, Sven Peter wrote:
> The typec_partner_desc struct isn't initialized and instead filled with
> whatever values happen to be on the stack. We especially don't overwrite
> the attach/detach callbacks. Just zero initialize it to make sure we don't
> run into weird issues in the future.
> 
> Fixes: 82432bbfb9e8 ("usb: typec: tipd: Handle mode transitions for CD321x")
> Signed-off-by: Sven Peter <sven@kernel.org>

Thanks for the patch. FYI - i have already fix it in below series[1] and 
will resend next version as it is not merged yet.

[1]: 
https://lore.kernel.org/all/20260812161454.149606-1-radhey.shyam.pandey@amd.com/

> ---
> I deliberately didn't cc stable@ since we can't even reach the path
> that would try to run these callbacks on platforms where this is used.
> Just noticed this while working on the USB4/Thunderbolt series for Apple
> Silicon.
> ---
>   drivers/usb/typec/tipd/core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 522f56742aa9..07d6d88e3a0e 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -841,7 +841,7 @@ static void cd321x_update_work(struct work_struct *work)
>   
>   	/* Set up partner if we were previously disconnected (or changed). */
>   	if (!tps->partner) {
> -		struct typec_partner_desc desc;
> +		struct typec_partner_desc desc = { };
>   
>   		desc.usb_pd = is_pd;
>   		desc.accessory = TYPEC_ACCESSORY_NONE; /* XXX: handle accessories */
> 
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260906-b4-tipd-partner-desc-07915a127b0a
> 
> Best regards,
> --
> Sven Peter <sven@kernel.org>

