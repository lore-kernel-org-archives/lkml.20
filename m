Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8C848423C;
	Mon, 19 Oct 2026 07:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394178; cv=none; b=j6tS5YELxEs814B3wb9yXbM1U93OEJRHZoYSGLXm91H2X4lySrbUJksaeoyfhhn3zkuwcsOd+QRqPCZ6BpTXvay0t8WM1WwtXnl9K4mR6BBXQShw4XffFrI3QmgxD2Uk7I1mE3hCDG2KfbSHMYWoPW0qvESlfeoGCNmgn9IAn1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394178; c=relaxed/simple;
	bh=2BgtOKxU54Qrb38Y8VchBYSMlsdeK5aSiHA8l146HaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pvjZYpPzpoTeFvWcMD9h3zoOHTxzABpqssjVxzTivP0by7h0E8owBdysXOQx9hzKboQeCxI1qZxyIjjRQljeAJi+v8LCEKmm3aDys/uGdjFKahU/tf9pOIAdRovNH2H5cWz4sFiXoAS/0FqnNbdQ+1jLWeL5Cql9kRS/sfhRG9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hAHmBov3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hAHmBov3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D31941F000C4;
	Mon, 19 Oct 2026 07:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792394176;
	bh=onWXFAHmMMCGwN2tiwRj411Wf9RiuZvpWrVfItiTRVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hAHmBov3qbWdm1CRJoAatPyi9CSI2ShozEfhbgYQe0REDnOtxWorNrds8fKfxurz1
	 B2TEtvBxNU3zoMVDdE8c0o7Amc5YrJM1sFhBF5eGnfJ9NChPgu2Py3OQ+oCi/WeCWL
	 3hlM/McUeB8ugJh2cu1R5EtBbniJfgWrs/hklYqY8GrY75R/ehz2i33EF5o+Ucb3ND
	 eZDs0HQYAjhFWPzvoh/gjzDlWiqr4v6QCC7iq0oPqLPLGc406TmZp8F0VEw3x08o6E
	 +P8yUU+RWSK2ByIRR+7aQGNeapvwlHoC61Conjo93AwZ7GoJ1vNoEMBi4WFJzMtoOL
	 lqIhpSqJ8Yxnw==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xIhbS-00000008Fhe-2fUC;
	Mon, 19 Oct 2026 09:16:14 +0200
Date: Mon, 19 Oct 2026 09:16:14 +0200
From: Johan Hovold <johan@kernel.org>
To: pavankumaryalagada@gmail.com
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, elder@kernel.org,
	dtwlin@gmail.com, vireshk@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v5] staging: greybus: use %pe in error messages
Message-ID: <atXDvg_u1hQAZiYX@hovoldconsulting.com>
References: <20261018084925.11793-1-pavankumaryalagada@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018084925.11793-1-pavankumaryalagada@gmail.com>

On Sun, Oct 18, 2026 at 02:19:25PM +0530, pavankumaryalagada@gmail.com wrote:
> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> 
> Use %pe to print the error pointer directly and display its
> error name.
> 
> Keep PTR_ERR() calls when the numeric error value is needed
> for returning the error code.
> 
> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> Reviewed-by: Alex Elder <elder@riscstar.com>
> ---
> v5:
> - Drop arche-apb-ctrl.c and arche-platform.c changes because the
>   files were removed.
> - keep only the uart.c change, as the fw-core.c changes are already
>   present in staging/staging-next.

The commit summary (Subject) is a bit misleading now.

> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index d47f00751e7a..74c9898c0eed 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -956,7 +956,7 @@ static int gb_tty_init(void)
>  	gb_tty_driver = tty_alloc_driver(GB_NUM_MINORS, TTY_DRIVER_REAL_RAW |
>  					 TTY_DRIVER_DYNAMIC_DEV);
>  	if (IS_ERR(gb_tty_driver)) {
> -		pr_err("Can not allocate tty driver\n");
> +		pr_err("Can not allocate tty driver: %pe\n", gb_tty_driver);

There's really no need to print the errno here as it will always be
-ENOMEM if we ever hit it. You could even remove the error message
completely.

>  		retval = PTR_ERR(gb_tty_driver);
>  		goto fail_unregister_dev;
>  	}

Johan
