Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A4922370A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 00:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788395546; cv=pass; b=miq7MRMOMD/LBEoqKpX1/IuV3BVcJx89aO89IUD3aJfDHE3kOUKspUcu0aSQ9ZL4an4NSEYv/AJZX9DzjO5Q52d5G/xg6EbkjI9oB73XwI0UOU/k5VTO5m88Q91XUBv/FEtDbsQA/0r4E8x1cLj6zC9LI2bTuOPMnKYwTxoGMjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788395546; c=relaxed/simple;
	bh=2jLCVEyTOu7enORfoyn4qAX/H9CGdtQm8tczTeRJKOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=faATk9ESa0Xo/bwfw4NtzedWzSNTq6a+6qkqeDmC7GF8NCQd/9haB2EACYXLFGX6ZbXBcCDcgqryBH48aa10I8lrc8wAS+z5mYQnbjjCZqs04NLiqtT9S9GeMfwgxvNSl1zz5eZER5GMcrj1Y5TDPr34v2HutOT+Zs68mY0G2Iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sMCQJgx1; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sMCQJgx1"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8518b3ff3e9so1542229b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 17:32:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788395545; cv=none;
        d=google.com; s=arc-20260327;
        b=ABw7ci/yLtMSgkfASHPut0t4stl/lVk+RZOdHg1abspXI08ZcXiteOB1JPF3wJSlnc
         mJwdzeGvflkQfIyaekA7IrH8Bs/lIjgwjyAM+mSa/Z6XY1BPQrjSEXwiUHAALse3+6wX
         4tfFXaSohE3kwJCOmfzndTaeaGLeBrVpuK/IG+anaGJ1uMyR9p8m20bgIFr0PNWXPX0m
         bKgGHFZTPtWbuDQ1hvU3SgrtUcxGFDDYG9QxoWfEeUxP5GMv0BP6Hlwx34WMfGN+ycwG
         wb6sdKTvlMYDFFcxbP1MIn5prk4AGR3uUFwknTEj7nTuF+oz9fnNoKZKxDAAw2kdfy3f
         4WiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eFIFDsWKdpgTfW3uc7xRObLB/Ddh6TG5x2Js0xrqLKc=;
        fh=X0rHpI9AFZCw7y+De5nSL2xFYrFj8vgNrf8oIqHE61g=;
        b=EJ58nKXJxLVkyCmoxwk6cVwqAh1p/zR4aZsc6v++tau6Foq564Gnh4GXSyklLTVdq8
         L2GbHRMD61yoHWL1KzgA8ILaDhru+UAC1Hq7PEVBUXhoUmJ2NwJMyzXcecv1l9gjDQQ0
         NSCpyomqPlWO6ngnNtf+IFj8pz/sAg78AdEeuXb48qIai6rLSQ5i6zpS6lc5uGc8Ltgw
         k7h9yT2nJA8A9dWuelA1VgfXXC7x8xqLDUTSP6ZJHL5/dB3pIQ0YUsm9+H7A2O+QJfJB
         CkJKbz6yTkjadcCl9e2OUUN7pSdgKJt6Fg6NGXxFONQ4HuZCaAhpYlcjTvvg9fow1m8T
         /M+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788395545; x=1789000345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eFIFDsWKdpgTfW3uc7xRObLB/Ddh6TG5x2Js0xrqLKc=;
        b=sMCQJgx1l4gSE9dPZflOsfqlck1C6c1I/hii8qjvwjwvyn4XQiUOQH8RJPRp3uGTSM
         w1Qg4OC7vb79a0tdwOBOZSVFLn4OVTLAE/1l0/RKGC9KMHmqGaE9Yt4/+EMkiL2ZLxVO
         wU7Lma1agWykLPTlgsQ/0rAEBR0LJxGfUFtWt32uSjXALd4dsHPHQKco4GD39nElW2IC
         EDLzuDR1KJllCxpindX/QWH6cgxpPdj0wKxUjTPthTLJ/2bV+7MibOcCYP+0dLzbW76Q
         ADYoJITHK88k/FfoOc9gJza02qXVZy8RnVaazwoeH3V6G5Bd9bF+QSZvCQgoE5SOzR9o
         RpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788395545; x=1789000345;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eFIFDsWKdpgTfW3uc7xRObLB/Ddh6TG5x2Js0xrqLKc=;
        b=P9WB/49EGPOhymcXCNBHIp1d8Lceh7DWSodEydVwYgTkSUMcCZjxOZJQWwRjFAJZeP
         QNCPj120xI5EHoOnjUNt5j+NYUrXkTCJ7ZEv8S/Z1IB/l8Ck+Md+AE6BA5edzgzAWwbj
         Xj0oUmZfvDOVDFRMkVPDNlf18V7INHkqPU9VhflMwXHjcqcL+SzUMvh7GIfRqlDVlamh
         bXjvEmEcKgKZsqaaxiUXlstvP04usrE9gifH3BIDDuOQCc2Zd3UG4dH7BKdam1e3+BeW
         VphpFCuBLpgsgSYvz0OkHourM71GSHeiY4f0GT9cr9/bKm16fGNaKjPCgKgNko563nnx
         YPvw==
