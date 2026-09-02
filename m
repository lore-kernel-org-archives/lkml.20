Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0D346AA6C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788392942; cv=none; b=tVUwFt+51dMGvHimoBH9G/z+AHtFS8Sg6+rs8kdBahvRnBPO3szSV4naugpGZEmrDKn3GpgTGRGyrEaSjUpOYPPkLBhguBBlvUw4IPqX1xwdkyH36ElszcWVUCenEQvvBmMUo9UcNajjvLrJhreGFfCkcn/eA/wutp+offdR0cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788392942; c=relaxed/simple;
	bh=BgRVRxL6ZL67u+VQlczVaswQgh2gspDJGLIDfhaG7GA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vq+J1EsrbtPzGW06glsF7GB6obmyDjwSZWBrAw7CuqYMEYPlYs/ZinFyBJVtzPr3ngxr6DjLHmnt2zPviycml2sN0/rdGIfsD/5DAQckpPUKLXhm4B/q0n/6gfRRi7DkQVNSm1C81ZlXnjjl+fvLbqnrzH/rRQpEZfnJRB//2i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AvtB7aKe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AvtB7aKe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660941F000E9;
	Wed,  2 Sep 2026 23:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788392940;
	bh=VuK7Ny/cT+4GKAWxsI+MqljE9VygwNeU6/2zY4d2f0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AvtB7aKeIu4bzGDyFkNku9Gz2cu81uLIThsNIx8NMCxcYETay6k3ZU+6Z3DI3eIDv
	 GzObyM5CdwfAvSdR4DUvKBwSm+hEurWY69kYzuJtlFQJdafSH7dHivPq5TfRbF7pFA
	 GHoBrmagaqgdSnyTAToXaDD+i9e2XzjLPRpge7EYxSW1H6uA9u8NSGIlvV3uZMm75j
	 FD8ZzjK7GMeckhADIkYVAcXLb+YfZydebq+yrPNGoAvAI5FMzkxCru8Y/gbXxGk1pu
	 /RjbHNu7HMwF5XM3GkmW/0dWmL0z/CneJa9rprEhLA0qlodyxugat247GgDgr01qgf
	 7lBGDAGSS705A==
Date: Wed, 2 Sep 2026 16:49:00 -0700
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [GIT PULL] hardening fix for v7.3-rc2
Message-ID: <202609021647.3F67F66B@keescook>
References: <202609020931.48FF902461@keescook>
 <CAHk-=whZQzNuBZdV1b1TBxRf+asBGtvnC=Ggu755GaOg_TYXgw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whZQzNuBZdV1b1TBxRf+asBGtvnC=Ggu755GaOg_TYXgw@mail.gmail.com>

On Wed, Sep 02, 2026 at 04:07:46PM -0700, Linus Torvalds wrote:
> On Wed, 2 Sept 2026 at 09:31, Kees Cook <kees@kernel.org> wrote:
> >
> > - Default randstruct off with rust for better allmodconfig coverage
> >   (Mark Brown)
> 
> Should we just default randstruct off entirely?
> 
> It defaults to off for any *real* build for good reasons. I'm not
> convinced it should be on for build testing either. Maybe the active
> compiler bugs are gone, but this whole commit is just an example of
> how RANDSTRUCT_FULL really isn't a good default - not for real life,
> and not for build test coverage.

I have a fix for it with Rust, and it'll be in -next after -rc2 is out.
We still have real-world users that depend on randstruct, so I'd like to
continue to make breakage visible via all*config builds, etc.

-- 
Kees Cook
