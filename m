Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB243C5523
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789472823; cv=none; b=f1rANVAI416hxQR2qxSqx1Y89W4err5kKPFW2iVriBkjEULzPchj5yhM4n9dEKqbZiI1bTIta9srKNdm353JjAUphnPnFXGR85xIVk6iMMBjn+0rKhLVUojTUfZwYlU2KyYXxvepfX0bQdQQHMPQ5y2KVxNk1GaCZhVHKRAfk4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789472823; c=relaxed/simple;
	bh=ac6tZgLnUNvpCiT3oBM1Q0XjYFyZen8Qw7kHMHY2Vkk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=avyxMgLddE8RyKEHNjN0rQxy+SbKphghJxuILlTiMvSObACChXckOQco6qTK9JzxhZGdHYSLlPYnETEeAsF/KZ71fjTKej5BKcYTDIjh0cLr8YeiBdyUC79qSn2Kk/RFPOeu4YdJHsHfA8R7mFGHUewVWal0Eqz77+PVaauKdMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mw4lOVLI; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mw4lOVLI"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so1126895e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789472819; x=1790077619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XWLYzPKn9Z277Ee1TDtRp8i78DpmLDVKS5xGRIF3oZM=;
        b=mw4lOVLIDzBcm7GIBDJriKcukv4n7/qahjXwFqNOId4CgaXeh+OKmuKbQ0haTUdwlQ
         LVnKVJrpMUhvp9UvfZSa23q4Xf0pgVO3gV4UN9Nud5iLDQoR9+yG9aFDl9s2dsyBLnyf
         9ISameNdMEKPtHDE2ZbjNquPYfh/0dzf/RrpTRotMnHl+alkLpk1VuL/kRoC+VPpl7A9
         oQG6RuRQEPO7SyaJ1NN8FB352skPMm++iTl7KfNq2wDtFzd3Q6toeZaab5GKbvQpH/Im
         1PBltYUrHxGXjJ00Syd6LEuRo1aIjWaGlvMAXL84+J7PIKteqL2Ok5Y8npbeaumCwd8m
         CH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789472819; x=1790077619;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XWLYzPKn9Z277Ee1TDtRp8i78DpmLDVKS5xGRIF3oZM=;
        b=c39ETREbKFMsPY5LwtIYoGCH4ZDi2YtyegbSZZwBwc6JDmPY+WbB7bIMSLTgSegOZW
         fTodZHiQWVH7p7lez7VdR8rsGPiRu0SY97pozRPjSKhjsPKXraAXydkJ7XMVGZzzx7MK
         oa1koVy2/5kZUSH4a5hMuUglNr98Ygy3KNSe3q7+SVyXv6HS1zfXFswiCkgtlvciUWMt
         DDhCQK/C0J25GrMWBDBUi+i/QQiJBjA9l5GJXxpXX+0a2JgTDrBtpwC6yWGVDhBoNkju
         Ov96lsEOKIHDsiVWo/XhFw0KHqFp6nsS3hXAd1LOG4sBUSocRNNGdYbPQh+zcG2oEDcD
         hnmQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8qDxbkVLAZIBzirvdXv9KFEAxlpcWFIPGe4qIToqn9khmrWlx4J7lzBIsLSHOf1ZZkX9v+jXLzSBlGuM=@vger.kernel.org
X-Gm-Message-State: AFuF++kOZu90OR3VcapumJ5Xg9X44Sm27CXGfxQeltWOyx0uAPvcl4Iu
	Agis7GZhB8ccbmwoETXmlVPcs9mLJHEuqLTib/ZX+OEW95LbyS+48kte
