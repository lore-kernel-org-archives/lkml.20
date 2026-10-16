Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6388749BB4E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176947; cv=pass; b=dRQT/6GQJBgLzXpHXRrM57YARJPbWco4hDaeXMQLkTfMAwskV/7xwhbJbRxISZskpZNZszGsimZigMDD9dkQb/zPPu25sfGkEtkOYijSsZnD94yWYhQwIGCoHwBfBjnuBqh0k9smkstY1tjgYcU8DkNfiNNM0+9MnX5wncsUur0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176947; c=relaxed/simple;
	bh=1b3l1S2U0IeSv/QvOzf8c5X71ocbK46nZ4fIx0EPyIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SGk3BGRrVJD22ebU8Dn6tyPYR+rsIme+frxs7fQIWZFiX2+bUrF0VHBNeNvy6HJdN54gkuEta0tGQUpozgRUJPx+1+lztyw0055dDQj5O5havBZCAB9tYsYGn+/DmWsLPh6GXCIWKal2CO2PUWvBgJy9M95Tepn6RyL/AcEPZmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=olf1foT+; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="olf1foT+"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so308863a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:55:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792176944; cv=none;
        d=google.com; s=arc-20260327;
        b=o79t8dQuwwi1upZutXPqixoFBV3GJX5+HHcK4k/d7sbKD2IBUPkoqTst/JCMmk1BYq
         4hxyBIyM4VOlEEBTyc/bfTtC9e5FSYVKt6q9Z6zm5bFEJgUXALVGdQuBAqVwF6od6DMb
         qOM3QZBylC7wih8TAouqyObPkY+gi5npXGYa2vhJEjs8wRNegx9tbbsXOsoNPgstjLqS
         MhCC22zspmED4/xwFFWUCLbHX/eZ1CVqsQvDqGX9OMCGM2KRCmv+NSnawATUUIrXhMh8
         09soxBLeuQeN9LnSqVabApfACVBh1EP+3tCKWPJCQn17C/qZm/ndtPvr2SrEeBQ9B/zW
         Zfhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e+xIg4uo6CKkH27g0w/i7+r2VZ1i9gtFiDMjRJWV7+k=;
        fh=EjxuQIOicHgn7KJLDe9jknEUsiDztP2sdxyS95DrUZk=;
        b=JzpmeDMEAWHhQ1AkTSnqFzWrZz7cEQJTcc/oA0fWtDjzogaHe+z3D/5UE+ksE6py3G
         m1TwZCgplCjg3UkAYXv7+C1ZHYVBhAKAOXFfUV+G0vQJyCBKMD9sM+kGY2Ejrj47W0+f
         2T4kyrvFlS1rte3Cqg3ukT3DoG+hQkdMAOhU9yF1lzcthqb+da0BlMH8uFBXNG7fCiyA
         513cOMSH+onnOpxKqcOyZFPcJyYfgDbHdmyfCRVRNWkZxaf8vJqoNJVT71G8XM4Vu7gA
         Rb/pP8aRwk6nLE21iwc0xrlsGVy+6G/2y5Cb4THGJ1z5Kr3Znx8fmlVhCx4BTZs0OcvK
         d/Dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792176944; x=1792781744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e+xIg4uo6CKkH27g0w/i7+r2VZ1i9gtFiDMjRJWV7+k=;
        b=olf1foT+TM6UUCwOOd74yhoOs2/kgUsN7hJjPVSCx4RPPrb1dheKgJ64MurKat7v+9
         GELPwyss3NwjxTOQ417YSQTqxc145wo7gm4icZo7S5sazTuoqiU0ynpHgfHs44w2Ikqz
         KX84I7DVrxBelOM288VBP3M7VFZ1sLEnBnq38WQrd/1Un1Z4XU/xHrJvYyYWNaNVB/nU
         U7DOYYYpd4xkFbobHgQcZz2bFIsaWE4pqs+niFa4K0cnhqQJxH1r1jC3lYtI6fgk4o2/
         yGCAa6k+sjsg4wk6C1l63uEgZdiTJiW74qInfZoI8ACuAKWbykvcVIUv9Kx21ksKS7wT
         DqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792176944; x=1792781744;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e+xIg4uo6CKkH27g0w/i7+r2VZ1i9gtFiDMjRJWV7+k=;
        b=hQGcrtP0svJnIc8wAexvPz0bo3CgdLmD3X6K17GNhvbBTYBiY+sKY/tn6eNOursYSk
         UgM+UxwcgPPG4GCcVF+Qb7CmBQCjPdx1V7Dfejs4/5r5tG3+GYj4gWx3EL/q4m7CxyFG
         4IuocwzbBs0Tx4Ctv49KbS5nTsr7HvTAKDJF83mUKNlQcr61u6X1gb3LX/baRkhqDNRv
         9M5qbmFqIPLxZHemtyg0r+FKsCfKkBpr0/N24qGfsUV6JEvxULc1PcioSsjJG/ygshck
         n6f1whSk76N39hFX4FO/W74jS2Fx7Fl30ATS4GmtYY8yvi8zJ6lOGdo+7soA4uozgjt7
         RcYQ==
