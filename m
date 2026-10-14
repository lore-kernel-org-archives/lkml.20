Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E264E0B7C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972249; cv=none; b=DWQrmg9QUjwUF+/hbsEP1O8oNvAFNTtcAQrkJcFZUvk45hnSV89O5m5yMPYTl4qa0bdiRR9J0sMFLZ0kRUCVTdX2Q625lUlHj3/KmhYU7C701BGzZfO1398Bm/7AOdJfTcP79WhZ6YO9SzvR4MRlPB/ilCYOsZbWm1gU/2GNqR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972249; c=relaxed/simple;
	bh=060y4h6BCREz2veKTYINyjEgllxgh/Lbne16CwjQutU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Noow9Wj2FQK60WsgJo5a2Rc4lkKx4olEs8HEk+h9rTl0yXQF0G5DHJHcZTYnSopk63U10/LwSVr2xPqerfGb61CC8zx54WssbkNyKhYhz9rLWVlpaX6HPTm3EuueE23Lc47y4sH1a80DtJ+OLiDLcGIo1z9ugF/7JDEkCFVL3H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHnxk6Eb; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHnxk6Eb"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-486e70f2457so131820f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791972246; x=1792577046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=83nMmOQIZqdWD9+WEuaPAFERa9gPcu3uwdWyfDhUP2Q=;
        b=mHnxk6EbYJlf6fLatNM4UPH1WDJ3fMtpt3XgDSsLTXMxEO+oU2SBGgkzoUVV8HngSe
         qrxpvxl+uUdBoMOkyGpDMSAfEsRZ+frn1CkYtkfgz5/XsiYTB18zhAkrLjnJ18IFWKSe
         Yifli9xhiFQGe6jrznu0OScJeTSEnb7ffDwqK8xXqO1NyfI7Xhwg7USZzr/zlnvPWK8C
         BGpUmzh3wF8jWgxxxy4wh7mG6goe/qEU16d6UjKuxXbgMY6TvayptBJzuZI/XBh8gfX4
         BzUHoah7tEqnyk89lxMefu6s1Ayf9LgDYfwlhRA7jpFF/kLcsDpF8XGKMGex0ktG9LOc
         jGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791972246; x=1792577046;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=83nMmOQIZqdWD9+WEuaPAFERa9gPcu3uwdWyfDhUP2Q=;
        b=xbnpyhBX0mC4M5yy7obhW7NJy8XLWlaLl44Ryg1U/3JdVlafT1lZ0Xh6dYGDoRUAsy
         K3BsMc179+3hqJoGQxfCBnD3qfkYPFOxouOsDY49CSVeJslSZc/7MOR4T301L8cevHLK
         SpYKuDaAFnfj/gV0Z1pwHm2GWEz/ES507PqYqnV72IJY0dkVCFz1UJVUR+lfVc7++LjQ
         WuscByKmoDXk92KJZu4XnDughfn7k9IwoGs/zv19oQKTwBq4koOzNewUfvG6fvIBRhSG
         pCSiFNcpStX/FZTastdDX9Rx1JV40g5gJPDG8SyDD50KdNCGs9XbnWe0H2NoTDytd8Hi
         KF9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzIqD8a00lcY0pICwFdPIv9ucihyucW8T5n7gVx0OrXWxJdt1X+lYIzzT2tKgw3wR4xGPnKgNnmvNUV8Xs=@vger.kernel.org
X-Gm-Message-State: AFq9FYILmZ7lTkr7jXHVQJV9ee3a/Vfya83eo4PyMesUE2oO+kvj9dnw
	+wGEVeljrxqIoNcIHjtcLwJJGhBTGb4Xj2aKH2UsUbC8s29od+DBLnjf
