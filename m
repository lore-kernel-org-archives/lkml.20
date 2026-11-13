Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563572;
	b=YaHjuyAV0ynOHvmBSqzFiZ15fRq0yQha53C5mCL3exbfcr3LpzRheCdiEW+vgAcmgJRl
	 AIhLlH3HG6muJu//6DlED1GYujd10GuUIvw3A2sQ2K6oVNjMzjUjMqhwiKv9Wg71kO1Sw
	 Zmr+vrrVdHn2JOZGXuxNVxktBWmmrLHbLVhApVnFj9EpuncWUV194JTxx9qCG5Wbfyr1q
	 +UuBcUH+IGgJ07UAasxwvqpwFkuMspTgXzgjkt7Z3YTy1mptyP5bAu6VZ/AiMxDUL6QFW
	 xP6AzRjkFBTPFD83MRFE3OmbOgGygZt26gsF6Yoce3ZC6H9z+0TvSTLemly1NY9u7lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AnA7uJSI+FmP/SSTgnturLYsnYlMVsJF1Sce6mnuOt8=;
	b=ezmk/XmaKqNiyoF1G07MLfyQzn8nwt7Et+Xn5VqJzEPwMM2bjJUXY7yape38lUuPxGfn
	 5h9Ccfb9QahbPBxFWRGcLb9xdjUHFODkrn+7TIiIJkfmPLTvmfLGxMrO++PtzIo5uNu4M
	 rw9sD+i32QkUvNCamZeGPYYlgnGXlVvtpg/d7QSYLGkGGmA7fpy/yKDMIyLTCS6wIHxUe
	 kWaIqBWgoZ2eyZ0B79+MGR2aQG/Mm+f9QbkMnQUGiYuZ+KQh7//f+TJpcvf4Xlh+AMBoW
	 3QMnQcERcxnJeJMIeZx5OGrQSPKhdO4q8hfRnMC4BNA2mf8Y945w7SLai0AOcKoVMag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tLsknzkb;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4B4606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD4B4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tLsknzkb
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc147d86bebso373355a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794563571; x=1795168371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AnA7uJSI+FmP/SSTgnturLYsnYlMVsJF1Sce6mnuOt8=;
        b=tLsknzkboX6RUWtslnAEiq5fjDbk9Ajab50yczQsFiX2aq46Vq4RrbvlrzoOm5q9Ls
         IZHdI9Ia2NJmFEZ0zhaSp8+YMWvqUd86TjgDw/QwA6NX12Una9hfb7HJ8T6q8kuh6p38
         izxnDvrK1jgNSRd5cq84BBhoKIBWlF9ro+YAKXynL2B8P7cXrRIJ+gfL3qqUj5VCguEn
         wZAVshwUqAZzCeKJtNb9JHqrY8q4fUf5V/iftMm/xhpENOouA8P8P4itkG26sge0ykiq
         zrkSR5siyd2gubX+w8DjYCm1noEm43VKG9LEGQ6M6Lj94qOx8rvyeLvo/0goNXr5auFu
         wjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563571; x=1795168371;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AnA7uJSI+FmP/SSTgnturLYsnYlMVsJF1Sce6mnuOt8=;
        b=yCCdWfgGW80Vm/KhXrotJO/lGRQnq7HVJ2SzEbgDIPBSQ8REXaA7AbeEQcZ5hAYDaX
         gJkSi3d9AckCy86ZkPTTy69Tr8fHe3q9QEOv6mO1QKjRGH/X8KB0YPOV8/vyF8jv8RZV
         HSDHGZQK2239/q3RnCO1Patc5LRDGZFOpfXld5cItS1qYe5hvY7cz8CdyG25hOjxlFDf
         h7WJenkpVW2jI0WeJY8KslCBnda2QuCM4RJdjVbQbCddyE08klko1C8dv8lsywsfPN9M
         jEY2xWBza+P47mawqlIMc9NYNiTF//ClMhPB5u+xKTUy1j1g24Phw+I34fh0GEr8CvAT
         hGmQ==
X-Forwarded-Encrypted: i=1; AL+hErHE8yZbG3Uxmq974oAiBoJP+zjYlBNCU571HpUfC8Eu9r1EUw1d4La2sO2BYDj+9OQo50vCiBkvgVldEEM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rCq8vLLSQQNcLKqwxvPLGBYEuf+0u9N9gqI/6ALxGqSXN8WNS
	TZ8sbUJYedsaZ74IB85cXIjAgL+TsakuZ9RY2lNYCERmnjBNygSZw0/Z
