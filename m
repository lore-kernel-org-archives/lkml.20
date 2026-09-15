Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42B44B0C9C;
	Tue, 15 Sep 2026 16:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490400; cv=none; b=o5yvpVR3WFdeRCcrwHT0dxbIYfOBJctlv/2Dm3m62Q7B7y9+9uSx5DDe9gFqTdhZmP8EG5FxzakpXziCRY8DKjM3o0d9ctjrsdc28GPrZsDNl1c6jQ63fYKE6blbXF4kK1yZZhS446LAxAmZSAXlszl8DGflW8vc0RYDKjEGUjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490400; c=relaxed/simple;
	bh=ZMWy0VYXnQAGMpT0HJ1q166LtYaFYVckQJmWgVnHR+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ni/2hdTOttXsz+miwFtnZ24Fqkdz2PaFP3Dez8Uc8lVMIXesg0kHepYdUtbmi7kI2tyvy8yyTrtArzABsdaYNwxqZAkUyfSXckZ45gtjgrubaVwNyVc1H5deZ2vGBrnsPZelZgRF7CBK6l/a9XodLVcpOxFXMV/ylYPDOiNq8O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPz8HCTI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPz8HCTI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5EA31F00893;
	Tue, 15 Sep 2026 16:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789490398;
	bh=PuZ6j6JF1ChW7MPqi4iEFQBnFuIjJBLN3GNjZsAM/f4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CPz8HCTIyehoZrQJwXMpcZ8KiCZzqevs1XE3u63m0iGZb/Eo1DbFUe/rwOs3R76Vz
	 0sEFn2/792LLePea3sB+tC+dfCX921xpZtssMIsCoXZAMQcqPw/aRIwwf+sY3VbTXS
	 zRqqNrKnleIDUGK1OlsZXiI/lbCtgVvX4mAo+SVVXgy9F9i+PwUWmkL8bG29VmMykC
	 aWPY9bfLZ+4zvLkCeV55qdbFp/oaujcxeUPDs97OFjxohzHN9HbolLw9cp4CR+C8lU
	 hHJvqfXwWqMTaiXj5oGpptSnzCoMSMDkbaEcNjJi3NA/Uuq6bREQ3AmAOZ0g73rqMo
	 X1RM9C2fvGZyg==
Date: Tue, 15 Sep 2026 17:39:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Mario Limonciello <superm1@kernel.org>,
	Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Huang <Alex.Huang2@amd.com>, Alex Hung <alex.hung@amd.com>,
	Alvin Lee <Alvin.Lee2@amd.com>,
	Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
	Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
	Dillon Varone <Dillon.Varone@amd.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Fangzhi Zuo <jerry.zuo@amd.com>, Feifei Xu <Feifei.Xu@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Ivan Lipski <ivan.lipski@amd.com>, James Lin <pinglei.lin@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Maarten Lankhorst <dev@lankhorst.se>,
	Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
	Ray Wu <ray.wu@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Satyajit Roy <sroy14@alum.utk.edu>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>,
	Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
	Tom Chung <chiahsuan.chung@amd.com>,
	Wenjing Liu <wenjing.liu@amd.com>,
	YiPeng Chai <YiPeng.Chai@amd.com>
Subject: Re: linux-next: manual merge of the amdgpu tree with the
 drm-misc,drm-fixes tree
Message-ID: <c77adf0a-cb58-4259-a60c-475e6acaed71@sirena.org.uk>
References: <aqQBUuTVpgnTkQ8k@sirena.org.uk>
 <20260914230828.GA331288@ax162>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Znc6q/+wb3taeRX4"
Content-Disposition: inline
In-Reply-To: <20260914230828.GA331288@ax162>
X-Cookie: Void where prohibited by law.


--Znc6q/+wb3taeRX4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 04:08:28PM -0700, Nathan Chancellor wrote:

> Given f65198b3d0738, it seems like 0412b1064a3bd is pointless and could
> be reverted entirely to try and avoid this conflict altogether? I tested
> the following diff and it seems to build cleanly for me.

Unfortunately there's more conflicts in there, and previous bad
resolutions of some of them, so that revert still leaves everything
broken by itself when done on my end.  It would be *really* good to get
any kind of response from the amdgpu people (or drm-misc who are the
other side of the conflict), it is very concerning that there is no
apparent interest from anyone working on the code in resolving these
issues. =20

Given that lack of interest and the amount of time that's being taken up
trying to fix things up I've just marked the tests as BROKEN and deleted
a bunch of now unused stuff instead, hopefully that keeps some control
on the noise.

--Znc6q/+wb3taeRX4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqpdNUACgkQJNaLcl1U
h9Aaegf+Pa0zRuF0YodBFYHSNTJ8f/9hrFO8noIWu9s8kns/gwCBNqN/um/sCkkk
Eori1VCqXrQEJwojO2rZk+2vhYDRWoJ7URCLd9kEVrGhQ22bqi/mU/h9K3gTn9oO
JtNu66GQEcEnbOwvVN6zl3hCU8vq+Up88gYNDmJYYHmI1XJJ5q3GeY/ja5FakPLw
on8T7z9JrAhh7pjT8t9XlCxel5BcOBiTBEzumiXLgVKcxE8ACPKT2tIbZ3ptSlUU
cOE3jDRLokc/uLyOJiDlwqk6STNFKISWbqgRhrNJYnlCHpiNSOILpUSZ9U8e6/yL
MH5cmIainIovIGFX3JfShLClewoztA==
=kcOj
-----END PGP SIGNATURE-----

--Znc6q/+wb3taeRX4--
