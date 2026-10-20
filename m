Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486600;
	b=uty4RXD0Xi3xHaQ/1lNPcoN3OXE8IXOfAFJw4rMU7s5egbHR44KVAVThhAlhSFmZd4iJ
	 6rI4c8peZw138nM8MIB4mpPaZIpvdWeuSc/6cXcKoZDL2jAqiGLvzvK69DqjlW/rGWmVn
	 e51PSulWUUj2S9f8B8eFQWNpwqj8QENnYJBZBzcDGNsQuGgFfeD7IMkS0h7AJuVUfqyEV
	 AXzeHxe2OLLC/KuPd0+lZCY5RAfq3fF9dKV4DjoCnyQ4T8+/KNh5uep8vrWGA4k4UIqdD
	 387q18xc7N/UAO7w6ZUwkx4h687NTyV+k2Mv+rGen+PwwueZi6oZ5cMSdXNcu3byMaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486600;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=McrTiUbg6EZriE8j8VkFoRkisw7c+uzkDaypGtect48=;
	b=FzRlJDRIoLn7131FOTe8F6qLzydOrpWYtzfFpLHNWTgs0wgnokEXgTTIek+7YX30e8h7
	 yVJYMnqQEYbAWLWS3AYKf/PZmJvSSYPKFbnA55pCsdHeF6rLhxTKB4jnxXFQMVzIOqlho
	 CaJWOMt1+gfyAihL2Y30QSCoX0IyaqJxAxIDJeCYciWCnvqabRgZdaH56xINx3TywrNTG
	 lFAfOnYjwYcwz99tYcElCJVeakATF0orN9yhifqPLBa+tFIqECx/UYRlSzQRAGmPB25Ik
	 O6pAewYvMlnuGT77ReYKGRVjPUk5zPfNWEkct8FTF3khmhcOEoDimJq95/NTQJIieCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h7GyUXZP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDEA606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h7GyUXZP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 429E01F000C4;
	Tue, 20 Oct 2026 08:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792486599;
	bh=McrTiUbg6EZriE8j8VkFoRkisw7c+uzkDaypGtect48=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=h7GyUXZPkJOIJO7nSf76sVYqy2RVTUXCQDJ6I8vqZ8YasE+voazj8H17eSgLcq6IE
	 TC96O2bsiATCYbJgc9gXKqJO24FPu+bJ8JjAdyhdhoGFpkaYD394k3yDcmyUl7RIqW
	 NE+Ct72HgraxCgWuCMKxtQBMTIv2gOz+vqRy6iTehEIl4Ed4j1Vmmzw2r6Bukf1bcj
	 ky32EBS6BbjL9N9FCFmfDKDKQV06K7bJ8zTsn416qtNKoijZ0Lne1n+9gh3kOQqopJ
	 uiEElzL+zD76qMPYaUwY5+/WkT5JqeTibBg07KDGsYSVUWp8ndX/GkrVj6Ys1v7Qk2
	 qr2VVt0RvjN5g==
Message-ID: <91eb0dca-773a-4906-b8fb-9ed6854966ec@kernel.org>
Date: Tue, 20 Oct 2026 10:56:34 +0200
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
Subject: Re: [PATCH] x86/mm: Split a 1G direct mapping that hot-remove only
 partly covers
To: Cong Wang <cwang@multikernel.io>
Cc: Cong Wang <xiyou.wangcong@gmail.com>, linux-kernel@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20261019041606.641716-1-xiyou.wangcong@gmail.com>
 <abbefd94-2a4c-4e12-99c5-89a5520563e7@kernel.org>
 <CAGHCLaTe9h0JACdhgAiUw851veDWX=y6KxUPLU1NzHzut3QE4A@mail.gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <CAGHCLaTe9h0JACdhgAiUw851veDWX=y6KxUPLU1NzHzut3QE4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/19/26 22:32, Cong Wang wrote:
> On Mon, Oct 19, 2026 at 3:26 AM David Hildenbrand (Arm)
> <david@kernel.org> wrote:
>>
>> On 10/19/26 06:16, Cong Wang wrote:
>>> From: Cong Wang <cwang@multikernel.io>
>>>
>>> Hot-remove works on memory blocks, 128M and up, while the kernel maps
>>> boot memory with 1G pages where it can. Removing a block that sits in
>>> such a 1G page covers only part of it, and remove_pud_table() then
>>> walks the memory that 1G page maps as if it were a PMD table. The
>>> removal succeeds, but it corrupts the first page of the 1G region, may
>>> free that page while still in use, and leaves the removed memory
>>> mapped.
>>>
>>> Map the 1G leaf through 2M leaves first, under pgd_lock as
>>> set_memory_*() may change it for the rest of the 1G meanwhile.
>>>
>>> Reproduced in a 3G QEMU guest booted with movablecore=1280M. We used a
>>> test module fills the first page of a 1G-mapped region with a known
>>> pattern, then calls offline_and_remove_memory() on one 128M block in
>>> that region. Before this patch, part of the pattern is zeroed and the
>>> 1G page stays. After this patch, the pattern is intact, the block is
>>> unmapped, the rest stays mapped through 2M pages, and adding the block
>>> back works.
>>
>> Which in-tree mechanism can trigger this?
>>
>> I would imagine only DIMM hotremove on bare metal. But let's be real, that is
>> never going to be < 1 GiB.
>>
>> All other mechanisms (including DIMMs in virtual environments) get removed in
>> the same granularity they were added.
> 
> You're right.
> 
> The only in-tree path I can see is ACPI hot-remove of boot memory,
> where the direct map was built over contiguous E820 RAM and a 1G page
> can straddle DIMM boundaries that are not 1G aligned. I agree that is
> unlikely on real firmware.
> 
> Where I actually hit it is removing 128M blocks of boot memory
> (offline_and_remove_memory()) for the multikernel work, which is not
> upstream. Happy to carry this patch downstream.

It should definitely not be tagged as a fix. Given that we don't expect in-tree
users (and also don't endorse ones that remove arbitrary boot memory they don't
actually own), I'm not sure if we want this at this point.

I'll leave it up to x86 folks.

(IMHO we should, however, definitely warn if we would run into this situation)

-- 
Cheers,

David
