Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793831298;
	b=MyGt/Bm6qujZG5CWsXNDJxmZemZ6rhyfq1sFmiRfTIXyxkiJ4p+BJ6U4M8cZkvzvcd1J
	 0wysHKwb567eW0WfkQHz8xYTq5Twf+nQMrv5Lh02/Uby1qmJz0JLz/jjZXdcVoAK02k1E
	 FD9r05UrprVoQGJKFxwGccJD1RM+ql2f5aG+Or9tzmilykfWN0jITQW0oJAeLOid4aiwr
	 qVi9T99bOf/i6nBVYq61d2Z/Rh2hoR+GkteyQVzOaRlz4d2wOmUyUg+8WMQelzQyP0Q/f
	 J5tBHNhHIuz4LLqEz9sv+wF894uLMNYTl/83VEzJVdXBn5rQ3Q6ivginf4qU9DQpNBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=rORPcwpKcsLoZavTsDXE5+1r14NtYgKold9FpGxIEUA=;
	b=278xJsu7yDVR1pnzBwivn9wbf3lpklXmAC1SsTB/chaEcSWLXJbGRkW/kq52KkR99uxa
	 Z0lDUnGn0/FQqWsqH1ZZMLnnWWqmkt53IMuiYySrTHq2wcWxhAaUq511qn/hcxJAVMbmD
	 kHb0kAF9eBwX+lsv1WTMF8rmDHsF1NSyn+rDxg2U5LKUfY1bi2sDdqLC2Q1BLCdua80/a
	 dwlTgs8yhndvVX2TlN5686zsXmVBPVFdFitsUBEu30Npv40V/mGjgs2nfSF63UdKwxIYh
	 hNNBRPeVvdjHjKLJqcHD9oi5EjzwqxayoM3bhSxiWjiDh2VU4ZhUpm1xF97l9Ke9KgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VFQQwjVQ;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC509606AC36
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC509606AC36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VFQQwjVQ
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so1381219c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793831297; x=1794436097; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rORPcwpKcsLoZavTsDXE5+1r14NtYgKold9FpGxIEUA=;
        b=VFQQwjVQRPQRUQLEKQZ0uCHBD6AiMJmbUbfvGwNX3j3vqFrcm5mawXNoYHM8TH+ZrU
         7YFcdbOBvMl/K1om4r2gP5o0e/DChYOrZcoomOZeQ/QhKS5sOv8AYNGdCQHifyG4DgCt
         7emLFI7dY/6+FylAuJsnOc6s8pU+DjJadx1aE+FM6/AWCJ3tqb1QWwgl40AkL/4DZIak
         3GOSpOU2wPX5QgtRh1D2Z3mxwacfDT5c2IigvAgT7/f7dLbGE2xlz1uZBYjn1P4gGuSQ
         NYuTAfgURb0t8EF4QpQEiiAFWrGwes1nrfXaPTg0vQiZBMIALZrPhfPuXnBNKj1kifZ5
         Tsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793831297; x=1794436097;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rORPcwpKcsLoZavTsDXE5+1r14NtYgKold9FpGxIEUA=;
        b=ALZpJvgpSssU84RYFO+4s3C0Z2pMbNlJBM1amKhxYWSOCu+W5duLUJ98QOFhBIAvue
         JcfzDwBz9lwZKfpcQSgnz//fkYTlKt+fbFQ5lfouYDxsQMFZ78p9K0KI0anFO19FIlcM
         m5HPgadVIbnVmppU9IbF3uHTZs2cB0aU+8z0U++mfXmkHnJa03JElggSW8PO+DmnJ06D
         KBDEB8q0YtdMl5BXpNPpFiyUhZY6h5gRnLOgWrbh94ak7NQ6Neuh2isJqL+nltMQe/BP
         xWwytxlOaRT6J2FqcqVAsaq/fT5ftnqO157pdOgZpq2jD+jevR6riP7HVD3VE/ZcfNnS
         /akQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHSSXJUeHWeND7ushQkFolxH+RqKjak3QuZ12yluagOd5sJlmmdtyTlGLOxKfgxUC5InqVi+kYieoFDLc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JrZJJ87CvTm00cvou2tU6L4Xy0Or4ZhIWTaMy7aqCQbv/OL5k
	LCu000P8zbpifETjqwpGtFSTTeYdQ9VpCqo72fnkGX8wndrG7AMY7oYrIh2HdQ==
