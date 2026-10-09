Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7E34A3D45
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540301; cv=none; b=RW+DS81WG0wEnNfT9Su2miaNgMv0YnWN0K8QJ/+ZPvOFkjsgCp6x8rEZ8xFEjS0IcqL8KyR8EQzrHVSAj1xoQcHtjGuQHOIw4hSMiGW7iNGs/uNF2VxN5uWiNpaOpRAiNyiIGR2qBZcRH8YjdzBJxX3u7aOMlK7IVcIDdNAWDYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540301; c=relaxed/simple;
	bh=0Rrxta9UVHSSE/3yRLAldyCXS7ideiZji7mkmoVQqlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LSe8PiK1Clcac/k4XlSGsmtvB8om/G9qqt6CGsLBI+Z7Zp7FrocqBmQzl/revHK0JFzFmPhAMnqFhy4CBCOHIhCcx7VEqMBTSMNxfSD8cl4YEsuj+pEF1MFaljC0uvjbH48g0bhCgX56y+Iaxy21dYFzs6F6pg1agcr/UlL2sNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2nskZQq; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2nskZQq"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3a49623b865so3875285a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 03:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791540293; x=1792145093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UhXPZh37/T25UvqWQ+VVpQbzKVyhpE9L3wLTHEJqeQg=;
        b=H2nskZQqS6GDYJMIvEA+UJ3m0cAj4QuS5UUmh0uUtejvwuXpG/bb4TeIajbsS5IpSU
         /a8Dp3FjeF5C0GXRD/IdFjIh1O8YuoR7sC3WqMrfEyoZUvQwK9oVtpxNJOup8UZQBQUS
         JXL3CxqtH3ZUx5kvNzDhN1DETI92jX048q605Oxy2tPLlr9LNf+atglRbba0XFoYxbVB
         Y5PpWQbZUDrs65OuhimZ3oOWVCOQZ7UA8y4Lpcg/2fBsTxCA9n8j3Yz4AjogpZSFkoTX
         AbMYWZRNvpSRy1gu+r5z0SiwKkyf90fNY8Dt6xTclqsKsOose4qkbrEc/mMuqeHsReMu
         GBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540293; x=1792145093;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UhXPZh37/T25UvqWQ+VVpQbzKVyhpE9L3wLTHEJqeQg=;
        b=hILbJEROj3XpUV+J1EFPclD8J/KGrcJ42hCilEvsfw3FlKYHJ8GlpKfW0E+CPNm423
         mqpbCIVijKSMRIdtwvsNaWc4UXGp0sWERTBsljg+J4lr+evGbnQDlIxDBXq43g3q5mD6
         9NatCzUAIDXZYe35jUN8pV8TIBmsqg3bb7i0VP0Vuo3eF4sTgjQ9MIiZylhVNcdl1ZK0
         AuLr43LC4n6p+8TaLz8N6vqbsClz1xaMRtY0m9lSI1Ye7t2Auy4GfYagyuylFzMPPv10
         8mNQHS4U2thE+YaTl5TY0+NnC0pmPKHPBqthLJ6OOkWlaGmuPiIlltnumNt+o54wl1b6
         QzZg==
X-Forwarded-Encrypted: i=1; AKwUvBzEZmDM2nnVFdiM/4KQ+KhuWOeY84k8RSFxLIArUCAIq0LP/N0Ppm0N4vup5OSuGBiZXJIghVHzpHH+Vys=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmIeU9nYIQwRog4jpViP0pvGanY+67Q0EtWLwr/RdTaJk6yag8
	jevS3lC+Z5/HoHoilVwzk+AbcGNtjEGDPcS1fNvteLJWp3Gr5JGTmsBB
X-Gm-Gg: AYBFou1eEqS108GNu1hiA6IalBn5z7kbgO+2aKrjLJ7UD2tiMJZSpUtpa83qnlcumT9
	HBsZURF1DUCs4wlmRE3B8ZN79A0Abs3bVX7W2MplcMwXFLQ+j2NBBFT9XzY8PzfUmoZcRupEzxT
	KTGJJS+XxoYk4yUo4VHk2c62RRUe721o03GSxep+u5Ac29cefOsN4i/JO8PWCU28hW5dGRtgvcW
	HN8V33wKyVlFg+ZVVYmVfTdWn60meghXpRCK8dOTnOfM51paBqeNNqSc3jTkoTFOBBz6jp1HrTo
	MnkKXovGNg3qdAqw3tk4p3VROXOdp8ft2CSRmceId3xZENvPtopCwW9YThqlOzkGOfqNIpGhkUr
	B9OAFHdLEjU8bBcT1hEPTNCvSnurRt9rMfgRB45QyM/mPrs7JdxIz8RHNXP1ugyUuhn0LUnuTvr
	lOQQX86/VUn5ck56toKTSKBRGMwNVPZYqj58Wy5m/q6LH4mAbw5rAhy0fsHGZszeCJfONFS979W
	w==
