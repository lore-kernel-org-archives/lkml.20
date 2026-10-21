Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617482;
	b=lk8X61T4ISNWT5PzGbG8YZKY4cUbvd3PSKLAx30IX2csI1Dx4TowDaY+kXPandYVd4M4
	 DCY3l70Yf70YozaB8FHMea0/xnxo+fM3WG0aZ1unablL4ZG/90OFYohq8mX0TA5+ZONAW
	 BXdZXNFxSEhIX3HrxAIH3gjmfETwIRR4cPYBgSqbv53WqdAykUprx8m9hZqC0Jd7ekNtX
	 nvwhdF3fvOG5NT8au1EXgB1zljFaefs5en1J/6EprvoEuM36Y7fiG5szIKfhJiN6wnQaP
	 qmN6JH5o7+XY4QAKqFDbmmdjuG58XX7smAhr9bBSi6V8oqZm9+Gb4yHKmHl7AMC0sCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=bLQEgj1URtmt26IcBLztvjUBYNIpMdnMK15TO8b3hVU=;
	b=s0MWJhFBRWFJ1WeCPb61cN2dHFU7KDWjFLrRmApCfveSTxdtH9cskLL+JhJZ4P4QYkln
	 5z1jxgSneQQ7RLJV3FW+PbfTFDvy4aBsuC8lF+o+y7iYJznoEYdoLUCrfOKQO44csC3Jo
	 QbKH0V90b/qx3BcjpntvhzzFPIkMzY0WrCgRaMhiCG42nwKeZChdXj5uS8oRL6YReIp08
	 hNSFZjo26olj0scA+kJV+NTHj2BGaetYw5IQSugJkk1Uo9n/qfj8Zb7fdVFakB37Omghm
	 Id4ajHtnooSAPrNnaQwEcXy7bOldmLj8BJL+XHDTnKY+wFa5rPoD5LvstfWKeH7o/XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8142B606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8142B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-18cdcfc05ffso1248056c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617480; x=1793222280; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bLQEgj1URtmt26IcBLztvjUBYNIpMdnMK15TO8b3hVU=;
        b=gua5QRVG+eG+KDaxF5mJg79GvcW5peFYWQ3JS9LKPHKVhUkoXODX0S4Jcbd2QfEeWs
         RPtmHW982AHXI6eYJ7Rv37pb8rUeq8ng22L1gr/p4vaGu5ldEPnOFxWSOZEs2JUSLMYr
         cqoWYLzVYS1vwJ5BRNm2fRosal6Ez2XKoecvGFZvHCxeef/Itsg56ht/K3I1AIJbxGHS
         VBtCw7Lrq2Ze1k6UrMoX76ByfBDHLTYERBi0RXXjdq2MJbboOlZ1u8I6KK0gGlqGE5Rk
         JoDdWJjY6Zhi89X297LDAvfBdt2RXNakhquT4LAMjGjC1jqcjlK8rGMueHcUXvwYWDL9
         z9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617480; x=1793222280;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLQEgj1URtmt26IcBLztvjUBYNIpMdnMK15TO8b3hVU=;
        b=mfUlMZDTJCErLKJZoZ+cqcbm+a1lFIpN+PP4fmqEBFtdmYR4dF1ldj1oQCnKhEmfOr
         uXmfPidoq53ugd5qdT3P/DznUVI7JpOhwkziW2xOr9JlmC/Jex0/2z7emhmtGVEwZq32
         nwAYrEdIOY7tIJmR0hl0AVOH1EyrUrZte+bEh7VBs9aMaZN0X4tbCOJaz5kgu8iVeytz
         o+Q5NZRl0VCa4fVHkcFvabudpGONoUWElTJeohm/I7uh+VUkYve8vMV5QwFXLL1Ev/ci
         cg+LD4sGSHvKWlpHzTBD4jGE20z3PPJAS8U2Rmp9LlrAioszSUW/dC5LwRK3TKuGK2mO
         SrGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNKeuLYlAT2p9JHtYXcMqVH0VcafmBYaaKlrQSFT2wceU8IA7KDFyRxhBJOOLV4NWbRt2v/cd3ExBW/fM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRvxoNk7QlPq3dT+pKgDAcyVYBeiEiMpdQggu3/tVs96PHW/G/
	kdC8s3MYUonPXNLPKo/HrudOMTfM/n2antmZfZmoMp2J3lrRZLigwMvV
