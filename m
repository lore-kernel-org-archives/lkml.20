Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794396330;
	b=YTe2Dufw/sXqxEpWteo6O3Zrl4krO2OpnttQ7Dcs9NLNxYwpmUXNxTxc24Uvc4gpkoaU
	 gsGdNis/Sw23iLtXGlXv+E+TrilfO8nbjdeDsoSuTrEQY+fa1XKmlzMdT9z4sC9nS+kYI
	 454rkGCh8G0nautzgJbEwaiVTwYAQAZtz+3f7vMvbwiOhjhiVeseGwjzk/wymhrZY80fk
	 xR3+kNlwo7mcY28YVQ8i5F1mM7bn3yqpmoRcmIOtjTvCR4fnXvkfPKQoW6z+HR/p4Yjd+
	 VtURJZeF9JOaIxFH7dzHbUzeVRwTUsXbolDVdPipM9agEMFbR3ilDmeMOhV8pOMoZOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RQM3vRQ/k65hcNzWHMMmTbRmdgaygzzzb4KWlaKkg/4=;
	b=Qmmr/6clEjYXhQl6tmPtudzkCdTzR7Ic8xPionKXa/8dle2jECEK/bWipBMM4n+BnRWy
	 TBSUDRva+75+f0FBUZcQETgD5Q690JK/9XinZ7RUFVBfYv6dGF1zdeCBwYvSPhBUA+n7r
	 82cKiLuHbFzAUR/I2opV9JkEfRfSQCiFdGtNCKgSWyqq24V9VWRVg3EQL1j1EIXfBqZdF
	 uL59yLpz1Y6Y3bJpHttYY9Xy53pHr8sZ2dxGg4DmxLm58pdkuZ2Nj8mE+Ge6QCi75anWL
	 105mBUWzblefzzOzeAYP8gWCeFXXUGCVOppgUjB+tPI8xMpuzOmebJ43VkQxwuZDQXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="iYNPu4/Y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDA1606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DDA1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iYNPu4/Y
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15ea896ddc8so4743110c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:25:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794396329; cv=none;
        d=google.com; s=arc-20260327;
        b=QDtb+x8Q60m+iIY5klQZmXDqy/KVSamnjsQe+8nLP+DetQHjc0oUBeehykvaIRW7T3
         AYyReyAYNLwuM2/eIFZNepgyvsv4tWzRrVoa0tIEVc7TnQhUEa8LbxgRWa6eMa3TtXER
         3cxNfaisWeQ+TsQFovFdqJOh6rWtO3hNR+FOpERgkbOk7UcgUjJTLzkkHgLmwv+ZLhKp
         3zy40UDjwrxIRiqd0Ew1RNotUfXc1gojK2/UbGhYFqy91ScWmpvZlu52bI+ra6YKBMg8
         /TglGjtn4yVt7+1aONvFtuSyphYG2DpVhKbCzBRpaeisZ4OAr2Uvzxm4SRXrJxlNmKLk
         5+BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RQM3vRQ/k65hcNzWHMMmTbRmdgaygzzzb4KWlaKkg/4=;
        fh=wMDVhKqpBxfIcpuhIpBvQLZTufetLmvfpgqWAVmSH+c=;
        b=BY4P+rOIXqq0jtxxkbcKLbxYtbe9naVZ46cQl0qycsBU2vKc8RhJ1yosWmuS1O+NHI
         gbH7pwNqU85xmIRHZqnNf3Jr3HUE+8VxMnZ7ZVdldq1Q62+sVOuf0h9UOxWWJW8vf5oi
         Y4aTgnydfYfx6WLkV7s+aYATOw6adw074AdAD3hlmWohMWsK/ErzwZkcqi96pX1Y1GJs
         gsCyA3uKrlxNKJ89AyQmvyzLUUubO+0UUEfQgyPi5XeJjMmpcmRfAC+DfrzaQwS7Pb0t
         7UNXo/7hQ/6xsmz9FAmUEKnNMrMRShu984SVH/3PnhhRyW70Zr9xUDK7EJiwyUEL6DyE
         B4wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794396329; x=1795001129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RQM3vRQ/k65hcNzWHMMmTbRmdgaygzzzb4KWlaKkg/4=;
        b=iYNPu4/Y3UATDiZVcfYc1q1iLPT7HEFEtYe/u4rgmkeYtcmcNLnVbvlPMWYc3KXGm/
         eYbr+duIAENzCVxdCUBdTLa3NX6BZhGg5TukCoQAdw4K6BBTfomJeJLvBAtkio5Uyomc
         7BpCNo/SqlqOAbUTHEm9JkJJGAcYcN7y0VcFDRYx0Yls7BMhs3wqbAdn4VZrGNaKNY9r
         GPyfHyv0YlIZFwNtxGcW7z6ORzhWRhIPiAX2cdzuQS6uv0+TnAYxe0YXZaCG0chFZi7o
         k0rbCj8tkKXaY2ywljkvK27BpCJha2zLyWSCpt0/gXtLSI61cd0Daqt/+7AZIkwH0Qer
         rnrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794396329; x=1795001129;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RQM3vRQ/k65hcNzWHMMmTbRmdgaygzzzb4KWlaKkg/4=;
        b=iWcB9s2Y2DeKI4sVW6N3jnmL1zTSEDba3FkUNWH1klEBjJSKki7BJkKJlsWmyTPfx1
         Utb30DDi/INlb6HThrVa8GrlWCioEVdWTLb+PixSLcst2lks88HrC/3p6xRYohni+nJ+
         JDkHQNMJgRsHNPj5M03Jvphs1tuFozsKKPbVqV9f6RExxzyGLhmtTiD5SjqrT/HluNw1
         FYX7/yY5S92UNr1Iw8rAenJS58nbiV/OqQvXNXrGDHeJz4lvzM4owGCfJce7NhIITAcR
         h9QN6c6dB8YQGF1+0YWtGcm4E7K404m9vaz3TFgDPfQ9rlMrOwLiAsrpXdBZiuq0nuhM
         0kXg==
