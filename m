Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829115;
	b=fD8ghOnLbyu6u/a+RAUGhTII0HyHs4+lGT8tXE+2tchNTzcYKLMpAL8CsZpxr5yWQWei
	 6dxPjyjsBmBlHUJFKUkZp+yH9wOtVL9S9Ai1z36tRfM2xRLTyDwYA3Vl5gRFhO1WkemgD
	 hzYb+r1O8x2otkPUVcy5YV66BtFeXq4rtFrysNTTPrbWi9VRr5GLLxIdaBQM0+mQRVS2P
	 WZ78R7xjxgVp/Z94GATVJza04RNlHUJgXMCNYmZUcdc2nJgv4N4XFZgYbA9pMyvhgyoaO
	 CDvmBLvsabsaKS0jBdVgatYrjpAJ71Lst73ZxAap7TlmOAOE5Y249yRNMTJcnaVkqPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=zZRdp+Pnl1LNEQ8jQE4bngp2jSFFakeXxxoedfEkBQY=;
	b=WiNFfvQPCVFOgzfivFpHe2kIJOmT+ToMBt47121w1kR74HkZBBFPq6e3ybjsAd6dB/mE
	 vSJGF2DE4GeOyP4mpCwathXqRtAAjvRGAIp7/3o6kfAZa1VUEbktTKFLqDIm0EmNDA+EK
	 nQDFhI4osYR/9IllUKjiPKwjIKnffJTlUxwvbWqoGfTuM1jJ7N1nsCF5HfvTJiM1UlzxH
	 mzfNJ92bAOk2ZhS/5gIOJhTnE0APMLfKSBYFj8yFpreeIRRB8o6CCRKip5wa/4xzXYmcb
	 ijVKW97xz//MPS9CwtQOlvzCHXueGbhOS8FJtAG/HnZjiiIwn6ZuaeqMgIZ5UoAINrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gDOLe07a;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E8C607350D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32E8C607350D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gDOLe07a
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1931ff67a29so1370033c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829114; x=1794433914; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zZRdp+Pnl1LNEQ8jQE4bngp2jSFFakeXxxoedfEkBQY=;
        b=gDOLe07aeeSZo+hexjBhYUbSOKzXMNjSjUYplS9Gs2EAZf12Rozr8fHDc4iMibE+9B
         agPXsS4u/taQA9jc0rHGDEismieEaAw2MzGgOfNqF0VEY6pg16kAqDaRqA5r3Kj5Kbad
         BpAcp9jiBxrpqIZsaKHP1AKrYXaB5Mh9XW71/pdGWbBG59sjDD6NhyzUaBbKd2S98TS1
         GHmN+9IYWvZELtc1Hq7eCI1bNvRC0oKCBOXvLhvlgNPNFR6w3+dmOKWNW9CE2j5UNcW6
         NxSYVAsB16QglFwPq74tlWAdMdtqs6ogRLf6VG0qdtrUTCp/AQw/+y1M0gsbsm72iaWS
         tA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829114; x=1794433914;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zZRdp+Pnl1LNEQ8jQE4bngp2jSFFakeXxxoedfEkBQY=;
        b=oCKBHLpKuy8c2HmpuzPvGmvWGMKu6t7pwiUsYRhaikK0FNxb3bevqro0ggUWwRuc0d
         b32K2+pOA3MHEU3syr9xw0h6r9Eu+ije23dHNzsxL5pTK3Y0w/qCu+h1nOXw8uHSzGol
         HRElFiEM1Moh/4H7KmNkPudgGK+XgaH/P66fhUb0URNiTBqkVH5ppm3NiXgkWTTdT/vM
         +0jaQFqjER4pAEVUFy2fKPE17E8/5GbJ8JVnpgBZK7/nRUCQELr0Ao18q4ayYypg927F
         zj4OQ6oOL18l9WAx3gbiujMOkVmSCvetjRGlu2lC5ofXXniEKHD4zD6EvrGPbXKPTmAk
         OBDQ==
X-Forwarded-Encrypted: i=1; AKwUvBydJh1Ebw7ZnMFQGNQaxLdlz6cREAgDGXCM53owGBYnjvUHkIyc0HS0kjyWe1pRNYWuc0/ihBVFe/JVRKk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ByTZCBubh1lf60XswSENKN1s0T9U7mlk8/PAb/pN3TXn8KJnZ
	MvhTaIK9o6osgHtuGrJfeykxKdJfW499n23tWk4Kbj2FKBmKnG/Z+GKL
