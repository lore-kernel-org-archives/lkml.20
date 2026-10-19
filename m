Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792433752;
	b=weWPEUNB81VzVQU8ibxMU6G3q20mShTLtFLVAx0YOP7ZXdrZFwrpm3wGI2fPrz9ObG/K
	 6zdxwNATI2KYFI0VELicy8019phRX9xRe4viGJhy9wEsEfCFKvJpr3jLp5fhSJkGw0Qqa
	 4aa9wZTTFVr6HEvWDKkV7CVNeiAJ6yXxT24yTJqW7/zR1V6ycGVtkJTdxnMu5keepnuh6
	 QiKaJ6ZJ+MiZfgtKx2u/e8snrfWiwr9gj2L0IqQIAtAAyG2tpbDnWFyqFB+TTG/K3zGmU
	 g7XTORxk7yt996U3D3YaLDbg0RqRl+AzTp/BMMbpCRZgPH872+cNDHLpsGrkTZdkYCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792433752;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4w7YFTBtscoIjxgLMpx7cQ62ZcRL/yC92+hTKY2Gc7Q=;
	b=hUhBCl2bRJB6jkEZOgeuRT4m7TacjvMUDLGOdBW3CK/dP6CxlwfWu7CsHkycPYwXGEaB
	 klr4cjMppriFUdi6D1+W6+xO5pZhbhIwJlHWZkXrXRBqOTC60kCq7uatyYia1gspbGdh3
	 N86gIFNdcI/AW4D6fEsje453+exLnkI9Ico0ro1gu0VDI4nLUWXNlSyXKwta19Ps9mR1p
	 UfHTZwduWbgdE8lUAiMi7Sd0EPy7RnSnzVk+uYgz8qphqmN1jr5byQHkp9Z1wSsLngT1N
	 nJaCLLTjO5Zs7W4CRCBzRO4cnRBrKNDX89JdEpPMZpbqiQQQW52CKBm8pLMeRatPCxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=O8zf9CEj;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205A2606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 205A2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=O8zf9CEj
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5A2FB40E029C;
	Mon, 19 Oct 2026 18:15:42 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 2vR_LGbI_aXz; Mon, 19 Oct 2026 18:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1792433735; bh=4w7YFTBtscoIjxgLMpx7cQ62ZcRL/yC92+hTKY2Gc7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O8zf9CEjohQ3LUBYJVk4K44Xx8LNvFk/sIF0mu6AePh5AI6eobVCNOs7FEE4r2SbJ
	 c5UG6JaOdiR19Cnb8odfqiEUnkjOKIf0Ce2khTOpPwLVfv4icKB0811U21/szJttOE
	 NK3ex/bHxr9XZSKM0kOZBw4HXPBNR1DeD1LpjF4TV6pG03AI+eOvcCrqjFBLJsF1Ep
	 lNXcllkXMq7HmgiDT56MId8aZ0bRW/ocG+Jg7XuyKlZHcv4p0CTj49XwYAW6B9S42o
	 MvZOJRWPWlBHLFOd1fb4ouMv4rpNFy7p4ijHpeNujsFh5+tv23evVyenYy0P+rZIPT
	 fL+ZVZ5SyjQ/ZUsinA4qdHX/pQczzB14+xFlHSdl5KViBiMtztSYrALNuMteJtAJtC
	 9c58CzcXHZ8SuB2gJULlIn9wMK2A0baYz0O5KD3YEmYmxK09v2uMSJ3Fg5wrcGCYMp
	 XZWu00EW92jAoqikHBGwLp0MkdDnp5Gaf/v5c9Zgqgu5SAX5Bv+Wpa22/M+FIiG0yU
	 4sLaBAxm8dWvPdopS5uhadfeGS2Ld9IEAD9sPBpw4pDFQzmdJKD9bDsb5ypE+seeFB
	 egHsCag6kSSNTqeBb3RD6wVeEXnrhL4o3xHa9Ex7YiwNqtSyIQyS5dyBrx2sjullGb
	 MvXkaBiVi8hrhbKmjWOVSpok=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4EDAD40E015B;
	Mon, 19 Oct 2026 18:15:14 +0000 (UTC)
Date: Mon, 19 Oct 2026 11:15:10 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Nikola Ciprich <nikola.ciprich@linuxbox.cz>,
	Sean Christopherson <seanjc@google.com>,
	David Laight <david.laight.linux@gmail.com>,
	Rik van Riel <riel@surriel.com>, ljs@kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, david@kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Pedro Falcato <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>,
	luizcap@redhat.com, pbonzini@redhat.com,
	Tal Zussman <tz2294@columbia.edu>,
	Matt Fleming <matt@readmodwrite.com>, gregkh@linuxfoundation.org,
	sashal@kernel.org
Subject: Re: hunting memory corruption bug in 6.18.x
Message-ID: <20261019181510.GAatZeLtUmU3Zy9VZt@fat_crate.local>
References: <20261016054954.GEatG7AgMNFRkiTo1H@fat_crate.local>
 <atI_yuCc4BiweBQP@google.com>
 <atT5TYyLapHO5ZoX@pcnci.linuxbox.cz>
 <20261018201538.d0957878f378a9821852836f@linux-foundation.org>
 <atXXma5NXxoSWJO0@pcnci.linuxbox.cz>
 <atY1vWRBRUwpISKb@pcnci.linuxbox.cz>
 <20261019083529.a81910ac0976c1a5687d4c6a@linux-foundation.org>
 <CAO9r8zO41EromgLGhKv8H0aKXjrffH+t4CFGU6cLo59JJ3CEuA@mail.gmail.com>
 <20261019105844.02d4623b7063fec25ebd34ad@linux-foundation.org>
 <CAO9r8zN1dTJmULsKCwNrNr_vKyrV+vMfD7wifQ05uAti7E-yDw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAO9r8zN1dTJmULsKCwNrNr_vKyrV+vMfD7wifQ05uAti7E-yDw@mail.gmail.com>

On Mon, Oct 19, 2026 at 11:00:00AM -0700, Yosry Ahmed wrote:
> Right, but this is for new patches that get merged into Linus's tree,
> what about existing patches? Any way to retrigger that workflow?

You take your patch, apply it to the stable trees here:

https://www.kernel.org/category/releases.html

and send the applied and tested version it to <stable@kernel.org>.

I.e., you backport it yourself. :)

Do git-log on those branches to see how stable backports are annotated. It
needs to say:

"Commit <sha1> upstream."

at the top.

There's also Documentation/process/stable-kernel-rules.rst

HTH.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