X-Forwarded-Encrypted: i=1; AKwUvByIAcSLBcAlm1QAnNsViH/qlo+RNMKZJ+a0oNT3VCOiGBpdIsu6O9yRpQ/vr/I2z07DuruK1zQiFQ7xXgc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpwepsCqMJWADxJZtVoowRR4xjHh35tnNKdWlnhuYZvqRYpXOu
	RuD59muAOM+DF+0MpQfgKGS2zy1d5bA1qaFGLnK8eHuZkfJ4dJiEjvS+mJr73Giex/SL7M9yQX7
	KilkOZIAJE9Vnx71nPqZ6Hl77tg5JViY=
X-Gm-Gg: AYBFou1ObRjmxKDqj6iiAn6+K/w1KK+HTUFnRW2YC9D9If+7FGaLVpe7K+j+19IgnMk
	M+OZYfFK6+FVpbWfrZ1EJDMh/7+yQX7fziWbMUizbq7rhqAvevuqWPP7XgWxkHT0hI5yukstyZx
	hyq21zy1txftCRsohQzsHNRAf7lHanr/hNc7rcOG93BBWuKFffRgSBktKq/42QjaLec1yeZ2Ss1
	tjBcHZhlS7p4Mwz9rXi6SStX5JGS5GX7CGhqJX62SNYvF576eQ2aC4tF4wufS/TjRpAx18ICl4o
	2dQC4Qm7O2PE1KQHXZnMq8q1g2r5rbOuqAJJmDX5L5IUSP1jy8faORFQP+6p8WQpGKQPKbi8wTm
	Ceh+bBfzZ2bL6MtJ9+8qfk2ZqZGq0HZAOSYkz
X-Received: by 2002:a17:90b:2e45:b0:3a6:dc51:cce9 with SMTP id
 98e67ed59e1d1-3acef10a75fmr661384a91.57.1792176943703; Fri, 16 Oct 2026
 11:55:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009130708.1370675-1-wusamuel@google.com> <c090cb17-9bed-4742-a1c1-92cae6ee239e@oracle.com>
 <CAG2KctozPSev+EXSpHitM3JWfjufQaEjsPJHS_1HJ1wSm7sJ1w@mail.gmail.com>
