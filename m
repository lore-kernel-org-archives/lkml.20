Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01542356757
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789531475; cv=none; b=sKEYMbHH9JkmBLXNYOQHuzxanoufjgjlc2xfVdnx+RXkpMaqT0vn7ihkdqi85lKKHg7FgBH/WDDmYNAaW961Lj6gyQsnme+57LC+ntsnNtiUgRAF2Wa0lSkDuHAfgCFiJwso6ejYT6DCzk3kWCMCcpyCbPy5EGHqv90FlL2OciE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789531475; c=relaxed/simple;
	bh=pFUGxOy07w0o07fjVXXzMtNN+/VmE3D4fzrpoP43jnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JNmLkH4ie99yHX3gyJh4RE6SWKO0uyqrOpSfYGLkxubzku86QuDbW7Z+77HtBDP9uFHsJ+iVYJsbZqyT7JrdUyZweU7DXU4M8NAw9l0moqbs2HZScGh63kekD7U/mD9LjSbSTnnXU2BMyitx9P4GWW2E1sKBVugrIvL+p05EZsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lfeMDP2Z; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfeMDP2Z"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab222dfso507088d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789531473; x=1790136273; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X7b6jjSFuw36SK7ohBBpAIm4B8ggMmh+imIFRF1b+cs=;
        b=lfeMDP2ZAzCfR0ysSNTzQrs7tQFS61YSzbeQkxI25xGpU33XyJ8JI6+HMhHAo+laZD
         M8xN1welHtzZGJsu910khF/QUsp1UsnJ12nujIRyB+MtXYI+V9csMJQxkyym9Zf9rIpg
         mOeeiPZA6BY2zwU296Nhm94F5p6sttFEn8opIhulxwMlt/OWeIpReiWdy9B6EihOEtrU
         jWFQiCP/rxTv7vloi1X4Ai2CFZjvNYIXVV4S/ZGQSu72Ydrj+KRqloJ7JAizYdze988d
         jhTZH9KVAKOIh+l9JosUoqOk4V5OGtoLPXYWDHmHmwIjan96unpqFAL8fll2t/ruNq5C
         +ZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789531473; x=1790136273;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7b6jjSFuw36SK7ohBBpAIm4B8ggMmh+imIFRF1b+cs=;
        b=efJZ2wrxESvwZkg20UMwFbbs7BDOC3uLBQkbL2xRBuF1N7oH+QJYDVSAk7bQsN7Uyv
         lMvpRpJDSoJL7E3pTwU+XTZr6lRomTW5G4PtyjglGdYz0Xm2Yd4RWHFWvHYvqxVd04nr
         9/Mg+/mbx1VhN4pajUxBV9zpnCQwKjVfZ+1rsPXQbd5vKOMH+1VDV4liZuEBQVmIf+bn
         x2G4onKNUN91REGgv8SuBvQTzdR4kPISy7YVHx1q9Yq38gctCFxQJz+Xjs4R23myN3Bo
         DZNouRl0i76G5+pbXJUfSQkgVR7RJsSLbLouu/5EMdbAYxkDg3GXLFaFpqjfgRFBN/oA
         Dfdw==
X-Forwarded-Encrypted: i=1; AKwUvBym+h8jUdpdOLKN9f/oFl4X+jWeihvykzxMSitPySm1RtiwBuROspIRRz1DMOe0HRWKNA542idsnmkVln4=@vger.kernel.org
X-Gm-Message-State: AFuF++ke5mtFrNGr/fVPQdOvW+F1qnYiPiWS8bohOnWdqTbGtiNGCX1h
	0JKWitVipagcL09/3Z72az1ynU2zH6goPzPevD7ovEu6Sg4K1M4T6+Om
X-Gm-Gg: AYBFou1t3EKqR1t69L7iXlb/9dk9bVnoqOpXF66VO0FMhvEO36AnjTyBAWmO3IpoC7R
	EZQy3VgVqOLSDSG1/2ERRh9YxAH7dY29Q2jje9ql624HUUjdXize+BdFSUJWjVkZG7z28OI0pdb
	LRAjJHf9ATkJND5h0/MxfN5aEBCzEy+A/vEr2ZKpl1c21wqJDQT4dzm7L4vSNGMG1UGuKvtsVZF
	ZPPQmHY42I2R4xXOJ4o7P1gzgAIlCwTpj6VMB0meFMuGLOOVu7/G7VCaFA/7QjdnoODc/Mo5r+5
	ZFMlp0cpZEmkNr9/zciKSrXXMdF/WIqmSpDoBiCsLjTIwu+LOm4mVugUTypVT7hOXtPq0NgJ/yn
	3N3zw1y+s1pymR87aGJBwPrO18VYA4HY0ODPQ05djRcCrwERsU54CzLbrYJYxxKIqeTViUjeGqP
	oSNdUP6HBWOvk/GhSji/wFPslqisaVqgXPqffuSvhMfuqeVhiZiHJa2JjQGopyRSjI
X-Received: by 2002:a05:690e:13cc:b0:670:f5bd:812f with SMTP id 956f58d0204a3-671632ceda8mr325747d50.82.1789531472721;
        Tue, 15 Sep 2026 21:04:32 -0700 (PDT)
Received: from gmail.com ([2600:1700:5431:250::3e])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6715f45f803sm831404d50.0.2026.09.15.21.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 21:04:31 -0700 (PDT)
Date: Tue, 15 Sep 2026 21:04:28 -0700
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
Message-ID: <aqoVTHzvDFkfVjcf@gmail.com>
References: <20260912013912.51887-1-marcus.yu.56@gmail.com>
 <20260912013912.51887-3-marcus.yu.56@gmail.com>
 <aqepkmQS_p6K1Bd6@ashevche-desk.local>
 <aqiyQOMGGIzu-91z@gmail.com>
 <aqj07iI_KFTDrjPR@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqj07iI_KFTDrjPR@ashevche-desk.local>

On Tue, Sep 15, 2026 at 10:34:06AM +0300, Andy Shevchenko wrote:
> On Mon, Sep 14, 2026 at 07:49:36PM -0700, Chang Yu wrote:
> > On Mon, Sep 14, 2026 at 11:00:18AM +0300, Andy Shevchenko wrote:
> > > On Fri, Sep 11, 2026 at 06:39:12PM -0700, Chang Yu wrote:
> 
> ...
> 
> > > > +static int as7343_suspend(struct device *dev)
> > > > +{
> > > > +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> > > > +	struct as7343_data *data = iio_priv(indio_dev);
> > > > +	struct regmap *map = data->regmap;
> > > 
> > > > +	return regmap_clear_bits(map, AS7343_ENABLE, AS7343_ENABLE_SP_EN);
> > > 
> > > Can this mess up the raw read? If so, also needs a mutex to be held.
> > 
> > People familiar with runtime PM correct me if I'm wrong, but I believe
> > PM_RUNTIME_ACQUIRE waits for any ongoing suspend callback to finish
> > before returning? If so I think there is no risk of a race here. In
> > the case of system suspend, worst case scenario SP_EN gets cleared
> > before we read ASTATUS or the data register, which for my use case
> > at least is OK since the entire system is suspending anyway.
> 
> Yes, if the raw read is guarded. What about _setup()? Is it guaranteed
> to be free from races? If so, we are okay.
> 
Currently in setup_device() I'm enabling runtime PM before flipping SP_EN
which is a bit problematic. The fix is simply enable SP_EN first before
enaling runtime PM like Jonathan has suggested. Then I think we will be OK.
