Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793743533;
	b=OQ+td2wYIYAJHu0OMomwXY2/yMmKBdN3bnyYsm3gSkiGmXP0VpwpVKfxW/h2PO+cyHl3
	 AFz0da8VhrE0VwwFpeW+UpWrXsYsMcxzGOzu1lm5JFfh8ePRzcs1+8HXfVGq3vTukbYYt
	 0hwRKOdF1nIAXAGxV8W56nbzb1++9I5ipJbgeEMLwSG3b+CtDTN6yngdA4lxU2aK52x7D
	 YmxDIsTjvpfEZhb8tijtw8ne3CeiP7FTB/4Lxlx5hNAxnSRCJGTBdjQGbuCx93JZuvHcF
	 YT5lw0NIliL+anDZ3hGMp9N4hNbPJzDFvMEvKbwOg0dRQINimo5N9QNAtHED9m8r7bA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SNpO3k7KTdxpQD3zf1WdXzfgBBZWj3c4TeMM20zKnNg=;
	b=mi//hsjdaXbjnSvPUcn1aoaG01X5nfGlK+e5w1lZv11oYALnzUEpGyqjfgs+0RtIWSWW
	 4+cC2o/PyPOlMYgAyVV5yEdDZAw3f4t2LJv25m723YS3Z5Epn0crozGbGrm1f56No7fE1
	 nSC2LG+mkHu4TkG8Raqr8/hfyN/tMZBMlhNodKEk4JAyQR/WuH/1w1lpluQNJdUH4l1zj
	 fKJfrtzb88WSa1E71avJTnSrDauHqs8Gs1AXcY3iLScN1GTl6cWQQCYvmdFvfT4TUVpUA
	 nwhCmW+392piY7249I+NnzEEX39HPszHuwYuY3GjRjx/132zqHGjhSegyoW23gjsybg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ULb9BPZG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33F76082BCD
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E33F76082BCD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ULb9BPZG
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bfc3292d90so11989e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:05:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793743531; cv=none;
        d=google.com; s=arc-20260327;
        b=NfJ05qZlUmUf+RXA4XHlR7wOAXrdU9cuUjohcpgaRI7ezOpI+ktT7wGX/Hv1WNjS66
         e1DHEQVilrmwutc83moPirl9PuaP0xSiNvIaByWtlBgRXxlT5s5+9NnOU9ePtWkc84Gd
         YdoxFJzu97xnrHoMfPnQIzjMpu7MnqJdx4DpBS+LWw0IEnUZfTB+0iTzSyfrT++Al2Sj
         hoS+2ZEM6WiJ3lxL6KZF4gZHYl/d4wLlO33RiBYJk1bxYw+GmIkVZEp+xy33WdqXuFHO
         phz0brOUayJuPY7XNmhLfh5AO/GPSaIZTKGhFTrAsg0URSQM1Ir4jIcGbQZjDzOp/IAp
         Ze3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SNpO3k7KTdxpQD3zf1WdXzfgBBZWj3c4TeMM20zKnNg=;
        fh=BNl2nQcvZjkWS+omaxY9Plc/7N7rVdWx63FF+UiW2HE=;
        b=jEEpPFT6r6MPfqEGQmfzBwm1PNCXlNd2qbNDbVQZCTNGdzqL2cgbmf49e5Kcc+qY4s
         gukNakt1Ootcyw4xP1skXLhh4L77RRRVD5xcFoz76pmCBQUSsjOxx1pNWpoI/DC0QRtp
         EVlh8XY6/yg9TQ0+zdetUfojxH2PGownwqmx377uNcjkNHsWoKC+R71O3MmXQClQgJzm
         iMKmW0vuUO67B8lvHCM2+CRuhqFWGzc7WqCKxtyGRMdF1/NyE8F1J+b5iQniP/hMK+pq
         oGOnteK2vgQNtFzsHVIu5NUnCKKworsJiZdxx56ngWQ8mAX+R20DhcO7iHwEr6lx0E3U
         yvLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793743531; x=1794348331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SNpO3k7KTdxpQD3zf1WdXzfgBBZWj3c4TeMM20zKnNg=;
        b=ULb9BPZGWYRGt2VMkR/0Y9smJkiS/qf7Mc9DY++NltbkDEHoGROLCKlKDZkqEJ3Gbe
         HmXX6dsQ7PYIRG3yb9PHYzsJz5UMb5vlzEa2+VdT9kVwwiYfTi4zMiP0ZcxlAs/6OsMo
         jmXXlboS4CGZ7o87ULQ/qBkPg1Xd1RWYQPyKi2AJRkmS4b9YP3wGXL8XgE5jWGmDBn6N
         X+a0GIho6o/+9vKbgyymXo+nKe9UjZVq0T4QgTRXaSkcKtIak2EcKfFWTdq0JusXyUvp
         Q50ptiQrHe6egeDm8aJB7erRudyYvCsO9oNgIGFju7vqkN4m3az51rS5lLfP/QMiACR5
         EHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793743531; x=1794348331;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SNpO3k7KTdxpQD3zf1WdXzfgBBZWj3c4TeMM20zKnNg=;
        b=mDnAh6VxOI+GhhKIaMbwKQxt72EdTCmmc3GWQEs4I0T/YoraqiMKXJSZdB8L0f6dQj
         IGaKHa2nS9d1YI62j6MAkRzYomOlvMVFmthcs3zXIiqP9M67onAlQrGmh/0dRL/GMi+K
         zG29KLHhziQmpIP81WcIHsxomPEp9+nXglTDr4dD3X/ky9z4wSgujqKZmuO6YBl7vGBA
         ree/GKrX9cAyC/fI4f0klScDDZMfgvgJwe+Y9bFf7NFHhFE2YMlZpDlgSZ6oH7hwncRW
         0phWsGehiuZjGXa+PpXxyQYJf6zvuhDzJfz7Lb/33/p1X9GdUi6I0/RGRsp6qlhTQaQG
         hdqg==
