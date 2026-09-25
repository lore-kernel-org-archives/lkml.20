Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F20D3B71C3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790337233; cv=none; b=G4Sce9tLvc9JJIuqSrt2p6AJcBEv5GXHUJkgF68OPrDzLpdmNOKN8cbt1zRT0RVZaPJ9uKlcQ1KMZ27QjsvS+g9KeB2dYcgKcY30muPOt383Xjjk7HntegzhtfL/RAMdEeRM5ldnkcnHzWG0qt0pocq6lJnlv4TGI+ORXF41Sp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790337233; c=relaxed/simple;
	bh=hhyrVZ4Yw//i6BPaQ9LqR7aLVPtsB+KQmZds+Ipr7PI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l3z4FlyggIwJkqBFJFLiwQC/uBAauIUv7rZ0EC4ZY22BlBUb62347Nl571Ijj/9Z8KhUhYjCguVWgVnS9xesY4Zsg7T78dGv1K2HxiReRVs/FT9YdG+E8EwttAqj5DnEkRokube1Zo1p+sAm1Wz0CGVNOuaWRQzO4qQvWWm4VJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IDR+M0w+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IDR+M0w+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAAE81F000FF;
	Fri, 25 Sep 2026 11:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790337232;
	bh=vECCgOGkVITIc8l1v+awkByw8HVVMnL2UtHjYP5ayJ0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=IDR+M0w+qQyxjpIpKnZih0kiclcR4uew4cO+w4CG6IUSFq4BV2c/xLfTS4tzIyoZI
	 mHYdLybEnPWNmDrRiHy1OeB+5qZTakg0B/FdU+e5ihHB3u/sWb4Zio7L5/JrmE6lOc
	 97rj/zycLgX3sKD8cOD/8NTDQIsa0GYskfoQfw2YPgmpKbTGA5+/IRLEJC8eqrtWLP
	 Rde5mHc9Y4PJTS0Zp+J+SE2/glY6bTaJhBdcDthqfzHCd3DMlA5Lk9A2Dm6h/EFklP
	 moSiaAKqkKUCkcUMbRs2YYfb7B2ZOwIajOcXjprJgHDmfkegkAdRdjyuqX5yvBTLhq
	 QLkcwtxRKMBnQ==
Message-ID: <6962b870-99f6-49e3-b235-9ddc04bbbda1@kernel.org>
Date: Fri, 25 Sep 2026 13:53:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH slab/for-next-fixes] mm/slab: do not wake up kswapd in
 __kfree_rcu_sheaf()
Content-Language: en-US
To: Harry Yoo <harry@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>,
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Suren Baghdasaryan <surenb@google.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20260922-kfree-rcu-dont-wakeup-kswapd-v1-1-42d7e2636f9e@kernel.org>
 <2db41ce0-a510-4050-a79c-ff1f16640b47@kernel.org>
 <arVERNhXeU1BX54G@thinkstation>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <arVERNhXeU1BX54G@thinkstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/25/26 12:57, Harry Yoo wrote:
> On Thu, Sep 24, 2026 at 10:43:01AM +0200, Vlastimil Babka (SUSE) wrote:
>> On 9/22/26 13:56, Harry Yoo (Meta) wrote:
>> > Fix this by always avoiding waking up kswapd in __kfree_rcu_sheaf().
>> > Note that there are two paths that might wake up kswapd:
>> > 
>> >   1) __kfree_rcu_sheaf()
>> >      // __GFP_KSWAPD_RECLAIM might wake up kswapd
>> >      -> alloc_empty_sheaf(GFP_NOWAIT)
>> > 
>> >   2) __kfree_rcu_sheaf()
>> >      // Let's say __kfree_rcu_sheaf() doesn't pass GFP_NOWAIT
>> >      -> alloc_empty_sheaf(__GFP_NOWARN)
>> >      -> kmalloc_flags()
>> >      -> slab_alloc_node()
>> >      -> alloc_from_pcs()
>> >      -> __pcs_replace_empty_main()
>> >      // Free a sheaf in an allocation path when the sheaf becomes empty
>> >      // and refilling the sheaf fails
>> 
>> So that's this
>> 
>>                 /*
>>                  * we must be very low on memory so don't bother
>>                  * with the barn
>>                  */
>>                 sheaf_flush_unused(s, empty);
>>                 free_empty_sheaf(s, empty);
>> 
>> Now I wonder if we should just use the barn then, lol. We either took the
>> empty sheaf from there, or there was none, so we don't risk overfilling it
>> with free sheaves.
> 
> Well when refill_sheaf() fails, it's not guaranteed to be empty.
> Might have to put a partial sheaf to full list?

