Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE958357CF1;
	Tue, 29 Sep 2026 14:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690664; cv=none; b=Ykv7k3UDN93RKedErgDYMeKxGtu9fwLuZq7GHA1fhXNuvQY8b2QkvWsh3FTVxBFICi8tz8Krz0jo67VgAYe+xPvvjAjPVjg7lB7qVIgAGir1VObvOD6J/6DKKRnDjYD8VL4qSCZVO7dVeQqHEzKOwe8ZNHvWS3IpARFmrdfVpc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690664; c=relaxed/simple;
	bh=7Beief/aY40acquAlysDDsDhSM26f/vWWMc4htAyGyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=acZ0slbgHlekBCRHMf1T5Q454B32JXZlydbHWONtUb6bwcqWOpKpdse9F4kLS0kKelt8t2U8npdmhGko9sKJhWYMpnz4k3R9u3EhVprudtHxNFvwbA2bqJPOSkVJxDmyo+LCB+VIjawZX2HtbFMV0IZjfQoCx+lCb4tvFFDHRu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mSwJFt6s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mSwJFt6s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F2C61F000FF;
	Tue, 29 Sep 2026 14:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790690662;
	bh=XAhgXbQy/5JkeQnS0Q8cSaWD2SwouxVDoHmoWsMEBV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mSwJFt6sg5LzA/Khk3yIBk8HJ9mSb/mbkicxtMlj2a97b43iGNDDUE/NxBJQrfQxh
	 /fRWQyLDv9A6yLRxANuifYaiVQVCLYzQZv3jmHvsJIlGl8l/VhGLZWsza6ofzF8bce
	 yxReF7dm/XDhlrRALCUgtYiGhyg+KbcIJZL4KF8oamef9+QWsuHBCPdNN1YV2eUxuJ
	 lPCQruvxrfbZB+usxTGZiaoGk7h/GQzEgIrgakgkFCavgM4tifdRPblyh1OaThbHUl
	 WNQREDaXeX/zcSG1EFqjF+ojBXmmFIamnnosBv4SEbfZUFlZ8Ll8ofr1quuoUxIh04
	 x53pMe+OETz8A==
Date: Tue, 29 Sep 2026 15:04:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the qcom tree with the arm64 tree
Message-ID: <2ab1172a-9141-4644-9353-100c01b9b75f@sirena.org.uk>
References: <arZgzLfF0qjEXPpO@sirena.org.uk>
 <aru_PkpSpqgJlFBg@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LmHyOwbCQo8tbXuN"
Content-Disposition: inline
In-Reply-To: <aru_PkpSpqgJlFBg@arm.com>
X-Cookie: 1 bulls, 3 cows.


--LmHyOwbCQo8tbXuN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 02:38:31PM +0100, Catalin Marinas wrote:
> On Fri, Sep 25, 2026 at 12:53:48PM +0100, Mark Brown wrote:
> > Today's linux-next merge of the qcom tree got a conflict in:
> >=20
> >   include/linux/mod_devicetable.h
> >=20
> > between commit:
> >=20
> >   fe7f2a8054433 ("firmware: smccc: Add an Arm SMCCC bus")
> >=20
> > from the arm64 tree and commit:
> >=20
> >   fe7f2a8054433 ("firmware: smccc: Add an Arm SMCCC bus")
> >=20
> > from the qcom tree.

> Why does the qcom tree carry these patches? I have a stable branch if
> they need them.

I wouldn't trust my report of what the conflicting commit is there -
I've obviously messed up the paste and done the arm64 twice.  I think
the actual conflict was with 06cb5c457dd57 ("soc: qcom: apr: Drop unused
apr_device_id") which seems fairly obviously sensible for the tree.

--LmHyOwbCQo8tbXuN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq7xWEACgkQJNaLcl1U
h9DZJwf/UHJW+K1JFmGpwOcp0Azsxeq7dI9XiwMcVYJDSIQ9kOKDKWP8CFh3jq43
qKFgQQnNhuBYBLvzFTupjdamsmrMXQf+opsVAG9GrqlUgf8iBrgDD2Qpchdz6uMp
ToJuSSDhpyvMzm+g/2AcIuRvQunX9Q+zi53LAPriZMEanf0FyALPYJ4ZmsqMstrS
VV43hgf1DHTtNMKM/MI+pAjgx+BT0YEYS7O1TdUefhUCazWpoNn2rPR64JOA0itm
NrGyq707A/+bRFzpdzd2iesJWbZforGwdB5EqIqMK/zEUnvh5kqUwj4GEDE9IhvP
p7/4koIABe745lWaU1AupDB1kd6I8w==
=4hwJ
-----END PGP SIGNATURE-----

--LmHyOwbCQo8tbXuN--
