Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C763FC5C9;
	Tue, 13 Oct 2026 15:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903859; cv=none; b=nHieATLD17Nf5jA/Ybosk4GRhfyMME/Sy0rMPlDZOLPr1OUW7LCBNaqdy599PkKdelcnRfpKhLOU4UUdDBeycaUA+Te7gfrgqiyQwG0sMvqmJMTn/7il9AQpaxaMFRUh4B3HLP0xYvWR4KvTHeOoUtnGUeweCAlgT6xGdSh27r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903859; c=relaxed/simple;
	bh=kDymqmxAAH42ZEweufWRXGmB6MZyyDmVU8VIN9YD6Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WGwO1ABnPljqeHq2sMyxW/0FBwZBUqErIzszGIYGJbCDxmkWcom7mxzI91NAfPGed5kqZd3lg1ozU8OTgRHr7FkIQsfdYrrrX01w3R8Hz3oGfktrNj3gQEiurnY0XrfpzVCnojFxbpakjq7AOmcnuzr3eO/5f7OPR5ENF5iE9JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gFOQZGc1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gFOQZGc1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3C61F000FF;
	Tue, 13 Oct 2026 15:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791903858;
	bh=kDymqmxAAH42ZEweufWRXGmB6MZyyDmVU8VIN9YD6Rg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gFOQZGc1V0q1jefvSHkzLlVsZitmQoms061zc4KYp63POaa3IJwCcn0A9i3Um0eIO
	 0zfkGrR3Spi4MaTqpwuXVn+TFsfN2Xig9yeVUJ1Vz+FJ0kqJtpEfm6xcPD1vZIN3yG
	 XkadqnYu8AlKEw8q4VY61vUhNTjufDyp4nZ3xtFGSuoEC71A9gl2Dw0wZIQ2Cp05oR
	 2kKBk3EaFMCEJAeP8fbwGR97EoKGuxMOaJ9YE4AJUkA3ceThMBe6k+xhiSuM8d1uPn
	 ZyKHxBvquzqs8oKq/ZqIZkXtN6Sc71nTo8D2y/mxwkaksJpZNs2Rb1ALWsDyOX5WQi
	 MbT3gmXayF3uQ==
Date: Tue, 13 Oct 2026 16:04:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Daniel Pereira <danielmaraboo@gmail.com>,
	Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Jeff Layton <jlayton@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Christoph Hellwig <hch@infradead.org>, Jens Axboe <axboe@kernel.dk>,
	Brian Foster <bfoster@redhat.com>, Carlos Maiolino <cem@kernel.org>,
	David Disseldorp <ddiss@suse.de>,
	Jani Nikula <jani.nikula@intel.com>,
	Justin Stitt <justinstitt@google.com>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: remove Assisted-by references
Message-ID: <0bd14255-173c-4052-993c-328a399f6c3d@sirena.org.uk>
References: <20261013121501.3738437-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5Xqy1SIZHaPjc1N1"
Content-Disposition: inline
In-Reply-To: <20261013121501.3738437-1-sashal@kernel.org>
X-Cookie: Some equipment shown is optional.


--5Xqy1SIZHaPjc1N1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 13, 2026 at 08:15:01AM -0400, Sasha Levin wrote:
> Commit 78d979db6cef ("docs: add AI Coding Assistants documentation") asked
> contributors to add an Assisted-by tag to patches developed with help from an
> LLM, and commit 816d9992d9ed ("coding-assistants: simplify attribution") later
> reduced the tag to "Assisted-by: LLM".

Acked-by: Mark Brown <broonie@kernel.org>

--5Xqy1SIZHaPjc1N1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOSGgACgkQJNaLcl1U
h9CalQf7B6Kmz4Y6qCsjLl+8BkY19GF+gzvM/EZxk9oUrZ3lesBs3f4DKiNMdLl7
I9xWeli/gaMHIzHpCrmh8B2QHvjsB3kP+GTyxixMWT4BIbt3NwDLw8VY3v7MW46W
x6AL5hg3/lnmEd8l8UOpt024pfr8xo9UV+89fANDitNfqkc3B/najgVRQ+H5s1OQ
pz6OElIDSNNp7anqsBQEEHJjmShzuI7B9YgqcPTUKPTvtPfkSbbKDTiHQ8Z5ZvOy
HhYPPcXnZ8rzyxO2zMpjVmrVNViK++UnB+8zmAOtGryooC+vahWdTz1WwBsKEbo5
ysLHwjhLwlQcKOFet0PUYNGhx++yfQ==
=Xv25
-----END PGP SIGNATURE-----

--5Xqy1SIZHaPjc1N1--
