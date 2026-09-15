Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319783F99F3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789440582; cv=none; b=uAsW+wXYlaUiBj1SOeHTQjr4UjwUKqWWR6J2jyko6X5qpRE6MWKKQu5A56usrAhkwCctDfRH+DpyRt7Z+hYILiCaFA/9HA45kVUgq/5GjwUDaG5r26FE35E0tRvyfEs0beZZml9KsgL9yHsNmpLtWGCE3RtiuZZsw4prc1zIM/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789440582; c=relaxed/simple;
	bh=dZtJypvCQ3nH/VIpTSnun9IN+DGvbnyN1VglMN3CCUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dsJgN/TJImtkmEdSTMlOMnK5p2Nvgcx80SnSWJvaS28x0aqIxr/IG8PSlAMLxIiBkcJVJ8fyE8lxBaOFNfb/Pk6BUuM3LSK8rzzVR6yHMkeHVhTwCD/z6XS5ENd2Y0uo7ijjBYkl7SEAiCQjhOgLfg3XlmREgPX3VsoiHOZ5XWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXuWFaPr; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXuWFaPr"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e56a1fe3fso2526713d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789440580; x=1790045380; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=98dR90gK+JQcg6XkR8TXqOD8Hf/WJSfb2StQiLmkr9w=;
        b=HXuWFaPrDFOT61uL3BUEyVPWnZpfYxHhTSSLsjSpuM/avihwogZNbVmFdjqa2pv+W8
         Bbet+fhjllD3p2jDlDCYZXv5CWo67kqwk1QSVa1MCXaS437lYRAlAifpysFXTtlWY3U/
         WWzjSlpkzuQ1NXccv3QwZKt0PvufcTc8MqtKYqlumqHjjEC7KbDuyTuUDRKqCe+g/i/u
         +lguDCciTAYHCikaO2CaczbgsHH/6Idhb9yaVf2ZwhPKyUG80FSf4Q/rfbxFjN+/caLb
         hx97B59VpTpgjNvD2+BI0e/Wbe3J45bgprXX/Ww18yD7OaOL/LvdCV7hI/vReCBg+nY0
         1/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789440580; x=1790045380;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98dR90gK+JQcg6XkR8TXqOD8Hf/WJSfb2StQiLmkr9w=;
        b=mb0j1S9WPj4dmXqgZJYBNcvXKYP0Ek0YQTEL+qm26mneRxmqVUtKW+eWSyJXomzsnv
         xzi5qz0g/GTNKBrTD8OsAjMHE/cqhdgmeCgtl9tCTOpvLG7Y42yG0C8KiOH6fQFfigKn
         yl9g/pgSqffPpDQZQ6gbwj/JJOGsIG50SIMYvusOepCkNBF80IFZLycpCgzoVhFuIgiK
         DDdTXaGHsyAMCfizbKx98Y+HWuWl+TngHtbyaMs0vm6Z4nVjyqrs39pThvaMtFTEFaAs
         2sHPPmAtIeVAwBq/pi/jApv48V/lKRk2Acj9VIO/x0SgNri6C/rV/KxNH8vRsccABQM9
         NT4A==
X-Forwarded-Encrypted: i=1; AKwUvBwE2c4hn77d8731Ye+tRzgFnhkIZz1diFKJEwBr3DUoP2RpeBFG5XpkxwmepZNGTyYQH5inzxolWywVTPE=@vger.kernel.org
X-Gm-Message-State: AFuF++nXeNWr310Cc9eCFToL5aWzy8mmlctWnB9crauWubi73T1dCGyx
	UzIceFGEbQNaZ0t202wo26mcVxhDE44JnjCHJ2RvvMDGqvgpop3sijN2
X-Gm-Gg: AYBFou3Rt4zRBj/o+P5Qjj7rUcHBgi/xbaos1qz1YSCwZvaYv0CNbPxndYCZ8K6h5L8
	25bjeOTU5SOFX+Xe5JPuo/Uz5kkwQsU9esfA69tjXW3jFZRm0PuDI7AxtKaqKTu0H9emrW0nDVm
	wD3osR0VXGsu2FtGgL4oq821zefg3wxdlgC5y0f7rA6dj/pIjSnBpCgoDJO/klAGGnVlg2FZzfK
	q7HECWlPfzua39dglkKbyMX52Q5XJE/rmZOcDSXkoDqPYeoBNGGt8irOU1xOVhcDRgHmu9h2hLp
	Hyp5zXPwseMF/KeNIjVnn7Ry2pIly486B1B8VtNPvmDvosXXPv9j3XrVMdl11gA85gO8rIho4ov
	/wjF+3x1oROncsoXZbJS9WpSEWx2NWyYARJTO5wM6HqxKWixq7j0HBLhHZEQw2zH7QbiBbZ0H5k
	YE6PLd96V4/9SdxNr6zQUt6nZTeASIkodIeXW4UF87FPFKgmmug7lhYQ==
