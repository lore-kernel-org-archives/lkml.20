Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D565E332EBB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788413361; cv=pass; b=iNjaoA+YklQ3/LCbkZz//eWlyIfP36RIrCbI0NQ7z91LQDkCwIPyOvUnQbR4VoOeNEGfWXlf4cxMhPhgxbBiWy2cG2HF3tcqtHYT2CJI5LlA/aTk7efSTAv69tWxZRqTZG4fbP9DfZ7BZImHO0VnxTHsvZtOk7QbBBe9PkhPaTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788413361; c=relaxed/simple;
	bh=xTw/AKqw9lQ3vl5u8L3lQjNutmW6u2P0Ksxmef5zCDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l3ZFTjj1/t8F5mOwM2kVIUJMGr3g3m6iDGTziHjozh6dwKcgIobbSbBxTCdqdvTK7ConOOKyyBG29RyEmFmvwN9YIZ/HFSk4G0vy+xvkgzQf6hk2tWaNqH4sCd/uv3WGvBswUOc9MspMN8XA6jz8/ytEzsW0ld4gpcwwdeBS/tQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o/tnk8th; arc=pass smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o/tnk8th"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-495c49f8eccso1401814b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788413358; cv=none;
        d=google.com; s=arc-20260327;
        b=gF1Q4IL18GauDS8q+IM9wQ3J1Ra6ucC7lUAKhozNT3LXTnWPDCvTbmkP/S4VAobsor
         CYiV/btBhcZ1TNxhINTZzUfdM+53yjBsqJHaHQ9ejXaPwJnPpoQhfv9muFcZx4a/o3D3
         jQm3mpZg1VZTXyB8ACTsnVx710OpiA5RCjzx7FqWuHYifrECCyalm5FHYtc3OPyXK5Ru
         9ZBd2PwAlsmqZ2+XTtFAR45PhG7YEyb8owrTCh9gZ9MSkPdsrqOE5dckrCWPPgMpt2La
         CTMovQXlboKN+BcbmE8pmKCaqqn5jSTpTGlVh3Rb7t44LOOge2huLic7XZEqEfN89kG3
         Dlug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eaizby62g8UPtzxLcn0sE8bIasG1h+ypC0y8Ds7psy0=;
        fh=DYeeGbUeyoo66eIWa/Qb/WROm0uVt79GCZ/G8EbYm1g=;
        b=JWfR7Yo0sXBInU2nZoZ9M0Rl98gvdxDpwQeBvp1WzolqxmQBwHdPcKl3FKRWa4H695
         nxu1BtJS8wAjUY0sDfGMlYJ0R7dt3i4RUO2HqqqCQaZ4GNRUC9L9uuzvqUxdMDwIE34H
         x2gCesWp4yTZshJe61mFLKuPcEA9Er2N3btsqNsrZOg3N7K6MdJUe8fCtlE4R439Nr/r
         P8j/Rlu8Y+45lwA9wovBb2GkqK6x0HoMb3+Xymo02u+ZKcFyzLY1S6Jrf5A5KVIIvmO4
         xFtSL6LdOgDfj/BITZVnTFafZma+zRgWTptG2nB/elao0ot0RhFqCYvW6ab3ZgIEdLIC
         VOIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788413358; x=1789018158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eaizby62g8UPtzxLcn0sE8bIasG1h+ypC0y8Ds7psy0=;
        b=o/tnk8thVHfmcePzQtFrZbcRfLWQXjTRIYiodu+SIM2TMudGnhsNF9V+Kq2/KIM54P
         qt3zPpE0pEZeq5Jq9qnORW/B6t9/ltHPx0ZE1K2wk2a5VwVDkhxvauPyt0OvI9sG8bvw
         UBqozdqocynp/tKLSQNqSuvSC43kHJAfr8P6i+9Sc1+/EjVBQXxxLrdaXHs76ZvGcCx/
         w82LD9p6fMKLrfNG1IyaycTVWORqU1apqkCTPdIfcVpiPdUMVTrRAiec892+1ZTfXoQi
         j/cCxv5jjx8sa1PjV8KaOEh9PGF6cmfiGcuBSJqh3dbxQIoqzat7aC+JA+XcDX/VIHBZ
         ti/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788413358; x=1789018158;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eaizby62g8UPtzxLcn0sE8bIasG1h+ypC0y8Ds7psy0=;
        b=UWmedOuTKpzsLRFpCqS3QhrBD42mUIEjtIuk4dC1ccTfNcSx9wwMRmWJhqfq0gFGCI
         jehndrHS07O8krr3bT02O3R7rubeBpkedDdo5Rtr6dP9rz7ovhrtTGgIOieaJtfDZORw
         3jubIhakGJRNv1tCOw+diV4v8ivgxs8XHh7TWZbiqhId/7ozPmryAr+8+s8DbjR5CKWx
         84nW21wmU88X7Gd4DEAkzj74j+45a06qQWFA780jod1yaOQc39560RULFUIt8VePt1rC
         ShzlQQ1d+7z/fXX0AgW+BmZuuna7g4dcDvhzlTnnCDO917WI0MHBTFPCIHguPLBPC/Ar
         +XEg==
