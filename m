Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D97A35A397
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792086118; cv=pass; b=hLUjRHAILiGEMAbGT5JaQRaNwFkSRkNcPKrRb1/klX6wF9n9yzFXxcpuhASxWXVUhTmQtBmabtVasFlA3gmyyJAFVSz2pSCC+K5R6QyJkV9Z8AxHldAPiZ9ATLdOvFzn8XtQzciR09Fy26q+SJTAX5cOxqQrFmwvxSBs02EJJdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792086118; c=relaxed/simple;
	bh=pWvyalycBKMpW/SeEYWiupuyITbO41ulxAjlLOu97oI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hi13VTybo0Vy/cY5MOR/cf5qk9dP4S1WrV4ekkLO2T5h7x6S3XaxwM68P/25b4uRcHhBLfjY8c2d1AF3vJyVopUhdEUIVQidg3KPZ1dql3AkbXknoQRNf1apDTh3u4uqRwfaLMPmMJhaLa9FPxMCe3Mnyx/DQ/xRsszPvnUy8pM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCqEcuHJ; arc=pass smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCqEcuHJ"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-833e671ee9fso4063456a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:41:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792086109; cv=none;
        d=google.com; s=arc-20260327;
        b=VjJtEMG0Lkwns5dAt2YmQgbl0tGOQFa1qsrOv1CeAnhorIDp3f1SM+mDg+5AKXLPQV
         wvvRURet8xRBbFyjPAZ9l/oRiNhXOKoa1Oc5FMxYvmMKwImdCB6zkhT+aIfvhth324CT
         brpYyjHmkaD1ElmdBdtrcGqZO22kXtRH1MCuwewgrvyoWI7AavFytC/uf1PRKyCxZA5i
         WD5gwBImJpVOBVUvnYu59i2bUikonEOUvw4lzgbk/wkJ01+a6xWIigsCttOFVZk9fesH
         TbhVgpk8sb2Q9mfVD0H1SHR1GPfmRv8mVUXmQvh3r6wIu97jcwWYfrbcteLaihoLI+I1
         m3fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lj1DQBWy3OXBOduX0L3oQHUHpN/MbkDFzxGdaly9HNg=;
        fh=3rUOPz2gHfRi48n0V7SFSvQkO3p+84lVpEx/xR3GTEs=;
        b=RDGFQs9lWn29Yn5brsA2Vcj3uM7/vgjWAB570LJfbxLGp9v8W3IPgUa6Dn9OWK8kP8
         /fMWtuIdV5YpIPr7hfHK4jW4xGMlcwrGdsPs69MIHDK/X8KXt+L2jJrP4cpHF4i3Mfac
         6ZHeIkZVhakHExicE4Rglo79JSpVqPwjpiK4zT3GZolzTuUX2rAJNHO2Ddu5I6138OkQ
         NZPLDZKSzyyyFdSrpvXgeSgmppSxYv1R2w7xtwub1HYRRX/2xqE9dhOtqbLpSKn+Rfe6
         cYUoFAb2nm4rBddx67ecKk4lzFDnOrfLyeq69+xrXDPikMlQsq0u1ZW25uh7wZfaXrkt
         xfyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792086109; x=1792690909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lj1DQBWy3OXBOduX0L3oQHUHpN/MbkDFzxGdaly9HNg=;
        b=OCqEcuHJFXqRxFp5k9C3qFUlNuwbBbYwckBT8lwwZ1F5c3frwSvwc6BYnzGKdHVJnw
         Z0Rgs29m5+A0cgLqHwlWCemkPV6hw6sibiojH676LAWoigpqY9v3p2fEy+eLTnlepSf/
         Zu07kP4pmk4iOqpcHuHtiuiyjznwhAFg7m69TUZpvw+HDQpVeBE5OobSxP57ysFwVp31
         YtSfmuCVobaRqK58dvreDN/vvF/mxReZrm+RQmgsvTkPsM/+gTUhHzQxIpdlzh8X+/Il
         QZPwWw3zTFm3eV0X/sDBbsYL//Orvdyts/9U0kcRhWxtMLURxmBWGUearXK3wccgbaVT
         f4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792086109; x=1792690909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lj1DQBWy3OXBOduX0L3oQHUHpN/MbkDFzxGdaly9HNg=;
        b=CrT56PkRK7ncGBsIwOlhNjEBmz4Rh7CECPcAY1R8pcyP+OZmeuH5FR17oFMKWK5lp0
         bMiC15GCFPVp0TPs+d6E6eKtAD1iBugFFbAD+JpOhmifvOMs04Yrv+errN/756OeMmiF
         hlxWoEyWjBmMDP4z9u+6zMLhC7xAdpTFAr+UckuX2lXJK9rMfV5UxPNiQ1l/gYySpHx1
         h0EjEWHFH8LhjiiOUGnJFBEFqfgdYIGIR0Qcyu33oZbgoi3GB5doNlAxbxO3pPynT76B
         kxzTsPPFyeZl+2XuV0jBzEYRF1T3Ni2aZZeEmFL/0+6T//RR4AiioEuVj0uyqJMzXhdG
         cwlA==
X-Forwarded-Encrypted: i=1; AKwUvBw97VFLw9jELaM8muxJesw3sMZPrwWOc48fbY+NGckQRc/tBBcO5thSLaZ1XwdlvPIeCLjmvrRXP0H3NJU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7dhbk18M4dh+dPlD+pNbDWX9f8oJG5IjyQnFJh3C6+CfxgJuQ
	o/5Grzf0AWISpwjP8X79AijkzP+3cs68L5rW61UWGF5H/AFkyvi+VZoxFCLyiDYq91D5CeppkF1
	uH2QpEILgfcKl7VcuHGL5K4tAsXXbDHo=
