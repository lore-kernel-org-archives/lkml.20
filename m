Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022104.outbound.protection.outlook.com [52.101.101.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8745A0ABA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788989218; cv=fail; b=gLJep0LhB+xO8G+Rb/L58+BIT85Rk3tpcNCLZ1ACcxMwm7Y+5+m4yWBTSV30CvLTozVFLu8ixk/spgRZJZpbeiQfiQjjqM5/by/EFaAFjwumBIW4Jb71pCAe05R8/siY5L9QlxKUg0ULrQcWVDtVRPwA/Dfx2xa4U71cjeSNzmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788989218; c=relaxed/simple;
	bh=86MA0tFX+iE0g/2dMz4IJk+2ZYtQGtDXmG8r/KtnDKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lXiR0j0jlLoVgtpFPRBEKGZ4Esczj0PVH4Bn2xscZJQSJZJ9p2IFCZihz+5sC5HVeKj9Lnsu+eqUqywIx3d+XxIQnyVbHmmYaphLMkm10xZ3Pz4pDzUSh5wivsJHZDBvKnBLOoxbDxBGu70E2LQ+/lq3VBnri4hJoJib+3KmaRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.101.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfkSgiUiS5zOhvhVOWM228qnhD5aAAYPEO5Xxgm8GlYcYZ3Sqpj9OP6wbMO7Xbzww8g2mM1qtcQfzxlkqdABWpDyeuBxvB+TIhDPOzCKv1+o/d66OF+Xk/z6zSaxgREjDQ20Pf+c69GH2h8t6OQz1QlMNTbs2ZZMdW1w3fkkHYd5+Go3Vzp99G2Sf8wIVcMXDBlWIXM+NM7lSzICdh3rzeyVA4pWU1Wzrivv6XOGM7pEwqTBnRgsNz3odt/FmkK+UxWspEtiDTfFB3TE8Wfp/yjWIYZX+2DYDhnPUzQrh6Kj98FYPmvTSo3NzYZDg5uWnsIcEMvdWgZ88kL5V6VvEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=6Xf86whumDueIROSrhLgCXaGH0zHAyRHZLJVOf0nuuo=;
 b=vOgXDpTL87DlRDhl/lfF80hgQKeJ0BjtyPurDfrbzHA9VG35zIezA6LU/wXI0Cmx67PvbTIUNgGOH0Z4dQj4zBDW4RHZiZ7RvsnRhwqGe55UmQUF0rNd1KmQtTpokjqRqDKfPOSVyUwGmwRNtU3QeLEJxCB0YLMQSzXiRUJFNM+R1H5N8HxKaj9R5A3zEsV003FB7Pbb2YbSu2i1JxLLNxvagwEOOBzqEAZsEVIXAzP53IGqJpGosR8eoj6U7wiMiUnuXzjYWdeH1hyj65kA4oe6AdHTkvAtuegKLuUrUDO78fJ2drfJLrVzEy4SfSAvC8aNyHFjbK+t1u1bNYT57g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LOYP123MB3488.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:110::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 21:26:47 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0406.007; Wed, 9 Sep 2026
 21:26:46 +0000
Date: Wed, 9 Sep 2026 17:26:42 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, kprateek.nayak@amd.com, tglx@kernel.org, 
	peterx@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/isolation: Prevent out-of-bounds read in isolcpus=
 boot parameter parser
Message-ID: <lthk2ykbvh6wef6arzlhpquupesg3wzacrsdib7d4skw5jy667@6flolvclefda>
References: <20260523210214.593704-1-atomlin@atomlin.com>
 <xhsmhh5n81310.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <xhsmhh5n81310.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
X-ClientProxiedBy: BN0PR04CA0157.namprd04.prod.outlook.com
 (2603:10b6:408:eb::12) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LOYP123MB3488:EE_
X-MS-Office365-Filtering-Correlation-Id: 34a85d6f-7118-4cc9-cb22-08df0eb90d60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|23010399003|6133799003|3023799007|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	S11EqxS21/+eXllPyhVI0VAgSQS0Gqk4Zui7QitJgLk/56fu7spMuDkeNJrLnnIfGPvJs1D1xo4U9sn8vUEZLssf6zcvqbyZsMSalBCPD7IPO9/umVcV8EyAaRwFeO6yHvXTfew73WqwMCUApeoLUd7bFR5FmTyE9j1Bdeu0uO4/GggRu0HlYWiNQAVRYQBRXtj62+EEXmSDpTGczSQjq9/7IX9LwXYB9SbMlzTwUTwRC6V1bFMO3Xl2DFektBI9KfVGuEFwu0rH5Hzhl1LQqCG9Ygc3IeWnfQ6HnpQyFmE1v2jzBzaG+If+v8Rnf8562ZOPDzBwmCh70OEpiL5mD7Ot6f2GjTffIXvfwJLasOrYZckVzYAzsXJrFqdnzl/mFvowYFRCYgeszYgpllY5idpDx4B8RpGsdjsCjyL+4RYkwHRCyI7NLn1t1SpB1ghVSPHhnynkvFHkz4XstIj54B1LSrNDvyA44dqbV1vWEa+1taqmrnxX971KO7APHFnGKCSE3Gw/ze7F7APoJrSCR4yzcFh7dp/d+616iZNG5K5zR3D8Ej8nWeZYEiHo1tT8SVJxPBF7kmBsADQJDDG2SVsGACHtdzO0qcgTHs9icLF+pbvEPBEVxk9tt7wsdTWwE4o1quwbvyN9K4z8tT0/hPbMjMC8qYQdoMyhSLEElKA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(23010399003)(6133799003)(3023799007)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1JSMi9TQ1N2Q3FoR1pGV011VzhmM2dRQ01kQkRwdjhGZ3FUTE52YkMzWTdT?=
 =?utf-8?B?RThDZXdkeXZ1TDRkbnNwQnlaSjFQcXBCUFg0dCtXY3Y0aktRaHNWVHBuYlJm?=
 =?utf-8?B?dWl4MHQzcVJZejlhTTdFbC9uNXluVXRqNDBWTHpsNEVJaHh5bFlCUWJFd1U3?=
 =?utf-8?B?a2kvRm4wSXI2VjBxUG9qTkg5VmJ2VVZpOGJqakJ2L2QwQ20rbXpUb3FFa25F?=
 =?utf-8?B?anlmZ2dHQWdxQU1VY0xNdklhWUVKUGxtS0xPck0zRkluMmN1MzJOSlRsL0ZG?=
 =?utf-8?B?cDRaM3hJc29yZDdmM1IzZ0FBTzRVd1RxTmU5MXdSM1RNRnBpTHRSd0R6VHM5?=
 =?utf-8?B?R1hZMTh5T3dTek9rM3J5SGs3N1FCTk84L3QxaWJqcWh2Rjg4RjNmK2xLelBG?=
 =?utf-8?B?NWpXc1QwN0xWb0drUGk0NS9VSEdSNFByL25yYlYwNTgxajQ3dFgxS3NsYUtJ?=
 =?utf-8?B?U0hiTmN3NytZcUFIMktvLytHYnZORTBRbWVqSmFyVWUxTFQvTUFtVE15amZQ?=
 =?utf-8?B?WjJnN0djaFdEdHdKVDFheUtZTGhweUFyUSt1Ym1uN00zNk1TeW0wdXpYR01H?=
 =?utf-8?B?ZHZ2cWxZWlZodjhJZmVBTkNBVEowYk1nSVhPZk94ako2QnFWTElQVFVSVU53?=
 =?utf-8?B?ckNVV3JQTWhYQUFsSG9XVU82SEpPRFQ0TTd4V2FIbjFvUE55OFlQanFZVlJG?=
 =?utf-8?B?NERFMXFKWlQxU0FoU3B4Smdnb3A0WmxXOEoxT3VkNnIrTUVUamh2U25nVjBy?=
 =?utf-8?B?aEt0TGl1R25ERFd5T3ErNUxyV1VNM0M3WUU4Y3loYUJXRUpPR3VvOUxRZ1dx?=
 =?utf-8?B?eUpIYWwwckhwbG5sWndnL2ZvT0hUdzluczluTzlFVERyNFRualBGbnZpbEZP?=
 =?utf-8?B?ZktYMzFVVjVJRmxRSFcrdEdKNTdQYlM1RWgwUnhGZlY3K0l4QTl2RUw3cy9h?=
 =?utf-8?B?Z1A0WU5tZjY1OWpCdUNqbktwdlBHMGI0MmVsTWhPTzNtc2E4aE84YmYwa2xw?=
 =?utf-8?B?Tlh1dThCU1o1cG5RaTdqeDNRc3pCZ3VuRjJ2MzFMditobXRJL0ErYU43QXFI?=
 =?utf-8?B?OUNnNzZGR2hIdWVIQUJjK2p5dVJRVUtkMkpkR3l3eldqZDUraURoL0xJZXo1?=
 =?utf-8?B?QTJzTHZpL08xSTk3eWFiU1JsRGdyT01QeHZ6S1BEM2szY2lmYkEraUVQejVS?=
 =?utf-8?B?eCs4UlFBS29hRm5nMHpoTytKT1lTT1ZYa2hXeUtRZ2FCMklJLzRFSktJK1dk?=
 =?utf-8?B?RzF2RSsxMkpWUnF2b0huWWF6RzlZVEJMNTd2T01sNmRzUkZ5U1EvcDJ0cHhv?=
 =?utf-8?B?QVRPT2tWMjd4cHh0UTNpTFh2U002N1BZaUxqNnpwdStqSUw1NGxlUVNqVzQ1?=
 =?utf-8?B?RjRlYzNxYjA0b2FnTzlZS3NnMjFPQnJVbHpIZ2ZJMjVjaHhkSGtwTFExclEz?=
 =?utf-8?B?MzZEaFcxQ1Z4Y05xeE9wUVJDZ2xQV3RKdmFhc2gzaWdFa0RpMWp6YUMvYmNO?=
 =?utf-8?B?RGVOS3FQM1RmMDRFM2NMWDJQUUVFZDlhTkVDU1dicDQ4dHQvVFdXM0ZsekNH?=
 =?utf-8?B?NzFsVFhDa2Y0Vy9iMnQxQ1RqbmVHbHc0bW8zbTQ3RDBGWWxTK1o5RkNYWjQ1?=
 =?utf-8?B?aTMxTkdLRUZuT0NUeG16RVJORzdtekw3dWVtRmRLVGxpOUk1cGV6T0EyN2ZD?=
 =?utf-8?B?T0lCS3hWL0dQUTFiWjd2L1lnclJvWnp1QzFQVzQrS1pNM2JSQ1FzVGl0WXdI?=
 =?utf-8?B?VlN3aFArclFWdEpEUkY5MCtMRGloakg3RFY5QktlN1dCMVlEakZDM3MwVUVB?=
 =?utf-8?B?MEMwd0w1dkM2R093NW9OUFlLU3NqcW1UT28yWmJGcEVLRHEvQUxEZmMxYlk2?=
 =?utf-8?B?U3hDN292VFYrc0s1WW9KZWsvbzFNSFZhT25jZzlyd21jOXZnaXp0K21mVFdH?=
 =?utf-8?B?R2U1YkZFNHR0aFhhVkt2dHh5QkQ0UjUwd0Y2Zk9UbmUwaWYvbysxZXpobWw2?=
 =?utf-8?B?KzJhSmlnUDBOZ2dlazlUNHVScnE3SFdUZUFuQ3AydEp2R2RsZEptTGZtSVZ1?=
 =?utf-8?B?T3hnWTBuaU1NVndQcmdhSVFWYjViYWxTdzJDcll3SDVuOVhCcDQwbjVMcVgv?=
 =?utf-8?B?Qmt6QzRDT3ZOZmVseHZOZS82d0N1Y1Iva0dmcmIxVHd4L1pMK3VlYlJLdnhy?=
 =?utf-8?B?NGRnOTFYbUFOYWh4YTRiMFcrN0c5c3FYNTBBaXhvTUcrUHdXQkh2RjBPeWpJ?=
 =?utf-8?B?dHB2cHVwNGFibHNsMlNUUVpudUJYaU9FeTFHUEg4Y3dhcEtFZXc0dlp1V2FX?=
 =?utf-8?B?YUtWRVpWRVoxMUNXSm9WSDljL2xmazhTWlY5RmtZZEIwTS9WWEtlQT09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a85d6f-7118-4cc9-cb22-08df0eb90d60
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 21:26:46.8147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YXw5rivYMwiEPrUGBhI5B7ZQ8oP4t9mlIR0gR+wSNVMIlBBlmVCklkQpFwz3c3vGncUSmBCKUxPmzEaN2cn8jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP123MB3488

On Fri, Jun 12, 2026 at 12:11:55PM +0200, Valentin Schneider wrote:
> On 23/05/26 17:02, Aaron Tomlin wrote:
> > The "isolcpus=" boot parameter parser in housekeeping_isolcpus_setup()
> > contains an out-of-bounds memory read bug when handling unterminated
> > flags.
> >
> > When parsing the boot parameter string, the logic expects flags to be
> > comma-separated. If a user passes an unrecognised or legitimate flag
> > at the very end of the string without a trailing comma (e.g.,
> > "isolcpus=unknown"), the strict strncmp() checks will fail.
> >
> > The execution then falls through to a fallback for loop designed to
> > skip the unknown sub-parameter. This inner loop consumes characters until
> > it encounters either a comma or the NULL terminator ('\0'). When the loop
> > terminates due to hitting the end of the string, the str pointer rests
> > exactly on the NULL terminator.
> >
> > However, immediately following this inner loop, the code unconditionally
> > executes str++. This advances the pointer past the end of the string
> > and into uninitialised memory. The outer while (isalpha(*str)) loop
> > subsequently evaluates this out-of-bounds memory. If the adjacent byte
> > happens to be alphabetical, the parser will continue reading garbage
> > data, potentially leading to undefined behavior or boot anomalies.
> >
> > Fix this by adding a bounds check immediately before the pointer
> > increment. This ensures the parsing loop cleanly terminates when
> > reaching the end of the boot parameter string.
> >
> > Fixes: 3662daf023500 ("sched/isolation: Allow "isolcpus=" to skip unknown sub-parameters")
> > Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
> 
> Reviewed-by: Valentin Schneider <vschneid@redhat.com>
> 

Hi Valentin,

Thank you for your review.

As there has been no further movement on this thread since June, and given
that the forthcoming revision of the multiqueue CPU isolation series
modifies this exact parser logic in kernel/sched/isolation.c, I intend to
fold this fix directly into that series as a prerequisite patch for v16.

While ensuring a bisectable baseline, the patch will retain your
Reviewed-by: tag, the Fixes: tag, and innclude Cc to stable.

Kind regards,
-- 
Aaron Tomlin
