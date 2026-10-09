Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23553E4C99
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791581139; cv=none; b=Mhq76I6sJkl58u268OBsXexvR2MLjjTb8qqBrCuBOcjEVY36nNss3UVvVzGB9cj3iskx12Bubj/TOHQPyCS7UMKjf6DMWgKl+3qif80eX8PgrwTy0AKi7VwOJUDb/wYUOQCMwG5aqNuPDcjurgJ+kAuF2y1beYWd99mldPTKYpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791581139; c=relaxed/simple;
	bh=Pbud6lw73mMWr5s+VVRcxKsEpmTTMCVIPk5+bnlRjPk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=azm1vULhXS6W9PvMolLWP69wypN5z/vwA4gK2dgpYgzd+ifc6SzgVaqgUrBHV5aznvwXv+vrSo8zLw5Yf5D4hEms3UDMIxAv0hAnaXrmEHgASzhf4LmPJuJipcA6p8WsQ9yYOl4Gz3IFcJYs2X6b2+cOle38WIoySppWV2D51/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XyJEcr1Q; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ITTFpWU/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XyJEcr1Q";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ITTFpWU/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791581136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4XVeputkPvs6515x7jeBdEMihAqSCocptjoH5SwkFZU=;
	b=XyJEcr1QvXwI8poOScG4J+zBQz0yFuUn48Uc5KxFGghX7oebIY/ug7lsyRu/wZgDi/9nPf
	muyWHPt0VGf/zFavIWXORLk7hYEetJP8mn3frd+5g+/Q7Td81yi3rObmrniWKbnxHE9rUD
	sFJNMYCSUnpFibbVS6Aetgjm6K5m1/o=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-WLpuSZOpO--FwxFI3QoBxQ-1; Fri, 9 Oct 2026 21:25:35 +0000
X-MC-Unique: WLpuSZOpO--FwxFI3QoBxQ-1
X-Mimecast-MFC-AGG-ID: WLpuSZOpO--FwxFI3QoBxQ_1791581135
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b650901a0so5499546d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791581135; x=1792185935; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4XVeputkPvs6515x7jeBdEMihAqSCocptjoH5SwkFZU=;
        b=ITTFpWU/Is4LFhW0Z+9+DacM1Ch2XnzldAHYeRSJgmyaEvf5GBSDMoMbQ+nkxZcO1X
         yl/xyTOIiuyek7hokx5nNoBZnrPocyK/j5zpLDhoMvXrmmmiZkhs4EoFUkwDycpnoiMM
         9g3Sd8OrunehFaBU4hBVAA75ng5MT/4l1SZRH4NjwSmK73DVdhXJAoifTu8ktyR8hpA2
         1sBKPf9Py2Ev0XDL5tO/f/lKJFV0ldPZJLgyd80YQ3A49DdZQvdkiP6Yqe7jYTd+iElo
         +EWxjvkXnfH3ar+bnVKjHMobfn6/77M1STpe1jRLCXr0J6k+4tve1ARgx75CZCrV3WwD
         aPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791581135; x=1792185935;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4XVeputkPvs6515x7jeBdEMihAqSCocptjoH5SwkFZU=;
        b=D+IhaPcHYD+fbnjJwl8Ud1sYld4Z59IGcV/TQn3GlwfEVNY6UT/meNKHXdFC4wf+Fn
         9LPJ01/0Xsg618eEKJA1WaXS1R/Y7JMYYvK/VW1a6/3XuE27UvJunBp7xEz0lz7OfrAc
         1bxQz/gKvClK1ss8n12+0CQy59iGF+WTTQWGZ4oU9dMSkhKpgWsftNLaPz3Vt2tTNNZt
         p5oubo8F1PDCzU4xVPHQKJbXHbT1F0IiuNL3HlPfWbiFup9b4eoFeGBxhAenGQVgqsm6
         +6PVi/zcMLwbt6s5RM+67Jo+FHVWrolTnJlowTHSkyPM2doLtK83BXKTRAXgtbypBrVM
         KTQw==
X-Forwarded-Encrypted: i=1; AKwUvBxLbnkw1iYexmND5sey7SXwSjcHGz4+mOrLJQWXJ8QW4WZYyz0LwyAF57JOxHaQ6muZbbni1Qt6pZmRB6I=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8Y+ZE7JdgXjBQDg5FyMUMpabK6x6LcdEjGIfdIrCtHNRw2Csz
	HHOH6GOUkwgnu+CyB2A9GuRraK6jhpWuPVJet7kKLvC1CjozZ9DKqPMB9VFkDEDZD2mHDnpFajY
	mThu4ZlbQShLDb/47muKQXR3ayBVzD1gvP4jEo0Q9RGrQq6M6ltzsZUUcuRd5VxNEVg==
