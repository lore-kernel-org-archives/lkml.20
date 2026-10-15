Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418D1396D19
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078629; cv=pass; b=UVK2FTP2pKGTgegd+hzN1d4lqdhAtHAJdeFYD30GbkrjekgkUBuhNdFn2cOT9C893umYL0/6/FEpj+WVUqQfc2LRE6p4vwEzWS8ZjyFS3CEV8vHVuFDmMAxIk/k7FLuq394IutABG3lXkxaFaLSUZwyEVcnGXNmrabjLO+xzbNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078629; c=relaxed/simple;
	bh=Mc8x6I4IlZLfP7Amk33bJSUN5CAY/VzVUFgnji/NKdU=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iduZHQXxa47SbhzqFAI/XtyUJWgzXX//5S/U9mSi7j6geDu/Rq/AgQRKJmkK8scFVIusK+oAip5BPSz2bz57HlZ7orsXiq4izuVXJlcH3NnSNEzfjCdTCPyEOLE2wRMF97Cs7AB/kd6z0E+8e8ZMliKWG++FpY4bjtShXv/IPbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3oJtV15; arc=pass smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3oJtV15"
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2df921c1d0eso7215685ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:36:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792078617; cv=none;
        d=google.com; s=arc-20260327;
        b=bAI+43VjHc5LD2pKGt9IHt9nOrv5NdzH9/+P+c+ljhV57W7ATS7ZrAqMJSxISbOh8v
         zCBksUHEfJIPr5rme3RoBOO+mTUCqoHy0V0UTyGEgLezDcEWHEgAsJYofCJWVcw/Msy8
         yDcJxE+z5tmDby+tUIWNnDj/D/P5ypdNmoAN+t4HDDvSEu1fu3X+2dgjC1d+iSY5wbXp
         MWpbtP5qhdaijQgVVEi8GCekVLQyyEcZsfgYxJ/jpOsKNdNhbF2cQWqk/OrklNO7cNrC
         CTfHQCdAIqAlMgipH1HzBJdpCYqI7EdoAhy32RtnjOmJjyc2Ykbhlq2RjCT23+Xvo/Nr
         bfKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=eNC0Fd3BGqN5rK2299oerWY4FCk3NDBRR5bAXp6FoIg=;
        fh=hB4hA3/AE7IScdJI4RSuYCswwp5J//uUC3Z7IO+UQB4=;
        b=LWUXt6BNKmokQtKQ2oT4b4+SRM/3kF98o7urz6CmF38WYZOaMOYB+as46kb43yQEXu
         7eqvCP4CHq3MYELcq8vydZSh9Q2ZVYUm4vVYPk+Q2VDK9ADYCxvF+5QraYOkV2yCdowv
         DlwIqYT4IuRwTG9rfR3VMl3KNS5wAo5yutocMV96fXaMkPbE71MMgB/h1Pite0/t7w8q
         of5pkTf6rZo8onaOm8dm201KEASH+n3YSZ7+3hdcxrQi+o3SywvG4qyMWtF3xsgiil8n
         QEFfUdMTrl6TuaSyzsXmuNGrs+WwtZGAfsp0EuG9r0EJg+s9qw2o9Zizwz0NXCsIjsxA
         8agA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792078617; x=1792683417; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eNC0Fd3BGqN5rK2299oerWY4FCk3NDBRR5bAXp6FoIg=;
        b=K3oJtV15wOerTUWohM6XNzY5DMEwxYZRL4bK76Gc0jWfmG80DFtaM5y4xK321CbnrZ
         LvYBbmo9P1cxz1bi74VK7gGh6Uo2UUfdmUNotEAWEp3qNgyUfyTSi8QlQBQ6HN2ZDx+L
         evGWE/4rXg57DVfOIyXZ29dDaPbQBXvEICKVY/I2TPFaaqyDi1wI3ckLOhKFQP0LpCex
         364qiOqUxjqp7OBoVFn47QpLCt67VAFg9nfKnG62rTK+8vYbDBOMLyy5jfxM3XFgGCb+
         C7b/bOBxAlaoQl7wlYUAS3a976hCfTeE10Fy5Ad2Z21nkAHH4M7jfqxYNliD3veHHGKc
         XzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792078617; x=1792683417;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eNC0Fd3BGqN5rK2299oerWY4FCk3NDBRR5bAXp6FoIg=;
        b=uu0y/AE7N4mrsS2AVFLrVgBSAu5qN9Lc/TgLNVpqCz9oL4FlU2BpAV/FBIPHaNh6IU
         sA/imhQD+zE7rhDbOtbGRtPX3w/vwPJyWIUs2E/Nk6sQXzKUtn19dhJaqboi1UJW+7Zg
         5DGxDgugyEu/O+5P/r6/8xWZ8GMIVwe/IJY0YXEekAbIx2XAxl3w50owjyBM0E5NwQAo
         I7ewHCkRaCIlyqU/HKOHiVb+bijUxCNyHE2wAnu/j/TrahbKjCtFMKsXFsgGGQ7sjEtd
         aLYQ+J01yy84ij4kkETib4PWWcr2+YdbLCyoIIku5+Gcj+hCl2RevTn+UVCKEilsOKy7
         G+Cw==
