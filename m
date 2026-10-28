Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793154167;
	b=n5efIVvxgabjazvi01KzBgs7ZoP8LOUD9ZxY5f6Ip4FeipOzY65TSacgy6d7YCGbsy8X
	 aa+vyMFWxwqmxtYjSyyMyNXOwctJsKojlI1S14+CyCgvt1bYsESbERG2AuDk5gq3yCYhU
	 x0RXgWzpIX2vFBaAyGPAwoNwE8q1fbLV341ivH/6dgE3D7/qbxMRtRFfiIA2LGzgGJbkN
	 1iS73WZWXu78HKfLomRSByDBa/4YHmq1Fzs5SXvAkY4nXEgj49VaHULb70K9JDx3wRaQg
	 /UBdYuc8ipMNufZfAI3uQDJVKrRV8VYQClB3wJ7FQwpP+TlwvSs1s65nQey5mu8tKLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793154167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SzFXpQkfPDM3m3i/dGse7HfQ/Rq6VRdrmurJpP9q7DQ=;
	b=nRrSXrVOkO6UQ2f3gPK80yefTCXmC/AsSE7Y+kHKy0sQKXLpSmfW0BWlgTBdMXze9f5f
	 g2oHQCGXNV1VQ3vdbZ4Qf9ibOnr/aG1+DDWvBuWheQwfzPk9Kl63YOakobQ27kYfZ2mp4
	 XItZ2pWItYLugTrYHwnG+N/euf3RG9egyGDyHqDVZe33Fw4HhUz5+A24umP0lDoZfvmgS
	 DJOCdc/KOGJK23uc2j5tnrp+cb6fjMHr4DfgomOta2ppZuKaA8K+kl0VzTkv6sRUv6amx
	 MUb6Xirlt4GQ0U/7CWFhoTJKQnBxTf1h1sTg7RYNMQlBZCDGv8GkNHQiJWCacTn4i+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fZ3vHGWW;
	arc=none smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EE4606A323
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8EE4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fZ3vHGWW
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5ec3561ad43so335340e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793154166; x=1793758966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SzFXpQkfPDM3m3i/dGse7HfQ/Rq6VRdrmurJpP9q7DQ=;
        b=fZ3vHGWW2qbUnPcwE08qOOaSAjEdJU6q+I9tjUcuLD7ttFUvtQOjRaxrDin1CC6NsR
         3XMRkGjmRs7lWw1maeVAIxhJ6N49/dCtKTVHQANQoQmoTydHbufX2LGDEaT6wr5XRrzF
         BJSG9WwZLBipcqONXmtL/LVgW3X3haaiFTqmp//VtSnMz4ZZn5pY2d2B0NtsLyW3gZrX
         0XTy6vusOk9WqV4OHf78oIRrDzeXAPRpRpifjjnJ2r5J/XD0U7akdtZjAVSB8T7jpnVb
         fYaz4x8xKPnTC8C5WLWxdUbXW62pUSRDKBNssPhPV/3hlNm7EhrXW2wNOStLP/xI1Sn+
         5Vww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793154166; x=1793758966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SzFXpQkfPDM3m3i/dGse7HfQ/Rq6VRdrmurJpP9q7DQ=;
        b=fXdYKZ63/bPoJJYVldS6HG8+0aB/JHrcGuZMgeMPGj2UMlid4imo80PV96dnTJ1742
         voD2Fgto5o00WDAhosN10SQcg+X2t5yuDVwICQiz03m/hX1WeyceA3n+yYY6x7uJmjj2
         TiEcHUaspkyXwVW64FxUe0rceCsTomufv3ZdCS5W7gDjVu3hecj7f8B3X9hfYmjPTq1i
         ieOiw+lXrcq/6jjo6R5YhJ66BvKoG57cQ7LROCpWqKwJiUTG044tsgqrTpgYUWtZ1qid
         Gh6EnEUDW0WDPT7dJJpB8siywab4zO/9YqUwdHQM0bLYkIuPK4DfBkLUxQKQyrgM4zM9
         crUQ==
X-Forwarded-Encrypted: i=1; AKwUvBykNMkEXwJjrnEk+rgcFmRbToxQIs+binb2pwOdPrrmmaQtqbSuIQGbmdQrgyL3ZkGadjq1cr9xEU2RRNM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpQ8oOQ6SMUXzRjM2YultlJbNVtrgZy9K4zCRO6/fqc8F4x/kX
	kIsj7PK4IAR1czXD8yfrg9E6wO+HWB8X8PFdGxzv8C9Udcadpq5zn/Or
