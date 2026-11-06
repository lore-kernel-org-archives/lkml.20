Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986624;
	b=aYSWxRymHi5k8x7XsqSvSQktZ+vgUJIZsKpXeYHvuUCBybRi1j54IEQuxisx6NcX2m9Q
	 brJlo7rEBKYUVvTJKX9iKfbX+VcIvU0hxO3WJAvZuF0MjOAs+wla2YjPp1G/P1Iod8Vgh
	 gY7waxykLPkoAcuWh9fDXQI3cDM+mU0V5bEwZ2k3hCt2IA1VEK/b9i4m7RL/S5Hy96Ldg
	 N9ZVI/i00E1erJwZQcpUX3XqoAxEKZ32BiqY2pxguhgV8UbRfgvanVqz6KbFWH6f7alcA
	 CbL42+rrdYZB9upZzsODV1nCi03wQ0zrcCN6rqfbLXlQRHVs7OJc9jjXg2J4nw7X1Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5bCjFCftZY+2sQA45xJDozhTjhcUphJevAvIJETfdPY=;
	b=CXh6VsmhF7Tw55TNlYHQ7NNuXgnm1maeC3ovOOH+ITpgK42sy3RaXB1JLijjodmuyMdZ
	 JUGRHwU2HLlrA/HwbHrbfXI2a80fnFk93Z0cWb29ikvOP+x6RSIr+J2GzMMVNS7Yy9VpQ
	 JOTOP0QrllQ57fnuer++vXssmXKrBG6WtVGOROa81ZY22uvSIUHxhlDTc97j0rAxcI090
	 K2V8DBl+CYcHxcKymely78nnSpLAtQiR4zebuXUXI06ENRht3+2AzEU6EwzrEQk2XwLJ5
	 +oEMgWd8W/AUuhJlUTev0ThYHuXnGuRC2e9itrwF+h2u2B6PdhkDdFpiBoPaXL//G/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ncubXofL;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9537606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9537606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ncubXofL
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so565090a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793986623; x=1794591423; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5bCjFCftZY+2sQA45xJDozhTjhcUphJevAvIJETfdPY=;
        b=ncubXofLpiA0x6STkrCaCodfzBpBsbyhIUCMKNiTmOtnlNrL0bt5hLRYEeMt4CxwQN
         LjZCs4CB7KiYhuZl4jWzyp6tpfuEqfIHL64au3kYvAsJglY2bYlaU3UA6Z7uQ8c7X5Ry
         /BF54dVhGkKw3UOQGhVFKsBNzZ5x9toSqcXi+O/jy3qrzh9QRsr1fnUp/E9Th4h95RNZ
         qil1lIy9FrHndIaOpY2ZX9AW0PndYKMmf94wm9kztxaQOwweHj+h1QNNNfxiEQM42eGk
         dlSl+Q2zxSsxEnStg6q4sLkXnTS7k8rD1+lvFeuae0HG4tIHdxLhP+pmQq/OYD9KFrDb
         vPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986623; x=1794591423;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5bCjFCftZY+2sQA45xJDozhTjhcUphJevAvIJETfdPY=;
        b=JQcX7iysd1acGjKF1EgQV8EFM0St0LIRDam4bnLAm4AbzUgbTkTL8gFXkSLKXikVI0
         pz8SqRFT4eoKcVQ9y7sS/OJRh7FpFv6h7o2lzCzrZfpTiStMkMSHI0h1WUNBbAfWSiaj
         Iripu3O8fDDEAUXfwA3CKnkfmTSMpksJ5jjLJ4gNGoZlPOypKFYbtAHOyVzc2e0uHmDL
         eJRP6zHYYJub1iwgViLve2AH2SXvsHbLEkvDKudkcalqcdVG8R4BIbi3K/5Y3lRnxAqe
         57Cj/TUHWC1As5pMnzyHqbfDXNKRxQxHgL2Tl5RcdUy16dfxtCk+MHEyxyo/aGt8+ve5
         7ltw==
X-Forwarded-Encrypted: i=1; AL+hErHmCcBEf1rURNj/b9HopcresrOWdZgjpW1+4KuRZEKTphoek0Kt/NSFfuJk8VoMweI0T9nCew8lfjPWSJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mKFnHcwXgd0bbeLQTz5BZ8pqGmy/udEHSLDtbdubGwx3PElfw
	S6V6Q9haw+UVQdmrud+kvP3rGWV1mrmE14T/tlisEcu6697Aeb3C758doCr3xw==
