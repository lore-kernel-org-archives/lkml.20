Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.63
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737453;
	b=z24GCu0bsJS0CauWT4itGTD7D5rPYK6/PaWEtpQHiGaItr3brLAwIrivvz2Z4bt3wMsb
	 zvSMx7MFwM4CGKBJRl9RJ6pn1JNB3NTGpXJuU5h7kl7qF9uXDEeGqVvL47pKaUwpMnfuF
	 wohafuOQnq3CWkGta4SuIkaz6HRhyfvizAhkyoVdz9zpPZiUkiDZ/yIjlv+hLlkAT9g2F
	 ElkiyqmfmDxvjisIJO4V+JC0xkGrmBUf1x51uKAPiO/JygKSruwAjUay6K5g+DIIg54cJ
	 ycdukkO03dwewE1uPtAk3Va46BQ20ALf7WcmTb8ZHgklRI3bpKCrc8A/Zzzt8y+5lNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737453;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=uRUq6OnGXL2wlDLuy2Qj0QtCSFDuIIO7KpdyvPeLi2Q=;
	b=LpeOKarwovzQyLyU3bHHFmBMpzMz2eaD3MfXzrirDAm2C6HhvJjWvTtEpYw3xlIGjknR
	 rj7gS3pz5yPfgKQMKQhYLdKmzOgMjcm9w++NzeihOoyVPp1CPVYfDFCTgV3jNhVx3Xavg
	 DMRWLAZRRfQbCHh9/5jOhgBlteZ2w3UdaKeyzEEKUsFjZgNHYbQ21g79IBjkYjsA3Iomq
	 aSSa5VY59esTad0D3yxFMcQ+XIuPmhvtlvI2lRgHBFpnXz3rVAnzVDyglnD019tul/bDp
	 GHGLeJYMxcvB1DBTfaK/TZzLZVfGXYUVR94RKZU8U2qJbbhOc4qTwqmRMC0F/JdnrKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bJonDl0C;
	arc=none smtp.remote-ip=91.218.175.63
Received: from mta0.migadu.com (out-63.mta0.migadu.com [91.218.175.63])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09C2606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B09C2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bJonDl0C
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VxAlEuUl9LXtPCmJJe5vxG0UbJnUdNJ2BgA4diN+u9A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792737450; v=1; x=1793342250;
 b=bJonDl0CACNDQHh7qThbudTAaixIaG6O6tD7kERLO9DPU5slNL3P5yDD24ZWcdkLkuhkLMST
 uuqZqUe7QVYX3QxMcT5geBi8vmnYe5OdfSzMidhdAfRQ0jwOM+CNRqY5uiIdN3VsAxsp9bqNZX4
 y3B9RyaEfa5soy7lE2MDLcas=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 8830e17c029f41a8;
	Fri, 23 Oct 2026 06:37:30 +0000
X-Mizu-Trace-ID: 8830e17c029f41a8
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2 3/5] mm: hugetlb: track CMA reservations by pool
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <b37a33e2-7dfb-4401-847e-919f0bd61271@linux.dev>
Date: Fri, 23 Oct 2026 14:37:12 +0800
Cc: Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 david@kernel.org,
 osalvador@suse.de,
 akpm@linux-foundation.org,
 azpijr@gmail.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <6FC136B3-95F8-4F68-AB11-44D303AB374D@linux.dev>
References: <cover.1792651104.git.zhengqi.arch@bytedance.com>
 <29b35f7221c30f1dfa320a933f6095f37b612a37.1792651104.git.zhengqi.arch@bytedance.com>
 <b5745b31-adec-4158-bba4-2c21dbfe2566@linux.dev>
 <b37a33e2-7dfb-4401-847e-919f0bd61271@linux.dev>
