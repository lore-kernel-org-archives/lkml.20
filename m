Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC8B3EA967
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 23:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791588291; cv=none; b=Ib221iL/2eEFu+7n/2I9tMAJkvTWVgDgt8SK/+vrPuLe4eg/ni/Krhy0lBWo2s8OMPOb9jXt1C+w+5s9K40AmIRvE7t4Vb6dJR8yyj/YT+JuP8jAfSXtHoWBsnEuu+QqzoCDemu2lQ28TuwTWVl3StdTaZR4wkU20YHnojNNYXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791588291; c=relaxed/simple;
	bh=gCPRAyhwbGy3U0SZyNA6UYREvhetTlsvLl1xaWQ4Ano=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W29TIT8phZovxuqUYhbU2TrKW6h4Z1WP51PGLIXXJWg9t5miEiKr1h7vD6rPtpcTUGuMAgVBA8WCKLH5dN2Qm3AahdwCGwmqA2hY/LLwsAvEY//7yiK9jQYpVIlPTIb3v8F+fOUEn82/WlwcZSXcCmeblA60TVyg0PvGW9vrh3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FWccBhSW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tAFwygCw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FWccBhSW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tAFwygCw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791588289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T5sL1IN+vEe3uRvA6b5GRf1/o9Y8z+Hb4XnuY1HXzNs=;
	b=FWccBhSW1RgIBT7+QuKXP1/5124IMdqrpThtkL8RnjZvn+V2UO4nNFv5Bb5h8xRQO2G2X+
	561v38IwbffbHbkZKgX71vseLuBfhxeN6A6TF9V0pBSKEu+do+EO0tEr9FY0TOXd/ulBcq
	KyWHT70u+eIiwM95Z0552jCPxMA6lGw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-xY2s8QFbMtSsJSpQqN4W9A-1; Fri, 9 Oct 2026 23:24:45 +0000
X-MC-Unique: xY2s8QFbMtSsJSpQqN4W9A-1
X-Mimecast-MFC-AGG-ID: xY2s8QFbMtSsJSpQqN4W9A_1791588285
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc7a6e4e1so56598985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 16:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791588285; x=1792193085; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=T5sL1IN+vEe3uRvA6b5GRf1/o9Y8z+Hb4XnuY1HXzNs=;
        b=tAFwygCwm1o8VOyj2DBJ4+hkK7QErQUavkGAYwJ4c7n+MpASaM/V9HbCXrk6RWeDgl
         LkQfnitKe5AfX6KX2H3FOyrv3sSBSjkgguFSj8oNJJSN8pBGSl/7a2vZ/jO9WPiEEX/N
         AVZlEob3S9pE6aKcJ9/EHvoRzLSknipG/uLQAHpE5vlQ81NUrM5xkqKrdhSNTlAq74TI
         3TTIZkaEwqp4WxHNRNE96qFPsQJPRXig/xdaRhX7HduF8A2Y0rvuO7S2vgTW4Kij8dzH
         DFHn3JmaBatbMJZ2KHvAVBatSiC8LPqUlRMljfxPwWrllygtTUggnZ9NlWWXs3ptfJOb
         5TIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791588285; x=1792193085;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T5sL1IN+vEe3uRvA6b5GRf1/o9Y8z+Hb4XnuY1HXzNs=;
        b=gXpX28vM5yapmKpdvMN6J2Zfhbx62Q2NR3WAJNCLYWA1Vu3ADyer3rV0g3Y5V6vgyT
         np6zFaoSb3AFAd50oEwhz/bZgL7sq2PuX9anB9AH14aap69RggXIIOFif9TM2WeB0mI5
         XfWbKrmgiWmGTZmJJlZ1npNf3FkSoKMsCgY1/Z+D+XTSmvSrF7Nj6UL0OsaTOgJJmk23
         I7rmpSkPnoYV3lM8JZWFSmDQh+VqvnNKGCXmGl7h+ENLvOdJLmaoXBCyic6sunTIXW5j
         nurodU0GddM8KxIOgzMfP2ZBker+xShVvKnDNq8wdk2qvh2B4rr5123J8Ke/1G6pYNth
         jzmQ==
X-Forwarded-Encrypted: i=1; AKwUvByV20MTj0lfx5+Tu4zBZ4NglpAVH0nCw5+vOHvgWoU3zKU2oZ/E92q9++fZ98XGZCdKfY4gr6rL2Xbhbv8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbJUxiBZL1VN9S1crGPw2G3NJCvz/v34IJZzMxtG/Rkr2iUu9T
	qFirU9x97WvXHI5mOW/Soy4/crB34BK3sSh19BF495oVdtC+Afka6N8KfrRqs5k7dS+s+RX6oUJ
	5IEjuXHfJaAcgxMti3D2c4S0nFsp5JNrfaJ6uAhDKWjhdA7kvPxCEBFLG+nf2VWiBhA==
