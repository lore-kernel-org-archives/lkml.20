Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950C7184540;
	Sun, 27 Sep 2026 16:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790527542; cv=none; b=B/bZxLiWtxbsELsNyu7THh2LaJpsRia9jnh4ZUxQFzBCrc5+Bjh+oCA3xM0qETUYRWAtZyJ+y2WLKMr+il8g9jRt8x/He4iREsYlxxsv/6UYD00cN4fySHRcZnCklATVTVU4MXNfW+0C7aI322zH9PPrTgwfj2v0onp1xCln8mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790527542; c=relaxed/simple;
	bh=8xWsYz+IsDt7c22i4hax2H19QEdu4xFg81LjCUSLft8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lcw8ZK1ruvYeE//vnruzz/M3zePuBIQcHnodFa7uaQyB5BEOROtd5ruSvCpB3R3OtZGj6TyUWCCnc8BDUXH1T3naCk2J//19OSp5aPTYkSGz9Lx002t0Klr+oOHO0LXwmW67C/5cDsd6+5e8O2YiFK/QPkBeeDKisDUZuCksXEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XFlPYnDC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XFlPYnDC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E6B1F00893;
	Sun, 27 Sep 2026 16:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790527541;
	bh=LOcE2VhNDxU7mSeVB0a2OxugaGl3rC6hDDMRWTO+5xc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XFlPYnDCBdiiCKDDkf06+YK5M8OrLyEVJ21ANvaxxruIHeBnwwt1RbiGAmoydeD6e
	 8H7SDZr9aa/bAInp1E2Y9gscrYKR1/IyOFxkWPp14rnvjYLF1wDGrNh+NTtP8u0G6i
	 dD1lzmxoh0yH/XV54dg9FhI0bMOEOXUx9G3KAXII=
Date: Sun, 27 Sep 2026 18:45:38 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Jiaming Ouyang <jiamingouyang13@gmail.com>
Cc: Weijie Yuan <wy@wyuan.org>, Dongliang Mu <dzm91@hust.edu.cn>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	alexs@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	si.yanteng@linux.dev, rdunlap@infradead.org
Subject: Re: [PATCH] docs/zh_CN: add Chinese translation for usb/ohci.rst
Message-ID: <2026092700-catacomb-skipper-37b2@gregkh>
References: <CAMnqnYyO98AEDOHfm32Cb4uGBDucLiZ8gKZ5S+jVf3DDCoFA5w@mail.gmail.com>
 <cfc9cb8d-d13a-4dd6-809c-1ecf3bc9c758@hust.edu.cn>
 <CAMnqnYxzfUUaeaGTG=pESVN+2yeue4b_7N6d=xMGNE7qdrNbYA@mail.gmail.com>
 <2026092601-reassure-darkness-229b@gregkh>
 <aresDaW09qoYZsVH@wyuan.org>
 <CAMnqnYzjDmXhbsMUCT3s1qARHu-w+BODv3OLg8rO=-DQi4StYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMnqnYzjDmXhbsMUCT3s1qARHu-w+BODv3OLg8rO=-DQi4StYw@mail.gmail.com>

On Sat, Sep 26, 2026 at 05:26:07PM +0200, Jiaming Ouyang wrote:
> docs/zh_CN: add Chinese translation for usb/ohci.rst
> 
> Translate Documentation/usb/ohci.rst into Chinese Simplified.
> 
> The translation covers OHCI driver overview, hardware protocol
> differences (OHCI vs UHCI), improvements since 2.4 kernel,
> queueable interrupt transfers, and non-PCI support.
> 
> ---
> Signed-off-by: Jiaming Ouyang <jiamingouyang13@gmail.com>
> 
> ---
> Changes in v2:
> - Correct the date
> - Correct the layout
> - Add specific details for it's contributors

For new versions, start a new thread and properly say "v2" in the
subject line as the documentation asks you to.  Perhaps use a tool like
'b4' that does this all for you?

thanks,

greg k-h
