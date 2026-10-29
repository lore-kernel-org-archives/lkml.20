Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793309750;
	b=o3QMXG7iawR029n6s06RgCiv/BiZE8zCn6TZMzJKXGVPbLt0a3h10qu+K+FQuxATQI+w
	 +nS9cuKt2iybiLo58hnCvEy3mEE1Vg/DB/41Sd/ZSHWQyTBAJchiFmewpHjnpIWIX4bQl
	 Qdyewcz+xLk8vte3csQ3SdwwyXDYvPS2mVwTMHzEi/vE4TQmraXa+Y/wSNxt8FQnAomBZ
	 hpC77oISS+U68LDC6MYMz7wW9FiEIVKxBrUzuWxTACTByTlchyDL0oF3DF/QKt/A6gC+u
	 /1CIyZ4BXq2czpmpIqI8zzl/6hYbg2e/Z2S3D0PRY/4cAzrVoSCo4DRRm8jxwPeAuXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AjT67sODfv8LIA3zVwUGB//ZCy/sHbwEFOtaC99aW5g=;
	b=jzNPFGtfStsiTm3uPbuvg0dfP3Xhq3hhaaVz0zZZTiVlb01irIAsHYMLZ5MPaT+h+8/J
	 MaH0lfKF4z/jFBIseGNz8nncKs/A1U+JmSmcW/NQysmihp6fTM/N/CNSk2QIGm6EA4dET
	 FkIgY2PN8njuRimP1Sp1eXpCByTwGjqx44LaZ/Yv1/eYaX5rP7ArlfEe5VSXtSOuhwZ8O
	 VJ7G+UGEj5TRoGRaxt2fD2mYJxKKXVRGqY0yX6pzoxmRgG3zuFdVvK0p2sj/Ug/Ft6995
	 dRQLzmum00QY0FPKmiBiGV0JSzqRwCbvb/T7HYvtuc89A146jzuQN0F3r+eKidekldA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ny4Qf79m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6732606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6732606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ny4Qf79m
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so305366b.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:35:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793309748; cv=none;
        d=google.com; s=arc-20260327;
        b=BM38DHf0hn3E+ZF//3e8sSj945UCKmi0n9gyRsHhRxcfLBv3WHLg2I2+IjUKi1uLrG
         G7qD0YruBS7Oyh22MpzDbl3JuBBZJ3p4srbA2aPP8ayH3VxQ9bQG1woojMNGIaBnkn7K
         i68s1wWi9EO6jY+zBOyDxAino+y38BN3FDUv9GrJ/rXmlyNeA58a1SmR98qv4tRdWuWj
         V77u5ebl22KSD/NQ9CPl3zxCiY2vf9Fy0G+na0pSze5UjsdReXiGZTUIM8Jti6oeCKDP
         5T2aUc+52fhU03bHqqBwW+TwBWoGy5OyLYQq1xKVkStGvwopdKhPdUEGI1kAzphTrVdZ
         IRGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AjT67sODfv8LIA3zVwUGB//ZCy/sHbwEFOtaC99aW5g=;
        fh=f6dD3gPMjTZciin3FpR0KyOtPQEP5JQnEfPfBdnguX0=;
        b=SxSiKUoeSeGgZCyMpLr4bWCO/d83p0nkxVXWdIhu3K87BQ/as690Fj5tAW8ihCXXLl
         7eB3V7721kFcjvvN8cmm5Gvl17ZUW45QjYx1kyZx6dhvsiH/6Amj62+jynXsChqX30P0
         56rZjrhQrswb4RT1bcywLvqofE+Fm4dsxVoOKhkSSU9SaTfndRP9JmNJtHFhPstHj5rA
         A9eHrP2vXlHgD5B9ZJpj4WZzZ2SpR5HBIpAdJzD5xvytEA5YtvQfSxH72Wa/bK2DQFu5
         fFhsYAVGKhg2F6lDtttaodExjjGnBEdT/HOIoMHtazbWU0aPwjOkY1OoLxs0kXk5xucJ
         wHbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793309748; x=1793914548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AjT67sODfv8LIA3zVwUGB//ZCy/sHbwEFOtaC99aW5g=;
        b=Ny4Qf79msA3Ol1Y6e8/IcUAH9yOvaHBe2q/r2VBC2ELpk56XQeNul05malBDOFT8ku
         3iNV5LUh1WN6OSi58GJtPL1CdzJ6Gfdq1EwPPwQTHQ+fJYrr4uuUNxUlmh+B6VBLkI3H
         ZEj0B1DaLGuydvsPOrmNnyN+V5M9uzXhIOuB8IAfuS4x7RzFZc8EHwvHkIbq2HZsSAXO
         f8K9v16/gbB/xNpURIL1Ixe+3ZCyFOiwul7kpsyeMIznZ8WtYjV+3pMV90juEncbUJ39
         jANFHK4YH+YJxQHzX5N4bA9Y7nUKExBRqIOMrQJ2r0F5nLrYhReYCpQZmLjrgHbgSrOi
         AU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309748; x=1793914548;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AjT67sODfv8LIA3zVwUGB//ZCy/sHbwEFOtaC99aW5g=;
        b=rb1AZHYp7YHCvrn4S6/hJtDsmaUfzz9dkJ0zPbX2Sq7wcWFUfdawFvBjy2R0nnit2U
         ySON+x38KutSFqwR8aD5jGQHjWR0gsNnu0oDzxiOYL/n+tvYbWltoZ/6HjyOx6sAodm9
         XcN1EN1zcQSlZRFzwbBbxZ8Ill/hL0yLZBt4/vRk+3edGE7vr7YqziFceaFsO4eUdiqw
         yOG8AOrTR16VFoSGrtqqUj6kv5DuPFBsCvjMdULgjQujOt89dvHlogimCHH9J08RFaEt
         MobdQwk0ZBVDNqtXWqBOxdMKztWtPHOE3qlAm8huEGNMT7kxf+7sJncbWZUx/fdxPmY0
         mF7g==