To: Qi Zheng <qi.zheng@linux.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 23, 2026, at 14:35, Qi Zheng <qi.zheng@linux.dev> wrote:
>=20
> Hi Muchun,
>=20
> On 10/22/26 7:21 PM, Muchun Song wrote:
>> On 2026/10/22 15:31, Qi Zheng wrote:
>>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>>=20
>>> Introduce fixed default and PMD pool slots in preparation for =
PMD-sized
>>> HugeTLB CMA support. Continue accepting only the architecture's =
existing
>>> CMA page size and keep all gigantic sizes sharing the default pool.
>>> PMD-sized pool support will be added in a subsequent patch.
>>>=20
>>> Select the pool for allocation, CMA-only checks and boot-time =
accounting.
>>> Release folios through the CMA area that owns their physical memory,
>>> including after demotion.
>>>=20
>>> Record each pool's successfully reserved capacity and remove
>>> hugetlb_cma_validate_params(), since the per-pool CMA-only check =
handles
>>> missing or empty reservations.
>>>=20
>>> Assisted-by: LLM
>>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>>> ---
>>>   mm/hugetlb.c     |   6 +-
>>>   mm/hugetlb_cma.c | 154 =
++++++++++++++++++++++++++++++++---------------
>>>   mm/hugetlb_cma.h |  11 ++--
>>>   3 files changed, 112 insertions(+), 59 deletions(-)
>>>=20
>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>> index b37d7d0db7fc9..6b08074d11f52 100644
>>> --- a/mm/hugetlb.c
>>> +++ b/mm/hugetlb.c
>>> @@ -1368,7 +1368,7 @@ static struct folio =
*alloc_gigantic_frozen_folio(int order, gfp_t gfp_mask,
>>>       if (folio)
>>>           return folio;
>>> -    if (hugetlb_cma_exclusive_alloc())
>>> +    if (hugetlb_cma_exclusive_alloc(order))
>>>           return NULL;
>>>       folio =3D (struct folio *)alloc_contig_frozen_pages(1 << =
order, gfp_mask,
>>> @@ -3635,7 +3635,7 @@ static void __init =
hugetlb_hstate_alloc_pages(struct hstate *h)
>>>        * Skip gigantic hugepages allocation if early CMA
>>>        * reservations are not available.
>>>        */
>>> -    if (hstate_is_gigantic(h) && hugetlb_cma_total_size() &&
>>> +    if (hstate_is_gigantic(h) && hugetlb_cma_size(h) &&
>>>           !hugetlb_early_cma(h)) {
>>>           pr_warn_once("hugetlb_cma is enabled, skip boot time =
allocation\n");
>>>           return;
>>> @@ -4338,8 +4338,6 @@ static __init void hugetlb_parse_params(void)
>>>           hcp->setup(hcp->val);
>>>       }
>>> -
>>> -    hugetlb_cma_validate_params();
>>>   }
>>>   /*
>>> diff --git a/mm/hugetlb_cma.c b/mm/hugetlb_cma.c
>>> index 4f27eb242dc3b..c279c3f548705 100644
>>> --- a/mm/hugetlb_cma.c
>>> +++ b/mm/hugetlb_cma.c
>>> @@ -19,6 +19,7 @@
>>>   struct hugetlb_cma_pool {
>>>       struct cma *cma[MAX_NUMNODES];
>>>       unsigned long size;
>>> +    unsigned int order;
>>>   };
>>>   struct hugetlb_cma_config {
>>> @@ -27,14 +28,34 @@ struct hugetlb_cma_config {
>>>       unsigned int percent_in_node[MAX_NUMNODES];
>>>   };
>>> -static struct hugetlb_cma_pool hugetlb_cma __ro_after_init;
>>> -static struct hugetlb_cma_config hugetlb_cma_config __initdata;
>>> +enum {
>>> +    HUGETLB_CMA_DEFAULT,
>>> +    HUGETLB_CMA_PMD,
>>> +    HUGETLB_CMA_POOLS,
>>> +};
>> Since there are exactly two pool roles, could we make that explicit =
with
>> a typed enum, for example:
>>       enum hugetlb_cma_pool_id {
>>             HUGETLB_CMA_POOL_DEFAULT,
>>             HUGETLB_CMA_POOL_PMD,
>>             HUGETLB_CMA_NR_POOLS,
>>       };
>> and name the array hugetlb_cma_pools[]?
>=20
> Make sense, will do.
>=20
>>> +
>>> +static struct hugetlb_cma_pool hugetlb_cma[HUGETLB_CMA_POOLS] =
__ro_after_init;
>>> +static struct hugetlb_cma_config =
hugetlb_cma_config[HUGETLB_CMA_POOLS] __initdata;
>>>   static bool hugetlb_cma_only __ro_after_init;
>>>   static char hugetlb_cma_cmdline[COMMAND_LINE_SIZE] __initdata;
>>>   static unsigned int hugetlb_cma_cmdline_len __initdata;
>>> +static struct hugetlb_cma_pool *hugetlb_cma_pool(unsigned int =
order)
>> How about order_to_cma_pool()?
>=20
> will do.
>=20
>>> +{
>>> +    struct hugetlb_cma_pool *pmd_pool =3D =
&hugetlb_cma[HUGETLB_CMA_PMD];
>>> +
>>> +    if (order =3D=3D PMD_SHIFT - PAGE_SHIFT && pmd_pool->size)
>> PMD_ORDER is better.
>=20
> OK.
>=20
>> There's another question here: why does PMD-based page allocation
>> need to check the pool->size, but gigantic pages don't?
>=20
> The PMD size pool needs to be checked here. The check for gigantic =
pool,
> is deferred to the caller.
>=20
>>> +        return pmd_pool;
>>> +
>>> +    /* Preserve the default pool's use by gigantic sizes. */
>>> +    if (order_is_gigantic(order))
>>> +        return &hugetlb_cma[HUGETLB_CMA_DEFAULT];
>> If we also check size for gigantic pages here, would the code be =
simpler
>> that way for callers?
>=20
> Yes, will do.
>=20
>>> +
>>> +    return NULL;
>>> +}
>>> +
>>>   #ifdef CONFIG_NUMA
>>>   static phys_addr_t __init memblock_node_memory_size(int nid)
>>>   {
>>> @@ -56,10 +77,16 @@ static phys_addr_t __init =
memblock_node_memory_size(int nid)
>>>   void hugetlb_cma_free_frozen_folio(struct folio *folio)
>>>   {
>>> -    struct hugetlb_cma_pool *pool =3D &hugetlb_cma;
>>> +    unsigned int i;
>>> +    int nid =3D folio_nid(folio);
>>> +    unsigned long nr_pages =3D folio_nr_pages(folio);
>>> +
>> Please add a short comment here explaining why all pools must be =
searched:
>> after demotion, the folio order does not identify the CMA pool that =
originally
>> owns the physical range.
>=20
> How about the following comment:
>=20
>     /*
>      * Demotion can change the folio order, so search all pools for =
the
>      * CMA area that owns the physical range.
>      */

LGTM.

Thanks,
Muchun=
