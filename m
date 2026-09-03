Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205FA2931FC;
	Thu,  3 Sep 2026 22:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788473908; cv=none; b=S8gKajczdctkLCy0Ge4eI4d9h5IcwbmsN7CE6dc61JSnIqu4FZZFG+xj7p5h4r58RuVpvf6UZvvLkNUnqERsqhLFKTg6mlu2HnP4v86sjBFVlr9R9sUNa7Hb8hWlod7ZJAec5rz8cuthd7R3XqAhilh9e9jMrF64cU3RSYS8eMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788473908; c=relaxed/simple;
	bh=8/lOmGGroOWUCeWQZ2+XrkPgnDIBRbCiSiamJIAHsdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZHf0cBi6a05faLGVwDV1d4MSI71NeYUS+FZPXzyVtbY791BlvaXvcFTZ7WJ2K3VUdGMdZi/PvVp8v3ze4UG7MwR6UikN9zKoFW5E0ZFuX526vJd+oObyP6cPyNT2COTqdNiNtrywBDp7G7DSnWuMWYI8/Mfk0XCr6ZK9eYzWEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=KH6l8mzT; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="KH6l8mzT"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0302840E016C;
	Thu,  3 Sep 2026 22:18:17 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id EnA4fM3i9fr9; Thu,  3 Sep 2026 22:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788473886; bh=NM9c2hEw7ubKXee1wycSh5EQXSvXjN1o+ByzwgLqAsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KH6l8mzTlUbsxxGwjjMy0HAjPdbAJkp9P4CkL43bleu/kCHBXcyIO2ZT+up1ERtxk
	 f3GsuCrfzemAMlBnutu8L5zo1zKPqBxx8h2AfzTlNwB/aByPBQFAoDZBKpJIOeeZyJ
	 q0+omzgGKu+kVPhqoIbkf/wUDXJnEmH9veBLWEbwn6C7OkDyhDgZt5aMd14vUmamWn
	 hoSOiVSm9IDV5vdzO+Vo0x+rO4C1JKMp7IpgsXi4LQsg32xynGsuUlBLATTJf0xOua
	 TDi9uJYyHzqRE0d3+SuL6fQvZwiq/y0SIxqJzPLZmugzAnQgm48pUzdM3WHQpvdhlF
	 DILXCAUr04wdJa8jkXejZCcBeJSaQcCmJ1SLwDSM7v2xvT36iGBz10paxBxaQoasOh
	 EQn1qeQh9CrnsvcnkALUQVoXlJQDPMLNAoAdsccXgkNCfYDVuw1ic+k1+Ms2UhxSv4
	 t9ipnbArUk4iYDGltcbylzVnKCKl9DS8Ne4NsO1BK1SYi0LKIMi3SI3nXnafxmOIZz
	 tmHFYOS26s35U/scCIzNA0fkSA4/yIXKpszh3qrS5HTw8XTBJnk9GOrCxT+2P9u6he
	 A70Gj5Cj8go28OZ/Kh0tWsH9T0Z1KHWl6O0d3Z4fFjClHsZF0puMuR5r8vOr25tNjk
	 fWVCo/yT0ModQzf6BNoVnytY=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id DADD040E01DD;
	Thu,  3 Sep 2026 22:17:49 +0000 (UTC)
Date: Thu, 3 Sep 2026 15:17:45 -0700
From: Borislav Petkov <bp@alien8.de>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: tony.luck@intel.com, tglx@kernel.org, mingo@redhat.com,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	frederic@kernel.org, marco.crivellari@suse.com, neelx@suse.com,
	sean@ashe.io, chjohnst@gmail.com, mproche@gmail.com,
	nick.lange@gmail.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] x86/mce: Fix timer list corruption and avoid
 redundant polling
Message-ID: <20260903221745.GAapnyCYVOL0qeip6N@fat_crate.local>
References: <20260903194130.186096-1-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260903194130.186096-1-atomlin@atomlin.com>

On Thu, Sep 03, 2026 at 03:41:27PM -0400, Aaron Tomlin wrote:
> This series addresses two distinct issues within the x86 Machine Check
> Architecture (MCA) timer subsystem: a race condition during runtime CPU
> reconfiguration that can corrupt the kernel timer wheel, and redundant
> periodic software polling of banks that never log corrected errors.

N T Sep 01              Aaron Tomlin ( :2.6K|) [RFC PATCH] x86/mce: Avoid arming periodic polling timer on isolated CPUs
N T Sep 01              Aaron Tomlin ( :2.3K|) [PATCH v2 0/2] x86/mce: Fix timer list corruption and avoid redundant polling
N T Sep 02              Aaron Tomlin ( :3.0K|) [PATCH v3 0/2] x86/mce: Fix timer list corruption and avoid redundant polling
N T Sep 03              Aaron Tomlin ( :3.1K|) [PATCH v4 0/2] x86/mce: Fix timer list corruption and avoid redundant polling
N T Sep 03              Aaron Tomlin ( :4.0K|) [PATCH v5 0/3] x86/mce: Fix timer list corruption and avoid redundant polling

5 submissions on the same topic in 3 days.

Please stop spamming!

From: Documentation/process/submitting-patches.rst

Don't get discouraged - or impatient
------------------------------------

After you have submitted your change, be patient and wait.  Reviewers are
busy people and may not get to your patch right away.

Once upon a time, patches used to disappear into the void without comment,
but the development process works more smoothly than that now.  You should
receive comments within a week or so; if that does not happen, make sure
that you have sent your patches to the right place.  Wait for a minimum of
one week before resubmitting or pinging reviewers - possibly longer during
busy times like merge windows.

Pls read the documentation about how you should work with the community:

Documentation/process/

while you're waiting for review.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
