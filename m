Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792789591;
	b=yat5I9G3JhQFsBO3eFOLt2IvPD2Qg7b7gqXsxkU2aTzBo/Aad0d0HbCULW0IKFaIQePl
	 5us8DM47qZG+8pQ6iMQklFA8EdxsHmNjU86z0i5bwf6vc3aGXo5rArrS9bGxxOUcEEXis
	 6kBVJ9HqaCfOVpoor7VcWlMlIMEDj425k6Kpd5Jw6FH5XaRRjG9zvgPQ6xDFZxWnNudFd
	 iRTUMpPXEBpo/8yQKPEvKgoUVHX4Hdgbj2IsPymYLdbL8d00lXExByybBjgVi+pcRy+A/
	 4oWwLOisfolQlQdZ/ynDfHySmdemGar4swW1G15NSeqgtTehbiJG7r7qFDd5wMFgoJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792789591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=B81JhG5oBLgzvk4unoyO/Obs8jvRI83INB837bEDY/g=;
	b=ukISffKTd4AXcqjZu/8jS7/9FadsOlbV5XN7CwNtonzOC8RvhwPKYx8BPv8WTaQvCapG
	 fICXhieG1f+KudiKC9QiQEdDb8xE1m/hqKamGLYyz1y1eZ5k0SRHJsvYx7DN7/fCoS/yy
	 YtbA5PBvnXRop8HVSWiEv0NOIQiBD8Tyy65jhgKiuUvNIyTf9Odf/Li66DlxrQd3b10SI
	 gZblM7BD8cJlFxYqU+unNrB235vMtBkX+novHEGxZjCK4owEXFO2Scvi6BELwvS9hk9ni
	 MHPNEsarxVDR25Ly5fvXs6ii5JKkNUeHt9nEcSPE8RgwovYXNM6bbMdt6kCKrQdujew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LbTEuS7U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D430606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D430606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LbTEuS7U
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-504ae5941faso721209b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:06:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792789590; cv=none;
        d=google.com; s=arc-20260327;
        b=V/NtEUJt1opHpfrmOVdcd45mO8dH63jpG+RiEBChSVgNGePSEa5OVKMpDtOM56o7IO
         6Xp1OpuLpV8CAnwc0d1nQ5Fc8wiXyZLmN6fDyXmT+G/9jx+QNlzXhcqoRXCTxS6jj8Gp
         1v04w6Byi2XEfZnUKos0Ee5FZBI+bvQs5ZDPDVLNa17YfmMcLnoWSOoSwCZtUs1cOW1X
         1URI1AKWQ167T7EG5b2UAlY/Gnawjzc0N+w1CTCt+SgbQW3cS3Zf+kfFtDrxjvQDfzrX
         aB7l7bwvhdK9yrlaUolJgRVm2ZpanQWhMhY+rufJExN57KBzkfL6aaAM8uMpyH1vv8hc
         OglA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B81JhG5oBLgzvk4unoyO/Obs8jvRI83INB837bEDY/g=;
        fh=T3aSI6AKH5d2Zzwk+B2dRPCmH6vW2snXiumWqdVQUxM=;
        b=Rix3GcsmsJWOnqOxwz7dbyMD6wHz+rM+KfutiiPHFaNl6MtJ5GEc+cQNHkcgnihWgu
         8HztvTseIlqsciLYjvDWiuLx8P+eUecjxi009SdrkKGvKsCrMtsYTG2s4rFHhaCrcRIO
         zYrYFyLqm+dOjtcK3+GIAEw/hYcfOe/g09M5+5rVmdTpfmu5oxl2GzWpJgHGhqemLCZa
         VULaNwI+9wvl81MtRQA5B0RKCW4NQLe2XjXqAQmwDEWRuYCBRqwM9fa0Nl1aKSAcgK9j
         Pw7AZ9u1ggnUFV1LTmZs70dLLxPmZDDprVxJfdowPHEPq3YgQZlLI7oEHYlpplXjIMbJ
         kqtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792789590; x=1793394390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B81JhG5oBLgzvk4unoyO/Obs8jvRI83INB837bEDY/g=;
        b=LbTEuS7Ux8e0j573K7MhU2vm79E8Zc5Vd0Oh3AE4CaPKJdlNISyhaBIfBt/OEA0rxK
         yKXIdkZQTz8Jhq9pOzh7yG2EIdEursa1+d+FQo9ycmAl6fS8s8djVJXQnrexZr/pJ8I9
         dPqPg9/sL2VjO45HMToYFi1qNIPCl9VqhlmoXSw/tEd9COrXiOk2svE66Gn+BAMAfoqM
         j9L0dmGksi7n1cNKSLka5bXT2ReWBxYBSwz5sdgNRP+6SXun4xlPuXLm7XIxsYBKmLq6
         ar4JVFIZNGHiK81sMw6ieF+Z/xI1PzWjbsxGoVsumIbd81i6ZIsQzag4d8M47mjJNtX7
         BUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792789590; x=1793394390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B81JhG5oBLgzvk4unoyO/Obs8jvRI83INB837bEDY/g=;
        b=1BTEWPba7+t2hWDBs7zbh3doRWp5ch46Zv9bNHLAY0r2Gnajp+y1OssoetXYZu0iF3
         C/fbNuH4x+bewmExuJktjggqwZyzbUi4YnxTEp9k+eOv/nzzIID5Lo7KR6M0aVSHTMMb
         lOE8kXD9pRvZYyWnKzdr4pmOszqe1FiyTrOnsWp0CauFKMQLUaRMkKOJWnpoHGYz7pzT
         JbdYb+DaVygztDEnFxseXBMKNYXJ4Kk2PiMl39BcGSJJqSK3XK46nOP+rXfjrf/RBfIF
         YQYz3co0PVlen6N8sqf/P0tZ6onDoJeSS1KQH0DmZ6azuUvmj8TcJ/qlNLmaoS0b4dQx
         k+fg==
