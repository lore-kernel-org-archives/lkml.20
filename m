Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794316382;
	b=K5IVQvrGno6C0Z8G1wo2dQqGGOreEXoeGmFf/0LEXG2kUaqfp47lDEbXXuTBQkZBcFUE
	 RgHIkugLXJVHD7uRdki/P5t0fA85ItkvRI2EalogadU/J7viDu2R64/qeDcUR5MaMgcYh
	 LtJYpVG0HayWaOzEAg1/45lYV72KAw4pX/94EHc8sVZ1owN/xu0AdwobDkyZNMwzYME63
	 3nr+FL2tk1tmmnTVYnRAEnmQRbG58cGc9RlzvOAKtDhmDaTl4hfRacKIqUv2eFWgSSaEt
	 7h87lqDOae946VB7dpLh70BKjFlGsEey1s9pktnOBz8nNP25Ug0kfeAGM1IklRk45/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=j9MOCzNF55rZGGpluezeQ+vnoNPiPbJ5pnRhrnmo5Bc=;
	b=COuEqssGmpKZoNtDmACUXZHSYlD+MK8SSBaS6F/acn/0It3pnr6w1ooEo/9T7tDVDK4R
	 DoJPukF3GpEkwPE4gm3xZJZ+BZv0C7SewyU3s6LCqyBaof7CzX8fVL1llHWwubjdS+iHs
	 SuYSSPeWOjPDs1BDEu9nyhSIbVdFabnLkNQQj53upkcjR5NkyckyiGn63kfkM+ssN1F/T
	 OO3vsGKeC6WTPRIpakZ4vJqv2miXV5abAr/muRH5IVhkpq07/hMy+9+giAV3rX2iQsXRs
	 ZK9H185lbH7KkmraB50hoJDbh5NrtnrCXutFSOjv/iXISWCuf6KraJMYjcWG9JaqjMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sdwbhu2K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF948606BFE5
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF948606BFE5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sdwbhu2K
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67bec5dc8d4so1292060d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:13:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794316381; cv=none;
        d=google.com; s=arc-20260327;
        b=hb3oSafADcD7MWjIXczZ98cHrAvsCPXl/gdGD4EFR8B+mKP5fkLkbtTAv+D92rfvA6
         qZ0WfIzZP3XPHr6ynAWnYAGSpUFBEZt0laEiXxm0P562x9kOm6xtMbQH6VUq+iQ65pqj
         /HD/JsqCztDb8I5SaJ8GaDpS8hStr2E15o/VnkOC+bHWSg9cQAGoHd3NOT0PCxylQ/JM
         CBKKyUCePPmCKc3P1mUD2xHm4hT22v9obL6ISs3TZ2FeUEVsLzYALZ03yOqtkzoPIFdm
         +GmPMn1aczvLnDkZ6iubtxkFx12s/HTmx/WB9JSVvFQ7QVmkkIK2W3rib4wGjVPl4oPS
         xi0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j9MOCzNF55rZGGpluezeQ+vnoNPiPbJ5pnRhrnmo5Bc=;
        fh=fsNwwyWW7V4pEQfWppsLtz4+I45FmFOSOHWe9Ciaegc=;
        b=MfjJtodbpy5/21dL8+otGlL8yHPmkvd7uf4ycKDk+6JXBNURTksHf1LyHfT3dfqiS+
         nUpLdGqTIl/7ae+2wusoJQahlnGkxDgcXUPOnd9rSNR8TFUsY8s61hH/E+7fnmxKfuNy
         nESCj+HObHLXFJnOGek44XRbTtzjYdxtXsuKE+PWvEPgNie38XsZWQzEk8mx+B9LTI1x
         8onmKDf+xL2Ow4JVWGcFzSIkLhWQ2M9rxLd/XrP6VzDi0AEP8+dpENpHfItDjvax8fB+
         HyLCxqleNameT3kGlqpX6lYYwq6rjzr6EmGcWZNx6w1nkQB7HyZpXQIsDOfKty/d7zQU
         RZHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316381; x=1794921181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j9MOCzNF55rZGGpluezeQ+vnoNPiPbJ5pnRhrnmo5Bc=;
        b=Sdwbhu2KpgwFLfVlfH6iDlq+dRJGSCxir2demi1cxoaqTT17leKdGKQlndYEKtYU5c
         4CmjBWzYktFmk9hfzFAmZ1VoHanX2QcIdUGdKqTV5oC+C8BP+g4INWFSWYNKyCfLqt3X
         tUcd3BGcEHlP5W4vaDqhhHjHeb5wnrSczCmCQGbzZ3ZHU/IySdOzvic3w8LMH7sL+mwn
         V7+6WUxXTfMZH0o1cPClzyFGoiTHwiQWRleDmjIiztc8DYMf568wzkX3CAUQAh57tOPJ
         tWrRaurKK4islFO7DwFl7kfIUnB1VXryOTOUJvrOa0eEUhqKjP4XdCoLIjoqDcDxUazt
         dS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316381; x=1794921181;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j9MOCzNF55rZGGpluezeQ+vnoNPiPbJ5pnRhrnmo5Bc=;
        b=FAXkE1awmuYutrJPx5RETqKi4E+pkcNEYCFRxghheX+PMjWxRKnOtK9ad5x59KBz0C
         rlvPAH5LO7MC8XZmikSd2bCHlqtuf9ogEQ60qiV9bLKaKTG5l04hx0RqES3wDGM+3U+s
         6cYC564IsCowjp8iKXlmiTucY2eG7M94D1BEAaMTEI0mmx5iDNkBZzCQeOQPVorC9dL2
         lUZVbLZ/OT3n2p/2AHPTjw49fllq/n1UOuk4IvqKTJfsoiA8D8y68a8dxCu7KqVLlTHM
         TvR7KdzOnOFqO4PWPezW+XlVoHYVY8mG6mwZyhGJpLIvmmAjm1jDDwAosQ1nP8qo4a9o
         PGrQ==
