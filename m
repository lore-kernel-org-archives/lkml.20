Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1F04AEBD4
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790957277; cv=pass; b=OcZTTYf4/tJ9Z+JMtf8NzPs7QwP9mNcXZmbEFnJEZ/hFNhA5gog/NH3yXP7edgYmXhe93Xb3SamP4lb4lvaPxy2tBCCdJAR71ri7qV25Ym+c4/yfV76TzItsrg0iHxjwGK43h10liJsniM6lvEBavlfohz2ZOHFWLdQwyxVQfdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790957277; c=relaxed/simple;
	bh=nEN1DIepvzc1Fgr9k7isyGujerQNKYhNcd2jD7tCdaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E8t4bFP3f5TJAYQFLeUm0xVkHOiJlGwBjZbSccyQ5Vt33lgEHZyRTwxQ8XBeh1lLjwfNRC6tUvOILK6T7jCrhghTi0+wpSLMTJbUf/mUhltfTrLJb5YKUcpTV4TB3d4jiSY3Do0cEIjuhxSkdyUqrqOA2GhCWa7vWQBytWCRRKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PExdJj7H; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PExdJj7H"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a026611b2cso4485e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:07:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790957273; cv=none;
        d=google.com; s=arc-20260327;
        b=Ac3JzRgzat/IdoIOIF9O2u2NxxMqdfjSWJuIwkrIMI/8e7eASfMOtmD35gsIviCGm0
         XS3S4vnfuCHvRf5rKK8V9U8cm/2t/X0OrelH7+BxHDRDz+MmG5Vx4rCc33fZYEybJBT8
         FopqwYOiMoG4eYykynEMoipSPxa016Cs5x08xFGhMeg0N1ZfiMvNIoXeJ5ZmlhPMa/QQ
         iUWzPLPmCjiXy0OWv1TJLYvg2zgRA3+iE76pYASpO7dsfBVi9BzrYa+29PDZvbgY++8u
         zLT5xuOHpvxehJbUlFAZv18L+J4kLGcINjSPgVT/mz42zz+7BFBQXQnMv2J3DzLcXI+k
         zbkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oBStq7HJ1HhU8r8netCSqoFuNNT8K/NJyM0kHcdEpJ8=;
        fh=ZS62bmHqtt9O7WfFJxeb6wmgLDq4sMHa4MIt0qAFnXM=;
        b=MDHlR7tbFH1AKOr41H45ykbOMZsD5Tqy/v/bzATHLazzn6vdQinOXBqZFIniaxa1hz
         r/TlRUalXw5B0Z+ko52GtQAR7YRoS50qV4d8U/zALiP3scz1sH3nggi4hgECG0d7Ugj3
         iHIztpGpI3da6yPybcXFNu48yok7t3HUrMqu9i9W/AZ5A4MlxPwBCBv8euJcJ8ZQxqs1
         kTp/rQ2XFhfqFFQt2CgCT5yt5HHzZbcpxmNxvyt0tKx8TuoAQCcs9FjmPXbGAw1WV5qL
         q8zUz8pXANdqe35IVg3pf+ZgBVAMZH8WMsloHkkcUZ54vxUmNCaRu4AsiUvcdOQD1tMn
         bWcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790957273; x=1791562073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oBStq7HJ1HhU8r8netCSqoFuNNT8K/NJyM0kHcdEpJ8=;
        b=PExdJj7HUajqC/dePW08rpkWReBzXIiM5EWatRkCE/Ftaoe9f9w85cLKfgo4rIMr7h
         UIzqF8l16tc3zy8RTpNwluEwtIpQFRIviCSWoMKeDQ1v5Xo0fksE/tYGRB+DUqpUx5dJ
         CB4XGmnBDk2Hi41htsE6t7fRaEzEs1FD34G7P9/lQjFJrr6NdnRnSKK9Hkh+CPeKsQUU
         gOHCAnNruoj135QMOKlxSTkec1HEnSoqRI56r6D1SB2ItiR5d8Sh/MOHXo8gYiyQWv9L
         M5Zjd2+u4BTqc5uU8qNGalKn/tyD/MFkogT+VTl+gPVriBnLpkD9ZcrfVxtUbsuuxQR2
         yoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790957273; x=1791562073;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBStq7HJ1HhU8r8netCSqoFuNNT8K/NJyM0kHcdEpJ8=;
        b=0N0jjMIOzl3lfR/tP24Dzyav/64kDDs2fagpt0eE9ukXftuGZW4nn9tsBNR/qnytRo
         V54NU1E2/w0+ML2hbwxTQO94qz4uTs4cvfhBjTyMibU3S84RO0yx3RTx1+o8ja0Bq9yb
         2X05z9FKx6jBpMBevCpnHifAy+RvFCmoGOYiSuKoygss/huPIv+kS1iTnPANmEhazDwd
         4GdeCUW+jxiC+4RfRlVsR3mf9SrLWyF23PRAgIa2bFFcfq5H5R7EMIXbBY2ixPfuePB3
         2RiLo1fAF5p5tOc3RIFkCL4D5Z0hDkF7STgosSyWFmuXzuk4QqHCCGSi+wIp4PxAUpkM
         KSzA==
