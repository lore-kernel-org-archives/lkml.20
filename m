Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.122
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793027525;
	b=Iw/YI3pz6ddvgjpUnpp6OEvu3Q/uqrwzDSCRwp3+QF1Dzkv3217EVDF8kYprceBvUsn+
	 wwQYsWwJ83VCVoYz3X7NP9/Kk6B1zSnDuJZ359gZCR/VeroKZQdMwiEJdGnjwsrPBoAvZ
	 JTypEnzAc8Xax78cOFm/Z1kVYc54MYXA6nWKqbD57e2hqJcWSbNZVLfC82kkBaejKi4He
	 wymvUPt6TOAT2fs/IUd3UWFpZw3JhcG+Cr3P2FycME9FwR7BV+vtkFEwU3AXdBAGgCnPV
	 wY2hisghdmSpII8FSdx81qqPXlP2x1ZX28zUg5flpL+Om3qbT6d1aUnfUJ4aEOdsUhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027525;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=lD9ng46c8uWx83FHRI0MdkaY86r7Zje/fMD/s30V7as=;
	b=RlbKEyDmU2AXV9nWhb2S6HxVM5duzPDCvsf2kSn4KD7TR4UnIXNZY6OPFEY1uSY5Goph
	 XFhu5WhncBy77UiqgAzPjEc+vhkETjS6QJt3g6ujSTYsABI0eFImXJ9+Q+sSDk1y4ZiKb
	 cXix0uOguf4PfCsZ9ULAChtmduWtQ5552UonHvN/oL0iZB0omTqWWUp3Io4m4gytkSr9B
	 b7CRZLUmcNyvFRUiWN0dSTkET0USmk7AwRweC0tIMLJmqsZkGxoIVDEhbzKy4YEH5l8oo
	 wnpnRnzigYR+MaNn66EzCijD7IPPLwU/FLW31mu+i3Ng6a1yEFXn1Nw694JOxDanaxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.122
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020122.outbound.protection.outlook.com [52.101.195.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860A0606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 860A0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acEQKMozcUhXJyMoCmRnxp4xhcZs3Ll0vkfYSGZTCVUbtwnu7a+dlYJSPKfsI9n/aZNo9O066hHdJNPW9xDswgw38mXjM1gYhx8WGFJHXG9snJIB4vDqgM/lJHTSIJBB2jlVHdIRUHg/Hb8wNkdNVHXGngJdkqc+2pDHjMuFmL6C0iPRN9hrNRzzQl04Y8HHLVYgGmAm/xuhNx3twPKWc2W+4sIWuJfksnmwD+IF36z0PIXXz86jcd72Div3DpB8Xf+9YWodvc9wYbLbzVhdUTdW0WoTf0beAE50mjuDq+HfqZcWjytfi9QzvXR6EYtA/xH6MY2nBx4IBcFsgoAW8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=lD9ng46c8uWx83FHRI0MdkaY86r7Zje/fMD/s30V7as=;
 b=K/v+vNh7dFNJMLbuejjBgU9VbzTVP/o9DfZylkU6GlUbFB7EY6LmY7g/oUZZEYUJntLD7M7x/7RtoivS+1WFpK/JUvrXc6f8O0HnOmjR8eyCSjp3qkNiONPGVt4lcIj5K+8ndlGW+qA6bV44OzO1Ej3pKKfLC3jJIRlHXd47wZ0JLJdQpPf1jV9u55cb4dOXOgANLIdMCsP/qBy0U1uMxAe8PHwdZ8knio/zcvJaouf4tq0AEOhQ+4TslNrmr0bSeQXfP1D6e0+Af0dVkoeW62y6dwcOh3vYPUZSiUM1sHy8Z+FzszHF9xDsRdMZi8pbFZ5CJd6hIhE6E2Nj73LjBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by CW1P123MB8345.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:25d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 15:11:58 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 15:11:58 +0000
Date: Mon, 26 Oct 2026 11:11:54 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: Tejun Heo <tj@kernel.org>
Cc: leitao@debian.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] tools/workqueue/wq_dump.py: Add busy worker
 inspection and BH pool states
