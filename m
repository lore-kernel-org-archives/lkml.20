Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792552295;
	b=NhMQ66oMQ9HqyAORBqRh+cdJmiHTonOX5x9XktdOt1d1Ld1dFbET+wPcsXu/MPdDVMrb
	 1NEURBzt5JwGXg2fT7AdaWP8nmPN9skd0f+lsj0zl8gScYMqR1X0Qn3eQ+5OLqn5ybKg1
	 JYPmGFOEOPWXLjGpUPZLtrtNLy5rwSfGA21B63Ignc5OMopi6/QhPuc1WrC9G6cq2zrch
	 faEepwZwoQe1vz79CqoPnEPlYGMddxG+Oj58u5XTznbog9SN2FQCYW9nYGL9fq8SjU9Vf
	 deN9V8hQPZK63sf6myp0P5tunXArfjH21SrwPs6lcqmVnTAIjMnbK9aKP/+wc0A22MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792552295;
	h=DMARC-Filter:DKIM-Signature:Cc:From:In-Reply-To:References:To:
	 Subject:Message-Id:Content-Type:User-Agent:X-Original-From:
	 Mime-Version:Date:X-Lms-Return-Path:Content-Transfer-Encoding;
	bh=ufXaEJ5FT5/RcC09d0BBVVpoSwGEekPNmNdSpG+1s5Q=;
	b=Tm9vpcFK0O0GA7TdM4tONgxwmfdfNU/3Cuy3MS7XES0M8Ay9ZTVqZs7OkDk2skRdX4Gc
	 aja/nBxijjV+cztL5GvEZ9uiy2fV7KZTEJUSNpVBitl1mDdTIFprjBXP27qSezmeI2l96
	 1SKeP5DbbizobygWTpE9SW+5w12opP2mMyEBFe8CYXx8FNkFkan4TiSsEHxLMy1LS0WJP
	 VzLSyAFDBoing2GaZfccK3NJVpM6Pmpgx0VmSgu3eM8tHP1ffz84EjDq8e4FFPyaKGCVY
	 hEPDg9MHtw3bHc/rdulJv8S8HN/E++LPPeHydBA0NZoSmweBZ6aysvHJpR/e+tdxrBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=mAwkOS5z;
	arc=none smtp.remote-ip=209.127.230.113
Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E83F606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E83F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=mAwkOS5z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792552282; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=ufXaEJ5FT5/RcC09d0BBVVpoSwGEekPNmNdSpG+1s5Q=;
 b=mAwkOS5zqZTFOgV3LjWz+7WF2II21+yNxjhrZeHKy3uFxx1LJ0d+2Ui6OnnC8OjJRzUpxd
 qQTMD1GjQKnkLgyohVj0e8YrmlyLJiucuBu4Q0Ce/W6eDNJ1sgUFoMo/9Uw7U86OMvqFRu
 wFUaBQTFJkWOTexddc4+XClZFzu7w97iswzEZkHxWUFlSCoIucA0sqrlghfPiA4pOilMF0
 LRChy7y3c26jA2M3KlaKR7125CNxkVi1rnyNaCFkJ0g0j6ybflUIN0A9XS3lWXGcLlBRr5
 pPXcBnbzX61bCCdn++OmMdDTd5FO/jjSnH2OMxrHSbngKzjw9CWPmnkKyy7Dsg==
Cc: <muchun.song@linux.dev>, <osalvador@suse.de>, 
	<akpm@linux-foundation.org>, <peterx@redhat.com>, <linux-mm@kvack.org>, 
	<linux-kernel@vger.kernel.org>
From: "Li Zhe" <lizhe.67@bytedance.com>
In-Reply-To: <baf5943f-b3fc-4a8d-85cf-bd897bb9a08a@kernel.org>
References: <20261019113034.97690-1-lizhe.67@bytedance.com> <20261019113034.97690-3-lizhe.67@bytedance.com> <atc-PW2PirXZzNZh@kernel.org> <baf5943f-b3fc-4a8d-85cf-bd897bb9a08a@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>, 
	"Mike Rapoport" <rppt@kernel.org>
