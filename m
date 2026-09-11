Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51753F99F4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112486; cv=none; b=SfnqDLAtylnk7dALIavJt77WDg6c3CnBzET0wxL8Y3NLhsC2oJpDSmnuBzs/j2clBikdDNMcRkSpkZ2tRih7pBYjHT0V31hy7sfDntrbGeaI3m+ascjMv/7vcGipFEYmIIVR+1/QkYQf5RPeHBaWXCXvKFsQwU6FtZN7dH8S92s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112486; c=relaxed/simple;
	bh=NO/OF5kdS6j1QF4/t6fTKO7uogCt4Zulz2Ll0FAdBeA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R0Ii0HFqsMKyuua+lEKkRH7HlkFIwzP1bEAcIlIg+buFXDxPvFe9c+wGqid0vkY7moP+uTcwObA7fBTWKfue+5Z2rgsE0J4QR7m0n5gr7/g8xQ2y8rHdMBAG18OTeCQRbrn7GlkdmheVZu7RDU541NMVlo30BMc9FFEskcZXWQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c5yIk1ZK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c5yIk1ZK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6044D1F008A1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789112484;
	bh=NO/OF5kdS6j1QF4/t6fTKO7uogCt4Zulz2Ll0FAdBeA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=c5yIk1ZKQWrpT7q3tlD/FHemkJLrK2xQ6VBo/ec4kFurOeSlrzrTxfPO9eqAuR+Hl
	 qK2A3lc5zvC/nELRwZQcTHViahP4SPrAd6jIsZOWamLOVQnit8A0TCiujvmEWRlgEw
	 bi7UHpBk5QzSxUmZKfKdpQ/ivmaMi3ZM1elnqQPNoFSbOjkEMpxh4az/JVv5J9okjs
	 ziPVt5QiBzjT9EdjLvKOl9+IzhkL4yzdF/eA/FSxxvQQcmyTDOqSPtgIDl7spjDnnm
	 y01QdJ1ZQK+q+0gHE63FaXd16MAPmlFTQYv2UZisMsPW/owRW4sxdg5aDqutEQjetk
	 uh2kpWsJt4Zyg==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a354118856so4970951fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:41:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzxjeK2WmFzODKw32nN1eQqnAZ+5w6cgySHT906NvxTj2L61QDbWFW83AJ0KbRVMZzKAHry2gYW86Ohj4Y=@vger.kernel.org
X-Gm-Message-State: AFuF++ls/CBs2XYizZBPrO+NgOhenecfw8BnMEV3bvQkMzTfsdXwUzpM
	iOa1AmkYs/tHJIZ2095x2bYGgx1pg6YldbsGtZE1zmwcTWF9I8d/UBpJo29r0mfX75g6mPSY/AN
	JYDH8oH1nuTGYt+3squA9mnfx68YhMy3+HGCL64c0oQ==
X-Received: by 2002:a05:651c:31c6:b0:3a4:8913:a259 with SMTP id
 38308e7fff4ca-3a5a52919e6mr2819641fa.29.1789112482986; Fri, 11 Sep 2026
 00:41:22 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 00:41:20 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 00:41:20 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260910-ad7768-driver-v7-16-7f70b07627e1@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-ad7768-driver-v7-0-7f70b07627e1@analog.com> <20260910-ad7768-driver-v7-16-7f70b07627e1@analog.com>
Date: Fri, 11 Sep 2026 00:41:20 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mei5ZrOcW3B0mGw1woX3ws+q6t1jzR+Pv6_dKKRo7ZOvA@mail.gmail.com>
X-Gm-Features: AcwNN1W5R2PpX2POIWzVZ_dgShbvNnsPO4gL5fI0M7B8ZSyCOdNjEzti7afKFRU
Message-ID: <CAMRc=Mei5ZrOcW3B0mGw1woX3ws+q6t1jzR+Pv6_dKKRo7ZOvA@mail.gmail.com>
Subject: Re: [PATCH v7 16/17] iio: adc: ad7768: Register GPIO auxiliary device
To: Janani Sunil <janani.sunil@analog.com>
Cc: linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, jananisunil.dev@gmail.com, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Michael Walle <mwalle@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Sep 2026 19:36:34 +0200, Janani Sunil <janani.sunil@analog.com> said:
> Register an auxiliary device when the AD7768 is described as a GPIO
> controller. This allows the GPIO driver to share the parent regmap and
> runtime power-management state.
>
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
