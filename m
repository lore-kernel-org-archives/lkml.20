Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9163E3D80;
	Thu,  3 Sep 2026 20:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467524; cv=none; b=oDeVAKQMbqu51fbn+OvbSd+dFnB+rwc+RI7EPju21HCKTJS6ExSQo9IjfjHVC7FylVevKK30O7TrK/75H9SdgO93zRme4gFjhE2DVD8QF2UOK6qiQqF88mytuqkJi6LJrYURVJIEssm5HuOJbpaHV87OSylG/mk2xscNlTFiZdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467524; c=relaxed/simple;
	bh=N+iJOjYWDEYF/A8iOrTnPS7U7qL5ueGDQ6IlXwuRZwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhK88kRzL8uvV9bd9/pKWKrYr6j/Kor3IAVQmqd+/XcaCtpHf85rNcRyqNvo+Ob5chjK9Q3Z0nQpA3GQfp5mlQaTqDwbU8rAhc2sUPo4CRXCn/Dz4ROC+Ogec6ZlRy/5QruBsnXmcaD0KwoWV1x/lrdyP3Q/dVs1GcA8ZWyNzAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=N8QAsxcW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QknhE9zh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="N8QAsxcW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QknhE9zh"
Date: Thu, 3 Sep 2026 22:31:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788467509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6pnDx8fNJobN9rbe3wNwxHqZd8eR6bqb/8fO1Oo1YFE=;
	b=N8QAsxcWwwdlcbXC/1gZYHLdz20tGbSKaPShPKii8yExQeiJbkjDjign6PQZaIuZqhLBpd
	tj46UtpqaA6LZZkvyRuIAnz3/9STTfU4hlsVQcSv6Cbvhu+AplU2IzSycqQ8ctF0NxJVLZ
	FFsYcw3gq/zyH4nA5ChVxCy+sEUrzXh78CM+hT4yLhRi5oB44BVGk7G9WNEJj/AnjlcRsW
	7XAtQDDVTC4Xl3+vy4wuvZvApizApuHmRyttbFd6nO42jbwnj9MzVunGbDjTT7zm0Nn8uR
	MAEZeAQn2a0iRzek6mgEz9b7+J/gZvfbDF51yuqeoJDHC371ft1Jcbtka9Nxng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788467509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6pnDx8fNJobN9rbe3wNwxHqZd8eR6bqb/8fO1Oo1YFE=;
	b=QknhE9zhIuoEYMZn/xI0i+3CR53zw1LZpaisgIVS4XOEU011yFIRRgVTc3vL22wfINo1mE
	4W0YI2+fPhMRo8DA==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v3 3/4] firmware: raspberrypi: Add reboot mode
 support
Message-ID: <a35cclkfw7w5b5dqgitnewfrw56ouwymkra3jmxbbtynrojghc@bzkz4xnrztur>
References: <20260903-rpi-tryboot-v3-0-ce94c347e932@linutronix.de>
 <20260903-rpi-tryboot-v3-3-ce94c347e932@linutronix.de>
 <f85ebc81-c9e8-4014-bfed-66f9570eb1d2@gmx.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f85ebc81-c9e8-4014-bfed-66f9570eb1d2@gmx.net>

On Thu, Sep 03, 2026 at 08:08:22PM +0200, Stefan Wahren wrote:
> Hi Gregor,
> 
> Am 03.09.26 um 16:48 schrieb Gregor Herburger:
> > The Raspberry Pi firmware has a tryboot mode where it tries to boot from
> > another partition. This can be used to create a A/B update scheme.
> > 
> > To enable this on the next boot, the RPI_FIRMWARE_SET_REBOOT_FLAGS
> > message must be sent to the firmware. Add support for this by
> > registering a reboot mode driver.
> > 
> > Furthermore, safely registering the reboot mode requires adjusting the
> > teardown sequence. Replace the manually called rpi_firmware_put() with a
> > devres-managed called (devm_add_action_or_reset). Without this, the
> > cleanup function of devm_reboot_mode_register() would trigger a
> > use-after-free error by attempting to access the firmware context after
> > it had already been freed by rpi_firmware_remove().
> > 
> > Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> > ---
> >   drivers/firmware/Kconfig                   |  2 ++
> >   drivers/firmware/raspberrypi.c             | 40 ++++++++++++++++++++++++++----
> >   include/soc/bcm2835/raspberrypi-firmware.h |  2 ++
> >   3 files changed, 39 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> > index bbd2155d84838..34605bf7c9734 100644
> > --- a/drivers/firmware/Kconfig
> > +++ b/drivers/firmware/Kconfig
> > @@ -115,6 +115,8 @@ config ISCSI_IBFT
> >   config RASPBERRYPI_FIRMWARE
> >   	tristate "Raspberry Pi Firmware Driver"
> >   	depends on BCM2835_MBOX
> > +	select POWER_RESET
> > +	select REBOOT_MODE
> >   	help
> >   	  This option enables support for communicating with the firmware on the
> >   	  Raspberry Pi.
> > 
> this part doesn't apply anymore. Did you rebased against 7.3-rc1 ?
I have not rebased. I just sent the series out again to get some feedback. I
will rebase it and send it again. Sashiko found an issue anyways.

> 
> Best regards

Best regards
-- 
Gregor Herburger
Linutronix GmbH | Bahnhofstrasse 3 | D-88690 Uhldingen-Mühlhofen
Phone: +49 7556 25 999 35; Fax.: +49 7556 25 999 99

Hinweise zum Datenschutz finden Sie hier (Informations on data privacy 
can be found here): https://linutronix.de/legal/data-protection.php

Linutronix GmbH | Firmensitz (Registered Office): Uhldingen-Mühlhofen | 
Registergericht (Registration Court): Amtsgericht Freiburg i.Br., HRB700 
806 | Geschäftsführer (Managing Directors): Dr. Wilfried Wessner, 
Katharina Kopp, Alexander Gieringer
