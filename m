Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794360117;
	b=OrZr0mTuJN0sopnXE7hTbSqQDN477O2pOS1R5lFUe/g/NDmEWFgozI8brkpA13xiOZcy
	 Q73ZhF4BUO4/k9DOuX+XPBnsiQaWrbNoHQJLoNZgQgfo1KkZyg8ix1B1cSu47ceTgkgwX
	 +7fblhVIkG1nrFWhgT3FcwLLqh2jsaWZ8vFd7VqHIqYoavFxb+uNSV8vQM+3N1A89nALg
	 cPurHvrILsTvsRQu1LW5FW0fskzxve0D9T7uZlWUS73g61xRCdE20TE7+EGIycUo5N0lK
	 BuMHNm3jaRy+RWP5mp/BWhjPzaHS7GV9BYzYhSCMOEAf/AH6k118kXdOgf00elMfyqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794360117;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=8ZZk9oEGAIjQ2tF3K4JfYaKrxUDTTjE79kClK2OjhcE=;
	b=0+91EEVnc9tL4vrbsb5psK4FxOTTQiIComn4/gXEfA11Pv7emXhZv14A2kSnvRucBeAt
	 T3q5zGolY1UzkjROazJFtUpO81DT7G5Or87eqoCjvrlK7XEGgLlM3bWNHhrNbqtkBCGY5
	 l0pFMTxtd8XqceQLV2CvmZyyEjzhBSnkE7+iiAGjFBZPO5ZbLwbEEpCHougER+Ymucfd4
	 KL2XJhGgYVx/Hk9mxeAcSeOci96m+9yUbEXC57QkKetScFY+7pZJGbUHoUAnRX7ybeQWm
	 kMq+xL32W8ZVR1OsZ+RBm/TdYfGX9uiVDbPIgrYofnb+9mYm2oDP5gIdy3ze3Y6QCfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=L8BOQL94;
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A32606A321;
	Wed, 11 Nov 2026 01:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90A32606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=L8BOQL94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794360114;
	bh=8ZZk9oEGAIjQ2tF3K4JfYaKrxUDTTjE79kClK2OjhcE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=L8BOQL94I2g3NOqQh4X2CDZ9nBgiSyCun7TWRPgsPkU85idmewltrojo+I1blRbE3
	 zJoeAAMAjylQ0kXJlot9qZrBhlj/sQsUhnW44OZmzt1Tq4zMBlrZemXE3+ZEAGPrTM
	 Ff1NmHE4KW5QHaiCMwlJ9UTjoKPuTmlsF36bXWuZujMHUrUq45S72M/NhsCybCj+3h
	 lDSbmjxABpAhKWJ2/AdaWpzAEYJDG8KTuIMlRbk524qXP2UruNfQJDZnVxmZUfKO3h
	 097gOG8nEDuYCwEnar1EyWBnkTugQeivYCweS8mxZXLJJ5UC+W91JBzPh1g9qPFCu3
	 z5Lnd4BZEFQ5A==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D882164C3C;
	Wed, 11 Nov 2026 09:21:52 +0800 (AWST)
Message-ID: <cb3d9f50467089c6b13ea83aeddfb032c046848a.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/3] ARM: dts: aspeed: ventura2: Add LTC2305 ADCs and
 GPIO line names
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kyle Hsieh <kylehsieh1995@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Ryan
 Chen <ryan_chen@aspeedtech.com>,  Billy Tsai <billy_tsai@aspeedtech.com>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, 	linux-kernel@vger.kernel.org
Date: Wed, 11 Nov 2026 11:51:52 +1030
In-Reply-To: <CAF7HswPYb3hOWA7P-d1zASvd1XzaVeuBkoqz5nXHuDeEAXDhrA@mail.gmail.com>
References: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
	 <245d0e9d4043c0957716a6a32985b6ea5a8cb9ef.camel@codeconstruct.com.au>
	 <CAF7HswPYb3hOWA7P-d1zASvd1XzaVeuBkoqz5nXHuDeEAXDhrA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-11-10 at 16:44 +0800, Kyle Hsieh wrote:
> On Mon, Nov 9, 2026 at 10:41=E2=80=AFAM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> > On Fri, 2026-11-06 at 11:08 +0800, Kyle Hsieh wrote:
> > > The LTC2305 ADCs use their internal 4.096V reference, so no vref-supp=
ly
> > > is described. Patch 1 therefore depends on "dt-bindings: iio: adc:
> > > ltc2497: Make vref-supply optional for LTC2305/LTC2309"; without it,
> > > dtbs_check reports a missing vref-supply for the LTC2305 nodes.
> >=20
> > Can you provide a link to this patch? I am yet to find it on lore.
>=20
> Sorry, I should have sent it before this series. It is now posted at:
> https://lore.kernel.org/linux-iio/20261110-ltc2497-vref-optional-v1-1-35c=
9657f3c0f@gmail.com/

Thanks. Can you please let me know when this one has merged?


Andrew
