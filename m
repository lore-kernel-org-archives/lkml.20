Received: from mta0.migadu.com (out-33.mta0.migadu.com [91.218.175.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006D2396B9D
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278338; cv=none; b=n0AnyqKgua3hMjKjqVpJ81KZdWl+0ZAhjQUUjsX4vrXosH3NFc9EFbU3VuPep6mnWeWjBRTfmjtFknIv0wxB8fUZtnpMQO8DiU6N1wncW84AXjQeeWQ8zcGt1yCEOYqaTmQD/RPjEB2t8eYuDw20M0uiKRNjaO3/6gM3/YQzIms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278338; c=relaxed/simple;
	bh=NDxmeOdnEZLt33HxSjhMazQD45+/Tc0cXQPCXn7yG38=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kmhAIVv3keVTX9Y5/yphG8soODhGhM2nEf0AbDHkU7FXonvoT4pRphqoSF1FM9H1BxMTxyQt3sYOko2mahyN4k8tsTtOQouu6sGgCwcU3d+OP2eOs2ecvhfELc5YfBTX74JFzY8a90YjsUdcoVk8xP0PiaTHIZvioGvhHpVttBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LtEE3rJO; arc=none smtp.client-ip=91.218.175.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LtEE3rJO"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NDxmeOdnEZLt33HxSjhMazQD45+/Tc0cXQPCXn7yG38=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791278331; v=1; x=1791883131;
 b=LtEE3rJO92u+ZKx6mK24AxUU7Ba4Acwti/ARpRKJCs+qke7r+IV034pxf4q8ys9WtyQTV4Ry
 VDMh3cv0cB7CBhX9NfJFoKs7GTKK0xvKQ6sKXmNmQks25iyDNlSMCjzbhjK0/EQGKSbd8+6Shzt
 RXi4NqrlZJaj1lei3FcF+uf4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f269d7c266675868;
	Tue, 06 Oct 2026 09:18:51 +0000
X-Mizu-Trace-ID: f269d7c266675868
X-Migadu-Flow: FLOW_OUT
Message-ID: <13c2ca0d-9bdb-4a23-8317-ed48129cbe16@linux.dev>
Date: Tue, 6 Oct 2026 11:18:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mm: zswap: reduce request contention on loads
To: Andrew Morton <akpm@linux-foundation.org>, chengming.zhou@linux.dev,
 dsterba@suse.com, hannes@cmpxchg.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, nphamcs@gmail.com, terrelln@fb.com, yosry@kernel.org,
 riel@surriel.com, shakeel.butt@linux.dev, alex@ghiti.fr,
 senozhatsky@chromium.org, kernel-team@meta.com
References: <20261006002307.2669023-1-usama.arif@linux.dev>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20261006002307.2669023-1-usama.arif@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06/10/2026 01:22, Usama Arif wrote:
> Stores and loads share a per-CPU acomp request and mutex. A low-priority
> store can be preempted right after the compressor drops its stream
> lock, while it still holds the zswap mutex, and a higher-priority load
> on that CPU then waits for the store to run again. This follows the work
> from Sergey Senozhatsky's zram series which splits it for the same
> reason [1].
> 
> Patch 1 gives compression and decompression separate requests, waits
> and mutexes, so loads no longer wait for stores, though they can still
> wait for each other. Patch 2 decompresses with an on-stack request when
> the algorithm is synchronous and needs no request context, which covers
> all in-tree software compressors, so those loads take no zswap lock.
> Asynchronous algorithms keep the per-CPU request and mutex. For software
> compressors the series allocates the same number of requests as before;
> each per-CPU context grows by 72 bytes, and the load path is about 270
> bytes deeper on x86-64.
> 
> The series does not fix two related cases:
> - Stores still serialize on the compression mutex, so a high-priority
>   task that reclaims (direct reclaim, MADV_PAGEOUT) can still wait for
>   a preempted store.
> - On PREEMPT_RT the codec stream locks are preemptible, so a load can
>   still wait for a preempted store inside the codec.
> 
> The numbers below are the slowest read per run, as a median (min-max)
> of 5 runs. Each run is 12 seconds in a zstd VM with lazy preemption,
> vm.page-cluster=0 and swap on /dev/ram0. With 1 vCPU, four nice +10
> workers page memory out and read it back while a nice 0 task spins. A
> nice -19 reader pages out its own buffer and measures how long each
> read of it takes. With 8 vCPUs there are 16 workers, 8 spinning tasks
> and 8 readers.
> 
>               Before series (ms)      With series (ms)
>   1 vCPU      22.3 (21.6-22.6)        0.97 (0.72-1.4)
>   8 vCPUs     314 (97-2542)           7.0 (5.0-98)
> 
> Reads over 10 ms fell from 26-35 per run to none with 1 vCPU, and from
> 3-18 per run to at most one with 8 vCPUs. The benchmark and test programs
> were written with the help of an LLM.
> 
In Meta fleet, looking at lock profiler in the last day, the longest observed
mutex hold was 137.6 ms, including 137.5 ms during which the holder was runnable
but off-CPU.
