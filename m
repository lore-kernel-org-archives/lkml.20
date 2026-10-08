Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEDC40F721
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791445497; cv=none; b=K7k4iRJx2V2V9xG9oh6BoaEVvpbwOgpnoA/geHOQUw7ePvIP/4SHKN0Is70RKm9+q9Orx8Ervu3EZElT7wjGL3F843FEXiM5mKYInuvBRY5N7oO4JOh3Y8e0ctV8dZiens4wp8WVwTPeWrGwoOIxQCeMuZyB7p5FCB7F9fYwMLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791445497; c=relaxed/simple;
	bh=ajiALRBG+uLF/FyUtt4O4djMH9+/M2s+8Yt/b/qL4Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OEUW+ARalhPW0VRbD+PFQEBqPJ4Mf9gPsC7BzED2RJlyNPKjZ4qRVWocpoBzgwFo3rqbNL3DX1wutQ0izemKcolNow7Cz7SvW0rBsTvyoWO9CPYaaLW5G4FmfPER7i3yFwBT02Q3iBw0YisPMBN4MRhou3sEl5RjHtHqNil864A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ouUY31Yw; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ouUY31Yw"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4649b3aaso1722536f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 00:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791445492; x=1792050292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2+65PmeGU2pObojaDMqRZq6O86JoQo/QbeOjqEwMad4=;
        b=ouUY31YwyOQgLZBFtYyHHBaFUmxk98Mq29w11P3UGFmTix75XSD98bWN2jMylDuvve
         rRzy9q1cemDSawMl+IxXWeX7/vaNCfKFg5/r1pzdYAaKWii0ZFCdgMlLI62WzpyaLqe1
         SekWmxrfjBO9juYhyD+vqqZbtbCOyHvEFyI7wsGgQsrLH6y7tNwZ2Io+HD2sX6PXcOat
         EI8cvelqoh+ZTEfImfzyKlekVbtF7t7d2SJeGZFqTk2eNJDKoA+ym87FUrwopoB0BuSI
         K5Q8tzb1bGuQ5/38DSDojJ0Pfg22GLwFv71jK2Agt6aLvej/Z9O0ELl46Fsssp5VoKG9
         CjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791445492; x=1792050292;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2+65PmeGU2pObojaDMqRZq6O86JoQo/QbeOjqEwMad4=;
        b=ybqY4ISHZWQsRR+LwBiKRMwzQ3rrFcgq11Ii5OR4japCyw0f5OBER0TVYolTe5PgRV
         ehnchg9qRB3zn62od1MmeyzRaVQSelRN7fo0VjyE7Vvlm28YtEXDIOkap5D+si/EMkMS
         ZJsaA/RsG3d8UReN1Th+nIcOBAk70vjnJ/QAjSVfPl821/QC2IV5oeOb4FNMuPTJsf3n
         JsOhSuF/LwxaLLIHi5E228dpnb1xq/1iDrZ8VQvVWdc7bk6474Qw+nctOozhgi7HxnwX
         hk7arDpKYC4xUoucEjlAQRIc20ksy3M87/4JnHIpU1grjospQGw0I7FSRF7hYIZ8qyfR
         yStw==
X-Forwarded-Encrypted: i=1; AKwUvBxmz1q6iktIf8K5nQYDJbIx7JsGOmq793DHu+9CirvHxuGVWhZxWxbC2dReKjtkt51zFANaa7YADzANkOM=@vger.kernel.org
X-Gm-Message-State: AFuF++lWsuryXrAHZXVSTygLJiOSzJvNwH0sh8QZWcqzTWxdJYA0uBJD
	v3U5oUjVUVhNZuFLm+ESIa9sPxwHmDPSZE8SSeFTVBAFIgd3ZIKCdMW9
