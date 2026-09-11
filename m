Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847FE41DDE1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789153793; cv=pass; b=uG02lSnrSzUp9Wf595Sq8SLIJ5GuOxwZMYHb76rWWRM3q4I3ZzH9Ky3BHHrlCvxumVYaNHfSkkSOE/Onah4953nLxwIGCY8HnXirPMwMXdHWLM0PzXvzZXL6KKFqdcHuU2zexmwzkjM6a/yjcH0pVeXTZ2R3glBoZm3jJPQBpss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789153793; c=relaxed/simple;
	bh=t68U1RhcMfyku4E1nHiQ0z7KjaiJOw8gSWlsWBs9Ulo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NfqztwAm5/DfQmXYUaS3yglaWvuqRMlksGv62BSsQIsjZq4XlKLtCVpkVPnOSlQQDK5mn+2IEBpWtv3YtVQuPZthQ3kOOx59Q0ySQhcXC9eoldilpDkUhpgiFsydPEhduFPZNHIV2wSjRM2iudVKNfHuuPwEE+TY2z6VKLaTWpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RUT96gMm; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUT96gMm"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-39682983a0fso1513164a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:09:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789153788; cv=none;
        d=google.com; s=arc-20260327;
        b=MPUg88IX3NglxpbIcBe6XxzVWA3x+jEnkod8gfOwTsMqOC64qXwre+X6CiNtxI46Uf
         F5KLJNN6kk5YbaM1mv00rv1MZuAAUEyOAe+l7apb1tkmZtqGHaOWFUJa+DjDUi89HwWJ
         yJwjSL0qBerps59Yfh7MWFl7Ih8Wl6Epk9kkSJJ35EUlAPkC19uqSHfztCL4CBLgLVm7
         iVkvcZGBmcLsyKZpOudxwYPPfpFBdRE/ySgxyS5iGXmCiB4JLiqDi1aOxaQzHVeAWkTw
         LULtKz0HjyLAq8M8xKoNgOhDZvi5cf7IMwnr+kRsafleQdE9XdFd8TWAlK+jVbxBH1OM
         ZoeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HxBnYviaKnot3JD7Ip8qV0PmKuDvoY1dcqiPFDgt9VM=;
        fh=tiEGCdcCdaEVD1k5lJzz/RmW4TrPynsKDRsnAthe9RI=;
        b=pbvP/2o0eKROcv3rb2EyCbXwywIG2OxHoA8zVGN7+lvNqt4SGZAtIz9Ungh6FIAB6x
         WY7G1N7QfgazjHveFKsdZH17Cg6oFGa8YAEk4FFMpQC8FGzqYzbpeKvtxU/lWqgPSqti
         xXpvCr/hJMcScKAFpqQhwfmGNs7PpLfhl7zoD9WzG97vq/hCU6XVa3daErsJKi9YixmT
         zhvdJaAClT5U5fzD3sqHu4jl6Bch8O1VQM7JNaz4EF8K1HYkPSHnPja/gc3mNEEwTsYg
         JikQ2fKu31SnnDQOi/dAS5nJpronij8/jlBrgXdhuSkYWzXs0lGPRSv4yp7h0I2ghtJ1
         LDsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789153788; x=1789758588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HxBnYviaKnot3JD7Ip8qV0PmKuDvoY1dcqiPFDgt9VM=;
        b=RUT96gMmrSCY25YczBpHCEJT8NY8e8gU7TMg1AMkhwZXv+iYp7pj0G8xfqw7xQ78dC
         8nKv//Sf9SZWfEEwqae5t9tFoIesfqx2VRzOlEpDJkjjd87MpzFIqf12BfYjWyjhcRnM
         SvnmJIgkbC5+ZY5BjtRCRNFUcWTKCxrgR7795LKza1eUskHSNyPVM4TogN9VBTUFogRF
         pdD8mLwKjcwQvG/846NsMLZRrVNGg3eRJdeORkmSa8RxEo5Gmc4bHIzU6S89izuG2PgU
         6GiowsjTGhjm+gBLmNu1JQjLXfP7I39j9PbUO7Ou34j2gyDc+aHQGPy0osgIvJXsKcy0
         i/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789153788; x=1789758588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HxBnYviaKnot3JD7Ip8qV0PmKuDvoY1dcqiPFDgt9VM=;
        b=HTRZ6yeUqjqaanIlx1ry4AhiwUn12JALcFhYCzSXpCquv3mxtcipxd0pirwd8sRoIf
         tSaA0nnMU4lnGuVOnSjJ2/uH1FNTEIWg/qNU8Ag3muD78bLs2KI6vc4Fy/UsV69hPNW6
         cLsDFz+COX6qUUORt4yEyeRn11A/tivXAgfWBEFWpk0Z258KOtvDTRlmA3FsFg7XF+hh
         +TB7bij8gkNoiZnRgHNC5hUqWwBzki6QPvxaz3jNspTvMoTfQZsGaH1U30J0EAbcFP9e
         P93DpoZGs54hlk4ETmjqtbkjxGQsxHuz9USAKTZzXcL5goHLeyte3uKgbgqPEf9tAKW+
         7F0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzCvbSf1s7RXleu6wLiUj3JrSlL9aXxADhLehvkMlStAbZCv6WcbpNbIq3qiAuSvFpaNlQuob+kEHkGHmw=@vger.kernel.org
