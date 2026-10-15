Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C3F4DD3C7;
	Thu, 15 Oct 2026 11:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792063930; cv=none; b=nUfJVInQx0KNCMMQ7yepFKhaydxO3ly++3CGeiw6rAvaCQyqn5AGy/7DkBQCbsGW6mfxe/zyvRyjDjETQLxdk9BR8H2vfOztj+Zv06slNNvhu+csJPTewQmliejNGKhFsmLSueE3uNcAdmI3e/IINq3DlBshqMaigwizCCTDmFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792063930; c=relaxed/simple;
	bh=zvw7kllek2QOla6BkFhFN90DcOu9fOKSpaBVk+rMRMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W27zjavDkTUVa1tl/qIGMTC5uIFWwoygCX8nzDSCOtR1UimeQe/T5vKgrT3rJR3DYYwbe5WhBz405Eyv7JtuAdky+fGGM8KVit1ihBz9l0jWm2Ldk0fE/6n4vp/xjnAyjRBMLODNagAp71YCotxnQRn8V60sbKD3Cw1Ik+ibrXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgRZ59Kx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgRZ59Kx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460501F000C4;
	Thu, 15 Oct 2026 11:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792063926;
	bh=m+EbnJvpu2ct2wF+IVRMGQ3O97oeqOc1n9kkhZH0SVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JgRZ59Kx5hi75yq5Bi3n0AbXEhl04m/gYYMSojbfZHrCVcdHUjwcmRu/tK4L8lvNw
	 YVSZGgYofHdPOaSC/1xJLhrJYsjpqLAhtEWENHJOhcvyp3HFriGH7f3mWUueZh6VYj
	 tMJ5wu1u3VJO9OAF0tnPvwz1CK1MZFNOLYRklT3DlzKBeoWYA9kbMniM00a0+9NWAx
	 RGZNPV089uwXxqORQRnYS+77Gdn2d8YDRmO2BQ0vj/OI68MiRNj4qQf8RzADUhGVQX
	 TNCrJc+QVrZJRXC6+AaM57JOKF4WrTKh0lbOgZFIEgKigw+KWEwZgVc7iz75F7Jiba
	 Rg30/FwcQOWYw==
Date: Thu, 15 Oct 2026 12:32:02 +0100
From: Lee Jones <lee@kernel.org>
To: Jiale Yao <yaojiale02@163.com>
Cc: Rob Herring <robh@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: mc13xxx-spi: Reject devices without match data
Message-ID: <179198508885.839288.9105969120727120929@kernel.org>
References: <20260925133751.2230782-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925133751.2230782-1-yaojiale02@163.com>
X-AI-Review-Draft: <20260925133751.2230782-1-yaojiale02@163.com>

On Fri, 25 Sep 2026, Jiale Yao wrote:

> A device bound through driver_override need not match an entry in the
> driver tables. In that case spi_get_device_match_data() returns NULL,
> but mc13xxx_common_init() later uses the missing variant data.
>
> Reject devices without match data before entering the common probe path.
>
> Fixes: 15d71e678ec1 ("mfd: mc13xxx-spi/wm831x-spi: Use spi_get_device_match_data()")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/mfd/mc13xxx-spi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mfd/mc13xxx-spi.c b/drivers/mfd/mc13xxx-spi.c
> index 56d2e57b7d73..d1523321152a 100644
> --- a/drivers/mfd/mc13xxx-spi.c
> +++ b/drivers/mfd/mc13xxx-spi.c
> @@ -150,6 +150,8 @@ static int mc13xxx_spi_probe(struct spi_device *spi)
>  	}
>
>  	mc13xxx->variant = spi_get_device_match_data(spi);
> +	if (!mc13xxx->variant)
> +		return -ENODATA;

Shouldn't this check happen at the start of 'mc13xxx_spi_probe()', before we
allocate memory, configure the SPI bus and initialise 'regmap'?  Also, we
generally return '-ENODEV' when match data is missing.

>
>  	return mc13xxx_common_init(&spi->dev);
>  }
> -- 
> 2.34.1
>

-- 
Lee Jones
