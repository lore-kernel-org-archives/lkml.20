Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793899931;
	b=ll2gFevgORzhzhT87Ldo1q2f7DKtovgXdMQGj1R11JqnFv7pA71oKJ6HSHfe3jev+Yu4
	 ccH7P8kgxxkllk++auOi2nwdpcEBXSb60LjFfNMoqOgco15SwbmBcnSyjrA7AFAarr0ME
	 J1ZoV20k9shfh80RWTVyjmjGHhlZcK++Fu0NkjSP3O+3XR92/ICnkJkEvGHDzVDWNKzIK
	 MPqRxyzSr/SKewxNoN2TDrzJcO5ekYC9If/npPGMHIxT9r0I+CUPG0HhDPI+z8dTlc+JV
	 a8Qb/11dR+Hn44IsQenBwpslo2ESzFdT9bIde7VMUzVzcvGZ80tlZ+wvQVW2WfC1rQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899931;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=u8e5CcNv9oY6VuYoJpUdtWSR3IA6s9zG0LDKZaQi/Ss=;
	b=vL8hZPoDnHwROiDTMUSkwQNcMIAX80nKV3DaBXO96yBB6liLPahOqvyrH2frB+k+elDB
	 2rQTGzpAE7L+UbySV28TVUaVJ9zwbfOPxeKeNJwTBJroJVwyyPmTmwffdvFmDp/d5SSVs
	 /xs1hwawjqVAjZhacTJ/CxxKmgwSGZwzZz18qfU3clQkfj9rx5FV+AMwNS/seBHbihF4B
	 8T1fkxeQFNKEvdDp3BSz6B1T+3rwmDyveCgQAzt4HL2TS1gCOv2NsJ+bcbGPHc+XQJ2b1
	 PqRSL0AiMlrxWQZtepdY+B4lg+udY+yWfoHs1Pj80rfaiBitBy0X3wRhczd8vWxs+1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b="BcMOg/C7";
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE47C606A328;
	Thu,  5 Nov 2026 17:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE47C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=BcMOg/C7
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::109])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C21582020B9;
	Thu, 05 Nov 2026 18:32:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793899923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u8e5CcNv9oY6VuYoJpUdtWSR3IA6s9zG0LDKZaQi/Ss=;
	b=BcMOg/C7H7WJFt/S1JRxxIF9WXG/BXAjBQHBqve6ml8Ujh49lRId1pGfsFZ4vMJu8Z9qwc
	0/DZyNltrHH1Ps6iYoVXg+cNr0Qh2X3Jzs5qOhP16WHOGbqwZCgpK8j/fNGhRN7lrA6HeP
	PsD7itsZyec1TBKqY46nwajLrRVtCZANw/dGGvh3UO94YDMeDsVpjMj0UMdqMnH8ZxdZms
	F02Oq6KqnH5Y+ic4+j8CnRt8F71FUnQv2aGbkOZI5DdBNzKsZxV9ifkqPBneBdePJxDY8E
	V0TVF5Hh0hC7TkHM9m3FRTWTSi3xDPe02LwIBvW42PJaRmVisdVVHuwWdT3IPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793899923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u8e5CcNv9oY6VuYoJpUdtWSR3IA6s9zG0LDKZaQi/Ss=;
	b=ECXZQbomhNek9IQFp2tpaR9wkgR6pt/GtdOnFIHMJgc8XCdtCgLkyoDCF/mH7SEwNqBFwQ
	VgJdgcTShUDPjlaP1ByZCjcp8ui07ES+ZaqAz2LkvCDVnv/l8GVZk/nRbHWWi7Eh7Etqrq
	2eo24gz8t3HgXvi3jIRe9BOZZxB0z8/rGg9JhDecAxGQglzBTfOKeBT3g+GMZGYuAGx9Kv
	fB/vc9H+dM984DCX5ZNh7ZTGznbRWsMrS2DctNJ5rBdFBUSBHPvEEGCPUplqJZKtEkvxRm
	2Jwkft+CLf4fmcfNvB2EKWFQ96DLq8C7PoKSviue0TrrxCXD8siCGZCUb+vI5g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=mfe@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793899923; a=rsa-sha256;
	cv=none;
	b=Sk1CkR4+30LuOcX/BVLGSe504iIChL/PB43dkT4f65ElMCyQwzOD+FyGl29nWbe1UaUHeM
	x4X1utkSJgR++hBrVh3nJYnbdlixn+IRJyFB5c50Ik/mgZZZRWeOogQw35JDKM/X0BO9h4
	b32TUmda0A6s8cGaphKuGxPxy9tc7OWB+X9l2gzS2OXjq6wOS69oMWkwGgYl0BE2XJU0Bo
	yH8DW3pW6i02huKHBT+Cmq62ei+z2Kkpwbnn5tTQadfxlPvM12DIcQHggLzH59teQmb10Z
	ztRcOU30tcFP8duLG2F0RHFuvlIlyu5oexsV/fplq8oEtyhmfZJGgTCWKre23Q==
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1064)
	id 9E0131BF678; Thu, 05 Nov 2026 18:32:03 +0100 (CET)
