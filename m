Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043C249B475
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789637864; cv=none; b=B/ky1blK0bYU+B6GoVv0eZsrX3OevE+A4dQoCENz7wxpcGifzfM1RyRdm5HBnEZOCkHI7ISwRf0y645511zeVLBO5fD4BIjZkuqZH9J8ZrNpyz/vnB7HgrrdDdQrvmetfnvcb+ky3TK+DNnwXdy7TnlaWOupdZM9E+x4juIItY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789637864; c=relaxed/simple;
	bh=6gtq/mo1zgEXih4YrYPRueL+hCWgVSC1QNKpvuitJaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j35Xk4Rncn/4y+D50k3GlLr9G33OCvCY0okhIAE6a5r9Tw/13aNHb6M3BbGb8JLSb/fRkaA79dsbWS4Np/DeIiU/BZucfXYWPLzupieZfxZAnTCLdYMvZRn3Zlcb4C8Rj9vAsbiVJWRDDQF3vxeJsfiHLIQyk3zyoyQUDDMe1F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vNxLjr0U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vNxLjr0U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86591F000FF;
	Thu, 17 Sep 2026 09:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789637851;
	bh=G0f7QnHYqF96AVJMBxw1XyC1mx1yz+lMmwfZ4y/kAOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=vNxLjr0UUwyyT4lULwE8IcPSVSpqDPQFLq4hL862ikPMNkwgiWfpSussXuqvoRodz
	 /WoU9lNFeuqIvpbVMi6ghQTIeEt7tGSnM9hg5OneUz8LBvToR+ybUYYaOdk+xw+1GY
	 mz2MI1Y0uPcGiIF+PWaQx7jwcLaEvTVq8e4t2hwk=
Date: Thu, 17 Sep 2026 10:26:00 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Carlos Llamas <cmllamas@google.com>
Cc: tkjos@android.com, aliceryhl@google.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] binder: Fix up Kconfig dependancy due to removal of
 .c code
Message-ID: <2026091747-matchless-tamer-dca6@gregkh>
References: <2026091743-pony-prewar-735b@gregkh>
 <aquuL7LgSwc4ySbG@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aquuL7LgSwc4ySbG@google.com>

On Thu, Sep 17, 2026 at 09:09:03AM +0000, Carlos Llamas wrote:
> On Thu, Sep 17, 2026 at 09:46:44AM +0100, Greg Kroah-Hartman wrote:
> > When the .c binder code was removed, building the kernel if the rust
> > binder code was enabled, will cause the binder to not be built at all as
> > the option changed from .c to .rs which is probably not what the
> > original build wanted.
> 
> The idea was to avoid silently dropping CONFIG_ANDROID_BINDER_IPC, but I
> hadn't thought about this use case you mention. I agree it's better to
> keep things explicit as _RUST.
> 
> > 
> > Fix this up by renaming the option back to the _RUST version.  If in the
> > future, that suffix wants to be dropped, we can do so and then it will
> > be prompted for a choice again, but for this release cycle, it should
> > stay as-is.
> > 
> > Fixes: binder: rm -f binder.c
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> 
> Worked for me, I found no regressions. Thanks!
> 
> Tested-by: Carlos Llamas <cmllamas@google.com>

Thanks for the testing, sorry it took 3 tries :)

greg k-h
