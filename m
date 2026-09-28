Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3744973AA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591232; cv=none; b=YI6n3wB5WydvA6nGVwG8Q7ZtzRM5ujXWF3gMVcFNlp39CbAhG/CXzzNHArhDAw+RWumJ86sbSxx9ewmWbG9bMu6A8DAsmryIah1ukjDY5ld2+NoOUpPf0yaISYfTSGkcuRm9JrClfBpqwN2y6uJap5WIzfUwJ8jrHH3Pf+hTh6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591232; c=relaxed/simple;
	bh=lfw5A0uXAuhjAZYX/T8OzUkOdY60W+ytkN54QbMhIRU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qfweN9GCg0K54Db+GUwDt4j0ACkSXAlFzeFZ6jFTteYPinkh2YkTwMvZzN0HvPRbCVowVZpcXBEFiqWdn2LHTKSGuuC1YnrEjf+sstCR4JmGL85UocPCpTMDQGMA7AU8NDSyowBKdq4WgwpaxPqqnP28Yeg3airZugZsxAQPGgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URUNnOml; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URUNnOml"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48882c1f2baso433724f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790591228; x=1791196028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pOMrGoe0MJA+5JRUzHhpj1OGWu27WePfFyfzZS0Xvg0=;
        b=URUNnOmlGSsz1Q0YUjhWskzhtgq6nKyuGOZkSsW5DDvmi2iAYJXvRguk5163n/jiuN
         89TZX9j3KQW9JEiaYyeXBUh0wK4NyR/lxPTRTiILgsEi23oWOjGlU5I8iYgeyLT4Nz/o
         P44sIbG64giveTAPBc+AHicIJKtmzTUlwFk4z1gaSKR3ra2MOBjUfM+hMgnws0FSbsb8
         NxMspionauswC1Rj4f1pi03imYg78eC53acTEVAI2ShguTx3jLWf8F2pNEetGaErAaNH
         rPVmn4Ku3+YoIeoy4CVOn5ix16TwYcoQkI5z2NHC0kzdURHO/UrUxvnPc7FWg391W4GC
         LpAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591228; x=1791196028;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pOMrGoe0MJA+5JRUzHhpj1OGWu27WePfFyfzZS0Xvg0=;
        b=VqVZZ26bOPlnJProUgY/8/Fl9xUBhhtBMUQC6s0ZzWuv/zmhtvqu70lL/qD8lHaQod
         2nfXntQ9+vFPIMMO919w7nImsP1xZs8JYwmzIgOeQgpfcIvzbAAcbU366Odr30UoLvx/
         VZ7uCaDBofRGUY5Ox5Xz8PLKVg0dCD5Xb9dKWaNGY1kNmc//kEWZ9O+rSYPzThWe4auG
         Zun6lm4hTEvJkxUTMVZiKV4gyI675romjJVz04JtKZR2o34qFFCuzdchYc3wP+dhHWXK
         LX3jeR3Wc1XfR6Y72F37pGlWmLD56WGB8CtoPZyjQq7u0WzjXPqcE61TlxsyDYYz79V5
         eGSw==
X-Forwarded-Encrypted: i=1; AKwUvBxpyEXz/UULmcgtpMIsJ4qDiglEnWmjHsOFIqe6gReC174XeTeW683aAFg1zyh4A05t7AojthoEWkjDvbs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYNdFMXiKN2Vf3YWX8oFt1AwNCF9jRYr3D247OlMWFKko9hT9P
	VBmCZtXYoYGAzb1wVIFVgFJ+aSv1urUmzbF3MnXN5jxN8vWEoSmFbNM2
X-Gm-Gg: AYBFou2dMubTZ2GbH8PQVUImfOB2Bf4lgojq25iOndNfU/GFlEyYH1kbw8zxpcuQyUO
	lFwgo07zNnrYFhealsdPPJs4SGr104IDAkiiTO495riSfKMG6Vf/ul9phkJwUlFR+Cj/HZWW041
	q5LyGU5SOBlasimKTB08/AhaH7EIDLwpQ/eD0OdqUHTzMUv427ZPWIrEALdbxlj1UCXt1HDtgaN
	reIV/iU1mzIcgeCf1BDJ1kPJcNreMS5puBupEbeB2HVj1BS1B9Lpfkj/J4HbLh6eTQT8KXGw0Or
	JEHHtBNbA8udlWHWitWns5Tra90fhnUaS+wqVmEf5sA9Vh2wSW/HKvZLE29MD1d9ImEbHS9/Fjd
	ATJWGfi5ivmmWY5F/zBMHDqYBmuApUH60tRCAurP3xFUKXLmBMgolBAXVj2yBSVsK8OM3DUbd/X
	/IZjLLAEuNxiK5vduvkKR9UgOkbwOFS1JCSP1H1vvqKydsKK1W20nGQlqOWiAY3T/CDCqfsrT0k
	9bi8a4DKq7rppwE/ylTyaQAgUZGovv5xW6SiLohzhI/cFyfHKcLqQNQj7tEeSfHZhdshGZ5y946
	t9BoELF3+pfD6ChNP7eVrOJR4W3+t7Hfd9H4rbTAXr2J2wJklPpu8EbWMu177WCdbd8gRHc1nnr
	0W1yz6e29l2t8vkr4ZNdmcZBvdEJN7MRu89rmr7LElQ==
