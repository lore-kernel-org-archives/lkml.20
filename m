Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D55411A1C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789421493; cv=none; b=t0WNAKHCRB77g04M5Y25Bu1kjVqOgTT45WD084LlPzfc7iChAwEPUVOwUtgM1ijd/UZ2R+CcnVwjxf/qNroJmn7riIKdYUagGiazxeOI80rGekoi29BAruvE20eh5Y8g5ia5f0OllUrwkPVH87nEiuGvwxsosj2Meor2beIW1RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789421493; c=relaxed/simple;
	bh=Sq6RjGt9XF24VqoJ2n9dbmLSjmEh8LmsjOMgokPH1aQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g9PsLBpn8hgMD+HHe/mJWxAcRkffTXsZwN/f0mBfhZbeUVhyF42TY3DkLtnll+RYmDeMqOaEDl/efqfR+1mhu8Ji61ekuSc5v/l2qNTysY31L5oy7hI/E+OKAzWejrt7lNVbxgvsDKB3e2a2sxpJ2f1SeNxJb9dyMHsM+Oz/d90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SAGWfL1i; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vevak2U9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SAGWfL1i";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vevak2U9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789421486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mSH/LADfNS5wRI0PeO6aTM3mQmTKjHC2Ckp9c3le0T0=;
	b=SAGWfL1i65kPfX1ZHfwXsN7cAKXXA9eOhsaF/VaL0Wb7/cFLvQ44uTVHNYXlTdZVgN4vT3
	r7bZHeP79Ku3PXI2nLR51GS3BaHgLJAUy1NBIgtIz0/9JEBRRKuCtG5W202B7MzZ9EbZ9K
	IEm397ystTV05gaxRMgPw6Ywokwv2yU=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-6ON-C6Z5MgWM-lJG8D0zsw-1; Mon, 14 Sep 2026 17:31:25 -0400
X-MC-Unique: 6ON-C6Z5MgWM-lJG8D0zsw-1
X-Mimecast-MFC-AGG-ID: 6ON-C6Z5MgWM-lJG8D0zsw_1789421484
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c851df59edso1470471e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789421484; x=1790026284; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mSH/LADfNS5wRI0PeO6aTM3mQmTKjHC2Ckp9c3le0T0=;
        b=Vevak2U9OzM19aHCF1JisFFtjSHOI/UoD5XcOth4TjshJBGNNcZuME16M2Y9ugRLn1
         nBPsnEPa2aV908+F6UWNbEDehnnfUwdbA9NJTO22E88zY+9g7yiet2g68gDEILZLj/ct
         lyeU3rdgoG30RteJ2+zIxmSB1VzUbbejOiPJgBlzmRUEe77iWsmbEv1w5PrnJSmFYbRz
         fYbUpRR/is2e5TgOsgEs1X1QEiWkmSDRXl4kNbStxbTgUb0VE6lBZ2DgwZObqOora8/9
         D3ADFIgrc7ngma3c2OLTNwjXWdNxa8B9Hv8zNZRMya3tHVgk2NT/g/rI5B2JJmqINaei
         VwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789421484; x=1790026284;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSH/LADfNS5wRI0PeO6aTM3mQmTKjHC2Ckp9c3le0T0=;
        b=eczhzfRNByNds4K4d6YBH/pp9plvhojCu//w29k/og/C/N6Z4x2X9BpveFsqwAH6q/
         JrS+DAdwmXf+WLFUjI0gwk0c89NURhip3UUZi5N0RJg8v/qHsL1UFijdUAkGXEWCyXyk
         11A6R63wDhVqGeEk64MOluaAhMk+70kL+AcgceFJxuo1SuUz1T3oP3Vy8LDDjlD5j8f1
         kCnSqGf0gcj7ZKhLoyZjr1iRrLdBHeiPnHhnjkBAx3JkZtninJxn34R1Bjj2q7H36XAc
         /EkYLKJntMjFIu3/GshFVJngyZJHrs0nd4Zvz/9yXMKVwHT3ew6sAHd9rC5FK8x50y9o
         /7Og==
X-Forwarded-Encrypted: i=1; AKwUvBy6FcSOYY/V/zuW8fmhneV57KJvNNCljuFPY2AdZotOVWFPAoG7BGAukcfPZ6waXUP/VZoNXBOUEQb1f0A=@vger.kernel.org
X-Gm-Message-State: AFuF++nSGAx1/yXvSl5mLHhiR3nxRLyEWz9FkrYQZgMxkpxkUMphQk/4
	GSZTyDpqEay5fQZYSGysjxKrBlbLluSZ6qq96jpWG6ZL+FdhtKXnrOI+W+I4gJpyYGLhg4QBM/G
	FpH/BC7JQP6kSTkv+mrIwpwfUNwj5uNJSHXK1C9SF7eCcwpNNHWkOphGivDKXyTqtRg==
