Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F72931E844
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 22:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791583298; cv=none; b=eQaBmju47ztMDTlY8eMsxpt/5H7Sl4w9scOLwPqqYWIXY12RMlj5zG9WMC+iwmaNbvR3zRKqQpw3b8PSyCyBxOBu6ycqtC1bqKG4TeeLlOt+yTWsFVk4MxTqCPAbqO9GRD93b1UawKa0ErQnuAQwirs3bEsUmr8bGSHEfLXdzjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791583298; c=relaxed/simple;
	bh=T7imtYyWMwIHvOB2ZFxNOfZ9OLtnlcEZ/kjK2JkgTcA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QQTFXl/dfvAU8bVMDvqzqcfSPo1kUhc1GTXYO+K5P0mRZ3Glo7Wng5DZ9nMCEoWqyvSkd9x0LdJZC4glFo1J3fN9LkBSBymYepjZpmjvvSRgIip5rB7vkRLJiqMLO2pdIZ8nQbi2sExam5uwTHplnAoeLK82e1otp1kobasBpQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d4A6d+lp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Krt0uX1h; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d4A6d+lp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Krt0uX1h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791583296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T7imtYyWMwIHvOB2ZFxNOfZ9OLtnlcEZ/kjK2JkgTcA=;
	b=d4A6d+lp5Rlhq/tvyxLmOswXfNTsx9HOlaYS+c6uYPZv+nPCACP2/aq47C0D9zTiaJN5MX
	iOGiNGowSGwxXmrFLBtEUw74JCfzagIs+UuBe0P4ZhQQEh2yWNhU94Vtjo2YsQl/VOePaT
	B/CVd0zyQ+sUw8hSZzbv+/QM0hevoYg=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-pyfZXea7O0S6FIgy7qBaPw-1; Fri, 9 Oct 2026 22:01:28 +0000
X-MC-Unique: pyfZXea7O0S6FIgy7qBaPw-1
X-Mimecast-MFC-AGG-ID: pyfZXea7O0S6FIgy7qBaPw_1791583288
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5351f1b26e6so2704101cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 15:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791583288; x=1792188088; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=T7imtYyWMwIHvOB2ZFxNOfZ9OLtnlcEZ/kjK2JkgTcA=;
        b=Krt0uX1hhjS/6ZaLz/dWz7t8tH2XN5NOrVz1siLy+FohXk8ceticQm0aAyoRercZyX
         +vStiVyhPxGVih2v0ch95/TKX+LEcgmIIC0VGarxP4MczlQdajpwTFJhLdn003Dt+/FO
         IMTVwXdxkea03sqYp8i3u5m8t9Oaluf7YzFGqKYB+ABSSF0/vS+VY6OpztDedJyUbB2E
         RIB4ccGdVjiCaoSEijeu1Rv71Irzs905Plu7zaLSLA/mubHVbvTK+7/Hfa8bkzsYKQYm
         RupjWnXR/uuwUlcb0sx2E88t0zsR48kMVM24S8aifziDYWxPo6WL91NoA7/3++/YHLEp
         yfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791583288; x=1792188088;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T7imtYyWMwIHvOB2ZFxNOfZ9OLtnlcEZ/kjK2JkgTcA=;
        b=vf4532Gfo0HJAobF08BCIGQLZSvIe4Tkll26iDZtE7TRSz7FqBuaxu1Gv36gk3mq23
         Y+WW3F+gsMfD91053lMstpWJ8CN5B2cDeF6v6zC6DQdiaA1imT+udJPdn2DQ2Ydx4+Bj
         MHVeP9UcZqItEqBZ/c/5qoKuaOhLz7/cdoET/kPjlbU+BAmN3Yp7ld9SwAV4Aun6Broy
         QKPqoOnZpaKDvuqTF32Rx5oMC5CqEy4RJUSZKoycjW2/d1Y8GXBGDEwukSXNwnvDpssa
         HDVNe5ndEZvW9iQQbb9m9OglYk5Dj2Rb4XC5ANvaCIcryDMPzMKyOVqj7Ul8w/eicHWd
         GaOA==
X-Forwarded-Encrypted: i=1; AKwUvBztbkRV+uP7CEyMaW3XapmmIIZjCUix4p5VHK7yDsGFLwCNJOKiIXRVXIM1UYzaLHcqy9J6mVCrNt0QR3I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNvUWw3kBj/IVsGg7xhf1WH0JI+azltz1rxIFCPO08RaPhh/0x
	Y88/tUJlNp2iR87MQZlTef/QWDRakivOEgppqtbYN26mWuI/6pVzcgGW4TIdmNTcY3puWc5OZK3
	rSiwKaSXaM/VNRCyQpbZBnYEo85OrY3cSqo1fxh3bH+uCNCkBya+nzQrhp9zrqenkHg==
