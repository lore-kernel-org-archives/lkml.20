Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB10D51812D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790027998; cv=pass; b=JHlOphulXai3yYpjD9AdWt2ZutolAevISzOJ0RFWLXGHGXbfEDyDCtyQz12v61bJhBgxoclBEwe1XVhHppC/b0+wsKpVEfOvcuZGnCttKRIwGms2sBByMMxvAU3bO1XW2t+/L7CaU/Dm4fIKAs5MypIgewe89FBFHEyuHSITgls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790027998; c=relaxed/simple;
	bh=ZSXJsLG0n5mKfVuoD1VqTcG9MfIiLklpu0DxRJ4e1Qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rh52F44d92p/QCajMrVsXn0kdSfZ0HFIttLMWfpfS39oLcnYEyHf0J+RP2ABSeOTBcWcd4kaEyC1N38Yl4NtNn4diRYUZZl+KVa/Lc1Y0DMAcvtfYNdXqpngoJzkfaCazg7Gw2aqbzSZJmGYcojm4GcKKaNmoQEuSkydAD5zzvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1AxPoWO; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1AxPoWO"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso3335494a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:59:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790027996; cv=none;
        d=google.com; s=arc-20260327;
        b=lco+jepsHFO4/cB1Tjsz4VGPNPPyrVJtIv/bfUoF8+WtT1jd1Y0mTVq84QB9OHiIbm
         Rw4VL7Pt9qZEqFkwplNkwSf+rHewSWeSL1bGpWZDGz9isO/O83xU6o/EaPhCH6ABYplV
         zWq4ki6yztEFjDwMFXuO6WiVmYzTh493a0Q13VmH0yz49/nC9A3Z3bMvwh58ZtYGzO7T
         Z3soeMufx8dUCv+nMV8JrcLICGA1ZtBeTFF7fqPJFcePMrNawZFe8JNn9OSmKvw6FRsZ
         DDY6AnCdHhZgEHqT5BJvvPqzoFe9VqjDlfCuQViOqp4q+dh2P4tCBNblRb7R1+ipANJV
         lIkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zidmu+RY3RU2nq/L1X/QMRBfI/Kp6AgQCY+485qcP0w=;
        fh=BRqJ/EX3jq1xjLWaKa0B4aibKYD0KePPyfDwVK/tlgU=;
        b=ntECTq8qdFJeNXaPbZKad+nI60M4C8/kDuDKP9pbNcZouKmZBS9RnQ8dQc59WlJFHE
         dE5S8/XQD8wYSQEe2P5dg74Ntz3qw9F5YDVFgkVKfbz2FAQpz7ZkmU5oyhMYEDC0ISFc
         DdqaNDVwzLUEeEITtY8NeUUH0ttyxlQsQucRzoniwBgmcFnWeafsqSjYVyeQCbUOgGkO
         dy7pPyjO0slzxaffwVJRpOiCjda4dEeywLRKO2Ys6Ak3JGG0BdwHTcFyhLko7bFgUdQW
         wnB4nkDzCMuHhzm6tkZxEYCECREQ0ug3M3HnDBcN3PUiqVdOwrd87wk1UFjEReFUljVb
         jXEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790027996; x=1790632796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zidmu+RY3RU2nq/L1X/QMRBfI/Kp6AgQCY+485qcP0w=;
        b=M1AxPoWOCazRfv5+Iy4vbbs8fWR100N7HuGQG1DuJHKsi+u3DAWmiYm4Jq4Df+O7eF
         C8K0ZInYQqnEMPAs+mFUrtM8c4sGgtb7jeRtpzqF8uAN51aF12wVIDdIST7Dc72VNKo1
         GhcnwBZcHFurrPgCjocHJSwb8HZEOX4L1iwfwOMIN1HT4BnHp2ck9O2cVIXEbN7RwWph
         qK9fmr9r11moNKlC5InrApwUb4qLZFlIG34ZNfI8/b6uavSlEnSboDktGdadzgGmh2Sv
         SnBnEuOnGI+yVuw0Q7a/p8xREi48vxxEiDyJQjtZFAlaopy7CWUtKmj/5KsiPmINz3gW
         4nfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790027996; x=1790632796;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zidmu+RY3RU2nq/L1X/QMRBfI/Kp6AgQCY+485qcP0w=;
        b=jBSCLC+5icDL/gHxeMFbgitgT8AWofjz8+XheBOO0FMXuNomzMuz1aYdZYvJ7FNbyD
         4k5FOxWzAawfUW6Dc1yzxajE38oa09Q35t6CQY/4BkyqwWEYJotojJimBnW7xuqzGt4u
         fDTxIPckxY8aUHu4gxILbvyfNznjk1c2Be6vfWRjKfWfd0ZQ70NXuz0pHg0COqFuB898
         tIU5rG1XMHDK/3x4N9/v2sL9SUkGZA+KMErxRABj8/bDIl3aU3qAARLAmi1xj9ehKL+s
         VcHSXLgjL6nTnQv2pB7jio2CPPNZ9Ksd2wdQXgtFncxecyFUU00IdwX9SxmOIq9Khkvf
         NJCA==
