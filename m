Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F294B4887
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003490; cv=none; b=kIGLpZ9ORUNGFjPFSSgbm+k6vLsGAzYMQs2IOhgvyeISfsd4ViMT+NQw638PCYdKvZbvZtXctALmkSYWtkEf94EQzJ0P38+ZafMi6jliNWKTpqNuNnsCLaz9kId7+/B0gdq9yTnWcFDQqJqxoYuedd1bIgCIpD1bjJDkL0QNR7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003490; c=relaxed/simple;
	bh=ZTCJvXoBV8RP2vIYKQszn9XZ30Wu6GdcQ0zPG5RY6IM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iYtzbf2LOcE81MxefD0X6Lzj2FQgnj6KDh6wlX/xdZZkrUrIqfj4j+kYIuHVRFUIjbS+dIwGzHAiSBL3I06gtu/ZQbpyv/nqTT67zhAg1idwddNmL0leQx3w8uvwC1ypzB/RpC8T2otzHea3nwRafB6fT+59g0X4B9wIJsh7kGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFpnWOr7; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFpnWOr7"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e53002bso1794009e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790003478; x=1790608278; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cKj6cgHdEp15E9vhsDJp2muq+So8+qMhQDWxfEct4bI=;
        b=fFpnWOr7Q4JwtO1nRHqEkmzSMld/2lkJ9CpBTiqGt+sxpXhdMHJ2X/hBvpDyx4oLeA
         360Ns0JrDCFUeuota7RRkr1Atj1FI1cRVuixBhr9ddYUCG6mhZECdvbf8ilZyEztrMid
         lQSalDQth6RaJ+8LYEb61BwHr55n1j6kdHzg+b2upSmvcMUCQ1G0a1Y3cMcF6JWpy06g
         JIkoI2XKCj8UVUCHBITE9C0I6RxMSV1YjFkYGGGACPn9YrapJlisj1FYlH5NX91b1/F9
         7P15YhoP9OfXQCoJdXcCB8xdc4uGguJWjKJ/jWADXpqw+6H/V6DqvWymHtNySumOvd8U
         u5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003478; x=1790608278;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKj6cgHdEp15E9vhsDJp2muq+So8+qMhQDWxfEct4bI=;
        b=eTlXrC4/R4vT9Pg4gd4nSHGKYGzkwa9aACI67VH62m5ri+kGXHFLoCvKKbX49MybJV
         o6VNe6RSyYZDu9O/tsN0s2Qnq9xKF3SgbKjFX3eaygdeKGVrevKcn9fD826cGtMnbPQc
         jEEpVkd+jl1OBO0MJz709LHb4Eb3YyDxwwoe4qrxIQjz4XttIodFmv0tzg8bs5h2EPdp
         E5Yja0BSltdtEfsVoCrTMqzH6oaKF/uz92hgoF4KyxpVe2qNslGQdcfEN2lWRAZ/tFQC
         FtX7qCz7jXmLqXrqdOF9j2NOtmzy9BwlgvMSmKBlkpOXOMk6ihNkzVnV2OCTNKnXU2Ga
         ujpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCegYm5RZmE2xZ/7Y83kpz2TrZ6xDXSjBxB8/yap/QbsapBy46VL8qxVauaavwS4DCypt6/sMwEF1WfwY=@vger.kernel.org
X-Gm-Message-State: AFuF++mllEZ8osqxKL4NLb0Z1bnDgV+sk07HIpLcT38SgitexKK6T0WQ
	rePPv3wF8/snk+HLSTfHpcqlBenOxfog3Qi6J6CNxQrTRCoEeoRy9yuO
