Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB3826738D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 22:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791584370; cv=none; b=jCR9janWtTDmmtG1iZRFAiLWWEq8xd8GOBQAfHvh42xNtXgkuujZkGImhgTNsreX4CIX0DhAmd6uQgzC/pGnM8zB6GsS70yVb97NuMiQM1Qr5NemiyL5nuZSziEZFJuaOeLX0+O2ExAuLAbUjzv/adnnBzQeBZO4xm3G0pNckkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791584370; c=relaxed/simple;
	bh=AZ8yP9jeAkcUd8M1q6vyg8krIqglNkqX1892a3fHtO0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h9HIa2Xi13lRtyCY4x9q5MYDg54J8/XOMl0HY5cGoE2x6+HBko7b6fw/bG00PAiogg6rWzApwu9/15LEopNSGwriDz1DpFcKyh4TrCehFc3M3956vLN+/X0xXgexdecci1lxD7HvioAhFMYHMkHdW2L/iWo20/+QzeXrgPdI48o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PlKF4sT5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CSCWoiT1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PlKF4sT5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CSCWoiT1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791584368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/9KqQUhlnxO9tnxirSVybe3jxd+G2c4sf1QFVpuAgNA=;
	b=PlKF4sT5h2LioANb+jiyA6bSQKB/22qkKdwYj6qfAilQvTC4a2Ou3dhiounCgbwW2ugO2B
	zS+kL5m0aNKRU3CLXJ8yy0sONVtSxtaAaZZqaPBQ8KWUlWr1n9Ri+BD8sFkhj/26xs95GS
	0W3yd53ocZblnNBnn4bQ4E4iPCz7d/0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-vuHLtFDHM9isqWfubrqH6g-1; Fri, 9 Oct 2026 22:19:25 +0000
X-MC-Unique: vuHLtFDHM9isqWfubrqH6g-1
X-Mimecast-MFC-AGG-ID: vuHLtFDHM9isqWfubrqH6g_1791584365
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917a109c937so4527106d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 15:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791584364; x=1792189164; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/9KqQUhlnxO9tnxirSVybe3jxd+G2c4sf1QFVpuAgNA=;
        b=CSCWoiT1Vg+p6JnYhE40gQE/r1qaGZVeAYiNGcEXBrOzTfu7j3DBQjOXGdz/IfuvDd
         LGPv/4iWqWaASdIZwPWLf2NJ6Tu5jiyEImT4RCgNtObDSUPmLurgAsmmqtzvTNzBeLnZ
         0SRk6XWXo0MDDG8tyaG5vVwc6EDS/kst/F4YYToZYU3zfECutWreKO6jv1d4LtwAh5SR
         gOyEallx6hf95gAc5hpyylYMAs+5R3LTmU7fkVzw2IuacFt3PgOGcWPwzy9Gd7D6b4fg
         ZWie+G62w6YkhhXk7Frbo4I4F5yF2T4xq9hZItonoNehrzv8XH3EzxWmw62n/wlF1Cpy
         jQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791584364; x=1792189164;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/9KqQUhlnxO9tnxirSVybe3jxd+G2c4sf1QFVpuAgNA=;
        b=dJQNI9mFGFYMKpI4q6cFxYRs62QlzOfWOkZbvNu4X0Oa5RyJ9aj3ro1I2OtpLiS3OX
         +N0ZMyQI5+0bRolgHxMwHY6tSWLKfSd6Fcs5h53dAXF8AxJAoRRxNTVgqpK/18QG88MN
         +xdkXJYgFqUoE1G7LH8tyXIBHcxG/1HgM5fbetWuJAsMwuPD4NhwAmIUGuxKGhP7/hNW
         qCtVwZpVlWt5zzLJd6p4aOj5OuV/RARLoOxQ6375Xts2TiR0Rhz8JdQLNQYjBJJ7qPP9
         4qkzNlAwV1ALP4VL+XoDb5VdJbNGRq3/QiPD5vTT37AOu7JJLxAQjgWnFopObFjRJgVO
         vGZA==