X-Gm-Gg: AYBFou1N/84D0DfLYebXSabpzWWZQcIVBF5VqqnPJNKTd3pjvQF9tv7ktVqVtSP4s0K
	EahXz7zSofc7ye5Ok8c7TSFKl9ggfY6ibUh4VRqk2mAM8D1JM8XmeNcRnBZr0wBtwZdC5KhCzQv
	chNs+aQfI0LSsJQEtH4vi/SDDDJ+wffx15leaMkn1Aof3tQoHG02bxdXMuthkPheChZgdxnvIRF
	TSzdR7zv/L5bjbDGKEGf/XgNVD7M19hoNDyfNu6Agz+M3sSZKZZkdV1x5JHUGecXJmmszUKh4eB
	8WlWpW64ztvLPhRzfCY8X0pMyuYKSrAqnRnhvNTw2EOl8QGCeTNUpzmAM6ymBEpRwt/XClGUoof
	9j2wVJsV1kkiHZSt1sFI9yWR9JmEw37HGd/KKm83sraJOa/U17lzdU5u2dmtn0kut+cdesz/Qfb
	sh2EuYZi37HqK6I/HPRlhDwtr6U0dEqCAQaRucvIlsMmAEwMldavLPi7Sm1b8mqoyUF+OhE5wPj
	BnnmBhvGVTv0rF0qJM1N2Lq/soBDRkWEeI=
X-Received: by 2002:a05:600c:83c4:b0:4a0:17a:8844 with SMTP id 5b1f17b1804b1-4a1800d3d5bmr77042795e9.1.1791445491496;
        Thu, 08 Oct 2026 00:44:51 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843b5a2esm48410145e9.11.2026.10.08.00.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:44:50 -0700 (PDT)
Date: Thu, 8 Oct 2026 08:44:49 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Changbin Du <changbin.du@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim
 <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa
 <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter
 <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Subject: Re: [PATCH] perf bench: Add atomic CAS benchmark
Message-ID: <20261008084449.5d9971ad@pumpkin>
In-Reply-To: <20260930091617.4189736-1-changbin.du@gmail.com>
References: <20260930091617.4189736-1-changbin.du@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 30 Sep 2026 17:16:17 +0800
Changbin Du <changbin.du@gmail.com> wrote:

> Add a new 'atomic' collection to perf bench for benchmarking
> compare-and-swap (CAS) atomic operations with multi-threaded
> contention testing.
> 
> The benchmark tests __atomic_compare_exchange_n operations
> with configurable thread count and iteration count to measure
> atomic contention effects.
> 
> Why this benchmark is needed:
> - CAS operations are fundamental to lock-free algorithms and data
>   structures. Understanding their performance characteristics under
>   contention is critical for designing high-performance concurrent
>   applications.
> - The benchmark helps identify atomic operation latency and
>   scalability issues across different thread counts, revealing
>   contention patterns that are not visible in single-threaded tests.
> - Useful for evaluating atomic implementation quality on different
>   architectures and for regression testing after changes to atomic
>   primitives or memory ordering.
> 
> Measurement methodology:
> - Each thread starts a private timer (clock_gettime CLOCK_MONOTONIC)
>   after synchronizing on a pthread_barrier, ensuring all threads
>   begin simultaneously.
> - Each thread performs a hot loop of atomic compare-and-swap on a
>   shared u64 counter, incrementing from 0 to iterations.
> - The shared counter is cache-line aligned (64 bytes) to isolate
>   contention to the target cache line and avoid false sharing.
> - The wall-clock time is measured as the max of all per-thread
>   runtimes (the time for the slowest thread to finish).
> - The first repeat is excluded from statistics as a warmup phase
>   to avoid cache-cold effects.
> Example usage:
>   $ perf bench atomic cas --threads 2
>   # Running 'atomic/cas' benchmark:
> 
>     Threads: 2, iterations/thread: 100000000, repeats: 10 (warmup: 1)
>     Avg wall-clock time: 7365.480 msec  (stddev 66.014 msec)
>     Total ops: 200,000,000
>     Throughput total: 27,153,697 ops/sec
>     Per-thread times and throughput (last repeat):
>       fastest:  7510.031 msec  (13315525 ops/sec)
>       slowest:  7581.678 msec  (13189692 ops/sec)
>       avg:      7545.854 msec  (13252310 ops/sec)
> 
> Output fields explained:
> - Threads: number of contending threads
> - iterations/thread: CAS operations each thread performs
> - repeats: number of test runs (first is warmup)
> - Avg wall-clock time: mean time for all threads to complete
> - stddev: standard deviation across repeats
> - Total ops: threads x iterations/thread
> - Throughput total: aggregate ops/sec across all threads
> - Per-thread times: fastest/slowest/avg thread completion time
> - Per-thread throughput: per-thread ops/sec (shows scheduling imbalance)
> 

I think you need to default to one thread per cpu.
Also try to run the test for a fixed time period rather than a very
large count.
You should be able to see that some systems completely fail to make
progress under very heavy contention.
(This isn't one thread getting starved, none of them make progress.)

David