X-Forwarded-Encrypted: i=1; AKwUvBwsh+agoOC4qgqT8aTOGR9ksRMuKVsR02wsnPKm9c4fz+ttylX6BKlxWPjP3CLPtSGYHoBkzXLSFKV3IK4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwbz6uDYikiIQYOL8uiw6vL9Vi5otWiwE5VA19lU4mtq+GG4A2
	/UuxVvvWur3Oag5Ucx9rlD+PxJr5+4rGGO0ZxSTJcaumaQhYNlxCN6TzV8VL2rvqXcVPKkS/0UA
	TBO/Wms1nZMSFAkOQ3Qt9dKWbX7sMIb646ijA/m1H
X-Gm-Gg: AYBFou2Cq2szaQTrxK2Vi9feSyc+7H20hCpmfrcg6/o7Ay6gF9Jw4jU7pSyJ1sqPS40
	cWUnKx06MT2qPuvtln4bmmy3XNNp3vispkerMeurdO4Q1MzYLmvvb4JQaHHGw6CVOrqAGOJLJlL
	00foT1xKCsbYobvUQvztdBAsTcgjKY1Yf/U8neQQ+gHZgznASAmBpld9UkxRq00regyJ07GyWnD
	/ScvNC+D+O3uVTSOzTWsdiEZKcgqLzJEjy+DKs6wtcwX7AGOYokHWMnYDNBR67rrEhKQxv05UA/
	iOF51mV/gmzpLXU2Aou8nqg8rlvnCYrVJcgrflp33MfDdyRRBgMJZXTldhIaFgmuuenLPTV7GYb
	NKV326WuISQ/Q1KnfMuNVxkszY/ad65/xWTM+XrFrjDdetw5nO4s7aYXX48THJc3zGjfaCaQ=
X-Received: by 2002:a17:907:805:b0:c3f:a728:b437 with SMTP id
 a640c23a62f3a-c4ca7ac07eemr32967066b.45.1793309747666; Thu, 29 Oct 2026
 14:35:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-12-wusamuel@google.com>
 <at8dNNb4vwovNZcZ@krava> <CAG2KctpMEuK5OJSedSFshNMSwOqe1g87m2ZOKBhn=Z5iCA45Aw@mail.gmail.com>
 <20261028140127.7bfeab46@pumpkin>
In-Reply-To: <20261028140127.7bfeab46@pumpkin>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 29 Oct 2026 14:35:36 -0700
X-Gm-Features: AclHuK84Rx0Zv6bqYRMUgm-AA1OaD1X9ao32PPa3PHwJ78sUr0bqSyZbITTizzQ
Message-ID: <CAG2Kctra0GYjkzggB0cdMxPK-b9U9x-m+gR6E8goAYvhsNXEdA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 4/6] libbpf: Resolve typeless ksyms via
 KALLSYMS_QUERY ioctl
