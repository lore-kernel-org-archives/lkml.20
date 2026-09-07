Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6D8503BCD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794101; cv=none; b=AcGovg+pTgXjmllzNA5/lci3WubfWRqzkkcDbPCb99p3xOrDyl6/J/BkSxYLmFcBErEIT0mej5WcSSe/smnAZRyMo6Ic87w9MIl3T9M9sMXwLuUpry0LTTZSAoV1GcoaU/kPjHraqFIBGjgfAWv9RD7FxKiDsf9wGhzazlGfvRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794101; c=relaxed/simple;
	bh=Hj5U5tuhaGLPE9duWI7mE72tBgu7I2rb+4tWpfLknSE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WUaDIRQYfYJEm71A5PYtfEE3w6IfKRUAiyfTdMX39VDvLrTTKCF4Qr+1uFAkcuupYxg3WZSXT7ulKDz5lN82+TR39Wy2pJCwXwGqhfL869yxtUldZQHFW+IuY0BAl91KpaYFbX2KtdzQk26mVUQKrEAzRH5RFSam0dsb6URVlaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLzModcE; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLzModcE"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so29606995e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788794096; x=1789398896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2IS/rYcwgewFHdcgCRoRR2IlNUPHyURUtKmUR1+9WG8=;
        b=FLzModcEYThgaeFWNo/5GicWtGtmSfC5OZw0zbi2rtUUdeG8tM+XolK7ngoXxyPLdq
         uvnrCIrYdDebQoXaWDmmZNbjxedLO8lmfEfHVhGil+nKCbObNaAwjZjKyAdHzPsmdgZL
         sS6ugpMZr3hIEax5R8q+EaEQ7OBZ1IPrgXLAlEZRiIS+5hPlzWfP2KuGcUpbC2CvWqbQ
         b4NFsFsVakNLy1M+w2eksSPz2fJvPXfzk6hYX/hx8RIASmrYB4LQaJDq/rH0toOpD5OY
         BjMuzFQ3LaVYc/TadQQyQgEdC2LEU9zfwV3NPr7+K95F3rtq3qL4Yk/zcl7g6Y9uLz4v
         kQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794096; x=1789398896;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2IS/rYcwgewFHdcgCRoRR2IlNUPHyURUtKmUR1+9WG8=;
        b=mt7UBB12FZofiwjnrezuqTA7mNYy3MyymT4MbH1j1Kh57oqVPro+30bSzW5SEWDpXO
         Z5oLOfDOs3YkGiDJOWkyHkmUhOkDCE2IDecJyCJZLb+G/nfNqoavstD3BeAh2Q6CenWr
         50PuMy8L+QKAiK+TWPi/TEWHnZ2FlCdEanCe/FAkoxVPPaQIVg0DTmmHznWHAMvyjoUk
         PDNHN9SS87rK+aMurifqY/T/qeB8PvOxh0ygV9mqPylpNdvysQ3SCRcVrii7pDrnz27A
         xFGCUziphHQlc3E6VZD+D4/HegT0PWU/NZ2YLQZOUXC/H0p0E77EhUu57tapc64c1b6v
         N7kQ==
X-Forwarded-Encrypted: i=1; AKwUvByQwcZa5FcV/7OSnG36NmSjefkB8nMYzKvhjzcQDyyIaxZYXsVmIxgd4UDaIxdAg8AqnkfPQYKuZJckuAQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lQmYkZgvIt+b8nti9HLuncj/qjma2wuSO9bGb5oq0+Iqequnth
	nBzBRhb0Br2ybZqT7k7aKNqSd3+Dc1/TWTGXWf7N+6G7fk8WObjObklP
