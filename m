Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874676;
	b=WXujugNyVqVA0hNN2hEelyjplUD4tNgE8d/IuSnj2ro0uHbJHsQDxQKAUKpzHua0CS+Z
	 SLH3Jya+ehzK3LjD4nmtdpu1dCsWsQ9z/j724af4RJ9arljjZW330UUcxu5i2rUAbxqNd
	 p9lve3VFp58yUuzPOlFPCo/564fhAwGYoFI579HPRb1M3Pi/fElF8Jb2AC2qFOavPmcvz
	 9ILu5VBlQQAuJXt+syA82LM+G4iHlUl+NoU9aUx2QAVQKYgdvu6rjmbfzovjnu+oliXU5
	 AbQRmVWHLDuC3f6RAH2ifVnRsojFcEDvyuKEQkd5gI6cOFGzu89QpAjrsGNqGUGRkCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874676;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=o79BRgd1rwr48/L5i0hq7KYSWjbj2AxE6PTat1LYO8U=;
	b=erDolD2tqqiG6RJofdkMYd9VWcW3WJYjjPzKCJsWrBxjhiE6dVC3Mkj1KS2CSy0R3F+e
	 triX5ohfqFDRGAJHAVccrZ5Ut1sTjD7lcMFVn7mRxpWJxJ2Ddl+Juw9g4pLwkbPbqwpLA
	 3ZLy+zHmaUjmU/FbD8+MMJdnMN1FrX8FSzgkmFNZjFkJ9tVKbzlpxfLybFEaznDTYPkEO
	 UPat4V3qN8YPtL5OhcucVPn0VcKK6WFZQe3Jjy2dBqEoAmZQ0jQA2A5XQT+cRBbBwn7M+
	 xRX+zWQkYFJWQ/UR2+vDUGgDsDGwYnRuS8cZV/qxi00Y3TjW3AQn1ZGZH2GU3l99+IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lSsj66o7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2031606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lSsj66o7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D40131F000C1;
	Thu,  5 Nov 2026 10:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793874675;
	bh=o79BRgd1rwr48/L5i0hq7KYSWjbj2AxE6PTat1LYO8U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lSsj66o7Lp6gK3a9YLc3KE9qO7uL1FHpi6J4kQnRuJc2Bbv4QOSNeoVxd/MC0F8g+
	 WIl7C2g2zBahzG+4Ufa4HUk+Zxr10kuIxNUDS6k6VwBee2ZursfZ7/sVx75Z3GNstW
	 FPa5i1yJ6uU7FxvSQqsNkZxCNxMUQhmI05iFnCmvDPQUzoJaqpUxNV8C7GQgNh+JF0
	 5UQaaXxqmT9egU8CeMLtwdxWh3E5R2fJvmwMKzNTOROTdoZAlLrWaMx08MdzLkU6Ui
	 su0lxuYlcEHlMTv5ikPLVSaAZ5YUd4ht10tq2qNy8Hn1dRSKzjat+dseu67w5u+gk2
	 OuTe+pbYQ/okA==
Message-ID: <27c9c241-f7fd-44e3-9b9f-fcb7f4c84b5d@kernel.org>
Date: Thu, 5 Nov 2026 11:31:10 +0100
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
Subject: Re: [PATCH 1/8] mm/gup: break out gup_fill_pages() helper
To: Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe
 <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Suren Baghdasaryan <surenb@google.com>,
 Yuan-Hao Hsu <aa9736195201@gmail.com>, Christoph Hellwig
 <hch@infradead.org>, linux-mm@kvack.org
References: <20261102193026.3860700-1-riel@surriel.com>
 <20261102193026.3860700-2-riel@surriel.com>
 <df9c504e-e62a-40c0-a513-e8b8c758dd57@kernel.org>
 <3a7d12b52a5de61277842f2cca0dd90d42728135.camel@surriel.com>
 <856ed0da-d806-4f2e-95e7-f276f2408e8d@kernel.org>
 <4ffa2c82c538c12447d48fee2532f67c35f7eab7.camel@surriel.com>
 <e610aa21-4d35-4d9d-8754-bbfdec57a9a5@kernel.org>
 <f11575d4f0fa63fa1afc6ca6060440c9991bc112.camel@surriel.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <f11575d4f0fa63fa1afc6ca6060440c9991bc112.camel@surriel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 20:30, Rik van Riel wrote:
> On Tue, 2026-11-03 at 18:04 +0100, David Hildenbrand (Arm) wrote:
>> On 11/3/26 18:00, Rik van Riel wrote:
>>>
>>> It looks like 2 of the 3 callers of gup_fill_pages()
>>> check for pages existing. The other does not.
>>>
>>> Should we just have the check in this one place, and
>>> not depend on the caller?
>>>
>>
>> That should be spelled out in the patch description.
>>
>> The change as it stands in this patch looks useless :)
> 
>> Although trying to fill something that doesn't exist is a bit weird.
>>
>> But if it makes the calling code nicer, sure.
>>
> I agree this patch by itself isn't super useful.
> 
> It's goal is to be able to have this code in one
> spot, and not in multiple places in gup.c
> 
> I'll split out the array filling from the cache
> flushing, so we can move the cache flushing out
> from under the lock, and have GUP-fast and regular
> GUP share the same helper.
> 
>>>
>>>
>>> Only a small number of slow GUP callers need dcache
>>> flushes.
>>>
>>> It may make more sense to move the cache flushes
>>> all the way out into __get_user_pages() and away
>>> from the follow_page_mask() call chain, so we can
>>> maybe merge more of the helper functions between
>>> slow GUP and fast GUP.
>>
>> That's likely more work, can you look into that?
>>
> It really doesn't look too bad. Here are all
> the GUP callers that need a cache flush:
> - kernel/events/uprobes.c (through get_user_pages_remote)
> - /proc/pid/cmdline (through access_remote_vm)
> - fs/proc/base.c (through access_remote_vm)
> - kernel/trace/trace_events_user.c (pin_user_pages_remote)
> - arch/x86/kernel/cpu/sgx/ioctl.c (get_user_pages ... urgh)
> - kernel/ptrace.c (access_remote_vm)
> - mm/process_vm_access.c (pin_user_pages_remote)
> - fs/exec.c (pin_user_pages_remote)
> - virt/kvm/async_pf.c (get_user_pages_remote)
> 
> In other words, if we change the SGX code to just
> call get_user_pages_remote(), and then move the
> cache flushing to get_user_pages_remote() and
> pin_user_pages_remote() we should be all set.
> 
> Want me to fold that into this series, or send
> it in as a small, separate prequel series?
> 
> As a separate series it would:
> 1) split out the gup_fill_pages() and gup_flush_pages()
>    helpers
> 2) convert the SGX code to use get_user_pages_remote()
> 3) move the flush call up the stack into pin_user_pages_remote()
>    and get_user_pages_remote()

That sounds like the right cleanup.

Likely you can defer 1) and just do 2) + 3) first.

1) then on top of the gup-fast batching if possible.

-- 
Cheers,

David
