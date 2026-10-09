Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994233D7A01
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 22:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791584601; cv=none; b=YRngX4ZlfN9mYfGNsmk8Ts5S3Bbcqwoi6TwbaKPXz6uoCdhIhCn/oRLqofIz4yh3zRFLsYb299zsamdpo7+fswuUCPogcnm6448zYLjEkdJuYD5qMbLQbhrQQIWA5ksabbRGGHa0DefQKCcIS9VtryP8LKCOiC4JuPCrYaGXN64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791584601; c=relaxed/simple;
	bh=oEOF+cXS8ud2jX6ndlbojo6oLcgLkCK4AV6a8qGtXdc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FaZMbNI6dozMXL0g5rgz+NKv4LjO2rgpJjwGe76b1rumO5dCsk5OIr1U0BmogTeRAqjbuESoqeN+jVaVK8ESetBfamHKlShw6eEMcd9x5cZdX8bEkDLRl2ly8qCOYEF0M4ZCMpuRV02LewJH4ju222OX1GfE8trGUW09l1hVRD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UaosuFz+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sACMEil2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UaosuFz+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sACMEil2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791584599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1kJjybFGSYZCppzp0ILAQK86Y2LNrWWZ0v/kRNoEipQ=;
	b=UaosuFz+GZjbVMeoCcwxUXNICVlixg0lDGMmgBX3s8QbFD0FR5o5HoK0EjTS3PZVufsCrr
	lCV60pOIHWxHi3aXvvzvWza6Q0ijjlBctthUHKWQDINlZui8QXPxzsDyiTw6N5TVCbI96I
	e7QNqk2ypZlT66FO9tz269SVnrvuHGc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-_cVnDSJgNPqwXFle-BGK2w-1; Fri, 9 Oct 2026 22:23:12 +0000
X-MC-Unique: _cVnDSJgNPqwXFle-BGK2w-1
X-Mimecast-MFC-AGG-ID: _cVnDSJgNPqwXFle-BGK2w_1791584591
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917a3c27c9bso5911906d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 15:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791584591; x=1792189391; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1kJjybFGSYZCppzp0ILAQK86Y2LNrWWZ0v/kRNoEipQ=;
        b=sACMEil2QWOB8/8rQK7VzlpfVpwAUynKVoshfEfDUw1XHllZR3pmo2plkAskhPKiue
         Z/cP15HNNMl5I20h4OEabTitZFfjJnmXL0i30yPn+GqsHiA7tciJkAd6SSRsbDoLVOgx
         sAaCGF0B3dTewM7UmRL/6s13kZMueSsvzfPjT5ki0VWncb40+E5+GYYAuie6W0G4YTOv
         Jv+xixj7jjDgf6ZvthFpw7Hhv0RoZ9nVx/mHZ6MA9puTGdxo4RtTUeQySS3JrZYjJdUO
         M1xjVCFDPhDC8j12b74rAGUh5gf1lOmDNYOafSuJZOT7hF9mIs8jmBspyCACUxK0JkfP
         vi8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791584591; x=1792189391;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1kJjybFGSYZCppzp0ILAQK86Y2LNrWWZ0v/kRNoEipQ=;
        b=W8GXrpiTx9Mt9+f4knpHk0ZclHvgT+/fPhsXXHxA5z0xsR8RaPPMcgZzYoNZ9iKRuD
         hsKweFMOM6+b2o4A6hDZBN7BI6c3SbFne+358w+9Tjpl8Wx6eFihKZJ9LecZjok+qlmb
         ARQlbb7mWkEOcb8xh1irULxGxiD6+9sNkLWNBnlEKf3r0y0nPoi35tLKTBidirJk6cb5
         9HXEvZby1bZWntmPf11aoEAyVCntU/uNnSXr/3EP/vEL3w3G5aHz7AA+vgnkZ7n4ZTds
         Nt603y0/53CU6E+m7BTZQm3pRTuh7a998A5tgAgSazpwWjd4ekEodka0H4lS/crVhaxP
         wBjA==
X-Forwarded-Encrypted: i=1; AKwUvByvHRBNo06Hrc9vuBdgXk+enLFFyHSRTukVoYpQSp7Lrzyz4fdymfLUyNTz2GqjIYsCf2lRTovrsKJKS0I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZVId9doYbv4dg2XK0rGuipQyc49o5unoFj9sM2/KcPPW++1yJ
	Mc3V3xa7hKvbA9rMqWTpK4eh3zQ+AasEe5SC12spWYfIHQ0pKblKbjJTx5BIhGF84NqD8LCj+pp
	ExCFKw3PLDG3koNlRe+93kLZpHIfpwO7j21iFxDvS8L0XofQTX5/mE2AHvmzuYpV86A==
