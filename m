Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773538;
	b=a4VJhfe6Bjxii/0euAOQUl7yp0t2GTTaYuX319c9K2f7k7XAW2xX8++t5j0BiHIpTUub
	 N23L7IcmwEDHLNPqH1GEl2inleZIvv20eIHNW6hJk53QaSXvc+L7jK/4VqKODTAfHYr3K
	 uvtgopVwn+7zN26+kkSwz5o3SuatiTpo70M1G8kRRl/l02wKT4sccQSYjiT7B+yRX+mYg
	 qAKhVwlNuAP8E8bijc7BkNQvBIhq6UImPJ1C4g6P2qnSFCSsbcYPqosjspiICm/JWhlUk
	 Rl4zrffM9rc1/YTJSxIbGWwtk2kO3Kv+uo9RD40MH7AOzMQTX+NZncQPG2y63nr3NZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6Bro8ntEtQu6vWViYeKCn76sAWO+684KhhtMVx+kfV0=;
	b=F+otgRI58Jp//j1I2B+sC6+lStBvIQNHNR3BrzWmTnlGA9pIIB9qPgtirDBzr9M0XRlF
	 QzuNhdoX5KmxtYWuzrlS+LNawDC4pfInd/YzpA+C+0fSOgIfQ9ZC6fPhD+la8Pjrhoq3H
	 agqX9URfzd24bRVJg1S5CNtoxiAFpq+Gu4dZkw+cJ9cGyRW1DRjh8g0YZsFP5h27RC/nS
	 NEfGGDU8N81MetHjkxrJvNsPtJtyX3vKzLY7PgCfQpFsUBK1FEoUHbdul2Y+QzMVJRd8T
	 DKlz9rJepqGOM8BNeIz13WxsYH+vw8IBwspbqegoRl7LIsuBPd3nENPEAHA6XeVa5HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TQal1hNR;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6273E606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6273E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TQal1hNR
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso152497a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793773538; x=1794378338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Bro8ntEtQu6vWViYeKCn76sAWO+684KhhtMVx+kfV0=;
        b=TQal1hNR+hyBkIra71sM3lO9IN4+z7XvE72XGbDcv0VAhbjZQJI+mpfau6p7BL5FtZ
         iDl09A8oHw7o/mnCJjKjeiYCmTW8NHeqVrCkok0tgaCQhK5pOqYP2rdNsXSlU+bgqhUg
         wtXejGlXwXTOczlx5jxBwLGc5F4IYouER+eAKEIKZ6B4nqtTOD+GgdkLmsGzW2cr3WP2
         ZN610PP6yl80b1fwwbYWEw7JisvMp+Mn6opAI0G552JPaoTbhyhx7xNUmKko/zMpgBNQ
         uHTXbBizaFPzIaYThNLuvjjt34lKp4N2qe6/dWhcaiPYsTrKWd+F687ys+Rf+DHfezFF
         Hs1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793773538; x=1794378338;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Bro8ntEtQu6vWViYeKCn76sAWO+684KhhtMVx+kfV0=;
        b=R06qNqJpSoP9gMAMipjbG2GRhXrX/Vttix96bu8Q7i03xOPbOdRaOfWFp+S8Wqunso
         J3QX2NkjV0rTTxWl104V2ksSDSgUNpaURXkf1ZvqY9bgO9kS4uFvzLDm+dz5/1zrO4a2
         1QSiHrmtqdhacTh89bz2fzGCMZKG8S0TwelgITlwLio8QxkWtD30GlRVvmVOBHInEwaj
         vuk0x4NsRTYcCHEgQH/hdih0Ib86jaxuxfoz6rFUqHMs5L/0KZ9kCS29xba+HetJKCsy
         21A+aOnhhHLEoWGzAK9wD+gh07bpZy1ynxjWW2OyUaIbrgASLiHgTEmhFHAOq4OMo5I0
         +9JQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAOigm4hgPeNqHKG2GxfJM1zS9x63g0grcuUUdEnQ1U1uoR6ximFhmZo/c2BEtqMEzBrAay7z/B0u7Scc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2Onr1J1rPs5TYfrs5HYGUO6B1aj+5+tH8dZx28qeMrhhYjzgT
	cnX39G+/0UFgZ4ek4FagV/x11zKG7zwhpYk0mNSxfsqa2L9/0mrO9Jv4
