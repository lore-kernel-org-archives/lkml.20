Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A52F4E73DF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789662512; cv=none; b=fByfjMwdRzjIHr5eCESbCUmrn9kmKbHuYM8P6N/wxvivlq2L+Y3mJ5srFTa77ux8InDvf80KTU/LD+/gQr7YNdAIgnwEDlZcEmCyX7rvKfx3XWqflALQNpwz46UVIo3CabeBu5BezV/P+KAeSWUFW1axJXASe5To7iMctW/BzrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789662512; c=relaxed/simple;
	bh=BKtnu8ZYAwY5KCtnezIu0Q0b+yLVi/TmHjEAzvyhV+w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rJncvryx56UO7TF32aZS4OIM8uCOUuRwYG9EdN5finKruQ7nQPylWpBazSWwuyWWtMF1Xaqd3KoZcDlso0jCXzTPaar3fsCCs3Cqt+9UVcJNt6tCcqvH7howqpnxnOXG5RlVkEahFtc3amsvVNSztqr8inVwbmQf4TMIC1KbKDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZBAG4kkq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oulKEdAy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZBAG4kkq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oulKEdAy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789662508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T9Zesbadxeg7oTrWei3JYdZLdaxPsolNq8bf7iCfLoA=;
	b=ZBAG4kkq2oppSJ1PixwqeKhBSiY9IJNl+9e/ipjcPlQ0CecQfSmCUY9qfv/BCbisZCiFL7
	5OMpCoqJDkH5M/86fK7SgoK8DlGcRbNg+V3kBjoUAE85PBUn7sJeZsqlh7HhycCy4n5Rzd
	18kpObIIh59pJu8qHqSKJ5/V7buOhq8=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-NjzNjMNyP9WyjaWoAc_7aA-1; Thu, 17 Sep 2026 12:28:25 -0400
X-MC-Unique: NjzNjMNyP9WyjaWoAc_7aA-1
X-Mimecast-MFC-AGG-ID: NjzNjMNyP9WyjaWoAc_7aA_1789662505
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66cbfb7ec42so1400988d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789662505; x=1790267305; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=T9Zesbadxeg7oTrWei3JYdZLdaxPsolNq8bf7iCfLoA=;
        b=oulKEdAyvWNHFZlhUA1lawSY7TPeKLD3t/G22DBNhA2FV+eCR4l8zCSYSTg4Mlnw0v
         rC+xF/kf4d6Rtk2vWjXgDrYrwbZ8etqDOzZBK25WIPpBDIwQ+rAO7XpRvxIGtdJeYNGR
         c3UTQtM5+88cp21UhgFlPeVMu+6sNcFqfPrUACUKeW6CFo8TJBUDlTvI9hkFq1KLtSmz
         X0DmHKrjcZ6zAUBU6hA44vl3lGwbXMpefMkUip7CNSbWjsRIwjA7ywbQJKN9cgzTTyrX
         2jkRG7pubjw/gOa7Ha11G+bAJK1j+8Sve+1/D9/axBV6IAw6g4Nb+tFysIfXkdtLF47a
         nvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789662505; x=1790267305;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T9Zesbadxeg7oTrWei3JYdZLdaxPsolNq8bf7iCfLoA=;
        b=mNmxK4jbaf2NvDZ59UXkRsKa9nomnRB/bIczYu58zDWhZQbyn86CAY8/elzrQfwb2L
         GGQ4fHDNK9O0yM20F7XFk0qZfwXp0oARMhOZpRHTkXaRKP90F9KLuzty8QYGdcGsaWXn
         9UlfPGxY6PrsSfd83gLxsjSgnuPsqqQR6/JKvKKuG4Qil3ezfTf0zbMMyyId45Jg60zs
         7SkdlJJiAvJzU9rzxSmS1ZJUrAZ6VwkrHQoch25y/udJVtD8YzKTDMpOlgiWGIoO9l1Y
         U0bvUiXWgj6cj2u2s3tDALQukqsej7K6/v38cGcwnZtyecnLDi42PSg7rmATlUFmgR3B
         Xk3g==
X-Forwarded-Encrypted: i=1; AKwUvBzNdLkSd8qwUTQcHZ9R01gOcnHNk9wrYYQC6GxgGgOQ1l+/8qfjUPu+Olev0OMxE+YU/S+ZQ5HN7IOt89s=@vger.kernel.org
X-Gm-Message-State: AFuF++klCNwDrWePKB7nUyOii/C9B4CpffimAI6qxtJqmYrGFogalxHI
	uGY6efJ+sZVjc8hs6rYpc4nVauH5ObciqaSgNqgpOGFzJSToJznB3MoYM5wLMx/nMcbDDikryXx
	v8ahJ534nzxxrKFIyiSzlzO1IsTdXWv0deClfSgMo1ILviUgYEl0C0RdfVw/bR2FGIA==
