Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF356379C28
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451321; cv=pass; b=Anh7CUgAfvA/j6Y1YduEjnYOsC+qYLZ7ZigCej67O+7FXJ+RYhP5r+yH1R5Ti9L8pcmPotW/jOqKhjUAj6uaHn4bEsB86c+ssecXkoFosDRXCuU0g7MIBAYwVVrYvMsHTsgp/oh50bHhjmN06qj2mfa3ptsfAa1B7YsauawIbqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451321; c=relaxed/simple;
	bh=UQJOARb0hjrrxZqoI8tPjCF4BNxBhRids7cJ/ZQHpwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YncCA3kb+qd5YVUeyc9vZwLXHNA5jMWlbPiEPVZ/xeNenQKBF0a84zPNPt8zuTgqee9d1zaDLEjONhP9TRJInT37LPM8VcNiPj8/2tgolZ62FOlw7y/V1OWkSPdcoUaw8bD3eqdeLAPUYWnnzZLixvRActcPgz51MhyDak1+ak0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcKO8RvH; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcKO8RvH"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398e9698a70so2501797a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788451318; cv=none;
        d=google.com; s=arc-20260327;
        b=lsMlRZ8bSdAa5R3NkUUQsohnZqxRUnuTM+ywk1z3lqKvvNuyzubvBFtdy3Y2MskhU0
         T5ka5PT0gaS6JQjZvRFe5wjmtT4ajOBPav+M7zrqhH81mIYnQPemZ8OjBtmObvz9hH/b
         91zKXJhOvARz01TGHcL7eKCrQQ7KfVQ18tYYDZ5d05Cxj2f3duV9L6sfHRF8YxWCtPSE
         Krwy18Gc9C2uhQVjczt4rkY3w10LDc31wrCC/VkDO3l1ihjL2lMH0ArSEUpY5W5OU6R4
         0m4gcq2w+TyTKGQZ5cnTu6jKr4vZpmcAV/TbA5tFLixflT4ugaEwZoGU2TsVGPYhDRwN
         qg2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ym1m2s7k69osu4j9IQLOfbeC7FHjlBRmEp9KBHwH/xs=;
        fh=pSZ/seAXIIGf/B9WuisV65jaov6j+l3tDSzHS0qONQo=;
        b=Y5bDtjJ1rWsrUOZ5MszwmYG2wtlIXwWyHC0jlpuG94FyzHGKKH+4DudP1bYstEPFbs
         FG8JlVYxlk6AifmkQ8qURce8gbsw2BLYlZHnDugYTCJpFGKTbpgbSsn+Awk8BoG8wAIA
         jIrXbytUPq0V3ueFh6Lcl1m975Ih9D23f+dcx6jeubUczGM66vIZZxfrvgdYeO2I5Jf4
         j43v8grnZMXKZf7xFe7BmxDTi+O14+N+K1Es1bZGMDP+0Kolx+ZptKis5fyjuiwvyHrw
         /A9fOu4dY+9o778tC4Hvg7wgUAE25/onCAUmDjhiKryD0m/1bS6dJgGSc5uMDE+RyQwI
         dK5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788451318; x=1789056118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ym1m2s7k69osu4j9IQLOfbeC7FHjlBRmEp9KBHwH/xs=;
        b=QcKO8RvHQGNSBO4XH9NFw14lgD5LLJ9cqH9uZVbdQAsFQmxaI/jCa2U6TmEXrQ17CH
         CzwapOwJkhuwTuM1M3K919HKi+hI2Ji4SjnvUlvnWN3bdanuxVwxMvhPnkkpIFgevkGI
         OxUTMsbBAmM/CkpIFI8A04zMLq6z9VJkUdsq+hCG8V6eHJmwV1zCD3+7atNWI+1SjZgo
         aFTWsavhDTZUXTfUlPNjyFTQ2QXOZ9HYWX30BbfNTgg9mErIw935Sl2ly1aK2DvZKDqv
         8AZe2a7u5J370QeeYwuKLc5YGL71pfeflZtGW76PudJYZdG1vM7ZWOpcSNpDwxip67+W
         hXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788451318; x=1789056118;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ym1m2s7k69osu4j9IQLOfbeC7FHjlBRmEp9KBHwH/xs=;
        b=FD/RPPuJ6ZxMC1cgm+AQ2eee543OZ90IoCIzyrO5HHakkJB3PzC2CKHIlapI9VYh7M
         0M0OEOaSEESEQXQqZyro04iii9yFBr3m8FqFgaPHPQ6n2R9UMI9xLmRPDliEdYahyZOW
         28yTgnph5dQCroGoJzXLks5MSVPN5EcyZ64yWKzkyRvltDIveGYgYXfc+hTPT730u0GO
         V8BTJae9rsDIHzcIisDY5h5SSVzABY++RAU5UM3XAtMOuvhHSGFW4Sv9zrdiiSO7zxq/
         bfwDUHhRSRDvKnbIzXie2HLsClHmarPi4pri7Dlrf00zgQGNDBqLce6WxP62QbY7cbC4
         If6g==