X-Gm-Gg: AYBFou1ae3vPdAYM/0m5j6f5sNghHWrRHkl3UMiN6m4Qk1mI6jstVrjJu5G09+FYaAi
	KPWPM2T4CuTBXxoYCVhTutz2xN62CvD/Nl5GCs0b7iz+sX/7RHGpryOSVyzn4Ch/RZpRRCH28tP
	ptReI7vEuR0oR/WySXCGJlzjyg7x9P4pR36Jj0axIRlUYpJlakVVeEhN0eT3FeEe/RMLuBWbY+7
	CATMKrXYiLWSNaFYNiV5GYrGTxbZfXMjEuCITMJ9mRr/JykuprCqNCONQhsevn9HmexqKUqztJ8
	jPojE43hCRJIUvUGQaAb19KF/DeaMPV05ETyvorr3v5fVt+FOgx8GM8Tkicj44VdS1QnAK5BZh6
	RN+2hZPMb35uDrm3hejzgwjgA0ywg+xa5SsNF09grQJsdwqlyyZDb4NsezXa3YBMK3wFcQuBOqE
	H99mlMCbYXTEmBiWugrnL/HOnbY+RamKv8b2BChMlqwO22FTLll0R+oNakhVzecRRk6iMS+uYKH
	/1+DUVHruowS8i5nm2yzzGiqwX67LCaV8MEVh+1+FDKmtapTMe+9D+ObKHGQFs7uunhZmR1AkIv
	RggIqNYFGvhzPvjozAwrdcKuAqk51F2iRVDrgAiWweg=
X-Received: by 2002:a05:7022:407:b0:16a:b995:dc7c with SMTP id a92af1059eb24-19140a1e191mr4304340c88.21.1792617479431;
        Wed, 21 Oct 2026 14:17:59 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:1761:399a:3c8c:31ba])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-190e29381d9sm7244282c88.18.2026.10.21.14.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:17:58 -0700 (PDT)
Date: Wed, 21 Oct 2026 14:17:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] gpiolib: avoid krealloc() in gpiod_get_array()
Message-ID: <atkp9edGVHRWrJCa@google.com>
References: <20261021190212.2237804-1-dmitry.torokhov@gmail.com>
 <20261021190212.2237804-5-dmitry.torokhov@gmail.com>
 <atkTqWUn-2tzRw69@ashevche-desk.local>
 <ebd179ed9fd8af509ef3ecbea1c348c6@gmail.com>
 <atkmj6rxedA-XPf-@ashevche-desk.local>
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
In-Reply-To: <atkmj6rxedA-XPf-@ashevche-desk.local>

On Wed, Oct 21, 2026 at 11:54:39PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 21, 2026 at 01:39:49PM -0700, Dmitry Torokhov wrote:
> > On Wed, Oct 21, 2026 at 10:34:01PM +0300, Andy Shevchenko wrote:
> > > On Wed, Oct 21, 2026 at 12:02:10PM -0700, Dmitry Torokhov wrote:
> 
> ...
> 
> > > > +	bitmap_set(array_info->get_mask, 0, count);
> > > > +	bitmap_set(array_info->set_mask, 0, count);
> > >
> > > With the above being done, I would rather see bitmap_zalloc() for bitmaps.
> > 
> > struct gpio_array is defined with a flexible array member (invert_mask[])
> > specifically so that descs, array_info, and all three bitmaps live in a
> > single allocation. Switching to bitmap_zalloc() would turn one allocation
> > into four or five separate allocations and require freeing the bitmaps
> > both in gpiod_put_array() and when cancelling the fast path in
> > gpio_descs_check_fastpath(), so I would prefer to keep the single
> > contiguous allocation here.
> 
> Why? You can also allocate 3x bitmaps with bitmap_zalloc(). So I see only
> a single additional allocation.