X-Forwarded-Encrypted: i=1; AKwUvBytCEoQIFkYIzsuhh6IS0lIJcnNxTFJUY3UIsAoiBFCq8g8SjKRKaqjqd+qDzace6ujyeQrZ3Tx2+ld1xE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwCzE1EEse5d67tqAlyEqMLo9VOX1Zx1eFqmI1/hztYingnJsD
	gNsvn/W96gRlyB+AOvQ4xszZCV+N3IgqTmpH8UBgm9+vmViuvwr4eI4e4w7XWZAqCpDoTuEjuV8
	Ir0vTlh+2RQdv4bVruh0IDBecuHrhpYk06GsHDxisLHWG3wzRQ02WRjgi6GQjz9ccuA==
X-Gm-Gg: AYBFou0JjB9yUS6m2BiP6AKP6obOJv1r/MeVRdvznzEZH4PaQknqeDjUrxjbPlnr8XY
	ojcmEjCGU4unk+Eb/2/RLnOgtNWHwyRNHOfDgA9iORuVmXX9fAC5Q4X2kHgZ9Mo6tEjIQopghpr
	gk9Fa1ReB2KkbVD/sZ2BjVoSvBELgNDhKiGQygweGBa6+00ESq/3xC3fdIixyzx06O6eAIy8kTt
	dj9lUXAEDsgEpWyBaRrbmSfZGuGx6I+ixeH0mgny9F25BIK4Kmh9TJedAWw8hRpjYwUx/gDO+4s
	g+jwlrQLhAxf42Qyj8wWXSIYyM/76cLxTo8Xtk9XvQTGQ/3QGbgnO4VZVuUpSm4WBKSH/ZI=
X-Received: by 2002:ad4:5aa6:0:b0:914:4c57:5108 with SMTP id 6a1803df08f44-91b554ea694mr60160476d6.16.1791584364496;
        Fri, 09 Oct 2026 15:19:24 -0700 (PDT)
X-Received: by 2002:ad4:5aa6:0:b0:914:4c57:5108 with SMTP id 6a1803df08f44-91b554ea694mr60159926d6.16.1791584363944;
        Fri, 09 Oct 2026 15:19:23 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b5504e3d1sm29155796d6.23.2026.10.09.15.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 15:19:23 -0700 (PDT)
Message-ID: <9041ce7f5d6ae30213aa1ab895a4225fb33246ed.camel@redhat.com>
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
Date: Fri, 09 Oct 2026 18:19:22 -0400
In-Reply-To: <20261009-nouveau-fixes-v2-1-a0b71bf8df1b@outlook.com>
References: <20261009-nouveau-fixes-v2-1-a0b71bf8df1b@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Looks good to me, will push to drm-misc-fixes in a moment.

