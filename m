Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793308164;
	b=biaC3iulj9HJ1zGGq9rSGk5Kin2xJObulKGuqrAPzPE3clj6vvSRTaCpRNY14mX2Cn9/
	 IYR045IzYmpCdpngbuR3yiUh3MFpKovjJtUs43+e1buWasRCUGPmx/DT7QH2HUGlire7n
	 5em34n6rDCmO4PA4P5M5HCwGQ1gYr2JC7BhQc5e+C4tteXTBg5zS/U2yJXmi/3J4uNUCK
	 KkKHDu/B01kwZqW25yAPlbbBF0S1pFsd3AhYwlTwwT3sqKsuQW2Kug86MgX1+cpBVtM7O
	 cFmM/0vHPYmo/Bh50+YIDifVyt0fAFrc3yc3DxuUrW/y6fGUK0ToTumBT/aQzYxAQbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793308164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7kYdsdZrgEIyd8GSLnE1/erB4mjt9X79rFFJFtO64kU=;
	b=0O7aC0NmxxqE5puaHki2tXwmgCMQ6gr/jMhG5BQ9GLhd6wFQMctfQKb3inh0koykPWus
	 bYp8UKddHo4Cb/l7ZCz8pRXXpVmdr26qLmQ2wyLYcOUCum1J1fC0OVqb7kj+jr4gFH44a
	 5elZfYv52I9RVWyA4q8XBR45FHByMM3E+hIy1RpfMUEYXvdUdMH3a6RsMlsJaa4+UUQCX
	 MxNfJpUvoEx8HkvZ6H9/xhOWBEGNUzuxoQS43N60XaG/7zk7OUWEnQvA++Wwbmcy5jVOD
	 KCqjPEtC8ICUYCiry7fHc0KBTMqpD2eoip6jOer1Di2GxhBA2d384ow+AvL5kLOIDSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GJkAPnXc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D5B606A322
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2D5B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GJkAPnXc
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ac97e45a79so775271fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:09:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793308162; cv=none;
        d=google.com; s=arc-20260327;
        b=jEf1voqhfS+RYGsF/6ZYgVwtCu8zscVwzcDgrDsevtz3R9rFFCtZLWxQFtd/gVEBPZ
         a3IlZDWmv4gSKhXAQxjU+fLTfgPzGr8yxqCITHvVv1yGUX4BMp+JK+Sy6vzAvxJmvbUD
         UfzeJgTherPe97XpUpljKLThPGTfpGf0Mdwr8DStM7E/cX8+fGvjLG4CgxmEpgXbRo8F
         IhEmRuTvNmkzfkbQRFxjWq6lqp7q6jQWyTDpMRB7eCUY7ui0WwV6nJutrNr5Z6y4dAdE
         HhJ645Y8hL9V5/lhDtKYcjd3f9An7ZVZCm6+tp21HWmpEF7gAf5Y5XabLM3h3VoBzbsu
         98XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7kYdsdZrgEIyd8GSLnE1/erB4mjt9X79rFFJFtO64kU=;
        fh=LgF7yrI+7cSf3qH6gJZ+4+F/PMtPFAKtZ9ZYfYEg8kE=;
        b=ni6YYRZoPcV9zgnR9MJlRI8xgRMZUmgANI29Suzdnhn4QQID0ZCiMT1CgteOzUbCt0
         DQZZVbMtYaedmdHrZhCyRI3N76w5XX2rm3CvSwy3RwuNvueXAoqc3DgbjqPp58+Jn5lt
         1Z6ytL3uWSAIGQxVCaMrXjXPeJ8NNmgSkOCMV3+J52Tyg1nl4QWqNftMUTxvTluuP6Ir
         SvtSQpnDfYNS8dZmk8OnI9M2LWEGltln4tsVkmLUBAJ9hOYhtn/cs0l+ebKQL1avBCj3
         LdtJXFwVZFA1S96hr44bY/1SQJovE88xztjPxE64HNUgWP2b8YI08arHyDpRMMKwMBQZ
         phMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793308162; x=1793912962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7kYdsdZrgEIyd8GSLnE1/erB4mjt9X79rFFJFtO64kU=;
        b=GJkAPnXcrUi4h3HatzovAOMoP85xhYxV+kQ182b3TNTPH0iqgpnF6S5IoS8oi85qCj
         AEWDm/91aA8JzjZ4XxxalQfl52S6vLsJsmbiLxbm7FJ46Xilk4ErlDXMjsvgNALPscpw
         T6IQt4u55seGSlBgG+qwSB4NSgN14WnH5bwqhnGqzJqOvuTN1XkJmuJVbA7TEpDT0TS+
         cWT84erM4hEdWlDbi6Mr/oc7U8Os+HjXFkOv6HnfY48ZCFLEI5YwTZxVR/028mGseeWR
         65rRGsRANfSGQUyGGK8aKqc/aZ5XfxGpRhzPyLRKXWxt0pMnQNcKByLrEX0USnASjDSU
         GiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793308162; x=1793912962;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7kYdsdZrgEIyd8GSLnE1/erB4mjt9X79rFFJFtO64kU=;
        b=CMSkYikOYQQz+EUokWSKT+HdYnAwRuU+hZgzBYtDlPW4XymZ2AMAErJXT6qtsI8FWg
         krJDwyJyH2z5Vd6EWIF3ZZTnPY6PF31V7I7oAlcC7Ps2kn/9iC76hSfMDx2I1xqo4Mec
         fsQxwJ1HZabsNNGt5HXc/2opPNSALrGDmhOl8xytZQpbViajA1tQn6SHaDEmwlWS0yN2
         Mm8S7Mpv+u0TF9ktiRrHzEUgCsYp2zwLhRU2WQ8wLsyLw4R/nAzeBP3reIfc9bitM87s
         GG2zcSTkdk96dtpHMuRMSRvD7KGtTwzuCbwmd2+RZIJDJvs4nfOsjbaaZl7Z//qY9zYU
         hS1g==
