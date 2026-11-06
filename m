Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793993601;
	b=XQqN+bHLy1ZHXoIG8fbYV/L8XmMiJwFoqjRxLxe8Gwipe6luADE2+cJCgq0evCbwUlQd
	 SrL3X6JHpwABBy6LfJPIA20mNa2IeIQO9pZ1m7qU25NI8JzLhnP7YOmB+aLHDvJTGwdB1
	 nwAseLVXgsT1YIw2hyo0Qh8iF+XYzQ4ZNwb/1yKGpRDL9/EJCwIwJYLghuQy2LkW55TDt
	 NABzPAIl6AJgWMtkQ+mu4TQ8/Mh7jO46luddrEsfSqrQp9g9fjZiSyxNGlFCK/djnkDPP
	 /wcedg1bUgvQ/hxgscHTbxUwn3P3J41gljg1h6foHIjgZQ0/CqNoxeitI7d1+gaKGLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WASkhr+Unco/i3EllWy4fEDfIef6kYtQba3wH4Yi4vg=;
	b=cKDQ40uiMsrVzi13wIzji6RALhiNKhsIoAdZhH+C370xvUtlwYCnXEQnH4KIv4xZuHW7
	 nK6n1HETyE6RCSOAsS3RHcnS/oJqGIk7dZVQ7D8F62HqfFLA7arzHj9uDjhKJ0eFWZ8VX
	 VIztyYw/JolVZysWm+kR+hCT5UJmRJzD3bopVriPNUBLANGIpHnLMbpJvkTdJ11nWZstE
	 TZBODzBV4J1iu34K0GdzfL+YBBTn/b7iF8nwX9k7yzVxSjd+c8a/7IgRYjInDYxOfpA1r
	 Hu/9izdTmNvf09B9NgbcSNNYurEqXvIhmCuN0TWmt55OGnG5mMnMjAUQS41gGABr2NQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PTOVU/vt";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8A7606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC8A7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PTOVU/vt
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e96502e447so8674525ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:33:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793993600; cv=none;
        d=google.com; s=arc-20260327;
        b=arSebNk1Fjjx/uPMq3sIFpn7nbnDqEuZyvz6BQR1/Z1QNelRpMy6y/AQ8AqUsE6idz
         xgJ/z6LLhqxbjgxzz6RIYS/PyeSamBfGpF49zedcuOS3nsx6+ey30LmNoKpsBaOHqlMU
         8Q24xqkgXIBFgMP7NgO4YSA9eXFjxawx1MoxuaWfWdGAmrv/q/gdfy1mK7BJZRbUiPYW
         pj19XfC+MzgC0xzdnja8X658vbO2toxBRoXhTpfi5UWbRA4jgLVhMtcZXPAn4TrgfRDQ
         APgkmFy20bM+yys4wXRxcvRIc57GbZYWtY+eSDzlPwl7ObEP+FbDTIlR2/CG6/f2TDuN
         Xa/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WASkhr+Unco/i3EllWy4fEDfIef6kYtQba3wH4Yi4vg=;
        fh=ForEtAq5UFn1FkC+qhEwvfV+2085dBD8CiauKz7ri3k=;
        b=Hu3c+GcQt6jJsD6l5JNqh9rskXYanY37EB9SEdVpmLCy+8W/h8BYICRl3JVyfFP0OB
         fz3/G/X4byMvWakykCHSKL/dnq+6VA5Z5BuCSVmUn5p7Ipmg4+Op7OybgjQ7FShqUXpS
         H/rjlYy4TjYRYsVUA4eziwu1UUW1tmAzda3OdQVJdG6uFUr+dBDNUjN9Nb0gZrCNVdkV
         1ZSqhNtxL8OCp2+1aOkaiFlJNla0sAZpBD/FhiQfh4pAbIbnztSQOi03sntWdZe4lQas
         R98XOWJBZBq59JAZDxp0Wd/aWMMHFnqMr+fLsvNZI+rtu9UDxXJnqof0WE6g0VhIfJQq
         6qUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793993600; x=1794598400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WASkhr+Unco/i3EllWy4fEDfIef6kYtQba3wH4Yi4vg=;
        b=PTOVU/vtLVZodS0aOcFhbpPojR0zuZKWzH68M+LgwxhUiMUUV3OwAyiTQVlrcMUxnw
         5JHwdxmXVMsluwjPwApczHspB1hZrE0pKL/8rrvoFqdMiAAIy/MuK/FDLY/YlGrgdoOY
         jxkOm4zP18LMj/UG5TtK2Sbm6RkPSaVEOsrTsblHURQnq9i+o8BdEGcq0vnh65KC4pua
         t8qO68S7cQUlzZGrCjEamaURGUFfAElVnw+yN5jGhpynX4i2G4J6wYWvFEyWHFgm6twr
         X1h0Mzbrfv9Aol8EK2bqGug92Yy85UqYnHSA3uCYJGOwgKYOYLZQImW0f6cOgC9KFbL1
         gmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793993600; x=1794598400;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WASkhr+Unco/i3EllWy4fEDfIef6kYtQba3wH4Yi4vg=;
        b=Atl1doOC/kiUnJ8qgaUndXCsMhRxUxeCfKz1YxecWg5s2tXzNASfDtc4fmZijTB+So
         tOxgKXgEFiFn0bqFngQT+Nsv5a2D+3H9WTsdTY/ZdUgOsIU1b3gvgcsnAyYqJjMNvooR
         YN33GdF2yDhY/tc6luCIHNj5W2C8bQfsdrDUqCLyQ73ZT1dHG1lBMTcttsTtV6tnQd8B
         e7fkrjCQDlBRXxQCXGg+zf075ef4t4UAnTS6jdRYtX/fIiJE9Oifvhm+fjDag1klrYWi
         +f2lWtQb0ZQkW0T/5wzJnILIgjgyqKt+FSHbdj0g5v9tAZJHtk0CzprBsjMTR5ZpPJHp
         LFJw==
