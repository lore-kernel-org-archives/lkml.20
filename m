Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793855492;
	b=PYlf8iQjLJairi5EQbXQLEjK1JeOdhkN6uUDFHt7Ei1ZDNXFto2M+xVgkU/5r6plN629
	 s9y1VAXFqK3s5uwzonRwsCQKrq4kWdeAcQIar7m6vL71AWHxPIPn51uThSqVkC8CmJ9Az
	 g72crhnG5tJ+T/q/etKKk0Lx6wlER4brqIKBeQdd+I1hqECFEBcTRGgc2InFzH1Uxm9t5
	 Qn3+73kGGRsgwcAlZoMVEjB2UkKiazFriqLb6mvfomRExDs4qkqAdrD0hXEv4vtfuBS0K
	 7tlx4OBv9npjMmXtSAf+3jVjdkLAVtSxB+E0jRl2TS2N2Wnybjp6mV8qMmkD+yHCKKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=WH7hL3ikL27LTJMTaLrScaPWHm2vNQUEXqc1M9TWMAY=;
	b=vMQlX92IjMq6YmnnR//QcaXrUcB1dzzmYJusWQowyFAmsRzw3XleOQaquENB5JohiJUa
	 8Ge4uR+QQ+7G7ILBVW/meBhNFmXkI/h5mURBG+aApnjUjf+8vA9ZaXqYURTOpgkBjzhMu
	 bQc8LuaV9X8pSoLTwnqoJKiDnz93JtfXgHmvfgsY07lM3q/lZ5afxwrvEwTDgM/GW+3aE
	 9d7Xn4MPg3t38p95ash8xSX6sNycbkCaeyOzWC6ZhZ67HEYi4JtxMj5cEB1hTRRjPqg/j
	 HfEJ8vvyh0oQ1g2eoErr1Zd/6bHs6tKS+oaBqAU0DXfGv2CnpPCLf7b1FSoka8g7OoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UmZ8D7js;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DCD606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92DCD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UmZ8D7js
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so11623885e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793855490; x=1794460290; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WH7hL3ikL27LTJMTaLrScaPWHm2vNQUEXqc1M9TWMAY=;
        b=UmZ8D7jsg1S7iVlJ/7tn+VAUn266Q0IOld2nDF7FnvSG74oOUDLSsv5uHbQNZL6Lfl
         znzFUMGA2bO0Jc4QFuXnzhxehFPPnf4jXtN0SV1TCsWyn709uZLkXquX3RY3lI6l58H2
         nhV6iSTqYV6N6CUU9yH/E5kfIw7pT6QgJPlNoXcbHtGMVMIpf+B2f1edunAVPAfRLXMm
         lDoPK9RAKLfacXOJ17ybeic9zmyyGbAPZEjvMTekjNpmV/T6m/zCyJ852WHPyk7//2HH
         lh2E3FBQT9yd9LsDnsclt/PL1ZJ/Eso97GFrOXvc64/ZoI8cPyjyxix9/hVY+zefMSRJ
         o7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793855490; x=1794460290;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WH7hL3ikL27LTJMTaLrScaPWHm2vNQUEXqc1M9TWMAY=;
        b=m9fuPxCYByi6GAwRy2tez9l2YoYFemacdnZoH4WsPN6DygnolqS2InnPInRyBSr1ji
         RbKf1RpXQpIOGCq36QQLPofueSiJY6SWPGicuIIIaAbnuQkDj0LqkaBmjIIygBrk9jRV
         u43UX9fHvQQxDl8DnRghn3NbtuA/6iRlpEEwjGK9lSoiJ/pFygduQ+aXlyY4+tRKleMs
         W80F9vFCj2LbJxG1moYMlGDOkK5N+3PYS6s9CMmdKwOl1oXoBlgb4454co9pXxTFc57X
         XOuhv+G2HBKNG4BKhMJLfGxX7fMuYSTsmVTZNFtkTGUNCJYilrz3W/QyADUfuz7/ghAG
         06Ew==
