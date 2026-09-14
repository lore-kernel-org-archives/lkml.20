Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010044.outbound.protection.outlook.com [52.101.46.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FF318C008;
	Mon, 14 Sep 2026 05:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789363941; cv=fail; b=mJ+lU3uJ29sBobuCUmJu8Xl35zh/cahgAU7UNN2K2Fhp1+/CUriuF0v14RC67Y7+073CBi3/KJABthTKnjqCULTCbDLsWq92ddlAfxObN6lLraYVgk6bbbAasFOS0fPQq4zg0705odUhAb1Ygy/NFETYOGP4lAxI0H9AIeliW5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789363941; c=relaxed/simple;
	bh=D90TFyzGlVy4xVFsKH5DG8l7wOkbY30M9qXb9bHE5Lg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JX7Z7LtdKvwk+a5Hoarf5+rnGb0V5tRZ01A7XLIOxr4FmSb58RymmD+XIgX64V77r3Bi9s0xf/tLPTXl0sfWUdgn/zwuv7ysYHZw/zWhOBtsmapw/hZ9aMtdxZTy/k1+3Mvzw8zr8IPRGGEk9M/DM9QTvE1G/5jPj9kDu++yXKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=E/H7u4ni; arc=fail smtp.client-ip=52.101.46.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="E/H7u4ni"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8WeG+byHOy1axLfTacfZouIDU5EoRpEI5X1tVbOsUC6OQHb72TqxIduSLyxFSLAG8euGBijRcbXARS2oBV6DWxclhUVqbj4cxajpikPUHDjTfbAj0F0/BZKrrLTq3VWgY/dM2eSzIRLTaYslaDgx3B8SkaHpOCRymkv8FWWRllypYmhpx+BWgr7BbfDoM93ES6D1+2CD3Wa7u5RLVuvKyke82iG8ULw2nY4sIna5Hgmd66Pk1rslfklX0BZn5wAJWaZyHFjDixvvQGouwCqH7qatjXAgdo1KKFkVFVhudpVOqSVABEPyKdLEX1dnWESDFBIh4dbHY0nAqfIei0FGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D90TFyzGlVy4xVFsKH5DG8l7wOkbY30M9qXb9bHE5Lg=;
 b=xJtX5COJe2UyfX0jzl8SM6eOQAF6bE8slxICNeKL+1rZuiMn1MsxAjnYjC4HfvL+5QGVWx7FjSvUPNIFPARQJ5sdiTmOePs89Dv6RPEm95V+JoAvSmMyfvEAFZd55JSttEOvpiac0O0gsdLohYXy+Ql+rHLhbUk0+oTThEGDVuHI8EUoziZt3oE/ZXe0ujtP5c8ZM/Rt0H7Z/oUi0YV22jgODVx13MOvKw90lr3s5+ZAm1c1Ks96mYC3IQkSjHPOfkLOQCbNMoe5fESDKdCZVLer6GE2X8Mkg9dF5ayd9R4pdpE/AzkhwM0bEikOUADyooiHn3FL3BaENy/sxp40OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D90TFyzGlVy4xVFsKH5DG8l7wOkbY30M9qXb9bHE5Lg=;
 b=E/H7u4ni4BrNQ+ess4EZpAG9pTbZa3yDJxVX7e2Nh+ODwwG4467C6ao/spBu8CpQRfvwCwGaYeVsdW0s3AgCtGAgbccCfqjqbQ7MiFXrN9XOi244GTn79a0Qhjj8mYx/OIiZHAHbKAQPfQ1Ebrzkub9rlcDUe/KDH0HRNEEXOAM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 LV2PR12MB5941.namprd12.prod.outlook.com (2603:10b6:408:172::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 05:32:15 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 05:32:15 +0000
Message-ID: <d326b188-6de8-4db4-8ff4-bc6f91868843@amd.com>
Date: Mon, 14 Sep 2026 11:01:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] soundwire: amd: cache ping slave status to avoid
 spurious disconnect on timeout
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 Syed.SabaKareem@amd.com, Mario.Limonciello@amd.com, Richard.Gong@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910190240.1604447-1-Vijendar.Mukunda@amd.com>
 <20260910190240.1604447-3-Vijendar.Mukunda@amd.com>
 <5c651fd3-c177-4d9e-b13f-3dc62f0b2c97@linux.dev>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <5c651fd3-c177-4d9e-b13f-3dc62f0b2c97@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26a::10) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|LV2PR12MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: 2437c94c-3f25-43ea-edc2-08df122188e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	dLwbGANg0/lGMF4GPneUXxK9b2hl5O9+rYooLtBXEGzDLc77A1felxFAG0/gtSdXwyZGhsnlQyFj9n1/+lwVvcgYxozAdx7t4YvPWezDCUTbl4mnafqoaNk9DIrOOtHpTbnaPD9P+hfrqGo4Ea6Nufvq9LXthX4iC5S1/mX/msLMqOAJKEXaBarYx6b0F4bMQsz37hbRgEJU2hJhsxfYhI/tUbOi2pkEa3gI6i01gSEgdVqdJQhbMcNIUCetYPIBgJL09x5LR3cf5o3af2jv6/H5v09dyBrV1QmlFLwZ0ajgStIbxgm1tNOc7iYYZaBF84d6twkLBghVJOHWy5KD3KqPFKgD8Nw3AYDqvzFb5p2xREUVwUnNnmatGyMZNgmsMUBfSxgkiF8d2DgJPfwC5h07AvU28UJbqxGxqXmbks33sNOczIiU3VfvSn0nCMYPpQxcKcjB4oG7cWGb2uk5+tubCKunQgwzDdwla8FEeLIYADDJlc6xIGP0QjAaIMSw5Xynz2l15/Y0S+KHhd3x5ntE6djoD+bPMtnjL0WcUoAq47HwebnbRguKtm0Tcu0DkQ9Buinx2estKDOi/PBwlZnCxJKN5QHXAym2YeIsFYI+jLaVim2Kg5UVsN1sYYzpAAadPHy7uHcELK5GPjTZV64QiJn28LWHgQvoq3wOepg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzkyMXUzK3JFMXl4S290T3g4ekJ2ZkZhTGtDU01jTEh1eVJVMDFDcGs0aERq?=
 =?utf-8?B?UytRbXFSblFuQlNGVGZMTk96YTVJSW11QnZzMkFuR0NoelFzYnBKSjdlTVpy?=
 =?utf-8?B?bkYyWEVhOHNXMzFZTWErQWpTM2FKbFVHQkdSOTU1ODkrVlB5enI2eW9VTjJ5?=
 =?utf-8?B?djRIRHdsU2s5MWZWWktROUJvNEdYQjI2dnpUMGFkRklyenNXWml0TU1JcDdu?=
 =?utf-8?B?NUF2L1h4b3JrL01walN5aDJyd21jSmwyRlFyQ0xJZUtSZFRUcnpaWFJNMnhh?=
 =?utf-8?B?V3oxdnlEY1Qzd1NhTTZ0Rnprc3l1enFtblloSG9RcWZLZWs5QU8yNjR3N2tY?=
 =?utf-8?B?RWdmVHBqOGowZ0hUVmFJZ285aEdFU0xORi9QRHhJWEV2dXVVRGZ1NFBxRHR4?=
 =?utf-8?B?RzZZMmVCdm5ESXVGVU1mdkZ2d3UwdHIrTTVZaTFCWTBqc2VQMDR5SEUwZ1pw?=
 =?utf-8?B?R1FIN3dMT2hWYXNQcDUzTW1zdjRGOHdJL201bXYyMnpkRWtGM0FTSVl3MndY?=
 =?utf-8?B?cUk5YmIxNnY5WUhGWHdsU3l0Rko2Rk9LRExXZTJUU2UwMThWeWYzR3d2ZUpU?=
 =?utf-8?B?Z2NnS2N4ZzJuWXdreTdnOGd0WWpDSHZuTStHWWIvUWF4TTdDb3piM09XNkFS?=
 =?utf-8?B?UlRIKzk1c0FCY1hvMlF3OGdMQk5WWjN3T3hOZzJWMXVOVFhUeE5ETCtoWU9w?=
 =?utf-8?B?aFRlUzlybmdvWi9PdHM2UysrZ1lPbFEzSUIydFROeXd4VkVEQ0xXeHBvaXAz?=
 =?utf-8?B?cHMyZVVhUjlkdU1wOFMrRDZndDFxR09OcVpmOGlXL0psclgvdVhDK29nWS9z?=
 =?utf-8?B?TnY2TnJHaSs0TGdrL3lTSERKTWJlTjlySE5SRjVDeFkxWGpjNUZBS1dqZGpv?=
 =?utf-8?B?UkhmekhsZ2pUaWlpT1RVckNVT1VLL240Q3RhNjNXdXhEaHRtUnNoSDQxbzA2?=
 =?utf-8?B?MXpVaFNid1RDOHBoeFU0c1NnWU9oaU5XWkE5aHpMLzE2TklMbGxkYVBNbmxG?=
 =?utf-8?B?TENZc3BBMThUM2krbkZqZXowTll5TzdDS0J2cXJtVmd0c1c5MysvUWlpbyti?=
 =?utf-8?B?L0dGOXVWQU1MNGdnOVNqS0xwbWd3N3JEano4K24yNm0zckh6em1wY1NWK1Q5?=
 =?utf-8?B?Y04ya084bm9KUTVJaG5aZlpzRkg5U3ovUFUxU0RxUU1YZWlzbVN2UXBSVnJT?=
 =?utf-8?B?MTBmV3NMcS96L1hMSWVZdWg2bzNsY2dXaFVHTnpCaWhUT0dsTkFpazVpK0M5?=
 =?utf-8?B?Z3hWd3hxUUNqWXk0MFR5UHdpWGk4NjY3V2ljV2ZXWTJldGlSdXU4TVF5SCtJ?=
 =?utf-8?B?aVJIZjY1dytzUnlOZE5qNi9BS2R5N2lVT2J3U2pOdmtZdVRucjU5dHl5TGk5?=
 =?utf-8?B?USttM1pzSitEV1Y5WE1LU2ZuTDBBd3hRLzRpR0VvTnhZU2dweW85VXhHZHJX?=
 =?utf-8?B?dUxOUmFMazdjbWNXQ1l1WE9VSVZEWXU4aDlGMlN5bk0xS0s5OWZhNVFVMVZQ?=
 =?utf-8?B?eDd3UlJDanZKRVBWeTNtWCtJWHp0Q25zWlhKVENCVmxiTXJlTW13RTF3TU9w?=
 =?utf-8?B?VGVXanVoS29IZFJuMTlWSTdEZjBTTldrdnFCWGwwN3lTR2xaU0tqNFg4L2Mz?=
 =?utf-8?B?ZGZkSDBOMWJVZVBLd3paSkZJNkxSRzFmYWhQeTc0bEdzT2s0c2RqUGVPeXJm?=
 =?utf-8?B?YjEvdy9kNHpRb0FwWFk1SHRDNUd6YitieGwvWU1ud0wxaEsrREFOTDlKeWRv?=
 =?utf-8?B?N0g2eC9lQXNNU0hXck9jRElOTFpJOC95UGNXM3JzakpLV3RWYWdKRi9LTzEr?=
 =?utf-8?B?S2VrNkhNbHhEZjF2dmswcHZTakNtMjVOY0FlNXNEcG9rRFIvTmRkL1JsWTBX?=
 =?utf-8?B?R2oxNTFZaXJJYy82Tk5vR3BlM2VEVG52cndyZkxiVkl4OVNRdkJKeGFFN3Vi?=
 =?utf-8?B?U3ZsakVnR0h0RTJEYXRGaGQxK3lyYzgrNlFhbmJCSDFQTGlpbE0vMG5neldX?=
 =?utf-8?B?NGZNZ0ZpSUxzOG11blcwSDRoaldjYXlYTUVVU0ROUkRxQytTc2NhbXVCR1JV?=
 =?utf-8?B?djZyTFJ2SGVyU05oNExIZTRta3g2dWxDclFoeVZicVJsTDB4bzVKaFUzdEJR?=
 =?utf-8?B?OHFwbXFGbzhsM2pIcTlBMklPb1JJaHhFOS85NVY2dkRwNjNiUk5id0VlSVIw?=
 =?utf-8?B?VXBNQ040bk03NnduNC9yaVpBQkk3K0V1T1krVWJ3S01rVkhZYklQOWIvN1VF?=
 =?utf-8?B?Zy9RY2JYbHhUaXhFRnhXWDkrWXNRTUM3SlhudzR6cFdnZlRoVk1LUWdBQms1?=
 =?utf-8?B?NWwxWThpVFFlWTdRV0xWOXZ3cWplK3NHc21nRUhKSW82bWRTYTZKUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2437c94c-3f25-43ea-edc2-08df122188e2
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 05:32:15.2907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3i+WVmt+6nY7yUQ9zhcaF5geugByfM4RCRxUHLmNZqF1efW3Cnf3mdfa0knqV76M+ueKMPYMCox/H39vTS+8WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5941



On 9/14/26 01:29, Pierre-Louis Bossart wrote:
> On 9/10/26 21:00, Vijendar Mukunda wrote:
>> + * @ping_slave_stat: cached slave status from the last successful ping response;
> It'd be good to clarify the definition of a 'successful ping response',
> since this concept doesn't exist in the SoundWire spec.
> The only valid combined responses are Command_Aborted or Command_Ignored...
Thanks, that's a good point.
The intent here is not to introduce a new SoundWire protocol concept,
but simply to cache the slave_stat field from the last ping transaction
that completed without a command timeout. The cached value is only used
as a fallback when a later ping transaction times out, to avoid
treating a transient transport timeout as "no peripherals attached".

I'll update the comment to avoid the term "successful ping response"
and instead describe it as the slave_stat value from the last ping
transaction that returned a response.


