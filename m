Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48583AEF53
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787939921; cv=pass; b=Tixidre215Rf4SnETdvY7E8mFEYXxrCzH4WN9DGZ1PdJSljrADndSkMKMPhBKXQgk0U/INrFApnQYYEt6HSkKeoozbn9q8zDKYSPJmzL9KHE294M5d8Awv1DLWDiRDxkZfFDEuxS/ewce2Tb6mQNJ+z3EYTrp54eHrOmpjkJn74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787939921; c=relaxed/simple;
	bh=R2koS2vCzM8w7VNNntAyqh354TzQoKL9/yGNgBa5fxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KPV5utSVY1AKCNIAFm7MW12lSlojuhcFgL0h2Eh+2fvB5QhEdo4w0scscNk3sk84PKYTgxK8BS06zGmR9XLnscdyZGUIQsjt+Zs8G2rSZLkmoeZf3jtdEBt71DnfVWIoWiDppPlA/OgNpyU5qSETXdxUxI1uIZgmnZY+hcY7wGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DScrqejU; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DScrqejU"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-498012a61f6so3345e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787939918; cv=none;
        d=google.com; s=arc-20260327;
        b=W4cEWCv75va25rOqubgI0rV9vxsPZ1ONKS2WqvnV+P3Qx6XxmXmzNI3/DDqckCp5p5
         UcwBiw3JAe0mCCUU4HWZC/AkEHshNb7k0Ld0ChB04N5INwSJANMg0V/kpga8w0bAdw6m
         yrGwezMO64+UiN9zHArz7mLuR2nRmlDN0TERO2ZAkLkxdKWVbgFYUU64eCleO/DDpbLc
         b0MkEDzvLlFcYweXtshlXuQ9B/md7w17azBq9UrCEXyCpPbS4pOsZxPF9GhFG8wPZHaL
         hUKUjedu8Z0JrStHzfFvpMBSjyhXzyXp4UQyzH/ST7PauLSjKnjf8x5dGCw9ETdfLnjS
         Q2PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R2koS2vCzM8w7VNNntAyqh354TzQoKL9/yGNgBa5fxE=;
        fh=2pXXycn0OZLDIzwpGVq1GI97zWc2aC1IsRgQCw8VC4k=;
        b=e3acVAU1D+VvDGYmWwwA3gr6QhEWNg5U4gWexAd/SSmhZaQZz453IcjIUvhAwbDW3n
         G5nCa3zuFqil2rUAbCEHht0t7QPqnjKx00Ekw4RdSeLDONViQuB4QaK8WpWNC9JGeziu
         L5x9eDQvbXunp1XQjEkekYruR71cVvTU/jdW5QqZwetKEnejYbHLufmoqJ2pg6PE1MbC
         fETeqDwYlZhwDZhIcJtIO5gwi6iXiQUjQzZGaGqYNIgdMirevjVj9+gSsltf1ZrBVFrB
         wZKNjTDcJhymIOcCiYW++9LMuxH9ECVjorKbYRfKX14EUp1fbAQZKAPOEoMiNZB6R5Rz
         ax6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787939918; x=1788544718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R2koS2vCzM8w7VNNntAyqh354TzQoKL9/yGNgBa5fxE=;
        b=DScrqejU4er4C0PONd/HEcv+VylE4MXwCzwzskDYrIS/GTuBTGahte4X6VHK/k0IUP
         Xtyx/P+j2LKczKQim13W1UN4aqIiX7nyzKwAbvQ8rxaMHHMhoCPGtDpPDa4s0LZwsgME
         212zo1qFwCSWsWLgue2fQe652GtgI3CSen1yTU7n3elcLVTE9JLVrH/V3JrKCx6+y14M
         NpYAwhwZB0HYbxh2wNd8P4k16oOE0QTT4Fn7kFPNGc7ERkzRFEGVJSHhs1rndyI7fEHX
         xDXLgbkSjZ1odFFT5CqyqQXVQPzzNmMTKRYep5+fh1w6gZ5byAnuYNk3gVWHnx3Wik8G
         oheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787939918; x=1788544718;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R2koS2vCzM8w7VNNntAyqh354TzQoKL9/yGNgBa5fxE=;
        b=Ui9MMPu+6cE3lsMQcdyhq7jtY5bVvko0VDUSeCfZu6nyrdLPINzpxe7BK7EnJp4ap3
         vUemFQimIRPwlxXnJ7yCK4U5kMxD+C0C+NQSTPFxwBI1ojNAN953tBzErImPpGL+0bNS
         0zXALPBe8A+AF59AUXCVrXtUJI16CWQIYzOOvMDp8NpD3Q4uaYjcMNhdJnvQBE5rwKZ4
         wK4ZZuu70AIaiT01SztaNnwzLhr4Zkml/n6Fuw/3tQGLrcJrYNYkywMEolb2LLb6vj7l
         eCGtdKfHGL2duOFvhzDnomOT+j31cBW5u7j/7fu89wetTFUH6jsVcrdOplWAurbSNI2y
         op9Q==
