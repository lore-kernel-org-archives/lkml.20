Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792611813;
	b=l/kvyUXzoq9c/82p0mJC6eB08z0JWk59YoRR9b3D7T1dNl+fALv+qAymn8sbRAp3hvwy
	 HhaQD3RP8GVhspldADihKj9sXr2EReoLmw8aj05UNovRAamiswXB1uGvaS+37K9Eo1yOD
	 18U+Qaec7kFTKQnfeVHIiDGowi/QaZNXSFk8mkWVt9kihDO3f/ogrPRH2U9TzbGsa5xRq
	 ZPNanHRBJGkkESqCDhcLzs+HY+Uw/D2qeKixjcgPXZKmwZQ8wMoUwL3ZLYaRDF6hxd/0i
	 zWfnNOZxAszvY30uKCrUiEDZqQUNR4OaaRCdfWZ0GDAdU+RzGxZODNTIwcpUfoGMoRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792611813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+ywMzQ+to7W6P4+Q6vGmUU1pcAEfM/gAHMO22DZ3gX0=;
	b=YdpWzpXQ4AFFTtdke9oWRRlVnJhpcU1CpAU7kX1jm4qwL6F0YyMyzbgmXIf4KuA9cvYt
	 IBzjnMjTM0JisZCw3RID6fmJv/EEEs1Iv7ewwEKVAIElkowg0ZPzY7Q2lX+ouqpGqyLEX
	 2wotQT8S15BUO3h/XBRgQSX39ffWDrQLbDnoBSuuD33PzVYyJnjKu8uF8jJNHrJJFVqQn
	 mWPQGoK/OKVQznQ7JOPHwupmNe1BG1qvyaBz/tM7hpaMtmBzCI78N4fDz96wm1R69CPXl
	 KNRSvccg+bEb56eLZGoKg5orksF/bnXwuxCnduzZdSEIKuxu61h0OS35Aze6UIbWrmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jXJLdWXU;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FE5606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12FE5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jXJLdWXU
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35943f55c06so256811eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792611812; x=1793216612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ywMzQ+to7W6P4+Q6vGmUU1pcAEfM/gAHMO22DZ3gX0=;
        b=jXJLdWXUbIO6BAVwWpahbYB6kuv2stskNJnEjTt/T7LPq4h4xpcSwcbuPX2lyLt/IO
         kOo1UyQ2lyrkEAqUJZzWecphJKuBAdwyzrTJN4t8wG1U5htXFP0t8cy9P+CUGP0k4kfm
         3IcrAb8ErsRv5lF+kV3Q17Lox7ICKGz9UogA7MUft91uDXXzTv/WlOOvuuKosgbVsq7A
         hhMyBGTPtsRtnvqFtS2n9VtahzCh+YEbzLvwhIQwn7C3IhopiegDVMR2RPlR4SHK+avU
         dEPeQ5khKJehe/UPizMk5ur7ob4ucM9d76X5OWCBTnBHAU/fih4scufI6y0fCpfOVUut
         TVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792611812; x=1793216612;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ywMzQ+to7W6P4+Q6vGmUU1pcAEfM/gAHMO22DZ3gX0=;
        b=uGYICe7rXJAR6Mq6uexO4qcR0qFM6m6xDfoDatOX0TZThCaOTtfIVjSB1Sl7j7507D
         Upuo8bUfFgfmRDtCUrzHKYNUBM1wEha1YlhqDG8VOmTxOMOSS9BaSjGD6HrtZbtIsuJJ
         iXGPVViMoekOfZ5eF/G4gusnr+k31uDhYc17PKb080ZIpo+5djo7a7iaWDzmOcpQOT5o
         vU/SyoVOni0TO2cdM7Aehx19+d1RG8qH/vQyJsJ6RMjAl4jicurA4UIw4iRMMuxMhFCc
         utRbhmxU1/ks7L/x4tlisykpgjxzNBZU4KJ/r/IECBgT6nZ0RFsbCRLkGr07AG3tJ8yA
         nB8Q==
