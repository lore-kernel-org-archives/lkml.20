Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D119E4D09ED
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 15:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792336202; cv=pass; b=bIhRhfOPFhHUoxD7pwTEZDO+K92RnSqSEDW1SoqmoPvpEYrR03ZaJR7mCieFvlLdAIxQN0oaTe0BhVz3v0Ey3gO3IjZBY2SeCS2hGF48Kd66TGurUjzfhz/OHaJxrcuAJDTnvO27s06bH4nJfn8MRz3GE8pf5EyIZjow72YOiXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792336202; c=relaxed/simple;
	bh=N4MLccwfKEkqasxhVR0gl/ulWEu3X5rYO9+B9Hx6Na8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XNGyXThSF1ueK0pWDFC3V99grXNq6rHoVerCVqtExoZzkiUBBd4lT0g2b0Ov/8K4VUJ1p1NyoJSekigJnUBwt7af1cmToitjzx6YMG5S01tohcXmFaDISIxFsIX+haSxaa6BLgzYE6rtq/VrCXeWYR6DacLgdydKUnv8nz4AUdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com; spf=fail smtp.mailfrom=uber.com; dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b=aOZ60qXV; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b="aOZ60qXV"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-675676afc3cso1299713d50.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 08:09:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792336199; cv=none;
        d=google.com; s=arc-20260327;
        b=BFdajuIq5p4vq5Sp3lJl+IDF+H+LKCtSD8xNRnl38v+vWv8IsbqCN+ufeFih8D8PJT
         KJL/Z7JvyoCsRrpdyDuOsk+aTTGkQsD/PU0flUuP0FDZf08yrdSjD6+lgU5TRyQYMFbT
         s0qEjGc2R+G8rVsCKyzYHOgjZPMMIjvHqVkeW5uJu4Rb41UfTkqRiaCkzEJbA3LFDJj1
         DLbXFZNVkCANigYg8DthxcmSEgI95MW6MfFklKEKf/os9FLI0YfdyDAjlZQF3VZEGker
         zF73ifO5MDV2gwB4qYVvpVOld+ly3lLkd6qVD/4iPKm58jAswz+FckX4iuHeV1MFeZ3N
         k9vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=78LOVU45e6uFHgCeferQiR25aeZzXMlj/EwH6Nuj4RM=;
        fh=Yi9eJuHpaE4WIAlSnZh40VwIaJyxmkZQHw0qEXo9p7M=;
        b=H2bNJdPoLDLDtTTK7xLghjc95GM5co96lO/1+Gzd0Mi0gKjJr8xPs/YaZyM57HTQMS
         q18PYle5pwx4VG0XkP5ovXVPfx3kEoI6xNx1+uW/1olJ08oGliRC7A88HUT8BuQ+wyW/
         /3eAIM4FgKaKTNlDXitluJNoevgt6K9knnoxWlVkMRQADmH2j8yYFEdXDcbGZeeflpc7
         15t8C995es7W8KCK/l5/t25Sfh3pcQ1tbQqwLYhND3t61oCt9eQChkhGQPlH5RaSI2m2
         SHyea3CfUHqI3TFSs9rGr+jgWqbXy4HXVIbp7QqzsGkVq/FAJxezuJ9OPTkJt90mm9nI
         p/dA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1792336199; x=1792940999; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=78LOVU45e6uFHgCeferQiR25aeZzXMlj/EwH6Nuj4RM=;
        b=aOZ60qXVVtx7Dc9sGKIvD/84lXluXO0Bx+3zL5Gs7VWMxd7blYgT0QR/gYNQk7LjDl
         KNEJ+fLclW4h8xMCexLGw/zzVLcEo0NMC8R8jYMkm01bigOCPc1+akBihO0tUPq8U8Jl
         OuW6NrcmE/fZl1MTNBPxvRgf/RlKr4AHRxivo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792336199; x=1792940999;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=78LOVU45e6uFHgCeferQiR25aeZzXMlj/EwH6Nuj4RM=;
        b=yYxBrIZTnAwaEC2rtajSfdJla4xM1z8vu8dFmwvMm+8M9TAH5O5MKO/N22xzuUY6Ma
         gmwC6+fANfjRtEYzLJcpwiqfDA3dFLMB/KNXaeI2TzZ59r0Gn19xDQl+6yI0jPbXKfGZ
         oojBeGsBbrVUhjnV6I1Rxa8/buirt5sfK48Nubgw3p6jCLEKrA7pkW97n3S/VOAQNpHQ
         X9aowerqxy3Oal+Hlc6PlQgWGX+F2r0vLAkCI9hAPP0Yiw8gTqKOYDd6mDjeT0ZHKPke
         kRMyabKBntprsI2Y3/qnGbmtx2U396ZSOHUh3WFyPRGzyrdUJNxEqZzVzZJn5NNATi7o
         /H0g==
