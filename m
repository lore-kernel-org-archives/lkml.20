Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922371;
	b=tF+1GcPcy/jq1UacxTFSUzB4lfTnoWDCzDE75eB7/0mHps96saXSYaPQdcKRKlUgh7GX
	 v4tHw+yDCHgVMq/0/ZoraOQ3oW+952YgwbWCG/UpOQyf7Y21K2CB4+UaFQCwBkc24pgy0
	 /pl1DRdBWLr0h5ZBA+yqSxiyg9d6xKt9l9BfYJt5Fv6oDBw1sLxTrwAWL9xVtxNG/BOhq
	 QxOKpS+0OtLbthhzDa3Yw2+O8oOHYaXSFDf6DYXyfDCVrlvTt/6BKFiLYrO+WV7CDw4xf
	 2l6cF2M50AGgbmFZOlAxFf9ATjlhR/iWKRefpIboFeUpCZHRPlTaxORc8bVWRJp8vQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922371;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=tiAy5PQmLZ5hEMe6QeP0gUFXTZHoS740/eNTgW6sRH8=;
	b=FMWCNnhdw4ENUO2npUrGB914HtEReTVrDC0Hiw7QOmoSNN70Fa/NWntAVFngh0r2Pn0y
	 o+7+3kxga1cI3+XT7PrlYDyxjTgrr+YEatZiikO6eVkw89g1SSjjawjR8NTKeLqdxRS3S
	 0jAqbtd3bRwurBFamYph7g3gP62MVz91XIGNdhuRlCDZ6BiZrvLpqmQpfEmIMqoQJnC2w
	 RvmS6dMWdCVo60MnpU1T87lwC3j/Ls0KSqzRo+mCmfgRIQVJ9nXHYeL8m55IbVcKzBzkj
	 Y8o3hV+lpKNFzdJZfV3hds5g6H/e9JqeQkjmgkBWtfhU/AOx1wLlaFRnpNIClWqx4Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gb7PcsfV;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4709F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:32:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4709F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gb7PcsfV
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 18A4FC79A97;
	Tue, 17 Nov 2026 13:32:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A98DD5FC81;
	Tue, 17 Nov 2026 13:32:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59F7211BC0024;
	Tue, 17 Nov 2026 14:32:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794922364; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tiAy5PQmLZ5hEMe6QeP0gUFXTZHoS740/eNTgW6sRH8=;
	b=gb7PcsfVBsbwlRm0khs9/jf2fe/f9ewHuUPO2aFrqIUZmXRjU0W86K651Oeo2/jfkgs7ua
	ya1ms7sNUnc+lmdn3ziMHBAG9XuFuGatmtQzgvXtCT/TthMUW780a7tNvABZGYws3GZrM1
	KQrGOV8pIC6dTnY6ihRIxN/3soH0PEcZK7ClMdEM8fP+tUnMN6vDVcjWIQLIvQzU1q+nAF
	753uplltgp2ia/m6hs+oU9FzjvAxJhk7bl5e0mI3rOSj2NUVqOmutAJ/GRozkYEjVcB5e8
	9zGDqafEiCbeWlAVIvr90prelyF1jLsMAZx9Zb0Leh5sVbWjYjEQBCRjFgejjA==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 14:32:38 +0100
Message-Id: <DMXIVFWKAM8A.29COLJ2EC6MUM@bootlin.com>
Subject: Re: [PATCH net] net: macb: limit jumbo frames to the RX buffer size
Cc: <linux-riscv@lists.infradead.org>, "Han Gao" <rabenda.cn@gmail.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Jingkun Zheng"
 <zhengjingkun@iscas.ac.cn>
To: <gaohan@iscas.ac.cn>, "Conor Dooley" <conor.dooley@microchip.com>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Punnaiah
 Choudary Kalluri" <punnaia@xilinx.com>, "Harini Katakam"
 <harini.katakam@xilinx.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261114-macb-jumbo-jml-v1-1-f501395eaf9e@iscas.ac.cn>
In-Reply-To: <20261114-macb-jumbo-jml-v1-1-f501395eaf9e@iscas.ac.cn>
X-Last-TLS-Session-Version: TLSv1.3

Hello Han,

On Sat Nov 14, 2026 at 10:51 AM CET, Han Gao wrote:
> +/* Longest frame that fits in a single RX buffer */
> +static u32 gem_jumbo_max_len(struct macb *bp)
> +{
> +	u32 len =3D bp->ctx->rx_buffer_size;
> +
> +	/* Frame data starts NET_IP_ALIGN bytes into the buffer without RSC */
> +	if (!(bp->caps & MACB_CAPS_RSC))
> +		len -=3D NET_IP_ALIGN;
> +
> +	return min(len, bp->jumbo_max_len);
> +}

Why do

   gem_writel(bp, JML, min(bp->ctx->rx_buffer_size, bp->jumbo_max_len));
   // or
   gem_writel(bp, JML, min(bp->ctx->rx_buffer_size - NET_IP_ALIGN, bp->jumb=
o_max_len));

And not just

   gem_writel(bp, JML, bp->ctx->rx_buffer_size);
   // or
   gem_writel(bp, JML, bp->ctx->rx_buffer_size - NET_IP_ALIGN);

Asked another way: in what case can rx_buffer_size > jumbo_max_len? It
this can ever occur, it sounds like a bug. It makes no sense to have
buffers larger than the max jumbo length. If we fix it, then we can use
the simpler form.

(This is the same report as Sashiko: your min() picks jumbo_max_len only
for some really specific values of MTU.)

>  /* Configure the receive DMA engine
>   * - use the correct receive buffer size
>   * - set best burst length for DMA operations
> @@ -3286,6 +3298,13 @@ static void macb_configure_dma(struct macb *bp)
>  		netdev_dbg(bp->netdev, "Cadence configure DMA with 0x%08x\n",
>  			   dmacfg);
>  		gem_writel(bp, DMACFG, dmacfg);
> +
> +		/* Jumbo frames are always enabled, so limit their length to
> +		 * what fits in one RX buffer. Longer frames would otherwise be
> +		 * split across several descriptors and dropped by gem_rx().
> +		 */
> +		if ((bp->caps & MACB_CAPS_JUMBO) && bp->jumbo_max_len)
> +			gem_writel(bp, JML, gem_jumbo_max_len(bp));
>  	}
>  }
> =20
> @@ -3422,8 +3441,6 @@ static void macb_init_hw(struct macb *bp)
>  		config |=3D MACB_BIT(NBC);	/* No BroadCast */
>  	config |=3D macb_dbw(bp);
>  	macb_writel(bp, NCFGR, config);
> -	if ((bp->caps & MACB_CAPS_JUMBO) && bp->jumbo_max_len)
> -		gem_writel(bp, JML, bp->jumbo_max_len);
>  	bp->rx_frm_len_mask =3D MACB_RX_FRMLEN_MASK;
>  	if (bp->caps & MACB_CAPS_JUMBO)
>  		bp->rx_frm_len_mask =3D MACB_RX_JFRMLEN_MASK;

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