X-Forwarded-Encrypted: i=1; AKwUvBwq4Fvm6V0DlYhZRsgBxf7EiGgdIarc4lrOUq2lVumzp3uoJwmGthfvFCfbuy0Tj4lbB/5gFRiwJseeP7M=@vger.kernel.org
X-Gm-Message-State: AFuF++mnABowMIu5tWzXGfvoYJSPmbfDOeBsHv1GCBT3dIm4jH4767iz
	zDH1JlFjBsl1kV/rG65n9gS3jx/NK+vryy7OI8qWzJfQZTI2FQGxmQY1l+s7w6HuwrYBihRQHVn
	MkUW0W2pxLTsREPI/Z67vT7uAClV+brs=
X-Gm-Gg: AYBFou0oceoJyBxK8UNTc4eegW89WimGUGCEWm8CzSRhtHfXBUyyZcFVTTa/NIG+vQp
	8qzX5InBUykCWB7E9dG+QIzaNAeFQ+NBKp+5prFX+/Ffc6tspNmm871osRh7FL03/f5x4ORC8UF
	RcPVOUoOje4KGDjVUmdrqLwEdLA0q1QP5wU88lCEC0f2Cy/oymFPBhjHg5I5xfyN0ToNnYE4eyF
	dN30vGA2LDXbokT4C1O7Xa7lAOtTwZFPhcksGXyXadh9/NO50rYGd1FyWS1pT9TNbHyMCdKEc/0
	lAd8/kTpX6zugFVNwvAhZDXvyhUedfN/hR1wo9l4tLR4keyPiSW03s3IYGWyDh/GqN2TPnc9TsH
	BgxXFq5DipNIkbJU/U2xXByV+WQ4m2EWfEPCi
X-Received: by 2002:a05:6a00:408f:b0:857:72ba:ff0a with SMTP id
 d2e1a72fcca58-85ed3f7037amr14628468b3a.18.1788395544725; Wed, 02 Sep 2026
 17:32:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901141954.29449-1-suchitkarunakaran@gmail.com>
In-Reply-To: <20260901141954.29449-1-suchitkarunakaran@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 2 Sep 2026 17:32:11 -0700
X-Gm-Features: AcwNN1V-qWBcxzc6uVnaZe41jS2cEpg1nCoSdKsbr4-IBlSBAnW0ZGSIW3ssxGY
Message-ID: <CAEf4Bza6wQb1mSiKA_6U7FovYivcZvf3MCvU9NMdt01w-wAZPQ@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf: Fix map_lookup_percpu_elem on sparse CPU IDs
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Cc: andrii@kernel.org, ast@kernel.org, daniel@iogearbox.net, eddyz87@gmail.com, 
	memxor@gmail.com, shuah@kernel.org, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, jolsa@kernel.org, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, zhoufeng.zf@bytedance.com, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 7:20=E2=80=AFAM Suchit Karunakaran
<suchitkarunakaran@gmail.com> wrote:
>
> libbpf_num_possible_cpus() returns the number of possible CPUs, which is
> appropriate for sizing packed per-CPU map value buffers. It is not the
> upper bound for logical CPU IDs.
>
> For a possible CPU mask such as 0,2-3, the test loops over CPU IDs 0
> through 2. This incorrectly visits CPU 1 and misses CPU 3. It also
> initializes packed per-CPU slots using their slot indexes rather than
> the corresponding logical CPU IDs.
>
> Parse the possible CPU mask and keep the packed slot count separate
> from the logical CPU ID range. Populate each dense per-CPU slot with
> its logical CPU ID, calculate the corresponding expected sum, and make
> the BPF program iterate over the full CPU ID range.
>

Is this the issue you ran into in practice or it's just another of
those found by AI reading code?


