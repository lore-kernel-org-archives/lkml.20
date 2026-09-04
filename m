Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA2F37F01C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788490203; cv=none; b=bC97l0CTcYfQAiWWKHDgBFaI+I3tnkpKmh+98UA8YZjEfHwl1fqwOQxNWGQQToXUYRcMi/xvAesS7/E4SxNAZ7sE5nzaRJA9fcW5amudSYP2r0AHn8Moo+5nS3y22v6svqwN1ByNKLVGfwsBPXTbQsGVSvQpveJFMw845WoHKDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788490203; c=relaxed/simple;
	bh=3MvmmwZvg6iNS8mwVIF3MT/6jIAt9thoEh08Kl3QeSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NkMAXT93Q84y//Vl9+3C0zFJyV8Ivyu8Hfvf1TDlwFgBqlZeSifL0wV0FC4AYi/8nnPP7/zwYIP52TMtX/ZpoSIbnyEkIw6xFx7SdF31Y+i81b/lwAJcnZJXOze9UtByu0Gzd3DPPjJrpDHK4BgekH8zhs5idc7HeQI3AUwQvXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p+BSAFKZ; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p+BSAFKZ"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc149372c14so384843a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 19:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788490201; x=1789095001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PG96oKZZP2N6Xo9cvn741u/vr6DaKEDABY2UEKMrlX4=;
        b=p+BSAFKZoEMCJX3Et+074ZqcSeh6VnY0F6Dh1XF4ar6b1WRKTyJKjyhvxjzvwhWAZl
         0oeTfzKfaOtu52ZHQyCZWwHxxjEBToZTcRPBqou9hEtAGZV4T/otq1PpZQY9dVD1eu+I
         SrrecpSeXsur2rtKrDGt4MPBniXZBg/TeR8gFW+jSXwAF0Wy2FuOwLLOMB79MvJxVVnJ
         b1oWzM8aD+w/SAdDGoNjuf69PeWPQX9XyCkCQ8/u+xqBoAZ6rYi9FQqKWyTWaJZkVP/T
         T2KiN419nXrXdgk/cMOpUVJ0ozw2p9OYwNH6PbJgC/fOeWjw6vyQunIKDHMZ6MZKmUQF
         xxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788490201; x=1789095001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PG96oKZZP2N6Xo9cvn741u/vr6DaKEDABY2UEKMrlX4=;
        b=U7CUFqY1xOh8P6gsF2o21HmQIszLz09kEFpuMGO1LOGYT+JLlf4VELjznePBXF+cyx
         xQ+W9yjUJFwST0EAz+lIWQFI/nKQY5qNqh91g5ysJnVr2AwcsJaTPtqBQR96ih5jqI/D
         bR3vyBfKL72mrrIFJNkoCF0kEQdurcevmZ4Kyqny9va+Iic+bPNyCosn1B0crCqb4PKA
         2HTbeelVb80iu6ZAl5a8owlDAulsMHt3cpuoDXLFymi1hW4aklFMElcFYyUhGjI27zD+
         O6MF4/cxUsho1duDGWjX88+wYxCiNJqBDXsz6cn3XPhzqLs4rb9nA0rgSEpDBA5nLFNC
         FWug==
X-Forwarded-Encrypted: i=1; AKwUvBwE8HlMpPanwCbUyg3nusFGsb9LtdjgZOWgljnHU8zGAqsqzuKnflyCjFfbSXlL0c4tWWc5eGp9J3lZ2ak=@vger.kernel.org
X-Gm-Message-State: AFuF++llF2HQj+U1v9E+mfDKEUgNrfnpLPGyPUxIt+0wKdXAPqsxb9zn
	8fzVSIO79By/E5NPH+cgQZdmfU1HcvDjMZyhRI26c658q1aqlqK+pXmA
X-Gm-Gg: AYBFou25MMnpf5UNJh8nqe+s/Q0y3zB+OW4BK7Wr+WsSDHD/K2sB1rMYM1WvrqmVFyc
	8XFjESxoI311xBHaJS7O2QGVm0DCp2k7wKDskE2F5wAFsgHIUtRhDDVyJREaejX1/qzJtwBXAto
	3Y1QL1oDpUbpJ0U0ytgYJKgazKuuycOkDQr0JatCroP8i+qbN9n+S5K7AvvvxgCZV26boEZWi/9
	v2FhV9YmBX3E+aNb3C7NIjHBEe/u7ih7xtncSNwiaR9rc6M0OOOUQol/w9fwTYM67B23aU6DASA
	5dLL7cDC5WR1oWsZrP2jk5ne3DTe9CEqj/DyZtXgfdNEA+z6JC+WAXS6OWxVY8lXdNFg/KlrqmX
	Tg9JKkODty2U3aYY9b7waaQ7Ri8t8vdDfLzK6/j6JFU2Dfq+5sj+NeeWKpWTCHTyULraB2tQnVx
	AoJ5YGUIlDE/42oc6Ua9EY6zSxMLAdq9wdmH8MSrachgDrf4JtzRJ2bm/6SM2rstJoH/YQUcnWw
	9peA+7V1jiedIUP3GM=
X-Received: by 2002:a17:90b:4c86:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-39b25f78ab8mr4417800a91.0.1788490201512;
        Thu, 03 Sep 2026 19:50:01 -0700 (PDT)
Received: from kernel ([103.219.206.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm3762634eec.16.2026.09.03.19.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 19:50:01 -0700 (PDT)
Date: Fri, 4 Sep 2026 08:19:53 +0530
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: clabbe@baylibre.com, herbert@gondor.apana.org.au, davem@davemloft.net
Cc: skhan@linuxfoundation.org, me@brighamcampbell.com, jkoolstra@xs4all.nl,
	linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] crypto: amlogic: Fix IRQ handler return value and
 fallthrough logic
Message-ID: <apox0f2D6bYOYOnj@kernel>
References: <20260821151243.8125-1-raizudeen.kerneldev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821151243.8125-1-raizudeen.kerneldev@gmail.com>

On Fri, Aug 21, 2026 at 08:42:43PM +0530, Mohamad Raizudeen wrote:
> In irqreturn_t_meson_irq_handler(), when an interrupt matches a flow
> but the status register is empty, the driver prints an error but
> doesn't return. It falls through the loop and incorrectly prints an
> `unknown irq` message.
> 
> Fix this by returning IRQ_HANDLED immediately after the error print.
> 
> Additionally, the handler returns IRQ_HANDLED for genuinely unknown
> interrupts. This masks false interrupts and prevents the kernel from
> detecting interrupts. Return IRQ_NONE instead for unhandled
> interrupts.
> 
> Cc: stable@vger.kernel.org
> Fixes: 48fe583fe5417 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
> Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> ---
>  drivers/crypto/amlogic/amlogic-gxl-core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
> index 6cb33949915f..302b398405e2 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-core.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
> @@ -38,11 +38,12 @@ static irqreturn_t meson_irq_handler(int irq, void *data)
>  				return IRQ_HANDLED;
>  			}
>  			dev_err(mc->dev, "%s %d Got irq for flow %d but ctrl is empty\n", __func__, irq, flow);
> +			return IRQ_HANDLED; 
>  		}
>  	}
>  
>  	dev_err(mc->dev, "%s %d from unknown irq\n", __func__, irq);
> -	return IRQ_HANDLED;
> +	return IRQ_NONE;
>  }
>  
>  static struct meson_alg_template mc_algs[] = {
> -- 
> 2.53.0
>
Hi,

Just following up on this patch. Please let me know if you have any
feedback or if further changes are needed.

Thanks,
Mohamad Raizudeen