In-Reply-To: <CAG2KctozPSev+EXSpHitM3JWfjufQaEjsPJHS_1HJ1wSm7sJ1w@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 16 Oct 2026 11:55:31 -0700
X-Gm-Features: AclHuK-cBrYRS_O8fHGSWtkg2J2Lupu1xGROacOaq8RNVp1uJrrftZ6oLOb2wes
Message-ID: <CAEf4BzZQ6uyOOj5gCZyVnqdswtn23wAVWWWsNEH3Ay4drv051Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next] libbpf: Resolve typeless ksyms in the kernel
To: Samuel Wu <wusamuel@google.com>
Cc: Alan Maguire <alan.maguire@oracle.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 8:56=E2=80=AFAM Samuel Wu <wusamuel@google.com> wro=
te:
>
> On Sat, Oct 10, 2026 at 12:09=E2=80=AFPM Alan Maguire <alan.maguire@oracl=
e.com> wrote:
> >
> > On 09/10/2026 14:07, Samuel Wu wrote:
> > > libbpf resolves typeless symbols by parsing /proc/kallsyms, which
> > > dominates load time for BPF programs with typeless symbols. This most=
ly
> > > comes from needing to do thousands of syscalls and a linear scan of
> > > kallsyms.
> > >
> > > Call bpf_kallsyms_lookup_name() from BPF_PROG_TYPE_SYSCALL, such that
> > > the resolution can be done with a couple of syscalls and a binary
> > > search. This is a similar approach to what the light skeleton does. T=
he
> > > fast path passes the name and result through ctx, which requires comm=
it
> > > ae5ef001aa98 ("bpf: Support variable offsets for syscall PTR_TO_CTX")=
.
> > >
> > > Any fast path error (e.g. kernels without ae5ef001aa98) falls back to
> > > the legacy /proc/kallsyms scan, including strong misses, since the
> > > kernel doesn't match LTO "<name>.llvm.<hash>" symbols. Weak misses
> > > default to zero.
> > >
> > > Depending on the device, I see ~9-11x loading speedup when resolving =
a
> > > BPF program with 11 typeless lock externs.
> > >   - x86_64 VM, 6.18 + ae5ef001aa98: 147ms -> 17ms
> > >   - ARM64 phone, 7.1: 626ms -> 55ms
> > >
> > > Signed-off-by: Samuel Wu <wusamuel@google.com>
> > > ---
> > >  tools/lib/bpf/libbpf.c | 59 ++++++++++++++++++++++++++++++++++++++++=
+-
> > >  1 file changed, 58 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> > > index cb09ded90773..7564ec6bde64 100644
> > > --- a/tools/lib/bpf/libbpf.c
> > > +++ b/tools/lib/bpf/libbpf.c
> > > @@ -9590,6 +9590,58 @@ static int bpf_object__read_kallsyms_file(stru=
ct bpf_object *obj)
> > >       return libbpf_kallsyms_parse(kallsyms_cb, obj);
> > >  }
> > >
> > > +static int bpf_object__resolve_ksyms_in_kernel(struct bpf_object *ob=
j)
> > > +{
> > > +     struct extern_desc *ext;
> > > +     int i, prog_fd, err =3D 0;
> > > +     struct {
> > > +             __u64 addr;
> > > +             char name[512];
> > > +     } ctx =3D {};
> > > +     LIBBPF_OPTS(bpf_prog_load_opts, opts, .prog_flags =3D BPF_F_SLE=
EPABLE);
> > > +     LIBBPF_OPTS(bpf_test_run_opts, topts, .ctx_in =3D &ctx, .ctx_si=
ze_in =3D sizeof(ctx));
> > > +     /* bpf_kallsyms_lookup_name(ctx.name, sizeof(ctx.name), 0, &ctx=
.addr) */
> > > +     static const struct bpf_insn insns[] =3D {
> > > +             BPF_MOV64_REG(BPF_REG_4, BPF_REG_1),
> > > +             BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, 8),
> > > +             BPF_MOV64_IMM(BPF_REG_2, sizeof(ctx.name)),
> > > +             BPF_MOV64_IMM(BPF_REG_3, 0),
> > > +             BPF_EMIT_CALL(BPF_FUNC_kallsyms_lookup_name),
> > > +             BPF_EXIT_INSN(),
> > > +     };
> > > +
> > > +     if (obj->gen_loader || obj->token_fd)
> > > +             return -EOPNOTSUPP;
> > > +
> > > +     prog_fd =3D bpf_prog_load(BPF_PROG_TYPE_SYSCALL, NULL, "GPL",
> > > +                             insns, ARRAY_SIZE(insns), &opts);
> > > +     if (prog_fd < 0)
> > > +             return prog_fd;
> > > +
> > > +     for (i =3D 0; i < obj->nr_extern; i++) {
> > > +             ext =3D &obj->externs[i];
> > > +             if (ext->type !=3D EXT_KSYM || ext->ksym.type_id)
> > > +                     continue;
> > > +             if (snprintf(ctx.name, sizeof(ctx.name), "%s", ext->nam=
e) >=3D sizeof(ctx.name)) {
> > > +                     err =3D -ENAMETOOLONG;
> > > +                     break;
> > > +             }
> > > +             err =3D bpf_prog_test_run_opts(prog_fd, &topts) ?: (int=
)topts.retval;
> > > +             if (err =3D=3D -ENOENT && ext->is_weak) {
> > > +                     err =3D 0;
> > > +                     continue;
> > > +             }
> > > +             if (err)
> > > +                     break;
> > > +             ext->is_set =3D true;
> > > +             ext->ksym.addr =3D ctx.addr;
> > > +             pr_debug("extern (ksym) '%s': resolved in kernel to 0x%=
llx\n",
> > > +                      ext->name, ext->ksym.addr);
> > > +     }
> >
> > Great to see the win in terms of resolution time, but I wonder if we co=
uld
> > speed things up further by resolving multiple symbols at once, since we=
 have