X-Forwarded-Encrypted: i=1; AKwUvBxGswrdQG1c+4Bx9CffN9eL1VCUv96QKVE/mV00O3BKP3dh9IXHZ56dc/cijDbSD3nOjmCLws1eyb+a+cY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7kSkgra8dtw642Ruy7QDNEnU/KaVwg9BLgVUHU/bkchuU0QbS
	oN/ByOvvfpZ5kyTsONN+7InqYU1Pbf1pLddsq+qmNZE39A4jnbXwJYmWM7VC1J2sXdYRLidFwry
	G+rRjcuzxQPm2yY3NZ7Kl4QKI4msyADmZEnZ9RkTNow==
X-Gm-Gg: AYBFou1C2X2GF7fR4uN2A1CwB0GnVLH7UgBFgFqizBdw0uxivfThjQpZj35ewGh32a1
	XsC5VyNKqhI8nyp+WAhaKmT94LBaP3RoyWhgDLxJq9SMvwLTW/sdQh3JgLm/5wV7XpxkD69oluE
	8TEZFPvTlmxSMAZhTe+LuNo4PpO+9ZoqNxYzxYdE0wTId4AaaIZGy/WgFu66NoUuYxQXc3CovMH
	T5uNj1zzuz3KJXNS5Qe6BAbslZ2LcpF40E2uieRuPVV8DC5bzEfRJjlgURwfZtDoJGbP1zNoSbR
	/6C3sWKIl+SuHwOpNOdLlS/SBBhJ4408eeXz3rnZTs7JCJ59pc8tSK0D7h/y1rMLI3iO+KxGltb
	nHUuIOjF9Ao8=
X-Received: by 2002:a05:690e:4146:b0:674:d78:4bd with SMTP id
 956f58d0204a3-679ca4d55bcmr1937276d50.5.1792336198350; Sun, 18 Oct 2026
 08:09:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-perf-symbol-memory-send-v5-0-165dceb2b049@uber.com>
 <20261005-perf-symbol-memory-send-v5-2-165dceb2b049@uber.com> <asbDJrY97tRqoPaR@google.com>
In-Reply-To: <asbDJrY97tRqoPaR@google.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Sun, 18 Oct 2026 08:09:41 -0700
X-Gm-Features: AclHuK-9HhlC5CMbxjwMvm0ouY6drD8ZrPCJ85CHJwhmt2IH4AP8QVPhCriTDZk
Message-ID: <CA+w=M=TtAfiHVQqiwmchtsWwNeN5So5MxWW=82RRAUXHhg8D+A@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] perf dso: Allow reading DSO data from an explicit file
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andriin@fb.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Namhyung,

Sorry for the late reply, and thank you for the clarification.

On Wed, Oct 7, 2026 at 3:09 PM Namhyung Kim <namhyung@kernel.org> wrote:
> I'm afraid it may confuse perf annotate where it needs to read binary
> data from a file as well as lazy-load symbols from another.  I'm working
> on cleaning up the relevant code and I'm reluctant to add 'path' to the
> dso.  We have too many names for a DSO already. :)
>
> For a short term solution, I'm afraid you need to use dso__get_filename()
> with symtab_type and read the file without using the data cache API.

I understand the concern about storing this path in the DSO. Perf
annotate and the lazy loader can read different files. I will drop this
patch in the next revision (v6).

For context, the v1 lazy loader kept one file descriptor open for each
DSO. In your v1 review, you asked me to use dso__data_read_offset().
This let the data cache control the open descriptors and close them
when necessary.

Using dso__data_read_offset() also showed a problem with split
debuginfo. The symbol name offsets refer to the symbol table file.
However, the data cache opens the runtime binary. The same offset in
these two files can contain different data. That is why I needed to
tell the data cache to open the symbol table file.

I put this support in a separate patch after your v2 review requested
that I split the exact-path DSO data-cache support into an independent
split-debuginfo fix.

For v6 revision, the lazy loader will call dso__get_filename() with the symtab
type. It will open the returned file, read the names with pread(), and
close the file. Thus, it will not keep one descriptor open for each
DSO. It will also not change the existing data cache.

This short-term solution can open the same file many times. It also
cannot use one DSO cache entry for nearby names. However, later reads
can usually use data that is still in the kernel page cache and avoid
storage I/O. Therefore, the main additional costs are the open, close,
and pread system calls.

The performance cost is small in the test profile. Eager loading takes
3.2 seconds. v5 lazy loading takes 1.4 seconds. v6 lazy loading takes
1.5 seconds. All three produce identical output.

> In the long term, I think it needs to pass a binary type arguments to
> read data from the dso.  It'd clarify what users want to read and
> support different files at the same time.

Ack. Your recent cleanup keeps the binary type separate from the symtab
type during symbol loading. The DSO also has a separate debug-info type.
These fields identify the files that a caller wants to read. The data
cache does not use this information yet.

Unless you are already working on this part, I can send a separate
series to make the data cache type-aware. The series will add a type
argument to the read API and keep separate cache state for each backing
file. I can then change the lazy loader to use the data cache again. I
will keep this work separate from the lazy loader patch series.

Thanks,
Alireza
