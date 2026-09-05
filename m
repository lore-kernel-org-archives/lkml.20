Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010025.outbound.protection.outlook.com [52.101.46.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBDE285CBA
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 16:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788625345; cv=fail; b=Wxsl9mru7dUdZrZgjschWAuFVWOpiWzV4IPcOjQt700n4+mG1HrByPW/bgPQ5UZt06uv98+X5YSPuq2aikprHTSJGlymhu/pfaVj78gMPULoJYQ5WRRlnR6shAN/e73+na0sWhAvT4CgaNuFK9fSDdcJ/FbTnc9gnJrBMDMF0BE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788625345; c=relaxed/simple;
	bh=yy8rhDCbiYefb4wBcYJsb6WyshuZyzF2H5NupKxulcc=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=pon6xvTixxv8fkV4sZ1dKfKwDVB+uHSdY2G4b90BkVXu/VJ0DJeLKSq86WPAMKRuUUNMbLmSI3Vg3p+dho5+zrY9BlgG7MaUwCf4blUuHv2knrQkJyLmwOjuFZWTmxvBD7TK6Ugpu0705tjV039IPdY9p+gCETyllVmBu50pS8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r3ZHYp//; arc=fail smtp.client-ip=52.101.46.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r3ZHYp//"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UnwAFX9orxm4qeIss0huLqHXuK4jw4yGFFIe3N4ozFKTvzm0fPQXWD7sSE6DWwD23pFrPSXxz2TWj988qIQMJ8VnSYcto3QSfgbAIRu0+T/Dk4QIlDkhBVJ26GMnzTa3MIv1kloZZBVrONlPdukpE1X+UuFDlegpa66bcy2qHyFLRtxsEC0hnLNvKF4yrRKPNnHgGwisTphRWGuxFzod2U+NALAhi+b4f8NbVyNzxnqSklfIdIWGLItS2OlDQP/H+80/1LDmFa8+Z2QGIWxRk5c+mdDYPmF7IfKxZ8BZIOeLaOAfE+O79VJpD4jCOShg4TGaqEtcK3ta/FcOQ9Y46A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/y3uefWuHlOVvZyB8damuBCZTAk0YujvdXdwDrAaXJw=;
 b=bzha2LtkaxVOJSmBMD/W9mw3CL560XtWq9DwO8wdD+zhpTnqRKgJs+WrBBDbvgdzsvRC9nRbtV31/MtNOUV5YLFIK7cTv2s4AgfWohU8cjJTw2tX9pqQAGnY4bMM0arGNgglyMsAfBCKeilHmSKuBBCBXk6S16hnt+zB3Z/qWigdbu+xBwy/pVZ0BTvcOduDQAjD5L6q8CPimH2uqGd4Nag/H2uPIcT+mOYEIxuzpVwBGOW8K5ZQlw2eoOpnoOxb/hGw7wNnuQxMMhL5bHK/gSgy2OjcqdIoFBPnaCpsP5C7cwygHlI80cbUELiszNuVKQZC0lHjHvqBODqoNPcMhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/y3uefWuHlOVvZyB8damuBCZTAk0YujvdXdwDrAaXJw=;
 b=r3ZHYp//MpkAwjlR7Lj8VboJ/KJoZ1if0cKChD/2C+QCG3xreaQLznG8uh6P7WmvIs8qmmL/5ckWGV5U1Cv+vo61pCn0O3d9cUOkfaZmFapkfN8XdRbAPQ7mGq8GVInBrEwqLukujyuAi2aadMIP6D3jpmzYcQxtJh8Fq/FdpjnHFxn6zxOuiT5VoFnlmOSmg03Mu5pMQjHUA7UafD8yAX11iMdFm8OjJ9mr+kM42v3UfGQVkSFQGoYewRa36S0wxoIOkKz/6MhU0yA1gabQT57kBzmoM0uy0gmeA+N2klyqOwTRBTzsinhbys/9qaL8MLCSdrmC6L+U4PjrKM+VKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by BN7PPF0FD1DEA27.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6c8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.13; Sat, 5 Sep
 2026 16:22:21 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0382.012; Sat, 5 Sep 2026
 16:22:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 05 Sep 2026 12:22:18 -0400
Message-Id: <DL7IRL92BVCW.33O9J7W8PQJL8@nvidia.com>
Subject: Re: [PATCH 2/3] mm/vamscan: fix various coding style warnings and
 errors
Cc: <baolin.wang@linux.alibaba.com>, <liam@infradead.org>,
 <nico.pache@linux.dev>, <ryan.roberts@arm.com>, <dev.jain@arm.com>,
 <baohua@kernel.org>, <lance.yang@linux.dev>, <usama.arif@linux.dev>,
 <kas@kernel.org>, <vbabka@kernel.org>, <jannh@google.com>,
 <pfalcato@suse.de>, <kasong@tencent.com>, <qi.zheng@linux.dev>,
 <shakeel.butt@linux.dev>, <axelrasmussen@google.com>, <yuanchu@google.com>,
 <weixugc@google.com>, <mhocko@kernel.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>
To: "Christos Skarlos" <christosskarlos.kernel@gmail.com>,
 <akpm@linux-foundation.org>, <david@kernel.org>, <muchun.song@linux.dev>,
 <osalvador@suse.de>, <ljs@kernel.org>, <hannes@cmpxchg.org>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260905140140.60792-1-christosskarlos.kernel@gmail.com>
 <20260905140140.60792-4-christosskarlos.kernel@gmail.com>
In-Reply-To: <20260905140140.60792-4-christosskarlos.kernel@gmail.com>
X-ClientProxiedBy: YQBPR01CA0154.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::12) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|BN7PPF0FD1DEA27:EE_
X-MS-Office365-Filtering-Correlation-Id: 81bc904c-d861-411e-1084-08df0b69dc8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|10067099003|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	fGKRYEYfMoZGrDaHQJxuihyC2ZEjIrZ5oZRRisVfZFMsagz+HOjZ3QDZifMul+SvbJqqg3pI47MxwUAEf6s8qUXCgciGFLUpbOony9m10cPdWA7eTrmZNHPLiW1b5s6YlWqpbxcx3lhR0s28+GUN9TA+mwefBOzwIBcu/lRlyPCsyRJ6egcudBoy4Z7dYK0dXfEgmXsL31pMl/KtZTaLfK2nucwMD9stJn2LXhTjuXeaRuz2DeIyFPS+r4aaRJ1i6/NZ4dZfJ04vSWimPTlL4eoCSRqcxo+vef0CFRAbGP/Q1fX2dFT0fV1JXITUF0n87ZZc8yqVfxFwU16pUIcEMQW62nijKfMsr3KtcOmpKnUq0sc9ukKwdbMbGMi59tEFYjcVIPbhI0M7nnkbmQgdfdW7nJfncLln71lBgORunoaHJHkzWAPrgJeuxDO/siwBXURUSVNcRudcebi0KYjyerklEwLey2uClTwkj4yRf/zHn439eGKrDmu7cM4N1PmYATNeVGc8ROs56DY5eG2HG3kwzQKvU2pcAojrGseUg+5RO//fX0tMa2O91qNVErXUjY3TFjp1ztWjve8ccI6FX51igkb2+hQDmNJ7Ceqa0TLxxsSPwrwFKy8S2/ETSFSHXe2VO/Mu4oL2AQ6ootBENYLg2zTJ4UtNQGDxYm1kwxU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qkx5a3JaSGtXbnNrUm5lRC9jaGg2NDNQREJZVzhTZnVqNjN3Z0JVdzZncEhl?=
 =?utf-8?B?d1B4b1JBTFdNZERZQzVpbXU3cGs5REVVSkRvWExMcEtuT3g0Z0k5UmRJZjJZ?=
 =?utf-8?B?NjFGczMxYXdLOEh4Yjl4L3pTb2QvL0RuWDN6eDNzc0lJTVBUVlk4aExqVFpJ?=
 =?utf-8?B?dHd2ZHdTR2R3enBOZ3VEQjV2Y3JHd2VoRjgyWGVQb1VHalI5eVRQT3lrOXpv?=
 =?utf-8?B?SGM4cGFKWURMSytkVWpXM1FKd3QzZVJDU29xN2VkNGJSaEFEYzJxUEJTek5i?=
 =?utf-8?B?bytMOGw4Nm42YXFrb1lwWmQ1TVIvZHVKdXVPanJJRHJPVk45akZ2T1NpN3gv?=
 =?utf-8?B?ODdBWDNRaEhmR3Z1Ry81WXg3a2w4NWxYVFB1Q0ZkYXBZdUtxV0UxVXR5alYy?=
 =?utf-8?B?cEkrWUdSYnBEQnFKcmFKeGp2MFhNcEdKT01qRGFmNVllT3h1YStVT1BTcXFk?=
 =?utf-8?B?Ri9QaVFNcVl6TVhFcXdFejMzS2RBcGo4WSs3NThhTjNYTzI5VVNHTWsrUTl0?=
 =?utf-8?B?TlljMEd1cUUwYzdzWmd3cS9hSy9nckNqNGhsdHBlcXBSNGZINDN4WElKdzI2?=
 =?utf-8?B?TDRja0paOUcwM2NDNDZPUW81TVkyMklCWmdRMDgyT2hyamMrenNtU3VvTlZh?=
 =?utf-8?B?c1I2UTBjdDd0NlBMMVIrTHVlbWpRczJxU2Q5Nk9VL3NpQVYrZktxVnNrOU5B?=
 =?utf-8?B?WHp6US9BOEhTWUJPdVVkd3FTQlBCckY5MEZrTGVGekxic3U4YkFjRHhJbVR6?=
 =?utf-8?B?UWJqQzE2Qm1BRzYyTmFNS1EvQzd5ZlpTeEdQZGk5d3JPZ2lWbmxrMGhmMVE0?=
 =?utf-8?B?WkYxQk1ZN0NXQVBlN1F5aldDekJxQVo1NGpyVkZXRFZ0djU2TUhwVWhhN2hO?=
 =?utf-8?B?KzlvRG5XN2wrOUxZOUh6Rmd1TTN2VnR1b0xsczRiQTRYSXhxVHlOQklvaEhV?=
 =?utf-8?B?NFV3eEtXR2NuRGh3MnVHdzQ1OUlQdnpZYzU3ZzRHeThIL0drTVVKNXh3emxZ?=
 =?utf-8?B?WkxuaSt3aWhiVmt2a3pjWkNobVRzWWFRVTNiR3NkVWZxRTQ2aThFZ0VnbHRk?=
 =?utf-8?B?d3RyWlZYUUJHU1dJaXMwYzVkVmFJbTh0LzdRSG9HYVRnbTZlMjhvckg2S3h3?=
 =?utf-8?B?eGV0QkNuVmliWXB5TzlMenZPOG9RenAxZ2lwWjNvYWlVaTEyQnN1R2QrWGw1?=
 =?utf-8?B?bzVtclV1TldLZ2lhdmhDYU5JUFdHS1ArSjlSRUhxWHJOMUJKRGhpYkhRc244?=
 =?utf-8?B?UklkWTQ2ekNubjdkc3cxQ2JzZUgrNzVWYzdaazI5Kzdzd1Q3K0lCakI4clFL?=
 =?utf-8?B?aThxd1B0SHRCT3BOTUZKWnYzenF0Z3ZmVXQybHJQSGl2azg0NklOaGx4Wmxn?=
 =?utf-8?B?WGordFZOQWNlY2pMOTVpeWU3enN4cStIR2NjOStQZjgwSktBN0EwY1ErYmEr?=
 =?utf-8?B?QVB2cmJNQ29jVE1mOG9NY2JCYmFlbXVUemE2cWlnVDdNRjRRdkNCeFVNSE5p?=
 =?utf-8?B?V3o2Nmp2T3RyNER0Sk1ocFFNbDJVdzlPVndLQUhtQno3SHl1SUlTZXdFUlpk?=
 =?utf-8?B?eCtQK0d6QUVQc2pDNU1NVllieHIzUzNpTGpSSTlCYnp5VnQzbExFdTJPVDh1?=
 =?utf-8?B?RDR2N2JwWGNFaGt2SG9OY3B5M0N0SVVGZnlESHJaeXQ5YlcrcXJjSTRpbFYv?=
 =?utf-8?B?cUZWamxzRmhtRVUwNWI1aHpVZ3NRSFErd28ybTBDeHhoT0NIZEVhR1o4T1RI?=
 =?utf-8?B?eDVPMzZldlVjN051N084T0hJT2pNRHpEMzc0SSt1YllmMWNrOHVWcHZEcHgw?=
 =?utf-8?B?dmdUQ3ByQ2RGK1ZORXpQRmxXZUxBUEtrMnFyTjdkMlNjZ1BLMzU4SUppWEtm?=
 =?utf-8?B?MlVkRHJzMUJCSnpuS0tiVGNuRlB6a3BXU3hDVU9OQXBkalJHYzhKUXdqUVhM?=
 =?utf-8?B?T1QvZHNHN2xybnBkUDludkdvZVJmSW9vTUxTY1JsZStjck9UcHAxbGtzbmx1?=
 =?utf-8?B?ak5rV0NPaUs3aU1Ob1U1aWUzZHZzeUhmWU5OSHdvRllKTjM1cVZaYmt0Mmww?=
 =?utf-8?B?dHA0bG9rRTdWeDZLS3JhNEVPT3B5UnpMTXc4Z0dFVzZVT1pzUEptT3FHa05D?=
 =?utf-8?B?OGhJMjFXNVRkcGlySXBJSVdyRWFkVU4zZXB3NG1FK3JxUVVDWW5BWTIrYnJw?=
 =?utf-8?B?MzQ5REhCRm5Hck1BemJDeWtpbEtJb2Z4U1Y1VlVSYnJ2TUpxNGc4cnBtbkRW?=
 =?utf-8?B?V3RPNVB4eGJXVW1tT3lBWWw4eitCL04zTmUrNW1kZURDdmIxSE5JTXVmRy9L?=
 =?utf-8?Q?oc+X0mdXNckzvZFFw/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81bc904c-d861-411e-1084-08df0b69dc8e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 16:22:21.0503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+JYbWM7yqXLRF91mp0f0OyYf1CWOQVPgMeKJ1rCWaQAq+jbt31v4GdSk934BQmH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF0FD1DEA27

