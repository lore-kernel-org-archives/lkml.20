Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793926533;
	b=rdNZxTGXfvymHgsd+Dk9IGpDwXORa62HJx6+Mp0r0am42aJo3RTbEhhTS8vzjGT1dfag
	 5IWhGuwCcYU/awWOEs+V+PWf5tPg6ZZQX2nNYPQCb1fvHp/RAXYSRoC2iiGkuI1E2lYLA
	 IRXgCU9PfrqWofXC7miDQgN6dCcg3oie2DLfGlZbrpP/s7NxmeZ3unaTere3xW0H3gZXL
	 96PabgwFQuD5Ph8p49hv/kAMWjgsIi7Sxso5IEalwTDuV4GczNobqmYsBtfXNCUj7euuC
	 VVNUMS2Y94rWO4XiBmhXIOB4Fa9rveHC5dSmem3hmkXUcZBzPB+ij1hgYEYtjeVTYWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793926533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cG4Vu2hIpV+2Fg+Fc0+5tp9E8hoAs2YnJFXtUQKuC5A=;
	b=HQugA42ydLXU73einWcqgbpscc+izhiaucA9ZHhSmuD0XWNhhhaGQ8OO0h5fGaA2MADL
	 BWPdddGv67Zrp91ZWSt539PwjBGZkDg0TD1/FWc3jNV9RQLkgxCZZbXDTQcB183UYliRN
	 6PytZaf8CShb+sM1lxR3DcJcEByo1OJeaDhLHG8YOtJfOUiOad+F1NCxTCaSmay/gpkUr
	 yUY8CnuU81bTvmTbTfqC3v9u2YGZ5dJVVrSiQgXSdl7kW7pWMkMZ/EBJDXyejBYP73e6u
	 Sur8XK9IuVflWgTIHjXYPQ+ow84icEDsMloHeZ9O/Gis/AZ6HGtDwpS6a6zIj8354/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fdUCanml;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E642606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E642606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fdUCanml
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso13294766b.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:55:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793926531; cv=none;
        d=google.com; s=arc-20260327;
        b=omBocjjWs7YJjxwAkvntsOG9tou+f6V+NAWA5qsVxwrwhJEB0+BxBlqj+uHiXlnxpT
         iejBjVncAveqgkLL2zLDU9SJtG5ccd7m2hXXs/ASLFnr5INEjVkXUU/edTkss9vKXJIZ
         Y1arHolqhqjE6ZYQs1vhI8wVHB/C4cI8FsJzIA3LzFQCXRvAJy/ikzvje8cgm11iFk+s
         VgaTQyUb9DYsNs1ajU9vYzgg8WVudj7QG1IPyekvWPFIBme9w7jnclaBCO1IAG2gGojh
         eg5jyAdJsR1EcmWrU+HaPYuLDaQx+XdwvvktXga0SjslJfumA4QodWF6cdjjui6pCjYL
         fPaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cG4Vu2hIpV+2Fg+Fc0+5tp9E8hoAs2YnJFXtUQKuC5A=;
        fh=eDn4DOp7wEh0jeUbUjHdGI4cONc4jcVqud0Zm7i+shA=;
        b=Y6fEMIOGE6agOAmxuw7PFGi7lJl2tPvGTelveWJFsd4DL0MfIKaRNiW8TQxL5jbSCF
         VsYQ36LxU0oyWd5BVnZeqgu1GslWrSlmyGF4HuJNBpk9uDoG6VCvROwI+hSc5spYtDvV
         QDXcAmtYKAd4yogsoVTTbuqyDyNVB7soYLnsAAO2ydKk4OAVfrdZzRItWUgod5R5Z4MX
         D/Wwr3CDe9ACAxCOoaEIbaW0FST2rp4YPKxbsy9cmdJ+tqx4300V47R1Xwr8TC9H+1hu
         Y6qw1Qk4OmIHaR/+N0G86465JJyn46dc7gG7bdyHBlX8pC6BCY6A0qE1ujT6pfJiSXh5
         o0tA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793926531; x=1794531331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cG4Vu2hIpV+2Fg+Fc0+5tp9E8hoAs2YnJFXtUQKuC5A=;
        b=fdUCanmlqPJWepnCKb8zcPxA/q1q812SPiH4Jo3aaExXMCX3ocdTkCIXaV9BhLmxn/
         QOV67aa7Hb3L0uhhmrfrm73U61oyWdI21nGLERQ28tjJ3gB86zEGF6nMZHXueWl9jl+7
         4Fe+mxE9LKD1ti7GyHXy3WaorNX4tMDF+Aq+ugQbRahv6JEmQR9R4ryJJj1a2vmrYgQc
         rPyLoo8BxV8NUE8h4+3UEtMlabSItOEzpf5nxnAfwciSOQoeya4rDqPxJIltzhTcj6tc
         kQXtfuUyghnk4+8OoPR3fs24akrsTcWAaR39aIPujb6Q0Bt5axN3aiQ+D5JuP7UcgPZN
         x5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793926531; x=1794531331;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cG4Vu2hIpV+2Fg+Fc0+5tp9E8hoAs2YnJFXtUQKuC5A=;
        b=1ZhCygqNRpFYEIs0iD5WcW/VC/9dO+h9JCx++IO9xSibhbKornthg2rmRU/3jyrHP9
         VBjKjqxhInJ1k8RshTlsR71Qtwjy4csmRGvsOjNJW0CEfNZ9Cs368HBZg7T6/tZREdof
         n4GEZWl0d+KKAcLWqMsBdfkCqGjYNXjzy8y+w06DeOB6h20ji6rR6OXzD3nb2wdQ8dFB
         dlrpIZTxDaBWDMLTq2MRV+3R2ogZNYkN1JkKm+foIY2BW1BLLbctBebWe84WDSkl/9BK
         GnsDD2LJpxlqFRI+xGNd9GRZuVZe15QgiXC2r4TjKOjBU6mz3/i9HAluKys7NnytM2LM
         QLVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEA5ZcEyDcec3ycfFfdGLxIBgEl+GoP1iaS6nTM3/wsuNTbtM25mX++D+U+oZY1ilaC59D9Z73Xx07h2w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gXiDt9j4W5KvDjFGVAbqJHeBP7iekxksB25veiO1yD2O04tp5
	DaqT2hIU9aBiKW7FbBZUVnxnGVSFkqVr+DLclDCtEOlASzpVcf6o4dkkJa1lOLABe+u9IkpAlmu
	eJ/OvUj+Rf4lLTAolP4zeNu0K0pZ28401uW1If+E=