X-Forwarded-Encrypted: i=1; AKwUvBxmSJummbVdLzXxrJcF+4IlhhwFq4y+qj1Z6+oqkRPkCuoN+D2NcyM7d7DO5T2D3lr3BRsqsRgDaGMWLj0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yVFCxy/xLvUXLz7ocAWpixH65GtiVCZ2jAvJxiQsXr87ByfM5
	EUJy4jJwbq5DPCctKeZtKSjmxIqeF1MiWkd3/K7+LlCQ9EX+Li9Wx6ttj6IYR4iYj13zap02gyN
	snipob5zN8nsfDl9shTsV//JX2Wy51IM=
X-Gm-Gg: AYBFou0gribpc742+eNCOhRfvusqlReU1Xn4OxNjvYL9I3U4BGcI6BDoeUenKrV3r3H
	GKcDXguSGp3LYGUeXWjv3+N43xpLtLfd186Hehv7nfxwgAlccKzE5FaDaWvD2+H5ElnKL333kLi
	plGwkAia3/Qi6iQVmaBEZqx9EeWTuKXPHpjqPD/w95n6Lmmsxol4vGjHr8iO9Uij5T13sneXSOU
	7volJ762h1F99llHoe06H8odgZBADMCrAJYFgjzxSXSPHQ/MhpHZaiQIL16aW6M57yogAqM5kc2
	bU4HI9cJVIBJDCW7Z/4J5BXCMTn2ApU6wF/d7Zv6OThcTX7ASvZbXip7XYvP/7fKWQ9BkubuW8V
	sNSheHXgcqgF4RvsJg4jmFT0EjFURCi7hb9em
X-Received: by 2002:a05:6512:131e:b0:5bf:cabe:23b6 with SMTP id
 2adb3069b0e04-5bfd9569866mr4812334e87.33.1793743530815; Tue, 03 Nov 2026
 14:05:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013002140.28880-1-kanchanapsridhar2026@gmail.com> <20261103142600.279899-1-usama.arif@linux.dev>
In-Reply-To: <20261103142600.279899-1-usama.arif@linux.dev>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Tue, 3 Nov 2026 14:05:18 -0800
X-Gm-Features: AclHuK_KqFdN8VFfpR0ggkVmcMetMCn8gBaDmQi35Rpfngre-ekOfLRqKDMkPbc
Message-ID: <CACpmpodmeJB5FssJdfFxF+A2PkrC+=hnWGn=F_fTbbEtDfRF_A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mm: zswap: use separate compression and
 decompression requests
To: Usama Arif <usama.arif@linux.dev>
Cc: akpm@linux-foundation.org, chengming.zhou@linux.dev, dsterba@suse.com, 
	hannes@cmpxchg.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	nphamcs@gmail.com, terrelln@fb.com, yosry@kernel.org, riel@surriel.com, 
	shakeel.butt@linux.dev, alex@ghiti.fr, senozhatsky@chromium.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, 
	linux-crypto@vger.kernel.org, kernel-team@meta.com, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 6:26=E2=80=AFAM Usama Arif <usama.arif@linux.dev> wr=
