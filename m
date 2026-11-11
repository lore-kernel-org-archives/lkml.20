Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794382539;
	b=jsO5/A+Uk7LmqNfDJV0hQFQKwgLiPnvp1RKHgdDuxJPIojY3TcZdt2FScIDTlZ7D3bGO
	 VujuQZpKFBpinyYN+jCmKZ+ZcKEF/5GbQ2hYXSmGEOIFevJ7/juRhl59CB08un/R/Pwtg
	 Rn0PgRDUopsMoxjAjeoWo52hqta+8SIhAl28uImtpVTymd7RPuQNP1MiDr51dCeu4js14
	 HvZyF1tOkoZ4WW332P7eyrP0wgovM3q0OCEyG6QtW+UssW6W6iV2t57745SZaysMoNeN/
	 XsplHEqWWzLiiFt71oBzcd5txzNXHXCRXlRgnfwhjtqx9RjrpON+brojDNwL6zIx3hw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NgL3StqkmoZikoXpv80FJYJalx8ySs4tPeli0UX+OHY=;
	b=VlW+MYsbjyEwZ9MXu21FAc7UJfy0gqwV7S+VwaYyvTiIVj/B9QJW6TLSqQPw2Fe0RnoY
	 8ukRj/r9qaaQqVDp8/0xn024L9Pi49efqIbY9pm0yTS3hl759xPhBSCRVpD7Yx55q4Ya1
	 Fl7ke0uBUXHuv2u9SNvUErLuJoUQfj61CUzU8eWmJZqV4E3bLRWdor1NAb0lKshRY3xa7
	 cc0bUkdRjtj1wcp+hcExWz9aPMJuxWOZei1Xm8ewZWLzPqM5MoAHxRxJXkZncI4tfylCO
	 1XeeV3ynFuj7d2PN68ba1W6qvgwGUOWshaoKOYuYbRFMcCApnZ4e7yA0l49qSqdPoxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Bs9eM0U7;
	arc=fail smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E65606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61E65606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Bs9eM0U7
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-677bc4704cbso3355588d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:35:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794382538; cv=none;
        d=google.com; s=arc-20260327;
        b=gn6HcWEaOLQs71H5i5WAFfY6Yn3l7rnYtykW53qPQ86MaFse1mkm/TnzNBPgDH6RYO
         vB9LOSMjBufPlGnH+U75DMaQKODcLnr4EEJDbUHKTF1ObxRs/+Bjf5KsYpYq5Zur9l5A
         aNVz4ST4UW4vqvdaNKn2bhzEHiprGfZQ3tHlFwXIdOrWXHk3O/i7dxB4rZKLZnx9/kLw
         ZZxaqVUhjlhm88kWqFcTxTaALWSZlEGcKzrJBjOcPvhhbfc+E2cHNlJGT/V6dEUtUi7o
         AxRXsegAnz7BgnWDazEOYKrCY9Lv7Sgt0FUo7QaMcpKAMZ6mw0GLNrW5vRGEf+Roo6j+
         MsmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NgL3StqkmoZikoXpv80FJYJalx8ySs4tPeli0UX+OHY=;
        fh=V8Tr/hgHxqq7JjsMMcaLOzkKBTU/JJt/Go0uXDswkdA=;
        b=jg5VHX4NZYXTjbdGC5IbsEGmHMCvpjYthgYe6PTyjvqmEvArMsSKRVstoujsVdWf0f
         Vw5vAcohZXk8Kiagd7VkR43FDUFsbIj59hrq1m2utEYUYh+x4DI9y8rApoY/KtB7uuvN
         CJDhq+CpqweqavPKceO4RnRS4i0O8XEUMgQBHfyi/cKG6S/Ux0rLwNNzJWhOpeWpfUPt
         xCGeMSDmnQFVwNOUdLGaX/UsEOkDN3bLsPPwv/GOepRMtkPP6F0/oLvwY4lkmEqyHFgu
         jLXJcwdFLNgP4mKvlrAlD8t9jZxRWtoPPx4fmjLme0ZDVCUxA5v2QMMl/03XzsPOyFon
         Z7HQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794382538; x=1794987338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NgL3StqkmoZikoXpv80FJYJalx8ySs4tPeli0UX+OHY=;
        b=Bs9eM0U7T9Dcv5j/5o6EYk57qJQ9YereO3VjDhNRI7o0jefiQBCYSZvkDuzs5EwpBN
         blRufjR4fCW8K+7KZdBTktL1Oysu96mn3f33wyPmfUtrTyjJovE4HraeAPJacqdqXOpf
         c+UMmNoEWg6tqorJMjC//jzZDfGvuXeJCVKCwGtXLIPNIp6sEN3Xw28diurSQC6zziIy
         +vZrkBN1glEIUn+b+JGhdsLZewUBhUhy4GOrq2OAiXlhw6oR3XJWl3EcyCQn0thlZwvU
         MM3TgPBc/rYX70fGGbaYOt3JF+YcjSCUi+iJtenLk966aIlfbcD7Cb27P626B9thBRBE
         o9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382538; x=1794987338;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NgL3StqkmoZikoXpv80FJYJalx8ySs4tPeli0UX+OHY=;
        b=u2Liegn3SH4i+Tr87HhdHjzNyCszEogCApB+xSbSpz/40lyQMyQic+mCa3pSPXM5RU
         to2jQNZa9VR7OLIfFlXKbDar2fyrljV0IYIOHs1gSLsb6njRG7D+BTJ25KpDxY4UzPL3
         vNm1kiKBQQCysQHnx1eFxeWgi2Hiw3Bp4TjGytam0S9RNM0sZbzH1LHdnSoRtoNQ5mrP
         y+9dDwKGEgRCIHFHyvmTNPQV5Jhw1TkeTXDoeMNM46We5PTBkIULAAVzwSeAHUsWrHBY
         yyOlk9h11lj0fTiHXMMSGYYt/Oeik0K77oks/STXcDURhJ1wUm+osTVHu0420TF2c/21
         wjxA==
