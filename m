Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28B23BD64A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 21:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791496227; cv=none; b=iPhrkS+Dm2vOiyc11mV+W4soA/O7yTbYEnta87eEEIJqSM5Nyhxt/uEc6A7M2mGvxaHeZ1cs8NTEQbN38FnbRXxNY4FzpCX6xKhwtarXuhhh96uvJXXe8GEx6kv2BBV5LCNn5Ngy1uSqR2bQ+PfFATlGPdBO4L7uANZ5yG5I6Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791496227; c=relaxed/simple;
	bh=rWKG1JijV4BQTTWj7dooJHzcLuJslHBO516+1i97GkM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YkVsemi0yzNNZ6zlnmwMer0xAthWvcIJvGmTu4RzkbFE7eleBILMYGR46KtNuIrH4zq6+rpLqui7JzWaocpBC+Dcga5EPYlT7aM++ZutaqtWfyfiqoDu/60gT3ygKr6vjBrmskbBsZGNHntCxjg3HmZNnXMTM6Ra6Rl5anM72fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TwrZ/gB1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nz5a3+GD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TwrZ/gB1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nz5a3+GD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791496225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yj5+6LkgWgCIxY4tLK8pHE/X0tclHYwKwnVGo/2N7mk=;
	b=TwrZ/gB1T27kOwPxv40tZRNszGRVAiRtxnHBY/Po78pd8sdPgkc4bxe8SXrZ61QBjIOTYf
	g8WrG66MErJgcXuBVkPRA+AMWACFmFZv4c/i8N7rJc62hwsjSAq4gwI1Jc6tjX/qSvogRt
	e2s2I89mIdiZ6SykaeAetjoPsj01tmM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-vet8u3oMMTKVrOPyxeb7jQ-1; Thu, 8 Oct 2026 21:50:24 +0000
X-MC-Unique: vet8u3oMMTKVrOPyxeb7jQ-1
X-Mimecast-MFC-AGG-ID: vet8u3oMMTKVrOPyxeb7jQ_1791496224
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91430af782dso121492536d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 14:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791496224; x=1792101024; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Yj5+6LkgWgCIxY4tLK8pHE/X0tclHYwKwnVGo/2N7mk=;
        b=nz5a3+GDhCsonSb9ZHl6wee3mvxOKsueXFNdf1aKihvQ2S7IgXsx/tyNVoJLbHqOQ/
         IthXxAgipxVj0OOcQKQ7xr0o1DLiTTs+/v5aheyb8tcyuf2AvSbG4utgzN+3NGRxakmX
         IbG5TfbyAFaHASI15W8yDtbhIWrQWwQRWzvRw/NuYn+JLCG19lqwuzIQGkUC9xFgKMpw
         4oZ2/2ivT4nZ0uDfh7li8cGot8sJz0WRDBjUKY0vwYiExmSqbQFmCsgw/CK4BEF64fKD
         beF0IzKlBJV10C+RRd48/AxEtCcnf5OrtXuYy0mbAT0hWCr3wZdeM7aCRcnqhVCmk64g
         LqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791496224; x=1792101024;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yj5+6LkgWgCIxY4tLK8pHE/X0tclHYwKwnVGo/2N7mk=;
        b=aZHKVTHwKPluhToGDfIOq+irtc9GFk751LMSnOUSUwnqoRYyU5BdcoHcyPL64w2Jhk
         KbQqlFm59nqcifpP44DGfSvmfywuU7ygw2n8x2Bx3Y3lcv+7JnciOu520/5RQBaFHthP
         u0ciluA0irqrPpcU35ioMk02shgTUvKOVqIdrH4ajuC9XWgpGeWPRkUtMSVdWuiWBFoX
         Wq9cerSg4chszv1xVotOcrRP/4FUopd5ZqPHeSFqj8MBOBDqoZa2djEZUck+1C2nbhws
         A8e1qpjIozw8U42AnBQ/BBCrKALy5y4uv2Nq1YPVFyQaztmTy7pEPWdAwSutCCaMdTXp
         C+Bw==
