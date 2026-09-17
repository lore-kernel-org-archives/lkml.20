Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE163ED13B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789683105; cv=none; b=MLU2G40Q/hj8rLKHMcgE9B7MehJb1ByCfT8KMpI4ImaqmUHNlh7Ji00/ij5zzzitVXobK9eFEYctXpyGQCkbUQMoxk80txfiujN9XTxYsyoqLK/M0Mdq8fzPttVMOKV4fa9PHDQHWbUYMg5SXkmVMINMGtQ1/L2b7d5I+bA8KrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789683105; c=relaxed/simple;
	bh=RFFY9k7Gm1W4Nre5AsaOcL68AdxzG+ESLVmFUUBmgLg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m1r5xzpXu6nf4d1Ekw2kKYiWor3OSKn0LFEleYy4nDq1Ed2keicn0u5fyyZPcZuWB5RvmIxVtRmL2FEixO7wAkVhmAbdZpsorrMTtbwZeXZ/6W784zIr7prM2hy3SxK9mi0KNBbYKrnXw4zZ7ys4jCQQwSZZBFeaq/hs1WxgA9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W2ZP/RLf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tqqxnmNl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W2ZP/RLf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tqqxnmNl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789683101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O71094SnvEzOsUSd9r3JWt4fCSADbtCWy3jIsFoSJ/s=;
	b=W2ZP/RLfE9JAWkExQbTXNWJKURWlogNyJzoDVNQYwoHEB60uQFrgFnLDRTIX+Bf5HPSi8o
	UXBj9fvZPdyRnc8E1iRZpqqEHtrqYZ/coD2YvTe58VovCWdqexCn0MUzWJn6ky06GQqERW
	e90AUJRm+olpFoCQkzT8E9qmWfEI76I=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-rLBQH_pLNA6bTOK7IjYKcg-1; Thu, 17 Sep 2026 18:11:40 -0400
X-MC-Unique: rLBQH_pLNA6bTOK7IjYKcg-1
X-Mimecast-MFC-AGG-ID: rLBQH_pLNA6bTOK7IjYKcg_1789683100
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90cdc69a7b5so3847726d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789683099; x=1790287899; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=O71094SnvEzOsUSd9r3JWt4fCSADbtCWy3jIsFoSJ/s=;
        b=tqqxnmNlBMSlizkQIfMCaOp82wk1YQ1qyP3daz6E03yJIRKq+LdGTjE64PpYV7+fK4
         kitvt8IhwAfvIutq2TlFpv8u/MXl3b85i5ANoFGiMRHJnHYNgzT6rw4Nvjty/USWm1kV
         yYDPlDsvLgEAjaOJPASeYoSXxwUrAGbszqBHB8QwyU0AmN5BlW2A8qYeUqk7LKpvvoS0
         TSQspeg3YezHpemAqUkn0OkBJmC5hL8dB4NjN71Oa40MgOzqNERJ07rvBJSTSYwS3y+Y
         S+mPNsKG+1iCK/TspCaeh7hCK2vWAMu0efJUlDvloJK+Gp1FMJ7iHiOc0qU2R1n5S1zg
         T9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789683099; x=1790287899;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O71094SnvEzOsUSd9r3JWt4fCSADbtCWy3jIsFoSJ/s=;
        b=RBhXA3Au4GvrHC/ajKLNZlRg8Ugi/95XokIXC3TIssbSTbuLyeNoVjg+eCaGK2IUt/
         S1Z9CoqgOzOqtO9xCBgIBWrNl6gvHJRmSYiiZcsqXPoS9GrdXqLq3Fsk5SdH5AwtpT2V
         glj9im1RzsX3hwJHDYeqK7sr1nJHy2rFYze7V4dnHNP1HPLb2wYIUvBw1qqp1YlmjkSr
         0TqQWQpqkMXhVQ3LJp22lVbELF0RibWe4hvBhiLouK2aPgD82UFVx0ZPbYFAv4WOKcqr
         WNbEWEAGV5sNAeiU5bg/EUgY3qdVvO6eFJ2rhUaPd0z/zqw9WNeK6sefW/j6hgbCVor2
         8ZOA==
