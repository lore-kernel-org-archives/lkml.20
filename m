Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10941442390;
	Mon, 14 Sep 2026 11:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384760; cv=none; b=kUkBAiR2hkL3dc3qYSWNmFKfyKsYyuA3WYB3xpQFACrbIux8cdafy7JtfSBawt66P4o2+jOKXSvzwBWWUkq1/cuEfhZ+a+8ULnUFaFp+8z17NzEgyi1HBKN0RJIEwPnNFFjnvVNB6V+Z7XoTVLTXs4wMTs++BjHwXU1VaMj6T3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384760; c=relaxed/simple;
	bh=7VxvFbcm41m9c/ctP47CWn6okHTprD0Fq/CoOKBRSGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kGOJV9fACyWdh7vwdxyxDHdlBvgnou7HLjLq9n8NhrSZEFEyiJZ0ed/0wAWMXzNd4ThKbNrREfT0GiZMGleMAJV53gqzRoiZfyQb7YxNvvww4jbilkv3fKaDY8U1lYv8CnU/FBOduD+He/vha+6KkLS6GOgN/qxwPXprWF9cGX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D15p4srn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D15p4srn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9131F000FF;
	Mon, 14 Sep 2026 11:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789384758;
	bh=LP07V5YM+QQcr0fAJYXFz5n2v9i20cN/Y6qlk3VF0rc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D15p4srn08KDfXPZkPeX00X/PlDxCUZufkZcuupwQTol9R8IkNR42QATTIdyWWbW9
	 BV7T7LWgxqPD6oT23Fs/lubyw161htELvKaeoN6NW10HtMspB4rq9OSj18qpOdCKMl
	 Y4aFwPRUmwPAXWQ4mcOzI7qnRS2xKRPFn2PnlB/oGm75MXSQNQYrgokcfteuAqvQoJ
	 TbKz2faXltWHQtivfP7CJtg/QHi3BnWrkYwiXRXlkHGpKKyTrVX6ZeHG8eWO/h/Mwy
	 5s4RXBsO9wLrey7AFesyH228eMrMyUVm04mYGDbegDZpLhyBwDK1EaKWbr70ZOhRT0
	 pRZapbkRAcnwQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 8D5531AC52F1; Mon, 14 Sep 2026 12:19:15 +0100 (BST)
Date: Mon, 14 Sep 2026 12:19:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc: Val Packett <val@packett.cool>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] ASoC: soc-core: use the device tree card name as
 long_name
Message-ID: <aqfYM0svh1mDZtqj@sirena.co.uk>
References: <20260506041112.412871-2-val@packett.cool>
 <aqfT4ZzmxtxM2Dn0@quark2.heme.sigxcpu.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kPQdevcAY7qj6T4B"
Content-Disposition: inline
In-Reply-To: <aqfT4ZzmxtxM2Dn0@quark2.heme.sigxcpu.org>
X-Cookie: My vaseline is RUNNING...


--kPQdevcAY7qj6T4B
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 01:00:49PM +0200, Guido G=FCnther wrote:
> On Wed, May 06, 2026 at 12:58:55AM -0300, Val Packett wrote:
> > When setting the model property for the sound card on an OF/DT system,
> > the expectation is that that model name would be used in the UCM config
> > path lookup. However, the DT model name was only used as the "short"
> > name, which gets overriden by the "long" name during loading, and
> > the "long" name is automatically set based on DMI data if available.
> > As a result, adding an intermediate bootloader such as U-Boot which
> > provides DMI data on a device that didn't have it before would break
> > the UCM config loading by suddenly looking at the "wrong" path.

> > Fix by assigning the DT model name to the long_name field as well.

I'm not convinced that there is a clear expectation here, any change
will doubtless upset some other user (for example someone using a system
derived from a reference board that happens to work with it's device
tree, or something where the firmware puts discovered information into
DMI).  Really you're just not supposed to combine DMI and DT based
discovery methods, having a system shipping both is just going to lead
to confusion and there's no way we can possibly get it right.  You have
decided that for your systems the DMI information is bad and you want to
override it but that doesn't mean that the next person won't make the
opposite choice.  Any decision here should be policy based in userspace
based on the full system information.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--kPQdevcAY7qj6T4B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqn2DIACgkQJNaLcl1U
h9BObAf0D0GSOt4U7kM91Fm8iZ0D2bQIGLUy9OOyIFdbIyB0By/1px3mjxUicNVj
Y9biPWMuK8JDAD1v9z/Gi6/HY6IN/Qu5V7jmksbGjc39cGjwDQpoIw8iLJgK6ePG
bUQdjR2XOBtwEHYJUnaQZ8GgvUYBFWmAm+1tczFWlOqz2wLeu5iRKyA0vz9Kc3mP
mxusyx2zMc8l9R9JyMXeBJTmb4hrJtA5EmChuua9adSMdyDOXDjxPdsoQW0WPs61
XN/HdYqf6FdDkc4A/FqiMOFvnY3h5ZbiezRKAbU9KSD3mCiLeE9604ahqRbfC/i/
g+eL2/Dvy6owjX0S1h8ioiHQXxFv
=ZD1X
-----END PGP SIGNATURE-----

--kPQdevcAY7qj6T4B--