X-Gm-Gg: AYBFou1gnQupTK0pT7iTt1pVRYcnppA1DzkQ5gTrxHfRWs98JAU1FhcYLNxB9/Yv8zr
	Fr87SpWbrsxgZHOqeEdG2+8ypgyorJqQp/DuGEIkNQzy99FTZmEM5tdWvb9MgQJPL7LREGNouZ7
	vZpD5Q2te01mVPPKg8W77hCat5BIIlpebfa8qnsedClMXs82gJNi8VPTVzrrOea28jW/LiR9OcS
	PoKoUKaEmp4V3r1bnBVJ92Xmxzs9pT2215f7SxIgrpRh2q4YIwjvaHkjovT77gN+MHt6wUGWKhV
	wP4rZrLLfPv+Q6K/kNyw4GBxkF+QcpPkRpjjbAa4+peK0DzqLc1S26vWkgHdowdfyVlSQxbGIcx
	lljSw9awMf+Dw/pZnIUuKAodVnjafxFvH3CwJI0wUl/h6ZVKgaCuLE35ZzwrAe8E0QBA+QFlDLR
	v0gJ6xVMpRCVH4Vm2YDs+mLNZ5buKjkQdznhlsxkoWf+NCVvEuy7qKWcvMOx5ZgC/Jv601viut0
	PKxz8mXNTubUx8OfGeW9ENyDBHAY6AiTj+dfbEVEMT39kfOATXhBgjLWd0X8NbJVEGqpMiiZJ1s
	wTuLjID93EAAOYJiIwVc1SaBecSUukejeQwURIi0cUVHvqffFuTcPECz4NHNtpll5CEvHxI=
X-Received: by 2002:a05:701b:260c:b0:1ac:9ecb:acee with SMTP id a92af1059eb24-1ac9ecbb353mr21410890c88.39.1793829114147;
        Wed, 04 Nov 2026 13:51:54 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c127sm10459946c88.6.2026.11.04.13.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:51:53 -0800 (PST)
Date: Wed, 04 Nov 2026 13:51:52 -0800
Message-ID: <73caedd26b375ae7671d24bcee115f05@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] gpiolib: avoid krealloc() in gpiod_get_array()
In-Reply-To: <auumQhqJwIl4XZDM@ashevche-desk.local>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com> <20261103-b4-gpiolib-free-v2-6-ea46767c9cf8@gmail.com> <ausjJSZkaGKNfykE@ashevche-desk.local> <4e7b28ae9ad5de3708c549d62a4bae68@gmail.com> <auumQhqJwIl4XZDM@ashevche-desk.local>
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

On Wed, Nov 04, 2026 at 11:40:18PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 04, 2026 at 10:14:49AM -0800, Dmitry Torokhov wrote:
> > On Wed, Nov 04, 2026 at 02:20:53PM +0200, Andy Shevchenko wrote:
> > > On Tue, Nov 03, 2026 at 07:40:34PM -0800, Dmitry Torokhov wrote:
> > > > +	bitmap_set(array_info->get_mask, 0, count);
> > > > +	bitmap_set(array_info->set_mask, 0, count);
> > >
> > > You don't need these, as memory is nullified.
> > > Also note that we have bitmap_clear() IIRC.
> > 
> > bitmap_set() sets bits 0 .. count - 1 to 1, not 0. Both get_mask and
> > set_mask start with all count bits set (assuming all pins in the array
> > are eligible for the fast path), and then gpio_descs_check_fastpath()
> > clears individual bits for pins that do not qualify.
>
> Ah, indeed, but we still have bitmap_fill().

bitmap_fill(dst, count) fills whole unsigned long words with 0xff
without masking the tail bits in the last word. Here get_mask and
set_mask are sized to max(gdev->ngpio, count) bits and passed to
gpio_chip_get_multiple() and gpiochip_set_multiple(), which iterate up
to gc->ngpio bits.

When count < gdev->ngpio, bitmap_fill(mask, count) would leave bits
count .. round_up(count, BITS_PER_LONG) - 1 set to 1, causing
get_multiple/set_multiple to touch unrelated pins on the chip and access
value_bitmap beyond count bits. So we really need bitmap_set(..., 0,
count) here to set only the first count bits.

Thanks.

-- 
Dmitry
