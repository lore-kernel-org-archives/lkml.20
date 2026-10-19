Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE1F39099C;
	Mon, 19 Oct 2026 06:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392239; cv=none; b=FhiB6qPCmU4OoKqdPKvd3lcaqtJAc2/y6FQEkr7Y584lTM3IZH/LAVMkdbr9oN7/jEtlKmC10WnhMZfaQAr6BBJ0XNa79pHBpf9G32Erw+zbTLPjQ8UgxOgZcK0D8uzElbsG1mgNozldF04H7SIWlbnMAdQ+jV2KAbxBpIpOn3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392239; c=relaxed/simple;
	bh=/vA/9kVrCwE0fqkyOOMo/OA17ASjGtUth1+dNiQ41XY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=auefFJlRm5gLxcirx/ftB5bBxKoejzFoJGnZkg6JRI9WeKpSW0A2LLvZcB70H1qViJstZpjWveN8AZK4zVSkB2f7kdNzzYjFPvHex6Gxwx1yWN/Dt1HPgdx0wDPabf+YJsUaVG5qjQM34oc/Sh9haM1cKzNYCJNX/fisrAH81h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHPzZrBG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHPzZrBG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527291F000C4;
	Mon, 19 Oct 2026 06:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792392238;
	bh=mqOfvKIVgzwAuj39nA2GPRCbFTmqDzZMfWz8fB+0D0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FHPzZrBGzAzJmEwxLevodGvwtiyw6wm4rC1+1TC6kFH5288WXxy2JoyRpx+Kg+DAn
	 rxW9Asz1ludNlsW/kMkv4OHJXVZlIanPkZ8W4TNGz5iHrY3iasyM5RTMxM8xuwu9e3
	 f2OHL+sMI/nbHurmj5FNe/zGA7VfxLY2zTfQR3aeUPb0o0Q3PnxyeqVpXwAzgzxGVL
	 k7gssySDrk5O6/erpgshCFT/n3erUdfnEEr0Mtbrcft/jwryjP4wqxlZbv/ZYMHaH/
	 EOeQE2WwsEqnPLgmFrIH8dBA/lrdSfp+/5lI3cuVyhW1oU1pTGRQFYK60kdFuvIwVG
	 bDE84sE7rVvQA==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xIh6C-000000086Rc-1Lxt;
	Mon, 19 Oct 2026 08:43:56 +0200
Date: Mon, 19 Oct 2026 08:43:56 +0200
From: Johan Hovold <johan@kernel.org>
To: Torra Sowmya <sowmyatorra@gmail.com>
Cc: outreachy@lists.linux.dev, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix loopback Kconfig help text
Message-ID: <atW8LEl3lo5iS3Gv@hovoldconsulting.com>
References: <20261018172711.8013-1-sowmyatorra@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018172711.8013-1-sowmyatorra@gmail.com>

On Sun, Oct 18, 2026 at 10:57:11PM +0530, Torra Sowmya wrote:
> The GREYBUS_LOOPBACK help text incorrectly describes the Debug Log
> Class and names gb-log.ko as the module. Correct the description to
> refer to the Loopback Class and name gb-loopback.ko, matching the
> driver and Makefile.

Nice find!

> Signed-off-by: Torra Sowmya <sowmyatorra@gmail.com>
> ---
>  drivers/staging/greybus/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/Kconfig b/drivers/staging/greybus/Kconfig
> index e1d7ffdf4a6f..3ff47550081d 100644
> --- a/drivers/staging/greybus/Kconfig
> +++ b/drivers/staging/greybus/Kconfig
> @@ -75,10 +75,10 @@ config GREYBUS_LOOPBACK
>  	tristate "Greybus Loopback Class driver"
>  	help
>  	  Select this option if you have a device that follows the
> -	  Greybus Debug Log Class specification.
> +	  Greybus Loopback Class specification.
>  
>  	  To compile this code as a module, chose M here: the module
> -	  will be called gb-log.ko
> +	  will be called gb-loopback.ko

Reviewed-by: Johan Hovold <johan@kernel.org>
