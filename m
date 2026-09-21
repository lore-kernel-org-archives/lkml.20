Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09B449DBA7
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997121; cv=none; b=QnU1z34436EMr77lRi/DgZ7n/Iy5d5ewyULNZlLYXePvEaigGb1UevlAjpNJgE04/LNHHQBrkQeWzEsl6Ku4TTjMZnb8hKouc/xiossJ1C+Pvd4Uy71eMkTirnIbiuslE20cIw7IcvycePu4Mn0F2Zl+1g9fdiKk1MAtkCVTJDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997121; c=relaxed/simple;
	bh=/xqjr+2Xo3jrZ5ZkfrAm2z8zJAmMGGRPHRuSgWfh7Wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lj33zgeNPfKqs6At3DgxmByXBs8t8uL6LoZQSEJf9Saw2+ghcqcmF/lJD+EX9Pt88iU2+sUtj7cwvtLR2xDjfS8BjOngLaES7BrzyPgyGKqIoFcM3S31JIJG7WtypeFYM8J8v/BYb2tJWRo3rlUb9GXsMgLfgB1YORjauRw4ar8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pu+kDZoT; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pu+kDZoT"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663c1so349059366b.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789997118; x=1790601918; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FWvOU2HFy2dN0GRMEA1Wtav+7uL5wo2+wayGCttWH+A=;
        b=Pu+kDZoT+l8RAm5kI3IT+kP1F4F6dvYP+SGh5VkNusGRRhet4fTEQK2x4eAR8Wjss0
         NdpDx0X8100q7ebUMnNv/jGRNDylHRDsqq5zQ4ljGJtnKTFEYMjKa9hX6Xue60k6jlU9
         d+bfS5x45ymR9xf5FhdO/yozoH1D7V92X1kSMSdKpxR8cu3eTt5AyDkCTahn2wTfMGej
         flMzadXpjAvW0Ul7p/Rkx97efonEjqb2pTdd0HbivyE4XrBhLhGRrpVU537obYEIWdGV
         gl+EuIDutA1rLvwWLtmcph/iAkOb2avaOY1y6tapWPJZTeTal+Pa4eAYwDMaWigSFopx
         uLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789997118; x=1790601918;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FWvOU2HFy2dN0GRMEA1Wtav+7uL5wo2+wayGCttWH+A=;
        b=fyvy1kHkHS7yGqbMirD7j3noNb9pqsxA0/u5S3Be6UnlNwgbnl9z687IMcmd8ER559
         D08fOGcmzlmbc80NGQE/Dcaw/a9xLew5ruT9v+wctJkawUX/f3j/mkNh9rZb4yxG+sul
         sWdeZU2YmJQAoxOcPlxGLABCB5JEu+CHQY4wMl7TDSYimigWuE4jvdExFV1EE3kEftkE
         7RrgLSHbCQLMdfQR79HQNftqFDWy1hf8JpRjl/O6RbPtkdyORZi9dx79uu4OP43CMCDW
         DcfWf+yKD5mK4GcZ583dvJphknJQn3ybHw1krkyIwDUipFcASQebfUmuQrlklhSN9Uts
         bUrw==
X-Forwarded-Encrypted: i=1; AKwUvByu1eA8MnVyw3Xj/QrGeJAWyyh2oVV4pntFxTb2rZfv1bQX4N0fJdbVfhW5n0n48qJZfQ6NhLrDBksXh8E=@vger.kernel.org
X-Gm-Message-State: AFuF++lPtNiLD3slHmI2LHnJ61JNkL0hsbIg49sTQ5YDp7G1JlKE7DCd
	huQpKbLVSMQ+oaI1AUYMhLZnbS1Pdchwl4wvTdX+XuKrhEQoHNkZz8oB
X-Gm-Gg: AYBFou36rbUkhEQzxkq4urRTwKlfhhadHtGmncaYsFXrE8mlXAzPkgDgmlMnXnlkzO3
	EkKgYnhFWWN+YcHCbgvSLhYxpmPa/0JFSfCxVntN5lRR67rtnEIS/7cfpW6veR8PuZ2qUhzC6Ja
	Jq3bEAqINtU6nWDhCxMOfWRHXn/Z9WG4Dyh45zSDszdxH3fNd9w4VdvtoU+5rUsUQkEL/eql1Nw
	ElEn2/yAcfrMsylEAHJzczvmIUqWc4jNOGZgZ9nhn2Zur/fB4aayEoIQvuvY+wJouPj+AwekG6h
	ajQiibqbgOM1wDOKG1tA/Gozq3KKgbzqyFDxKzcBNfdbcDqseDjpXIqCwD+26I5BJ0uBXLA1e1T
	K4Fr+ciUwh8x6GGFa6Z8YUgU4C7jWLCJrX5jJ+H9kAVnmzPDfoXQy9NooGhxGaR63UnM/MdJxKW
	/zZDDAa7axeKGt/AYKUFFXdRj4O/3ho9L4HYg5mwzPir1YxSlpsrU13teFEfUFoSCUuLs=
X-Received: by 2002:a17:906:99c1:b0:c29:f5d5:5a97 with SMTP id a640c23a62f3a-c2a15841808mr872916566b.33.1789997117983;
        Mon, 21 Sep 2026 06:25:17 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67c71c59sm4377622a12.1.2026.09.21.06.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:25:17 -0700 (PDT)
Date: Mon, 21 Sep 2026 16:25:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: UgwuRhema <hikarialiyev@gmail.com>
Cc: johan@kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: gpio: add comment describing irq_lock
 mutex
Message-ID: <arEwOc588OzriAf0@stanley.mountain>
References: <20260921122844.42816-1-hikarialiyev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921122844.42816-1-hikarialiyev@gmail.com>

On Mon, Sep 21, 2026 at 12:28:43PM +0000, UgwuRhema wrote:
> Add a description comment for irq_lock to clarify what the mutex
> protects and satisfy checkpatch checks.
> 
> Signed-off-by: UgwuRhema <hikarialiyev@gmail.com>
> ---
>  drivers/staging/greybus/gpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
> index 12185f7a9..7f19b3275 100644
> --- a/drivers/staging/greybus/gpio.c
> +++ b/drivers/staging/greybus/gpio.c
> @@ -39,7 +39,7 @@ struct gb_gpio_controller {
>  
>  	struct gpio_chip	chip;
>  	struct irq_chip		irqc;
> -	struct mutex		irq_lock;
> +	struct mutex		irq_lock; /* protects IRQ configuration and hardware state */

No, I wouldn't say this is accurate at all.

regards,
dan carpenter

>  };
>  

