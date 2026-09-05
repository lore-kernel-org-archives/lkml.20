Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534A237189B
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 09:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788602319; cv=none; b=EotqVJHv9Or3RCEmSF9HgAhWvHN2Twt56GCMusAWtpQLEyy4iTM8+itGZlks7ApqFGEcWpIbf0dj+m1iMsTXB8GmazmmeNp1G8CnLM3RrcwZb5749nk/oujx9EU8Bn9RnISwSH1ib+aSUJFKXIjJ05pQ/UxMhERIwXXwJKnlwMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788602319; c=relaxed/simple;
	bh=TPh+2S4EjKCMHY3hnA1MkQOSVSa14YnYfoTQlZcQt2E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uWsjgUKYS9cTPHFCEIY7BtQbleoKqAB9wb1BrjjFy1Zd4fzs/THXiwJgwy+D01EjoxiyWqnCVTRpQz1dx1uB7hfg7IcIvMiVTRT8JH1yKYeAbTwtZHCUfoXn+7D7t0oyqu+t0Es2cdgLo9VUmPIf6YgMasFVBQDKU5hoWhpon2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MrInLqgZ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrInLqgZ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso17350425e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 02:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788602316; x=1789207116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LRvfrJeL7Y7uiXmrE76Xnc9F45gApWlV6DJkXBriHZU=;
        b=MrInLqgZZ2G0DU323P7nuVaEaiSPB7ygZirYEOcWRj6wZ9IUJTHHak5z8WiD/8QnNI
         V+WYl1caKgROyCWZlCJvDCgyy9fgRtMNQG185gHoWGmRWeoyIuLhYMhIJAltuIEufuZC
         RBDeAgEAIQDNdAEnd1PIiW1GUFuXVLMw2OoV+qPLaFNdkEbOqOsZO7xW1H/ZBSK6gGSz
         cPyD2Gz2bZCo7D/EtKkpleaPEyyjOUjnia/FBwik0WE1g65XRVA2DsScmI2FkSJEFptS
         26FU3WS5miDLXGU3QGoUMGSiOFhRvp8mAOfXiYZqZOJTRkwhPH5C7CEbtncjFkt0mfur
         wA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788602316; x=1789207116;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRvfrJeL7Y7uiXmrE76Xnc9F45gApWlV6DJkXBriHZU=;
        b=UqWQWDTbquAiorrR7iYO8L3bxHWnKN2xbU3A2zhxLTzG1V3tO8v1pdG9RNbS4U6UHy
         6JcAv9n3Cj7rH03FV0rQl6zpYe3wRNPWnQhFaB3lzCrFQafyRXu8174g4QIhCPFtq2so
         p6bw6DezIkm5h0glUjARkIy1JlaK4TA1cG4OOMsfmeMzLCTredK1CmzN44dVoPWYyIsm
         thnQwS0D+Q/NxK2hvDn5wUOsM6nugnalAtF7aWjWeQjylyHznH+amrhjqzd9K9sqwtEf
         t2oOOLGTj7INmi/a5QTg28A4XWOcOh8p4ASloGxzK2739uy7G+fhM4fr5wIkIT4Diwm1
         gJGg==
X-Forwarded-Encrypted: i=1; AKwUvBy4sg1AK2oTwiDj0sxutKCRuybcCHl4o1mloWiU01vL1JJlLIhl39n6SQao/CndexqjJNj4xJhWw9cZvBk=@vger.kernel.org
X-Gm-Message-State: AFuF++mwQ7kWOwIojXvY9POH/fY3NxXx6HTg4ilWSY8KwxEJU4OSQpW2
	NgpdgHAiEqGBs705oari03xrdXNmgB8BeWUfZ5HmYFoGfVD9aEO2oCIL
X-Gm-Gg: AYBFou3uUw35c6Bl/ZYR+0MHFJdUp2EN2xrkmkztDzlQ+yKUpYWJZfXG8XTQ3pFCF08
	w4ub/X9hItUktixifbgJBtxBfzoVE3xLWpJyanJ+0eHFHDaVgN/9+EfgpnnvmlZMl8+qj89J+JM
	tdo8Ni6TkIbIv2sJUwartjK425xChlSQ4Qbo8rJ76Fam1xJXe22AloFk1DruDyZMQ1NtkcZiBBp
	7Z5a5T0J70mK7vUR7x9DsERRKlbYo573QiJEXByf40O9u1WHXDlM7iRPtK5FywfBwDC/Z3fjp5I
	wesyNQjBZosIQYnmZ6A4YSE5v1XMxqHffnLTlnCHQDUJuLXERHkC/8T+Z+h/AoAi45e7bm9oykL
	jd+PWNKgePNvFIQDFNbCgB2G+jUFkSwx2YPoj9aVQRxwlAtcPVXIECWcYJ2+48yUWK78uWg6ku2
	0OeDxw7VKAf/iqDTDB8SzCJ9arOS6xivgjK9MsKsvUtTcurCa1vtdIGpg3H+rEvdeLXY7tw2DXi
	6AcB4rX4zdiTZaE1At8BmGxJ1c=
X-Received: by 2002:a05:600c:8b6b:b0:49c:e1cd:536 with SMTP id 5b1f17b1804b1-49cf826be5bmr111021015e9.12.1788602316474;
        Sat, 05 Sep 2026 02:58:36 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6158e9sm220352435e9.12.2026.09.05.02.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 02:58:36 -0700 (PDT)
Date: Sat, 5 Sep 2026 10:58:32 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J.
 Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v1 1/1] thermal: sysfs: switch to use scnprintf() to
 suppress truncation warning
Message-ID: <20260905105832.12192997@pumpkin>
In-Reply-To: <20260817103324.1020212-1-andriy.shevchenko@linux.intel.com>
References: <20260817103324.1020212-1-andriy.shevchenko@linux.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 17 Aug 2026 12:33:24 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> Switch the sysfs code to use scnprintf() to avoid warnings about potential
> truncation of the names of the sysfs attributes.

It has to be a 'bug' that 'format overflow' warnings are generated for
snprintf() but not for scnprintf().
They really shouldn't behave differently.

I did some tests a while back and the warning goes away if you do
'some things' with the result (like comparing against the buffer size),
but even explicitly ignoring it with a (void) cast isn't enough.

Using OPTIMIZER_HIDE_VAR() (or an _VAL variant) on the buffer size does
stop the error, but I expect gcc to start checking sizeof(buf) as well.
So both arguments might need hiding to get the warning ignored.

David

> We can't increase the buffer
> size because the size is the part of an ABI for some reason. Note, with
> the current size of buffer the affected attributes have a room for up to
> 1000 names, which ought to be enough for all cases. There is no functional
> change, as the same limitation was implied before.
> 
> Fixes: c56f5c0342df ("Thermal: Make Thermal trip points writeable")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/thermal/thermal_sysfs.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/thermal/thermal_sysfs.c b/drivers/thermal/thermal_sysfs.c
> index b44abfc997ed..44bd7c50e4ac 100644
> --- a/drivers/thermal/thermal_sysfs.c
> +++ b/drivers/thermal/thermal_sysfs.c
> @@ -400,8 +400,8 @@ static int create_trip_attrs(struct thermal_zone_device *tz)
>  		struct thermal_trip_attrs *trip_attrs = &td->trip_attrs;
>  
>  		/* create trip type attribute */
> -		snprintf(trip_attrs->type.name, THERMAL_NAME_LENGTH,
> -			 "trip_point_%d_type", i);
> +		scnprintf(trip_attrs->type.name, sizeof(trip_attrs->type.name),
> +			  "trip_point_%d_type", i);
>  
>  		sysfs_attr_init(&trip_attrs->type.attr.attr);
>  		trip_attrs->type.attr.attr.name = trip_attrs->type.name;
> @@ -410,8 +410,8 @@ static int create_trip_attrs(struct thermal_zone_device *tz)
>  		attrs[i] = &trip_attrs->type.attr.attr;
>  
>  		/* create trip temp attribute */
> -		snprintf(trip_attrs->temp.name, THERMAL_NAME_LENGTH,
> -			 "trip_point_%d_temp", i);
> +		scnprintf(trip_attrs->temp.name, sizeof(trip_attrs->temp.name),
> +			  "trip_point_%d_temp", i);
>  
>  		sysfs_attr_init(&trip_attrs->temp.attr.attr);
>  		trip_attrs->temp.attr.attr.name = trip_attrs->temp.name;
> @@ -423,8 +423,8 @@ static int create_trip_attrs(struct thermal_zone_device *tz)
>  		}
>  		attrs[i + tz->num_trips] = &trip_attrs->temp.attr.attr;
>  
> -		snprintf(trip_attrs->hyst.name, THERMAL_NAME_LENGTH,
> -			 "trip_point_%d_hyst", i);
> +		scnprintf(trip_attrs->hyst.name, sizeof(trip_attrs->hyst.name),
> +			  "trip_point_%d_hyst", i);
>  
>  		sysfs_attr_init(&trip_attrs->hyst.attr.attr);
>  		trip_attrs->hyst.attr.attr.name = trip_attrs->hyst.name;

