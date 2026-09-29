Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C2752E06A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699748; cv=pass; b=LeYRma2hxI2ZBWkKxfUa0ofeu3vO8Sqwmt1e9qczcydn2TFax+NYNDCFj/o7fgSOgKIPRIkyI6hbgiIgnHMVvOSxuVlSj2v2W7a+3LdaaFWGGUM8/8+qhDnpyzygK4cZxru7mR0+wRc+aR4E/Xz1yCG6zWWbNFzw2O3NUquovT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699748; c=relaxed/simple;
	bh=0p3ig6siP4sHsCraok5QIGsO9n0Tprr3D6KZrCbEgbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y2R1fA2msuP1pxxeGruEnqsr8NkSeihoGZtvixg2TELyY8tN39//e0yHq0Y9TICVBqOJLMc0uB9Eiq/xD2/LbEMduQLYSNWNP71h+2x5y9JIjg9J3Bdm7DZWvFP8ri2dXVCx/2AQ5yNObfe4GYdONxd7Dg4tRNFQ7g9HpyCUElw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QRHCKk2A; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QRHCKk2A"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49e6425f96eso52985e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:35:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790699744; cv=none;
        d=google.com; s=arc-20260327;
        b=qIGQFaUyGuE9tNwYNRcFjvUsx3vagTlmtVnIJWY+JyaKdlvVdeRsEqX0GtSQY+ZYwZ
         wgFOSemDdMpvLlJg3hGBwBTmIiACQPmywTqArYyRP7CmSWKTZ71CNEFZj0oNelxU3izp
         MJkNOBjAxAmhJtU2KixVSi2sZc/jy9VKAOyLkv4+pCUh9YrEEPIqasCsAlmvJQF5Zo81
         oCRpTKWG/E2TnPG9xZEs8TAeMBaZ9yhrFdTG9nCRPJdOGugJpZvWujh8zstFVKvSldJG
         6WT9Pc4v25C3fP+wKqRa2FSMgQKMjIs4G6qUzxq2OpB0H5zOZUXV6jfaH/bDVVqcIP/U
         6leg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZzlAYjPHzUF+Xy0aA/hzlKYo4+ZBDVDnjvm4B+qH4Ao=;
        fh=6oLtEKh3Bp0he8b2tKV6Y26IIX7HTpGjd2dSHfsFbjM=;
        b=ANy7TcR+eTajPImgC9nXruqhh/i6Vp1a9e2j+OxcnOwFITPwVQUKOlGlqEFK9jCcuQ
         dZBcQ6B1+chkCa9nWtMc/UoGMJcmxmUom/HoswtlzecMMecQHCgeHuahHP0sDESWG2zV
         ofH+zp7RvqzP5oS5VFxc3GxBpuBBuRODrDpbwg4M1R6LyETDKiuL3osxk0XgvzsxFYr+
         lIj2lMZXOdSNxY9Jeh6XuGrG1KU8bLsh+fEbpC6TjYrczJml62b7HPOeZTpV7jZ1lhKE
         ChwbT0jDaXCfT0v67xS2f8lylTDCWWYKMy+ejHCvywMf09X7Oa9x+OyEvRuT0b1ixA50
         3erA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790699744; x=1791304544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZzlAYjPHzUF+Xy0aA/hzlKYo4+ZBDVDnjvm4B+qH4Ao=;
        b=QRHCKk2AH1o5UqLCJ4EkE7XehSk8K10RjrPqPAXa9csb8xl0v87anuE1k25D6UYeac
         oE16ZYXN5oMcjBENX6d+b+Q8EYUVMLOiGym6zgFJWq0ZiqRMiWoFksSWoAYalwp4Q1jn
         tkHUOnIhRJxXT3GCRzhQ4RrnwMVPTpegJOXqyiVwnrd7rJZfHGQcoAmeJ5sB4Qr3iluN
         fXv985E2+BuvVx0658TGCXfRyHK1iqzrID04PhgRv4M0S1UNyWsvie0mUgxy1RWMNbTL
         ZBt7IyagEAEKEnMfKO3v+/0J5JU6DpMMphy2FE+0aitfhpUidny77nvvlQD5nklshAut
         GiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699744; x=1791304544;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZzlAYjPHzUF+Xy0aA/hzlKYo4+ZBDVDnjvm4B+qH4Ao=;
        b=VPyZHeekyP/dVbmY7sAqcEqNKFyrQYQTAFq29Qq9v+2vekpsFQuerNrXSPP9XJQ/Oh
         2LwK28P1fIqws8Po7t0vCQIK8z1ZgWbv3dt8FZGJe/sc5IiCpG4t0tzevQ5+UmH1KX0O
         4gp6FihOQRSI35wXsLpsYqTDiMhnKE7DxyEusOeEbc/x2f777yw1g7pP7LxY9eQzwPKs
         5V64RyOPKfs/X3K5+EktGSGb+KqG1eB+a3DCAm52CZbfkkVpR3/6Zy0Kp90IhQ9HqH1Z
         //gfQINgOKsC8Y3XKCGLAUi2bRz7TQjVyKZkpGkIPZS40AfC6aVUMM3t+LtOVRdvoLWe
         F2ng==
