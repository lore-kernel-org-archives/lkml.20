Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D338A4A8FD3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363500; cv=none; b=qaVDmTr0GlyCPRleqI9UQemO3baDHEnBjtyWNknFREhxzuFBlrRYa+XRnbxu5SpsYG/R/tZBcDvgzqRBjWWXFyP6jG5zyC2JnPsgWM2lnhqSwMCTwjDlA68dhe5pl7Tl2wahkap2zeR6/R2mI+1bOJeBTKcO+JpirYnx4v2Aqx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363500; c=relaxed/simple;
	bh=r1wzdqk9Yha3rQ5T79xwCaVI2aNLk84ups4ygu/u1r0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ayGJj8CxwRLsJ6a3nZ/5IkJmhUNgFBPEqJYTE6SSbvVgHoQtztIMuRSv+fzppaVq5VSRBMlCFNwIboUJMcPFG5NwPqfNjBr+0pTbQ4woMKtyZnvDeXZVmlUjgNil9eoqKk47GdBXvkS5jnx6mr2Jcujzr9OKrQc1RKaV+rwKmzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=bNGYzvR4; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="bNGYzvR4"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 38BCD40E0301;
	Wed,  2 Sep 2026 15:37:57 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id yg0LVubOiLGE; Wed,  2 Sep 2026 15:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788363466; bh=Ah7WnQxzUmJ3hIyqhAnwMuzxRP0BoOkEj3I/2iiDfQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bNGYzvR40cNH/z+9IcrdxAiCut8BW57E9/Cha0QQaX84nbMqTkiCKsu9qN3ux4kPF
	 pfI0KxnTEWdJHjJ4v3K+pZnJFlPrd1LyvTlbheZsxjD0zxI3knZrMpF4THLKeIRnR4
	 0XvWbKk7HmIrsWD7kI2201ry3XdqxgvQIjUuSnJkO43Ys/E2Rjk0TZtmvjI6O9TKoU
	 ULAolOnBjEPOnM8OO3rzVJVy8JW5oPuGuV2mNzEOGiLsfp7yBQsi/U/OkD370etzOm
	 HG/PgTbDVPfqpBNpdlwUTYgq9UslmcFM4t2x2xhSh6EUyY4I4L66jferfVEYT8HmD4
	 oFPIfGDOV4M5uJBflGQA2mPLYZ31z9D9djgxkbNHEqVxoUyMWvD4LAf0HyJNyiULAi
	 CLRwPv/Gt6tmwDSVSCe8UWvUSIDKb2kNps5XEZjCleJhg5Z9GRJSa7ZEdgpiDBK5Ay
	 wcvxFYXjX1UEE32stHVu+6d1+WY8hXO4lBe2s2YN/RcKUVWPzLj8pAiCJPDB8GxlCZ
	 kQMmp/zvCZUuxZtD39pqZwi+q6tqrc/t5vFqFx9oOisA2EMXnyRZIZPFCpLUImt23X
	 EeH/buxVjoSiZNcsTdKXC1I2dAbQFg+Q7lyrNRju/55q+UtwtqVhx5y4OHh+9jAaLk
	 A6LkPqanJY+KFdGf3IsKjhg8=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4557640E02C2;
	Wed,  2 Sep 2026 15:37:39 +0000 (UTC)
Date: Wed, 2 Sep 2026 08:37:35 -0700
From: Borislav Petkov <bp@alien8.de>
To: Thorsten Blum <blum@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/coco: Replace cc_attr_flags with a bool
Message-ID: <20260902153735.GBaphCv4DFj75B2nP7@fat_crate.local>
References: <20260902000634.118808-2-blum@kernel.org>
 <20260902005703.GDapd0X8PevmcPPxBm@fat_crate.local>
 <apfyN_VpuREcX5A1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <apfyN_VpuREcX5A1@kernel.org>

On Wed, Sep 02, 2026 at 11:53:59AM +0200, Thorsten Blum wrote:
> I did check before sending. My motivation for the cleanup was that in
> the ~2.5 years since bc6f707fc0fe ("x86/cc: Add cc_platform_set/_clear()
> helpers"), host_sev_snp has remained the only member of cc_flags.

And?

That is bothering you so much so that you would send a patch for it?

If you really wanna help, you'd be immensely more helpful if you tested
kernels and did some code review to help out maintainers. Because we're
drowning in patches but not drowning in reviewers...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