X-Forwarded-Encrypted: i=1; AKwUvByS4wiWyn0pXCs9VHzu+/urY3d17aJwQFfoCi+U60TieCwXuSDHfjF32GvqvxjSSnWYYqvWtVZQJBaaKiY=@vger.kernel.org
X-Gm-Message-State: AFuF++knJPH15j73h4b5GOU4E8YDEH34vVkbSkTESWDebjjTrnEN728j
	0dUfz67laM9IiwbTjB6C1yMorRUzuuWLKHlVQUK870wBVPUWP4cD0uXd2y81vBO6VYrNNJDeCCO
	6Vw3KhxTOhXEmfdGYvxUSTEwb/XnBQ8w=
X-Gm-Gg: AYBFou26wK3+0+fczVj2GraSnxnhWZ/r8xErh8xMiz69KvOGH5kM4h6ql9uMKuFYFJB
	rhRQVIuPhvn31e7wrTAjbdyaxk8hd1+/hJ/xMPXXDnL/E1+S8+AzKR8RS/67gFNwbt4U4RO9lI9
	9yE6cxUPlMhju5d9HhfX8vIltCgK+uMeujGCiFAbBWlZ9d5sjSx6i3AntJwvgCQZIQAO6yYRTX9
	SIDEo/uvA6GJiDP6geP9IJBSkBwjQbZF+PGeG+CHMnrWsaKk414XYAYJZ9uU1U/GQJaaSzXfg0m
	wYtMwqF1E6LNpVY7krlgMgzwG5tyYaoFpfFoJEDH6pGkidSD+IjSVEa+B1mXGxFpbA8uFhmvpOb
	O16ZKTK42d0GSFhFdkBUzJ/32MffOcgHslcPA5GoKpA==
X-Received: by 2002:a17:90b:2ec8:b0:398:9bd1:3216 with SMTP id
 98e67ed59e1d1-39b22fd5e8amr936066a91.23.1788451316207; Thu, 03 Sep 2026
 09:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901141954.29449-1-suchitkarunakaran@gmail.com>
 <CAEf4Bza6wQb1mSiKA_6U7FovYivcZvf3MCvU9NMdt01w-wAZPQ@mail.gmail.com> <CAO9wTFiA6BHbTtP8Y8GCNnEQqXgsOzecuibK3zsjBKfyN8Nfkw@mail.gmail.com>
In-Reply-To: <CAO9wTFiA6BHbTtP8Y8GCNnEQqXgsOzecuibK3zsjBKfyN8Nfkw@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 3 Sep 2026 09:01:41 -0700
X-Gm-Features: AcwNN1X-YqQqjC61b-JrUTGMCYd0EnTSl9FqXJbSPoltToJP7INN2w4pWDyVNgo
Message-ID: <CAEf4BzYUREsJYXw7ZU9twCDcfEJ6cTpR4Ypbvf5JTABK0uGi2g@mail.gmail.com>
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