X-Gm-Gg: AYBFou25DVDuhiji992LPE+ii1OY3k/xnlYHwhF9+ZYt3MOsJkY02JRBWHcXP5Jr1+d
	nMWZuGyRATEmMVKLsP5mHT3IwK08ArQZzGvQ+sF4C0MlMwgiXaz3GhUfgRHs/3KnW8K6CTPgxbZ
	wKE9q9sTwkqlxWkxVO9efA9rUZsLhECqIu/oa/oyFr5x3WS/8UNySqoaeuScj/5Z+RO5FDLASxb
	csbsKtxg8v1ARp23l8oUxuUOG586WAipDC7d2+bOYeIbonVPo8VFaY5LVrf/DPmBNunhc2/pSMr
	4LL1VEatH6p/QbMa8sP14OPfNogH+YUUan6Bp6rsksnyQimvfLCuv4luEo62FM7b8lQ2mHmIRzw
	886A2/RpgUoDvTGLk0vtUs8NncNeZ0zH/a5bOUVjeHH9ZN6oiesa2cxVvYZ8UwuDbyr1uMwRuRP
	oWmnFEZNpA4ps12kbJEk2VWfqAXMYeJzw8jLdgRtbKyrOPVUhh1pe7hug3Bf2oznbzHBkJdsPWS
	rZUqbmol/kGD/tPLDY7VHbYezs4vD0/fwgod2xOJUsWPAEgjCkdM2A52UaZLKIFsOC2OiwNaYRE
	WYk=
X-Received: by 2002:a05:6122:e146:b0:5ea:be1b:1b24 with SMTP id 71dfb90a1353d-5ec4cbd805bmr534752e0c.13.1793154165588;
        Tue, 27 Oct 2026 19:22:45 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:4df:52dc:4559:394e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f8dfcf1sm415927e0c.3.2026.10.27.19.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:22:44 -0700 (PDT)
From: Stephan Costa Barros <stephanbrrs8@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] iio: adc: ti-ads1298: prepare for more chip families
Date: Tue, 27 Oct 2026 23:22:36 -0300
Message-ID: <20261028022236.30455-1-stephanbrrs8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025232608.06a5762c@jic23-hlaptop>
References: <20261024231335.280955-1-stephanbrrs8@gmail.com> <20261024231335.280955-5-stephanbrrs8@gmail.com> <20261025232608.06a5762c@jic23-hlaptop>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 25 Oct 2026 23:26:08 +0000, Jonathan Cameron wrote:
> > +/* What differs between the chip families the driver supports */
>
> This is very standard naming and purpose. I'd drop the comment.

Will drop it, and the other generic ones. dr and hr will be spelled
out, and vref_mv becomes internal_vref_mV.

> > +	/* CONFIG3 has the VREF_4V bit, which selects a 4 V internal reference */
> > +	bool has_vref_4v;
>
> I'm lost here. If it's about the bit, then name it after the bit.
> I suspect it's about internal reference that can be disabled or not?
> In that case can you name it for that functionality instead?
>
> From a quick look below, seems it is about what of two modes can be
> used?  If so how does that fit with just one vref_mv above?

It is about the internal reference. On the ADS129x it is 2.4 V, or 4 V
when CONFIG3 VREF_4V is set, which the driver does when AVDD is 4.4 V or
more. On the ADS1299 it is a fixed 4.5 V, and that bit is reserved. So
vref_mv was the default internal reference, and has_vref_4v said that
the 4 V option exists.

For v3: chip info has internal_vref_mV (2400 and 4500) and a bool named
for the 4 V option; init chooses the reference once and keeps it, so
read_raw no longer reads CONFIG3. Andy asked for the same.

> > +	/* Reserved bits of CONFIG3 that must be written as 1 */
>
> This one is interesting. Normally we deal with these by just using
> RMW cycles on such a register.   Can we do that here?

Yes. CONFIG3 resets to 40h on the ADS129x and 60h on the ADS1299, with
the reserved bits set, and the regmap has no defaults, so
regmap_update_bits() reads them from the chip. config3_reserved goes.

> Please use FIELD_GET() and fix the family masks to be values in the field
> rather than the shifted version.  You might want to do that
> as a separate precursor patch.  Looks like there may be other similar
> changes in driver around fields vs value defines.

Will do

Thanks,
Stephan
