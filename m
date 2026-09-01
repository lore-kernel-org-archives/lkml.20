Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7089331194C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788243869; cv=none; b=XJ5itAE0JfilE4Ol0LZK1z+b6lvv1n+Nu6JouKnjFxv1HH6sLmm0BpOpxTLo12LicxuYnVMzUlzeTECWwUK3LHwarR52f5up8hkaW/rWRnLu09Us2MDD8M739AG82O+NwIZcLODaHieaMywC0/4HntySK+ZE2o5P8Gu3/U+DUb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788243869; c=relaxed/simple;
	bh=yGLpijKUnjl1pokicm77fJ/NhLlkoUbwE3wNND1awVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=krSww/gyC2mG3u5SuU+peNqhQEFZXx4Ipn22oWpRpXfRQux/921PS43+6u3a6DrjxbIbsCLN5QORJrhkjGk/z8dNVQSxXqfD2jY49RHCTjmQaKwdcvMEuVHZAkzftN08a0sw5jUzlPdT8tivQPnsJt4I3+lf+HRAM5qtxM/uOZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bH/tFopJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bH/tFopJ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA2811756;
	Mon, 31 Aug 2026 23:24:22 -0700 (PDT)
Received: from [10.164.19.53] (unknown [10.164.19.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 40DCF3F85F;
	Mon, 31 Aug 2026 23:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788243866; bh=yGLpijKUnjl1pokicm77fJ/NhLlkoUbwE3wNND1awVA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bH/tFopJqfTyFZdaC2O5krSp6aX3s4cOqW1YfXSVEx7FdoXaPlQDAuMXyICg02PKP
	 o0Nm7zjaLI95sCxwUqMzNrvLVC961DwPDaKG5yy/XqXZFrLCCihKnmxI1PdpBd9XYJ
	 c1SJppfR2ExblfSqCMlH/X3uQuTDi5m4qZGeA/NA=
Message-ID: <55e7bc2a-dfdd-4cbb-9bf6-ea3bf4b03cce@arm.com>
Date: Tue, 1 Sep 2026 11:54:17 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] mm: move anon-exclusive batch helper to mm.h
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 hughd@google.com, chrisl@kernel.org, kasong@tencent.com, riel@surriel.com,
 liam@infradead.org, vbabka@kernel.org, harry@kernel.org, jannh@google.com,
 lance.yang@linux.dev, baolin.wang@linux.alibaba.com,
 shikemeng@huaweicloud.com, nphamcs@gmail.com, baoquan.he@linux.dev,
 youngjun.park@lge.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, pfalcato@suse.de,
 ryan.roberts@arm.com, anshuman.khandual@arm.com
References: <20260901054358.4049095-1-dev.jain@arm.com>
 <20260901054358.4049095-4-dev.jain@arm.com>
 <CAGsJ_4yGFBRv-C3UV-G1tB0HUmhVvJL6ac5x_Dtu9NSGk9BGzw@mail.gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <CAGsJ_4yGFBRv-C3UV-G1tB0HUmhVvJL6ac5x_Dtu9NSGk9BGzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 01/09/26 11:19 am, Barry Song wrote:
> On Tue, Sep 1, 2026 at 1:44 PM Dev Jain <dev.jain@arm.com> wrote:
>>
>> In preparation for optimizing large folio unmapping, we need to reuse
>> the page_anon_exclusive_batch helper in rmap.c and rmap.h and obey the
>> existing use in mprotect.c .
>>
>> Therefore, move it from mprotect.c to mm.h. Gate with CONFIG_MMU since
>> both rmap and mprotect users are built only for CONFIG_MMU.
>>
>> While at it, change start_idx and max_len to unsigned long type for
>> future proofing against THP support at >= PUD level. Also shorten
>> expected_anon_exclusive -> anon_exclusive.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>  include/linux/mm.h | 19 +++++++++++++++++++
>>  mm/mprotect.c      | 17 -----------------
>>  2 files changed, 19 insertions(+), 17 deletions(-)
>>
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index dd09c438fa23e..63da8813bc5df 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -244,6 +244,25 @@ static inline unsigned long folio_page_idx(const struct folio *folio,
>>         return page - &folio->page;
>>  }
>>
>> +#ifdef CONFIG_MMU
>> +/*
>> + * Get max length of consecutive PTEs pointing to PageAnonExclusive() pages or
>> + * !PageAnonExclusive() pages, starting from start_idx. Caller must enforce
>> + * that the PTEs point to consecutive pages of the same anon large folio.
>> + */
>> +static __always_inline int page_anon_exclusive_batch(unsigned long start_idx,
>> +               unsigned long max_len, struct page *first_page, bool anon_exclusive)
>> +{
>> +       int idx;
>> +
>> +       for (idx = start_idx + 1; idx < start_idx + max_len; ++idx) {
>> +               if (anon_exclusive != PageAnonExclusive(first_page + idx))
>> +                       break;
>> +       }
>> +       return idx - start_idx;
>> +}
>> +#endif
>> +
> 
> Hi Dev,
> 
> I really don't want everything to become a top-level header
> file. If these are only mm-internal things, could we move them
> to mm/internal.h or another more appropriate header?

What do you suggest? I had it in mm/internal.h initially, but
because I had to use the helper this time in patch 4, I couldn't
do that. The helper will now be used by mprotect.c, rmap.c and
rmap.h.

I can keep it in rmap.h and make mprotect.c include rmap.h too.


> 
> Best Regards
> Barry

