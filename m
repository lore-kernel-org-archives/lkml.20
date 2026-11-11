Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379972;
	b=LW0LBfN/2HaV4jXnLltmrzRFaEq1bnzTyvTIIuRnUUqhooWWbdKTKnv1/pTmeqSiq7Dk
	 GvU/Os/jmsoO1YjFnJvIYJYp9rWRg6MEvkWufq3Prv+rAgtE43OPAeqGmy0w6fLCAi4iD
	 OsVHdJksKgfy4EsCYWUAt5feBttBlDiBEPnbnTEJP8fHyxE3q4R//1kAjII0W6Tospogi
	 IG+m916mrjmSdM6TNfL51y+/rIVf97l6vkWDqhGimEdVMypoe02ZjrWB3OQ1s8LitFpg2
	 pTkPYLEZXKpbO1dpwCsoNyozU/bnXtUtwivvfqVXDSNK6nWlGI5M1DJ0f2MQ4bAN66A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379972;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=HoW2S3qODYNFsPuLH7g4ByB0FMG1OvwPNnRs8ajNsfA=;
	b=rjHt23Cgc6LTV7qkS+XTVWcKoGIw/O6keyJhZmotnoXAEVkR2V3u6fjrmK3buheXz70I
	 7cMQWgLIQ9F2iI2kWvaUmjT+yeavHQAjxkAOF1zbZnpq9Z2UrOSL0mUFJ7aXmTrxa0E7S
	 sodmFkns/1ce012jpuAXCfC0LFsy1mBO0dm2o/bkdYhydRA7xiLSDZKwbeYbyOvoFZki+
	 IdiosThjDkRLVUtdi1J2PLH0bTyKUxKdx9qPFjxG+NajcdexdjKedjcpSb/SIh7j6+bgY
	 LvpWeapPR4r6tXMsA9V5C9/ObSRZzx+06E4CNK3l8+ZMmLKzuFfh08HEZtv1AS9ojcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cryspen.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEB0606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FEB0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cryspen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so34591825e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:52:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794379970; x=1794984770;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HoW2S3qODYNFsPuLH7g4ByB0FMG1OvwPNnRs8ajNsfA=;
        b=tmqHk6oJ8bdxGULavE0vuqVqHbq7DC8xDYrwuo5D7qVOn0lG4R0sWzbS+KnovuzEqM
         r/m2CF7H3BbRT0oHj0ByP+IQ71KqLrBxWwWX3cRhoHWK1jjpu4Hn6tBJoB3a9e/kzQ1E
         cPW1xBNDhEgYCWBOxCIbrEZgMBJrpSOBHtffy5jRSvm0bSa0gt2nW2FGWA1Ghw/szG+8
         EYrCln+G5vWK7wi7hnrEqt15oXkOLWAHW727E48T0A0qBB+GDuQVbE5m4FjBdEMxAjak
         zqk8/Hifek2yucdqlILujlcdqbVE1kK0tMbDxeo2tCh7Dh/TmD7p2vYCPF1rh+M1xOt7
         BoAw==
X-Forwarded-Encrypted: i=1; AL+hErFdu1zmTP6TaJDjWLaNXf3iwiN6BQ0UFOq6PtdziZ1cJpZ09cmJer6p4Oaz5wJPDTOVwRvhTgZSHnGej+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+y2+Ui1WVEzg2Wg+yX3uTPA64Y9lrYopHhTtG4XKVf8LghyhsM
	lKFcsZCmwYvgIvZNjPE1y5N5dzNebWoAsqZkTb2i9lsJLQoZoxKwbuI9