X-Gm-Gg: AYBFou1LQim/LAJs8b0Hu9Je3VgRRIcTcSxuB9e/xzQ4Z/p8vsOIZLz3x7ydKW+QtKp
	oXekvtrljdjMmtR3jTCZtCjJ1sGpKSHWOmKxnH/3ygJKSYadwJwNcg7DK0QyzPRt5xKDq0aA86+
	rigqd537t2MlX0JruBoZ0MboI84PsUgP5E6OINnKjKQo8yjwM6oEEL8mYZLd4R4wk3dy0uCG/3A
	XDCcsjr9bYYwo9Kk7zygl69GYE+xT8MRHj8h/sRCezQvEhpOaWT3YR2Kw/bhDX6u1QWvHMSBE/u
	9Xvbg6EF1RYyZdknGMH2dHKxx7Nkpcx4qSzM5KLmtzN1haL+ZshswO9YKJ1ZYv4eHXXjcSw=
X-Received: by 2002:a05:620a:a419:20b0:93e:c12c:f145 with SMTP id af79cd13be357-93ec12d06ddmr330167885a.79.1791588285258;
        Fri, 09 Oct 2026 16:24:45 -0700 (PDT)
X-Received: by 2002:a05:620a:a419:20b0:93e:c12c:f145 with SMTP id af79cd13be357-93ec12d06ddmr330165185a.79.1791588284801;
        Fri, 09 Oct 2026 16:24:44 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98e3a33sm297469885a.40.2026.10.09.16.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 16:24:44 -0700 (PDT)
Message-ID: <a6f23983895d0d09b9c2c6a02160c5e3949a6a81.camel@redhat.com>
Subject: Re: [PATCH 2/2] drm/nouveau: prevent NULL deref of gr in
 GETPARAM_GRAPH_UNITS
From: lyude@redhat.com
To: Zhenhao Wan <whi4ed0g@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>, 
	stable@vger.kernel.org
Date: Fri, 09 Oct 2026 19:24:43 -0400
In-Reply-To: <20260812-nouveau-nvkm-absent-subdev-null-deref-v1-2-7e057f6aeba0@gmail.com>
References: 
	<20260812-nouveau-nvkm-absent-subdev-null-deref-v1-0-7e057f6aeba0@gmail.com>
	 <20260812-nouveau-nvkm-absent-subdev-null-deref-v1-2-7e057f6aeba0@gmail.com>
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

Since this kind of relies on driver initialization having already
failed (which I'm sure breaks many other things we haven't found yet)
I'm going to push this to drm-misc-next

On Wed, 2026-08-12 at 23:00 +0800, Zhenhao Wan wrote:
> nouveau_abi16_ioctl_getparam() fetches the graphics engine with
> gr =3D nvxx_gr(drm) (i.e. drm->nvkm->gr) and, for the
> NOUVEAU_GETPARAM_GRAPH_UNITS parameter, passes it straight to
> nvkm_gr_units(), which dereferences gr->func with no NULL check.
>=20
> When graphics-engine construction returns -ENODEV, NVKM treats it as
> an
> optional absent engine: the NVKM_LAYOUT_ONCE device constructor
> deletes
> the subdevice, leaves device->gr =3D=3D NULL and continues probing, and
> Nouveau still registers a render node. An unprivileged client holding
> a
> /dev/dri/renderD* fd can then issue DRM_IOCTL_NOUVEAU_GETPARAM with
> NOUVEAU_GETPARAM_GRAPH_UNITS and oops the kernel on the NULL gr.
>=20
> Report 0 units when gr is absent. This matches nvkm_gr_units()
> itself,
> which already returns 0 when the engine exposes no units callback.
>=20
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Assisted-by: Claude:claude-opus-5
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_abi16.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> index 291203121f0c..dd3f8d386377 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -306,7 +306,7 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
> =C2=A0		getparam->value =3D 1;
> =C2=A0		break;
> =C2=A0	case NOUVEAU_GETPARAM_GRAPH_UNITS:
> -		getparam->value =3D nvkm_gr_units(gr);
> +		getparam->value =3D gr ? nvkm_gr_units(gr) : 0;
> =C2=A0		break;
> =C2=A0	case NOUVEAU_GETPARAM_EXEC_PUSH_MAX: {
> =C2=A0		int ib_max =3D getparam_dma_ib_max(device);

