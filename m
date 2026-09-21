Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012012.outbound.protection.outlook.com [40.107.200.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0643C3DDB03;
	Mon, 21 Sep 2026 07:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975824; cv=fail; b=pM+OM2FzmboEXx31vwIF4YYXb0G8Y1tGTbC1Aqa/wkjMtW+2F3SGcdvab32ka6hjw0zzklkGtQGxbydRjnbi1ijWN3yG+YpVj1gg8yOHhS2/oSZX4pENrycnh4RFJuabul0o/djJp2gJMeoT6npttSRZkzpqvVmODOf4WFUdYxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975824; c=relaxed/simple;
	bh=KDz1ldKWLvVnMhXEbRTavFev5F9nVyZUkil68nWER/o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LLoLEIoMoV67vtYcnsPG585er/xJMUA9fL81jF/T1ER6GKWmQ8dgN5WSsu942KvFdqtq2O20SmCmUMzQUQnZevRsuUIt3oYW4Wuxt8oOFf35C4/+hk5y5IC++kSab9Zq4/MVd2V5ssuwUql6vs1Wk75VQjurUM7Tfl+cEW9O7jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gBlt3f9i; arc=fail smtp.client-ip=40.107.200.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gBlt3f9i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vEMyEM/+P6FAplYkHk7Ecigt/RqFEMN4FyT2TSu+rD4QWN64BXB5ijEI02kdYlY59V3TJ8SlODOaMwKzRer+xytYUdF6cwhKSd7mCOSFlg1dAcy4JlzkIlfwMfmIvC2rmfTFuNQJBRbfBM5/wysam77iiaRdbbRca76jUPwTQK5WqEVmeZZvlln3vis68cRAFipfzRikNyLP1F73dMAx+xbLZLmwPrUF4vIo51zFWFYiaAPz3SZ4bTTpcxoruNCgUZMPjhcYbIoGtGayOkDC6upmp0Ug113s82ONeOnruVXrthxzHh0AKrXvyfn8R57FoZ6y1159+1xylvzudRdO8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZzwW7VRJ2srMCD/sguYzSiLGFspMucc4KftIbsbEz8=;
 b=Hi16t3A0Wg9ssqWazkfTwA7EBbX8DNgaJiTRvxEzNUVlRjVXCehcgepeq4SPSm9Bn5sgzgC9jVQX/RiOCZOjUVCdELFfa1aYqQaBJrV3qdd4kIJPMuPZv/YyCgqn3MmRrKfpb1D7L7pxfihYYx1KdgW5HMYzcDh8nyqFncUc4NBNpQhKPS4ciYQ9zuzzMfWaCfMzq3ju9+LyRntPGrqb2VqyGJxk2g8JjuEr8Uek1pthEmgcnyv9jClloD5aw+wF4iE4NcToXAg0sQ0nZ2NE2/Jye6sMBCgj1kssH88biBmXLpewlElbTwtOF/yViKnk3tsB5UO8M9usToNywD4mMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZzwW7VRJ2srMCD/sguYzSiLGFspMucc4KftIbsbEz8=;
 b=gBlt3f9iK6jsepsJr5wdwUTQT6VFrploVoHJdgvdcOttBRjgIy6mbeKb40IdEwqli9sVmcOsR99J+ExgNgUDFcemsVDQqhecQ8PsKax7nHM/56Q4aLM4IhNGgaLlV0Aw520VVQmURfWF+A4Vo3jOPSJFnUhv7iClklnMAlRKg1I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by DS4PR12MB999100.namprd12.prod.outlook.com (2603:10b6:8:2f9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 07:30:13 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 07:30:13 +0000
Message-ID: <cf2ecbdb-0816-441b-bccd-152ffe800aee@amd.com>
Date: Mon, 21 Sep 2026 09:30:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: ABI: TMR manager: use literal blocks for console
 I/O
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org
References: <20260921044912.97843-1-rdunlap@infradead.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260921044912.97843-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::11) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|DS4PR12MB999100:EE_
X-MS-Office365-Filtering-Correlation-Id: b5aebba5-2d37-4843-6a9a-08df17b22ccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|11063799006|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	3I5I6Irad4FYw0hVuKKo8BIbQVdwoEMiXF9+kp+2N+RYbFne92rLyLdzPhR/G1qm3lgKLPrnk7Gq5s4BI9tkbKKLD4dZc+U3m6f59KMl6DFt1z5GxpltCRkxpQXyUm67uyY0SoM7kL7gME6R7mAIKFIV2rqs3aWc0CN4dNDtBS1hTk/965PVA6YWiJSJvxr2LVKbci1LB6U1m+XHOd+DfEgy8sxRoj6g8V8WZBI5QnSL5icc3rju0m6XbnjQQklAfQvL/FgDPs2dld/GXP3d87q2HjjPYd7s+7Y0WcTcqRniRU7k1k9ybpjXWmHQa0VBOJWYLgVNihwHenQfHM0uJfzrryDCP4aUQsyvxpp92QUCAuarWUPuoDkkUvJT6/kAzSLHoaYjsjmg8sqR4jHCJyfiouukqpzTz32AHgh9swx+eCMTTMhRkMdjh2O4IZW1Pc9hxLniF6s1QVUtebc2wX5rVbVi3jx2ghM4HHd8mhfTKiGIDrpIDeX7fUB0REjm8BctRUmjIvTCB5Ph+IsGyquJ22UntCxvOocWC5l3VRPRT8F7KcdonfLvjg+nr4CrmVMQrU6ar6+7kmlwlzjt7hqgRC9cDfbTar7dKlEMjsgfki8c3bmtzjGspmPkGU5J
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEZNOFRqdWlUNXYwUWJrK1pvSUFaam1iaW0vYjBTV2phNTBzeFRleWgyUU1m?=
 =?utf-8?B?YVM1QUVXbCs3SUN1UjZMcGRjcnVNLzJrVTJ5RmZyakRHRGlLTXhCWVl6UitQ?=
 =?utf-8?B?THF3UHU2UU1RUGZ2RW4rL09aNytIZ1U1UXVKWkh0V2NJdlFqU25DZWlwUUlD?=
 =?utf-8?B?NUNvTnMrZTdwWTNlMUdiOHNnanBQMEVINkRjS2xHYTVVSjBwbzAzSE9Bbjc0?=
 =?utf-8?B?cjdtektpZVV2cU9BVFZ4dkJMUmNQdndrbE5FYUlxbjYweUdNWUdad012Z0My?=
 =?utf-8?B?RGFZekd0Y3F0aTdoZHllbCs4RHR5am5PQTdHVmRFTllRTWNSb0JpZFVSOWQ2?=
 =?utf-8?B?d1VlcllORjUzZFJRaEhCdHNURlUrTm1MdTROVTY3WGFLc1EzdVVpR1k2b0VT?=
 =?utf-8?B?eTZNb05FQyszNGthOU5STEVCWDhrcVRpa2NLRVEwbjNQSVJTeTR2T3J4S29x?=
 =?utf-8?B?WmtSZFJ0eUMwMVo4OUZzSGFkditZM2NqVG5iREJKVmR4VENiMUtpNTVzVVhK?=
 =?utf-8?B?VDBWYXBRQU0xZlI3bmxma0FLQVN1S0NwSFVjZWFMU01GcHIzV0l6NnFqSE16?=
 =?utf-8?B?WGVLZ0VTNDB4Vmd1a1VnQlQvYXJkS05iYTdXVndtRkFlWWJDVFZ2SXR5a1VN?=
 =?utf-8?B?TFNHam5SbWpvWWsxK3FGYXd2RFRBNHZ5QlNWeUtZRWtRQ1N5UVRINWczdEZp?=
 =?utf-8?B?WXMwMThVRHM4aDdURHhvQWhIYU5vMDRMYXp1NnozUFRVdCtZQjJaMWFpLzI2?=
 =?utf-8?B?bjZkSW5waXBJT0hLUnE1a1J3SXBGZkFvSG11dTRlQ1FnV3NzMG1RYzBHbnZ3?=
 =?utf-8?B?WlNObXUwS2Z1MzZ0L1RrdVF1UGVUYTBERVdldHdyTlBlNnNtV3k3MWM2OTdL?=
 =?utf-8?B?TXV6empnMU5qci9oKzUzMTBZU0pKbStVbFI2TDlQWE5wUU5qRld2VWFzYXFT?=
 =?utf-8?B?WTUvbFpURS9IWDJrRVVyMGtUNWR1YjZjbS9JQldGZFJPa1lkKzRTQVVTV1o1?=
 =?utf-8?B?Qm43RWhwYzhOL1Z4YU9Ec1BQQWdaT3h0TGxORXhqRkkvbkZVdkVSUldGTVJ6?=
 =?utf-8?B?SmZSR3RoQ1pWaWM0ZDk3UndNR0FxZkVqdUtZbEpSM3laTGxIa1RaR0hrTUQ2?=
 =?utf-8?B?MksvVjF5cWRiSkNSbHZseElHOGNtWnZ4NmdYZTlhVEUvNjczOUV0Y3dIYTNB?=
 =?utf-8?B?WkVYdGpwZHhpQTBxdUF0Mmp0Vm02SXoyS21acGUwNjlBMnJIL1BEQ2hUWWlG?=
 =?utf-8?B?UldJRzZjWFM1d1dRcTFIQ2oxOEFBaDlwbU5ROU1wZ2JPaSswS1dubXBNSkor?=
 =?utf-8?B?dURvZGhHY1hxMDZoYW8zSGs4dWt2aG83eExzZ3hmTmU5QUdsR1FtRlZQVmtM?=
 =?utf-8?B?OW8rYTVjdFFmRzhveXFLdkxLZTRVZ3g0REF3NXNvVUd5ZnQ0VW1mMTREaTgx?=
 =?utf-8?B?MGpIVmdYc3g1NGpFaTd3SnJKVmVMMDU3OGIzanNRaGFpNWdNVklNTXNVTTlv?=
 =?utf-8?B?TFAwYVd6bzloWXlGcXFZSDZRV09LYUtGVy9IdzFzczVpK0JOTE5vRlJhYUhG?=
 =?utf-8?B?WXpWMm1QWU5lYzl4aGZqVnpLaGVjcDNoSlVOQkVnK0hEOGkyVEFXNVVTVVVq?=
 =?utf-8?B?YmhRS1JRTitHdlRuVnhBZDdTdWEwNmJLbXUrLzRuL2JZQU4xQWorNE9mWlpP?=
 =?utf-8?B?emhZYVVCZ1R0ZzZhSTVSc09GNjBFcTRwN3crK20wcHh2NnVqUE5KcFh4UThZ?=
 =?utf-8?B?dEVabDg1b2tqL2hoV3pScGlYT0pyWk9leWFpMFJQSG93eER2NVVnNHlXZXZS?=
 =?utf-8?B?UlVxNFJHNmxuc3REN1VNV3VUeW9MdE1CWWp4MWZyTkhNY0ZUbXE2djNydWdm?=
 =?utf-8?B?WjYvc1BvMEdUdE9qNW5BQnIxYVFwdm5YUTB1YWx4Qi9pT3ZJVmZTWWc4SHIz?=
 =?utf-8?B?d1dIaGlyRnRuUnlBODRYVnlCRGl6TlVFbmVxczVaanIvWDV5NkZPZXdMM3k5?=
 =?utf-8?B?UmNzRWtUWGZFN2I0dnhLK1F4QzdRNTY3c0ZoZ3N1V1Bwd3Q5OXNXQkhDWW9Q?=
 =?utf-8?B?WExKcm9Xd2RUTDk1emEzOGd4Zm9vZ3lBcWh3SGlUMzNUTnhCRFZDNDJSRW11?=
 =?utf-8?B?OEN5YUxqbjNTcTBKTGR6aDU5bDBSQ0N6bzJEUHVTN29XUURuWlZUTWFmdHpy?=
 =?utf-8?B?T0lzcXcwUzZ4RkQwemxXUm9uUm5RVFJYYW9ZcmNnaXRoeDF2OVVWblM5b0Vs?=
 =?utf-8?B?bDE0NG5ibHpPOWdoZWtjbEtNZ2l2V3JoK05aOVU3TmErOWJVbFZFakNmSUVj?=
 =?utf-8?B?ajc3TWdLVmI4VjkzSlJQMUlaYzRIQXlCNDUwR1h6YktocnhFYnk2QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5aebba5-2d37-4843-6a9a-08df17b22ccd
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 07:30:13.3780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ru24pWWG08Nm/4BaIJub9QZ4u0H0NO6R3T61tYQRNenJFk7QFkQ1UAl5ke/oobe4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB999100



On 9/21/26 06:49, Randy Dunlap wrote:
> Use literal blocks so that the console commands and their output
> are not joined together on one line.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>
> Cc: Michal Simek <michal.simek@amd.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
> 
>   Documentation/ABI/testing/sysfs-driver-xilinx-tmr-manager |   14 +++++-----
>   1 file changed, 8 insertions(+), 6 deletions(-)
> 
> --- linux-next-20260918.orig/Documentation/ABI/testing/sysfs-driver-xilinx-tmr-manager
> +++ linux-next-20260918/Documentation/ABI/testing/sysfs-driver-xilinx-tmr-manager
> @@ -3,14 +3,16 @@ Date:          Nov 2022
>   Contact:       appana.durga.kedareswara.rao@amd.com
>   Description:   This control file provides the fault detection count.
>                  This file cannot be written.
> -               Example:
> -               # cat /sys/devices/platform/amba_pl/44a10000.tmr_manager/errcnt
> -               1
> +               Example::
> +
> +                 # cat /sys/devices/platform/amba_pl/44a10000.tmr_manager/errcnt
> +                 1
>   
>   What:          /sys/devices/platform/amba_pl/<dev>/dis_block_break
>   Date:          Nov 2022
>   Contact:       appana.durga.kedareswara.rao@amd.com
> -Description:   Write any value to it, This control file enables the break signal.
> +Description:   Write any value to it. This control file enables the break signal.
>                  This file is write only.
> -               Example:
> -               # echo <any value> > /sys/devices/platform/amba_pl/44a10000.tmr_manager/dis_block_break
> +               Example::
> +
> +                 # echo <any value> > /sys/devices/platform/amba_pl/44a10000.tmr_manager/dis_block_break

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
