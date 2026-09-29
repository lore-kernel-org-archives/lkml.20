Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AB738E126;
	Tue, 29 Sep 2026 11:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790680035; cv=none; b=es8/ZqLOru8imN2P5cz8dxR01v48ko0vzmWB3pDtgFzLLEAu81SCwesST51I8Xk+HwMo/2RS8Z9e34R4g6vH95rHhhkev68GNJCzXO3c08cxDhR9AvpZ/Adx3b+1h0GsTb2M8eDsK2cMlz7/ORtgmlqMrXQHt3Kx+flH8foo1GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790680035; c=relaxed/simple;
	bh=RJFcY5nz6JfsieSvNRnpFOMD6XV1Hg4bniXUDEvwxHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDnKFYKu81VN+q6DJOQEqbJf6wcp6Rn+s31Gig8wVA/tfkuoZfbkNStUKHru+pTfLpAVNp97bDnAtu2o53pm/2D3gdL22ZzpTmxvIbsX65stE0MT3k4ZfXMsdCue2VemgEmOnC0prwIitu8EuVxSN1yYO5ivnfSAiIb3DbHR8L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C1jHUvmr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C1jHUvmr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323881F000FF;
	Tue, 29 Sep 2026 11:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790680033;
	bh=wZg8OeRs/SeRQNgsYMK0ZHjoGNnsSNVwVhEfrtSBGS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C1jHUvmrMb9Nt+2IG9/4HjfMU2NPS91HhMdWZbl96yIYZVAvXpaxCyoMHtsci46P+
	 TnmZVNTdis23GzK9T/qLT6PICjngbJbaWvRUVvOwZWgE7d+xthBT1j7GEYHty2TvyT
	 QOgZGogTLATZqATlr2pOrN3k0TJ/cX3jVXtL0SO63OT2EgdVc279fWEfJCKfS239Uf
	 co2wdPTbKB1243U6jShtHzmkZ9ZEN/ml7eXuuYeTkSDwuX7CV9iMfOUFbqSWi8NBFr
	 +GOQBH4Qou2/2pREJw/xTlm2fGqlr3eQnSfyZRSbemzYxwWTe/Zehx9ASz2WnyMoXS
	 MxOQQzcOS6uCA==
Date: Tue, 29 Sep 2026 12:07:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
	Chandrakanth Patil <chandrakanth.patil@broadcom.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Ranjan Kumar <ranjan.kumar@broadcom.com>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the scsi tree
Message-ID: <3fa086ea-2868-4cac-a34b-2389355c31b0@sirena.org.uk>
References: <arp2hp7wRlcK_4D8@sirena.org.uk>
 <CAMuHMdUYNwi_MZtKGxnLLpUKDVAgRK8zT+2eaOcHAqcecx_LcA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OGtJtsMKcSf6QNL/"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUYNwi_MZtKGxnLLpUKDVAgRK8zT+2eaOcHAqcecx_LcA@mail.gmail.com>
X-Cookie: 1 bulls, 3 cows.


--OGtJtsMKcSf6QNL/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 29, 2026 at 10:48:09AM +0200, Geert Uytterhoeven wrote:
> On Mon, 28 Sept 2026 at 16:23, Mark Brown <broonie@kernel.org> wrote:

> >         }
> >  -      if (tgtdev)
> >  -              mpi3mr_tgtdev_put(tgtdev);
> >         kfree(mr_sas_port);
> >         return NULL;
> >   }

> Are you sure this is correct?
> Martin's conflict resolution in 0b5b2fb484f3b kept the

>        if (tgtdev)
>                mpi3mr_tgtdev_put(tgtdev);

> part.

Dunno.  There was another put came in further up the function.

--OGtJtsMKcSf6QNL/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq7m9wACgkQJNaLcl1U
h9D2twf/ccPrQOM6r5PfdzZLc4FogNHM7y6hau1cTOeFPy6sTDOHuKKkRMebbywR
F8/3S+X1cMFEaE1VQlAPdoNlblrhsIjwzl828YnIHA9P5KjZEg/LvQJlILJkDuha
gaT5zLarpYi7GIZ2Nl+ctOFhcMtXRXGSm/Cw4zmZ3ribh94751fvUrsHqlNQ33Pb
Gv5f0nuWnI3aA8VeEc/ghO2o/jk1uMeG6teIpH0kALx5MPrdRdaevYf91zeJH1v+
a6uMY0oOTyDz5C4tnaBddp8Oy5egDKHdprUVIJymiTuG6+jLTYRsj5bOjIOmobdq
62dRKJSYI1AhCLLroM49FR1Hsqv9Kg==
=QiIA
-----END PGP SIGNATURE-----

--OGtJtsMKcSf6QNL/--
