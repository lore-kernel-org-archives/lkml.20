Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1151A4825D7
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 13:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206006; cv=none; b=RlHkGQEXC++F9lkbYhztfUhEJrQsHd9b32eS/PEQa3dCBk5YQ8T2g58u5zpS1sKvMd38CvTowQL5D5TBPjFrswYsB1yA76YG7rtf3HXy9HN+Z3qniFi/HQ9yHxdp5bfQgHD01FHuVY3tjhRI/IAA4L50N71EHwTBbWezvWCZ3RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206006; c=relaxed/simple;
	bh=oDmJt3EJtsL6dISeusSh5puteEMhnMpuxIlCFWUAi3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mHOdtsc1GFZnKEjzoxRS84GE85iiyL4K2iZh4s7bMQJf4BAbFaQLn4deo6DMUFzASvoB96Vw5ZkrVVmWKQt5VzFMwaOLtvcZZL6/Nk8e7y5LcQGV4WzGPem/nAudYxeHNE3khdWFPfKoNwjv004456pjF3a+zVVv/OROhkYGuI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ca7fatL3; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ca7fatL3"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49d05d51553so12577445e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 06:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791206003; x=1791810803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lUlOSe5A8lNERyF+m/EbmOxMTZ4XiY1F/mU41HusoYs=;
        b=ca7fatL35Cv054jFVqHdX1rQg57LW1v7nUCXKuhv2EHFSylCL9WYk9ARoTF7T3xWS2
         HcbLsRkEqmw9ixsjN9K9+TbQ54fAJ8rSU5e4GVoOPrq0aEy5xNKqbeMZKkYoI6hDiWqy
         f4EVyMH7LTBHQxpthc3YrT7FSLrZKAkFKVLlsyJvyQztBuMKOAemu7AQYShLyfswRzkl
         HPtWvjNfC35DhOL2jaJRbPIvWqZ6tKveUrDOIeWzxx5vPiwit7UgqzZhB2895TBqI9rA
         /mAAfB28J29y92RNNPwiiKGVIJ1j1tMb2rzMFqyBTg3rMFY+jI7BjIAzYcuyv+ZmZBWO
         ipwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791206003; x=1791810803;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lUlOSe5A8lNERyF+m/EbmOxMTZ4XiY1F/mU41HusoYs=;
        b=ZrL6cdqaepLLkRFY/doqepYw4i9Aeoj0en2mpT1zk1rE8nvycPpfHsb5JYjuzZ/bOD
         wF9f1yW+vc53RMwNh5bh2MvqxduvO5HVh1XZxv54t/78TwqUNzyXAWmgkd5VldCR6bOl
         1hhREMVUPoolm33t4aza4tpdMyZbw/YCwie7/EZV115PWxT85IQh2ioLrcAA3HJwwwL1
         xed/nnXmhe88J1NUcCLCA8kAjmavrZWnjdF3ovjDuiapVPaUwuSI7wOrdM5l68NG3ZfZ
         svOnAr+ZrvbL7su6uUbt/BqH/fugpi0RDsJc3b3aejCyLUgiOGV1sDU5X+kLNXaA8gij
         8EOg==
X-Forwarded-Encrypted: i=1; AKwUvByP8FtiqbOpCRqc2vRR7byuZlzpLUyazbYrGCca3fKOJeNnMTSSjLxxO1ELYBLakuUXpMS28HZv4HLhsXo=@vger.kernel.org
X-Gm-Message-State: AFuF++mS15R4Qntt/rs62s2mlcbpW4b51MECUatrEe7t6CbnrwO7BzDN
	pvIPj4xh7WuRN/xrPiaDEfPfCaF5RLHZ7ZBJuGdQUb8wiq4SQcYUgI+qis4kdA==