Date: Thu, 5 Nov 2026 18:32:03 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev, Sascha Hauer <s.hauer@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] ARM: dts: nxp/imx6: Drop unused .dtsi
Message-ID: <vsnztvararyghlx4dh7kzfb7m4euztjacrzai5ucupcptncg4b@axurae5hrtfb>
References: <20261105144920.2796623-2-robh@kernel.org>
 <krvg6bwsueypasvt6fqszh7itqr3gu3qsqbji2ernqqy6g3t4c@b7hqenmaugik>
 <CAL_JsqLETyrx7ew0zirS9r6+3=GEFaRE0g96OZHYwqjxMCZKcQ@mail.gmail.com>
 <hvrfbvmyzsa6npzh6wpa6o3xxygslqc7g5ukt7ph7ty4povogh@wge2z4rejnf7>
 <vvsd6rchs6wff2n7zxtcarxcvbnuxd7fx632xogm6hrcxxxqsl@dp5dvof3qa7c>
 <auyx155Caf3kwT4h@SMW015318>
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
In-Reply-To: <auyx155Caf3kwT4h@SMW015318>

On 26-11-05 10:41, Frank Li wrote:
> On Thu, Nov 05, 2026 at 04:35:11PM +0100, Marco Felsch wrote:
> > On 26-11-05 16:09, Marco Felsch wrote:
> > > On 26-11-05 09:06, Rob Herring wrote:
> > > > On Thu, Nov 5, 2026 at 9:00 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> > > > >
> > > > > On 26-11-05 08:49, Rob Herring (Arm) wrote:
> > > > > > These .dtsi files are not included anywhere in the tree and can't be
> > > > > > tested.
> > > > > >
> > > > > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > > > > ---
> > > > > > v2:
> > > > > >  - Rebased
> > > > > >
> > > > > > It's been nearly a year and these are still orphans. There was a promise
> > > > > > to upstream something for the kontron ones, but that hasn't happened.
> > > > >
> > > > > That's unfortunate, but these includes are used at least by the barebox
> > > > > bootloader [1,2], dropping these would cause a DT regresssion.
> > > > >
> > > > > Would it help to upstream [1,2]?
> > > >
> > > > You said you were going to do that on v1:
> > >
> > > Unfortunate no Kontron dev was chiming in. Will do it now!
> >
> > Okay, after checking the current linux source tree I noticed that
> > Kontron did upstream the carrier board .dts files but in a different
> > manner:
> >
> >  * arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i-ads2.dts
> >  * arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i-ads2.dts
> >
> > This means that barebox would need to adapt the includes. Can you please
> > mention that the .dtsi are not used by linux mainline and instead a
> > different approach was used?
> 
> So, Is it okay to pick this patch?

Yes, if the commit message points out that the final linux devicetrees
did land in a different way. This helps the other projects to adapt
their devicetree ports.

Regards,
  Marco

> 
> Frank
> 
> >
> > Regards,
> >   Marco
> >
> >
> > >
> > > Regards,
> > >   Marco
> > >
> > > >
> > > > >> I will add the som.dts, please don't remove the kontron dtsi files yet.
> > >
> > >
> >
