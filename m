Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C1212E1DC;
	Tue,  1 Sep 2026 04:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788237362; cv=none; b=Xc4KrDu0TjLdLk+m4/Ro/R3hGQ+EMkdi69TNI9hPfnj7etuPSBnw9AjYkE5e9IS1yP9QWaEuNuudROgETbUcZWSU1HIYRDAAmX0ohtRAjHysRXZ41yRBmpEL2fukayOW0g0fip1l//rXPGmvQnnYzJWgDlN1eGgmxQ2cBxi1T+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788237362; c=relaxed/simple;
	bh=p3bTsH8ZXn1TDokuHEZKCw2VI2lbaMlVY8/TKEA4ZbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TEeihC4+LuPjPmU6Ttllf5yUQnSR3b9nMlfGRr2J/7z7r2syslxtwxdP8/Kll5NEwayyMTIon5z1QqS456ChlIZNtNq45GzvPXh2FndjH9n7bWcs73pWUnR73B1mz4+4b6atKdzHGI9wsz4jsdgjF+dXP0L56d49OxeigmRg888=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=X7zp1Vi2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X7zp1Vi2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503761F00A3D;
	Tue,  1 Sep 2026 04:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788237360;
	bh=xtmnYxMkfm8VF00/7RpWus+kXwrjX7Jm22X3YjZmSAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X7zp1Vi2aGBwsQKllbkhprF9W84FgYIFnVtPH+2ODrl/fKbkLXJ6Kpsar/JP5TwFo
	 yYe68FoDnawLre1in0tw+Mh1AHIDUfz7ohochxxTXu+mYiPvuYEwnKfS4SYmA5DaWg
	 ED8kblPgcKlnm7M2rAFIgFaNUFA2FvVjgi5sTjNw=
Date: Tue, 1 Sep 2026 06:35:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manush Prajwal <manushprajwal555@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: fix underflow of tx_fifo_depth in
 size check
Message-ID: <2026090116-jailhouse-arousal-3fc3@gregkh>
References: <6a964015.7d702ed2.1273e8.5ac0@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a964015.7d702ed2.1273e8.5ac0@mx.google.com>

On Tue, Sep 01, 2026 at 08:31:41AM +0530, Manush Prajwal wrote:
> axis_fifo_write() bounds a transmit by checking:
> 
>     words_to_write > (fifo->tx_fifo_depth - 4)
> 
> fifo->tx_fifo_depth is an unsigned int populated directly from the
> devicetree property "xlnx,tx-fifo-depth" in axis_fifo_parse_dt(),
> with no lower-bound validation. If a devicetree ever supplies a
> tx-fifo-depth smaller than 4 (e.g. a malformed or misconfigured DT),
> "tx_fifo_depth - 4" underflows, wrapping to a huge value. The size
> check above then never triggers, silently defeating the exact
> overrun protection the surrounding comment describes: writes far
> larger than the FIFO's real capacity get accepted and passed to the
> hardware, driving it into the "Transmit Packet Overrun Error"
> condition the check exists to prevent.

So this is just a bug in the device tree?

How was this found and tested?

> Validate tx_fifo_depth against the minimum the driver requires at
> devicetree-parse time, matching the existing validation style already
> used in axis_fifo_parse_dt() for the other DT properties.
> 
> Signed-off-by: Manush Prajwal <manushprajwal555@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 3d358f9193523c..dba76fbf5d685a 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -412,6 +412,13 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
>  				   &fifo->tx_fifo_depth);
>  	if (ret)
>  		return ret;
> +	/*
> +	 * axis_fifo_write() computes 'tx_fifo_depth - 4' to bound the size of
> +	 * a transmit; a depth smaller than that underflows the unsigned
> +	 * subtraction and silently disables the overrun check.
> +	 */

Did you forget to add an Assisted-by: tag for this patch?

thanks,

greg k-h
