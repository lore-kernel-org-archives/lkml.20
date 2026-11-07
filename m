Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794075383;
	b=g4spoul0B0yWVeA/d4Wg95hwYBiOM29s3RIby1jCJ5DK5mNNYbDX44UHOUtH+Lt5JwBd
	 8jsSu+fqlJB+29JBQeoe0mdo5aba+KqBtLWtt4n5dAkEKim+ZR5VGO07UFDctAl3FIrtY
	 Seeea+2PRFpWDEa98DHq960j9eyoNjgnmwALNLBthEBcp6eJF2lpj5vI17f9wxqQ3CMXV
	 /VnZXjluPXN2qRRDuNFUe2FmwvMYI794NC06TVM2JHpTprLPKeC4pmu+z7WUFs5W09OP7
	 J0vS+5cBdHm1j2nB+aUD3aWQiUpoCRrV6OxzuHTC1sqK1bgQgp328JgF4PPOemgnblg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794075383;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=fcbqNqcpzKvUfzgtHCXNH24af2lOq+kn030ftGV9OnM=;
	b=MQWePQtNniSQa309aRRFhyBg6aSG6zdtdJPbjxZ7qU/dNUVxN3fhiYAzsRPlh70Loooa
	 0KSEpwwsVpwDNunLzqjuDjX/Mcp10fltc8mSQ1eRc66UfFaGrTPKVQMh9hX7r0gVENZpT
	 /GPul7V/yJtf2bCRRjyztirP12Tnmse6281ym/JPCJoIglG2NjHCJ2RjQZydPi3wUHE2W
	 fsm/jdMOdX4Ilh2mWMGKKqYOVP8PNoNlnxuGCGXW10xIl85YyKvpFgRaDXXsPPSafRPxe
	 h9BZewb8VYkCUNfRSWFJf4aUIBQ1RCMY7hRJHiOjzKfUz9ndnPcIgPDPw1Vst6pDo1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U+OJHXap;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0BF606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 18:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U+OJHXap
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 472851F0089F;
	Sat,  7 Nov 2026 18:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794075383;
	bh=fcbqNqcpzKvUfzgtHCXNH24af2lOq+kn030ftGV9OnM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=U+OJHXap11UuKLzVJkpfDYMFmCFzGDsj8L0KjObdN00RCCvLKYG7gerxG8aJ6wXIt
	 uV2K8X5IBMvcO7r0dglmzL9BAMh0DNe5KXy18EHEQh7F93oUdsMLNpyL1LXQQjNOud
	 vS0whWN6v0rUDd0fehPKXz3oRZWnFr8muUc07iODmAyKQkIztI93RX/dqtRCTBk7yd
	 2rDW/sm7aMdJ5R/WEGiXgJQ4sX8VsvorAn7AKgPz/zbtMHgI7zc2vJdS9AxobNz5XZ
	 HIDST2+SL1raR0o8mFqRbnu0VlMNKPLNcTS3BzU916LiwnjqjtMjuTPYQrWpaw93Mb
	 LSiJDibk+l22g==
Message-ID: <c15e171b-d0c2-4808-8d42-e5a650b03150@kernel.org>
Date: Sat, 7 Nov 2026 19:16:15 +0100
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
Subject: Re: mm/mremap: F_SEAL_FUTURE_WRITE can be bypassed via mremap() VMA
 expansion/duplication
To: Junyoung Jang <graypanda.inzag@gmail.com>,
 Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Liam R . Howlett" <liam@infradead.org>, Hugh Dickins <hughd@google.com>,
 Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261107030708.1031977-1-graypanda.inzag@gmail.com>
 <c243e6ab-3eb9-471c-9b6e-91064528ce82@kernel.org>
 <CAO7ntTQGLNtHiu3SY+6HaRZi5gimqjbmw_FoeTSRYpqi1EbnbQ@mail.gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <CAO7ntTQGLNtHiu3SY+6HaRZi5gimqjbmw_FoeTSRYpqi1EbnbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/7/26 16:19, Junyoung Jang wrote:
> On 11/7/26 04:07, ... wrote:
>> On 11/7/26 04:07, Junyoung Jang wrote:
>>> Hello,
>>
>> Hi,
>>
>>>
>>> I found a reproducible F_SEAL_FUTURE_WRITE seal-policy bypass. A process
>>> holding a one-page shared writable memfd mapping created before the seal can
>>> use mremap() after the seal to gain writable access to additional file pages.
>>
>> F_SEAL_FUTURE_WRITE is not really range-aware. What makes you believe that it
>> would be?
>>
>> I'd say it's expected that if someone has write access to the memfd, it has
>> write access to the whole thing, not just some subset that was obtained through
>> the initial mmap.
>>
>> Any documentation that made you believe that it works that way?
> 
> Hi,

