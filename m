Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.156.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605033;
	b=MF9eFTbVm18cuMYFXua1hp2Uaa4D240tyUWdG9V6VmXnO0P80VeRZPNROrifqQPzJvXM
	 ah3EqY3b6kHkHQK9Di0zA/KdPvzrrVHc1OTLS/Asc6B0WXXSLJ90CHNkSFTQiflF5dXDz
	 kEXaxiIn0511jm/MWQ8L0RIjU0Fb4Ewx6pkr4RRL63cw3wwqzBFtNm2GMc24HHTCU7awS
	 K7HvKXmUwLWELc/nrHU9mZUlMOWaq5JCDx2xS0W62jwQIrZXY0wnHT2nAWQ/994hoI5F1
	 yLwDrGXV20XhT0Fr5UP3c17jkMK0Qx/Kx7zF2CIcZNhU98tlGN6ByhfM9gMKjeJqtiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605033;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=xhcWkyQWUr5o7YPJr3rKBTz0NjHWa8qVQZWLF+KmEeE=;
	b=cTP8MRdRaz6Sykx8sl320bH8YoAtwtAk5uao/dfulZWnSjpqW1yCDztkgGeofLKeXGYY
	 /3hXUTgv6PUHLJDL/yKHIZJbn3W42f82ZJzg05lXpyzzGU0pNaWqoBaJw3hW7gxHW6R8k
	 Bk+Za5PN2ECr9H8J62NssVpCfwG/UCABvwzghWLBRcxg2zs5ocKFnSQ62APNXJCJEvvNN
	 JGnU0G2NI9eoCFMwjQopF392TDEPI/IlbO8NeMkp8xt536ckUW2VYK5gB8mPz/I6bNLNs
	 03fD74sLOBFx2kt5BNpVHCS7BxbuSaG7NjqNV1Axo1u9Vz092Ick9MIGTAwIzMbegsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=enneenne.com;
	spf=pass smtp.mailfrom=enneenne.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=AnylbI18;
	arc=none smtp.remote-ip=62.149.156.131
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25F0606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F25F0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=AnylbI18
Received: from [192.168.0.186] ([101.57.122.26])
	by Aruba SMTP with ESMTPSA
	id NmbHxkfRaV5J9NmbHxJSzH; Mon, 02 Nov 2026 08:37:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1793605024; bh=saVY7wfWjYqhW6bPBGHo/DEe3cjEs9f8BoRfe+c4DAs=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=AnylbI18PEyfQBh1G4nG42CzN5Q/eHvSIDHP7sHKmuTf08UtHGv3O5/RZp1fEsQYb
	 wircYXtMCJpIUlOPBRYinkZD6HbriBpDahkM1PxB1PC/zspqI+egxAnKUqZcbyzN10
	 LkGOfz30VcoxtKHSUmsmCQitIDZvmNCtJujmpL6MYSt6I/LjxbZHWWAW/FpKKx0HdF
	 DXa9i46c4WwU4UB4FeksFNyzw5X5+MWIOp5MCurihv2xBLrLyjC11TwrECQGkus/vV
	 iFW3HClAt847UU19NvmIEqawCyAfEef6iYM585aGKhuTQDj9P8pmgKoDUmTZXrULEi
	 xeiUsQ5UWN8vw==
Message-ID: <e858ddf4-4710-4908-b2e7-d26a68d06fbb@enneenne.com>
Date: Mon, 2 Nov 2026 08:37:02 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] iio: adc: add driver for Texas Instruments TLA2528
 adc
Content-Language: en-US, it, it-IT
To: Jonathan Cameron <jic23@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Angelo Dureghello <adureghello@baylibre.com>,
 Tobias Sperling <tobias.sperling@softing.com>,
 Eason Yang <j2anfernee@gmail.com>,
 Marilene Andrade Garcia <marilene.agarcia@gmail.com>,
 Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
 duje@dujemihanovic.xyz, herve.codina@bootlin.com,
 thomas.petazzoni@bootlin.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261030164705.297354-1-maxime.chevallier@bootlin.com>
 <20261030164705.297354-3-maxime.chevallier@bootlin.com>
 <20261031234848.00248ddd@jic23-hlaptop>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <20261031234848.00248ddd@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCHbwW499DCRrn78XsmTi21/wd2BGqm+Vq/lCd1YFZH1tK5d4fTKjVrtFW3ZyX7hk379owkLKK5isgmB0qKkuQoJUJz6A28x5gAWarp02MF9HOq67B/B
 cJWCdwmcOx7R8yjFFM8bOdOK5lx3rV/4PqeOtkiUTOsAndhMcFJgnmB3nbZkoVUyNIlW7TXJ7wns4yyB2gT3jbvKLh//5CXWftv1URmlv7KQ+rXOesAECWEp
 /D4UgiOwZ2Z+kKSdaeAyahsuTuS8buL5rahbE1JGTFsriUjbfcZ+FchfmtXX3osll8QlXCwEQAyGQvFl9bSV2uaebWpIvyRRKqMYNdIQY6tUucQpz2IQ/OI0
 k0RF8slHcQGA/UtinpVVb5bBCf2rd5zWfI4DNS20pWkWl0JSQUsiTZ+3wdVmqjD5juD+jVJ1Ca81gu4GMANeq1NJJwXU5rpR1C4s3tG/bbzTzdODET+G7v64
 GKGMgNFLdTJ3bcMQB5nRm0Eak+6I5uoDR1GfJKQ/6Xudmz4UHC6LtuXs8HWxKdSnmrHTJfjzJGozJt6HmqFvf5OTVHA2lY2iuVIH2/UgpLoRdBSOQ0zHoF4Q
 PSKdWeh6/y848DaleDR5H911o5ssviYVgmW83cE6oOljoUNTMvUT8nN9RZPBRRg+dkqcWRe+QA6v38Cv/9LfdchtqAoALMjLMinVZvbloYHH29FAlz8WR0h6
 dmEMPpd59qvOJQ54UDezUUJQN2gpsdhHaboUVMOFP7MKfaKfN703o7OMAlWWVSbnNWMT5Oj9QtrAGKztbK3jBSrJswxBKLljDNV1ZSKPAosDJM3s9b9/Pi4E
 +5lRJd32LERW+y0ZT6Y8Wv1gYrIbDV5zZt+XOaJQFL3Z0YPk8rVyuLXTAkMAQMlfVyoC+KaUx4Aa/pQNbAs8EMKkyk+YiQ3Jo8L2Hsn1ki39xBh86tVL1XBG
 6zLrxlmikdrTUeabnbr5QgXo5SU=

On 01/11/2026 00:48, Jonathan Cameron wrote:
> I'd also like to avoid propagating the fallback to all channels
> if none are specified. In this particular case it is problematic
> because if you add the GPIO mode, for chips like this, we tend
> to expose all pins that aren't in use for anything else as GPIOs.
> With the fallback scheme you have no way to tell if you want all
> pins as GPIOs.

Agreed. With only 8 pins, listing the channels explicitly in the DT
costs little, and it keeps the door open for the GPIO support.

Maxime, if you drop the fallback, I think the commit message of patch
1/2 should lose its last sentence too ("If no ADC chan description is
represented, all channels will be exposed as analog inputs."), since
it would no longer describe what the driver does.

Thanks,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming
