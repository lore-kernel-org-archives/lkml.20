Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793196092;
	b=sKFwXcZK+me36rlLs3QCuje2hc0Y8eILuJkK0ompXUkeVPFKpAwHC7qPrugSF3JmVITo
	 lfAz4tnfs8XJzDqKQhAZo5WF3EMMkBAuzrQZKamQDdBp6il8tvg93LgzSvXCptzCzVLSp
	 zXySF6nDt31qI4w+JvgKmwQsmKq+smVe0cICO3AkUf4CE6N2O/b/VMvrpzqKmldPfVX1h
	 Lrcy4nNvZ6g/fMNgRPGT4EooQaVc6oIIBqGN3pKCGhfZUoO2EtVHzG9zY+s8DJxW8BZe0
	 tT1828mhE7KMRS/YawWM3eoIhvJHoVPjlJC++6cRZaTL6o0P1IMO+gPztkrUp95nyBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=SyqHXLptMiWk+aCTehkHAqNtA/ZhM3lq7X8/7qWdG8M=;
	b=X1mi7YYWa7aqovHoPY9aZOQodXO6tP/HacAZZ8UK11d1yhdY9aaCFhIAVJFpip1aMvyU
	 6rimZpS6oTyNPa9213iAiSJ9iF9wqyRR7iZcIpeLSBiuUA2UnrhzS58TN9j4LYJMWAUAE
	 ecxS+nz2YF8V/dNBKfyT//7cn3oKCj6tR90Fwk8agrnYBaZDDj1aXbnRmpNhUCnl5viBv
	 V7EywxrcsSQTK9fv70fmuplExqcWb0ZVa/nG+HAfB2gK+GnVi2W2mvgbHJzwRZFiavVJn
	 LoR5vwJ++q2WDVDcjvohKULo8J7vIDqPi9YqIqrcDqWGL6YP+nnHfxCMPkxkuO2AYRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+Avdvfv;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF906606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF906606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+Avdvfv
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso10494095e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793196090; x=1793800890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SyqHXLptMiWk+aCTehkHAqNtA/ZhM3lq7X8/7qWdG8M=;
        b=C+AvdvfvOS6eZqnIPGcHHA6edwh215Q6BYf6rpPcMrZGP4WZWdun+wsy3jEWahcGrq
         9iIH3D3gvwx3zERKa61VhoEFGdYVzxNgssZAFryfXY+B2HuXgqghRpnvugie9X5WiCA5
         4hV+U6mC4H+xZVw+x8nzdzRes9Cpk+4ayaaCM3InxToAAySusdVxigJDUc1SUxRYKyjY
         mOgHjphdjDJfa9OB8tRgy0mhuNJdpX7ZiWBy98eOZHQQ1s3wf1T18gieMWXmMJ4QwdAu
         mK02yU8AWERDQyU8WcOeA12odTUGEIruRJahl959etQ2dsYyUNaN3KgI8CiQr3EeibAv
         B6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793196090; x=1793800890;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SyqHXLptMiWk+aCTehkHAqNtA/ZhM3lq7X8/7qWdG8M=;
        b=INyilPK+KgjI9am6/GMpqcRRkO36WTH78ua0plpXPXij0s/n459lQyvNpdZPgoulcV
         GyS910xLsyYRrfhTYVWkdonkNtVETK/xdG888M9NPiN6MkkQk7iJIPKGE+WagZrOx7hn
         xzgGdU/uULLPzlgNtQARw5JLGb2aFnXCSSelD6CMY0QkfnC4xfZ8ndRX3cOabAEK+FjG
         7nXgo5yovioaiSU6CTGwOLTVxbYT654621F7W2sq97w7+O/L7iTIWr7OIXglVFGzRgff
         quarPEmc7qZ8gwKIuPLjPGrXsAoMUxlLYQoGL4SealtHShej9XniE0isySTf7d414tZJ
         Ga3g==
X-Forwarded-Encrypted: i=1; AKwUvBx9lyJoK78wIjdRRtAeWXfZdu6SnPav1xM/YGDwNKZ45sRPhR9OQhFysnI2mdEILByKHwsKKcmov3xGEZs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhVW4YgzDgV6mzyqERwHgGpSMVRqFB8/LGeGBG8ijDwoKcuxJk
	aOCdP0uipTHWDHY0OzGueQnPKF+rrvZ8atgK9xXbI3odS3ZioX+cv36R
X-Gm-Gg: AYBFou3KQkf6QG0Joq9PPSXIFaSLIVaVQOQlB8gW0z7NtYRJ6SnqTOQgaGan8e3lgS6
	PRMQwDHODo6Kr+7rfJJ/4EPbpq8xMkKph/OSjyJgeqnYEaQnFqQu0h/PeWRBnnxlJONp+vJNxUE
	5R5ZCnPsGFNIW+9LZ3bS1DMI5gfHyNsV1Y6wfEP2C8j2sviM8ageZa0fsH8J+XD1xB178/MKS4P
	WrIk5tkgIuqBpGnT70RmKE91Un7h3jeHc/CXC1j/2isAnKAjSbxBbBocboUZ45gBGEV1rcbJDT0
	BFXViq4duQzMXAxLX0+VoszQkK0CcK5RGFMPtHLh9IYxeCh09ZBFn2csT4UgmBCulGsRnLoOa0u
	Z/SNwn+aC5bSfMVme1pBr0ycNvWXkj2XwlDVmgSIXdD5ddnvLM2QvOdxy5fT3vG3Fy4lbThce/0
	bQzlx/qaQYVADZEiSFUAsjuaWSEHm4sK70FCM+JcfjW+k4aP19gKZYzlcV6oggAEcto7QL+DI0O
	AepyKroEwhu8Ef6k/qQZUqCLg4ko26agCvQoCMxbjLNDzxtP+Bcm6cfBAvJicQcqwUf4uTVe9R9
	j7owgclDqASmRB7j+el6sUCjLEFSbWW/5RQVAF9CWgi606J1/HO3XOCUZYi1OOzDdg==
