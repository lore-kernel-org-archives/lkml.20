Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AA4348C4A;
	Fri, 25 Sep 2026 04:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311127; cv=none; b=V4vkpwy2tMgw5vclmcdU5yL6bEqP9EW1rDHMcbB9/hUOcjxG86ihRFauMdJZIdr4NlB3Yticz66sA12s7TJ0YwVyCYknX6kff398bFk0h6K7Fa1dCZOK3+IQxvFWMzBm75Zjw4DhQSsF5lvE6FGaY6HUDWSCu3xMJi4aVp1DN3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311127; c=relaxed/simple;
	bh=T2+UtO+c4TIDiF6rVGPoPln8hlXZPztRsDrxoR9HUAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EopISfbrIbiF32iZd4cgXF6FrPKYUz1JDrM4/u3W/FYmMJ7fNxCav/h/2qizLgxO3dBh/KGSwTT4dvYKoEdhzZDdoztGptLGfZL2UTxj+wbzCVx+7VFNXO9LuaFwIAiTsJ+wUHkJWVFE/bfzIfgy+h3KsgVG9RTcVQt9awvNYXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=dnXuHAxR; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="dnXuHAxR"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 297C140E021A;
	Fri, 25 Sep 2026 04:38:40 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 839XkFG_kSRT; Fri, 25 Sep 2026 04:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790311110; bh=w9hb24ibBUepNNwdcwsLaUiILM7arKSHAZS/2HLosAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dnXuHAxRy2Uifyw1iqToiz9IZzF+rwy1rTlG1Li0bqoboQukd8kqJuFyDs27HqkPL
	 Qoi7REU3efRIMBV+4tPDpWxDGBJ/I8rO9tWdgoy2oeuntSiNF+FIGG5cpJXs1H/jT3
	 prt5VFPzUbqcWZAKnTP9LLJCiGGFqKUu3kWzuBk3AeruSMSeTKptkundmdpw6szDWb
	 jq9xvHqcsxwthF7Y6/giqRgkpaecyYPTsnd6DtPqR6QACtthZbOKm3Lq37GyLcQXgD
	 Nysc2+COTXIC8IVTRBB1ca5M5cJjtOCbJf8IO7yHOGH1uz052H3BhrTAt8IkuvwmUl
	 o9W8WKMeaqw5HuhcpxV3XA2T6aAmA6tleQhMZjwW+SbQYWoYv32JLrUKl7yYOL6QXs
	 /6xQdUL2L/KUH1UK2/3iVOQPGu2x3n5W6fNdRoJzXOOZ42k8fYT/BJQBxy3Rhv17MT
	 FwIbHMapgHfQ7XD4b59yP33i7E/8lMHMnU6MM7h8SjsxMp8hbSxtbN8jODd9U5vFMV
	 DOPdnXJHPur9nqKEe4/L7hJX320nJwFmoL3ZnAgvqVQMAEgYXNDvEjMSubv+6I7LF5
	 OsOq3VG4mQZeyJVMksiE4Qk3M2I7PVJYuMQX7g55OoWfqxPC8CAJx18ZRcM/b5h64a
	 tU7Yzk02WB3tcUBdiQyjQk3Y=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C265540E00B9;
	Fri, 25 Sep 2026 04:38:24 +0000 (UTC)
Date: Thu, 24 Sep 2026 21:38:21 -0700
From: Borislav Petkov <bp@alien8.de>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: tony.luck@intel.com, linux-edac@vger.kernel.org,
	rounakdas2025@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv5 0/4] EDAC/altera: Address sashiko reviews part 1(v5)
Message-ID: <20260925043821.GBarX6vdJ1WucqPuvN@fat_crate.local>
References: <20260911120627.2634225-1-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260911120627.2634225-1-dinguyen@kernel.org>

On Fri, Sep 11, 2026 at 07:06:23AM -0500, Dinh Nguyen wrote:
> Dinh Nguyen (4):
>   EDAC/altera: Do not allow driver unbinding
>   EDAC/altera: Drop __init from ECC setup paths for re-probe safety
>   EDAC/altera: Fix code leak on dci allocation failure
>   EDAC/altera: Fix use-after-free in error paths

All those are marked for stable backports but the last three are fixing error
handling paths. Are they really that serious that you want to backport them
everywhere? If so, which ones?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
