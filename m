Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8278153ECED;
	Tue, 22 Sep 2026 12:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790079137; cv=none; b=WfpUlf3Hd5BhOXNUPmX6kGHY/xkGmlcErgBQD2Vu8DR+5uKqf61ANzEKHzo6h+JJ8rreGvCAHto2/J4BDJv/6WRI0qrAg2ILfVuNJlAQSy3iGXoeaCPXpzjQqqZXBXBoJrwEGAf8dVNP7bka/DsR2TCNgfW7WfPVtKosPP9yihk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790079137; c=relaxed/simple;
	bh=RwBQwbNjCM5zl0fvZM2naTS38KsekYqTYC1xLao85YA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQpTM6FG/HNdIQSQpyRfxJh2RIk5fFtzNLGhHTlyTXY98uV40ZmNRF8aSLooIMu6Zvz1prmSx0DTi+3h9AtJQP9w6fxE7e06E7LgPSo12VVTj4hL6/cw8uv5XUG0bFNjGtyw9jKHT9DDNVjdJaIX3o1SexUPjCzYN6szpDfVjHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hUNCJVZx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hUNCJVZx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD621F00893;
	Tue, 22 Sep 2026 12:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790079136;
	bh=U2N9jaqko6o/t2ALmDTYb0syffBd10BbeFts4JsnzIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hUNCJVZxC9zI20qsu4jB3+MbWgCuxh1bNjiW0tfcKs8Dkl2JVeHOTQlI2hm0PGubU
	 X1UfqLrjkr+r3BX+CsKsWSqo/Y9PuVGMfnh9Rp0Sw+kDi/Fx/fcXJNWefu0A69cbDA
	 is19GlXdYSzMmjx+peOfOrDAbdd2OWYIjlwXGvjErfGrQxZGGPSgHyhD6zveWNyNEm
	 MhuKEc46CQgwj3QJxXsWc9ZvrWC9F7o4rxkVdD4knXrqbhkeIb3McYwbWMLyy/uP2k
	 QaAIlcPskXwvBnx69LBCU04d85C3TmHCdxBELLfStMSd/C2Q1VNyCiRNMJpsW/wI3i
	 bwaAJzzItZDFQ==
Date: Tue, 22 Sep 2026 13:12:12 +0100
From: Lee Jones <lee@kernel.org>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
	Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] mfd: da9150: balance IRQ wake on teardown
Message-ID: <20260922121212.GC3277918@google.com>
References: <20260913021420.60344-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913021420.60344-1-mhun512@gmail.com>

On Sat, 12 Sep 2026, Myeonghun Pak wrote:

> DA9150 enables IRQ wake after registering its regmap IRQ chip, but does not
> disable it on a later probe failure or driver removal. This leaves the wake
> depth elevated after the handler is removed, and repeated bind attempts can
> accumulate the imbalance.
> 
> Remember whether enabling IRQ wake succeeded and balance only a successful
> call. Remove MFD children first so their nested IRQ users are gone, then
> disable wake before removing the regmap IRQ chip. Preserve the existing
> non-fatal behavior when IRQ wake cannot be enabled.
> 
> This issue was identified during our ongoing static-analysis research while
> reviewing kernel code.
> 
> Fixes: b8fce55c09d3 ("mfd: Add support for DA9150 combined charger & fuel-gauge device")
> Assisted-by: OpenAI:GPT-5.6
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
>  drivers/mfd/da9150-core.c       | 9 +++++++--
>  include/linux/mfd/da9150/core.h | 1 +
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mfd/da9150-core.c b/drivers/mfd/da9150-core.c
> index 5c59cc869fb3e..d91d419fea663 100644
> --- a/drivers/mfd/da9150-core.c
> +++ b/drivers/mfd/da9150-core.c
> @@ -450,7 +450,8 @@ static int da9150_probe(struct i2c_client *client)
>  
>  	da9150->irq_base = regmap_irq_chip_get_base(da9150->regmap_irq_data);
>  
> -	enable_irq_wake(da9150->irq);
> +	if (!enable_irq_wake(da9150->irq))
> +		da9150->irq_wake_enabled = true;

da9150->irq_wake_enabled = !enable_irq_wake(da9150->irq);

>  	ret = mfd_add_devices(da9150->dev, -1, da9150_devs,
>  			      ARRAY_SIZE(da9150_devs), NULL,
> @@ -463,6 +464,8 @@ static int da9150_probe(struct i2c_client *client)
>  	return 0;
>  
>  mfd_fail:
> +	if (da9150->irq_wake_enabled)
> +		disable_irq_wake(da9150->irq);

Or drop all of the checks and just call disable_irq_wake() on the error path.

>  	regmap_del_irq_chip(da9150->irq, da9150->regmap_irq_data);
>  regmap_irq_fail:
>  	i2c_unregister_device(da9150->core_qif);
> @@ -474,8 +477,10 @@ static void da9150_remove(struct i2c_client *client)
>  {
>  	struct da9150 *da9150 = i2c_get_clientdata(client);
>  
> -	regmap_del_irq_chip(da9150->irq, da9150->regmap_irq_data);
>  	mfd_remove_devices(da9150->dev);
> +	if (da9150->irq_wake_enabled)
> +		disable_irq_wake(da9150->irq);
> +	regmap_del_irq_chip(da9150->irq, da9150->regmap_irq_data);
>  	i2c_unregister_device(da9150->core_qif);
>  }
>  
> diff --git a/include/linux/mfd/da9150/core.h b/include/linux/mfd/da9150/core.h
> index d116d5f3ef561..369698036d1aa 100644
> --- a/include/linux/mfd/da9150/core.h
> +++ b/include/linux/mfd/da9150/core.h
> @@ -65,6 +65,7 @@ struct da9150 {
>  	struct regmap_irq_chip_data *regmap_irq_data;
>  	int irq;
>  	int irq_base;
> +	bool irq_wake_enabled;
>  };
>  
>  /* Device I/O - Query Interface for FG and standard register access */
> -- 
> 2.47.1
> 

-- 
Lee Jones
