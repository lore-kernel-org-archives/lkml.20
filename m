Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012000.outbound.protection.outlook.com [40.107.209.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44591A6811
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 02:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788920408; cv=fail; b=dglMNDiqx70DKmxueiq+bYWTlW1aptwfVwU4EwKl6oKf6YrNNeygctV+LyRp8R9Hyi7hjLidPRh2KtKlR84N9/4uj1uDD/l6EFh40Kmxr+ajp9B0CPdDq78jNk9gEDIXOcPvkPDneeOYMQfy6MtfLudg+9dGmXRUj10BP2gJf90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788920408; c=relaxed/simple;
	bh=6FFCj9P4+YDSyZeeNwkez2H9SitsiGfM2VUJIag1GPg=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=X9ud+1OcXGadg0ogz2Yw+qkPeSBnt69AELWG1tpEXya11eUqpGSEyJo/C78PjpKyUgJm3Kx404VMfdGR6MSHtkfIVQkNMOHKcIcZ2+6Z7hciSzvTKh78MZ2uA6bp7t0bsmoYpX3t9AYxlnVq9uzM7Mlb7yZ3tcNU2cg6s1EiJNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pbyP7cda; arc=fail smtp.client-ip=40.107.209.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pbyP7cda"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXcHtgZ1b/7hlcDoMISKvMoLflBGsvuHpY4QjsvuhkLRz65wNZpkE9F4BzocFvL9iuDsGFGCLW+WvNNonxHzgu2Nl2mTdofojyL7JniH/R2//3iLxydJC0x5WrP6keZq2qOF2b/zgDXVRASRHOAuo7iPN0FGvkAtGHTcW4zBgCsiUUawLjmmAon97OcKKmBHuRoeHIiPI+ydJ5/QiZz948N+mqOc7y+Obpx1GI8fomsXA4cX4qOJVnNrfwnWtxLZB6QxFqAxJvOVMsj+oOmLANNylgvmdgLxxYuFfsOQBC38mtc0DZgj9UKCUWQhtwZ+Os9HjG+IyWeOPZGFd88jaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T69VvYUxtr137+yRGOnm1ETUTnORkJfnvX0lh6b9Rec=;
 b=C4LzRVBTtIM9ySKJ6URM6G1e0ARczCgtPMC+bg06VJ1WXyteHxg7p6F3PjPIFYFHQ62CNzqmi5LjuP2KlqlxD8rP4Am72c+G0tmfEQasP2SJefSXCJKVoFXP870FVxdl2BvJpIQXXUIV5Gn6PTWNYBACwzafDidhpLiLp24RUixy4es40z3o8acYME8B4wYWMM6irJ1sxW9d9sgCtrsAMsgARxhGTCctqCw5c+RLocOPUfkFEeWvyh/DB1NhVNoAUBFO9UkZeZXJlNn3ASJA5XYeTJ4xfPe1p4b1f7xK9Y75IsZZiXlTWHu8vZ8fynMX59s4QsUkw2e442iRkBWjLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T69VvYUxtr137+yRGOnm1ETUTnORkJfnvX0lh6b9Rec=;
 b=pbyP7cdarNC2S68k8OkjYHfydnfO6LU52yVZWY6s8mk55uZ0pyXcubBJbiVMzTTXT8AKoboy/lNolCu7Bbdt3RdssTys/lJtJ+ekCDKIjiB3D5naIvBIhZLL1zED5z/UnrNv62OtcuYd8EMnsm3aDBHdp2kdJQ+Oez27Aow9dGWOjayKPUwW3zWjzGVpWr+cWbbDpbI+MKnZkKKl2+rccC5kTictpb1kn9SphdnyvASZ8ziDebgbVghpno3diXYAaE/2a1q6Pq0JCbgvwdYoBXtexoBL6iM3JYrVVPxXdTb1azFX8hgSzCyBi2d85Xs1S7wv9z/GPKcDc++q9H3q+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CH1PPF4CBE7339A.namprd12.prod.outlook.com (2603:10b6:61f:fc00::60e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Wed, 9 Sep 2026
 02:20:02 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 02:20:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Sep 2026 22:20:01 -0400
Message-Id: <DLAFCUWXD6VN.30HHX0AGG0ZRN@nvidia.com>
Subject: Re: [PATCH v4] mm: page_alloc: add missing hooks to bulk allocation
 path
Cc: <surenb@google.com>, <mhocko@suse.com>, <brendan.jackman@linux.dev>,
 <hannes@cmpxchg.org>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <gourry@gourry.net>
To: "Qiqi Liu" <liuqiqi@kylinos.cn>, <akpm@linux-foundation.org>,
 <vbabka@kernel.org>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260907120949.418450-1-liuqiqi@kylinos.cn>
 <20260908102356.344075-1-liuqiqi@kylinos.cn>
In-Reply-To: <20260908102356.344075-1-liuqiqi@kylinos.cn>
X-ClientProxiedBy: YQBPR0101CA0209.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::9) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CH1PPF4CBE7339A:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f4b523c-a22b-4f61-1ef6-08df0e18dae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|7416014|1800799024|22082099003|18002099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	gwWu7qTYzwZm9blfYzqy5nNoJ2jxSDU7f/VUeQLYXWAXJ2IfohWHAWqcyA2x9Wj0RHHvoQQJbuvVAFl1J1QlX8aVZLTd48gJVctelx82zxLqoR6FBGWNUljLl56kr2i11io9jEtWXcuKVVQYVX9fxIHsIe4Z4KTWW5716FbTf2fzZfsSHLgJBGrMIwm4Y+bqbUgPCqs/Tc+A5gonGP/CK+dNvj5LBar7YbU/kMWa1Ui52R/1oSLSHgeuYhjokGczhdkVNYz5Vm/Xuhfb6XzxCeSuVXgiVKXqMD1SPVELsdN2wJf+wjkLHfatQ2YRzDIYsoJXJDJorMD22NMjMu7mhLasQsSCU6+FSVPllWsuhpSl+b2Qe3P01+BXckVgugExgymgz46pPHhEiIEjxM/oeyL3OyPasn+4S3B2Sy8AaNVeeYMcTCoewQPKyaC/eKDD0OnwqwUaTlv8tadbDxjCqno+mIxTZ8OaqAYe2oWJHUjv/MmQU+jv3g+WuhRbehKtoPWvvHJfWEpov6uVrhAQGvSCnFmrSeQHjyTzW2wPvRsTedNVxCcaVQq/VN3RJPWMfqEGilXCLA4i8loRx3vi+W/Rr8GLUuSCv0SWxGl39ODZmJPlV7pxn6Tqfzpgal2FrcpdOBc8K/G+RrmTdtnFAsITJGVgbKSAH7LSIRFSXk8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(7416014)(1800799024)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sk55RlIrSzc2ZlkxbWtEUDgyL3kwNC85R1VWbnIvK29UUElYS2NyenJzTktF?=
 =?utf-8?B?WU9zcGxyYjNFTU8rR3lqVXR2R283ai94YjFudjBrZks5akxIVGNqS1Jxb2ZQ?=
 =?utf-8?B?VDhuT0szd2RGa2NwSjF2dTIxc0UrNEFBVHhKTXRpVUN4bEExOS9aOTlXRjk3?=
 =?utf-8?B?VTQ5ZE81WWgzS0VPZzhaNlk0SEpXK3N1NTFCN3M1Qjh0NVVPVDJFV1VYbW5a?=
 =?utf-8?B?czhQQWZUalNqeFhLVWdWK2R6RnNsWWNPM241cEIxQVh2TnY2ZXBzUld2SEVF?=
 =?utf-8?B?VDJjY2ViTWo1TXZPdncvK3dVN3AvU3B3VThSTWtEQUVrU3BJK0pDVy9GczVF?=
 =?utf-8?B?VTlXUXJ3TXdxWEphU2t1K3I2SzhxbVpmNHRmUnBiQk1TS1N2T1JZMVpUR1A2?=
 =?utf-8?B?d2VoSW92akVKcGd1RVptazBOS3JhckJjdWd4OUdoSC9jNlAzWWNnTjhGSEdz?=
 =?utf-8?B?OXE1K1BSbytpOVhTQWh3RTVOM09uWm5OZjN5TlBoUWt6d0JaUVdkK1lTTlBx?=
 =?utf-8?B?Um5xY05QenVjWVYrdVEwaUNrZnUyN0lIVTY1dFg5NUpMeXA3OWxMUG1ES1Uy?=
 =?utf-8?B?Z0JkdndoTTlIMHJzQmMxakhiU083NXJ6dGhnV1dnQ2NRUStzaUdZd21zcHFF?=
 =?utf-8?B?M2dIM1VJSFBQZ0pCRTFTZGt4amxxVUt4OS9YV0xuRHBmZWsyN2ZRWnBLZGhV?=
 =?utf-8?B?QVozZVU1TENMMVZKRDBkUithcGU3YWgrVWc2T3JFdGRYbWlNcFY4U0MzenJk?=
 =?utf-8?B?TnZWTnNDTk1kK2M0ZWRJZTZPVG9yeVgrdEM0SXVXNi9kWjY4RnNZb0RNanlC?=
 =?utf-8?B?VFY1ekwrZXpqUkxnODB2K09aTlIrVUVmeXVxRit3Wm96VW9nME00WEY1d1JB?=
 =?utf-8?B?YW1aWHR1U2ozNGpXOFl3RTVWN2ZrZGlQa2RoM2FZc2hXL0Q1TnJ2WHhURVJ5?=
 =?utf-8?B?K0RzK0xmcUFwbmdoZUwrL3RuczZkTHQwd0Y4WDgrTVo5T1krdmZ3TDlrTm1C?=
 =?utf-8?B?UFgwQ0JxanpoaFpGSVo4UjRzWFI5RDM5bEhOMXUrRDdOeGVxeEhqRUJmVjUy?=
 =?utf-8?B?N3A0eDJxMGVZWVAveHZzSU9BeHNnaWhKTFRRaG5tZlJ4aFRKcy82cStTalJ4?=
 =?utf-8?B?SllSTVlmMm1PYnpwQTZRUWRZY0Z0MHN4SUN4T0pEVEw1d0drK2FadlcvS2J0?=
 =?utf-8?B?U0hEb29GVzJWTTdOZktjeUc5dER2N1JSNnZjVVFJWWtCa01mdkgwY0FjZHRC?=
 =?utf-8?B?OEhQL3hPMjBYZlRDQ3VWeVEwRVZMdWJuNUVuN0JqZDdyT285UGdieHFmc1RC?=
 =?utf-8?B?SkZHQ2xTN3JBL2xKUXhHY3VqMXJEUUZ1VEVnWXVrdkJyS2lwY3FMT1I3dWtt?=
 =?utf-8?B?VnJSMldQT1c1R1M4cmdIZlFkT1pwTGZhOVRiczhZM3Y2R1RCbWNDSklXYUhL?=
 =?utf-8?B?T1pVWFpUTWZHNlpsdlR4S1AwNnZrTUZFeFl5SnE0V1lwQnloRmZUSWJHNk9K?=
 =?utf-8?B?ZGhLK0p6bGFmTE1oN2VqeGlCb1o4YlViazNDMUtwWE9mZW9iZWZQVzdpdVZS?=
 =?utf-8?B?OVpzVzNqS1dhYkN5VFhiNk9Jdmczcnk5ZVRnak44S3FYMHBkcFFBVjhwSCtn?=
 =?utf-8?B?RFc4cHVRd2JUM2VQMGQ3TVZSQzllTkhrRnNEdjlJTXppb1lqeHFnSDlxcDFH?=
 =?utf-8?B?UXlZdVJKR1BKWFduZnFYazJjdFZzTkZRc2JBaUtnWGpCd24xVDU3YVpjWERD?=
 =?utf-8?B?TklDWDIxVTlNMGNsL1NUUWV6dEc5TUQ3ckczQjJsOFhOaklWcE5Da1lRQXlG?=
 =?utf-8?B?VERNNXBIL2dlcXBxeGd2eVNnZzhiYUFFMkk4RWxKZVZrd0ZQYVh5YU1pZ0F3?=
 =?utf-8?B?VUNLUUQ0MzkxRW5PUlZETXpqN3E4bG9VaFJzYzlZSWQrUzFxSlB0SlhZQTE4?=
 =?utf-8?B?YTMyMnI5SWhieUpMMGkyS2w2Z2d2ci8zLzBzdTZxUzFrSXNvS2ZTQzN0eUdS?=
 =?utf-8?B?V0tsaXZyVGhDdnRpQU4vQ20wZHJuVi9OK2pjSVpBczlLK0RmbW9oZkxCWTJs?=
 =?utf-8?B?dEVwNlBPRStjTXU4czEvVFVoU084cThTZlZBK0NFVExaQkxLdHM5Nm5TeGY4?=
 =?utf-8?B?TEROUGRFL2VzMXJtTTYrNGNLd1hJTVNPTXZoVmxIeHF4WGR5Sk1PSFVQVnAz?=
 =?utf-8?B?ZTdlU2R2dysvaDNlNlpHeUt0b0swMmlWNXJ4ellIakNIaDV0VEIyRzFaRXo0?=
 =?utf-8?B?OWxhbUFzOUZxRENuQ052YlFodldJekpZcG0zSjFCL1JNTzlWSlRJOVBKU0tl?=
 =?utf-8?Q?HKbaLwT0gNHacPa4jG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4b523c-a22b-4f61-1ef6-08df0e18dae0
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 02:20:02.5433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJznUxq2gvjObM0DAO9UDX3F4f/V7gU6QzOYp7ZcGgZ62Qqzm+c1wzLVREmTmkEd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF4CBE7339A

On Tue Sep 8, 2026 at 6:23 AM EDT, Qiqi Liu wrote:
> The bulk allocation path in alloc_pages_bulk_noprof() currently misses
> trace_mm_page_alloc() and kmsan_alloc_page() calls, leaving bulk-allocate=
d
> pages invisible to ftrace/BPF/perf and leaving KMSAN shadow memory stale.
>
> Add both calls in the bulk loop to match the standard allocation path,
> placing them before set_page_refcounted() for consistency. The gfp mask
> passed to kmsan_alloc_page() is stripped of __GFP_RECLAIM because the
> bulk loop runs under the PCP spinlock, and KMSAN's stack depot allocation
> must not sleep.
>
> Both are no-ops when their respective features are disabled, so there
> is no overhead in production kernels.
>
> Suggested-by: Gregory Price <gourry@gourry.net>
> Signed-off-by: Qiqi Liu <liuqiqi@kylinos.cn>
> ---
>  mm/page_alloc.c | 2 ++
>  1 file changed, 2 insertions(+)
>

LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>

BTW, please send new versions in a new thread instead of replying to the
old one. Thanks.

--=20
Best Regards,
Yan, Zi