Subject: Re: [PATCH V2 2/3] mm/hugetlb: disable PMD sharing for UFFD missing mode
Message-Id: <904487b4-a838-4d57-a297-12163136279d@bytedance.com>
Content-Type: text/plain; charset=UTF-8
User-Agent: Mozilla Thunderbird
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Date: Wed, 21 Oct 2026 11:11:05 +0800
X-Lms-Return-Path: <lba+26ad82d58+b6655d+vger.kernel.org+lizhe.67@bytedance.com>
Content-Transfer-Encoding: 7bit

On 10/20/26 6:33 PM, David Hildenbrand (Arm) wrote:
> On 10/20/26 12:11, Mike Rapoport wrote:
>> On Mon, Oct 19, 2026 at 07:30:33PM +0800, Li Zhe wrote:
>>> From: "David Hildenbrand (Arm)" <david@kernel.org>
>>>
>>> For UFFDIO_POISON to install a poison marker in a hugetlb mapping, it is
>>> sufficient to have the VMA registered for missing mode.
>>>
>>> However, UFFD missing mode does currently not block PMD table sharing, so
>>> installing the marker will be visible to everyone using the shared PMD
>>> table, which is wrong as UFFDIO_POISON must stay local to the process.
>>>
>>> To fix it, include VM_UFFD_MISSING in uffd_disable_huge_pmd_share(). Add
>>> a debug check on the marker installation path.
>>>
>>> The existing registration path will then unshare PMD tables, and
>>> subsequent faults will not share them while the mapping remains
>>> registered.
>>>
>>> The alternative would be to unshare PMD tables selectively when
>>> installing poison markers, which results in way more complexity. Or
>>> alternatively, simply failing the marker installation, which might break
>>> some use cases.
>>>
>>> This effectively disables PMD sharing for missing-mode registrations
>>> that never use UFFDIO_POISON.
>>>
>>> Suggested-by: Li Zhe <lizhe.67@bytedance.com>
>>> Fixes: 8a13897fb0da ("mm: userfaultfd: support UFFDIO_POISON for hugetlbfs")
>>> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>>> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
>>> ---
>>>   include/linux/userfaultfd_k.h | 13 +++++++++----
>>>   mm/hugetlb.c                  |  1 +
>>>   2 files changed, 10 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.h
>>> index a4351cffc60c..fe78ba14dc68 100644
>>> --- a/include/linux/userfaultfd_k.h
>>> +++ b/include/linux/userfaultfd_k.h
>>> @@ -169,7 +169,10 @@ static inline bool is_mergeable_vm_userfaultfd_ctx(struct vm_area_struct *vma,
>>>   }
>>>   
>>>   /*
>>> - * Never enable huge pmd sharing on some uffd registered vmas:
>>> + * Never enable huge pmd sharing on the following VMAs:
>>> + *
>>> + * - VM_UFFD_MISSING VMAs, because UFFDIO_POISON may install markers and we
>>> + *   want PMD tables to be unshared when installing these markers already.
>>>    *
>>>    * - VM_UFFD_WP and VM_UFFD_RWP VMAs, because the write protect / access
>>>    *   tracking information is per pgtable entry.
>>> @@ -182,9 +185,11 @@ static inline bool is_mergeable_vm_userfaultfd_ctx(struct vm_area_struct *vma,
>>>    */
>>>   static inline bool uffd_disable_huge_pmd_share(struct vm_area_struct *vma)
>>>   {
>>> -	return vma_test_any_mask(vma,
>>> -		mk_vma_flags_from_masks(VMA_UFFD_WP, VMA_UFFD_RWP,
>>> -					VMA_UFFD_MINOR));
>>> +	const vma_flags_t uffd_flags =
>>> +		mk_vma_flags_from_masks(VMA_UFFD_MISSING, VMA_UFFD_WP,
>>> +					VMA_UFFD_RWP, VMA_UFFD_MINOR);
>> Since this essentially disable pmd sharing for any uffd mode, maybe replace
>> the flags check with the check for non-NULL userfaultfd_ctx?
> That would likely even better and we can just simplify the comments as well.


Agreed, thanks Mike and David.

I will update uffd_disable_huge_pmd_share() in v3 to check whether the
VMA has a userfaultfd context instead of checking the individual UFFD
mode flags, and simplify the comment accordingly.

Thanks,
Zhe