Would have to check if anyone could find that to be unexpected.
Seems safer to continue with the sheaf to satisfy the request at hand even
if not full.

> ... well, now we have sheaf_partial though :-)

True!

> 
>> Well but I guess sheaf_flush_unused() could end up in freeing paths anyway.
>> But that's a bulk free which doesn't involve sheaves at least.
> 
> What do you mean by "**sheaf_flush_unused()** could end up in freeing path"
> but "that's a bulk free which doesn't involve **sheaves**"?

I mean we can still get to a situation where we're freeing during allocation
and making all more complex. But at least it doesn't go through sheaves so
the freeing is rather straightforward, no gotchas like
__pcs_replace_full_main() allocating a sheaf below.

>> We could also distinguish which callers of refill_sheaf() can continue with
>> a partially refilled sheaf. This one likely can so we'd not have to be
>> flushing, ever?
> 
> Can we do that without adding too much complexity?

Remains to be seen :)

>> >      -> free_empty_sheaf()
>> >      -> slab_free()
>> >      -> free_to_pcs()
>> >      -> __pcs_replace_full_main()
>> >      // However free path always assumes it's safe to wake up kswapd
>> >      -> alloc_empty_sheaf(GFP_NOWAIT)
>> 
>> Would be great to avoid all this from kfree_rcu().
> 
> Yeah.
> 
>> > Drop __GFP_KSWAPD_RECLAIM in both cases. Note that the kfree_rcu() is
>> > not the only user of free_to_pcs() path, but it should be fixed as it
>> > can be invoked under pi_lock.
>> > 
>> > Reported-by: Sashiko <sashiko-bot@kernel.org>
>> > Closes: https://sashiko.dev/#/message/20260831-b4-kfree_rcu_hotfix-v1-1-4f0fb882638b%40kernel.org
>> > Fixes: ec66e0d59952 ("slab: add sheaf support for batching kfree_rcu() operations")
>> > Link: https://lore.kernel.org/linux-mm/20260831143500.x-saxdAs@linutronix.de
>> 
>> Fixed up per your reply.
> 
> Ack.
> 
>> > Assisted-by: LLM
>> 
>> Changed to (per below)
>> 
>> Assisted-by: LLM # dicovery and verification
> 
> Ack.
> 
> Didn't know adding # blablah after Assisted-by: was a thing!

I want it to be! We did want to stop advertising particular LLMs (now done
in the kernel docs, IIRC) but also document how it was used as there's a
large spectrum of possibilities (not sure if that made it to the docs but it
was discussed definitely).

>> > Signed-off-by: Harry Yoo (Meta) <harry@kernel.org>
>> > ---
>> > The discovery and verification (w/ a modified kernel) of the bug was
>> > assisted by LLMs.
>> > 
>> > More speicifically, the first path was pointed out by Sashiko, and
>> > the second path was discovered by LLM while reviewing the commit with
>> > review-prompts [1].
>> > 
>> > Harry Yoo reviewed those findings and manually crafted the patch based
>> > on that.
>> > 
>> > [1] https://github.com/masoncl/review-prompts
>> > 
>> > I believe the right direction to address this issue is to make
>> > kfree_nolock() work in any context and replace it with kfree_rcu()
>> > in the scheduler. However for now it won't work under pi_lock,
>> > and resolving that would be a longer journey.
>> 
>> Indeed.
>> 
>> > Address this issue by dropping __GFP_KSWAPD_RECLAIM, for now.
>> 
>> Applied to mm/slab.git slab/for-next-fixes, thanks!
> 
> Thanks!
> 
>> But still could discuss a better solution per above.
> 

