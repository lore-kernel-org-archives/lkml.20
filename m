Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53073D3492
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076050; cv=pass; b=LnSgtTne2n8FwzvWgWEZukCTcBBKvXGG5gI6OapEXlSZFDjgfyNgv7UWUxK8MiY29tclTJYUf7Ig9HC+SPhqjehEBOCz3ELteHlRMu3h0KKZyietc6RnGiVucqesi2VRpWuBowQinh5jS9yiJWtDW6gbomcuoVrUKqRteC7QdAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076050; c=relaxed/simple;
	bh=AnKorVyMFsue4YLkX+u6nG8xKZlce7b3N8YLsAXV5Xs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c68SgMgPNnlm2EXDmHD/kJDRgi69TtpyEiQ9rkYcTIwNnbF5BQTNzrREBSX4gOmO+xahRf4t13UfnYVKesTtdxL6bL4WtfYRJNdMpDNiOOJXvuuWs+qDUqujI0sGMDuFXadpIppLj/oMiOx0aYC5NjtltWe3zFMVg0oU1FgMvD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UxWAsH/C; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UxWAsH/C"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8a83d2706fdso21767047b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:54:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792076048; cv=none;
        d=google.com; s=arc-20260327;
        b=dFyfmOtR1MWWm7YE6pJ5oeO/J9BsYdf65QHHP0n1lEG8IbiZsmj6ug3PN3jyCb4lVx
         Zz3ZqgPfE/p6+i8SzSJShcO03AsN0qZZLhdQbfk2Qv2HQU3SE6WfBSL9UV2mlxkt33IM
         uFETpyLGN8G1H0zXb/fk44GpFLqdXLRQP446mUN7aZ5IFLxf9slySYvbqTOrOaoQWWvc
         jJfDS0Wel6z7GHRi6SNTFLXN+i0NKMsClFXAOavycH9LpxnqXeMN8/IG1/ATStv/iqFF
         GT5fXAywZYKbGOmkU4XFihxiSbR51O6LngKwUU32UI5ADg90BUEjgsFgRH1KuPluhI3r
         TlwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dYgoYAnEHvzfJJCgXJF81sGKm1IaJw1pU61WKhV8va4=;
        fh=j9R/vzOLE9HAEV15+7RQjNsYQii+414PU7E7zbP7hEo=;
        b=F0GRUDCSZfQx3EnBC9fuYHkNlVf4mXqkiN0jHIQRdC1eYQ4JmpSrCkzeFkNhmEnC/E
         SiHrJV0PbsFXroS7o9VgnN4uDxzl1BqDOumO9Byn7WrKSr184+qLGlrnjjjySLiF5EHj
         zbOTl5Zj8KCXQCouHRR8k9mTrQaG1la5Ep39b9rOLTQpRZscXxgRCfF7IzEb1qf8HUU6
         NZsAyBYvhzzskXDgE/wIUHdALSnjAX5ElunlkpQrDNuWsH8QSexPEUvaujIC+5QZ5UqX
         usiC0YFbjfYTzSc8YZ8tkarcShNPsmUIT6ATNroWiNVBj7hTbMpPiwXUlpgE1xWkiei2
         5Fiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792076048; x=1792680848; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dYgoYAnEHvzfJJCgXJF81sGKm1IaJw1pU61WKhV8va4=;
        b=UxWAsH/Cl7/pyenIZyo5P3fZgk1zP6Tgjx/mH4nNHyPuv99+U32mBwhmKQYGIuy+rp
         Mx90p+EvV2iZLOQHFf6O4FzMt3oILoc1Y/FiXHViCO9mFpZkVG/rjvoV85x5xbIhfjYm
         1b1JJVJm0aFvmi8SA50Kh8CGnpVC3OzlSIKREiv5kYwpEMFgILUJrHGWXGoRw3AXMRZm
         tYtwD861qNFtSI0ttepy8ANkUKBHddWoj6qAqyDVxIeBn5UmjXLUKl7rsXoKdbqzU+S5
         ylflJHtR1kEDSLCbQ5txgFO3TY/5BIMusihTQ6KBMpDbKO1sbe+gYkoWuEfnM8EnacAy
         kR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076048; x=1792680848;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dYgoYAnEHvzfJJCgXJF81sGKm1IaJw1pU61WKhV8va4=;
        b=2u0F/LLbUzi0bk6TzLNZEJoO/8+xa4LZXL9FBvk/TAOEpX+LMnhaWfIF9wxaz5nyy9
         T2+O5eZnj1l+jG0rJcZghLfKQ5/8QpBSzeHfIiQ9xR3rqVjRagXvehlFVPPIbBX78gil
         VclzZkBonuJVYj9ibb8VrGuc/nlMYnfukSn3aybxMj4rZRZOpYYJ5fZmfK+A0jyE3Wjm
         0JF1qZw3gqE4N//ItMz+iD+E3vb26A2qsnV7TrjrT0wri9JwWn+HC9PhhNxSnHDlpPdN
         o9X5MaEO0MJzS6mzvlgv/RMSoFSU98B84coF2UDE5DOf+CuEc6Z8UuiVypEKmSs8gEq9
         NyIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwr8Z5ixadMaEAvi9a5/STltEtiEwGuYTfq3F9ZnTvz+r8XiwelcfKyNbaMvrD2WM8/Ae1c5Nhw9kk1Qrg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLa9PZC3I7So3pIGuJ4bomCrQqn8QWXShsGVxtYldyo8SNelr1J
	NXLzdDvaZdqQUlWFp+exhJpnvlfX1kDnsqGAmrX3iHKq2gjEJRZjcWoglN4bGGecocJfd6/mR91
	ZRGk2Yz2hfVB/ZKTDk4rW9SOSRtLClI8sNWSWbT4w