X-Forwarded-Encrypted: i=1; AKwUvBy/EcT6R1BFBxbINbCzscr5nEombclPva90ycC40PZkBm6Zn9VdZCTVZ83GZwRm1vTF0zirjkJ+QvEN/2M=@vger.kernel.org
X-Gm-Message-State: AFuF++nrwCvPJgFNGv3JCW0CIzb3u9wBe1Sf1e7QEgDMj5PcJTfk/YVx
	Aunbkj7lWaNnmat283//e2xoGIIVaeJ+zwyWVXNVeYsOrASnQ2u+FhLa67TLNae/U4ZG3hlSycv
	oOHLH3mvVnSO02c1JJXp6iiOF0AinK4Ele34mVuAf
X-Gm-Gg: AYBFou1OI7NVn/JudNK3QLejCmqMMP/7ZRYfdVAz+yAfACXgONl+aaY3tSh/ROwYETn
	ZIo7PPRCuNLtl/ZfVTEu53CRY0OUjCUFJZJrcnDLJIyrOLds89thiqP5X3E340xhefkrpJQzQaj
	mNBczilUpG7/ra4+d7IWyArFv9sIflBCBxWIwp4zgiUgRKVw6yNnSt+JANfzXKpmOajsYu5O9Ht
	QkHExIer9MtSewoGJmi8a0SjtOFrxXy5uZWJH/X9shBkT/arQJU4a+moCcOThToZejBrw/iXXP8
	jGUev/2zodg4SQEFwscxIAKRI0u3Y4fqpNjzr1UvrmU+Abiz8Z2TzoiW6r1FVo5zAa4/K2aeUEn
	XUwZ8CfueCkbvcNtWwNUIRQ/l7VXDlRA7Dgw4dHEIifltDg==
X-Received: by 2002:a05:600c:5715:b0:4a0:1282:cf4 with SMTP id
 5b1f17b1804b1-4a012820e67mr411905e9.11.1790699743986; Tue, 29 Sep 2026
 09:35:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928150121.1712559-2-tjmercier@google.com>
 <714f119d120fb9ba4aa7e82af621edb7bc97813a760c9dd2cb5363c55b7365a9@mail.kernel.org>
 <1b41e278-f00a-4e25-a319-ba69186d92c9@gmail.com>
In-Reply-To: <1b41e278-f00a-4e25-a319-ba69186d92c9@gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 29 Sep 2026 18:35:31 +0200
X-Gm-Features: AclHuK8T-LyWIRVBeNrxuScl6NHMsb-famc_6WB_6okWGHfF_SQujmf4Poi45Ao
Message-ID: <CABdmKX3X7P5USNsJxmkVjBg6SW=UtkK=Pusviz0ibzhaL2A0CA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v7 1/2] bpf: htab: Split htab_elem_lru and
 htab_elem_pcpu off of htab_elem
