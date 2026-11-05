Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793912211;
	b=plEKRv1rrR99pPafrqzAbYEX/6mxoe2Yfy9uxzQnWozEgInQdmaMKxbidp2F0rPwcVBJ
	 laASZvFGyHcGuM9jxwBLE8C6yw7dt5hhokpNg9ve9G5wOh7C1E87H3rKinneqG9ewWiNQ
	 35l+yp0juu61XK5j/EEeQ8ZBH9z0bIZPLEYDvZ3UhcIOHQD0+EullKY5qij1W872uVhDi
	 PBZUzyNL1/wA6XM6HfRwE6wNCkleeYjpmBDzoNu73WLHmRf6+n3Yf2PV8Aq5Mp3u/cHrg
	 FuvJ3DNtTyYSVXcHv0ZeTs/p+aBAreRvSgJWNPVGPeXtSxPN9qDSZgHjs/ZEwjxOz5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=WGoZuMVGY05nnj5jEcHY1A/dTWiWvBXOjK8y3tFjCB0=;
	b=NAXfQGXRfC+7kjOnGs8U6CwSbJkfSmfXFl8xaz5u35Km+7w7mXx+dRo37C3N7Kx2CH5S
	 9sZKourxYPftKLHrpo3Myf/qOMMkroN7F6pztIvOOM7XbsH50V3RRfrKC0V93abiHgaG3
	 EIGrzWEnoLxguIJno+Qf08pA+pA4QoO3ChC+feBGLN3w+JwtT4tvmOJlChKl4VJvj7sPL
	 fhS11xpYsjP6LH9ZMt3umfebTM6I2UiC4CqEHP1KesRXX0oJqP2MQOCfEwvR2sOHc7Amz
	 pNr8/f4h3JMUbABp9wuduyaYj6DPtP2+zlSZxGk7UIfssNdKp3sYabTr7wKffTdtfpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sPalGy8H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7DC606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE7DC606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sPalGy8H
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c45551fa84eso383836066b.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:56:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793912209; cv=none;
        d=google.com; s=arc-20260327;
        b=F7H3Jfkh01rVUZL94iQoq0CoVgXggqAStMnf74QlRMQuSl5/BdzozePbFtayjJtg2f
         9mnisDrwhCZ03QyEn7c3YaM5hUeuwtn5y+C6TPtDO1viOLyu+EaNTpN3dQc/p8s/nX2c
         jijil62aXZGcnwjxxY4khEWi7UTwgPNUYJFe5L/YJddEXwuA6asyb6U6rd1PsXVY2WIy
         vtbRtOQw9c1oNn3V/re+Wrn/ihU3oBdDvv/h7iURl1EZLaUlm1iDRdcXeCbu8qE+9HO+
         xLMhCT6kamF6UH98oWWcdf6RcCiQHl9FVl70lgc5nP2fU0a5PSRAFRkKdP4WSDrE3KuW
         Q5qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=WGoZuMVGY05nnj5jEcHY1A/dTWiWvBXOjK8y3tFjCB0=;
        fh=aOGlhH4E62ayTDx0WLgBY3TDUkXlD/FR4lZB/FESHaM=;
        b=pVojZU1w7F328JS9/vNvqntH6gD5PjNb8br1BNvDoLHrLsltQ4nY8uVsa+awn3cfLb
         xMhDbw1rl+5VqUFum/KWY+LtrdcLCr+TyDzJWa0/Xsz7aIYkIbUz6L8tZ0lxTWXCN59C
         talawNKvlEIQ8tCbQ050/2/g3CLDuw6yOnuqQ8SK5vNoYwYGow+ijv+/ufOjnwNu67IF
         e3TpyMWbLBy6hQsqwWOVVrzto4UfeJeflmp4PHxEorxZSajog1ye7MBXDyqxlLkE/UmX
         /FyLZlnRB1ALpppKlZ6chuyPZgAYV8BjL827GOrtFHh7elwtMMtknEE/W+uHsxE7iMV9
         9yRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912209; x=1794517009; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WGoZuMVGY05nnj5jEcHY1A/dTWiWvBXOjK8y3tFjCB0=;
        b=sPalGy8HN0bt3CXnPnn1r4oGGGYlfiBDIrG5RKaUO7cNq1Fm5zfbvtIBTWqC9u6nqr
         5niOXQ0HPD4u9+TVhmbCS/KjNsHAmv3B9pKVOj/wO3aWOjA0QnJjWE5mAJEZoEsg1KOo
         FsgYtfUVz0OIXazNGeSblFwZ+OvjRV4uPjtc7pRAst3t9Tc0gAXaL+rNiozp8XfCGAfc
         zGDYJteKNGDV237yc42QUO6EiMBGx+M7OsVGzXtoAK+mIIevWbJpfYaOfCGYr/taGxox
         OFfYAGVulSs6B/MYGjwP/gfZ/0eMEXllc8/mk4EBzzd1NcNW7vGE+M+TYlaqr2Dp9n7V
         OJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912209; x=1794517009;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WGoZuMVGY05nnj5jEcHY1A/dTWiWvBXOjK8y3tFjCB0=;
        b=RSgnaE38T709PX+5+Ncdk9PyL+eLl2ilW8bTw8oA9F99UnnVeQ5aCKs3TGkQfI4Ngp
         UlpZRRYXUyclP6R2VbVLxjITGMcjrJ/3QeKIchnPC3BXBHfHH4n4uMozAQgZ87RZ5PEp
         t7WyRFN1QV4oYzV3LC9/N1Bw2ar8aIo57bFRJcHrNajTND4aPhVRgg7m1QkGFVdZ4Eq3
         cGvdEyT1/b3i35/jQhKS0psP2fxmPljXy6eHP2BVvpxVv4juqvZ1toupL7Wo9/wQsky+
         nQBe3wm7ZRyMrHz/XqPUVk81gDjiyY49S+0yWqb9Uzxh8RaD97upG4Q1IDoAM1e16Y44
         5K3w==
