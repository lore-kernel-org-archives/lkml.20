Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575040;
	b=AvESYMOWMwMrnDKcTaMVgThIUqHxDkHmzEaA5dSJdUCtJzUYpbxOeE83oV/+ic+eXmX9
	 7Vn7uT/KprFjuPoJHuHAsPXkytLRFUvrWBZuNLxG4+nk0eyB2uriXVOul7DFJBR/V3XRa
	 iDQs/ftu7uetFUx3cGEZLEL0pY5AU3C+RxCsk9KvvkQcJ0pZ0aR6ZhOGeFMyIJMVc7gJf
	 5sryP66a7/B5ffe0nIdse91fUhUkL3HPjnI9UDYTVENulCQJIhbPhiyfR6e7cDcy7ztWT
	 HzGBLQ4rX0iLBVpTnFlrkF/Jat5+KyJA1+Mk5dEsedF2pBVn+1g7Ejc4MOB0OqoYzJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575040;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=qM+JJUMO/DvUphb/pAgQlCfxP7Oeza0K3hU8lNMJhDU=;
	b=sfStg651rd2N2qMgtPIkEW/AAp/wHDHHZ90p35rRtfpOUjiSNJpooOiOP4zvqjC6/RVH
	 +FjSOuteKpV61f70gpWp3m6tkIgzPH7fX0TdH6UjtD094A3qNZzrjPa6XjTa1UlKk3pUb
	 vhsWghgtttHtfhIgI7OMfS4iiL3wMh7dhCxUwamge857LuULNIzfyeib4DiawJ8Kw+ZHj
	 5hXN3EXU2cJyi4J/kfzOrhb/PQ/HROLpJQu49pHQrji6pCTzWM7o+GQ86QeKHgkfGSoYA
	 TBpVLP7husXxie6058DGEqulq0d9uJ7QsnCYTS9/EEGDlQVHhKxMWp/DQin4uuJOHDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=UvuVUa7c;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76073606A32D;
	Fri, 13 Nov 2026 13:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76073606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=UvuVUa7c
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 34D5810CF8A;
	Fri, 13 Nov 2026 14:03:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794575033;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qM+JJUMO/DvUphb/pAgQlCfxP7Oeza0K3hU8lNMJhDU=;
	b=UvuVUa7cmd3z5dqWVM+R3nfaphFNNfAHsr+yBVbsjouZ9UT6f18G+NOJTrT1OxSGC6fNsd
	tWjClbnzcAJmjBolotlVRrW340sfSZzYfKIMSQ+ZOog0jm6cDAi3fkASbSG3eAGQsJN7fy
	2Ilmw1M4y8/aQlE/VcLZU6oSvyJEnZereoovRu/MJTqTCWOB8Sm56zVe3DYsIUSyQN0uP2
	4hoh4k8u0rcV+6rD8h2an7g9PqsMYTbY5ooLN5at+ACOnoiKl8kVcqx5jZ8jU9vERFaNOS
	uYGl56ZtweWqSUxCFQ69v1iigjunoXl8QqbwcxyUI7L9pP78GuDOPm3fiOCvww==
Date: Fri, 13 Nov 2026 14:03:50 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Daniel Baluta
 <daniel.baluta@nxp.com>, Jonathan Cameron
 <jonathan.cameron@oss.qualcomm.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: trivial-devices: Add National lm77
 temperature sensor
Message-ID: <20261113140350.5c192ca4@wsk>
In-Reply-To: <45881f93-3f30-49e4-98cb-677814b85664@kernel.org>
References: <20261112163703.3358164-1-lukma@nabladev.com>
	<20261112163703.3358164-2-lukma@nabladev.com>
	<20261113-roaring-relaxed-oryx-5cfa1e@quoll>
	<20261113120947.6c9fb820@wsk>
	<c6095d41-09a4-4928-a55e-f4af7a5509da@kernel.org>
	<20261113132231.631638ad@wsk>
	<45881f93-3f30-49e4-98cb-677814b85664@kernel.org>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Krzysztof,

> On 13/11/2026 13:22, =C5=81ukasz Majewski wrote:
> > Hi Krzysztof,
> >  =20
> >> On 13/11/2026 12:09, =C5=81ukasz Majewski wrote: =20
> >>> Hi Krzysztof,
> >>>    =20
> >>>> On Thu, Nov 12, 2026 at 05:37:02PM +0100, Lukasz Majewski wrote:
> >>>>   =20
> >>>>> Add "national,lm77" as compatible for the National (now TI) LM77
> >>>>> digital I2C temperature sensor.     =20
> >>>>
> >>>> Are you sure this is a trivial device, not like LM75? No
> >>>> interrupts, no VS supply? Datasheet disagrees.   =20
> >>>
> >>> In my case the T_CRIT_A and INT are not connected on the
> >>> schematic. Moreover, the V+ is connected to board's 3V3.   =20
> >>
> >> But they are there and binding should be complete.
> >> What's more,
> >> existing lm75 binding does not require these so there is no issue
> >> adding to the existing binding file. =20
> >=20
> > Please be aware that internal operation of lm77 is a different than
> > lm75 and hence it has its own Linux driver.
> >=20
> > It seems like I cannot re-use the lm75.yaml and will need to add new
> > national,lm77.yaml as lm77 has two interrupt outputs for hysteresis
> > (lm75 has only one interrupt). =20
> Can be a new binding file, "national,lm77.yaml". Indeed it looks like
> it has two lines, unlike 75 variant.
>=20

+1

> Best regards,
> Krzysztof

--=20
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic
