Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9284E56C2
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556117; cv=none; b=AQFeYCArrZzchetqgF+ThHhXswMtJuxBaK8R/j8jU1cG9FUQND+jJbklywf04y5GUqABDLYQcCuI5v5OTWCF68I/SuUWEyVVe+rMPrl+9ekNQjO0BCBIR/6X8FMJXDp+PVFpuMQS8qtUU87Gc5dZwhlc56qJWrukC97Kf1wWKwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556117; c=relaxed/simple;
	bh=tDcbReMlKW/aCLdUiODYX5ZlEgDafGJC8uBweSeMXLo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rxCEbKsxroZxg99/lAXgDZJVf+iwYvuU+tbHHI0Kx13KlmC7T9QkxlBIgMWvgXUozRU66k7RrBGChkDet+p7c3cRY5UTzkcI1UGX2Kbs+bEosFTU8hPAq2MO8TuN1+InJdRabOpaL1mzgPb2x2d2bwMv1EGLU8J9cX1EHB75dXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JU7GTSP8; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JU7GTSP8"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b0584ad71so2746566f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791556114; x=1792160914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J5qnGlwWK60nEqwsDNVA3SkC4N92/UygWdRusOcCHyQ=;
        b=JU7GTSP8xop3SqnyIFvKon6nTenhStCqzoyMXw2xiF6QRS0ZuSRz1UPkTXFAGWGWY8
         MTei0n/UkCHnfu3l92bwfHovO0n3dZBGhWavcM0CjXOzfTktKza6WEG7516OLJACyocS
         f91VExSEC3Y6ov/Xa50bPTJ0GHprXGi1e9y3IJJYpDVnnEUTc7lBz9gcR/kk/98frZuQ
         hZGo0YoLhRIp4IbFE3ymDjG32Z+Kd0wAJNsaVf+k+O4IVtrI0eMgW0lpa//BffvFi6gp
         EgxsIhj8zJfPOLrclaz7m+xjKlmAs9sQiaBnSWeu5+WoSzHyQ+66LMLEvWGtBGxnwNd3
         pDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556114; x=1792160914;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J5qnGlwWK60nEqwsDNVA3SkC4N92/UygWdRusOcCHyQ=;
        b=QfINMg4yTQeWEn33hPUT0UA0cXgaUrHOjGRJJ+wV2HasXIsfj9BEyldoKxh7Jg0iFO
         o+OzMPRt7psrPHZjVdhWOpbjpj5a1mW5Xms12Ty45g7WuSqO4fh2hseMaL0Ch2iSRUDm
         f2tvCAmaSDcSlb4CZOduG97cnKB3GHJr0MTf9yY6XVCyiPsdR2hWtvXWviOTI0yA94NG
         iMeZI74etfWKXCM4ABje0/KNZPISVhcoSM8Zu+4Dl1q/HGaxlA12KJlEkZUjBz6qulHA
         yvwo9dGfOv0LdX9by2sgmpecKvUQy9MYHHAe6kmPDtxHCg3iUpe/3wvocNybkns9p9Vv
         IRiQ==
X-Forwarded-Encrypted: i=1; AKwUvByDZQwavUUDF6YPkbtXHVYfzunJcUvbK16pBz6E6mGUDDegH1iJCVquFccEAB+y72JvJkvEnj998z5vD1c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcczituZEb3JGMoL/HnHIpHcj5cc+APJm/xk8QiW4okcSDKzOT
	EB9wPapHqMKJC5CvrzIZ9j2BGT3iYkCXV3wWgZaCCnOJrkDKLkm2fTe5
X-Gm-Gg: AYBFou3p9PU2xHYcGqazmaMD19pZ0A97E4U8EcqU6pUfl3afK+uYrT/YrvkqSkycfzf
	u9HgdaoAyIErAAsDe1M5d7AoOpdWkoOJo1waSH9WWDpaIg0VPOdQRXf5ujTqD3QsV9d/+xhZ5Wt
	szuWgQJtk0ZIRvg90KBtfC0KytaqoCpn2+pEwONQ5EZ3iDK90tu4hUmhjaWybmM/iGsl+RedW0T
	8ClMFecvuJg9W5VJmXpey0lYjImEvLA1TRBBZj8rYvtm6ht3Yui8sKforHbfosyoCkfKf1be3cp
	uHkvOa7sWgKjyCjX5GPiltPedT+zDcIbwkb5viAGmR5v3gEOqr2vxT9eGM9+w8cNMCT8dxGUePs
	ydV/ZToq2lMOidlQOf3JEWhgAJTfj2lkBHjMAJnKesZytY4Ppm36tBTKkQ52xn6YZqp6zux13BR
	bgpvmzXIYDYPgWK6AUYA6aVCk0aKkYq0RqIPiLSVVMePMGnQ7A1I+eiULpL3cB+/b5ZVN0qd6Ca
	ceZyaIZSpTsxKTnG2sycgyvzF13H9xH+Rgs
X-Received: by 2002:a05:6000:2303:b0:48b:58e:6cd9 with SMTP id ffacd0b85a97d-48dbacea01fmr4433922f8f.14.1791556113857;
        Fri, 09 Oct 2026 07:28:33 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dbae37509sm3456323f8f.7.2026.10.09.07.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 07:28:33 -0700 (PDT)
Date: Fri, 9 Oct 2026 15:28:32 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Aayush Kumar <code@aayushk.dev>
Cc: broonie@kernel.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] spi: lm70llp: Use strscpy() instead of strcpy()
Message-ID: <20261009152832.4dd56def@pumpkin>
In-Reply-To: <20261009133609.579046-3-code@aayushk.dev>
References: <20261009133609.579046-1-code@aayushk.dev>
	<20261009133609.579046-3-code@aayushk.dev>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  9 Oct 2026 19:06:06 +0530
Aayush Kumar <code@aayushk.dev> wrote:

> Use a safer function strscpy() instead of strcpy() for copying to
> arrays. Only idiomatic code replacement, and no functional changes.
> 
> Signed-off-by: Aayush Kumar <code@aayushk.dev>
> ---
>  drivers/spi/spi-lm70llp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-lm70llp.c b/drivers/spi/spi-lm70llp.c
> index e61e89b41..bd8028892 100644
> --- a/drivers/spi/spi-lm70llp.c
> +++ b/drivers/spi/spi-lm70llp.c
> @@ -252,7 +252,7 @@ static void spi_lm70llp_attach(struct parport *p)
>  	 * We are binding to the generic drivers/hwmon/lm70.c device
>  	 * driver.
>  	 */
> -	strcpy(pp->info.modalias, "lm70");
> +	strscpy(pp->info.modalias, "lm70", sizeof(pp->info.modalias));

Come on, if you are going to do that use the two argument form.
Or just don't bother at all.
Do the test compiles - if the literal string is too long you'll
get a compile error for strcpy(), but strscpy() truncates and returns
an error.
So strcpy() is arguably better.

David

>  	pp->info.max_speed_hz = 6 * 1000 * 1000;
>  	pp->info.chip_select = 0;
>  	pp->info.mode = SPI_3WIRE | SPI_MODE_0;

