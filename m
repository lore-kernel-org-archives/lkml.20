Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484832;
	b=t/CMM1CS9v4OaRJYcASjn8/Zd5OR2xx1pTVAqoJlr6J6UH/ZYLKL9sa5agS8FnpNazz/
	 0bdiq94XHpEO6YEt3/sdzvhkUIjz5/q+lOQOUxk/kjs0ktvzJj+tdJOkmXNzeVgCXfsYm
	 XcAdoFrtx6hjhfpYV5oOOUB5qbh0fzD2TJcFZVy7LtsFFjqjfGQ7ZaZG6SJAIlJIBzKWL
	 ZClREkWwzJGOKdWxCavHZpWqNlB5kKk7gI8kabn0j4pRzW12Bfwz4OK42XkRTT7L3iQPT
	 Jp1AaI2KuqhYRxpONnOpQnN1N6LyPkqq8jwfoYJKfYPg9TfFbMy4Pb9gWyy+CDtt46A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484832;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=hD3QL3zhfQaS6wp7jLt510z1yjbpvqOBC7skF7FHaiI=;
	b=QHRTNyPqhZMu88aT5iaDVxjIpCNuLOg0ENIkVmK/RB4jvqBW3bFICYCGaiWlc8tIZbYW
	 ZkwNjJvOnScCOgfqL5+9Z8OxRX42G58Wk+I988Tfz7xvyD+4RKix2QKvJmcjGuJ7vEfsI
	 Tkc/qk6QbDChEUy1FyaRr9KxL0k+8W+K7IlUXQbqMC5E7/SGfJ6yaOYoXP9xgeYsY8ibK
	 nR8IRP/jqcrldPEODSnXq9uvDO0DdziqZYSSWq8rwk+CEGYYqvoNDNs6ASkv2oc4UIKBY
	 2FVAVMMlEB0KmdWcZFfg748wNkqNiMMEcrbJRDfRZT67++BZ0IXjJ+AAuFINYBaFFUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lbURHUqC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D515660A2628
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lbURHUqC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13AB21F000CD;
	Tue, 20 Oct 2026 08:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792484831;
	bh=hD3QL3zhfQaS6wp7jLt510z1yjbpvqOBC7skF7FHaiI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lbURHUqCrjNtQgm+44XHMvS7UGgRz+SSQQZJJLmZuwjLS97fVgLwmQWtDCVavLsmH
	 JPaxgW/Tpul+eM7S4xmoAFTri7OYweN7ymjGQZ7jaUiJnr0gRJnJqPNWpUFrRbr5mv
	 +tGxmN9wRb/xhBtz2aeD2fBjPYX/7x6BPgGPIF3eEZDIQQxNxs+VHzowVHiiCkzCVo
	 gSzGfeD1Gyhr0OoTiNp6YB10sl9vS9aiXNchWAayP+qgKQJGkQcR+HbrLTaNeQJwXe
	 91islngKr8L+2HJJELjTBFsB5TqTIQ9HEULpZhuJlm/5DaJxmYJHEu+zWsS8pKZYdS
	 ivwBIsBrrUpQw==
Message-ID: <3a034d40-e01d-42cf-9325-8c1e4a6db1b9@kernel.org>
Date: Tue, 20 Oct 2026 10:27:07 +0200
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
Subject: Re: [PATCH v1] mempool: fix min_nr exceeding the elements array after
 concurrent resizes
Content-Language: en-US
To: Vitaly Wool <vitaly.wool@konsulko.se>, Harry Yoo <harry@kernel.org>
Cc: akpm@linux-foundation.org, cl@gentwo.org, hao.li@linux.dev, hch@lst.de,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, nickolai@csail.mit.edu,
 rientjes@google.com, roman.gushchin@linux.dev, vitaly.vul@partner.samsung.com
References: <atTh-yyVIPQ-zNWJ@thinkstation>
 <20261018160315.1465504-1-vitaly.wool@konsulko.se>
 <atTv1tg9q9n92kZv@thinkstation>
 <F846CE95-6D2A-4D53-9C09-5C8630E2C8A7@konsulko.se>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <F846CE95-6D2A-4D53-9C09-5C8630E2C8A7@konsulko.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/19/26 08:45, Vitaly Wool wrote:
> 
> 
>> On Oct 18, 2026, at 6:15 PM, Harry Yoo <harry@kernel.org> wrote:
>> 
>> On Sun, Oct 18, 2026 at 06:03:15PM +0200, Vitaly Wool wrote:
>>>>> How about we take my patch [1] instead since
>>>>> it isn't prone to this bug and is a nice optimization to the existing
>>>>> mempool_resize() at the same time?
>>>> 
>>>> It is not a good idea to squeeze a bug fix and an optimization
>>>> into one patch.
>>> 
>>> Generally speaking, yes. But that patch had been submitted before the fix
>>> popped up, so there was no sqeezing per se.
>> 
>> I mean the patch you've submitted does two things (wihch is not good).
>> 
>> It should be split into two patches that 1) fixes the bug and 2)
>> optimizes it.
> 
> I don’t think this is a fair statement. I would say that the patch I’ve
> submitted improves mempool_resize() to be rid of unnecessary
> reallocations and data copying, and that (improved) implementation is
> *not* prone to the race found in the previous version of this function.

But it makes the code more complex:

 2 files changed, 28 insertions(+), 16 deletions(-)

without an in-tree use case.

> ~Vitaly