X-Gm-Gg: AYBFou3VtVMswBf30PETEM70LKJAuD4tPMuTLbkE0EZ0VvqW+u0ZNLiQqa0c1cgORxy
	gtZkTwAsPZZr8kRhZ9wEviCci6WfDPVbPxoruBMXuMQblM4DYzH+mXY2o3JW8C1HnGem+jta4Kt
	484PNGoQRuBQmZO4wkkvQbPxZ716kBmQzAnjWtuYasJfSvHbkSddT7ucMQ+bRfsgG8YbY+fndSW
	pIW4H1EIzLZKVTo2StUykDWHS/5O59lRA8J37ou3lx6J83FzC2T8bOEjHisyzNlVH5FcbReuLjy
	sWAN3VmHMz1ZcuBPZReoAhcjX4eUEz1y0uBm7YtbTWouy+lwZ0lvYRF7wGQzqBgNC639Kt5QtL8
	39rUQufUNvn2XOhclp8I7csPFFnijUZDpshajwUBd8Ldjddihf8JKckTUmhPkilAFIuwQLWUkXb
	2Xr1HXL2H126X67mQngfTY8u0ZpPf07Wvf6qznoV3IGYXgjBtfmHfLe4wiUm1HmCEj0mMXJWLJ9
	+Wz41PguCy9LoyZLFT14ixo+rdYr0lUkIl+i2y05ZO43h3B4p4bOvp/Fbv77e97Ms2jJdBa1vg/
	8hkB4/9tN9yGFXQtAcfNLEhG72nspdUJ4ktrl7AbYDxHETmmArWz+/MJEJoX8aJoEzM6vPyVrSL
	wkcU0pyks+fWrFpL23bAvAFXvW6hcsfwG7KOGGYK+GeFUgFLDNMGwCKUys1sXQhSN
X-Received: by 2002:a05:600c:a00d:b0:4a2:1a:a129 with SMTP id 5b1f17b1804b1-4ba093b7ffcmr22597675e9.35.1794379969657;
        Tue, 10 Nov 2026 22:52:49 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0203a763sm116775375e9.4.2026.11.10.22.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:52:48 -0800 (PST)
Date: Wed, 11 Nov 2026 09:52:44 +0300
From: Dan Carpenter <dan@cryspen.com>
To: Nithishvelan M <mnithishvelan@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nuno Sa <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: frequency: ad9832: use guard(mutex)
Message-ID: <avQQvHuDsW8XTfgj@stanley.mountain>
References: <20261110164711.552-1-mnithishvelan@gmail.com>
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
In-Reply-To: <20261110164711.552-1-mnithishvelan@gmail.com>

On Tue, Nov 10, 2026 at 04:47:11PM +0000, Nithishvelan M wrote:
> Use guard(mutex) to automatically manage the state lock in
> ad9832_write(). This simplifies error handling by allowing direct
> returns from each switch case and error branch, eliminating the
> manual mutex_unlock() calls and the goto error label.
> 
> Signed-off-by: Nithishvelan M <mnithishvelan@gmail.com>
> ---
>  drivers/staging/iio/frequency/ad9832.c | 47 +++++++++++++++++---------
>  1 file changed, 31 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
> index 35f823f24..227dcd739 100644
> --- a/drivers/staging/iio/frequency/ad9832.c
> +++ b/drivers/staging/iio/frequency/ad9832.c
> @@ -8,6 +8,7 @@
>  #include <linux/array_size.h>
>  #include <linux/bitfield.h>
>  #include <linux/bitops.h>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/dev_printk.h>
>  #include <linux/err.h>
> @@ -188,52 +189,65 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
>  
>  	ret = kstrtoul(buf, 10, &val);
>  	if (ret)
> -		goto error_ret;
> +		return ret;
> +
> +	guard(mutex)(&st->lock);
>  
> -	mutex_lock(&st->lock);
>  	switch ((u32)this_attr->address) {
>  	case AD9832_FREQ0HM:
>  	case AD9832_FREQ1HM:
>  		ret = ad9832_write_frequency(st, this_attr->address, val);
> +		if (ret)
> +			return ret;
> +
>  		break;
>  	case AD9832_PHASE0H:
>  	case AD9832_PHASE1H:
>  	case AD9832_PHASE2H:
>  	case AD9832_PHASE3H:
>  		ret = ad9832_write_phase(st, this_attr->address, val);
> +		if (ret)
> +			return ret;
> +
>  		break;
>  	case AD9832_PINCTRL_EN:
>  		st->ctrl_ss &= ~AD9832_SELSRC;
>  		st->ctrl_ss |= FIELD_PREP(AD9832_SELSRC, val ? 0 : 1);
>  
>  		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SYNCSELSRC) |
> -						  st->ctrl_ss);
> +				       st->ctrl_ss);

Please don't make these sorts of unrelated white space changes.  They
just make the review more complicated.

regards,
dan carpenter

