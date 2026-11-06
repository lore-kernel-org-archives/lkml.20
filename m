Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954324;
	b=lktvGA/iOoNne8VDvzv0pRA7J4hnqiiAe2CqiR8n1X9vdjIXhH1UvkBrD0zXTEEn9RPM
	 U2Ov58FivkQ6hxcihGGuTKpc9Ibn281hq2GqFhRYlPVdGjx5xqWIfAB+UIw18UXoKTqDR
	 y1A7Yx0MxcFuvEjT5W97zifugpeQEw2tcZfM0CH/usqpSe9h1pcVrNpZ5KP9mO6T7NFmc
	 AWlluKot0x6O2lKLSpPk9AqhLKZvwZXyDfi6i4Qex91BgFtjLkoSaD6FwL+kxrbeI3rO9
	 fK8P+2ZMlTAWXX5ANBDmqhwcxIXUGPT0bfMeIdEMO72eG+zDIxe/RimzglvfjraRnXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954324;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=7HL2QGS1OX92aMQqi1SQISrpLABTArOf/d1xsMjIfRU=;
	b=GdHYdYNZFuEQT+80SSZOK+Gtc7VGlgStwXixpFduMC8PrC1VUefRCezF8aCKbVNYxPhH
	 YUMciRn6Juh7SAZ+fu75dhED3ITQrh/roCKk2jsLr5O1sB+rJvKwEW64+wIEkE9i0rXa/
	 fqxH02fSxBYivxKEYsIKm2UjCGtsoMu30F6CwgdrK8bM0ZEY2C+GSxP7oiPyr6abiAxou
	 WEJ5lXhV57FOsPgiKZnkCFK5WTq1V+Jpt5IUMcHR0Bih6emp2moCJY9PymVKzNewWS97l
	 cd1ZB1JhQRNt65yyfhuY6R8ozfeBJqsWH8MOsbNV4IXrEwAzMpn0BHWLTdazAeOD8rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=avLsiJ0U;
	arc=none smtp.remote-ip=95.215.58.139
