Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E42A376494
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 01:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790819830; cv=none; b=oRepm5fZgGZ91g480r7Kikn9w5aE99q/Jtx1CN6Z8kVpBecldklgedkLDGC+yz2hayNFludpIJnKWmqCqYRSiXFKmQm0oFOzlZ7L6yh6we7De1CXus291Mz45OjiIpBEZauOAyyb832SYi8hW0o5WffB8we3UtwISLRQkB4bVlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790819830; c=relaxed/simple;
	bh=K2o9/WCXwC4T99dL69pM7g4IDH/Zv5ayyu0xB4lvSzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+oe+E/9D/xd5yBOrWkgZkS4sFFCA+UCUJTkwC5jslCf+xWYbHvBDPDW4vzqBoa3fUTd494VUnptI2z6iXVLvZIUlkGhDV+d5WDlyJJEZnB75Bz4j9Sj4dl3UW8GBFFaTrdBAcV+tv+gzEh/bkoQ4Sf2IWu6V9OSx781dS7D6dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=W4Vc0YuB; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="W4Vc0YuB"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0F4E740E00B9;
	Thu,  1 Oct 2026 01:57:06 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id iP4WYKpyZtpM; Thu,  1 Oct 2026 01:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790819816; bh=3AN9wrnDUvEkiCtg3vooXw5HSkKkZxK6vy6Xcp6DoF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W4Vc0YuBB54LakwDRNCu2h/nLxT9H0Fygo53JrffzX/5iniAzjyhNCSC7aygsk+DR
	 6N50u9VRYX8nBKVtNoYg/6JHf49kEQRGNtDqhCFxnZo4JRMBU8bE9auPE2Z9jMKV1D
	 lFcty50NV5yE3y/hME6bnDbc6H9ICGNOTSbLkTVeJ5Tm12bMR4LLqT8fjXBc1L5P8c
	 ip44fzDwHGUtY6sDh2F4SG7tUu/swZpiOP1ixLcZjOq5yAuzapFgWKsWI2ZDEk/a09
	 1rXsh0FYPNsjiLvDP1Wc7A/BIiO5MJBc1RHDLfyskwWcvg3YcVUopTy3lpAWhePZ57
	 KBBRoIdHxG+Eaea9hslDBzPi6n/BD5hN7+qtCUXeoo0e+FOFMfSGcbsJaeMD4//aPZ
	 RtBJBzvc+mlQrNwhefjR04muNcCMC98W7U6GVMeYfPkYcqN7wxvs8QyQ0xpOvHToz9
	 wPIAIM3jf+e4U/E2g5AvBezSuRGKZv6hvwZXmTuEnaFpzKHk+6YMtgNftd1cbU9GL7
	 FppLzNtMXstXgneKnwtxqnD+qBxqHbYLpu/nHvza7xx4zX9S6hzMnmIBCB/B8b1Xxs
	 OBMD3ZDNiktJJIbbxTcUEGrb6TJiFJYOURgsc1mcxyHegjj6lxQvXvyoPi316c/AgK
	 0ebLF+7LLyfJ6LmIeRvMFHGU=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 711C840E01ED;
	Thu,  1 Oct 2026 01:56:44 +0000 (UTC)
Date: Wed, 30 Sep 2026 18:56:40 -0700
From: Borislav Petkov <bp@alien8.de>
To: Andrei Vagin <avagin@gmail.com>
Cc: Andrei Vagin <avagin@google.com>,
	"Chang S. Bae" <chang.seok.bae@intel.com>,
	linux-kernel@vger.kernel.org, criu@lists.linux.dev,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 0/2] x86/fpu: Allow restoring signal frames with larger
 xstate_size
Message-ID: <20261001015640.GCar292JQ4RTkM24Y_@fat_crate.local>
References: <20260929232621.3745312-1-avagin@google.com>
 <20260929235700.GBarxQTLOrWy1I3UZr@fat_crate.local>
 <CAEWA0a6McVMNv1ALC7EoEeA9-7_7u_b5JrsqixifvsfVJ7b_8g@mail.gmail.com>
 <20260930025153.GCarx5SUn-XMHNdly1@fat_crate.local>
 <CANaxB-xYziLhUBXreHKf6FRvyvnRnHy5iWu5yKwEAATPoEbQLg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANaxB-xYziLhUBXreHKf6FRvyvnRnHy5iWu5yKwEAATPoEbQLg@mail.gmail.com>

On Wed, Sep 30, 2026 at 12:37:46PM -0700, Andrei Vagin wrote:
> Originally, I sent all these patches in one series. Then, Chang
> suggested splitting them into two parts. The first series was mostly
> straightforward; it contained documentation updates, code refactoring,
> test updates, and bug fixes without any user-visible behavior changes.
> 
> The second series introduces a user-visible behavior change and requires
> more careful review.

Ah ok, makes sense now.

Thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