X-Gm-Gg: AYBFou20qojB8KG8Mj+A6XlD5rOfIItTIG+9LxY+5AxN61AgTKu6qwOh3YdlT3uYt6P
	qss4Rbzl3mCcjtA/fUUZSK/eSxHMOIJhM3R9TOzDSAgayhoPV1XM2wdh0/x6awsXrJv8KaecnJK
	FBKR+vaxZOszhKSaHtNQmk7WdWclh7sB0FOzz/ui9GqAuv/JaKejW0mcyMI23HOsCpAtvTvpkdS
	nqm2zxbke3ZaeEsgBgYywa6OIVIKblF9U1joIT2DEo3+FaiJ7/zB0VGVkikZp5O2OXfnQgPrX1F
	1n5/AADk9YnM6dIsN0dPoVpEaVINw8gNuea1ekYDa27WmRCnsDtcaGCr/iXiQIzuJhY14oc=
X-Received: by 2002:ad4:5deb:0:b0:917:bbf1:5323 with SMTP id 6a1803df08f44-91b55793527mr54975526d6.38.1791581134768;
        Fri, 09 Oct 2026 14:25:34 -0700 (PDT)
X-Received: by 2002:ad4:5deb:0:b0:917:bbf1:5323 with SMTP id 6a1803df08f44-91b55793527mr54975196d6.38.1791581134294;
        Fri, 09 Oct 2026 14:25:34 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550175e3sm28273536d6.11.2026.10.09.14.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:25:33 -0700 (PDT)
Message-ID: <c2bb04d3fcbfdfe3a92a794800dcb0331cc78a33.camel@redhat.com>
Subject: Re: [PATCH v2 2/3] nouveau: Fix NULL pointer dereference in
 GET_ZCULL_INFO ioctl
From: lyude@redhat.com
To: jim.cromie@gmail.com, Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dave Airlie	
 <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Daniel Campos Ramos <Capitain_Jack@yahoo.com>
Date: Fri, 09 Oct 2026 17:25:32 -0400
In-Reply-To: <20261009-my-fixups-v2-2-839e2bbe514d@gmail.com>
References: <20261009-my-fixups-v2-0-839e2bbe514d@gmail.com>
	 <20261009-my-fixups-v2-2-839e2bbe514d@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Just for patchwork's sake, since the tags got stuck below the ---

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2026-10-09 at 11:44 -0600, Jim Cromie via B4 Relay wrote:
> From: Jim Cromie <jim.cromie@gmail.com>
>=20
> When graphics engine firmware fails to load or initialization aborts
> early, nvxx_gr(drm) returns NULL. Calling
> DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
> causes nouveau_abi16_ioctl_get_zcull_info() to dereference gr at
> offset
> 0xf0 without checking for NULL, triggering a kernel page fault.
>=20
> Validate that gr is non-NULL before inspecting gr->has_zcull_info.
>=20
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> Aug 14 09:21:52 frodo kernel: BUG: kernel NULL pointer dereference,
> address: 00000000000000f0
> Aug 14 09:21:52 frodo kernel: #PF: error_code(0x0000) - not-present
> page
> Aug 14 09:21:52 frodo kernel: Oops: Oops: 0000 [#1] SMP NOPTI
> Aug 14 09:21:52 frodo kernel: RIP:
> 0010:nouveau_abi16_ioctl_get_zcull_info+0x17/0xa0 [nouveau]
> Aug 14 09:21:52 frodo kernel: Code: 00 00 00 90 90 90 90 90 90 90 90
> 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 8b 47 40 48 8b
> 00 48 8b 80 70 02 00 00 <80> b8 f0 00 00 00 00 74 72 8b 90 c0 00 00
> 00 89 16 8b 90 c4 00 00
> Aug 14 09:21:52 frodo kernel: Call Trace:
> Aug 14 09:21:52 frodo kernel:=C2=A0 <TASK>
> Aug 14 09:21:52 frodo kernel:=C2=A0 drm_ioctl_kernel+0xae/0x100
> Aug 14 09:21:52 frodo kernel:=C2=A0 drm_ioctl+0x2e0/0x560
> Aug 14 09:21:52 frodo kernel:=C2=A0 ?
> __pfx_nouveau_abi16_ioctl_get_zcull_info+0x10/0x10 [nouveau]
> Aug 14 09:21:52 frodo kernel:=C2=A0 nouveau_drm_ioctl+0x58/0xc0 [nouveau]
> Aug 14 09:21:52 frodo kernel:=C2=A0 __x64_sys_ioctl+0xb9/0x100
> Aug 14 09:21:52 frodo kernel:=C2=A0 do_syscall_64+0xe2/0x560
> Aug 14 09:21:52 frodo kernel:=C2=A0
> entry_SYSCALL_64_after_hwframe+0x76/0x7e
> Aug 14 09:21:52 frodo kernel:=C2=A0 </TASK>
>=20
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Tested-by: Daniel Campos Ramos <Capitain_Jack@yahoo.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_abi16.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> index 3f130cd4fbcd..c7ddc54a3c4d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -358,7 +358,7 @@
> nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS)
> =C2=A0	struct nvkm_gr *gr =3D nvxx_gr(drm);
> =C2=A0	struct drm_nouveau_get_zcull_info *out =3D data;
> =C2=A0
> -	if (gr->has_zcull_info) {
> +	if (gr && gr->has_zcull_info) {
> =C2=A0		const struct nvkm_gr_zcull_info *i =3D &gr-
> >zcull_info;
> =C2=A0
> =C2=A0		out->width_align_pixels =3D i->width_align_pixels;

