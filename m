Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793154421;
	b=tWwQGUZLZXqt5irrX8QZxEa5gL3q+bjOViN+ztTv36OtODLAAqlpwFC+8rFZw/9JSNlD
	 ZFzAT4jXFGfsX/WVVWZI0z47GhCXAaOcI2CaKhPQJkzmU+yoC11IwpB8zxC8ltgUtqnwg
	 vyVVH1MSXHIZ3sl5mdu1OZZ8XJuozKbgeOSGo/3TKWrOsjzMUaZwYiyYRiLV6ibZBNKeQ
	 VedXIfCjtbUgmlRvqI3X1iLR6PwIXOCPL1fXPYZUG7QgErQVV41WuEJs3hpDRWzAYmTdE
	 ssFa7Gs/V3zcxlYr5JNxaUa7PVjKf3i5E4SyOvso3DJnUxA6tgvObc8vbXm1cR8Utcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793154421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dztU/TExvRdwdoHHA1pmOA03tC4CKeaHgrcXA1r9kN4=;
	b=Zd4pr7VDbhkIo8rYil2u0Kp56ktK4xA2Q3nHCC9SXdDaTfazuXiHz91VZIZuYVI/2STD
	 frZMpcd4WbLl0wgSGDoOXx1PZW1x39Mkf4L7n/PWFVL7UeabwIT0ILaQJTR1Yo7h0bxtn
	 FlQ2hClGS3Whp4TlfZxP3eqQ2l/3niCwtxUCAZ9DW7LSnW4loV8TFduHR2WX5c/6o5pkt
	 zQOyTvSVuw3KqZVE2COQETb9w5PCaf466sCqc3XDBHLl1dlybbaeN/hw9r/xmj1J8oyBa
	 csSvMUkgXI068JfzRwawl2mTOiMRTuyOk4ocArEyAx9IsaSl5sSLd9MtvvsafTdxbDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q6u4ASHA;
	arc=none smtp.remote-ip=209.85.222.49
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3B3606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF3B3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q6u4ASHA
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9912c47367cso316080241.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793154420; x=1793759220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dztU/TExvRdwdoHHA1pmOA03tC4CKeaHgrcXA1r9kN4=;
        b=q6u4ASHAlu96sY2ofBItUFB1lKaUWqtlWcAjq1ouApqcY9t1yw/Wh4kibHPEDawxFh
         VksZEMuoeQxaWyIEf9SyZnbklSAYVChDgCLG/EQLSM8ltiILoRoF26o4QlDAPXW1Vl5Y
         ahbBNd2ed5e4dZ4wFAaoDVIOUJCVkV5M6rl2KuVq1HavhyAKFN7RdW0BaimAwmGBstIt
         BgfJFswec0DhT2mz43ls7KM9phFFtq1ThmmvFaas6zEnLYqrz5TYaZhpWAOY4hdTsSke
         ZTHX+2th4s8+FFHJOeX7b42JRpdmDBCW7gSVzBnSC+qqc4yLX/f27lS+9cYM0lomxpio
         b5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793154420; x=1793759220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dztU/TExvRdwdoHHA1pmOA03tC4CKeaHgrcXA1r9kN4=;
        b=GUzJV2kg9mevsz6dk1bHyOMYDKPGgK2CJxgVIfinfEv5og/3ggrohZZ4D6LGgB1rEc
         ptafvG85KDK7mm5FXzvTyoYE6GSxmabKpwiqdSZ4bgv8A9E4G7hqbAPeLrvEPD0PEQFO
         UECe6ltv1bWvbYIOsiwwxDfbLZvZw8x/0DKsm4a7AGEku6LvuZM7WeTIPjala+zVnW7S
         X4zAnBllAGSImeFebbHTjQkXeFjHdCD9w5Y4IZIBrTojED0szh8kWOqu+m9Kbh5Ksfy8
         AuWca5Yy0T+XjyBii+/8Xo/DnWXnGiRBqOuJu0yg8kdb2zQEUEy400lzU+fCzjgEIFXU
         K9SQ==
X-Forwarded-Encrypted: i=1; AKwUvByw07W4/wKFMGdBa4SvlhCKwFy9ck2AWMCtKRB9SC1COqKW7QSNICR+KEjSnZJ2mP9/WwJ4lu4ztl287Gs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAtjRK0xxmwswjK1f5jS3eTFeoMZXXVjJwXP/7x6baqLDwvgbT
	9PModz2+XTxKiogVD0a4nWR6NQZlnNCPKPIT4YHPAP8N7T1+mhDYbPna