X-Forwarded-Encrypted: i=1; AKwUvByWBVN+qXplxH44+5InmPUle422ZYQc6UHTD2pxdDOhTkg1eZWvQqNHS85L4cWcNnvLNhzPcafcV4VHMN0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8KseP98+U+oPtgUPljogBwoHaw29haPUgTe+0oSzsQdUdSQfA
	+D1zwpjRDXZuX+6r2n/HHk4SAOkPVUY2Boc/jzTG9tMLltllGfCTF6T8Yqe77lLLJPiFSR6MGmX
	zgV98fDGwBcG2Dd+Y4TNnPeFie1s9Zns=
X-Gm-Gg: AYBFou0YNctOMNCFghiByYJLIoZMpGl1LaRu+AOyDnNmHfyxZBy9IzIa0VVz+TT/ETx
	R2ONOqYbeyM4uUGTtIE30tM0apabAFC3vIYDPP2FRuIbIeD3Da++LIWzi7S6hNs/QERpHukWVF+
	VeA7F2HR1aWxdcrcDUR2gEkK0ic91GhxbHRItWDPezuqi1MkCjAESgNQPjG47OhFyifp1v13/8Q
	dlPn0aYZ7Zmo8Ix3jxlHb79V3u0zhSvwy0sMNa1+JEwwlqKz46+OJ71pgKLuJmIuWdgOVg6Yxh4
	tGb7pXjkWi9zOt+q6gOMAz3vIUYPvgffAv6zqKSnzpZ2qIMsA9/HSpIoGQSJaC87hoTo3B3BtyZ
	TeRZO+/Q=
X-Received: by 2002:a05:6a20:244e:b0:3e1:549c:deac with SMTP id
 adf61e73a8af0-3e16b787a51mr17302180637.0.1792078617372; Thu, 15 Oct 2026
 08:36:57 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 15 Oct 2026 08:36:56 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 15 Oct 2026 08:36:56 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Aveline Noir <jm5905938@gmail.com>
In-Reply-To: <20261015141027.88149-1-sj@kernel.org>
References: <20261015141027.88149-1-sj@kernel.org>
Date: Thu, 15 Oct 2026 08:36:56 -0700
X-Gm-Features: AclHuK85ky1hJxxDTCm3lZUrv5F8rUf3dKyeQBVHR1L5-9dl9c9590Lj6JmwJJI
Message-ID: <CANOyQmF+nwNyGHptBJhT2iVDV6cmBMYY8rqgXnqg7GCDfFy_ow@mail.gmail.com>
Subject: Re: [BUG] DAMON: 32-bit overflow selects wrong sampling interval
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi SJ,

I haven't seen this affect a real workload. I found it while testing
interval tuning on 32-bit.

I set min_sample_us=2500 to make the difference visible. The default
5000 us minimum hides it in this case. With the captured inputs, the
kernel picks 2500 us, while full-width arithmetic gives 2812 us.

The shorter interval could increase sampling overhead. I haven't
measured that overhead; the observed issue is the wrong tuning result.

Thanks,
Aveline Noir


On Thu, 15 Oct 2026 07:10:26 -0700, SJ Park <sj@kernel.org> wrote:
> Hi Avelin,
>
> On Thu, 15 Oct 2026 07:24:08 -0400 Aveline Noir <jm5905938@gmail.com> wrote:
>
> > Hi,
> >
> > In an unmodified i386 QEMU kernel built from mm-new commit
> > ad9f2d463666, an intervals goal selected a 2500 us sampling interval
> > after the first aggregation.  The same trace inputs give 2812 us with
> > full-width arithmetic.
> >
> > The kernel has CONFIG_DAMON_VADDR, CONFIG_DAMON_SYSFS, and tracing
> > enabled.  The guest monitored a 1 MiB VADDR range as four contiguous
> > 256 KiB regions, with sample_us=5000, aggr_us=100000, access_bp=400,
> > aggrs=1, and min_sample_us=2500.  The default minimum of 5000 us would
> > hide the difference.
> >
> > At the first aggregation boundary, the four damos_before_apply records
> > for kdamond.0 showed nr_accesses=1,1,1,3.  The next
> > damon_monitor_intervals_tune record showed sample_us=2500; sysfs then
> > reported sample_us=2500 and aggr_us=50000.  The records cover the same
> > four 262144-byte regions before the first tune.
> >
> > For that aggregation, the inputs to damon_get_intervals_score() are:
> >
> >   max_access_events = 4 * 262144 * 20 = 20971520
> >   access_events     = (1 + 1 + 1 + 3) * 262144 = 1572864
> >
> > On 32-bit unsigned long, max_access_events * access_bp wraps before
> > division by 10000.  This gives a target of 409364, a score of 38422 bp,
> > and the observed interval of 2500 us.  With full-width arithmetic, the
> > target is 838860, the score is 18750 bp, and the interval is 2812 us.
> > The later mult_frac() remainder multiplication does not overflow in the
> > observed 32-bit path, so the difference here comes from the target
> > multiplication.
> >
> > The affected expression is in mm/damon/core.c.  Widening only the
> > target product would make the later 32-bit mult_frac() remainder
> > multiplication overflow for these same inputs.  The 2812 us result
> > requires sufficient width throughout the score calculation.
> >
> > The 2500 us interval was measured on the unmodified kernel.  I
> > calculated 2812 us from the trace; I have not tested a patched kernel.
> > The i386 config, guest init, serial/trace log, and build/run steps:
>
> Could you share more details of your use case that this setup is needed and the
> overflow becomes a problem?
>
>
> Thanks,
> SJ
>
> [...]
