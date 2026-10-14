Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2913C4B04A8;
	Wed, 14 Oct 2026 11:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977025; cv=none; b=eeyyEukYK3oXJFVgfxAgJgGzu+cr1vvZk2ZCXRo63yGbrb68GeexfSuHwHKGSUvMryys/OfUj2O7wmcRHt0yl9cCP8lGB3L1J9t+gwCP+XymrlgpjvRjrPFqM4JZPAN5fCsBFE6F7xKGYaYbFii72QpGmKTPlc1TgLDLY4EbmlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977025; c=relaxed/simple;
	bh=Q+RVusbeLdi8XIJXHf3HTvvYMVAilyCBSrlI/wes5Vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLiS/JvasZxeDDpUuMj525k0EDXkeegQ5E+VRyQyxcjxMXKUMPHTQK3u3ULU07SxkTWpJYeR2qfzTq0SKrUQ6O0C/mOSRxaooXR2juAZOZmwSGuDFX2pogWhqGO3xvmsv0dCOnXC9irG6Ew8kbShUNREdavHkXTEFnuhob1X8z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ff7i8vxE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ff7i8vxE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6AB1F000FF;
	Wed, 14 Oct 2026 11:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791977023;
	bh=JtekSZWk6e4uCmIrYJHo0FATFAlPDVmFTKhPQB8voEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ff7i8vxExXHeIuDPOnYsN54xDzxoUFP0iDWue5CcR/jHq18/dEGKXUahZrI/fFpEq
	 R/Lz49mqeD7x00fblhH5F6w7YeCEDM5iDbzkgeGH0IrtcbbUzSUVWd7/wvG43q19vQ
	 Ej7b1nrqJayVTmUuwp2kstkEWbkJul2wsQRUI7q/edQqm4ZB6p4ydSIjaX6eA8NLvb
	 v+QsUl9Pxni2WhwM1byepXWRKGWklhefLsO3HZEqaAu7GwIJgR9oj4iZJ2xR3uOuGn
	 nwDvySCfjxLVsxlR7ANobTovTS5RAw6aodkObP0dyDAf5t24HMsX+2SipRPgLJKw0D
	 MTOi4GVM5ltMw==
Date: Wed, 14 Oct 2026 12:23:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Theodore Tso <tytso@mit.edu>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
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
Message-ID: <18b8cc5e-477c-4ea4-b829-11cfeb85b0b3@sirena.org.uk>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin>
 <as7uqZn9rQ52USwy@mit.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CcA2oE3jWqldSecD"
Content-Disposition: inline
In-Reply-To: <as7uqZn9rQ52USwy@mit.edu>
X-Cookie: Live free or die.


--CcA2oE3jWqldSecD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 13, 2026 at 11:23:53PM -0400, Theodore Tso wrote:
> On Tue, Oct 13, 2026 at 02:29:08PM -0500, Lorenzo Stoakes (ARM) wrote:
> > On Tue, Oct 13, 2026 at 03:12:43PM +0200, Laurent Pinchart wrote:
> > > On Tue, Oct 13, 2026 at 01:59:33PM +0100, Lorenzo Stoakes (ARM) wrote:

> > > > Ignoring is the only workable long-term solution.

> > > How do you decide which patches to ignore ?

> > Anything that looks schloppy. ATM it's very easy to tell.

> I think we're going about this the wrong way.  What we want is high
> quality contributions.  If they are high quality, who cares if they
> are AI-generated or not?

I think when people are talking about slop there's always an implicit
quality gate in there, what people are talking about is questionable
contributions that have an aura of AI assistance about them.  It's a
specific term for a specific kind of problematic contribution.

--CcA2oE3jWqldSecD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrPZjcACgkQJNaLcl1U
h9BgxQf/WSCVFPpSX4m0B9KCLYfKnC1r1/ApOFFUWVLEJ9S6d/UR3ojfdWYmaeP4
ur4jEkPKBCXM4fN0s9aw9SBZEp3DNeMCvac4u3n+/jiw1GcK3POpgWiK3ls+Ogld
Lwm1Dd8BcVYEdseCpOsczzm6oR3G+yC2T2C1mpBPTesPcyulwHEcrHwZWqAp4q+6
D7KOcoOnTPcMo8jshtzTXTDIPTG1ujR3VCN/yxmc7gk9rOwWsin+jVPQm23s741X
nslf8VoQ+IDUms/BDADvOFLXpQTCDeKOnWThHaWMU/3LbD8IZ1BjNsGHAHrXCFyA
HkkKkpG36uyvIjkKM5ywrzRQwFy7hA==
=cj2/
-----END PGP SIGNATURE-----

--CcA2oE3jWqldSecD--
