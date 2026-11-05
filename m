Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896914;
	b=RQTfSxbrvTiYFrEji+czZ0IzUP15fPjsPnaKw+Rwq6jg+8o4ZwB3KUW1bBLtl5vJzVFV
	 AUs9lynGYCpWVhsuSlga8kvBIki1Pr+MI2J/oeFCedNc8VrXFN459gX9ny/EgpXwkqTs6
	 cKjbU4gfNKodf2lFtM7fXWkpPtwF5kGwuFmxXOOa7bYwsjggaZYwdvIf+5y/k5yj1UFbg
	 uR3YxrW3j4Zo6PP6OytUuhNY1FKD4JKWCqpbncNd3lD4C5D8LJuruuKQwPvb/dI1pYjZQ
	 4SKys7r6rOxzPtOg5a2aKP1M5S/uAIvUEP4zxn0awBlfyXutcQ7OdgwTzGI7pAlijYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CGnWePpyPMsAtnOcvft0hZlNgPpJQ2/+v2kIeYn4WwA=;
	b=PyXjY3VvS3RClVJjdxKEu9a4l5bKhj41b+AZ4BHxx4PvAg8GPWrkx1FWrP4rO8S2VCBN
	 t4Y1PIZsZNwwcIaGOvRUbyfOAegTFYmjjsY2U9qFtJy8TID5/U9zWmK6i7SF5EN4RTYDV
	 bzANjOxGgUUxJGMJqlDBkGMNk/MnsvZfySCfnhUWeCk0ldG7iYklgU6Cr/Uvvvuit8A93
	 nfL5uvrRJf59X0LOmAECpBlr4DWTDP4Rfg7sZ76zeYsBgAtDdLyCPiEOx/IqciI5gjb8a
	 UIu/hPJ1U1EShyibWVTbVHeyZuwmPBWUxMJ/5KpbEmvgNtblPRxYsZJfoBFzSb5LlZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=no0aY5X5;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7FE606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A7FE606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=no0aY5X5
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35c76e9614aso2815093eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793896913; x=1794501713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CGnWePpyPMsAtnOcvft0hZlNgPpJQ2/+v2kIeYn4WwA=;
        b=no0aY5X55RXK2D+LpR4DqxRgaWQVogdW+onGhZ2/qFfyrpRdBcB/ffaNG/7MwBYt6E
         SBrIBGwfk2HjQqTl90js8wRgIz3t0PH270o1oGqotwNE4i91c3kBkBvM3vOU6ctzzxuy
         Q4EPqjH+Mx/5uAR7B++FAzbfaqe9hqXaMVkQcuCcXrd/PDI96kIlqqGJN2OMB5YOwBAL
         6EgF2n+SAUhIWuzJVivQI4fI4fxpIv3bZK+SQ670T4tVID88iSd9N0zruERMenDVDsG3
         0YqsOm4nCny39+00ivG1i2OJ89DLPI3JH5kndooU4fwNWA9gIW/3cvRjM2mc4Hj0H6UO
         iO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896913; x=1794501713;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CGnWePpyPMsAtnOcvft0hZlNgPpJQ2/+v2kIeYn4WwA=;
        b=HcNMqMJFHCKAM3K3AAUnjwv53VYnrZGj3Gucar3YxfO1AZPx1HRiv4Lofcsi4sfQAx
         M5m3Ptcs1QS4teOsl5OyLx8PTU9K/T/KS57f7r/gIT6XeWdMBoIJi9RgbWXaU1idcJzG
         JAJovI3px0QiLiLJXHMfzsAKQ6/9qd+gywCXaUOCF4zsHddsYikTaB0ULMw6t31cvyq1
         yDc7WLGD5Gy4n6QrGk9COB/qeiOpyj8SrD7CggvvQJb7K6hHEeCfeVG30XoEtyH1t1T4
         KGVAUTU57jMx2zJwj/PDlzyBx8+5wcw9zZhUd1e3LmSv/srP+U/XKkjRJm0S/waySszp
         kYdw==
