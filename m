Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCE04E36C4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789675005; cv=none; b=qoj6t5V/SyaoyC5KMmRotbJFRSOMf7vHn1iL+gUC+GDaGQRqZ4gWzQo3IOXX3tT0QeUkVk7E3PJVRv3vO7bysRvRDH0wxTkyRKnihSmNXUHe9qQgb/Ds46XJtv+6usF5z9XQqRxDpmvImPQLNYTdsxUhuUVnyN5rCDVgueNMvmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789675005; c=relaxed/simple;
	bh=W+2SsK/cigQTPstzwPG2slSwXf5M0E4ZMStmSx8218M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AGvPBC9145AJDTNFQv8TO9fs8JGlfxV8+6fhR4KG4Pjwg8+HmzqX+xHorCjpiKQk9McylsbJhnaSjPKaGOdpCvdgAC8AShR82lbxkka0nE2H8CrRzuoM0sTqjW8EvOp7as7P/trVVXszsqsR0/CnfygRY2OtHLJoCUcxzi8rQV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TP6wpzQ6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IDW1Gk2G; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TP6wpzQ6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IDW1Gk2G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789675002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SK8FkV9t4hK7QEUa6h1DUFLUc29+3sFP86iMsPEZQZY=;
	b=TP6wpzQ6ml567Ke0w5iVj4EnAhw8PZglN03u0PvDpdmvarV+DQdIZNVsHZypyNlOrd6x9I
	5751j8xrETLiFQdUZkKcMu77qKmgFmfhN6kQYLrIVPl0s8EE3KrjybUQtGq7KEUNE/k8LE
	Vo/oMlLZpcZXPj7Gwulp+tOFNs4MviA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-8LeobCZnOXSanJ3KILCo8Q-1; Thu, 17 Sep 2026 15:56:39 -0400
X-MC-Unique: 8LeobCZnOXSanJ3KILCo8Q-1
X-Mimecast-MFC-AGG-ID: 8LeobCZnOXSanJ3KILCo8Q_1789674999
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a07b5b5efso248883885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789674999; x=1790279799; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SK8FkV9t4hK7QEUa6h1DUFLUc29+3sFP86iMsPEZQZY=;
        b=IDW1Gk2GjGyYcsP6uE1mHSfeo8R3aoqF4T7Dj9Z/p2bLdzYnGMd7zA3s/68ZrgMghs
         hALx4WXFnMI7/iMsnvvtdk5EZx2ojKWZ1PkB1LI5AMUuokZ1sCyP57mRqpQVfeKr2zjV
         S7/EDfhm9Zmcjv3Gdz/+2Bnw4IbYuklJqfJHXL8P96g6IO5tJza8W8GuZTUT+5Y8tYvK
         E51rjcadV5gbAUj8hGfi9PQMzbFrhiwJvyE+i19YuPpBlbG3/aNOxQ+LwHJP4nt3qbkT
         wVF8b7/qdAX4rxPuvO1wtNqgNUmg8IWh4DhjPwBeWtaEsCAG+EFiPus6tYgxyrcdVwfY
         sY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789674999; x=1790279799;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SK8FkV9t4hK7QEUa6h1DUFLUc29+3sFP86iMsPEZQZY=;
        b=uSI8dAF7NwmQ4ZqFmLe4V+5xL0aNq0J/zPPxMfhHHpWq1z5h9JDnStnssLDigqKKd6
         o2gbr152oY8F0abyG4MmkwcYz9XTeOiwMBMICJdZPOEFBQs8vj5rVg033B5QnMpHKN3N
         C1HQiRt9no8CW3A3aW20CMva6jJwGnVP/t9TupU5378k7xrDpM4goxDkGR81tepfL7ty
         UOlYJriQZlixUyFogu5+22RHl828HjScIxYN5EPOT6uJZRPqS26QsIK12Kqp52Vmgwbd
         zTFm5MoztB4Ufd/ZdBV0AmKqC3Iho/72sWCUeUNsdsL5dnWiAaYdNWmnknWbb0Felh+N
         qI1A==