Hi :)

> 
> Thank you for the quick feedback.
> 
> My understanding came from the following documentation and commit history:
> 
> 1. Linux man-pages: F_ADD_SEALS(2const) / fcntl(2) (under "File Sealing" ->
>    "F_SEAL_FUTURE_WRITE"):
> 
>    "The effect of this seal is similar to F_SEAL_WRITE, but the contents
>     of the file can still be modified via shared writable mappings that
>     were created prior to the seal being set. Any attempt to create a new
>     writable mapping on the file via mmap(2) will fail with EPERM.
>     Similarly, an attempt to write to the file via write(2) will fail
>     with EPERM."

Note that "mapping" here means "file mapping" not "folio/page mapping".

> 
>    (Reference: https://man7.org/linux/man-pages/man2/F_ADD_SEALS.2const.html)
> 
> 2. The original commit introducing F_SEAL_FUTURE_WRITE, commit ab3948f58ff8
>    ("mm/memfd: add an F_SEAL_FUTURE_WRITE seal to memfd"), which states
>    that the seal:
> 
>    "...prevents any future mmap and write syscalls from succeeding while
>     keeping the existing mmap active."

Right. The thing is that somebody that didn't have write access to the file
before (through an existing mmap()) won't be able to gain write access (through
a new mmap/write) later.

Expanding mmap() or mremap() modify an *existing* mapping, they don't create a
new one. I think we don't guarantee that expanding mmap works, but mremap() must
work.

> 
>    (Reference: https://git.kernel.org/linus/ab3948f58ff8)
> 
> 3. Linux man-pages: mremap(2) (man2/mremap.2, regarding old_size == 0)
>    and the comment in mm/mremap.c:check_prep_vma():
> 
>    mremap(2) documents that when old_size is 0 on a shareable mapping,
>    it behaves by "creating a new mapping". Similarly, check_prep_vma()
>    notes that "!old_len is a special case where an attempt is made to
>    'duplicate' the existing mapping".

Right, the relevant part here is:

	old = mmap(NULL, page, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);

and later (after sealing):

	expanded = mremap(old, 0, 2 * page, MREMAP_MAYMOVE);

With your reproducer:

$ sudo ./memfd_future_write_mremap_poc
writer uid=10001; mmap=EPERM; pwrite=EPERM; mremap write=Z; result=63
owner uid=10002; file page 2=Z; size=8192; result=255

Assuming I specify instead

	expanded = mremap(old, page, 2 * page, MREMAP_MAYMOVE);$

$ sudo ./memfd_future_write_mremap_poc
writer uid=10001; mmap=EPERM; pwrite=EPERM; mremap write=Z; result=63
owner uid=10002; file page 2=Z; size=8192; result=255

So same result. What am I missing?

> 
>    (Reference: https://man7.org/linux/man-pages/man2/mremap.2.html)
> > Combining these references, I interpreted the intended invariant to be that
> post-seal writes are restricted to the pre-existing mapping itself, rather
> than granting the process blanket write access to the entire memfd.

Again, mapping talks about "file mapping", not "page/folio page-table mapping".

> 
> In particular, two behaviors seemed inconsistent with the idea that the
> process simply has whole-file write access:
> 
> - Even when holding a pre-seal writable mapping on page 1, the same process
>   cannot call pwrite(2) or a fresh mmap(2) with PROT_WRITE on page 2 (both
>   fail with -EPERM).

Right, but the main challenge here is rather figuring out whether the process
already had access. We'd have to scan existing VMAs which is just unwarranted
complexity for something nobody really needs ;)

> - Calling mremap(2) with old_len=0 creates a brand new VMA covering page 2,
>   which appears to bypass the restriction against creating a new writable
>   mapping after the seal.
> 
> However, if the intended design in mm is strictly an mmap()-time check—where
> any pre-existing VM_MAYWRITE VMA implicitly retains the right to be
> duplicated or expanded over unmapped file ranges via mremap(2)—then I
> understand why this is considered expected behavior. If that is the case,
> perhaps clarifying this in the F_ADD_SEALS(2const) man page would be helpful.

Correct me if I'm wrong, the only confusion is about the mremap() doc saying
"old_len=0 creates a brand new VMA covering page 2".

And you seem to assume that "new VMA" implies "must be rejected", whereby we
already have a writable VMA there and there is not really a reason to reject it.

-- 
Cheers,

David
