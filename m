Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459EB46EF8D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796578; cv=none; b=AyyUEz6yQ3CKSr0Scv6J4YbehJ4yzJKAL2+OEQk24pHrAPR9zE5baw0Yu0gtN18y0UX2GsFfdcHi8/9wvFNbiKxxUzEonCRiyfmNwQaYaXVv5pdxfIZYTXMFlxETXh3pfH2mchEHnh2i48iwpoyfsLI0oUhD5BqNP5h7B0M9R4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796578; c=relaxed/simple;
	bh=Q4JU9KpIqco4E3X/lHGLuCUuN5OWqYKKu0TR1+mWIxs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RowneaS2lzrvuc77iZH6NHuGTMz2CG2RgHFW9nvp72LMga0IFoiSyd4b4LQ5VH0oDEYT4kNRq8Gl01Wlui6AbrKMUkfCgh45hnIatJCnV/1IISw2qEAfvCUSxdiLGOl5FYhz1skSuxEbK+1frMm50PfbLJv8dtZRchABr5Kd7M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KXf0mKLq; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KXf0mKLq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6FDF24E411F9;
	Mon, 12 Oct 2026 09:16:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 42153601A6;
	Mon, 12 Oct 2026 09:16:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E357711D70194;
	Mon, 12 Oct 2026 11:16:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791796571; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Sn02TEo+skQseKCCe0yo8KhgJfoqXwV2TUHXH7rQBWA=;
	b=KXf0mKLql10uD4xoWayinX/w7giW5N1DhzeCpDfhSH2Ar+LXhSl2h+3/4TqW+6jqyWkC2n
	/RyNNV0foFL7k4c5Xo62zooWLmCByvAoJ5Pps1vCoLCSGgoph8BHC7LUr9HoyOfgzB3/yu
	Uay8MY6vA0QIhXn9JZIaAbXDLdVw7M8ET3B4z795XuTv+kl6TiTCltwOsFwU7HaHssVAzF
	rSLTvqSDckV0ZrnkueeOv+gZq9lliLhw8qyQMwos9LYKddwYn2AfhUiW5Pivl0wKpCtxSe
	w/2j7BSL1sbGLOFW4Y6TIiM3RPBcUwqQ2R72bEmIcyHnFq+bEbY1avnsiQTkBQ==
Date: Mon, 12 Oct 2026 11:16:06 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Daniel Lezcano
 <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v7 0/4] timers: Add support for RZ/N1 SoCs timers
Message-ID: <20261012111606.3784d993@bootlin.com>
In-Reply-To: <8eb0b435-e5d4-4429-a807-24e15b0659fa@oss.qualcomm.com>
References: <20261001082225.125956-1-herve.codina@bootlin.com>
	<8eb0b435-e5d4-4429-a807-24e15b0659fa@oss.qualcomm.com>
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

Hi Geert,

On Fri, 2 Oct 2026 11:49:49 +0200
Daniel Lezcano <daniel.lezcano@oss.qualcomm.com> wrote:

> On 10/1/26 10:22, Herve Codina (Schneider Electric) wrote:
> > The Renesas RZ/N1 SoCs family has two timers block controller
> > available.
> > 
> > Each controller is charge of 8 timers (six 16-bit timers + two 32-bit
> > timers).
> > 
> > Each timer has its own interrupt, its own prescaler that can be used to
> > divide the clock by 25 (timers block are fed with a 25 MHz clock) and
> > all timers can work in either one-shot or periodic mode.
> > 
> > This series adds support for those timers blocks.
> > 
> > Best regards,  
> 
> Applied, patch 1,2 and 4
> 

Daniel applied almost all patches of the series.

The only missing one is patch 3 which has to be applied on your tree.

IMHO, we have the green light to apply it.

Can you consider it?

Best regards,
Hervé