X-Gm-Gg: AYBFou2NIPLTVGU4ErpPpbGtnH8MP3plJAl8/Hj/EcdAeBPOBTqs7+tN+GJU8aCx3dj
	qOIGLdaoJhrvJ9zXJ7QgBld//Plupihbgok8N0Ss41LHZrztwrTJLJ3BMm1k/BEnY6sY2Jysx8s
	Z3rh2PZi1d0PXuK/tH6r0FgxRHfTWjPkUwbxLF5RpD1ttoa8iQ5CfoLw6kNSrZ8IGVvhom+s2XA
	0225LY/7IMJ6BtN1iVos1cnmDu7ERymCqDf/FrGqem7C14EZji+TcLvVgtaxWBwVxgY1IPy3pMj
	FuNUXn+DCbkCZtjHvpfBQy3/Z4Rsgk2/s0UvSYvEGjolwfILxilWDEZrA/X0XqWHNod1t1etlTo
	nKEb83sVtl1MvgK4J46nHONEvF4xb4Pzh1hRWuIRvMMx5ym15JP4JhE+l13WAsbOpH08NJn7AvO
	bxM3EGbFqkGxDMzpxqFwvpSAojblnbKf2SYJqgBJSkmlMFqq7fz3h4kmWvEjxcOzZToytLdLOfz
	BII79fMOVC0lssfj4T8/mFzxVuReDZ+ye+ha4k5+l9DOYEROvtZ1tLhF5kfSxf3FHepzWkAghEQ
	ELw4ICPE1mRB5qkJO5qYTsku2uy7DUouTygoHbo0B9cOiDzRHhQGdJV5GHlrQ7D7YCJW4MLWr6A
	yBHbVzUlTnFWCoZTL84ytuxkCnW5Lk4z+sONwNTl/rMK5l0ojANIRVEnD0Acp3O4l+GUOiOrs8j
	xvbTHz6w==
X-Received: by 2002:a05:600c:4705:b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-4a1680ffb88mr122325845e9.25.1791206003215;
        Mon, 05 Oct 2026 06:13:23 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027734b49sm343621165e9.10.2026.10.05.06.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 06:13:23 -0700 (PDT)
Date: Mon, 5 Oct 2026 15:13:17 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Conall O'Griofa <conall.ogriofa@amd.com>, <linux-iio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <git@amd.com>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v4 06/15] iio: adc: xilinx-xadc: Use
 guard()/scoped_guard() for spinlock locking
Message-ID: <20261005151317.00001df3@gmail.com>
In-Reply-To: <20261005094205.1045874-7-dileepkumar.nagavarapu@amd.com>
References: <20261005094205.1045874-1-dileepkumar.nagavarapu@amd.com>
	<20261005094205.1045874-7-dileepkumar.nagavarapu@amd.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 5 Oct 2026 15:11:56 +0530
Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com> wrote:

> Use guard() and scoped_guard() helpers for spinlock handling
> instead of spin_lock/spin_unlock sequences.
> 
> This removes the need for explicit spin_unlock()
> 
> No functional change intended.
> 
> Co-developed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
> ---

...

> @@ -677,15 +670,15 @@ static int xadc_trigger_set_state(struct iio_trigger *trigger, bool state)
>  		xadc->trigger = NULL;
>  	}
>  
> -	spin_lock_irqsave(&xadc->lock, flags);
> -	xadc_read_reg(xadc, XADC_AXI_REG_IPIER, &val);
> -	xadc_write_reg(xadc, XADC_AXI_REG_IPISR, XADC_AXI_INT_EOS);
> -	if (state)
> -		val |= XADC_AXI_INT_EOS;
> -	else
> -		val &= ~XADC_AXI_INT_EOS;
> -	xadc_write_reg(xadc, XADC_AXI_REG_IPIER, val);
> -	spin_unlock_irqrestore(&xadc->lock, flags);
> +	scoped_guard(spinlock_irqsave, &xadc->lock) {
> +		xadc_read_reg(xadc, XADC_AXI_REG_IPIER, &val);
> +		xadc_write_reg(xadc, XADC_AXI_REG_IPISR, XADC_AXI_INT_EOS);
> +		if (state)
> +			val |= XADC_AXI_INT_EOS;
> +		else
> +			val &= ~XADC_AXI_INT_EOS;
> +		xadc_write_reg(xadc, XADC_AXI_REG_IPIER, val);
> +	}
>  
>  err_out:
>  	mutex_unlock(&xadc->mutex);

Since you've moved the spinlocks to use guard, what about replacing
mutex_lock/unlock as well?

Otherwise this seems fine.

-- 
Kind regards,
Joshua Crofts