X-Gm-Gg: AYBFou1oRAaoOuIAWU8rVKVnoNJ8mJdqQkuebQt7g/k0nvtmF7pkaXEAs5ptQNbLwL6
	fEEgv+nVV+7yaTiTBVByASeq9OUeFliWtFKzR8BdaAWoTpTn9lAUwoRo9BQa6zeH5DKybtYwpR0
	iCiDAutKc7+V3YRJdqo60HOkVE3Xiq42tytOVymWA4Ul8rA/VBRZRKrp0aANB4qO1ZPtdjqqeF6
	hmxUNSgGvpfyGqYqPnBo177Oo/nmdkuIXppfxkezdTvoPkBkwhrF/W7WHJTAZHLRMLdGVpwtN4t
	EqwYBG4PCjmmWAa9X2JveEdE0SCVGmhHu9bv4QQVxBr0g9ZauW8jrT6KfriEDKEF3UEcKspbxK0
	O4eteDDIjR2W0NDb84WRvIeZlTzrYft0STDaVONqp/caFicui44gQvdTtjQkCPJ08EtoDxsLUQB
	eLHPLF8o38jHPfOP+DB1RDfX9pI5TtYvpz0TgDKunJxj6FRdxyfLGeLvUDjgop2GT910P8jjKoM
	PcHfAPCCSZn4npezsdhmRzODLGcwJOLCVprOhbwocJsAnjB5oAi3OJMgCL7nYLa8Sy5cFURO1Of
	MPzmyjJ4HAEQra2bOe0qSQp/VTzXBjsM5P1/DYm68yXszoqLMg/C1MI53JOyGV37W1XQpakUnlf
	2YV6JzyrADAcdCQ==
X-Received: by 2002:a17:90b:4a8f:b0:3ab:413:49b6 with SMTP id 98e67ed59e1d1-3ae89787ee3mr12721065a91.41.1793773537530;
        Tue, 03 Nov 2026 22:25:37 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0944ea360sm2741863a91.14.2026.11.03.22.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:25:36 -0800 (PST)
Date: Tue, 3 Nov 2026 22:25:33 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Guanglei Zhu <zhugl3@xiaopeng.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	liuc63@xiaopeng.com, stable@vger.kernel.org
Subject: Re: [PATCH v2] Input: lpc32xx-keys - reject matrices bigger than the
 hardware has
Message-ID: <aurPvymSFACa_kXH@google.com>
References: <auos7TgVNv7EWnbj@google.com>
 <20261104030709.791761-1-zhugl3@xiaopeng.com>
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
In-Reply-To: <20261104030709.791761-1-zhugl3@xiaopeng.com>

On Wed, Nov 04, 2026 at 11:07:09AM +0800, Guanglei Zhu wrote:
> The scanner state array holds the last state of eight matrix
> columns, and the interrupt handler walks the matrix size that the
> device tree declared:
> 
> 	u8 lastkeystates[8];
> 	...
> 	for (i = 0; i < kscandat->matrix_sz; i++)
> 		lpc32xx_mod_states(kscandat, i);
> 
> The probe path only checks that rows and columns match; the
> hardware supports square matrices from 1x1 up to 8x8, but nothing
> stops a device tree from declaring more, which makes the state
> array index run past the field into the rest of the driver data -
> including the keymap pointer the same code dereferences.
> 
> Reject matrices larger than the hardware supports.
> 
> Fixes: 69690bec400e ("Input: add support for key scan interface of the LPC32xx SoC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guanglei Zhu <zhugl3@xiaopeng.com>
> ---
> v2: use LPC32XX_MAX_MATRIX_SIZE for the state array and the new
>     check instead of a literal 8, per review.
> 
>  drivers/input/keyboard/lpc32xx-keys.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/lpc32xx-keys.c b/drivers/input/keyboard/lpc32xx-keys.c
> index 2392e7e..429a3eb 100644
> --- a/drivers/input/keyboard/lpc32xx-keys.c
> +++ b/drivers/input/keyboard/lpc32xx-keys.c
> @@ -65,7 +65,7 @@ struct lpc32xx_kscan_drv {
>  	unsigned int row_shift;
>  	unsigned short *keymap;	/* Pointer to key map for the scan matrix */
>  
> -	u8 lastkeystates[8];
> +	u8 lastkeystates[LPC32XX_MAX_MATRIX_SIZE];

Compiling this would be helpful...

>  };
>  
>  static void lpc32xx_mod_states(struct lpc32xx_kscan_drv *kscandat, int col)
> @@ -141,6 +141,12 @@ static int lpc32xx_parse_dt(struct device *dev,
>  		dev_err(dev, "rows and columns must be equal!\n");
>  		return -EINVAL;
>  	}
> +	if (rows > LPC32XX_MAX_MATRIX_SIZE) {
> +		dev_err(dev, "rows and columns must be at most %d!\n",
> +			LPC32XX_MAX_MATRIX_SIZE);
> +		return -EINVAL;
> +	}
> +
>  
>  	kscandat->matrix_sz = rows;
>  	kscandat->row_shift = get_count_order(columns);

-- 
Dmitry