> > all the externs available (either by dynamically creating your program =
that
> > does symbol resolution as a side-effect, or adding a more direct resolu=
tion method)?
> >
> > A single syscall could provide an even faster speedup, so might be wort=
h a look.
>
> I tried resolving multiple symbols in one pass, but unfortunately the
> impact was negligible and made the code much more complex. I profiled
> a few numbers, and turns out it's because resolving typeless symbols
> is down to ~1% of total load time (from ~90%), with the remaining time
> mostly spent on BTF loading, CORE relocation, and BPF verification.
>
> > Another concern would be a lot of production kernels won't have BPF tes=
t run
> > support baked in, so relying on that without fallback would be a proble=
m.
>
> Are you referring to BPF_PROG_TEST_RUN when mentioning "BPF test run
> support", or something else? And totally agreed in that we need a
> fallback, of which it currently falls back to reading /proc/kallsyms
> on any error during the new fast path.
>

Have you considered adding a faster interface to /proc/kallsyms
instead? That would benefit not just this particular use case, but
generally lots of other user space applications that have to deal with
kallsyms (all kinds of symbolizers, tracers, etc).

A while ago I added PROCMAP_QUERY ioctl()-based interface to
/proc/PID/maps to query process VMAs and I think it turned out quite
nicely and is super useful in practice. Back then I was hoping we'll
eventually also add similar (in principle) extensible ioctl()-based
interface to /proc/kallsyms as well, so that at least fast
address-to-symbol and symbol name-to-symbol point query could be done
quickly. And it actually would finally provide a way to provide more
information per kernel symbol, if necessary (/proc/kallsyms is
basically set in stone, besides it being text based and thus slow and
inconvenient for programmatic access).

Can you please look into that, I think it would be a much more generic
and desirable outcome instead of this somewhat hacky solution of
calling BPF program to resolve a symbol.

WDYT?

pw-bot: cr


> > > +     close(prog_fd);
> > > +     return err;
> > > +}
> > > +
> > >  static int find_ksym_btf_id(struct bpf_object *obj, const char *ksym=
_name,
> > >                           __u16 kind, struct btf **res_btf,
> > >                           struct module_btf **res_mod_btf)
> > > @@ -9863,7 +9915,12 @@ static int bpf_object__resolve_externs(struct =
bpf_object *obj,
> > >                       return -EINVAL;
> > >       }
> > >       if (need_kallsyms) {
> > > -             err =3D bpf_object__read_kallsyms_file(obj);
> > > +             err =3D bpf_object__resolve_ksyms_in_kernel(obj);
> > > +             if (err) {
> > > +                     pr_debug("failed to resolve ksyms in kernel: %s=
, falling back to /proc/kallsyms\n",
> > > +                              errstr(err));
> > > +                     err =3D bpf_object__read_kallsyms_file(obj);
> > > +             }
> > >               if (err)
> > >                       return -EINVAL;
> > >       }
> >