X-Forwarded-Encrypted: i=1; AL+hErGgxP0/oc3Nxf02ppSM08jrQD2BksgKwY1L7JwntruYfdjsMsURlKQtMeWh65uJD8EDxg9Ef5VzG88MPb4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+W14/K5D7OOsuPeZ13nAW2htt9ScJijQLA8GZMI1D0nZw4m0Zv
	BuuHvUGmizLXMWXPBKap8ICZHxS/UrEgK/s/T4jrS1KbD2YmbxfNkjWn7LwG/ZSEsUi+IseafSt
	GbUqAPS3caAwQL5hMOGIL3NTVCZBZHAA=
X-Gm-Gg: AYBFou1GAIN9ICoggz7fSJmEMtWHrzmlBbWK8MR/f/6xxqtFG2SoaHGKSdnXmARyBSC
	DBpI2YOBpfEklyNMlblnHBZJzw8uJtRLQcOv/mKrMF5nuGtoRK+Ap21JlwFZTMVYZ5LTB+CUrJ4
	tYYG2HBRb1PQdakmCJ22TMlMooPmA8pcOYvjqaPAa2UBpS+xAlzjftqvoruFgYUQYyENc/whSnu
	Imt1mCcp074T91ucwUuTZ9+uvc5nXc5rHbBqgkn2MNotlCO1T+JI4fmpuWWrMO5zVNbBjmC0Xn6
	tDd24GRIgwROPekaP9w1zCer9auZA501QQhHQgCDy/e1C329LNKXTSNHe/FdZsnEo4Xx6VKxB7e
	BZLtl2426lPVs1zm7iv0yH+krraDZ3wispiZcDhW3u8CXSIBeBL13HEsmAzV5tPJSrWv2scW4Oh
	0EbEQ=
X-Received: by 2002:a17:90b:39ac:b0:3b0:9cc6:62bc with SMTP id
 98e67ed59e1d1-3b0db6ebd52mr3469969a91.37.1793993600100; Fri, 06 Nov 2026
 11:33:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <d85ece6e-27f9-4d9f-83af-4101bc76fef6@app.fastmail.com>
 <356db94e-f5d6-4fb2-839a-b97aef72256b@app.fastmail.com> <CAHC9VhR9sjunJRnM9gy-BkBZkapQTrr8a8FtmaK7JkAmUqTrLA@mail.gmail.com>
In-Reply-To: <CAHC9VhR9sjunJRnM9gy-BkBZkapQTrr8a8FtmaK7JkAmUqTrLA@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 6 Nov 2026 11:33:07 -0800
X-Gm-Features: AclHuK9gXDhZeKl8Js7bG-wUcnzU8mjlehe58_riZeQRtc97_9zHpsNN_OoiZ0w
Message-ID: <CAEf4BzZKmn6g0SK8OddjKFj_vAmZFvpZv32Hs_S+GHgT7VNfrg@mail.gmail.com>
Subject: Re: [BUG] bpf, lsm: new first argument in 7.4 inode hooks silently
 breaks BPF LSMs
To: Paul Moore <paul@paul-moore.com>, Daan De Meyer <daan@amutable.com>
Cc: roblabla <linux@roblab.la>, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, paul.mabileau@harfanglab.fr, 
	linux-kernel@vger.kernel.org, Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 7:41=E2=80=AFAM Paul Moore <paul@paul-moore.com> wro=
