Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794628873;
	b=zDxN8Pk3mEM3zFt+hFFk10pttzrxn+J9yun3hh8bccGSjrIAbepp1ems10B5XgT5iMNL
	 5/orQjPfQcp83uUGwoLFQIiVbtxGOMTxXXNB6MG4eJI7q1/YeMtWRFvXe2A4TbdDFgBHh
	 gty+7yCc6QE7KQBmxpCsJOfd94ym9f9msdC7DGil26KBuaSeTBCeRd7EmVIWWMG/bxlEW
	 Z8mDTZnJPoJ4rPD4zj4yLgXuTtQMO7+v2lR1v+Nu/66lQdAFIC7KkMgZb0EVfQGxPQyz0
	 6ZT9shrwtoIPPuf1n/oN/y6GNMFuWPATODbbhi3jjXmwomsCuVIS/whOMjcF+j16dew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794628873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1B2T0Qlp7SxuW+qGAUFg3vBl1toeAk+9yB0Qb2CaAgQ=;
	b=kaZjQ73kMqUKHZ9g4LHtCjFvGbw0kg+PhPQgfopk8uK91rTCtNAYLA+kjbCEADM3TwyV
	 tSXIm30j6/ys6vgaoUXxAiiJY2xFEx3pyjPA4JO0FvhQK3AOC1Vc1ykJURTbEX1g3cAZh
	 xFh2BXLE/Et4foC7z/ypyAIoOKaFbQMjgb7y0WqOgELzQZpPPQb7iwe0Yv7fPT58iyDEt
	 zI3NBUdrSCQ5lkrudrwYCcLf7S/aL0bZnjM/gCmXSrdt0PaFw/1HxtYBCX28sPHTZhHvc
	 y19KUeFyXRDrtMSfHOkLZuCQGFsk7jKECoAxI00eLH01xKWilJBvKmJ9aeCsTVI40lA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uber.com;
	spf=fail smtp.mailfrom=uber.com;
	dkim=pass header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=giZQU52T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C84B606A880
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C84B606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=giZQU52T
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b3a332105bso15411367b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:01:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794628872; cv=none;
        d=google.com; s=arc-20260327;
        b=SIrhvBKT5YpH/WHBFgIb2wT3M8eIyfhoIYwhNkrUTOWsLHa9EibAvf9NtAXsoBv17r
         /e2A3WSEdYU4PE78mp+FPsCAQs5Fy9NmYEw+R8RTo2fVUdPaaZbdBfJfSEspa02BIgZh
         +YNhJhXYmv2LSEK+xjvHuJKkB8scVTLtjmzieebZSH6EYDN6pKSqYk5JYT2aB2qdmhQz
         9r0Lsj6wuObRGYK7gfZG77faqTdFmAlpJ/LqxGJKdNxGx97RV2DUlqVE7aqcISGRmqGc
         947w7a/+X24zw5TcqnCT63U3w57T3aRGPvG7Q13v0yCSagxeAgwSyMvzempJboewu7ab
         JYAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1B2T0Qlp7SxuW+qGAUFg3vBl1toeAk+9yB0Qb2CaAgQ=;
        fh=jPFL868EFTwkbkhUqT4K0BIcQSI7SUaC7KSCmO1usx4=;
        b=dQnSq1nngRFSio89YoWTk5WgN/DjhG08nmIgunfM0us5D/GbG9o8mevhl/2+1jS+5X
         XJuiiuUKe2stQHrAhWWVMTwiDpS9oR/e+GgRSYt3rtB7QWsno3HINr2g/+MzNRvYrYrI
         Ls3lWAZj3ojbHZzjT6eNeEISXV3ulRWOPVcRnnd6EbFuzUVgLXlQQqIK7hyATKjw71Rz
         OC9yuMfTB2z7kada7kr4cY/IC2vrMMxj6c7xjfF6qApxZmsvTGcbCeHT/psE3pFkLEuI
         jQW7v9ib27Ee8wwLsDpx/VnWoGO7N6VWvYwpVhsXCXOGDKN4GUWdUE8GL0dpMTUNu7XL
         7vQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1794628872; x=1795233672; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1B2T0Qlp7SxuW+qGAUFg3vBl1toeAk+9yB0Qb2CaAgQ=;
        b=giZQU52T402qCV+fpfDf0qxgdq+5QVENrYtKz3T0DfbRaYxgc4YEGd16+rNEGO0zTP
         KoTtdZEGHGzOgtZcz2rwxvWpntH0Z8nuAOJLyyHWdO0oZxkDvRHYDLcY32cxqR8q4zOV
         035DLlW8COEgogerrQwaNoTfp/+Iof/dqfcsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794628872; x=1795233672;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1B2T0Qlp7SxuW+qGAUFg3vBl1toeAk+9yB0Qb2CaAgQ=;
        b=oqeEJA+7HzTyOA4e7o1r9gDeKkiF9PBbvdvPhxWKwolZ2x+vKJmJqkRHAWodrQGW81
         OnDOX3kYSpHP0EZRjrMANBWWbucH7JNZkq4osOmesAiJOelNIPRKPN8XZBmeOMENNSbl
         hB3R/yZKp5eLtvyu5xZofv8OOP5FsTOteDgkAgvbSEuKc+8ZHNkaQtxcM0bXNAYZZKwG
         /8jwchNg5lz8g1imOiKBY5pf6XAVHqSXScoj87WaIFst6Gz1scRAfRSVEnd9pKxEzLsI
         jO2Y3mX85FPnsxA/mfqJPf1eBqQKH/MZoZnvuhHodyQju59j4qdSrKcCKX7J8Jwa7CXk
         fZCQ==
