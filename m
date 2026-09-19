Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6113DAAD7
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 09:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789810286; cv=none; b=ZF/Ehs9vAZLEq/q0d3etQJkCk7+7ga2Es4/OgwqUwJHhJP0BPRMaJP638HwN2VV8f4uqCi1PCJDbiTW8UBSLfEuocjU9RKiJmC5iTqlOBuzzmoiKMfDSEMxE5eXfiKfzxuufNZrPTnqtU9fF4vucGZapqfepJeSZCI6f/YTIl2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789810286; c=relaxed/simple;
	bh=SNfprDKeEAk5wYlgA1hVVVIHsXt+aVLRxcUxr1jrF80=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pq6kH9aYtlzOUkSn0Ab2m4nh72MvPirl4L0edsQrZ+H8jBmHZF+IahrYVyrqrqeBdo6CPNOpmduiNghrJIWfsXwyU6JuqRrkYZrcHs+y8dnw9XJNejzm8y8Gh7N2il1wb1S/KL/khFVuOXrqLP+nOtR8rJWvee2KBWSnj6lxkG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKn2xwFT; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKn2xwFT"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so12848155e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 02:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789810281; x=1790415081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+PkC9L5fOjPL6sBbulqfAvEH4cZDiVNQRsYYaLvTHWM=;
        b=DKn2xwFTnC+wJL22N5WBEj3tVZ5lfqG9qh1CAP7+ALustf/oXZJfmtLiZP6bSGOo2C
         YXuuB0C8hRkfK1e++b7vlapQtHhFkA5tm90+YGqjuiXsPymdUw2o3YpST+WmTpxMZWb8
         ZXzNqpkcV1a36y7fRsK0+PZf1CRLswvANx60aJwspyX2o7Px2GK3S22SV1Pyv4YW70ck
         /7Z0PEtVt9rxfwVQq6popeF/9rrRuX7RYFlzeaeKa4/q+rFHM2Lc9yNY+jLoZjfv0uvB
         hHAlAe+EIHnPgGm81aCFe9eHNifg9/WAI1uQ+SgCiswbfRW9/j3foRsN+03V2s5WhfBp
         597w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789810281; x=1790415081;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+PkC9L5fOjPL6sBbulqfAvEH4cZDiVNQRsYYaLvTHWM=;
        b=UdQSncl4myxE2XTbFLCATlnz53DEs6+3LNoChQBADC+LDNu7HFcogM52gKkNSuzGJ1
         nD8vYvjcGN9u/g3mrsTIwyCBGJVE1p38TLp8kpGKAFHQR3KMmnwOLSEo4n8IWwFF4DSQ
         b5a4zb5PlBHOGaLIJn2X2WPgJW4o4lnLsKpbnQX+3A++X4LocjV2xsf7wW/igQ0UaQ5B
         z6lom8E1Q+wfoiazzwT/CQNmQUxn8Wkp4G1f5sS8PtaDIQoB3EUKVs72jSx06AE4qY6I
         FlK+PLd6lD/MeizCUBLhbc4ISehGMXm+OpHQE92Xg6ZfC5LDIc0qRv6MNZexsnWQtj6z
         h1GQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMZ8JId4iGYL2PP/aAUeVgugztXIWecCPwYM90sOol0d66YqRTG79JrVgAGmVxcBpApIaRTtIq6cIdY3g=@vger.kernel.org
X-Gm-Message-State: AFuF++kpPO7teC02kelRR9gLo0Oa+SX0+SJCMnJf5aeRrWtGNKg+O+eD
	OxHFJlE1LJqbNmYaWgkeuCXWqiU7e0EFg4oZYZ367cfTkdftk3Rs8QbG
X-Gm-Gg: AYBFou0TgTWHmkcL54ZpPX4Ynxd3zAY6e45iQY7JpCLtAdkRI5bJewf65RUAKXJj5Rf
	JqFQHb0BcuagsZLEbY1USrw1dZiG202TOszbzdRsOcNtwtahKuAdAlXrxDAWpRKC9t+hIp6EYNz
	LRxCLR6yg7+WP6GKTHK38onYgGvfNOgJGpWF30LpCVU5LW0AtwPKPxxNV3cPHHydGsev+jNVxc6
	De2lPRI/EPRjErKHoQ4IbojJOmrUdasZD/eakSaLt/mG7JAvmwpAzT7ypg8IWnWi4x+lNbxwfLi
	RyIpE30bZ6Z8rpqTnH8i8H8Ay50yT1iAv26ecpqJPvPzLqqElyfARkilgtSbE4xQUn01O/YMgLu
	cK2z6zV1Bp2ybV6CmkVAT9WV67uQ4wR7/FjKaApStGgPGX0q5G7o39f1YMjbY1OmkH9qk1kzcNy
	FQM9BnA6xx/7Wupxavfb14POeqPQkBOkCRX1h/urhskGaZAFqR1dJqsVbNgISVjbaCRLS3EU10u
	OfhLGsQ5gRwjU2sId4qVeUxboSCqL8C4Gjui8DQJo+bmX8sRMA+Wugqf7ocg7hn6apnNU69golA
	j5tZBQ5vT1H7CsdaafpZTwxJKqO5GRSF7fVN0pPmK2skYRVfYo2wqQ6HG43BfBkYanWOm9acKQx
	epZLZiOek1ADO9vETxaerWsmZO07nQeY=
X-Received: by 2002:a05:600c:8b61:b0:49e:69ff:c6b1 with SMTP id 5b1f17b1804b1-49fc5749edemr79130785e9.31.1789810281330;
        Sat, 19 Sep 2026 02:31:21 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd086ce9sm85591855e9.12.2026.09.19.02.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 02:31:21 -0700 (PDT)
Date: Sat, 19 Sep 2026 11:31:18 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: adc: ad7816: Protect sysfs attributes
 with mutex
Message-ID: <20260919113118.51036850@systembl0wer>
In-Reply-To: <20260919085513.9173-1-abdelnasserhussein11@gmail.com>
References: <20260919085513.9173-1-abdelnasserhussein11@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 19 Sep 2026 11:55:13 +0300
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

...

> @@ -143,6 +143,7 @@ static ssize_t ad7816_store_mode(struct device *dev,
>  	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
>  	struct ad7816_chip_info *chip = iio_priv(indio_dev);
>  
> +	guard(mutex)(&chip->lock);

+ Blank line.

>  	if (strcmp(buf, "full") == 0) {
>  		gpiod_set_value(chip->rdwr_pin, 1);
>  		chip->mode = AD7816_FULL;
> @@ -207,6 +208,7 @@ static ssize_t ad7816_store_channel(struct device *dev,
>  		return -EINVAL;
>  	}
>  
> +	guard(mutex)(&chip->lock);

+ Blank line.

>  	chip->channel_id = data;

With these issues addressed,

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