X-Forwarded-Encrypted: i=1; AKwUvBxXPd7nJigb5i4MztVhpE53rRjZ5PgacF0ZLEaVNqHGu9o3uLK5gdE26WBvLupK1A09au3nNopgYzdlGIY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sYw0dikYgvWcfKV/4V7/Y5qWRUHzm3wlVTAIDfKedK7Y+4xVO
	Vjuu6P7Wma1w9D+Q0ypJ9lAQ/1SAcS9rRt04jbvhwP9UeHgngxXS4xn69CaBrqlqct4xpmAZDAz
	3qOXwdYAgdpdSmFG6eKJQaIAFiM44A+0=
X-Gm-Gg: AYBFou37ugoTfMIABSKks4Nz0ZCsWyiPkOF0CtCJrosRUHY2hoedENeWncu5PhH/aRx
	NEQ57WzO80ozmpsp4eJWkl4Ru7Jzf9l1vdcg/7eK0bRpvBrDTRoQto9+9V4MIWacbNuxUAD5VMy
	BqfPs9xbaUyYQrkWSGnibeR/56dQmERb3SF8yeP16Z3Rnr5/PjGGNlqxa+Ffs3eEXjWYFDY7aUz
	0hrVzBsLzV6EJwDx5sREGee8Mu8km5cYhCdgPd+wqKbhQeXxk2ToD4OSJxWKbtEyC8r/iAxXc2A
	bqs9woi5AeZKJ87V8BPL2cTCCvb3br3dRClHobBuakT62i4I2oKuKeeo/jkueVckJH9XrRomhKZ
	Hpy7eYTrP8+dHIk+uVof/3w9w1bIRlaumLJ2RfA==
X-Received: by 2002:a17:906:ef0a:b0:c46:b9b0:8e8f with SMTP id
 a640c23a62f3a-c4d355a3d07mr46072266b.41.1793912209080; Thu, 05 Nov 2026
 12:56:49 -0800 (PST)
