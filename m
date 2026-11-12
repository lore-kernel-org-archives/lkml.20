Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497400;
	b=rvf4rfdPso6LdL5zYc6nA+4YCZJ+o9u18pQJv9o5r4DtFn27FoMfEgdDHCAoclOyANgJ
	 RDpYOf4DHssbLcFCB+qI8pubcH3YjF93XKTCMSLcpVFninImyufSwJDdp2/wtIaE0YZVd
	 JAStzske/YEC/k4i9iEYicGj1mW2/tpKJ+biqVRlQPmKLxvEzwG1hNLIrb35k9cZK7YSG
	 Xja1rWmAfooRLrHIyJ8J/z35YdGDE0Stt0c2mxAi0y38lTdahSQ7cPkfRh4ICFYTAJYxc
	 JbJrT5JkebwEL27NtcaOv2ya/n2j9ZipAkUMlp67I+GH8+J3+KfKcaDqW3bTGCa9X3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sXKCxy+bE4cVo53T4AreBZzLm1An/Wq3dYnZ7+mgP64=;
	b=Ym2TQNo78nf6aMr8mFqBtPQh6opvsHZ7+9KKJLUkqSi4zo+8Zbd8xOda1rg5Bf67ubYR
	 R+rXK6k5PWKJYjGDf068IbO6YN9X3v5apH1upqDTU6BzKfdh6DTlKKEb+fcAaHoaCwLS9
	 OUurATPX2UiAz7Wydq1z/GBvycxhTW99ciTs/FXYZE0yMwp4WHvG7KTYXH7zytGaO6qL0
	 d2xi220TBmaebDQP4T8Uwf/0pNHyapO0o25p2TefPWRwg2GOPBuGBPxqFCPpVh5NTyaPs
	 ZmdZv9z13IryTehsbrN8hd21qmTXUFZAcVn5upZEKP7ot0WMwM31Z8JUwWfCk3Rc6Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XQo2I8AU;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F27606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61F27606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XQo2I8AU
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso31203055e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794497398; x=1795102198; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sXKCxy+bE4cVo53T4AreBZzLm1An/Wq3dYnZ7+mgP64=;
        b=XQo2I8AU2JZFjXotOEh/MtTS520xxs8DfEfBd9wETl+E2ZmtkRe79gDj74QYO89b5x
         hf4QSQ+sIe8piZ0lCKDt+R+t/q7G+nHZ8+pU+AGurpVT7TBiakfL9gt6X3tuuQNmqU3G
         Tm3HEmQDjKnijAlrjvI/wgQPntEOZZqlwvATW2+LZho74rNSNN9ww282P2cQqNFA0nVW
         T60Y1ex3JVvHZqgs/wS29aF3MPa3JVY8X/KGe7fxSxIwym4+qpo0pZXm93nZEg6iexhZ
         SLXbhCjrTQRWzMkrfmx6A82OrJvmCB5OarjoigTmLttYcsPVLjDWqYquHUz2EN2kUjoi
         HHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497398; x=1795102198;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXKCxy+bE4cVo53T4AreBZzLm1An/Wq3dYnZ7+mgP64=;
        b=FWlBUSDRX8Zmwh1DP9Ru8+J4O+ZA12l+VnE4RuZ7zRJXE+gL242DP5xcbqB13H80tE
         BxFxBnom4mWJtBsopZ3kesH4lj9nXN0FaeJFdp9RslEZPweM7EItBi2MizGXkgfgdC4P
         kHQ/s/3C/uAQt2xLYP8BC7rE6oFEie0zTZxfbwSdz2+Ftx8nPeFTaKbrQV1KYEyuyR0T
         vvL3rD87bZlA6W5cWenbV+LLAARY7lESNlWHQDTDNxErNp802a0RCaXlyBJ2UOySFx+p
         2BV99+dPHmyUWSVzKoaucTv5vEziSwEeDVNcD0vTChnEcXvmYnpB4TH7JT1uonLqlhEw
         E9OQ==
