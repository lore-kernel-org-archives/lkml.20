Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=195.140.195.201
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794517670;
	b=ZMD1rOOLkSLA+ED/p5YeS5s3fr+om1OYA6wqqjDvNIC0YUVp3Vqh2Ln9gKQHe46sF6oe
	 ON2vxFtE+/Rfhh6oLko3yaT736JM1cM2ZzvfCUSvimsZ9Y8XuUmV11dqdcW5JnYm9rUi9
	 /IFHCCKtU81oTJ0iZbABjg+AdYZ+W5KOic8QEPvHX6AS1gKEySKZNaAaoUdI5A5Go4lj0
	 WP3QAFIGbgt9AFsqKslWWWMUxPpGtKJflevZ1wEqTEoWeJ4mt9naa8qdlTzl3gs5x59V1
	 oNx5pllxMHlvtH/abxy6PfTdxd95PpRoFTesiz+vfmXjPU/Z6sY+bWzuGA4nwQyh9sg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794517670;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=h247NrE2wf9e0vD4Qp+rkJL6bklSEl+6oUbfJ0ZIchA=;
	b=SUEtW+kaDC3urFvTGwRCa/Gq7WA3+Y1xl7lHVZNyCwybvTRS7OhAGnHAAzHLQ85I+K5A
	 QdRBbJQIzZGTjgn2xJy3ZEqN7splg2HfGS5x77wUXD57ugXuHOXzjJxKti57G6EpOhL0a
	 9kMk9BCVqympysjd4oc0GagEdl9vF3z7NAKy3oUz8XQAmx1EWbkfmJ8Yzpjp8PfSJk5yt
	 ahsKx7QjDTkOZPyu7GE+RxG3Kh7u7YaDj5XLMuzs1JtD4BKwaDJDJmO9AJtZKxlNpSb8A
	 cj81xF46hxaiUFJ+Ft+LoQUhQyoL6dCtfmSOT6Qy994B/6M9a7XOCoIv4Ail1RYll1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=iki.fi;
	spf=pass smtp.mailfrom=iki.fi;
	dkim=pass header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=meesny header.b=cSjyDTp6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=195.140.195.201
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AAF606A321;
	Thu, 12 Nov 2026 21:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71AAF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=meesny header.b=cSjyDTp6
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4jQXyw53rNzyRv;
	Thu, 12 Nov 2026 23:07:36 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1794517657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h247NrE2wf9e0vD4Qp+rkJL6bklSEl+6oUbfJ0ZIchA=;
	b=cSjyDTp6p7egiolYYYHbxzrKInppPg2RE/E7GPq/1l9EWlkMjvnR/hJsTFSsPS021+aT8q
	geLOpA6kElmi+A4sE0X0eKlzSN1QwGdaOCv4xj0skTZ3YEigQe1ERbd5625la6zAFDFxKL
	YVXGLArp9M4SNcp+d++06DuEtryfwcs=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1794517657;
	b=U2gxOwIlJQq/wEFmNIq1rckRSB19NEpbvRDSmeIvYfRPtN57+nTJjYR6D7GBnotpXkSWQv
	7RDH1KM7daI1XoKB/mA90NzjNjcnW6KGUMVEMC9gIonlK0SyUS1q96wgAjLfCeRwWS3q17
	ieWSggIm25MgyuIvUtOizNmW3Wy4n2g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1794517657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h247NrE2wf9e0vD4Qp+rkJL6bklSEl+6oUbfJ0ZIchA=;
	b=nFIeQKoPg1dYXvsrIqKbdPdvP/+ohM7T4fzLzvTKoegWLJ82RDxJ6MxH6WRPkAaPh/Pv9v
	jDWKb/m0ZX/pTG8gBpjAzN8OgTziwhvXVbMtRCxpML5Yz4BirlSw4hXoIhBq6wJGQp+xZh
	Nq3k+dPmfi+3VMzmB+cXWYRBmh3qDGY=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 00249634C51;
	Thu, 12 Nov 2026 23:07:35 +0200 (EET)
Date: Thu, 12 Nov 2026 23:07:35 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: mauriziocasciano7@gmail.com
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v10 05/15] media: ov8858: Add INT3477 ACPI ID
Message-ID: <avYqlwBqLvQj6PIt@valkosipuli.retiisi.eu>
References: <20261002-submission-media-yogabook-v10-b4-final-v10-0-817ec765b257@gmail.com>
 <20261002-submission-media-yogabook-v10-b4-final-v10-5-817ec765b257@gmail.com>
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
In-Reply-To: <20261002-submission-media-yogabook-v10-b4-final-v10-5-817ec765b257@gmail.com>

Hi Maurizio,

On Fri, Oct 02, 2026 at 10:57:43AM +0200, Maurizio Casciano via B4 Relay wrote:
> From: Maurizio Casciano <mauriziocasciano7@gmail.com>
> 
> Firmware may use INT3477 as the ACPI hardware ID for an OV8858 image
> sensor. Add an ACPI match table for that ID.
> 
> Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
> ---
>  drivers/media/i2c/ov8858.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
> index 64532237e8b5..c747ecd9e908 100644
> --- a/drivers/media/i2c/ov8858.c
> +++ b/drivers/media/i2c/ov8858.c
> @@ -6,6 +6,7 @@
>   * Copyright (c) 2017 Intel Corporation.
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> @@ -2093,6 +2094,12 @@ static void ov8858_remove(struct i2c_client *client)
>  	pm_runtime_set_suspended(&client->dev);
>  }
>  
> +static const struct acpi_device_id ov8858_acpi_match[] = {
> +	{ .id = "INT3477" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, ov8858_acpi_match);

An ACPI ID table in this driver has been added by commit 41a9840e0caf5 .
Please rebase.

> +
>  static const struct of_device_id ov8858_of_match[] = {
>  	{ .compatible = "ovti,ov8858" },
>  	{ /* sentinel */ },
> @@ -2103,6 +2110,7 @@ static struct i2c_driver ov8858_i2c_driver = {
>  	.driver = {
>  		.name = "ov8858",
>  		.pm = &ov8858_pm_ops,
> +		.acpi_match_table = ACPI_PTR(ov8858_acpi_match),
>  		.of_match_table = ov8858_of_match,
>  	},
>  	.probe		= ov8858_probe,
> 

-- 
Regards,

Sakari Ailus