On Wed, Sep 2, 2026 at 10:29=E2=80=AFPM Suchit Karunakaran
<suchitkarunakaran@gmail.com> wrote:
>
> On Thu, 3 Sept 2026 at 06:02, Andrii Nakryiko <andrii.nakryiko@gmail.com>=
 wrote:
> >
> > On Tue, Sep 1, 2026 at 7:20=E2=80=AFAM Suchit Karunakaran
> > <suchitkarunakaran@gmail.com> wrote:
> > >
> > > libbpf_num_possible_cpus() returns the number of possible CPUs, which=
 is
> > > appropriate for sizing packed per-CPU map value buffers. It is not th=
e
> > > upper bound for logical CPU IDs.
> > >
> > > For a possible CPU mask such as 0,2-3, the test loops over CPU IDs 0
> > > through 2. This incorrectly visits CPU 1 and misses CPU 3. It also
> > > initializes packed per-CPU slots using their slot indexes rather than
> > > the corresponding logical CPU IDs.
> > >
> > > Parse the possible CPU mask and keep the packed slot count separate
> > > from the logical CPU ID range. Populate each dense per-CPU slot with
> > > its logical CPU ID, calculate the corresponding expected sum, and mak=
e
> > > the BPF program iterate over the full CPU ID range.
> > >
> >
> > Is this the issue you ran into in practice or it's just another of
> > those found by AI reading code?
> >
> >
> > > Fixes: 7aa424e02a04bba5ecc84afe9b58b16e9e0b34f8 ("selftests/bpf: Fix =
some bugs in map_lookup_percpu_elem testcase")
> > >
> > > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> > > ---
> > >  .../bpf/prog_tests/map_lookup_percpu_elem.c   | 34 ++++++++++++++---=
--
> > >  .../bpf/progs/test_map_lookup_percpu_elem.c   |  8 ++---
> > >  2 files changed, 30 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu=
_elem.c b/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_elem.c
> > > index bfb1bf3fd427..849f33259c00 100644
> > > --- a/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_elem.c
> > > +++ b/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_elem.c
> > > @@ -2,29 +2,45 @@
> > >  /* Copyright (c) 2022 Bytedance */
> > >
> > >  #include <test_progs.h>
> > > +#include "bpf/libbpf_internal.h"
> > >  #include "test_map_lookup_percpu_elem.skel.h"
> > >
> > >  void test_map_lookup_percpu_elem(void)
> > >  {
> > >         struct test_map_lookup_percpu_elem *skel;
> > > -       __u64 key =3D 0, sum;
> > > -       int ret, i, nr_cpus =3D libbpf_num_possible_cpus();
> > > +       bool *possible =3D NULL;
> > > +       __u64 key =3D 0, sum =3D 0;
> > > +       int cpu, nr_cpu_ids, nr_cpus, ret, slot =3D 0;
> > >         __u64 *buf;
> > >
> > > -       buf =3D malloc(nr_cpus*sizeof(__u64));
> > > -       if (!ASSERT_OK_PTR(buf, "malloc"))
> > > +       ret =3D parse_cpu_mask_file("/sys/devices/system/cpu/possible=
", &possible,
> > > +                                 &nr_cpu_ids);
> > > +       if (!ASSERT_OK(ret, "parse possible CPU mask"))
> > >                 return;
> > >
> > > -       for (i =3D 0; i < nr_cpus; i++)
> > > -               buf[i] =3D i;
> > > -       sum =3D (nr_cpus - 1) * nr_cpus / 2;
> > > +       nr_cpus =3D libbpf_num_possible_cpus();
> > > +       if (!ASSERT_GT(nr_cpus, 0, "libbpf_num_possible_cpus"))
> > > +               goto free_mask;
> > > +
> > > +       buf =3D malloc(nr_cpus * sizeof(*buf));
> > > +       if (!ASSERT_OK_PTR(buf, "malloc"))
> > > +               goto free_mask;
> > > +
> > > +       for (cpu =3D 0; cpu < nr_cpu_ids; cpu++) {
> > > +               if (!possible[cpu])
> > > +                       continue;
> > > +               buf[slot++] =3D cpu;
> > > +               sum +=3D cpu;
> > > +       }
> > > +       if (!ASSERT_EQ(slot, nr_cpus, "possible CPU mask weight"))
> > > +               goto exit;
> > >
> > >         skel =3D test_map_lookup_percpu_elem__open();
> > >         if (!ASSERT_OK_PTR(skel, "test_map_lookup_percpu_elem__open")=
)
> > >                 goto exit;
> > >
> > >         skel->rodata->my_pid =3D getpid();
> > > -       skel->rodata->nr_cpus =3D nr_cpus;
> > > +       skel->rodata->nr_cpu_ids =3D nr_cpu_ids;
> > >
> > >         ret =3D test_map_lookup_percpu_elem__load(skel);
> > >         if (!ASSERT_OK(ret, "test_map_lookup_percpu_elem__load"))
> > > @@ -55,4 +71,6 @@ void test_map_lookup_percpu_elem(void)
> > >         test_map_lookup_percpu_elem__destroy(skel);
> > >  exit:
> > >         free(buf);
> > > +free_mask:
> > > +       free(possible);
> > >  }
> > > diff --git a/tools/testing/selftests/bpf/progs/test_map_lookup_percpu=
_elem.c b/tools/testing/selftests/bpf/progs/test_map_lookup_percpu_elem.c
> > > index ca827b1092da..d8da0696b97c 100644
> > > --- a/tools/testing/selftests/bpf/progs/test_map_lookup_percpu_elem.c
> > > +++ b/tools/testing/selftests/bpf/progs/test_map_lookup_percpu_elem.c
> > > @@ -7,7 +7,7 @@
> > >  __u64 percpu_array_elem_sum =3D 0;
> > >  __u64 percpu_hash_elem_sum =3D 0;
> > >  __u64 percpu_lru_hash_elem_sum =3D 0;
> > > -const volatile int nr_cpus;
> > > +const volatile int nr_cpu_ids;
> > >  const volatile int my_pid;
> > >
> > >  struct {
> > > @@ -57,17 +57,17 @@ int sysenter_getuid(const void *ctx)
> > >
> > >         map_ctx.map =3D &percpu_array_map;
> > >         map_ctx.sum =3D 0;
> > > -       bpf_loop(nr_cpus, read_percpu_elem_callback, &map_ctx, 0);
> > > +       bpf_loop(nr_cpu_ids, read_percpu_elem_callback, &map_ctx, 0);
> > >         percpu_array_elem_sum =3D map_ctx.sum;
> > >
> > >         map_ctx.map =3D &percpu_hash_map;
> > >         map_ctx.sum =3D 0;
> > > -       bpf_loop(nr_cpus, read_percpu_elem_callback, &map_ctx, 0);
> > > +       bpf_loop(nr_cpu_ids, read_percpu_elem_callback, &map_ctx, 0);
> > >         percpu_hash_elem_sum =3D map_ctx.sum;
> > >
> > >         map_ctx.map =3D &percpu_lru_hash_map;
> > >         map_ctx.sum =3D 0;
> > > -       bpf_loop(nr_cpus, read_percpu_elem_callback, &map_ctx, 0);
> > > +       bpf_loop(nr_cpu_ids, read_percpu_elem_callback, &map_ctx, 0);
> > >         percpu_lru_hash_elem_sum =3D map_ctx.sum;
> > >
> > >         return 0;
> > > --
> > > 2.55.0
> > >
>
> Hi Andrii, I did use AI to find this. I often go through recent
> commits and then ask AI to check whether the related selftests have
> been updated and that's how I found this.

in that case I'm inclined to leave selftest as is. This set up where
possible cpu mask is not contiguous seems to be some fancy qemu-based
setups so far, and frankly a bunch of other code is probably broken in
such situations anyways. let's keep things as is for now

pw-bot: cr