X-Forwarded-Encrypted: i=1; AKwUvBzJzYfp56vNFirTgKk4resJX1I5Wwo2xosLGw3wLdli8w+1cZ8iCsRzvJ0ygKY7G4vFP+zNbPOXq1BIL1I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJYTTvQIyuQvTzfQFLxQjn5MuluANSVMvmNMgkmUxaAGYWjvod
	hzqnxLOYi5W7hNE5+rnlrk8OhWtHiYCHrKgcwOjlZZ2DSHz6SqLDUsUIKb7VEzQOnS2fej7NhXq
	jUf+yF86coN6YiU1gtzqms/Fy0LiT68Q=
X-Gm-Gg: AYBFou2EcXIiU7icXsKkNnpGYC8O2gq3+ZMP3a89NExeAOoxsol2/7CXa+c1OZCxVqn
	WajMuPqWQOZcwvsNdsR7KhSR+86FZTLO/ttmAn/BNVRBI06cDUElBoPP5aMcPuVI5QObFxraT6M
	KIz++KMWw685NxL51alXbX0XfIYt8HcUhbEFzVtLtkXXPrRxj7hM9ibI5yab5v1iGJzOAKu3VU4
	55JE3toTsNyS4kRxLTwftcbCzTeqQ8VgMCm/tes/Ni8d/0nT9wjpYKejXMQYHTMCq0oI7TD4gH7
	fDpOYtGJiMTKSzzdRMX/iQV6AIajE7tJP+fcCHvcW9a0Hs73qazM64gN6n0XJJwlQ5ilgrZJDeI
	A17gtw0YlHB4GBrUbQ87aLSoO/lENubxzDPry
X-Received: by 2002:a05:6808:11d0:b0:4f2:6f1a:a34a with SMTP id
 5614622812f47-55c00261ddcmr323202b6e.12.1792789590065; Fri, 23 Oct 2026
 14:06:30 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-selftests-bpf-struct-ops-assoc-timer-v6-0-2c0f18e82582@gmail.com>
