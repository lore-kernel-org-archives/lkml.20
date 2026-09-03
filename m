Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA1E4B5CDF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445449; cv=none; b=gWohOdoU9uMKhA3okpMlJxHfdC5wNj7AjhfwfMBt9KUfV73uYs2nPWP/Sf4/o8IZqWvMOEiZfe2uM/2Env90rJVeVuXikg/IreYv0j6Ynaxgpr/oW/doi1joKKIVNZk4W1bqshln+k3mL8tL8x/2gw0GqExubawHSEqWdlcc8O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445449; c=relaxed/simple;
	bh=FflwYYqaPCIJS/6xV+b+AbtGsDZbWO4bYd4m1uzFac0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RQz3VYjD9jQKziyaqzLJOWzrSKCG8Z6AMrgwhGfthF2QeBLvBe6ETiLkASUv2rBx2EJGZf0aKSie4CDVvcF8xaLjWsJGhzLmKx9706QGCQwS+S8hEy9F4HfCPPK0ywKVm8vc9R4FxpwIRnHheWokGr5+C0Jjat50gnpYTHij+ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=MRo0BwJQ; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="MRo0BwJQ"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-97bf8e907b0so1224909241.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788445436; x=1789050236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q/sLblnZ/kowz5cljubMYSFLlc/UtCaMHHRCeeFpATM=;
        b=MRo0BwJQhdrtpHaAy3OIHudzHbHCiqA4EIeO1ACHxOzEHRA8BBCyjgya54NXBO0jLa
         sp8C5JxbsT3w58+LXGCoq4X4hOqWDw6NxBzq81XIUbNpnN7fX+2YYxa3Qq/JtCo/FCQ8
         99t/1S52/jF6+T7mzXy1SfMUCHRxoX9XpAYzeKziylJSk5hELr6hDUpArfiD79BUFVLO
         Mct1mB9XIoGXliFlYlYKEyDrQxQjYja4Kx/adIeXoy4Rh53jtwnMyfOPn1pQHttp1eQH
         Mw1Q6vtDfgTuaCoESrHXjAf91vTMdFRcdIX4sGUOVIEXmwAjoPmi+RWv6oihh4NVxcoy
         8Nzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788445436; x=1789050236;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/sLblnZ/kowz5cljubMYSFLlc/UtCaMHHRCeeFpATM=;
        b=NAPtOBIsIe8srZ27AeODWL+y9R6BKNyCdoALkAehLKhnBVue9cyYL+lDKS/PJXNfq2
         3uo/kP1QVVnKGiDohrjR7eDazuessJsp1TcecSKMDGmsfc7OqkQbkQMT6MxuwNtU83T/
         UACsFTuDavyyuhoXnz46y5gIkqGeKyLsJS1R7RbTgpmTXQVHI5/u79Wo9owKnJ4VVZez
         8yODf757WjOP66Zo18A98X4dRPCA/B4YA8OYu4Aivi7FjFpCGu72TZLQ6wiZn7zh2OMl
         Z8m6+fgcNYxK0OK5hRST/D5c5gJwcVlpbSC40gU383PC0PV5Z334Ptar0N+U3rfWu9sY
         BhwA==
X-Forwarded-Encrypted: i=1; AKwUvBwzbKJa4a1Ys7mdpuWLwHVuJulq48cVNXbgJwXzce2L/sHNqIEVHI3XnpdIVwCTIWVNUi1VH3l5KerqwAA=@vger.kernel.org
X-Gm-Message-State: AFuF++mFmTwM4301zCZThQ/SVYyHn9NfLziWl0RFpdF1nikD3GsyxU3x
	JQ3a4U/G+wdxLBY941d0ovusaznHNp1qICj0Ds6c4jWWTNg3KxvBh4oMzjZade3ykSM=
X-Gm-Gg: AYBFou2xtHdJG/rdkGXqeBZcu66bEmkjhxTke+3wYGtstvp7jId9G9hy0s8MU5gKGy5
	tqmhMW7OwLk2vkKNCmpFye2KQ9sSSom6Hyj6PjOi+A0farvXGPoH7UDkMupFFI23juYDAhIGwAg
	J6OcpoJ/QXNcwsHc9nJoWbV7cmKVGGw8LPhnjUNy15Q9ZIg8eyArZMgkZzTbfZKVdiAAgHYDsRO
	xyhRKw5Xn2QW0/dwKGoy8rocnnkoDyJ+RvAFTeMwKRfB4G/nRzWXYAUmhUfyAiozYxprXkTfthR
	/PcbRfE6Pbw5AaHJ6lzYoPCVHXW/vWKZgqf6O5x1H32E61zaUfbd1l5M5WwceQqVde8c0EhlZVf
	rXTr5jbtN+2YJqigOMxSh7Ck4OzbI7rsxIBwPApJqomq6OQ0YF/hpcvsieyQqDzRre8UVyDZ9cR
	b6zKf36B/Ca57Fg332/PVGEHmLqM4bS3UMxMsYa421sIML1cDHsfaPANq9ibBhNFWYJ5kA+USGK
	3ODI8+zM6uIeI3ndZIzQqzbB9b2g83Ne2lM
