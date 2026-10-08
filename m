Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720C7336881
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791497998; cv=none; b=sTWsqm0LvDgixR6AOkzc/NScwtr2qJaVLbLiltwO8bTJEkHL8uqQrqyTTHF1rHpPsIe29eghdKYQT8B6SACQkFEHv3u/PjJSiHXXNXjCDE2QwZSk05oYCeE84YDiAucbt1vaTpAavFiSOvmra1CwBXztccpBkdlcpY55pP2MEPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791497998; c=relaxed/simple;
	bh=NXdviQU9bDQUlNkqFqOKstTlEZ3SWnuswP/ZLKFlr7E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XI6oZJI6e9XVQU4cNTYmqHfL+O0mv5yOPHEE6zi/YeLjHuJ8eqpzGwF7wfLjXdfFqAxqWbXtlHeswZ4aT95Qquxk/quQq8tYqa7cjTFQr7EJzbfOivUsqTX8Fnjmo3vdYWBzZY3KTGSl0XEtGxJXOaDx9jZ88RCrYDIFb1lTkTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bH8g4lmv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rn5jqual; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bH8g4lmv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rn5jqual"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791497996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GjfKe0UMSMorT3desuNDK/FRCwDViDwkhbHy5Q186yc=;
	b=bH8g4lmvAydTtg8KGFQHE4Nd8mRZtl4AENtVSlwIIko2SAmquJ8KRkbfyA9HkPuOkzkJe2
	5MUnZJvmCSBg02kKqjnY3iZbwA13XyjP+5LH5KdZx6iY6S30Alb0FNqKuS8YI7ddaKC9+C
	m8KXNzx2Z6GRQ3N1zyhSCEH5lLuKg84=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-fgvQb4tyNAWEonvHLpy-iA-1; Thu, 8 Oct 2026 22:19:53 +0000
X-MC-Unique: fgvQb4tyNAWEonvHLpy-iA-1
X-Mimecast-MFC-AGG-ID: fgvQb4tyNAWEonvHLpy-iA_1791497992
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc359d9easo973672385a.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 15:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791497992; x=1792102792; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GjfKe0UMSMorT3desuNDK/FRCwDViDwkhbHy5Q186yc=;
        b=rn5jqualZhcaScDBB4a8RUvLJTCIz5f89ID17Rk9fpUTGDVvWxGjECGeTzIqFJ59Od
         AhjhUKpTsmb7Hpd/tcrTqjXtLuRKby1a1Y7lcH0JyfIe/S5+iwAtBhwjKY00JDyV/CxV
         8wQZ1SSBx8Cr5p2bbdq+Yai5Go1TnA0q/t/7mZdLxsOFwIB9Hxbs+0eD9/r4rMI5HVmr
         hS5pc/++oj8BEbLVJcKOWeNF28MXYE5egQM5qIeMO4Hv7osiZrbYYgSGaTco6z7JsHjX
         hhQNQh/zyrzgCA7oWMv+hoppEmAVOFpCeeEOJ6vvDJdSDs4huWU9Ag85QPZome2WdjJ7
         CJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791497992; x=1792102792;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GjfKe0UMSMorT3desuNDK/FRCwDViDwkhbHy5Q186yc=;
        b=MXD1kUYyGEYHqe9U9PLU9dx0YDdlT2x2MwVZfhqFRU/FmDK3e+hVX19TmMSIFklqks
         4bjqeq+xeKBFKyggoSw1GslPkWC5UoOKWDj8nGvdPvevBCKmq763ouWn15k+V0fEIvir
         Qrz32CCdSn2w9ngQkkyzPylvLObBVEzjJzssds9M4ed/uaFt6fzUbKpQTgNfu+IuOrbZ
         xIhgVkkcsJ538sUo961u43bzKh2ncsuafOYnkFYmJa0kARlsnxoraYC2hYbiLTF5X9eK
         GAwQQVmdmFWFqOo+W85cHw13nTSJk16iNeKFGyI4hr6x6+VIW7cdYQsBMYn83J6Bgydr
         7s+w==
X-Forwarded-Encrypted: i=1; AKwUvBz5Zb61q0+vweur8oLW2zmGDjB42ExeGs04gMJn1TPslbO0ixAKNXrFvgVGGKE6ujxipLkmXu9okaQzvgg=@vger.kernel.org
X-Gm-Message-State: AFuF++nuo1IsQQU676cmEM9JEUlCwY3OiU4fP50gMCaFJJtcf4P3JWPO
	If2tRILJ/IGQLDyFZ985bHMnx7tyi20YmksvaqHQwg+M89YIkMgu7AZKhuS3P8u4BUlJFaIq47u
	o3DoBq5TZ0+1fqRLztizQiFkXNBvG+VzSkJfbrBn24T4PDGPHX+xsTiZ5ayAASNVr4w==
X-Gm-Gg: AYBFou0T6q44iG5ygsHbZOwqxAOfudaT2g34hLj7ffj6QzGPczQgDGpTjgkfua8JaEC
	RwqN3MKKMINrvib1MBnY5ACArMVicoIfwybbFjlJk83fQhDFMgb9ZKb/OiznaYoF1T21Z9690Qq
	c/7kDU7rlgECqQlVMJcqS+eD6eMzKLa9I+X+VUDg5ne21CTdIMr/lVT2n00rmgSaTHcNinFLSrA
	5B2u7eTAVZTb5uOMymP1SBWHB1sSr+nSjrtdElDRobbDhy/WQzgAJEhhJObVpHeZLPhCH88PAjm
	IjPoWcH0N4GHekZpLnUiEZupqIYrD3p8YwvgHvgS7jnm8wx25gqu6mrd/GrEGvWW+WNdGaA=
