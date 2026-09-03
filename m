Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090844F30F8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788454686; cv=pass; b=B8w3sI4lAuQmgs636sURjbzM3PtZIp6vRIMr91QKfpF6fQyoAyKMg0chtxCkyWHSv1kN/KAr91nc0XPC9QUcj0bcw3LpQIaVd3KMR+Gci2O/TRGg3hWZETlDnuOFkCSPcm0hGEpp315XE09PyQoDXi6jLiyaT3ZhpemLXmtvv88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788454686; c=relaxed/simple;
	bh=5v0Q4fGhrUxAdCYXShOlUyChcpIspdM8rNBIvGy309A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hE/fW/Nveg4gjvSnNtmsE5mMB/Qzil/U8ZKPCPW+idALI6iAlcPKnKCz3vbT9jSVPd4ddFfybVqWwdhj2y65bEsAV8ZjcphDZVKnvtyW2xlrHgl7/1A1mddbHMzqOeto+auZ3YEc86oDw+J/gTrBNIIFbMYxe43rE82z2dRQsDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYLATWSd; arc=pass smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYLATWSd"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4a4cb36ae00so81251b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:58:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788454684; cv=none;
        d=google.com; s=arc-20260327;
        b=ilbM3YcknIvuiSuttVscOVv3nHthz+PWdNfVotLzH+brnF68rl18nzm/5M6kjd3v0k
         Dg6Egrh9730iWyzpaqc2vcSS00Ej7qPnG9YqOVbaWNzGuamG9NgTWqNyT6hpjMUcPSP6
         ogY5T1NFtbk7r9g8zXY3WFLgueuHve2etKzEmtOkm1+tgXAJfH6M9VHbQHg8U702ocGt
         BGEL20SlEiB5bJKu1QaVc12BlPgJaybQHIEv5OOHWC1Meb/OaWM0HpjNYYZmpMYT1/X9
         A2XJDopzUN2K+juzhYVfFJ6M4IfpizPW8dSPmA5ar8gvK8KQ+i510g1//qUTp6hNa04H
         d6ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WbMjdElnP4E9FJJPQ3RIltMQzHwm/jXwzwr8DkbwvpA=;
        fh=g4IAIprF57OZSVfqyuH1JhXyAXMhVM0OOsu2TU36r4o=;
        b=X8sup0wzPtqqSg1t50VoL0hrSKHdxUdFMrvjthP6fkwa1EkPlZrLgEfQXW6FWjwzNH
         /mr8uhGvKNLNqoMml+rlAE8IcS4n6NIATeKv592ktw7ZQ5I89tAzJ1VKbeQrpV26jVEo
         KyF8HS+AaIfINbcI0mwPAyt3qmHktibHmB6WgU4Qb0Sm8qyXHVJAM1A5F/RHJXMo6fbh
         yrFMlPrgSDWSX1LkGku0ZUKGDQDjMG50PoNdkwNW9ukuJSu0HX9sLk9AxQRBP4+AxGee
         p9UbtS1KkTogQyLeVswFESTemnpgqjLfPAxSlyMoq8gbvpJYaEiKPGvBkUskOBcO5mh8
         1F8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788454684; x=1789059484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WbMjdElnP4E9FJJPQ3RIltMQzHwm/jXwzwr8DkbwvpA=;
        b=DYLATWSdV9NyZPiBhy7yicWtHT5yu/abHB0X128fIx4cEWfYpsbGEkj55UivZEXNfc
         L79IDprDVxCHiGQns0cIN7YJzEPbDugXEYyd5wlwRXol71xyp+aCGQoWqL8ooWi4pXFP
         +fStclb1TptDamse9gcJZFCZ1Wff0h+AujlMbBALdIb2RG+x87p9gYTnbZVVtBfki+Yk
         +qvvdb5QLmnjAGkjo19Jh49hrhSBBHnARC/vkvjmIVvLAr0mDtknZtmMIa3JrHHYirMn
         ePLkzBaF/Du/WrJhh/dBUqywh85aAVIWmX/fWyoUtiNtFusyLsTjB0BWOR3Ks+Ulfv41
         pH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788454684; x=1789059484;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WbMjdElnP4E9FJJPQ3RIltMQzHwm/jXwzwr8DkbwvpA=;
        b=WBdJG/HC/Laal01oW3nHY24XuJt/WUWMyqrhnlHsTBmBZqYHdkhpYqBfS6ZuLdyxnI
         O5wYuUXc2qEju6Q3RHkMm7XXIJ1PZ9A+HXR2mLPkfu7VB1c14T7+8VdaDVDuwSFLg3ZU
         rFWUexKD7aqyTRrTFXpHTDq36IsY//Q+sPzIRItOCTtOKfY2RVu7tO8iArq9I32gXNp7
         /g0q9BBXJFQ9vXabxuryMDbgKqu5AgEEz2OZ2Nae6jtihozumqd6I9fswWY9uQtg8sKK
         iq1BosPSXCNcr97yM+kZV364q1Xsi//GbTgPlXdorN4g+vu59yEMYBP5PJJh+Cad66O0
         z3Tg==