X-Gm-Message-State: AFuF++lNiLYtrqGLGLOqYAwK5G70Ek3KpEg+QRPUZyt9BmjztfgGrNrP
	M6vUUp3RKBHEq35Pr20oYH3FIyqOGaNfJ+48qLPbSEeqxItJXaqgxUZakj4fBj30QntZVomvYKc
	FC7/gWpVWDfjNc3PpwJS+jmhUcxJJ6sU=
X-Gm-Gg: AYBFou2AGelqHd04aoAgCEvEqa9bXnOJhoulYU4fNBsDyL2ZhLF/moak2nn0yjur7xu
	AdwYgqCFx3tdOy2YDRFFN2j+ETp+iLJQq2meIjNkiQDoBTwPIxa9yZsOWHjtZjEcrZ2mFqy6Vlm
	GFOOJpEnT5SBKflj09WIGq03QsHmRA5Tb0ue5+jlcdw9oJYIuvl8+HmnVz71jMAsjbZHtU3hrsm
	KSrdxPJdTq7td6drSNYNM/HljUAH/kgPJFaIjKnGOtyh3jmFmXOsPqtA/sRvPRIJrnJuwswfIkg
	GTJf5X9bOcr4kOihb9pv1ZPy2JFCANXCs3HZGINUm38/p7c8gq9JRyr+7hd9A9xXMr9UvwdRcaB
	373RfiBIX4wXV54E38loDh4XaScDq+KS1LCRN43FGwkE+0L0=
X-Received: by 2002:a17:90b:2d03:b0:38e:67e1:15b with SMTP id
 98e67ed59e1d1-39d9bc3f8c8mr9089834a91.6.1789153787860; Fri, 11 Sep 2026
 12:09:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911145914.23676-1-leon.hwang@linux.dev>