X-Gm-Gg: AYBFou3c6pZVfPFmHf1iAVZA750h/vL9LdlzPkEKMBuOhw1Fk5GsXLtlH0qXW/odAiG
	RFr7EoZ0IupV7m6MWMWbyz9ZwLbnO1G3cbxDW0s2lHuy7/Jj/1FHmPbZ0aZ8Tbnvy/yLvRxNnF5
	43aDXNvKXFgNOBd20WAik3G1yLVCIiPplzpS51OYH/zqGhbzH5HAzVzyL+KjQrV4dIodr3ACdzM
	QDzXIt6tqWWrAHv5jCykGB2eiy3T3pOb9Prk6DpC1ZZ1ZXrge0YuHO/H1INwoAeE8BAJJjB0vpj
	KrVzEMavA06k6hViqMwsf0qZseYCCoxh2qY8H4uGbXS4yqdXrdaMUWVqVmOIbViRG/GKPnfy
X-Received: by 2002:a05:690e:480c:b0:66f:c1bc:4099 with SMTP id 956f58d0204a3-671632fcb0dmr1856044d50.92.1789662504430;
        Thu, 17 Sep 2026 09:28:24 -0700 (PDT)
X-Received: by 2002:a05:690e:480c:b0:66f:c1bc:4099 with SMTP id 956f58d0204a3-671632fcb0dmr1856033d50.92.1789662503824;
        Thu, 17 Sep 2026 09:28:23 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-896ca03f345sm1229717b3.20.2026.09.17.09.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 09:28:22 -0700 (PDT)
Message-ID: <4170733fbe8a738f925986f0a17d03c39b066c17.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/disp: don't reject HDMI config on cards
 without SCDC
From: lyude@redhat.com
To: Tano Dzhinski <tano.dzhinski@gmail.com>, Danilo Krummrich
 <dakr@kernel.org>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 	linux-kernel@vger.kernel.org
Date: Thu, 17 Sep 2026 12:28:21 -0400
In-Reply-To: <20260917135051.47683-1-tano.dzhinski@gmail.com>
References: <20260917135051.47683-1-tano.dzhinski@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi - apologies for missing the patch previously, and thank you for
bringing this to my attention!

Would you mind re-sending with the original authorship + a Co-authored-
by tag for yourself to make sure we give the original author credit?

On Thu, 2026-09-17 at 13:50 +0000, Tano Dzhinski wrote:
> nv50_hdmi_enable() passes the sink's SCDC capability from its EDID
> straight through to nvif_outp_hdmi(). On pre-Maxwell-2 cards there is
> no
> hdmi->scdc callback, so nvkm_uoutp_mthd_hdmi() rejects the whole
> configuration with -EINVAL, and nv50_hdmi_enable() returns before
> hdmi->ctrl() runs and before the AVI and VSI infoframes are sent.
>=20
> The result on such a card driving an SCDC-capable HDMI 2.0 sink is
> that
> HDMI audio silently stops working. Video is unaffected, and nothing
> is
> logged, which makes the failure hard to attribute.
>=20
> SCDC is optional, and the hdmi->scdc() call further down is already
> guarded against a missing callback. Requesting it on a card that
> cannot
> do it need not invalidate the rest of the HDMI configuration, so drop
> that term from the condition and let the existing guard skip SCDC
> alone.
>=20
> Giuseppe Ranieri posted a fix for this to the nouveau list on
> 2026-01-17, which received no review:
> https://ratatoskr.run/nouveau/2026/01/16963412
>=20
> Fixes: 6c6abab20b99 ("drm/nouveau/disp: add output hdmi config
> method")
> Signed-off-by: Tano Dzhinski <tano.dzhinski@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 3 +--
> =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> index 377d0e0cef84..9887b3898505 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> @@ -253,8 +253,7 @@ nvkm_uoutp_mthd_hdmi(struct nvkm_outp *outp, void
> *argv, u32 argc)
> =C2=A0
> =C2=A0	if (!ior->func->hdmi ||
> =C2=A0	=C2=A0=C2=A0=C2=A0 args->v0.max_ac_packet > 0x1f ||
> -	=C2=A0=C2=A0=C2=A0 args->v0.rekey > 0x7f ||
> -	=C2=A0=C2=A0=C2=A0 (args->v0.scdc && !ior->func->hdmi->scdc))
> +	=C2=A0=C2=A0=C2=A0 args->v0.rekey > 0x7f)
> =C2=A0		return -EINVAL;
> =C2=A0
> =C2=A0	if (!args->v0.enable) {

