Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793437148;
	b=teqii5CXPWT0t1r/ANqFnuMd9NzIH18MQ3bhmhNrgsnWofcdQDBoEBUbCuAq4DYjxuKk
	 yPLpUDJNZ/wXCY4X/1qwc7IByv7AP/NyO5XBaM22f6+FTsRAMp4J42xnTKh1aJzJEIl9N
	 MnqWHLPDbsdYcOKAjbWiUQ1ozkJ7BrYFIOORykWVLVQR0nxg1E9iUn7F8Okra1mh1WqW8
	 nnyF2K4QEulnIp0ol2FgyGnlxdKpw/9cXa4/MLMoXTiI1urYHQ7u8rciHF8i5qBrV3Kqu
	 xqKY8PluomonH/5YWuWPuYIbupPKM7CsdnAHM77NqQY24Jv+uBGLXIymj2j3HyG/+KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793437148;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xGHQ9O96biipkIOyFjs7rqOf6N+Kw7p2wP2A4xZM9MQ=;
	b=YGGMoToiqPRFJjxjLcdKJk+DQCtNNQzgbYfu8VAaB2LAkDcK4/2/TQ+As1BGnh8Fw4zl
	 cV2x5O2Fe1SbTfA7IGr30PMaAezjNzVgIeN+r2e4jDyO9/VfEZ7IvcJvkvfgrBOHLPlDg
	 3UucQfEoWNJ7o1ct4lDEZf5AuVzPghrGoUn3TRdRvRtkoFJEU9AN0Jvn0lOaLmb7sGen/
	 OoLFBE7+f3tynyHHg2awNGef3naYm5b51ZbGcmP3z9vPqEmnbEE+I87Fht8A82suU5bFk
	 fn0HRNdSP59bPygrK20sr0sl6mpz3rjkTKNU4qeUTPrhBa5/dRoTAa/yp1MpIuQv7+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="E/lW1uVJ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EDD606A31A;
	Sat, 31 Oct 2026 08:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=E/lW1uVJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5FF61F000C1;
	Sat, 31 Oct 2026 08:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793437147;
	bh=xGHQ9O96biipkIOyFjs7rqOf6N+Kw7p2wP2A4xZM9MQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E/lW1uVJux78tQdU/LfHqapXVy3ewIhRcQbWsy9eNpCfRBADSQivpGghx2XEiUOoW
	 ho4Cuo0HYMUCJhWj29AKTG+3faxJWWUopOKZ0YCQOEzaCGYJkYcn/EQxOzZJBZBuIU
	 LZJ9xRKcS3lwuMmSuY+NWG7656GOIVvMLsI+3ncw=
Date: Sat, 31 Oct 2026 09:58:59 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kenzema <ken3009le@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: light: use sysfs_emit() instead of
 sprintf()
Message-ID: <2026103138-chokehold-payer-c603@gregkh>
References: <20261031084813.214366-1-ken3009le@gmail.com>
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
In-Reply-To: <20261031084813.214366-1-ken3009le@gmail.com>

On Sat, Oct 31, 2026 at 03:48:13PM +0700, Kenzema wrote:
> According to Documentation/filesystems/sysfs.rst, the show() callback
> should use sysfs_emit() instead of sprintf() or snprintf().
> Convert fade_*_show() and color_show() to use sysfs_emit() for safer
> buffer handling and consistency with other greybus drivers.
> 
> Signed-off-by: Kenzema <ken3009le@gmail.com>
> ---
>  drivers/staging/greybus/light.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index cab02b5da..2689f9a75 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -173,7 +173,7 @@ static ssize_t fade_##__dir##_show(struct device *dev,			\
>  	struct led_classdev *cdev = dev_get_drvdata(dev);		\
>  	struct gb_channel *channel = get_channel_from_cdev(cdev);	\
>  									\
> -	return sprintf(buf, "%u\n", channel->fade_##__dir);		\
> +	return sysfs_emit(buf, "%u\n", channel->fade_##__dir);		\

Please read the mailing list for why this keeps getting rejected.

thanks,

greg k-h
