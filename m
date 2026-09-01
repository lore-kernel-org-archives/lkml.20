Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DC549502C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 22:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788302574; cv=none; b=r9d7ZLC5ihpFHYmJCo0bBmb5dNUTXzOr9JbfGggrhkccqZww+Z0ie3C1ueyYode1AL5UTVzk9fDBWh1ghZz/0wH4+zgQXOZ6h5CEKPu8nCVwOMKvKMp/APd0FY1gKyfGCjJIVVYHTY0lCwwrvRwL/7LnKetAtn3j6V1ycNkB2LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788302574; c=relaxed/simple;
	bh=ZMuWd59UQ2fQfKwzsAC8WJnKG9ndC4TtvOx98BwEsw8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=p+FwKccJO2bU+lHsECNogJfIh0qD1DAJUO8gEe2pszBL7vzgGu3+Jqk0vyne3+tCs74nOGDwsLc0dyo3gN7f5YAWn4JpM9H0FyYWXZa8paLWfflc48YCavzVDRjbyQNI/1ZstL5VzIYxNwON7IBJu4f+RTlKreCU2TKUFW383i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YZYzHK5L; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YZYzHK5L"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6fb956002so5042175ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 15:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788302572; x=1788907372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:user-agent:references:mime-version:in-reply-to:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uVTLltgWzf3njQKdxafQ0CwqfUSU6XQwj4Ha28EdUxs=;
        b=YZYzHK5L+stgU+/lZo1tUHHqsEQEo1HQQ5oKl0HK+OxuPp74yPTFodolvUoIVqudBd
         t+PUiJxqtyecoX6WMApfuNKmAJQpRvNOpZr5jceCww3c1Q1z1WVaekb215nDCbGc9YjH
         rM4nJaI/A8c7I334DdjDgjYqJNj+pPuckaPTqIjfS6PH+OM5nP0Bz5WHfM15TdcP3ORG
         sYZW/MFHkk0rmu8TM4EqYoTJqldQNesO7U8DRbcPXi77X5TbHbWAiRpei+O/HrUdj2cR
         OWz1+W3lGzpEMgGVWSOI3nE/ewfKFr/kj0B662YEwxVh8tLdNniwRikMjMl5PQkV3TAu
         OfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788302572; x=1788907372;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:user-agent:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uVTLltgWzf3njQKdxafQ0CwqfUSU6XQwj4Ha28EdUxs=;
        b=oMdAc0KZqBVh6F1VHAB0ENRzMZxLV7gukN9T6oPg6tBxdrfJ+0SqGSuWv/wLswA31M
         3hEWXELsQXtaA5oAFIBzXdqa56cGXjWb15IiduQp3NAnM7jjcbu+cI8VZNDEF5YrVhi0
         QEpx1SOV8bIMPyKnjWGDTutAeEkC40gqzMTS5qh9vfury270gmdeUJhd1PXxHcgJjHvM
         oYoBUfS6jIiBZp4FSn3aIxgfgBv+aD3v0QLTXC8xf5wEWMCbSGZGdqRMBoWUXGkco0WQ
         7bhT5agjOQ8rFfoLaHVsqtf4ESjXcVWKEwzAKu0XhaQyZ8s7I5H2ekX+9AcEfUTE4yYY
         Vy4w==
X-Forwarded-Encrypted: i=1; AKwUvBz5TWtglAaHOP1rINYISv9ssQgNdCs1udUiqgbHvoJPmBBfGDozM8+0Pa06n8DgtD58TZYhWvdQWxqVcD8=@vger.kernel.org
X-Gm-Message-State: AFuF++miPRIwB3RNt/if2gd8VvTAJvHlcVMCzxvUqQ9hR9X1mtPNHcpz
	qvsnj6WG2VhJGDv6ugLNdWYNEZrYIF7vmuruJH/JRrF5nc19i03jKe2qQnZR6jKwjYFaJkS1ywg
	PFAmG5CY7tA==