X-Received: by 2002:a05:600c:630e:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4a9678bff9cmr50385655e9.29.1793196089864;
        Wed, 28 Oct 2026 07:01:29 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4d8dsm30164106f8f.36.2026.10.28.07.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:01:28 -0700 (PDT)
Date: Wed, 28 Oct 2026 14:01:27 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Samuel Wu <wusamuel@google.com>
Cc: Jiri Olsa <olsajiri@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko
 <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai
 <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi
 <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Emil Tsalapatis
 <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 4/6] libbpf: Resolve typeless ksyms via
 KALLSYMS_QUERY ioctl
Message-ID: <20261028140127.7bfeab46@pumpkin>
In-Reply-To: <CAG2KctpMEuK5OJSedSFshNMSwOqe1g87m2ZOKBhn=Z5iCA45Aw@mail.gmail.com>
References: <20261023001603.560210-8-wusamuel@google.com>
	<20261023001603.560210-12-wusamuel@google.com>
	<at8dNNb4vwovNZcZ@krava>
	<CAG2KctpMEuK5OJSedSFshNMSwOqe1g87m2ZOKBhn=Z5iCA45Aw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 27 Oct 2026 15:07:44 -0700
Samuel Wu <wusamuel@google.com> wrote:

> On Mon, Oct 26, 2026 at 2:28=E2=80=AFAM Jiri Olsa <olsajiri@gmail.com> wr=
ote:
> >
> > On Thu, Oct 22, 2026 at 05:16:05PM -0700, Samuel Wu wrote:
> >
> > SNIP
> > =20
> > > +static int bpf_object__query_ksyms(struct bpf_object *obj)
> > > +{
> > > +     struct kallsyms_query q;
> > > +     struct extern_desc *ext;
> > > +     int err =3D 0;
> > > +     int fd;
> > > +     int i;
> > > +
> > > +     fd =3D open("/proc/kallsyms", O_RDONLY | O_CLOEXEC);
> > > +     if (fd < 0)
> > > +             return -errno;
> > > +
> > > +     for (i =3D 0; i < obj->nr_extern; i++) {
> > > +             ext =3D &obj->externs[i];
> > > +             if (ext->type !=3D EXT_KSYM || ext->ksym.type_id)
> > > +                     continue;
> > > +
> > > +             q =3D (struct kallsyms_query){
> > > +                     .size =3D sizeof(q),
> > > +                     .query_flags =3D KALLSYMS_QUERY_BY_SYMBOL,
> > > +                     .sym_name_addr =3D ptr_to_u64(ext->name),
> > > +             };
> > > +
> > > +                     err =3D -errno;
> > > +                     if (err =3D=3D -ENOENT) {
> > > +                             err =3D 0;
> > > +                             continue;
> > > +                     }
> > > +                     if (err =3D=3D -EADDRNOTAVAIL)
> > > +                             pr_warn("extern (ksym) '%s': resolution=
 is ambiguous\n",
> > > +                                     ext->name);
> > > +                     break;
> > > +             }
> > > +             ext->is_set =3D true;
> > > +             ext->ksym.addr =3D q.sym_addr;
> > > +             pr_debug("extern (ksym) '%s': resolved in kernel to 0x%=
llx\n",
> > > +                      ext->name, ext->ksym.addr);
> > > +     }
> > > +     close(fd);
> > > +     return err;
> > > +}
> > > +
> > > +static int bpf_object__resolve_typeless_ksyms(struct bpf_object *obj)
> > >  {
> > > +     int err;
> > > +
> > > +     err =3D bpf_object__query_ksyms(obj); =20
> >
> > hi,
> > we could also add similar support for libbpf_available_kallsyms_parse a=
nd
> > probably in some other places like bpf_get_ksyms.. which makes me think=
 it
> > could be useful to have KALLSYMS_QUERY support for multiple symbols
> >
> > thanks,
> > jirka
> > =20
>=20
> Thanks for lookiing over this Jiri!
>=20
> Using KALLSYMS_QUERY for libbpf_available_kallsyms_parse() would
> theoretically by O(m*log(n)) instead of O(n*log(m)), where m is the
> number of tracefs symbols, and n is lines in kallsyms, with n >> m.
> But AFAICT, libbpf_available_kallsyms_parse() would only be called in
> pre-6.5 kernels, for kernels without commit 83f74441 (ftrace: Show all
> functions with addresses in available_filter_functions_addrs); so this
> ioctl could never be called.

Isn't that code also O(n*log(m)) ?
I've got a patch (I might send it after the merge window) that changes
one of the ftrace functions to look up every symbol by name, not just
when only asked to look up one.
It can also use the 'callback' function to detect duplicates.
That should be massively faster - especially with my ~18 fold improvement
(also waiting for the merge window to end before posting a new
(not much changed) version).

Does look the the code could do with getting the 'symbol name table index'
for the symbol so that it can read the entries sequentially from that
point onwards.

David

>=20
> And regarding bpf_get_ksyms(), it loads all traceable functions and
> needs the full syms table, so a /proc/kallsyms should fits better.
>=20
> I did profile a slightly different form of querying multiple symbols
> at once [1], but didn't see much benefit. struct kallsyms_query is
> extensible via size and query_flags, so we can update in the future as
> needed.
>=20
> [1]: https://lore.kernel.org/all/CAG2KctozPSev+EXSpHitM3JWfjufQaEjsPJHS_1=
HJ1wSm7sJ1w@mail.gmail.com/
>=20
> [...]
>=20