> Fixes: 7aa424e02a04bba5ecc84afe9b58b16e9e0b34f8 ("selftests/bpf: Fix some=
 bugs in map_lookup_percpu_elem testcase")
>
> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> ---
>  .../bpf/prog_tests/map_lookup_percpu_elem.c   | 34 ++++++++++++++-----
>  .../bpf/progs/test_map_lookup_percpu_elem.c   |  8 ++---
>  2 files changed, 30 insertions(+), 12 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_ele=
m.c b/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_elem.c
> index bfb1bf3fd427..849f33259c00 100644
> --- a/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_elem.c
> +++ b/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_elem.c
> @@ -2,29 +2,45 @@
>  /* Copyright (c) 2022 Bytedance */
>
>  #include <test_progs.h>
> +#include "bpf/libbpf_internal.h"
>  #include "test_map_lookup_percpu_elem.skel.h"
>
>  void test_map_lookup_percpu_elem(void)
>  {
>         struct test_map_lookup_percpu_elem *skel;
> -       __u64 key =3D 0, sum;
> -       int ret, i, nr_cpus =3D libbpf_num_possible_cpus();
> +       bool *possible =3D NULL;
> +       __u64 key =3D 0, sum =3D 0;
> +       int cpu, nr_cpu_ids, nr_cpus, ret, slot =3D 0;
>         __u64 *buf;
>
> -       buf =3D malloc(nr_cpus*sizeof(__u64));
> -       if (!ASSERT_OK_PTR(buf, "malloc"))
> +       ret =3D parse_cpu_mask_file("/sys/devices/system/cpu/possible", &=
possible,
> +                                 &nr_cpu_ids);
> +       if (!ASSERT_OK(ret, "parse possible CPU mask"))
>                 return;
>
> -       for (i =3D 0; i < nr_cpus; i++)
> -               buf[i] =3D i;
> -       sum =3D (nr_cpus - 1) * nr_cpus / 2;
> +       nr_cpus =3D libbpf_num_possible_cpus();
> +       if (!ASSERT_GT(nr_cpus, 0, "libbpf_num_possible_cpus"))
> +               goto free_mask;
> +
> +       buf =3D malloc(nr_cpus * sizeof(*buf));
> +       if (!ASSERT_OK_PTR(buf, "malloc"))
> +               goto free_mask;
> +
> +       for (cpu =3D 0; cpu < nr_cpu_ids; cpu++) {
> +               if (!possible[cpu])
> +                       continue;
> +               buf[slot++] =3D cpu;
> +               sum +=3D cpu;
> +       }
> +       if (!ASSERT_EQ(slot, nr_cpus, "possible CPU mask weight"))
> +               goto exit;
>
>         skel =3D test_map_lookup_percpu_elem__open();
>         if (!ASSERT_OK_PTR(skel, "test_map_lookup_percpu_elem__open"))
>                 goto exit;
>
>         skel->rodata->my_pid =3D getpid();
> -       skel->rodata->nr_cpus =3D nr_cpus;
> +       skel->rodata->nr_cpu_ids =3D nr_cpu_ids;
>
>         ret =3D test_map_lookup_percpu_elem__load(skel);
>         if (!ASSERT_OK(ret, "test_map_lookup_percpu_elem__load"))
> @@ -55,4 +71,6 @@ void test_map_lookup_percpu_elem(void)
>         test_map_lookup_percpu_elem__destroy(skel);
>  exit:
>         free(buf);
> +free_mask:
> +       free(possible);
>  }
> diff --git a/tools/testing/selftests/bpf/progs/test_map_lookup_percpu_ele=
m.c b/tools/testing/selftests/bpf/progs/test_map_lookup_percpu_elem.c
> index ca827b1092da..d8da0696b97c 100644
> --- a/tools/testing/selftests/bpf/progs/test_map_lookup_percpu_elem.c
> +++ b/tools/testing/selftests/bpf/progs/test_map_lookup_percpu_elem.c
> @@ -7,7 +7,7 @@
>  __u64 percpu_array_elem_sum =3D 0;
>  __u64 percpu_hash_elem_sum =3D 0;
>  __u64 percpu_lru_hash_elem_sum =3D 0;
> -const volatile int nr_cpus;
> +const volatile int nr_cpu_ids;
>  const volatile int my_pid;
>
>  struct {
> @@ -57,17 +57,17 @@ int sysenter_getuid(const void *ctx)
>
>         map_ctx.map =3D &percpu_array_map;
>         map_ctx.sum =3D 0;
> -       bpf_loop(nr_cpus, read_percpu_elem_callback, &map_ctx, 0);
> +       bpf_loop(nr_cpu_ids, read_percpu_elem_callback, &map_ctx, 0);
>         percpu_array_elem_sum =3D map_ctx.sum;
>
>         map_ctx.map =3D &percpu_hash_map;
>         map_ctx.sum =3D 0;
> -       bpf_loop(nr_cpus, read_percpu_elem_callback, &map_ctx, 0);
> +       bpf_loop(nr_cpu_ids, read_percpu_elem_callback, &map_ctx, 0);
>         percpu_hash_elem_sum =3D map_ctx.sum;
>
>         map_ctx.map =3D &percpu_lru_hash_map;
>         map_ctx.sum =3D 0;
> -       bpf_loop(nr_cpus, read_percpu_elem_callback, &map_ctx, 0);
> +       bpf_loop(nr_cpu_ids, read_percpu_elem_callback, &map_ctx, 0);
>         percpu_lru_hash_elem_sum =3D map_ctx.sum;
>
>         return 0;
> --
> 2.55.0
>
