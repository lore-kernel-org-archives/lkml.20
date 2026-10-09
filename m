Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEECB3D1A98
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791581100; cv=none; b=sGCtsmAoeMOBCym3WsLz79s/JuNYBdXIiX9n6863xz+E2kEI/0lih7gHfg3DpZw3It1RHLl7BXZu2npOz83XYbrZgJSa9/S09pgzGZQgrgRXR3C1tX5N2zE5WChlPWiAuoif7MTHMIonJyeQ/WtxbTwUiH8RH+rwHJXMoUJDtac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791581100; c=relaxed/simple;
	bh=VH7Q4BHSwOV8LwHll8ho9fCXv9kewEHEKQEkXb4WE2o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SDpTnbqN73nObn/t/3dRZjUBr2sTb8bgtMIZ6IlOtlIOMCGoMeX3FfudTR7ttU/qtNdlYQAERI9Cf4QpSYR+IjurgEOZvtK48G/ksIkgE6YzpqBMYsv9cqpGmebjbs8LqJ8O/Xw3Ytm+5uizQv45bNZ9fjTYB8O8u16l/CD0FKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WBb/B/ud; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zf8xhz94; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WBb/B/ud";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zf8xhz94"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791581097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z1Eu7EYQ+rpvHDotJhitil0lY6JFZjt2dgRaITNxGdo=;
	b=WBb/B/udfLRQfVPBiw0EE2f5yw11JCpRUaFCZNtDNbDAmKrGEVRytWlTgOAP+NkkK54xcV
	+vkVRYiNZWNfyeQMDmHv12Fs/kx6fN1gKwXNfnaT0HPEhC7iOpYEDlDbDc5LS/LuwzfOBU
	hZm/m5+YsOtXS1z2nueGS+AQt0VtDjg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-DrTWL5FOOIefO6pDUQAqpw-1; Fri, 9 Oct 2026 21:24:50 +0000
X-MC-Unique: DrTWL5FOOIefO6pDUQAqpw-1
X-Mimecast-MFC-AGG-ID: DrTWL5FOOIefO6pDUQAqpw_1791581090
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-535066512b0so3746421cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791581090; x=1792185890; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=z1Eu7EYQ+rpvHDotJhitil0lY6JFZjt2dgRaITNxGdo=;
        b=Zf8xhz94pB42+G7QoyszI2A2TrBKRWbyN5sh7unvlrXJIXk2eQ+QPO1JZrP5J5g1Vh
         91No9Wwp4HP3Q1bmONBY9gh/y8L8pJKkC52AkzW58ifErm/TBi+jP7wX7Hur4lygEDSa
         CgpCA5DVER8j4tKElqMsUPPZMUceK+cuoXLRbJgV/6ebtggFdq7VH8ujJCCIdQvSXCM+
         NET1hsK/SB83OayzkPwCEhXf7NTtuUOtOoXxVfGyBzKrWPyGUm5cPxvsUC60qP3w+GND
         HhH/u5VZqjpiQ1hkY/9S4jbebSsda4m4TrO3dvnACTbsz5YH84YEOYlzxUWvZ7vDhumI
         cL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791581090; x=1792185890;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z1Eu7EYQ+rpvHDotJhitil0lY6JFZjt2dgRaITNxGdo=;
        b=NIS0n7pmvYRgGii4hci+4CgyKTpUaD7dqYXVq750F+1MQTXHuKyQWi3XUX/kbTb/id
         W9zKR05vzXRmEKX7JLnwsIOQlfIQyTL0AioWEeaq8zKoewi48BygKr1GTzBGk8MWzIGF
         yGjukyU+RC4Lj+ChN10Do5PVhYexk9KWpp+LWlTxRSWeFSh+ZRLrMWfVl6kjmfdc52Qe
         CtLyd7O07NdlMVwNqBMnCvZquVC7tvy2iGl0/NqOxV2nUSL6LuWtlAoVxB1B6RG7/SsF
         g9MA/hLtU4/k9XZchykK0oJG0mMschyrK2crHR3ymowwNK8Mgl/fPAyVYtrdI1UmoFfZ
         vICw==
X-Forwarded-Encrypted: i=1; AKwUvByu77tNFd/ZOLGDKCCSxiYfzxCjR4eKIQ54a0S1lYJf15krLKfmHGCwyxpAgM3NtP8RCDoFWNKRhQuAGpc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8H6f5CFtTPm9IIw7WA6GaS6v1NOlCxpAM1O5mH78XGZGLLI1+
	Jj5pOEGajbCQS+cB421Uf6Z/0WiaMVKfw2vPxvLIKMD/rxpnWVOFgDNgajCcbJU+Gpui48tk1S5
	WXPN01d8KETCF2Rs40MI78TBgWRhM3cmRVdQc/hCVWwN6e+WZAoWpPcx/+lml7UC1kQ==
X-Gm-Gg: AYBFou2By+1u4JafXcjeCqPnv1JwifZCxX+Ql0Yoj+w2ByE3EEQ0Zq3m4tLaPoDt5hf
	dLA1iFN0cfDv6SLFT0oS6oTfJ2evcmzHIus4v5sET3QKdukMwkSsZ2HTlzeaAiyFd/gabKPpz1h
	87v7gIXOsQy18NDcvwhdXUCkXgPQOD/qw0R/ts+CCGV9LNMk1A/QeVXIqn01h39BLzB7W35HlI3
	0iO73MLrBPdvaO3E1uhpF/QJ0KE7M+K33dWiv+oVT80dZt7V3HTcMpU1j/OcCPDfVgCdYCgvIQ4
	mS+FWdzEKKivro7kF9SQhzjOb2EB5Uni4TMFTzpDIE+YZX/FlNAQzrLLlTvQ2/lq5FrlPn0=
X-Received: by 2002:a05:622b:97:20b0:535:a5f8:a5c9 with SMTP id d75a77b69052e-535a5f8b5bemr28651031cf.73.1791581089907;
        Fri, 09 Oct 2026 14:24:49 -0700 (PDT)
X-Received: by 2002:a05:622b:97:20b0:535:a5f8:a5c9 with SMTP id d75a77b69052e-535a5f8b5bemr28650791cf.73.1791581089326;
        Fri, 09 Oct 2026 14:24:49 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7324c9sm27569011cf.12.2026.10.09.14.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:24:48 -0700 (PDT)
Message-ID: <7b1398c5deadc0225332b6259a278d4436973d8f.camel@redhat.com>
Subject: Re: [PATCH v2 1/3] nouveau: Fix NULL pointer dereferences in
 GETPARAM ioctl
From: lyude@redhat.com
To: jim.cromie@gmail.com, Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dave Airlie	
 <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Daniel Campos Ramos <Capitain_Jack@yahoo.com>
Date: Fri, 09 Oct 2026 17:24:47 -0400
In-Reply-To: <20261009-my-fixups-v2-1-839e2bbe514d@gmail.com>
References: <20261009-my-fixups-v2-0-839e2bbe514d@gmail.com>
	 <20261009-my-fixups-v2-1-839e2bbe514d@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-10-09 at 11:44 -0600, Jim Cromie via B4 Relay wrote:
> From: Jim Cromie <jim.cromie@gmail.com>
>=20
> When hardware or firmware initialization fails, the graphics engine
> (gr) or device functions may remain NULL. Attempting to access these
> during the GETPARAM ioctl (e.g., NOUVEAU_GETPARAM_GRAPH_UNITS)
> results
> in a kernel NULL pointer dereference, causing a crash when userspace
> (GNOME/Mesa) attempts to probe the device.
>=20
> Add safety checks for 'gr', 'gr->func', and 'nvkm_device->func' in
> the
> ioctl handler. Return -ENODEV to signal the missing hardware state to
> userspace, and use NV_ERROR_ONCE to provide diagnostic proof in the
> kernel log without risking a console flood.
>=20
> NOTE:
>=20
> I encountered these crashes while booting unrelated code (in
> dynamic-debug) on real HW.=C2=A0 There was also some fwupd updates around
> this time, so it could all be transient/unreproducible.=C2=A0 But it did
> happen, and could happen again in unforseen circumstances.
>=20
> @Capitain_Jack tested the error path in v1 by deleting the FW

I can just fix this up before pushing but JFYI - if you put comments
below the --- that's down below, they will show up in the email but not
the commit message.

Either way -

Reviewed-by: Lyude Paul <lyude@redhat.com>

>=20
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> Tested-by: Daniel Campos Ramos <Capitain_Jack@yahoo.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_abi16.c | 22 ++++++++++++++++++++--
> =C2=A01 file changed, 20 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> index 4542d5f4ded8..3f130cd4fbcd 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -306,6 +306,11 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
> =C2=A0		getparam->value =3D 1;
> =C2=A0		break;
> =C2=A0	case NOUVEAU_GETPARAM_GRAPH_UNITS:
> +		if (!gr || !gr->func) {
> +			NV_ERROR_ONCE(drm, "GETPARAM_GRAPH_UNITS: no
> gr engine or func\n");
> +			return -ENODEV;
> +		}
> +
> =C2=A0		getparam->value =3D nvkm_gr_units(gr);
> =C2=A0		break;
> =C2=A0	case NOUVEAU_GETPARAM_EXEC_PUSH_MAX: {
> @@ -315,10 +320,23 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
> =C2=A0		break;
> =C2=A0	}
> =C2=A0	case NOUVEAU_GETPARAM_VRAM_BAR_SIZE:
> -		getparam->value =3D nvkm_device->func-
> >resource_size(nvkm_device, NVKM_BAR1_FB);
> +		if (!nvkm_device || !nvkm_device->func ||
> !nvkm_device->func->resource_size) {
> +			NV_ERROR_ONCE(drm, "GETPARAM_VRAM_BAR_SIZE:
> no device func\n");
> +			return -ENODEV;
> +		}
> +
> +		getparam->value =3D
> +			nvkm_device->func-
> >resource_size(nvkm_device, NVKM_BAR1_FB);
> =C2=A0		break;
> =C2=A0	case NOUVEAU_GETPARAM_VRAM_USED: {
> -		struct ttm_resource_manager *vram_mgr =3D
> ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
> +		struct ttm_resource_manager *vram_mgr =3D
> +			ttm_manager_type(&drm->ttm.bdev,
> TTM_PL_VRAM);
> +
> +		if (!vram_mgr) {
> +			NV_ERROR_ONCE(drm, "GETPARAM_VRAM_USED: no
> vram mgr\n");
> +			return -ENODEV;
> +		}
> +
> =C2=A0		getparam->value =3D
> (u64)ttm_resource_manager_usage(vram_mgr);
> =C2=A0		break;
> =C2=A0	}

