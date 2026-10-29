Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793269863;
	b=Gli1gPLc8Q819n+rS8GOb/GXBx/w7GbMTpg4cDM0oKl8R+MHUvNtjpH9LkY0acOgbdoD
	 2NOCC6GYixSHNeVOIBXrN62CSbX4BiGC5krA/UG/txAp2gCSq44gIJcqbN1Q3cKmwy9ia
	 ySL4b8N1SqMp6PU5Bdo8gKzP9P7JdgaewDvf3ovjutwChkHc7inhDrthV7LZDcTRJrsxq
	 qgdEHJG3U2E3cyzxSEvlMQMWd4fgWEDLGmMbfqMZ1NeYnGKNfriCT+rRO4amCa2giZm/U
	 ReiFD7XjdHcQNcblK2VIhm1I5Z31/2fQoh80IOf/k+J857Qb1LlFshrNmFWUdgRQ4Ag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269863;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=vReinFyJuq/ESO/NM1w8p1Ykf2lFRhtp9bKhJhu9+p0=;
	b=GyKEoJVrpvFsHGoE7TVP9d6bG8Ddvw2NhZGfxg86I2lERPfx4T//9e273Bge+J7+sHt+
	 KfLwSaz8c4RdW2ynKQKvJBryCzw21Gh4rpJ9QwKYmv9+CbWKVsrd1iSumfu2+M1ttF3u7
	 64/xzG4P0JyeWM/JcdImS32KAqsNkkdJmI67M0uD1ek6mTDLuPhLC9Yx7Gl2YjB7t08DD
	 KWsX3wHHNSaQnkgk/hzi+4rScP4SXOZExPOUu93ZLRM0sEeypdmgjiT7f8nv/qdA6vn/B
	 +bQkWT9EWINoBLDP7LpxBLCczONeThwqR0hodJe1F/JVGRpRQ0x36DrhkUC+nJYwgYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=HAHrjgNa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A154D606A31A;
	Thu, 29 Oct 2026 10:31:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A154D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=HAHrjgNa
Received: from [IPv6:::1] (ptz.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::77])
	(Authenticated sender: lst@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 6E0F52000E3;
	Thu, 29 Oct 2026 11:30:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793269859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vReinFyJuq/ESO/NM1w8p1Ykf2lFRhtp9bKhJhu9+p0=;
	b=HAHrjgNadQOzCFzerIWjXpjCt0BxnmL7Iaxw+OXjvuGf6abeziszPqrl2pXQuWzUWjS+Gy
	h6ocSJ+SirkfVvo568/YhOabEa7uEaYnsp4nEaLMnnQ8MF51DMtZKblfTwOkkm0jLnrjra
	+0YYMqp1tgdoK8fhfV+aTFnHw2MrXeYq1DsJ9xnP7q6LLMLGlscW6015mNoOJqQVSEaa6l
	EaeDPdckz96E0TGJghN2JE6dB0g3mo+2uA64ATN+X4WyOc1j7XfOFS/TIGlysxzGAn9Dyi
	7zIZQHZcvFegzaRPjahHkFn7ZxJrddTuIk6G+h9AcqpfmDx4asRSmnJq4bleuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793269859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vReinFyJuq/ESO/NM1w8p1Ykf2lFRhtp9bKhJhu9+p0=;
	b=KmQzt2pvfrQmPxV9buNk39KBsTE7geM+OZt6fyJi2g2INHwX56KCxa9C4DB+uVY3we5VrU
	rLWdWPGNt3aM+jIAD3lNKeMufmOmx+eOLLbzHsKCN6Lt/IEbhlSvqvrVEMi6egXIMI9mr+
	Zswb9+anneeVTCFjxjaMGIBGKvsICvX0NAyUiwfcSjDnin2Dhn4aNL8WmciXULrXejUB9u
	tZR+/pnTDfkW6gtWS3DHAfmzpND4aIoAmpslzfcXDtivDLuBXdlvpouFnxZ1FEgJXiiG1s
	46LK8028OHAK0bUUKMqhdnfDK7EkX/tJ13CTIyQwvVCsnHlvm1L0eqGBUAamQw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=lst@pengutronix.de smtp.mailfrom=l.stach@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793269859; a=rsa-sha256;
	cv=none;
	b=Kl6fF4e1rilfJxkycY7uZhMMx603SVYKOZTLapb7cXRbXt1nORdwD9gEiFhnUIvoNZgjWx
	hDCWB8KjybiTFyKXcZmZ6uXj6JhbxjYvdmhKZragSymSMxHNNLI19rnBDYQ4vy68PlrFpF
	UofZahKaaGl4BW6SluZzFIjTUkbahqDTwQqhwbU9mr41ijyDf4b/wr97I/iv38VDXbd/xA
	UUD3+h46cvYVI5VY/axoYfGFTuES8eX5EQfkV+QY092tYXqqauYoEMLVBZZ8Jl8XlcHD7a
	/yKdJJYs2wbw6qyogOY9JvCfjMdqvcmfW2UB4RxhZzdCDkq4/Vt3LspjDmquUQ==
Message-ID: <4b9c47028821bfcc0969f8ca811360fce096a3d9.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] drm/etnaviv: Remove deprecated fence_ops->release()
From: Lucas Stach <l.stach@pengutronix.de>
To: Philipp Stanner <phasta@kernel.org>, Russell King	
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Thu, 29 Oct 2026 11:30:59 +0100
In-Reply-To: <20261028103129.1036380-3-phasta@kernel.org>
References: <20261028103129.1036380-2-phasta@kernel.org>
	 <20261028103129.1036380-3-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Am Mittwoch, dem 28.10.2026 um 11:31 +0100 schrieb Philipp Stanner:
> The dma_fence->ops->release() callback is deprecated because it prevents
> drivers from unloading. All etnaviv does in its implementation is invoke
> a kfree_rcu() on the fence.
>=20
> The fence backend by now also frees fences with kfree_rcu() if
> ops->release() is not implemented.
>=20
> Remove the deprecated callback.
>=20
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

Please take this through drm-misc or whatever tree is convenient.

Regards,
Lucas

> ---
> Just compile-tested.
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 8 --------
>  1 file changed, 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.c
> index e51a310c8d70..e75dab5e407d 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1176,18 +1176,10 @@ static bool etnaviv_fence_signaled(struct dma_fen=
ce *fence)
>  	return (s32)(f->gpu->completed_fence - f->base.seqno) >=3D 0;
>  }
> =20
> -static void etnaviv_fence_release(struct dma_fence *fence)
> -{
> -	struct etnaviv_fence *f =3D to_etnaviv_fence(fence);
> -
> -	kfree_rcu(f, base.rcu);
> -}
> -
>  static const struct dma_fence_ops etnaviv_fence_ops =3D {
>  	.get_driver_name =3D etnaviv_fence_get_driver_name,
>  	.get_timeline_name =3D etnaviv_fence_get_timeline_name,
>  	.signaled =3D etnaviv_fence_signaled,
> -	.release =3D etnaviv_fence_release,
>  };
> =20
>  static struct dma_fence *etnaviv_gpu_fence_alloc(struct etnaviv_gpu *gpu=
)