X-Gm-Gg: AYBFou32nW1qagbLOCcADuncPgiswQlyl4shc2Uf0J2q9nDZnx+qQQJznXvCtjocgrL
	c0DSt0Gdxmz5o3pVdndujsB5CKsioninlTVEPmlmsIMCRQZzKFDcOv72gMOeA5PUWnKL62j4JOF
	TD+RxQwNj9HEw4/4/FvVgfB/q2ByWlADN8gbzDPd4QP/Y9JorO5qTtG7rPzs/pt+YHe1poG1VLQ
	J+bUJ8P685SozoLApdLTDHp9bW3a0wF80vU3A95SqXtucamvpicizjxl0a7OACy67o9K2k92WY6
	CSg5F51UC0/OH0ODyQU2xX4O/tf9TiT9KRkFjxfiFieuOPquqPBp3p4XYdiOfZp6tncbd66m5G0
	Q0igImz5sw80KXtrU+DjKpMiDSLLG30ho9cKh2K8AByez5ogEUmOeTKzyvMdNW5JWx4ONv8Ni1j
	NWkguJWayNQzxW3p7WpsKBTSnrH2pD+l1oGQL6VqCYu5mVFg6mpdGpPcCiexzFdh5xsnu1LwA7A
	kNj
X-Received: by 2002:a05:6122:2202:b0:5c9:c60e:3a3d with SMTP id 71dfb90a1353d-5c9c60e3d5bmr3601718e0c.21.1790003478530;
        Mon, 21 Sep 2026 08:11:18 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9e1e46d24sm151226e0c.3.2026.09.21.08.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:11:17 -0700 (PDT)
Date: Mon, 21 Sep 2026 12:12:24 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@analog.com, nuno.sa@analog.com, dlechner@baylibre.com,
	andy@kernel.org, Michael.Hennerich@analog.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v2 08/15] iio: adc: ad4134: Support buffered data read
Message-ID: <arFJWLuqlzvkk6qP@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1789494473.git.marcelo.schmitt@analog.com>
 <dbc37d95fe7f96bd158d8e3339c41205524ae217.1789494473.git.marcelo.schmitt@analog.com>
 <178995544507.955708.14374719433731561725.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178995544507.955708.14374719433731561725.b4-review@b4>

Hi Jonathan,

On 09/21, Jonathan Cameron wrote:
> > Enable users to run buffered data captures triggered by IIO trigger device.
> > Add an IIO timestamp channel so each data scan is provided with measurement
> > time information. Require single-read operations to be in IIO device direct
> > access mode to prevent buffered and single-shot data captures to disrupt
> > each other.
> > 
> > Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> 
> Hi Marcelo
> 
> Sashiko had a bunch of feedback on this one.  Note that you can save
> time if you check out what it comes up with and reply to the thread
> to say what is valid and not.

Yes, I've been working on fixes for the issues that seem legitimate. Most of
them do seem to make sense. I was to reply only to the ones that seem off, but
didn't yet manage to fully assess them all. Will start providing preliminary
reply to automated reviews.

