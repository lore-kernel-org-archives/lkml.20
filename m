Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011022.outbound.protection.outlook.com [40.107.208.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F13F412276
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789144031; cv=fail; b=Iis+Sv3z6ZBIQmTL4bJlGZJePZrqfb2yUiApkT2I/SUkhPhKcSZf4tNNkLXilPQAJ4PEIEPOp+1O7WzAz5OMYw/zaqUmRZFDtyA9YS92SF054Ic+Y89DsJBZaBG65bL2iW1wlht0qyNErZI35FvtE7mFRYxmMnNzkZRATmMSzIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789144031; c=relaxed/simple;
	bh=vl1qkTftgQnovO/Cc7flcEYCzl19Y74CO+3ksGwmXoo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uOjnl4E4TidtVYgj459O2AXbfHhv/7OU/TAObiiEQLjJJootHOrFQ+bDhABqt0RI8UDKojVayvC+crI0JnT9ZeMj1Q4j7O9tzRDwP8F/0n7bMBs4Z72JtJ9NPYIIDcxvsSgzirZ4aTehCTIlLmh0KRRGaUPOlO2D/wnXPJ2ctNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NLZajTTv; arc=fail smtp.client-ip=40.107.208.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NLZajTTv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S8a1PKUJUNsU9xLKx5lPw1+1NKAqvVV/JaPsdcbD7xeJ78EkCSvgIXGntktjDk/IS0Z1+V7wLApxI0xyIT2Z+RmS4226hK7MNuk6jwRgJWrEhOHCxptFYo/4cxE6wo4wg3GJ5vv91Z7uzqf1PEd50xoG2VKMQr3Mc1A4qdiw4JtDdKrQD5rEGYgpaoXSlBFmbuK45c6B9JdsVoqXS1VMx8XeaO0uRZPbnMl6020r3stefCA7g80e2VTSfb1DLcAOejteFdShIAzfSkwGjZ3PMJSnayHg458YfhBRK1Wn9UQMDY/7YWKhtnz6Fismff1lmze9a5Lm62BMvrPCfLX4nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNd/B7zTZBvdJs+0O8APrVlMt8YYLSfZqLRl+WFjThI=;
 b=uAXF8uxAHzb2sLDzhhT8HJ+tUqDrfELTZ7srX1GxUtXF+U8KhCBneO3L6vw0j+riWHZaJvYCq8Dfkflnis/wtJrUSZ4FGInxu90s6XKHGBZTdh872MXsCVxo7pZktg3E5j1cLppPjbda2/8dpmorLLATE3sGQ754e27mewtS/ibQeTAOziCL3peiwqtyQ11QBpxAiCO4zDabv9F+ouGdyWSIcX7z/j1pJcHZaVv8oOY09Cn03rwVtuQzOuGcejVRDwt7rr/ARfwKvaaLOMZfCmx9Fo9Kd+wPSVfojW/Z5TwCIhHzrHS2cPxoEXoqYCxY4UW+AZbfafgoNy+CNiLPow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNd/B7zTZBvdJs+0O8APrVlMt8YYLSfZqLRl+WFjThI=;
 b=NLZajTTvXisPM/Ffzs9YHRUkEatlvF0CG8tK2HIGSWcO0rt4+jKTx613y3GHJt1me+NHIFBfXjWCI7/8msfjzT0t+8dMIybXNNghDhgfzWOVVGv/GMifSit0jCwrJgROE2SAWOvZD4N5MbgAUuj6AyXhTMJpY0GxMDg0Z+bMdz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB8648.namprd12.prod.outlook.com (2603:10b6:208:486::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 16:27:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%3]) with mapi id 15.21.0406.005; Fri, 11 Sep 2026
 16:27:07 +0000
Message-ID: <53a024f3-5e2e-4cb0-9fce-0d0ae6584e6c@amd.com>
Date: Fri, 11 Sep 2026 18:26:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/dma-buf/st-dma-fence-chain.c:207 test_find_seqno() warn:
 passing freed memory 'fence' (line 195)
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, Jason Gunthorpe <jgg@nvidia.com>,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
References: <202609081301.6ARYAElY-lkp@intel.com>
 <3f26027d-805f-4ab5-a181-d56a2708c50a@amd.com>
 <aqPyeNLCsy-k0DIz@stanley.mountain>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aqPyeNLCsy-k0DIz@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0253.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB8648:EE_
X-MS-Office365-Filtering-Correlation-Id: 51253116-31eb-419a-733a-08df102185b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ujsyLFOjDadPKvhKh5JElM6HI5OfGEmHv0GYblOtkarTGyEI1tbSGy17vKnNQc9eo/KTnH3o2SG16bxBnUw4DPBp36eJuBCJG/uSsXjPmboS5JXAq83FGlWZJ2qYFaRK/AqKMSxwljC4whrrxQ6NYsTiswFYp1sGLaoPTd36u2yxuDhGGkAdRH4MBrEMTmFIkNw9408sMtOyD9Rs4LBeTtEC4EejNsS5CoR8lZt1VwUxxfavcsK48aYKxlVPd9LneRbYLSG+jHxEcAUgyOp8orY5LKaos9T2IQe4w3VTgVBH9sRWDEL21j4IkD2I6fZ/+hE4kvXBe8WtEd0/4/KWyVq1WP9atIbZNhmoLur1jKrDWEYr1F7L2u8rsv4EDrbqs6K0fdsCuxmzU0no/zs7j3ToMJYcqpD13foxWV97fflPpBVsSxcEV9af3Ba5QmWwSsfy0DBOIuDE9ta9QoHB28iheShXV0XcM8x0CBQXtU+WSFz16+tWCe5iOo12xcGHkOisCQyE0XZ2ouhz/G0mT1aGpJR0ZvnjHIzFTwga6x+aQuRDgTF7mbaT9uhOByF73fmLPof8gDY/kQQQhk3KbmVWqrCFZncp0flSOhAYamzy4fMfdc3MOQUjlF+tMyxSODCMu9s+yYGpotOEn9qPAW1OYAl44GxE27d2508Q0sA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1hjTTF6SWJvMjBob2ZTNTBidlE4bVdCRWp4azlqS3I3aDJJaVR1TlNhNzU4?=
 =?utf-8?B?MnBQMUZCWjhmZlYxaE80c0lLUUVDSG1ORjNtTlpUYkxsc2tuM0M3MndMTzdI?=
 =?utf-8?B?WmM3RllDLytDbXQ1aFB1VzhDcHpEanFncDQyMGJzT1RqcmFCM2hOZHVuSkNE?=
 =?utf-8?B?c0ZBVTN6Y0FGWlZSYUswWWNqZFArK2JEbUtJR1N5aHVwTXRQT2xydk84cXc2?=
 =?utf-8?B?VGpMazd0MlprNlFmZXcyaWh6alFTVjhYeG1QQkVad1Z5d2lydTFzZFZINlB6?=
 =?utf-8?B?NnEwMFB6ekZDWjFpdzdYbVNmTzV6anptR0JMek9FR2h2WWJNSW1CcnBjRDda?=
 =?utf-8?B?bXh0V2phdk45anlnR085YjZlbC9JVXJSTndFMHdxU3ZWYUtMMUJGNUM3UVo4?=
 =?utf-8?B?djBMNFpTaVBZckYxc2VUSHdxVktEdzBscDVKcHM0V2Y3YXlqUTYzZS9KandZ?=
 =?utf-8?B?LytqaVRDcENOWmpGN1hXeFA1ZmUyWmNUc1RoTjRUZlBrclZicXNQaE0zUzZB?=
 =?utf-8?B?R244b2Q3NUkzbUg0cmhKNHRnZmRxMzNVVmt1OERZTHQ2U3lsOVJSSnNhbHdm?=
 =?utf-8?B?S1JqeFg2amZCRmNaN0xxT0lFSmM5TTgvenA0YjhQMW4wcUcreEVvSk9Qa2sv?=
 =?utf-8?B?TStrU0NVUHQ3dHQvTG5VdG9vWG1qY2phamhPMnFTbkVQYSt1SHhhNEhqajdK?=
 =?utf-8?B?ZmwzNHIwb1FTMGR3K2lvVzIvZkJwM3RsS21wZE5NV0w5dzBlRnRUZnhSbkRR?=
 =?utf-8?B?RkU1L3JtNEpwcjI4U3FGdUdRSTQydWxheC9lTXdDUkZVTi9jODQ2V1pSSmNt?=
 =?utf-8?B?QWhUTml5SlJqL3Y5MUxMdFp0UjgwcmtZblRoWnhOQzhncWw2QUNCUk9HbzFG?=
 =?utf-8?B?RDJzN1JFYUhhRS83djhnY25UTTljL2hSSmloN1NiNHBqeG9JZ2czbGJtVWhJ?=
 =?utf-8?B?TEZqa0JOTkpreGw1cVkxeEh6Mmk5RUIxTEpMVFRRMERBVnVOOGdkQlFmZmlQ?=
 =?utf-8?B?RmtEVktaeGVrQlk3QWhwRE0rNVlVNTJkRy9pUW80SmpzVmUrV1A5aXl6dWhI?=
 =?utf-8?B?cUdoZXg4SnVqR1ZDTWZzQXF2d2lHS0RtSUR1RDB4SFVYdnd5Mk0rcVlaT09j?=
 =?utf-8?B?U1pSNzV1cUQxOUxKME04bWxwVjA5SEZUOER6NnRkY2hCSWxQbHRHMUhnTlVu?=
 =?utf-8?B?TnRmV215akVPOE9TLzVHd1hDcXpJVzlDWlhkdmFxbmpZcnQ1bzBKWXpyN25j?=
 =?utf-8?B?U3dWbDNvUENzdnRNWG9jVUNmc3MxSmlvaEFZYTNDUTk0bHJmRTY0bXd2OVVk?=
 =?utf-8?B?N1Naam5ETnl5czRtdWdWempySnd1eWVmcmJVbzViNkF4a2hVMzJySXdPVi9n?=
 =?utf-8?B?VUdLK2JpZTEyTCtZM1NKVzZkamhhVDNrQ3l3QnRQWGpMYXR6OE9qWnFEbi9q?=
 =?utf-8?B?L2x6a01hL2dudEd0cXo5ZTFoQ0JlUHZybUJFckhnbERRMTZ1dWI0UXJsK1U3?=
 =?utf-8?B?TG1EeDRYa1Q0TXBybWJFMTYzOTFISkRrS2ZER3RXck8zc2hDOVNmWmdhT0pu?=
 =?utf-8?B?RFdsUDlSZFd1ZENXeERsQW9FRUcrZDMvK2RhMXpWYmE5eWdhczV0VXhwSExh?=
 =?utf-8?B?cDQ5NWdRd1ZWaGU1LzVUYVdmQTRlbHIweHNKRzY1cXBhQ3VQbjVlclN4azkr?=
 =?utf-8?B?OGNqMnNoYXNvNVJpalozWDM3cDBHaFhkQkpWaTlRRm45VHU5SG5xV2E3dkZm?=
 =?utf-8?B?N1hocGhYak1sUnFUQTJBSkErWnc0N3VaV3JuNmt3Vy9uckRUNFhMdkJqR09W?=
 =?utf-8?B?dTJYMHF0MUxmSm5NMTBVTlNocGNHY0NqYXZFNENJWGRpSU5xME93WVpaTjQ5?=
 =?utf-8?B?azd1akRTOHJPSFNlc2U1OVlTMEoxTDRxV2tSUXA4ZUVnYlVKbnVRcXhNc0ND?=
 =?utf-8?B?bUQwcmxuc0puS1FyYSs3VmkrQmpxMjVJQWFpYTA3Qkx1Y1h1a1BsTUhtdVlz?=
 =?utf-8?B?RUFOWWtzY3M3c2tPWjdtRW9oY3hNWW1FRWo2S2xpQXA0SEdBWFMrSXlWMnli?=
 =?utf-8?B?RjdPK2xjQ2w0b2ZsOGFhMzZGK1dEYnBZR3R3TnR1ZTF1UUlYVFRWejRlRHFE?=
 =?utf-8?B?bm40bzhvdzBuc1YzWjQ3M0FkS3c5cHhqa3JQRGlubzBwd1VlN2ZHWkVVT056?=
 =?utf-8?B?SjV6bVNwRUhQb0t1eEZEMlpJdFdMeWZIM0huWWd2N1A1VndVeW9wa04xM1NE?=
 =?utf-8?B?K1FrRkg1aHZ3Ukp6MGtUNUY4OVhHUjVPSlN5TGV6ZVdQTnFkNU5XTFhCR2R1?=
 =?utf-8?Q?Qv8ibe3CCMC8oLudcR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51253116-31eb-419a-733a-08df102185b2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 16:27:07.4652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +iotIc0YtLdLGx4C+qpGD6jPlT4cq3keieQCeYNdkW3pbc0osW8r4Chp4VszE02w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8648

On 9/11/26 14:22, Dan Carpenter wrote:
> On Fri, Sep 11, 2026 at 09:49:54AM +0200, Christian König wrote:
>> Hi Dan,
>>
>> I just double check and this one and the other "warn: passing freed memory 'fence'" look like a false positive to me.
>>
>> Any idea why smatch things that the memory is already freed in the test case?
> 
> dma_fence_put() can free the fence if we drop the last reference.
> Or imagine that we aren't holding the last reference and a different
> thread is holding it and they could call dma_fence_put() which is
> also a use after free.
> 
> Incrementing then decrementing then incrementing the reference
> count doesn't make any sense.  We are relying on something else
> to hold the reference.  If we can rely on that, then we don't
> need to increment and decrement the reference count for certain
> basically random places.

Ok, well then that indeed seems to be a false positive from smatch.

The pattern is this:

get(fence);
make_fence_point_to_something_different(&fence);
put(fence);

The make_fence_point_to_something_different() function consumes the original fence reference and returns a new one. So the get/put dance is completely correct. (Well it indeed doesn't make much sense, normally you would do something with the returned reference before calling put. But that here is just to test the make_fence_point_to_something_different() function).

Regards,
Christian.

> 
> regards,
> dan carpenter
> 