X-Received: by 2002:a05:690e:4882:10b0:66f:c1bc:4086 with SMTP id 956f58d0204a3-6714e07b20bmr1035977d50.73.1789440580062;
        Mon, 14 Sep 2026 19:49:40 -0700 (PDT)
Received: from gmail.com ([2600:1700:5431:250::3e])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67125db3a05sm5345430d50.5.2026.09.14.19.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 19:49:39 -0700 (PDT)
Date: Mon, 14 Sep 2026 19:49:36 -0700
From: Chang Yu <marcus.yu.56@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Chang Yu <marcus.yu.56@gmail.com>, Andy Shevchenko <andy@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shi Hao <i.shihao.999@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] iio: light: add AS7343 multi-spectral sensor
 driver
Message-ID: <aqiyQOMGGIzu-91z@gmail.com>
References: <20260912013912.51887-1-marcus.yu.56@gmail.com>
 <20260912013912.51887-3-marcus.yu.56@gmail.com>
 <aqepkmQS_p6K1Bd6@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqepkmQS_p6K1Bd6@ashevche-desk.local>

On Mon, Sep 14, 2026 at 11:00:18AM +0300, Andy Shevchenko wrote:
> On Fri, Sep 11, 2026 at 06:39:12PM -0700, Chang Yu wrote:
> 
> ...
> 
> > +static int as7343_setup_device(struct device *dev, struct as7343_data *data)
> > +{
> > +	struct regmap *map = data->regmap;
> > +	unsigned int val;
> > +	__le16 step;
> > +	int ret;
> > +
> > +	/* Power on */
> > +	ret = regmap_set_bits(map, AS7343_ENABLE, AS7343_ENABLE_PON);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Need to set REG_BANK to 1 before we can access ID */
> > +	ret = regmap_set_bits(map, AS7343_CFG0, AS7343_CFG0_REG_BANK);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = regmap_read(map, AS7343_ID, &val);
> > +	if (ret)
> > +		return ret;
> 
> > +	if (val != 0x81)
> > +		dev_info(dev, "Unknown device ID: %x\n", val);
> 
> Wouldn't be better to define 0x81 with meaningful name?
> 

If I remeber correctly Jonathan prefers just putting 0x81 inline. I'm
OK with either style so I'll defer to the judgement to Jonathan here.

> > +	ret = regmap_clear_bits(map, AS7343_CFG0, AS7343_CFG0_REG_BANK);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Configure the SMUX to readout all channels */
> > +	ret = regmap_update_bits(map, AS7343_CFG20, AS7343_CFG20_AUTO_SMUX,
> > +				 FIELD_PREP(AS7343_CFG20_AUTO_SMUX,
> > +					    AS7343_CFG20_AUTO_SMUX_READOUT_ALL));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Set 50.1ms integration time and x256 gain for now */
> > +	step = cpu_to_le16(AS7343_ASTEP_VAL);
> > +	ret = regmap_bulk_write(map, AS7343_ASTEP, &step, sizeof(step));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = regmap_write(map, AS7343_ATIME, AS7343_ATIME_VAL);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return regmap_update_bits(map, AS7343_CFG1, AS7343_CFG1_AGAIN,
> > +				  FIELD_PREP(AS7343_CFG1_AGAIN,
> > +					     AS7343_CFG1_AGAIN_X256));
> > +}
> 
> ...
> 
> > +static int as7343_suspend(struct device *dev)
> > +{
> > +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> > +	struct as7343_data *data = iio_priv(indio_dev);
> > +	struct regmap *map = data->regmap;
> 
> > +	return regmap_clear_bits(map, AS7343_ENABLE, AS7343_ENABLE_SP_EN);
> 
> Can this mess up the raw read? If so, also needs a mutex to be held.
> 

People familiar with runtime PM correct me if I'm wrong, but I believe
PM_RUNTIME_ACQUIRE waits for any ongoing suspend callback to finish
before returning? If so I think there is no risk of a race here. In
the case of system suspend, worst case scenario SP_EN gets cleared
before we read ASTATUS or the data register, which for my use case
at least is OK since the entire system is suspending anyway.