X-Gm-Gg: AYBFou2FbcU9Wqc1DDkAAlj1JCW5NRIkpiWyTxeiE8EoKfxIxW1KcMrUfdayYAyjbqO
	IckLACsAyvU2Xp5ep0WqvFs0lFfb1h92Zz6YGTiUFvWdHVXm3l/PqvceGmbU7hnCYHzDnJWl4u3
	eNV3nSoVHzIhtqsCmdDVzep/jCeAcgH4i3LdnMXHZQ8MupujiinQwagXG/4oMNmGF2fZ2brVmwE
	oqoq3fsOlDlIWTi5EiQAH9F6gcuDulTLCiky4caQrFA4WnTdffpzDRmrcdzJ4KlfVToG7CnFQPa
	K08vDDVvRuY1K5z6+8CG4E8omUS/bOlGsuJV1O/RwMs0TXeLS37ozkzQFiPQJMUOz1KgWlP7
X-Received: by 2002:a05:6102:54a9:b0:79a:7895:c36a with SMTP id ada2fe7eead31-79b5c700594mr4686133137.13.1789421479563;
        Mon, 14 Sep 2026 14:31:19 -0700 (PDT)
X-Received: by 2002:a05:6102:54a9:b0:79a:7895:c36a with SMTP id ada2fe7eead31-79b5c700594mr4686037137.13.1789421478991;
        Mon, 14 Sep 2026 14:31:18 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f2032d4sm104280926d6.5.2026.09.14.14.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:31:18 -0700 (PDT)
Message-ID: <3bc92cd6aa88e52c2645b00b97c9d75a112b5d16.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: validate required NET_img regions
From: lyude@redhat.com
To: Slavin Liu <bolin.liu@seu.edu.cn>, dakr@kernel.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 	airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 14 Sep 2026 17:31:17 -0400
In-Reply-To: <20260913125228.110071-1-bolin.liu@seu.edu.cn>
References: <20260913125228.110071-1-bolin.liu@seu.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi. What bug are you fixing here?

On Sun, 2026-09-13 at 20:52 +0800, Slavin Liu wrote:
> The NET_img parser can finish without all FECS and GPCCS regions.
> Reject missing required regions before computing their data
> addresses,
> and release the firmware on both validation and ACR loading failures.
>=20
> Detected by static analysis and reviewed with AI-assisted source
> auditing.
>=20
> Fixes: c4bdac754ca0 ("drm/nouveau/gr/ga102: initial support")
> Assisted-by: LLM
> Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c | 12 +++++++++---
> =C2=A01 file changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
> index 2b51f1d0c281..bfd1e00537b8 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
> @@ -317,6 +317,11 @@ ga102_gr_load(struct gf100_gr *gr, int ver,
> const struct gf100_gr_fwif *fwif)
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> +	if (!fecs_inst || !fecs_data || !gpccs_inst || !gpccs_data)
> {
> +		ret =3D -EINVAL;
> +		goto out_firmware;
> +	}
> +
> =C2=A0	ret =3D nvkm_acr_lsfw_load_bl_sig_net(subdev, &gr-
> >fecs.falcon, NVKM_ACR_LSF_FECS,
> =C2=A0					=C2=A0=C2=A0=C2=A0 "gr/fecs_", ver, fwif-
> >fecs,
> =C2=A0					=C2=A0=C2=A0=C2=A0 fw->data + fecs_inst-
> >data_offset,
> @@ -324,7 +329,7 @@ ga102_gr_load(struct gf100_gr *gr, int ver, const
> struct gf100_gr_fwif *fwif)
> =C2=A0					=C2=A0=C2=A0=C2=A0 fw->data + fecs_data-
> >data_offset,
> =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fecs_data-
> >data_size);
> =C2=A0	if (ret)
> -		return ret;
> +		goto out_firmware;
> =C2=A0
> =C2=A0	ret =3D nvkm_acr_lsfw_load_bl_sig_net(subdev, &gr-
> >gpccs.falcon, NVKM_ACR_LSF_GPCCS,
> =C2=A0					=C2=A0=C2=A0=C2=A0 "gr/gpccs_", ver, fwif-
> >gpccs,
> @@ -333,12 +338,13 @@ ga102_gr_load(struct gf100_gr *gr, int ver,
> const struct gf100_gr_fwif *fwif)
> =C2=A0					=C2=A0=C2=A0=C2=A0 fw->data + gpccs_data-
> >data_offset,
> =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpccs_data-
> >data_size);
> =C2=A0	if (ret)
> -		return ret;
> +		goto out_firmware;
> =C2=A0
> =C2=A0	gr->firmware =3D true;
> =C2=A0
> + out_firmware:
> =C2=A0	nvkm_firmware_put(fw);
> -	return 0;
> +	return ret;
> =C2=A0}
> =C2=A0
> =C2=A0static const struct gf100_gr_fwif

