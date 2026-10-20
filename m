Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498127;
	b=B6eM5SFp/4VgRc7woJSh/9v9yYfPco56pY0Ye6T2jQw6Y5/7Fv5S2gE1r4PKEW5u/1+1
	 LGK/xMeha4ITVB6Ntl1CVZba+ZNKOocaeYtr/uLIkfiOCOE5qkycV+yUaGO23STD6WMRo
	 gNrVcd+LovJW4d/Fs64z2BRRppY82KxhUZdBTbMSAwVN7x4hRMU65j7VjbA28lgZsb8Ta
	 fmSDdclAn3Zj+0LcXGbIiQi2bbnMsdC4ILYZFFVU2ZjXV/0SAIZSQ6GQJYNHHeHgpzgd/
	 Ui8Mk0MuDf8jL3Frn1mI/fR6kCDl0AMeNWbOdxBhUFTL05TMf2qnOTkz4fRNk/P3fjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498127;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=o3HYFtbT84qJYX+FGS49qE6dDheWm1z/RgZhsb4Q7ek=;
	b=fHgidu+nP7KyiI7rs6OD6w80tQiP6HYT4hCzBOALvKyeDnS+ItYY41tIH8Ck910J8QBr
	 1DacW/UEWMS3xb27PpFJe6TmQH+sH6/xx+AVdmxP/hePel3YbK+a2f7pPo/f47GKFalcP
	 1TRqYOMoxhsbEH1MkpgnIQMns3KJ8TnUdTzcwVYW7ynvChCZOxs+XaSxX//KP48jKiFRY
	 M41qJPACVHntISEoe9jcSeIQCI7ZdR1mbJoDu2SMOnaQpgGs6d9MrrvI1NcfCgwpMI3XH
	 mwtlq6HatKHg3dHPqJl65a/INYAIeV9dpZIHHlEELVtzwaORS2bllhPnxbLiyEsR5wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A3ay8DbV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AC9606A31B;
	Tue, 20 Oct 2026 12:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A3ay8DbV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0825A1F000C4;
	Tue, 20 Oct 2026 12:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792498127;
	bh=o3HYFtbT84qJYX+FGS49qE6dDheWm1z/RgZhsb4Q7ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A3ay8DbVa1wWHxg17DxkKHb3vCbWSfi1ox+BHqlHep0/rx4ZG/Gs2PyrorGSVPEXl
	 zwVrapUZYB/m9GHL3gCX2uYHBWPmQMrufqVk8p3rQV9qQXOsE2QhwSI1s7ZJQRKagl
	 rl7zQ8OfPaQqje6Vth7vUJcvogVV9P5oGNJKjyf2Harai41X0IWithef6b6SQ9gIWr
	 /OtkE53t5X2FTvjmfcEM455Hs1Srm/ymkylnbPWxLbAKBLDg8/S+CR9NdDc7IYSsvh
	 fPRsCHegPyQJExkPJUqserXIaG60w9H51lOAIvJ0uaI7r1XIxQY34tXPyhRBmQieyU
	 u+vy6prXFBTHA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 325841AC57D0; Tue, 20 Oct 2026 13:08:44 +0100 (BST)
Date: Tue, 20 Oct 2026 13:08:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Mark Gross <markgross@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the drivers-x86 tree
Message-ID: <atdZzEMsMWhzO2gO@sirena.co.uk>
References: <arUBQuAfW4HJQHik@sirena.org.uk>
 <4ad00775-b067-452b-9869-29d5b6712f66@sirena.org.uk>
 <asOdosd0zROmuzu1@sirena.co.uk>
 <1a363159-02b9-4644-9cc8-38e210d97d5d@sirena.org.uk>
 <atZqoXnT_27rGAn9@sirena.co.uk>
 <e1119f07-83cc-8178-3c6a-e87778d3cb16@linux.intel.com>
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
	protocol="application/pgp-signature"; boundary="P3j17JiV0CwEqRby"
Content-Disposition: inline
In-Reply-To: <e1119f07-83cc-8178-3c6a-e87778d3cb16@linux.intel.com>
X-Cookie: You buttered your bread, now lie in it.


--P3j17JiV0CwEqRby
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 02:07:02PM +0300, Ilpo J=E4rvinen wrote:

> Something odd is likely going on here. Neither of those commits above are=
=20
> in my tree anymore.

> Your latest merge:

> commit 233956951080612ff68d0c54f620606c53a1c91c
> Merge: 67f116b3a9f8 98f039265e58

> I don't know how you got that 98f039265e58 but that hasn't been in pdx86=
=20
> tree for multiple days by now:

> https://git.kernel.org/pub/scm/infra/transparency-logs/gitolite/git/1.git=
/commit/?id=3D1bd7f5b78426fd94a4a3f75c79835a4416809e87

That's what I fetched yesterday, I don't know if there was some infra
issue which caused the fetch to fail.  What I'm seeing for today is
commit 893018d51f27ec0449155b0afe371aaf65380630, hopefully that's what
you expected.

--P3j17JiV0CwEqRby
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatdZywAKCRAv73Ows9A4
ieZPAP90JcMoLywyS8JowlZIy+wPuOozvfAHCOSp0rYg1y8G9AD/UH++c7kbWw0p
FKgloovNB7HW4fQWVt1IKeTNJXSEcwg=
=neIK
-----END PGP SIGNATURE-----

--P3j17JiV0CwEqRby--