In-Reply-To: <20260911145914.23676-1-leon.hwang@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 11 Sep 2026 12:09:36 -0700
X-Gm-Features: AcwNN1XpdaLHjnOIrzt8AsZjQzusOGkcm82c6vNUfKKJSZjajLO4amshejVAhjA
Message-ID: <CAEf4BzZQW2=gxMRQVtMpCF3pA2N-O6Z0o5POBzHGQG6rc3sdrQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next] bpftool: Compute map size of light skeletons at runtime
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Quentin Monnet <qmo@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 7:59=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> bpftool rounds memory-mapped data map sizes to the host page size when
> generating a light skeleton. The generated code therefore uses a 64K
> mapping size when bpftool runs on a 64K-page host, even if the skeleton
> runs on a 4K-page target. The target rejects the oversized map mmap(),
> causing failure of loading the light skeleton.
>
> When try to run 64K-page selftests on 4K-page VM, the error message does
> not provide the reason about page size.
>
>  test_atomics:PASS:atomics skeleton open 0 nsec
>  test_atomics:FAIL:atomics skeleton load unexpected error: -12 (errno 22)
>  #15      atomics:FAIL
>
> Pass the original map value size to the generated code and round it to th=
e
> runtime page size in the user-space light skeleton helpers. This keeps
> generated light skeletons independent of the build host page size.
>
> Fixes: d510296d331a ("bpftool: Use syscall/loader program in "prog load" =
and "gen skeleton" command.")
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  tools/bpf/bpftool/gen.c       | 27 ++++++++-------------------
>  tools/lib/bpf/skel_internal.h | 18 +++++++++++++-----
>  2 files changed, 21 insertions(+), 24 deletions(-)
>
> diff --git a/tools/bpf/bpftool/gen.c b/tools/bpf/bpftool/gen.c
> index a50540ef6521..77f04c28fee9 100644
> --- a/tools/bpf/bpftool/gen.c
> +++ b/tools/bpf/bpftool/gen.c
> @@ -500,16 +500,6 @@ static void print_hex(const char *data, int data_sz)
>         }
>  }
>
> -static size_t bpf_map_mmap_sz(const struct bpf_map *map)
> -{
> -       long page_sz =3D sysconf(_SC_PAGE_SIZE);
> -       size_t map_sz;
> -
> -       map_sz =3D (size_t)roundup(bpf_map__value_size(map), 8) * bpf_map=
__max_entries(map);
> -       map_sz =3D roundup(map_sz, page_sz);
> -       return map_sz;
> -}
> -
>  /* Emit type size asserts for all top-level fields in memory-mapped inte=
rnal maps. */
>  static void codegen_asserts(struct bpf_object *obj, const char *obj_name=
)
>  {
> @@ -686,8 +676,8 @@ static void codegen_destroy(struct bpf_object *obj, c=
onst char *obj_name)
>                 if (!get_map_ident(map, ident, sizeof(ident)))
>                         continue;
>                 if (is_skel_data(map, ident, sizeof(ident)))
> -                       printf("\tskel_free_map_data(skel->%1$s, skel->ma=
ps.%1$s.initial_value, %2$zu);\n",
> -                              ident, bpf_map_mmap_sz(map));
> +                       printf("\tskel_free_map_data(skel->%1$s, skel->ma=
ps.%1$s.initial_value, %2$u);\n",
> +                              ident, bpf_map__value_size(map));
>                 codegen("\
>                         \n\
>                                 skel_closenz(skel->maps.%1$s.map_fd);    =
   \n\
> @@ -771,13 +761,12 @@ static int gen_trace(struct bpf_object *obj, const =
char *obj_name, const char *h
>                 \n\
>                 \";                                                      =
   \n\
>                                                                          =
   \n\
> -                               skel->%1$s =3D (__typeof__(skel->%1$s))sk=
el_prep_map_data((void *)data, %2$zd,\n\
> -                                                               sizeof(da=
ta) - 1);\n\
> +                               skel->%1$s =3D (__typeof__(skel->%1$s))sk=
el_prep_map_data((void *)data, sizeof(data) - 1);\n\
>                                 if (!skel->%1$s)                         =
   \n\
>                                         goto cleanup;                    =
   \n\
>                                 skel->maps.%1$s.initial_value =3D (__u64)=
 (long) skel->%1$s;\n\
>                         }                                                =
   \n\
> -                       ", ident, bpf_map_mmap_sz(map));
> +                       ", ident);
>         }
>         codegen("\
>                 \n\
> @@ -871,14 +860,14 @@ static int gen_trace(struct bpf_object *obj, const =
char *obj_name, const char *h
>                 if (bpf_map__type(map) =3D=3D BPF_MAP_TYPE_PERCPU_ARRAY) =
{
>                         codegen("\
>                 \n\
> -                       err =3D skel_protect_map_data(skel->%1$s, &skel->=
maps.%1$s.initial_value, %2$zd);\n\
> +                       err =3D skel_protect_map_data(skel->%1$s, &skel->=
maps.%1$s.initial_value, %2$u);\n\
>                         if (err)                                         =
   \n\
>                                 return err;                              =
   \n\
>                 #ifdef __KERNEL__                                        =
   \n\
>                         skel->%1$s =3D NULL;                             =
     \n\
>                 #endif                                                   =
   \n\
>                         ",
> -                       ident, bpf_map_mmap_sz(map));
> +                       ident, bpf_map__value_size(map));
>                         continue;
>                 }
>
> @@ -890,11 +879,11 @@ static int gen_trace(struct bpf_object *obj, const =
char *obj_name, const char *h
>                 codegen("\
>                 \n\
>                         skel->%1$s =3D (__typeof__(skel->%1$s))skel_final=
ize_map_data(&skel->maps.%1$s.initial_value,\n\
> -                                                       %2$zd, %3$s, skel=
->maps.%1$s.map_fd);\n\
> +                                                       %2$u, %3$s, skel-=
>maps.%1$s.map_fd);\n\
>                         if (!skel->%1$s)                                 =
   \n\
>                                 return -ENOMEM;                          =
   \n\
>                         ",
> -                      ident, bpf_map_mmap_sz(map), mmap_flags);
> +                      ident, bpf_map__value_size(map), mmap_flags);
>         }
>         codegen("\
>                 \n\
> diff --git a/tools/lib/bpf/skel_internal.h b/tools/lib/bpf/skel_internal.=
h
> index 1f3f332dffbe..5787911f17f5 100644
> --- a/tools/lib/bpf/skel_internal.h
> +++ b/tools/lib/bpf/skel_internal.h
> @@ -11,6 +11,7 @@
>  #include <linux/bpf.h>
>  #else
>  #include <unistd.h>
> +#include <sys/param.h>
>  #include <sys/syscall.h>
>  #include <sys/mman.h>
>  #include <linux/keyctl.h>
> @@ -138,7 +139,7 @@ static inline void skel_free_map_data(void *p, __u64 =
addr, size_t sz)
>          */
>  }
>
> -static inline void *skel_prep_map_data(const void *val, size_t mmap_sz, =
size_t val_sz)
> +static inline void *skel_prep_map_data(const void *val, size_t val_sz)
>  {
>         void *addr;
>
> @@ -149,7 +150,7 @@ static inline void *skel_prep_map_data(const void *va=
l, size_t mmap_sz, size_t v
>         return addr;
>  }
>
> -static inline void *skel_finalize_map_data(__u64 *init_val, size_t mmap_=
sz, int flags, int fd)
> +static inline void *skel_finalize_map_data(__u64 *init_val, size_t val_s=
z, int flags, int fd)
>  {
>         struct bpf_map *map;
>         void *addr =3D NULL;
> @@ -193,13 +194,19 @@ static inline void skel_free(void *p)
>         free(p);
>  }
>
> +static inline size_t skel_map_mmap_sz(size_t sz)
> +{
> +       return roundup(sz, sysconf(_SC_PAGE_SIZE));

original code had this logic:

map_sz =3D (size_t)roundup(bpf_map__value_size(map), 8) *
bpf_map__max_entries(map);
map_sz =3D roundup(map_sz, page_sz);

you completely ignore max_entries in a new code now, which works for
global data because that have max_entires 1, but at the very least we
should add some check or assert for that so that we don't miss a case
when max_entries is not 1

pw-bot: cr

> +}
> +
>  static inline void skel_free_map_data(void *p, __u64 addr, size_t sz)
>  {
> -       munmap(p, sz);
> +       munmap(p, skel_map_mmap_sz(sz));
>  }
>
> -static inline void *skel_prep_map_data(const void *val, size_t mmap_sz, =
size_t val_sz)
> +static inline void *skel_prep_map_data(const void *val, size_t val_sz)
>  {
> +       size_t mmap_sz =3D skel_map_mmap_sz(val_sz);
>         void *addr;
>
>         addr =3D mmap(NULL, mmap_sz, PROT_READ | PROT_WRITE,
> @@ -210,8 +217,9 @@ static inline void *skel_prep_map_data(const void *va=
l, size_t mmap_sz, size_t v
>         return addr;
>  }
>
> -static inline void *skel_finalize_map_data(__u64 *init_val, size_t mmap_=
sz, int flags, int fd)
> +static inline void *skel_finalize_map_data(__u64 *init_val, size_t val_s=
z, int flags, int fd)
>  {
> +       size_t mmap_sz =3D skel_map_mmap_sz(val_sz);
>         void *addr;
>
>         addr =3D mmap((void *) (long) *init_val, mmap_sz, flags, MAP_SHAR=
ED | MAP_FIXED, fd, 0);
> --
> 2.55.0
>
