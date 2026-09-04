Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C91C4756CA
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519392; cv=none; b=u+iiz5M4yEtt+kEceYYZ3U0U161PwHGq7XfsGs+c9gsK3z0cbuqongl5JdwBYOuZp/7H70UJW0f16opM+yYtVSIdNLy8IIOQCclbdbRsuPOQu3suCXSC1aN7g3QcUuCKdNw8XqpHBjo26QykplISBNBMT8+pfxBmYn18K52Fr8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519392; c=relaxed/simple;
	bh=Jo0Cg8nB4834KwQthZNdLPhYT1OJ9nMS3OZvbrsYpgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HGOXjadYmfd+moHimiyF6W/WnA2a3qdXvDsdM9ma/eTgurjEJPsS8XDpBpidsLiXsW4h/ZaLV1cvttXbnRCIATV1rkUTKAn3PWFUoeJX1PmOgM8/1xtN5TnegXmU74wd/Bz/G6LT3zUlPaq3IqD0ltaNl3nn4sBJ8h1YgNIz82E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=S2rNmhuT; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="S2rNmhuT"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87EB5153B;
	Fri,  4 Sep 2026 03:56:25 -0700 (PDT)
Received: from [10.57.81.239] (unknown [10.57.81.239])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F2533F673;
	Fri,  4 Sep 2026 03:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788519389; bh=Jo0Cg8nB4834KwQthZNdLPhYT1OJ9nMS3OZvbrsYpgI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S2rNmhuTTmENs918kTR+Q1XiOPxk9ktuHnukft7JoZ92m+dYWAtk5PqOQ/TfRAMp8
	 bDALhVnplbiEnx2XLIpzsuIvyHVlcN/TSD7l+dGLfUtdERLg8jTfAMUglWLLiKleJo
	 7qGXyqfOJ0GL33LVnVUxEzrw4r7KufRGNKImHiTg=
Message-ID: <78638e8a-4919-4c2b-b6d8-dadc7a981709@arm.com>
Date: Fri, 4 Sep 2026 11:56:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: hugetlb: fix BBM for mprotect() on contiguous PTEs
To: Will Deacon <will@kernel.org>, Dev Jain <dev.jain@arm.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20260901131823.15799-1-kmehltretter@gmail.com>
 <551663b9-d031-4755-af7f-dc6c22524b35@arm.com>
 <aplP1oUjx96O_I69@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <aplP1oUjx96O_I69@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/09/2026 11:45, Will Deacon wrote:
> On Wed, Sep 02, 2026 at 08:16:36PM +0530, Dev Jain wrote:
>>
>>
>> On 01/09/26 6:48 pm, Karl Mehltretter wrote:
>>> huge_ptep_modify_prot_start() clears a hugetlb entry before changing its
>>> permissions. For contiguous PTE mappings, break-before-make (BBM)
>>> requires a TLB invalidation after clearing the set and before making any
>>> entry valid again.
>>>
>>> Commit fb396bb459c1 ("arm64/hugetlb: Drop TLB flush from
>>> get_clear_flush()") removed this invalidation, relying on the deferred
>>> flush from the core code. Commit 410982303772 ("arm64: hugetlb: Restore
>>> TLB invalidation for BBM on contiguous ptes") restored it for
>>> huge_ptep_set_{access_flags,wrprotect}(), since a deferred flush is too
>>> late for the break step. The modify-prot path has the same problem.
>>>
>>> Use huge_ptep_clear_flush() for contiguous entries so that the TLB is
>>> invalidated during the break step. Leave huge_ptep_get_and_clear()
>>> unchanged because it is also used by teardown paths, where the deferred
>>> flush is sufficient.
>>>
>>> Fixes: fb396bb459c1 ("arm64/hugetlb: Drop TLB flush from get_clear_flush()")
>>> Assisted-by: LLM
>>> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
>>> ---
>>
>> The transition happening here is:
>>
>> old_prot+cont -> zero -> new_prot+cont ... (i)
>> and then TLB flush.
>>
>> Arm Arm rule R_JQQTC says:
>> "For a TLB lookup in a contiguous region mapped by translation table entries
>> that have consistent values for the Contiguous bit, but have the OA, attributes,
>> or permissions misprogrammed, that TLB lookup is permitted to produce an OA,
>> access permissions, and memory attributes that are consistent with any one
>> of the programmed translation table values."
>>
>> This implies that a live update like
>> old_prot+cont -> new_prot+cont then TLB flush ... (ii)
>>
>> is safe. Which should also imply that the transition (i) is safe,
>> since the configurations the PE can observe for (ii) is the same
>> for (i), except that in (ii) the PE can fault too, which is fine.
> 
> I'm not sure I agree. As written, the text above says that if the
> permissions are misprogrammed (which they are in this case) then the TLB
> can produce an OA consistent with any of the entries. Hopefully it just
> needs some further clarification.

I'm not sure I understand your concern here. Is your concern that the OA could
be pulled from one of the invalid entries? The intent is that any entry that
does not have the VALID bit set is not considered an "entry" within the
"contiguous range" for the purposes of this. (because it is invalid).

That's implied (if you squint) from:

IPGVGZ: The Contiguous bit is present only in valid Block and Page translation
table descriptors, and therefore neither of the following configurations are
considered as misprogramming of the Contiguous bit:
  - A contiguous range of descriptors that are each either invalid, or valid
    with Contiguous set to 1.
  - A contiguous range of descriptors that are each either invalid, or valid
    with Contiguous set to 0.

In general I am of the opinion that the rules around contiguous mappings are not
as clear as they could be and the VMSA architect has indicated that he hopes to
clean them up over time. Bit I don't quite see your concern in this case.


> 
> There are probably also cases where we're changing the attributes and the
> permissions at the same time, so it's not clear to me that it's safe to
> allow those to be inconsistent (e.g. tagged/guarded vs read/write). If
> I was going from untagged read/write -> tagged read-only then I presumably
> wouldn't expect to see a tag check fault on a write?

Again, I'm not sure I follow, but I'll take a stab. I think you're implying that
a write permission fault should take precedence over a tag check fault? (I have
no idea off the top of my head). And you're further implying that with this
transition the HW might see an intermediate "tagged read/write" entry, and if it
does then it will raise a tag check fault, not a write fault for an attempted
write. But I don't see how R_JQQTC permits that because it says "consistent with
any one of the programmed translation table values" so the HW can't pick
attributes from one entry and permissions from another. It will either see the
old "untagged read/write" or the new "tagged read-only".

Sorry if I've missed the point!!

Thanks,
Ryan


> 
> Will

