Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792473037;
	b=mvcZKaAqfUvoGsO518X6UXM6C/aT0tIMm4clFoEwQiEYgXED0yWXNGqxgqGAog2tqMkg
	 YnCRaiZctTGWj1TrT6/Ql+e7YM7ewLnIOzMI3QYVfvA6G2WlTKmti4OBCADwESozJE8R/
	 ZmTi4vWkNvVDPc6dV8JxHnjwwsYRZGUnO1NrHdUKETI90ymnO16cCbrjGOOT+A/z5/++6
	 4EuiiQYmagOe3efMak7kn7VJ1Wb2OK8crz5icgff1xKIP0PC7JDwNid1E/GjXceS+MWBs
	 HFyMoWz0K9qdJhzQAeoiX2GK+prSXPNOk2859CKeqep4zZSemg9oSjNojYxvkmMB+WQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792473037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=GiXfA5+zF0NeMfbHqqL9rF1nabmZUfUnh+LSjoOt3J0=;
	b=b9ZWmkGDIqOmAOn9fotNnbU0npe6/Ht1iqRcdC59TPGPMnpTafn8ykH0bZD1e2L1O5n1
	 PqyTJIHru/NamxgDgXFaS9Nn0k5ta1MIPb6kAboEeqhf+tFE5IhtmtIY4gWl0Xegp4QNG
	 niNSudHNhx9Yn21cW/2LwLzy99L5GrgxIAbzs01Opkm9YTuzF4K1e0ZiwcR65sLLxopsx
	 e8LK3zz3rFHy+tPc+CankWth95fza/F7KzHH74qZ7MBhlrXuyWMI3J83LOCjFQEaM1p60
	 TB9pzNc7CQF5c6zuX8z7+rez3DSv3gT7n4lHVIEWFQmKL3anf9cbl8WyRiKRMQaEGWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="pytTP/4R";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62372606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62372606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pytTP/4R
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6fbf1ba31fbso1067377eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:10:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792473035; cv=none;
        d=google.com; s=arc-20260327;
        b=Jt23qrpT4FKw29uAuImG8jNFUCdlyTunIJv/QlIo8hCFWGIHqA1BoY4VusuhiJkR3Q
         Y8jBJs1Xc8OBjPz6MgemZBObHty+X2l68RBOadQp0abq2MSR/nuDZyDkP+gAbOOwePic
         MiEbsnQoCeAekt9eTOa2K8OTFbjaekUQCoDuZys83XvtjZfa0+8AOUbM+NjfEkIOVlHk
         Jh3KQGEOKhRsO2nccPy/XmTaqkMcpZ/PpvVhghzyVaLR3L31q3Vz26rmX5nRhZqpJsGE
         O/Dj8XnW0+DzLFSjp4Ue1OGOU8lbnUFVVgOGYsd45PnUuyFJzSRJPGhxyCnp9lQPeYYY
         7RCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GiXfA5+zF0NeMfbHqqL9rF1nabmZUfUnh+LSjoOt3J0=;
        fh=rlnJUtwDVonC68YlpddvMiNTQ/a5WbMKpmaRxn+ArN0=;
        b=rIEWlmHM3hKIEuT7PWpw4xQ7pIQCJUqVuVJ+Y89NLoT1l0GP9j6/OvSc1+E3zhg0p/
         GgCxVX5R3rJcRtOaZmX8wwZAkQ2EJCwQO+eybH9MGxaeTkfHPYZu0dbbdGANyM1b5orx
         /ZPj/86LNnTdJaoNZEnW3qLaqq8sQ/Zhiiqr/DteC4Ay6CuPcL8LjGvs/YlnD5qud8A0
         rWcrLP93ytdxU3G/OTpL8Z7/PjQpdDxjQdputYxQPbgHUdcWg4yGVOXohwq6waEO3UeD
         jBIeOaON8jnF+sjRHVXjzr51v/ulupNVp46m+E3/z+UpbFWvle72sAtXiA3E+N3AwE/u
         YtTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792473035; x=1793077835; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GiXfA5+zF0NeMfbHqqL9rF1nabmZUfUnh+LSjoOt3J0=;
        b=pytTP/4Rh7SmAx/CKFDNAi8LaobmCAXlvQL1JdlxPty6f5IIq6mLaH2U9NHXSSuR/k
         XZ7XI31FTMRByBHYvrvzc/N2otu3D0h/zXjh12m+X1V23txMyn8HFGJZufA9ZcdhHree
         drZxVdRKiRN/bgy63yEduyFvjGxPnve5PpT75i4gIBhScLOcMCqpAaWZ99y2QHCMZbCX
         UyLs1xXkt5A+c0ZkRE9DlWCn40Bm1+9kGOwLB2aKX09OLvREd7yl1qPGR7mria4d0xFN
         TDQsz/6dKY3rn826W1XpQ1QPoWPc2gANEaGtHx+rnGcP6Evdj116wiAzTrAknE53hk6P
         LAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792473035; x=1793077835;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GiXfA5+zF0NeMfbHqqL9rF1nabmZUfUnh+LSjoOt3J0=;
        b=bD6oseeoxFSA3da4B7m9+IBOc03txdtaCDIciCwCZ6HIMA2o2HEe1Rgcox3pOb+8bk
         6tNLcbnQyMrvVO6ItD0iphlbIfQ0xV448l7VESe/8WOsGw6PpcJNISU2pJCQcp8rnu+E
         W1W0rKL8Rg04cayzUOsZhYkG+nsq3BWIqSIFwx3GBvHi6lEkbWq0nhrh6g+yUdwfRqee
         /eKXxmD0obU1HJtsAvA6PEMrQVfXbpcTApnkOaK92n67Khf9UlQXc6Q+RKfGoGUGBe3g
         2MUAjy17Zl9yXiZb4V0Y/1jyGB1GzZy9Uzn1i4CJsx94wmSf9iOqKJ87okizuhXz4umy
         kJ7Q==
