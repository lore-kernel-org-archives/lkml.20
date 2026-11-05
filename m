Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793892919;
	b=LovSomIhEptpo7qsZZJyfsPmspVBKIb/B2Gx2vRkucfNAbFikoK8D3a9yUoux2SvABjU
	 uVDc5jotCoQZHTGSyE9rTXU5bo6ODe6w3tXZhG8XMWe6vKAU5ksic4sD8K7FhPdCVT3zg
	 813iFTzayuziPOo7Cs/0G7X//UyvI6imb7EN64CjXV4kagchtQRWrvE0JFLKZutVLf0Ew
	 eWAVYRZZp7xP0/fzTpA17OthlA1xtxKxDar1VhshaRBsgMGhlg3KR8YCQbk6FgfDw1N02
	 Z6oyxjkygMtgAArK8ymOgO6SqQqbccq0zJecb9qO8SAvnBsBq4KpiHvY7b4pAs8a6SA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892919;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=o9kwmng/ZKZ68oeV09M3Z/Ujx6g9XVfoDBXSDUdg1Nc=;
	b=KdoRq9CyHo1CiEcdB2SnhMxJUrWIkSUgGdCKzwOHmjKkVk3jWphOTsF/3P6sKNOlk8/M
	 /7gmU2fKNp5WBgRt+Xv4hljw5gifN6GV3vLQQULfFdRNV1DgW0ST+k6WaiOGkyKx+wi28
	 tFpk07NnbyOUbcUrmGArOx0M1dOLTMlMPF9UGo+K4Cvwn3vIOBZjP9v4QEoQEgJXz4wiw
	 BWZIutoreto/5bAl9srAf0ciYJgTt/h3bivviPe2OYyXGzIZDczdiJRLFIGk1v2PaHm28
	 ARLV1aYKOwdeiJFcBmmxJqfoUwoTF0SIPXrig98mbjv3YNenk4k0PKsvXfSz5dvAjog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=XmDVUKYp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAACE606A31B;
	Thu,  5 Nov 2026 15:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAACE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=XmDVUKYp
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.4.pengutronix.de [10.9.0.3])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 029092001A4;
	Thu, 05 Nov 2026 16:35:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793892912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o9kwmng/ZKZ68oeV09M3Z/Ujx6g9XVfoDBXSDUdg1Nc=;
	b=XmDVUKYpjZcwC7b8SlEXCovgkE/JBQsHmhhVyAYs5zigkZ87oowPnVy5aj3Q89rUMSTsoa
	FyNTbgM8GQKFolXErydMGzN0GKnXaLpIdxrYMOi5gcc4D28kiyjAKJlW/MkVsr/K3Pzpgw
	gbQLZZWgVLw2PQSM3mtoxdFLCx4jHsTpgbAzi/CPiKqRe7dq3qyNyoHKCKpT3aOmUSOJul
	nFyTSSq74Qb/hvmcL3oJU/CAF17hnBUFTuSlIWwAcBXqhVP7UmIJnQq2rFmIW8RY2ZVmBY
	OA/ksBPvOrQFjNg8basVTflOnG0YdJ+Sy9WsCc6X1Ztmzhg14xF5ZTUbbuVRGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793892912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o9kwmng/ZKZ68oeV09M3Z/Ujx6g9XVfoDBXSDUdg1Nc=;
	b=eIGmtle9gor9BJZPw2wpF6K1snehL6cGfp1+oFlwj4LMLugIgm+6bVtFxVR/Fqs3vYi77n
	Myyq3rQHLsZUKYkGi9RRBC7pRfuiocb4N9YYTI6jIDXTywq4uSVz1bfJA5Rrqlr5bVyFn6
	DpGsmL/8WH64BdR1VKUILhlamHop5oRDTDv07wULbTPerVF/leaAWdI2uLZnIBj+BtSu4m
	6pXFLNmFw1moZScD4X4RudOcDTVU2K/h2ea7e/uryswPVNkq0XN7lJDofhrH5Kdua7X8zV
	PHHVieSnhX2VCtfWfr6o+f0+lXoocJR/xf40S76c8qNFQUZpFUClmKQ2uUCy2w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=mfe@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793892912; a=rsa-sha256;
	cv=none;
	b=YBq/iClsbsm9V9sGw6to7W9CKWhSSAgQsh08spGFJmdt+gYRlYpVIzyvVsukUOe0/LuIW3
	S7m7obN/ZnmCBrd+YIHVcraz4vGWal/gt6muIEGSepK3ZhDGU7Rftr2+4iUWUikAAv2VBa
	ugWMDzIY2AoCv+Sjl2RAtG8Wm5qen+TpwJ6Ag/2D1gWoU9bmF5hTjajKxo0tZ7rVJ2nFP8
	GIYLLO0G9BBQCPwI5XsM/SrW/8ViJY06U0hqB3uSAM05/JvPhaUBNADsdYQDmck5B9a7fw
	xsGql6365IhC/14rsm0EobVq+6iq02Ybi1/bX8peEE0fdXjPY/GhkggSZQASEA==
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1064)
	id E15511BF56B; Thu, 05 Nov 2026 16:35:11 +0100 (CET)
Date: Thu, 5 Nov 2026 16:35:11 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	imx@lists.linux.dev, Sascha Hauer <s.hauer@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] ARM: dts: nxp/imx6: Drop unused .dtsi
Message-ID: <vvsd6rchs6wff2n7zxtcarxcvbnuxd7fx632xogm6hrcxxxqsl@dp5dvof3qa7c>
References: <20261105144920.2796623-2-robh@kernel.org>
 <krvg6bwsueypasvt6fqszh7itqr3gu3qsqbji2ernqqy6g3t4c@b7hqenmaugik>
 <CAL_JsqLETyrx7ew0zirS9r6+3=GEFaRE0g96OZHYwqjxMCZKcQ@mail.gmail.com>
 <hvrfbvmyzsa6npzh6wpa6o3xxygslqc7g5ukt7ph7ty4povogh@wge2z4rejnf7>
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
In-Reply-To: <hvrfbvmyzsa6npzh6wpa6o3xxygslqc7g5ukt7ph7ty4povogh@wge2z4rejnf7>

On 26-11-05 16:09, Marco Felsch wrote:
> On 26-11-05 09:06, Rob Herring wrote:
> > On Thu, Nov 5, 2026 at 9:00 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> > >
> > > On 26-11-05 08:49, Rob Herring (Arm) wrote:
> > > > These .dtsi files are not included anywhere in the tree and can't be
> > > > tested.
> > > >
> > > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > > ---
> > > > v2:
> > > >  - Rebased
> > > >
> > > > It's been nearly a year and these are still orphans. There was a promise
> > > > to upstream something for the kontron ones, but that hasn't happened.
> > >
> > > That's unfortunate, but these includes are used at least by the barebox
> > > bootloader [1,2], dropping these would cause a DT regresssion.
> > >
> > > Would it help to upstream [1,2]?
> > 
> > You said you were going to do that on v1:
> 
> Unfortunate no Kontron dev was chiming in. Will do it now!

Okay, after checking the current linux source tree I noticed that
Kontron did upstream the carrier board .dts files but in a different
manner:

 * arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i-ads2.dts
 * arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i-ads2.dts

This means that barebox would need to adapt the includes. Can you please
mention that the .dtsi are not used by linux mainline and instead a
different approach was used?

Regards,
  Marco


> 
> Regards,
>   Marco
> 
> > 
> > >> I will add the som.dts, please don't remove the kontron dtsi files yet.
> 
> 
