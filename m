Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792492390;
	b=sQajjs63gkBxbKjC6iQYAk1FC7Ae7hCn36TZklJzAXHLEolzG4w89wnpUJ6KCI6s17n4
	 fxMrOrQc7ZNygc9V+4kYPlHqH4PH2Pn9l4jQkhYoovsal1P8pgVVcZLEEKfLowi4ZChGu
	 /yoNWoWJZUCa6JTIOJ6tA4hi4i8PlV/Noe3miTAFb58XZ+oPouLuvAbtlauDMElKDibFA
	 3cgN7DCcrvYTcUYCC/4ym44XX9htncqJXWqXWuFG3pMh7XaswYd08ifKkTFuqdosxUFml
	 vXS0XMyiDg2occlIFRodFbIjb9GwE5UaU3GW1K+A8U1QHuGrTvzKqxHhku1/j/GWGPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492390;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=FihuiNID/Pk5K/0ONXyOSOSNJje8QjS2ThIwMHmFPbk=;
	b=pep2lhv7GFazzJJyCm+zMWWQrgqhEqlKde+XrZqgTat9QYadYa7Fqz0ID2gcpyWeqqjZ
	 FEuUEONFboDFrvhVPgDCMEVakzXVDLLDHNzsunNcyuBwa06gplKuL3a5rT0MnK8DzieS5
	 pHIxWhnKruJJg0DlBKc1cgoHj8POTklMDRtleeF1VMoCDYh0+6QUHyRCwm0ZhpJiIsrD3
	 8yBAlnqP8J22gni282nbOW4jFiA1/b6KMtaVwOtvfe017e5qnSaWRzO9r0EoqnoFdbfxG
	 uVY7LZ1nzRfoj6qVXEV8cAvvZz8X+SNweX6Sg0c/yfnf0v3GYkrjnS5PPu4Ua36e/OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OESRhMpe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2B7606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OESRhMpe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA6B91F000C4;
	Tue, 20 Oct 2026 10:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792492389;
	bh=FihuiNID/Pk5K/0ONXyOSOSNJje8QjS2ThIwMHmFPbk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OESRhMpeLDUSaKFGrPf+6FmN6yHuBITxtUHklGUlHeJRR6FAaH6Yj3spEbEXpAejG
	 oZO5WDKIm+m7WJLnydupi9P2UsZuT10iJxyqQr+/aG3ByqyQyl7/AtOqrw0QXMLgcu
	 nvfjWrVd1F5fvqAIN0QxmCqMMdo7XwuMbfJDjMbQtuHBlFz4YH+Swf3+vv+YldUTMq
	 qNnhocpZRPCy4vgJmr9QaoPVR4BKXcJSQFg5LDCvz2UuGIZFOREUm6eFO4RnpXopzv
	 zvmTiuyZlMRYaoeRUwM63AFx++PevK7IAQtttP2Q1A1LMFVIH6q0ptEp7QZkOgmH63
	 w0/bi/wRRsSbQ==
Message-ID: <baf5943f-b3fc-4a8d-85cf-bd897bb9a08a@kernel.org>
Date: Tue, 20 Oct 2026 12:33:05 +0200
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
Subject: Re: [PATCH V2 2/3] mm/hugetlb: disable PMD sharing for UFFD missing
 mode
To: Mike Rapoport <rppt@kernel.org>, Li Zhe <lizhe.67@bytedance.com>
Cc: muchun.song@linux.dev, osalvador@suse.de, akpm@linux-foundation.org,
 peterx@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261019113034.97690-1-lizhe.67@bytedance.com>
 <20261019113034.97690-3-lizhe.67@bytedance.com> <atc-PW2PirXZzNZh@kernel.org>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <atc-PW2PirXZzNZh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/20/26 12:11, Mike Rapoport wrote:
> On Mon, Oct 19, 2026 at 07:30:33PM +0800, Li Zhe wrote:
>> From: "David Hildenbrand (Arm)" <david@kernel.org>
>>
>> For UFFDIO_POISON to install a poison marker in a hugetlb mapping, it is
>> sufficient to have the VMA registered for missing mode.
>>
>> However, UFFD missing mode does currently not block PMD table sharing, so
>> installing the marker will be visible to everyone using the shared PMD
>> table, which is wrong as UFFDIO_POISON must stay local to the process.
>>
>> To fix it, include VM_UFFD_MISSING in uffd_disable_huge_pmd_share(). Add
>> a debug check on the marker installation path.
>>
>> The existing registration path will then unshare PMD tables, and
>> subsequent faults will not share them while the mapping remains
>> registered.
>>
>> The alternative would be to unshare PMD tables selectively when
>> installing poison markers, which results in way more complexity. Or
>> alternatively, simply failing the marker installation, which might break
>> some use cases.
>>
>> This effectively disables PMD sharing for missing-mode registrations
>> that never use UFFDIO_POISON.
>>
>> Suggested-by: Li Zhe <lizhe.67@bytedance.com>
>> Fixes: 8a13897fb0da ("mm: userfaultfd: support UFFDIO_POISON for hugetlbfs")
>> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
>> ---
>>  include/linux/userfaultfd_k.h | 13 +++++++++----
>>  mm/hugetlb.c                  |  1 +
>>  2 files changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.h
>> index a4351cffc60c..fe78ba14dc68 100644
>> --- a/include/linux/userfaultfd_k.h
>> +++ b/include/linux/userfaultfd_k.h
>> @@ -169,7 +169,10 @@ static inline bool is_mergeable_vm_userfaultfd_ctx(struct vm_area_struct *vma,
>>  }
>>  
>>  /*
>> - * Never enable huge pmd sharing on some uffd registered vmas:
>> + * Never enable huge pmd sharing on the following VMAs:
>> + *
>> + * - VM_UFFD_MISSING VMAs, because UFFDIO_POISON may install markers and we
>> + *   want PMD tables to be unshared when installing these markers already.
>>   *
>>   * - VM_UFFD_WP and VM_UFFD_RWP VMAs, because the write protect / access
>>   *   tracking information is per pgtable entry.
>> @@ -182,9 +185,11 @@ static inline bool is_mergeable_vm_userfaultfd_ctx(struct vm_area_struct *vma,
>>   */
>>  static inline bool uffd_disable_huge_pmd_share(struct vm_area_struct *vma)
>>  {
>> -	return vma_test_any_mask(vma,
>> -		mk_vma_flags_from_masks(VMA_UFFD_WP, VMA_UFFD_RWP,
>> -					VMA_UFFD_MINOR));
>> +	const vma_flags_t uffd_flags =
>> +		mk_vma_flags_from_masks(VMA_UFFD_MISSING, VMA_UFFD_WP,
>> +					VMA_UFFD_RWP, VMA_UFFD_MINOR);
> 
> Since this essentially disable pmd sharing for any uffd mode, maybe replace
> the flags check with the check for non-NULL userfaultfd_ctx?

That would likely even better and we can just simplify the comments as well.

-- 
Cheers,

David
