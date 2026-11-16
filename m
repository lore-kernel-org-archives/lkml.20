Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868038;
	b=WQNsY5IxDw9a7Nknutx+0wX2QHoFq483id9ITsHPAzeKhESC2/HL73+CQUjxHiRd8iNe
	 AwPevPnFAwdfpcxnssHYAjgXVevvFBZIqkMx3l1aeFANumOVwsdhiEpXZxHsuvhKUDtgo
	 Bo0yThi1cEO+tzygOOecEfpKiVWrw4l+DRCD5Ldzpo4koOo2VR0fcJotU3J578Pvi8AVj
	 c7jaXHP+ZZHMyHyIgDknofZ8T8JgEd1AGH+OzRE/XWais/B6XMmad2jOlAeTxCxh7qUYw
	 dtPaxy4eDNHerhfWcNUtMUs/aP7n50XtdljmrQ+iRUTYXPKm38J14X+qTO/6mDs86cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868038;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4vyYjn5UPo/7vDc4ZQ9k3Cq0mbqo2jzpmjoiYSVxIwk=;
	b=H/IR0aL9bDJCCK4AqEXMJCcP7mqBarRRKrJBsQD/7do43BiPtCqnlX404wRHQ4RrAShP
	 +hWO/TDTmu6UZm7ojl51FpIkJnIUqoWY0MVtIH1/R+N5ilUmxJAsiDcTlv6KA868DGjaN
	 b6lDbnztfkFQkt2+PyCldpwV02A68nLK3/2wFKQ3EaMt++orPbYw2HEkQG7xjTsZkNDuT
	 l2O7P8SIb1xbeIQ4G4Y9lHH7bwu3fmvGV4f+BACI0UNArT/vCnf/eD41+haUvlSN/YCqw
	 s1gVYG4+J2tKL8lOhhGb2cVeRAoAhFdxb8Qv2xH64DEnQcV7crkEgvayK/ibxJXEeRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=X90VZJBR;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=OqjQShhK;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606A5606A8A1
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:27:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 606A5606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=X90VZJBR;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=OqjQShhK
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGLZ0gr1763962
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:27:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=4vyY
	jn5UPo/7vDc4ZQ9k3Cq0mbqo2jzpmjoiYSVxIwk=; b=X90VZJBRvXvcQtWvtSML
	cYnBp83zg3R4X+C8UXFrR/0ste+aFkHEr5U77ylXLx4BUEcLYtTW6B1yLY5tikag
	7hbIrco84ujOdJmB2/epEniEGsLrXYXe1ogsWavEfw24C3fPqOCdzA4WKEAhAoyl
	W+BiUtmuvDa6x3vhdpUGfQ5zewpasoXg2DTVzpK9IPd5mjYO/hG+kBfhrQrDAV0h
	TUtAwtC3EWjhSAGNAofYPlS0P3Hgb+oa8+ffNiiYvUKtYpZ8PZri4s2OAy1x1STh
	BOsI2Jk34RJ5O2MDTpfuwmsMD70Zy63yJ+SR5N0pc/kQZMhE9m5dnWGWEc5XOo47
	cw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j059hk91r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:27:17 -0500 (EST)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91f1b3070f2so33599076d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794868036; x=1795472836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4vyYjn5UPo/7vDc4ZQ9k3Cq0mbqo2jzpmjoiYSVxIwk=;
        b=OqjQShhKdsOzCEp9sDHRO07pMjPNWkhEsx5D9hKW4kZheIOMb36jRTMc0L6Bqe//Ix
         iftZ7ACLorkN1cC+x3lModR96EeXDIMQmNlssDAivIm7xwEBJRBakvSxealfGnpLw8yA
         jpC/fUhORfKNP5xoxMVYgTjOZLcMGEqNvHSb09jtOP3J367nOTh8rVAT+/ggq0642FSb
         Tg+VZvLepva5YrgLaXV/zDo2CURzn3tBpMki+mjgjQxqkRRj5XT9zYQBCBr4DCmr2I4f
         rnEclJLdHDRCXy2OxQtXvH8bW2+p4neBZc2SIFa/BN5OS9ElMNZLdlIKoXBSlHk10bKF
         0Niw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794868036; x=1795472836;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4vyYjn5UPo/7vDc4ZQ9k3Cq0mbqo2jzpmjoiYSVxIwk=;
        b=WFv69rYGDieZeT1SZ5TPuK0nhYQZWGev8kpH1CC0KnPhQ2ET1tjCr9bewxTmzk5Vrk
         VjZo3EJNl7fY0RyudS4xcGp1Vti4grM50kC9twcfoYEi6SejywkyrAahallNt89J63UK
         N78dy31DJSM2VvfDeIY88M7TbsFrMdZYtiqDc3R/CQXQclZLuOAa4OGGW4B3uoxU3dLk
         6ko0/DDOwD/g6i82FKkn2wVDv7Gn7t410uvEVtURw1q5NH5Lbbcjuot+EEkcQ6ZDHAEm
         3uxvVUy1m994LQLj6S9hN+ZUFjF7lEMJ+NhoarLBMAapkzjXlyWKkC8b0Urp0/ikY9TR
         adsg==
