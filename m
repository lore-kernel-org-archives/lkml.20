Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792463988;
	b=xvsgo+gZhiFdUbic+yx1GL/mT92gaMd0GA7ilUjbz5loKytoU21IjzFXaANsoiaiPwLr
	 r2qSQ8RgJAqCgo1GF/DMuu8JzBWWhrwXiqrJggnwZWJWZRYZEh0MhS2bUv51Wa45Yicvd
	 45pxNNpRag+wHvWewmjLV+uuepLH3vbAPLTgx+I6/5UgLngwz++ciK5Njhe1NEKS4NUUD
	 6YAtlPdJC6AcKtQlvu+rvcBtHE+wOaAV/bjjLtVDthhLAqgsqdMl4CPCGSl3ToIatT5pe
	 ZT/BDvw5AGnGFjn4sQ+f12FNtWLUKIKbiOE7ZLAD9DvioEUm2Qp5b44f2Me6nCV7j4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792463988;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=jKyfrtAnBnwO542LTPL2+YmVFhv9HS5+X9M5mbYFXh0=;
	b=zsjdxr0ZFfkDfP4O6frbp3+fZkLPWdkibSMxpaFmKd/+oncYnxI/1dy+liEExwZYdaGs
	 IrnuaAZQGsTeFqTASdX1bYvtjydai+sqPmV7r3MGSyp9OpPMqfaxZ1onpzWrchvIpleMr
	 ItCG9XKETeifYUTOmHOxiObIpFjMTeBwImHSaNnDsetIVA4r7e0pzqx18AU0AanI9+NF9
	 D7LgnZVnQvWRABCTX8X0IxW81fUEec0b0CFeZCqR6YPHYhSOlYm/ptMIHZvsJFwGVoSok
	 zuG+xKHotuw0WoQjovlv/ZAexfDiRE1TXfi2tBwrmYTX5JTQndJvfjzZCSnrRR/gu2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=l6k6wTjF;
	arc=none smtp.remote-ip=91.218.175.57
Received: from mta0.migadu.com (out-57.mta0.migadu.com [91.218.175.57])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70874606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70874606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=l6k6wTjF
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=00+vt9qrllM8ZzXqix0pP9Xez7rpoPwxxNCrb4lFYHE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792463985; v=1; x=1793068785;
 b=l6k6wTjFhgWVj5NF7XU8bFp9FuEwCAtrbVnCT3tmMebERaTA44w4l+bpnScfqxKBzBEhDwZZ
 MXIlpZXW2C2dWJp9tmZkmBUZdb5LbEGguI8gadfkvazqAFR0y49+RZ/se3OOPdibKGpZokBtcv9
 oZ+y1Cl9dIrsosChpIMuvekw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0520e0ef0e1754e3;
	Tue, 20 Oct 2026 02:39:45 +0000
X-Mizu-Trace-ID: 0520e0ef0e1754e3
X-Migadu-Flow: FLOW_OUT
Message-ID: <d4a35334-56e2-4590-8b4c-1c030c36e5bb@linux.dev>
Date: Tue, 20 Oct 2026 10:39:37 +0800
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
Subject: Re: [PATCH mm-next] mm/swap: free swap cache folios the zap path gave
 up on
To: Nhat Pham <nphamcs@gmail.com>
Cc: Kairui Song <ryncsn@gmail.com>, linux-mm@kvack.org,
 Jiayuan Chen <jiayuan.chen@shopee.com>,
 Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>,
 Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>,
 linux-kernel@vger.kernel.org
References: <20261014090821.227366-1-jiayuan.chen@linux.dev>
 <CAMgjq7D50X47JFsTnF2-jYGv7i-Nd3WhQLK-TJGy4XkhMQU4OQ@mail.gmail.com>
 <62d17959-d695-4fec-a87b-8eadaaf995a8@linux.dev>
 <CAMgjq7CJ+bwKgwUmCzO9Hr7TrL68bDjgAsLx-4AGuXo6zowh9g@mail.gmail.com>
 <CAKEwX=O4sPx5MtGL4-JwLzD4TWm7fNycFMiuOqLk4ADFUUipNg@mail.gmail.com>
 <4f361479-1dbc-4f09-aa26-e1ad6c06cbee@linux.dev>
 <CAKEwX=N4jj3PGXFx6wwh=PG4Vt6hRJ=-kqX24B55zoXyhAa1WQ@mail.gmail.com>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <CAKEwX=N4jj3PGXFx6wwh=PG4Vt6hRJ=-kqX24B55zoXyhAa1WQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/20/26 2:08 AM, Nhat Pham wrote:
