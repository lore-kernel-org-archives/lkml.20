Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419631;
	b=MGYCmg8DFAor8jHXac6v2Hnz3qwl3h61l/I1RdwZV57BA0WRnliU/1CMoBAv746IpFNl
	 3h6u7AdnY7RcwTQSP88hUAgjCOSNdfCC8mTfi28kx4GguOfSCWRh4cAfJ4ZTpAKA/Q7i+
	 KyHZvvf5efsLpfh4uSz1JtaeXDG+q3fDvXB5ntNdU+lgGyZcw8D09F3MRFLD8B/T5SAPf
	 ZapSg97E+XDf5+/mqLfvxisvoKXCGlgNl+8n9yWySI5L0tEz0DDfVIMcaq3TWva1jlcEO
	 VPTbMS3tdK3PfqDAqH9PWwYQPHPXIOgY2kWZHq7ZsX934PG4rjLeuIrAjlNdICnSlGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419631;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=lBZdj4WcMdY9P5ScCBS2DeUqTzZ89k20qwtCFUdukds=;
	b=2kbCVf2dDkTltAMvuGJg9/IrzQ69Rzdu1bfAJuUH3C0NrrFXWtwU0fLUhvEGZuXwGs1B
	 W0CWaY+2zr+wv+0rqngc6aVoO9m/4K/rxWBNz/s5CAsTpQie+0N3eBPgLcs8wFlu6LAZZ
	 Wye4MQ+YkQ0cLtdkK+jGG3u8dZxXxp/odLf6grvA9ScEjsr7ngxS4VX7UBRbniQDm/XNW
	 5HuMQDMiSm3qTEqwPbSvAiBZ2obI9+hxXWB5g92FoRixb3wc3JpkKWtR6Msti2IiNz1mZ
	 KTvX4FlrMwMqTLRA1yF2vSv4I+Yx9RPQpa/rjO+giVOjjPCxFnUVFM6Yinn5PCaoZRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CErPraL5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF1E606A321;
	Wed, 11 Nov 2026 17:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CErPraL5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A331F00A05;
	Wed, 11 Nov 2026 17:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794419630;
	bh=lBZdj4WcMdY9P5ScCBS2DeUqTzZ89k20qwtCFUdukds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CErPraL5mVo0gfBj4Q05Ij7oDM4pd0BWi5DzYZDcy40tPZF43P5P90IAlBXsMCnxE
	 +gjPd9OgRW5gT1Mju3oQW/y5Xwf/htFREYOSLGixzzU/lQnZtVk9UF+9cJZ/NIefop
	 eXZk4J+nODIBpQ06yQoZDuQI7iDSqcqJElWkXcA6NylCp34O4IaK6ICNr00R4xggrO
	 GN5PSg7fih8UnmaqJwwAULepuwPosV1wd+CXtdv3qFM2DItjmaLgEvMj+J5EwxNmtc
	 dra6JallSEr2b9XBzpsnGhfo4RpQFFRTRVchpiIviL85rOP4OHd3Jl/ULUMXC3VaPt
	 5ZkP1aRy2ppEw==
Date: Wed, 11 Nov 2026 11:53:48 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?Q?=C5=81ukasz?= Majewski <lukma@nabladev.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: trivial-devices: Add National lm77
 temperature sensor
Message-ID: <20261111175348.GA167782-robh@kernel.org>
References: <20261110150243.1531953-1-lukma@nabladev.com>
 <20b8e15f-70fb-4844-abb6-d91d7d7e9849@roeck-us.net>
 <20261111092311.54928fd3@wsk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261111092311.54928fd3@wsk>

On Wed, Nov 11, 2026 at 09:23:11AM +0100, Łukasz Majewski wrote:
> Hi Guenter,
> 
> > On 11/10/26 07:02, Lukasz Majewski wrote:
> > > Add "national,lm77" as compatible for the National (now TI) LM77
> > > digital I2C temperature sensor.
> > > 
> > > Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> > > ---
> > >   Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
> > >   1 file changed, 2 insertions(+)

Not really a trivial device as there is a T_CRIT_A signal...

Though I guess LM80 and probably others aren't really either.

> > > 
> > > diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml
> > > b/Documentation/devicetree/bindings/trivial-devices.yaml index
> > > a8b2b9deade4..9413ee0626f5 100644 ---
> > > a/Documentation/devicetree/bindings/trivial-devices.yaml +++
> > > b/Documentation/devicetree/bindings/trivial-devices.yaml @@ -387,6
> > > +387,8 @@ properties:
> > >             - national,lm85c
> > >               # I2C ±0.33°C Accurate, 12-Bit + Sign Temperature
> > > Sensor and Thermal Window Comparator
> > >             - national,lm92
> > > +            # Temperature sensor
> > > +          - national,lm77  
> > 
> > I'd suggest to retain alphabetic order.
> > 
> 
> The "alphabetic" order for "national," is already "disturbed" in this
> file - that is why I've put it in the end.
> 
> Now, the question - shall I "order" properly all of "national,"
> bindings in a single patch (including the new one)?
> 
> Or prepare two patches:
> - One to make the alphabetic order for already in-tree properties 
> 
> and
> 
> - Add the "national,lm77" afterwards ?

Just don't make things worse. Put it after national,lm95245 and before 
national,lm80. Then all but the first 2 are in order.

Rob
