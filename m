Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615200;
	b=NMtKV37MRSbpQJdEJPSdyduF8z84n4OBBZOzxkmHWOjn9s9StNF5FAE9BwI65AcH7k9h
	 mmXM4gk/NhN3GRYV8dwH0hEFN2ybbmmFlAxTk7K7VY6HZ3NZvq/U2TZZ7n1yVXNp9cCu4
	 pYR2803v6XKgPcuI05hspUY5RXpT3TssbeKe+4sh8UvFTV5eJHW/hZhne2/1yKImEnHyK
	 5VQ+mwXUFi/j5EqOdFyqtVsD/IkS36AN+/WevMc1SPj09go8G2vV9fioNidv0I7y2nVQS
	 5dkCgxnF9eUcnKHrfz3AGtDHKUXFHHqifd1DJgcWR+GjYMD3VwEDFHr3yYmUUDQBwhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=X/T5dYcGvVFYEEIO1PI96NGToosSCPyok7jWSISleC4=;
	b=2a8MeTNsaOPx2aRv8ImSltVlQcN8lYVA4DUeRVlB6rmgOeZdaz7HH6/iTTtoYZhRxTlY
	 1V3UEKWFKSzcrXKxRu2NRMFTs3ChMx8gEAuSMcuh/s4lopToyBTZULlSEE3EoNth2sxjc
	 a30k/Y2a4n6TvGqr5UfIC4+dlxjhK+s6xfo2C0Z6ar/87mkrIbxfz2/Wem5X/qOZCCQ7m
	 o9hZo5HhURciHLi9smQljjXAz4r4a7iuIHvL5wSzqH7vAbD8nWyUMlDMoVfVqaBc+v4N+
	 wmPEP/f299xJDARiO5lfSFvv1CqgEpJ+OZ0pDLQwnlp6MbpTJr8JKMjTYkTGnBjCExQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ive130vh;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDB4606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DDB4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ive130vh
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36661f953e4so2195540eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792615194; x=1793219994; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X/T5dYcGvVFYEEIO1PI96NGToosSCPyok7jWSISleC4=;
        b=Ive130vhLibR/y/CmdR4VJVEfTjilCH91XXWk9jt8BFxMy3fDJw5Rlc6lQogBcNCil
         FIjgGsbKZ3fYbYxu3tDtZZZkIV2iQM9a9Yd8wHlklBO98lhFct6rYaixpHynrkTKuLTa
         gxJBOFWju0gG29nF1gwH5knzYdVfvOAamSM3SdOiPEK4Gqmjvrb+f0ywmHwaPFEZtRpB
         pw5qY7Y1ht4dapiAe7vYIpu/2cKLIIYYrdQqS3aYrmPLm3dyppFfJJfvEZtUXbuP5J9h
         4VFyFGYqGRSr1wC0+WQobRr/+HiBCU0Ya5SS83iyrSBNUsNr/1tsNjUhBK9PTNqhD2pk
         kSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615194; x=1793219994;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X/T5dYcGvVFYEEIO1PI96NGToosSCPyok7jWSISleC4=;
        b=sh45dPpzZ83RjvNdbuMPjCdhEwnZ5wkCbgdp+jCcBbl8l2T7a5SDp6A9a+0QmiwfN+
         ryexzDzTxv8RDAu/617INuHQZ6D99d8Mirei6CCiJ3HrciWFkeqP3KVfwBUAAsC/V0G/
         8CnsS0pRisLNsNbS7Tou2+N8P0q8EqPXReE1YYXZ1xMUrGhXm3xru+HcWuD/BXR/FO30
         4YJFWTAyxPIFGdVvFXLDQNFEz1jbUQUcrj1woBS+AGcJq/Cx3MHPvHSgDV/dW07b7/pS
         CosqyKbR9H2Wg89SnjYbR1MwTJY/VffySAp9QBmavtCaLqWqO/ICDT5kvZuSqfoFTLjp
         KQfg==
