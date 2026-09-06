Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A7327AC57
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 20:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788725830; cv=none; b=THgJiDwwjC7K+hgYbTk5DRfyxZAZH+AC/yPJK81cufrEoXRfO5unXhmi68N3rZkqMjRUX/YqVlkofLatQ0GiGey4/3XF6XCmDNyGt7KekOfIBhAgBfnUhf9lx0st2lfDDat9UCixX47RCiRFiTyY9y6fH+av+eEFz5zn2IcwKts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788725830; c=relaxed/simple;
	bh=ykDPNgeE6ALCDtG9dIbJeisPavXCkocBpXkJWK5BPFc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=KYtbGaEzT3ZUEgIFAtRhKR8FkK+StldmH7cuIV7f79sRTC5OOqZt1GllaoOd+SFMnbbvqLcU+FmZ1Uv7z9wHUZzTok1SOvE32AVzubmz66p4ZxB/imsOxbJl7iDqkHYSg5Jk0drjbGvb2XaV8WqrRRaYNDPqzvyfjxGnFjH3axM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0lW3qV8; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0lW3qV8"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-980c4258105so174498241.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 13:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788725827; x=1789330627; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G71y+UDrFIT1z0z2AwWCoqvpruo2h+SQeZ7yG6rfDDQ=;
        b=d0lW3qV8vMIQtpRJeOctIwZxiPL2OxRw1xN07JnLut9Vo2HpQXUX55E8Fjjg9QZo2g
         tyWZ1ELwuiSNuFlQiF2Zv7MjYBkTrQMEcXv3UdHrfz2z7MfkcvMcfZG7LVAsafZFrIGx
         icKTK9qz31pjtB4M09VVN1le5eGejZ/umhDVAtQiEKSdYjDzHgPLmv4yOuDTjF7oqD9u
         m2UwNuGhKwSA+8oS7YtLnKY0Nh7L8J/v0SRihhZ2wdTkRX1meKX3LowDkjGlF07udSaw
         K9eDe6yFpFuuI8x3yJlwy2mb1VO1D8HJO4koVHnSicGP4RX1xr7tRBHsZ/R4aQWbF7GE
         qlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788725827; x=1789330627;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G71y+UDrFIT1z0z2AwWCoqvpruo2h+SQeZ7yG6rfDDQ=;
        b=rWneELe/vTYzxGX71NxmDYtf7yUGJHOS1hxm0DN5eCOk72Dc/k/7JAi+SyAd4qFDpD
         8TPSQPyGj0OGcSLYxvVgMoxORRUK4UgdKkhWfjJt6Unhz+YHOsn9DrSCGf9BD8UYi4RL
         RJQ6XckfmxCBiTcm1I8wVxoKzMvXtRJ8k/tcRy78FSoY6JN38nCZ26Te+/ksuKEslFKc
         5xKueB/EnrUGt2qZoqNi57tIODkez29RL8xmjQp2d6LNpv0g30K3U9v49GAJ/d86a3sg
         P/STKDatHNzyJLn8aYiIytTC6WZgk6xUUUbbnyE4vfM50sCGHkU9xpFo6s6Oq1eU39eY
         Y/rw==
X-Forwarded-Encrypted: i=1; AKwUvBw2N9jKzjsyLH4hKxIRl+Y2XM+s26F+eGU+DMkTBMcPDLkoHwyuVdUjz/pPQShcidOt/3n5gzbLQO6wIho=@vger.kernel.org
X-Gm-Message-State: AFuF++kTwrUNjtu7sBzN/fdNY/tEfby7WwzOdRgA8Edc5PFy7le3HV9i
	fJ22fnCD06MOijkcjOpeL2Sokfmef9vvBWE17jPvvpSOdqm8q0fn4uz/
X-Gm-Gg: AYBFou1U81laADscldadcrkAtfq//CunEO8o2YLHVHnSJkmAi/SHUjKUZ2MfvTBfXwf
	18usyK77Cbk9W/ct/gW9vwLAXXdz0Fu4fQsU8EILNoLRbHf6uyWeC0lBsJbFFYqA1Q3AuP2cdWZ
	anav0tKgGRkBMiEDUZpUPLY5R4EW88xP9EYjghvAIlenW8+Am0y1o9i2yZadFkRwigFesJ30ORu
	zyxOO1GbySsGA/Yf1/k9lY0fGvrOnnNbsdMLPpySxy9W2pCjqZWh3jHOZfpMqIyjlK1tk9GZkbw
	B1mJvDH4UrbS3J9KpWxzWmdOChydQH0y4j/X2xTl6PAhDnJQZ330zenNjwn6gRreawD74uL3nIF
	2YOd1Bbg156jcxn1sK5qbeNgAmQGARUFBjodIPygfI8P1ENRAX9M+CKAMlkqcraRJWp7sgJTW1r
	/aJdX3TViIIRVod14tnplFUr/ls1A/FRGDzt1mLy3NYQQj//d0SA==
X-Received: by 2002:a05:6102:5e91:b0:784:b882:9567 with SMTP id ada2fe7eead31-78a4a9d9306mr7941864137.6.1788725826886;
        Sun, 06 Sep 2026 13:17:06 -0700 (PDT)
Received: from localhost ([2800:40:44:f1f5:f400:4c49:91c1:9905])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a478bb21esm5787085137.1.2026.09.06.13.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 13:17:06 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 06 Sep 2026 17:17:02 -0300
Message-Id: <DL8IDULL3UOW.1ASCQ859X5KV9@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 04/10] iio: adc: ti-ads1262: support per-channel
 sampling frequency
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "Kurt Borja" <kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
 <20260828-ads126x-v4-4-1dc27e9c0260@gmail.com>
 <20260830032237.6c143d59@jic23-huawei>
In-Reply-To: <20260830032237.6c143d59@jic23-huawei>

On Sat Aug 29, 2026 at 11:22 PM -03, Jonathan Cameron wrote:
> On Fri, 28 Aug 2026 01:38:19 -0500
> Kurt Borja <kuurtb@gmail.com> wrote:
>
>> Add per-channel sampling frequency support. The "available" attribute is
>> assigned per-channel too, in order to eventually support per-filter
>> availability.
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>
>>  struct ads1262 {
>>  	struct spi_device *spi;
>>  	struct regmap *regmap;
>>  	struct gpio_desc *start_gpiod;
>> +	size_t num_channels;
>> +	struct ads1262_channel *channels;
>
> __counted_by_ptr() usable here?

I didn't know about that tag :o I'll use it.

>
>>  	/* protects concurrent SPI transfers */
>>  	struct mutex xfer_lock;
>>  	/* protects channel state */
>> @@ -185,6 +195,8 @@ struct ads1262 {

--=20
Thanks,
 ~ Kurt