X-Forwarded-Encrypted: i=1; AKwUvBx7yT2TtDLT2v5d+jYZzphSlJtapHES4lkAH/1GHohfBGZpFs8Z2DG3pyZFGij5nr3pXbE9X/U10DyUkEg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjf0WeQFZydt1Vms6G0Bj7DnV2QPP5L3h+gJneNPIM7oBC+gUG
	1xgZCz+AR2s+zorh0CYONpfbIUOwcVNaoDGrXufLyPwK1cYeOSIFB1lfP28LwQ==
X-Gm-Gg: AYBFou23el1nPQXNeEzWYiPgkXqwcSM/mjZyKxWLmgQTEAuiKXReNLkjrnWASLAZe/G
	Q52tLonhGZHMVSKZ+leNhL9cxcFNJ13txI7fZM83vD8tHmNj3PFuynWwaZZ3MbDxY9fy1ApeDns
	iplFDSt4wf98JDrifsooiLQcnRvM52Tt7QCJmwnRVXQopR2ex55vRjIcesspbRXzj9y3sTsbb7k
	O3PtOTVOJ/qlIPusHx2B7zC0AN7hx2gsMGpAtYMLiTahcpkpyiY0H3/bIBFUbmFDoiHyuVH5vCb
	W3yCocKev4EskNVouLfZquLABggpQt7D0c0U4BiJ3ASJT7PDI31dpYOUQUifpek+1BBZY9dYGc/
	mij4xpetDg36NW42d8cXXNOUeNPpz5ePgV/Xhwo7cPAsABynZ8syWiAAljlT4Ma1K8GQ3WhbEfg
	vmZ7P63MPN79MbClxeoPC4x0yf5o9jYt9MUOs9mSLYoYf+O8k/4Wfrrrqg+uYY2+oQeQa4+OmD2
	nw8SJS6qfy3bevDCvBPKDtMtuuHawOD1Bi+BRPnvH2Edi7UkaokjJZ6H2UKIwCbBnG9b6MrQSCw
	Q5e1+JpdYh0/UxlyK3UWNA==
X-Received: by 2002:a05:7300:559a:b0:360:aeee:9b8a with SMTP id 5a478bee46e88-368afd86aabmr373883eec.8.1792611811996;
        Wed, 21 Oct 2026 12:43:31 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:1761:399a:3c8c:31ba])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367f52ce166sm6124428eec.29.2026.10.21.12.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 12:43:30 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:43:28 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] gpiolib: fix GPIO descriptor leak in
 gpiod_get_array()
Message-ID: <atkVrwhbP45oLiIE@google.com>
References: <20261021190212.2237804-1-dmitry.torokhov@gmail.com>
 <atkULU8_9xQ1c3eY@ashevche-desk.local>
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
In-Reply-To: <atkULU8_9xQ1c3eY@ashevche-desk.local>

On Wed, Oct 21, 2026 at 10:36:13PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 21, 2026 at 12:02:06PM -0700, Dmitry Torokhov wrote:
> > In gpiod_get_array(), descs->ndescs is used as the loop induction
> > variable and is only incremented at the end of each iteration. When
> > krealloc() fails on the first iteration (when index is 0), descs->desc[0]
> > has already been acquired via gpiod_get_index(), but descs->ndescs is
> > still 0. Consequently, gpiod_put_array() frees descs without releasing
> > descs->desc[0], leaking the descriptor.
> > 
> > Fix this by using a dedicated loop induction variable and incrementing
> > descs->ndescs immediately upon storing the retrieved descriptor.
> > Additionally, since the fast-path array_info setup only executes for
> > the first element (index 0), simplify the bitmap_set() calls to start at
> > bit 0 for count bits instead of calculating offsets from the loop index.
> 
> Can you start doing cover letters, please? The problem is if I want to give a
> tag for the entire series I will need to iterate over all patches, while `b4`
> has facility to do it for me. Also with --base it would be easier to see which
> base you have used for the series.

Alright. It was supposed to be a small patch so I did it in my patch
queue, but then it grew to series if 5...

Thanks.

-- 
Dmitry
