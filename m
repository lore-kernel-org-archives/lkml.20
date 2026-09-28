Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C20645D925;
	Mon, 28 Sep 2026 07:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790580516; cv=none; b=q6jfGWmQIiU/VcGltA12153oL+xi7EPrxni3BF2LfbYZwV/4A7l83WsMBdFTupXyWft5YxzoICSf+/AWGFwIUCJBAj0/lgSUkGnCg8kyPNZmoKW7EJq9Vl+sbcAxEljjlnIHM4jMxydmTKTToDcKNRCgRvsDL/3OUH3brAXThxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790580516; c=relaxed/simple;
	bh=m1u8QkGLW0KIqQ+GoIAPkeqJktyRU9Kn3cqAXDDFtFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4ePiaMKHSrk/Ayx6VP7PIOaM6jAzXOLA4VQgMKE5BFlbLHEaWbIz1LUrQswCKH5rLZt8dDGMvG6DB69binPDHEL5l0InDyCidlkdarWWOxgvGN445fmuiubLKKeFdqtVQ+BfRIFTaEkdbvz8jQIpr0pH8poEiWTqSDkiJjMN4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=l5Wi5KkV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XBMuDDRQ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="l5Wi5KkV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XBMuDDRQ"
Date: Mon, 28 Sep 2026 09:28:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790580510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DVxdq8//FM3NRi4orw0PRtSQhnfVCCad5P6oHOhCXp4=;
	b=l5Wi5KkV34SIYibgi7B1IIstb/CHwUtXk9ntnhluuJEfQl1OT9Jea26ThlOFLanwk8jFDB
	Zti8t4ScB5D0u77XW0o4XoikwtgWgBxJ58pMV+VwObaKQ7b81scqrrMQi1/+NINz2GF6nz
	Hu/hsGc6nTil/mW7lKd5RZyMj2NFmiSXl9IGyaZmDVNgg/ObHdBpsyZGXOLbiRFo6l+bgH
	rDk5p6ciBzOm2XFphPfOtHtExMARfCs4l2HjIfP0v27qG18/QrsT3MdsWgNwv2W1FIc/67
	ysOcpAqywlSDq3HwzpDmYFTi5kg59oiQlSONUWpHPMOMo6uBKSvzDrtGQjaGYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790580510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DVxdq8//FM3NRi4orw0PRtSQhnfVCCad5P6oHOhCXp4=;
	b=XBMuDDRQqjW8J464HX5I9r7EJFwcjgmNayJJ5ouWzp00LpyydwKh3mImP13GgXqwP0h/RO
	s6R4E0RpBI0IHRAw==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>
Cc: linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/4] firmware: raspberrypi: Add support for the
 tryboot mode
Message-ID: <stvm3nzpcde6ukl35wfnukyztp7r2n2yuzjwu4brrumomzemfa@kazuwkb75e77>
References: <20260904-rpi-tryboot-v4-0-fdee8bc53ff7@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260904-rpi-tryboot-v4-0-fdee8bc53ff7@linutronix.de>

Hi,

Just a gentle ping on this series.

Are there any outstanding comments, or is there anything else needed from my
side to move this forward? I would ideally like to get this picked up before the
next merge window.

On Fri, Sep 04, 2026 at 09:46:48AM +0200, Gregor Herburger wrote:
> This adds support for the tryboot mode on Raspberry Pis. As there is no
> documentation other than the downstream implementation [0] the
> implementation is based on this.
> 
> I tested this on Raspberry Pi 5 and therefore I only added the
> properties to this devicetree. But afaik this should work on all
> Raspberry Pis. I will add it to the correspondings dts if I get some
> hardware to test it.
> 
> [0] https://github.com/raspberrypi/linux/commit/eb56da0c1925c07e8929ce4c9fe8aeafa7cb8c7b
> 
> ---
> Changes in v4:
> - fix use-after-free error by moving devm_add_action_or_reset before devm_add_action_or_reset 
> - Rebase onto v7.3-rc1
> - Link to v3: https://patch.msgid.link/20260707-rpi-tryboot-v3-0-fda82fe7ed76@linutronix.de
> 
> Changes in v3:
> - fix use-after-free error by using devm_add_action_or_reset
> - ensure endianness of magic byte
> - refactor reboot mode registration into separate function
> - Link to v2: https://patch.msgid.link/20260630-rpi-tryboot-v2-0-f68d2dc6aa27@linutronix.de
> 
> Changes in v2:
> - Remove unnecessary reboot_mode_unregister().
> - dt-binding: restrict to mode-{normal,tryboot} and only allow 32bit value.
> - Link to v1: https://patch.msgid.link/20260626-rpi-tryboot-v1-0-490b1c4c4970@linutronix.de
> 
> ---
> Gregor Herburger (4):
>       firmware: raspberrypi: reorder rpi_firmware_property_tag enum
>       dt-bindings: raspberrypi,bcm2835-firmware: Include 'reboot-mode.yaml'
>       firmware: raspberrypi: Add reboot mode support
>       arm64: dts: broadcom: bcm2712: Add reboot modes to firmware node
> 
>  .../arm/bcm/raspberrypi,bcm2835-firmware.yaml      |  9 +++++
>  .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  2 ++
>  drivers/firmware/Kconfig                           |  2 ++
>  drivers/firmware/raspberrypi.c                     | 40 +++++++++++++++++++---
>  include/soc/bcm2835/raspberrypi-firmware.h         | 22 ++++++------
>  5 files changed, 60 insertions(+), 15 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260623-rpi-tryboot-4292c92b0727
> 

Best regards,
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
