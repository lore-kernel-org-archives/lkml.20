Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D20548641C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966999; cv=none; b=oagfUwQbjoFZecRh8q31eUK2FuA+a3HD6JLrhlPIV8WiNquFT1fHQykkFJp1ovi/jXpndF1wqsAA0fF4Uq+7PM/nxTppYOUVg2Lxo8+YbXahSBEomPfp1T3Md/khlyYLts6x+26vxZ2P7X2yKbmQ71AY3wBQGieeTO6VgsZekxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966999; c=relaxed/simple;
	bh=AmkKhagroyTrfnY1UehniY27S8y3ZQdzENbUkvimUcU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eMsVQSjiAepy7/DORl50336HeEKSSVBa6otzG/E5ikcwVD3RiJ3IHhkDcR807nu8TIJixlNVn9jHdmpdf9WY3oEz1XnbmAZoRnYXNaDrRTz+JmpTKSjWJBDWdHiJlBIbfvUzmuJEPODeX869SRaL4w6tfVQxjsTGYywhzlXOUh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JBp6AxJv; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JBp6AxJv"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 62AFBC63443;
	Wed, 14 Oct 2026 08:37:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73D2E60368;
	Wed, 14 Oct 2026 08:36:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2AA410328A40;
	Wed, 14 Oct 2026 10:36:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791966993; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=AmkKhagroyTrfnY1UehniY27S8y3ZQdzENbUkvimUcU=;
	b=JBp6AxJvp56jOjxN93fuSFzzVy7v+V4KlZeXAfa6jRLV9uyWrAbNDML472XbDxWUaNMrFO
	Hf29Y7aRcojyIMBA/7xHynWjXwM6MbsHsZjECXV0P0d3ShgkCGPVFlUVZ6MRK7iFaYl1NC
	3ShqlroitL43kWo4feCHSIYzit1sosXbACgNz0o2YrOgzExSIiwgoNNc3msTUr14aYaN3L
	EhnjMywzLnHUAFeDzEmS7+Zsd/LgNPrVhD10c01nfgQGTtGgGMCbn7sYrpbmLdZL3vhRaR
	tbg/GJ2HnyEbJMw2ybrYBcRoR8lKZJRQJaMJFM9oCEnJWT5L7pFh1gpYVWT+7Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <robh@kernel.org>,  <krzk+dt@kernel.org>,  <conor+dt@kernel.org>,
  <srini@kernel.org>,  <nicolas.ferre@microchip.com>,
  <alexandre.belloni@bootlin.com>,  <claudiu.beznea@tuxon.dev>,
  <linux@armlinux.org.uk>,  <richardcochran@gmail.com>,
  <linusw@kernel.org>,  <arnd@arndb.de>,  <aaro.koskinen@iki.fi>,
  <gregkh@linuxfoundation.org>,  <mathieu.dubois-briand@bootlin.com>,
  <michael@walle.cc>,  <linux-mtd@lists.infradead.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-arm-kernel@lists.infradead.org>,  <netdev@vger.kernel.org>
Subject: Re: [PATCH v8 3/8] nvmem: core: take a reference on dev.of_node in
 nvmem_register()
In-Reply-To: <2e21cc4b871da8764e3a12d0ebdcf7cb799149ab.1790847519.git.manikandan.m@microchip.com>
	(Manikandan Muralidharan's message of "Wed, 14 Oct 2026 12:10:07
	+0530")
References: <cover.1790847519.git.manikandan.m@microchip.com>
	<2e21cc4b871da8764e3a12d0ebdcf7cb799149ab.1790847519.git.manikandan.m@microchip.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 14 Oct 2026 10:36:26 +0200
Message-ID: <87qzhsznjp.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 14/10/2026 at 12:10:07 +0530, Manikandan Muralidharan <manikandan.m@microchip.com> wrote:

> nvmem_register() stores config->of_node (or config->dev->of_node)
> into nvmem->dev.of_node without taking its own reference. Callers
> that get the node via of_get_compatible_child() etc. and drop their
> reference right after registering leave nvmem->dev.of_node backed by
> no reference at all.
>
> Take an of_node_get() when assigning nvmem->dev.of_node and release
> it in nvmem_release(). Existing callers that hold their own get/put
> pair around the registration call need no changes, since get/put on
> a device_node is per-holder and independent of core now also holding
> one.
>
> Suggested-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