X-Gm-Gg: AYBFou0f7HgXnSpHEqjQpKOmGa57uMnkUP74q9EHas7zf/DgGrn+vG4bqFVU4c2crjC
	pO0wu/O58axTKhwZoVNd58Y3XXf3I9iAxXel2nqJiaoKdi2+b3PvhIbHzfusp3UWdvriDz3O4we
	uZBP7/Wl9fj8Z3srVRq0KTTijGMUnylO+OD/miw9wMw3F/nlZqwFCpJuO1mZ2HYLTJULSG1KLtM
	9tnWKDIRj+0COXEQuu3PF1FvAkiM/IaUszsQehwIXSsYSUCUK99kbEEocIjnYG0oXFY71h9SHSY
	OcId0AHgqVcuhWCqmKeisgj53jPW9EVZagni+c6JwWZVTN0hwI+g5xvLydqFycpiVfyYNI2u8HC
	vK5LuhhkxfRpcn+DQzAafmdyrZ0Xde9fgKnzZOZ+Y1/IDMvYM0P1Kg0qmR+UmfwI7tWzFK5tdsK
	l7R0+epcONzOEbvaZOxMttdr6MzWyHRMp+ItYWtQIxml+OOEnJGoo/aUbhkdzzkYH860x/kPbjJ
	+WUB22/QdhOyNvSzTF7hbo+v7F7+7VdXclejPQKK0wshes/H29sI1gSsTzNOJlcUEhebpETKzNn
	94qnh8I/G7BRRYVnq8U+CF+wwOnCPRrnxNmpQMPik9PQRs3bQA==
X-Received: by 2002:a17:90b:5687:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3b1b087c04bmr1164575a91.6.1794563571127;
        Fri, 13 Nov 2026 01:52:51 -0800 (PST)
Received: from rigel (106-68-220-184.tpgi.com.au. [106.68.220.184])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae981c55sm3893709a91.1.2026.11.13.01.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:52:50 -0800 (PST)
Date: Fri, 13 Nov 2026 17:52:43 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Adrian Ambrozewicz <aambrozewicz@nvidia.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 0/5] gpiolib: improve concurrent access to the flags
 field of struct gpio_desc
Message-ID: <20261113095243.GA103672@rigel>
References: <20261110-gpio-desc-flags-atomic-v3-0-2f463bce8086@oss.qualcomm.com>
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
In-Reply-To: <20261110-gpio-desc-flags-atomic-v3-0-2f463bce8086@oss.qualcomm.com>

On Tue, Nov 10, 2026 at 02:47:00PM +0100, Bartosz Golaszewski wrote:
> This is a follow-up to our discussion[1] about desc->flags and possible
> races with users who don't/can't synchronize with other means.
> 
> It's an attempt to use try_cmpxchg() to update only the required flags
> atomically where needed + minor fixes using atomic variants of bitops
> where it makes sense.
> 
> [1] https://lore.kernel.org/all/20261015153714.GA105746@rigel/
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Changes in v3:
> - Don't pull in bitops.h when including bitmap.h
> - Improve coding style: fix indentation, set mask later in the function,
>   make lines longer and more readable
> - Use the right Fixes tags
> - Link to v2: https://patch.msgid.link/20261109-gpio-desc-flags-atomic-v2-0-c4c54b476628@oss.qualcomm.com
> 
> Changes in v2:
> - Drop the custom gpiod_update_flags() function and use the existing
>   set_mask_bits() macro instead
> - Add a patch clearing debounce_period_us before GPIOD_FLAG_REQUESTED as
>   suggested by Kent
> - Rename the functions updating flags in gpiolib-cdev.c
> - Don't rename the flags variable
> - Link to v1: https://patch.msgid.link/20261104-gpio-desc-flags-atomic-v1-0-e23cedf619ba@oss.qualcomm.com
> 
> ---
> Bartosz Golaszewski (5):
>       gpiolib: don't overwrite the entire flags field in gpiod_get_direction()
>       gpio: shared: use atomic set_bit() for descriptor flags
>       gpiolib: clear debounce period before the "requested" flag
>       gpiolib: don't overwrite the entire flags field in gpiod_free_commit()
>       gpio: cdev: don't overwrite the whole flags field when configuring lines
> 
>  drivers/gpio/gpiolib-cdev.c   | 93 +++++++++++++++++++++----------------------
>  drivers/gpio/gpiolib-shared.c |  5 +--
>  drivers/gpio/gpiolib.c        | 35 ++++++++--------
>  3 files changed, 65 insertions(+), 68 deletions(-)
> ---
> base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
> change-id: 20261104-gpio-desc-flags-atomic-cc963a1ccfd0
> 
> Best regards,
> -- 
> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 

Reviewed-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.
