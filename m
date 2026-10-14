Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D838B3C1985;
	Wed, 14 Oct 2026 14:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987355; cv=none; b=ZcJvMzVFfVq1Eqnzai8f9lPQwHt+q1qfLAE2iAcBnuyNnsRzOVqScF1yQdqqAzVPnqpWv+GULWG66v/R7FCTxsvlZmnEj4oOLQCxi63oWfpiBUAVTYzWsogLvkuHve1YdEWkLxg2iByf4Q7sSx1aJ27m+h+z8X4zoT6H7SCo/gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987355; c=relaxed/simple;
	bh=yFy8jKNEVD5aCWcbmOASnsJk2pCrcuWkNIOMU0IPEjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qC5o/3izM9v0huhlfP+yBXzdf24rlpbEYtY2lUJMQzAuvrHrrRXz8VDUq2ncS25uqtjdEP13qwIaEA9ySp6jHrTMpyk8y5cTSv9uhtg0KZI2LBHR/7hKnb1/ynSL7g3pivPD9FO1wiKw9Gmi33eVvhr3ZLf/AdlT5weQvtYfe9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5r8eGWH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5r8eGWH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 500FB1F00ADB;
	Wed, 14 Oct 2026 14:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791987354;
	bh=cNm60TBpTyZut0H523+N0q+d3z2GKFPS8cxZLfYPT1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B5r8eGWHgk+I1TEgATWXTG7eRgO5lv1UuLPysWJwcZ5TgCFhyiY+iQJ3b4OWhctz8
	 HjFRhWGMJaqlTiIb4x4Z1470K2eQikWj1CUgrzMVr4vR2sjdWZfMR+yluK4U6EIvAv
	 agaqKU+wls3CmY89Q0qfHst1rxilBmujnW4H64imNeYQogt/AOYSpHlYJVZlvabXvl
	 fLxyFhKrDOuC8rsu43D2t2SQYH6jgElObDeKZ4og5to8LK92WUcpo3gx9mxzmZQ5AA
	 cBTHPdOc+k/150CvsLjga5sPYxHfhPxMl3+nXopjIAk6uWK/cwhhwOurxwP4YhHwEe
	 4aPBQiVlCUDmg==
Date: Wed, 14 Oct 2026 15:15:46 +0100
From: Mark Brown <broonie@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Theodore Tso <tytso@mit.edu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Justin Stitt <justinstitt@google.com>,
	Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brian Foster <bfoster@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Disseldorp <ddiss@suse.de>,
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <289112f3-41bf-4673-acb3-667bac48a76b@sirena.org.uk>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin>
 <as7uqZn9rQ52USwy@mit.edu>
 <as-Dwg8DcEOYMXki@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fbxWzeNq4nV8olKM"
Content-Disposition: inline
In-Reply-To: <as-Dwg8DcEOYMXki@gremlin>
X-Cookie: Live free or die.


--fbxWzeNq4nV8olKM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 14, 2026 at 02:42:09PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Tue, Oct 13, 2026 at 11:23:53PM -0400, Theodore Tso wrote:

> > I think we're going about this the wrong way.  What we want is high
> > quality contributions.  If they are high quality, who cares if they
> > are AI-generated or not?

> Recently 2 people sent 1,000 patches over 2 hours. Care to check each and
> every patch for 'quality'? :) Only the beginning.

And, crucially, unlike what would have tended to happen in the past with
mass patch sending a lot of the time the patches tend not to be
repetitive patches fixing the same issue in the same way in many places
like are seen when someone has a shiny new static check.

> > I also suspect it should be possible to use something like Jev or some
> > other System One LLM to help with an initial prioritization for the
> > patch, and then have that prioritization be set in patchwork.  Each

> Using AI to detect AI right now works, who knows in the future. But that's
> an arms race which we'll eventually lose. Which also costs money...

Reports I've seen from other areas suggest a noticable false positive
rate even with the current stuff.

--fbxWzeNq4nV8olKM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrPjpEACgkQJNaLcl1U
h9ASvggAhblOCoLUXEoPxwVvyi6GB2/D+t/3E8S5ENJTY1ft2fg1LoCQvTof7acG
DAY2yJIwnh+UaQaXvPaMQ4cDYxe5wpFi01EJiEtHD/GeClmOZL706bPCDcdDKPuM
i2/bpQk1OXRW0Vf7MhJqmW0drHKGTUrtmfPS3VFXplQWOlfQTXMC8kM0QhDmP2Jr
BNvTAN4fbi198ILQ6GnrTvDXok+3LROl0GGkDrqEF9od5dJ9mWq2VUhzUEdFaHAW
cVHIhXp7tvzTUNvEB5tbwCHEcf9LCRWnW1BKK/8ahokm6vlsbWLfVOHG6bDsorIC
PGxdCTv47f4Poh/rpam8XmBZvYEKfw==
=ZdWd
-----END PGP SIGNATURE-----

--fbxWzeNq4nV8olKM--
