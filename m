Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC68370AE7
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 21:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791495951; cv=none; b=RZsQkV1iQJwZJLiVsrmSOcqvKBFSmcElBse8J4E+ilJei/v+YZy+Zo2XndNbSf+RrvxuDR3b85pAVWP77jfad3wflNW8oU57ZcQ89qXH/UeiOm8L8uZHIJll0dqmvtOIeVuJVbR9Ug5pzqbQTAPLiGrxh00vvi6Kx+jaIv1gDUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791495951; c=relaxed/simple;
	bh=4C6+wulytzT9gybkb7TNEm83oK7id/pFcB3QGIg+MP4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vGdAOoaZSI68ZWuUbomNP6HpareKpt+JY+vsO0hV68zrDtrDvds7KwRo+wZL87pZJeohy7vsW0H/IYMgA+Tdzm9kGMfEna3qPCGQ7UTlA7xihPFFjh+RmrxwI7pciB6W3rbX1F9V/y3xU/S/PieOy98mdFSe9G16EBcRLItcWqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OO/3kMEJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jg+PbUmV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OO/3kMEJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jg+PbUmV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791495949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JS+En9JyGsTr3AjbcaJ6blNY5U2s+JVwhjESLMBOqZQ=;
	b=OO/3kMEJ8UPQuvNj9ILLuzyIZqM4tp5YKzLMZvn1qcHmhVXiobqB/gT0Dru1K5yNQ1PTfw
	cX6ZVKDwXYxyL2jgh4mRi/8EJZsGC61l3+yIvK2uMPSjv7ymp8vNlLONkJ/iApVcA5Obpr
	93tM4lPMK1RjKf/z0/zdbUpi6MAnJtA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-uAyNC55yMoazjCyyn-d9sQ-1; Thu, 8 Oct 2026 21:45:47 +0000
X-MC-Unique: uAyNC55yMoazjCyyn-d9sQ-1
X-Mimecast-MFC-AGG-ID: uAyNC55yMoazjCyyn-d9sQ_1791495947
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917a2de2cc1so81161676d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 14:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791495947; x=1792100747; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JS+En9JyGsTr3AjbcaJ6blNY5U2s+JVwhjESLMBOqZQ=;
        b=Jg+PbUmVxGEPW12WSgdrol233EAnpTgp8bTYXM639aGVSTGGK9TRLDZbJ9SiykevjX
         xrexWJIV3pC3WNPOXaj3u06u9weQrrzys/NpTfmen6xOoIlwplOiacin1Jp9ZrMAkBTZ
         pEaRLeTLYQ9T0MhPu9XyVfhUM/17VOMt5IqqJm61OApLlqTWZgzIKkNlfFWoAE/F05k2
         t2cU3/cYLOMQVo8ZQFm6cfWT+UHvt/AQLaxQMe+Nbm+aoD+0+I2P76aolhl7Uipwz6Hv
         FA7yUu6/eF5nEedScarIWiFU/jeYelDoYiKsow4qm4wkj09VqanwoZfuNdsQcfknz4gR
         rbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791495947; x=1792100747;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JS+En9JyGsTr3AjbcaJ6blNY5U2s+JVwhjESLMBOqZQ=;
        b=VaHHyMKqPQJkv6y1zjLUMAnl8TE3M1ALJX9GOdoF4BjgS+03m+J8Xw3ykdXnjUNpqs
         mZciFzeGcjxoqkeiZ753IJzMxSwbZ2SJiNoSzcjYUfLz2E9Cr4eyK1JRkGGPlSRLF/eR
         MtMEV5u0St5nZkidsLSUJN5NXM8LWbkdcpnNjVT8CtKHEC4LZPr8dgonvYCLZLd6VCvT
         R7GP/1eJLcB9cUQqLxyi/QBDAn1gUk8tn5O67DQN1Gw2L1fXVIdaIzZ0jbqXDrX+XKC3
         vKjV3318NB+tXWcgGg1jF4y9Ca0cfxP9OQQybi6psm6hDhrg1Ez2dFhy8inyFmbKFFWC
         avYA==
X-Forwarded-Encrypted: i=1; AKwUvBwBguZExEOxCH4icKzmRECxwNnnj2omlJUVK0CdIkOek8Ke6vk8OcLWDz7QQ+5x0KKn4yFzoDP6kF/C1rs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5QRt4U/u4eSj73TUpqGtcLsLb24l0n5YJurFa6PC3boPLfjz6
	kNVAixGnZ9V39HZ2aUW4aJ7zyMo9zksP/PMPyxxG7MudMHG6J9+7tttwH4deRu5K/ef8cHCZdUw
	FsKvpaAO3Ad5Bi2o+JRyBisfSfzjQt8sAuilPvlXcIYSs00ZURnn10+6GzKCSCofkHrxDvM/k2w
	==