X-Gm-Gg: AYBFou3PKIi+QhHt3tezupsle8T7H1pJvyGCKzXpN88AxqfIwKhGv7Jl4KnrCKUpzt+
	cgMwRLXf6jCB9+AP/gSGqEF4d1sKKuNwbYGgGDOq2ziB61h4UVcdHe1ta0mpvPAdArURTHKse+W
	1skn8cmMlx3zTxXA/bo5c+7Ltrn+KYkfiBr59BGoKo6t4s145kbouUyabseQBI8uRi+py7QVWnv
	BY5bhCAfIE9OaKcpOu/VX7EXC66//1GS5YjRAXDMDwHeHXVA60cjHxK+DQlIuLg35fDjfLJClvv
	pQ+sTo7lbGQV2VlVMqcdn19Mby4UWvXKCpF+iLpnrw/9D3IYiWHsfwfXlmASKJC8PYTUUHU=
X-Received: by 2002:a05:622a:1a9e:b0:533:972d:ff91 with SMTP id d75a77b69052e-5359fae1644mr56984121cf.26.1791583287945;
        Fri, 09 Oct 2026 15:01:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1a9e:b0:533:972d:ff91 with SMTP id d75a77b69052e-5359fae1644mr56983381cf.26.1791583287345;
        Fri, 09 Oct 2026 15:01:27 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b5504de42sm29021296d6.24.2026.10.09.15.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 15:01:25 -0700 (PDT)
Message-ID: <77926aa23a920ed00c5b1a13d98e768e11d6446e.camel@redhat.com>
Subject: Re: [PATCH v2 3/3] nouveau: Fix NULL dereference in
 nvkm_gsp_gcx_ready()
From: lyude@redhat.com
To: Danilo Krummrich <dakr@kernel.org>, Jim Cromie via B4 Relay
	 <devnull+jim.cromie.gmail.com@kernel.org>
Cc: jim.cromie@gmail.com, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, 	nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Campos Ramos	 <Capitain_Jack@yahoo.com>
Date: Fri, 09 Oct 2026 18:01:25 -0400
In-Reply-To: <DM0N3VIIXERD.PZBNSZJPSEL7@kernel.org>
References: <20261009-my-fixups-v2-0-839e2bbe514d@gmail.com>
	 <20261009-my-fixups-v2-3-839e2bbe514d@gmail.com>
	 <DM0N3VIIXERD.PZBNSZJPSEL7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-10-09 at 23:53 +0200, Danilo Krummrich wrote:
> On Fri Oct 9, 2026 at 7:44 PM CEST, Jim Cromie via B4 Relay wrote:
> > From: Jim Cromie <jim.cromie@gmail.com>
> >=20
> > Commit cb4c7603678c ("drm/nouveau/gsp/r570: Add support for
> > INTERNAL_GCX_ENTRY_PREREQUISITE") hooked nvif_device_gcx_ready()
> > into
> > nouveau_pmops_runtime_suspend() to consult GSP before runtime
> > suspend.
> >=20
> > On GPUs running without GSP-RM (e.g. Volta GV100, NvGspRm=3D0, or
> > missing
> > GSP firmware blobs), device->gsp is instantiated but gsp->rm
> > remains
> > NULL. nvkm_udevice_gcx_ready() checked "!gsp" instead of verifying
> > nvkm_gsp_rm(gsp), allowing non-RM instances to invoke
> > nvkm_gsp_gcx_ready(). nvkm_gsp_gcx_ready() then unconditionally
> > dereferenced gsp->rm->api, causing a kernel oops:
> >=20
> > =C2=A0 RIP: 0010:nvkm_gsp_gcx_ready+0x10/0x30 [nouveau]
> > =C2=A0 Code: ... 48 8b 87 70 0e 00 00 <48> 8b 40 18 ...
> > =C2=A0 RAX: 0000000000000000 RDI: ffff8c9555fca000
> > =C2=A0 Call Trace:
> > =C2=A0=C2=A0 nvkm_udevice_mthd+0xa5/0x150 [nouveau]
> > =C2=A0=C2=A0 nvkm_ioctl+0xcc/0x1d0 [nouveau]
> > =C2=A0=C2=A0 nvif_object_mthd+0x110/0x1e0 [nouveau]
> > =C2=A0=C2=A0 nvif_device_gcx_ready+0x36/0x60 [nouveau]
> > =C2=A0=C2=A0 nouveau_pmops_runtime_suspend+0x39/0x140 [nouveau]
> >=20
> > Instruction decode shows `mov rax, [rdi+0xe70]` loads gsp->rm
> > (0x0),
> > and `<48> 8b 40 18` (`mov rax, [rax+0x18]`) faults accessing rm-
> > >api.
> >=20
> > Fix by:
> > 0. Checking !nvkm_gsp_rm(gsp) in nvkm_udevice_gcx_ready() so non-RM
> > =C2=A0=C2=A0 devices report GC6/GcOff ready and bypass the GSP call ent=
irely.
> > 1. Guarding gsp and gsp->rm in nvkm_gsp_gcx_ready() before
> > inspecting
> > =C2=A0=C2=A0 gsp->rm->api->gsp->gcx_ready.
> >=20
> > Fixes: cb4c7603678c ("drm/nouveau/gsp/r570: Add support for
> > INTERNAL_GCX_ENTRY_PREREQUISITE")
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
>=20
> Isn't this fixed in commit 4d0e27041185 ("nouveau: check gsp->rm as
> well as gsp
> pointer before gcx ready") already?

(gonna hold off on pushing all 3 of these patches, you're right - I
completely forgot that we had already pushed a commit for this)

