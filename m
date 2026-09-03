Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90260418359;
	Thu,  3 Sep 2026 20:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788468108; cv=none; b=qJg942bjdvZy8MWmPP7CHtKqF2Pt0w4bPYaa/ZoI+GSTCnmxdJGwUJ0vBMcG3XrWLacD/6Vo7e9j6gcFo/fJPa6NQV3J4q/9p2JoqLduVSU8BqK+2glWXvxZBcAXUUf3bfkFnbISxnRV9u3CQ1BlkqT12FiLz98FNwI0xIQgKPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788468108; c=relaxed/simple;
	bh=NqyIGK+O5ocorzo2yhc10+Tv/MX+mm1YvI1NCBSTNng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jxs3CmsmjyZ2zPfb3NR8MjYmkIRM3k8MUUXNA+Y+zi2cQftxv8QI7TkxKf39EZ+ENLktLSKotpU47heLKigFnSJLBVXjTqJKTYS14OH+Yal5mNyShDEUE95w6nMpa3MdzrIJavAmbDdjnlz/XmmS5JNR8Xj2akkH7WewOP6Yr6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rKjHFff4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Br0CgB7S; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rKjHFff4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Br0CgB7S"
Date: Thu, 3 Sep 2026 22:41:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788468091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y90Zr17wPFXbQNnQbGLpq2yfTWt1N64WXzYbYu6dZRA=;
	b=rKjHFff4irgeLi/nqMI1Q+g3qSGSjuZyes/PVnO5xczQg28iOim2dXqC9bR3giT/odFLHt
	TNIoBcte5o97MowpB3nvWmkvKPJLtFCZUME2TIf29sptxpIdR3yjqlWk6cDIBIQOSypWqB
	rd7JUaTGq5bf41y0lRSMpSVPsncnKE1UXI8jJK4F6iEb3d2Xkjt11f7sdfWaUYjt6l+wOs
	LVIq2O3RoN4UbEPwIEYmt5B7JBKGxJWwqz2pE8H1f7d2xzRWMQ1ghDeqsd8AxhKevXXTJR
	vJ2ZD7ncqyv6+ooiguL1M2k4sUc0FSDmNxB1qzAjggTOxdCUhhzoV+nN0wUPsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788468091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y90Zr17wPFXbQNnQbGLpq2yfTWt1N64WXzYbYu6dZRA=;
	b=Br0CgB7SH1VZupqfU9Hn/TFxuue8v+1Y9gDgTBZ8BEYHrRB9B7ktDWH+VrcULmvhp/yG48
	N4CD7qD1gmsyaRCA==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Eric Anholt <eric@anholt.net>, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v3 3/4] firmware: raspberrypi: Add reboot mode
 support
Message-ID: <zgmvpqmjhtmk3mcbqef77zec3iitei2kx7qbyz4hqtcog66wes@vkv5cspi5vkg>
References: <20260903-rpi-tryboot-v3-0-ce94c347e932@linutronix.de>
 <20260903-rpi-tryboot-v3-3-ce94c347e932@linutronix.de>
 <95058f69-9d38-4367-aa8c-dffb0ea0ee54@gmx.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <95058f69-9d38-4367-aa8c-dffb0ea0ee54@gmx.net>

On Thu, Sep 03, 2026 at 07:55:53PM +0200, Stefan Wahren wrote:
> Hi Gregor,
> 
> Am 03.09.26 um 16:48 schrieb Gregor Herburger:
> > The Raspberry Pi firmware has a tryboot mode where it tries to boot from
> > another partition. This can be used to create a A/B update scheme.
> > 
> > To enable this on the next boot, the RPI_FIRMWARE_SET_REBOOT_FLAGS
> > message must be sent to the firmware. Add support for this by
> > registering a reboot mode driver.
> sorry for the delay.
> 
> Do you know the consequences in case the firmware doesn't support
> RPI_FIRMWARE_SET_REBOOT_FLAGS ?
>
No I do not know what happens but I afaik tryboot is supported on all devices.
At least the doucmentation [0] says so.

[0]https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#fail-safe-os-updates-tryboot

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