X-Forwarded-Encrypted: i=1; AKwUvByR450VQqBFHRtaNGHE5iYWLb1mfeTTEyo4exKLSKWnqSrXqLmXMYVID6K+4jJPFHxzFmDzua962tR+po8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmpZJ1ZhVcx4KLukN4FQUC64I1U7pGI3GH8GUAo0H1u8HPzU4s
	0ZB3p1ytot+zIxGFrHGwjkgqI8ma++OhPICUbqs+CLkL7tf8nCvvkJoRG7CEMcbs2OIhyJKMcud
	ip1mWmcIPKMcEJMY7HpYRzD0/5qnb1QE=
X-Gm-Gg: AYBFou1+c11ERW3NJLS0ne7nrHLQVW76H+XmNDvCP7CWQdzlbHM3vm6oG3hkg9F8fsr
	AkcU533olSXdaTAHL6D1dABntBK+rDUCXRcUC/AVrtqt/UnrPlItytF3WD0JR9f254C6l+lCboz
	zoeFV0OvEis36uUJKe85QQuDr6VSmVr/rCxCAOtgL4WZTh4kH+NO8H9tvmHJIXY1YxFdOHhzPA9
	ipy9i8ykkPtRHPRauNAI42kAlFPjA/W7EaIEasYlKWNuBstHIU2aoxvw1Pxo3bgvxLUJQZ7yqDb
	h4mCeto9nINYjKaosIMJbMXAJTgq511cF2HvdNakfATBoUDFJW0upBKgBfcUhuAPbuHUGfikTdj
	vsU+1l6/ULl0OlKpklMMKfzkLsuMs8XpSZk+6
X-Received: by 2002:a05:6512:a94:b0:5bf:b246:87a2 with SMTP id
 2adb3069b0e04-5bfd957b610mr43125e87.10.1793308161793; Thu, 29 Oct 2026
 14:09:21 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028030503.17923-1-kanchanapsridhar2026@gmail.com> <auOZBtRqQGzFcbAT@google.com>
In-Reply-To: <auOZBtRqQGzFcbAT@google.com>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Thu, 29 Oct 2026 14:09:09 -0700
X-Gm-Features: AclHuK-m7JH-ZqoB-jo0yDD7-BAXHkWcLwROF3ZmF0vmqG3Tfo8M-MSswHjw2Rs
Message-ID: <CACpmpocqHHa4z9hkZ6YEm-wmzMqSX5WpPLfku7Om=NenRq_05Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Batched zswap_store() framework with compression batching
To: Yosry Ahmed <yosry@kernel.org>
Cc: hannes@cmpxchg.org, nphamcs@gmail.com, chengming.zhou@linux.dev, 
	akpm@linux-foundation.org, linux-mm@kvack.org, herbert@gondor.apana.org.au, 
	davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 12:12=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wro=
te:
>
> On Tue, Oct 27, 2026 at 08:04:55PM -0700, Kanchana P. Sridhar wrote:
> >
> > v2: Batched zswap_store() framework with compression batching
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > This series is a spin-off of "v14: zswap compression batching with opti=
mized
> > iaa_crypto driver" [1], and focuses on the generic crypto_acomp and zsw=
ap
> > compression batching enablers. Resuming work on this series following a=
 gap
> > since v14 (January 2026). Please note that my email address and affilia=
tion have
> > changed from kanchana.p.sridhar@intel.com to kanchanapsridhar2026@gmail=
.com. I
> > have retained the original Intel sign-offs on prior patches for histori=
cal
> > attribution while signing off v2 of this series with my current address=
.
> >
> > The main focus of v2 was to establish a reliable and accurate performan=
ce
> > measurement methodology, that addressed the problems with variation in =
v1. This
> > is accomplished and used to validate v2, by reducing usemem to 2 proces=
ses and
> > enabling PMD THP. As the data shows, we get exactly the same "2048kB-zs=
wpout"
> > counts in the baseline and with this series.
> >
> > To summarize the main contribution of this patch series: Batching is in=
troduced
> > in zswap_store() of large folios: we carve out a large folio into batch=
es of
> > ZSWAP_MAX_BATCH_SIZE (8 pages) for software compressors, and store each
> > batch. Moving the fundamental operations that need to be happen to stor=
e a page
> > to now work at the granularity of a batch offers opportunities to optim=
ize them
> > from these perspectives:
> >
> > 1) Utilize existing kernel API that minimize obtaining locks for bulk
> >    operations, e.g. kmem_cache_alloc_bulk()/kmem_cache_free_bulk().
> >
> > 2) We keep the working set for each of the core store functionalities
> >    (alloc/initialize zswap entries, compress pages, store pages in zsma=
lloc,
> >    pool/objcg reference increments, objcg charging) to be focused on a
> >    batch, thereby minimizing cache evictions and benefiting from cache
> >    locality.
> >
> > 3) Along the lines of (1), the main zswap_compress() batching routine o=
btains
> >    the comp_ctx mutex lock once per batch, and releases it after it has
> >    processed all pages in that batch.
> >
> > 4) Any zswap store functionality that works on a batch can potentially =
be
> >    optimized via bulk-processing/parallelized as a next step, to furthe=
r improve
> >    performance.
> >
> > Performance data: usemem with 56% over-commit:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > Validation was done with mm-unstable as of 10-25-2026 (Baseline) and wi=
th this
> > patch series. To minimize variation in the data, I made these changes t=
o my
> > performance measurement methodology:
> >
> > 1) Reduced the number of usemem processes to 2. Each process tried to a=
llocate
> >    2400M, in a 3G cgroup memory.high budget, effectively accomplishing =
a 56.25%
> >    over-commit.
> >
> > 2) Increased the runtime of the workload to ~9 minutes by enabling PMD =
THP,
> >    i.e., 2048kB mTHP folios.
> >
> > 3) The use of PMD THP forces zswap_store()/zswap_compress() latency to =
be in the
> >    critical path, and thus enables very reliable measurements with bpft=
race.
> >
> > 4) I used lhist() instead of hist() in bpftrace to gather latencies at =
a finer
> >    level of granularity and accuracy.
> >
> > Testing was done on a Chromebook with a QEMU "vng" VM running in Crosti=
ni.
> >
> > Chromebook Diagnostics reports:
> >   Intel(R) Core(TM) Ultra 5 115U (10 CPUs, 4.200GHz)
> >   RAM: 16GB
> >
> > vng setup:
> >          Memory: 7G
> >            Swap: 3G
> >     Pinned CPUs: 2 (E-Cores: 2,3)
> >
> > zswap compressor:
> >   ZSTD
> >
> > mTHP enabled:
> >   2048kB (PMD THP)
> >
> > I used the help of an LLM to write the bpftrace data post-processing sc=
ripts
> > that generate latency percentiles.
> >
> > vm-scalability/usemem setup:
> >
> >   cgroup memory.high: 3G
> >   2 usemem processes, each allocates 2400M anonymous memory, reads the
> >   Silesia dataset [2] from a pre-fork-allocated buffer into the 2400M,
> >   writes to each unsigned long in the 2400M, sleeps for 10 sec, then
> >   frees the memory and exits.
> >
> >     usemem -w --read-silesia -O -b 1 -s 10 -n 2 2400M
> >
> >  usemem metrics are reported from a single run after starting the QEMU =
VM.
> >  Further, I have tabulated the bpftrace p50/p95/p99 latencies with thes=
e labels:
> >
> >  "zswap_store_higher_order":
> >     zswap_store() of PMD folios.
> >
> >  "zswap_store_order_0":
> >     zswap_store() of order-0 folios.
> >
> >  "zswap_batch_compress_per_page":
> >     zswap_compress() per-page latency of store batches generated from P=
MD
> >     folios.
> >
> >  "zswap_single_compress_per_page":
> >     zswap_compress() per-page latency of order-0 folios.
> >
> >
> >  ----------------------------------------------------------------------=
------
> >  usemem                       Baseline      zswap        zswap   Change=
 with
