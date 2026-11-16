Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851975;
	b=baMDguVrgZ0lk4RTtGq1AWLLnrUleBkJtYMUfWQBeTUcjEU2z/l665QW1cYEG67atVGT
	 c7tUnKC02IYWlZyGolXM4J7hBdRZiN8tSEAHJKMxftA/OTn0P4SOIQpRJSXoqIqaQlm8k
	 dvFVgYB31ZLMhUzkHPrJfUTqxcuKlvvUMSQcvBnxVnLx6pyMO0vawFWweuO8r+JLElGEg
	 FIDzayxa+LprN0XxwWzSmZQnumBKQBik2cufiz30yMjCHCRAf8xMgRiC0L2ezIB4xrBuM
	 wK2HV1BPSaeQ35THlJJBpmqLN9F1k78NIlGtcMRlmt6DD8P6tKdLOp0M+ucpv/09vWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+nvE593UQ9d0U2IPo3a1ExhnUFrCrkM14breEsOZj/U=;
	b=eWZH0RbmaeDFsCRlRf1udRSKMZBedRo+65vrlBEY5gFUDuUD2QIEDxDHlW/fZDNoKA1g
	 cR6u5bcLqe1TN8G/WcAq1x/LoTMqSRdHVUeyyu6RQRJK17rKR5CdqzpGLbuQdXfzi4zvm
	 RuEyFRtM3B6z35hW0l049USFx0zneOD6S8uB0UbrpUw+lkQcYKc2p8XW7ySzE6ODQ+RnW
	 NnGh0vCXWOV6CAEBZ+XYTlzKwb7zvNyAyb8cC4AIjVey6tKu5Ge4niP+PN8TcEhrR621l
	 RgvQVM6wrkHFLs+kzS6HL56oh8qrWZ7GKv9yaBaw3WRCw4GIrLADZ7ILUSSFbGsnB8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tUGhZBRQ;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A1D606A336
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3A1D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tUGhZBRQ
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso862475e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851973; x=1795456773; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+nvE593UQ9d0U2IPo3a1ExhnUFrCrkM14breEsOZj/U=;
        b=tUGhZBRQZ0lPiurakct8TUDeJCPJwiKNmIgg2g/8DtVBDzVQERlreUcHlb2e73VL1+
         BpVMRbdh6Zwu/OaPuoEyYeuaJWsRqfAztKK6tmEwC51Qa+g0WzfNa+L4zs8s7xc58Yqa
         g6vb/aU20b86L4c88uA+mzwEeKNAjmQx5xlqNJAQeD6Q0eB+ntYHiYWMTUS+fUDXWlNP
         PGaVITVZgITbxk9Tu4dZaf2e1eBJIVK5mMvVx/QmerATJ5dqXyWtvjqwPjaa2p4J5X9K
         kHusHaMDMztT9Dj05Xck3P5pAK+aFlRvhVmnveaMZQHGmhNdO7UqRVojyfKHALpJ1VkA
         pcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851973; x=1795456773;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+nvE593UQ9d0U2IPo3a1ExhnUFrCrkM14breEsOZj/U=;
        b=IHCFxL3WsBc7hCn7EJ0An/ahEORuBRqo2vfjpEZf4ZAtgiscANx7cBMyb3n+439kGn
         a+xTD89LT3lxmo66zjX++22h+OaQRdeKcepvF9biwuDdylcc5TUbcdoiurxqc2LTvAfz
         cmNp8fSpOoCw6NpzBzSjy+wW2j9qCfpKQGvSEoWhTlHhY/KuVXC8v1zABTHcwIzfa7EB
         r9MQj7AtQtYXWbEd1N0R1cu8mW9L3MNMcpVXWpCb/qPSBsdxwV+2QvzI2wwjkPAcVkAc
         7v9+D+P4s300AsEmuA/5T9hNOvXmreVE1D9qFuCL6DhUtOlOH50FekpbSLL4FgwHCKLF
         VmqQ==
X-Forwarded-Encrypted: i=1; AL+hErHATvwSxs09YwP1a4R0GhkjJCudtFe3zIKVsPbY3dT+dj4Mv3I5XiUpRhBgy4S1vn5D2Oa34E7kljPeFBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sXe1rSmXpyB/pJnQg2ttLGWvwN6G6ohas3N66pTzmenGXOwFx
	i9Qsbd7odZdQukqx2/bCgq0QfgEhSEvYQBL/zfE4bq/bgNwhhfigKu1A
