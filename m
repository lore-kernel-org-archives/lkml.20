Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793079633;
	b=bkIu6PR86dwDg8sgIqLuLEqyCmGj20NgdM230lecmCpFV0w6fAByzrb4q+Sjy4pRu3uw
	 nZDQf/LI8ZykD/mgYjq9B3BIH07uBzgHTiXsPgNCa61hE1JIyYTdZnh8LvVWSpwrhS3H5
	 fuRHIjDGO71wMd1GKq8jiW1CZLg+QPLM0+xY/4yMB9T16wKiNU6D+7AfWWYNpiPMiPUzl
	 EbjySZ4mfY1Il6/OrZ0/Q2e6ryMANbdVjAoTgXsqwXpdXUEURjCfgvv3CzR0eIIUPaB1B
	 H2bPfMR9B39WIp7AUavLU5agDUQxKHviby0FrttXwlexvrLILR4DVjcnALbVV2cowEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793079633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7MtvTda9c8jDrNpv0a5ikKu9DGEM1JaWO2UAKaYBnKY=;
	b=xf68RoI4Hf35IQBPw/2zTZWUFJ1RURM7r6k0BKsb+bkd1zzTlSvLcnNZFAqO7ADRN80t
	 O9flU5o27FMAxNeoZUpR1Vrv2sc0dQpVk7qZ3HT93S8PSIpFU2Pqv0MVx6u/pLuuUx2SZ
	 0X5UcZU5o5mxIgXa94FsqDYVGZfLSOCMBHeLl+p6LyD9+njAuXIHoydqbEtwGxNa5oh5O
	 Id3m2k4fWpTDaN22DngYyG2LTawG+muo6GL5x7sB6RZatyOrvTJvlOEnWT00ur+mEX7Dk
	 jQunZ9H1GDeS+YQV7MNMWSr9391T/Nvg9N6uXpVWfoRusj3xcI+MIdYdJ4ydNTce80Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qNDKeJ6E;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2453606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2453606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qNDKeJ6E
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso2357897f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793079631; x=1793684431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7MtvTda9c8jDrNpv0a5ikKu9DGEM1JaWO2UAKaYBnKY=;
        b=qNDKeJ6EAHh1ox1z+OeiukJIQXKpgzItCUrRu4sxv9erfy0SgZlzslWGBIUDXf9txi
         2A6fw/VzaSlr4uAmdy17VvZH82y3jqNgfm38dgey8gpCYMiULlzMMkGY/cCwUC+SmILP
         7ufYTJvFCsk/uBT3vLT0sOH3jaU2+UBOpIlVc1h0HTjEwtnVRrCC+rLIGz/MVF8NzcHn
         SnH3ysjGxCs4JFIVNRnNDSeQK1iM9Kp0jlTVmOhdHkCPU2B8KnCj8aHdlNlfHo09bbjz
         +ElV3ll6O5sN8BzNzeidv1VixsUC2Nyu0pHzqlUX1UNIaFwgB1BeNA+ecqNAMusj06y4
         ijTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793079631; x=1793684431;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7MtvTda9c8jDrNpv0a5ikKu9DGEM1JaWO2UAKaYBnKY=;
        b=wU2q5ysU8rKq7bGWFf0IN4hC9eh6YRNpqNKEZ+pahUYq76hfPilQosGxuPqk2FkYM6
         1PgY25gJCpyYK98l1YZhhOOsDXK4ZWAEPJDqLLvXbKYHu0RvVvruToDRrWdyy//W+6b/
         jLpv00G1ZSzmkrZu7KrMUUlTqIJffHGx5WAGROoqJvuguVd8jV1aH47CXV7kaaP1Vd9A
         JGV1ZMSuEQ+MPkQvHASM9SY685XZEtvkoTxEi73qqUxpFQ5bRw9eWzhZ6/tJnL8qrgWp
         P/TMUxj/T2ueUuYrb0rf7dzkgl6AiPtO1bC2dlW4C1Wjv703oU/5UhE9pBK0oS9WiY7a
         BFKA==
X-Forwarded-Encrypted: i=1; AKwUvByLQsm8jeSxph6Iy+KTix+1+X4ODoriEM81yDsX8uRGFLVKOQAa08VHGXQh8CKLEcuz0XT5y6GpSAMHdxM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+yNVhEQDvkPBHIXAS3BbRZRbBVQVe9lnNIJJdQnKHRJaaIBVi
	cve7Qde4C607z2k3Xf4RWOeipA76GnmUQX1HyswWqMUqF+aN/xXSyPGB
X-Gm-Gg: AYBFou3tlEH823O6TcbVFTl/Fu+JAMBtSTGWhtB+X7sLbOL75lT6vve/tTurD/Ej/30
	pKHTOyyG5rKtU0IGeDWiAXVAoBL+kuVmz7Y9lqifgiZHUoiIRo8jGLx5EksWX/Vd6FUb5QWtsKB
	Q64e9rPvlVtGdo8eqRnBVTzjawFyX+t4zIvJMbQZqz6zTzIeUvxEA9QD1b21VSPlRBV2iW/YzV/
	NmOHehwisxd8lZXDcPAvAaSXkZu+P6CNlDtzZi2pqoqckq5glnvW4xi2QIkXEBTI1tpcb0Fj5hl
	zbNlbWHyngfcptFTRKobYHmMKPFqIbE2UwAPX75AcGzbVxNBsWXbDidiJ54BBI2JP3QUmRbIKRj
	jBnROSKevbttDShMIYb0glcs0XczSozzGzBuauVKkGNSHYaWw2DCV2I75kjmHPZSVmIk5nS3u3h
	aLUMWEQOOcU8OpF15RZGP1HKLnsjzDlTbcQO3l0Lz78YuiiogJeZcTaEvTvO4+rdV6HVrPnrqm/
	jCzUAFrb5iOAlt5y66Psp5eE+VQE9zfWIXuf09CPIuP4FppcPja
X-Received: by 2002:a05:6000:2c05:b0:48a:f8fb:cd49 with SMTP id ffacd0b85a97d-48e3eb88590mr17346250f8f.22.1793079631109;
        Mon, 26 Oct 2026 22:40:31 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3418sm18500026f8f.41.2026.10.26.22.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:40:30 -0700 (PDT)
Date: Tue, 27 Oct 2026 08:40:26 +0300
From: Dan Carpenter <error27@gmail.com>
To: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
Cc: dan.carpenter@linaro.org, hansg@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: Fix memory leak in
 atomisp_alloc_dis_coef_buf
Message-ID: <auA5SoRV1MDwHrw8@stanley.mountain>
References: <20261026175840.13979-1-sifat.yt.2.0c@gmail.com>
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
In-Reply-To: <20261026175840.13979-1-sifat.yt.2.0c@gmail.com>

On Mon, Oct 26, 2026 at 05:58:39PM +0000, Abdullah Mohammd Sifat wrote:
> Free the allocated dvs2_coeff memory if ia_css_dvs2_statistics_allocate
> 
> fails to prevent a memory leak in the error path.

Extra blank line is strange.

> 
> Signed-off-by: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
> ---

See my comments to the other thread.  This is a false positive.

regards,
dan carpenter

