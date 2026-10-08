Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9B73B582F
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791497925; cv=none; b=UVAVyf1MGmcXTDVH4WS91dpO7I6UsxgQEtFrKcsdNapnuHMyB3wybLWH6A4QcjvFi40T1XBh1VX1fOX/teM1/ONr2HlUrfy3axLxjh7XsvA6vi56sLYVAh8zG08xHtn9ejIflVqtK1fm3WXJH5r0A4fMxyr3LhSLVa++Gco+vio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791497925; c=relaxed/simple;
	bh=oeWvl2pvztXA9+HWvf7fkw0mJHJk+tOmFf7JnhNxcwY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=og6ofa8GKSbVhe+jYxLWd14GFpSjioKoGxCNw4uQofYOgrx8a5kt4RDzt2xMqE2RPTA10beTaJxSz13qScWIqyORd27ADWi8o6pg9PzfRKMkg5sfkFTLucZ7VURUD7MlX7neMj6bFLz4gzoJJNPvmqMLqWr2yFxla+TW8XcZ3G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YeuvFg9G; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cGUExsg7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YeuvFg9G";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cGUExsg7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791497922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S516mKsihJvGMAbQN1NJPExU5zniQAE3QbqOLbNkeRI=;
	b=YeuvFg9GrYpkyMsZjVUs2deEUriaTmTFsvt0l7xqN5AW4ZBBZXcm22h8vRQ8juepak6+D2
	pee6WGkQR0AXUjjwNMf3Q9udQzsTFuug35WQNSOmfPvTy3ayKEKtdf6IJpLhvkb9U+kmbh
	9AVtfpHEt1bWd2s1JVa5GaNdND/yfw8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-g-wZ2DixOVehoSeK2EC8FQ-1; Thu, 08 Oct 2026 18:18:39 -0400
X-MC-Unique: g-wZ2DixOVehoSeK2EC8FQ-1
X-Mimecast-MFC-AGG-ID: g-wZ2DixOVehoSeK2EC8FQ_1791497919
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91789a9107fso133782306d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 15:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791497919; x=1792102719; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=S516mKsihJvGMAbQN1NJPExU5zniQAE3QbqOLbNkeRI=;
        b=cGUExsg7kMNgnL773MayXbtxLCPkNi3NTHJ2JzwC7/wzLk1Mq+602JMy6qvIaC4By1
         Z/IZYFD09UtdSNWY11fUlsPCzQAdw7rjZ/8dhPocHu67v/e//FmyWfjmNefPqiMTpJM5
         139W0vaDk+oIYxswsN/HBmMD1/1FozgNxwABQoOU9xHgCmiqudXLaW8+hfgBa8Zz3wV+
         S4U0uyOioWmhRcwoyF3DYkADo2abVnLkU8jSjrQqE03dTiS5BNmceSsSJpVRd0fa0lhO
         W1CM4+vD9scKTpbLPx6icj4CCBUA16m/rxoEpHzHkJ1XPgZcoGBc5D2Cls1nO2ara2pH
         nDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791497919; x=1792102719;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S516mKsihJvGMAbQN1NJPExU5zniQAE3QbqOLbNkeRI=;
        b=oO2ceIpx7F7GU02/DS+dWY17IONJW9/wHwUv2OuK8tY1pElK0A+UjVCmbIoRcZLkcj
         Rk/BQaMTIu5fNy1UQ2ZDqNDPANYI3CCM63GwQqjyLbGflpfzhFuuXM/Yjc8ajRqvA6Xf
         sQAZe+oLyBA0Gltj9DECJo/dJNGmAI5kWlVQ4AFPXjRERlH92d7k2usFr5suraArGkBq
         3W+1q2KXDLcPwkqZXnasi5EVL3bsY7p/Y7Ji/ubha0j/UaBD3yU1RKOJKeW/if+an8mY
         Uf0iKqNlIYgiiuOVmKNI1SNBIyQEs5FF7diRK1QleS2vWst89NnH5mkuFDUlr6Wt33S9
         KkiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwocceupyjcJCC2Q4WA3VIJp8ay2tPXWCIUqUN6VD2xRFCYDhMagNtBzZpCr5PBsKIRnvAqeamWuzP8JhM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2j4fgDtm5RKsZ71RvJt1Q4lNQLiBRXClujzYDrG0/H31j8Bte
	2atb27NPoPRDP7IG/Gx6aPD7PDN17HHsf4NXgjQeshTFfxTnO058vChJ2r+zrHhtDQnFYnNIQbN
	amV6Mt0DjDHQWXEGr9QGaUdnyG7JgDDXY/rOSfSYJ51w4xkXPh4EwQ9s/JuYml5N00g==
