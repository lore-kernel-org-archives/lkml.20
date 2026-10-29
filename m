Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279976;
	b=p/46Zd2h9dEiA2LvDHwtybxsc5lvfMBR9MUDDPEYoldqCMRA6/f4XE3NAIQa0YAr19U3
	 YJI+R/ENlNDs5H4Owurq35xgwUOJ1XtH75TobKT3X8RjMC6HCZaGsQ7FLx+Sj7S9mPaxe
	 maDwpY2Db66UTxekofjf0ENV9DbJYWQAA+hZhBKLoZx9uke/AhdaM+e2Pv/0q071AKeQX
	 8v0mpfCz2PZ3DzY09o1b9wpMKmaW0qRZ74fPhwa8+ChuQ3XH7tI4Wg6ORJ2SZh24VcSe+
	 QHKEM6j+9msodVy793+xMFXzNmQYL2ASmAk4wI4M5nW/PPcHcHPP/KIL0Jsd27lPp7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279976;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=wwC0ZFpvwlQ9kiJtnYf3eEKm65eBn7sm1koy7w0rbuU=;
	b=d4dgcNU58IGNFm/i4JdWRWcsR028b1npxhEct223D5NMgpc1roMFiyCCViR+bKYKbOEP
	 /eCCDWfYktLsZBWBSGIi47RT0MMuVcSB9B2R/g9WTCfXb8zGy0bNx/cR9fIndU2ejLaeR
	 EPIyQEekd7kLY0en/VNQTdswVnS6gvJR+i763sE/2KfIFBfbTxV/KbxLM57OcEI5CNyPe
	 i2aV31Ryy3zmVWfCLiGarPCRX/MWG9iNouKy7yPleS1BePRVxN0UkeYEFzQ/RXWoDS1Nd
	 8+R1CBwv1sEu3+FKS0JVVzzoMsRWqWM19dWEe+bH4ynA2xfdh+iiCE+QjhGucXdnLMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B909606A31A;
	Thu, 29 Oct 2026 13:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B909606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <7fd62daa875e4a3772e980127d368704a849caee.camel@crapouillou.net>
Subject: Re: [PATCH] usb: gadget: f_fs: Remove deprecated dma_fence->ops
From: Paul Cercueil <paul@crapouillou.net>
To: Philipp Stanner <phasta@kernel.org>, Neill Kapron <nkapron@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Al Viro <viro@zeniv.linux.org.uk>, Nuno
 =?ISO-8859-1?Q?S=E1?=	 <nuno.sa@analog.com>, Sam Day <me@samcday.com>,
 Michael Bommarito	 <michael.bommarito@gmail.com>, Gabriel Prostitis
 <prostitisgabriel@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Date: Thu, 29 Oct 2026 14:19:23 +0100
In-Reply-To: <20261029125143.1744481-2-phasta@kernel.org>
References: <20261029125143.1744481-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Philipp,

Le jeudi 29 octobre 2026 =C3=A0 13:51 +0100, Philipp Stanner a =C3=A9crit=
=C2=A0:
> The dma_fence_ops function ops->release() has been deprecated because it
> prevents drivers from unloading. f_fs's implementation merely frees the
> fence. The dma_fence backend performs this deallocation automatically in
> the correct manner if ops->release() is not implemented.
>=20
> The backend simultaneously correctly frees struct ffs_dma_fence since
> struct dma_fence is its base class.

For context, this .release() callback was added to avoid the implicit free =
of
the base class, which IIRC was a request I got during the review process of=
 this
change set.

I'm personally fine with the change, but do we need a "keep this field at t=
he
top" comment for the base class in the ffs_dma_fence struct? Or what's the
policy here?

Cheers,
-Paul

>=20
> Remove ops->release().
>=20
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0drivers/usb/gadget/function/f_fs.c | 9 ---------
> =C2=A01 file changed, 9 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/function/f_fs.c
> b/drivers/usb/gadget/function/f_fs.c
> index c64a268e98a4..e8672b37e890 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -1479,18 +1479,9 @@ static const char *ffs_dmabuf_get_timeline_name(st=
ruct
> dma_fence *fence)
> =C2=A0	return "";
> =C2=A0}
> =C2=A0
> -static void ffs_dmabuf_fence_release(struct dma_fence *fence)
> -{
> -	struct ffs_dma_fence *dma_fence =3D
> -		container_of(fence, struct ffs_dma_fence, base);
> -
> -	kfree(dma_fence);
> -}
> -
> =C2=A0static const struct dma_fence_ops ffs_dmabuf_fence_ops =3D {
> =C2=A0	.get_driver_name	=3D ffs_dmabuf_get_driver_name,
> =C2=A0	.get_timeline_name	=3D ffs_dmabuf_get_timeline_name,
> -	.release		=3D ffs_dmabuf_fence_release,
> =C2=A0};
> =C2=A0
> =C2=A0static int ffs_dma_resv_lock(struct dma_buf *dmabuf, bool nonblock)