X-Received: by 2002:a17:90b:384a:b0:3a8:1320:38ae with SMTP id 98e67ed59e1d1-3ab3a291871mr1254972a91.9.1791540292682;
        Fri, 09 Oct 2026 03:04:52 -0700 (PDT)
Received: from mail.google.com ([5.34.221.10])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e0816csm714779a12.7.2026.10.09.03.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:04:50 -0700 (PDT)
Date: Fri, 9 Oct 2026 18:04:39 +0800
From: Changbin Du <changbin.du@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Changbin Du <changbin.du@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Subject: Re: [PATCH] perf bench: Add atomic CAS benchmark
Message-ID: <asi72sgQ2YF3qKFm@mail.google.com>
References: <20260930091617.4189736-1-changbin.du@gmail.com>
 <20261008084449.5d9971ad@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008084449.5d9971ad@pumpkin>

On Thu, Oct 08, 2026 at 08:44:49AM +0100, David Laight wrote:
> On Wed, 30 Sep 2026 17:16:17 +0800
> Changbin Du <changbin.du@gmail.com> wrote:
> 
> > Add a new 'atomic' collection to perf bench for benchmarking
> > compare-and-swap (CAS) atomic operations with multi-threaded
> > contention testing.
> > 
> > The benchmark tests __atomic_compare_exchange_n operations
> > with configurable thread count and iteration count to measure
> > atomic contention effects.
> > 
> > Why this benchmark is needed:
> > - CAS operations are fundamental to lock-free algorithms and data
> >   structures. Understanding their performance characteristics under
> >   contention is critical for designing high-performance concurrent
> >   applications.
> > - The benchmark helps identify atomic operation latency and
> >   scalability issues across different thread counts, revealing
> >   contention patterns that are not visible in single-threaded tests.
> > - Useful for evaluating atomic implementation quality on different
> >   architectures and for regression testing after changes to atomic
> >   primitives or memory ordering.
> > 
> > Measurement methodology:
> > - Each thread starts a private timer (clock_gettime CLOCK_MONOTONIC)
> >   after synchronizing on a pthread_barrier, ensuring all threads
> >   begin simultaneously.
> > - Each thread performs a hot loop of atomic compare-and-swap on a
> >   shared u64 counter, incrementing from 0 to iterations.
> > - The shared counter is cache-line aligned (64 bytes) to isolate
> >   contention to the target cache line and avoid false sharing.
> > - The wall-clock time is measured as the max of all per-thread
> >   runtimes (the time for the slowest thread to finish).
> > - The first repeat is excluded from statistics as a warmup phase
> >   to avoid cache-cold effects.
> > Example usage:
> >   $ perf bench atomic cas --threads 2
> >   # Running 'atomic/cas' benchmark:
> > 
> >     Threads: 2, iterations/thread: 100000000, repeats: 10 (warmup: 1)
> >     Avg wall-clock time: 7365.480 msec  (stddev 66.014 msec)
> >     Total ops: 200,000,000
> >     Throughput total: 27,153,697 ops/sec
> >     Per-thread times and throughput (last repeat):
> >       fastest:  7510.031 msec  (13315525 ops/sec)
> >       slowest:  7581.678 msec  (13189692 ops/sec)
> >       avg:      7545.854 msec  (13252310 ops/sec)
> > 
> > Output fields explained:
> > - Threads: number of contending threads
> > - iterations/thread: CAS operations each thread performs
> > - repeats: number of test runs (first is warmup)
> > - Avg wall-clock time: mean time for all threads to complete
> > - stddev: standard deviation across repeats
> > - Total ops: threads x iterations/thread
> > - Throughput total: aggregate ops/sec across all threads
> > - Per-thread times: fastest/slowest/avg thread completion time
> > - Per-thread throughput: per-thread ops/sec (shows scheduling imbalance)
> > 
> 
> I think you need to default to one thread per cpu.
> Also try to run the test for a fixed time period rather than a very
> large count.
> You should be able to see that some systems completely fail to make
> progress under very heavy contention.
> (This isn't one thread getting starved, none of them make progress.)
> 
> David
Thanks for the suggestions.

I'll default the thread count to one per online CPU. The benchmark
contends a single shared cache line, so the threads need to run
simultaneously for the result to reflect real cache-coherence
contention; more threads than CPUs get time-sliced, fewer do not
exercise the machine.

For the fixed-time run I'll replace the iteration count with a
runtime in seconds (like the futex benchmarks). Threads synchronize
on a pthread_barrier, spin on the atomic operation while counting
their own completed operations, and stop when the main thread sets a
shared done flag after the runtime; workers poll it every 1024
operations so the check does not perturb the hot loop. Throughput is
the total operation count over the measured wall time, and the
per-thread counts show whether any thread failed to make progress.

-- 
Cheers,
Changbin Du