So the proposal is to continue combining gpio_descs and gpio_array
allocation but split out bitmap allocations (still combining them into
one, so needing to round up nbits).

This looks like worst combination of all. Why do you prefer
bitmap_zalloc()?

> 
> ...
> 
> > > >  	count = gpiod_count(dev, con_id);
> > > > -	if (count < 0)
> > > > -		return ERR_PTR(count);
> > >
> > > Leave this and simply add
> > >
> > > > -	struct gpio_descs *descs __free(gpiod_put_array) =
> > > > -		kzalloc_flex(*descs, desc, count);
> > > > -	if (!descs)
> > > > -		return ERR_PTR(-ENOMEM);
> > > > +	if (count <= 0)
> > > > +		return ERR_PTR(count ?: -ENOENT);
> > >
> > > 	if (count == 0)
> > > 		return -ENOENT;
> > >
> > > The currently proposed code is less readable.
> > 
> > Looking closer at gpiod_count(), all of its real backends
> > (of_gpio_count(), acpi_gpio_count(), swnode_gpio_count(), and
> > platform_gpio_count()) return either a positive count or -ENOENT, and
> > the !CONFIG_GPIO_ACPI stub for acpi_gpio_count() returns -ENODEV. The
> > only outlier is the !CONFIG_OF_GPIO stub for of_gpio_count() in
> > drivers/gpio/gpiolib-of.h, which returns 0 (and also causes
> > gpiod_count() to skip the if (count < 0) fallback to
> > platform_gpio_count()).
> > 
> > Do we actually need to check for count == 0 in gpiod_get_array(), or can
> > we fix the !CONFIG_OF_GPIO stub of of_gpio_count() to return -ENOENT and
> > leave the count < 0 check in gpiod_get_array() untouched?
> 
> I would fix of_gpio_count() stub. But I haven't check its users for correctness
> of such a change. I think it would be weird for them to expect 0 when OF_GPIO=n.

OK, I can fix up the stub. The only user of of_gpio_count() is
gpiod_count().

> 
> ...
> 
> > > >  	for (i = 0; i < count; i++) {
> > > > -		desc = gpiod_get_index(dev, con_id, i, flags);
> > > > +		struct gpio_desc *desc __free(gpiod_put) =
> > > > +			gpiod_get_index(dev, con_id, i, flags);
> > > >  		if (IS_ERR(desc))
> > > >  			return ERR_CAST(desc);
> > > >  
> > > > +		if (i == 0) {
> > >
> > > This is almost invariant to the loop. Can we move it out?
> > >
> > > > +			descs = gpio_descs_alloc(count, desc);
> > > > +			if (!descs)
> > > >  				return ERR_PTR(-ENOMEM);
> > > >  		}
> > > >  
> > > > +		gpio_descs_check_fastpath(descs, desc);
> > > >  
> > > > +		descs->desc[descs->ndescs++] = no_free_ptr(desc);
> > > >  	}
> > 
> > gpio_descs_alloc() needs the first descriptor (desc at index 0, acquired
> > by gpiod_get_index() inside the loop) to check gpiod_hwgpio(desc) and
> > gdev->ngpio so it knows whether to allocate space for array_info and the
> > bitmaps up front instead of reallocating with krealloc(). Before the
> > loop we have not looked up the first descriptor yet.
> 
> That's why I put 'almost' which means we might need to duplicate a few calls
> outside as well.

Yeah, I think doing it inside the loop rather than duplication
gpiod_get_index() outside makes it cleaner.

Thanks.

-- 
Dmitry
