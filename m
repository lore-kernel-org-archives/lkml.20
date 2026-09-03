Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4B127456
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 00:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788393726; cv=none; b=NzGp/EznSivTu2TPPnzjtAp6rjGbt87guPyGL1o3C9V6gzymbPwwCjpmYCcyrT+f5UpuKVRC2P4KJc5nTvnGfJ1cQtZ6L4m68jbZ9Zj4+FRf/3EUorg3zZvo5ysu/SPyAimGigPfVT/9KbmF9NBAXKcLuPRKt7FgL2PYRbEOJ+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788393726; c=relaxed/simple;
	bh=8gBUgJnesu/NKw/hFhLhH5+OPPbUMTW/du4dLqG5G2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGd+7Pm1+VPC3MGNYniHhAQ0h81cJHfMQTqEZr6BBXNWOHUCpvp9uw2byLxBX25/vWNGzroS6YfNJvJrgz4Ywb0nYOEWAiAvr8RRBn/nv1ibJrl07kUw06tn0lQiFAAnbOPOboV1SyciXVA/o1thah68xew1d+kDVPQNtVEqJQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=D4ycekOh; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="D4ycekOh"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id EEE2340E027F;
	Thu,  3 Sep 2026 00:02:01 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id zOm-ALuwUT36; Thu,  3 Sep 2026 00:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788393712; bh=4IXlQHsFzyYYmBoAO8JkyrUh/FaLtn8cSNtt98cWPCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D4ycekOh9nFddyT3xYovjLl+9n/5GpQAwZAaLHsBu2LdD/ckNO6uvomUTXRhSfDot
	 g50QK8yvxH+hzcEZES9PIf9B/cGuSpXMxmYGK+/fAut2ZMC5il0LuFbE1TvQGTPUUZ
	 a2ZmDg3mZzjAbZX2ygOLxIQG6tLRCTNAO93O3PgFHoeH8gcYnzsvi8l6I/VyblxpTe
	 oMvckUCteRmBNHvCNL3r2x0oAMFrWTHuLctsilE90m2s97cYEInPCIOBwzcznJeQ8K
	 bN+aWumHgEAh0iJZxmEJJQM5I6FXrz+nkk8S8BZqkBq5APu+24YV20LgF7lOp+kkQl
	 HjiiMhfbRBjfCRhbKaoiidwb0lUZAcIGR1NCqbxmQfMYrfw3p/8evU0Qze+OH2eXqC
	 y3tVRX9WREXjYxl4QtLzSiDA/4yO1eVDiB3RwgLqHiKBuVAIwBU2eynDmsiM+YMNBE
	 9wfKiIfScHM+GnDuF4/c/G75DrBHAUAC4R+fD7QLtux7yfL32rtKBqoqYQz3NtiFoe
	 xrTs2HYgALrpp/QISUMuRgHdLsMDkNQ1LcXV/nQvwwEKQHD/K6JSxgwA5sFK1G0F7z
	 yeKWOc2WVRWAPVDTzMKuGfgs+OylP9NdrFXeVNxOHe3aJgn52ySIg6k/aSwOBYyGoW
	 Dfb4ubLZb6GOtdVx+CvgclsA=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 38A5740E016C;
	Thu,  3 Sep 2026 00:01:35 +0000 (UTC)
Date: Wed, 2 Sep 2026 17:01:32 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Michael Matz <matz@suse.de>, Richard Biener <rguenther@suse.de>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
	kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 1/5] x86/boot: Remove "cc" clobber from memcmp()
Message-ID: <20260903000132.GGapi43JjGh-8sj65Q@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-1-e70ef3b75b6a@igalia.com>
 <20260902023129.GGapeKgVlL2WgHcJcb@fat_crate.local>
 <57b0d188-b256-bde4-43e6-99dae4f59d60@suse.de>
 <05896397667d66a2969259298bcebb7f@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <05896397667d66a2969259298bcebb7f@igalia.com>

On Wed, Sep 02, 2026 at 10:48:14AM -0300, Mauricio Faria de Oliveira wrote:
> Boris, I guess this may be added as clarification in the commit message.
> Would you prefer another version with it?

Yeah, I'd actually prefer it in the code itself so that we can find it easier.
This file is as good as any.

Something like this:

/*
 * Summarized explanation that "cc" clobbers don't have a meaning
 *
 */
 
and leave the "cc" clobber there but commented out:

 /* "cc" ... */

so that we can grep for it easier later.

Thanks!

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