To: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
Cc: bot+bpf-ci@kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	emil@etsalapatis.com, ihor.solodrai@linux.dev, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, martin.lau@kernel.org, mason@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 8:31=E2=80=AFPM Mykyta Yatsenko
<mykyta.yatsenko5@gmail.com> wrote:
>
>
>
> On 9/28/26 4:46 PM, bot+bpf-ci@kernel.org wrote:
> >> diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
> >> index 53c99fe4f176..5db11a21ce98 100644
> >> --- a/kernel/bpf/hashtab.c
> >> +++ b/kernel/bpf/hashtab.c
> >
> > [ ... ]
> >
> >> @@ -828,8 +861,12 @@ static __always_inline void *__htab_lru_map_looku=
p_elem(struct bpf_map *map,
> >>      struct htab_elem *l =3D __htab_map_lookup_elem(map, key);
> >>
> >>      if (l) {
> >> -            if (mark)
> >> -                    bpf_lru_node_set_ref(&l->lru_node);
> >> +            if (mark) {
> >> +                    struct htab_elem_lru *l_lru =3D
> >> +                            container_of(l, struct htab_elem_lru, ele=
m);
> >> +
> >> +                    bpf_lru_node_set_ref(&l_lru->lru_node);
> >> +            }
> >>              return htab_elem_value(l, map->key_size);
> >>      }
> >>
> >
> > [ ... ]
> >
> >> @@ -1310,16 +1349,19 @@ static long htab_map_update_elem(struct bpf_ma=
p *map, void *key, void *value,
> >>
> >>  static void htab_lru_push_free(struct bpf_htab *htab, struct htab_ele=
m *elem)
> >>  {
> >> +    struct htab_elem_lru *l =3D container_of(elem, struct htab_elem_l=
ru, elem);
> >> +
> >>      check_and_cancel_fields(htab, elem);
> >>      bpf_map_dec_elem_count(&htab->map);
> >> -    bpf_lru_push_free(&htab->lru, &elem->lru_node);
> >> +    bpf_lru_push_free(&htab->lru, &l->lru_node);
> >>  }
> >>
> >
> > [ ... ]
> >
> >> @@ -1500,15 +1543,18 @@ static long __htab_lru_percpu_map_update_elem(=
struct bpf_map *map, void *key,
> >>              goto err;
> >>
> >>      if (l_old) {
> >> -            bpf_lru_node_set_ref(&l_old->lru_node);
> >> +            struct htab_elem_lru *l_old_lru =3D
> >> +                    container_of(l_old, struct htab_elem_lru, elem);
> >> +
> >> +            bpf_lru_node_set_ref(&l_old_lru->lru_node);
> >>
> >>              /* per-cpu hash map can update value in-place */
> >>              pcpu_copy_value(htab, htab_elem_get_ptr(l_old, key_size),
> >
> > [ ... ]
> >
> >> @@ -2505,7 +2551,10 @@ static void *htab_lru_percpu_map_lookup_elem(st=
ruct bpf_map *map, void *key)
> >>      struct htab_elem *l =3D __htab_map_lookup_elem(map, key);
> >>
> >>      if (l) {
> >> -            bpf_lru_node_set_ref(&l->lru_node);
> >> +            struct htab_elem_lru *l_lru =3D
> >> +                    container_of(l, struct htab_elem_lru, elem);
> >> +
> >> +            bpf_lru_node_set_ref(&l_lru->lru_node);
> >>              return this_cpu_ptr(htab_elem_get_ptr(l, map->key_size));
> >>      }
> >>
> >> @@ -2521,7 +2570,10 @@ static void *htab_lru_percpu_map_lookup_percpu_=
elem(struct bpf_map *map, void *k
> >>
> >>      l =3D __htab_map_lookup_elem(map, key);
> >>      if (l) {
> >> -            bpf_lru_node_set_ref(&l->lru_node);
> >> +            struct htab_elem_lru *l_lru =3D
> >> +                    container_of(l, struct htab_elem_lru, elem);
> >> +
> >> +            bpf_lru_node_set_ref(&l_lru->lru_node);
> >>              return per_cpu_ptr(htab_elem_get_ptr(l, map->key_size), c=
pu);
> >>      }
> >>
> >
> > This isn't a bug, but would a small helper keep these call sites to one
> > line, matching the pcpu accessors this patch adds? Each site now repeat=
s
> > the same container_of(l, struct htab_elem_lru, elem) boilerplate follow=
ed
> > by bpf_lru_node_set_ref(). The patch adds htab_elem_get_ptr_to_pptr() a=
nd
> > htab_elem_set_ptr_to_pptr() for the pcpu variant, but open-codes the
> > container_of for the LRU variant at every site.
> >
>
> this sounds like a good refactoring:

That sounds good to me, it shrinks the diff a bit. I'll do that in V8.

Also, thanks for the Ack!



> static inline void bpf_lru_node_set_ref(struct htab_elem *l)
> {
>         struct htab_elem_lru *l_lru =3D
>                 container_of(l, struct htab_elem_lru, elem);
>
>         if (!READ_ONCE(l_lru.lru_node->ref))
>                 WRITE_ONCE(l_lru.lru_node, 1);
> }
> >
> > ---
> > AI reviewed your patch. Please fix the bug or email reply why it's not =
a bug.
> > See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/REA=
DME.md
> >
> > CI run summary: https://github.com/kernel-patches/bpf/actions/runs/3644=
1357391
>