> On Mon, Oct 19, 2026 at 7:37 AM Jiayuan Chen <jiayuan.chen@linux.dev> wrote:
[...]
>>>> Right.. But I think it will be much better to avoid such folios from
>>>> hunging in the swap cache in the first place instead of having a
>>>> worker to reclaim them. I'm not strongly against adding a reclaimer if
>>>> other approaches are too difficult at this point though.
>>> Also, IIRC, dropbehind can only be handled in task context, right?
>>> We'd need to make readahead bios to complete in task context
>>> (BIO_COMPLETE_IN_TASK). I wonder if this has any perf implications.
>>>
>>> Another idea: how about, in swap_read_folio(), where we are guaranteed
>>> to have the folio's lock, we check if folio is mapped. If it's not,
>>> invoke folio_free_swap(), unlock, put, then drop that folio from the
>>> submit batch?
>> At that point the swap count is still 1; the zap comes while the read
>> is in flight. Checking after the read works for the synchronous zswap
>> path, which I tried first, but the bdev read is unlocked in
>> swap_bio_read_end_io(), in interrupt context, where the slot cannot be
>> freed.
> Zap drops swap count first, then try to free swap cache. You're saying
> the read check the swap count before zap dropping it, but still holds
> the lock by the time zap try to free swap cache? :(



Yes, exactly that. With the check in swap_read_folio():

thread A (readahead)                   thread B
swap_cache_alloc_folio(B's entry)
   folio locked, added to cache
   swap count 1 (B's PTE)
swap_read_folio()
   folio_free_swap()
     count is 1, nothing to do
   zswap_load() / submit_bio()
   .                                    MADV_DONTNEED
   .                                      swap count 1 -> 0
   .                                      __try_to_reclaim_swap()
   .                                        folio_trylock() fails
   .                                        gives up
   read completes
folio_unlock()
folio_put()
-> count 0, folio in swap cache, unmapped

The check runs before the zap, so it sees count 1. The zap comes
while A holds the lock for the read.

Checking after the read instead is what I tried first. It works for
the synchronous path and not for the bdev one:

zswap (sync)                           bdev (async)
swap_read_folio()                      swap_read_folio()
   zswap_load()                           submit_bio()
   .        <- zap, count 1 -> 0          return     <- zap, count 1 -> 0
   read done, lock still held           ...
   count is 0: free the slot, fine      swap_bio_read_end_io() (irq)
folio_unlock()                           folio_unlock()
                                          no ci->lock here, slot stays

The write side is the same picture with swap_writeout() and
end_swap_bio_write().


> I was kinda hoping this kind of interleaving would be rare :(


It is rare per event, but it adds up. On production it takes days to
leave a few GiB behind. The DONTNEED there comes from jemalloc, which
issues it on every free the application does, so it never stops. Our
reproducer is the extreme case, built only to verify the problem: it
leaves 480 GB in about an hour. I'll put the numbers in the commit
message.


> And yeah, I think if we want to free the slot after read, readahead
> swap IOs have to be submitted with BIO_COMPLETE_IN_TASK. zswap
> writeback's dropbehind relied on that...


Right, and that would still leave the writeback side. The worker covers 
both in one place.


>
>>
>>> That takes care of the readahead race. Seems safe to me
>>> (I assume if a folio is not mapped and swap count == 0, then it's a
>>> pure readahead artifact, but maybe I'm missing a case).
>>>
>>> The write direction already tries folio_free_swap() before submitting
>>> the writeback, FWIW.
>> Same shape: the zap arrives after that check, while the folio is under
>> writeback. On our box with a swap partition that is where most of the
>> leftover came from.
>>
>> Every check on the holder's side runs while the count is still 1. Only
>> the zap sees it go to 0, and it cannot wait. That is why the patch has
>> the zap hand it over instead (very nasty i know it :( ).
> Yeah I got no smarter ideas :( sweep_work it is...