X-Gm-Gg: AYBFou0N3CekyqmnJHbIQt3K5mAjaHptDnyFoP3GpJDk3QYpTThugelBQF211YtXRQn
	xUvPDT2bAwDW0JWuRbfZhE3I0jgg3Z8pIGwWd8a28EuXn1WWTkAtSm+Uy/mdLT5eVv1wL0yWRjE
	t9vJS5OQXSNLMPM217WTZX7rPZO07jh0H8g408oWtI5A5ftiKoSqeqhTXWlbml9lQuQuLawp1w8
	+22YBjPAC63+qEKxzpqT7xb9bT5s6ix/++o8VaJuR/J1h3llnhBksIguqZDi/oQUR/Zc8QBiQX6
	aS1PL2+GyLA669gFictYci6xa7PYvQYeULWCZsk/0ODNS2e6fYsh8oSWMgwHRNA+/zYDl/A9ht1
	oHwWl/01JyBJUdW+BdjdIl18gVNjLoXyhrEkJvpBmj4La0xLZ+RBBKu8cYHnhvUHuOV8c640MKm
	4V1UP94/P2XFgvcs44emjUMZhZUYT500QmBXr5CjfTJEfbGTNAVjmhdBZUW4qTO/JWo8JGtaDuR
	dAa6aI86WhFRWCAZ3sTm/WlKDp5vlkCbOMFIXQrxYxU6xLjjYnDrrC+D91NkIIwtp54jP2PQv/A
	o4qnSsvxdRoMvd1hI+1aRxa9aS4sVcJm3OzDNS/1rHVg2tGCh2xVxpB8VintRVHp3AGAJvAfNo3
	ZIV+PjhJoQxkUCTKt952aFg7gMXUgLx3Nc+rQ6o1p+rHFrj2MkjWInUttXAyGOzJ+q2xcuRZcdg
	vDelCx
X-Received: by 2002:a05:600c:3f08:b0:49c:fa20:cc04 with SMTP id 5b1f17b1804b1-49cfa20cd10mr194873055e9.27.1788794095682;
        Mon, 07 Sep 2026 08:14:55 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75ce49esm550897855e9.1.2026.09.07.08.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:14:55 -0700 (PDT)
Date: Mon, 7 Sep 2026 17:14:52 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Martin Kepplinger
 <martink@posteo.de>, Sean Nyekjaer <sean@geanix.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Martin Kepplinger
 <martin.kepplinger@theobroma-systems.com>, Christoph Muellner
 <christoph.muellner@theobroma-systems.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 6/9] iio: accel: mma8452: Add comment block for
 struct mma8452_data
Message-ID: <20260907171452.00004fc8@gmail.com>
In-Reply-To: <20260907-mma8452-open-drain-v8-6-c17407e22118@geanix.com>
References: <20260907-mma8452-open-drain-v8-0-c17407e22118@geanix.com>
	<20260907-mma8452-open-drain-v8-6-c17407e22118@geanix.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 07 Sep 2026 16:51:01 +0200
Esben Haabendal <esben@geanix.com> wrote:

> The struct mma8452_data is central for this driver, and it makes sense to
> have a description of the fields in it to make it easier to work with the
> driver.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  drivers/iio/accel/mma8452.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index c6af68d2a297..2c1b97b77bc1 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -104,6 +104,22 @@
>  
>  #define MMA8452_AUTO_SUSPEND_DELAY_MS		2000
>  
> +/**
> + * struct mma8452_data - IIO device private data structure
> + * @client:			the I2C client object
> + * @lock:			mutex for synchronziation of register
> + *				read-modify-write and holding chip in STANDBY
> + *				mode while writing to registers

Perhaps add the word sequences after read-modify-write (that
could be a personal preference though)?

> + * @orientation:		mounting matrix, flipped axis etc

Missing period in etc., but that's a small enough nit :)

> + * @chip_info:			chip specific data
> + * @vdd_reg:			reference to VDD regulator
> + * @vddio_reg:			reference to VDDIO regulator
> + * @buffer:			triggered buffer
> + * @sleep_val:			time in ms to sleep while waiting for drdy
> + * @ctrl_reg1:			CTRL_REG1 register shadow value
> + * @data_cfg:			DATA_CFG register shadow value
> + * @open_drain:			true for irq pin in open-drain mode
> + */
>  struct mma8452_data {
>  	struct i2c_client *client;
>  	struct mutex lock;
> 

Either way, with those added in a new version or fixed up
by Jonathan,

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
