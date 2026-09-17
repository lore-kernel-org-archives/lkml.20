Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F3151A75D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789650991; cv=none; b=jbBNsIg6An+KLpCYfQuKcM/x5Y/iPl1QMKXML9b9xUtcF7Q5ve0em1JpmJG7QgTIJzvxbcvJ+XVWh1lA5tV4VSn85ycAGovAdj5LXv334tPBQIQAaMgKh2bjLtrAxZAoj2kBs0liH+j70dmfpbNdlrxwlPOzuWMMEDbH9der3MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789650991; c=relaxed/simple;
	bh=uH8NWP6hqMrvDVS9z/5CKaKwPsFLHJzxuq9YJ/dyciA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4OAVn82A7w6NX6qvMLONax8jAKaIA0y8+PyL0GzQRwHAYgIailrzFt+CKmrSOKuKXLvFDTkt7Tvuxg/GgivPGFNSmLcfe0y0DqH0U2vicWSXmFkW8gMADCVq6Bs0HgA5uJtKQr4oVJC4vWUgMMCtMrtTXlYWv/GrWJtlxWHo+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDEOMm0u; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDEOMm0u"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874fso297061f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789650980; x=1790255780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jyHTXhU2i3wo4vr8m+HRY7gVmHqcPKmGSY9WcNTgeTg=;
        b=cDEOMm0uKQIoAo4QkAnCSDCycAgEo1RaoKX8MY3gyrq0OVoGGg7XZTw4+6Zn5a62pe
         igXwyfZRvdbdTtCyF1+yUeehbr/KjyZrP3tb6RNKVBvCFAAIOaJQGEdixs+HAfTbMlF8
         RRsaVYzYFWI/x/XWXUPGFRqX8J3q+h9jqZpRktoX4wW4SOmfI2HnhOuufE7htnKo8HOo
         9B/6+PwK1gvMI0l2wwwOm5Vs59sqnF1BZSWNZYFL7U/ZDSGbBYjo/8Mp4cuYpvxWKBV/
         I2aAlkBT4MEnnkPQTinXIEtkBP6/D7Aq/FHnmlUgwM2A26fSjvCI04HHLDFcyM4E8xRQ
         1kNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789650980; x=1790255780;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jyHTXhU2i3wo4vr8m+HRY7gVmHqcPKmGSY9WcNTgeTg=;
        b=0rp4lsNCWf7rsd7ygbAd+x1SdOI8uikr1lNLv+jrFuEGeNR6p5zghC9BmgprE+EmZu
         4LWaAcDkTyOihvsaTH3WI1jSI4pjnSW/Iu848L+U9BOyqK1bDM2t4R+ubBnzEKTyemlB
         lO8qQ0giF8jNd1qhe9Kc3mquGoZbSGB+OyQ2DJpkGsCSkrVCe7CW9mxJNcq9DcV8r/Rz
         QtfmMGYMdGMXnlS0EgQg/7wdtpC3AKWC4gikdgp5oekJljBJzSh8gxHAVjU/rc1ccPhC
         pEXJ7ncxW2jLeG7iFhWxgepzOz/hY0IVPAr1D7NOFK2cK6vZoupnq4QQbnUpQLfjptof
         6vBw==
X-Forwarded-Encrypted: i=1; AKwUvBwVorqSri0PDBcSh2lPkE1fVQQlFCsGAletmcy0l/0wAQHZjSyIDxuEB7shHNECfisKFdVPZ9rHqiDRufk=@vger.kernel.org
X-Gm-Message-State: AFuF++lVSsxC8YYihb8X3NOEl2BXkVfs2hxO2o+u7UIkSM2HCiDvv6h5
	94JdQ3XM7XxQWzDThJrnpKoQXt2Gjd/lEslAzBlbXbgHbslTRdhh/gAA
X-Gm-Gg: AYBFou2c1/Yq8hjvDPXKz55A2St0fmCr098OIATUA/r3+k2fUsUmpeWgeiw2kISvO9B
	EOC9f5xWvD6xv4An3xUuVMoBSIXjBoUnTu7r3z1GaUL64Dbf0RMnVEyTZxv4Jenqkgzfk6aw9Yu
	iPGpdEjr6EvJQgh3Kxm9c6zktNYsrumk5qceiTB9CT+QDFiGIDChstZlhWaS5StYqKbekbLUZcO
	cs0slBXV5buWIc0wdHy/TdCs9hfJ4kZgDDZbonDqHXy5OQt2HZelc7skzrbVS9DnNgrRcERDgvA
	r2nDSNkvGlQ4Q9TmlQOqNWA4nU0rv1it3mI3X5UjNWmnQGQPeqzYuLdMMt0iZN6JW40BF9T1IqZ
	SpY3GFF8YSoXYZm9QoTp4W0VSAePZjZC+PMoHA/yfc/NYwMkyFnnplGxqqskjAp8Pj3MFhipvWi
	vvIxF7dKOg5xSDtQYCrf8hU8dRoEXOa+EJ8z/jGoIeTQsMajNKvLcFJLPN5Yo=