> >  PMD THP                   mm-unstable      store     compress      com=
press
> >                             10-25-2026   batching     batching      bat=
ching
> >                                         (patch 6)    (patch 8)         =
 %
> >  ----------------------------------------------------------------------=
------
> >  usemem process 1                6,353      7,240        7,428
> >   Throughput (KB/s)
> >
> >  usemem process 2                6,352      7,236        7,422
> >   Throughput (KB/s)
> >
> >  Average Throughput (KB/s)       6,353      7,238        7,425        1=
7%
> >  ----------------------------------------------------------------------=
------
> >  usemem process 1              484,580    308,903      257,230
> >   Time to free memory (usecs)
> >
> >  usemem process 2              518,928    438,585      446,958
> >   Time to free memory (usecs)
> >
> >  Average Time to               501,754    373,744      352,094       -3=
0%
> >   Free Memory (usecs)
> >  ----------------------------------------------------------------------=
---------
> >
> >  ----------------------------------------------------------------------=
---------
> >  usemem                          Baseline        zswap        zswap    =
   Change
> >  PMD THP                      mm-unstable        store     compress    =
     with
> >  BPFTRACE                      10-25-2026     batching     batching    =
 compress
> >                                              (patch 6)    (patch 8)    =
 batching
> >                                                                        =
     (ns)
> >  ----------------------------------------------------------------------=
---------
> >  zswap_batch_compress_per_page (ns):
> >                          p50                                 40,086    =
    1,569
> >                          p95                                 54,689    =
  -64,505
> >                          p99                                 83,248    =
  -88,488
> >  ----------------------------------------------------------------------=
---------
> >  zswap_single_compress_per_page (ns):
> >                          p50       38,517       38,352       36,650    =
   -1,867
> >                          p95      119,194      121,174      133,678    =
   14,484
> >                          p99      171,736      158,601      169,010    =
   -2,726
> >  ----------------------------------------------------------------------=
---------
> >  zswap_store_higher_order (ns):
> >                          p50   21,012,222   21,322,885   20,176,667    =
 -835,556
> >                          p95   25,643,500   26,204,375   24,485,000   -=
1,158,500
> >                          p99   28,567,400   38,577,750   26,158,000   -=
2,409,400
> >  ----------------------------------------------------------------------=
---------
> >  zswap_store_order_0 (ns):
> >                          p50       37,601       36,994       37,568    =
      -33