ote:
>
> On Mon, 12 Oct 2026 17:21:40 -0700 "Kanchana P. Sridhar" <kanchanapsridha=
r2026@gmail.com> wrote:
>
> > On Fri, Oct 9, 2026 at 6:31=E2=80=AFPM Usama Arif <usama.arif@linux.dev=
> wrote:
> > >
> > > Stores and loads serialize on the same per-CPU acomp request and mute=
x.
> > > A low-priority store can be preempted as soon as the compressor drops
> > > its stream lock, while it still holds the mutex. A higher-priority lo=
ad
> > > on that CPU then waits until the store runs again, which can take a
> > > long time when other tasks are runnable.
> > >
> > > Give compression and decompression their own request, completion wait
> > > and mutex. Since commit e2c3b6b21c77f ("mm: zswap: use SG list
> > > decompression APIs from zsmalloc"), the per-CPU buffer is only used f=
or
> > > compression, so group it with the compression request. Independent
> > > requests can share the per-CPU transform; the codecs and drivers
> > > synchronize their shared state internally. Loads can still wait for
> > > each other on the decompression mutex, and stores still serialize on
> > > the compression mutex.
> > >
> > > acomp_request_free() ignores NULL requests, so drop the check in
> > > acomp_ctx_free().
> > >
> > > This follows the proposal from Sergey Senozhatsky for the same split
> > > for zram [1].
> > >
> > > [1] https://lore.kernel.org/all/20261005122036.718976-10-senozhatsky@=
chromium.org/
> > >
> > > Signed-off-by: Usama Arif <usama.arif@linux.dev>
> >
> > I have a question with regards to this patch. Is the intent to allow a
> > decompress thread to run concurrently with a store thread for a given p=
rocess?
>
> The request is shared by tasks using the same CPU and zswap pool.
> These may be different processes or threads of the same process.
> Each operation still runs synchronously in its caller.
>
> The motivating case can happen entirely on one CPU:
> 1. Task A compresses page X and releases the codec's stream lock.
> 2. A is preempted while still holding the zswap request mutex.
> 3. Task B runs and faults in an already stored page Y.
>
> With the shared request, B blocks until A runs again and releases the
> mutex. Separate requests let B load Y while A's store is unfinished.
> The codec/driver still synchronizes its own shared state.
>
> > If so, I wonder if incurring context switch/PTE/TLB shootdowns performa=
nce
> > penalty is worth it?
>
> The switch to B already occurs with the existing code. This patch adds
> no worker threads, forced migration, PTE changes or TLB shootdowns.
> It avoids B's subsequent wait on A's request mutex. The 1-vCPU
> benchmark in the cover letter exercises this without CPU migration.
>
> >
> > With the proposed change, will zswap_store() continue to run on the "ol=
d" CPU
> > (i.e. the one to which the process got migrated), or is it a requiremen=
t that
> > the "old" process is in sleep state? If so, should we codify/document t=
his
> > requirement?
> >
>
> There is no requirement for A to sleep. A can remain runnable while
> preempted. Its zswap_store() invocation resumes in the same task, on
> whichever CPU the scheduler selects. If it migrates after selecting
> the context, it retains that pointer and the corresponding mutex,
> as the existing code does. The same task cannot execute on two CPUs
> at once.
>
> > On the new CPU, is the same process "runnable", and if so, how do we en=
sure that
> > the "higher priority" decompress is handled while the zswap_store() pri=
or to
> > preemption is still not done?
>
> Normal scheduler policy decides when B runs. Once it runs, the split
> removes its dependency on A releasing the shared request mutex.
> A load starting on another CPU already selects a different context
> today; migration is unnecessary for the benefit described here.
>
> Existing folio/swap-cache locking still orders accesses to the same
> page. The example above concerns two independent pages.

Thanks for explaining the motivation for this change, and the detailed
analysis! Is it possible that this could cause compression contexts to
be starved of compute resources under memory pressure, potentially
causing deadlocks with page-faults in the worst-case scenario? Since
compression is inherently slower than decompression, could this be
making it easier for swap page-faults to preempt compression. On a
related note, should direct reclaim (only) be allowed to use a
non-preemptible context via a spinlock?

>
> Thanks for the review!
> Usama
>
> >
> > Thanks,
> > Kanchana
> >
