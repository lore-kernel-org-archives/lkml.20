Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6847F352016;
	Mon, 31 Aug 2026 04:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152285; cv=none; b=QbHOKMY6/Zt19hPZAyq8gy6EeO8tBgYY2YWuZH5Fz3zzE2VAK1GXpDBk3nXC7v2+9ltjv1fmqcYM1r0u2vePgM19uRJHNq9US7TTZTeeKjU70Q084MizyWjW241AzeT051pf7iZt03F6fO6qVdhct4KNE3geUCMT4w47bJ8qjms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152285; c=relaxed/simple;
	bh=96/tAAC68rvcVuNxA2B1XMv7ZheF//EIw8OXspk+nyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QVjYxvMpl2OswMq7WnmO1ko7EL/8lEoiYnRjVaJEo6VdiUajG/A0i7F+623ZBYuUbZ+8dywkIouVjNRypACFjbvfN2cjjjOLlmQ8UMHZ3ObzNLtNw0FtFjyw4UfIT5D9NwmE1UV9hTW2Jq9yaGpViIA/pOA8QGzvTUZAnIdq+KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=h9mR8eNa; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="h9mR8eNa"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7778B40E01F9;
	Mon, 31 Aug 2026 04:57:59 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Zsd5TJJcqUEJ; Mon, 31 Aug 2026 04:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788152269; bh=xFrvPnNlLdUQjLHvIvqLAChpxkF69CgdvcJiHEyRuc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h9mR8eNafVwanBIlKOe2d7r91HlvjJru91BrwuItHFMaC+ABo94oHJjeD95GPylH9
	 TY2qD1G3dCcmaaAE9mufphbOhZdzfYve84jHQTBVoxialn+f/DPxxK23MCUgnIv480
	 E6A6XRg8cKIVoKHipfWA1WNH9Hn6RcIfp817gT0XfPkSSgH4XBlusCFdcF1OUhjop3
	 pvWD8SjG1gnweKB29A800zyl/YYG83j/kFUgBsllGw617+PVAYMvY+7ZkXgRmEYR8z
	 kmG+tuLWrDyavxc667zTx52km2+YR7cXX5TPlHzFkGW9iHFlTxC6snTMrFRgtuKx2u
	 92ik7Jf5i+3TrSDRhnMfQzH9UiRSncEfTWTrWJwXH7muxvtcpuBpf0gvnCioNsTLKO
	 ZtOp7lbrdw3bt7czomIGadbtgj5dB8jKDHgbndKvYOX74xDF3Cp/LGXjzFIqJdiCfS
	 eJhzRmINum1bTXbKUsNrQg+rge2ifoJMIHtkLjTzlPAbrB2lFJYNULtcIhT0Sziony
	 7NvoOHyUc0sx0Dp2OwWXqC/kk0LXTI9bC9niScA1v+0QMw++/FlpkWvuKTUddRNmRr
	 8qJD1asQfmPMEGAA4W+VD8EMZ8y15khgQGlzZWtINFizWwj82BAKLouFnjbYW//c7b
	 XUq9Y88Q6YV4j3elgaIwiG5o=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D3F3140E01DD;
	Mon, 31 Aug 2026 04:57:34 +0000 (UTC)
Date: Sun, 30 Aug 2026 21:57:31 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Breno Leitao <leitao@debian.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"kernel-team@meta.com" <kernel-team@meta.com>
Subject: Re: [PATCH 2/2] x86/mce: Add mce=panic_on_ce_count to panic on a
 corrected error flood
Message-ID: <20260831045731.GAapUJu0a1EK4i1t5p@fat_crate.local>
References: <ao2eT0TWS9EaA28N@gmail.com>
 <SJ1PR11MB60837D32B5D89336C87280A3FCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260825161625.GAao2_2d3U7xQFgHrw@fat_crate.local>
 <SJ1PR11MB60839657B965AC3FDA53C186FCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260825191555.GCao3p63v3fXzwa7E7@fat_crate.local>
 <SJ1PR11MB608315809B99B7194D167D8EFCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260825225202.GEao4ckknyv8nRc8Dh@fat_crate.local>
 <ao7nGM9sCQyxJvsD@gmail.com>
 <20260826160934.GBao8PvsM8M-U7XuFR@fat_crate.local>
 <ao8jGwH_mPDpACFd@agluck-desk3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ao8jGwH_mPDpACFd@agluck-desk3>

On Wed, Aug 26, 2026 at 10:32:11AM -0700, Luck, Tony wrote:
> The only problem they cause is performance due to the time taken to log them.

Yeah, and I think it is noticeable when you're working on a machine which
generates an excessive CE interrupts or drops into storms.

> Absolute numbers are a problem. Maybe you choose 8000 as your threshold.
> But then some system ticks along happily logging one error per hour with
> virtually no effect on system performance. Then panics when it has been
> up for almost a year because it reaches the 8000 threshold.
> 
> Perhaps it would be better to adapt the storm code to allow tuning
> the criteria for a storm and have a mce=panic_on_storm option?

But we already have the CEC. And yes, it is only for memory errors now but we
can expand it to all error types and we can use the bucket decaying behavior
paired with the page offlining or even have a per-error-type recovery callback
there to handle it all without any user interaction, no?

I mean, *if* that is really necessary.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