X-Forwarded-Encrypted: i=1; AKwUvBzZSBWh0Odi9vxDzIckiy0SYAGBKfRz3jrL3U11xtbhqSHdzWkjoknZpQLl8hktoQAMgxguVgjb+70Q08Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOopam14IF3lljNnEAoMUfBPwW7QzisoDV8O5LhFNiZwAbFW02
	1iKmzqR+mBmjOSquWtRbwh9HrbJMxhCsBO61zXL8FsTbNxPP2/PJPizP
X-Gm-Gg: AYBFou1D821JFV6QpPw7JNY+OkVqZ3WldC5XF3AK5qaR5J3L6XE4rQVD4Fb0vZy5pgq
	6mI8UYAsTaefU1uzY96r4h3C7LRHUsb+Xj/L2bkVh6i6erHbQQVAaYgDMpjcVJv2P2qVpRdxio0
	M6QPv9hWfSVyX1YGKqWpt1pEWsYI6P+ZFYyks+W/os4MsoQNvN2RuBEcazvbSIsZegOKuQN7Lmy
	nH/tkqwGTKb9vt4NppSojgHttx7UaUJOODN6LMRR01hpYu6aCV6DJuG7TFarflg8I/qjuev356l
	2GyvK93oBZ+mUHQNXjUXUvpieCOFFYF7kTC0UvOJHKaw/REWfMRCBYlNzN1uJen5W+r2AUm6FqS
	698LKUvAAoolzGRIZlRZFfY6W1hJy8IonjPdjGXjSMiJRCqHvlw8oyiblhP/IKdCfGBXdBA5F2Y
	STdoh1sCriySvYJV9s+wr6UuU/mIn9widiR3ByIV3UqrJlf92KhJVwwBYpMVM7O90JrNlHJ9E40
	thoFuvliHwt9I/ayMvrA4qY1RDUI6lVVtUxEXbyPl7j9DBqIDzO8J/PnHY9Z+akxwemxcXiSiY/
	YNmBoI+kldMQfke+ae48
X-Received: by 2002:a05:693c:4144:10b0:365:9e3c:4ab2 with SMTP id 5a478bee46e88-3674f411e7fmr4859225eec.41.1792615192586;
        Wed, 21 Oct 2026 13:39:52 -0700 (PDT)
Received: from localhost ([2a00:79e0:2ebe:8:1761:399a:3c8c:31ba])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-368ca323effsm382788eec.7.2026.10.21.13.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:39:50 -0700 (PDT)
Date: Wed, 21 Oct 2026 13:39:49 -0700
Message-ID: <ebd179ed9fd8af509ef3ecbea1c348c6@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] gpiolib: avoid krealloc() in gpiod_get_array()
In-Reply-To: <atkTqWUn-2tzRw69@ashevche-desk.local>
References: <20261021190212.2237804-1-dmitry.torokhov@gmail.com> <20261021190212.2237804-5-dmitry.torokhov@gmail.com> <atkTqWUn-2tzRw69@ashevche-desk.local>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Andy,