X-Gm-Gg: AYBFou27+kG8eBOCwO+30msmh2PsV5TJAGrxgygjDSIPvF7PxxmseCZMeCqJrkqg40Z
	NulLYtf6+dsDftongPHMp9qX1SZHNTHaDL3Ukw3sEaCsr5L/3k/WPH/gJbrx83qklCOcgNAS2TM
	OVhaR6dOVLPHnMyySK9zdj0xko/j4P23FwVSor5VVMtzMgE+RTKRYZMQd9cMgVnE/3aqQoeWUXE
	6Wousjnwzga4u2Il9jy+Yh3NHORqXhohw0ZrYWzTTypBAuIIL6YXpJXk67ukUWtYM3Twqd17R5B
	iDutP+z5ypKRL/G+kAgt2IxPT68wgWvwrNVRRD9vGjBFFzXVNlE4RoFU2H4+MdWJIEzJQohpYZf
	JwWXG4VAvEa21+B/i31NPqm1/03crxLm6HVPcCP1mDqm4X7sWdVvYa2+9Kk8Dzr2dTEJqooH7k0
	71e+twF6E8i9ef5Ihn2xrB1WfyczbTutW4atZcuYXX94y86OcRTmIh4CCcYZzUrjZXLPlUyD7tZ
	y/A
X-Received: by 2002:a05:6000:2481:b0:48a:f318:ac02 with SMTP id ffacd0b85a97d-48dba9bdbaemr32888695f8f.19.1791972245977;
        Wed, 14 Oct 2026 03:04:05 -0700 (PDT)
Received: from [192.168.1.18] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaa5dbsm11296208f8f.12.2026.10.14.03.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 03:04:05 -0700 (PDT)
Message-ID: <528bad54-d862-461a-897e-0fd6734fd8d9@gmail.com>
Date: Wed, 14 Oct 2026 12:04:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] iio: light: add AS7343 multi-spectral sensor
 driver
To: Chang Yu <marcus.yu.56@gmail.com>, Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joshua Crofts
 <joshua.crofts1@gmail.com>, Shi Hao <i.shihao.999@gmail.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261013115639.167433-1-marcus.yu.56@gmail.com>
 <20261013115639.167433-3-marcus.yu.56@gmail.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261013115639.167433-3-marcus.yu.56@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/13/26 1:56 PM, Chang Yu wrote:

found a few things before I can give a tag, correct me if I'm wrong.

> The driver exposes 12 spectral channels (11 visible light and 1
> near-infrared) via sysfs. Runtime PM is implemented to stop
> measurements when the device is suspended or torn down. Power is
> never cut (PON=1 always) to preserve register values.

PON=0 is SLEEP, not power off. per the datasheet, entering SLEEP doesn't
change register settings. idle is 40 uA vs 0.7 uA in sleep. worth
clearing PON in the teardown action, and probably runtime suspend too.

if this goes in as v6, Jonathan, could you drop the "to preserve
register values" part of the commit message when applying?

[snip]

> +/* AS7343 channel indices. MUST match data register order above. */

nothing depends on this. drop the MUST, just say it follows the DATA
register order for auto_smux = 3.

[snip]

> +static inline int as7343_atime_steps(unsigned int step, u8 *atime)

no inline in .c files. same for the other helper.

[snip]

> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW: {
> +		/* Wait until integration time passes for all 3 cycles. */
> +		msleep(160);

derive this from the ATIME/ASTEP defaults, or spell out the math.

> +
> +		/*
> +		 * Reading ASTATUS latches all data registers to this read.
> +		 * We don't care about the returned saturation/gain status for
> +		 * now.
> +		 */
> +		guard(mutex)(&data->mutex);
> +
> +		ret = regmap_read(map, AS7343_ASTATUS_REG, &unused);

ASAT_STATUS (bit 7) is thrown away, so saturated counts get returned as
valid, while the datasheet says to discard them. ideally fixed before
this hits a release, since changing what read_raw returns after that is
user-visible. Jonathan, any preference on what it should return then?

[snip]

> +	/*
> +	 * Setting a 600 * 2.78us * 30 = 50ms integration time as the default
> +	 * for now.
> +	 */

cite the datasheet's typical config, that also answers Andy's "magic 600".

-- 
cheers,
jose a. p-a