X-Forwarded-Encrypted: i=1; AL+hErG/qGqSKAGVa2pzaZhWCjWbnzfISiqj9P0nCTJIX6loqzDDhXmwpD2atQo7E8P27lmM8yNO6LC10L/DEVY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xyy2o7Xlo4Fv6xNGEK+HxF5BmUtLZmmQ+NrWgE6UE5xUr4ZlJ
	EVHag9Q9Q/pPlhcp2+iaARaOIqsX2wtMQjyouSXSrjx4m8i4cOSCEpdIyZoVbgEUYM8oXM6RoY6
	GsIZQPOSr8UY6QLn3A2BHOkXnFmpnbbI=
X-Gm-Gg: AYBFou2/ZbxUz0Aa6LcTMUYhEguByv1pUb9PG/+X9xF+nBfmNIHvjrAimG2Wm/8HVJc
	9AfUbS6eo6DyTXMFPgmVwgx9nrideFMEpaaMGNQ1/SZtxYmUjZbVUGzRJrLovYIhbilfwjfT6H+
	KflWAz0N3jTDprvGoqz/HYQ4bB72xWwDPvtWqT3r7OQTEI7hQVG50q2bKf6PULajdy8j07Yuohi
	8uAGNa9I/3AMA9X2csLi87HIC9NNSOA+hKqxZyE9x+z03j+VhXAepeF1bzEgxDJEnU8LKWEiuho
	DLpp3VooF0mO/mMNHEhQ6fugHiAa5p7D6a0s6I/Zb/j2VbETlT/QnIkMlpwX21DSEmiVbsKeVDN
	0PeHSeSikqF5SG8qcpayP00t+PLMxezD/0jkG1w==
X-Received: by 2002:a05:690e:1386:b0:67b:eb7a:e62a with SMTP id
 956f58d0204a3-67c56265785mr1829765d50.0.1794316380667; Tue, 10 Nov 2026
 05:13:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-lskel-struct-ops-v1-0-a4486ffc79cb@google.com>
 <f5a22a46-0fd8-4739-bf11-a20e0b3a443b@linux.dev> <DMR088J2OR6L.9TOD4IDBHTZ8@gmail.com>
In-Reply-To: <DMR088J2OR6L.9TOD4IDBHTZ8@gmail.com>
From: Anton Protopopov <aspsk2@gmail.com>
Date: Tue, 10 Nov 2026 14:12:50 +0100
X-Gm-Features: AclHuK-z3hLVWTJeTumw2Ph2v5vhN9G_65U0kCrk8Fj0jgmTxAiCTqvVd4CkNag
Message-ID: <CAGn_ityW5Z+JEcTL9wKnQOgLXhjXxC357Q=h95AgR9xP+pcmjA@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 0/7] bpf: Support struct_ops in light skeletons
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Ihor Solodrai <ihor.solodrai@linux.dev>, Siddharth Nayyar <sidnayyar@google.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Quentin Monnet <qmo@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Giuliano Procida <gprocida@google.com>, 
	Neill Kapron <nkapron@google.com>, =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>, 
	Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 10:40=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Mon, Nov 09, 2026 at 11:46 AM Ihor Solodrai <ihor.solodrai@linux.dev> =
wrote:
>
> > Andrii, Alexei, wdyt? Any other ideas?
>
> The loader asks the kernel for ids, sizes and offsets only to pass them
> back in the next three commands:
>
>   the loader asks                   and passes it back in
>   --------------------------------  ------------------------------------
>   id, size of bpf_struct_ops_<t>    BPF_MAP_CREATE
>   id of <t>, index of the member    BPF_PROG_LOAD
>   offset of data, of every member   BPF_MAP_UPDATE_ELEM
>
> the kernel can match by name instead.
>
> The kernel has both BTFs. BPF_MAP_CREATE of a struct_ops map demands
> btf_fd of the object already, and bpf_struct_ops.c doesn't use it.
> The kernel can find its struct_ops and the members by name,
> like btf_parse_kptr() finds the type of a kptr.
> Then the loader passes what bpftool knows when it generates
> the skeleton:
>
>   command              the loader passes
>   -------------------  --------------------------------------------------=
-
>   BPF_MAP_CREATE       btf_fd, btf_value_type_id and value_size of the
>                        struct in the BTF of the object
>   BPF_PROG_LOAD        attach_btf_obj_fd =3D btf_fd, attach_btf_id =3D th=
at
>                        struct, expected_attach_type =3D index of its memb=
er
>   BPF_MAP_UPDATE_ELEM  that struct with the prog fds in it
>
> The kernel rejects such BPF_MAP_CREATE and BPF_PROG_LOAD today.
> Nothing changes for existing users.
> The BTF of the object is in the blob, so the signature covers the names.
>
> Then no need for a helper or a kfunc. The 4k buffer, the fds of module
> BTF and the offsets at run time go away.
> map->def.value_size, prog->attach_btf_id and prog->expected_attach_type
> don't hold offsets into the blob.
>
> The diff below replaces patches 1-5. Patches 6 and 7 stay.

I like Alexei's approach here, it fits with shirudo. I also have tested it.
(Patches 6,7 weren't tested, shirudo uses libbpf without bpftool.)

>
> [...]
>