te:
>
> On Fri, Nov 6, 2026 at 8:39=E2=80=AFAM roblabla <linux@roblab.la> wrote:
> >
> > Hello,
> > First of all, I'm sorry if I'm sending this email to the wrong mailing =
lists, it's my first time reporting a linux issue ^^'.
>
> Hi,
>
> It looks like you sent this email to the right people/lists, well done
> on the first hurdle :)
>
> > In commit 16959c469f232f5c76cfb628297cafbf6dbdba79 (lsm: expose mount i=
dmaps to inode hooks), merged in 7.4-rc1, a new argument was added in posit=
ion 0 of various inode-related `security_` functions. Specifically, it adde=
d this argument to inode_create, inode_link, inode_symlink, inode_mkdir, in=
ode_mknod and inode_permission.
> >
> > This has the immediate effect of breaking eBPF LSM programs relying on =
these hooks that were compiled with BPF CO-RE and using BPF_CORE_READ.
>
> ...
>
> > Now, I'm not sure how the Linux Kernel treats eBPF LSM hooks - if they'=
re considered part of the userspace that shouldn't be broken. My understand=
ing is that kprobes are not part of the Linux Kernel stability guarantees, =
for rather obvious reasons (they allow watching the internals of the kernel=
) - but I'm not sure if this extends to the LSM Hooks. I assume not. Still,=
 this kind of breakage is really painful for us, and I hope we can find a s=
olution.
>
> Like kprobes, the LSM hooks are intentionally not part of any stable
> API promise.  While we try not to needlessly churn the LSM hooks, we
> reserve the right to modify parameters, the LSM callbacks associated
> with a hook, and even the basic hook semantics from one kernel release
> to another.  The reasoning is very similar to that of kprobes: the LSM
> hooks are linked to kernel internals and thus need the ability to
> change as the kernel changes.
>
> LSMs that need to provide a stable API must provide an abstraction
> layer between the LSM hook callbacks and their stable API.  The LSM
> framework is not responsible for the stability of individual LSM APIs.
>
> > Could we fix this type of breakage by making sure new arguments are onl=
y added at the _end_ of the LSM hooks signatures,
>
> I'm sorry, but I can't make that promise at the LSM framework layer.
> It is impossible to predict how the kernel internals will continue to
> evolve and thus I can't promise how the LSM hooks and callbacks will
> need to change as a result.

Yeah, I think that's a reasonable stance and we went through similar
discussion about tracepoints not being stable APIs, no questions about
that. But I'm wondering if it's not too late (as far as I understand,
this hasn't gotten into final release just yet), would it be ok to
just move newly added argument to be the last ones? We had similar
problem in not too distant past with one of scheduler tracepoints,
where new argument was added in the middle of argument list, and that
causes just unnecessary friction when using BPF with old and new
kernels. We did move the argument to the end and resolved this
(without really mandating any stability guarantees).

So, in short, would it be possible to send a follow up to Daan's
commit and move `struct mnt_idmap *idmap` to the end of LSM argument
list?

>
> Regarding the specifics of how the BPF LSM has dealt with this in the
> past, and any plans for the future, I'll let others speak to that;
> hopefully they will have some tricks you can use to make these
> transitions easier.
>

(this is answer to roblabla, I don't think you, Paul, should care)

The answer here is nuanced. On one hand, libbpf and kernel (BPF
verifier) don't really know exactly what BPF program assumes argument
types are. libbpf-provided BPF_PROG() macro that everyone is using
with BPF LSM just assumes user specifies correct sequence and types of
arguments, and libbpf just provides a bit of syntactic sugar with
casting untyped input arguments (they are just "u64" types) into
expected types. So it's not easy to detect this automatically neither
in libbpf nor in BPF verifier.

Having said that, there is a way to handle this, although ugly and
*everyone* using specific LSMs would need to do this on their own.
Instead of using convenience BPF_PROG() macro to define BPF program,
you just use raw `u64 ctx[]` access, and then cast ctx[0] to either
`struct mnt_idmap *` on new kernel, or `struct dentry *` on old
kernel. And you do that for all arguments. E.g., something like this

SEC("...")
int my_prog(u64 ctx[])
{
    bool new_kernel =3D ...;
    struct mnt_idmap *idmap =3D new_kernel ? bpf_core_cast(ctx[0],
struct mnt_idmap) : NULL;
    struct dentry *old_dentry =3D bpf_core_cast(new_kernel ? ctx[1] : ctx[0=
]);
    ... and so on ...
}

How you determine "new_kernel" can be done in various ways as well, I
don't want to overburden this email with details, but it's doable as
well.


so, tl;dr, it's possible to handle this LSM signature change, but it's
painful and requires knowing about breakage and doing a bunch of extra
plumbing.

ideally, if it's just a new argument addition, it should go to the end
of arg list and then all these issues go away

> --
> paul-moore.com