Received: from mta1.migadu.com (out-139.mta1.migadu.com [95.215.58.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31F4606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D31F4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=avLsiJ0U
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OQv2V6wgOoL/c3SmQoZgSHZMEHskeM3NZ49yCaWoo0Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793954320; v=1; x=1794559120;
 b=avLsiJ0U8JkNoApkvbqr8ex0R1z0VcEIOEgvt78Xjk6zeNaX9AX6FOF114vxKtIRy6EwZDYp
 sljQMWyAxHutm56MKltEfZuB5ZwjqOlyDDSJj18Wfn107hqxWm2eiDlOZ9G4RwSE3+zzXoQti2c
 G4L/j7q1y6QOIZbU43ezAYDY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 36c4e4aa0a83de9a;
	Fri, 06 Nov 2026 08:38:40 +0000
X-Mizu-Trace-ID: 36c4e4aa0a83de9a
X-Migadu-Flow: FLOW_OUT
Message-ID: <8e5956d5-ae03-40c0-b5a0-bd550f4c14b3@linux.dev>
Date: Fri, 6 Nov 2026 16:38:35 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (macOS/Intel)
Subject: Re: [PATCH v2] mm/mglru: fix a no-op lru_gen_clear_refs() call in
 lru_lazyfree()
To: Barry Song <baohua@kernel.org>, Kairui Song <ryncsn@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Yu Zhao <yuzhao@google.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
References: <20261026084035.535989-1-hui.zhu@linux.dev>
 <CAMgjq7AJSU9jUBTHGcm05mtGBH4EMQ_ua9YNwuLOGVzhkdLKkA@mail.gmail.com>
 <CAGsJ_4zPZg6pCuhDtTpSkueS2EDSfWeYa23h7kC9hEU0iGB-+w@mail.gmail.com>
 <CAMgjq7DvmrwTu0vz7oHx7y7w1B9uA0AbS3YJ5CcrDVg9VwKqpw@mail.gmail.com>
 <CAMgjq7A6jJQ_Ncp0BCqjQJ8pJXrjr1PoOu0rdj0NJOivKp6e+A@mail.gmail.com>
 <CAGsJ_4zO5S5XFc6dd70wKEs_mzqu_QW2bGOPyhKo4w2cjZrWUQ@mail.gmail.com>
Content-Language: en-US
From: Hui Zhu <hui.zhu@linux.dev>
In-Reply-To: <CAGsJ_4zO5S5XFc6dd70wKEs_mzqu_QW2bGOPyhKo4w2cjZrWUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


2026/11/6 05:13, Barry Song:
> On Sat, Oct 31, 2026 at 3:27 PM Kairui Song <ryncsn@gmail.com> wrote:
> [...]
>>>>>>   mm/folio.c | 6 ++----
>>>>>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/mm/folio.c b/mm/folio.c
>>>>>> index 35e242b48870..ea3adb6a89d7 100644
>>>>>> --- a/mm/folio.c
>>>>>> +++ b/mm/folio.c
>>>>>> @@ -597,12 +597,10 @@ static void lru_lazyfree(struct lruvec *lruvec, struct folio *folio)
>>>>>>              folio_test_swapcache(folio) || folio_test_unevictable(folio))
>>>>>>                  return;
>>>>>>
>>>>>> +       lru_gen_clear_refs(folio);
>>>>>>          lruvec_del_folio(lruvec, folio);
>>>>>>          folio_clear_active(folio);
>>>>>> -       if (lru_gen_enabled())
>>>>>> -               lru_gen_clear_refs(folio);
>>>>>> -       else
>>>>>> -               folio_clear_referenced(folio);
>>>>>> +       folio_clear_referenced(folio);
>>>>> Why can't we just call folio_set_lru_refs(.., 0), and should we clear
>>>>> PG_workingset? Keeping it helps PSI on refualt / redirty tracking (not
>>>>> sure if meaningful but CLRU does this), clearing it makes eviction
>>>>> better, but the eviction issue is MGLRU-only, CLRU keeps it.
>>>> I recall that in v1 [1], Hui mentioned:
>>>>
>>>> "Use folio_clear_referenced() rather than
>>>> folio_set_lru_refs(), which is not defined without
>>>> CONFIG_LRU_GEN."
>>>>
>>> Or prehaps we can have a folio_clear_lru_refs() do in a unified way
>>> for For both CLRU / MGLRU? (Just like folio_migrate_lru_refs).
>> And it will be better if we can keep this operation off-list just like
>> right now :), some later works could benefit from it.
> lru_gen_clear_refs() is currently multifunctional. It clears
> refs/workingset, but also returns true to skip
> folio_batch_add_and_move() in both deactivate_file_folio()
> and folio_deactivate().
>
> This actually looks a bit weird. However, following the current
> logic, I've drafted a version that we can use as a starting point
> for discussion:
>
> diff --git a/mm/folio.c b/mm/folio.c
> index dc2c796a4ea7..bc17cd3b6b6c 100644
> --- a/mm/folio.c
> +++ b/mm/folio.c
> @@ -444,12 +444,12 @@ static bool lru_gen_clear_refs(struct folio *folio)
>          int type = folio_is_file_lru(folio);
>          unsigned long seq;
>
> -       if (gen < 0)
> -               return true;
> -
>          folio_set_lru_refs(folio, 0);
>          folio_clear_workingset(folio);
>
> +       if (gen < 0)
> +               return true;
> +
>          rcu_read_lock();
>          seq = READ_ONCE(folio_lruvec(folio)->lrugen.min_seq[type]);
>          rcu_read_unlock();
> @@ -465,6 +465,8 @@ static void lru_gen_inc_refs(struct folio *folio)
>
>   static bool lru_gen_clear_refs(struct folio *folio)
>   {
> +       folio_clear_referenced(folio);
> +       folio_clear_workingset(folio);
>          return false;
>   }
>
> The another option is:
>
> diff --git a/mm/folio.c b/mm/folio.c
> index dc2c796a4ea7..8d1fd788188c 100644
> --- a/mm/folio.c
> +++ b/mm/folio.c
> @@ -438,6 +438,12 @@ static void lru_gen_inc_refs(struct folio *folio)
>          } while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flags));
>   }
>
> +static inline void __lru_gen_clear_refs(struct folio *folio)
> +{
> +       folio_set_lru_refs(folio, 0);
> +       folio_clear_workingset(folio);
> +}
> +
>   static bool lru_gen_clear_refs(struct folio *folio)
>   {
>          int gen = folio_lru_gen(folio);
> @@ -447,8 +453,7 @@ static bool lru_gen_clear_refs(struct folio *folio)
>          if (gen < 0)
>                  return true;
>
> -       folio_set_lru_refs(folio, 0);
> -       folio_clear_workingset(folio);
> +       __lru_gen_clear_refs(folio);
>
>          rcu_read_lock();
>          seq = READ_ONCE(folio_lruvec(folio)->lrugen.min_seq[type]);
> @@ -463,9 +468,10 @@ static void lru_gen_inc_refs(struct folio *folio)
>   {
>   }
>
> -static bool lru_gen_clear_refs(struct folio *folio)
> +static inline void __lru_gen_clear_refs(struct folio *folio)
>   {
> -       return false;
> +       folio_clear_referenced(folio);
> +       folio_clear_workingset(folio);
>   }
>
>   #endif /* CONFIG_LRU_GEN */
> @@ -659,10 +665,7 @@ static void lru_lazyfree(struct lruvec *lruvec,
> struct folio *folio)
>
>          lruvec_del_folio(lruvec, folio);
>          folio_clear_active(folio);
> -       if (lru_gen_enabled())
> -               lru_gen_clear_refs(folio);
> -       else
> -               folio_clear_referenced(folio);
> +       __lru_gen_clear_refs(folio);
>          /*
>           * Lazyfree folios are clean anonymous folios.  They have
>           * the swapbacked flag cleared, to distinguish them from normal


Hi Barry, Kairui,

>
> I would personally prefer the latter. What do you think, Hui and Kairui?

I prefer option B too: it keeps the flag clearing independent of the
list state and leaves the two deactivate callers untouched.

But I'd suggest splitting this in two:

1. Take v2 as the fix now. If that is acceptable, I will respin it
    with Cc: stable added.

2. Follow up with option B as a pure cleanup, no Fixes tag. The
    lazyfree site then becomes the off-list __lru_gen_clear_refs()
    call that Kairui wants for later work.

The reason is backporting. Every stable from 6.14 (cc8ec7be78ff) to
7.3 carries the regression, but B is written against
folio_set_lru_refs(), which only landed in this merge window
(64169ceea5b1e). None of the affected trees has that helper, so
backporting B would drag the refs-flags rework along with it. v2
applies to all of them with only the mm/swap.c -> mm/folio.c rename
to adjust.

B also starts clearing PG_workingset on the classic LRU. I agree
with Kairui that this is the right semantics for MADV_FREE, but it
is a change beyond this regression and deserves its own patch - it
fits naturally in the MGLRU-FG flag cleanup, as does the sort_folio()
lazyfree check.

Best,
Hui


> Best,
> Barry
