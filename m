Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793288603;
	b=ibXX17ZTrmN8GvCJtsWRbM3OSUo4fA2Uq4cSyEAyqkas2k8wk9TKbkuj7g2o1wLC8RI2
	 EU63Sx72opXf2fS3KwPPg5s2StoL81ukh9NUnWtrsSweCFs9BRt8TpOXVl/9fu33KnbdB
	 VGmv/FGHLiV1Tn844ahAIhSrLgTQOby0iJo3oBdLJ9zIAH8YS2HmHQLkpLEnCClX+bT8I
	 Nzbmkfqq6rQJ81pIY3JxSXBeP9JQb7BsyVuVvr08pEn7doDUcLjTgYIYWxjCCnfOC4MWC
	 OwM/7rXpB5eBLRP/BO6eVkG4CVV1mIar5M9Z2lrL6l3sPo+FX72WY2P/yoy37qrSQOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288603;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Last-TLS-Session-Version;
	bh=Sk8NTlk3apacTKEu+QU4AwxZCr6z7+F7EHf6/mGPK9I=;
	b=G6JxEJzZwLynz+BGG6vWZa0M6Tnd4xokpn5lE86r24f5ZfK1QGpilyJzkJr2a5hZfaEi
	 2qxzbObASWlpWiEwkdLgpkXR8KfYlfEmF4VZuB3sretoQKTsO4qqYWZBrX5uZKTvd91gx
	 3m7gr1UKoflS5dTtn8e6YzyndWmXyHZcmHvjrK+sLsvselkbtHZODvwoagx4xAzfOJIxM
	 MPj209+C/co+IpZ+6MBAUPmo1Sb50BmLqROFJ3Pr7YBcPfhb9zwCbeXam6jIvDTZiFM2J
	 mzBlAkJSjL9kPLQQyouV0P7OjQS7WbWNXDYsEOprYWHFCoFrbnKXlRF8VTbv0IBKXeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=afwor1U4;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BE6606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71BE6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=afwor1U4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D31641A1392;
	Thu, 29 Oct 2026 15:43:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 932396076A;
	Thu, 29 Oct 2026 15:43:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E281B103290FF;
	Thu, 29 Oct 2026 16:43:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793288598; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Sk8NTlk3apacTKEu+QU4AwxZCr6z7+F7EHf6/mGPK9I=;
	b=afwor1U4Ve+al8vWhKU9FKqqq22hWCLDvP9bvh4sd0koXe+CzwNmn4PzlpOD6lH5uIa1Y6
	aeRd8j7rfquF+pN2V7gVjMhguT38ZS8uqUagUrsbIM2F86VlazmzN4CZtkuuPx0vKFmh+E
	dTvh3aIV5o1I8tKgcX3nN1OPuYjixQuftohcxXVWo8wmFTbhBDtjvsHFgI6NrsgmC5xDPp
	PK8vo0WMo36NyxUXCQZxUCKiI9Ee7XPlkSyPrU1aUx50XKRdOKPHYTIscNJODcQf2yoS12
	CiLWtJpoJyDhuZ9jedlYrUwSq1DRN9Z4dGpRz4jQDUhv02ylWYjtYnB4W1P57A==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Jonathan Cameron <jic23@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@kernel.org>,
 David Lechner <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 01/15] iio: buffer: let the block keep its DMA fence
Date: Thu, 29 Oct 2026 16:43:14 +0100
Message-ID: <-TPmKHsgTdWh1jJ4sxKceg@bootlin.com>
In-Reply-To:
 <20261027-llm-char-misc-iio-v1-1-0d818334f6c7@linuxfoundation.org>
References:
 <20261027-llm-char-misc-iio-v1-0-0d818334f6c7@linuxfoundation.org>
 <20261027-llm-char-misc-iio-v1-1-0d818334f6c7@linuxfoundation.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Tuesday, 27 October 2026 at 17:19:05 CET, Greg Kroah-Hartman wrote:
> From: Josef Bacik <josef@toxicpanda.com>
>=20
> iio_buffer_enqueue_dmabuf() hands a plain pointer to the fence to the
> buffer implementation, which keeps it in block->fence, and since the fix
> for the fence leak it drops the initial reference right after
> dma_resv_add_fence(). The only reference left is the one of the
> reservation object.
>=20
> That one does not last until the fence is signalled. dma_resv_add_fence()
> replaces and puts a fence as soon as a later fence of the same context and
> the same usage is added. All the fences of an attachment share a context,
> and an enqueue on an output buffer only waits for the writers, not for the
> read fence of the enqueue before it. A second IIO_BUFFER_DMABUF_ENQUEUE of
> a buffer which is still queued is refused by iio_dma_can_enqueue_block(),
> but by then its fence has taken the place of the first one. When the DMA
> is done, iio_buffer_signal_dmabuf_done() signals a fence which has been
> freed and schedules the work item in it.
>=20
> The leak came from the reference which iio_buffer_signal_dmabuf_done()
> takes and iio_buffer_cleanup() drops: with it nobody dropped the initial
> one. Do not take it, and leave the initial reference to the block until
> the cleanup.
>=20
> Fixes: a09399935508 ("iio: buffer: Fix DMA fence leak in iio_buffer_enque=
ue_dmabuf()")
> Cc: stable <stable@kernel.org>
> Cc: David Lechner <dlechner@baylibre.com>
> Cc: "Nuno S=C3=A1" <nuno.sa@analog.com>
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: "Beno=C3=AEt Monin" <benoit.monin@bootlin.com>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---

Having the block and the reservation each hold a reference to the fence is a
better fix than mine.

Reviewed-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

>  drivers/iio/industrialio-buffer.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/iio/industrialio-buffer.c b/drivers/iio/industrialio=
=2Dbuffer.c
> index 4294101810fd..a2386dba497c 100644
> --- a/drivers/iio/industrialio-buffer.c
> +++ b/drivers/iio/industrialio-buffer.c
> @@ -1931,9 +1931,14 @@ static int iio_buffer_enqueue_dmabuf(struct iio_de=
v_buffer_pair *ib,
>  	if (ret)
>  		goto err_queue_unlock;
> =20
> +	/*
> +	 * The reservation object takes a reference of its own, and drops it as
> +	 * soon as a later fence of this attachment takes the place of this
> +	 * one. The initial reference stays with the block, which points to the
> +	 * fence until iio_buffer_cleanup() has run.
> +	 */
>  	dma_resv_add_fence(dmabuf->resv, &fence->base,
>  			   dma_to_ram ? DMA_RESV_USAGE_WRITE : DMA_RESV_USAGE_READ);
> -	dma_fence_put(&fence->base);
>  	dma_resv_unlock(dmabuf->resv);
> =20
>  	cookie =3D dma_fence_begin_signalling();
> @@ -1989,18 +1994,12 @@ void iio_buffer_signal_dmabuf_done(struct dma_fen=
ce *fence, int ret)
>  		container_of(fence, struct iio_dma_fence, base);
>  	bool cookie =3D dma_fence_begin_signalling();
> =20
> -	/*
> -	 * Get a reference to the fence, so that it's not freed as soon as
> -	 * it's signaled.
> -	 */
> -	dma_fence_get(fence);
> -
>  	fence->error =3D ret;
>  	dma_fence_signal(fence);
>  	dma_fence_end_signalling(cookie);
> =20
>  	/*
> -	 * The fence will be unref'd in iio_buffer_cleanup.
> +	 * The reference of the block will be dropped in iio_buffer_cleanup.
>  	 * It can't be done here, as the unref functions might try to lock the
>  	 * resv object, which can deadlock.
>  	 */
>=20
>=20



