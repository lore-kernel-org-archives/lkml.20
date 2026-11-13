Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583227;
	b=IBjkkYLk6hGZ3PxjjOrKqaSk4nuqFe0U05C3Em62YiKnUSBxfYzkSYgBzOwiVnVWqBQQ
	 CskRnqrl2m6FeyqJ1kFflD/rZAmcSfuLg5tJYFpUWxfmu83Q73dzwD/OAAnBaQQJiF0mO
	 cahRPBZBzWoF/DymkHvntoSG2Q9LT/QCpaalT5nNEHTQdVRNb3TFT6nBV7m04M5niSKNj
	 WdPwFjRUz4DQwUdQB8dN9WIN3x6ejR50sal7fF2k8W5Tsi+6VQwwgBs0VEGFW2ezYB9Rm
	 LgpZPXA193BgIEVFiQ4xvemb8mpZfQc5oTxagC5X6KYngnBEF295qVVEiv1BEqrPMzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QJq+GUc6PAR3xy+Pfkqz+19LZE/YeqLmKaLV5oi4iko=;
	b=ybGva1zIWwFKlKaSDPa6sj0nXewJKMBIQ6hOIdB9hW9XSjlAPDfAeOeq+Us/M5bZcbyO
	 ebQ344i3JSssYOToKzSS2Rsce8IUWri7llSJ8EaBXI0uEod2KTfWXdQjpNX/fSqc772av
	 QwqC9DBsnUbKRfJP+L0Il5qns3l+CXFTEcW+uUb/FGV7QzZYuNdiVWTzmL/8jgLJl9PZf
	 Ui6PpcdYDqKttjP0bQG7lD2V/QGZ0MsE24Jl/j+EM/vODdkabUjrT48ntxIPMMe0ZcrCl
	 IIZXiXhkO7CPI+qm/y3ZSSN36HKYhZukWsD5VGcoU1efwc+/ZEmmDpBInAUl053dolQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NnjU6d5V;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA79606A890
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FA79606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NnjU6d5V
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7f84a55cc06so1312069a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794583225; x=1795188025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QJq+GUc6PAR3xy+Pfkqz+19LZE/YeqLmKaLV5oi4iko=;
        b=NnjU6d5VxM7A0+O4guD0V8fANOGIUq+iGf3jiYWrUO8W0bs9Y90UbrZhLlkWFpHJW2
         r+BfTji7EQkDUffbPgCw3SB3lRIl66kt/GBWpF5/sBULa1TCVPuFwubp16ZHonT1+mMY
         U77t3R3OpIp33QNWWn6UJmgljvsaCZP2yA7MYTykh/Kw+QxN/OrOZVjiNDi4z4RAHXPV
         i8dDuP3eRItU4MQ5XYXc/HdVjf9q1UqhxPAb1IXs5p4aVzMacS7F71GMeae5upCHZR3Q
         MriSbLqAcPOe9sNMQHZqwn5MW80lzKIYQ9bjbvMBq6tu0sz9R8TTHe2r/VreYnkKPPq/
         i/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794583225; x=1795188025;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJq+GUc6PAR3xy+Pfkqz+19LZE/YeqLmKaLV5oi4iko=;
        b=Mjmq4Q6zhl0kSRYd36e/kn+tyQmX/YnsZ3q8GkJDlwNUeQ9hqA5KKYYgwnAbQJZFeo
         arLXSchb4aImVtcgf7tB3NH3tVJT+PtOCHLJD6NDxZGoB8nARvSeSj8WD2wPWHPD53CJ
         vTZdHqMkTmeuMfjJ7VYBhHyJBmcpYh44Xx+LGA66qaf3+iW9xaqmMhxXMfLoALovWlXj
         Sc+cw1kVQUX7J0M6Px5j0pLvlb80J9El1qbL+hXxi+OikutE//ISBjbafoaAJDtK4VUe
         d60G/2M1WSmwHMBNtyGPTUitbBzgFrI7eEnNnTxqYyJS7fil87tD0+AxSALQ1uWnveIi
         XDZw==
X-Forwarded-Encrypted: i=1; AL+hErFhSx/VzOALVw8HyBUbkiC2CAmq2WtHm2PPW4kNgr9+OZ/sYH9422KestCMqXUxF3qeIjB4nm+ZkFo2zI4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q6khDXMF+Zgmhmysjrl4brs61kEJMfNIQD1PsGtZ4vResduV8
	QY/vOGt2/FLBEn6ToqP+zzJI4gurv3WP9Aug2JQ+Ma4xE1y3dmOHHXDDx+3t5xPaVKsQzqBqs9T
	iSGZ5psM=
