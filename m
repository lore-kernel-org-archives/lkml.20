Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753CC19E97B;
	Fri,  4 Sep 2026 00:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788482764; cv=none; b=UAZlhRnmSDmBhleq4gUEAmUGcmKYRkr+QEyM16QJ7tELTKMC+Nvhx2uujX5MRWib7jp2DewFVc1Yu0CYDmmNu4R9rRj8V9fZUJESH6FlkkrW3e/pi1GRiuNIXtoT0l5DphjcgQH1zT4FQyYBkqCMqnbgOjjc/bH0aL848UuJJLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788482764; c=relaxed/simple;
	bh=G+cbfp3/DrJbJ39GkXJwA59yVN4l2KvaFalZw3bvCrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GtgBVqwR72PPSprUTHreYsBXYYS6s6v3w/ke+0NKZbWe+a8AAbQK7SZ629l18n/doBMUBxxWHJuUssMUwbY5a0E7Ki3d42sbvwl3HZdzJB3SZf8hyONZcchGg/lnN7zTphs+UrvR3CFEXgx4NYzesE33f73rtZF50VWYQT8r+uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ZztCZJJT; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ZztCZJJT"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id AA19240E0301;
	Fri,  4 Sep 2026 00:45:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id H7HxSG7FG3cq; Fri,  4 Sep 2026 00:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788482748; bh=KTfmakfyUbrCg+U7pnBILM91XEjE6ocQsxObCugcJco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZztCZJJTW8OajFH741mU9mzaC540yt4lJieqBEHWcOKvKdOipC/wawWtlyG9E4UgJ
	 C+3PatJBW4OC2ydPIMagQ3BWLTRNoF62V+ykTUcubWUnqc/sfGSebFZyyW9kq4PJg6
	 W2J7Cx/8erz+b7Vgg1mfM1n9drSyjeX32vrkMee987qy0nCk4EZVJCe+2MRExcSsep
	 ERzcXHgQ0eR7VpsA1Bz4pui5xIo+AIOummWRFPdlW6zCWo8vQwcPeC3CbldknYVzpY
	 2or0S/hjWkxppg+h5wN8pjiegaCZJGUUFmE7Zna/xhuO6YI5qbIkVHIhkBcoiC2sX3
	 h7jWdiQdXe3fC4ajHvNFMNjMO9X4Mu3TyQbZ9q33EHbyoqKZg9f0jQUmNCwrtib4Eb
	 IUtvBMSpTOphSYgQ+bMaZQR0fc6CU8SVC7eAtDzExVP51AGLV+t9UURG4ek26uESsG
	 y6UWCvS91kurKrIuETd48voiIV4SfMTxCuAByltKNPh1EV1RF6/2UxiWDlk2ziMIqP
	 h125XqUpka/HyjXkjGLYsQLFlMyYO1NGEvDPQSZE4TLHzL2YDAqB6+mk7+K1hN7tYo
	 D9j0c4BqNxab5AnPeR2ABwmdf2zfpVn5mYpqRIn8FQQSLn1GgsJo3XAVyEBjQrz/F5
	 49YlYhYbnP8bzeE88t63KxkQ=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 01B6F40E016C;
	Fri,  4 Sep 2026 00:45:31 +0000 (UTC)
Date: Thu, 3 Sep 2026 17:45:28 -0700
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
Message-ID: <20260904004528.GBapoUqPa1vDY3TP0n@fat_crate.local>
References: <20260903194130.186096-1-atomlin@atomlin.com>
 <20260903221745.GAapnyCYVOL0qeip6N@fat_crate.local>
 <3we2xmx4fwgrgj7ixnkeskbht5yxsgzgffy6yn45xxvdnl4nkz@6yktlrqvgwcq>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3we2xmx4fwgrgj7ixnkeskbht5yxsgzgffy6yn45xxvdnl4nkz@6yktlrqvgwcq>

On Thu, Sep 03, 2026 at 08:30:40PM -0400, Aaron Tomlin wrote:
> The rapid cadence was not borne out of impatience, but rather active,
> iterative engagement with Tony Luck and Marco Crivellari to incorporate
> their direct feedback, alongside addressing pre-existing issues flagged by
> Sashiko. Each revision sought to turn around those specific corrections
> promptly.

How would you feel if I am doing a patchset and I send you a new version each
time I fix an issue there?

That's not how this is done.

You collect *all* feedback, you reply to the list with your feedback to
Sashiko review so that people can see whether that is going to be addressed or
it doesn't make sense after explaining why, you test your patchset thoroughly and
*then* you send again.

You don't have to wait a whole week but you have to give people a chance to
take a look at your pile. Note that you're not the only one sending patches.

How about you try to review some patches of other people instead of only
sending, while waiting for people to take a look at yours?

And perhaps test some -rc kernels and report issues?

That would be of immense help than simply only sending patches.

Balancing the generation of new code and reviewing of other code on the ML
would be the optimal thing to do, I would say. And very much appreciated by
maintainers - much more than only sending patches.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
