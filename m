Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB40C481FC9;
	Fri,  4 Sep 2026 10:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519287; cv=none; b=DRD12cAEuObnM+GQ/HAwrqpemU4/PnREpjH35rZ7pWVchurF0ZD4wDv+R7tV3NxOGG3UzM9EoL8lt8lbD/ZKp/bwtP/Z+RdgcrgELMRR/TYSDnOCGqJ+Ts0uZIs77SsCDLVOHWQSb6aEqYk5bUU0RF+dZ9YKlQctGNTQfRHk0Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519287; c=relaxed/simple;
	bh=0vXi4sTWwwejFmubENVNFUoP5Fs625tkRrB7WOkTw10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tcXh6zSdzYp8/vfrX5tx4xSwNZY6wefPLEAAub99izdwjJ6xN/01+NG2j0tl2QEMeCiGzXD3QtaFKAisVoqiWhj1jSyp0I2GhMtdb+mwpIPBPB26pv5ul7J+7RTUdIsTkyfqQ0du+QI0QiZ63Y1+beC80gR7MLDXZtuo+xHUhKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=V3+nX3+d; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=q0Qjfy7Z; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="V3+nX3+d";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="q0Qjfy7Z"
Date: Fri, 4 Sep 2026 12:54:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788519282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5NZkbZfp4QWxq6NIlGw0GUtfJE7/9+ScOiFCYA8JVFU=;
	b=V3+nX3+dicgX0EdZFKSsoPUtS1mpf6m3jZmiy99PBeEDoL+7yaIxWWlLzWOsSzF3Dm34sm
	OBQXEXK55pW33YQgXBliVZLSs1UJ7UDgENPmtM30IaX5oAz9zRlTet17nlV2MIJxsSbXaI
	YAKv94l2EbIQpZ6ZRNIAHBA618vbVMXWLEhxOMfiq2l2pI2tq32X1hU0kqDkBZgKkf+KO+
	bseqYFHHWZVjJnDTYSS9nEpN8NFDVnHLh1/z3h2KNu0NZXHWBJxINzMQUiDyFterUNT5wR
	vZfKHz0YW8i8RNECZMOwCgHB39Kzf+Zhii2QcGxlRiR+vp2cK9a61tScgWKVVg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788519282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5NZkbZfp4QWxq6NIlGw0GUtfJE7/9+ScOiFCYA8JVFU=;
	b=q0Qjfy7Z4Y/z6m3z8RSkHYN3a7Y18qDnT/VCW+8eyKAEaQ3eS1i86ezFykReHCm4rfq9O5
	6rXnMrrJzU5/z7CQ==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712-rpi-5-b: add spi0
 interface
Message-ID: <i6fbcajsiol77m6x3dbcay6bgpxwhy5axayb2633yklxl6rswl@luknor3eryoo>
References: <20260904-bcm2712-spi-v2-1-6f8fdfb030bc@linutronix.de>
 <apqej5QyjOHu702A@apocalypse>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apqej5QyjOHu702A@apocalypse>

Hi Andrea,

On Fri, Sep 04, 2026 at 12:33:51PM +0200, Andrea della Porta wrote:
> Hi Gregor,
> 
> On 11:24 Fri 04 Sep     , Gregor Herburger wrote:
> > The Raspberry Pi 5 routes the spi0 of the rp1 chip to the pin header.
> > Add the rp1_spi0 node and its pinctrl node to the devicetree to enable
> > the spi interface.
> 
> Just a nit-pick: in the comment it's stated that the spi interface is enabled,
> which is not true since rp1_usb inherit status="disabled" from its node
> definition. This is fine because the user would probably want to enable the
> spi interface through some overlay, so no need to resend the patch (at least
> for me), so:
Indeed. It could be rephrased to:

	Add the rp1_spi0 node and its pinctrl nodes to the devicetree to make
	the spi interface available.

@Florian: Should I send another version or do you want to change it yourself?

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