X-Forwarded-Encrypted: i=1; AKwUvByiE6dFvXI6CWWapRs4owI44VYltX6F5UtIq/OMWB49l4HNsFU8JYkLLCdDkp57R70wqYXIuEqWyZ2loaY=@vger.kernel.org
X-Gm-Message-State: AFuF++kJ4cwbvUyLeZ2bILcBBnEgNtDmIg/cCjNMIJ76aUdlgLhDEPue
	OJ7BvGzAdBFQLbac0rw1X0EdfGzdlnLPE3RXdW0jppsIlauZp1fmpS8sob4TX31yy39aQoPdmrC
	iLkhd+YtZpTrqM+e6VF09MGQhMLuyhjw=
X-Gm-Gg: AYBFou0/YpEhhttda0OVBWGEiOqZcQ0+NyHTZEeHGaL4TRb+p6q3OgV/iJcOEPG4fEI
	HMyKgu0MPMnRRZeNG7nhRHj6nvT9/Cd5jwY2XrtXOCOg469STqJidu7jWwY0Mo+e/U1dJAtRgJR
	m5eduxh6vCsRik/Rzn/BeSMqTwwA+2c+nJbaJ4WOHwVJZ3gZzVwpMhWzN9QY70hyYiwoJGiluNq
	cl6VHm42TbDHRf9wYIFJRi5SxFiYVK6BU52JP7jNreZXhEliKtxvsLeruB2wGOEGBiENYV9vTzg
	s6UZ7nLYVcvO39gVE7sb5GakEBZ7gtPVPy0WU0CxkvDFKY7d2xdwznkngHFQMMxerHxWRhRUXGL
	+3EnUKsp9PA==
X-Received: by 2002:a05:6808:c1e3:b0:4b3:3e1:4a25 with SMTP id
 5614622812f47-4b6beb4a5c1mr9010080b6e.11.1788413357610; Wed, 02 Sep 2026
 22:29:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901141954.29449-1-suchitkarunakaran@gmail.com> <CAEf4Bza6wQb1mSiKA_6U7FovYivcZvf3MCvU9NMdt01w-wAZPQ@mail.gmail.com>
In-Reply-To: <CAEf4Bza6wQb1mSiKA_6U7FovYivcZvf3MCvU9NMdt01w-wAZPQ@mail.gmail.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Thu, 3 Sep 2026 10:59:06 +0530
X-Gm-Features: AcwNN1Vj42vaxl6KZiy5Wu478IV--ErhxAsq2YiX6zyNT3u27g3E8SGExrefwB4
Message-ID: <CAO9wTFiA6BHbTtP8Y8GCNnEQqXgsOzecuibK3zsjBKfyN8Nfkw@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf: Fix map_lookup_percpu_elem on sparse CPU IDs
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: andrii@kernel.org, ast@kernel.org, daniel@iogearbox.net, eddyz87@gmail.com, 
	memxor@gmail.com, shuah@kernel.org, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, jolsa@kernel.org, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, zhoufeng.zf@bytedance.com, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 3 Sept 2026 at 06:02, Andrii Nakryiko <andrii.nakryiko@gmail.com> w=
