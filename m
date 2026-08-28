Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982F917B425
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787887951; cv=none; b=Vw/YNqQ40/BbDz3uAocKZpvr5fd/YWPwtYhYjnBYj0R3vl5oTqiXBpHDJFFEQWm5elZDd7v/WxGg+NvyYlUeW9/PiVtSJaazj8Brc5HFu4H3qoiVJm/etlX1PQWgunUEQNU6UuwlBCtDG5wmVs1ow04owhR0/8ppeOAwGYj4ZHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787887951; c=relaxed/simple;
	bh=gpsL/fcOmXPVMy3JdZCn70uTEXR/b7v+ntNQHRrMjNQ=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sKQO7okBj1hhpe+qnm6osXbTemaNdrqAGaOOEAQRy9Lp/G9Iyh1PLQoMymB7nGpRzDFjorCqc+uNO0wJ7qwiKeJ48bSGvbcPl5gf9/ZDXkKI1zeFNQm1RW1moqlZyesbJ+7u69QGgo6/o4+LHxTdlmtcCKSAiHO+3X3vPE8TPoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W9HA3YYa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W9HA3YYa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6399A1F000E9;
	Fri, 28 Aug 2026 03:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787887950;
	bh=5M8gbIUGJJBJHQvsJrS2ARyyI5Y6Y8eyeytRohiCL/k=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=W9HA3YYacD6eT0yJhBFSxQsc3yuNtYbY3SIVlhGlCsWLj5yX+ChnDjCQ8jCXYae1K
	 WXP6AuriVti4Ku0H5KxSug1n+hfHXrMl5BP2+33iNG+mV2bolyjE2q7CRKYlA+aqTO
	 +j0/2ZNXIjnYWHnWm6YSSpgdXsj9VUDAQJ9FnjDC2280AkFUMSXi4MjD9LG8YQyRPU
	 U1CBmyNWcj9A3FP6wgEpIYaIQrl7aUr/QaHIYK0Z0Qs04W3r+u7SbTnrfyyRrQSWQP
	 1FBGVYnkAK3P444u6RFAvt5bVUcS+1DlG/3HrHG01i2JBmO91Jmryhbj/TZEcbFrw9
	 MA4wCr20NNnxQ==
Message-ID: <565c31ee-4677-4d16-bcc4-4754aa94d4ee@kernel.org>
Date: Fri, 28 Aug 2026 11:32:27 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH v3 09/12] f2fs: cache: use compress cache
To: Daeho Jeong <daeho43@gmail.com>
References: <20260825130126.2078627-1-chao@kernel.org>
 <20260825130126.2078627-10-chao@kernel.org>
 <CACOAw_w+QMkTNK=McScLHh1gpm6UFjxLSnVxhFMsgsuArLA=qQ@mail.gmail.com>
 <8e02060f-6921-4d3c-abb2-cc36fe1e9594@kernel.org>
 <CACOAw_ySh3pW5tg7pa6r7Rr7tuqp9btPWvN-rrWN7mOpKcw3kQ@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_ySh3pW5tg7pa6r7Rr7tuqp9btPWvN-rrWN7mOpKcw3kQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/28/26 01:20, Daeho Jeong wrote:
> On Wed, Aug 26, 2026 at 8:24 PM Chao Yu <chao@kernel.org> wrote:
>>
>> On 8/27/26 04:04, Daeho Jeong wrote:
>>>> -static void f2fs_truncate_cache(struct f2fs_cached_block *entry,
>>>> +void f2fs_truncate_cache(struct f2fs_cached_block *entry,
>>>>                                         bool drop_dirty)
>>>
>>> -> __f2fs_truncate_cache() without locking?
>> Or, I guess you mean we need a cleanup here?
>>
>> What about:
>>
>> void f2fs_truncate_cache(struct f2fs_cached_block *entry, bool drop_dirty)
>> {
>>         if (!entry->cache)
>>                 return;
>>         f2fs_do_truncate_cache(entry, drop_dirty);
>> }
>>
>> static void f2fs_truncate_cache_locked(struct f2fs_cached_block *entry, bool drop_dirty)
>> {
>>         f2fs_lock_cache(entry);
>>         f2fs_truncate_cache(entry, drop_dirty);
>>         f2fs_unlock_cache(entry);
>> }
>>
>> f2fs_truncate_cache() was exported for using in other .c file, in the meantime,
>> static f2fs_truncate_cache_locked() can be used inside cache.c.
> 
> Splitting them into two helpers (one with locking, one without) makes
> total sense.
> 
> However, in the Linux kernel convention, having `_locked` or `__`
> usually indicates that the caller is expected to ALREADY hold the lock
> (e.g. `__list_add()`, `__folio_mark_dirty()`).
> 
> If an exported function is named `f2fs_truncate_cache()` without `__`,
> callers would naturally assume it handles locking internally.
> 
> So I'd suggest following the standard kernel pattern:
> 
> /* Caller must hold f2fs_lock_cache(entry) */
> void __f2fs_truncate_cache(struct f2fs_cached_block *entry, bool drop_dirty)
> {
> if (!entry->cache)
> return;
> f2fs_do_truncate_cache(entry, drop_dirty);
> }
> 
> /* Safe wrapper that acquires entry lock internally */
> void f2fs_truncate_cache(struct f2fs_cached_block *entry, bool drop_dirty)
> {
> f2fs_lock_cache(entry);
> __f2fs_truncate_cache(entry, drop_dirty);
> f2fs_unlock_cache(entry);
> }
> 
> Then compress.c (which already holds the lock to check entry->ino) can
> call `__f2fs_truncate_cache()`, while other callers can safely use
> `f2fs_truncate_cache()`.

Okay, I see.

My concern is previously we don't export __f2fs functions in *.h, see f2fs.h,
but since it has "f2fs" keyword in prefix, so it won't pollute global name space,
so I guess it's fine, anyway, let me update.

Thanks,

> 
> What do you think?
> 
> Thanks,
> 
>>
>> Thanks,

