Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824502;
	b=OgjjQh0IR8cloe1EAF0EsidCIB+hmhranKZVL7sRveGCRlmx6gW+NB2h0idHAXb2HQyv
	 zCZoun8sAqXeJhGY73UL5Ej7Jq+gfqwhF2TJLD8I7VSqrNu3G/4t+8ZKjhnTlgLFngZt7
	 NfkULO9kcDCwlfOkC6QsWF6Z8uMtN93qi/FiJXcmivAuTnvKSMj4ZWuXYrBnKMGMKvR5m
	 0jS6qSL2E9e5kGhkIHN97hA0roepHUrgiqWtovs3oIZ56t375pOyBRgGB8kHJ5RvCtz0u
	 nfUd4HT/qTW3oyYCrA5YO8zN36Tc05EoZflB6GEfzwgOhpqEZvwSDgHd8qAT0AKzA+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824502;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=DqQSlp0OxWt+yQpbkHF9ExhxGvHfj4LoD8pce6Yk+4o=;
	b=vMJAfCQoB8/mKeXPj/4Kiat6J+6zkajNhZvV8GF5BHl9WuASgCW0Alz8n3k0u7UyCpXl
	 390/RbBT51wKQL4BY6Fq7gzLSnq6SxV4frN1OXriaHxeBnw6CGJ/D1y+HhfdAh0zfADQP
	 ++G4Maen2o/hEyCsbizBAR51vP8sAfguKqZdmcxyKwmtW8aqI6gQ8+B7sxiN8cIzJwxat
	 YqIoY2oiFwwoAqUpDgpergNfldQyZ7WoL0B3eNdjF6U5l2jy++fII3ctnayGCKEirK/SO
	 bM/Dc1x/ZmQ7MU6RznbvOgbYyv0O3g274qgxdKbWKRUmSfV+1gBzyePeHkR491Xympg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Ni1HVMUU;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9657606A31C;
	Mon, 16 Nov 2026 10:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9657606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Ni1HVMUU
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE67E175;
	Mon, 16 Nov 2026 11:19:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794824352;
	bh=0CTu0igy6jwM2YeMevJJWXBYcaZouwm/r7K0xQiOwtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ni1HVMUU87uDO+8PTASqpTnv9j6FrUOeo4T91vXyxiyhPm9jGwgpLpK7hMKMofTpi
	 v26NCxnE+O1ZCetsDFoyZP7j3EfmjVEEbPaMp3wWz3YXkLYIZr9mpBO5hbZ5ENCyrh
	 bOd9b2cbry8DHBp26m2ByY2oEhYrCT9TyVLFgM7s=
Date: Mon, 16 Nov 2026 11:21:36 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rcar-vin: Return unused buffers correctly
Message-ID: <avrXFz3LNGShIT1K@zed>
References: <20260828-vin-fix-vb2-v1-1-97eb1f4f75c9@ragnatech.se>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260828-vin-fix-vb2-v1-1-97eb1f4f75c9@ragnatech.se>

Hi Niklas

On Fri, Aug 28, 2026 at 12:37:44PM +0200, Niklas Söderlund wrote:
> Unused VB2 buffers should be returned with state DONE not ERROR when
> stopping.

Indeed

I think this is worth a fixes tag

I'll add, if you agree:

Fixes: 63a71dd813e2 ("media: rcar-vin: Break out hardware start and stop to new methods")
Cc: stable@vger.kernel.org

Not 100% sure what commit to use in the Fixes tag as unused buffers
were returned in ERROR state before that commit, possibily from the
very first commit that introduced the driver

>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index 73cda0e2d45a..f3003dd61890 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -1449,7 +1449,7 @@ static void rvin_stop_streaming_vq(struct vb2_queue *vq)
>  	dma_free_coherent(vin->dev, vin->format.sizeimage, vin->scratch,
>  			  vin->scratch_phys);
>
> -	return_unused_buffers(vin, VB2_BUF_STATE_ERROR);
> +	return_unused_buffers(vin, VB2_BUF_STATE_DONE);

Does the same apply to buffers queued to the hardware and not
processed released in rvin_stop_streaming() ?

	/* Return unprocessed buffers from hardware. */
	for (unsigned int i = 0; i < HW_BUFFER_NUM; i++) {
		if (vin->buf_hw[i].buffer)
			vb2_buffer_done(&vin->buf_hw[i].buffer->vb2_buf,
					VB2_BUF_STATE_ERROR);
	}

(nit: there is a stray empty line after this loop, if this hunk needs
to be patches as well, it might be a good occasion to remove it as
well)

Thanks
   j


>  }
>
>  static const struct vb2_ops rvin_qops = {
>
> ---
> base-commit: 4900cad020c0580dfb1be27776ff10a4ef110cfa
> change-id: 20260828-vin-fix-vb2-28e1bb24a618
>
> Best regards,
> --
> Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>
>