X-Received: from plup13.prod.google.com ([2002:a17:903:4b2d:b0:2d9:56d3:fc17])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19e6:b0:2d9:2069:a286
 with SMTP id d9443c01a7336-2daec62416cmr6864805ad.9.1788302572056; Tue, 01
 Sep 2026 15:42:52 -0700 (PDT)
Date: Tue, 01 Sep 2026 22:42:51 +0000
In-Reply-To: <apaO1OHVQWJCuJDE@localhost.localdomain> ("Michal =?utf-8?Q?K?=
 =?utf-8?Q?outn=C3=BD=22's?= message of "Tue, 1 Sep 2026 10:57:03 +0200")
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901052250.154532-1-wfelipe@google.com> <20260901052250.154532-3-wfelipe@google.com>
 <apaO1OHVQWJCuJDE@localhost.localdomain>
User-Agent: mu4e 1.12.15; emacs 30.2
Message-ID: <p9738q5kh9uc.fsf@wfelipe-west1.c.googlers.com>
Subject: Re: [PATCH v5 2/2] selftests/cgroup: test_zswap: fix implicit
 unsigned promotion bug in test_no_kmem_bypass
From: Wilson Felipe Pereira <wfelipe@google.com>
To: "Michal =?utf-8?Q?Koutn=C3=BD?=" <mkoutny@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Tejun Heo <tj@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-mm@kvack.org, cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Michal Koutn=C3=BD <mkoutny@suse.com> writes:

> On Tue, Sep 01, 2026 at 05:22:28AM +0000, Wilson Felipe Pereira <wfelipe@=
google.com> wrote:
>> In test_no_kmem_bypass(), delta (stored_pages * page_size - zswapped) is
>> checked against stored_pages * page_size / 4 to verify that the pages
>> pushed to zswap belong to the test memory cgroup.
>>
>> Due to slight stat update timing differences, delta can evaluate to a sm=
all
>> negative number (e.g. -5MB out of 1GB). Because delta is declared as a
>> signed int and stored_pages is an unsigned size_t, C's usual arithmetic
>> conversions implicitly promote a negative delta to a large unsigned 64-b=
it
>> integer, causing `delta < stored_pages * page_size / 4` to falsely evalu=
ate
>> to 0 and fail the test.
>>
>> Fix this by declaring zswapped and delta as signed long long and compari=
ng
>> against a signed threshold, ensuring negative deltas correctly evaluate
>> to true.
>>
>> Fixes: a549f9f31561a ("selftests: cgroup: add test_zswap with no kmem by=
pass test")
>> Signed-off-by: Wilson Felipe Pereira <wfelipe@google.com>
>> Acked-by: Michal Koutn=C3=BD <mkoutny@suse.com>
>
> (The long long helper is a non-trivial change, so the ack should be
> stripped on this version (unless you can convince me ;-).)

I'm sorry for that! Thanks for the review and for the patience.

>
> I'm afraid this bitness propagated too broadly.
>
> The long vs long long difference is only relevant on 32b, right?
> And the bit-width issue only appears because of the product, not the
> values read from memory.stat [1].
>
> I'd consider three ways forward:
> a) Consolidate the helpers into one cg_read_key_s64() (same explicit size
>    regardless of arch),
> b) keep single arch-dependent helper and tackle product(s) only,
> c) do not bother with 32b in these selftests (I have a hunch that
>    they're not so relevant on such archs).
>
> WDYT?

I like this option a), any thoughts on the sequence here?

I thought the following steps:
1) Add cg_read_key_s64() here and make use of it;
2) In another patch (probably 3/3), replace all uses of cg_read_key_long
   by cg_read_key_s64. There are 41 uses currently.

I believe the tests could be flaky in 32b already (just a guess), at
least option a) would make all be more deterministic.

>
> Michal
>
>
> [1] At least the values derived from available memory, memory events
>     could grow indefinitely. It's true that kernel uses explicit u64 for
>     all of the entries.
