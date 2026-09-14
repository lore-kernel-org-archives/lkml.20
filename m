Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C415738838B;
	Mon, 14 Sep 2026 18:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789410868; cv=none; b=BbNtnqk2o0f4Dl5LMIWiOmFYbDVNCbmUEpGV/NbWe3WLS3778KJP3zinooZTFaldNjXYt2VPg6UfsF9KveHfquGe1BK1qnbKID8u/zXTMye56vcrepix6Z8VpMrYMgzKzgnIUIpg3GHldAzVBXWi6Mdoak7GfsjfQMGzG1E0N0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789410868; c=relaxed/simple;
	bh=P7vuABoQPB/jBq7MF1gSPsyzvKUQewcumsuLyNTDzXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qT22oCHWM0+5e2C1LSbomvjfdiH+RQJ6B/I6o3/xUFRj7Av2OzSBFCNKTQql6jBQ7JfW0/WfO5UQYn0ZqVL51LUHinGkbo5ZbGCZOSHivoDvErsK5eRRp4If7seYHmyKz0sQml6rY3zNVMBuFHVtX8WxBjJfC/ntz2+ZXwjiCAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJYEfIGr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJYEfIGr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260EE1F000FF;
	Mon, 14 Sep 2026 18:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789410866;
	bh=rWfUa8bmXSX552+TKwgWU2/ORXQ7Q1rSLsaWVFwWKOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MJYEfIGrctCrjp80fMHKOXL+v3+v0amDvVqRBdeLLF76eNP297tbt4N2hkUpC/EY8
	 sznchidEzPuY5BXJrdL3Qk1U/r6FvSouZfldBrCHdwCJ0jchfgmlon20ABH3i/IyX9
	 tlKRZ3e0ZjaMwXImYLMxWj1j8hmdsfinHS25br3JrEdfAQzq340GWMHZLKKys/hneP
	 EbJiCCFIczFPvH8PKF37Yrmt4PeTTXu9IBpgafISv1FkdrcmUoLptX2xV/ZtRWV1ws
	 dwGblnrLMxwcucJtFyLmILmqwAmzDk7HqZnouelylwENwi2le+HZ2RfdCnluPz8aJ0
	 frLzKwIpeUrIw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 3772BFDB50F; Mon, 14 Sep 2026 19:34:13 +0100 (BST)
Date: Mon, 14 Sep 2026 19:34:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, robh@kernel.org,
	Saikiran <bjsaikiran@gmail.com>, monish.chunara@oss.qualcomm.com,
	jishnu.prakash@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	lgirdwood@gmail.com, andersson@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/2] regulator: qcom-rpmh: Add off-on-delay support
Message-ID: <aqg-JSTrbg-xR69l@sirena.org.uk>
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
 <20260515111647.qg75thdvcbvvjpoi@hu-kamalw-hyd.qualcomm.com>
 <06a264d0-6a14-4b71-b783-82b771f04411@oss.qualcomm.com>
 <oa3okt7mdhoqmrebwim5yswarbcacbmhpwfvqbhtv6ib3cwrwi@ddox6mw3uhmy>
 <0d4fa333-df22-42b9-b9c2-ccb43ac4fac3@oss.qualcomm.com>
 <3pybhkqdvve2ct6burnhav3utis6nljz7ncheqcrs7v55ullz4@nek57empeoca>
 <086f8e7c-0afa-45d5-bdb2-54ac5f79eefa@sirena.org.uk>
 <xmjovrqonged7m77zlx4gbz6xvfksygbw7g4vgv2stlucvqoy6@uie3qdhdtkoe>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3w1ZrWn4GhR4n0Bg"
Content-Disposition: inline
In-Reply-To: <xmjovrqonged7m77zlx4gbz6xvfksygbw7g4vgv2stlucvqoy6@uie3qdhdtkoe>
X-Cookie: Orders subject to approval.


--3w1ZrWn4GhR4n0Bg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 09, 2026 at 02:34:21AM +0530, Kamal Wadhwa wrote:

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

> However recently on Qualcomm's QCS8300 RB4 boards we started seeing "NOP OUT" issue
> for UFS driver, where this patch seems to be helping.

> Also, Rob had earlier raised a few points to Saikiran on this patch series
> (https://lore.kernel.org/all/20260129174829.GA1324020-robh@kernel.org/):

> 3. If we can avoid turning the regulator off itself, so we may not need this delay

> point 3 - We evaluated this for UFS - but the problem is that the issue happens in
> the defer probe path, so if we avoid turning off the regulator, it leads to long
> error prints appearing for the regulator being left ON. So we couldn't take that
> path.

I think Rob might be thinking here of something like the runtime PM
autosuspend delay where once the final reference is dropped we wait some
time before we actually implement the power off in hardware, thus a
quick power cycle would never actually get implemented.  That does sound
like a good idea if we've got issues with quick cycling, obviously the
actual delay would still be needed but if you've got quick bounces
happening routinely then a delay like that would allow you to avoid both
power off and ramp delays.

--3w1ZrWn4GhR4n0Bg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqoPiQACgkQJNaLcl1U
h9B66Af/Z1tqV+rU3YT1wzEkMZtPgbjGkYlEPQq9zkJIbzo3O5Rv3ZK0mmP2ktCj
PMkcbyFA1Eih3z8Ig/1bena+n9JUt4x86hWGS8KdZyUUNkeDzDyvWGSLAhUPhr9N
encu5859kXdlZXAMEkBpYRLqtDAf1jzIX4ERiL0TaFJ7w9D7a6K/U0n++20vAjQX
hnLU9/GJMEKLmuxrOqJ8vCG9EZjsc2/ZCAtOowEhdQ4AI+09eox76Oi0bZxGdg6l
JjxdiJmPwV5tKMA6hz2rKBlgmLfEMeGZr1hpd8iGDxvT8BP8lUw/XDbLCIdZ9JLO
RrNvY5qPZzw9w7gBst8zrYgUcLq/fA==
=NvkX
-----END PGP SIGNATURE-----

--3w1ZrWn4GhR4n0Bg--