X-Forwarded-Encrypted: i=1; AKwUvBwnd3kdkkfUTQR2JokdEkmRycVLXjE4AJUMd3O6oF9cq3cC/q+OP5+dGmY2PiMvn2rAzDk1WUWprMOIV4s=@vger.kernel.org
X-Gm-Message-State: AFuF++nULepnvvhwtJP6OV6YoJPAO2i+zGkurWCSzC26d5PCwMO8Lcah
	m/h1BuFlcxcGPSh8GZei6yFNNzsiqXWHFOQwcDjfQj+K4sxhhvs3QBnoaig7M96wrIkZVEsCEWA
	qFtfwCQvm5BKmJzQVyW30H6QqWnpmTTU4DY0t3ycbftHiHvMO978gpkUcNu4=
X-Gm-Gg: AYBFou0O97cqP4T+5sblAbHw9sUb3iwxxGiTnG1uRqlabNp+e2i04eVA+VPaCNI/dua
	uCzONOqGyM5bSlng8jM0ulp8UJCZUDxzNAMC9Fgu753DhPyGgyU8zR9qtQdcHkfyQE9vhNltM9H
	VfI3JtIF0HvlgwWZu8b7UJ960kYggWanQJ5qUEkMaAQK5yS9oisd5BEcIFFF1FpMB1G02tUV2kX
	uZAf9MK5h62/qQUZcXJpJ+9Pcstxmn+wkJgwd8NFfO/os53rDaNuynO2Tq8y6PFzAQ3tw2W3r24
	rvvCyq/WURYKRjXT+ld1fgAdpikLjn3GzZq5/hYFF9vAvEsIbBKJEWctPWGcjNSfsJNOsonedrY
	Rb/915ChP92w1anahJR8jpcZ0FvGnIQbLm9VaLxXehhBRhQ==
X-Received: by 2002:a05:600c:3042:b0:4a0:1c0e:b0ce with SMTP id
 5b1f17b1804b1-4a03046231fmr638255e9.14.1790957272991; Fri, 02 Oct 2026
 09:07:52 -0700 (PDT)
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
Date: Fri, 2 Oct 2026 18:07:39 +0200
X-Gm-Features: AclHuK-StPJkxPtpdx6pksmBPmFtHcY7P6COXSJ7pVVXPbMDG4w62HB5ZrLWtWQ
Message-ID: <CABdmKX37kKrOApa+cwNrfQ6YU8fn3pkFp2TjCjagFGhXPQQszw@mail.gmail.com>
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
>
> static inline void bpf_lru_node_set_ref(struct htab_elem *l)
> {
>         struct htab_elem_lru *l_lru =3D
>                 container_of(l, struct htab_elem_lru, elem);
>
>         if (!READ_ONCE(l_lru.lru_node->ref))
>                 WRITE_ONCE(l_lru.lru_node, 1);
> }

The htab_elem type is internal to hashtab.c, so I've added a helper
htab_elem_lru_node() which makes all the callsites Sashiko mentioned
one liners.