X-Gm-Gg: AYBFou18zAfXBJxtuiDpDsYU5NMjc8eghIBvg3+JYDGAAXqfna57ZpdDqpCpt/nxZPS
	w+gqysw/LTkK61Dt5hu/3TQSBk5SqFpNam7NVWZbAFNrP+t5ncDJbTAqZwKG7EBEHzBG/9J1ntw
	7xm75hHeIaA54zxbOtu1msPnbJVFp/WW+e5c6qE9nyqVPzvIbhzvAULs5xKLLyJyACneZZQEjwc
	44nLPgDqjsiF3te3rq3y5Xa07ZZ3Jkgyw3ct4LEd6osQw6QIoPSIVbQWqcQShOPd8Sd6/Yg4dJM
	SwTKYg+9rbVDt/uownKgpvq6mLpUILmT/UbLNofXhMGdH7+nDyYISPZaRMSXFCkWtlZ5IG8=
X-Received: by 2002:a05:6214:451f:b0:919:952d:3b86 with SMTP id 6a1803df08f44-91b557e0914mr2148826d6.49.1791497919113;
        Thu, 08 Oct 2026 15:18:39 -0700 (PDT)
X-Received: by 2002:a05:6214:451f:b0:919:952d:3b86 with SMTP id 6a1803df08f44-91b557e0914mr2148316d6.49.1791497918471;
        Thu, 08 Oct 2026 15:18:38 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b5501757bsm1712146d6.13.2026.10.08.15.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 15:18:37 -0700 (PDT)
Message-ID: <d601d2ee6e47fe1b624697cf5b0f4129c97b62d2.camel@redhat.com>
Subject: Re: [PATCH 1/3] drm/nouveau: Fix NULL pointer dereferences in
 GETPARAM ioctl
From: lyude@redhat.com
To: jim.cromie@gmail.com, Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dave Airlie	
 <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 08 Oct 2026 18:18:37 -0400
In-Reply-To: <20261002-my-fixups-v1-1-a83d20f9d3fe@gmail.com>
References: <20261002-my-fixups-v1-0-a83d20f9d3fe@gmail.com>
	 <20261002-my-fixups-v1-1-a83d20f9d3fe@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-10-02 at 12:09 -0600, Jim Cromie via B4 Relay wrote:
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
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_abi16.c | 25 +++++++++++++++++++++-=
-
> --
> =C2=A01 file changed, 21 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> index 4542d5f4ded8..cb1810dee8e5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -306,7 +306,12 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
> =C2=A0		getparam->value =3D 1;
> =C2=A0		break;
> =C2=A0	case NOUVEAU_GETPARAM_GRAPH_UNITS:
> -		getparam->value =3D nvkm_gr_units(gr);
> +		if (gr && gr->func) {
> +			getparam->value =3D nvkm_gr_units(gr);
> +		} else {
> +			NV_ERROR_ONCE(drm, "GETPARAM_GRAPH_UNITS: no
> gr engine or func\n");
> +			return -ENODEV;
> +		}
> =C2=A0		break;
> =C2=A0	case NOUVEAU_GETPARAM_EXEC_PUSH_MAX: {
> =C2=A0		int ib_max =3D getparam_dma_ib_max(device);
> @@ -315,11 +320,23 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
> =C2=A0		break;
> =C2=A0	}
> =C2=A0	case NOUVEAU_GETPARAM_VRAM_BAR_SIZE:
> -		getparam->value =3D nvkm_device->func-
> >resource_size(nvkm_device, NVKM_BAR1_FB);
> +		if (nvkm_device && nvkm_device->func && nvkm_device-
> >func->resource_size) {
> +			getparam->value =3D
> +				nvkm_device->func-
> >resource_size(nvkm_device, NVKM_BAR1_FB);
> +		} else {
> +			NV_ERROR_ONCE(drm, "GETPARAM_VRAM_BAR_SIZE:
> no device func\n");
> +			return -ENODEV;
> +		}

For both of these I would just invert the conditionals like this:

if (!nvkm_device ||
    !nvkm_device->func ||
    !nvkm_device->func->resource_size) {
	NV_ERROR_ONCE(drm, "blah blah");
	return -ENODEV;
}


> =C2=A0		break;
> =C2=A0	case NOUVEAU_GETPARAM_VRAM_USED: {
> -		struct ttm_resource_manager *vram_mgr =3D
> ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
> -		getparam->value =3D
> (u64)ttm_resource_manager_usage(vram_mgr);
> +		struct ttm_resource_manager *vram_mgr =3D
> +			ttm_manager_type(&drm->ttm.bdev,
> TTM_PL_VRAM);
> +		if (vram_mgr) {
> +			getparam->value =3D
> (u64)ttm_resource_manager_usage(vram_mgr);
> +		} else {
> +			NV_ERROR_ONCE(drm, "GETPARAM_VRAM_USED: no
> vram mgr\n");
> +			return -ENODEV;
> +		}
> =C2=A0		break;
> =C2=A0	}
> =C2=A0	case NOUVEAU_GETPARAM_HAS_VMA_TILEMODE:

