Received: from mta0.migadu.com (out-109.mta0.migadu.com [91.218.175.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F4E490BE7
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370600; cv=none; b=TZAmbek3mMHSGnKDc8BZM7b8qaaSQFXCUOjTvYqI3v4DyoVSJfN23WPg6M9jCecu7CR6m8RjWMwDwBGP5NEO2A3ALaXqUp1nj9XeTIMfMCzhlhbgLDJD/hbA2V3//D2ZCN1iYPNLd+x+HUwh4HEHgwcXYKuTFDo4c/6GiQsKEk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370600; c=relaxed/simple;
	bh=GxCPlE57Cq/icBi/tQSzj1Ld7BdDAW/pW97e/uehP3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rCDNcOv2/hfyQSw8jG0/ukDNbYzSwUBvIq4D6DLZ6oZrYxBfCtKqNdBT7mERnVKjVeSaRvSjL9+WdcndPI5IwqGq0iN8cWSN5dTX60jTzfPcVh5sNOfFF8i0X0zQPTa4P2RZnOpcpIqhNTTthLRR4/Cnh8jCgvteAHIHFNU0D6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=flhXYIJJ; arc=none smtp.client-ip=91.218.175.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="flhXYIJJ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GxCPlE57Cq/icBi/tQSzj1Ld7BdDAW/pW97e/uehP3s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791370575; v=1; x=1791975375;
 b=flhXYIJJkXhCfJmFDZobYSAR8JMjoqIeTErzUj59Z8BB1rYHeLIJfpnVvhxbSSDm25XYippy
 +11zYotNAnNt7Yu5VNJoQx5Z+rFxpGZTjWyVU5D3lWVgw6v332Ohf2qwRLXmDTXsGVczAPNZEGo
 +71rpL4/UBSb0uRjGDLlrox8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 23a8dc82b3a969ab;
	Wed, 07 Oct 2026 10:56:14 +0000
X-Mizu-Trace-ID: 23a8dc82b3a969ab
X-Migadu-Flow: FLOW_OUT
Message-ID: <209aaa32-7763-42d8-83e0-470066c880dd@linux.dev>
Date: Wed, 7 Oct 2026 12:56:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mm: zswap: reduce request contention on loads
To: Nhat Pham <nphamcs@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, chengming.zhou@linux.dev,
 dsterba@suse.com, hannes@cmpxchg.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, terrelln@fb.com, yosry@kernel.org, riel@surriel.com,
 shakeel.butt@linux.dev, alex@ghiti.fr, senozhatsky@chromium.org,
 kernel-team@meta.com
References: <20261006002307.2669023-1-usama.arif@linux.dev>
 <CAKEwX=N3ks2O-dCYPRif3NnHQckdVqLiPGRn03GkCuEE+FVgtQ@mail.gmail.com>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <CAKEwX=N3ks2O-dCYPRif3NnHQckdVqLiPGRn03GkCuEE+FVgtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 06/10/2026 11:35, Nhat Pham wrote:
> On Tue, Oct 6, 2026 at 2:23 AM Usama Arif <usama.arif@linux.dev> wrote:
>>
>> Stores and loads share a per-CPU acomp request and mutex. A low-priority
>> store can be preempted right after the compressor drops its stream
>> lock, while it still holds the zswap mutex, and a higher-priority load
>> on that CPU then waits for the store to run again. This follows the work
>> from Sergey Senozhatsky's zram series which splits it for the same
>> reason [1].
>>
>> Patch 1 gives compression and decompression separate requests, waits
>> and mutexes, so loads no longer wait for stores, though they can still
>> wait for each other. Patch 2 decompresses with an on-stack request when
>> the algorithm is synchronous and needs no request context, which covers
>> all in-tree software compressors, so those loads take no zswap lock.
>> Asynchronous algorithms keep the per-CPU request and mutex. For software
>> compressors the series allocates the same number of requests as before;
>> each per-CPU context grows by 72 bytes, and the load path is about 270
>> bytes deeper on x86-64.
>>
>> The series does not fix two related cases:
>> - Stores still serialize on the compression mutex, so a high-priority
>>   task that reclaims (direct reclaim, MADV_PAGEOUT) can still wait for
>>   a preempted store.
> 
> Any reasons why we cannot tackle this too? Or just one at a time?

Stores need more than a request. The compression mutex also protects
the per-CPU PAGE_SIZE output buffer, which has to stay ours until
zs_obj_write() copies it out, since zs_malloc() needs the compressed
length first. Loads stopped using that buffer in e2c3b6b21c77f, so an
on-stack request was enough for them, but the buffer is too big for
the stack.

> 
>> - On PREEMPT_RT the codec stream locks are preemptible, so a load can
>>   still wait for a preempted store inside the codec.
> 
> Acked.
> 
>>
>> The numbers below are the slowest read per run, as a median (min-max)
>> of 5 runs. Each run is 12 seconds in a zstd VM with lazy preemption,
>> vm.page-cluster=0 and swap on /dev/ram0. With 1 vCPU, four nice +10
>> workers page memory out and read it back while a nice 0 task spins. A
>> nice -19 reader pages out its own buffer and measures how long each
>> read of it takes. With 8 vCPUs there are 16 workers, 8 spinning tasks
>> and 8 readers.
>>
>>               Before series (ms)      With series (ms)
>>   1 vCPU      22.3 (21.6-22.6)        0.97 (0.72-1.4)
>>   8 vCPUs     314 (97-2542)           7.0 (5.0-98)
>>
>> Reads over 10 ms fell from 26-35 per run to none with 1 vCPU, and from
>> 3-18 per run to at most one with 8 vCPUs. The benchmark and test programs
>> were written with the help of an LLM.
> 
> Great find, Usama!

Thanks for the reviews!



