Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010056.outbound.protection.outlook.com [40.93.198.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEF81862
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787754744; cv=fail; b=tbCBMdGlTwc/Q769R6Pq4QS90UwVO2rWStVL/08YgtRWTafSDxr7wYZn2CMuLMYMfuFfdgKW2KX4iI+oSAmNZzBuBonAd0tBWRbuHntb87Ph+o/KSOTBHDhVhE3xKdIdUJj4ryPdbDUsGu73RiOvpLifxBsJjmYkTjBueGW9Ngk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787754744; c=relaxed/simple;
	bh=2eCj4r4bsLelitVzCCTQUkd27OrEdWL61U/T6AwDEvU=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=W4fXqIgtdvjUkjEpd8IP5BDPvuAiUPsarRGPhH68jYWXTR9CebX25UqJotEWRmUAPUz9fnc3SBHG/4mRgh0KgwIv5J97NcTh+EMU4dx2oyqWkjwDBuQzWIC7C48Io1P9JAqpMcT+7SbETyEtLg/6hZA27937iAt8B/xTA2D1h34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VoFfFAdI; arc=fail smtp.client-ip=40.93.198.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VoFfFAdI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nb0eBZvsWJg0Dz2r5LiRYUGD8i/C0AmIx9q+uQCMb8XKsRTAg4koSDvMgFgWtOdVOQcXoR0JOgGiNjg/andvspA2anmJehnQjU+EspmmeZP5M3XTQr4WLvgceb44s8ht53jybr102auPzqyURxsPpKKknXDy4jcrrGKXdbhYO9UYJruVG58/8vbnw9BGUvr9gmmPz0f1TRzJlQvNrwT8zNWqj6gnr71S3KZl+xzhIOw5dY78BuU8bm0fk1PEudxb9XJMtG1SEnYOe0qeiFW7BTRFrly26SZkFfzl0bCMKZ452pPQZFUDHUBtDEstZm3/dE+GFsfNI/kQtlRtLh3+tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2eCj4r4bsLelitVzCCTQUkd27OrEdWL61U/T6AwDEvU=;
 b=f6tDDM0/JPc+yd3egGmjGaRSJOiipmamHYpOCLaYKS8RTEvYRCyDXrfcx2y/HjKzEvOeeh62Z2cj0jNB8YXRoYrLg0otkQwJuWQ169wKCM6dA+mD1N3soHUQVPVKbUP287APISPkG9NowST9HkYV3LksCspems00U7BUqmiwhFldzoDYeXok8ZhJak+iGK2EtcrAWiON1lBMZfCrHADBCFiuuDFUpkGkM9i/W3QT0/Raoiltaj0WwIuOMRxoHKE35C98oyBqBN6/cwBYAy7KPjgmufkDoNupnHx4LsDXvL6/lFJKnOpOenrCRbhMg+nE6yJEolHISEAhmhEofih/UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2eCj4r4bsLelitVzCCTQUkd27OrEdWL61U/T6AwDEvU=;
 b=VoFfFAdI+jvLPUEclVUSqbiAjS6SPU0/eTguoUHbwNWL8iTBm9U3ZC+AAEjM57NDydJ5AB3MaxeWfIIpvLBEd3i9DzdzZba9MaeQJl+PX7cXo3DDLbBz/imi+EGIlcYAlS/byUOqMSxo/VPrHSiNVcYPJFPYTzJ2LIRYAOKcX1FRIghZR5BGezULvs1JFjP6yRrYxetLdTTZ9tQvj2n4/YPuhvbZJm/KwkchWx3L73vGe5DZm3xtIulGlz5kKPNzhCZ7vOrtxUXafbREUXOULc91qv+nRxOz/E8PfMXhuMxJBX5gYR7fc6eqOOkk2fTASEKwvsznu9coht4uFPZs6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by MW3PR12MB4475.namprd12.prod.outlook.com (2603:10b6:303:55::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Wed, 26 Aug
 2026 14:32:12 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 14:32:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Aug 2026 10:32:10 -0400
Message-Id: <DKYY5T6DL56L.312FCMNEL50R5@nvidia.com>
Subject: Re: [PATCH] MAINTAINERS: remove myself as THP co-maintainer
Cc: "Andrew Morton" <akpm@linux-foundation.org>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>,
 "Nico Pache" <nico.pache@linux.dev>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Dev Jain" <dev.jain@arm.com>, "Barry Song" <baohua@kernel.org>, "Lance
 Yang" <lance.yang@linux.dev>, "Usama Arif" <usama.arif@linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, "David Hildenbrand (Arm)"
 <david@kernel.org>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260826-drop-thp-maintainership-v1-1-3d102748fa17@kernel.org>
 <6293dc55-e69f-498c-8290-b85202db605e@kernel.org>
 <ao69UWWf0awFqIXD@gremlin>
In-Reply-To: <ao69UWWf0awFqIXD@gremlin>
X-ClientProxiedBy: YQZPR01CA0086.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::15) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|MW3PR12MB4475:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f48f9c-1dd6-4456-7c75-08df037ed125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|366016|1800799024|376014|56012099006|10067099003|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	DrIdPtkVy29f0Bqha1YlX/KKA6WOGYGRox9FoQ74Rq3gbgr5ZDZPyfx2+REF47hmdwcAx8kfyM+B0IrAyJYYx+Xdiyx0kw/EWEE9o2C5amnl1GC83AXOpqQLNGMItvhF/Q2E7LGD/WnJPFa0qbe+2/R9jPFehMwKXZm8jbHR4LIZl6N1IOb0CeHdFM978VMelN6zVQ2WBCaDCZSHExqbiZqFDJGimCNm2/dKfud+JFGdKJEIGA9uYs3eSjx+FqT9TTQzQRQIMpRyybnVAVsBpM6kfGJR7C9gl6SXboHqPjHxVSt/690D5Gf+Apgkozh9nrOThbPwkXrtUMZOEw722iaiXyuzklUtRiaJ0zAMPT0QXHXf61pOjDLTRBBvlfAik1he1PsxNLnOvzoBeqHLm82VZw+Q7p4dqZdrDdffuevMRicWOqLKnIm7eAaHbgxByMXQCTzjB0jN7GuNLmgSzTU3D0EE9LcbIE9WgMmwQM6rVgnT8aWGOT1PHHBbzDMMH4htZoya1+/LU11saLfL73N2H5v+zSkxxbN1SKohh6nNo+yLdha9Z2y8By2nfGQfBsejf6yxSaAuCVEcN9U9z8ND18QunsexqXbXCtFXnxr+MGgOwlZaveJwC4JvYnozJS3c6Ujln1a3r3lQpyXuAmo40gmnBlkmpCiNaaNuq2o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(1800799024)(376014)(56012099006)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEZsbWJESmE4MlNTK2tZd3FUTlh0Yy9XN1F5aVFUS0lBdTZ3MHJIcTk5Q0ww?=
 =?utf-8?B?L1orNVJDRjNNakRsYkFBWU12Z2hOb3hUOXhKR3VlMUREajJIS21hbnlnVWNT?=
 =?utf-8?B?dGsxRU1VUWpnU2ZsMjFaaXlnTnZyUWsycEV1dldBcm1weGhXZ0tidFlPcXBB?=
 =?utf-8?B?QUR6SDJ2ZjAvYVZNQk1kSVk3UGNTUFhpaUE3S1pVbjd0andrUCtsdE1ra2d3?=
 =?utf-8?B?QXJNdkFJVkd1SmFaZVlzZkhFUm1LaEZwc21KWi8rMlJ1M0lhWURNUityRHdo?=
 =?utf-8?B?S2ttVlZFY0V4cS9jZFdOWTRyRXlzMzdDYTY3UVA0U0k1MFlXR3gzanNlZ2o3?=
 =?utf-8?B?andXazYyVXJZcHVZdU1lWU4zMUZXZDY1UGV1Z05iTS9MU3dOaVY1TXlZK2RN?=
 =?utf-8?B?aE5kdENJbzJZZURiOU5qYThJWXNLcGtOeUNJbGJoR29pa3ZpTWNiUkxEN1Uv?=
 =?utf-8?B?MkpSSzI3eHFNb2VRUWZwV2I4SERZekE5aU1GaXcrNDAwcmZwTWltN1ZWbk43?=
 =?utf-8?B?eWlXdWo5UjhlWDlZZll2L2RQclF2azBaT2JwYzUxYXFmNTNmdWszeHQwOWcy?=
 =?utf-8?B?aGh3VWxUVE5BZnlUOWVFckdCdHRIQ0F3Y0lxNGlJcGlLSjI0Y05Hc29WWHQw?=
 =?utf-8?B?TFFuR1dENW9NVEJjemRnMlEwbHBTRmRZSVM4dlI4eGNUUTEraURHcmYyNUUv?=
 =?utf-8?B?VUtNcDBXaVpmd0lwOGJyaXFyVmNtR0w0aWZlRGY2WFlTR1AzNHMzaDNPVjBG?=
 =?utf-8?B?UVBuRERQbHZGRHBVUFUrRWdZZ1B5OXQ5VCswZWREM0FMRlJHVWVzMXkvdnZ3?=
 =?utf-8?B?dW1Bb281MkhpMXZqQTZHUzBDcXVyS1plVG1SbkQvZDBlNWNiR2lHNzlCQ0hy?=
 =?utf-8?B?SUw2ZTBaRjZjaEFPaExHS3dVcWg1VXZPZ05wU1JBTDJhMVdRQjFyS0pXMkJa?=
 =?utf-8?B?YjhZemwxU3Q0R05PQVMzNFlSSWxqS05iOEJuaUd5TThWb1VrTnNvZ3UwZ0JP?=
 =?utf-8?B?eS9yckV2dHBZVzg0czd1RGJ1K3E3czgxVERxWm0wamZqdU92UmdIQWlUeURQ?=
 =?utf-8?B?b3ZsaXo1VXFjYVZCUG41aWEwVWt5ZjJoQkRjL2grRXdCYWQ2YVl3Z1lLNm1F?=
 =?utf-8?B?eU1LblJFZEpMS1BuVDRLVzVJTnN6dFJ5TStJZm1rVjR6b3liRFE0ZlFsdzNu?=
 =?utf-8?B?M2ZGcEZ1bWZvL1k1TmU0cEUySnhrbzdVZ29Vdk94UjFkVTB2aTNURWZ6Q24z?=
 =?utf-8?B?VldBM0ljZjNvUEExU0RZbVNZTkVZV29yMTFvNTdPWS9XWGhUcXFhSG0rWktn?=
 =?utf-8?B?RWJ4QXlRcWhkUE5LMWtyWFpoemtUYnJVZnl3MjFkTFRSVVJXLzhGdjR2YjE2?=
 =?utf-8?B?UW8zYjIxakhMV0xia0JGdkxxOVN0cy9xT1NlUVNGMDBhelZ6VzlDeFBRZDQ1?=
 =?utf-8?B?bzhYaDd5RWlkSGcxdURQdkswV2hLYVp0ckVYSTNHNmc0YytQa2Rxb3lVM1Zr?=
 =?utf-8?B?RERNRDZhYTRnRkQ2elJuZXdaYWNmYldtK2RlanFxQjhHb2NRVFJLakdtdzE4?=
 =?utf-8?B?MWFMVFF1d2ptc0JuWWo4WWNGR0cyTVNhOGJkeDZ4S0NqK01FN1VjWklWeSsz?=
 =?utf-8?B?Y2d2MUJCQnlDaTRaMjVQbmxSdys4cVBUS21iZC9oTzhTQ1NwWFpaVGE0MjBw?=
 =?utf-8?B?NnNBWnlJOC9hU1FQUFBhOVdsWG03UXZzQWtuT2cwVmtSMFVwOEowdG9WM1JF?=
 =?utf-8?B?c285cVEyWEZMLzhDNzFIcFYwQTlZYVFYMnYwdjJpY09TMG03NXdGTFdqb0xZ?=
 =?utf-8?B?cTY5a0Y5ZnM5bjk2WWxkNFdrenFNRmlBUmRFaHV2d0dndTliUHBYREFFU0FU?=
 =?utf-8?B?a1gzVGJuTS9WbmYwOFRRVlg1bjdXM3lQOHlOWll1eWtTVFluR01FZ1lLRjBV?=
 =?utf-8?B?bHhGeHRxVnhUVDNoS2tkamhsdjY5MnBSK0p4K1dWU1JFcW1KZFpCKzVnNVBZ?=
 =?utf-8?B?OUhOemx6RzB3bWt5RUl2Y0ZRMVExQTl3c3RrbFFmYzA2ZldJSVVtTHE5YUVs?=
 =?utf-8?B?R0x5WVBybWJpemdQWit3VVFLQ3FVaThnbFVFQ0k3Y0t3YnExWUI3NjE0bjI0?=
 =?utf-8?B?Y1g4ejdzY2ZzMzNSU2REcXJUOE80bE1sL2VFckNYd0tmejMzQXVoMTdRZVpK?=
 =?utf-8?B?eHB1aXBBUlJpZ3pkaGFDYkl0N2p5MTdXL3JCclhCVCtTSEk3UEY3OGFENXVm?=
 =?utf-8?B?anJYVW9ReTdpNDhlTWdmdkMxVHJWTzA5KzhjVHRwWERUbFRqTFByUUQ2MDhu?=
 =?utf-8?Q?kPaJsPvrgFs728Odl9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f48f9c-1dd6-4456-7c75-08df037ed125
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 14:32:12.0865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pcz161bKHW/y7tcSSdgiuNkg15H1EkJxYzFWQuqSq+OsPZTVg6AKh8GOkB/VVCuP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4475

On Wed Aug 26, 2026 at 6:23 AM EDT, Lorenzo Stoakes (ARM) wrote:
> On Wed, Aug 26, 2026 at 12:09:31PM +0200, David Hildenbrand (Arm) wrote:
>> On 8/26/26 11:56, Lorenzo Stoakes (ARM) wrote:
>> > Unfortunately my workload is such that I simply no longer have the tim=
e to
>> > give THP the focus that it deserves.
>>
>> THP is, unfortunately, one of the busiest MM components, and also the on=
es where
>> we have to deal with significant legacy code, many suboptimal past desig=
n
>> decisions ... and plenty of ideas for improvements that require constant
>> pushback to not make the situation even worse. The time spent on discuss=
ions
>> alone is massive.
>
> Yes indeed. It was a very difficult decision, but the sheer throughput an=
d
> attention required has reached a point where it's become infeasible for m=
e
> time-wise.
>
> I do hate to leave you with all of that, but you can always ask me to pop
> into a discussion or cc- me, so hopefully that'll help :)
>
> And as you say, we have an amazing community of reviewers who all help
> enormously.
>
>>
>> Fortunately we have a growing list of reviewers.
>
> Absolutely and I've really loved seeing how people have developed - Lance
> in particular has grown wonderfully, Zi is a star, and in general every

Thank you for the kind words. I really enjoy working with you. Since you
are still around, I am sure we will keep working together. :)

> single person doing THP review - thank you for all of your contributions =
:)
>
>>
>> It's mostly thankless work, really; but I'd like to express my sincere g=
ratitude
>> for all the work you put into co-maintaing THP over (/me checks MAINTAIN=
ERS)
>> more than 1 year!
>
> Thank you that's very kind of you to say! :) Thanks for being a great
> co-maintainer!
>
>> >
>> > So, at least temporarily, step down from the role.
>> >
>>
>> I'm sorry but I can't let you go entirely ;) I'll make sure to CC you on=
 patches
>> that need your feedback!
>
> Absolutely, feel free :)
>
>>
>> Thanks again, Lorenzo!
>
> Thanks :)
>
>>
>> --
>> Cheers,
>>
>> David
>
> --
> Cheers, Lorenzo




--=20
Best Regards,
Yan, Zi

