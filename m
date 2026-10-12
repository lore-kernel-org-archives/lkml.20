Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012051.outbound.protection.outlook.com [52.101.53.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4973E45C6E9;
	Mon, 12 Oct 2026 12:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808551; cv=fail; b=JtI7zfvJP8HAmMrXrxoQ4BS/Hcjvf9/9aQhVj7YH+roDjufWgSoSwZrErk5N0+s428MdeBNTUQMASgUaz0KZEGfzO9EZotrssQY0jg2/M/8CT5VKI4R3bOUaKVHysQsnzE0a2ski3xbXP/O8Vwc87P3GJgj2i8OxzcHpxsk3RFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808551; c=relaxed/simple;
	bh=BUtJC5YNvtISULXW7KxalnFPo353qj95bEPRml+Jxgw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TB898vF5d7OhzPUuKo3RWiJC2BZ1yKwjXVzu7O6FkrRYmuQd6PByUPFNniB45eE7DOCkFswpVSOJMPaJloPQvF+fRgDcNZaotGAJNUKJN1o5bT1SldpSjtxImVRFWPGaogKV8EXTPZTmHdiI/oDXZN61n/oz7+feGNrHXNygsVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LWbW73+G; arc=fail smtp.client-ip=52.101.53.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LWbW73+G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YoD891hXxh03opwrAaNwpu3NtCBlkJJr9O7U7sLyIi0bSHlND982rTRAc/Cz9SOQOKcmH3BhfJxrSJIy6DESpIGXrvwzZ8jJ/M919rBZuJm98m92DVUZI0DNUz3Wm2ttblfoNx14Uj0Eh9TZ2Po3dE/D89gf0iFIcd/wLfw77RJ/n59qF3au+e02UDeDXZPlQnIobbcnoStcej1lEVcvJtXEQh4RypKHJ/DhlNRINjrBAEwTqSoFzJ4R8byYsnBd5M7Cvg6voPrqyDW0ffj50k6ptzplDuyHtSNKlCAq9y8gtT2eziFTVdxZ8bJtKkbC9TVrKQXDe+1ok7HM3D7gNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wErDPllZ4Mx/AeIB3PEYFVaSlYGlf7JwMiXfRNDMPDE=;
 b=ypAjBWJb/MgNvSxu2V9gGk6pfyVM6B1nKS7tiu5LNTHWwgO6Mf/majfATvVKP4Z8mnS0/wJ3F+Qnr0f0Jqgxc0H8B5aNFiAkz93KcaUxLAq1zyuxNw5T8DE2IAs5lOKur7zj/CZDGZ5MTOIRH1bRAeXiWSyT2qlIxWS3dgOTDovCq/0CFZqKI02tAOmhUnBzE3OTFqbSobLx0eJzEpzNGkgmXeZvo3AJOdswbU/YDGwGq83ormQebIRjmFJVkjQiQ6U91IQisxV2pHa1A1IhjsoH+5SbibmkTtJxKnEPmx9P89c1O417hBlxB/KCLrjfXrpX5uwcdCVWNGNCVeyNmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wErDPllZ4Mx/AeIB3PEYFVaSlYGlf7JwMiXfRNDMPDE=;
 b=LWbW73+GShTmiklNgKPgq9ESvSyu+7icBSRXkXVHVAezhFjPNFql00znV60MP3iTbqbd78wBPtt1lqCx3djFpoxwKBgGwydXScw8rJOOQWwHgL08TYVVXs2LJi2FVOEL74IUReU6CO6+yRFedhJKp55oKuePzr2AoZt4TD7Du6A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by CY5PR12MB6647.namprd12.prod.outlook.com (2603:10b6:930:40::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 12:35:46 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 12:35:46 +0000
Message-ID: <1128f456-ed6e-47ee-8dda-157af99cc404@amd.com>
Date: Mon, 12 Oct 2026 14:35:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: coresight: Limit static replicator
 to atclk
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Wei Xu <xuwei5@hisilicon.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
 <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-1-c3edca1c480b@arm.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-1-c3edca1c480b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0207.namprd05.prod.outlook.com
 (2603:10b6:a03:330::32) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|CY5PR12MB6647:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e772a68-3b79-4608-8156-08df285d569f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|22082099003|18002099003|10067099003|3023799007|921020|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	SbpbIrNfZb7THbJf/KBoH0mDYruOQnV7CWWVEjQtTwdctDUDayymXypIwTQ2R0e0XMfwzZUf+MYBUvJZn4Cr1mWpIdCvVEoZtVzMuiR9ZLpeb609RLmohiJNf3Q/iPM2KM5AB+yKo49NEGSqN164lLUKpZm7bwQzD20bLtUvSidot6cRdNf13B/zno92j0MMKIkbsXcwNj4VOSmnOx7MghawtTZsQRHakoB9C6sYqlE0rjZHCYFjqB2L0V+YYgyd4tiXaa9ovHw/Mo6yTJl1N0zCaqZfLOlr4pTMeGPgDE+G874XqGsO8eHDzS8QqKz4t7sDeO9s1kWI8iwgW1ijRIwJdbX5JcsZuyWyAiVGFWvKkBZ0Szy9a/98Hc7xtIqMMpPJ/pRI15VLk/yJiDpGFwTKLyY9RelSJVAKqCd70pLwKTXgVQcGS7Hf5qouMCJUvFMTUcGkmKS2rJaFBLhgDG4o8YN0znz/jmyHfVeR5/4G2XQSqbdBOK9c13xssu3vf8WjLUPHUXonJDMtVuQyRGS4+ab8+xz36sgIWQG5iF2WQ2UJyiQ7nxbH1/f2i2AyKDNoiohXVEVP3E9j/6CqaESyy5gKyWuF6I5ZaSFxpaaVIMP86wEhsDP/jyosgxlOVAniPyPtnlYZLa8wTv1fTQ4t6MCrCfyt8FN70LPUv+aAjvQdI0JBYXfd2uoP31DPbibSI3rsylu0L8Oz0k0mJQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(22082099003)(18002099003)(10067099003)(3023799007)(921020)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elI0VEFWays5V3J5Q3l0R0pOUzBjQ3B3K3ZDdE5DNkw0RHN3RWQySFdUMmZv?=
 =?utf-8?B?MTQ3Tmx3WFBHajdjUk1QOThqSjhsZm16UjlrVGcyRnJvVTB5aThpc1U4ZXdO?=
 =?utf-8?B?bVQrVnZsNXpBVXBIYThnTjZGaXRhTUtuTkphRzZaMzlMRjRJTW5iMVBGbFVR?=
 =?utf-8?B?UmpPdU1tQ0phVEIvNFEybWxZK3ZqMWZ2WmhsaU1hTjJBcHc2dEVkS24wQ1U0?=
 =?utf-8?B?cGJLUmx6d09mZFRzcEJDQ2xoMzRhZ3NuZzY1VjVsamZUbTdxQVZUWjJHMUVt?=
 =?utf-8?B?K0MwZ1lua3F4REVhSjhpV0h5ekIvRDVNSjhmZzdTQi93aFNINWNHRmhpYU9C?=
 =?utf-8?B?dXAyVFBYTVcyMWE3T0F0cTc2RVdpdzZyNFc0WUkzRFlCam43V1VDZzRUdmh2?=
 =?utf-8?B?bTZnQmhXUHc3UTkyZE9Ubk81dGZUREpvWGZtZU80b044YXlTNTRLbktRTkhu?=
 =?utf-8?B?ZW9zSzVNZ2llamNMMUtQWjlsRkhIMDZCRVAwcFRlenVralhrN0t4MWNYVkls?=
 =?utf-8?B?OTk4TlFwZWtHVHIyN0IxN1ZESitKZEE0dmxMbERyTERiWWlINm9kOVhqUld1?=
 =?utf-8?B?Y1RCUExhemQvVGtSYVcxak55cVpMMTNzeVZQcDBGQnRsTUwrK2ZpTUZPYUdu?=
 =?utf-8?B?Q1BXdWRYZ2J4N21MK0hvZUZRcEtPdks2NWIvbzhnazVIK3M2bFJKWGdPRmk5?=
 =?utf-8?B?U2ZTQkZKU3lqdHFwc01nakF0RUx3M2Exbk9UdDF6TktoYTJFeDNrZjRpSE5t?=
 =?utf-8?B?TnBLV0hBejFQL0xFbjB5bFRxTmo1cXF3MHh4MmZSRzQxT201YUJJYU1pNHhz?=
 =?utf-8?B?YlZCU08waEw3dVZmNUZTcEJBdkNnbS9XN1dJREh5ZXIrdGUvTXd0Y3BxY1c5?=
 =?utf-8?B?a0ZiSzU2b0R4M2czelpkM1B5UGZYSzc3VTV1L0dsNWVuUkZucVo4SFFUUEd0?=
 =?utf-8?B?Znh5VkZnTTNBT2RCek1CWktRWGlJQ0wyRVJSWnMrTklBcnlHR0pKSEV6K0Fr?=
 =?utf-8?B?bGROMHFpTWNENHB4akNWaGlWa3ZONlpZYVhEWWFOK1laZ1ZHK3daczV0cis4?=
 =?utf-8?B?UjlqRzUzM3BLeHE3T09Dc1k1aGgva2JGUkxVeG9SSVFjWUw5cWl5RW1MNDNP?=
 =?utf-8?B?bkc4RFZaeGNsaUVwNnNGcjE2ZkFIUjFVUmV5Y3hhUGRRaUNWTXlnUTQ5Vkox?=
 =?utf-8?B?Mkh4QlJLWE04RURsV1JVaFVScnFWY2ZpcStXeE5Cdk5iUUEzR00wamxOeEdF?=
 =?utf-8?B?U1NNeUNHVzZIQVVwNUdxQ0l5bmp4MnpPRG5VNzZ4d3pqQ3pDTmoxN2lUekJr?=
 =?utf-8?B?VSt1REVpT0pSeGZRRWVrbDhLVkZUaUFMSGZraVUreVVOcEZNUGozOTlybHJS?=
 =?utf-8?B?Z0p1UkNhSW05VlpUMjk5VGt6eGdpZGhLQXloeUNPcUw5QUYwTU04TGtuVjNm?=
 =?utf-8?B?ZGVqMDY5c0JRK1FZVTVnNElndG1LZG1OdU51aGgzc3BHN2xNV2ppZGRpaTJm?=
 =?utf-8?B?eHZyY2k3bVkraWlTYmVPeFl2dEY2MFZFZWd3Uk5KZmVyMjZOVXBmcDRkNnkx?=
 =?utf-8?B?eXB4eTFmTUFEeUNQaVlyb0ZaY0RGTzVkcU1oQmVBRXB6WW5PWEFieGE0NHEw?=
 =?utf-8?B?WUpHeFJYQUtEcWlrZEhnV01idHBwMnFDYy9TOXZ4MzBod09VWDdjMENadWFz?=
 =?utf-8?B?WGY0Zk1iTEl2YTNNSW4rVmQ2R3Z6aHk4ZHNCSmRjaGZ0bzhjYlFKdFlwZnc1?=
 =?utf-8?B?VlMzYnZDeVRBajIzd1pwaktxQ25GaGppQ3lCTGp3ZWREajNyTEx3S0dCSGMz?=
 =?utf-8?B?MlZzTDhtUXYwcXZPMXJ3Ui9LUVU4bS83YU9OaDhBbWFxVERUdS96SEYyV09V?=
 =?utf-8?B?c2lJQTM5dkwzeEtJc1g0czhhRFkyaU11d0dnQjJleUV5emFDNmg4VmJ0Y1ZW?=
 =?utf-8?B?NFAyem9Tb1E3aVordG5vU3JHdmo0aDNVaFRuamFOcWRPTG9mTGRiVGJ2OTEx?=
 =?utf-8?B?Z2lUd2hhSDhjQ2tDVWR2VlVDQUlVNytoMGcrZGZKRVU1MzFRNk5ZVFVvUHhQ?=
 =?utf-8?B?MENFVWYrWkpGd0NQVUtoRVZGNHhBVUVCcXVTVi9XdUFmNll6UUJ6a2V2Ykxl?=
 =?utf-8?B?NHVubTA4QlJ6QlJkT2lZQStJKzNwYkZvRmR6RXVCWU1LaXRLUFN1RVF0TEE2?=
 =?utf-8?B?dkdFRUJNcHoyckJ6eVh5WXNWUlBReE9wZCthMXluS1NncFh5NjYwOExxY0NJ?=
 =?utf-8?B?VkdBNlJqeUpUVFNjR1dUbTNqOW0rckFDaXlyUHJ4VDdzdnZjdWMrNnFqRm4w?=
 =?utf-8?B?OTNOd05ZOVk5VTVLVHhoSjU3M3hKNTNiWlJGUWdUSm9PTzJVbHhGQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e772a68-3b79-4608-8156-08df285d569f
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 12:35:46.1538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXwlH/z+TqzimJCpDKiXdKN1ylrMwWqnnUr4eY/gHgELoBYdsxHOgnB9LaCIzfrn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6647



On 10/2/26 17:07, Leo Yan wrote:
> Static replicators have no programmable registers and need no APB
> programming clock.
> 
> The Zynq clock controller registers dbg_trc and dbg_apb and calls
> clk_prepare_enable() for each gate the bootloader left on. 

That's one bootloader behavior. If there is another bootloader that clocks can 
be simply disabled. I don't think there is any reason to depends on bootloader 
behavior. If there are clocks which has to be ON I can't see any reason not to 
drive them.

TRM page 741

Trace Port Clock The trace port clock is used to clock the TPIU and trace buffer 
when the MIO interface is chosen and must be twice the frequency of the desired 
TPIU clock. The TPIU clock frequency must be chosen to be fast enough to allow 
the trace port to keep up with the amount of data being traced, but slow enough 
to meet the dynamic characteristics of the data output buffers of the TPIU.

It means even Linux drivers are not handling that clocks that clocks should be 
handled hence described.

That's why I don't think the patch is correct.

Thanks,
Michal


