Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4703EFFD2
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791581221; cv=none; b=Xwsg0SMDo2QWKYORK9QG14X3jz4c/6WrIP9EDdxZvg3s3V+LNBOp+JuDEjisnUTpb9MiQFDikD7RD6f+tvPsaDkijrSy7Y8S7utzJTlwWVRXzGVoyPD0mDZCKiw4cwiw2OsnTec2hHyrnAiKv0eWNxFEkJJIfup7xcAt7acuiWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791581221; c=relaxed/simple;
	bh=TyxSOYU5PioABjr8EJeQo8NGMnez3v+D+t81pCkh7J4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KGyAXtfDlllR2394s2saY+Mx6BRSWcRjlLuLOfEJ+B2tJs/UmJv0d0Y139JZJtC/ovANRvnhTnR10ACP5LoD+669+FbNTg+JdP40EUqa9QM4aCvoGQFm9rpmMY2SSj9gpD2H7CqifPpxpGH76DqOVSIQQQJPCGsWrZCOJ8gFutg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DHcvcGuz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=B5+xXeBg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DHcvcGuz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="B5+xXeBg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791581216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZxvkTxUcJf7CaZriMxWB3wlk03saYsRAfT3CN9F3Ggk=;
	b=DHcvcGuzMAxIPT0KFFqHBTuQMEZZ3GOvfEn6TB4y8f0SCV7ev/QVdppzrDkFGWZW0wpueA
	30jJYbc9PCSUfg0J5qke5GfLAqGJoezNNFHWQPHvvYt0Ca6c59W1BqgovMqdRylfHnhzth
	SWxmjaDhiXaY5mbFZh17Bm6BkgpYLFw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-geCr45PGPwqjpZDimZ7LZQ-1; Fri, 9 Oct 2026 21:26:55 +0000
X-MC-Unique: geCr45PGPwqjpZDimZ7LZQ-1
X-Mimecast-MFC-AGG-ID: geCr45PGPwqjpZDimZ7LZQ_1791581214
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5345ded3f6dso3403991cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791581214; x=1792186014; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZxvkTxUcJf7CaZriMxWB3wlk03saYsRAfT3CN9F3Ggk=;
        b=B5+xXeBgYtNcjTT1Nr7kDEV0T40IhHn7aXqUo2X4xNKJIkS81ESwog6Gt7BVokifZs
         sS765scpDTFvKaosT5z6cCjcte3HC2pMAr6eQ0IuYssYHBouJEaGkFDdkU96xDd3KlsJ
         2kGgykZ+7/Yic9XZQYP61ByUZDla4mWjLOEjxfF/24/vDwegZ8E3A3IbASroJ7cEJQZq
         Kivg/bSe0mLWRtoIprZ5LaT40ZzuuPah1QtF2COCxhrHmCDfM/FlhAWCBJIRVqWphi2D
         +eE731iPELdRFw5PXN+9GCmoVLMspOaGIFvSpvjAQAfNsYg8mubGV17TA9IjIbzZKjAQ
         liCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791581214; x=1792186014;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZxvkTxUcJf7CaZriMxWB3wlk03saYsRAfT3CN9F3Ggk=;
        b=vU8pdhOSWK080Qw49E9rbgRH1Yg2MSnw8Io6NLZPZJZZdKkuCr3uRKCV7Kx8/5LCyP
         zoTZwSFX3SuZshbOTxjbmFrpScgHM2amyhB/0WD9KGkNDpchDH2SZyHJRwb+O5OlZ0n1
         Z1/2nIZMpbDKQFgZLOjaK1xjEs0VJ8S1OuNPLpmjExNN0lYs38Yuaa+917XjiM3kzbuF
         4yNdKWEpgDBZpjwvC7uEzYjqQnutn+EhQmDIKUIRy4FzifrRtOy5LEvNfesN9WYeGzop
         wF/1sLFDmZGRxJ8iBz4GTtP3qSlSDcL/U/YVAYyXvauKNPqFZ0h0x+e4GtcmoQKYfciR
         s7Qg==