X-Forwarded-Encrypted: i=1; AKwUvByvd2b2jMV1B3MCeKtqwqDYgZTrcLSAX6SnjvybPNj8ytaS5EDrTbde5fU9TOUtf8wbmBkbY+AlS+jRTpg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLijhm6CeHvJRDuSdlr5hhHv1VHTRRx3qJ0xJ6th1aop9hvpx8T
	E0f+3Qzl+IJqjDwf7RlGTAQaNFP/nLL7HshyRpwJT6XP5GPnQTD8J0uXaveY7PDRqXes7Yw3aH8
	52DQcdJA7ytNZYeGNfma+u4F29UNrZPs=
X-Gm-Gg: AYBFou1CB4yRIPkGlbztlaBJow/ZDfxv9hwR7Q7sZRUBEY6eq7ulgjezE8LgaSHPoTT
	CrIRhem0eMXIOQ8K2ND7oypWVLF6/ZS+6RHmENRqJgs4N+xI89Gr6ac6GJu9e2WQ5+LRUl7AFsU
	SoRmJlEcN22b4YF/vT0357+W5XHVxU5gSB8cID0BeDS0Xk/ekin02aFlT6JapXMKD4OoAMCIaon
	64XPjFuWMy9pwcWtYeOdeEpVeguzTMDA0BBTgu4nAWtSNQiBwNyIGey/la5DoKZxwdGTIBrmMss
	jfAdJ9n0uWiG6BP3DGvY/4l/mrcCQbbEwIsdQOio1djmWffKUlX/5mY1gX8vnjoI+4HWUEZjVvq
	+nhhyB0HMMBkyqg==
X-Received: by 2002:a05:6820:808:b0:6f7:384:a09a with SMTP id
 006d021491bc7-7035597fbdbmr6886581eaf.24.1792473035202; Mon, 19 Oct 2026
 22:10:35 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012064334.3193085-1-thnkslprpt@gmail.com> <e22eadd0ada0c8243cfdf7829580984fdf897498@intel.com>
In-Reply-To: <e22eadd0ada0c8243cfdf7829580984fdf897498@intel.com>
From: Avi Weiss <thnkslprpt@gmail.com>
Date: Tue, 20 Oct 2026 08:10:23 +0300
X-Gm-Features: AclHuK-p2nWNOpMkyd_0WG7nPltm1YYmadXikekJFIF4kF3fWw5LAI-0mOwxIIM
Message-ID: <CAKOB7-Y0GTen0gYm-m4ixg8RjHuqEHsNgRTM4s3SbLg5J=vM3Q@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: hdmi: free EDID on connector update failure
To: Jani Nikula <jani.nikula@intel.com>
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jani,
This complicates the if (!drm_edid) a bit further down, so might not
be worth it.
What do you think? Leave it, or should I try to rework it?
Cheers,
Avi


On Mon, 19 Oct 2026 at 16:38, Jani Nikula <jani.nikula@intel.com> wrote:
>
> On Mon, 12 Oct 2026, Avi Weiss <thnkslprpt@gmail.com> wrote:
> > If drm_edid_connector_update() fails, hdmi_get_modes() returns
> > without freeing the EDID allocated by drm_edid_read_ddc(). It's
> > an unlikely error path but nevertheless possible and should be
> > cleaned up fully.
> >
> > Free the EDID before returning, while keeping the existing return
> > value of 0.
> >
> > Fixes: f6e4f57fd90dc ("drm/exynos: hdmi: convert to struct drm_edid")
> > Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> > ---
> >  drivers/gpu/drm/exynos/exynos_hdmi.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> > index d4fce39c2b61..386557a7f5e8 100644
> > --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> > @@ -893,8 +893,10 @@ static int hdmi_get_modes(struct drm_connector *connector)
> >       drm_edid = drm_edid_read_ddc(connector, hdata->ddc_adpt);
> >
> >       ret = drm_edid_connector_update(connector, drm_edid);
>
> You could just move the drm_edid_free() call here to avoid duplicating
> it.
>
> > -     if (ret)
> > +     if (ret) {
> > +             drm_edid_free(drm_edid);
> >               return 0;
> > +     }
> >
> >       cec_notifier_set_phys_addr(hdata->notifier, info->source_physical_address);
> >
> >
> > base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
>
> --
> Jani Nikula, Intel