Received: from 374130946952 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 5 Nov 2026 12:56:48 -0800
Received: from 374130946952 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 5 Nov 2026 12:13:46 -0800
From: Joshua Warren <joshua.s.warren@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 5 Nov 2026 12:56:48 -0800
X-Gm-Features: AclHuK9lvkZRlRsFRNuSAFqcvnK6plKLOjHdTWawATlg660tQrYN_fDRv4dGBfs
Message-ID: <CADjP6_CC-jv6nyEHaLj=Z0eyjubOJZuiKESqszW3LgTJTTQ_Aw@mail.gmail.com>
Subject: [PATCH 0/2] perf/core: fix perf_mmap alias charging and the
 redirected-event AUX mmap
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Two perf mmap() fixes in kernel/events/core.c.  Both defects are
present on torvalds/linux master 05441d697f7f9a927264f4058cbbc6a03dfcac9d,
the tree this series is based on.

Patch 1 stops duplicate alias mmaps of the ring buffer and of the AUX
area from charging the perf mlock gift (user->perf_mlock) twice: the
charge is taken once, at first allocation, and released once at final
close.  The excess was never removed, and perf_mmap_calc_limits()
clamps the recorded perf_mlock at the budget, so an inflated counter
pushes later allocations over into the RLIMIT_MEMLOCK side of the
accounting.

Patch 2 handles the first AUX mmap of a redirected event
(perf_event_set_output()): perf_mmap_aux() refcount_inc()s the event's
mmap_count from zero, which saturates the count and reports
REFCOUNT_ADD_UAF through REFCOUNT_CORRUPTION() (a WARN_ONCE(), or a
BUG() with CONFIG_BUG_ON_DATA_CORRUPTION=y).  A saturated count is
never released: a later AUX mmap() reports REFCOUNT_ADD_OVF once, while
perf_mmap_close() takes the saturated count silently and therefore
never detaches the event from the borrowed rb.  The AUX mmap
of a not-yet-mmaped event is now rejected with -EBUSY, matching the
ring mmap() stance.  The ring-side fix was
commit d06bf78e55d5 ("perf: Fix refcount warning on event->mmap_count
increment").

That is an observable behavior change: the first AUX mmap() of a
redirected event now fails with -EBUSY where it previously reported a
refcount error and saturated the event's mmap_count.  Only flows that
are already broken on this base are affected.

The patch 2 defect is availability only: the count saturates fail-safe,
and no use-after-free was found.  It is reachable by an unprivileged
user through perf_event_set_output() (PERF_FLAG_FD_OUTPUT) on AUX-capable
PMUs where userspace can create the AUX-owning event.  On a default
kernel the first such mmap() prints one warning; with panic_on_warn=1
that first warning panics the kernel, and with
CONFIG_BUG_ON_DATA_CORRUPTION=y the BUG() oopses the task regardless of
panic_on_warn.  The ring-side twin was fixed the same way.

Validation used source-level host harnesses that compile perf_mmap,
perf_mmap_rb, perf_mmap_aux, perf_mmap_close,
perf_mmap_account/unaccount/calc_limits straight from the tree and
drive full single-user, single-mm, single-thread lifecycles over them;
nothing runs in a kernel, and no runtime kernel reproduction was
performed:

- 22-case mmap-charge harness: the base fails 13 (per-alias
  user->perf_mlock charge leak), patch 1 alone passes 22/22, the series
  keeps 22/22 passing.
- redirect-lifecycle harness (33 scenarios): the base fails 22, patch 1
  alone fails exactly the 9 redirected-AUX scenarios (the redirected
  AUX mmap saturates mmap_count), the series passes 33/33.

The harnesses are tooling, not part of these changes.  The series is
compile-verified with a focused x86-64 defconfig build of
kernel/events/core.o; the kernel was not booted.

Kunwu Chan's "perf/core: add AUX buffer kernel-consumer API" (v2,
9 Oct 2026, <20261009160010.1829642-1-kunwu.chan@gmail.com>) is not
merged upstream, and its series changes no perf_mmap_rb()/
perf_mmap_aux() alias or mlock accounting line, so it does not overlap
these two fixes; both defects described here remain on the base named
above, with or without that series.

AI coding agents in the omp harness wrote the patches, the reproducer
and the measurements. I read every patch in this series before sending
it.

Joshua Warren (2):
  perf/core: Avoid charging mmap aliases twice
  perf/core: handle first AUX mmap on redirected events

 kernel/events/core.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

-- 
2.39.5
