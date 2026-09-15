Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EFC440620
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456227; cv=none; b=mU+aaYDIF2igSIz1NQtQ+CGvjZLshI4bOPG45Jyu2lMXnw0a2xl2Q6A2t9PCO55ndDAfncYDCTDn6Lx4Yi2843p6a/ZS7jmqolbM4B3rnsG5J2xMEc12t9HkNHXXtTBnjv82zvDhNb9G7/7bno++P7sMimp3CAcHIEoW3BYVw2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456227; c=relaxed/simple;
	bh=d0Q9BrXQeEl33vqAz13JgA5Tz08bFat37n7Ps7zdrb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eKj6Lr93qa6xU3JyAmFiix4RyvkDPBZBDvAflKy7ijOvELyNnBYDJH6bwOsIIwmpJ1Gi3GqGXiYfTs9P5UkW+Gy0Kt8eabiR04DqoJGiGdhmDVcMiaLDjEh9itVoiqkiybkyGtUoBohMC/G0hCLtnpk26veqTub2rDRM/eq1Umk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O05SGGAd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O05SGGAd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E9DB1F000FF;
	Tue, 15 Sep 2026 07:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789456225;
	bh=oKxcff3RknMtu3nP96OKoAusCWTbG23nN8Jci2XLj7M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=O05SGGAdRPGrz0Iz+7XgwlSFs3F5RnNc0orTk5KU9yz8aeD27Z+fCAQ3JX0fHfAEj
	 xCod+mWvLIGO/opeBlR1JATMb1O+8IRDeeSegYbMSJR+L9p5b2Ub+H2SkHHpUfRdLI
	 qy6BtR30pEznfw5G2Iuf6kFVI7MNCf+iTXB84EaRmILGvGIc5FPXdkP9Ff8ytneID7
	 gIFmvbA+UcB/J23fjfmlJoNt24rtTwQzOs/B4UV5CiExvTA4rmgoVawucc8weY5wUN
	 Hpb6skjv+czEk0J2VNgwAc9cIVAlFId7X9MaNUxsJqVfimJLnn0UL4iyyFxOuckQTi
	 5VOJUhZcIujVg==
Message-ID: <4d9ebf64-e3b4-4b6c-9576-e8be59193f80@kernel.org>
Date: Tue, 15 Sep 2026 09:10:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] mm/slub: reduce list_lock contention with slab
 parking
Content-Language: en-US
To: Hao Li <hao.li@linux.dev>
Cc: harry@kernel.org, akpm@linux-foundation.org, cl@gentwo.org,
 rientjes@google.com, roman.gushchin@linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Pedro Falcato <pfalcato@suse.de>
References: <20260824122004.3652-1-hao.li@linux.dev>
 <a3e5581a-e039-45bb-b570-a01158b154bb@kernel.org> <aqPg5YRKdaZiBj9b@fedora>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <aqPg5YRKdaZiBj9b@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/11/26 13:24, Hao Li wrote:
> On Mon, Sep 07, 2026 at 03:44:08PM +0200, Vlastimil Babka (SUSE) wrote:
>> On 8/24/26 14:19, Hao Li wrote:
>> > 
>> > Detailed data
>> > -------------
>> > 
>> > metric                              before             after             delta      change
>> > ==========================================================================================
>> > alloc_fastpath                     155,417           168,534            13,117      +8.44%
>> > alloc_slab                      55,679,646        26,702,510       -28,977,136     -52.04%
>> 
>> It's interesting that this is reduced so much. Is it because parked slabs
>> cause more slabs to stay around for reuse, despite they are unparked
>> immediately when trying to allocate/refill? That seems odd?
> 
> Yeah, it does look counter-intuitive at first glance. My understanding is that
> the parking mechanism helps by bypassing the partial list spinlock, allowing
> partial slabs to be parked onto the llist locklessly at any point. Because of
> this, the refill path gets to see and reuse more partial slabs instead of
> having to allocate fresh ones so frequently.

Hmm that's an interesting effect, surprisingly large if true. Because the
slabs we'd be parking are transitioning from full, there would be most often
just a single free object to reuse?

>> 
>> > alloc_slowpath                           0                 0                 0      +0.00%
>> > barn_get                             2,715             2,771                56      +2.06%
>> > barn_get_fail                            2                 0                -2    -100.00%
>> > barn_put                             2,715             2,770                55      +2.03%
>> > barn_put_fail                1,370,488,457     1,668,257,974       297,769,517     +21.73%
>> > cmpxchg_double_fail              3,827,935           549,427        -3,278,508     -85.65%
>> > free_add_partial             1,684,340,964     2,161,921,625       477,580,661     +28.35%
>> > free_fastpath                       31,766            32,979             1,213      +3.82%
>> > free_rcu_sheaf              43,855,689,417    53,384,314,553     9,528,625,136     +21.73%
>> 
>> This metric (and others with similar numbers) should not be affected by the
>> change. Does it mean the benchmark has a fixed time to run, but manages to
>> do more work in that time thanks to the increased throughput?
> 
> Exactly! In fact, the increase in free_rcu_sheaf matches the throughput gain
> almost 1:1. A ~21% increase in throughput naturally translates to ~21% more object
> allocations and frees.

Ack!