X-Forwarded-Encrypted: i=1; AKwUvBz5JnH8+c+FZEyOYxwQ2P19ikCTBkaLhMZKz5IQnVuQXDsRayaspNLZgFsOssHMJIBqKYc5hPpIx1LCXYc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+6nGS8YgVRsYruel7ODNFNpiv3S81QKuNT7tAVCjEr/w4ikqt
	Pb19Wj3d+USnkpTKxjU4NzveM+R604/PYHYUJarrKsw9wwPiPCvS6xiR5VkkyG1mUhLZB25ZvvI
	A2dDWpqO80wkGbKOLwvzoJvbmxDN2odSxCU7gKPbNVCwMu9tUZMtfVxbTlumUoOAWCg==
X-Gm-Gg: AYBFou3FB2jwHkqd24FPtYTirRaj6kXRfma6JVkhamk93vrrSAITCim7KEm/hQ1BYn9
	GA+Sc1p/CdO5t/M4sm588UUBzpA/3KhhtnyBmiGVoPty1Ggz3kO5V8HzcdVTY8heVlSyalrFvBA
	61TcMuB7AgRp7ljCUaz5HcuuJ/QUXQns9WQ6R6fn6kH9FQ22kFuJWxamvJe5PiVoGSpunUCNREY
	7b3BY8TXwXudcRVgIZ+c1+eddZfqXs3o/ZaZTsO13p9Y17t0U7UtexRy723IxFc2pTWQWc6ZgRZ
	OPquqo7+9JnJYn2wCu9qrV5DAVq+F6kli2etiI3LqSDxxYGggBlBR4g/sbIDWBbaXjkoGIM=
X-Received: by 2002:a05:622a:343:b0:535:209a:2789 with SMTP id d75a77b69052e-5359fae42c4mr54673831cf.27.1791581214258;
        Fri, 09 Oct 2026 14:26:54 -0700 (PDT)
X-Received: by 2002:a05:622a:343:b0:535:209a:2789 with SMTP id d75a77b69052e-5359fae42c4mr54673491cf.27.1791581213810;
        Fri, 09 Oct 2026 14:26:53 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7c0214sm27166781cf.25.2026.10.09.14.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:26:53 -0700 (PDT)
Message-ID: <fa0cc152304b5a387b1a074454ded7f9c540cc57.camel@redhat.com>
Subject: Re: [PATCH v2 3/3] nouveau: Fix NULL dereference in
 nvkm_gsp_gcx_ready()
From: lyude@redhat.com
To: jim.cromie@gmail.com, Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dave Airlie	
 <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Daniel Campos Ramos <Capitain_Jack@yahoo.com>
Date: Fri, 09 Oct 2026 17:26:52 -0400
In-Reply-To: <20261009-my-fixups-v2-3-839e2bbe514d@gmail.com>
References: <20261009-my-fixups-v2-0-839e2bbe514d@gmail.com>
	 <20261009-my-fixups-v2-3-839e2bbe514d@gmail.com>
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

On Fri, 2026-10-09 at 11:44 -0600, Jim Cromie via B4 Relay wrote:
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
> =C2=A0drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 2 +-
> =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/device/user.c | 2 +-
> =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c=C2=A0=C2=A0=C2=A0 | =
2 +-
> =C2=A03 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index ed5c6e0e68d3..933f13ed2a50 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -274,7 +274,7 @@ struct nvkm_gsp {
> =C2=A0static inline bool
> =C2=A0nvkm_gsp_rm(struct nvkm_gsp *gsp)
> =C2=A0{
> -	return gsp && (gsp->fws.rm || gsp->fw.img);
> +	return gsp && gsp->rm && (gsp->fws.rm || gsp->fw.img);
> =C2=A0}
> =C2=A0
> =C2=A0#include <rm/rm.h>
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
> index e475d0e8fa7b..ea895f04293a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
> @@ -51,7 +51,7 @@ nvkm_gsp_intr_stall(struct nvkm_gsp *gsp, enum
> nvkm_subdev_type type, int inst)
> =C2=A0int
> =C2=A0nvkm_gsp_gcx_ready(struct nvkm_gsp *gsp)
> =C2=A0{
> -	if (!gsp->rm->api->gsp->gcx_ready)
> +	if (!nvkm_gsp_rm(gsp) || !gsp->rm->api->gsp->gcx_ready)
> =C2=A0		return NV_DEVICE_GC6_READY | NV_DEVICE_GCOFF_READY;
> =C2=A0
> =C2=A0	return gsp->rm->api->gsp->gcx_ready(gsp);