X-Forwarded-Encrypted: i=1; AKwUvBz/pAscCkmkgYh0ztMWNtiSxHdE1ECaw4o0AcydsVbPI5RQRtoZNGf1MTbpRweTXi4rPiFxoAA2bWuFCZM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCPz08xX2xYMPK1yx98X9iKVR3aIsdvLkd2Fv57p9VXQY3w7Rz
	fUZll1bO9LN83zLD5mvWdy+l9wHlvy/jijcsiIqpham6L2+Vjf3AnlgkAq7vmVGEpG/2cX1Wlxi
	yMMwI6Fq06aBVhvcyqcJ8BOWJW+NLOBkqNira7R4Wfook763x1OX/oG4B6vCr6Dr1ag==
X-Gm-Gg: AYBFou0GFjHSZsBczkcp8TQdMk8Wj7TpogHXXnSp8gi3POEwrBcsukKe6VFyu5ho5V6
	sbf1bC7ZyeWqamGTWg7UVqBnWJkb53u3kNlrZQ9PjKvNwzw2uMizOXyERfFsi2sEMeDs/yuyRcc
	o6wmCgC4tI6AZBtMqopEoojGhX6wt1Dpr++MkmNiHLZ/SXXnZrFTFmpVUbjr81N18BnroGdSDjP
	Xo/YE9kzbPj8UTvQmgOCHOXfJ3kDZBhaD59mkoyG+V3O6WZDDJiDu5YXd/YrFOtI7OT6r0xYkHe
	qtikeFak93+ijEBnINTEzvrRnELZOZWqIaVDwODqaIhzPoMtS2Q+WxpZfaVHRqCo0+FsjHI=
X-Received: by 2002:a05:6214:4497:b0:917:edd4:d1d5 with SMTP id 6a1803df08f44-91b557bd604mr849466d6.42.1791496223764;
        Thu, 08 Oct 2026 14:50:23 -0700 (PDT)
X-Received: by 2002:a05:6214:4497:b0:917:edd4:d1d5 with SMTP id 6a1803df08f44-91b557bd604mr849236d6.42.1791496223367;
        Thu, 08 Oct 2026 14:50:23 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b55120027sm1006706d6.49.2026.10.08.14.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:50:22 -0700 (PDT)
Message-ID: <728a8ff2bea09d6e35446bb13ac663f2c3a63ea8.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Skip the Turing CE workaround object for
 non-GR channels
From: lyude@redhat.com
To: Mary Guillemard <mary@mary.zone>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 08 Oct 2026 17:50:22 -0400
In-Reply-To: <20261007-turing-async-ce-fix-v1-1-12ee6ccd1a3c@mary.zone>
References: <20261007-turing-async-ce-fix-v1-1-12ee6ccd1a3c@mary.zone>
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

Will push to drm-misc-fixes in just a moment

On Wed, 2026-10-07 at 16:30 +0200, Mary Guillemard wrote:
> This workaround is here for the old Gallium driver and predate async
> CE
> and NVDEC.=C2=A0 Instead of only skipping it for NVDEC, let's only apply
> it
> in case of GR channels.
>=20
> This should make async CE work properly on Turing by stopping the
> assign
> of a GRCE. (here CE0)
>=20
> Signed-off-by: Mary Guillemard <mary@mary.zone>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_abi16.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> index e907c1d07887..e876f154963d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -488,7 +488,7 @@
> nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
> =C2=A0			goto done;
> =C2=A0		break;
> =C2=A0	case NV_DEVICE_INFO_V0_TURING:
> -		if (engine !=3D NV_DEVICE_HOST_RUNLIST_ENGINES_NVDEC)
> {
> +		if (engine =3D=3D NV_DEVICE_HOST_RUNLIST_ENGINES_GR) {
> =C2=A0			ret =3D nvif_object_ctor(&chan->chan->user,
> "abi16CeWar",
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, TURING_DMA_COPY_A,
> NULL, 0,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &chan->ce);
>=20
> ---
> base-commit: 70456f05d4b6396b22048c4b8cd3cb98ecf9f9e3
> change-id: 20261007-turing-async-ce-fix-42e179e27d4a
>=20
> Best regards,