To: David Laight <david.laight.linux@gmail.com>
Cc: Jiri Olsa <olsajiri@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 7:01=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Tue, 27 Oct 2026 15:07:44 -0700
> Samuel Wu <wusamuel@google.com> wrote:
>
> > On Mon, Oct 26, 2026 at 2:28=E2=80=AFAM Jiri Olsa <olsajiri@gmail.com> =
wrote:
> > >
> > > On Thu, Oct 22, 2026 at 05:16:05PM -0700, Samuel Wu wrote:
> > >
> > > SNIP
> > >
> > > > +static int bpf_object__query_ksyms(struct bpf_object *obj)
> > > > +{
> > > > +     struct kallsyms_query q;
> > > > +     struct extern_desc *ext;
> > > > +     int err =3D 0;
> > > > +     int fd;
> > > > +     int i;
> > > > +
> > > > +     fd =3D open("/proc/kallsyms", O_RDONLY | O_CLOEXEC);
> > > > +     if (fd < 0)
> > > > +             return -errno;
> > > > +
> > > > +     for (i =3D 0; i < obj->nr_extern; i++) {
> > > > +             ext =3D &obj->externs[i];
> > > > +             if (ext->type !=3D EXT_KSYM || ext->ksym.type_id)
> > > > +                     continue;
> > > > +
> > > > +             q =3D (struct kallsyms_query){
> > > > +                     .size =3D sizeof(q),
> > > > +                     .query_flags =3D KALLSYMS_QUERY_BY_SYMBOL,
> > > > +                     .sym_name_addr =3D ptr_to_u64(ext->name),
> > > > +             };
> > > > +
> > > > +                     err =3D -errno;
> > > > +                     if (err =3D=3D -ENOENT) {
> > > > +                             err =3D 0;
> > > > +                             continue;
> > > > +                     }
> > > > +                     if (err =3D=3D -EADDRNOTAVAIL)
> > > > +                             pr_warn("extern (ksym) '%s': resoluti=
on is ambiguous\n",
> > > > +                                     ext->name);
> > > > +                     break;
> > > > +             }
> > > > +             ext->is_set =3D true;
> > > > +             ext->ksym.addr =3D q.sym_addr;
> > > > +             pr_debug("extern (ksym) '%s': resolved in kernel to 0=
x%llx\n",
> > > > +                      ext->name, ext->ksym.addr);
> > > > +     }
> > > > +     close(fd);
> > > > +     return err;
> > > > +}
> > > > +
> > > > +static int bpf_object__resolve_typeless_ksyms(struct bpf_object *o=
bj)
> > > >  {
> > > > +     int err;
> > > > +
> > > > +     err =3D bpf_object__query_ksyms(obj);
> > >
> > > hi,
> > > we could also add similar support for libbpf_available_kallsyms_parse=
 and
> > > probably in some other places like bpf_get_ksyms.. which makes me thi=
nk it
> > > could be useful to have KALLSYMS_QUERY support for multiple symbols
> > >
> > > thanks,
> > > jirka
> > >
> >
> > Thanks for lookiing over this Jiri!
> >
> > Using KALLSYMS_QUERY for libbpf_available_kallsyms_parse() would
> > theoretically by O(m*log(n)) instead of O(n*log(m)), where m is the
> > number of tracefs symbols, and n is lines in kallsyms, with n >> m.
> > But AFAICT, libbpf_available_kallsyms_parse() would only be called in
> > pre-6.5 kernels, for kernels without commit 83f74441 (ftrace: Show all
> > functions with addresses in available_filter_functions_addrs); so this
> > ioctl could never be called.
>
> Isn't that code also O(n*log(m)) ?

Yes, sorry maybe I wasn't clear before, but the current code is
O(n*log(m)), and the ioctl approach would be better since it's m
lookups of O(log(n)) for vmlinux symbols, where n >> m. However, this
is a red herring because that path only runs on pre-6.5 kernels, which
won't have this ioctl.

> I've got a patch (I might send it after the merge window) that changes
> one of the ftrace functions to look up every symbol by name, not just
> when only asked to look up one.
> It can also use the 'callback' function to detect duplicates.
> That should be massively faster - especially with my ~18 fold improvement
> (also waiting for the merge window to end before posting a new
> (not much changed) version).

Excellent, I'll keep an eye out for it!

> Does look the the code could do with getting the 'symbol name table index=
'
> for the symbol so that it can read the entries sequentially from that
> point onwards.
>
> David
>
> >
> > And regarding bpf_get_ksyms(), it loads all traceable functions and
> > needs the full syms table, so a /proc/kallsyms should fits better.
> >
> > I did profile a slightly different form of querying multiple symbols
> > at once [1], but didn't see much benefit. struct kallsyms_query is
> > extensible via size and query_flags, so we can update in the future as
> > needed.
> >
> > [1]: https://lore.kernel.org/all/CAG2KctozPSev+EXSpHitM3JWfjufQaEjsPJHS=
_1HJ1wSm7sJ1w@mail.gmail.com/
> >
> > [...]
> >
>
