Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022099.outbound.protection.outlook.com [52.101.101.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F5047728E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790201085; cv=fail; b=T10bLarjUv0TWjuh3TNSs/7JG5ayJPKvpcx3CWGxUWP9WY87FX/FXMSA3v6P1PPn+1bCNFuHkhhSWeIznawIaADUwAaJ36PYyUlxNZJiEttAw+geLlsXvOi+qwO9K7fScqYj1RpLZPN3OJ7NZTx7HYTT6fAdTXt6kzCu9nv6PcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790201085; c=relaxed/simple;
	bh=F7Og7vRVjkKicvzEjiI7Icpz1o12unfUtbwAFQBUA4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y7CKPET+lb5wEI4TqsFX3/0uRCE1GA2xif1ytZqHm2n0bpUKCqBBZdwHFhjeX5eAN/2BN2nBd6eETJZXaHkvSjagxhvaJl109XxlcBCFHbrhIhkeko0xER6hQ19z49uYNqdiLZ6CDx50AS9DaDxIkc/eXt898IovWKv5IM5kEVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.101.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEKkZSMfgHPsRNZTMRXaWoyKRLzSZp5qKeWJJtKtHTB5gDuQfrw2T68bN2O43pB7hywo0F0SDxBTFbNBXPkKwiBoIkAB3NLxKuZSpfoXE24oKldPAWW59Xgpk7lzYvGGNVfTH0Gxv6hX7Qirel1K0W3M88lJrVEIqUbiOllDPZU+T6DE/gKctFkqh7as/owXElhSCg3P7h2UohcrgxFW07fus4sh8sSndNpuctmjXXj9UAvWJmS8NbZC8LSQx+Be0rRXlZkC7s7C9s/2PyqNwMEoSjkLlloPbtn4Ditt4f0wDqYKpVuM73rXlO6RNsJL7mrSiwmM8ayTSlZ0H4KRsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=3nbRxHYS28mA2OH/fe3YeekSeKI51JhX0Kj8wr+x8/U=;
 b=IqBZBdOBpNdi2SpN3FUg3gEhoj4OxBTKx3j6gvUTAGWYgf+esXIAQuCi7juMyXyuNeKL2TFEF8vVWwB7/Cjnz7/6N+mFXM6foz0LnwuaWuXVSY/5fQcMn808UkUk9v3Nhtp/+ADrEkxcqRT7+1Xysba7NHhJpBQ50zdp73c1QsmMzVslpjVls0RRFVUwV0jQpZYjg63EOSOQM4tBswdl+3ldfNAFMtmcr0Ga4skMOFZik0W5esHSzTeR95NMvZevlC3CMXngglzooChswG3GYaaWtvLW/oLBYxtVc7bjjpS+EYlZHC7jueANxKDS4M6PKoMoIGVJwlOt/7aVM1scEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by CWXP123MB3718.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:4e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Wed, 23 Sep
 2026 22:04:39 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 22:04:39 +0000
Date: Wed, 23 Sep 2026 18:04:32 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: Tejun Heo <tj@kernel.org>
Cc: leitao@debian.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] tools/workqueue/wq_dump.py: Add busy worker
 inspection and BH pool states
Message-ID: <a7r323tagcakjemmo3e52eal6wnfqnkux2ipotmcvcfc5xmaq2@7vyaip75t3mh>
References: <20260923031344.60494-1-atomlin@atomlin.com>
 <731a01cb1a08c0b66af6a772a4cdac10@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <731a01cb1a08c0b66af6a772a4cdac10@kernel.org>