> >                          p95      123,731      137,034      128,366    =
    4,635
> >                          p99      159,965      169,282      175,618    =
   15,653
> >  ----------------------------------------------------------------------=
---------
> >  vmstat summary:
> >  ----------------------------------------------------------------------=
---------
> >  zswpin                         1,104,226      993,412    1,091,146
> >  zswpout                        1,688,181    1,582,664    1,669,671
> >  2048kB-alloc                       2,500        2,505        2,500
> >  2048kB-zswpout                     1,535        1,535        1,535
> >  2048kB-swpout-fallback               927          929          875
> >  ----------------------------------------------------------------------=
---------
> >
> >  Detailed vmstat & zswap stats after workload finishes:
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> >
> >  ------------------------------------------------------
> >  usemem                          Baseline        zswap
> >  PMD THP                      mm-unstable     compress
> >                                10-25-2026     batching
> >                                              (patch 8)
> >
> >  ------------------------------------------------------
> >  vmstat:
> >  ------------------------------------------------------
> >  pswpin                               0              0
> >  pswpout                              0              0
> >  thp_swpout                           0              0
> >  thp_swpout_fallback                927            875
> >  swpin_zero                           0              0
> >  swpout_zero                          0              0
> >  zswpin                       1,104,226      1,091,146
> >  zswpout                      1,688,181      1,669,671
> >  zswpwb                               0              0
> >  nrswpin                              0              0
> >  nrswpout                             0              0
> >  pgmajfault                     173,554        173,774
> >  nr_free_pages                1,753,879      1,755,195
> >  nr_free_pages_blocks         1,651,712      1,667,072
> >  2048kB-alloc                     2,500          2,500
> >  2048kB-zswpout                   1,535          1,535
> >  2048kB-swpout                        0              0
> >  2048kB-swpout-fallback             927            875
> >  2048kB-swpin                         0              0
> >  memory.current                 352,256        499,712
> >  memory.swap.current                  0              0
> >  ------------------------------------------------------
> >  zswap stats:
> >  ------------------------------------------------------
> >  pool_limit_hit                       0              0
> >  written_back_pages                   0              0
> >  reject_alloc_fail                    0              0
> >  reject_kmemcache_fail                0              0
> >  reject_reclaim_fail                  0              0
> >  reject_compress_fail                 0              0
> >  reject_compress_poor                 0              0
> >  decompress_fail                      0              0
> >  stored_incompressible_pages          0              0
> >  stored_pages                         0              0
> >  pool_total_size                      0              0
> >  ------------------------------------------------------
>
> As mentioned in the previous version, I cannot reproduce these results,
> mainly because the noise is too high. Digging a bit deeper, it's because
> the throttling from memory.high varies. Hacking in a change to make
> calculate_high_delay() always return 0 (no memory.high stalls) paints a
> clearer picture about throughput improvements from the series up to
> patch 6 and patch 8. With that, I see 1-2% improvement in throughput
> with patch 6, and almost no improvement with patch 8 on top. Similarly,
> for zswap store latency for high-order folios, I see a slight (~1-2%)
> improvement with patch 6, but almost none with patch 8 on top.

Thanks Yosry, for sharing this. Let me also see if I can replicate
this hack on my end, and its impact on latency.

>
> In order to make meaningful progress, can you send patches 5-6
> separately? I assume that 1-4 are prep for 7-8, so 5-6 are standalone. I
> also think patch 6 will be simplified if we drop the prep work for
> patches 7-8?

It shouldn't be a problem to send patches 5-6 separately, but I would
like to measure the latency impact with the hack and confirm the
latency results in my environment, so we can figure out a plan on how
to proceed. Patches 5-6 alone only achieve bulk allocation of
zswap_entries. It could be possible to bundle in patch 8, which
generalizes the store batching framework, but let's revisit on how
best to make meaningful progress.

Patches 5-6 have a dependency on the batch_size for allocating
acomp_ctx resources, which is for the compress batching improvements
in patch 7-8.

>
> Also, PTAL at Sashiko reviews before respinning.

Sure.

Thanks,
Kanchana