X-Forwarded-Encrypted: i=1; AL+hErFEISqz0nDJEaJBx3QdmdgjktHyd124NbHQ7e5QIOeYT9TP+6qQGuFZVoelS7nalD9MtGO/RREAWWItnwc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hGFsEwe4QrtYQV9yPVD/pw3ETeseLkiNMY0zMmVtI5lojyMMz
	HL7p9zIXQE6mqfTImQnjySUg8K0mLuS3AalR51hBnFeJSFQ9drk/M5ySvCTaUSgPGL+TRtusItA
	AeqSPl/8Fcdd9G8fQ4Xse9R0CUs3qN+4=
X-Gm-Gg: AYBFou3kVvPCrveogmd6A7203NQe0mkTNab2NbmGDlfvYkRuf7yIRVf7Lr10NEK1BCt
	ghYrezj1LPULxV3ccSn7EOKKTlM+hFTbejrzVI8jcXqzoia/+J6Zbqz1b9d5EtJ0YUKId2zeIuR
	eyuqPWIIVhrRuNyawe3cqo3m0nz6Dn20kj5G4QBnp/G9J1pC71PSR7ue1sVwY6xgk9R4qb5EDxM
	s6x1otvsNq11erkixVSDGuQaT44pULFpjMVtN8PH5FyBaAeaPfGGaKOZ8xQypQDGut2JnCag119
	O9F/bp8HgJ+sTEUyL6af1SZuoFzbmvZ6EeMI3fBJihJCseygzbnk/Irr0I7oSwzWZXcGY5054nB
	THe50dNWcv0T5xQEFZHOQT4RmCi1b4Flmv3aFSw==
X-Received: by 2002:a05:701b:4583:10b0:1a6:4679:6cf4 with SMTP id
 a92af1059eb24-1b3c034aac5mr1833398c88.36.1794396329056; Wed, 11 Nov 2026
 03:25:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110164046.454431-16-a.s.protopopov@gmail.com> <f0cac3d0039b840d9e1cab4dffbff15923f87115dda70351043219df57fbd4d8@mail.kernel.org>