X-Gm-Gg: AYBFou2tnP3kpDsvuD2d4lneh9eLUDnUCNDgtmFecmWw6xH9yAWkMR7aHsgJoHpYDQg
	T/c0BedNgtqTQQwxYP3dmE+L07ZLvHQ5zDQz0h51YIT8rdWnOI6CX8GcSZ88tuHGh/FvRg1TfTS
	BM4LK0xzAlmr9goEJOuFqPURsQx5cuP8XFJFNBOnEYO8+gXzw5DFRWm8wE0JUgwHjStTntIyd0m
	+3a8RpX5bOx8dw5OIlh6VS4989bPvQMQd6RFESY6FNnblUZLytNCevu9P5wRhHrC48m8pCbJnCO
	wPMjLAsUNxOeWYHcktMBWRieb5FccDH7LmacA4Lvs/KUHo+Mp+Dm1pEJljnRETnau9Cp9gw=
X-Received: by 2002:a05:6214:1d0d:b0:918:d743:fd92 with SMTP id 6a1803df08f44-91b555354f7mr894756d6.24.1791495947235;
        Thu, 08 Oct 2026 14:45:47 -0700 (PDT)
X-Received: by 2002:a05:6214:1d0d:b0:918:d743:fd92 with SMTP id 6a1803df08f44-91b555354f7mr893776d6.24.1791495945817;
        Thu, 08 Oct 2026 14:45:45 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550ca9a7sm949466d6.38.2026.10.08.14.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:45:45 -0700 (PDT)
Message-ID: <ea9a1d374cf3127e5047bc73807ce821022e026e.camel@redhat.com>
Subject: Re: [PATCH v2] drm/nouveau: Fix memory leaks in debugfs and hwmon
 init error paths
From: lyude@redhat.com
To: liupeng <liupeng01@kylinos.cn>, dakr@kernel.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, 	airlied@gmail.com, simona@ffwll.ch,
 linux@roeck-us.net, nouveau@karolherbst.de, 	bskeggs@redhat.com,
 dri-devel@lists.freedesktop.org, 	nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 	linux-hwmon@vger.kernel.org,
 stable@vger.kernel.org
Date: Thu, 08 Oct 2026 17:45:44 -0400
In-Reply-To: <20260922044044.21442-1-liupeng01@kylinos.cn>
References: <ff3015a1c4b08088b0638b00670e86d612a27978.camel@redhat.com>
	 <20260922044044.21442-1-liupeng01@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

One nit-pick below:

On Tue, 2026-09-22 at 12:40 +0800, liupeng wrote:
> In nouveau_debugfs_init(), if nvif_object_ctor() fails, the
> previously
> allocated drm->debugfs is leaked because the function returns the
> error code directly.
>=20
> In nouveau_hwmon_init(), if hwmon_device_register_with_info() fails,
> the allocated hwmon structure is leaked because the function returns
> the error code directly.
>=20
> Fix both by freeing the allocated memory and clearing the pointer on
> the error paths.
>=20
> Fixes: b126a200e9db ("drm/nouveau/debugfs: we need a ctrl object for
> debugfs")
> Fixes: b9ed919f1c8f ("drm/nouveau/drm/pm: remove everything except
> the hwmon interfaces to THERM")
> Cc: stable@vger.kernel.org
> Signed-off-by: liupeng <liupeng01@kylinos.cn>
> ---
> Changes in v2:
> - Add Fixes: tags for the commits that introduced the leaks
> - Add Cc: stable@vger.kernel.org=C2=A0for stable backporting
>=20
> =C2=A0drivers/gpu/drm/nouveau/nouveau_debugfs.c | 15 ++++++++++++---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_hwmon.c=C2=A0=C2=A0 |=C2=A0 2 ++
> =C2=A02 files changed, 14 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> index 47d5579c568d..88223931f382 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> @@ -295,13 +295,22 @@ nouveau_drm_debugfs_init(struct drm_minor
> *minor)
> =C2=A0int
> =C2=A0nouveau_debugfs_init(struct nouveau_drm *drm)
> =C2=A0{
> +	int ret;
> +
> =C2=A0	drm->debugfs =3D kzalloc_obj(*drm->debugfs);
> =C2=A0	if (!drm->debugfs)
> =C2=A0		return -ENOMEM;
> =C2=A0
> -	return nvif_object_ctor(&drm->client.device.object,
> "debugfsCtrl", 0,
> -				NVIF_CLASS_CONTROL, NULL, 0,
> -				&drm->debugfs->ctrl);
> +	ret =3D nvif_object_ctor(&drm->client.device.object,
> "debugfsCtrl", 0,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NVIF_CLASS_CONTROL, NULL, 0,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &drm->debugfs->ctrl);
> +	if (ret) {
> +		kfree(drm->debugfs);
> +		drm->debugfs =3D NULL;
> +		return ret;

^ We could get rid of this extra return=E2=80=A6

> +	}
> +
> +	return 0;

=E2=80=A6and just return ret here

With that fixed:

Reviewed-by: Lyude Paul <lyude@redhat.com>
> =C2=A0}
> =C2=A0
> =C2=A0void
> diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> index 726397ab035d..ffbe7f542ab0 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> @@ -697,6 +697,8 @@ nouveau_hwmon_init(struct drm_device *dev)
> =C2=A0	if (IS_ERR(hwmon_dev)) {
> =C2=A0		ret =3D PTR_ERR(hwmon_dev);
> =C2=A0		NV_ERROR(drm, "Unable to register hwmon device:
> %d\n", ret);
> +		drm->hwmon =3D NULL;
> +		kfree(hwmon);
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0