X-Received: by 2002:a05:6102:32cd:b0:784:ed9:1a1c with SMTP id ada2fe7eead31-78a1f3ccaffmr4880777137.12.1788445435981;
        Thu, 03 Sep 2026 07:23:55 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:e24:471f:c835:8147? ([2600:8803:e7e4:500:e24:471f:c835:8147])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a1b89ee0asm4420005137.8.2026.09.03.07.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 07:23:55 -0700 (PDT)
Message-ID: <db8c87a3-1035-4023-8929-aae47ef7b20a@baylibre.com>
Date: Thu, 3 Sep 2026 09:23:53 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: axi-spi-engine: fix stale SYNC IRQ pending
To: Jonathan Santos <Jonathan.Santos@analog.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Cc: broonie@kernel.org, nuno.sa@analog.com, michael.hennerich@analog.com,
 jonath4nns@gmail.com, andriy.shevchenko@intel.com,
 Dennis Heinzel <dennis.heinzel@irs.systems>
References: <04d51e99b8cddce51113db933d806e83848f04f5.1788313558.git.Jonathan.Santos@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <04d51e99b8cddce51113db933d806e83848f04f5.1788313558.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/3/26 8:49 AM, Jonathan Santos wrote:
> spi_engine_setup() sends a SYNC(1) command and polls SYNC_ID to confirm
> it was parsed by the FPGA, but never clears the corresponding interrupt
> pending bit (INT_PENDING[SYNC]). When the first real SPI transfer starts
> and INT_SYNC is enabled, that stale pending bit fires immediately, causing
> the IRQ handler to see the leftover SYNC_ID from setup, match it against
> the current transfer's ID, and prematurely signal completion before the
> hardware finishes.
> 
> This race manifests at low SPI clock frequencies (~2-3 MHz), where the
> FPGA takes long enough to execute the transfer that handler is parsed
> before it finishes. At higher SCLK rates the transfer completes fast
> enough that the issue is masked.
> 
> Fix this by clearing INT_PENDING[SYNC] after the polled SYNC, ensuring no
> stale interrupt is left pending.
> 
> Reported-by: Dennis Heinzel <dennis.heinzel@irs.systems>
> Link: https://ez.analog.com/linux-software-drivers/f/q-a/604145/axi-spi-engine-stale-sync-pending-can-complete-first-transfer-early-at-low-spi-clock-2-3-mhz

Should be Closes rather than Link in this case.

And needs a Fixes tag.

> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> ---
>  drivers/spi/spi-axi-spi-engine.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-axi-spi-engine.c b/drivers/spi/spi-axi-spi-engine.c
> index 02bbc5d0cfc5..9e9bbe109ce5 100644
> --- a/drivers/spi/spi-axi-spi-engine.c
> +++ b/drivers/spi/spi-axi-spi-engine.c
> @@ -887,6 +887,7 @@ static int spi_engine_setup(struct spi_device *device)
>  	struct spi_controller *host = device->controller;
>  	struct spi_engine *spi_engine = spi_controller_get_devdata(host);
>  	unsigned int reg;
> +	int ret;
>  
>  	if (device->mode & SPI_CS_HIGH)
>  		spi_engine->cs_inv |= BIT(spi_get_chipselect(device, 0));
> @@ -922,8 +923,13 @@ static int spi_engine_setup(struct spi_device *device)
>  	writel_relaxed(SPI_ENGINE_CMD_SYNC(1),
>  		       spi_engine->base + SPI_ENGINE_REG_CMD_FIFO);
>  
> -	return readl_relaxed_poll_timeout(spi_engine->base + SPI_ENGINE_REG_SYNC_ID,
> -					  reg, reg == 1, 1, 1000);
> +	ret = readl_relaxed_poll_timeout(spi_engine->base + SPI_ENGINE_REG_SYNC_ID,
> +					 reg, reg == 1, 1, 1000);
> +
> +	/* Clear the stale SYNC pending bit so it doesn't fire when the IRQ is later enabled */
> +	writel_relaxed(SPI_ENGINE_INT_SYNC, spi_engine->base + SPI_ENGINE_REG_INT_PENDING);
> +
> +	return ret;
>  }
>  
>  static int spi_engine_transfer_one_message(struct spi_controller *host,
> 
> base-commit: 183f05a300eab41e4578337eac59335730dfebf9

We have the same poll timeout in spi_engine_trigger_enable(). Do we need
a similar fix there too?