X-Gm-Gg: AYBFou2XLJ5wr0T7MZbXCyTPj+CV3NF8m/7KO81ZF/VmflRQW7emBHmkWej2Y/zWB2M
	20ftr4mEG6Ds9QpaWnHyVdyFQmzTl6bzTbasOC3FqmsaTyEJK8/0+RmB7vc/xIhegAz1xkcneSr
	HZk91I1zi5qTUz8AkvUqRG6yQA0Gm87XrAww54dC3ERqcTwcTv3ibnzwj+rtLDx2rqD7olubwl4
	8EfyxtHhKuzp3TuFVWd8T09pBmDERpMixr2AeGThou41zwW82ik5SmfLEzfHtWff9/oqMGaYLzp
	LH6gT5UzwnZxl+W4KnEPQArqsVdyBEeGa3V2S80B6XSDHTLJOQsAonPJRkw5+WOpzRpWtLl3aOU
	+auflbYygNUjkmj4rIvBgM7NPT4G2W6sW1WAHssjyQeyaJfiaM4yqNZm11vjYqlrlbECRzRbdAL
	oxLmjsm8Vjr4jeUilTvhKbL6+HEmo3YFT27bZvb9gLocjx9jajw1NlclM/4j6tkG9v3OX8UtScg
	L+2XXuhsK9EfjvjgRF1wtS0zJFr/ydfP3EY5rop3xjbV0v4UuqEPdvp49n75pge8KNj2Yb/37RT
	W088TnXpGbP46tYlYRvBLZRa0oYnxmH7gn+nzN/yzeZMBCsSUCLU
X-Received: by 2002:a05:6102:41a3:b0:7bb:64cc:1362 with SMTP id ada2fe7eead31-7d041913706mr48618137.6.1793154419656;
        Tue, 27 Oct 2026 19:26:59 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:4df:52dc:4559:394e])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea3bc3824sm4456693137.4.2026.10.27.19.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:26:59 -0700 (PDT)
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
Subject: Re: [PATCH v2 6/6] iio: adc: ti-ads1298: add ADS1299 support
Date: Tue, 27 Oct 2026 23:26:52 -0300
Message-ID: <20261028022652.31121-1-stephanbrrs8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025233429.23b02702@jic23-hlaptop>
References: <20261024231335.280955-1-stephanbrrs8@gmail.com> <20261024231335.280955-7-stephanbrrs8@gmail.com> <20261025233429.23b02702@jic23-hlaptop>
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

On Sun, 25 Oct 2026 23:34:29 +0000, Jonathan Cameron wrote:
> A few things in here feel like they should be in precursor
> patches because the implication is they apply just as much
> to improving support for the ads1298 as they do for the
> new device.

Agreed. DVDD and PWDN become ADS129x patches, binding and driver, before
the ADS1299 ones.

> > +	if (FIELD_GET(ADS1299_MASK_ID_DEVICE, id) != ADS1299_ID_DEVICE ||
> > +	    nu_ch > 2)
> > +		return dev_err_probe(dev, -ENODEV, "Unknown ID: 0x%x\n", id);
> How do backwards compatible parts with fallback compatible of ads1299 work?
>
> Generally we don't reject on simply an who am I value mismatch.
> Note the existing driver may need relaxing on that point - we used
> to do this before DT maitainers pointed out what it broke!

Today that works only within a family: the channel count comes from the
ID, so ti,ads1299 serves the -4 and -6, and ti,ads1298 the ADS1294/6
and the R parts. A part with a new ID is refused, as the existing driver
does too.

For v3 I'd do, in a precursor patch for the existing driver: the
compatible's chip info is what the driver trusts. If the ID is a known
part of that family, it still gives the channel count and the name; if
not (another family, or a reserved channel code), the driver warns and
goes on with the compatible's chip info. The channel count from the ID
has to stay, since ti,ads1298 has been the only compatible and existing
boards with an ADS1294 or ADS1296 depend on it.

Does that match what you have in mind?

> > +	/* The ADS1299 comes out of reset with its inputs shorted */
>
> What is the case for the ADS1298 - is this just harmless or does
> that have similar behavior?

Harmless. On the ADS129x CHnSET resets to 00h, normal electrode input,
so the write changes nothing. On the ADS1299 it resets to 61h, input
shorted, and without the write each channel reads its own shorted input.
I'll make it ADS1299 only, through chip info, unless you prefer it
unconditional.

> > +	for (i = 0; i < indio_dev->num_channels; i++) {
>
> 	for (unsigned int i = 0;...

Will do.

Thanks,
Stephan
