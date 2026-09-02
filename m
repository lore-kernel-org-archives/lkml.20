Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026E31DED42
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 02:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788315808; cv=none; b=XWDeJajfsGCois89pD8/upkjkGkEY8PMkX7l2RDKbX7OYRsnkJ5pP1CVr++zkx2eVog35tQwUNVpEiwi5FhX1bZm4S77nTNuVsscoIWPugLElsHIGEw8wW3g4K0lnXNNz862SjqpDb5dw4Oi9CYlPQ0BjCkqQ3x/w7K6nuPTq2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788315808; c=relaxed/simple;
	bh=71s6kV+3+SatzLiCent5brwtAlqxEKg89UyuSOoXyFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0uaOD5D2tIaYrJAD7g2v/SaXJMQfX5LTH2VSpRnLlC+0N2p4qrdb1ax1q11aGqcpv7WwUmiji3kPpH7DqLtEKmFa94jBXzwApTnPAwEvB7pkDNWHcfyxyL9/kRM9ES1wR2/nYcLLLVySJ+JeW0z2u6j7wQ0biQgvJGI5GEWzWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=CgEgoLev; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="CgEgoLev"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 47DCA40E02C2;
	Wed,  2 Sep 2026 02:23:22 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 4JQ91KQNQ8vV; Wed,  2 Sep 2026 02:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788315792; bh=jfCVfD5mxA4XYpFOUPAvDgv0DDF8TqB64epcP9fRjSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CgEgoLevpdMwoP3Izq8/JrDWyegSVnvTYYWZcCkLVsVZo0twKtTHq29nl3aBl3wOz
	 /O575OiL1GsL8nQI3Qbfp1lt1/TZPQq7Iq/tW6tTk2pubRom477dTgONW3dmy4ZKeg
	 S2Jam7XWarMj3c13GnNBtpqdk54y/3KJZZOWl6I11rpjRdA2fPyEqLfyfJci7NSURp
	 Sk4lGysa/mhERpZsqnFZrEAYFX+JiTKmTgfFJkQ0SIdu1qYwmsIKLWXCuHpw3GowcU
	 9TKi+9ZRwvg407ztatXc+wa2W7ZHUJ+2569xEF09T1MZcf8QVX8YnMEu+AMSRuyPZQ
	 pBpBdxnoT30U1gVLvhpGirxab73+SZtlbB8jmu2SmBZq2sGqVr1ZQW3t/ZAgu50ryJ
	 I8q7AxMhlskjXd6x7inCGaYhwVJmaxwczQHTULw6nPKYW0y5BQdtzFBkuV8cU3oTDY
	 Ts2yHBE24qGI/s74EZfjaAyS1RH3N58UHXnd5PmnIIh/cx88OY8navi6yvpWTpbg5s
	 zjRnFJ/nlU4KshrQxMHnHvcPCO8NEG/Uap+ybbQGKeVHumIwidKei2JrdWpDn10HJm
	 5u73ForDuKfX3FWnJx49pdv5HEZi/PL9cJN48r6YomWsmIPr2eTDD44pbR7iVG009+
	 2DnTIKd5jhcTkzwjFNoNb9us=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C6ABD40E027F;
	Wed,  2 Sep 2026 02:23:06 +0000 (UTC)
Date: Tue, 1 Sep 2026 19:23:03 -0700
From: Borislav Petkov <bp@alien8.de>
To: Kohei Enju <kohei@enjuk.jp>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Dan Williams <djbw@kernel.org>,
	Nikunj A Dadhania <nikunj@amd.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] virt: sev-guest: Fix lifetime of message descriptor
Message-ID: <20260902022303.GFapeIh9j9-gH0zVuR@fat_crate.local>
References: <20260822-sev-guest-mdesc-lifetime-v1-1-b489d434796c@enjuk.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260822-sev-guest-mdesc-lifetime-v1-1-b489d434796c@enjuk.jp>

On Sat, Aug 22, 2026 at 09:35:03PM +0900, Kohei Enju wrote:
> sev_guest_probe() registers the TSM provider before assigning
> snp_dev->msg_desc. Once the provider is registered, a concurrent
> configfs report request can reach get_ext_report() and dereference a
> NULL message descriptor.

How can this happen? This is a driver probe function and someone must very
quickly do that configfs report request?
> 
> Additionally, sev_guest_remove() frees the message descriptor before the
> managed TSM unregister action runs, allowing the provider to access the
> freed descriptor.
> 
> Assign snp_dev->msg_desc before registering the TSM provider. Add a
> managed cleanup action for the message descriptor before adding the TSM
> unregister action. Since devres actions run in LIFO order, the TSM
> provider is unregistered before the message descriptor is freed both
> during probe failure and driver removal.

Can we get rid of those managed actions instead and do proper unwinding?

There's a single devm_add_action_or_reset() right smack in the middle of the
probe flow and I'd prefer if we don't add more but have proper and balanced
unwinding.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
