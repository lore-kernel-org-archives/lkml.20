Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F178375F96;
	Sun, 18 Oct 2026 11:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792324680; cv=none; b=oD3TCYi0Z5lqhLQjn62wfdHWreYDxNaXrpfhLOIrlm3Ie2VmQQQxIGmMQH1V1pX+JEkFuekjJlxiWoAqRjx+NQWvonF5BZpAOxpw0Bicf14G4eaFt53X3KrH3YWew7YhxMo9gfx8Evf8mDLu/Qu0haOSYbleT8vq/gRJbweGSWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792324680; c=relaxed/simple;
	bh=NZ2cHgCkwY4gwdbO78QpmhCB7TzgWfWjclqmOl5q/fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c/QKw35m3vQiaAxw6usMgpMYVkxR0koOdq8Xtm/qgZdlgvk1EWpWGvXGikTPybtVQUVsPEPjWyEDCldLQc/u7DVKusUgpUxRU/E8MQufK2JYNYmnAazSKqoA7EgTTiybnuf4onZB19yiEyZgS7itEaoVc2tF63gC/dpR22qyU8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f42AsHQf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f42AsHQf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EE381F000C4;
	Sun, 18 Oct 2026 11:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792324678;
	bh=bFn3lnOcdp7IF5zfTLjNgKskD0Gz2NSTbtDBNX2D5FM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f42AsHQfqOmhm2r4ajSWGlhBMpitZ86mDgHe6yRAjQ4/zGK9lhIygyZ/7R59qPGYj
	 mDltdquwKLmgJb93bLMwtRoB/XLcb8cfmGU/B58IOrMf1DP/0BLyciVxN8/JlSIaAL
	 pCwkE/FUapD2sUY0+jALHrDeM71iGxqtHLSv8Cy/1H7/78l9YSzowo86vpjBUzooCC
	 e1akU4fLefSp8KbYQein6mjvywYbs82A7ZYGaI2jO6/V8CTT5zD8p/uznd+QMo10qt
	 XLInudLYLfE0kcTc3a4E+nZ/RhhYEWIW3NxjFV5uTKeWFAuW3usI9n69fkCOPDgdcT
	 OnnU2DGOy0xlg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 1C4461C28B93; Sun, 18 Oct 2026 12:57:41 +0100 (BST)
Date: Sun, 18 Oct 2026 12:57:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: wsa884x: Add mute control knob
Message-ID: <atS0NW_IGmi0JTdu@sirena.org.uk>
References: <20261014-wsa884x-mute-support-v1-1-74d98d79e635@collabora.com>
 <55831eb0-b7b0-43f3-8c03-4d1029ea97a2@sirena.org.uk>
 <atPPpADkwx_5BeVf@venus>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ia++CWxg39jkujrT"
Content-Disposition: inline
In-Reply-To: <atPPpADkwx_5BeVf@venus>
X-Cookie: Whoever dies with the most toys wins.


--Ia++CWxg39jkujrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 17, 2026 at 09:45:33PM +0200, Sebastian Reichel wrote:
> On Thu, Oct 15, 2026 at 07:10:58PM +0100, Mark Brown wrote:

> > > +	guard(mutex)(&wsa884x->sp_lock);
> > > +	wsa884x->trigger_mute = mute;
> > > +	wsa884x_set_mute(component, mute || wsa884x->user_mute);

> > ...I can't see what guarantees that pa_on is set here.  It looks like
> > these are mono speakers with multiple speakers connected to a stream,
> > someone could fiddle with the routing on an active stream and power up a
> > speaker.  We should probably recheck in the speaker event.

> pa_on is set via SND_SOC_DAPM_POST_PMU/SND_SOC_DAPM_PRE_PMD. My
> rationale was, that mute update is not needed with the widget
> powered down and at startup the .mute_stream handler will update
> the mute state automatically.

Right, it'll work most of the time but if someone changes the routing
while the stream is running you should be able to hit a problem.

--Ia++CWxg39jkujrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatS0NAAKCRAv73Ows9A4
idQiAPwOepN3N7Bw9GMEWV5/4CcOgfdHTpwbL5FlJHOjBCB1yAEA/cVDUJwG37uw
L0YT+mybaLOFwXoj/8eDnMCsHyeahQ4=
=cB9A
-----END PGP SIGNATURE-----

--Ia++CWxg39jkujrT--
