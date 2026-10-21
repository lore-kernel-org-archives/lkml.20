Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569471;
	b=YRpItiaMBP8jI7Ssgi4Dv/UcI8Nk8bPME3OzBLASlRQSYLDl9/xIjlSCPUNt3PXpC66W
	 FqJvZPjGm72torwM785Y8SBL9v7Yhyt4OW4lYkCz85pzUSe7B7YnWd9sdw9JyI9kI6JqT
	 td2xYHQxUTOaoNqM+BQpn8JtuAV2gZ5x1GrYnz2bniYRoivhnClKtkS6zUm5N5M9UBmD8
	 oj1w+lvS25W5klNSg+KhkQIwweTJEr9K65OC30F2PBJT7i2QlztXl2AvzuHyAnXbwtFKP
	 kw7eRATBFhc4m+EJOr/O2WJwRWgpM0denYdSfKa0C+af8yAkscNkL204uOgaWp07uyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569471;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qEyWhJwynwf8iJjLi/EWuE0iykobG6cHSjgd1fWvF2w=;
	b=skfMtDJrPkjUUHCWXRTfK+obw0Q7lSK5RH+lLfkwG27iQemZwULXV/ISWR1OFZfA21nm
	 9mYWhq77pmuJaOu+BonZl7zPU5/7NoGr+KcgnjxEQ9b3X/6YK6Sw30c3wOJzQveAjG5Gq
	 LSSAvGdhrXLLMj2Ho3Ykmn7gdIWXtL5QFV8DWlhx+qKMi/JPQ6YG5JBxWawxK3M/T4pNs
	 xbuA42swqopcsrl/33DdgJlONwIj5kA0rfrp491wn1h5LAwCtWmRS+tMhzBUR1OFO5fyp
	 KOYO6f+sxK0N0qxQxr3tvFxjTYqzvqQ+prJXsZ92DmzEbc8LRRVk67G4IclI65y/gWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=djAgYa9i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14358606A32C;
	Wed, 21 Oct 2026 07:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=djAgYa9i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2E31F000CB;
	Wed, 21 Oct 2026 07:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792569470;
	bh=qEyWhJwynwf8iJjLi/EWuE0iykobG6cHSjgd1fWvF2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=djAgYa9idwN5TUAQOsob+HoPWbM4LX/CKnz/uBqauklVnPe+yO+zfLTmv50svZgXx
	 /tGIE2V2Wr473ajfWZFdrc3EGIJaq5rGAv9PjFTsfDqn645yIVKPnfyZsBOj6xPwG2
	 f+i7LaSzLwG5t2GEf5oRTK1KkK8iQI4TU27L20Ic=
Date: Wed, 21 Oct 2026 09:55:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Sasha Levin <sashal@kernel.org>, workflows@vger.kernel.org,
	ksummit@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Leon Romanovsky <leon@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Kees Cook <kees@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dan Carpenter <error27@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Julia Lawall <julia.lawall@inria.fr>, SJ Park <sj@kernel.org>,
	Bradley Morgan <brads@mainlining.org>
Subject: Re: [PATCH v4 3/5] agents: add a skill to determine stable tags
Message-ID: <2026102130-hazing-amusing-990a@gregkh>
References: <20261020161642.3713052-1-sashal@kernel.org>
 <20261020161642.3713052-4-sashal@kernel.org>
 <abe59717-d93c-411b-821c-b6fd24965960@leemhuis.info>
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
In-Reply-To: <abe59717-d93c-411b-821c-b6fd24965960@leemhuis.info>

On Wed, Oct 21, 2026 at 08:56:24AM +0200, Thorsten Leemhuis wrote:
> On 10/20/26 18:16, Sasha Levin wrote:
> > Whether a fix needs a stable tag, and which releases it should reach, is
> > decided by hand and is often missed or left too broad. Add a skill that
> > [...]
> 
> Thx for this!
> 
> > +
> > +Judge a change by what it does, not by how its description labels it: a
> > +"cleanup" that releases a resource on an error path fixes a leak. In practice,
> > +the stable trees take:
> > +
> 
> Shouldn't something like "It fixes a user-reported regression" be in
> here -- maybe even at the top of the list given that "no regressions" is
> our #1 rule?

Sure, that would be nice too, an add-on-patch for it perhaps?

thanks,

greg k-h