> 
> I haven't yet asked for those emails to go directly to linux-iio
> as the quality is mixed and I am reluctant to confuse newcomers, but
> most like I will ask them to turn those emails on in a month or so
> if not before. In meantime more experienced folk can look at the
> website directly.
> 
> > diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> > index 30c7b1d1bc67..0b6843bf8a9e 100644
> 
> >  
> 
> >  
> >  struct ad4134_state {
> > @@ -149,7 +161,10 @@ struct ad4134_state {
> >  	 * DMA (thus cache coherency maintenance) requires the transfer buffers
> >  	 * to live in their own cache lines.
> >  	 */
> > -	u8 rx_buf[AD4134_SPI_MAX_XFER_LEN] __aligned(IIO_DMA_MINALIGN);
> > +	union {
> > +		u8 reg[AD4134_SPI_MAX_XFER_LEN];
> > +		u32 scan[ARRAY_SIZE(ad4134_chan_set)];
> 
> 
> Sashiko:
> [Severity: High]
> Does this array size fail to account for the timestamp's alignment padding?
> 
> The array is fixed at 20 bytes (5 elements). When all 4 channels and the 64-bit
> timestamp are active, the IIO core computes scan_bytes as 24 bytes due to the
> timestamp's 8-byte alignment requirement (16 bytes data + 8 bytes padding and
> timestamp). Passing sizeof(st->rx_buf.scan) to iio_push_to_buffers_with_ts()
> later in the trigger handler will cause the IIO core's safety check to fail,
> aborting the buffer push with -ENOSPC on full-scan captures.
> -
> 
> That does indeed look wrong. I'd expect to see one of the DECLARE
> buffer macros used here to ensure a large enough buffer.  This
> should have shown up in testing so I'm curious why it didn't.

I had initially tested with only one or two channels enabled while requesting
timestamp. This issue is going to be fixed in v3.

> 
> [Severity: High]
> Can concurrent lockless accesses corrupt the rx_buf shared union?
> 
> The ad4134_trigger_handler() executes locklessly in a pollfunc context, while
> regmap debugfs reads/writes (which do not acquire the IIO direct mode lock) can
> concurrently use st->rx_buf.reg as a DMA buffer. This can result in corrupted
> SPI scan data, corrupted regmap read/write data, and potentially invalid
> hardware configurations or ADC samples if debugfs is accessed while a triggered
> buffer capture is running.
> 
> -
> Also sounds valid though I haven't confirmed everything stated.
> A buffer like this should be protected by a local lock, not rely on
> serialization via the mode claim mechanism.

Yes, that's a valid one that is going to be fixed.

> 
> > +	} rx_buf __aligned(IIO_DMA_MINALIGN);
> >  	u8 tx_buf[AD4134_SPI_MAX_XFER_LEN];
> >  };
> 
> 
> > @@ -281,7 +296,7 @@ static int ad4134_data_read(struct ad4134_state *st, unsigned int reg,
> >  		 * Clock out data from all channels to avoid that.
> >  		 */
> >  		if (i == AD4134_VREG_CH(reg))
> > -			sample = get_unaligned_be24(st->rx_buf);
> > +			sample = get_unaligned_be24(st->rx_buf.reg);
> >  	}
> >  	*val = sign_extend32(sample, AD4134_CHAN_PRECISION_BITS - 1);
> 
> [Severity: Medium]
> Does this leak uninitialized stack memory if the soft timestamp channel is read
> as a virtual register?
> 
> Because ad4134_regmap_config sets max_register to include the soft timestamp
> channel (ARRAY_SIZE(ad4134_chan_set) includes the timestamp, making index 4
> valid), userspace could read virtual register index 4 via regmap debugfs. In
> that case, this loop iterates only up to AD4134_NUM_CHANNELS (indices 0 to 3),
> meaning `i == AD4134_VREG_CH(reg)` (where AD4134_VREG_CH(reg) would be 4) is
> never true. The sample variable is left uninitialized, and an uninitialized
> 32-bit stack chunk is processed and returned to userspace.
> -
> Please check this one.
> >  
> 
Ack

> 
> 
> > @@ -333,6 +348,37 @@ static const struct regmap_config ad4134_regmap_config = {
> >  	.max_register = AD4134_CH_VREG(ARRAY_SIZE(ad4134_chan_set)),
> >  };
> >  
> > +static irqreturn_t ad4134_trigger_handler(int irq, void *p)
> > +{
> > +	struct iio_poll_func *pf = p;
> > +	struct iio_dev *indio_dev = pf->indio_dev;
> > +	struct ad4134_state *st = iio_priv(indio_dev);
> > +	unsigned int i = 0;
> > +	int ret;
> > +
> > +	gpiod_set_value_cansleep(st->odr_gpio, 1);
> > +	fsleep(1);
> > +	gpiod_set_value_cansleep(st->odr_gpio, 0);
> > +
> > +	for (unsigned int ch = 0; ch < AD4134_NUM_CHANNELS; ch++) {
> > +		ret = spi_write_then_read(st->spi, NULL, 0, &st->rx_buf.scan[ch],
> > +					  BITS_TO_BYTES(AD4134_CHAN_PRECISION_BITS));
> > +		if (ret)
> > +			goto err_out;
> > +
> > +		if (test_bit(ch, indio_dev->active_scan_mask) && ch != i)
> > +			memcpy(&st->rx_buf.scan[i++], &st->rx_buf.scan[ch],
> 
> [Severity: High]
> Does this conditional logic permanently corrupt the scan data by overwriting
> active channels?
> 
> When the first active channel has the same index as the destination (for example,
> both are 0), the condition `ch != i` evaluates to false, short-circuiting the
> if statement and entirely skipping the post-increment `i++`. The next active
> channel will then overwrite the previous data by being written to scan[0] again.
> This triggers on any standard buffered capture involving multiple channels.
> -
> 
> Check this one as well. Looks plausible to me.

Ack.

Thanks,
Marcelo