X-Forwarded-Encrypted: i=1; AL+hErEO/PEYT8w9cAU9uQlrgPCxstbgx7cd9qDaXw89ErnC8Y0QnyjBtKKIbWr7rkfOAQkQWcBE7EhRX1UMVDI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yX93YLon4UoW1qbveCRdLtRKiayDbaeUHUCzfFrzyeAvPZURv
	z7xZMzEFB72mlPYRlI7zsKG3Fe07QaJgWm5gzaR+E5M8QIN0bS1h3wUpBwfFVmgOrTSQWOqA62K
	AhrDMLKjQsUq+NpaK3+vYCmT9dR3gdngBsk3yiIS5un2mRipFlLyG84rR8qpJfA==
X-Gm-Gg: AYBFou0DObu6+lTQirOWhrOCkTfjJqjLwNd1Dur8a196NvqqDL+vkUvoStV4zMutJsC
	3woQoCWVk3fydHFeNycofJn3rAQY54O6dLQ431VXLTVc76QzP+nMFmlxKC828d8C+K3dw1u9apF
	9iEdOrTU9+xoI0iFBI3wTx2R1NDw5D0BbuGUZSGy0DZD+04pDn7pM8tX5epxwfrLlUGFyg9x3Rp
	m1nLrfauo8186Qc/GeNmCzVg0TElgT/MBNOsfnWmJ9Gy8rNnyn2mUlU8hg0meEaU1pBMqvQJlYF
	G43O29/zfmuQwP3md2xEdVknOJ9Q4tP+yQmUoo+EPAigG8Pb2lMcrrldf7sJ7VzY+fBkRrHkK04
	93ofB/c58INw/yupTl0t1TLEiLgNTKBkj4u9pzaTKfDy99Pd+o1CxwhLdxfeyjBd4gC3c81K9BP
	eCSBfUolY92gjTRAck+nEWGIvd
X-Received: by 2002:a05:622a:4188:b0:55d:34d4:12f1 with SMTP id d75a77b69052e-55d34d41f99mr93205841cf.34.1794868035998;
        Mon, 16 Nov 2026 14:27:15 -0800 (PST)
X-Received: by 2002:a05:622a:4188:b0:55d:34d4:12f1 with SMTP id d75a77b69052e-55d34d41f99mr93205151cf.34.1794868035325;
        Mon, 16 Nov 2026 14:27:15 -0800 (PST)
Received: from [10.207.2.125] (nat-128-59-176-174.net.columbia.edu. [128.59.176.174])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55c3b7a4adbsm66513611cf.19.2026.11.16.14.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:27:14 -0800 (PST)
Message-ID: <eba4fb71-6baa-455f-8899-87567af898aa@columbia.edu>
Date: Mon, 16 Nov 2026 17:27:13 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] userfaultfd: use anonymous memory for
 UFFDIO_ZEROPAGE on private file mappings
To: "David Hildenbrand (Arm)" <david@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>, Peter Xu <peterx@redhat.com>,
        James Houghton <jthoughton@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Balbir Singh <balbirs@nvidia.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
        Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andrei Vagin <avagin@gmail.com>,
        Muhammad Usama Anjum <usama.anjum@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang
 <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
        Kiryl Shutsemau <kas@kernel.org>, Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, stable@vger.kernel.org
References: <20261116-uffd-state-fixes-v2-0-4397a0196479@columbia.edu>
 <20261116-uffd-state-fixes-v2-1-4397a0196479@columbia.edu>
 <cc865bc8-b96f-4385-97b1-976de4465ca1@kernel.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <cc865bc8-b96f-4385-97b1-976de4465ca1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -KGmoE5ZHnO7qPuufcGhZ_oWHKBkfQSX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4OSBTYWx0ZWRfX0YX/hvFP62QT
 PX9LQMWWIsV0/8lV9L4Ktl8inggPxj9rdz8ckV1OGs4P6zPkB2JVtLXpo+NF2kiKDQZRjQqMOvF
 QDUPu/UKJUFGjiUmOiMqMEE7MlcUmV1aFOjoQicZ5ctSBrdA7xzO
X-Proofpoint-GUID: -KGmoE5ZHnO7qPuufcGhZ_oWHKBkfQSX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4OSBTYWx0ZWRfX7sel1ZWeaOba
 kIHMLCXDIuBwtiE+ufYBweGtoGf95r8J2mujfG1l/yWHi1VVJKPZKysx7HKdcJ6FgMeDfh6eY9F
 KxaX9Nx6z1K7tzMTm7Iq0otoXPeoJZccVF+exDtDKNA265yG7fJM6+VDkP/4E56XXE3NNkF7jP0
 Oqs54MPgIzEtB7RUATOZ/ydkkdfnjPpnBuFp1tCwmkUIS1DV06wlmV4tkYmhyAHkD95L0h7WlRL
 3FvHYzzxJB3uQS+hVSGavCvrOOjSna78SZzr6WUJpL4ThLLaQHw9CZnVAHGbPvpwI40Hs0FKO8w
 l/F3E9lP/vDhKNsBZBdSVo0wc9HF8HNo8kWfgQzXxeKMf8U+THjp49woNlYaDnRwFwHHwjGdIdo
 JplzsBMXAaNVO17+23pmJ699LiFLhUPb1xoaMfdozriJdmyZ4exViuBCOHlZ5WfUpWRokdVQpC2
 Vqln8fZ4MQ4FrkmQ56w==
