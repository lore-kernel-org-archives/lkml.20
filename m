Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9514E50A9
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789675166; cv=none; b=bmpCLIaID8wrfYOWh4yWWJpP44VqgMvoLlWJa8SwDHmvsgz7mGVNrSBOZ6y6x0GpTEQYBhYad0rEOOzIigplxOiBWduXJmwT8LgULEUx52eTNlJUfyeteqfxJs1hyr5rii61z1e8TUZvv1/9zK2uGROLFHF1NKYF7AGp4I/Er04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789675166; c=relaxed/simple;
	bh=yk0ZZEfCsoFw6jUtj7ij8XhDzHLLwPW+p3DnKrJPG+o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YOB1M88fvI/L6p4z6VQhqSohp4qbnRJd9sYl8d3pL/W7Ou83gEGdHWt9QoaHSPhSLXyWvvx5x9lbirwepvBKPeh9On18hanmOUbYmoF84HOwdE3TRlfDpwioRyf/IhBcohhD/OuBLn4tzAiFeCIF5j4Adq96Kl7+eFX9CqVEN60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eicz2oP6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TjlgKwMF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eicz2oP6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TjlgKwMF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789675164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/9aXv8uRrrDfO592gJdgz9hZv2sNMllIL5UBHr09UAU=;
	b=eicz2oP693T31Fu1aNC3sf4K8WUf+ZshJNjeb1rzXihftfSdp+j/QXWETthlgzOokO8v/h
	6fpdln2rouGSecT+sLFca+qMxhvDhbsDIxd46qv0/rIhI2MVxORqoxgrNzY0wY9wO0k2ZP
	nVzTJ6qWU5v999wIj3EWN+iQKfk4NcU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-wYCZCPnYNdKF-rZ_6FeIqA-1; Thu, 17 Sep 2026 15:59:22 -0400
X-MC-Unique: wYCZCPnYNdKF-rZ_6FeIqA-1
X-Mimecast-MFC-AGG-ID: wYCZCPnYNdKF-rZ_6FeIqA_1789675161
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a3f673221so3232685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789675161; x=1790279961; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/9aXv8uRrrDfO592gJdgz9hZv2sNMllIL5UBHr09UAU=;
        b=TjlgKwMFxhtm/EWKI9pFMuP0vz7bnzravSJcXv3Iuq7x9szR+hxob7MdxoNYv+yofd
         w+92o/LrwGTBczGzH3stfym6qFnMVUcN87/cip6ViWyFkvTgXTHEKCSYKnTMn46isDIY
         zQbn7nY76txdUHn8oIfx6MspTKg5B0YD92DUVHB8Uh0t8Inf14FJM4Zv9dhkYXUsag+4
         lwnPWb5feBVsgOBRyy32jDOcbAozrVcoCuyjp9RqxdFpCNI31AahhC6ErcLEsFgpiS5P
         U/iA2g0OkwAJNbavbGcqpoER9233BW6wNEf3DnAoZMf7rcVIaUJXmCaKi/EJNpqsTUcR
         07ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789675161; x=1790279961;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/9aXv8uRrrDfO592gJdgz9hZv2sNMllIL5UBHr09UAU=;
        b=B+uscfNAgfG48iImnFcw2Kw6h5eFZKh+wGCLu+Lm9/X6AXl3VvqsURQ7AKOvHLCLxs
         jxAH+V4r/zhDsYKYntJsIDOiiQiZnps1zpL3kgvB/r+MuBXPhmNMXKoPdl3fZFSJczvH
         fX9sZSjrquLWIkS12ZS0EamI3652ZGfxmpLXZqtlWDloI+SARI5ptM+UGmB5WSR7f3CL
         uwtJn6T3Cs++VKu9fS1B8D5kr5G/NSsSA/Mx9BKKeEuY5iCY3lqVFACY6dPZJ2Hov335
         YAQtjFxQtrhoRkNtuVDVGE64I4eVWzbEaVSfZssVBJl8rGU9OhRwp6z6b9goQmE6T3x5
         a8SA==