X-Forwarded-Encrypted: i=1; AL+hErGnL7518lFQRVW9tbJnmOIO8155oh086q9dlvzO9gaS85szv6axTjHe7duDM6DUfE7OAYoUMeCvKimip1E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fwQDq97ldu3wfgy4SkrH9jWrSiJqBFENXlmDGhK/Hv404GGVU
	/I+PkrfjTJ3d0s/1NaRB2EetP7L3n69yZakgjB+wu/eiSlaNUuHM3y6TKuE0xrKdejNcVJDudLC
	CKD0sC3pgEvtSBxLk5Z12BPaMFisrPc8aA1XlW4m+
X-Gm-Gg: AYBFou2Tyc2nwIbFTnnvlR7Uc/MqGRDL2XiHFINiO2EB+dm2hVb1tDT+Tc2AwePyMi9
	GLzwhElE70J6bxxY/C22YXtgjPcscjpvzrVoYsT+3e/o3L+Lj/57lfTKdphn8fCeXzDZU+sKDm2
	7Fj00UzIhiExCQ2/hXCkTujN56YEKOv5hj005/qYDTZPtLRTV+v5NjMCYaLLTOqcWgNOCpnsOmv
	go1bgJHcrG0QVRg80caByqree7MEHFPsGV2ZHfF5DzENkoKC3mQyEsTVpArX/ISXevREkw478S8
	DmXIrZmDmK3/xHpKAUfuBlPR/xGrS7ZlFya8+JZWB3lERphv9Yr34j8YCw/jJ5TqeXDnue/fJmn
	CHM98DmDtczq94Xhbql9VtMq23PvJKGgMz57J