X-ClientProxiedBy: SN7PR18CA0020.namprd18.prod.outlook.com
 (2603:10b6:806:f3::14) To LO6P123MB6616.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2b2::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|CWXP123MB3718:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c9db86d-2c8b-46e2-c72c-08df19bea97e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|56012099006|5023799004|4143699003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	U6gS2Xa/fAS6AqYIm7/egxoQvlh9zEBfIWsZzERdIgvVlDQRfB6xa6wpcR6joIXXSe3j7djMbjWr9mqiAlVTY0Q71rCthQBeMse8wcD/VINpgJMnpsMD6zv3V2JO6uTns6lw2/hz64z7POzysgNu8QrTFoEiw1fSYjeCZqcvWIH4xcUy7QovoaZQQanf6lTJi8asvuFhLB8E3OdT57a4ZchzVjuDTQA/usWi1cOHhOqavuvIDpwp9PKQsxB00AzgXmPERjZfl4SqK8Z9XH8dWDeXpTVmTkfLiAWzQKv0F+0N8hkUKj7QWAdQcO/jmnknhFNxEBQN5vCCSisU5RANOy9MFsrfnmTu+2HAv5SjhvHq0Gzs1X/wOwXM821piDDb83hLH/5Ck6lrjYQntCkLOdPFR4Nlb3KIrtezSjUBEogRmjqtRDr+L3sc9E0oUudIAOxXhpsCLWM1rKrECYCZ0GXfW5+vsQC7XPRs1yOYv2tx0OUuAb36nn6z5Wre102ZoI35+AceGmcme+nKNVqWvYYTajoxHK1HlzdS9PjrTt/t4Bw+wkwMKMaO0oSVqaHxoddaGSwUO28xd+lshiMU7c0thX+t2yG3lxGbyD1hckI1CaXBnv7wsGreBo0BeqFq7GcZlaZph54BSQG40jbMrUSac6G8slASPYwy7iE0xbQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(5023799004)(4143699003)(10067099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXdjQ1QzQmd2OFhBT1ZGUHRRV2p6akhtMzIxYVBOYysvLzNWZnZhV2lHcmZV?=
 =?utf-8?B?RW4vQ0E1TDNWVHZOUHVRWU82YVYxOWNQRnVIekt2R0ZmWG1Sa2wyRUl0MlZs?=
 =?utf-8?B?b3ZMYkdoNThkR2hoWllMY05lRTlsWkZ1Z2hrR3lYaEpnY29kRG15K0MweGQ1?=
 =?utf-8?B?bzBlb0hpMGtaNFdHU09YTE1pRkZRMW1vcmU5QzFrWDJBSkNoUGpIM25hcGRY?=
 =?utf-8?B?aWdEcHJicUI3bmRiTVQwUHVpMVJVbTFZU0w2MGlXWFZhWlo2RzVteVV2ZVJ1?=
 =?utf-8?B?OVNTSzNzYXNyaERlOGdYL09OdGxOY3dmVWVUY3JSOHpRS0Y1bjJnZFlNekJG?=
 =?utf-8?B?ZlVRRm4rejBEWTdIcEk5bmk2Z25rZDJTK3hvd3ZJejhzcHU4N1FmVndhT3ow?=
 =?utf-8?B?VjBUYjc0K2cwV3R4R0haQkNPTW83ZXg1VG8zall2VVQzZG9wNHF0QnlHTHJa?=
 =?utf-8?B?MXNNSW9lMUZmaVEyM3pTOERqRFI0VEZzOHBMbmc0eUtPUXdXY1JnaEpVbXVq?=
 =?utf-8?B?UEtuQ3ZwbkJOMHZ3dXUveUE2dElmS2JVRkg2KzM1SFhhNktpUWJjc2oyTC9s?=
 =?utf-8?B?UDZNWVVGeWhKMFpadjdFYjVFQSsvL2Z6UGtRcDd2b3VQMlE0SU9vVUQrWDVG?=
 =?utf-8?B?TXc3L3NpRFE3SWZpZUZCU0pVM3d3NjdDVGhsb2hoK2ZrMGNySWhWbVdhek9m?=
 =?utf-8?B?M0hHdEhSVis2emZ6cmRrWFlpdDFpK3IwUmtJTTNTenA1N1oyUUNwZXRPQi9Y?=
 =?utf-8?B?RXA5WVFPUUFuVVBoNTduTTFwZmVjRDc4WHlNMHZqazMvK1QreGdld045QmpQ?=
 =?utf-8?B?SjAraHAzRTBMWS9lNHBRdnV0SXlnZXIxdzNTaHZnVVBzMXN6M1BYb1FSVklj?=
 =?utf-8?B?aFF4N0RXc1B0ZmpnZ01UeFd6cnZrY0FBVDFwZVRyMWJHWk85TkNlQ0p6eHps?=
 =?utf-8?B?bzE5K0pndTZsTmxiWHZlZkFjUFU4cm1Nb3IzZGo2V1BFTTVDQzVRRm5qY0hy?=
 =?utf-8?B?NlM3N2s3VkJqVFBwb2F3RmFhWUwvSW1GazMzcjBaWGNuODNlUHVHM3hpT3c5?=
 =?utf-8?B?alZxdDJsTkRhZlpXSnJpN0R2aVFDRlBRSkJiTXpCNVBJQW9YNHdaMURQTWJC?=
 =?utf-8?B?MUI5cmFPbjlwOHhOVDhkTjBkWUdhdGswZjRZQ3diekV3YUhlclpMWEh4bmcv?=
 =?utf-8?B?YVFFeFF1VkYxYXhuc0UvaFF3OFlJcUhhMWFTN3RSam9VN3N1SGVFWS9kM0lW?=
 =?utf-8?B?WkdHRzcwOTFIODVWWW4rSGVhMnVubVhvamRZWmhDV0xSbWpvZklSdjZWVTF4?=
 =?utf-8?B?Q1BMc2plV1AwSk16KzFlZy8ydk8yckVYNDVCVGduSWZhZGE2czFDNlZPYWNW?=
 =?utf-8?B?WGdzVkJZSm0zaDNZRDZnaDhMVXh6ajJIbzRHVEhZYkhWWEoyTDRDVFZKU0Nm?=
 =?utf-8?B?MXhGd2VkVXFESnkrOFA3QlBnaDFGdmROMzNFc1pkbEtKVnFaaG1FZ0VyY2JZ?=
 =?utf-8?B?YlhNM2pZUVAvTDV5cWwzaURjLzNtaittOE1Nc01mUWJ5L2xOU2FFUXQ4c2Jk?=
 =?utf-8?B?NVZHSDQxVlJKWTVScWRYVTJvd1l4WElncVNCclluTlY5ZDJaRlJObmhIdmx5?=
 =?utf-8?B?cFZGOUtNOGs2UDl1YS9PT1IyNnBiNzlhOGpaZURneUlFR3NUdThVbjlBeWVx?=
 =?utf-8?B?S211ekZkSStGUUs4RHpGR3NHVHBhamZsSE5KMi91UUUzYldJUEVTUVpqUk9q?=
 =?utf-8?B?T3YxNjZCN09kdENNeFRkV2EyaTJ2TzhGR3pqTVg3cmhuMTlJOG85NHRYeitF?=
 =?utf-8?B?WkJGalRGdktIaXNsVm0yWEE5RVc4TmlML1dnK2hUc2RXcXhQcGZNWXdCTWsv?=
 =?utf-8?B?Y1JNZmMxckh6VVBYTEFRajdOMVJ6bVBidkxPYU5qamlYd3Vjb3FPZ3Y0NUJJ?=
 =?utf-8?B?YnpzYXp5eEFnQ0JLK2ZkZU56NTFLK0tOYXNWZTNhVWI5Ky9VYkhRNXoyMEQ1?=
 =?utf-8?B?bHNnWXFWT0Y4djk1ZzUxZ0huQUV5Z1NaMWNNZ3BzaVVDeklrSHZ5amNReTBK?=
 =?utf-8?B?NzY1aEhZSE5TM3dIb2w5d0VUSnNmOFJ5TXVsWW4ybjcvL2FzWEdyMkg0NUlO?=
 =?utf-8?B?eXhKZDlCbSt6Tm1DcHltUFRwN2ZtSHpQczV5enBBd2FHVHlQbGtxSmpQSHpa?=
 =?utf-8?B?QzEybnNPOWJ1ckJRNmJoMkp6bzQ4RE44Ymlvc3IraHVhL1JZeUNidnhtT0VN?=
 =?utf-8?B?NlZPN00rWDkyVGRDUDdQaFB1R3BrWVhzN3VROGJSOVR0QVJSSEcwK3BCb25N?=
 =?utf-8?B?MVhkRGZBTXhDYUZRQVZKRGEraVRTMnRtTllWdm9SVWJkMTg3Tll3UT09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9db86d-2c8b-46e2-c72c-08df19bea97e
X-MS-Exchange-CrossTenant-AuthSource: LO6P123MB6616.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 22:04:39.0662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uowi3rarZZX81Xz9770/qwvuVxGq2afGfY030aO8YiZs2zp7m68gf15s34D3za2KnXL4ov5evU9/Ucr6V+/mWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB3718

On Wed, Sep 23, 2026 at 09:27:36AM -1000, Tejun Heo wrote:
> Hello, Aaron.
> 
> On Tue, Sep 22, 2026 at 11:13:44PM -0400, Aaron Tomlin wrote:
> > +                            fn_name = prog.symbol(func).name
> ...
> > +                        except (drgn.FaultError, LookupError):
> > +                            continue
> 
> prog.symbol() raises LookupError when drgn has no symbol for the address,
> e.g. a work function in a module whose debug info drgn didn't load. That
> gets retried like a transient fault and the busy worker is then dropped
> without any output. Maybe fall back to the raw address?
> 
>     try:
>         fn_name = prog.symbol(func).name
>     except LookupError:
>         fn_name = hex(func)
> 
Hi Tejun,

Good catch! I will address this in the next iteration.

Kind regards,
-- 
Aaron Tomlin
