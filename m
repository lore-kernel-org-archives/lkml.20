Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1457647AF6B;
	Tue,  1 Sep 2026 09:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788255872; cv=none; b=KoPXFRiEGvpHh0ztucYIwi9T5tiII6RIlfVceDjsHACKD2lSSlgz31z6hzwutmtipvBFDOW70BTzEaVE+Or7kaqD0LogbdAxr+vJwbQmI4QJL11uxkJ1BhMmU8NIPe6K0ajlkjL0VoH1N6U+jHLoKTY3HVZ5AYLQah/u5BOUshY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788255872; c=relaxed/simple;
	bh=5C/+OtkBtARziD6KBU14ZJZloWoQmUFCnKqss1jNyz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZnP1rZcUfV6YgJxaooOTbOIKwze5MigTSddMkNqFukxJLoqN/1Z80ZNJyEvABRjXoVx/tzZdj+ZwyoWQLwDMmFzevAZfqOXCnbeKlOkc0ylPpg3oaCLipC2gntjagVgnFVgj3BeojeHXqiF8RdSg3TpnNuP7J8YFwb5a8LM0t6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UK8SbdEg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UK8SbdEg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A381F000E9;
	Tue,  1 Sep 2026 09:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788255870;
	bh=J3roHY+8j8dz6G+zhTJKPQ3Lehz65popD+XlPx0oLw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UK8SbdEglVPb4Y08O373Qa8X4dllPaUbtxPMdmtvkC2bewhA2O+PIlPc/fFi1jI39
	 HcfzPqFIGxu6sjmS/Sqo2LOgSZ0hYWYAKPuiHhqDFMYKo5yRWyOXkKN9jNr7wZaI5W
	 J6Rk4CcCqrpvdGpR+P2hskO0QcjWbDkOxTROHxBc=
Date: Tue, 1 Sep 2026 11:44:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: singh.supreet14@gmail.com
Cc: Viresh Kumar <vireshk@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: greybus: spilib: Handle SPI device types
 with a switch statement
Message-ID: <2026090143-skincare-slacks-540b@gregkh>
References: <20260806101118.146685-1-singh.supreet14@gmail.com>
 <20260807071542.200192-1-singh.supreet14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807071542.200192-1-singh.supreet14@gmail.com>

On Fri, Aug 07, 2026 at 12:45:42PM +0530, singh.supreet14@gmail.com wrote:
> From: Supreet Singh <singh.supreet14@gmail.com>
> 
> Replace the if/else chain that selects the SPI device type with a switch
> statement. This makes the code easier to extend when additional device
> types are introduced and improves readability.

But let's deal with that when it happens, you are adding more code here
than removing:

> 
> Signed-off-by: Supreet Singh <singh.supreet14@gmail.com>
> ---
> Changes in v3:
> - Fixed the memcpy indentation issue
> - Removed the extra blank line in the commit message
> 
>  drivers/staging/greybus/spilib.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

So it's not really a benefit overall, right?

> 
> diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
> index e4d1ae8308aa..39d5bf234c61 100644
> --- a/drivers/staging/greybus/spilib.c
> +++ b/drivers/staging/greybus/spilib.c
> @@ -458,17 +458,22 @@ static int gb_spi_setup_device(struct gb_spilib *spi, u8 cs)
>  
>  	dev_type = response.device_type;
>  
> -	if (dev_type == GB_SPI_SPI_DEV)
> +	switch (dev_type) {
> +	case GB_SPI_SPI_DEV:
>  		strscpy(spi_board.modalias, "spidev",
>  			sizeof(spi_board.modalias));
> -	else if (dev_type == GB_SPI_SPI_NOR)
> +		break;
> +	case GB_SPI_SPI_NOR:
>  		strscpy(spi_board.modalias, "spi-nor",
>  			sizeof(spi_board.modalias));
> -	else if (dev_type == GB_SPI_SPI_MODALIAS)
> +		break;
> +	case GB_SPI_SPI_MODALIAS:
>  		memcpy(spi_board.modalias, response.name,
>  		       sizeof(spi_board.modalias));
> -	else
> +		break;
> +	default:
>  		return -EINVAL;
> +	}

thanks,

greg k-h
