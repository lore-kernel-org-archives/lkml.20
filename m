Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792435491;
	b=O9fPJK9YPNX+7TkDo/Hr9fEi2+0DUh1FER1xtvdWlheZlnm5SJuMTJclMt+izlwypwpw
	 6TQlmuTqbija55oGfiIJQA9GgbshalZfSge/ol4Uyr0ucLwxzeC4ERfgrvaFwAYtAeKiI
	 IWfuXYwDxXaW6XcgJMCgdOtFR1SFALaB4kSYrZuspRC5UzoUCBSw44pc//YTv4wpA/pqG
	 3pzICScJkmDiBG9wqkGhmYMMW0vCtqbGDse1PVUL43HP248VHTgjlUoK9QQGsuuoaJfqq
	 z/2B5aj4BXvp0NE0oyjAyhL8p1VFSkrPElj7vYa1zvkusKHgKFMD3RbHrRfNjLYLiyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435491;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-MBO-RS-ID:X-MBO-RS-META;
	bh=1hyTFIczVwBTbuTD9u3qlDRdRTiLvYebWfv2QvZy+3k=;
	b=tOjsfM6p6H+1rKCktLCWW0iL1ms/F5N9L4cllwcfID5EytFVUTPEXkSskovo0QVV5ZUn
	 qkWokuyMHsu5o1+fLAWi5ORidIZhJPckVVQEaRbhzgSBxMunK5qTn8qMTfpKCaSS3wLTS
	 U4WOKHj88kL9TPEnvfqAuUTSLCN3U0goTQfRPZc5BTB1b27aI7y7IJk77xPlm3WZP2Xx+
	 9F3sOiVaK+2/d+c3HEZUrrJp1T2EAR/Y9nx6dwtAxpiKQ7P0g0s2RTrOWfxZFOymbTeVb
	 wEadP1Zs+jd1QNhnCAnROxuCkQ3yuATi5C/V7PGILyrQqbT0ah4HWtNg8JXZytAqkbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=VOYUviBl;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FE0606A321
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9FE0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=VOYUviBl
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4j7kx53FnWz8twZ;
	Mon, 19 Oct 2026 20:44:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1792435481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1hyTFIczVwBTbuTD9u3qlDRdRTiLvYebWfv2QvZy+3k=;
	b=VOYUviBlmHhk2riL+axIOOtdU9wpP9vEKOQ+Plcs5EwSREGVeVqfC1UwYzC6dubJTpexv9
	2rpzERYeDIaZ5OzFsdkSNeXDEuTpp15AVzJHwxGwhVkFIVswdkrDyuP9HZLeTrbJwEj5SR
	X3S0LcpOTtBa04D8D/dIxTrVSw0eXY9IBHBsdJT/bqfu+hIeWfn7my1OGF7yf2Td2DifTl
	l9fDFRmkdxG0QJRKxduOHsRr0JcbG/7F0FxrS74v732r2mU2b3eTfETXiB/nPkWfs7yIan
	ybI7Ii/olq/wmktssXxMg5FOJq6P1xGpobTVgVawLFdNankpebABLGLrzZGv/g==
Message-ID: <011f1b7bc698d01789f01e9d3263d7b012149693.camel@mailbox.org>
Subject: Re: [PATCH] drm/gem/shmem: fix documentation of
 __drm_gem_shmem_free_sgt_locked
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Alexandre Courbot <acourbot@nvidia.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lyude Paul	 <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Mon, 19 Oct 2026 20:44:38 +0200
In-Reply-To: <20260622-b4-gem_shmem_free_doc-v1-1-85496c597b18@nvidia.com>
References: <20260622-b4-gem_shmem_free_doc-v1-1-85496c597b18@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-ID: 1543e4477b3970e1a46
X-MBO-RS-META: pn89y41wia3irmtezsyotwjhd41gxra4

On Mon, 2026-06-22 at 22:13 +0900, Alexandre Courbot wrote:
> The kernel-doc comment for __drm_gem_shmem_free_sgt_locked erroneously
> mentions __drm_gem_shmem_release_sgt_locked, triggering the following
> warning when building with W=3De:
>=20
> =C2=A0=C2=A0=C2=A0 Warning: drivers/gpu/drm/drm_gem_shmem_helper.c:174 ex=
pecting prototype for __drm_gem_shmem_release_sgt_locked(). Prototype was f=
or __drm_gem_shmem_free_sgt_locked() instead
>=20
> Fixes: b78dab829760 ("drm/gem/shmem: Introduce __drm_gem_shmem_free_sgt_l=
ocked()")
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Manuel Ebner <manuelebnerli@mailbox.org>

> ---
> =C2=A0drivers/gpu/drm/drm_gem_shmem_helper.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm=
_gem_shmem_helper.c
> index c989459eb215..6319fe44a2da 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -159,7 +159,7 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(str=
uct drm_device *dev, size_t
> =C2=A0EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
> =C2=A0
> =C2=A0/**
> - * __drm_gem_shmem_release_sgt_locked - Unpin and DMA unmap pages, and r=
elease the
> + * __drm_gem_shmem_free_sgt_locked - Unpin and DMA unmap pages, and rele=
ase the
> =C2=A0 * cached scatter/gather table for an shmem GEM object.
> =C2=A0 * @shmem: shmem GEM object
> =C2=A0 *
>=20
> ---
> base-commit: f0c1bb8ead8a9790e7d0339354598b50a9c6789a
> change-id: 20260622-b4-gem_shmem_free_doc-6dd48f97cd48
>=20
> Best regards,
> --=C2=A0=20
> Alexandre Courbot <acourbot@nvidia.com>