X-Gm-Gg: AYBFou2QLIdvRZ2iHcz+m4hoEGMpabJmnP3y31UU8VFzVFcKSfw8WU/tN9TvSH97lY0
	qDhAMi65kp5N8/ddPh+ogvERUYQuWI+NwRRo2fCbzxsT7Y8nI0MbDasVxPgQwr4IOs54kQaFY5d
	Ce4YmFcm6h6Ng+fFU+ZGXrarCoi96VYfU9E9BXMdlM901LnMgo7pvcHSYFBgwHPTNIvSRGBPnMH
	KMm0QnUZ2N0asuyKNtYIQbP3ybEVu2UNGiXolubmqNjsT6h0DTRGq7NjmD1qWaFnAYXijjl1R2n
	v7VGCJN+25ctYrHxJUlReAzOwqW4sA2FKebafn2iI0Gf6krE7EIBeP5ej8jZCqLK/ogdyt4=
X-Received: by 2002:a05:6214:769:b0:912:54f7:aea3 with SMTP id 6a1803df08f44-91b5534d151mr61194176d6.1.1791584591462;
        Fri, 09 Oct 2026 15:23:11 -0700 (PDT)
X-Received: by 2002:a05:6214:769:b0:912:54f7:aea3 with SMTP id 6a1803df08f44-91b5534d151mr61193756d6.1.1791584590983;
        Fri, 09 Oct 2026 15:23:10 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b55017565sm29165376d6.15.2026.10.09.15.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 15:23:10 -0700 (PDT)
Message-ID: <f3576e4263b19d183e343eac9c56d4fc8385b431.camel@redhat.com>
Subject: Re: [PATCH v2] drm/nouveau/uvmm: reject replace across page sizes
From: lyude@redhat.com
To: moonafterrain@outlook.com, Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>, Andrew Morton
 <akpm@linux-foundation.org>, Balbir Singh	 <balbirs@nvidia.com>, Mary
 Guillemard <mary@mary.zone>, Mohamed Ahmed	
 <mohamedahmedegypt2001@gmail.com>, James Jones <jajones@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>, 
	stable@vger.kernel.org
Date: Fri, 09 Oct 2026 18:23:09 -0400
In-Reply-To: <9041ce7f5d6ae30213aa1ab895a4225fb33246ed.camel@redhat.com>
References: <20261009-nouveau-fixes-v2-1-a0b71bf8df1b@outlook.com>
	 <9041ce7f5d6ae30213aa1ab895a4225fb33246ed.camel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Wait-nope, hold on. Was double checking this to make sure there wasn't
anything I missed, and the sashiko comment I'm seeing looks quite
legitimate. Mind dropping my R-b and addressing that if it looks
legitimate?