X-Gm-Gg: AYBFou1vJI+4m8fR77IZV+BTGw5jtQSm8zoA/6tCxZb6xJ7bcsO735F6xTTLan8t8Qb
	jkLdI4Nu63JkniHV9HW+yWaKM+ToKPgFFY43h5BVKFPgQjrZnp+eneSQ6S8MI4IOZtxLIDHPmz3
	deFqiS+BICNtOlxLpMNuNtLvXLC8IxY0ENn4+BQNIxkUA5ORVscO9wxNFzrc/ynJ+0yeEi2CTK2
	yNnOIHREAoFCvb4qdOfY0RfvZdYWdSwjKSJBcsYIXzpqFVQH+MhmEVkPVn8BQWpidrUl+PzXxaE
	bYTmPn3bKk4WE8W+noD8pz5MGYZNh1OxAUiq3CbQvTn/kf11hPVNcA8=
X-Received: by 2002:a05:6808:23ca:b0:4d6:92b3:5c88 with SMTP id
 5614622812f47-50c5b27c212mr21580284b6e.64.1792086109195; Thu, 15 Oct 2026
 10:41:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015-selftests-bpf-struct-ops-assoc-timer-v3-0-efe643d4b2a3@gmail.com>
In-Reply-To: <20261015-selftests-bpf-struct-ops-assoc-timer-v3-0-efe643d4b2a3@gmail.com>
From: Amery Hung <ameryhung@gmail.com>
Date: Thu, 15 Oct 2026 10:41:38 -0700
X-Gm-Features: AclHuK98TOBFifxyiHAjpf6qUBttGLdv2xnCl-ElpsA6_pdX4NyYfKL1VgU_hh8
Message-ID: <CAMB2axPRjfe=ROzA0rMR1_FPyv1mA-jaH3bHQHZje=Q1PjoEVA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 0/3] bpf: Fix a struct_ops use-after-free
 behind a flaky assoc_in_timer test
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 6:35=E2=80=AFPM Qiliang Yuan <odys.yuan@gmail.com> =
wrote:
>
> st_ops_assoc_in_timer_no_uref drops every reference to a struct_ops map
> and expects a timer callback of its prog, 500ms later, to find no
> struct_ops associated anymore. It fails now and then while test_progs
> runs other tests in parallel, and v1 [1] made the test wait until the
> association goes away.
>
> As the BPF CI bot pointed out on v1, the association goes away late
> since commit 5db69b0fbdc8 ("bpf: Make struct_ops tasks_rcu grace period
> optional"), which moved the RCU grace period of a struct_ops map in
> front of clearing the association, so nothing waits for a prog that
> reads the association in between. With that window widened, a timer
> callback returns into a freed trampoline and the kernel hits an int3
> Oops.
>
> Patch 1 frees the map only after a grace period that follows clearing
> the association, and patch 2 adds a test that catches a map freed under
> a running .test_1. Patch 3 is v1 of the test fix, which can keep calling
> through the association until it is cleared now that this is safe.

I think this fix is heading in the wrong direction. The struct_ops map
association was designed as an RCU-protected pointer: asynchronous
users may outlive the map and observe a NULL association. The existing
selftest explicitly verifies this behavior.

The problem is that the disassociation now happens after the grace
period initiated by bpf_map_put(). Could we instead make
disassociation safe in map_free_pre_rcu(), before that existing grace
period, rather than adding another deferred-free path?

>
> [1] https://lore.kernel.org/r/20261009-selftests-bpf-struct-ops-assoc-tim=
er-v1-1-9a97a9b3d1db@gmail.com
>
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> ---
> V2 -> V3:
> - Wait for an RCU tasks trace grace period in patch 1 for every map, so
>   that progs reading the association under RCU tasks trace, e.g. from a
>   bpf_wq callback, are waited for too (CI bot)
>
> V1 -> V2:
> - Add patch 1, fixing the use-after-free behind the flaky test (CI bot)
> - Add patch 2, a test for the use-after-free
> - Point Fixes of patch 3 at 5db69b0fbdc8 (CI bot)
> - Move the restarting of the timer into patch 2, which needs it too,
>   so patch 3 only turns it on for st_ops_assoc_in_timer_no_uref
> - Rebase onto current bpf-next
>
> v2: https://lore.kernel.org/r/20261010-selftests-bpf-struct-ops-assoc-tim=
er-v2-0-d7a43896dbf1@gmail.com
> v1: https://lore.kernel.org/r/20261009-selftests-bpf-struct-ops-assoc-tim=
er-v1-1-9a97a9b3d1db@gmail.com
>
> ---
> Qiliang Yuan (3):
>       bpf: Defer freeing a struct_ops map until its progs are done
>       selftests/bpf: Test freeing a struct_ops map under a running prog
>       selftests/bpf: Wait for the struct_ops map to be freed in assoc_in_=
timer
>
>  kernel/bpf/bpf_struct_ops.c                        | 28 ++++++++++++++++=
++++-
>  .../bpf/prog_tests/test_struct_ops_assoc.c         | 29 ++++++++++++++++=
+++---
>  .../bpf/progs/struct_ops_assoc_in_timer.c          | 16 ++++++++++++
>  3 files changed, 68 insertions(+), 5 deletions(-)
> ---
> base-commit: 15b578b1715d9a318c804350d98af87c203672bc
> change-id: 20261009-selftests-bpf-struct-ops-assoc-timer-5eb0295ec300
>
> Best regards,
> --
> Qiliang Yuan <odys.yuan@gmail.com>
>