X-Forwarded-Encrypted: i=1; AKwUvBytneOQWmunmCSsmBfhAnV+pxmaS3m5l3YV8KZxIMHEOIwMQQpQhz26cYyW3ytXQjL8ke5ZCQoYxWuMIpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OIGb8qid8s+0FI524Ass+BBeeGMcWagaz3neVvM8oSs5E1woj
	FqEMjaKm7cblZttuKyrb3p0lChwglb+/xZeubPP7+nsXDqkDFWlCRcAP
X-Gm-Gg: AYBFou1JW05EEM9Ij42PK8MdStXcKFLYp3u5kopLH4qQPJPkKUWUp8eH9cYv75UESEr
	HWkZoNOnRXWnHWhgBvg+uukOts8lfavsqT4ekcSpmCTr+pLpXN9Wo9O9sJrAN07zr42mpwissex
	LTPrAymHFmplII2TEXKn0r7AZviXOxMmsi+ZdCfznwVy3pwFr489Ae9J6caswOT+VGgzQcjU/Ye
	bTij1Q16WykT4I6DSfbEyMt7y95X/m3RQhNhGjDDU71w6VmLlEJPY0gFpsw8rjm7Myo/xwxCg/M
	sP4/QaYe1FpWL7tH9oH+PPIx3qJrpH03v0ayyTwSTsSwsUW9nfOTw/w+ChEb7WUWb38zspwzVh0
	lJu1WwYOy5xNHAUsdlmjc6T5j0Aa30Ww5x23yKjxMkzAAS1Xv/QGAJXluKJB2LoXtdHx6e2qzHN
	vVB4gWmjAfe1hY6rcnHJaKEfj868XuYIfLYNtcYKoDGs6pebEI+RGixz6t33LGmfWpL3K8on+MD
	/WywYVUgj+esyXoBI1fIi/psoO6uYzRTEWffcFn6egJPfgPKAeRFfAWjZqbOD9+a0F+0afRPbAE
	HejmZpb0MRFhjeydWQmbXFow7+uixJeh5I1CrurEDWGOxHHZ8rYwzs6VoP1mR4yih73sZNsJ4RQ
	GWM7EEYYbSID6jTYHo8BqfZ4W1W+sXs9YaXfl6dvXW5yQ7k5oYlO+pT2XuS4w8dbwYg==
X-Received: by 2002:a05:600c:1f96:b0:4a2:1a:a129 with SMTP id 5b1f17b1804b1-4ac185bd363mr397491995e9.35.1793855489741;
        Wed, 04 Nov 2026 21:11:29 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725fb0d1sm34508935e9.8.2026.11.04.21.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:11:29 -0800 (PST)
Date: Thu, 5 Nov 2026 08:11:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Albu Victor-Marian <albu.victor.m@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: dim2: add missing Return: documentation
Message-ID: <auwP_WprHG99Nv1z@stanley.mountain>
References: <20261104205108.1041666-1-albu.victor.m@gmail.com>
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
In-Reply-To: <20261104205108.1041666-1-albu.victor.m@gmail.com>

On Wed, Nov 04, 2026 at 10:51:08PM +0200, Albu Victor-Marian wrote:
> Add missing Return: descriptions to functions in dim2.c. 
> 
> Signed-off-by: Albu Victor-Marian <albu.victor.m@gmail.com>
> ---
>  drivers/staging/most/dim2/dim2.c | 30 ++++++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
> index 0e2512d166329..7ed38d5d93f05 100644
> --- a/drivers/staging/most/dim2/dim2.c
> +++ b/drivers/staging/most/dim2/dim2.c
> @@ -156,6 +156,10 @@ void dimcb_on_error(u8 error_id, const char *error_message)
>   * @hdm_ch: channel specific data
>   *
>   * Transfer a buffer from pending_list if the channel is ready
> + *
> + * Return: 0 on success, -EINVAL if hdm_ch is not initialized, -EAGAIN if hdm_ch pending_list is
> + * empty, dim_channel is not ready or there is not enough DBR space, -EFAULT if first MBO bus
> + * address is 0 or dim_channel fails to start

These line lengths are too long.

Normally we would just say 0 on success and negative error codes on
failure.  Spelling them all out like this will be hard to keep in sync
 with the code.

regards,
dan carpenter

