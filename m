Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.196.116
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793319861;
	b=P0oCnSM3ipI/GULInIIVewXiDh2FA5xWy7eo5qzuwMMQtKyJn/+WjXmAHR0ezS5FvaPK
	 obe5wJ/G1uGFZZTVkX6b+1UI8FhUiMrPy/TI44g6om4ZGEE6aPDNFx/6BiE2DeEC0aFOx
	 aTrFu53S3O8F0Topenh54o0EH9yOyOxfWr015uwy3X14d+xF+gkSHgMR82BKXdIQfsdtP
	 iGeHXzWtwKz2ZJLzTGOig21xXSxpD+ndHlIjQuSX3WOE+a/NYKEVnwR0XEVec3aa7FpMw
	 cEYcuDw0HbFjKMmxY+RsAzCBd4ORfOXJ3JqlfrapMkF0S33gjzuKAZXAiXQ8eFrmCRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793319861;
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
	bh=QmUCJPrtc5lZo3VWphXUxNmvXdVebzeCi3gkPSbeSKs=;
	b=GmuOdSSuqFuJy/hf5YPa2eRaenMxrQtfNDCBgHrHqtuKshNPzlgFtgzg6KxVHLxKz0RX
	 jiFuZJfTLRkTshyOGRHUqNJ0nMev2PbGXAjMWtz9TTIaQM0WIde68HbEqZqbQkRuKngv8
	 FMeAKJVUo3gDIZsFdIwShK0IEZPWPkEjD/E6pajnQ6JqxeQYTkJ95vSkk1b1Vxho2d6zJ
	 7bJ0fgXGE6+bkYwELfywJDZ7GTjNALf60ONXPZWYb11ojxL3gpxJ7ykM5qjG3vK02uAwv
	 4di/p4COu96NvPggCRoqiAWrB7wUTJqrB4uwWzTA+xwuld8uwifT1kNgbeGLT+W58nQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.196.116
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020116.outbound.protection.outlook.com [52.101.196.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788BD606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 788BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VzwlX+KXqoYNvrCAeFvRC2o0DHFdjnEC9Gh5uDAsbwtT+4vGPWIDS/QX/OimKEJEpvMOn/1WQV7H3/pTH2Df4wBEdtCk6ZWqUJqEHx6bT4VaQpBzkcjeBqx1Cc9sT1rGSiIc6hixyigNVSRSrCm217vKHPu4sLZ9pDyG2qXA3tz/PxftFJBn+YaODXiP/6c52qYC9wHEiCsQi8Ce6jqFz0jzQ4L+5p8CvS80p4D1ti6pNHrl/u0ALnbhXvgAccp8VpXEniZuH381REDXF3MYSos2x6DWKQPvdTDtvExW04ZZxAiZOwWQ2DV30NQ9ODP1zw+0SI6D29Ke+/ENLI5aaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=QmUCJPrtc5lZo3VWphXUxNmvXdVebzeCi3gkPSbeSKs=;
 b=zCyJm2qNwgVUo3RIEjfjszIEdR70W58FG8eoMCKsTdTUA4mYEbIC+QSH8WAJkrhRfq5mGigliTzAqU419BJv9y0O7t7sEpKyOFWieG9v2qhFGPv8+BkOPSR/w3oCMtJGukaw9QTKZH2GMFnvc4llqheSevPigXo3Tric5elFVOoz7EAFJnSrHymhqnCnCUBoYvC2bBx5hqs8PnghKPLfaDH59/KucM5Sk/nJiQRhvQFjj1G+TE+UwCm3kkM96OK149V60AYf6QKnb4pH+plNwrzthfZKlGPKhi0cbI8xRljJjFYtvNBqQ5Ki50rIvPu99Dt6KcZuDKrY+a8wkTbd3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LOFP123MB221540.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:704::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 00:24:17 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 00:24:16 +0000
Date: Thu, 29 Oct 2026 20:24:12 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org
Cc: paulmck@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	zhanxusheng1024@gmail.com, neelx@suse.com, chjohnst@mail.com, mproche@mail.com, 
	sean@ashe.io, steve@abita.co, rishil1999@outlook.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v9 tip/sched/core 1/6] sched: Annotate rq->rd with
 __rcu and update lockless readers