X-Authority-Analysis: v=2.4 cv=NLlAaE6g c=1 sm=1 tr=0 ts=6afb8345 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=VwQbUJbxAAAA:8 a=U30RilsMMHCo0eZBjZ0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=10 clxscore=1015 spamscore=0
 suspectscore=0 bulkscore=10 lowpriorityscore=10 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160089

On 11/16/26 3:16 PM, David Hildenbrand (Arm) wrote:
> On 11/16/26 21:02, Tal Zussman wrote:
>> If the mm cannot map the shared zero page, UFFDIO_ZEROPAGE falls back to
>> mfill_atomic_pte_zeroed_folio(), which allocates a zeroed folio and
>> installs it through vma_uffd_ops(), no matter what kind of mapping it
>> is. An s390 KVM guest with storage keys or protected virtualization is
>> such an mm.
>> 
>> For a MAP_PRIVATE shmem mapping, that adds the zeroed folio to the page
>> cache of the file. That is wrong: a private mapping must never modify
>> the file it maps, and the file might even be mapped from a read-only fd.
>> 
>> The ioctl can also fail where it should succeed. A missing fault is only
>> delivered for a hole in the file, but UFFDIO_ZEROPAGE can be called on
>> an address that did not fault, or can race with a write to the file. If
>> the file has a page at that offset by then, inserting the zeroed folio
>> fails and the ioctl returns -EEXIST although nothing is mapped at the
>> destination address.
>> 
>> What we want is what UFFDIO_ZEROPAGE does on a private mapping when the
>> shared zero page can be used, and what UFFDIO_COPY does: only check that
>> nothing is mapped at the destination address, map zeroed memory there,
>> and leave the page cache alone. The zeroed folio path did that before it
>> was moved to vm_uffd_ops.
>> 
>> To fix it, pick the ops in the common folio path, as
>> mfill_atomic_pte_copy() did for UFFDIO_COPY: anon_uffd_ops for a private
>> mapping, the ops of the VMA otherwise. That makes
>> mfill_atomic_pte_copy() and mfill_atomic_pte_zeroed_folio() redundant,
>> so remove them and rename __mfill_atomic_pte() to
>> mfill_atomic_pte_folio().
>> 
>> UFFDIO_ZEROPAGE no longer modifies the file, and only fails with -EEXIST
>> if something is already mapped at the destination address.
>> 
>> Fixes: f74991b4e383 ("shmem, userfaultfd: implement shmem uffd operations using vm_uffd_ops")
>> Cc: stable@vger.kernel.org
>> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
>> ---
>>  mm/userfaultfd.c | 46 ++++++++++++++++------------------------------
>>  1 file changed, 16 insertions(+), 30 deletions(-)
>> 
>> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
>> index d65184d9a480..61a712e1f9f5 100644
>> --- a/mm/userfaultfd.c
>> +++ b/mm/userfaultfd.c
>> @@ -531,15 +531,27 @@ static int mfill_copy_folio_retry(struct mfill_state *mfill_state,
>>  	return 0;
>>  }
>>  
>> -static int __mfill_atomic_pte(struct mfill_state *state,
>> -			      const struct vm_uffd_ops *ops)
>> +static int mfill_atomic_pte_folio(struct mfill_state *state)
>>  {
>> +	const struct vm_uffd_ops *ops = vma_uffd_ops(state->vma);
>>  	unsigned long dst_addr = state->dst_addr;
>>  	unsigned long src_addr = state->src_addr;
>>  	uffd_flags_t flags = state->flags;
>>  	struct folio *folio;
>>  	int ret;
>>  
>> +	/*
>> +	 * The normal page fault path for a MAP_PRIVATE mapping in a
>> +	 * file-backed VMA will invoke the fault, fill the hole in the file and
>> +	 * COW it right away. The result generates plain anonymous memory.
>> +	 * So when we are asked to fill a hole in a MAP_PRIVATE mapping, we'll
>> +	 * generate anonymous memory directly without actually filling the
>> +	 * hole. For the MAP_PRIVATE case the robustness check only happens in
>> +	 * the pagetable (to verify it's still none) and not in the page cache.
>> +	 */
>> +	if (!(state->vma->vm_flags & VM_SHARED))
>> +		ops = &anon_uffd_ops;
> 
> Oh, but one comment: why not check for actual cow mappings?
> 
> 	vma_is_cow_mapping()
> 
> is your friend :)
> 

Probably because I didn't know about it :)

This is already equivalent since uffd registration rejects VMAs without
VM_MAYWRITE, but I can switch it over for consistency.

> -- 
> Cheers,
> 
> David
> 