X-Forwarded-Encrypted: i=1; AKwUvBwIpb83PfbZbkDbyWby0ay4IgjAmjVJ+vClsBnj/6an1yKHnsfWcP8SxbQYoOhMbVlHKs9cz8TovwS5k98=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ydNgSovEK3a34KKONxZFn9ekhqKXMRncbJG7iXpzCT2PWXUtx
	kkxlMSbIlyEOzGjMzM/Jt7SUQPjHfdAd2/iS2ILJhNvwOKHYxy6+094F
X-Gm-Gg: AYBFou2l6kJKeIsdqsHUUh6FYYW0QjpHksbH7jIu4RYJrwXE+ZJWkFCUNCFzZptQO2Q
	UllNN55talO1hSS/FEOUeX4v9xJ1yygZytKn+5FOB2vQCK986uDuHUKsjzrXeGaZjVizRpctwWK
	Rh8OxKpLdxB0/BUNScybKx/3arHHl8L8ONiCSLfmmhYiCmwCxpCpHvsp62sG5pYvhPx7BP9ivba
	CM6XAMfLBmYDm/Ep2jKDZDBhaI2JqzoYE2YTkWi0D+mxs0K8Ggvf5cfXVZJMN1D0ZnV7Cq8ZN1Z
	+xSXDlvdRwLhpr4ryvwBms9ONm/1uj7eRyr3f3RO6i7T455MPz+XP6sGXGifgT7ut0mwDxxtVOT
	9d2T6f7lc15L6iOcOFeLMsU/A6vrhQHQ+pW6mFBT6FqRKsrtInaVmcWw49LI9qwUp/UWkzDXxrN
	bWdb5yjyYxbGY1PrTo+wBsIm5lapsxDT2gFS61O2A0r55vbgL7Q8wHvZfBYE+XPCMrDgE7GWyoO
	SWHo5nfEi3avLBdAWWWVoDlPG3fJNQBIdBxGSNXPkzhf3Afbfw6p1eh3bZ/1M4pfepPfXZFF3rN
	0kHYBHrZ0nAacLSL27mwtqMUUIdcugMX+OJDE13KYv6EmEgfcFybP3WqHGd8TX35H8+eDg==
X-Received: by 2002:a05:7300:ea06:b0:36d:38c1:71c8 with SMTP id 5a478bee46e88-36d38c179f4mr5919822eec.11.1793896913063;
        Thu, 05 Nov 2026 08:41:53 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3958747sm7844298eec.22.2026.11.05.08.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:41:52 -0800 (PST)
Date: Thu, 5 Nov 2026 08:41:49 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH] regulator: arizona-ldo1: Fix double gpiod_put() on
 enable GPIO
Message-ID: <auyxtliL5Nx-dJw1@google.com>
References: <20261104-arizona-ldo1-gpiod-fix-v1-1-5b3c02d8a4d0@gmail.com>
 <auxUGE+zPcnAR49k@opensource.cirrus.com>
 <auxViNgjGPRdpfa2@opensource.cirrus.com>
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
In-Reply-To: <auxViNgjGPRdpfa2@opensource.cirrus.com>

On Thu, Nov 05, 2026 at 10:08:08AM +0000, Charles Keepax wrote:
> On Thu, Nov 05, 2026 at 10:02:00AM +0000, Charles Keepax wrote:
> > On Wed, Nov 04, 2026 at 10:38:32PM -0800, Dmitry Torokhov wrote:
> > > When arizona-ldo1 registers the regulator, the regulator core takes
> > > ownership of the GPIO descriptor passed in regulator_config.ena_gpiod.
> > > The core frees this enable GPIO descriptor both on registration error
> > > and when the regulator device is unregistered.
> > > 
> > > Because the driver also tracked the descriptor and called gpiod_put()
> > > in its driver remove callback, unbinding the driver causes a duplicate
> > > gpiod_put(). Remove the driver remove callback and stop storing the
> > > enable GPIO descriptor in driver private data to avoid the double
> > > free.
> > > 
> > > Fixes: a9191579ba10 ("regulator: arizona-ldo1: Use correct device to get enable GPIO")
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> > 
> > Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> 
> Seems Lee has sent an almost identical patch:
> 
> https://lore.kernel.org/lkml/20261104182148.1176116-3-lee@kernel.org/
> 
> Perhaps we should go with that version as it also removes the
> now redundant platform_set_drvdata.

Sure, fine with me.

-- 
Dmitry