On Fri, 2026-10-09 at 18:19 -0400, lyude@redhat.com wrote:
> Looks good to me, will push to drm-misc-fixes in a moment.
>=20
> On Fri, 2026-10-09 at 16:52 +0800, Junrui Luo via B4 Relay wrote:
> > From: Junrui Luo <moonafterrain@outlook.com>
> >=20
> > A new mapping takes over the page tables of the mappings it
> > replaces.
> > nouveau_uvmm_sm_prepare() only acquires page tables for the range
> > no
> > existing mapping covers, and the map path frees the replaced
> > mappings
> > without putting their references. That is only valid while all of
> > them
> > use the same page size, which select_page_shift() no longer
> > guarantees.
> >=20
> > Rebinding a GART BO over a 2MiB VRAM BO therefore leaves the new
> > mapping
> > owning page tables built for a different page size, and it then
> > maps
> > at a
> > size that was never referenced over that range. Since raw map does
> > not
> > allocate, nvkm_vmm_iter() can walk down to a NULL leaf and
> > dereference
> > it. The remainders of a split have the same problem:
> > op_map_prepare()
> > recomputes a page size with select_page_shift() while the remainder
> > keeps
> > the parent's page tables, so a parent that was itself downgraded
> > can
> > leave
> > a remainder that re-aligns to a larger size. This happens on the
> > unmap
> > path too.
> >=20
> > Reject the bind, and make split remainders inherit the page size of
> > the
> > mapping they are split from.
> >=20
> > Fixes: c488a94e7e14 ("drm/nouveau/uvmm: Allow larger pages")
> > Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> > Assisted-by: LLM
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > ---
> > Changes in v2:
> > - Drop patch 1, which has been merged.
> > - Use the abbreviated conditional operator for page_shift (Lyude
> > Paul).
> > - Compare against remap_args.page_shift (Lyude Paul).
> > - Use Assisted-by: LLM (Balbir Singh).
> > - Add Lyude's Reviewed-by.
> > - Link to v1:
> > https://lore.kernel.org/r/20260817-nouveau-fixes-v1-0-f518d0c735f3@outl=
ook.com
> > ---
> > =C2=A0drivers/gpu/drm/nouveau/nouveau_uvmm.c | 32
> > +++++++++++++++++++++++++++++++-
> > =C2=A01 file changed, 31 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > index f5e4756b4de4..aa5b93808f41 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > @@ -85,6 +85,8 @@ struct uvmm_map_args {
> > =C2=A0	u64 addr;
> > =C2=A0	u64 range;
> > =C2=A0	u8 kind;
> > +	/* Page size to give the new mapping, or 0 to derive it
> > from
> > the op. */
> > +	u8 page_shift;
> > =C2=A0};
> > =C2=A0
> > =C2=A0static int
> > @@ -655,7 +657,7 @@ op_map_prepare(struct nouveau_uvmm *uvmm,
> > =C2=A0
> > =C2=A0	uvma->region =3D args->region;
> > =C2=A0	uvma->kind =3D args->kind;
> > -	uvma->page_shift =3D select_page_shift(uvmm, op);
> > +	uvma->page_shift =3D args->page_shift ?:
> > select_page_shift(uvmm, op);
> > =C2=A0
> > =C2=A0	drm_gpuva_map(&uvmm->base, &uvma->va, op);
> > =C2=A0
> > @@ -684,8 +686,20 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm
> > *uvmm,
> > =C2=A0	struct drm_gpuva_op *op;
> > =C2=A0	u64 vmm_get_start =3D args ? args->addr : 0;
> > =C2=A0	u64 vmm_get_end =3D args ? args->addr + args->range : 0;
> > +	u8 map_page_shift =3D 0;
> > =C2=A0	int ret;
> > =C2=A0
> > +	/* A new mapping takes over the page tables of the
> > mappings
> > it replaces,
> > +	 * so every one of them has to be using its page size. The
> > new mapping
> > +	 * is the last op drm_gpuvm_sm_map_ops_create() emits.
> > +	 */
> > +	if (args) {
> > +		struct drm_gpuva_op *last =3D
> > drm_gpuva_last_op(ops);
> > +
> > +		if (last->op =3D=3D DRM_GPUVA_OP_MAP)
> > +			map_page_shift =3D select_page_shift(uvmm,
> > &last->map);
> > +	}
> > +
> > =C2=A0	drm_gpuva_for_each_op(op, ops) {
> > =C2=A0		switch (op->op) {
> > =C2=A0		case DRM_GPUVA_OP_MAP: {
> > @@ -713,11 +727,22 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm
> > *uvmm,
> > =C2=A0			struct uvmm_map_args remap_args =3D {
> > =C2=A0				.kind =3D uvma_from_va(va)->kind,
> > =C2=A0				.region =3D uvma_from_va(va)-
> > >region,
> > +				/* The remainders of the split
> > keep
> > the page
> > +				 * tables of the mapping they are
> > split from,
> > +				 * so they must keep its page size
> > too.
> > +				 */
> > +				.page_shift =3D uvma_from_va(va)-
> > > page_shift,
> > =C2=A0			};
> > =C2=A0			u64 ustart =3D va->va.addr;
> > =C2=A0			u64 urange =3D va->va.range;
> > =C2=A0			u64 uend =3D ustart + urange;
> > =C2=A0
> > +			if (map_page_shift &&
> > +			=C2=A0=C2=A0=C2=A0 remap_args.page_shift !=3D
> > map_page_shift)
> > {
> > +				ret =3D -EINVAL;
> > +				goto unwind;
> > +			}
> > +
> > =C2=A0			op_unmap_prepare(r->unmap);
> > =C2=A0
> > =C2=A0			if (r->prev) {
> > @@ -756,6 +781,11 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm
> > *uvmm,
> > =C2=A0			u64 uend =3D ustart + urange;
> > =C2=A0			u8 page_shift =3D uvma_from_va(va)-
> > > page_shift;
> > =C2=A0
> > +			if (map_page_shift && page_shift !=3D
> > map_page_shift) {
> > +				ret =3D -EINVAL;
> > +				goto unwind;
> > +			}
> > +
> > =C2=A0			op_unmap_prepare(u);
> > =C2=A0
> > =C2=A0			if (!args)
> >=20
> > ---
> > base-commit: f5bbbfec59b4e2fb7520a91de3df8a6174325d6a
> > change-id: 20260817-nouveau-fixes-23877845c3ab
> >=20
> > Best regards,