X-Gm-Gg: AYBFou0IxmtLXo+Ciy5uXu0JHc+GtDEV26cnhmwyUnDfOKV6vmgJcqm4MO93sh19NC/
	8EZq8sYRvo5VrEI9mzmoOTpKXz/lHXILvvPONnvs4E2Qju58FvcV6BVL08TJ6MdOW/a4gsDpfVl
	HWoYCTVHytwe3tymdJey09PU+TRvShzb5OYCqPq2ohsNLVdKT0YbrgUrpLp+RjmTyfje7Ez2osf
	4uQ29HfDCr2G7CVXsa1llABrtTl33wmqfhsMsMztRLX2EyKO9lolZZLibLVaMiNlv7tx4W4sGDD
	XoOGQn2GI+OlhXGYsHtkaQn0Qo9hjVw5BNoM0nJF51cP3yWyTokzvS9ZQ2N/7x849WS38RmCCQR
	P6U/2wjWFAg==
X-Received: by 2002:a05:690c:6601:b0:854:819:64c9 with SMTP id
 00721157ae682-8b07edb5ea4mr60117707b3.30.1792076046940; Thu, 15 Oct 2026
 07:54:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014095238.2132580-1-sh_def@163.com>
In-Reply-To: <20261014095238.2132580-1-sh_def@163.com>
From: Marco Elver <elver@google.com>
Date: Thu, 15 Oct 2026 16:53:29 +0200
X-Gm-Features: AclHuK9m7JT0Qck1kk4b70bqEqtddMmAhlHS6jUlvnCmwhJmF1L67Sq-JSWhkSA
Message-ID: <CANpmjNNhZq6z8hZN-125OPNbho+YBwWJeOsa6QRedkqOdJP0kQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] kcsan: add targeted watchpoint sampling
To: Hui Su <sh_def@163.com>
Cc: dvyukov@google.com, kasan-dev@googlegroups.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 11:52, Hui Su <sh_def@163.com> wrote:
>
> Hi,
>
> While investigating a low-frequency scheduler access around `calc_load_idx` in
> `kernel/sched/loadavg.c`, I found that KCSAN's per-CPU `kcsan.skip_watch`
> interval can make focused reproduction difficult. Unrelated instrumented
> accesses on the same CPUs may consume the interval before execution reaches a
> known suspicious address. This is a limitation in focused-debugging control;
> the proposal leaves the default sampling policy unchanged.
>
> Setting `kcsan.skip_watch=0` removes the interval globally and can make
> watchpoint setup much more frequent for all eligible accesses. The existing
> debugfs whitelist and blacklist filter which reports are emitted after
> watchpoint selection; they do not select which addresses may set up a
> watchpoint. There is currently no runtime control to focus setup attempts on
> one known address while leaving unrelated accesses out of that selection.
>
> This RFC adds an optional single-address target to the KCSAN debugfs
> interface. When enabled, a non-atomic access is eligible to set up a watchpoint
> only when its byte range contains the target address. Matching accesses bypass
> the normal `kcsan.skip_watch` interval; nonmatching accesses neither set up a
> watchpoint nor consume that interval. The target can be specified as an address
> or a kallsyms symbol, including `module:symbol`; `target=off` restores normal
> sampling. A static key guards the disabled path.
>
> Patch 1 adds single-address target matching and the static-key-guarded runtime
> state. Patch 2 exposes address and symbol targets through debugfs, patch 3
> tests the matching semantics, and patch 4 documents the interface and its
> performance implications. The standalone integration module used for runtime
> checks is local and is not included in the series.
>
> Testing:
> - x86_64 GCC and Clang `bzImage modules` builds completed, and the candidate's
>   built-in KCSAN selftest passed 4/4. Runtime validation recorded setup
>   activity for exact-address and `module:symbol` targets, none for a
>   nonmatching target, and normal sampling after `target=off`.
> - In a separate motivating loadavg run, targeting `calc_load_idx` produced a
>   KCSAN report involving `calc_global_load()` and `calc_load_nohz_start()`. A
>   separate upstream run with the default `skip_watch=4000` did not report
>   those locations during its test window.
> - Across 10 rounds of 1,000,000 accesses, medians were `24.549 ns/access`
>   upstream, `24.654 ns/access` with targeting disabled, and `26.981 ns/access`
>   with an enabled nonmatching target. The disabled-path results were
>   indistinguishable at this measurement granularity. A separate 10-round,
>   10,000-access hot-match run measured `81.1 us/access`: every matching
>   access enters `kcsan_setup_watchpoint()`, so this includes setup slow-path
>   work and represents focused debugging rather than normal use.

You should compare fast path disasm before/after, just to make codegen
isn't adversely affected.

> Questions for discussion:
> 1. Is address-targeted watchpoint sampling a useful primitive for focused
>    KCSAN debugging?

On surface, it seems helpful.

But there's another angle: The need for reproduction arises because we
want to debug an issue, and the fix it with a code change; after the
code change and a recompile, are there new data races that were
introduced as a side-effect? Perhaps the original data race you were
hunting is gone, but new ones may have been introduced. So my approach
has never been to try and focus on a single data race, but look for
data races that may have appeared adjacent to code I touched
(filtering based on function name). The method of reproduction are
stress tests that more or less reliably trigger the original data
race, but should also trigger data races (if they exist) adjacent to
the code being scrutinized.

But perhaps what you're after is asking "are all accesses to this
variable data race free" only?

> 2. Should matching accesses bypass the normal `kcsan.skip_watch` interval, as
>    proposed here, or should targeted mode retain its own sampling interval?

It might become quite slow for frequently accessed data, but perhaps
that's intentional if we want maximum races detected for focused
testing.

> 3. Is the existing KCSAN debugfs file an appropriate interface for configuring
>    a single target?

This looks clean enough.
