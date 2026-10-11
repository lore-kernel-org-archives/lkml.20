Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CCB23D2B1
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 03:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791688359; cv=none; b=Vm1qh9kJiNYrIh8BK3+WPrgD8UMj7799KMoAPOKczgpWE74m97OS3rpPwRNK18XgKACzSUAbQZiqU3nEL/OBASXyTmmwdY6za1kdN4QyXipENQqZZR+AxNZZHiofUJbEqdWrW+h+mMsgdVLCZ1aivZNtrpQG+BXg2IZc1DiWE0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791688359; c=relaxed/simple;
	bh=OChUndas+DWa/5O82BL8ViYuRfhyJvWS0e17KpOp0Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oH2xlZa/AKVOMW3Rq2RCKVYrdmxoXEHGSfKaXA4iWk906zcV1RIW51R1LDagb2/OUpf4u3yD/RlpqP1VwI2NQmlqSnyEzbEHEiUIEM/jupzuO3MIrXoQoaSz7HPkZs+2+z94anKsEPdaOfd1HgHrzLEBFRG/2z6u3xFOUXYzeCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Va9YGU+H; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Va9YGU+H"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33e6279a1d7so1034952eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 20:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791688357; x=1792293157; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a1lj3fVjbUIN9JIS29oUB2cIzv6MSxY80cUu2b2ZDGY=;
        b=Va9YGU+HaKMH4sEyXcJa6745yinu7nD3Btls0OfP5UVl0hBjHc+azxdjSZOfe+GPIf
         5zFeKsyg4ZlCHD9qREH0n/36O85UssAUp76fB4NVnRqi0aGS2/OZg8XQuf/FOtYN6Pl0
         VhOrecv3XsU/QVmhckxtypDnncFUzc8CXbbQoT61vEj3pXyGDTWNkfbiX8sQ4jjmmOSm
         WUWo2cjRx1hP3utd3rTBDM59sGWvLeqbt+/mysmrYFerWrXd4EsY3OP9d0q7Co2rTQdz
         ihaKSiSgfZ28rKhjJMygQJTJj7PfMHUti+hMNjARK/yTI2ay7q4mZnI7XThsjIn6P873
         7/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791688357; x=1792293157;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1lj3fVjbUIN9JIS29oUB2cIzv6MSxY80cUu2b2ZDGY=;
        b=Ctqi5UO1qe4RiAdUzS2A6+j31D7vNKMAsCRqYqPvchWg96ediMmHy15yxRJmbJoDpO
         LdhZIhJ1/wg3+92bLxUbKjHmGkqGC5byzRrVyQdn/6csmo2d96+d+yHPOsvxd65rNHDJ
         iJQ5ZJIhQelFremS5+elvdzqHO9xqbS0CLJphDgW7cM8jSnzDkpT4CjKoRNLCmIMIttC
         STkLjHf0CW1b4PnM6mwU4BjIDLeWhhhBLU3aygR9LvplmyydMCwGffgWUmkwdZInI3V2
         1MUsycoWhqLRysQ+aThq73AjKVwaiPQDMZ9R5jGRg5oL2Qa3MG/s32Z/WtralNvzORXu
         o8cg==
X-Forwarded-Encrypted: i=1; AKwUvBws9fgvVjPvRGfCsUDQnVEmXosB039CVDGDfsDqpPxCN+VxCwhqi7VMG9H9UXLbCyM0G+hY63+KF8Xr1GQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+KU/gGwOsB1StePRYD5yFZWzJaPq5mLcSnclh0To5ezWQf9zO
	ODFFMVJnGf23TLmNxrZi0x43ylcZnNOmmZdWfrlSEbdxKroj7/Q78nfco0tqOBZ5oww=
X-Gm-Gg: AYBFou2hyDEBCfmp0b/9QZF1HYmOSIWo3Ec7aTjoBHlog78ErVvG5/8ejeQhZR/D6L5
	kuCvmT5xMTh9dD2yfStBBbOPuxUlTi6nSYehAHNqDeTdq7pdSov0RsYFWyl5xMzM1MRCDF5Gb15
	5A56D/xQevrMnf7SJtu7foDIW1yL1X7JHsdkTQkUftvqBEwYPegzEFhg6mfuHYu/PwOL0jk7pTm
	lB0x2uojO6vJiZdDn/QKVmSzJTkGJo2o2hZcctGU8aE62BJCHDMy0+J9hB6XAcBRUdd0PgtlN/i
	t3dV5TMNz1Xuyn+0UN4UH/txPXmarH0LOzUc59EKKAuFDLx8QE/qzxKn07bqxgBFM+7BwF2VWJn
	RIzjR8OIgvTYAYZ4uN4DL/DadFv3gygMDLUrN2/oJuqaOO8fNdlWA2QI4M8o8mJxrbGpVN1NBsP
	Nz551Z8yjTffNZhS7etea5fY+dGEVOK5yzzbObwqfZcquRG6D+U880nWTumkobkv0viHQPXLwc
X-Received: by 2002:a05:7301:1529:b0:352:fe8b:8d38 with SMTP id 5a478bee46e88-3537e059bf7mr8378888eec.14.1791688357177;
        Sat, 10 Oct 2026 20:12:37 -0700 (PDT)
Received: from localhost ([104.156.230.40])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm22329042eec.3.2026.10.10.20.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 20:12:36 -0700 (PDT)
Date: Sun, 11 Oct 2026 11:12:27 +0800
From: Chang Yu <marcus.yu.56@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Chang Yu <marcus.yu.56@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shi Hao <i.shihao.999@gmail.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] iio: light: add AS7343 multi-spectral sensor
 driver
Message-ID: <asr-mzLLPXxGwV9F@zephyrus-g14.localdomain>
References: <20260919235145.48273-1-marcus.yu.56@gmail.com>
 <20260919235145.48273-3-marcus.yu.56@gmail.com>
 <arVqTWVw-eIZEcrR@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arVqTWVw-eIZEcrR@ashevche-desk.local>

On Thu, Sep 24, 2026 at 09:22:05PM +0300, Andy Shevchenko wrote:
> On Sat, Sep 19, 2026 at 04:51:45PM -0700, Chang Yu wrote:
> > +static int as7343_read_label(struct iio_dev *indio_dev,
> > +			     struct iio_chan_spec const *chan, char *label)
> > +{
> > +	int channel = chan->channel;
> 
> Why signed?
> Also split assignment, it will make code more maintainable.
> 
I believe this was mentioned in a previous thread. Basically because
iio_chan_spec.channel is an int, so I had to make the local var
signed to keep it consistent. Why iio_chan_spec.channel is an int is
a mystery to me unfortunately.