Message-ID: <hvcmfisz22qcnbu2k3hdouoozxvaehgprm72yalqnsxvgy2m6e@wr5qllbjegus>
References: <20260930143958.252572-1-atomlin@atomlin.com>
 <39d267b537b00b0b04a4a1999cb498a0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <39d267b537b00b0b04a4a1999cb498a0@kernel.org>
X-ClientProxiedBy: YQZPR01CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::24) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|CW1P123MB8345:EE_
X-MS-Office365-Filtering-Correlation-Id: f47573d9-3d74-4e4f-ebb9-08df33737a6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|261021135927099003|261022105027099003|10067099003|56012099006|261026140227099003|18002099003|22082099003|261026121527099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	Bz1H83MwdcpaVnJNvlk1GQHOw50IAupFJ38mtYRvmf4Cq3p/N/++xQL9wV1FLtZxj3bAopWaP3vxQAPlAWT39hrbmlRo8QgWu6vTvkmbwxdqhQpv5Xx1FCdTOTSUpTua1wAaQLZDJxxra0MdHCIL8MgefIWv1e+Dqb7RSACP9OAqTmNz5k/AwCbrJgWDGHDPCXWITxPF5NOO5r3s+KwBJoecmFFolaQiiV4Td1cfRn43jWZCuSfwq4lB/mlS1l8TgFkypTqTR9duvrlolNB+8QzGECM+qLHxLMCUzRx4XHzo6vP7SqHOCMJGSsRa6bLoksbYzlE9zpGQnzIQqqSWJdYm5+nWQBlkLu/akYv+rInq0/kYbt+ZDaQs0WlWmu/7Vb4LnqLRWt2SDkw4NnlmIV5Cn7c764iV2s0vg6b+hkr1xppu13J1ecIOy1wN8ByXYszBUtJecH9ZyChQd7tv110taeoIVWdcr9RNq6rYfq8D9GL26+qnNeLFceNt3/F6rm00XC0hnJu/bXCc7PrjFoDDYVsHiVe3OHUcqpKDuCIwVx5dIY4vPEtE5ba1Wjxu3VzdoDgwnOTtl9nVOdCkK/VblD16Q0qbePq7Tew0JcrefXeID0/eum3QZR9Q2nrkxPHdq6RZw479jEBVw7n0BNJJ4DWZI3+Ojs7VdlLYqsI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261021135927099003)(261022105027099003)(10067099003)(56012099006)(261026140227099003)(18002099003)(22082099003)(261026121527099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGMxZjhha2ZBTmwwNmQ5YmZ1Slh2dlhBQXBjMHJOL0ZNMlkrN0IwZFFnYmds?=
 =?utf-8?B?a2ZHTjNnb2Q0a1g5Z3RtRnJ0bVl4bTA0djVQY1ZHak8zdld3c1VnZm5KSWsw?=
 =?utf-8?B?MFU4NXRDaWFlUkpPeUxCeHVvT2RMUWs0TmRCZUc0bnREMlZsYnRCR0RQUmxQ?=
 =?utf-8?B?OTZSQjJ3M0lmSkRNdjZBY0ZHUERpSTlHRENLcm5jU08yaU1IelB6b3g2bWVz?=
 =?utf-8?B?VjlQSW43V0IwK0llTmFyRzczQWt4TlVrT25IeHBLZ0pja0k0NU95VkQxMGlk?=
 =?utf-8?B?bWkwZlFKWW9JaDB1MFhaVi9jeDMvS3hjeCtXV1FvK0tIN25pS1paZUNURWdk?=
 =?utf-8?B?T0o3S3cxdEZCSUY2RU9MdjlTZU9RN0tOVHl0ckJrNk5WNDFyazV6V1BXRjFN?=
 =?utf-8?B?b2xvbmdpRm1ubDFuamh3REhUQ0k1K0s0aHJPNXlRMFEyUHZHNnllVzd6c2hE?=
 =?utf-8?B?N2l4Mm5YNzNNV3d0NkhiTjdyajZIbnMzQTJtOXlRREIxSE1ueHlwYzFBK0xr?=
 =?utf-8?B?Vkt5aC9jZm45MGhrakpER3VNQXlCbVNTRDM1NnR0MjdnY25Xak5PZ1FtV1p4?=
 =?utf-8?B?RDVTRitqS2lZYkZ0N3FsQ0tlNUpDOGJSRDhLd1R4QTFLYnJjOHZDOGJOYTlD?=
 =?utf-8?B?TFVGdS9vRk1LK3lWT2JPZENTOTV1dTZHbkJUbXMxMFhoYlNQQ2lXL2VHa1hu?=
 =?utf-8?B?MGZkNlBNY1pRMko5b2VaQllFclpxYW85KzZuMU8zMnhvNlFMWkU0bW9oNzRK?=
 =?utf-8?B?TU85cC82SkVjai9xL2R1WlI0VUh1b3I0Ykx0WGZZcXRzdG54cy9jb3NjcnBy?=
 =?utf-8?B?ZGdhYWRMZ1ZOd0JoOHRnL2FCL2JQMllHdEVJMkVDQkRYMlJrcTBad2dESXNO?=
 =?utf-8?B?ODRlMHhXdVhXeVNtVVQ0bVR1OGhVTlFDbHN3enBSUEp0N2gwZ1ZMQUNkUXF4?=
 =?utf-8?B?UlZMeFFHdW1vcXVKUmg5UVpnK1ZSVEZzUGRQTG5wTytVbUJtYzhlOVZDWTcw?=
 =?utf-8?B?a2ttUm1weEhEZG90dEpiTTBtL0J3OFVEODI2OWkwbFB1UlBuaXF2Y3hzc29w?=
 =?utf-8?B?S0JpN2FEN2c5MzdkVUU2U0lPc1ZXQlRkWmlDRFpNZGQ2MHM4UTdPWUlyeW9o?=
 =?utf-8?B?NHp5a0dJZGxSanZQWHNJSjloOFpwdWwwMEE3K0FXTjJOWlNQc1pjeTRUZGZy?=
 =?utf-8?B?bGNLdThEUkgydjBvMmVzekQzQXZlaXdFaEUrRm5rRjh4ditDOU9PWjk0Mmc0?=
 =?utf-8?B?dFI3MEVrV0w4bE4yWkh6SkRNdXJDUHkzcHNpU2ljUlYyaUtGakZLc0FwVWxu?=
 =?utf-8?B?TWhTZjNnaUh1ejJDbHdndUxYTFdvRWZFbC95N2xoUkZoVytLVnFwaDhIVlhk?=
 =?utf-8?B?dDJNRTR5bEZtTkhEaHFhcTJoU2FUWmNuOEwzTnB1NStjMk1ZaTBJN1M0Q205?=
 =?utf-8?B?SEZGYWtzOURZbkhEN0crZEpaeEd2MDBWU3M2b0FwTUtkanVpZ0hZaXV6ay92?=
 =?utf-8?B?Nm1DVzZRTTRrODBLeWhhZ1pDdWE1UzVMdmNWcWxKaDFrMjZpdmFnaVNXS09Q?=
 =?utf-8?B?TERLU3V0cS9uT043U0hsYVFYZWdYZmNQZUVCSlMwOTVtcHRHYlhwM2pabXM3?=
 =?utf-8?B?Nm4xdmpDMWFTWU95QUtYU2ZSYkRrTHJNdWNzMU5SSjM5a2Y0S3NiRUFJOXEz?=
 =?utf-8?B?c0hKRThEQVFCeC9ScVlmaWlXdHQxVmhneTZOUHkvTmZhZnMxVHRtNFhIam8x?=
 =?utf-8?B?TlFremd3VU9wQUhMamdVb1BZVzVEeEZudnY5OEt2MnpPRFFpZ0xURjJYRk9J?=
 =?utf-8?B?WlpMYi81Rm5maHB0ZTE3UkJ2ZkhGUUFFak9hK3p3WkxHT1pCK0x1RndEVXhr?=
 =?utf-8?B?T0RxdjZBT3ZuME8yalFUdk5qWGdCd3hrQkNsRldUZXRRZWUwQi9wckFHZ0lo?=
 =?utf-8?B?cnpUMUl5VzJyMlY4VlhpUmluemdZVkZZT2dCQ0hyTDJtdFdrbXBRMzcyUjVy?=
 =?utf-8?B?aTRBOE1xOVhha3pBNUl6d0U4VkZIbTc0b0VJUzFFZjQxWEM4TDNtbUh6bWVw?=
 =?utf-8?B?VllkS0lYVnV5Qytyek9sZTE4NXkvS3Q5R1V2dUhIWmxXN1dWWHFoL0tOVTNl?=
 =?utf-8?B?T2czZ2V4SE1CNzUvQzJnNmVramxVOS83b2RGRSt0VkN3a1NxeGJaUnVwNmU5?=
 =?utf-8?B?VFF3ZlRVdmVubGlmVVVFejFzL2hrMVRKcmR4ZUt4Q0x5TjhXSHRJZ3duUUVy?=
 =?utf-8?B?eFVQSS85MzJpNVRsaXNSSWZFL2o5WGZMMVZSYmRYZHBVWXZGVUtpdjRFa2xr?=
 =?utf-8?B?b3FqQk9raFVucXFtZ0lEV0xRSkVBNmoyT2x4My9XVjB1QTZURG1yUT09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f47573d9-3d74-4e4f-ebb9-08df33737a6e
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 15:11:57.9778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bTnI2irwpP0dJorXY7R7nfUDRyJ/wrAXnWXbBGS6ouB5/h3ES6ktDGAAUp1BuKsZbwoMbJBZJdqOl98S7MklKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P123MB8345

On Wed, Sep 30, 2026 at 07:35:17AM -1000, Tejun Heo wrote:
> Hello, Aaron.
> 
> On Wed, Sep 30, 2026 at 10:39:58AM -0400, Aaron Tomlin wrote:
> > +  flags     pool flags (bh, draining, disassociated)
> 
> bh-hi is missing. Also, the pool line already has a numeric flags=0x..
> field, so using the same label for these is a bit confusing.

Acknowledged. In the next iteration, I have documented "flags" as the hex
pool flags field and renamed the trailing state indicators entry to
"state", including "bh-hi":

    flags     pool flags in hex
    ...
    state     pool state (bh, bh-hi, draining, disassociated)

> 
> > +            bh_type = 'bh-hi' if pool.attrs.nice == HIGHPRI_NICE_LEVEL else 'bh'
> 
> The busy worker loop computes this again. Maybe compute it once per pool
> and reuse it there?

Agreed. I have initialised bh_type = None once per pool, set it when
POOL_BH is present, and reused it directly inside the busy worker loop.

> 
> > +        for bkt in pool.busy_hash:
> > +            if incomplete:
> > +                break
> 
> After the first bad bucket, this and the break in the except below skip
> the rest of the pool. Maybe move on to the next bucket instead? The
> warning still gets printed and the busy workers in the other buckets
> aren't lost.

That makes much more sense since each bucket's hlist chain is independent.
I have dropped the early break at the top of the bucket loop and the break
in the except block so that iteration continues across the remaining
buckets while still setting incomplete = True.

> 
> > +                            elif worker.task.value_():
> ...
> > +                            else:
> > +                                w_id = f'worker[{worker.id.value_()}]'
> 
> Only BH workers have NULL ->task and they take the POOL_BH branch, so this
> can't be reached. Can we drop it?

Yes, this will be dropped in the next iteration. All non-BH workers have a
valid ->task (and any lockless read fault dereferencing worker.task is
already caught by the retry loop's drgn.FaultError handler).


Kind regards,
-- 
Aaron Tomlin