X-Forwarded-Encrypted: i=1; AKwUvBwlWVxE3kBfNSGD6c6/jM5d3uNXO04xlI004yuPh00PB1OFfFQl9GU9us8S5nxQHrAYwkDarbPdxficC9U=@vger.kernel.org
X-Gm-Message-State: AFuF++kJWcn1QcsiRDs9cklsX2W4nJGEFK832nJJ99XLVqq+qON3sSpk
	xMQJeo/JsXJ6FL7fjhPq3j6AGPXqwbJg2yrq9FCpOHKyf1j9e5uvhgJ4IHE2Zvy9M1S7taWWXZa
	TftAh3VcGFQMyM7g37RsKm2AlvN7HaA+w/U1WoGwc26lPjrFr8FiNoLXNMsz1nWxJbw==
X-Gm-Gg: AYBFou1pRC9Oij+Ivp8TyvWsjoSscRkRTwagbep0UYcE/6r3YYo1OIywucavEG/ajsE
	d7SIFcWjudzJzGNQNC4noW6fWhazknjxGW8OtdWFYAQfsUtfXMfHNTFsDN8WKJ0i//FlG2KhlgK
	ugl2xO0CFYz1opYNZMZPgGFng4krgIXiUfo3WE65mrEIaOpCr2rd4Vz2fXbPygxJefuRme3oS2T
	YqB/i61zHmfkHNfr+SUTiJnm3+8FyNeIiJqVinXAsNVQib1AbE4xOEo6LgvLmEkyxJ3FJx68NQp
	FsNe1ZhN2n/Nxbj9DaI57EGwCig4v/deYljdArBAl1g+mryuyLGs/sVmRF/lSpF9pEAepqCP
X-Received: by 2002:a05:6214:6110:b0:912:517b:913 with SMTP id 6a1803df08f44-91254cd0952mr9604966d6.50.1789683099504;
        Thu, 17 Sep 2026 15:11:39 -0700 (PDT)
X-Received: by 2002:a05:6214:6110:b0:912:517b:913 with SMTP id 6a1803df08f44-91254cd0952mr9604356d6.50.1789683098863;
        Thu, 17 Sep 2026 15:11:38 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-912568b9646sm142846d6.31.2026.09.17.15.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:11:37 -0700 (PDT)
Message-ID: <8ae8462fb2f74d0ab1a1d6ac663fa3a90d57ff5d.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: fix autosuspend cleanup during teardown
From: lyude@redhat.com
To: Guangshuo Li <lgs201920130244@gmail.com>, Danilo Krummrich
 <dakr@kernel.org>,  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann	
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter	
 <simona@ffwll.ch>, Dave Airlie <airlied@redhat.com>, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Date: Thu, 17 Sep 2026 18:11:36 -0400
In-Reply-To: <20260808134137.2864847-1-lgs201920130244@gmail.com>
References: <20260808134137.2864847-1-lgs201920130244@gmail.com>
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

Will push to drm-misc-fixes in just a moment

On Sat, 2026-08-08 at 21:41 +0800, Guangshuo Li wrote:
> nouveau_drm_device_init() calls pm_runtime_use_autosuspend(), but
> nouveau_drm_device_fini() does not call the matching
> pm_runtime_dont_use_autosuspend().
>=20
> If the autosuspend delay is set to a negative value while autosuspend
> is enabled, the runtime PM core increments usage_count to prevent
> runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> during teardown, this reference is not dropped and usage_count
> remains
> unbalanced.
>=20
> The documentation for pm_runtime_use_autosuspend() also notes that it
> is important to undo it with pm_runtime_dont_use_autosuspend() at
> driver exit time, unless runtime PM was initially enabled with
> devm_pm_runtime_enable().
>=20
> Add the missing pm_runtime_dont_use_autosuspend() call to the common
> device teardown path.
>=20
> This issue was found by manual code inspection.
>=20
> Fixes: 5addcf0a5f0f ("nouveau: add runtime PM support (v0.9)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_drm.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index e16f59b00f6f..1579a4b0785e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -585,6 +585,7 @@ nouveau_drm_device_fini(struct nouveau_drm *drm)
> =C2=A0	if (nouveau_pmops_runtime()) {
> =C2=A0		pm_runtime_get_sync(dev->dev);
> =C2=A0		pm_runtime_forbid(dev->dev);
> +		pm_runtime_dont_use_autosuspend(dev->dev);
> =C2=A0	}
> =C2=A0
> =C2=A0	nouveau_led_fini(dev);