X-Received: by 2002:a05:6000:461e:b0:488:8a5d:ffcf with SMTP id ffacd0b85a97d-4888a5e01b1mr8368802f8f.19.1790591227919;
        Mon, 28 Sep 2026 03:27:07 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30bcc4sm27549105f8f.1.2026.09.28.03.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:27:07 -0700 (PDT)
Date: Mon, 28 Sep 2026 12:27:04 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Esben Haabendal <esben@geanix.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Martin Kepplinger <martink@posteo.de>, Sean Nyekjaer
 <sean@geanix.com>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Martin Kepplinger <martin.kepplinger@theobroma-systems.com>, Christoph
 Muellner <christoph.muellner@theobroma-systems.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 10/10] iio: accel: mma8452: Support interrupt
 sharing
Message-ID: <20260928122704.03df4e7e@systembl0wer>
In-Reply-To: <aroytGH8u-gGFYvq@ashevche-desk.local>
References: <20260928-mma8452-open-drain-v10-0-b906fb408386@geanix.com>
	<20260928-mma8452-open-drain-v10-10-b906fb408386@geanix.com>
	<aroytGH8u-gGFYvq@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 28 Sep 2026 12:26:12 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Mon, Sep 28, 2026 at 10:26:26AM +0200, Esben Haabendal wrote:
> > Adding support for sharing interrupt line with other device requires the
> > interrupt handler to handle runtime PM suspension properly, ignoring the
> > irq if the device is suspended (maybe even off). And while at it, we use
> > the PM reference to ensure we do not get suspended while processing an irq.
> > 
> > In order to prevent the chip from raising irq while suspended (that is when
> > using fixed regulator, where suspend just means setting the device in
> > STANDBY mode), we disable all interrupt sources by clearing CTRL_REG4, and
> > then restores the value again when resuming.
> > 
> > The scoped_guard in mma8452_runtime_suspend() is changed to a plain
> > mutex_lock() instead, both to prevent mixing guards and goto, but also to
> > ensure that we stay in STANDBY mode while writing to CTRL_REG4 and all the
> > way up to disabling the device as much as possible.
> > 
> > With that in place, it is safe to add the IRQF_SHARED flag.
> > 
> > Keep in mind that the device by default is using push-pull for the irq pin,
> > which might require additional hardware design to allow interrupt sharing.  
> 
> ...
> 
> > +	pm_status = pm_runtime_get_if_active(dev);
> > +	if (pm_status == 0)
> > +		/* device is powered down */
> > +		return IRQ_NONE;  
> 
> > +	if (IS_ENABLED(CONFIG_PM) && pm_status < 0)
> > +		/* runtime PM was disabled, possibly suspending */
> > +		return IRQ_HANDLED;  
> 
> This is very interesting part. I bet this will be the first driver using this.
> A big question "why?"
> 
> > +	/*
> > +	 * pm_status is now 1 or -EINVAL (with CONFIG_PM not enabled). If
> > +	 * pm_status==1, runtime PM is enabled and device is RPM_ACTIVE. If
> > +	 * pm_status==-EINVAL, runtime PM is build-time disabled (i.e. CONFIG_PM
> > +	 * not enabled), and we can/must assume device is active.
> > +	 */
> > +
> >  	src = i2c_smbus_read_byte_data(data->client, MMA8452_INT_SRC);
> >  	if (src < 0)
> > -		return IRQ_NONE;
> > +		goto out_runtime_put;
> >  
> >  	if (!(src & (data->chip_info->enabled_events | MMA8452_INT_DRDY)))
> > -		return IRQ_NONE;
> > +		goto out_runtime_put;
> >  
> >  	if (src & MMA8452_INT_DRDY) {
> >  		iio_trigger_poll_nested(indio_dev->trig);
> > @@ -1120,6 +1139,10 @@ static irqreturn_t mma8452_interrupt(int irq, void *p)
> >  		ret = IRQ_HANDLED;
> >  	}
> >  
> > +out_runtime_put:
> > +	if (pm_status > 0)
> > +		pm_runtime_put_autosuspend(dev);
> > +
> >  	return ret;
> >  }  
> 
> ...
> 
> > +	pm_runtime_enable(dev);
> > +	pm_runtime_set_autosuspend_delay(dev, MMA8452_AUTO_SUSPEND_DELAY_MS);
> > +	pm_runtime_use_autosuspend(dev);  
> 
> I don't see the respective _dont_use_autosuspend() call anywhere.

FWIW, starting Linux 7.4 you won't need to add _dont_use_autosuspend()
calls, driver core will just handle it on unbind [1].

If anyone would like to join me in purging the kernel of redundant
dont_use_autosuspend() calls once the patch hits mainline, feel free
to do so :)

[1] https://lore.kernel.org/all/20260919-move-dont-use-autosuspend-v1-1-f6e2d1315c23@gmail.com/

-- 
Kind regards,
Joshua Crofts