On Fri, 2026-10-09 at 16:52 +0800, Junrui Luo via B4 Relay wrote:
> From: Junrui Luo <moonafterrain@outlook.com>
>=20
> A new mapping takes over the page tables of the mappings it replaces.
> nouveau_uvmm_sm_prepare() only acquires page tables for the range no
> existing mapping covers, and the map path frees the replaced mappings
> without putting their references. That is only valid while all of
> them
> use the same page size, which select_page_shift() no longer
> guarantees.
>=20
> Rebinding a GART BO over a 2MiB VRAM BO therefore leaves the new
> mapping
> owning page tables built for a different page size, and it then maps
> at a
> size that was never referenced over that range. Since raw map does
> not
> allocate, nvkm_vmm_iter() can walk down to a NULL leaf and
> dereference
> it. The remainders of a split have the same problem: op_map_prepare()
> recomputes a page size with select_page_shift() while the remainder
> keeps
> the parent's page tables, so a parent that was itself downgraded can
> leave
> a remainder that re-aligns to a larger size. This happens on the
> unmap
> path too.
>=20
> Reject the bind, and make split remainders inherit the page size of
> the
> mapping they are split from.
>=20
> Fixes: c488a94e7e14 ("drm/nouveau/uvmm: Allow larger pages")
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Assisted-by: LLM
> Cc: stable@vger.kernel.org
> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> ---
> Changes in v2:
> - Drop patch 1, which has been merged.
> - Use the abbreviated conditional operator for page_shift (Lyude
> Paul).
> - Compare against remap_args.page_shift (Lyude Paul).
> - Use Assisted-by: LLM (Balbir Singh).
> - Add Lyude's Reviewed-by.
> - Link to v1:
> https://lore.kernel.org/r/20260817-nouveau-fixes-v1-0-f518d0c735f3@outloo=
k.com
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_uvmm.c | 32
> +++++++++++++++++++++++++++++++-
> =C2=A01 file changed, 31 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index f5e4756b4de4..aa5b93808f41 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -85,6 +85,8 @@ struct uvmm_map_args {
> =C2=A0	u64 addr;
> =C2=A0	u64 range;
> =C2=A0	u8 kind;
> +	/* Page size to give the new mapping, or 0 to derive it from
> the op. */
> +	u8 page_shift;
> =C2=A0};
> =C2=A0
> =C2=A0static int
> @@ -655,7 +657,7 @@ op_map_prepare(struct nouveau_uvmm *uvmm,
> =C2=A0
> =C2=A0	uvma->region =3D args->region;
> =C2=A0	uvma->kind =3D args->kind;
> -	uvma->page_shift =3D select_page_shift(uvmm, op);
> +	uvma->page_shift =3D args->page_shift ?:
> select_page_shift(uvmm, op);
> =C2=A0
> =C2=A0	drm_gpuva_map(&uvmm->base, &uvma->va, op);
> =C2=A0
> @@ -684,8 +686,20 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm
> *uvmm,
> =C2=A0	struct drm_gpuva_op *op;
> =C2=A0	u64 vmm_get_start =3D args ? args->addr : 0;
> =C2=A0	u64 vmm_get_end =3D args ? args->addr + args->range : 0;
> +	u8 map_page_shift =3D 0;
> =C2=A0	int ret;
> =C2=A0
> +	/* A new mapping takes over the page tables of the mappings
> it replaces,
> +	 * so every one of them has to be using its page size. The
> new mapping
> +	 * is the last op drm_gpuvm_sm_map_ops_create() emits.
> +	 */
> +	if (args) {
> +		struct drm_gpuva_op *last =3D drm_gpuva_last_op(ops);
> +
> +		if (last->op =3D=3D DRM_GPUVA_OP_MAP)
> +			map_page_shift =3D select_page_shift(uvmm,
> &last->map);
> +	}
> +
> =C2=A0	drm_gpuva_for_each_op(op, ops) {
> =C2=A0		switch (op->op) {
> =C2=A0		case DRM_GPUVA_OP_MAP: {
> @@ -713,11 +727,22 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm
> *uvmm,
> =C2=A0			struct uvmm_map_args remap_args =3D {
> =C2=A0				.kind =3D uvma_from_va(va)->kind,
> =C2=A0				.region =3D uvma_from_va(va)->region,
> +				/* The remainders of the split keep
> the page
> +				 * tables of the mapping they are
> split from,
> +				 * so they must keep its page size
> too.
> +				 */
> +				.page_shift =3D uvma_from_va(va)-
> >page_shift,
> =C2=A0			};
> =C2=A0			u64 ustart =3D va->va.addr;
> =C2=A0			u64 urange =3D va->va.range;
> =C2=A0			u64 uend =3D ustart + urange;
> =C2=A0
> +			if (map_page_shift &&
> +			=C2=A0=C2=A0=C2=A0 remap_args.page_shift !=3D map_page_shift)
> {
> +				ret =3D -EINVAL;
> +				goto unwind;
> +			}
> +
> =C2=A0			op_unmap_prepare(r->unmap);
> =C2=A0
> =C2=A0			if (r->prev) {
> @@ -756,6 +781,11 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm
> *uvmm,
> =C2=A0			u64 uend =3D ustart + urange;
> =C2=A0			u8 page_shift =3D uvma_from_va(va)-
> >page_shift;
> =C2=A0
> +			if (map_page_shift && page_shift !=3D
> map_page_shift) {
> +				ret =3D -EINVAL;
> +				goto unwind;
> +			}
> +
> =C2=A0			op_unmap_prepare(u);
> =C2=A0
> =C2=A0			if (!args)
>=20
> ---
> base-commit: f5bbbfec59b4e2fb7520a91de3df8a6174325d6a
> change-id: 20260817-nouveau-fixes-23877845c3ab
>=20
> Best regards,

