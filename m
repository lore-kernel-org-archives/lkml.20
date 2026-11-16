Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853505;
	b=hedd1JXYnfY1NHRID9Sqq00hPOYEMbTD1+y+Cq/N+ex+z9YbiJWtyt5IpnTC0TGIf06w
	 eRKK3S/IMW6kU65KPqg6mqKdAX00d4sdgIiNaSzlo95Eljj41tq7pZ6mXNVVekrhbsiwU
	 eXzX25yiIPwQHB9fqhMpvnvNDvyb451ADKzrjsufpfPfnhcAmDmS7sjj3fbjQhxc+xnhI
	 f0Xj4M/WqAXXScCzGa5T7NMZVI7qRW8mrlJFFWPYuOzjtLazuBWL/k/fcyQiitdHiCYAL
	 IBuDXKSTB8S9DgrLd1/F0WDE28FzvW2yAO0iI5YpDemP7nVIYUvgUcDi3Iu0/fPh1zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EjsiR+6jJ8ZmBsAFEuHSjNRWBiCgBYf83KNABOGKFps=;
	b=gn6PBLf7DkZQpNSm46gIp0zjt5FOI0Yo+7F+8eLB1HCsP25oIAhZAGlV8yGL+9Go4M6t
	 Rr124XjG05QRmFbJb90vOzn4yR0XFhwo2M4PtRpz3syJNyCmrHC9PPAhe/LpXbQDJvBLo
	 L9SjJ1regNu9+pLLVJm1dBhMSe6S5ug7V9Jle7o16vG5YnYFSIcwIiMP3RnKcDv1a/wLQ
	 YDYMOLQbluBnGBGrg17PlnYah5qLqAkOB7QVCFk/SOLolnekClL+prTVU5O1UcjuHpery
	 VhkKlgipNs9HEHY9fOMaXn5LmHW0/GnwIcT/HZoHVw/MEWh79tuPKo3enaQxFBLlo0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYqOEUaK;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D8F606A883
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45D8F606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYqOEUaK
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so40168885e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853504; x=1795458304; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EjsiR+6jJ8ZmBsAFEuHSjNRWBiCgBYf83KNABOGKFps=;
        b=qYqOEUaKJRV7446e0GWlQe5+nEhOjPwdq5MvPNwV1sDStwSf7ZmtKGr60xLfRSIhFZ
         +bzoWZM2qhldUVqEJy0AkE0Ud8uvJOtmcpoqo2N4ncg4+W6JbWrKJjK8PYQAPSQkNJpq
         7Q/8M57MyjIpbxTpt+YoAvFxHPGVHYH0NAAN0LdaVRwAgCqHUT8Awm7mmVvGZrygOetl
         zVN+9EruqLrdhENAA1XrXytjrpCaOAeqUgDgQt6zlWRNTkBu5utOPKt1pNizJsz44JGV
         Ud8Ps1h6R75EDAzc9y2B94EN3SZbGoDwhTYIHdjGk2JQXJ3LXKZ7F7+XVKYpbQqhTJsY
         PgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853504; x=1795458304;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EjsiR+6jJ8ZmBsAFEuHSjNRWBiCgBYf83KNABOGKFps=;
        b=Qvi7qgztUuUzJC1/US21ncwhu7yJPTURKQuRDAqsOEr4Gryv7Ipyj+06PJ97x2cta6
         bKjw31aK7LJKnSPpK3XYPxuKWzU7Nn1Ba09v+xwdLFrN9sKnYEXsS9tL6XaSYjIQRefG
         LXQisPfWYGeVXgQOzaCNE2wVsgnhCkFxZEuBHLqrxtUvuSDjq1xH1cWdg9/t2UfXL+js
         /z+Rs981QFmon5iMGoVkmyxv4c7EXy3eymnpLP317YXLAQ2u9pn0gtu7KHQwQu9SL7R1
         pl+JpL3reD2g1TEJLL7hEr67+m6kayz91XJvD0C+7sx3aFezzZU5DKTb+ejdPfcKHHQa
         FRRA==
X-Forwarded-Encrypted: i=1; AL+hErELR6Jufw9yVn4dOKCMPNqZGXm+IGOGsT9cBrHO4UBhwZCGKSkHTMenPuRCB/Uyt/mvDHBuXgsCZmDPxLg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9s6jjYja9KCiBx1IIIk5UkvklPPAzV3i9jDHys7+If+JQQ2NkW
	82vVNof9+F19LM/qNSmqkvAhoUxZa213fMgdpZYjiPXnaAgWLIBuK5u4