Message-ID: <mxjscshwwd34odcuvjhxczdpb7r5yg6fclkxib4wssbdzrripa@no6umdael5cr>
References: <20261029132511.712391-1-atomlin@atomlin.com>
 <20261029132511.712391-2-atomlin@atomlin.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261029132511.712391-2-atomlin@atomlin.com>
X-ClientProxiedBy: BN9PR03CA0173.namprd03.prod.outlook.com
 (2603:10b6:408:f4::28) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LOFP123MB221540:EE_
X-MS-Office365-Filtering-Correlation-Id: b77e5238-5258-46f2-ab64-08df361c218c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|18002099003|22082099003|56012099006|4143699003|261022113327099003|261026140227099003|261026121527099003|261028144727099003|10067099003|261022105027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	EMvxQq1XaCEI5ZYpSwXmwKD0FBQDSw+Fv8R0KVvizjja4OMimpOhNoj0e20y3BZTUG8DAUp5MdmXjFYjJYTuSPNP67MwJHiT3uh4kpbX2WghKMS4vCyrmWo1nm/+g1dH51fVx85+1tJ2qqqS+9RCjD1ceBA8JpMEEeBsEXCLNSl7gnE9I2Ibcdb5S/Ci6iWvp4c20HdAJ8ardBzlUcpgxew3j/scBvpIsM7J0eVhca1dqKiGuoraYtoWhEL7iQmRALG4WXM6k5GlUd/GYw5rUo20FuH7QYr3M21nzhaFHjhn5EQEM6HdpSdIWK/XVefDmRRt9qnslgL2sgY9tiBrwzyjqpNIlCKl544Ch2PpB3m1BBCmNH/N1WS5QO8o7i9VhsERIDlhU0+qQsD0rHrfQk+GW+RLVIwQ7r4wc02Fzml5sTHlwCh+ezJkqUUGBfQ0koNWmtdXw6d6JLLWC7nojIk1AOea3bA+8e7zCHmKt72/NfKhHtCdLqSYwqSRil0CFjTICneEPOPV/lNyK/eylNZOaaibxvaCemQ8SBtCnVb/qr9PjY1LqKYrRpEj2D/gHnaoQAzHH6VxNYcs3vEx86uaKSG+msUTFuXspNxgaxBI5nfWI3AQFjvAgRyz9Gm7X65aAYRSrpo2ivtA74ZhE0JgdlEXbCqCmw0tGUWKeu8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(261022113327099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(261022105027099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXRVZnE0aVhaMG8ycHM0SmVyWVFUUmp4Wk1jbUdKbWdmK1VkV2NYQkNrQzkz?=
 =?utf-8?B?NU9HWVNIMkl1Z1gxdzM4dnZpc0orMFJISi9BNit0ME1ZK2JwaFMxUDF2WG9o?=
 =?utf-8?B?ZjlrdC82TGg5TTZFd2QySmFDN2UwZC9pcC8zT2RXdFludUxsNklicFJ3OXEw?=
 =?utf-8?B?djlodWg1QjJRSENDbVNKUVQ2RDdaZnNJMWtnSXVuUW1PYm9sWG9VamN2a1lD?=
 =?utf-8?B?dFZ4UmhRR0x6eXR3amRvVVdRQ0xKUEJtMkhmcUhlTy9WY1Vua0gzQ25IMDVw?=
 =?utf-8?B?blp1ZWVycW5TTlQyNU0zVjEwWWhjZktzUkVjYlJoOXBFQnBLNmR0eEl5ZWxO?=
 =?utf-8?B?Y1RBdzJlV0MyaGhuenNjQ3RNaVhrcmVCRHpjVWFQNmJ5aDE4dENieUdyTEdt?=
 =?utf-8?B?KzRrOGtkc0tFUTEyUGhMZ3JYZ2F2dE5iTFh3c3M5LzJObVduMEg2UGZUQzRS?=
 =?utf-8?B?ekJodjFZRHlIMHVDMGtsY3Y5OHpzczIxQzhNazlpejFEbzB2MTBXWlNBRkNs?=
 =?utf-8?B?dTdBODRZbEl5TGJpWmY2V085TE1udnNKZGtOS3YwQUVWTVhYci90TlJSWk4w?=
 =?utf-8?B?enkrdXVnQmtFNFZVTStGVEZCQ0NpemRwek1JU200TTVwK1R1RkRrdjdSL0k1?=
 =?utf-8?B?akhTTkxGeEtRbXE2VnorZXR3eDV0eVczNy9LcC9GbENWeGVoTVU0eDZoTEx4?=
 =?utf-8?B?VE9OUmE4Vmp6WURDNldIZlFWUXJlSFI0ZklvbERtTUtmYjVoZnU4MndEaUxu?=
 =?utf-8?B?ZTNoQUNSQjRpN3JhMUxJQU5qZUhTc0J1T2JweDZQTGF6YXhOZWY0N1YzQ3Zq?=
 =?utf-8?B?Q05pUFNRUnRORkhRTFJVZmRMaENIVTZYTXRPNzI0SkRwR2ZBUGV1V240R3FG?=
 =?utf-8?B?bzZFT3JIM1doNk5wMVM4cHFndEc4V3MvZjQwdVVmYUV6RVVzU2dNbVRLUm0x?=
 =?utf-8?B?cFVPM01xa2IyR1UrYVJkL2lXUjNwSldKaDdzTlVUODBRanNwSEUyelJvUW9M?=
 =?utf-8?B?cjhGVllzVUZBSXN0cnJmNG1aaFgzNW1jRDJYeWZrTFoxUldRVFpkNmZYUmlX?=
 =?utf-8?B?NFpNRVdkTk9vZUt6VjM1L1pJNTdtVTdYc3ZPZHFqNkVid1VYQkQvNXBBMjNG?=
 =?utf-8?B?N1BzaDRtQ2twaDQ5VkJxdUtQMEc1NGxiU3lienNSUjVTSlplR2pIY0pYWjI3?=
 =?utf-8?B?MHZaZmM4N1FpQnpNN2c4WmVIRk9FOTl2OU1HSFJkek5lOXhwS25pdmttZEI1?=
 =?utf-8?B?aEp1Q25YaUE4ZSsvOWFTUGhQQ1EzN2dLSm9rd1B3YnQzb0dKRVN0TTEvb1hv?=
 =?utf-8?B?WkxtMnNQVFUzdVpQSVdFQ0x0Q1l4anpha1RHTTB2enVxanc4U0J3M2JqRGZ1?=
 =?utf-8?B?Y0RoWFZXbFlVcUl6d3RNYWIvRVYvSHN0OVd2YlFnTEZjQ3NUM1VSRS9LNU9k?=
 =?utf-8?B?b0M3L0x5WThHNENWeGpMOWVnN3pFeTl4VmxaSVhaWlh2TGR5OXdTZDd6OWZN?=
 =?utf-8?B?c2tMVTBTSXdJMnFDT2hQcnN4bGliNndXUCs0Kzk5cDJKN0hrQzVYdGM3OExU?=
 =?utf-8?B?MmtMZVhici9IbmgrV2IwZmNXVWFTQlRuSmY4ak4rZ0RFQlB1aGlzeWdXb2g3?=
 =?utf-8?B?T1prZVZ2bmdzNm1Vc2ExcDU1Q3V4Ly90Y2NmdnNBR3ZGVkhjRTJrdjdQV0lu?=
 =?utf-8?B?T3g2NXpESU51dDJ0dnZUNWQwZFVsWVJJV1NwcjhEcitzY1lDQ1VHQjRCMHRE?=
 =?utf-8?B?WUhicU0zQkR0YzhPN2ZLRnptZ24yOTEwamhlQlAyTUptdUw3dS9YZU44dnk1?=
 =?utf-8?B?QWxKck8veVRBR29od01sdlp1cm1uc0ZROVh1VUZxN2dVZmJwd3o5MC9yajdP?=
 =?utf-8?B?RUVjZXVYSUEvT2xmVzJQcXlLampCQlZ1cStOY3B6TGpIWHg2NjZjbEtkQW01?=
 =?utf-8?B?R1BoUDNZZ28rTmZDYmFRaTRsOHRIL3ZxM3pKVWh3YzZkQWdOY1doc1pEWGpN?=
 =?utf-8?B?RkRXcENuekN6dlNhSmxxdWRRN0JWejQwMHhhdmRiWjNYRUF4N2dIR1BMODRR?=
 =?utf-8?B?anVKZHcreUJnUEZKUFJkSklwdEl0U09LQjBBVzhxK2tLZzlSZHRubGhON3Fx?=
 =?utf-8?B?cURoQ3dhekE5SDc5d3VtUmFod0RXdUVuU1dKWDUybTZ3NWFKSEFxZUZrZmND?=
 =?utf-8?B?eW4xbTdzRVZ6cHF0MS9IRU5wQ096OWZLM2FTaE1HR0k1MmZLNzUzTStiQi9X?=
 =?utf-8?B?Mnd5WS9ldk1XREZDSjRNQWhtVFJoUzBVMjFCQW8wanQ0YXUrRGxjU0YyQ1Za?=
 =?utf-8?B?Q0o1SFpMeEluR3ozbjluZTNaS2lheWg2a3NmZVFvNlEzUFFVVDVpdz09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b77e5238-5258-46f2-ab64-08df361c218c
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 00:24:16.1989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/J8vwUHcht6pE7gibJsk0OQiu0vOxsDipra/JBlD+aioGVl4Yz1thzsR0PBBlqUoUnu2ISS7NYbXCqb1EFexg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOFP123MB221540

On Thu, Oct 29, 2026 at 09:25:06AM -0400, Aaron Tomlin wrote:
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 919d0fb00bd9..98a65d127e46 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -427,7 +427,7 @@ static bool build_perf_domains(const struct cpumask *cpu_map)
>  	int i;
>  	struct perf_domain *pd = NULL, *tmp;
>  	int cpu = cpumask_first(cpu_map);
> -	struct root_domain *rd = cpu_rq(cpu)->rd;
> +	struct root_domain *rd = rcu_dereference_root_domain(cpu_rq(cpu)->rd);
>  
>  	if (!sysctl_sched_energy_aware)
>  		goto free;
> @@ -492,9 +492,8 @@ void rq_attach_root(struct rq *rq, struct root_domain *rd)
>  
>  	rq_lock_irqsave(rq, &rf);
>  
> -	if (rq->rd) {
> -		old_rd = rq->rd;
> -
> +	old_rd = rcu_dereference_root_domain(rq->rd);
> +	if (old_rd) {
>  		if (cpumask_test_cpu(rq->cpu, old_rd->online))
>  			set_rq_offline(rq);

  CHECK   kernel/sched/topology.c
[ ... ]
kernel/sched/topology.c:512:16: warning: incorrect type in assignment (different address spaces)
kernel/sched/topology.c:512:16:    expected struct root_domain [noderef] __rcu *rd
kernel/sched/topology.c:512:16:    got struct root_domain *rd

 512         rq->rd = rd;

We should use rcu_assign_pointer(rq->rd, rd) to resolve the Sparse
address-space warning. I will incorporate this change.

-- 
Aaron Tomlin