X-Forwarded-Encrypted: i=1; AKwUvBx3qX5ZDRyTONXx/T6uRWdUBEtIRYkn+MFSTiTrYRvOg0IrY7wwdPIaRGb+tatrzL0ilgL72WaX/rGKXmU=@vger.kernel.org
X-Gm-Message-State: AFuF++me14SB5ZUgbvi7DkfnqIXt4CwU0CIbczw6MggILkB5dByV389y
	p4YjEZNI8jhivbj2WmnkH9erPb4L2LdV0e6X+qtxTQ8ByQyuNf8uT0HTpvTAnveAygiU0WudbZ2
	rRH2twM3AR44Re8SSbS3wlltdvMIX5g8=
X-Gm-Gg: AYBFou36O50xQ7L673KhgHqb+K8LoIvwy4KY0i6lLYNdx5UBtCQ9MQRC5rdQz/YuWrs
	SUj9VtysMXg+erhGu6RtFcs2B0/NASkkZ7kVqpmEc8Q38aWRPUtNmKLBLRJDmnOuvy3Q/DLULHH
	HOVoHFOj2kcu7YP2kHVy47ZG5+2dJFQ9Q3tP4IxZ2rPfRSE3E79ce7g67P1jz8i+9YqLg29PMRU
	GeGl7sEcVqBEG38tLgSO6air18z6BCmdA8+qAwYyMXPMTHfJcCROALTztnnzi6PVEXgmBByB+wn
	oE9JjD3glslXdxUS7bVqg1+P5h3SjprWSSuuHPv12dZtpM8XEnKY5BRnEs+m2X90BbrHN3AjqEg
	FGYexiTOC5ayrYw==
X-Received: by 2002:a05:6808:6808:b0:496:10e6:f76e with SMTP id
 5614622812f47-4b6bc444fb4mr13064884b6e.4.1788454683721; Thu, 03 Sep 2026
 09:58:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901141954.29449-1-suchitkarunakaran@gmail.com>
 <CAEf4Bza6wQb1mSiKA_6U7FovYivcZvf3MCvU9NMdt01w-wAZPQ@mail.gmail.com>
 <CAO9wTFiA6BHbTtP8Y8GCNnEQqXgsOzecuibK3zsjBKfyN8Nfkw@mail.gmail.com> <CAEf4BzYUREsJYXw7ZU9twCDcfEJ6cTpR4Ypbvf5JTABK0uGi2g@mail.gmail.com>
In-Reply-To: <CAEf4BzYUREsJYXw7ZU9twCDcfEJ6cTpR4Ypbvf5JTABK0uGi2g@mail.gmail.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Thu, 3 Sep 2026 22:27:51 +0530
X-Gm-Features: AcwNN1WsOO7p478pqpygOQboyXuQktY5bosuhGvq_GnaRXHWGgYlJR25dqj6rcU
Message-ID: <CAO9wTFiWkUUu5AE-C=sjwBLOxTDy6LAE-BA5oPoGCg2NmjSruA@mail.gmail.com>
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