X-Gm-Gg: AYBFou1RM2uopOHmatUnCsOfmZhu/PG4qRFrsGmMUhw+iFZVtR23GNPVFl/gS3NiFfm
	Qiks7F5J40osZytuS6p7PtyO0OB67egcC1ThG79Fx/eSAixEFj7N17Hc5c/sfD8CSITSt6ZVCdr
	/t2q0vAfwKNLZWvvL34rD017MMkW/lFgIWTitD8zEHyJrGePJlcZunSrNu5BgQ+fHNsFiZPi7Qq
	EQA4ZRKmFb6eSXLPIaw2FP4Ha+toq3C6k9GaVGe7ILaM57jCKOpyiJV28Rn0FVI+a1Z33kuFv47
	NXbCq8XTIlohutpEYa/w5uYsxo9d3q1/Zy29TtNQQxgeUtDODXHmFneDATtFzxrAXLsp2xOI71f
	RGt65zQ8e6yR4Ybsa2tduQFxh0MuG0jkzxoK/80ZRHBX1Vfy+rUDwISOAPHQg6gL88QA0bzSSPY
	7slfJQeDP9CWTVasOWVcYd3qH0i49nVpmrMSGywfqHdzIZEJjs8yblLD9wCYEvutjgdpzl5JV1u
	3W15+g9Mg3Qy6gYApwTmA8sIIM3j86TjQKFw4Nxdgt5rEqaiXWb0UBqX3sEPRPhC02w1NEItUjC
	h964o5Y=
X-Received: by 2002:a05:600c:34cf:b0:4bb:6a2d:b440 with SMTP id 5b1f17b1804b1-4bb6a2db5a1mr110927715e9.2.1794853503457;
        Mon, 16 Nov 2026 10:25:03 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72::cb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78430918sm5161735e9.13.2026.11.16.10.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:25:02 -0800 (PST)
Date: Mon, 16 Nov 2026 19:25:01 +0100
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
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH] i2c: imx: keep the error of a failed read
Message-ID: <avtKfW6vYmwl6D-s@eichest-laptop>
References: <20261116125940.1368194-1-mehmet.fide@gmail.com>
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
In-Reply-To: <20261116125940.1368194-1-mehmet.fide@gmail.com>

On Mon, Nov 16, 2026 at 01:59:40PM +0100, Mehmet Fide wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
> 
> When the count byte of an SMBus block read is larger than
> I2C_SMBUS_BLOCK_MAX, i2c_imx_isr_read_block_data_len() sets -EPROTO and
> fails the read. The read of I2DR that took the count byte has started
> the reception of one more byte, and its interrupt comes in while the
> state is IMX_I2C_STATE_FAILED. i2c_imx_master_isr() has no case for
> that state, so the default case replaces -EPROTO with -EINVAL.
> 
> Ignore interrupts in IMX_I2C_STATE_FAILED so that the first error is
> returned.
> 
> Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> ---
> 
> Notes:
>     Tested on a Colibri VF50 on the Iris carrier, kernel at this base plus
>     "i2c: imx: acknowledge the count byte of an atomic block read" and
>     "i2c: imx: do not acknowledge the last byte of a block read of one
>     byte", with the M41T0 RTC at 0x68. A test-only hook passed the messages
>     that i2c_smbus_xfer_emulated() builds for a block read to the adapter,
>     alone and followed by a one byte read. Register 0x03 (0xae) as count
>     byte: without the patch -EINVAL 40 of 40, and a print in the default
>     case showed state IMX_I2C_STATE_FAILED with -EPROTO each time; with it
>     -EPROTO 100 of 100, as the atomic read returns. Count bytes of 0, 1 and
>     0x13 read the same bytes as before, and the bus works after each
>     failed read.
> 
>  drivers/i2c/busses/i2c-imx.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index ccf08cd63151..c7fef98934d4 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1142,6 +1142,9 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
>  		wake_up(&i2c_imx->queue);
>  		break;
>  
> +	case IMX_I2C_STATE_FAILED:
> +		break;
> +
>  	default:
>  		i2c_imx->i2csr = status;
>  		i2c_imx->state = IMX_I2C_STATE_FAILED;
> 
> base-commit: 25e7ab89f4774b0f842cee0e8a20c11f755924d5
> -- 
> 2.56.0

Looks good as well, thanks.

Reviewed-by: Stefan Eichenberger <eichest@gmail.com>