X-Gm-Gg: AYBFou3KXFg8dwzDf3ydWk0wl7W7LRPLb7TVml/jiSf3rpRRBFgZuTwR4ysGB0n5qaG
	sMY1qabOw6o1CJMxB9nWMkSUZNoas6fs2dZEcLdoKnI7pKABgWeOSg3s8av9H8XbJBYqu3PkSoA
	B4OGzcyMpPGgkcsWlV0f9jMLhyTPPHppGc+3LDIeCOZ6gxrlSdv2oqeSP+x0/Wb+R68p4Wkspob
	4D1QUiIxnqxgNlcJXAQP8cJW1TmGMti1LIJ8WXA7nTNrRF3Djnl93lys7eUgTzjDIglgK8vwVJZ
	7vmO2IeqmKumkRpAiWJw2MbHaAmLGUyul6NVLVOfUVMclUvxphTjhDF9QmaM539I9L/0ZHeRjXX
	r1zwnOaFym2DxwtY2F7XkbfuJokv6fN+ZcI9zWQIfcjpXNhsVibChHA4j9P7JWhh5cg==
X-Received: by 2002:a17:907:868d:b0:c42:2f4e:522a with SMTP id
 a640c23a62f3a-c4d354de714mr85066266b.25.1793926530859; Thu, 05 Nov 2026
 16:55:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-perf_revert_prefer_large_alloc-v1-1-5fb431bbd624@arm.com>
 <57c34e26-3048-474d-8e74-f65799e32ff4@arm.com> <CALJ9ZPNWcDtajO+Luhxe1K3af64mPRFQSjvfvNornyFFkam-+g@mail.gmail.com>
 <CALJ9ZPO9XxF-kz5K67Jg8RtpiEmK7XFU3e+xDak6LyV_We7yBQ@mail.gmail.com> <20261105173501.GV9176@e132581.arm.com>
In-Reply-To: <20261105173501.GV9176@e132581.arm.com>
From: Yabin Cui <yabinc@google.com>
Date: Thu, 5 Nov 2026 16:55:18 -0800
X-Gm-Features: AclHuK8fgkoE7IlvDviQgcEKfjokSZYFNDtwd4rbJD0XpUrUeaFEZyOBfB7FFy8
Message-ID: <CALJ9ZPP8X+5A+WaFNVXRy32PZA5EjS1Uw4CD3_PQ62y26h_FTw@mail.gmail.com>
Subject: Re: [PATCH] Revert "perf/aux: Allocate non-contiguous AUX pages by default"
To: Leo Yan <leo.yan@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
	James Clark <james.clark@linaro.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
	Michiel van Tol <michiel.vantol@arm.com>, coresight@lists.linaro.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 9:35=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> On Tue, Nov 03, 2026 at 12:46:24PM -0800, Yabin Cui wrote:
>
> ...
>
> > In field telemetry and local ftrace on Pixel devices (prior to
> > 18049c8cff9c, so __GFP_NORETRY was already in place), we observed heavy
> > rb_alloc_aux() -> __alloc_pages_direct_compact() stalls alongside
> > kcompactd0 pinned on big cores scanning order-9, and this accounted for
> > >20% of all perceptible app kills (via lmkd) across dogfood devices
> > until we stopped high-order AUX allocations.
>
> Thanks for the detailed explanation. My understanding is that repeated
> reclaim/compaction during AUX allocation raises memory PSI and can lead
> to lmkd killing applications. The problem to address is therefore the
> cost of obtaining higher-order pages under memory fragmentation.
>
> > Initially we worked around this in userspace (simpleperf) by setting
> > perf_event_attr::aux_watermark =3D 4096 so get_order(watermark) =3D=3D =
0. That
> > was fine for CoreSight ETR (which uses its own separate scatter-gather
> > buffer and only copies into AUX on flush/stop), but when enabling TRBE
> > (and SPE) it caused hardware maintenance interrupts every 4 KiB instead
> > of every 2 MiB. Also, in overwrite/snapshot mode rb_alloc_aux() ignores
> > aux_watermark and uses ilog2(nr_pages). That is why I sent 18049c8cff9c=
.
>
> Agreed. Reducing watermark to 4096 also increases maintenance interrupt
> frequency for SPE/TRBE. We should refine buffer allocation rather than
> using watermark as a workaround.
>
> > ### Possible solutions
> >
> > For PMUs without PERF_PMU_CAP_AUX_NO_SG (such as SPE, TRBE, and modern
> > Intel PT), higher-order AUX pages are an opportunistic optimization
> > rather than a functional requirement -- very similar to THP allocations
> > on fault (GFP_TRANSHUGE_LIGHT) or opportunistic high-order slabs in SLU=
B
> > (allocate_slab()).
> >
> > Instead of reverting to GFP_KERNEL reclaim/compaction for all high-orde=
r
> > attempts, could we do the following?
> >
> > 1. Make opportunistic high-order AUX allocations no-reclaim:
> >    When !(event->pmu->capabilities & PERF_PMU_CAP_AUX_NO_SG) and
> >    order > 0, clear __GFP_RECLAIM (and add __GFP_NOMEMALLOC, matching
> >    SLUB's allocate_slab() and GFP_TRANSHUGE_LIGHT):
> >
> >      gfp_t gfp =3D PERF_AUX_GFP;
> >
> >      if (order && !has_no_sg)
> >              gfp =3D (PERF_AUX_GFP | __GFP_NOMEMALLOC) & ~__GFP_RECLAIM=
;
> >
> >    When order falls back to 0 (or when PERF_PMU_CAP_AUX_NO_SG is set),
> >    keep PERF_AUX_GFP so single-page allocations still reclaim normally
> >    under memory pressure.
> >
> >    That way, when free order-9 / order-4 blocks exist, SPE and TRBE get
> >    them immediately for PMD / contiguous-PTE vmap() mappings (and pages
> >    stay grouped together); when memory is fragmented on a long-running
> >    device, high-order probes fail fast on the freelist without waking
> >    kcompactd/kswapd or triggering direct compaction and reclaim.
>
> This looks reasonable for me: try to obtain larger blocks cheaply, then
> then retain the PERF_AUX_GFP policy for order-0 allocations. I also
> agree with preserving the allocation policy for PERF_PMU_CAP_AUX_NO_SG
> case.
>
> Could you compare the memory PSI stall deltas before and after applying
> this option? I think measurements from your production devices would be
> convinced evidence for benefits.

Hi Leo,

Unfortunately I'm tied up with other priorities at the moment and don't
have the bandwidth to put together and upstream the kernel patches
myself.
Whether you and Will decide to go with Option 1, a userspace-controlled
interface, or a combination of both, please feel free to take it forward
and send the patches. Once you have a patch series ready, please CC me
-- I'll be very happy to test it on Android.

Thanks,
Yabin

>
> > 2. Clamp max_order in rb_alloc_aux() after fallback:
> >    If rb_alloc_aux_page() requested `order` and had to fall back to a
> >    smaller order, update `max_order =3D page_private(page)` in
> >    rb_alloc_aux() so subsequent iterations for the rest of the buffer d=
o
> >    not keep re-probing higher orders that just failed.
>
> This also can avoid reclaim repeatedly, but the side effect is subsequent
> iterations would no longer try high order, which have no chance to
> benefit from large mapping.
>
> I would prefer to evaluate option 1 first.
>
> > (Optionally, if server/benchmark workloads ever want synchronous
> > compaction to form huge AUX mappings even on fragmented hosts, that cou=
ld
> > be gated behind an opt-in attr/sysfs knob similar to THP defrag modes,
> > with light/no-reclaim as the default.)
>
> I will follow up with Will separately about the userspace interface.
>
> > Would this approach work for your SPE/TRBE use cases? Happy to help tes=
t
> > on our side.
>
> If option 1 works, we can confidently revert 18049c8cff9c, as it would
> restore higher-order allocations for TRBE/SPE without introducing the
> regression you mentioned.
>
> Thanks,
> Leo