In-Reply-To: <f0cac3d0039b840d9e1cab4dffbff15923f87115dda70351043219df57fbd4d8@mail.kernel.org>
From: Anton Protopopov <a.s.protopopov@gmail.com>
Date: Wed, 11 Nov 2026 12:25:16 +0100
X-Gm-Features: AclHuK-c_MqedBoRZ4SvekPJBUyZVgQfnPd-lx4-godoXQbKoO4ZRLhpAZaTYE8
Message-ID: <CAGn_ityTsSTiHjh6Mm8QfrhWWoUqm4SiCRYuJdHVwp+dZxk9Uw@mail.gmail.com>
Subject: Re: [PATCH v3 bpf-next 15/18] resolve_btfids: Tag fmod_ret candidates
 as targets
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, almagui@kernel.org, john.fastabend@gmail.com, 
	qmo@kernel.org, brauner@kernel.org, kpsingh@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, sashal@kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, martin.lau@kernel.org, mason@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 9:21=E2=80=AFAM <bot+bpf-ci@kernel.org> wrote:
>
> > resolve_btfids: Tag fmod_ret candidates as targets
>
> TL;DR: Nits only in resolve_btfids fmodret.c: the second branch in
> relocation_offset() looks unreachable or wrong, and record field offsets =
are
> hardcoded in three functions. No functional bugs reported.

yes to both nits, will fix

> > diff --git a/tools/bpf/resolve_btfids/fmodret.c b/tools/bpf/resolve_btf=
ids/fmodret.c
> > new file mode 100644
> > --- /dev/null
> > +++ b/tools/bpf/resolve_btfids/fmodret.c
>
> [ ... ]
>
> > +static bool relocation_offset(const GElf_Shdr *target, GElf_Addr offse=
t,
> > +                           size_t width, size_t *result)
> > +{
> > +     if (target->sh_size < width)
> > +             return false;
> > +     if (offset >=3D target->sh_addr &&
> > +         offset - target->sh_addr <=3D target->sh_size - width) {
> > +             *result =3D offset - target->sh_addr;
> > +             return true;
> > +     }
> > +     /* ET_REL relocation offsets are relative to their target section=
. */
> > +     if (offset <=3D target->sh_size - width) {
> > +             *result =3D offset;
> > +             return true;
> > +     }
> > +     return false;
> > +}
>
> this isn't a bug, but when is the second branch in relocation_offset() ta=
ken?
>
> For the module sections that use this helper, sh_addr is 0, so the first
> test already returns the section-relative offset, and with sh_addr =3D=3D=
 0 the
> second condition cannot be true once the first has failed.
>
> The second branch is reached only when sh_addr !=3D 0 and offset < sh_add=
r,
> which would be a linked image whose r_offset lies below the target sectio=
n.
> Treating that address as a section offset would be wrong there.
>
> Would it be clearer to pick the interpretation from e_type, or to drop th=
e
> fallback?
>
> [ ... ]
>
> > +static char *format_values(const unsigned char *buf, size_t offset, si=
ze_t ptr_size,
> > +                        unsigned int encoding)
> > +{
> > +     unsigned int nr =3D read_elf_value(buf + offset + 16 + ptr_size, =
4, encoding);
> > +     const unsigned char *p =3D buf + offset + FMODRET_META_HEADER_SIZ=
E(ptr_size);
>
> [ ... ]
>
> > +static int choose_functions(struct elf_function_list *functions, const=
 struct btf *btf,
>
> [ ... ]
>
> > +             if (!read_elf_value(buf + record + 16 + ptr_size, 4, enco=
ding))
> > +                     continue;
> > +             stats->with_values++;
> > +             flags =3D read_elf_value(buf + record + 12, 4, encoding);
>
> this isn't a bug, but the record field offsets (flags at 12, nr_values at
> 16 + ptr_size) are written out by hand in parse_records(), format_values(=
)
> and choose_functions().  parse_records() has already decoded flags and
> nr_values, and the other two decode them again from the raw buffer at the
> same offsets.
>
> fmodret_metadata.h has macros for the magic, the version and the header
> size, but none for the field offsets.
>
> Would it be simpler to put the offsets in fmodret_metadata.h, or to have =
a
> small helper return flags and nr_values for a record, so that the three
> functions do not each repeat 12 and 16 + ptr_size?
>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/429818=
85558