X-Forwarded-Encrypted: i=1; AKwUvBxYUblykb7wu70VUdvawz8cBNB0NDiYlTa18O3PG3Ig6ATWf4Arf9e+Ec1G82VnzXoBotMS90BaUSN8EWg=@vger.kernel.org
X-Gm-Message-State: AFuF++k6UCvRjGp5VR/JanvyBac1p9U7OXWtgsqJ3SUAbo85vAJSMfhi
	I+osynhDr48g7o866mCYc8ynKCFrcYxXeHJzwQpCb4C9rIC1p33wBOZpobc7hK1/H3I7B5Mrt2H
	vF4XJk3YSJBpPU2x0BCAua2BpABFmmRzbvg7RgjpWvLV/Gz2p6ks1P5iCU8vlKlApYA==
X-Gm-Gg: AYBFou27fckZWglV7zb82Y7axF5Fg4S3MvSuR21Z9rIxoaaNXDhkj6DB6vAV/3TTe/4
	1siTjAhgBGjn7f+0T/nviVjhMcnQ8VibVEH4e+vVUk4YEaWE0jaRhqoZguMIs1p2yU7w69sm8Bp
	7/QGyAEKoS1D44KCk+Nx1PLKI9GpaDLBunotFGB7Ik+fyLwJzyyxrQeZOE2FvOb01ZY+/jNTvTn
	2zg9/2aTJH3NNaPDk2KRXG23hD8Zg8R8fwxqER3AW6FNzAxeoFXu3DVPZVcNbcqy4pAUDadJgD2
	ZG8cCdDIh5TvbJGgDG2Y0yhpyaMlQbUee0Uhw7ztIADH/GhHs2hOSXxSoZUNiqgSL7iyTGdx
X-Received: by 2002:a05:620a:4055:b0:939:a45:8c96 with SMTP id af79cd13be357-93bc62c0d2amr633010885a.19.1789674999131;
        Thu, 17 Sep 2026 12:56:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4055:b0:939:a45:8c96 with SMTP id af79cd13be357-93bc62c0d2amr633006785a.19.1789674998638;
        Thu, 17 Sep 2026 12:56:38 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b7825b6d3sm538457085a.31.2026.09.17.12.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 12:56:38 -0700 (PDT)
Message-ID: <f21df5ff995cba8272f3bfb30c0129a76e2cf3ed.camel@redhat.com>
Subject: Re: [PATCH 2/2] drm/nouveau/uvmm: reject replace across page sizes
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
Date: Thu, 17 Sep 2026 15:56:37 -0400
In-Reply-To: <20260817-nouveau-fixes-v1-2-f518d0c735f3@outlook.com>
References: <20260817-nouveau-fixes-v1-0-f518d0c735f3@outlook.com>
	 <20260817-nouveau-fixes-v1-2-f518d0c735f3@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Changes down below:

On Mon, 2026-08-17 at 14:50 +0800, Junrui Luo via B4 Relay wrote:
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
> Assisted-by: Claude:claude-opus-5
> Cc: stable@vger.kernel.org
> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_uvmm.c | 33
> ++++++++++++++++++++++++++++++++-
> =C2=A01 file changed, 32 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index f5e4756b4de4..6404c54d097c 100644
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
> @@ -655,7 +657,8 @@ op_map_prepare(struct nouveau_uvmm *uvmm,
> =C2=A0
> =C2=A0	uvma->region =3D args->region;
> =C2=A0	uvma->kind =3D args->kind;
> -	uvma->page_shift =3D select_page_shift(uvmm, op);
> +	uvma->page_shift =3D args->page_shift ? args->page_shift :
> +			=C2=A0=C2=A0 select_page_shift(uvmm, op);

This can just be:

   args->page_shift ?: select_page_shift(uvmm, op);

> =C2=A0
> =C2=A0	drm_gpuva_map(&uvmm->base, &uvma->va, op);
> =C2=A0
> @@ -684,8 +687,20 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm
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
> @@ -713,11 +728,22 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm
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
> +			=C2=A0=C2=A0=C2=A0 uvma_from_va(va)->page_shift !=3D
> map_page_shift) {

Let's just take this value from remap_args instead of doing
uvma_from_va(va), it makes it a bit easier for people to understand
what's happening here.

With those nitpicks fixed:

Reviewed-by: Lyude Paul <lyude@redhat.com>

> +				ret =3D -EINVAL;
> +				goto unwind;
> +			}
> +
> =C2=A0			op_unmap_prepare(r->unmap);
> =C2=A0
> =C2=A0			if (r->prev) {
> @@ -756,6 +782,11 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm
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