X-Forwarded-Encrypted: i=1; AKwUvBwZjavsj/LE/bVnuHeYPe4VIyfxl8YBtOglDgjbylgIQPcT5CenmncfyM48kJHkTXoJMYPANuThkYWNHKs=@vger.kernel.org
X-Gm-Message-State: AFuF++mnQF7JaudTpWwzOh+/s89mbzYJ9h699/wuURqSvRCIY5ixu2+P
	UYrNYqZ/tUkmGsIBMmRhPKtTbLI3Trkfb4edmm+4jH+4Fbne8quQk4GRz+eBomTbUGU6M+bnzcG
	zyZpXmo9LKBM06Md1ZTM8UJzNzfCyK94r/0T8BaD9X8p3zzy1rgUUXUvmZQZZ0TSpfQ==
X-Gm-Gg: AYBFou1F/QVVFvoRMP27EjeujggcrwXHjiy9ItVsEP0wjt8YNz1IC3EOKBiqJqcaKSM
	PQ9IliqqBEcULNp5C/EEZVb16xqinqpBhqMwB/d3AptyNVQZgw+3os0HypTdqSAbc6eaSRS6JcL
	RUsWD5vF/z5JetUJEagaRUQfiI15kD9ZrOG161zdAqGT5hP2qDkRHcN0XUxgApnguxCTV/9uhOm
	tEjHs6Qy+yM8L6PMenfdogLiAkLt0/i+KikZ9ywUt+bdm9/J49kxju4j/uJZ2zTZw59iDdlk5u3
	AGm7b9AYSCD1hBEE9QmfIxvx1pCVghjUImtjG2g0a2fQJQY+3L7u5APtAKGgpOAG22JRFBHC
X-Received: by 2002:a05:620a:800e:b0:937:1097:feb8 with SMTP id af79cd13be357-93bdc70b6b7mr2619285a.24.1789675161530;
        Thu, 17 Sep 2026 12:59:21 -0700 (PDT)
X-Received: by 2002:a05:620a:800e:b0:937:1097:feb8 with SMTP id af79cd13be357-93bdc70b6b7mr2616085a.24.1789675161049;
        Thu, 17 Sep 2026 12:59:21 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b78243f77sm542694385a.25.2026.09.17.12.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 12:59:20 -0700 (PDT)
Message-ID: <495954974fdaf275d65ea8ae1b76f8e496c09b79.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/nouveau/dmem: pin VRAM for the whole registered
 range
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
Date: Thu, 17 Sep 2026 15:59:19 -0400
In-Reply-To: <20260817-nouveau-fixes-v1-1-f518d0c735f3@outlook.com>
References: <20260817-nouveau-fixes-v1-0-f518d0c735f3@outlook.com>
	 <20260817-nouveau-fixes-v1-1-f518d0c735f3@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2026-08-17 at 14:50 +0800, Junrui Luo via B4 Relay wrote:
> From: Junrui Luo <moonafterrain@outlook.com>
>=20
> Commit c32287471077 ("gpu/drm/nouveau: enable THP support for GPU
> memory
> migration") grew the device-private region that
> nouveau_dmem_chunk_alloc() registers from DMEM_CHUNK_SIZE to
> DMEM_CHUNK_SIZE * NR_CHUNKS, but left the VRAM buffer object backing
> that
> region at DMEM_CHUNK_SIZE.
>=20
> nouveau_dmem_page_addr() returns chunk->bo->offset plus the page's
> offset
> within the registered region, so every page past the first chunk
> resolves
> to VRAM outside the buffer object.
>=20
> Size the buffer object to the region it backs.
>=20
> Fixes: c32287471077 ("gpu/drm/nouveau: enable THP support for GPU
> memory migration")
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Assisted-by: Claude:claude-opus-5
> Cc: stable@vger.kernel.org
> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_dmem.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 9442ec6e1f6c..356ff8f3c1b8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -325,8 +325,8 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm,
> struct page **ppage,
> =C2=A0	chunk->pagemap.ops =3D &nouveau_dmem_pagemap_ops;
> =C2=A0	chunk->pagemap.owner =3D drm->dev;
> =C2=A0
> -	ret =3D nouveau_bo_new_pin(&drm->client,
> NOUVEAU_GEM_DOMAIN_VRAM, DMEM_CHUNK_SIZE,
> -				 &chunk->bo);
> +	ret =3D nouveau_bo_new_pin(&drm->client,
> NOUVEAU_GEM_DOMAIN_VRAM,
> +				 DMEM_CHUNK_SIZE * NR_CHUNKS,
> &chunk->bo);
> =C2=A0	if (ret)
> =C2=A0		goto out_release;
> =C2=A0