In-Reply-To: <20261022-selftests-bpf-struct-ops-assoc-timer-v6-0-2c0f18e82582@gmail.com>
From: Amery Hung <ameryhung@gmail.com>
Date: Fri, 23 Oct 2026 14:06:17 -0700
X-Gm-Features: AclHuK9TRgslO5apNkTHDd2WGpGoCt37hFcjtmqCOM6wGIxqCzpcyynr5JgcoDw
Message-ID: <CAMB2axOYfDT4HiaWvjJwcBvsXsUL944scQNZjMAPAgJchG26ew@mail.gmail.com>
Subject: Re: [PATCH bpf-next v6 0/4] bpf: Fix a struct_ops use-after-free
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

On Thu, Oct 22, 2026 at 1:48=E2=80=AFAM Qiliang Yuan <odys.yuan@gmail.com> =
wrote:
>
> st_ops_assoc_in_timer_no_uref drops every reference to a struct_ops map
> and expects a timer callback of its prog, 500ms later, to find no
> struct_ops associated anymore. It fails now and then while test_progs
> runs other tests in parallel.
>
> Since commit 5db69b0fbdc8 ("bpf: Make struct_ops tasks_rcu grace period
> optional"), a struct_ops map clears the association only after the RCU
> grace period of bpf_map_put(), so nothing waits for a prog that reads
> the association in between. A timer callback can then return into a
> freed trampoline, and the kernel hits an int3 Oops.
>
> Patch 1 lets the association be cleared in any context, and patch 2
> clears it in map_free_pre_rcu(), so that the grace period bpf_map_put()
> already waits for follows it. Patch 3 adds a test that catches a map
> freed under a running .test_1. Patch 4 has the timer callback of
> st_ops_assoc_in_timer_no_uref retry until the association is gone.
>
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> ---
> V5 -> V6:
> - Rebase onto current bpf-next
>
> V4 -> V5:
> - Drop the free_after_rcu_gp of struct_ops maps, which is dead now, and
>   update the comment of free_after_mult_rcu_gp in struct bpf_struct_ops
>   (Alexei)
> - Also stop the tests when associating syscall_prog fails (Sashiko)
>
> V3 -> V4:
> - Clear the association in map_free_pre_rcu() instead of deferring the
>   free of the map (Amery Hung)
> - Add patch 1, replacing st_ops_assoc_mutex with a spinlock, since
>   map_free_pre_rcu() may run in softirq
> - Stop st_ops_assoc_in_timer_free and _no_uref when running syscall_prog
>   fails, instead of waiting for the timer forever (Sashiko)
> - Point Fixes of patch 4 at 0e841d19263ab, which added the test, as the
>   delay left after patch 2 comes from freeing syscall_prog
>
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
> v5: https://lore.kernel.org/r/20261019-selftests-bpf-struct-ops-assoc-tim=
er-v5-0-77b2e181e5cc@gmail.com
> v4: https://lore.kernel.org/r/20261016-selftests-bpf-struct-ops-assoc-tim=
er-v4-0-9ad31c21220c@gmail.com
> v3: https://lore.kernel.org/r/20261015-selftests-bpf-struct-ops-assoc-tim=
er-v3-0-efe643d4b2a3@gmail.com
> v2: https://lore.kernel.org/r/20261010-selftests-bpf-struct-ops-assoc-tim=
er-v2-0-d7a43896dbf1@gmail.com
> v1: https://lore.kernel.org/r/20261009-selftests-bpf-struct-ops-assoc-tim=
er-v1-1-9a97a9b3d1db@gmail.com
>
> ---
> Qiliang Yuan (4):
>       bpf: Protect the struct_ops association with a spinlock
>       bpf: Dissociate struct_ops progs before the grace period of the map
>       selftests/bpf: Test freeing a struct_ops map under a running prog
>       selftests/bpf: Wait for the struct_ops map to be freed in assoc_in_=
timer
>

For the set

Reviewed-by: Amery Hung <ameryhung@gmail.com>
