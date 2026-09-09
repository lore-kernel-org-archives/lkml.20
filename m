Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04E73AEB29;
	Wed,  9 Sep 2026 10:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948398; cv=none; b=f5uUaOaP/qcD7Dwjo2mOYaQRxvUWapgC2NugdW7T4wlqWtBq5NI4xpne6zXA6lkcMXl9IgNmaTwCXlynVxwcdFy5zHBT0rELvLQj/8o47NtCGT0WEPXWw/1loGLuu0G/Jljv0/tS/CpGixNoBQRar/2K+qzzIcxcOahqSvjXIgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948398; c=relaxed/simple;
	bh=JhycYhJJUanyVuGcohA5eVQCc8DNkJi2xbPdL1LXYrg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YCyY/xFZAw4fsF3NFv10kjn05fJcw/E/+SldyMfYh0+4N9XLc7+FuT/eOGZyHsv5L/fs2KkjVkHoJv0c3cfegex5Sct79eqW0Es8vFUXT0Opc6/MZNSp2sArAyURp/lzcWD6acBTh04WGmVs2Q/9y8MUYfv2VckD7+0cgzrcGHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QAHG1B7I; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QAHG1B7I"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 41A674E415AA;
	Wed,  9 Sep 2026 10:06:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0658360448;
	Wed,  9 Sep 2026 10:06:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6581311C7AF2B;
	Wed,  9 Sep 2026 12:06:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788948392; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jmdHwhBYhc3o3X3pk1kA+wKgzKoOELJNf8tERf+4oGU=;
	b=QAHG1B7IMyhmuJCx3Dy5lMJQKpRpA6kuEsy2VzkgNqs1NF9KABobuwHS1IwA6sW05awC1u
	2964CnrjqCOD66Y9GiYHzdLsczuWoKxi5g6rvayIegbcK8jiBVQJxJRQt+uCYsHMwFpfdI
	REdZDA2RfknjGS/f63Ocyb3hkFsBuFhfxWTFMaXvFI9672+6OlWYlhEpm5ymB+MD6PyGpF
	gNu8cSZpP9m/HwcJuGARvBbZwZsJ0Csh6LcU4GxoICfdk4ik4eSRV51fWTAxUGMbo8Ur0q
	h0lQsWyNRlrwcmAgeypd8AOXNzAWdTsCfc90G8PpynlBNhIfRxsRsOBAfIpWWQ==
Date: Wed, 9 Sep 2026 12:06:25 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Daniel Lezcano
 <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Pascal Eberhard
 <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: timer: Add the Renesas RZ/N1 timer
Message-ID: <20260909120625.726f191f@bootlin.com>
In-Reply-To: <CAMuHMdUn+di4YWAGS+CeBiCD_9EhqUz0O4FkuHZwmPo531+7Tg@mail.gmail.com>
References: <20260721082952.215691-1-herve.codina@bootlin.com>
	<20260721082952.215691-2-herve.codina@bootlin.com>
	<anJGNyNxcSAwylK8@ninjato>
	<CAMuHMdUn+di4YWAGS+CeBiCD_9EhqUz0O4FkuHZwmPo531+7Tg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Geert, Wolfram,

On Wed, 5 Aug 2026 09:46:41 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Wolfram,
> 
> On Tue, 4 Aug 2026 at 22:06, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > On Tue, Jul 21, 2026 at 10:29:47AM +0200, Herve Codina (Schneider Electric) wrote:  
> > > The Renesas RZ/N1 timer block controller is the controller in charge of
> > > timers available in the Renesas RZ/N1 SoCs family.
> > >
> > > This controller handles 8 timers:
> > >  - 6 16-bit timers
> > >  - 2 32-bit timers
> > >
> > > Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>  
> >
> > In general:
> >
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >
> > One nit:
> >  
> > > +        reg = <0x51001000 0x400>;  
> >
> > Isn't 0x400 a bit excessive? The last documented register in my docs is
> > 0x114, so maybe 0x200 will do above?  
> 
> FTR, 0x200 or 0x400 does not make much of a difference, as this is
> mapped in PAGE_SIZE units anyway.
> 
> According to Table 2.1 ("Register Map") in the RZ/N1 Introduction
> document it could even be 0x1000...
> 

In order to be consistent with register listing available in the docs,
I plan to reduce the size to 0x200 in the next iteration.

Let me know if you disagree with that.

Best regards,
Hervé

