Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793737981;
	b=wUVOqokcOiiqqmKtyJtCLOa+LI/FXmEGZkGPxNkkFj6O+rKvVwuCE24zLs5Ds7HF+2ip
	 gKpffu/py0rBcw+pk2w+lkb3pe7VIwUoTKBJrQGHqnnyeb/525CloW7UnT6hksU3+mBz+
	 CNjOmXJjCw7hxewDQayrW2Bn8OXomJDDCOAMbkogGzT7Zs8FvAwwj0qWy33FfSXqj+8Ll
	 q2QMHls1rFA2Cp5ha340EiJwl/PwGPL8hfdxvQB75A9IFbKeEtgouGWDJryy7zg7V1gZ9
	 0kHa38T+xZQ1rvabrddnQmNTLVsZl7yZWDOcHz0JZ5AQWOcrgiYp7XTACxlzOfkQpow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gg+W2EgP56N1Sf6e0W1B3Tc564yhByMeGofGsIPeu+U=;
	b=yszAkQeDMucQswHwPn7fIcoP0T3H4UEFhhUTqYubpnsV/YHWAduJfpUchyujyEGBjBkQ
	 DFC5AzCenIHuQq9M6Ympotp/ZUTA+0EOcXZocFvb8fgHw9rGtyioa1jsJwzl4lS7tp2d8
	 wFOabXLdjgW88kIFN6M2dGihSg42wAUoDFb8OTOwJJWSIFH1yOr0I6zSDpIwH9GNt3QjW
	 8J5MzVFba5n+o6FAZTjjV+7aGeCjHE3n6NWshVNtrrCZA4W7zNgN0+tiuXVG6DzpVbCVn
	 PdFyFNORlfCm+ppAbhjkO4tiFvtdyPKUxdGOUUnSsmxrAVRlEY+3MvRJOPuWlocmsug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jm9h17sU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A51606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43A51606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jm9h17sU
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ac91f5aa89so325221fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:33:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793737979; cv=none;
        d=google.com; s=arc-20260327;
        b=Y+R8gn/7cpkMqPRvUPqQw54X5+MJYAo+NYBC14TtkS3g3JdCfhojw18TcxgleGDR8J
         R4WJ71je6rE2GNExwWzweU5R/nss+xMIhwEhrPgffFMIPjpgCrHKLAb9krjfo+rfBLeH
         liSIx8ezLYtKUYael8nr0L3OwLxMHbrkbRuD7X0YFYqHpImstjnHNiPCnq51D2cR7wv1
         hNT9TDeHWVlm8Jf9JYzQOmmBBgHZzM9t+kWbZ7m8Yoc2qVoX97bY494ziJuNkXTkN/oi
         visUUXdrGc1hYuhOgSaDUpbB1aBRkNnUwOtepAU+Jsg9a1cIZ3jwK0imrJ4y2aiAevJH
         ukyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gg+W2EgP56N1Sf6e0W1B3Tc564yhByMeGofGsIPeu+U=;
        fh=/+RvYKgP25PHWVl9yGG5s3yrMogKb5dS5/ZzgXkfo40=;
        b=kjZlVvkba8dmxqkoxRapS2wvzQE8mNO/CTxAzurARGTVFrDJre6aDq6pqK5jYxO6fR
         67GqT/0n6AaPOrNaFUOGy5lvOqZYR3uJTbC/h4YdC5OOLkvoN74ipnocA4CDV/btsqgh
         EA5CZAzTWS1bjDi4fNiOe3u3oV8ie/u1t0ow559Vd+n6IGQqpT5YNkBSyqHXsZ5VgSyx
         EqCUnXauF3OJq7s3FE9m5+ry+oIff03PwII3jv0clcZRd1XOtOWANxGtY0uOaZKtXCjo
         5vXKu1s85Fv8TIFRpATvYqeLxCIihmfnv1cE3tUWnE/iZ++p+8/ZR9W5k6HVT/OSd5X5
         HDxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737979; x=1794342779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gg+W2EgP56N1Sf6e0W1B3Tc564yhByMeGofGsIPeu+U=;
        b=Jm9h17sUzBa0J1wZjuoUGLG8nXwDfKaiZdnwQV8i0Z5rIyLWtnFizG54Mb8VhuEFNX
         rW7Y4rc1FmE2eQGibXhlfFcLCv/cANTCjYmEA3X0qB/wSffc+Jue8m0ZrTj91g/ysaH3
         II453nGlC1agps4Kl22gBYgtJAmrJewCpfylTLwG8ckuEdaqaCxeknDvLnvo8KkYqMMr
         oN1Hk4uuEJ4jQ2j8NVNpkyQEC2uRRabXtMqJv3w2Gpxh7olpRi4CGgDHr79l4gcpAzUT
         M7UJMSMiGL6ExHwGMnOskz1O2ZQopyzLk9ZiQ+5rpbFdRZFhlLgNMm/Pm5gCb6nLX0Gh
         Mdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737979; x=1794342779;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gg+W2EgP56N1Sf6e0W1B3Tc564yhByMeGofGsIPeu+U=;
        b=dZz7NzUsuAEQJ/f944AH/z7AtywPO6MUo0Vu8C/SCKAqErS9b6KCMwMcxolBUtmWtN
         Pj06o40x7JwlVP634tpb1H6HyiHThV77EtLgj6mU0J0bQM66gd8GLeLcm2SLK8uvakEk
         72C8vIuE5ES/tW7+cnwm5iYMZjly+fH4cLzBL49XUqrkfYt6KZYsObiZ4KLhy8Pxkqed
         U1ybcAhNZx7oc2xu17eDlhX7mYNcbilBkiDJYKQW5ei6QUlNIzNCHXoNzC7FeSZvu+qh
         9vn7pfglkmNFoBpz2As/I9ON/VJHNu8gqqo5/ncUiX7yKSY0vmRqyc0js/7mVzOKA0R7
         +alg==
