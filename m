Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012068.outbound.protection.outlook.com [52.101.53.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1B5415F08
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790587960; cv=fail; b=dbH1DkOX1nZHMgnG6ZBuo6q/swyQCbQo//vpp+Aa9qgQ6y9HTdP7LObwFHm/jiJ7r8P3CvXJSVRSOq14jEnhvzmiC8vHsML4ckTgGN1LHJsgO/6WNHFWtbwP9HNcWV4H060lgJzb0pvl9ILdY/hRD6lo1sDXyw2AQp0EsHXn4cM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790587960; c=relaxed/simple;
	bh=wW5AUTyqBCRaqdhM1XpX4vUTUHuGgP1YKvypBiY6MMA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QLRmErVxhbYweNcD5Xj8ugT/3oW1IaaOAEwsMBXZiEcurGukR8jJ0nsOYd5BL/0P5oV5jzPSNoQREF60hFrh6egOsi3CSxbiyhdd+D5eil0x6/9dpfF6Jn2dOuMse2sFrJwBJuZG7qfKB1Mm2t807iTc+Ub2xNrM9hDqAhAOWeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HZHr6NPP; arc=fail smtp.client-ip=52.101.53.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HZHr6NPP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X5VMAGbZiqsBxuA3QhPHFBwwi2va0ueskyi8MgdrVdEw7Zf1er2Il0k+4j1+O/gRP22BJPlbdsQFxzYinxNvP6JYY1lbgiiS9t1DE3wN7MRk0adSRR0aJ6bWRabvVFusADyN92pWxhsrYcxjhr8bwhHOh9LPBh4Z8a9DCpXbJViH8z/fyB0JJ6a5N1PCOtLaQWsWyIlbmfo3CxUzJdNdDzL1K0AhU4Y3Th0uNAmr8pGNnJGuOeXX/EEyqxOXpK0+U9MbU4/gBfTQy7ZUVdpTQwFO/KbrVDEic960W88XcV+01DovkyIh4kC7nQnv1RO+5IbGMG1GK81HY/EkSR/d1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFyLXANVporUQbHP9N5YEHVQ2opc91zMc6B7rfOzPGk=;
 b=oZnT5BtPl5ej9DxtNdgqj/PjGPKxoi+rZCD4vlwKCq7VNDyZ7UaNfjx4sljota1lQSoBX3p2A2kjQk6vC2QFeyIIxA6MvS2lK+iXeja1LNs1urCNI1hLxA+1DEb9Rkw6WIHHgFVQR4uP8jBky5rydCYjzTi1CjAhtfbcvRMrYViPRS4Sc/18V/0fmp0z89KtG2q05ziIFCJ8DKMksYwXZiptp4WuzjROxNs/1rBfycdVqsh/piTkjJVqvks/WTxY20CIYgT8v5i7AQncEn84Zrx8Rn8gzY3Ea11bD2BjITvGj1Oos2Ve2ayyxW9OWPRoMULnMD/9HomT2aKiA/O9wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFyLXANVporUQbHP9N5YEHVQ2opc91zMc6B7rfOzPGk=;
 b=HZHr6NPP8H7T9SkmcQrnjMDtleNl9daJ8Yf388qvv5AIk+9+am5VpXSxb0+TnrCGN0ohJgcaC1AgCG61gVBdfy6AcNphwxU0oH8szRMi96nxjBeToE/GJvha1uHUP4+UBQrPyZPCaoKrjsrQ8giLDteMlpkJSUIfx3/Rtop2x98=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DSVPR12MB999171.namprd12.prod.outlook.com (2603:10b6:8:388::22)
 by LV3PR12MB9094.namprd12.prod.outlook.com (2603:10b6:408:19e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 09:32:35 +0000
Received: from DSVPR12MB999171.namprd12.prod.outlook.com
 ([fe80::b7ec:f444:4560:9f19]) by DSVPR12MB999171.namprd12.prod.outlook.com
 ([fe80::b7ec:f444:4560:9f19%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 09:32:35 +0000
Message-ID: <02b97e0f-c3b7-4706-9d56-cd186da7100a@amd.com>
Date: Mon, 28 Sep 2026 16:32:26 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/24] iommu/amd: Add per-segment translate device ID
 pool
To: fuwenxin <fuwenxin@linux.alibaba.com>, linux-iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, joro@8bytes.org, jgg@nvidia.com
Cc: vasant.hegde@amd.com, jon.grimm@amd.com, yi.l.liu@intel.com,
 kevin.tian@intel.com, nicolinc@nvidia.com, wnliu@google.com,
 Guanghui Feng <guanghuifeng@linux.alibaba.com>,
 Guixin Liu <kanie@linux.alibaba.com>
References: <20260914184750.222939-1-suravee.suthikulpanit@amd.com>
 <20260914184750.222939-20-suravee.suthikulpanit@amd.com>
 <20260924124403.3858095-1-fuwenxin@linux.alibaba.com>
Content-Language: en-US
From: "Suthikulpanit, Suravee" <suravee.suthikulpanit@amd.com>
In-Reply-To: <20260924124403.3858095-1-fuwenxin@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KU3P306CA0015.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:15::11) To DSVPR12MB999171.namprd12.prod.outlook.com
 (2603:10b6:8:388::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSVPR12MB999171:EE_|LV3PR12MB9094:EE_
X-MS-Office365-Filtering-Correlation-Id: 66af5808-ab8c-4d14-4ebc-08df1d436d96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|23010399003|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Zm5ZFv7YL5ZAs029gSGs4Sc8gxGJxp5M6FIvYwBSPP3Ihcb28o1zQcy7ZPsK2yu+oGemzJWLzkKd/ckF+4bIFaS9SMMIE3lRn+j+fQ9hTmLx065PWhs+gSEtT/VCD8U5ykJmF/V8kcOCGwu7Bt5isrrSAuuWcWRngirg8s9PnjKgXbw0lskF6gaoAU/ZUEFu8rEk61kswJWyWVCEB43Fv0Q9Ez5PKzoauSkmWNpY3VQAhxSLifaPgBFnLNBRGmg3C/lt/R6ktZHslHxmCoEgsYd6sjvuOyIrCLfAjJYz1/xAojOYVf4UNqoxBO1hC6bLpw6VJxit0Zv/TzErsFY12g+3vUHqIuVSgcvOMBR1Ke4yFoPOs8ZsuwYLk51HCi1c+E4V+H7gWQ/gakD+xxAjFqC0S5cLEprPyNFXm77UfcjA9muq/hgXhRzobau0nVqLfGipWrYnhtJDxgaBLilK1rA5jK8ay02q2bDbWEc3cK1wtCHmm67LYlpLJ9zZEBuGJzhchfHv1Xkno48zGxnBdn93uWL5XUv9Bi5o89C8sDOd9jJgIKVFED+QLY9O7WeV3tcyy/3qP2NjPS8p/W6CDz7Ja6kERD3Si5Lz6KRViSmMMEhOLiTKzCEdOMSixZkQ+sIQuIp9pQ94tldHuRKzsQiaa2xQeLaidMVTrMqa+Gg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSVPR12MB999171.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXNEVVM3bmtKS0lNMkNhd1k5SFBrUFl3djVhbDhxQnVhc0xuTURQVWR1b1hV?=
 =?utf-8?B?UFllaS9FWk1PdjFqcUJ2UEQ4b2YybGpvSlpEbHpVQzY5ZjVCR2J2b3RGMjg0?=
 =?utf-8?B?ZVZoOGZxWHdCend2MEJyeEdXUy93L0ZaRitHU0FKY0hmSGdXK2FOZUxKQ1NO?=
 =?utf-8?B?b1BsRHh0bzFTUGVNT20vbmp0NUV0YTg1VWRaQmVDUDdNK3hsT0Q4SHN5dVNB?=
 =?utf-8?B?L2lwSDFKZ0V3TVRmSWYzbFFUR2phMVJPaEl1OGFnVENtWHNBbGxtQUNnZlRa?=
 =?utf-8?B?Zk8yN1hzZXJWaDYrZXAxUU9neFYyMDYvMVR1ajBvNlJsNW5MQWNCS0oxMXJS?=
 =?utf-8?B?WC9RdGVjb3J4MnBub0dZQjlDZXBTZDVSMWU0bHpWWTVLLy9majFMejg4b01T?=
 =?utf-8?B?OXdPYmVvMEFMR0x3VjhrWjRScVkrYW5oT25xYmJuVFV0OHNSdUx2V21zTXk3?=
 =?utf-8?B?OGhzQkFXblp0dzZsWTFVMDZTQmw5dmFiQ2hXVk9TNXluSm01MWJKbFM5NEcy?=
 =?utf-8?B?aXU2Vzkvdk55Z3hVWUxSQWhHM1pjVStMYmR3YnpKVVlWcXlPdTRTUUoxZEw4?=
 =?utf-8?B?NSsrRFVMTGFDMnZyaDlsNDJGOUZxaHJFMTdRdFlXNXltUWN5NktFRlZmR0c2?=
 =?utf-8?B?U1RHZkdWbTNXaThHSWlVNmtWOGhTTnRXbUpqMFo4Ylp4dWdOVTBXWC9icmEx?=
 =?utf-8?B?L1ZSU3dpWWpBU0k3L1grdDNrSlNOYWMyNzg2VVUvNSt5SG8rNTYzWTdhS3lt?=
 =?utf-8?B?dHFYenl2VmpXUDY3UFNWTExJQnhPSWF2TmxtN0wvUzJYQnU2VCt2OUNYbG1H?=
 =?utf-8?B?eFZhZGRLVnJjSGp6aEw0UXdLYTdQSGsxU3RSR0pSK2xDejF2UUhIaGUvT1pq?=
 =?utf-8?B?TWYrcWk5MUJlZ25uOW5teDkyWkw0S3BNSXlXeFVvSDlBWlhZanBaci8xMWdD?=
 =?utf-8?B?bmp2Q0JlOWdsczlQbWxxSEZRMFhtYkxYQXR4by8vWWE0blVGc3hUNHNVb2pI?=
 =?utf-8?B?U1NHU1AyZS8xWmFyZE9SSXpEQUlTSWN1T2tUTCtYWXVPNkRNU0pDQmVNQ0dI?=
 =?utf-8?B?MkFXY0hWcWhwVVRVRkljMG4wUVhrSWljZ1hzYUR0OFhpNjVPb1N0dk5BeGhv?=
 =?utf-8?B?VXFBWTVlTE9xMXUxVllPNndPckFaNmV2bTJSQkgwMlZ2eW5Ib3RZdTJ6V01j?=
 =?utf-8?B?b2VRMHJwNmxYR3JUVnRzWE1BOFFGNXhmWkhQSS9FeWZRd1FuSGd2a3MzT0NP?=
 =?utf-8?B?aTJCQzdJTFZpd0djWTVLYUFKRTdoWi9WSW5wank5K3VJdFRsWjZXVzBDTnoy?=
 =?utf-8?B?dWliZWIyblNmWHJmT1lqaDNYS0U5WVIrbVdVTnB3b3hmbWg2ZS9rNFdJVW1r?=
 =?utf-8?B?enEyeGRyMWwxVDBrdU1Vd0U2M0N3ZFF4SlI2QWVxUlBxd1NYbmt6NmJEVkVV?=
 =?utf-8?B?cEIxQWhNYk1hcmxrYWN0cWJCaHNqYm5td1ZPaGtnb3dYcG9Fc1RvRCs2Tk16?=
 =?utf-8?B?NXJvRUlEQUFoU25QT2hPOTVGZHVmczljUmV3cTV5MmtrazdVQXpxUW81clQ2?=
 =?utf-8?B?dGxSM2ViZTdnNHMydm43aWFhUHluVnNPYXBMUWtFOHFzQnp6SzZYWVJrN1d1?=
 =?utf-8?B?RlhKRHQ1WjNJd1RSTXFzL3pNQzc5L0dTczhUekJuSWRvd2FJWTI5QjFFbDZR?=
 =?utf-8?B?R0ZpYlJQdmZEQjM2ZUhuRDVhREQyZ0xJMWFETjhVZFV2RFV5K3FQUzNOcVNX?=
 =?utf-8?B?SnJlV29mZlF3MHB1cUl0bDVKWWUvNDRqVnlXUXVxSDU5UmhPRGUyeENjSVRp?=
 =?utf-8?B?RTBXeW5DeTYxenlWZjBBeFUwYXdxZGNMSlUvUmJ4RDFlNnhtdSt0N3gzeldw?=
 =?utf-8?B?dGhXdmg5NXBtWjlRRzFxbTFUQXB2WnJFSEtRRlc3YVN3cUd1aWY1R2NkQ1NS?=
 =?utf-8?B?bGJjM3pkQklhUkl2SHRwc0JhTkJLQ2svL1VtOWVKbzY0RGIvclkrRm1GelRj?=
 =?utf-8?B?QXFlUEhhUjZyYi81aFBPaVdLYkVSZDFBWEFJZkEzNXhpWFRiWjl6YWJQZ1VR?=
 =?utf-8?B?ckhOZmNzR1htcHBsczVHZk9sOFFyV3RGYzZNazBCYVdCNDM0WXZiWW5iZUNV?=
 =?utf-8?B?ZUYrczE2NzFpNEpvQnpGYUZuZ1dJUm9vbVhUT1VTdFJPRlo0SnBWN1c0Kzla?=
 =?utf-8?B?aXFjYWhoRjF4V3Z2OTVoSUNTZUl1ZDA5VUhSZ0p4MERId0llbEdvc24vZnd3?=
 =?utf-8?B?ZG83RzQxQ09XZ204MUh6aEYrM0ZGUnFobVZlWFovNXRNQWJTQVJhTS9EYUNv?=
 =?utf-8?B?TCtKRWVqcUJ4TFRUbFFHUmY1QXYxWkJUMXU4bVV1NVRTSXNlQmY4Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66af5808-ab8c-4d14-4ebc-08df1d436d96
X-MS-Exchange-CrossTenant-AuthSource: DSVPR12MB999171.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 09:32:34.9548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ze7SIjYwb+fZEXAVgjKArWTiJfbn+y9oc0r4z5lmtC5IFx1pvGKKqI1nYwbQcft5X3z5IJuqmfELaRq1v9jfsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9094



On 9/24/2026 7:44 PM, fuwenxin wrote:
> [Some people who received this message don't often get email from fuwenxin@linux.alibaba.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hi Suravee,
> 
>> A translate device ID (TransDevID) is a host device-table index used
>> by hardware vIOMMU. VFCTRL guest-misc names the slot; that DTE holds
>> the nest-parent v1 table for GPA->SPA walks of guest IOMMU traffic.
> 
>> Reserve PCI requestor IDs in a per-segment pool so they are not
>> used as vIOMMU translation DTEs. The device table is per-segment,
>> so the pool is too.
>>
>> Add trans_devid.c with pci_seg init/fini and
>> amd_iommu_trans_devid_reserve() from probe_device(). Keep
>> reservations for the pci_seg lifetime, including after
>> amd_iommu_release_device().
> 
> Reservation only happens on the probe path, but some DTE-slot holders
> never probe, so their devids stay unreserved while
> trans_devid_find_free_locked() [patch 22] treats any xa_load()==NULL
> slot as free.
> 
> One such holder is the IOMMU's own function: init.c deliberately does
> rlookup_table[iommu->devid] = NULL , so it never reaches probe_device()
>   -- yet patch 13 programs the self DTE at exactly iommu->devid.
> 
> Thanks,
> fuwenxin

Good catch. I'll update v6 to also reserve PCI BDF of the IOMMUs (i.e. 
iommu->devid)

Thanks,
Suravee

