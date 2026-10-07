Received: from mta1.migadu.com (out-199.mta1.migadu.com [95.215.58.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C073A8732
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370982; cv=none; b=mAcDYH98iEMvUBb957v3Je9zrCwNh2nKNizTz1wqxrJ+fQg8wWX+fNWIJ5UFqzAWsjUBoXKuo8qIoF0AjjGIgcnNcHfb5vNRzyHjTWCHwSPnhhq0oq+JXunvQvOpMlGkPTopfAKUmevkYLB1aB8pb+B2WS6wFbWA5QVo559JnmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370982; c=relaxed/simple;
	bh=kbp4UUDGxBCJYQv99MekkXfWeMMWcYb62G5irxFuKAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TP4hElPV7UOhX3B9vZ6qt7cCJ4bt0VTt2VTGwQog3IaStQSKWDkDiZgbmH2QiRUxYiY7apT4VCiPpjRJGjZqGZX3viNws6oC39ZmdRbDqyUOlh1YUqhzvoJZxL+GRJJWrs4/O1wyaX64MRVWnRoGOnv7izsssO786iTfiNSiMWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gqULa/IK; arc=none smtp.client-ip=95.215.58.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gqULa/IK"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kbp4UUDGxBCJYQv99MekkXfWeMMWcYb62G5irxFuKAk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791370954; v=1; x=1791975754;
 b=gqULa/IKXohH3ONV3vkGKAYyCyHyc+FdbYqhucikc7V8Rl8xOAs3ebxY8uMjy9B+XsfLPE31
 PRRCXdTXIfwjJgPKyeMPDdkYIpmUu0kmbulnqqnAFb01rzGcKnA+ZmUmW9SCT2VH/pHyqBV5k6s
 ZI3gFFmO/YCoOwYjqpEMkIhA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fcf850624a10237b;
	Wed, 07 Oct 2026 11:02:34 +0000
X-Mizu-Trace-ID: fcf850624a10237b
X-Migadu-Flow: FLOW_OUT
Message-ID: <65503b6e-5038-4709-8f16-cd7922286963@linux.dev>
Date: Wed, 7 Oct 2026 13:02:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm: zswap: use separate compression and decompression
 requests
To: Nhat Pham <nphamcs@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, chengming.zhou@linux.dev,
 dsterba@suse.com, hannes@cmpxchg.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, terrelln@fb.com, yosry@kernel.org, riel@surriel.com,
 shakeel.butt@linux.dev, alex@ghiti.fr, senozhatsky@chromium.org,
 kernel-team@meta.com
References: <20261006002307.2669023-1-usama.arif@linux.dev>
 <20261006002307.2669023-2-usama.arif@linux.dev>
 <CAKEwX=O=QNWUCTn9kcCwu9V3pTrSwTj8SMCMS6Z-8fwhGjrkdA@mail.gmail.com>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <CAKEwX=O=QNWUCTn9kcCwu9V3pTrSwTj8SMCMS6Z-8fwhGjrkdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 06/10/2026 11:47, Nhat Pham wrote:
> On Tue, Oct 6, 2026 at 2:23 AM Usama Arif <usama.arif@linux.dev> wrote:
>>
>> Stores and loads serialize on the same per-CPU acomp request and mutex.
>> A low-priority store can be preempted as soon as the compressor drops
>> its stream lock, while it still holds the mutex. A higher-priority load
>> on that CPU then waits until the store runs again, which can take a
>> long time when other tasks are runnable.
>>
>> Give compression and decompression their own request, completion wait
>> and mutex. Since commit e2c3b6b21c77f ("mm: zswap: use SG list
>> decompression APIs from zsmalloc"), the per-CPU buffer is only used for
>> compression. The two requests can share the per-CPU transform: no
>> in-tree implementation modifies transform state while (de)compressing,
>> and shared codec state has its own locking. Loads can still wait for
>> each other on the decompression mutex, and stores still serialize on
>> the compression mutex.
>>
>> This follows the proposal from Sergey Senozhatsky for the same split
>> for zram [1].
> 
> Thanks, zram peeps :P
> 
>>
>> [1] https://lore.kernel.org/all/20261005122036.718976-10-senozhatsky@chromium.org/
>>
>> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> 
> Code mostly LGTM. Just one question:
> 
> [...]
> 
>> -        * If there was an error in allocating @acomp_ctx->req, it
>> -        * would be set to NULL.
>> -        */
>> -       if (acomp_ctx->req)
>> -               acomp_request_free(acomp_ctx->req);
>> -
>> -       acomp_ctx->req = NULL;
>> +       acomp_request_free(acomp_ctx->comp.req);
>> +       acomp_ctx->comp.req = NULL;
>> +       acomp_request_free(acomp_ctx->decomp.req);
>> +       acomp_ctx->decomp.req = NULL;
> 
> Hmm do we not have to null check here anymore? Does
> acomp_request_free() handle NULL itself too?

Yes, since v6.15 it starts with "if (!req || ...) return;", so the
check in acomp_ctx_free() was redundant.


> 
> For instance, taking the code blob below:
> 
>> -       /* acomp_request_alloc() returns NULL in case of an error. */
>> -       acomp_ctx->req = acomp_request_alloc(acomp_ctx->acomp);
>> -       if (!acomp_ctx->req) {
>> +       if (zswap_acomp_req_init(&acomp_ctx->comp, acomp_ctx->acomp) ||
>> +           zswap_acomp_req_init(&acomp_ctx->decomp, acomp_ctx->acomp)) {
>>                 pr_err("could not alloc crypto acomp_request %s\n",
>>                        pool->tfm_name);
> 
> Here, we can success with the comp's req but fail with the decomp's req, right?

Right. decomp.req is then NULL, as zswap_acomp_req_init() stores what
acomp_request_alloc() returned, and acomp_ctx_free() frees comp.req
and skips decomp.req. After patch 2, decomp.req also stays NULL for
synchronous algorithms, since the per-CPU contexts are zeroed, and
acomp_ctx_free() relies on the same NULL handling.


