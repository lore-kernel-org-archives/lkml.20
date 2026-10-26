Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014075;
	b=OA8EhChPBPU2J+OTW7IGWMNnPfLImbGRvDABhE6Q5NDQVRSfGHHo2sW+rAFUHnxVpA1j
	 VqJgH0f2CY+dEEcr0rXr3hdt7fAAM4aQ0sV6BOIvRli4qTkk0pWfU6yOkg3441dg5RA6B
	 UI7XQZtGK/8Ykl9M1iffEQTzA3hxF7zeSo4MPLkQgzO7vheIHricrNBUePittmy7AcF2i
	 jvIt8Jt8Hb5rcaD/kYIcG+fvsnKIKJGf3i9qsJd2SATTYjQj5tKhOfgiol7tEbigQvOmB
	 lU7RIkenOy1AG/B+Lwm/tzC5Awd3DbUzh6aLIriitfNoJlm0pKZEGDJqcLgtOQpiIGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014075;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=+tiPWxbZOQfEU5/yMJic3kMJpur/5RbXUBkUfzXG8yY=;
	b=Y3zK9jWz7R+dVNs5UjJ384c7ov+Nkp7WNSn41QSdJ+wenwjcscZitu/TmUxAgh/F06sB
	 +tp5ct6vpyXyRGTNHf8bwDkJJifTeArDFhpdMF5owlrRH6lDXRyhylJsD2QnjTRTkHeqe
	 Tpu7riDaE3YUEHbj5zgmXEbMki8R7XYczsA57Z++UNO0T0y31wiLrQdsBQ9SK9QC3Dxjf
	 hr8Ta5HpGx1Bat1ek91RUu5knpFfn5kkb0t/elRiijEThxmDYZUYFjzL79CHacuJkRoLh
	 6Vrcppk8tZydzs69sPZygXoVS+35M4wNzdyZpSPuuaHcLbdN3ji2W0NVrCaQaIvasSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nYZErD+G;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A15606A31E;
	Mon, 26 Oct 2026 11:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nYZErD+G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D2CE1F01828;
	Mon, 26 Oct 2026 11:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793014074;
	bh=+tiPWxbZOQfEU5/yMJic3kMJpur/5RbXUBkUfzXG8yY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nYZErD+Gh10mccP8da0BljId97OWife8Bn4VwbzhFx2HOruy915xAfbG0I5suDeD6
	 v+c3lYe1iI3qvUIHEU5Fn+4/kDM3rJ6xKRCZUeE4x8doZy8EwULxjG9TsfYfmaWnik
	 xvc0lJDSCCRvANVn7AUxF5d+2ICbb5EI5QdT8250QPPYvmavYQt2t+zC52F8ayOiXM
	 wed43JCpbG+2iJL5i3juB5Hk6tQWWdppkSUmKMZybbSqP7lhBE45Qb7KVGX9YgATHL
	 sCOVrRXALS+EtbHsIK/wlvck77b5m9cofrtkR4n/IbGc2IUysviMu6sOLTMOyerFpQ
	 rTdB/M6CPe8PA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 611F01AC5994; Mon, 26 Oct 2026 11:27:51 +0000 (GMT)
Date: Mon, 26 Oct 2026 11:27:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org,
	workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
Message-ID: <at85N-zE4_v9CbW0@sirena.co.uk>
References: <20261020212235.1143086-1-ebiggers@kernel.org>
 <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
 <20261021063927.GA31908@sol>
 <d5d0801e-371c-4836-8b4a-26bff33df46f@kernel.org>
 <20261021064940.GC31908@sol>
 <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>
 <20261021163242.GB325924@killaraus.ideasonboard.com>
 <73d01869-b536-4fcd-a139-6f9d0a043347@kernel.org>
 <20261026104056.GH15441@killaraus.ideasonboard.com>
 <3f518c8c-2950-458e-95fb-5b282db4c384@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ssidfJvz7vJGMrNS"
Content-Disposition: inline
In-Reply-To: <3f518c8c-2950-458e-95fb-5b282db4c384@kernel.org>
X-Cookie: Victory or defeat!


--ssidfJvz7vJGMrNS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 26, 2026 at 11:48:16AM +0100, Krzysztof Kozlowski wrote:

> For me the downside is that if you require it, half or more of my
> patches would be rejected and I would need to add unnecessary step to
> remember. Since this step is pointless - it would be linux-next
> (assuming in the first place that this is what the author wanted here!)
> - it is a waste of time for me and potential resubmit of series, just to
> fulfill requirement which brings no benefits. So I have downside and I
> see no upside for my case, when you require the base.

> This might be affecting others as well, but now speaking about my
> workflow - I have a lot of independent cleanups, which I stack on top of
> each other, sometimes series, sometimes not, but stacking is important
> so when I run `make W=1` it passes.

That's super common in platform enablement scenarios as well, for test
purposes people are often working on top of a base that's got a pile of
other stuff that they need to get the platform running but is off topic
for the series in question.  You can do something like manually override
the base but that tends to bitrot which can lead to other issues, and if
you forget to override it people can get upset that you've given them a
base they can't find.

It's definitely nice if people can include their base commit info but it
can be more trouble than it's worth.

--ssidfJvz7vJGMrNS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCat85NAAKCRAv73Ows9A4
icDiAP4xfIKs/ISIGgLXal2GjQNEmayESAsJVBQ9/8kSzHvxZwD+KaSY7KEnBxLa
NBL8m8GoLLn0oq1jnP4d9FBIJh/SXwc=
=XbLr
-----END PGP SIGNATURE-----

--ssidfJvz7vJGMrNS--