X-Gm-Gg: AYBFou3LAWbmBi3AQq0iiUHgCBsXYkfqgLJXrC+thOBKVt7Xg9Budk3+kT0LuSJakRq
	A8ILGgGiWAu9T2P5KxvD8NBPAbYJMw+yufG8t/EYGg84aTE0Vj8PpSZtqsA938bXVV7dWqVLvs2
	X81GABci3gDJoHU0yNnGpRLK/6hav2N7nlspsbElkcqWd5QIpm72X3n+nFYYCgPP5//gl1KYgrJ
	3G0+HLUQRLe0OCxNFwpBxGQaTf/KrmyvuNImRfX0QvBDe/VguD5ygmeMioMWdyYLALSAYmXOHBf
	AQK4SqK8UvimE/ZK6Z8mpjWfOndo4js00IuyLoV7ovlLVEwkBntHzHH+rwhAEGil14/NwIsmeHu
	wTIybackleFiAmzdGurjriSAlfMayZn3qRP+qCiKnimmDuYx+IeDNzCVANivg6UkpY0l+IsacjG
	ZvC/VKNZhDrPxNzYO+kVc9d2r+Xy0zV/ciYVvFxZOvogRxt0+GcGeRX/lYlC3yRKoC0I6J786si
	GF2uMwV1+Aif5J5EU0eDPUNiXU91P1rgHmmhqf7eNgjxYlI6vqfoaEWHHYUSH/oSM6TPXKIbeWX
	MNTfdVj4SkiOe0Nk+kvw9VQLkl60DPQdinaU3dr2k3IlNokVAthzyvP0v4IGp48d7ef0mzH1oWl
	GH0Q=
X-Received: by 2002:a05:6820:55c6:20b0:6d9:e2f3:9b51 with SMTP id 006d021491bc7-71ab5084396mr1064228eaf.66.1794583225149;
        Fri, 13 Nov 2026 07:20:25 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:fb76:8640:983b:6899? ([2600:8803:e7e4:500:fb76:8640:983b:6899])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab4338765sm2019311eaf.14.2026.11.13.07.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 07:20:24 -0800 (PST)
Message-ID: <06f0a178-5d98-4c6c-b596-c0eba8ae9234@baylibre.com>
Date: Fri, 13 Nov 2026 09:20:23 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: axi-spi-engine: Start the program length at zero
To: Kees Cook <kees@kernel.org>,
 Michael Hennerich <michael.hennerich@analog.com>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Mark Brown <broonie@kernel.org>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, linux-spi@vger.kernel.org,
 linux-hardening@vger.kernel.org, Dennis Gilmore <dennis@ausil.us>,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261113065508.i.606-kees@kernel.org>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20261113065508.i.606-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/26 12:55 AM, Kees Cook wrote:
> spi_engine_optimize_message() allocates the program with kzalloc_flex(),
> which sets the __counted_by() counter "length" to the allocated size when
> the compiler supports __builtin_counted_by_ref(). The program is then
> filled by spi_engine_program_add_cmd(), which increments "length" and
> stores at length - 1, expecting it to start at zero as it did when the
> program came from kzalloc().
> 
> Reset "length" after the allocation, since it is a "usage" counter, not
> a "total allocation" counter.
> 
> Build tested ARCH=x86_64 defconfig with CONFIG_SPI_AXI_SPI_ENGINE=m and
> W=1, with GCC 16.2.0.
> 
> Reported-by: Dennis Gilmore <dennis@ausil.us>
> Closes: https://lore.kernel.org/all/20261112025252.71375-1-dennis@ausil.us/
> Fixes: 69050f8d6d075 ("treewide: Replace kmalloc with kmalloc_obj for non-scalar types")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---

Reviewed-by: David Lechner <dlechner@baylibre.com>

>  drivers/spi/spi-axi-spi-engine.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/spi/spi-axi-spi-engine.c b/drivers/spi/spi-axi-spi-engine.c
> index ead5b295e680..9cfee409f15c 100644
> --- a/drivers/spi/spi-axi-spi-engine.c
> +++ b/drivers/spi/spi-axi-spi-engine.c
> @@ -818,6 +818,8 @@ static int spi_engine_optimize_message(struct spi_message *msg)
>  	p = kzalloc_flex(*p, instructions, p_dry.length + 1);
>  	if (!p)
>  		return -ENOMEM;
> +	/* spi_engine_program_add_cmd() counts the instructions as it adds them. */
> +	p->length = 0;
>  
>  	spi_engine_compile_message(msg, false, p);
>  