X-Forwarded-Encrypted: i=1; AKwUvBy/83eHXHp452i1KPZ/xAzijWCulovFCkS36wps3ulKhjmvazTIiOxou7t16lDzGioQMqWA2V4ULpVgjZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AOAmuAtLf9ucRGfFjIeVTCiEdxlxWQY3ki8Oc/0D6CYe2Ay03
	dHCLBa9+nNmVcYj6KPaY41tVRVSttKRhgREltcVQ7aWGhqO9daEQtqgTEuG8Zubq9Vq+Yl9V1OL
	gr9e0CpUUmhzXo6P6ERahKbQLvfn3I5I=
X-Gm-Gg: AYBFou3l6TnXTmMAbzNyD7pmH76xJ61T8EuqVl0AmCOv8KcnrdJZrATBSoNsAJ6mQSR
	4oa6iDzpDaaT7iJdNtpELcZa+ZjgKqfksp/INmVbQzIlDVcdrQsMs8LwaXg5bWRVeprD2Y/b+X3
	PW7W6ziz0IZOm5aI37hMQgZCbYjYp6sDUtGKLlwEc0IlFRNfV1eAwFLCO74hzH6ikAOu50tUR2k
	EpMDKfUj4UcVUznI8oiX5KAD4UdzFaJzmDHNRWVtrscnk4QhYHkDsggLlVKe5VBFYxI1ShTUg28
	3phT2b+0odW1Nq9FSvRaI1b1vcyThD3UBxOF9qPGVaLYq1RYVlSIhEn5kF4YjCu4OPlX01jyCGQ
	rL0IKvEqh8haBvSon6ZCRqT8pWsbi043nzyqoAAex7z/aGF3W+AbCP7DcXPagBb5d3Af5fXQbBk
	RsEn7T+fyhEsoqAeGAdDKjfaHYJR/Nz66wPuhaiLCH4aM85GFk2hUq8/LBV4KScZS1BkxT3mvBB
	w==
X-Received: by 2002:a05:651c:a0cf:10b0:3a6:58fb:8540 with SMTP id
 38308e7fff4ca-3acb7b2ae3fmr23751711fa.19.1793737979205; Tue, 03 Nov 2026
 12:32:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-alpha-profileme-v4-0-61e00f5e1da8@gmail.com> <CAP-5=fWC7AM9aAsHaZvQVXznYzVp5FRQtH=vu2xxQys7QWvCQg@mail.gmail.com>
In-Reply-To: <CAP-5=fWC7AM9aAsHaZvQVXznYzVp5FRQtH=vu2xxQys7QWvCQg@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 3 Nov 2026 15:32:47 -0500
X-Gm-Features: AclHuK_DMhE10jbZfTykItRyJaRbazl8IY4r3kkMT9nMEXLGWMUP-9x3lCLMK38
Message-ID: <CAEdQ38GGq6Dsq+daBNKsPOWtR8h6+KcdvaVqrxd24Dd3QJhZwA@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] alpha/perf: add ProfileMe sampling
To: Ian Rogers <irogers@google.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 10:29=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
> [...] I have a suggestion about the rest of the data, which is
> currently only reachable through PERF_SAMPLE_RAW. Raising it now since
> it's easier to shape before the uapi lands.

Thanks, Ian. This is incredibly valuable feedback. I really appreciate
you taking the time to write this!

I've done all of these in v5, as patches 8 to 11.

> The PCTR1 window count looks like a natural fit for
> PERF_SAMPLE_WEIGHT_STRUCT.

Patch 8 does it as you suggested, and only when the sample's IP is the
profiled instruction. On the ES47 the weight matched PCTR1 in the raw
record in every exact sample, and was 0 in the PALmode ones.

> Similarly, if any I_STAT trap types identify a memory event, a DTB
> miss on a load or store say, setting PERF_SAMPLE_DATA_SRC (mem_op,
> mem_dtlb) for those samples would make them visible to the memory
> sort keys.

Patch 9. The DTB miss trap types map to an L1 mem_dtlb miss. I_STAT
does not say whether it was a load or a store, so mem_op comes from the
opcode. A test touching one word per page got LOAD and STORE as
expected.

One thing turned up while testing: an instruction killed before it was
mapped can have TRP and MIS set, even when it is not a branch. So
those bits are ignored when PM_KILLED_BM is set.

> The remaining status bits (retired/killed, mispredict, trap) don't
> have a generic home, but they'd make useful filters

Patch 10 adds retired, mispredict and trapped in config1. As with SPE's
event_filter, a sample must match every bit that is set. Dropped
samples still go through perf_event_account_interrupt().

> Since PEBS and IBS op only sample retired instructions, it may even
> make sense for precise_ip to imply retired-only, leaving the profileme
> bit for the unfiltered view.

Patch 11, kept separate since it changes the default. On a loop with a
randomly mispredicted branch, 19% of the unfiltered samples were killed
before map and another 48% later; with cycles:p both are 0%. The cost
is that DTB miss samples are of aborted instructions, so seeing their
data source needs cpu/cycles,trapped/p.

Thanks,
Matt
