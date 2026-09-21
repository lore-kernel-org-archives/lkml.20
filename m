Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012018.outbound.protection.outlook.com [40.107.200.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEB72C11D9;
	Mon, 21 Sep 2026 06:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789972821; cv=fail; b=Al07sVLJCKEZLE7Jo83Gg1K55c+XHuhVJXvNZDWpmpcGdvjApRSqJf5LunCdJ0prYFSzf5J0gqF4hLxJoyal2c6/Lopbeg1l71zdJJqxc7VUIRHFBVjRIFQMrtbXU+zW+48sWTj4fCzzgWKBcAInfeFk2+teBuJcd0Oit/mUomc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789972821; c=relaxed/simple;
	bh=dITOFR7PDdhNNdYMkUQ7K+qP92Mwp90+Hp0cmoTJUEs=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aUSHWg/brKu0BJN5eav4rahvU+3+jG9hsnoX59z6oMPc7EKn8EzAlEKcf6QC6f39sa3Xq79g5u0jtW0YtQvX5/rlGDf9/09CJ9eAUcX++1UVl5Pd6svQ5GDeiKUvZJXHpRXQuhu9fnFEZkNNacfqy9coeS3djjAto+2WbCPcIqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Y4CPi8mp; arc=fail smtp.client-ip=40.107.200.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Y4CPi8mp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7izwJbRPSD8huCqTho9DpoaQ3e+nHyrmPoGDDuGQ0lH0XecmRCQOkjCa/mdRfO0ZSCHka5Gk7UcTBWFeUgYF92X+ZfzjlNQuv/PVeqq4IHUtvIZj0HhbwXSeOgRhJtf1A9yzEHBnOl0oHTgUnt2Z+79FqDz1xn0XGq26eWfhQuYJs9Elt+svyyWTmNLI5qcGRLVoSlH1Q6qUWVD7oC4GHPLbVHTKsJVrljvvBCbJDFScSpwLdfUAv37QkVeo6AjipC208/nkdYn2Lb2yZx6tNll614wxxPvu6T+WsxHOUUVmAA2c+ImNqBd4zqaCXXBKuvGFGcmz+7IoF6y7O6xHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6kySTsP8vV9/dxK8KPEdvHotJRta/vYzUtrr4a4PgI=;
 b=GqWpUQVot0E7dmGdlSHsAm1blKPKHJMq3VfOA757rrpEG8cobOxmyMtn5vkb+cWTdpkvcANh7SBx1YIlgEoV+LbVSUSmWoJFuPFLxKyQ3UHsAjBQ/kKdy8WabcnbqZ8dl4NXuOKR2KVAt9OLB8j8lcw6gdr/sBwey975X2v+QA25y/Y7WYjNTCiREQeHLDjBNWc3ADSlP06uaW7XNBulh3Fv4ZSb8ORLw/wLzCMsiuwnx7CB4kyQvIQH3gYFopvQCWCWxuGQwgykHicTvUadqHDseeGJMU8XEXlyj2eq5t4/O8BPV6MxKhXLPWVKIf77P13cSah3+8xpNDvbVtq3Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6kySTsP8vV9/dxK8KPEdvHotJRta/vYzUtrr4a4PgI=;
 b=Y4CPi8mpLaSnEh3yrS3kwbMwzj3l7OeuYh14A0JtajgUPKusfDTwCezociMC24yRt6WYsRDD0ZOx7vrJaZCtCR6+rt4x6Qmhp6U9UwXx9YzOhJO4qmF4cKpRRDPtzQQF7UatNbicj+0wF2YjNBqUyEAHYES2zX4aSyXWtP/ekXBl7qPw3OTfBaB/XGUY1AATfdfuUO+2lrsgQz1Iy/YgUdebIfPRNgOkatQNv8NI7PC0+RcBgSJIlGnX1t5ftbXvJIZIuG/eC46YCDdNQdYytN5XwgipLwt0rNTgptvB4au1cAG7xBSrEIH7e6rLmbg/xp/2Ef12eYCwzVCG6ynCDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by DS7PR03MB5381.namprd03.prod.outlook.com (2603:10b6:5:2c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 06:40:17 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 06:40:17 +0000
Message-ID: <a7641b0d-ff7e-451f-834b-23514e6789fd@altera.com>
Date: Mon, 21 Sep 2026 14:40:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: Fw: [PATCH v3 0/4] stratix10: Add Interrupt support for
 asynchronous communication with SDM
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mahesh Rao <mahesh.rao@altera.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1786600929.git.tze.yee.ng@altera.com>
 <SJ0PR03MB5950C6799C40C5724B048197A1842@SJ0PR03MB5950.namprd03.prod.outlook.com>
Content-Language: en-US
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
In-Reply-To: <SJ0PR03MB5950C6799C40C5724B048197A1842@SJ0PR03MB5950.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|DS7PR03MB5381:EE_
X-MS-Office365-Filtering-Correlation-Id: fa92de36-18f7-401f-96a7-08df17ab32c2
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|13003099007|11063799006|5023799004|6133799003|4133799003|10067099003|4143699003|56012099006|55112099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VHxK/M86LSAd5qLlCwIaWZ3VkmRF6onnF478NfuMN0/AEvFEU3dmgGaL8totlKEn510mGQHA6XhdciZWKxDQR/HVcAvp6A9hgO12vH69s784JnjeKpH8AZyAcL8X4PwDg2xuK0SALYsmyGR3zdXivOqEK+uu8p5jfOUVIrk0PVWcqalq/OgP/ORqLziBLmcJlT6ShDRsrgG4jVS2TB5REL8vmuT7s9b6j8X2WHuzYqXzAJogxAUzjuGAvBMwqmwZwYqfJ3tfGoUHV+DCG6zqFa2P0lAO+jzPcDlbr2dm4BTauR5wXKRGXT8GaJcRpDZ0RIrKVcdAsLdNhBaa1UokNPMalSt8WKvsaiZMHa+0r0SgEM+ANcpqMdBkLJ7td/hAga66yhBItkqtC0d6U5pqIQTMUai3FK24FP0tWnlGhhqHe2oFREu/8LjNEoQu5S85oNGBatpuxMUGAZ5FbR+cya36W9LEblPiuVbpjyDnXunaHzb2IuFClYa+MKBpSR+hRqNhWmyXqOcOglZ9JnGb5kcBtZ28iKTicJvzx74H+pbaS+4RM0ogFcSOvKcHtAdOCKrJ0hpN3MfiXxfouC+H6xT8e+B74MWEBwa+kV/aUJ/dODZNajm4sqrjiJ2eAhV3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(13003099007)(11063799006)(5023799004)(6133799003)(4133799003)(10067099003)(4143699003)(56012099006)(55112099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjZCRngxZkp6VHFFblptQnpoZ3d5VnJVTEJjVnp2NXRvTWxQRlFQMXRMaDdz?=
 =?utf-8?B?ejBpamdVMU9veFdONlVkTkNyWmQvVFpzaE9VMDltSURsWTdkSy9qOFJmU1Ry?=
 =?utf-8?B?RkE2YitlTlVEbStNdHRZMHRTUXZZc0RXZFRKVnRNNENxY2QxNlBibDVOU01n?=
 =?utf-8?B?Y21jN0ZaRGpFeTJpY0RtRHl0Rm05MnNOTEhHenh1bjAxOEZjdFpYVjBKRjNo?=
 =?utf-8?B?c1VoU0t0RmxpZzlzTzcveVNsRUZuNkhiVTByVFZSSjZHSngxVkl3bHhORUZu?=
 =?utf-8?B?d0dmNFdCKy9INHNnWHZNVzI3VFY3NTF0MDlyVWlxZ1pscHEreXpISEwzemdT?=
 =?utf-8?B?cDBDN3U5REpoamVqMVhqRHNFVWpSdXp4RG5qNVNrZ2FjN3FDdTUrOWU1QnVF?=
 =?utf-8?B?SGRxbnZNdy90dzhJN1p6WGV0ZlBURFFOVk8yelNaQU43bmR1c2xLOUhkSWkz?=
 =?utf-8?B?L1pMeVd1Uko1MC9YR3ZOeUhGYUQ3emNubEdadXdMRStqbFdjV1NqRlFFMU9R?=
 =?utf-8?B?UHZRZ1hjMXZ2LzYrWGtsWEFjVGdJZldwcG10bkJZbElWRW9SUFltWm8wOUt2?=
 =?utf-8?B?MlBWU2hQbkJPNUxUemZtMEFXWkpWNUJHeVNHOVRIV0FVY3Nuejc0YzF1Y1JZ?=
 =?utf-8?B?b1hhRlZza1dCdTJKOXZzdmhYamptM216bTJWcXhCNnIrN0Y4TkdzWnMzNUxs?=
 =?utf-8?B?ai96NWdQY085YjlMQUpab1ZhVDkwbjJVYXNCeXd2N3ZtazcrOFZERHdpZFNG?=
 =?utf-8?B?TnRwbnBVRlMyck90UVdrRk4zQjFXVTF1aUlmcVNsYnI4a0wrQll3NFgvR00w?=
 =?utf-8?B?RUFlVnBhekRPQmhNRktkMlc1YUdLMmk0NXkrWlBBbHkveDBtMnQ4dFNDSTBI?=
 =?utf-8?B?ZUN4RlN1MTdkejZWeEJOa29IbVdVVFdVS01Nc01JU3ZXQTBOUG01OVBuTGtJ?=
 =?utf-8?B?MFBWak1CUHdTY05QRHhyeGo1cHd6YkY3L2JidTRRK1RheFEzc2ZRTUU1UGIr?=
 =?utf-8?B?UE55cFJyTDMxWkJFd3dnNE52U3R5RzhETzZlRUYwMTNRQ1gvNVlSVm1jR3Zu?=
 =?utf-8?B?T0JtK0ZpWFBJTjVVcGtDUDdRQnJHUmdYZ2tmMTlMZFIxNEpGczY3WWVqN2Rh?=
 =?utf-8?B?ak92WE0zWHludnNPeEpieXhCbkFGVFBaZCtOOVNPUzNuM1RKYzJ0TUltSWVE?=
 =?utf-8?B?MkxRanVPcmczMjZVQTFFY05SdkNGajNubGgyeHdXcmo3L2lZa1ZtWFVkSytr?=
 =?utf-8?B?RGU4UVYyblo4Z0thUGUxc0Nza0hGemRZMm4wMklNaXVnZWYzcTh5UjJrNTJY?=
 =?utf-8?B?V2htbkcvTjZwRmNtTWpRN2cvZkpYNWpYS0FUR2tjaVBVaFJxQ1JZemN1YTJa?=
 =?utf-8?B?eEFEWnF2L0xkKzFNbDhibFJ6Mjl3Z3hXRGVCV3B2RDlLTGtCb2ZHWVMyNVk0?=
 =?utf-8?B?WnY5anlSdEVKbEpqVWJEb0pJMnQ2aTNuQ0gwcUk5OGdqZmVtOXlWR2crRkIy?=
 =?utf-8?B?NU1RaTJCTmNJMEw2VEdOOWU4ZGtMVGJRbjVRZnVWTk9mbVdKRUVJR0FNeGF0?=
 =?utf-8?B?dHdXeXk5QkZ3NVdSYS9SblhienljSWtMQkdZd1lnNlllbWs0b1dWMHhUS0h6?=
 =?utf-8?B?N3JPRWdUMDFqc3cyWUNLbG5HbEtra2NCcFZrcmdhb3QwUVhrMjBIUkRXTVYz?=
 =?utf-8?B?MGd3ZHVIU1dkT2Zjb2k2WHZJVnIwS2JTTVlKT0hUdEF4ZGRMOXFNZXM1Qkl4?=
 =?utf-8?B?UTBkZHhDNFB6R3ZWQ0RSNVh1MDRrS09ab050Szk0bzYwRW9odE5hTGNBbHRZ?=
 =?utf-8?B?NE5YS2Y5NDhFbWQ0R00xODNwdGZtM2ZxTGQyQWFsWHRaVVVXL2E3MHMyenhv?=
 =?utf-8?B?ZXJDL2ZVSUo0RGhpY1FMZm5TZHRjOVl6cWUyemtmQ3B1dWdWay9JOVIvM0lT?=
 =?utf-8?B?YktCVmh1L256Wm9oWE1DRHpDUTdTWkZNT3dMTjQyeDdsWkdKMUVkaUZybHJ1?=
 =?utf-8?B?QTRDRWEyZEg4czR3dmVsVHNhbjFsck5Kc09XVTZISGxHeDNPcGd5bmQyL1dr?=
 =?utf-8?B?Y0o0UnhnQ1hVQXlrQTFvNlpyMWZnUlVDT1RPbGVGSEVIaHRxU012b0JjS3hD?=
 =?utf-8?B?N083U3lDTlg5Yy9aa05GTEpWMkszWEhEaGtYZlIyS2V0aDhXNlpCVm0waXJX?=
 =?utf-8?B?dmJHV2RzREhTbVJFa0xuREt0WFFJNzBPdGcvS1hBeHArc3QvU0FWRWNYWGRO?=
 =?utf-8?B?bCtObVVyUkoxQW8zTEVzWXBiT2FoN0pFYUI0Z3BzaDdzWlNEdWpSMXN0NVVO?=
 =?utf-8?B?NEFvY3JyVUtBVi9Zd0dRTy80Lyt0WFZoUlpQdERUMkFzL0tkdDl2QT09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa92de36-18f7-401f-96a7-08df17ab32c2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 06:40:17.0920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9rlpr4eCWJP3XekakyyZvqYZnFHUJ7CdfQG8ad9BokIAz6YFMEBLY3C8ZomvJiOwHrNhi3YPyUenkOQjb4k4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5381

On 21/9/2026 2:37 pm, NG, TZE YEE wrote:
> 
> *From:* NG, TZE YEE
> *Sent:* Thursday, August 13, 2026 2:35 PM
> *To:* Dinh Nguyen <dinguyen@kernel.org>; Rob Herring <robh@kernel.org>; 
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley 
> <conor+dt@kernel.org>; Rao, Mahesh <mahesh.rao@altera.com>; linux- 
> kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; 
> devicetree@vger.kernel.org <devicetree@vger.kernel.org>
> *Subject:* [PATCH v3 0/4] stratix10: Add Interrupt support for 
> asynchronous communication with SDM
> From: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> This patch-set adds support for interrupt from Secure Device Manager (SDM)
> to Stratix10 SoC for asynchronous communication.
> 
> Following things are added in this patch-set:
> - Add support for interrupt from SDM to Stratix10 SoC.
> - Add documentation for SDM interrupt in Stratix10 SoC.
> - Enable SDM interrupt in Stratix10 SoC.
> - Enable SDM interrupt in Agilex SoC.
> 
> I am taking over this series from Mahesh Rao and posting v3 on his behalf.
> Reference:
> https://lore.kernel.org/r/20250812-sip_svc_irq- 
> v2-0-53098e11705a@altera.com <https:// 
> nam10.safelinks.protection.outlook.com/? 
> url=https%3A%2F%2Flore.kernel.org%2Fr%2F20250812-sip_svc_irq- 
> v2-0-53098e11705a%40altera.com&data=05%7C02%7Ctze.yee.ng%40altera.com%7Ceafe6fcdec264d130fd408df17aad714%7Cfbd72e03d4a54110adce614d51f2077a%7C0%7C0%7C639255694657134969%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=hOumheIvzlbZt1UApZy2F9CCpJFiH25iWSaYeCcdjKo%3D&reserved=0>
> 
> Changes in v3:
> - Reflow commit message body to ~75 columns (fix Dinh's comment in v2
>    review)
> - Add a newline before stratix10_async_workqueue_handler
>    description (fix Dinh's comment in v2 review)
> - Treat of_irq_get() failure as irq <= 0, since 0 is also a
>    failing value (fix Dinh's comment in v2 review)
> - Fix IRQ disable race: only call disable_irq_nosync() when
>    queue_work() newly queues work, and disable the fired irq
>    argument rather than actrl->irq
> - Do not invoke client callbacks under trx_list_lock; copy
>    cb/cb_arg under the lock and call the callback after unlock
> - Use disable_irq() + flush_work() + devm_free_irq() on
>    teardown, and treat unset IRQ as 0
> - Demote successful IRQ registration log from dev_alert() to
>    dev_info(), and demote async poll failure log from
>    dev_err() to dev_dbg()
> - Clarify INTEL_SIP_SMC_ASYNC_POLL_ON_IRQ kdoc to match
>    a1-a4 bitmap usage
> - Drop Reviewed-by: Matthew Gerlach from all patches
>    (no longer at Altera)
> - Link to RESEND v2:
> https://lore.kernel.org/r/20250812-sip_svc_irq- 
> v2-0-53098e11705a@altera.com <https:// 
> nam10.safelinks.protection.outlook.com/? 
> url=https%3A%2F%2Flore.kernel.org%2Fr%2F20250812-sip_svc_irq- 
> v2-0-53098e11705a%40altera.com&data=05%7C02%7Ctze.yee.ng%40altera.com%7Ceafe6fcdec264d130fd408df17aad714%7Cfbd72e03d4a54110adce614d51f2077a%7C0%7C0%7C639255694657165509%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=uDzBqNLWQSLSTmXyM72mbyHy5JfchKhk9a6xhrFF5pc%3D&reserved=0>
> 
> Changes in v2:
> - Separated from the larger SIP SVC upstream series into a
>    dedicated interrupt-support series as requested
> - Link to v1:
> https://lore.kernel.org/r/20250722-sip_svc_irq-v1-0- 
> c5b9e02c1ce6@altera.com <https:// 
> nam10.safelinks.protection.outlook.com/? 
> url=https%3A%2F%2Flore.kernel.org%2Fr%2F20250722-sip_svc_irq-v1-0- 
> c5b9e02c1ce6%40altera.com&data=05%7C02%7Ctze.yee.ng%40altera.com%7Ceafe6fcdec264d130fd408df17aad714%7Cfbd72e03d4a54110adce614d51f2077a%7C0%7C0%7C639255694657185496%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=dSLMGTCQPtY6nHXWwKPeen2XIuPzs1vZ6NKBcMYVwEA%3D&reserved=0>
> 
> Mahesh Rao (4):
>    dt-bindings: firmware: Add interrupt specification for Intel Stratix
>      10 Service Layer.
>    dts: stratix10: Add support for SDM mailbox interrupt for Intel
>      Stratix10 SoC FPGA.
>    dts: agilex: Add support for SDM mailbox interrupt for Intel Agilex
>      SoC FPGA.
>    firmware: stratix10-svc: Add for SDM mailbox doorbell interrupt
> 
>   .../firmware/intel,stratix10-svc.yaml         |  10 ++
>   .../boot/dts/altera/socfpga_stratix10.dtsi    |   4 +
>   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi |   2 +
>   drivers/firmware/stratix10-svc.c              | 135 ++++++++++++++++--
>   include/linux/firmware/intel/stratix10-smc.h  |  21 +++
>   5 files changed, 161 insertions(+), 11 deletions(-)
> 
> -- 
> 2.43.7
> 

Hi,

Gentle ping on this patch. It has been over a month with no feedback.

Happy to address any review comments.

Thanks,
Tze Yee

