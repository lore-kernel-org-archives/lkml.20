Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0E23C8C52;
	Fri,  4 Sep 2026 03:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788493103; cv=none; b=nqNXNHEDYK2KPaHgpi4HLz+ElKi6JaNWhHUzNZ0SS1yKGkc0pN92vA8GA6G+yKRHiXE/bbR3DJ4BVwdYGcf2vbd/XrThP6qfk1Qzv1PHgouQD8sgO6l8TBMEc2EkIU+QYOWycV3g4CsXBQRan99JpmeXtabeAcIZW8PasRnRs8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788493103; c=relaxed/simple;
	bh=B/Uwu3tSJCx/BGi14uLQD7KBnCJ9U1h3zvdgO7QlpK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HlGHiKxR9NgQZF2in3QArkSzZWCfEGPPju4vVjHM8QWD7D7Mcze6r29hzGF05JIM/7+L/JGyJxNgark6Bkxx7nEVnOzePwO47xk8DF/JKrShIVWSbKNHNFE/K1V0HiGyGdNv6iossXblrNgQWvWu33fN+13YXfj9laRRLwYNJEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Z7s8VEGG; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Z7s8VEGG"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3719A40E016C;
	Fri,  4 Sep 2026 03:38:19 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id OunsccZEpS6a; Fri,  4 Sep 2026 03:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788493089; bh=puQU8kxmxcVlZJ33kJImb3eTEgEbDYI/ctH1clNKuRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z7s8VEGGVGNdr03uNrd96I2wtGpHKZ8FXvGtwCm89Igi4AoWxSUuxBOrt55qH/wme
	 52QFiFEO6iavP5aJOq+MTUekz191tC7puYD38DuCcad3FeKhHiORwKjNcQMfxfa1cr
	 HM4gnLJMn5YfYrDMjH9Tb/GVT2FwhakvbHyMbY9+7qjx+TOyLt+2WrWrwhZAZv/852
	 /aJAdiXktBL0Ikd/DmOOukjgL8qUDSn0O91/wZhHs1rOLQrqmuI0EZjdJAcz2zPBnI
	 53feFWzvRaLp0TQQFlEmtz/zzjkOmh6Xgu4iaXfntnUzUnQQLczfNKEZOoLZ+NIoUa
	 LHX7+Z3h20SzwOU5EmVrwwOv9A3J4cgeXg1AGEn+IlCO9mTNFa3E+h6zN4qxmW9ncr
	 NcITqx+cfbmv186YVAE6NiV/JU+PmiBr+kQ/+BkYFNJYzL14OnYrvZ7Ac8sCSU754E
	 PLXGFwKF8o9Ed46XzzqKn3ZD7D4dm68vL2ZRKjBKdbkV0sU3EQ9HLz2SOZWNCbL2te
	 lu8/AayQg8Pao0P9DUeq//3NP6ZZjCakudWlrisMUaLoTUmmLNQ7HjxuFtYgpPEq/D
	 HcX8x6MS3hGNC2tWKKHlEVvqOtMXbl9UVuyZhfyDbd67U8GXDRUsULJjwkx332iRze
	 Fht+vggHmVFBILqhx/V0d+Oc=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8CBD240E027F;
	Fri,  4 Sep 2026 03:37:54 +0000 (UTC)
Date: Thu, 3 Sep 2026 20:37:51 -0700
From: Borislav Petkov <bp@alien8.de>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Ben Horgan <ben.horgan@arm.com>, x86@kernel.org, james.morse@arm.com,
	fenghuay@nvidia.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, tglx@linutronix.de,
	mingo@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com,
	corbet@lwn.net, linux-doc@vger.kernel.org, dave.martin@arm.com
Subject: Re: [PATCH v5 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time
 conversion to be per-arch
Message-ID: <20260904033751.GCapo9D5ZZXWuQkIpc@fat_crate.local>
References: <20260709093111.367851-1-ben.horgan@arm.com>
 <165e7636-d7e9-4d16-aad1-657b4a9698d0@intel.com>
 <b0a7035e-7ffe-4e22-a4ae-a177640234b8@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b0a7035e-7ffe-4e22-a4ae-a177640234b8@intel.com>

On Thu, Sep 03, 2026 at 08:40:48AM -0700, Reinette Chatre wrote:
> Could you please consider this series for inclusion during this cycle? It applies cleanly on
> top of v7.3-rc1.
> 
> Please do let us know if you have a preference for how changes touching all parts
> of resctrl (filesystem, x86, Arm) should be handled.

Lemme have a look.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
