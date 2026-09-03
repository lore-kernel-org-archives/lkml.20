Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010027.outbound.protection.outlook.com [52.101.193.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFF34EC653
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 22:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788473726; cv=fail; b=UUnmq2N8uRSUHNQhdRd+CKio/HRk5maoetoRMD7nkNXlv19q3q7j7iA02YC0Fn8UWRK8VbVRFBem1fBfx8JTIMB7SPHF2XGnZmj8DVLtA/GB/ndYWLGpKrKitJ+FKJwn40MQmREdxxhubr0OlIE+UMO+qdRTmveyWOEaHYgoRng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788473726; c=relaxed/simple;
	bh=IQfCYzcyWrY5+PiAy6+/B72hWhWtPAWCUODi+tpk4yM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QarI0fsVPpP/nzfNQfKdwUfvvaUo0wIj8HxjX/vwAJVOpGE5u/rfF1/5gebra7b0trW2Xu6gVGLhFxlCnELqA4Pdakm26g+P+MwuHPpLgly6JqGT25sq8fBvTG8nqXThOBmym8Obpn2ACFapysCtDTcc8xiWZyqyWRVItuEgLYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pQl469DN; arc=fail smtp.client-ip=52.101.193.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pQl469DN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nx+ZKDODJmPHPcAKx/Dtv7Du7ib2Hcu6BP1oDUbW30/IXXwPZRG/LzioEHoXFqeNHv+tJoGVmg47ivf/amjuDmu+8DExBEVe5qEHk5oYrhv3I9AGBprpmCnhgL9KdzEKagE11qL+e4Gmhia9On4yaFlIn7woGLSCeeBKFfqKkRrw/IMVuLjiPFNi6B8tXKIYQWzBJV9+VHhwKjXKp7SUFfCawv/Wx2D3vnjGlOyoR8L1hu2jn1/9Txr9fPyL0qcQNv9oJVobz5knWkiT2LxCQKcrFe2iL2uNJuHV9atIeDjNO43YE50D5WLmeY7YI/pove29UzIgDTMZ89teFT/jWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RAudpi5SRrAAmkKxGGLYMfykKz+A4EGkiRpJC3kzBZM=;
 b=o0JZPK7MRbRsOQ0lp5AzMo5y5VmeOM8EWffZN3grR/Le5v7HszDSFBT/rQ6mADw/rZ/V41ZsKP7ql4Vigv3zji/I8hNqhfbLCUeHC179ZlzHqN62wa1DHZeQNf0EF3Sbs0dTdoc7lBqmoiafFf16DhajFKrZmeL0R4+SaVUefosbhzyOJyKAd7a4C22dkZOrCdenCLcEyC2anOKlFLv/+pccaYW4vsZ2to1p2puuwkGwpxgr8CjxdkKgTSOSAGoWjJ2erez2bQsFXpugj1sYiMEjudPUGfEgRd5THx2Jzpd+IvtNfh8GZRsW4X/62mtltmRMf4R/4q+ZFITCApX7TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RAudpi5SRrAAmkKxGGLYMfykKz+A4EGkiRpJC3kzBZM=;
 b=pQl469DNP8UUXXWkMZ2JE797w+6LQzFaTE64daq8CwqCOZnb1NdkosFCwQ+h9T+HpqW7ZtKcHII0pmIcxMWt0Hfkgksq6SF2WKTcC7oBK/fhjaaufidvgkorJ8FJjg8smk4vtN60qcpjc6gc9Ov/ntYHLjxYo2qnhuMlnN7YcIA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8660.namprd12.prod.outlook.com (2603:10b6:610:177::5)
 by DM4PR12MB8569.namprd12.prod.outlook.com (2603:10b6:8:18a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 22:15:15 +0000
Received: from CH3PR12MB8660.namprd12.prod.outlook.com
 ([fe80::87aa:52e5:4b72:d5f3]) by CH3PR12MB8660.namprd12.prod.outlook.com
 ([fe80::87aa:52e5:4b72:d5f3%5]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 22:15:15 +0000
Message-ID: <4977aa83-ed7d-4947-9577-faab57d4ccc3@amd.com>
Date: Thu, 3 Sep 2026 18:15:12 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] firmware_loader: Fix shutdown ordering and reference
 counting
To: linux-kernel@vger.kernel.org
Cc: Chao Gao <chao.gao@intel.com>, Dan Williams <djbw@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, mcgrof@kernel.org, dakr@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, russ.weight@linux.dev,
 conor@kernel.org
References: <20260331214726.903274-1-dan.j.williams@intel.com>
 <l5c5kckmjkey7yxfmrkahgumrc6pgnz6kunmqxovopifflwimx@65n66fqrxhz7>
 <adW8uyfRnnoA9T14@intel.com> <69d5be99ca69d_46de10093@djbw-dev.notmuch>
Content-Language: en-US
From: "Pratik R. Sampat" <prsampat@amd.com>
In-Reply-To: <69d5be99ca69d_46de10093@djbw-dev.notmuch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0367.namprd03.prod.outlook.com
 (2603:10b6:610:119::24) To CH3PR12MB8660.namprd12.prod.outlook.com
 (2603:10b6:610:177::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8660:EE_|DM4PR12MB8569:EE_
X-MS-Office365-Filtering-Correlation-Id: 35c4e66a-379a-47ac-ab80-08df0a08d439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|11063799006|10067099003|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	7oYjgh28+gTkUoAIj1JnpK/Ne1QBlQRMLIxBs8Z3jScaWD1zGmvF9xQqGDJlPn3Yi+XH4LzmtwLvgPANbUU8NBW0KqLWZAqbRYGafq7jLY7hIwkpXZEdbE+3wp6AmIa+h8A3sFjFqXKn/fD7ahmenInnSEV65G3Spw9nttisopjjGAEjofg/CjdwY13EKCrr92CIzrIUXrNUPIUhSy1CD8R+/x0hDAavaO2d39zvgRqmNBn0BSNKhKzAPZKaH7F+Mvz94l1a6CyGohKUuDXMRcrpaU0kiQgidCl1gAKjb3d42EN9kw1p0VehoJOWGJ5/kc46h/fw8KMZlcofc1qv6Z3gH5p8ErHWE0C5QqkVBtr3RAf3Yr3mujki2o92NtJrkfuHFwIwUqNA8pmKC4FVKp2tRTm5v29SJZGbFKzC3C54VLWo44beQdlHVpH0fE5lWEkr0e7kPcYgAGUkhR/C81PvCegp6OAz070zbZHQMgORBbCh2Ayi8tjd++mkaOHrmKmWnwFvn+BFt2cHZCE6e8GYT5U5myZ4HHC2jsL68/GNUmDuMI0dNSyzxBuEqwYVLBVDAZAOEGbvsuZpnKNQUoQ2E3SFuRZYmLaCr3AOfMk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8660.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a216WldiS1pQc3BUWlI0TytUVzJITEZnZGxJQVdPemlUY29iTHMwS3FsZ2w5?=
 =?utf-8?B?NERwQ0EyRjJqSDJ6WDlJMVU3eDRJT2l1VU0zWVFYb1FzY3M4eVc5OGVGYXJC?=
 =?utf-8?B?NXpxd1BpUi9ibno5Y09DcXVLaEhHODVUZnRhVEpCRHVaR1E3dEZTOVB1QWtj?=
 =?utf-8?B?aGk0RjNrSzhLRERmTzhpMTdwdlo3UkU2UUxTb2RuMWFWSmpNZHgvYy8wdW9p?=
 =?utf-8?B?R2dycC9nVlhLdzNwWGV5STNYaEY0dTdjeDgzeGt3cHdMNmVWell1SkppM01n?=
 =?utf-8?B?RTRKNnByQmlKOWg0cmZtVzJHUUNjU1BsaEUrak5OanlHNkNJK1ovcHRMUmRk?=
 =?utf-8?B?ZnpKM0UvY3FYU2xZMUVvdzJta1hRUjR1OGxXSW5KdUdJL21xWkpVT2ptZ3J1?=
 =?utf-8?B?byt1NGVRQzI5VjBjNXJIMmpPT0RxakhTWHNIdlhrdHBoK2JqRk05R0V5L2Na?=
 =?utf-8?B?dFg2di9jYWlHZWc2SVRoank5TCtSYnNXcXR0UStEVWFqVW5UZ2hRUXVlQnV3?=
 =?utf-8?B?dDhFRG43Vy83dEVTSmIrNnZXYXBickpPUnoxeFBZeTEzYm1rWjc5NXJqN3JB?=
 =?utf-8?B?WDJOeCtxV0NKWGJiV2FMekN1R0d5cnU4dUJvWXB0aE5Nb29CQVowcDY3M0R5?=
 =?utf-8?B?SCs3bzFaR3ZxTFBsQnBDcUJSRDFHVDFIczN1bGYvYTFWYXZCTDAza2toK0NK?=
 =?utf-8?B?dzFmcjcyTm5PdG8wbERhVVRrbHI1MnpUTDIydHBGU2wrdUNwYVpyMkFiWW1q?=
 =?utf-8?B?UVlFZ09DcmlSTG1ydjJ3WkUwU1hxTzZmN1U0cjdqRHhQS29VYzhyVFFzUHpq?=
 =?utf-8?B?VjlVRWRPUWgxVnFqN2N2djgrelVDalV2akk3a3RYZHpsaDZRem1Gdy9uOG1p?=
 =?utf-8?B?eFEvRHNtdjhGRkEwNVBwU1hyNXZYMGwyRFVqZVE5WE1JenNua2YyRWswbDNQ?=
 =?utf-8?B?YThKVzAwZkNIODI0dno2Z29pUjd3c0pKK292TnVIZHREZWtSWHNzTllSbm1s?=
 =?utf-8?B?aEVKRGRMeDZIeDY2dU9oNk5VZ1Z1K1UvZEQ3VW5tQlpmSjUvYjBaN0l4K3Zl?=
 =?utf-8?B?a2hjWjhXU2l4VjVjVkdkM3ZjazVkZ3Z6WVhXY2tZQXFaMDZIM0hrZWF6bFlh?=
 =?utf-8?B?NHc3Y0Q0NVhzejRyNXZPQlNwckRiWm5oZFBuS3drczJ2V1loNTJJOU0wdVhw?=
 =?utf-8?B?ZHpmUTZvRG5OaE9SREpVaUNybDNCZklkMitzRmxtT05CT0tSa0tnM3NsZUpO?=
 =?utf-8?B?blVXZFNWYXZJL0Y0T1FhNjdHWHVCK0ptMU5RL2oxTzFlcGh1eklPejFlbGc3?=
 =?utf-8?B?RGtNdUxwbEhGTjR4YnN4dXVzUjNXNWZjeFRiaE96cCtFdGhlZnRvTWJjZWNB?=
 =?utf-8?B?Tm1xSGpwWFJib2RCbWxsSE11T2hvYkRKNnUvMlVhVEIyN3ozeEdUOENYRzFE?=
 =?utf-8?B?RWFWRE55N1pBVUN3K3R1SGVCYzZ0MndMc0piZGIrUENTZ2FLQnQ4TnNQUlJK?=
 =?utf-8?B?MFhmUXI3VVcyUmJWdEFIeW15cCtCMnBUVnMvS3ZUd0wvVitBTS9Ob0dTYk5l?=
 =?utf-8?B?VnVkOTFUbmR5U243TGs1Yms5ZkZZYlJjZnY0NHFRTXAyTVBqNUVOWTcyd2Zw?=
 =?utf-8?B?aDlaVEtrZFZlUW1LRStNUENpcmpkY2pTejFtWnBQY1pjTGJIdHhtQ1BVNlM2?=
 =?utf-8?B?aWUycnBTMnBqcVFEbXBNSmRtRHBNa1FIdGthNFdOSVlSY2V1OFFSY093dXdn?=
 =?utf-8?B?R3VxeUhPTjF1Y3ZlNEtRMlZ3Z1ZyWUUwNXRKS0tkaERPVWdyM2Q0bS8rZE15?=
 =?utf-8?B?QW5Yc0VqZlBYZVErN2Y0MnpJZmlkbTkrZTJrVXFjVlE1c1RxSjc2T21US2kv?=
 =?utf-8?B?TkE3RVZyYU9wZFZacDNWTlM0T1VaakdQMEZsTWN1SEpFbkV0Ly9zTHpmczFo?=
 =?utf-8?B?L0UzUnU0SjZiQnd5dWRBaFZRMW5CdkRTTy9KdHdHSU1ybXJ0S2VwTDBvOVF1?=
 =?utf-8?B?c0RmNW1TdzZ0a2I5ZERXenlSNkNwSDR6VjQ4Z0YrS1ZJL2FUT1daeUU2N0R0?=
 =?utf-8?B?QWZBclhndk5hbEliWk9qVVAvRnBsMFQrR3U5SjM1NkNkQ3g0K0JYZ1R1QXhY?=
 =?utf-8?B?aWJhYy80RGNTMGI4d3FObGdPcXJlQkN5eFF4QWIxT3ZqRjNacExTUTRWTWxa?=
 =?utf-8?B?WXZxbmFXc3VDZktTWDJqTnVCQnJjRjU0YytyVTB4c3F2T01uaG1wa3Jac2Vs?=
 =?utf-8?B?R2todjVzM3VJR1cvOTV2TlpXT0ExN0JlZmRMNkdrNlRSaGZUdGIzUU1tSG5Q?=
 =?utf-8?Q?9RB4ggmmYk+RHSF9DG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c4e66a-379a-47ac-ab80-08df0a08d439
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8660.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 22:15:14.9709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IsCkuwdeIENBNYcxRYmQE9Slkfcar7Tvgd7LFrlMi1zZtZKyShY5Sr4A64eSOGXTuSrKzmoq1oHTr/T2zQDmCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8569



On 4/7/26 10:34 PM, Dan Williams wrote:
> Chao Gao wrote:
>> On Tue, Apr 07, 2026 at 01:24:03PM -0600, Russ Weight wrote:
>>> On Tue, Mar 31, 2026 at 02:47:23PM -0700, Dan Williams wrote:
>>>> Chao Gao raised a module reference circular dependency report resulting
>>>> from *correct* usage of the firmware_upload_register() API [1]. The
>>>> module reference count is not necessary nor sufficient for protecting
>>>> against racing unregister against in-flight requests. After that is
>>>> fixed, a couple more cleanups fall out.
>>>>
>>>> [1]: https://sashiko.dev/#/patchset/20260326084448.29947-1-chao.gao%40intel.com?patch=10705
>>>>
>>>>
>>>> Dan Williams (3):
>>>>   firmware_loader: Stop pinning modules on registration
>>>>   firmware_loader: Stop pinning parent device per workqueue invocation
>>>>   treewide: firmware_loader: Drop the unused @module argument
>>>>


Hi all,

I am preparing a download_firmware_ex live update series and, since these
patches were close to complete, I would like to introduce them as a
precursor to my patches.

I will rebase and fold in Chao's build fixups from this thread, and
preserve the rest of the attributions.

Please let me know if you'd rather they go in through another tree first
instead of being bundled with the SEV live firmware update patches.

Thanks,
Pratik

>>>>  .../driver-api/firmware/fw_upload.rst         |  2 +-
>>>>  include/linux/firmware.h                      | 15 +++---
>>>>  drivers/base/firmware_loader/sysfs_upload.c   | 48 ++++++++-----------
>>>>  drivers/cxl/core/memdev.c                     |  4 +-
>>>>  drivers/firmware/microchip/mpfs-auto-update.c |  2 +-
>>>>  drivers/fpga/intel-m10-bmc-sec-update.c       |  4 +-
>>>>  drivers/greybus/gb-beagleplay.c               |  2 +-
>>>>  drivers/media/i2c/thp7312.c                   |  2 +-
>>>>  drivers/net/pse-pd/pd692x0.c                  |  4 +-
>>>>  lib/test_firmware.c                           |  3 +-
>>>>  10 files changed, 38 insertions(+), 48 deletions(-)
>>>>
>>>>
>>>> base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
>>>
>>> Hi Dan,
>>>
>>> Thanks for making these changes! Overall, the changes look good to
>>> me. However, when I apply these changes to the specified base-commit
>>> and attempt to build, I'm getting these errors:
>>
>> (+Dan's new email)
> 
> Thanks! I will note that thanks to the korgalore tool I am subscribed to my old
> email, at least if someone also copies a public-inbox list.
> 
>> Yes, I noticed that Sashiko reported them.
> 
> Let's just say last week was "hectic". Sorry the noise.
> 
>>> drivers/base/firmware_loader/sysfs_upload.c:229:24: warning: unused variable ‘fw_dev’ [-Wunused-variable]
>>>  229 |         struct device *fw_dev = &fw_sysfs->dev;
>>>      |                        ^~~~~~
>>
>> This can be fixed by applying the following diff to patch 2:
> [..]
>> the @module field should be removed in patch 3:
> 
> Fixups look good.