X-Gm-Gg: AYBFou1cJRFw8VVxboKkOo9WHpLeRBAMHMj5yoRlOPIE2NZy30pgtrf6asCkiCxKAKs
	dU7MD+UotqH9QIbCRBI4tnHtq9fF8jVnZSw5eTsoKq9HUIFjnI19DiC+2Sqg4WRRFHzzjqFu3bn
	KFxABH6qdGxqL1MVs6nprv2eTLKsrElwk0k0dgcUCRYzonhyaxMKtnz3XLKQci913esrR8p3fHo
	1dj4NOIguScuUnE2L48nQ46Bq2YARcGqMzdovEfP3hGpFWf4MIjE9YJgOHrDCeMitfFihkefNWP
	mj04uUiB9ku0Xa4agtJORuJ0LpCW8+hJ14JX6asLYEC/KSw64M4ESX5lca3Yh7wDPh+5qiGQJvZ
	HevFsRAC4e91spWj019BK3MM91u2ZsAR6QxVQug9w9W1RXL+KqZg4qrAj2JsUcta7pNNtPYZat8
	+IXucAOfQVAuRpnhEwoVlLYRQR6gdREMGui3h7i1DVEtEyQqYY9RLTtxJf5qpc19livQtekXFfq
	R3UEAESEUtyx/0fPMCM9HiGbpa9LUzsGyhDuRVIk8HHngqoFJ4ncYAEjZ7iS9XkS5Rk
X-Received: by 2002:a05:600c:678a:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4bb78372a20mr8533235e9.2.1794851972940;
        Mon, 16 Nov 2026 09:59:32 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72::cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm22431108f8f.21.2026.11.16.09.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:59:32 -0800 (PST)
Date: Mon, 16 Nov 2026 18:59:30 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, mehmet.fide@screeningeagle.com
Subject: Re: [PATCH] i2c: imx: acknowledge the count byte of an atomic block
 read
Message-ID: <avtEgpw9YpIzCj5p@eichest-laptop>
References: <20261116122707.1349139-1-mehmet.fide@gmail.com>
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
In-Reply-To: <20261116122707.1349139-1-mehmet.fide@gmail.com>

On Mon, Nov 16, 2026 at 01:27:06PM +0100, Mehmet Fide wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
> 
> i2c_smbus_xfer_emulated() sends the read message of an SMBus block read
> with a length of 1 and I2C_M_RECV_LEN. i2c_imx_prepare_read() clears
> I2CR_TXAK only for a message longer than one byte, so the atomic read
> does not acknowledge the count byte. The target stops sending, the rest
> of the block is read as 0xff and the transfer reports success.
> 
> The test for I2C_M_RECV_LEN was dropped when the read was split into
> i2c_imx_prepare_read() and its callers. Commit a5d0b9e32745 ("i2c: imx:
> fix emulated smbus block read") added it back to the interrupt driven
> read only. The DMA read never gets an I2C_M_RECV_LEN message.
> 
> Fixes: b460b15b3cc2 ("i2c: imx: separate atomic, dma and non-dma use case")
> Cc: stable@vger.kernel.org # v6.13+
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> ---
> 
> Notes:
>     Reported by the Sashiko review of "i2c: imx: test the block read flag of
>     the message that is read":
>     https://sashiko.dev/#/bug/linux-09e3015b-fc03-4410-809b-82964cdfac9c
>     
>     Tested on a Colibri VF50 on the Iris carrier, kernel at this base, with
>     the M41T0 RTC at 0x68. The core takes the atomic path only after
>     SYSTEM_RUNNING, so a test-only hook called xfer_atomic() with interrupts
>     disabled, with the two messages that i2c_smbus_xfer_emulated() builds
>     for a block read. Register 0x04 (0x13) as count byte: without the patch
>     0x13 and then 0xff (50 of 50, return 2); with it the next registers,
>     the same bytes as the interrupt driven read (50 of 50). With a count
>     byte of 1 (register 0x05): 01 ff before, 01 01 after (50 of 50 each).
> 
>  drivers/i2c/busses/i2c-imx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index ccf08cd63151..1a3fc245d6ba 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1283,7 +1283,7 @@ static int i2c_imx_prepare_read(struct imx_i2c_struct *i2c_imx,
>  	 * Reset the I2CR_TXAK flag initially for SMBus block read since the
>  	 * length is unknown
>  	 */
> -	if (msgs->len - 1)
> +	if ((msgs->len - 1) || (msgs->flags & I2C_M_RECV_LEN))
>  		temp &= ~I2CR_TXAK;
>  	if (use_dma)
>  		temp |= I2CR_DMAEN;
> 
> base-commit: 25e7ab89f4774b0f842cee0e8a20c11f755924d5
> -- 
> 2.56.0

Thanks for the fix.

Reviewed-by: Stefan Eichenberger <eichest@gmail.com>
