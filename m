Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F6A4C2240;
	Fri,  9 Oct 2026 15:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559312; cv=none; b=flrIueQHAPxt14yqvGl+PunPGyRuZfuMgC8ywaBI630AkorpL606dtRF93/9mxeIkWVJEE3h9TwYgPNL1cECo4zUV2Ma875iEiDOW7yCR0amlfnrV1KUkptqz4NcDP3ia0y+oRYAb5mHHtVE7kPJoxszpZGpdaUmKocgIKc9dn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559312; c=relaxed/simple;
	bh=qjkhKhEh/cMgEs7tmcdfRQXOivEMlA/BPmEZ0BydoJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iuc5K43Y2gjVpukn7IPeS3aAD+hOafIN45/rCo52Oh2beOjg8IPvHggIRm89u4J/i7BHmPWq9+FFBG7mbmw7X5gitYGVo7O3fXz3FM9GfAF6q2QCCrwcq6dXc9RhA5on9FuzdHykSuMgqHel/QD6yxHByljRpTerAWiVmS3bT4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4whUwwi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4whUwwi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C8E1F000FF;
	Fri,  9 Oct 2026 15:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791559310;
	bh=Oeil0OBsVFhf4wOub0YpzLX8QnE9pOPV208uVpNkGnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H4whUwwiZjXqFbciB3ZukeMiaQi4Rdxbywhco2hjx9/Z0btTU2+9wI/a+mQDlv4tN
	 FLT3aMynbdgKB6zuF+u8ABuSHS6FY9CpfsvpkkeWD3gyDEBJWY87gliQ0DN/PvhZuX
	 8m15d5Xm2iR8+YoE8JwH20R+eqlu6hrE7UaNAf6X9AogBLcF34dsRs6uWt5noNMdOt
	 Dd6+TXaqH3xdj8GXnRmJSGPhZPCrwyhnQO4wicl/DRPx8VQzX/rxxbPNR3Yb6d5zJh
	 FqcnhxCVFNKYyZKZmhmrvCzTV7CrZJLXlK5UHnZLcLV7PwxjPw5CqK+kV+rSs7jM4m
	 h69Cn9nzC27iw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id C0C4E1AC57CE; Fri, 09 Oct 2026 16:21:45 +0100 (BST)
Date: Fri, 9 Oct 2026 17:21:45 +0200
From: Mark Brown <broonie@kernel.org>
To: Zhang Jiaxi <Z1529105815@outlook.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/4] ASoC: qcom: q6apm: correct PCM formats and error
 handling
Message-ID: <askGiTLKahhFv0CA@sirena.co.uk>
References: <SY5PR01MB10600B2BE812BAA1B0FA501B4A1932@SY5PR01MB10600.ausprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R+a1mqpbIyKTQsv7"
Content-Disposition: inline
In-Reply-To: <SY5PR01MB10600B2BE812BAA1B0FA501B4A1932@SY5PR01MB10600.ausprd01.prod.outlook.com>
X-Cookie: You will forget that you ever knew me.


--R+a1mqpbIyKTQsv7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 08, 2026 at 10:23:53PM +0000, Zhang Jiaxi wrote:
> This series addresses four AudioReach/Q6APM paths: PCM format lengths,
> prepare callers which ignore STOP failure, a stale readiness query and
> provider lookup, and V2 data completions which can publish false progress.

Your series isn't threaded together which will confuse tooling - you
might want to look at b4 to send the patches, especially it's web
submission endpoint which avoids having to configure mail:

   https://b4.docs.kernel.org/en/latest/contributor/overview.html


--R+a1mqpbIyKTQsv7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCaskGiQAKCRAv73Ows9A4
ibsvAQCBNPe4sg60jwpVqL7P3C7VnX4IDgydXc7LqVnjEwh1cgD7BiJ16nwxz8gi
Ebvq2jGVwf/KWNjUAwVb4ve9MWgogAc=
=5Dws
-----END PGP SIGNATURE-----

--R+a1mqpbIyKTQsv7--