X-Received: by 2002:a05:600c:1992:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49fbd1af43dmr45281015e9.3.1789650979552;
        Thu, 17 Sep 2026 06:16:19 -0700 (PDT)
Received: from pc ([196.235.229.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd232b25sm73364885e9.4.2026.09.17.06.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:16:18 -0700 (PDT)
Date: Thu, 17 Sep 2026 14:16:15 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Crt Mori <cmo@melexis.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: temperature: mlx90614: Fix dual channel probe
 condition check
Message-ID: <aqvoH9ohxkJ6iPei@pc>
References: <20260917110121.631587-1-salah.triki@gmail.com>
 <CAKv63utdoBrCFiw8vkGsMhY9PrWX0DWdxqP5szvTGpdmfSQh5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKv63utdoBrCFiw8vkGsMhY9PrWX0DWdxqP5szvTGpdmfSQh5A@mail.gmail.com>

Hi Crt,

Thanks for your feedback.

Actually, the patch primarily fixes the behavior for the MLX90614.

In the current codebase, MLX90614 has `chip_info->dual_channel = true`.
Because `mlx90614_probe_num_ir_sensors()` checks
`if (chip_info->dual_channel)`, it returns 0 immediately for MLX90614
without reading the EEPROM CONFIG1 register. As a result, dual-channel
MLX90614 sensors are incorrectly registered as single-channel devices.

For MLX90615 (`dual_channel = false`), the condition was bypassed, causing
an unnecessary SMBus read to EEPROM CONFIG1, even though MLX90615 only
supports a single object channel.

By changing the check to `if (!chip_info->dual_channel)`, we fix both
issues:
1. MLX90614 correctly reads EEPROM CONFIG1 to detect whether it operates
in single or dual channel mode.
2. MLX90615 skips the EEPROM read entirely.

I don't have physical hardware to test this on; this bug was spotted via
code inspection.

Best regards,
Salah

On Thu, Sep 17, 2026 at 01:27:48PM +0200, Crt Mori wrote:
> So this fix is for the MLX90615, which is registered as single channel
> operation? Did you test on 90614 as well?
> 
> Best regards,
> Crt
> 
> Crt Mori
> 
> Melexis Technologies NV
> Transportstraat 1
> 3980 Tessenderlo
> 
> Mobile: +32 492 46 22 15
> E-mail: cmo@melexis.com
> Website: www.melexis.com
> 
> ----------------------------------------------------------
> The contents of this e-mail are CONFIDENTIAL AND PROPRIETARY. Please
> read our disclaimer at http://www.melexis.com/mailpolicy
> 
> 
> On Thu, 17 Sept 2026 at 13:01, Salah Triki <salah.triki@gmail.com> wrote:
> >
> > In mlx90614_probe_num_ir_sensors(), the check on chip_info->dual_channel
> > is inverted.
> >
> > Currently, if dual_channel is true (MLX90614), the function returns 0
> > immediately without checking op_eeprom_config1. This forces all MLX90614
> > devices to be registered as single sensor (num_channels = 2), making the
> > second object temperature channel inaccessible.
> >
> > Conversely, if dual_channel is false (MLX90615), the function skips the
> > early return and performs an unnecessary SMBus read on EEPROM CONFIG1 even
> > though MLX90615 does not support dual channel operation.
> >
> > Fix this by negating the condition so that single-channel chips return
> > early with 0, while dual-channel capable chips (MLX90614) proceed to read
> > the EEPROM configuration register to detect whether 1 or 2 object channels
> > are present.
> >
> > Fixes: 3d5ead238bc8 ("iio: mlx90614: Factor our register IO and constants into model specific descriptor")
> > Assisted-by: LLM
> > Signed-off-by: Salah Triki <salah.triki@gmail.com>
> > ---
> >  drivers/iio/temperature/mlx90614.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/iio/temperature/mlx90614.c b/drivers/iio/temperature/mlx90614.c
> > index 27d6ab5f5d7a..4f79da1f905e 100644
> > --- a/drivers/iio/temperature/mlx90614.c
> > +++ b/drivers/iio/temperature/mlx90614.c
> > @@ -565,7 +565,7 @@ static int mlx90614_probe_num_ir_sensors(struct i2c_client *client)
> >         const struct mlx_chip_info *chip_info = data->chip_info;
> >         s32 ret;
> >
> > -       if (chip_info->dual_channel)
> > +       if (!chip_info->dual_channel)
> >                 return 0;
> >
> >         ret = i2c_smbus_read_word_data(client, chip_info->op_eeprom_config1);
> > --
> > 2.43.0
> >