X-Forwarded-Encrypted: i=1; AL+hErElTNYK93SMhM1gTjAAOscP+SwVvzkDzApSsw+KjKmzYv/kUNiHntCBW4qhcowcT2alRwyxrGwVM1hZDag=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ybegeg8SnNI3RsCQlAKgjqp6asdvBRYG62sX1Y7qJR5QUkVq5
	ilC3ka86XnUwqQeHmqN5JN6u/F2BPZCGKwTVttuCem2LC093IbjNisyND5qrSXun3uA=
X-Gm-Gg: AYBFou1EKd3dD/1aWkluTGgue49hAjR6XevIsp1mvr7A6Ald4mkgcZk5z7l02Z/8Sja
	zxb5yDHVhh8+KoAaXWfUYyA67xOCW57o5AAnDIvxFbkohns3o4lDY+DW1pJWTMXpCdNJT9N4vOt
	qfJ57/tZggWezD45rDJmLL1aNVoBkb7FWmj5zm1s28lku1V4d8eYS31RiaFodGjvlQSvgmidClx
	dUTp3Vd+bPV1qRe75vKDnS/HN6nIcVYVpXHxn4VUPf9/6LgJsnbDSuah1j5Iq14Fr318UKw+HBY
	n3ujIuefhzPu6s/+Gp8xZFC70+bdO/2DrY8Hk6LduGrhBGdCtbHj0qBOvPkr5sF6lA39KRw7WNj
	tDhq3R/fJ+BPSPFDfcAJHw7pgxq5l0TP3OfIvT/3gcmYyjcyHjrcbko1kc5ZDQecOSswHrYdraf
	1fdK0gzdCDxymcyy0Y16K01ytcp1zx5v6zQAyjycSzqdIkhSN4CGB5Ldz8RmAR967F83Gq2dAwd
	s3Mo1J+UN41LL8tX1U5sN9rqlHJKLnFjnQy0ziM7Hdg9ktDei40Fq8t/1OiH9zk0XbWuTGTfx1j
	zUBJQTzOGnXlRmjJAZzZnFNwUaY2bkqf6fQbN1uPC7zzDYotJRndLywtD9KNxXdBCHZooKR1cPp
	XL6CCgy4TakHsEw07/0uwHg1ByY9KVU3+6gQh5ckZHZLwcQk=
X-Received: by 2002:a05:600c:1911:b0:4b7:6b0a:a2f6 with SMTP id 5b1f17b1804b1-4ba09381509mr118693605e9.21.1794497397629;
        Thu, 12 Nov 2026 07:29:57 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e26700fsm86582715e9.10.2026.11.12.07.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:29:56 -0800 (PST)
Date: Thu, 12 Nov 2026 16:29:55 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Brian Masney <masneyb@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Brian Norris <computersforpeace@gmail.com>, 
	Maxime Coquelin <maxime.coquelin@st.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Michael Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, 
	David Laight <david.laight.linux@gmail.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 1/3] clk: divider: Fix the divisor for rates above
 4.29 GHz
Message-ID: <avXa2Z3R6Xogr6Sw@macbook.homenet.telecomitalia.it>
References: <20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com>
 <20261112-upstream-clk-divider-large-rates-v2-1-18f3bb888b0c@baylibre.com>
 <179449618653.1227210.1767827907767958978.b4-review@b4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179449618653.1227210.1767827907767958978.b4-review@b4>

On Thu, Nov 12, 2026 at 10:09:46 +0100, Brian Masney wrote:
> Hi Carlo,

Hi Brian,

> >  static int _div_round_up(const struct clk_div_table *table,
> >  			 unsigned long parent_rate, unsigned long rate,
> >  			 unsigned long flags)
> >  {
> > -	int div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
> > +	int div = _get_div_round_up(parent_rate, rate);
> 
> _get_div_round_up() returns an unsigned long however it's downsized to
> an int here.

Right, but wasn't also DIV_ROUND_UP_ULL() previously returning a u64
that was stored in the same int?

thanks,

--
Carlo Caione