X-Forwarded-Encrypted: i=1; AHgh+RpafY3UafvBiGpuelAmRjOEzyJMcd64zBiGUjAuUJf+G+V6NTb3UDIVzyGY5eKBWvpFg7InTnMqw3MaB64=@vger.kernel.org
X-Gm-Message-State: AFuF++k7ml1phlc9JHVGMMI9RIMO0WnT7f8Qx4BRerYFlJ0208fvhgiF
	S36cuMlzs4d0VgQjlvmJvV7ymYG1D6cFrpgG/r0NH/2OYBskXXUyrBLMSSSgD8sglObSlQ5UYG/
	UtfYFX+I8A+1u5egaDmyAzTkC9ZoptBUqZsfRbzvi
X-Gm-Gg: AR+sD10bj6rEZbnFlW9dKqhn0gzN6J9N+D/pYjW4V3hy5Ax2kMLcXLKhTYilhlHU+SZ
	ivbPpNTwSPHxdw7cjZWpVMbLtpgUJKTf3x1EKg5RwV0kNLk1RMSax5snR8xow4zV9PBMgjvZygu
	zmDHH/SBddabVZMFXnRXxZo/+CtD+2mrsEQoiAdzYYwhYQfeoJmen0BWiNlCEEX3HvuP6t/8vfz
	kb4ZCPFFv2g3KxouL7qUkE+bxktlFbiyXxU/YTbHx3lNmRi2hO+DnkFCYod3LDIdtweFvO9fKAT
	STqDZd7XjiEs/R7KfizzdOCa/ms3sVJkBBUpnXS9pTMF92sQ/cKQB2lX8MLbXHUhi8PCt313/CU
	=
X-Received: by 2002:a05:600c:6051:b0:499:c46c:addc with SMTP id
 5b1f17b1804b1-49ccbb107damr76865e9.2.1787939917426; Fri, 28 Aug 2026 10:58:37
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827232948.2520558-1-stevensd@google.com> <20260828124758.GP687043@noisy.programming.kicks-ass.net>
In-Reply-To: <20260828124758.GP687043@noisy.programming.kicks-ass.net>
From: David Stevens <stevensd@google.com>
Date: Fri, 28 Aug 2026 10:58:25 -0700
X-Gm-Features: AcwNN1WqLTUUK7Ta5eHOzidgwYbjtzO211AQh82X2UkIHuKv6OJYSJ2tvHu1D2I
Message-ID: <CAOiLmNGr385FOvdd9utJ6VYmngvRPbg8v6KfVVhFwmQ4oxhLSg@mail.gmail.com>
Subject: Re: [RFC 00/10] Reclaimable kernel stacks
To: Peter Zijlstra <peterz@infradead.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Uladzislau Rezki <urezki@gmail.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, suleiman@google.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev, jstultz@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 5:48=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Aug 27, 2026 at 04:29:38PM -0700, David Stevens wrote:
>
> > On Android, system processes typically have 2000-3000 threads. App
> > processes add 1000s more threads on top of this.
>
> WTF ?!? Why does that all spawn *that* many threads? Perhaps work on
> reducing that some?

I agree that the number of threads is rather excessive, and reducing
it in userspace is an ongoing effort. However, given Android's use of
Java and its heavily multi-process architecture, especially once apps
are involved, there are limits to how much the thread count can
realistically be reduced. And even if a 50% reduction in thread count
were somehow achieved, kernel stacks would still consume upwards of 1%
of system RAM on lower spec devices with 4GB of memory.

> > Tracking blocked state and when it is safe to reclaim a stack is done
> > via a series of hooks in the scheduler. The actual reclaim of stacks is
> > done asynchronously in a shrinker.
> >
> > Once a task's stack has been reclaimed, it cannot be rescheduled until
> > its stack is repopulated. Although there can be a repopulation fast pat=
h
> > within the scheduler, reliably allocating memory to repopulate the stac=
k
> > requires a fallback path that defers the repopulation and wakeup to a
> > workqueue context that can use GFP_KERNEL.
>
> I am really confused. On the one hand you have John working on proxy
> execution, with the aim on reducing latencies, and then here you are,
> posting something that will introduce basically unbound latencies.

The two projects aren't contradictory because they deal with different
types of latency.

Proxy execution aims to solve latency introduced by priority inversion
between background tasks and foreground tasks. This can happen at
basically any point if you get unlucky, resulting in unpredictable
latency spikes in high priority tasks.

The latency introduced by reclaimable stacks isn't substantially
different from the latency from refaulting evicted anon or file pages.
It's a tradeoff between the reduced cost of cold memory and the
increased latency when re-accessing that cold memory - clearly a
tradeoff that Linux already makes. In situations where reclaimed
stacks introduce latency, there will almost certainly already be extra
latency incurred from refaulting userspace pages. I don't yet have
production data, but the testing I've done so far doesn't show any
measurable negative impact on user visible latency metrics.

-David
