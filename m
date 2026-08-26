Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C81B396D28;
	Wed, 26 Aug 2026 23:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787787175; cv=none; b=AHwLybR9WtJHSkhkIzRO2ph2VE4Kwc9QZVZgyF6vm4D6++0RFe1isjPGDWxjm+pUzQHGZhUnGrSyVXR6tdY0YpnJNU1Rj+dM+Yl6ndFQ3t/MgSvGly68YiZGhf46HJHv3vXPPBPo/9iMbZMrkUtv3fBwZkzbl89PQOnj6yOzNAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787787175; c=relaxed/simple;
	bh=QGAKNpqilNv4syG/BG3ldOkWpfQTkD8Rgp/ahyxg3JE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DbiSQQ7XgLq0oXrdlc85vVne4+zT+mz0Rr4yCBZwIRGgqTQSCeXKuKLcXd5KUroZVS+l07RCi0LcISCEjcL13lELxe8hoCjP4AOBhWOFVOjtJtDkNQOSeY5Q4HCYV1lUVIXtk3UrwEZsf3axKHc386kqlUgxG5iEP39HYavzTTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l82nydLK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l82nydLK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E7F1F000E9;
	Wed, 26 Aug 2026 23:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787787173;
	bh=w++uE1hbu24F3aiE2gO1EvdP5Mu8DsKn4/cJzh33mQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l82nydLKDpF2VxdZvEbPkxofMC9e0MnGeJNdrCl73pdFhRc2nsNH6plbAfRlVo3Fn
	 q5Fgzbdt0VCG3lY+nzwn0xuEPuCmA9bwtsy+5nGVHhKbpdimJbSZb5nnM5unplezrP
	 00YC0TfE2M+pT1VAqHxUXW1OjS8a+v01jWLJGLwPPE4LBldRpyRI7zLdMqc+WirBnU
	 uF9gcwI+0bm+ftaMsiFIGY/9z2U9HDff5e8FTKcBV7SJhHRNCmjV1L4TB08xy7oQGT
	 Hlj+hOD2WdY+/e1N4gxHl+UJxgGdGU0NsSS2cn415p4ITJzMXhGfg1b6PpyjsJVIPv
	 2e3pOseUgSQBw==
Date: Thu, 27 Aug 2026 00:32:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
	Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
Message-ID: <d59bd8cc-8b88-4529-8a3c-45358f9ba6c1@sirena.org.uk>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OlcSBZzqcGkzr3xy"
Content-Disposition: inline
In-Reply-To: <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com>
X-Cookie: Obey all traffic laws.


--OlcSBZzqcGkzr3xy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 02:01:52PM +0530, Mohammad Rafi Shaik wrote:
>=20
>=20
> On 8/24/2026 12:06 PM, Harendra Gautam wrote:
> > QAIF routes audio between system memory, external PCM/TDM/MI2S serial
> > interfaces and the internal Bolero/WCD codec. Platform Devicetree files
> > need a binding to describe the controller resources, DAI cells and per-
> > interface AIF configuration, and named constants to avoid raw numeric I=
Ds
> > in sound-dai references and child-node reg values.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--OlcSBZzqcGkzr3xy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqPd54ACgkQJNaLcl1U
h9Avxwf/Wguq/Ho9ljE0UDWZisjdl0Th051ywArm/+8Ij9ov/Ch5+CVn1h55nLSI
CuXqgjZ7fBlhiSoNMpmeD6KBdAAY3YEI8G/iIiXZ8T+YVpxR8ScVzif8t9OiZ2Xt
LT0/1tEhNvo3S2krpWJA3BRaBcXJC1QLTJpQ0Go14SpoYRizhCvniIDbIqmqf6sI
lTosNdBlwiAVx0m63O8qvFWmYi/vjthOcWbwX/Omixf51BHYGLOIIRs9DK3auslM
zhKHU0CP54Iggw+wsKEucQTpWNkWxTbhwll3Fdicg890LoI5a4LWhjO00ObNgyG3
sDMjsDrr7D9KFaxwcdfoSa1Ir60pQw==
=vAdf
-----END PGP SIGNATURE-----

--OlcSBZzqcGkzr3xy--
