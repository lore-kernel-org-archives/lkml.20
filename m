Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B534537882B;
	Sat, 26 Sep 2026 18:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790448078; cv=none; b=TthddZv8spDdPyuGr/He651X2wjEf3AY+vZQN48HM/NRYpRYezMEYBFGAe12G3/kLyoQbHmeypUlnWSR4iFN1uFQFKpxh4PGqZuvEYVWZKoTPOIyeTk9xCrhm0bv5j9AHvwGt9GD+WPKdfpl0Nn8FAgbNMRe+J2ErIv0N/GrPA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790448078; c=relaxed/simple;
	bh=5ap3wcF5EGEv6xld4mzBu3SRiXefr20QDVoL1ad9l8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eui7uI0TQGWtpDfEEbox5iJ2lUoa8wb9E3OCfZkRRmwGZvv3ODMI9GxRqpPZe2TzhwXfIyNlmGwCKLJzrAvjYfw+PR+8MBh2ikk1EBRyBX0/5vDc0WFc6zJ6eW8z3zi5H9p7aFUZYRoVjCw59Ut7xpIpQmIFbQ9YD7iSIK60Sv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=n74cTPko; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="n74cTPko"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=I4Z1h4xOI9pVY6276+eBEYkObk3bv+/2tqThdrVGWXU=; b=n74cTPkotlB7KTXhCNqq5fzzHq
	2KT8Cx38ik56SpGGVHstj59H9vYAEbU2GNEocrbTaKlCtRY+Xm/PwISnzmdC3RrRn+Rs4sc0i6pex
	tkKjQq+pkUfta6Hp0aMtw3dYOdtDCKe9or0Dh88Et76RpIKs69erdhDGPlNeyZRV/861WCJfq+QW4
	9PTtQVwCTbuig0NpszsoT9zQ3012JneziYuz5OF1r6vv3pw9hmYXVcgxGVsP74fAjtnDUCv316895
	HV9JIMTqATL4NYQ46H2FlMOeLP7wmwJ7QsTIkNer646SOInpaM2SpUtT0ySuA+Ziyo1jOeZTSkO3u
	I1KBAjQQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAXKb-0000000Fiff-0ED2;
	Sat, 26 Sep 2026 18:41:05 +0000
Message-ID: <c13f6823-a304-42e9-8876-5b8e8e3569f4@infradead.org>
Date: Sat, 26 Sep 2026 11:41:03 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kdoc: parse context_lock_struct() as struct
 declaration
To: Jonathan Corbet <corbet@lwn.net>,
 Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>, bvanassche@acm.org
Cc: peterz@infradead.org, elver@google.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, mchehab@kernel.org,
 aleksandr.loktionov@intel.com, kees@kernel.org, tudor.ambarus@linaro.org
References: <5315b896-e496-4020-9e46-77ffb942ea37@acm.org>
 <20260926095405.56438-1-emmaonana18@gmail.com>
 <87o6dk3uwy.fsf@trenco.lwn.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87o6dk3uwy.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/26/26 8:16 AM, Jonathan Corbet wrote:
> Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com> writes:
> 
>>> +context_lock_struct(debugfs_cancellation);
>>> ...
>>> -context_lock_struct(debugfs_cancellation) {
>>> +struct debugfs_cancellation {
>>
>> I still think the tool-side fix is the better route: `debugfs_cancellation`
>> is the only one with a kernel-doc comment today, but the next comment
>> added above any of the others would hit the same error, and we'd be
>> fixing the same warning again.
>>
>> The part that really sold me on changing the tool was a general ordering
>> issue in `dump_struct()`: unlike `dump_var()` and `dump_function()`, it
>> applied the transforms only to the members after `split_struct_proto()`,
>> so they could never repair the declaration line itself. Moving the
>> transform earlier fixes that, and a full-tree A/B test removes the
>> existing warning without adding any new ones.
>>
>> Would you and Marco prefer the tool-side fix, or should I respin with the
>> `debugfs.h` change?
> 
> I think that making the docs tools more robust, and avoiding the forcing
> of code changes to make the tools happy, are good things, so I am
> inclined to accept this change.
> 
> Omokefe, I have to ask: did you write this patch yourself, or was there
> LLM assistance as well?  In the latter case, it needs an Assisted-by
> tag.

While Bart's patch could work as a short-term/stopgap/workaround solution,
I also prefer the longer term solution of fixing the tools.

-- 
~Randy