rote:
>
> On Tue, Sep 1, 2026 at 7:20=E2=80=AFAM Suchit Karunakaran
> <suchitkarunakaran@gmail.com> wrote:
> >
> > libbpf_num_possible_cpus() returns the number of possible CPUs, which i=
s
> > appropriate for sizing packed per-CPU map value buffers. It is not the
> > upper bound for logical CPU IDs.
> >
> > For a possible CPU mask such as 0,2-3, the test loops over CPU IDs 0
> > through 2. This incorrectly visits CPU 1 and misses CPU 3. It also
> > initializes packed per-CPU slots using their slot indexes rather than
> > the corresponding logical CPU IDs.
> >
> > Parse the possible CPU mask and keep the packed slot count separate
> > from the logical CPU ID range. Populate each dense per-CPU slot with
> > its logical CPU ID, calculate the corresponding expected sum, and make
> > the BPF program iterate over the full CPU ID range.
> >
>
> Is this the issue you ran into in practice or it's just another of
> those found by AI reading code?
>
>
> > Fixes: 7aa424e02a04bba5ecc84afe9b58b16e9e0b34f8 ("selftests/bpf: Fix so=
me bugs in map_lookup_percpu_elem testcase")
> >
> > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> > ---
> >  .../bpf/prog_tests/map_lookup_percpu_elem.c   | 34 ++++++++++++++-----
> >  .../bpf/progs/test_map_lookup_percpu_elem.c   |  8 ++---
> >  2 files changed, 30 insertions(+), 12 deletions(-)
> >
> > diff --git a/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_e=
lem.c b/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_elem.c
> > index bfb1bf3fd427..849f33259c00 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_elem.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_elem.c
> > @@ -2,29 +2,45 @@
> >  /* Copyright (c) 2022 Bytedance */
> >
> >  #include <test_progs.h>
> > +#include "bpf/libbpf_internal.h"
> >  #include "test_map_lookup_percpu_elem.skel.h"
> >
> >  void test_map_lookup_percpu_elem(void)
> >  {
> >         struct test_map_lookup_percpu_elem *skel;
> > -       __u64 key =3D 0, sum;
> > -       int ret, i, nr_cpus =3D libbpf_num_possible_cpus();
> > +       bool *possible =3D NULL;
> > +       __u64 key =3D 0, sum =3D 0;
> > +       int cpu, nr_cpu_ids, nr_cpus, ret, slot =3D 0;
> >         __u64 *buf;
> >
> > -       buf =3D malloc(nr_cpus*sizeof(__u64));
> > -       if (!ASSERT_OK_PTR(buf, "malloc"))
> > +       ret =3D parse_cpu_mask_file("/sys/devices/system/cpu/possible",=
 &possible,
> > +                                 &nr_cpu_ids);
> > +       if (!ASSERT_OK(ret, "parse possible CPU mask"))
> >                 return;
> >
> > -       for (i =3D 0; i < nr_cpus; i++)
> > -               buf[i] =3D i;
> > -       sum =3D (nr_cpus - 1) * nr_cpus / 2;
> > +       nr_cpus =3D libbpf_num_possible_cpus();
> > +       if (!ASSERT_GT(nr_cpus, 0, "libbpf_num_possible_cpus"))
> > +               goto free_mask;
> > +
> > +       buf =3D malloc(nr_cpus * sizeof(*buf));
> > +       if (!ASSERT_OK_PTR(buf, "malloc"))
> > +               goto free_mask;
> > +
> > +       for (cpu =3D 0; cpu < nr_cpu_ids; cpu++) {
> > +               if (!possible[cpu])
> > +                       continue;
> > +               buf[slot++] =3D cpu;
> > +               sum +=3D cpu;
> > +       }
> > +       if (!ASSERT_EQ(slot, nr_cpus, "possible CPU mask weight"))
> > +               goto exit;
> >
> >         skel =3D test_map_lookup_percpu_elem__open();
> >         if (!ASSERT_OK_PTR(skel, "test_map_lookup_percpu_elem__open"))
> >                 goto exit;
> >
> >         skel->rodata->my_pid =3D getpid();
> > -       skel->rodata->nr_cpus =3D nr_cpus;
> > +       skel->rodata->nr_cpu_ids =3D nr_cpu_ids;
> >
> >         ret =3D test_map_lookup_percpu_elem__load(skel);
> >         if (!ASSERT_OK(ret, "test_map_lookup_percpu_elem__load"))
> > @@ -55,4 +71,6 @@ void test_map_lookup_percpu_elem(void)
> >         test_map_lookup_percpu_elem__destroy(skel);
> >  exit:
> >         free(buf);
> > +free_mask:
> > +       free(possible);
> >  }
> > diff --git a/tools/testing/selftests/bpf/progs/test_map_lookup_percpu_e=
lem.c b/tools/testing/selftests/bpf/progs/test_map_lookup_percpu_elem.c
> > index ca827b1092da..d8da0696b97c 100644
> > --- a/tools/testing/selftests/bpf/progs/test_map_lookup_percpu_elem.c
> > +++ b/tools/testing/selftests/bpf/progs/test_map_lookup_percpu_elem.c
> > @@ -7,7 +7,7 @@
> >  __u64 percpu_array_elem_sum =3D 0;
> >  __u64 percpu_hash_elem_sum =3D 0;
> >  __u64 percpu_lru_hash_elem_sum =3D 0;
> > -const volatile int nr_cpus;
> > +const volatile int nr_cpu_ids;
> >  const volatile int my_pid;
> >
> >  struct {
> > @@ -57,17 +57,17 @@ int sysenter_getuid(const void *ctx)
> >
> >         map_ctx.map =3D &percpu_array_map;
> >         map_ctx.sum =3D 0;
> > -       bpf_loop(nr_cpus, read_percpu_elem_callback, &map_ctx, 0);
> > +       bpf_loop(nr_cpu_ids, read_percpu_elem_callback, &map_ctx, 0);
> >         percpu_array_elem_sum =3D map_ctx.sum;
> >
> >         map_ctx.map =3D &percpu_hash_map;
> >         map_ctx.sum =3D 0;
> > -       bpf_loop(nr_cpus, read_percpu_elem_callback, &map_ctx, 0);
> > +       bpf_loop(nr_cpu_ids, read_percpu_elem_callback, &map_ctx, 0);
> >         percpu_hash_elem_sum =3D map_ctx.sum;
> >
> >         map_ctx.map =3D &percpu_lru_hash_map;
> >         map_ctx.sum =3D 0;
> > -       bpf_loop(nr_cpus, read_percpu_elem_callback, &map_ctx, 0);
> > +       bpf_loop(nr_cpu_ids, read_percpu_elem_callback, &map_ctx, 0);
> >         percpu_lru_hash_elem_sum =3D map_ctx.sum;
> >
> >         return 0;
> > --
> > 2.55.0
> >

Hi Andrii, I did use AI to find this. I often go through recent
commits and then ask AI to check whether the related selftests have
been updated and that's how I found this.
