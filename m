Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348545;
	b=QkKsnN1qptlCaXLqnJBMfkezKzsSf03tLUs93KOiifBBg33dhMAyy4W5EgsHW3isRwpn
	 zEm+ailse5VT8XyMTqvys0BIkmlA+P4K8BAfdY2JvOAvmI2xxh9vAMfL5/ajOM/HneN4f
	 LjRgLlgwU+Eiy6SJXEmULootI0bcM+TMMhli0GAW6qybFUvwbn6TXknfuxTbP+IHxyXJq
	 jWGTuD7dMNvWrMFGl+7jYENxVsd+mmh3Nud5ulQjpgQS32nm2S991fLLkuoVWXjV8x/bR
	 0outFeHfnxqBwwtq1N6F2ucYgGT9pCjubrAiA7XbLyhKcXFbLBcljD3qmHqvMVpA/qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348545;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UG4JcrnfME5SpJ8rpezfpTVs45pW2a2QsmJwvqx6W/A=;
	b=lnwDr974L4CTQQLmnpgXShpTMFjwpz/hPFb+jFSOL0V96egBDAQktqv8niO9ET0CWfLE
	 WlYAGmn1cwcB4t+HvkdKQrglIzVBVgNskQlnhXS2LJX9HVeHyv5sPkZHiRRoGlYVT849h
	 Zc9u6Mkr790YHIdw7iLyeW1LnNoWDWtVTixjhzO/WyCGYugef1Ah+ueeDarLnbxiguvjY
	 FKkKblRJA43LN6Yj7w8OYczHJTzKHz0T113lg+X52XZKF3EWmn9KXImd6ULdmORwry/eL
	 8Fsz2KV1NgCuUg5e22l0vZPOfSpcBcjHMniICxkF6UE6DFlM73FXbs2pwb3N6i0Refw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=yWJOMO+K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A609E606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=yWJOMO+K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9080C1F000C1;
	Fri, 30 Oct 2026 08:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793348544;
	bh=UG4JcrnfME5SpJ8rpezfpTVs45pW2a2QsmJwvqx6W/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=yWJOMO+KK6oIP7QczGkA5fzQJMH176uxHXDNNLiGjBXzz2pTfsOScwWy9/6Rv/Iqc
	 cuL4HarrXa1zerYdAQpxlac5SbM9J/ADrIt5mghpaVVuum4jE5Mtmdo7cRDp6wErRv
	 gAqJFplX+Ol/Eaw7Fy5uHzDzSgwjLmi4zeyJfQAI=
Date: Fri, 30 Oct 2026 09:22:21 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org,
	stable <stable@kernel.org>
Subject: Re: [PATCH 0/9] w1: a bunch of llm-found fixes
Message-ID: <2026103048-unkind-eatery-98dc@gregkh>
References: <20261027-llm-char-misc-w1-v1-0-d2e6bfafb6a4@linuxfoundation.org>
 <c1845af2-cd2f-41db-9407-ed2d1f073a27@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1845af2-cd2f-41db-9407-ed2d1f073a27@kernel.org>

On Fri, Oct 30, 2026 at 09:14:02AM +0100, Krzysztof Kozlowski wrote:
> On 27/10/2026 17:04, Greg Kroah-Hartman wrote:
> > Here's a series of some small llm-found fixes that have been sent to me
> > recently.  Most of them are just minor bugfixes and locking cleanups,
> > but they are good to have from what I can tell.
> > 
> > Submitting them here to get a solid Sashiko run.  If they seem sane, and
> > you want me to take these directly through my char-misc tree I can do
> > that now, or I can gladly wait for you to resend them if you wish to do
> > that instead.
> 
> Problem is that it seems Sashiko skipped them:
> https://sashiko.dev/#/patchset/20261027-llm-char-misc-w1-v1-0-d2e6bfafb6a4%40linuxfoundation.org
> 
> Status is "Skipped" everywhere.

Shows "Reviewed" everywhere for me for all of them with "no regression".

Are we seeing different outputs?

thanks,

greg k-h
