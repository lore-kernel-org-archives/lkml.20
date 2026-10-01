Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1211B3126C0;
	Thu,  1 Oct 2026 10:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852127; cv=none; b=VqXa/1JwExbLG9Le1aKLgn6zvZYxF4/BkDHoKWCskuqzweEhmI274YzUW1+FNFeIiIm66CMLMM5zFPew3qr5wOUBHlApZ6j+aku0fvY1L06d31e9VQu5QY/LuQKkWfDRvX9lydmja+LA+8Cgzz2omoLxHQILaryFUacpoJ4BYQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852127; c=relaxed/simple;
	bh=TLPWu9ylXvUEH9lTGZQeERfKWCMekd+zu9v9tsZD52s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lDlz/dAYi1ODB1BSU5uB3loVmQJyo5Ecs8V2yxcdqLh+2UaRp+3jeh+JrnFrkQWwDW/BYqJbY7UKdQ/s38q4ZD46tFfIeYoBQu2mbtPUHFvtDtJ1ZlnNhNLUFZDBJS2DCHQ1YZiOXUHW/RI8YzOp9MgTjMdz+HsD95IeX0/6BwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OfncYfp3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OfncYfp3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63FE1F000FF;
	Thu,  1 Oct 2026 10:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790852119;
	bh=penxqr9i9OBDqzR9Qzq1r2NHVsP0bv2yCQX2PsmhJ8k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OfncYfp3EtQ5vNQxUvpMVGVjy20dPvbDUZVeNjZTTIBBMgw+tVr5rRcNDAJqCM/PX
	 A4MFsfzdj/e6giw52AZedON5aXr2t+tm3elUaBz7JDaimwLGKWwEhopgwzT9elam+Z
	 r2jAMWZWdkpgCQBTpYhE3WvmlOjNA7Xba3VRUl6r66KvqVary9j/kFBhvR0c5Uij0s
	 NhcEavOdPUuFaQ7tSOYFKJ7Qfad13KoFQiB8BvoQX1yg4DWTwTwkpa9badb9d8MiLk
	 w5W6t9g3nngB9eO+QwuatNiWEahkhk9hTZmgFxteQI2y7KwWgzD2cmE+BSKnD+w5gw
	 RxQn38HVyRYZA==
Message-ID: <e8e7bdef-8c12-47bb-8b39-54405b857156@kernel.org>
Date: Thu, 1 Oct 2026 12:55:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/numa_balancing: allow migrate on protnone reference
 with MPOL_WEIGHTED_INTERLEAVE policy
To: Gregory Price <gourry@gourry.net>
Cc: Li Zhe <lizhe.67@bytedance.com>, akpm@linux-foundation.org,
 ljs@kernel.org, liam@infradead.org, rppt@kernel.org, mhocko@suse.com,
 corbet@lwn.net, skhan@linuxfoundation.org, ziy@nvidia.com,
 joshua.hahnjy@gmail.com, ying.huang@linux.alibaba.com, apopple@nvidia.com,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930072617.64665-1-lizhe.67@bytedance.com>
 <cfdcaaa3-a9e7-4352-ab01-4922ebb8e0c9@kernel.org>
 <arz56nVu8TzSjqlg@gourry-fedora-PF4VCD3F>
 <ca35c989-9aa1-491f-a247-ed36724f10a0@kernel.org>
 <ar0LqjO3-cwU6-Jy@gourry-fedora-PF4VCD3F>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <ar0LqjO3-cwU6-Jy@gourry-fedora-PF4VCD3F>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/30/26 15:40, Gregory Price wrote:
> On Wed, Sep 30, 2026 at 02:32:16PM +0200, David Hildenbrand (Arm) wrote:
>>>
>>> Right, but you're requesting this configuration.  If you didn't set
>>> F_NUMA_BALANCING then you get the existing semantics.
>>>
>>> In the existing semantics, if we're INTERLEAVE and WEIGHTED_INTERLEAVE
>>> we just always say "no tiering for you".
>>>
>>> But as an opt-in option?  I don't quite see the argument for saying
>>> interleaved regions (or tasks) to be opted-out if the user asks for it -
>>> that just seems like an arbitrary limitation.
>>
>> Just to be clear, what I am saying is: the proposed semantics are inconsistent
>> (weighted when mechanism A honors them and mechanism B doesn't honor them), but
>> once we set these semantics in stone like that, we cannot easily change them
>> later because some user might depend on that behavior.
>>
>> So you'll need yet another flag to say "NUMA balancing really also honors the
>> weights". And that's where it all gets ugly.
>>
> 
> I would agree with you if demotion didn't entirely ignoring mempolicy.
> 
> On a tiered system, mempolicy *only* applies to initial (or fault-in)
> placement, and otherwise is more or less entirely ignored.  This is
> a case where it's not ignored - which is actually inconsistent with
> the rest of the tiering tools (demotion, damon).
> 
> This is why I said this distinction may only make sense in TIERING
> mode, while in NORMAL mode you likely just want to fault it back to
> its original interleave location.
> 
> Also file interleave (indexed by offset) vs task (counter-incremented)
> policies are affected by these changes very differently, which I asked
> for some thought on.
> 
> As tiering develops, the less I think task-mempolicy as a whole makes
> much sense (because it's at-best advisory).

Fully agreed to that. I even struggle to understand how an initial placement
using the weighted policy really fits into that picture.

-- 
Cheers,

David
