Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9818D433E81
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790976310; cv=none; b=ejuOCnFmDhze+AylV1BmnUOn7bhTw180S2CdtxYe8ieOsPaa5mYZmjT7MfnmmGZvXiNda8RTUvob3NAlZCms4uUMX++zAVjorsJGGFdxxTf8Ut637Sh1rE7vgKADpJrZda1p+ShhfMiQqHNnd1bkKZmlhk3jJjIXQ3uMxd77ikw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790976310; c=relaxed/simple;
	bh=9+mvf/BWm90yipWt5dIUPxr3YbINlQZvOpnAaYPRjko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZS1PxyTpnULZWOZe6jlhs970Ae5ss4Af+BU7hXDOwRJDKUSTPgrU1iVedlmhTpLYKBxZYOkR3qIALlBhPTESTbr7cU9XfiR0M8yXoZz0BBC7feGCk5bax9gR/ZSyn0DUfY9Ak6vzC/vUrcN0BOWRmozzvBceyo6a0KAavX357M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Xh4EAdwx; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Xh4EAdwx"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4887B40E01CD;
	Fri,  2 Oct 2026 21:25:03 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id OMwCzNjKw14B; Fri,  2 Oct 2026 21:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790976293; bh=nmByeWFgL6Yg9UKggs2HkpeCwJgYb6rHX9cJmpgn/lY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xh4EAdwx9Mrkp1tNGYF4iPqsscxanXnPS9tJMys2OBPmuLyjF3QjK0PZqgVrWmzHl
	 1uE/RliDUR63kyiSxSFWQWLf3lh1zV9RK4q2um5NmcBi54SZ791lDvDuns71d38YW4
	 NKKrMBHAvz3vLxYexqslJgdjglYrTYaatQME6nFOsKw+zFx0Rek7d64Fsz8994uAOt
	 t4c0KZAknnKpkwRogGRvrsf9hxHjqbXxUjddD9D7Auf6uD1YEy7F+kXtvpzR4shRFB
	 UylYy+DbEBhUedbLDJ9H6HTdXHu0fN/q5606EPypR1XnIARNCXvtsavJxNRKO8dA2u
	 j2kcnE/dRRAEOT05wuCYv7mmf1bPeReu9zm7fAiWRbyPq5CE8KNjvHkViKzPjOerf2
	 zN5hh7Y9tFJok/vwyI8Wy+0ksu8ZmrejCKm0h/TqG7FkuDVQWWi+T99bxwbTSNGnrr
	 YvmFpduMDOTxpHqp59IOL201MOVWhYGTj21FFSbsXtkqzTm2mqYosgY4XWIOs4vt90
	 AKKaSpMvdDil0VnQAhREBJEzmQV1iRISSfHxqi9ssmz9A/7fOF6EaCbUDrysBjhZst
	 PR3R1y0z4Xmt2ntqHQ3m6x9tV9rOJje2iwX94Ic+cFdl2y04jHkAfz9VEPzN0I97fa
	 wmWDnhFOfB2XgpeokpAgce6o=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9653340E02A8;
	Fri,  2 Oct 2026 21:24:35 +0000 (UTC)
Date: Fri, 2 Oct 2026 14:24:32 -0700
From: Borislav Petkov <bp@alien8.de>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Rik van Riel <riel@surriel.com>, Matt Fleming <matt@readmodwrite.com>,
	Henrik =?utf-8?Q?B=C3=B6ving?= <henrik@lean-fro.org>,
	Dave Hansen <dave.hansen@intel.com>, dave.hansen@linux.intel.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, david.kaplan@amd.com,
	Ingo Molnar <mingo@redhat.com>, luto@kernel.org,
	peterz@infradead.org, Sebastian Ullrich <sebastian@lean-fro.org>,
	Joscha Mennicken <joscha@lean-fro.org>, kernel-team@cloudflare.com,
	kernel-team@meta.com, linux-kernel@vger.kernel.org
Subject: Re: PROBLEM: Probabilistic segfault on AMD hardware with INVLPGB
Message-ID: <20261002212432.GAasAhEHNr2o8sp6Xh@fat_crate.local>
References: <CAAuFnRTyva1_3tsF3vrMBL+TLS1YL4EgUPT2c3O9k7A9hWUMnA@mail.gmail.com>
 <20260708112718.13323f59@fangorn>
 <20260708155146.GAak5yEiHU-YM1Wid9@fat_crate.local>
 <20260914022055.1639690-1-tz2294@columbia.edu>
 <20260914045823.GFaqd-7yDf6aK4JUQr@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914045823.GFaqd-7yDf6aK4JUQr@fat_crate.local>

On Sun, Sep 13, 2026 at 09:58:23PM -0700, Borislav Petkov wrote:
> On Sun, Sep 13, 2026 at 10:20:55PM -0400, Tal Zussman wrote:
> > Is there any update on either a fix from AMD or merging Rik's double TLBSYNC
> > workaround?
> 
> There will be an official thing Soon(tm).

Soon is today:

https://lore.kernel.org/r/20261002211617.1001617-1-bp@kernel.org

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
