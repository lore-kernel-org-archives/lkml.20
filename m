Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB81E3B71A0;
	Fri,  4 Sep 2026 06:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788503407; cv=none; b=oKrkmf3Svx2sIcgErMsfqyJ4BGpQNRCWH+VuVrHQrO4D5Y+KwLtgevrCZF/p4nc+PB/wl+8XtJ5K4yqnX8iu9mi6fbIP9X1+wLNCkYLhW0jZrqXJ5T20J3dsQCpfkvNeNkBlMOXlw6uyC/O2uYuKQQkbf7gqZwwp1SiLy0o9j0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788503407; c=relaxed/simple;
	bh=hXa88sD5tYHETtc0yGFtcETrOVLQ1TNfk/9CSMJE8Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REM++Qvp0kceSOLrUpvLmXvXpiLLYEmHz+QxP6EPi2+bnKOvaDH7n+rpA9h+c0sSO4bUN7TJhq+y4ptwoiPp+q6E+hgrkA45a1tt6RYxa0IbSfL+APfZdXiVGk6Rt9xBCD1H8ZqrtWs5ooYD0Nc+fLyQBGj/uBVhAg5j3T6KTss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lbZQ+yHE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lbZQ+yHE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9EEA1F00A3D;
	Fri,  4 Sep 2026 06:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788503406;
	bh=tBY8qlSzyakbVLk3BY2M9HdiyNeqLjM3cyd92nK2zJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lbZQ+yHEQNEmDC125+zdugMIKmllPZ4X5z4KGT6HmtLrQsipN9pXtQe7rvxoAYIdJ
	 KdklNlPg7VNjegy3veCxNIyBWtfOgflef95RT7LqAQsiFH4IWvN3gq4sBaoe7S/1xO
	 JG5BeW7PFAFd6vouaxrcBAUxjIGByLSH/jklok4o=
Date: Fri, 4 Sep 2026 08:28:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Suraj Theekshana <surajtheekshana1111@gmail.com>
Cc: vireshk@kernel.org, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] greybus: cap: bound IMS/auth memcpy to ioctl size
Message-ID: <2026090405-sushi-talcum-54c6@gregkh>
References: <20260904034628.12376-1-surajtheekshana1111@gmail.com>
 <2026090416-humbly-remix-5d86@gregkh>
 <CA+_JcNRPo1dojU4EmegM5Fv-YpZqiyd_K7SRz8km1VzzPv2nMw@mail.gmail.com>
 <2026090450-prolonged-tucking-0a55@gregkh>
 <CA+_JcNRkjeS92kc19AvMUxjdQn1GBc+8YJaOuCmZ4w++U=sf1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+_JcNRkjeS92kc19AvMUxjdQn1GBc+8YJaOuCmZ4w++U=sf1w@mail.gmail.com>

On Fri, Sep 04, 2026 at 11:26:48AM +0530, Suraj Theekshana wrote:
> Hi Greg,
> 
> Sorry about that. I have switched Gmail to plain-text mode and am
> 
> resending with replies inline below.
> 
> > How was this found and tested?
> 
> I found it while reviewing authentication.c. I then manually reviewed
> the affected calculations and exercised them
> using a userspace ASan harness based on the Greybus structures.
> 
> The harness demonstrated the 2047-byte and 1983-byte copies into the
> 1600-byte and 320-byte destinations, respectively. It did not exercise a
> live CAP ioctl or Greybus transport and did not produce an in-kernel
> KASAN report.
> 
> I also built drivers/staging/greybus/authentication.o with W=1 on arm64,
> and the submitted patch passed checkpatch without warnings. I do not
> have access to real Greybus hardware, so it has not been tested on a
> physical device.

How well does the userspace harness actually exercise the code?  Can you
turn it into a valid kselftest test that we can add to the kernel tree
to test the kernel code?

> > And doesn't this info come from the hardware itself? Is it not trusted here?
> 
> Yes, the response length comes from the Greybus endpoint hardware or its
> firmware. My assumption was that a faulty or compromised endpoint should
> not be able to cause an out-of-bounds copy, especially during component
> authentication.
> 
> However, I did not establish that hostile Greybus hardware is within the
> kernel's intended threat model. If the endpoint is considered fully
> trusted here, then I agree that this would be defensive hardening rather
> than a demonstrated security-boundary issue.

Our documentation (which your LLM should have read), says that we trust
hardware :)

> > Did you forget an Assisted-by: tag?
> 
> Yes. That was my mistake. I used OpenAI Codex while  preparing,
> and validating the patch.

Please read:
	https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh

thanks,

greg k-h