On Wed, Oct 21, 2026 at 10:34:01PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 21, 2026 at 12:02:10PM -0700, Dmitry Torokhov wrote:
> > +static struct gpio_descs *gpio_descs_alloc(unsigned int count, struct gpio_desc *first_desc)
> > +{
> > +	struct gpio_device *gdev = gpiod_to_gpio_device(first_desc);
> > +	struct gpio_array *array_info;
> > +	struct gpio_descs *descs;
> > +	size_t descs_size, alloc_size;
> > +	unsigned int bitmap_size;
> > +
> > +	/*
> > +	 * If pin hardware number of array member 0 is also 0, select
> > +	 * its chip as a candidate for fast bitmap processing path.
> > +	 */
> > +	if (gpiod_hwgpio(first_desc) != 0)
> > +		return kzalloc_flex(*descs, desc, count);
> > +
> > +	descs_size = struct_size(descs, desc, count);
> > +	bitmap_size = BITS_TO_LONGS(max(gdev->ngpio, count));
> > +	alloc_size = descs_size + struct_size(array_info, invert_mask, 3 * bitmap_size);
> > +
> > +	descs = kzalloc(alloc_size, GFP_KERNEL);
> > +	if (!descs)
> > +		return NULL;
> > +
> > +	array_info = (void *)descs + descs_size;
>
> > +	array_info->get_mask = array_info->invert_mask + bitmap_size;
> > +	array_info->set_mask = array_info->get_mask + bitmap_size;
>
> > +	array_info->desc = descs->desc;
> > +	array_info->size = count;
> > +	array_info->gdev = gdev;
> > +	bitmap_set(array_info->get_mask, 0, count);
> > +	bitmap_set(array_info->set_mask, 0, count);
>
> With the above being done, I would rather see bitmap_zalloc() for bitmaps.

struct gpio_array is defined with a flexible array member (invert_mask[])
specifically so that descs, array_info, and all three bitmaps live in a
single allocation. Switching to bitmap_zalloc() would turn one allocation
into four or five separate allocations and require freeing the bitmaps
both in gpiod_put_array() and when cancelling the fast path in
gpio_descs_check_fastpath(), so I would prefer to keep the single
contiguous allocation here.

> >  	count = gpiod_count(dev, con_id);
> > -	if (count < 0)
> > -		return ERR_PTR(count);
>
> Leave this and simply add
>
> > -	struct gpio_descs *descs __free(gpiod_put_array) =
> > -		kzalloc_flex(*descs, desc, count);
> > -	if (!descs)
> > -		return ERR_PTR(-ENOMEM);
> > +	if (count <= 0)
> > +		return ERR_PTR(count ?: -ENOENT);
>
> 	if (count == 0)
> 		return -ENOENT;
>
> The currently proposed code is less readable.

Looking closer at gpiod_count(), all of its real backends
(of_gpio_count(), acpi_gpio_count(), swnode_gpio_count(), and
platform_gpio_count()) return either a positive count or -ENOENT, and
the !CONFIG_GPIO_ACPI stub for acpi_gpio_count() returns -ENODEV. The
only outlier is the !CONFIG_OF_GPIO stub for of_gpio_count() in
drivers/gpio/gpiolib-of.h, which returns 0 (and also causes
gpiod_count() to skip the if (count < 0) fallback to
platform_gpio_count()).

Do we actually need to check for count == 0 in gpiod_get_array(), or can
we fix the !CONFIG_OF_GPIO stub of of_gpio_count() to return -ENOENT and
leave the count < 0 check in gpiod_get_array() untouched?

> >  	for (i = 0; i < count; i++) {
> > -		desc = gpiod_get_index(dev, con_id, i, flags);
> > +		struct gpio_desc *desc __free(gpiod_put) =
> > +			gpiod_get_index(dev, con_id, i, flags);
> >  		if (IS_ERR(desc))
> >  			return ERR_CAST(desc);
> >  
> > +		if (i == 0) {
>
> This is almost invariant to the loop. Can we move it out?
>
> > +			descs = gpio_descs_alloc(count, desc);
> > +			if (!descs)
> >  				return ERR_PTR(-ENOMEM);
> >  		}
> >  
> > +		gpio_descs_check_fastpath(descs, desc);
> >  
> > +		descs->desc[descs->ndescs++] = no_free_ptr(desc);
> >  	}

gpio_descs_alloc() needs the first descriptor (desc at index 0, acquired
by gpiod_get_index() inside the loop) to check gpiod_hwgpio(desc) and
gdev->ngpio so it knows whether to allocate space for array_info and the
bitmaps up front instead of reallocating with krealloc(). Before the
loop we have not looked up the first descriptor yet.

Thanks.

-- 
Dmitry