X-Received: by 2002:a05:690e:4504:10b0:67c:7c1:bdac with SMTP id
 956f58d0204a3-67c6801c387mr697001d50.58.1794382537762; Tue, 10 Nov 2026
 23:35:37 -0800 (PST)
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
 <CAGn_ityW5Z+JEcTL9wKnQOgLXhjXxC357Q=h95AgR9xP+pcmjA@mail.gmail.com>
In-Reply-To: <CAGn_ityW5Z+JEcTL9wKnQOgLXhjXxC357Q=h95AgR9xP+pcmjA@mail.gmail.com>
From: Sid Nayyar <sidnayyar@google.com>
Date: Wed, 11 Nov 2026 13:05:25 +0530
X-Gm-Features: AclHuK-gFbPnqlWbdZN8aht-FIvpFP1KgQo9SMmyTpNb0jJxnVbTrvwFSqbrNnA
Message-ID: <CA+OvW8ZADPDZJYURT+a2kwvWcsgdJvzP5Q9sJuvXnnL2kgZ2dQ@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 0/7] bpf: Support struct_ops in light skeletons
To: Anton Protopopov <aspsk2@gmail.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
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

On Tue, Nov 10, 2026 at 6:43=E2=80=AFPM Anton Protopopov <aspsk2@gmail.com>=
 wrote:
>
> On Mon, Nov 9, 2026 at 10:40=E2=80=AFPM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Mon, Nov 09, 2026 at 11:46 AM Ihor Solodrai <ihor.solodrai@linux.dev=
> wrote:
> >
> > > Andrii, Alexei, wdyt? Any other ideas?
> >
> > The loader asks the kernel for ids, sizes and offsets only to pass them
> > back in the next three commands:
> >
> >   the loader asks                   and passes it back in
> >   --------------------------------  -----------------------------------=
-
> >   id, size of bpf_struct_ops_<t>    BPF_MAP_CREATE
> >   id of <t>, index of the member    BPF_PROG_LOAD
> >   offset of data, of every member   BPF_MAP_UPDATE_ELEM
> >
> > the kernel can match by name instead.
> >
> > The kernel has both BTFs. BPF_MAP_CREATE of a struct_ops map demands
> > btf_fd of the object already, and bpf_struct_ops.c doesn't use it.
> > The kernel can find its struct_ops and the members by name,
> > like btf_parse_kptr() finds the type of a kptr.
> > Then the loader passes what bpftool knows when it generates
> > the skeleton:
> >
> >   command              the loader passes
> >   -------------------  ------------------------------------------------=
---
> >   BPF_MAP_CREATE       btf_fd, btf_value_type_id and value_size of the
> >                        struct in the BTF of the object
> >   BPF_PROG_LOAD        attach_btf_obj_fd =3D btf_fd, attach_btf_id =3D =
that
> >                        struct, expected_attach_type =3D index of its me=
mber
> >   BPF_MAP_UPDATE_ELEM  that struct with the prog fds in it
> >
> > The kernel rejects such BPF_MAP_CREATE and BPF_PROG_LOAD today.
> > Nothing changes for existing users.
> > The BTF of the object is in the blob, so the signature covers the names=
.
> >
> > Then no need for a helper or a kfunc. The 4k buffer, the fds of module
> > BTF and the offsets at run time go away.
> > map->def.value_size, prog->attach_btf_id and prog->expected_attach_type
> > don't hold offsets into the blob.
> >
> > The diff below replaces patches 1-5. Patches 6 and 7 stay.
>
> I like Alexei's approach here, it fits with shirudo. I also have tested i=
t.
> (Patches 6,7 weren't tested, shirudo uses libbpf without bpftool.)
>

Thank you Alexei, Ihor and Anton for the reviews.

I agree that the loader's efforts to find out ids, sizes and offsets
for STRUCT_OPS maps and its members is wasteful since it only passes
those values back to the kernel. I will redo my patch series using
Alexei's proposed approach and send it out for review as soon as
possible.

Regards,
Siddharth

> >
> > [...]
> >