X-Forwarded-Encrypted: i=1; AL+hErGuZce8U2lyb76HheCAgh6wOqScGzEl/+LvwldiqjYEIbtwUIvtGJvSoKfTDDYHzadmo31gaaB7qFV+D1c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OrugcFhigbTFnPN3JpiUvRDKb2F4LI2sPUlUCfZF7S5xmZRAM
	vin5glHSD6wwTXo9MHGcKcssYl2chnEmtmmEtgPvWjhl57s/R8nXHvT/IoZcW+8522mFGPs84y8
	a3mf6Tiw2UXTfZbmm3rJLHu6OrQ1LWmKzjL1Uiz47xA==
X-Gm-Gg: AYBFou09mOsNfwQY7SM1cYSwz7Pi7va4G+X7uzkIwem3wDA/171dExZ3aK0qBSqh+kx
	rSsbpmy/mhLyYq6hQccSsBAsGmuabaCc6JRS9uBPeUY8tu+VtWQ2vv98BjDZuCEQoZuQG5C12Uw
	74MXNq53IH68Bgmk6aJWozeE8AHzEysKzKrSY5Knh7kjhYvvpb0rM1vhlG76qn7xLOhY6Um4h22
	dwKZ2JrhgoEkw1baYfj9b84S0LRCmEkZxxQsk8GoBf4Q72sq0/YNMZhWIOxZV75gK4y/77A7NVa
	Ey19Ro9cKgs6l5lMWCVG3j4PfG770awolUPw374dmpP5lI7WLlVpTkiUVdFiIZIwfpt5gzqxnx1
	qdiguuV2zwMvJdOnKseA9/5QoJIyQvZd0jNHuH7l+C+dA1LO8iYEyw+H+AuczzM3cpnSaww==
X-Received: by 2002:a05:690c:f15:b0:8b0:a01e:2ce2 with SMTP id
 00721157ae682-8b3bb1a2e7bmr50130047b3.15.1794628871618; Fri, 13 Nov 2026
 20:01:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-perf-symbol-memory-send-v6-0-7e90415f0101@uber.com>
 <20261028-perf-symbol-memory-send-v6-4-7e90415f0101@uber.com>
 <CAP-5=fU9Du9cCge2aTm10ejtwBKX1THQpm=h7EMR=WVQLww6DA@mail.gmail.com> <auacxQZKtlFa9Pc3@z2>
In-Reply-To: <auacxQZKtlFa9Pc3@z2>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Fri, 13 Nov 2026 20:00:55 -0800
X-Gm-Features: AclHuK-PAd8WaFSlUgwMAK01VlUdCFUGPmX-smvUPTx6hiYe7HFC--zgfoa4cgE
Message-ID: <CA+w=M=S-H4d_-KCZJqdPoUCyfYtNDsKLd8t37kT134bwpKD7qw@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] perf script: Add --lazy-load-symbols to load
 symbol names lazily
To: Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 31, 2026 at 6:58 PM Namhyung Kim <namhyung@kernel.org> wrote:
>
> On Fri, Oct 30, 2026 at 08:55:55AM -0700, Ian Rogers wrote:
> > I'm thinking this option should really be the default, requiring
> > people to opt out.
>
> Agreed on making it default.  I'm not sure what's the case that needs
> eager loading.  We can change the code to load all symbols just before
> it (oh, it seems the patch already handles the cases) then no option
> would be needed. :)

Sorry for the slow reply. I wanted to have v7 ready before answering.
I agree that lazy loading should become the default, but I would like
to keep it opt-in in v7 and flip it in a separate patch later.

While checking what default-on would change, I found that a binary
replaced during the run gave wrong names. Lazy loading reads a name
later, at the offset the symbol table had at load time. If a deploy
replaces the binary in between, or the path resolves to another file
because the process of a mount namespace exited, perf read the names
from the new file. I reproduced it by swapping the binary under gdb;
perf printed names of the other build. Eager loading reads every name
at load time, so it is not affected. I fixed that in v7 and kept the
device, inode,
size and modification time of the file and checks them whenever it opens
the file again. If they changed, perf warns once and shows the
remaining symbols of that DSO as [unknown].

Also, each batch of names opens the file again, resolves its name and
enters the mount namespace. On my test profile this is cheap (1.3 s
lazy vs 2.9 s eager, identical output), but I have not measured it for
containers or debuglink layouts. The type-aware data cache that we
discussed on v5 would remove most of that cost.

So my plan is to run lazy loading in our continuous profiling at scale
first, and then send a patch that makes it the default. By that time,
hopefully we will have already added the type-aware data cache.
Does that work for you?

> > I'm curious if this is global just to avoid the expense of a mutex per
> > symbol or it needs to be global? [...] but perhaps the dso__lock works?
>
> Probably.  dso__load() already takes the dso lock.

It was global because dso__named_symbols() and dso__sort_by_name()
already hold the DSO lock when they load names, and the mutex is not
recursive. Nothing that holds the DSO lock looks up symbols, so v7
uses it: a lookup takes it only when the symbol it returns still needs
its name, and the batch loader requires it held.

> Nit: I'm hesitate to argue about naming, but it seems a bit confusing.
> Why does it skip to load when it doesn't have a (lazy) name?  Probably
> symbol__needs_lazy_name() would be a little better...?

Agreed, renamed in v7.

Thanks,
Alireza
