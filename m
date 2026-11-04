Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801080;
	b=luvBWzhX3dQkGO2jdtIZIa4FpskX0MYtZboNhJBszweVJ+zrv1MRpUN6sX6rplaRrWu6
	 4UnbBB6VY7Q4jfrC/0pd7/rhj/ngErhJakfUrdk22Da5gqc8w3KvaJizYgEVpLOUI4jZV
	 zzzOa4NPOQdQmOIJxMhPlCsSX6VoRIhomD8jPR++s5TiVbsUKQrVSF5J9jkh1SLtMVGDn
	 9OnD/WusUk57r/eEG3p6BX/5O2lNyl3qTsu1W26qkgN1IJFspfSb9oVa43Rd45fzR97It
	 0kgNZk5wbPwY3hTHKwKXuYPHU+RBRGNs9YgJHcMDim/riGYYTb4Pu+6krF4zSmugHfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801080;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=b/1VQLOCie0uhZiFGY89y4fe8klAFzMb6jcobyf/7DM=;
	b=lgG6ofqjfUBPBSUDhKbcc8iAg5kKWmNW7ElVmAjDEZOjbLL7Ym/z5YUVRdwDy4531YmX
	 l9cFNSgdlYJKWzEYRC1jyjftklu1SbimOVpgjuNY8IdADEK8Esh77mawwmg1v4N2Onkf5
	 U4jM//WRtg4f+Xbos+P/99QNbb/OQ6RjZkRaDznzG14lTMRf6btx6Y14Q+skFiOYHIlwH
	 VpZcrC1cAHicKdRVePyZJgr+tSn9sd6EN8r7UUUmZhXWDAShHZq8r2mGCYqfB391sYvaA
	 0T3ctsrIzLT090Q9WnHUZn6PH095YjTPfILFybZ1lQKJjvqLkElX724MIst7N4fxyuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qulqA3ab;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF76606EEB6
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qulqA3ab
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D401F0157D;
	Wed,  4 Nov 2026 14:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793801079;
	bh=b/1VQLOCie0uhZiFGY89y4fe8klAFzMb6jcobyf/7DM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=qulqA3abyMOE5LyPQqK6sbQV8VEjh9ugTENeoLecI0rV7uIHEDb4VgWwsHz/jtiGB
	 y5Jt4h5EezqZToAk+6u4Y06XaokOC5ilod/frhHliJfiMnsxk4ONqUAfUCpRywGmo4
	 ibW7+pqtYyCziNG4I2iim4t2c0HMnvkdhd5ixHzQ=
Date: Wed, 4 Nov 2026 15:04:37 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ian Abbott <abbotti@mev.co.uk>
Cc: linux-kernel@vger.kernel.org,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] comedi: comedi_bond: Fix leak of opened device references
Message-ID: <2026110417-quickness-embattled-7482@gregkh>
References: <20261103173610.89687-1-abbotti@mev.co.uk>
 <2026110414-conjuror-squid-2777@gregkh>
 <f6c42bba-e4c7-494e-b22a-a56ce153d71d@mev.co.uk>
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
In-Reply-To: <f6c42bba-e4c7-494e-b22a-a56ce153d71d@mev.co.uk>

On Wed, Nov 04, 2026 at 02:00:17PM +0000, Ian Abbott wrote:
> On 04/11/2026 12:59, Greg Kroah-Hartman wrote:
> > On Tue, Nov 03, 2026 at 05:36:10PM +0000, Ian Abbott wrote:
> > > bonding_attach() calls do_dev_config() to open other comedi devices
> > > specified by the user and tries to make use of them as part of the
> > > 'bonding' device.  If it successfully opens the other device but cannot
> > > use it (either because it does not any subdevices of a type the
> > > 'bonding' device can use, or because of some error that occurs while
> > > dealing with its subdevices) then it is left in the open state and the
> > > fact that it is open does not get recorded by the 'bonding' device, so
> > > the reference to the opened device gets lost.  Fix it by closing the
> > > opened device if it could not be bound to the 'bonding' device.
> > > 
> > > To match previous behavior, if the opened device is unsuitable then
> > > ignore it (after closing it).  The opened devices recorded by the
> > > 'bonding' device will eventually get closed by bonding_detach() even if
> > > bonding_attach() returns an error.
> > > 
> > > Fixes: 3cf840f65ad5 ("Staging: comedi: add comedi_bond driver")
> > > Reported-by: Wentao Liang <vulab@iscas.ac.cn>
> > 
> > This is a known bot.  I'll be glad to take this patch if you redo it
> > from you and that you take the authorship.  As-is, I can't take it from
> > this fake "author", sorry.
> > 
> > greg k-h
> 
> Actually, I did redo it in a completely different way to the original patch.
> I just used the original patch as a bug report.  Should I remove just the
> "Reported-by:" line, or should I also remove the "Link:" to the original
> patch from the bot?

Ah crap, I missed that this was reported-by and not the author.  I'll go
take this as-is, my fault, sorry for the noise.

greg k-h
