Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D58566C58;
	Thu, 15 Oct 2026 17:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792086903; cv=none; b=jMWq6dm9uweWHqcwVnHTbzh2mxCQBuC8Um5AXFPMLCvwEyAQB4aJhOLGf6ief9fxahKvBl7zK5zaPxKudFmwMvOXIDRewjehShbKICdYK+XK195LMaMDXRVUOqE0xTMUJ3bdPTdwxiLco4PtNVXEIAazSkEtcRqYkSG4ByDSLmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792086903; c=relaxed/simple;
	bh=jaqMRdxmRjsJU5dgnPTNECDUEUU1Qn26k41+D4Futnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6QEL6h6zjFrNPcGgXnVcMvS6vdCS8xUzK5ipoOk9g+vvf27Cyh/yzLv5qmfz35iCUt1tayQdcaX9pK3I0QJX9SM3Hsrt7376ZdYiQEjX0eUXHrEoGwb17jiV+TlfzwGNJLSku1PV0oLV4APO26QgtcseVtVRPxUGGBakRj+K0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GvdCHza6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GvdCHza6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3609C1F000C4;
	Thu, 15 Oct 2026 17:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792086896;
	bh=uqjl8P/1C6J6qZp0U3fth0vu1NJId71zBoeCHtYpV1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GvdCHza6jISI3u73/mEN6oTUfZD1LSc8g2bkldBoZXG17W6EDPP29x1urT1HlBkuJ
	 sRuAzVYN/ZNKOS5XP83OTirmEhMARcpdsu2mp1QUPl9Zy2QajGBoxoqxEmG+kXPvcH
	 o28JVSXVhbWllYZ3U82UBn0hkIVZwvXjYA3dtb/eFuePj18TD8fyrCK5ObHEMC51o1
	 ECAmH6Ia+3e0uwaepbwecFqQz9GhC1d5EXRG/fDyt0EK4ZZXyKmSQFy9R5oG6/yDfn
	 +7G4pKfDzdeY8CeBLhoVCUZGd+PULW1IwaqQg3jeq00OjiOkNOKcN+iGM8joGUuR0d
	 p88TqU1usfYHg==
Date: Thu, 15 Oct 2026 18:54:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: wsa884x: Add mute control knob
Message-ID: <60cd552f-1de0-4304-8e84-bb307cdea45f@sirena.org.uk>
References: <20261014-wsa884x-mute-support-v1-1-74d98d79e635@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rGybbNyIWZeQcPR1"
Content-Disposition: inline
In-Reply-To: <20261014-wsa884x-mute-support-v1-1-74d98d79e635@collabora.com>
X-Cookie: Tax and title extra.


--rGybbNyIWZeQcPR1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 14, 2026 at 07:02:54PM +0200, Sebastian Reichel wrote:
> This codec is typically used with ALSA UCM, which right now falls back
> to handling mute in software. Expose proper hardware mute control
> considering the driver already handles it internally anyways, which
> allows UCM to bind speaker mute LED to the new control knob.

The reason we have the mute control in stream startup is to mask
glitches caused by the hardware during startup, for example clocking
random things out of FIFOs.  Are we sure that this isn't an issue?

--rGybbNyIWZeQcPR1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrRE2sACgkQJNaLcl1U
h9Cn1wf/Slq1y4Lm483XDuKVG3SRy1PXcUpORrcXVkeIpS/c37hp9Yl7MkJF4vId
/aqM2eA7ziot50gQQqCID+y3mgpENg9APR8KyGoVRbat2rPhIF/u43DwhYL5oPH9
VqhfXeyn+P/rTu8bCaHeEAL1XPuVEQVPP8K0d6vsx3FEwK1KMv3hY3PlVtbhaYfo
nItyCkaAewIPRiEPoPYR1zQZj4PQLq3Lz23h1tOP0t1v4RrZqhUmaoI8g7NkAcXD
0Z41yjJn6d3ip3CFfGqkAS8MCjBMprD98wEK2QNmnQYNZbiSOaQR3tzBgsFgwvuG
8NMeyGCQH7l3SBFt1PCB96Q/zmL1dQ==
=qF5u
-----END PGP SIGNATURE-----

--rGybbNyIWZeQcPR1--