X-Gm-Gg: AYBFou2zrGNDlnygj6IxhiwpRjxT5dIk5rYWF2CHcFILVV19gMzdEAriIYSaIXMhdSU
	RhmNG7KXYuoVv87aFIkOS/9BZpSUQmrUUw9HKThj2tIJjIsZtIrWU8McLo3rqbXQPLuxMmqj/kH
	ckBdAlCA7Fx7o7rzesI7VA4F5m3gIBEQ7NoPdHgXtmM9PhcYqgg+q0fMVMSmaJ8Y9Xgx9FroQ4C
	2iGpmWSrDbUsiBR8y9wseJ3bYQER4WWJ89FQkO72Bx4qa5DCz2DAnv/Xk1r2/l/GbE/WK/TjvMn
	x5i33nWLDyoGCRtFWDgZx0BNV6luXq5Hmi6gjaxAWyyRIT4BhppFaP2wrWm58J6ynGka/b+QtTA
	rhlwOD6+GdokPhANSdUbjuv8iio5b17e83eHl3HekYe2jwfMHOzRP+w29myZUJQW13e82pbsMeA
	SCcHURKYLGUe2O+5lbL6UuVHQgGyJvXbnRgmeACYYP3M66ZtgoVjBFw+KlntDfP8lCtfJpIls3s
	HZ6Sj9QZXS4k5vcQ8VXnSfIzRnD85OmYo/1EjVobAFNAlw/qyb6SgkAucbkKmCZZ8t+dKvp9dmp
	qLruwZhCCSv8ZQFI8pjovm45XCHjxZfYLsfzcLiDKY6g0jtuCA2kPstBf21K2S3lSk8KnzkrYXj
	nwjOhe2u0uEXGqZonxt3u34JbyiAcDNz92kiSsKAhZE+QyNeHfHoe5rTkVWsfrixmH1AnI82QuC
	DvlTGSdiwS91JQzHw=
X-Received: by 2002:a05:600c:1d0e:b0:49d:1a02:4797 with SMTP id 5b1f17b1804b1-49e8227fda2mr11731415e9.17.1789472819082;
        Tue, 15 Sep 2026 04:46:59 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef8a7b1sm53841325e9.12.2026.09.15.04.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:46:58 -0700 (PDT)
Date: Tue, 15 Sep 2026 13:46:57 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: "Maxwell Doose" <maxwell@maxwelld.cc>
Cc: "Abdelnasser Hussein" <abdelnasserhussein11@gmail.com>,
 <jic23@kernel.org>, <gregkh@linuxfoundation.org>, <nuno.sa@analog.com>,
 <Michael.Hennerich@analog.com>, <dlechner@baylibre.com>, <andy@kernel.org>,
 <linux@analog.com>, <linux-iio@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/3] staging: iio: adc: ad7816: Serialize SPI
 operations
Message-ID: <20260915134657.000016e8@gmail.com>
In-Reply-To: <DLFV0K85626F.2MUXL6JKFNF5H@maxwelld.cc>
References: <20260915075939.18180-1-abdelnasserhussein11@gmail.com>
	<20260915075939.18180-3-abdelnasserhussein11@gmail.com>
	<DLFV0K85626F.2MUXL6JKFNF5H@maxwelld.cc>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 06:39:34 -0500
"Maxwell Doose" <maxwell@maxwelld.cc> wrote:

> On Tue Sep 15, 2026 at 2:59 AM CDT
> Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:
> 
> > The ad7816_spi_read() and ad7816_spi_write() functions perform a
> > sequence of GPIO state changes followed by an SPI transfer. If multiple
> > operations occur simultaneously, the GPIO state could be changed by one
> > thread while another is in the middle of a transfer, leading to a race
> > condition.
> >
> > Introduce a mutex to serialize the operations, ensuring that the GPIO
> > toggling and the SPI transfer are treated as a single atomic operation.
> > The mutex is placed right after the pointers in the device state
> > structure to avoid padding holes.
> >
> > Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> > ---
> >  drivers/staging/iio/adc/ad7816.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)  
> ...
> > @@ -47,6 +49,7 @@ struct ad7816_chip_info {
> >  	struct gpio_desc *rdwr_pin;
> >  	struct gpio_desc *convert_pin;
> >  	struct gpio_desc *busy_pin;
> > +	struct mutex lock; /* protect device state during SPI transfers */  
> 
> I'm a little on the fence about the comment but if it satisfies
> checkpatch then thats one less patch later.

It's perfectly fine to comment like this, especially since this seems to
be the style the driver uses.

-- 
Kind regards,
Joshua Crofts