On Sat Sep 5, 2026 at 10:01 AM EDT, Christos Skarlos wrote:
> Resolve coding style issues flagged by checkpatch.pl script. Specifically=
:
> - Add missing blank lines after variable declarations.
> - Replace "unsigned" with "unsigned int".
> - Replace spaces with tabs where possible.
>
> No functional changes are introduced.
>
> Signed-off-by: Christos Skarlos <christosskarlos.kernel@gmail.com>
> ---
>  mm/vmscan.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Your subject has a typo: s/vamscan/vmscan

>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index f11491ee9ed5..8637cc0910fa 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -535,7 +535,7 @@ void reclaim_throttle(pg_data_t *pgdat, enum vmscan_t=
hrottle_state reason)
>  	 * writeback to a slow device to excessive referenced folios at the tai=
l
>  	 * of the inactive LRU.
>  	 */
> -	switch(reason) {
> +	switch (reason) {
>  	case VMSCAN_THROTTLE_WRITEBACK:
>  		timeout =3D HZ/10;
> =20
> @@ -1529,6 +1529,7 @@ static unsigned int shrink_folio_list(struct list_h=
ead *folio_list,
>  		VM_BUG_ON_FOLIO(folio_test_active(folio), folio);
>  		if (!folio_test_mlocked(folio)) {
>  			int type =3D folio_is_file_lru(folio);
> +
>  			folio_set_active(folio);
>  			stat->nr_activate[type] +=3D nr_pages;
>  			count_memcg_folio_events(folio, PGACTIVATE, nr_pages);
> @@ -2073,8 +2074,8 @@ static void shrink_active_list(unsigned long nr_to_=
scan,
>  	LIST_HEAD(l_hold);	/* The folios which were snipped off */
>  	LIST_HEAD(l_active);
>  	LIST_HEAD(l_inactive);
> -	unsigned nr_deactivate, nr_activate;
> -	unsigned nr_rotated =3D 0;
> +	unsigned int nr_deactivate, nr_activate;
> +	unsigned int nr_rotated =3D 0;
>  	bool file =3D is_file_lru(lru);
>  	struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
> =20
> @@ -2614,7 +2615,7 @@ static void get_scan_count(struct lruvec *lruvec, s=
truct scan_control *sc,
>  	/*
>  	 * If there is enough inactive page cache, we do not reclaim
>  	 * anything from the anonymous working right now to make sure
> -         * a streaming file access pattern doesn't cause swapping.
> +	 * a streaming file access pattern doesn't cause swapping.
>  	 */
>  	if (sc->cache_trim_mode) {
>  		scan_balance =3D SCAN_FILE;
> @@ -3416,6 +3417,7 @@ static bool get_next_vma(unsigned long mask, unsign=
ed long size, struct mm_walk
>  {
>  	unsigned long start =3D round_up(*vm_end, size);
>  	unsigned long end =3D (start | ~mask) + 1;
> +
>  	VMA_ITERATOR(vmi, args->mm, start);

Like I said in patch 1, no new line is needed here.



--=20
Best Regards,
Yan, Zi