X-Received: by 2002:a05:620a:198d:b0:93e:942f:b8ae with SMTP id af79cd13be357-93ebd1dfff5mr2778785a.26.1791497992335;
        Thu, 08 Oct 2026 15:19:52 -0700 (PDT)
X-Received: by 2002:a05:620a:198d:b0:93e:942f:b8ae with SMTP id af79cd13be357-93ebd1dfff5mr2774485a.26.1791497991653;
        Thu, 08 Oct 2026 15:19:51 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb986c350sm38274685a.22.2026.10.08.15.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 15:19:51 -0700 (PDT)
Message-ID: <778d3018e596c0be1db309b5e36aa361db89c9bb.camel@redhat.com>
Subject: Re: [PATCH 3/3] drm/nouveau/gsp: Fix NULL dereference in
 nvkm_gsp_gcx_ready()
From: lyude@redhat.com
To: jim.cromie@gmail.com, Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dave Airlie	
 <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 08 Oct 2026 18:19:50 -0400
In-Reply-To: <20261002-my-fixups-v1-3-a83d20f9d3fe@gmail.com>
References: <20261002-my-fixups-v1-0-a83d20f9d3fe@gmail.com>
	 <20261002-my-fixups-v1-3-a83d20f9d3fe@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-fixes in a moment, thanks!

On Fri, 2026-10-02 at 12:09 -0600, Jim Cromie via B4 Relay wrote:
> From: Jim Cromie <jim.cromie@gmail.com>
>=20
> Commit cb4c7603678c ("drm/nouveau/gsp/r570: Add support for
> INTERNAL_GCX_ENTRY_PREREQUISITE") hooked nvif_device_gcx_ready() into
> nouveau_pmops_runtime_suspend() to consult GSP before runtime
> suspend.
>=20
> On GPUs running without GSP-RM (e.g. Volta GV100, NvGspRm=3D0, or
> missing
> GSP firmware blobs), device->gsp is instantiated but gsp->rm remains
> NULL. nvkm_udevice_gcx_ready() checked "!gsp" instead of verifying
> nvkm_gsp_rm(gsp), allowing non-RM instances to invoke
> nvkm_gsp_gcx_ready(). nvkm_gsp_gcx_ready() then unconditionally
> dereferenced gsp->rm->api, causing a kernel oops:
>=20
> =C2=A0 RIP: 0010:nvkm_gsp_gcx_ready+0x10/0x30 [nouveau]
> =C2=A0 Code: ... 48 8b 87 70 0e 00 00 <48> 8b 40 18 ...
> =C2=A0 RAX: 0000000000000000 RDI: ffff8c9555fca000
> =C2=A0 Call Trace:
> =C2=A0=C2=A0 nvkm_udevice_mthd+0xa5/0x150 [nouveau]
> =C2=A0=C2=A0 nvkm_ioctl+0xcc/0x1d0 [nouveau]
> =C2=A0=C2=A0 nvif_object_mthd+0x110/0x1e0 [nouveau]
> =C2=A0=C2=A0 nvif_device_gcx_ready+0x36/0x60 [nouveau]
> =C2=A0=C2=A0 nouveau_pmops_runtime_suspend+0x39/0x140 [nouveau]
>=20
> Instruction decode shows `mov rax, [rdi+0xe70]` loads gsp->rm (0x0),
> and `<48> 8b 40 18` (`mov rax, [rax+0x18]`) faults accessing rm->api.
>=20
> Fix by:
> 0. Checking !nvkm_gsp_rm(gsp) in nvkm_udevice_gcx_ready() so non-RM
> =C2=A0=C2=A0 devices report GC6/GcOff ready and bypass the GSP call entir=
ely.
> 1. Guarding gsp and gsp->rm in nvkm_gsp_gcx_ready() before inspecting
> =C2=A0=C2=A0 gsp->rm->api->gsp->gcx_ready.
>=20
> Fixes: cb4c7603678c ("drm/nouveau/gsp/r570: Add support for
> INTERNAL_GCX_ENTRY_PREREQUISITE")
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/device/user.c | 2 +-
> =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c=C2=A0=C2=A0=C2=A0 | =
2 +-
> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
> index f78e6b9b4292..d469437eb991 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
> @@ -201,7 +201,7 @@ nvkm_udevice_gcx_ready(struct nvkm_udevice *udev,
> void *data, u32 size)
> =C2=A0	} *args =3D data;
> =C2=A0	int ret =3D -ENOSYS;
> =C2=A0
> -	if (!gsp) {
> +	if (!nvkm_gsp_rm(gsp)) {
> =C2=A0		args->v0.ready =3D NV_DEVICE_GC6_READY |
> NV_DEVICE_GCOFF_READY;
> =C2=A0		return 0;
> =C2=A0	}
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
> index e475d0e8fa7b..9e07d67dcb0f 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
> @@ -51,7 +51,7 @@ nvkm_gsp_intr_stall(struct nvkm_gsp *gsp, enum
> nvkm_subdev_type type, int inst)
> =C2=A0int
> =C2=A0nvkm_gsp_gcx_ready(struct nvkm_gsp *gsp)
> =C2=A0{
> -	if (!gsp->rm->api->gsp->gcx_ready)
> +	if (!gsp || !gsp->rm || !gsp->rm->api->gsp->gcx_ready)
> =C2=A0		return NV_DEVICE_GC6_READY | NV_DEVICE_GCOFF_READY;
> =C2=A0
> =C2=A0	return gsp->rm->api->gsp->gcx_ready(gsp);