X-Gm-Gg: AYBFou1LO8FTj8QKRZ8bk578uZiBsndGLwZjDYpU9i77t9ZZ25E1ZRTs6sxhaeCunXI
	ie/7KC2lwfBw7krNiq3KBnKFG6XdXUhUOkswvJuik48goLij5BXwSpANxElaMxwQItewTNlVSse
	6zvy4OTLKQAZahJaaMM/z3D1y3UjYGvQ+IMrTEgsGte9j7DHITyHyK8Cl8zE1x30BhzGyY5VNBh
	U9Qc0y8MOrDKhPuK7psbMNwQPbgEer0q0RNyiW/kNb5/u6KrhvBX0erCTl5EbXkcHhrjaSz562i
	kCJZHDXEnOb+r63y8vVRuAAhSxc6qn+r/BsmDEeU+mR1WvhuZZkAoMIj7BG789BOt7aVRpakMdW
	zE6bm1VLDegVFdILIEqbLHw8UfR3jI5EZQvei4u7ByiW8BeH5kybVNk0tROMs0sKYYpdwjEQgmm
	I3319nJKbkZEjE7ONDe7UmR1mbOaG4IELhmQENx0imvTjpKGS29EEZ8KHPrckxCFelaw3Z4O6wr
	bglpsVZYdmVDaKJMmiguY91O4IUx0hrlxYU8AGEuCmtMWS6ewbTWhZzyJ8kZTVlX3QebaQMJdCi
	96r96ofrxZIoJZ+/EGcZmwyvJ7wIWEC7hZxEWK9eM2E63jaNbTPvVahjpKMmI/+GZqb6
X-Received: by 2002:a17:90b:5410:b0:3ab:5832:727d with SMTP id 98e67ed59e1d1-3b0db6e7fa8mr3207259a91.35.1793986623300;
        Fri, 06 Nov 2026 09:37:03 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0f76ff45fsm983355a91.17.2026.11.06.09.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:37:00 -0800 (PST)
Date: Fri, 6 Nov 2026 09:36:57 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Liu Chao <liuc63@xiaopeng.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Juergen Borleis <jbe@pengutronix.de>, Denis Carikli <denis@eukrea.com>, Lee Jones <lee@kernel.org>, 
	fangxy@xiaopeng.com, linux-input@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] Input: mx25-tcq - clamp the FIFO sample count to the
 buffer size
Message-ID: <au4Pt9K9145wF2r_@google.com>
References: <20261106075127.3105907-1-liuc63@xiaopeng.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106075127.3105907-1-liuc63@xiaopeng.com>

Hi Liu,

On Fri, Nov 06, 2026 at 03:51:27PM +0800, Liu Chao wrote:
> MX25_ADCQ_SR_FDN() reports up to 31 pending samples.  The IRQ thread
> aligns the count down to a multiple of the sample count but never
> bounds it by the size of sample_buf, so a FIFO backlog larger than
> TSC_MAX_SAMPLES overruns the stack buffer.
> 
> Clamp the count before the alignment so that the result stays a
> multiple of sample_count.
> 
> Fixes: 4f7ed234f2a5 ("Input: touchscreen: Add imx25 TCQ driver")
> Cc: stable@vger.kernel.org

This is a platform device, not something that can be randomly connected.
SO barring silicon issues the condition should never happen. I do not
think this makes sense to backport this.

> Signed-off-by: Liu Chao <liuc63@xiaopeng.com>
> ---
>  drivers/input/touchscreen/fsl-imx25-tcq.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/touchscreen/fsl-imx25-tcq.c b/drivers/input/touchscreen/fsl-imx25-tcq.c
> index ff270b3b8572..fa8d8b736723 100644
> --- a/drivers/input/touchscreen/fsl-imx25-tcq.c
> +++ b/drivers/input/touchscreen/fsl-imx25-tcq.c
> @@ -319,6 +319,7 @@ static irqreturn_t mx25_tcq_irq_thread(int irq, void *dev_id)
>  	 */
>  	regmap_read(priv->regs, MX25_ADCQ_SR, &stats);
>  	samples = MX25_ADCQ_SR_FDN(stats);
> +	samples = min_t(unsigned int, samples, TSC_MAX_SAMPLES);

Why is it valid to clamp instead of refusing invalid data?

>  	samples -= samples % priv->sample_count;
>  
>  	if (!samples)

Thanks.

-- 
Dmitry