X-Gm-Gg: AYBFou3r1cxP9DWvhB1aKVVFW6IuMeZ0a2ffsMqD7hPjhEKBwS1Q9AYS/9Po3pyPv5l
	5+boVLPy8wNl9LF/lwfr8cgs5h70LKVdaUpfkywa6M5wV7h5ddZHsYjYulu6imw2phmGdz0AP3M
	4nFNWOMCfNZPWkqNWgJ2K4foagC9UG3uq2u2NEvZyfzsuEQd8n7+LtdLZP2YmiByMn8ukA+4ngQ
	0/LFhO+fuU5Q4pOhv12NL04Lv+sig7OKwKW290I7gmTjqdSo4/H77ZhlAwCfh0L2CRnJpae6HJh
	BJi8EcjJlj24dz94LvHf8tFI0KBfiheBHiD8PYT6HYg3Xuhml/PaeFaZ8SQRnwrvYviuXQpTezc
	tTuRsnq1ERDVsQtV363mCE0jj/HnSG1UnMSW+lamxStHvqg8sVscYYmmaavqbjS8EXRNxprOzvx
	WSPQVU3DZFm7U3UyUYZE7bepaj4jY0FVS7arR9P9Y9WduL2Zf36++Sau3ev2JNWNxmMh8cYulRw
	7PN9WfjVNaUIzEMM4BqXT8/ZVN0VKcWvKwWkjXLzJXIAfVgnpy3a9TrKwOYJr1R3d0LM7KFuGHl
	ogk8AKxvurc9juO7eBd/Zg23eDVmDsUXmbux4nxOSurCKqo7aZGRtLhivTO+z4XeIcdtZVTx+65
	nEBkpSzqlaMVOPGU=
X-Received: by 2002:a05:701b:42c7:20b0:1b0:f0f5:e38f with SMTP id a92af1059eb24-1b0f0f5e3b5mr18662779c88.34.1793831296771;
        Wed, 04 Nov 2026 14:28:16 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c463e9sm10694316c88.14.2026.11.04.14.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:28:16 -0800 (PST)
Date: Wed, 04 Nov 2026 14:28:15 -0800
Message-ID: <f5c1435fbfa7568a107c864781897d6e@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: bartosz.golaszewski@oss.qualcomm.com,
	marco.crivellari@suse.com,
	arnd@arndb.de,
	tony@atomide.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	brgl@kernel.org
Subject: Re: [PATCH] Input: gpio-keys - do not BUG() on requested wakeirqs
In-Reply-To: <20261104160305.2501369-1-andreas@kemnade.info>
References: <20261104160305.2501369-1-andreas@kemnade.info>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Andreas,

On Wed, Nov 04, 2026 at 05:03:05PM +0100, Andreas Kemnade wrote:
> Having the IRQ handler called when enabled IRQs arrive should be considered
> as a feature not as a bug. So do not BUG() there when this happens.
>
> Fixes: 3717194f24922 ("Input: gpio-keys - add system suspend support for dedicated wakeirqs")
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/input/keyboard/gpio_keys.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
> index fbc31c5db3db..f1c31c5366f0 100644
> --- a/drivers/input/keyboard/gpio_keys.c
> +++ b/drivers/input/keyboard/gpio_keys.c
> @@ -412,7 +412,7 @@ static irqreturn_t gpio_keys_gpio_isr(int irq, void *dev_id)
>  {
>  	struct gpio_button_data *bdata = dev_id;
>  
> -	BUG_ON(irq != bdata->irq);
> +	BUG_ON((irq != bdata->irq) && (irq != bdata->wakeirq));
>  
>  	if (bdata->button->wakeup) {
>  		const struct gpio_keys_button *button = bdata->button;

Doesn't gpio_keys_irq_isr() have the same issue when a wakeirq is
configured for an interrupt-only button?

Also, neither gpio_keys_gpio_isr() nor gpio_keys_irq_isr() uses the irq
argument for anything else, so instead of expanding the condition, could
we simply drop the BUG_ON() from both handlers?

Thanks.

-- 
Dmitry
