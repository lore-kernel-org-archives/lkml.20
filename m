Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012041.outbound.protection.outlook.com [52.101.43.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A58B4E0B7C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776042; cv=fail; b=WIJjPSZWgUYpNlgKfIlii1OMxNXtY3Az4Je5AIaxWsQwLSr8AWbcMNgSZkp6QVhSZEVqOjxgbwrWqX0ZkC3e2OBIkt5cev3Ip8XH2E0jqqvw02E8sJPojCr/kxajYOGg+LffaSMGypC4FiXGsIJChLnjnq/+yzzIcT6vSXuFCxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776042; c=relaxed/simple;
	bh=LeDzD5GWjLubgYBUuO7Xx3/jGXPS6TIZMGcKP6QQqnw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uLIenTjFLS4Avk/BIrFjEo/ObAljnrXWkQw2u3Q3SZpVa3UiFffEfK2zaazC4HDeTsSqQKZyV64RyZpcif0Fc+ZFfBuCSx3xISAkzoNBScet/35Rwmi95bDN0rrjvG80hNZ0LBezZj0BDY2Ua1XJ39Gi9TEMxRHcjrnJhcmba+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=02DXp315; arc=fail smtp.client-ip=52.101.43.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="02DXp315"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tAhDJBwWDb+2oxfOdbUYZBRtcSe5GVke8TTCHR/KgAbqn+laoKyDvg6292Brf7fmzkzoBIwyRIRN5+KPvigchsa/ITDEDwfWOSDh1WHXnLhLRVxq/mgzeF3ofYINjA6D3KK+0CArbuAju+C/wdBDecgjWddFGY/OlfWtiAd2d7hJJ7u7Y2rq6cMmztA/x8VSnXDTnWy/3nwwPQIurOQ6w9WaKdXchzvyVU7tgeLWkFITZ2kNWxmmIzv+mx4aTGgcfFbddmC05hZ0bZwBwjWLQR5Y7effFu+yoookBVh9dxpDQJ9pfUkmosIVYx5zXjd8T4doYUw5JAb/VuSQWQ5oGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gU+t19jep+hxZBzPBYPY2KGF6Jl8b6iXq9PlvVTV2ws=;
 b=e094HX+UATtcvzuWRS+prBh9C8xIPf82gOI2jbf3W650VjIRA8GE3HiC3U6nKYfZhDe5MZUYPOFyNObEUAUh9wYt9Qx8rj1tE5+6094My7zj2TdPCiggU5y+FBywbcvkn4NTPQvZsOCLHPYQprmPqrPIZk1SLDRKjPwettQUuS6FBUXWDsfoh5b5/S/+OKZuXuLdO4jfyfvAYxIKLFu0eUfBQIRjvg5NJpWl9+qyoufkCBz/0+FciSrhyK+CeZ1EUywnh/B8g3V4ynvpcQ29gcyWVI/q9OP0hdrrM2mWLf5e9eVZHfDheCgGSeUCfVFq07LXiFS9B23usJbbYBLpBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gU+t19jep+hxZBzPBYPY2KGF6Jl8b6iXq9PlvVTV2ws=;
 b=02DXp315OIOxamCTRePRVilWQQcHKWhMJbz168UkTDq5ruzxeZMvkL2JPYUHWZcXz4m2FlotYecxdvhOpZmR0zWm/oOs/91nYeYEAq4jtP/JfQVZh9f4xQ3I9OOHqxW3b+ORGWFHgyKT5AXEA5/hnyRMVuOlBftbw5C/b2vtqRc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5326.namprd12.prod.outlook.com (2603:10b6:5:39a::16)
 by DS0PR12MB6655.namprd12.prod.outlook.com (2603:10b6:8:d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 13:47:05 +0000
Received: from DM4PR12MB5326.namprd12.prod.outlook.com
 ([fe80::cb64:d14d:7f37:b883]) by DM4PR12MB5326.namprd12.prod.outlook.com
 ([fe80::cb64:d14d:7f37:b883%6]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 13:47:05 +0000
Message-ID: <ace14b89-8d0c-4989-a2af-4844dc162a5f@amd.com>
Date: Wed, 30 Sep 2026 08:47:03 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86,fs/resctrl: Use a consistent log prefix
To: "Luck, Tony" <tony.luck@intel.com>
Cc: bp@alien8.de, reinette.chatre@intel.com, tglx@kernel.org,
 mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, Dave.Martin@arm.com, james.morse@arm.com,
 dapeng1.mi@linux.intel.com, peterz@infradead.org, thomas.lendacky@amd.com,
 chang.seok.bae@intel.com, jmattson@google.com, kim.phillips@amd.com,
 prathyushi.nangia@amd.com, acme@redhat.com, nik.borisov@suse.com,
 namhyung@kernel.org, linux-kernel@vger.kernel.org
References: <9ef5ec08d79c9c84f36b11251bd3189af1a38d52.1790721445.git.babu.moger@amd.com>
 <bc637e9a1f0c4624a01b8208f0e53582cbf21886.1790721445.git.babu.moger@amd.com>
 <arxEB24S2bO1ALm2@agluck-desk3>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <arxEB24S2bO1ALm2@agluck-desk3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5PR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:610:1ed::29) To DM4PR12MB5326.namprd12.prod.outlook.com
 (2603:10b6:5:39a::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5326:EE_|DS0PR12MB6655:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bef9100-362f-45df-0095-08df1ef9503c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|7416014|366016|10067099003|260925021311599003|56012099006|260925021911599003|260925022911599003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qRUNIDrQUeI7s+3yxgczBzMoNFrbEuL1LylvP6DBKQWTLdY5fh+t1fRGOE0DNf02bScr/X7IL4veCTguOS5YF0Q7AWI0zcCM/HZ+mpGfxxzQ07PVVosY5ePl/EWfngiGYfEWpkigi2Jlp1BuNFFrcudZBJKff5Wf8o9RnwxFn0yZJDpesyuaiNqkXTZpVUH94jVvIu7xMBPGATCWlSp4SUEOVpKMWn2IZ17hlmFBNzcujFurzPFEp7ftexFcoChfQ6KPvVya9YRkbUXS0TFb49mWzCcv4mLk8kBHtSFFn5QAwh38Qi+dIvtg8cgWK5p1X3y9/PsHO91Hz5TTw2NUaVxlhilHsvVh9Fmx3bFlKCQJt9U62sI4X9wp09XOhoqcC/oa9RmnQB62+EwiRD48aBvAutNNGzG7RGbX732oQjlCUKUbWOxgWdQzEK2bKnbUT11+mQvls3cT/DVcUXDMjboD7sovoslgKF+guX2+lw2SQm9A3sE+ajH3L7UG5rglx8GKepLr+0LEu4Ifn4eh2T0gUkX/LIY8SXEEd05aJTDLk3p62vLNTacQrmAE2g7ahEdl0AGoeJ95/s5QRfm5GvqHugWmjlFwM+l/OMGxrcyD7Dah7nrVs17h0/e3WhgG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(7416014)(366016)(10067099003)(260925021311599003)(56012099006)(260925021911599003)(260925022911599003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TG1lMW5oZzltSXJOSEZqZEhXZHpCZmhwQlAvVFEyOHE2WStBSyt4UEJhWDQr?=
 =?utf-8?B?aFlSRFFVWEowMTgramlXOWw1K0RNQVBjZVA0ekVkWmJpUzQvUmVaR3JwQmVp?=
 =?utf-8?B?NjAzbE9VK0dCL3RQOUh4dmhMQ2pSVmdNOWZ5cEZsYnhCYVNGZkhJRmEvZjVV?=
 =?utf-8?B?UTRMZk15UkZCQXJ2d1ptanVSeW41aFpkY1NrWmJ2T3lhKzR2SjF5dllmYU90?=
 =?utf-8?B?L2ZuMWozZTNDbEs5RTdVUXIwdFNlK1RGa2MyVEVOOWg3Q2c3eFZWMjNjNExa?=
 =?utf-8?B?WG1KYm9namVsTmYzc256dFBvYlZQRGtUb2NvTXpPRDQ4SUYvYk5yaW13c0hB?=
 =?utf-8?B?Ujd4QjlEWUtTc2RmV0ZRV09RZXZZNk9LYXM3YTlYY2orQUdRVEJOVVpFUGxn?=
 =?utf-8?B?RUx0U3ZVOG9DQldwcGZpVUNGTmhVMlNnckljcldPdWhqcUt6alBVb0d4ZXhr?=
 =?utf-8?B?bEI2TFU0bGZnUTc5azhnRFhKVXg3dEROSFMxeUdMdDlzZEZESFo0YVdEWll4?=
 =?utf-8?B?N2pKUnpPcnlXblBQdzhQVUpBRHlMV2pTRE51QjQwTWtoZUs0RGt3dDBLRnRK?=
 =?utf-8?B?MEpDMURNbVJHMUFiTG9zdFpZMGZMQ0ZmVFJ0bS9Zc01KY0ttcVk3VEVKdlpl?=
 =?utf-8?B?bUxkYmp4UUhKQUk0eFdUdTVtT1RvYnBKUE5pVU9nbklGYlhoeTRMcDdQS3Iv?=
 =?utf-8?B?MktHS0xBQjJUcEdDWlg2bEJPZ3dtcXk3VWkxNHBYaVNJMi94Z29LUnh0Rjdi?=
 =?utf-8?B?UHk5VSt6YjNvMlc0cTh2WXFlRnVNb2c4cUlncmM4djJ6NUM5Z2NDZXFoRXND?=
 =?utf-8?B?THl4aXlvdURLUmVzVXNxQjFvb1ZrVHI1YnVuRXZYYmQ0dEQyUUpaaU1yTEhj?=
 =?utf-8?B?OUVNUTBhQTlQaGp6SUo2MzAzSXNZYVczcWtGdy9kUnFmVGlqU281UlZPcFlY?=
 =?utf-8?B?TXpMalhibGhRc1NDMG5NMzZIbFVodW1mb1MwSDh4NU1sTkY0ZU15cENQaGgz?=
 =?utf-8?B?djc2aW44aFZtMGtpZzlUNHdwQmF4MmRJS0ZGVEtpMlZrbzNkcCtvaHBTMWZ1?=
 =?utf-8?B?TW9PYVk0VllPUHpkV2ZReUNFNjNkYlNyeE1TYjB2bWJzUUVWWnhkRys2MHVq?=
 =?utf-8?B?MXhva0NjRGdkSXlFanduMW5QSitnTytPZVNLZG9CZXFZcFpJV3NUWnl5U0sr?=
 =?utf-8?B?dHNLZkVTVjJSMWlxRzM5T2hGNjdaWDMvaGhHalFpNnN1MzdhQTA4T2dzcUx5?=
 =?utf-8?B?Nkc5MHpLbE5tSlBhODN1akhzVXJncUNTRFkrSWpsYXRpNzVBVFpyV3I3WVhp?=
 =?utf-8?B?UzR6aW5oVFEzd3VObllTOW8rSkVlVEZQdUJrMTJsRDJYTmp3Mlo1aitXcE9V?=
 =?utf-8?B?cVdPTlROdldBeFJwaDBYM20rcVh6Z1gxYW5DWkYreGZlY1ZUNWZnbWV1MXBz?=
 =?utf-8?B?S3JVRXNzaWdJWEFCVCtNN1Q1VjV5dnNhYThPVGoreXZteGh2WnVlSHU4V3Nr?=
 =?utf-8?B?WEE5S0VJUHRSQWhKYlQ2TUVFQ2tqSk0vMDdIZkl6cW1Bd2k3aUNERHlFSHR2?=
 =?utf-8?B?Rll3RGRrdTRqZ3VEUGpYUFUxbTB6VFdSb2RDVi9mUW4wb3I1VHNvVHdlN3g3?=
 =?utf-8?B?ZjVUWlBaaGlPb2xIeFF1UVViWmIwSkI3UUV4U0d2RlJpMTREYndtbmFvd2JU?=
 =?utf-8?B?a1cxOUdhdXU3UTIzbVpKYW5IK1ZrMEhqRmVrOWFmbU1VSGprYUlSLzhyeUZW?=
 =?utf-8?B?S3ZRK0dQbkRMK2dvbnU2TVB2N0pBemNLNmNkTmVZRnl1MVNzTk9CS09JdWlz?=
 =?utf-8?B?M2tweXhla0RETjBSY0tRVU8wSEtrb3VTSmJ1REh5aGxQa3NBaCsySmNlWFh2?=
 =?utf-8?B?V3VKR2hCajRPd09HVDRwa2hwL0NsWUtjN1dBY2dmbndVaUpmZ2kzaWdST0Zw?=
 =?utf-8?B?S0dlc1lla0lXcVg1c1QzZ25PcTd5RU1lakQ4MEdjakRjY1JGb2FkYUdEaVUz?=
 =?utf-8?B?UVdIYzR0Y2UxR2xyUXBxNDlxeDhxS0VYNXBFL0lJN3krSGliMXBQY29jc0NN?=
 =?utf-8?B?WThzbk5UelN3SjRkdnZqWjBIdHhmNlkzZmIwVUZJTGlnWUs5TG1JUXJGZkZK?=
 =?utf-8?B?Y09vdTRKbHAwbWtiZTE3d2VmTCt1Wm9wNGh1NWw5bzBoM3NxSzZUTTdYRDdn?=
 =?utf-8?B?WDNwZkI5dDNnMmNjR3lFeTdya3g1bHByNGdkM1o4VWQ3ME1vdmZTVVM5enJE?=
 =?utf-8?B?YUVyN2FOQm1xSm1PSFF4SGpGN2xQeTdLMnZMVWJhMmhnODkyRElKUzF6bjMv?=
 =?utf-8?Q?VHM/kb9pzAmUEuG1Y/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bef9100-362f-45df-0095-08df1ef9503c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 13:47:05.3567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XWZSzA6p5YQoWSW09UR6lLOjPLpV1vMVoEpqBLOb7gaeTuzIPnghY0iiGZ4OJ4xl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6655

Hi Tony,

On 9/29/26 18:04, Luck, Tony wrote:
> On Tue, Sep 29, 2026 at 05:39:04PM -0500, Babu Moger wrote:
>> resctrl code is split between arch and fs/resctrl/. Some files derive the
>> printk prefix from KBUILD_MODNAME, while others use "resctrl: ". Since
>> KBUILD_MODNAME follows the object name, messages use different prefixes
>> such as "rdtgroup:", "ctrlmondata:", and "pseudo_lock:".
>>
>> Use "resctrl: " throughout both directories so all resctrl messages have
>> the same subsystem prefix.
>>
>> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v2: New patch. The issue came up during the discussion of PLZA series.
>>      https://lore.kernel.org/lkml/432f0cbfb811aee3c8c51bbc42faf66174375d8b.1787772750.git.babu.moger@amd.com/
>> ---
>>   arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 2 +-
>>   arch/x86/kernel/cpu/resctrl/intel_aet.c   | 2 +-
>>   arch/x86/kernel/cpu/resctrl/pseudo_lock.c | 2 +-
>>   arch/x86/kernel/cpu/resctrl/rdtgroup.c    | 2 +-
>>   fs/resctrl/ctrlmondata.c                  | 2 +-
>>   fs/resctrl/pseudo_lock.c                  | 2 +-
>>   fs/resctrl/rdtgroup.c                     | 2 +-
>>   7 files changed, 7 insertions(+), 7 deletions(-)
> 
> These are all good.
> 
> Reviewed-by: Tony Luck <tony.luck@intel.com>

Thank you.

> 
> Note that ARM have done something different:

Yes. I noticed that. I wasn't sure about changing it. let's hear 
everyone's thoughts.

> 
> $ git grep 'define pr_fmt' -- drivers/resctrl
> drivers/resctrl/mpam_devices.c:#define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
> drivers/resctrl/mpam_resctrl.c:#define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
> 
> Perhaps up to James & co. whether they want to jump on this alignment or
> keep their more specific messages identifying file and function name.
> 
> -Tony

Thanks
Babu