On Thu, 3 Sept 2026 at 21:31, Andrii Nakryiko <andrii.nakryiko@gmail.com> w=
rote:
>
> On Wed, Sep 2, 2026 at 10:29=E2=80=AFPM Suchit Karunakaran
> <suchitkarunakaran@gmail.com> wrote:
> >
> > On Thu, 3 Sept 2026 at 06:02, Andrii Nakryiko <andrii.nakryiko@gmail.co=
m> wrote:
> > >
> > > On Tue, Sep 1, 2026 at 7:20=E2=80=AFAM Suchit Karunakaran
> > > <suchitkarunakaran@gmail.com> wrote:
> > > >
> > > > libbpf_num_possible_cpus() returns the number of possible CPUs, whi=
ch is
> > > > appropriate for sizing packed per-CPU map value buffers. It is not =
the
> > > > upper bound for logical CPU IDs.
> > > >
> > > > For a possible CPU mask such as 0,2-3, the test loops over CPU IDs =
0
> > > > through 2. This incorrectly visits CPU 1 and misses CPU 3. It also
> > > > initializes packed per-CPU slots using their slot indexes rather th=
an
> > > > the corresponding logical CPU IDs.
> > > >
> > > > Parse the possible CPU mask and keep the packed slot count separate
> > > > from the logical CPU ID range. Populate each dense per-CPU slot wit=
h
> > > > its logical CPU ID, calculate the corresponding expected sum, and m=
ake
> > > > the BPF program iterate over the full CPU ID range.
> > > >
> > >
> > > Is this the issue you ran into in practice or it's just another of
> > > those found by AI reading code?
> > >
> > >
> > > > Fixes: 7aa424e02a04bba5ecc84afe9b58b16e9e0b34f8 ("selftests/bpf: Fi=
x some bugs in map_lookup_percpu_elem testcase")
> > > >
> > > > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> > > > ---
> > > >  .../bpf/prog_tests/map_lookup_percpu_elem.c   | 34 ++++++++++++++-=
----
> > > >  .../bpf/progs/test_map_lookup_percpu_elem.c   |  8 ++---
> > > >  2 files changed, 30 insertions(+), 12 deletions(-)
> > > >
> > > > diff --git a/tools/testing/selftests/bpf/prog_tests/map_lookup_perc=
pu_elem.c b/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_elem.c
> > > > index bfb1bf3fd427..849f33259c00 100644
> > > > --- a/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_elem=
.c
> > > > +++ b/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_elem=
.c
> > > > @@ -2,29 +2,45 @@
> > > >  /* Copyright (c) 2022 Bytedance */
> > > >
> > > >  #include <test_progs.h>
> > > > +#include "bpf/libbpf_internal.h"
> > > >  #include "test_map_lookup_percpu_elem.skel.h"
> > > >
> > > >  void test_map_lookup_percpu_elem(void)
> > > >  {
> > > >         struct test_map_lookup_percpu_elem *skel;
> > > > -       __u64 key =3D 0, sum;
> > > > -       int ret, i, nr_cpus =3D libbpf_num_possible_cpus();
> > > > +       bool *possible =3D NULL;
> > > > +       __u64 key =3D 0, sum =3D 0;
> > > > +       int cpu, nr_cpu_ids, nr_cpus, ret, slot =3D 0;
> > > >         __u64 *buf;
> > > >
> > > > -       buf =3D malloc(nr_cpus*sizeof(__u64));
> > > > -       if (!ASSERT_OK_PTR(buf, "malloc"))
> > > > +       ret =3D parse_cpu_mask_file("/sys/devices/system/cpu/possib=
le", &possible,
> > > > +                                 &nr_cpu_ids);
> > > > +       if (!ASSERT_OK(ret, "parse possible CPU mask"))
> > > >                 return;
> > > >
> > > > -       for (i =3D 0; i < nr_cpus; i++)
> > > > -               buf[i] =3D i;
> > > > -       sum =3D (nr_cpus - 1) * nr_cpus / 2;
> > > > +       nr_cpus =3D libbpf_num_possible_cpus();
> > > > +       if (!ASSERT_GT(nr_cpus, 0, "libbpf_num_possible_cpus"))
> > > > +               goto free_mask;
> > > > +
> > > > +       buf =3D malloc(nr_cpus * sizeof(*buf));
> > > > +       if (!ASSERT_OK_PTR(buf, "malloc"))
> > > > +               goto free_mask;
> > > > +
> > > > +       for (cpu =3D 0; cpu < nr_cpu_ids; cpu++) {
> > > > +               if (!possible[cpu])
> > > > +                       continue;
> > > > +               buf[slot++] =3D cpu;
> > > > +               sum +=3D cpu;
> > > > +       }
> > > > +       if (!ASSERT_EQ(slot, nr_cpus, "possible CPU mask weight"))
> > > > +               goto exit;
> > > >
> > > >         skel =3D test_map_lookup_percpu_elem__open();
> > > >         if (!ASSERT_OK_PTR(skel, "test_map_lookup_percpu_elem__open=
"))
> > > >                 goto exit;
> > > >
> > > >         skel->rodata->my_pid =3D getpid();
> > > > -       skel->rodata->nr_cpus =3D nr_cpus;
> > > > +       skel->rodata->nr_cpu_ids =3D nr_cpu_ids;
> > > >
> > > >         ret =3D test_map_lookup_percpu_elem__load(skel);
> > > >         if (!ASSERT_OK(ret, "test_map_lookup_percpu_elem__load"))
> > > > @@ -55,4 +71,6 @@ void test_map_lookup_percpu_elem(void)
> > > >         test_map_lookup_percpu_elem__destroy(skel);
> > > >  exit:
> > > >         free(buf);
> > > > +free_mask:
> > > > +       free(possible);
> > > >  }
> > > > diff --git a/tools/testing/selftests/bpf/progs/test_map_lookup_perc=
pu_elem.c b/tools/testing/selftests/bpf/progs/test_map_lookup_percpu_elem.c
> > > > index ca827b1092da..d8da0696b97c 100644
> > > > --- a/tools/testing/selftests/bpf/progs/test_map_lookup_percpu_elem=
.c
> > > > +++ b/tools/testing/selftests/bpf/progs/test_map_lookup_percpu_elem=
.c
> > > > @@ -7,7 +7,7 @@
> > > >  __u64 percpu_array_elem_sum =3D 0;
> > > >  __u64 percpu_hash_elem_sum =3D 0;
> > > >  __u64 percpu_lru_hash_elem_sum =3D 0;
> > > > -const volatile int nr_cpus;
> > > > +const volatile int nr_cpu_ids;
> > > >  const volatile int my_pid;
> > > >
> > > >  struct {
> > > > @@ -57,17 +57,17 @@ int sysenter_getuid(const void *ctx)
> > > >
> > > >         map_ctx.map =3D &percpu_array_map;
> > > >         map_ctx.sum =3D 0;
> > > > -       bpf_loop(nr_cpus, read_percpu_elem_callback, &map_ctx, 0);
> > > > +       bpf_loop(nr_cpu_ids, read_percpu_elem_callback, &map_ctx, 0=
);
> > > >         percpu_array_elem_sum =3D map_ctx.sum;
> > > >
> > > >         map_ctx.map =3D &percpu_hash_map;
> > > >         map_ctx.sum =3D 0;
> > > > -       bpf_loop(nr_cpus, read_percpu_elem_callback, &map_ctx, 0);
> > > > +       bpf_loop(nr_cpu_ids, read_percpu_elem_callback, &map_ctx, 0=
);
> > > >         percpu_hash_elem_sum =3D map_ctx.sum;
> > > >
> > > >         map_ctx.map =3D &percpu_lru_hash_map;
> > > >         map_ctx.sum =3D 0;
> > > > -       bpf_loop(nr_cpus, read_percpu_elem_callback, &map_ctx, 0);
> > > > +       bpf_loop(nr_cpu_ids, read_percpu_elem_callback, &map_ctx, 0=
);
> > > >         percpu_lru_hash_elem_sum =3D map_ctx.sum;
> > > >
> > > >         return 0;
> > > > --
> > > > 2.55.0
> > > >
> >
> > Hi Andrii, I did use AI to find this. I often go through recent
> > commits and then ask AI to check whether the related selftests have
> > been updated and that's how I found this.
>
> in that case I'm inclined to leave selftest as is. This set up where
> possible cpu mask is not contiguous seems to be some fancy qemu-based
> setups so far, and frankly a bunch of other code is probably broken in
> such situations anyways. let's keep things as is for now
>
> pw-bot: cr

Yup got it. Thanks!