X-Forwarded-Encrypted: i=1; AKwUvBz170aj/JYc/MyA0qv2d72qbhBWAKzG2Weuf+/tsVGQsjN+q3SXK860FRsC8aGDsgmQn0yjbdZZAVdjwS8=@vger.kernel.org
X-Gm-Message-State: AFuF++mCO+t1O/0edi8VSl9WwrXE8TdmCT+nHRZdW5SFXHYG2rV5RZqX
	rYbnthx89aJN9cvm5MUdXmCf7P8i/kQx0n4V7E0c2O7Ddu/z8wKEP0M3K1VQOTo7GSPNIyTd6dV
	7UY9ggRYbh4tpuWn0A2EcVq3eDZ6YSjQ=
X-Gm-Gg: AYBFou0e6LHzUlvtoPdV2Xp5k1GbPXy/fS3nBD5CCIpLp7f211zQJki47R1wfCF/W0f
	pZTv2b7vOzT6xtEQOFgD2UqJzeDa19wTaAPXOiFIiMeSv5sXALtCgxSVX5v4Xx49MbIfK5x3bZv
	BE4P6/T1soq3goWoTY7jD+5SWD/R3YcKADweDISVbyFsJVN33iHOGw71O6bT7yeDrkNyDjBwqHF
	Mfd6FR+TQEJYlPlFyAhyMd6RIIpYDWA9Nol4LPnZJSKM4EiFznasHItvYBs49z8T4ZIostrUjVm
	PSkmKemIG/aBw2zKwteLqCOsE/R2e3dev5sEdAWxYlU134Pk9eS0lcAiukyszbH392ETAFY5SX1
	VqBXyKlKTtO4qIzV+96lfYxHGB5wH+iUDKdpquu3Ex+QOi/6nQJPp
X-Received: by 2002:a17:90b:4a01:b0:3a0:4abe:fcbd with SMTP id
 98e67ed59e1d1-3a04abf0758mr4461121a91.19.1790027996048; Mon, 21 Sep 2026
 14:59:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918102052.1247819-1-sh_def@163.com> <20260918102052.1247819-3-sh_def@163.com>
In-Reply-To: <20260918102052.1247819-3-sh_def@163.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 21 Sep 2026 14:59:41 -0700
X-Gm-Features: AcwNN1Vk_AiZZqIRosmo3DKcpKEGJc9ONZnAL9NkbbMjJk-8DXnpZgX_IG1otnc
Message-ID: <CAEf4BzaxH2geQUUOOGw8S0fhm3c9Z0H5r75QPo9_ziiqU6MF2g@mail.gmail.com>
Subject: Re: [PATCH bpf v2 2/2] bpftool: Fix sparse CPU IDs in prog profile
To: Hui Su <sh_def@163.com>
Cc: qmo@kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, davem@davemloft.net, kuba@kernel.org, 
	horms@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 3:21=E2=80=AFAM Hui Su <sh_def@163.com> wrote:
>
> bpftool prog profile currently treats the number of possible CPUs as
> both the logical CPU ID range and the stride of the perf event array.
> That misses valid logical CPUs when the possible CPU mask is sparse, such
> as 0,2-3, and can use incorrect PERF_EVENT_ARRAY keys.
>
> Keep the compact possible CPU count for per-CPU result buffers, while
> using the actual logical CPU IDs for perf events and the maximum logical
> CPU ID plus one as the metric stride in the PERF_EVENT_ARRAY. Keep the
> userspace perf file descriptor index separate from the BPF map key. Do
> not advance profile_perf_event_cnt for CPUs that return ENODEV, since it
> tracks opened userspace perf file descriptors rather than event-array
> slots.
>
> Tested:
> - Built tools/bpf/bpftool successfully on the host.
> - Booted an arm64 QEMU guest with a patched virt device tree reporting
>   possible=3D0,2-3, present=3D0,2-3, and online=3D0,2-3.
> - Ran both pre-fix and fixed bpftool with cycles and instructions against
>   a BTF-enabled fentry target. The pre-fix binary faulted in
>   perf_event_alloc(), while the fixed binary reached perf-event setup and
>   reported failure to create the instructions event on CPU 0. QEMU did
>   not provide a usable hardware PMU runtime result, so no profile counts
>   are claimed.
>
> Fixes: 47c09d6a9f67 ("bpftool: Introduce "prog profile" command")
> Link: https://lore.kernel.org/bpf/20260813160858.1042834-3-sh_def@163.com=
/
> Signed-off-by: Hui Su <sh_def@163.com>
> ---
>  tools/bpf/bpftool/prog.c                  | 51 +++++++++++++++--------
>  tools/bpf/bpftool/skeleton/profiler.bpf.c |  8 ++--
>  2 files changed, 38 insertions(+), 21 deletions(-)
>

I don't think these fixes should go into bpf tree, please rebase them
onto bpf-next/master and resend. As is they don't apply cleanly.

pw-bot: cr


[...]
