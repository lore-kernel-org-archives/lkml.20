Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B64D3D4107;
	Tue,  1 Sep 2026 15:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277721; cv=none; b=lHf883gwWLmVuhXc2Oe7/bEkb62ETkFSS4WZC5YcFljNX/DPzLOnuXSHQaycNAucwyssRItLMJJW32uX8J1Pb3PE2XfM/4P1b62IxJEAaY8i3aNnp2sZjVrkxUBtp8NmYjOpqRwY23rpCz5EhgGj413SiM2m6lDAV+YXShxf0yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277721; c=relaxed/simple;
	bh=LUPnHJffwrKh3+p5MhusFfbWLHx0ca/IUUvnQHUC7Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ldB/r/gTvWDmQy0uP/bAAURLZ0ky1Tnr4NE8ZmTAVJnDcBao/hPaD5nZjO4kf9e8b8xSZsX5OP+TTs0TWIYBNxjcO0iEg2vRVdPMfhDTmmFMBudccBXFQ3IdPk/G3OqsRIN4stviqinuo9fzg2gJlvGgTygPLuo0mg3IuFyY7d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Drqp6Fbx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Drqp6Fbx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF98E1F000E9;
	Tue,  1 Sep 2026 15:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788277719;
	bh=N9gRO91LOOW6FjXiPzh+ZRcNanMoi0TOiyPpH5Kcddc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Drqp6Fbxsg0kIJiultAkmkHU2+Q5JJTYUXd6QYL4aMnL0lW37tm8opL+Eixt6vYMM
	 usePT+3XsTBa1r9SunG/+WMVGPLkPGMmijVCLfcod/ATRVi2FG97c5V5r8vXSBaA1y
	 QBu+z3Xx2iss7RWxNdsnavVAxgBy68k2idOTb4UCbCDat7Vzsv7Bq18q/+HCcsCk+X
	 uLo9V1WYf+fvDM+K4X2WwOVzvf8yOTuxOK+1WFx7Ky8YxWuHWffS+Vzy0D8AD4w0BL
	 fhwx3m2zI93EL8h8LTB+sptBdWaR5NEDuVSqI9EKGRLMndKu7hJfS5mOffQCZ9+Krz
	 TskJWPAxETvpA==
Date: Tue, 1 Sep 2026 16:48:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v3] ASoC: cs35l56: Fix probe deadlock waiting for
 SoundWire enumeration
Message-ID: <627c6780-2a5b-4956-ae26-6ca6d13a41c0@sirena.org.uk>
References: <20260901122644.634494-1-rf@opensource.cirrus.com>
 <7feebecc-66f7-4ac2-8c1f-0b8bf55cb528@sirena.org.uk>
 <ff3602a0-f1c4-4b84-b1a7-c815e48eccb5@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tp1qSYlGx9yskAPh"
Content-Disposition: inline
In-Reply-To: <ff3602a0-f1c4-4b84-b1a7-c815e48eccb5@opensource.cirrus.com>
X-Cookie: Prevent forest fires.


--tp1qSYlGx9yskAPh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 01, 2026 at 04:38:37PM +0100, Richard Fitzgerald wrote:
> On 01/09/2026 4:18 pm, Mark Brown wrote:

> > I'll apply this since it's very much a corner case and there's a real
> > problem but you should probably check out the kexec case - it looks like
> > it misses freeze_kernel_threads().  TBH I'm not sure the issue there
> > isn't on the kexec side, it's not exactly a common case and having a
> > difference like that feels like asking for trouble.

> I think you are asking for a shutdown() handler that cancels the
> work.... ?

I didn't really look at what would be a good solution TBHi, that looks
plausible at first glance.

> If I've got that right, this isn't so urgent that I can't do a V4 with
> that change.

I've already pushed this version into CI.

--tp1qSYlGx9yskAPh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqW89MACgkQJNaLcl1U
h9DGuwf/T6dEu0oyL6jNS7mT6X/fMk5sxeC39LVZqFnyYSi7PfRlC8NMw/HzfNsc
HgC1sgJIjX2F4NU53UudVmHxbjwoLO9UQhN+j416gGlLnsO0k18IOzURmSxj9a1+
rvhf27JVYXZGdWiBFNuyCDWYYA79bFKnCv0OLk8q0mED6hn9G2CHpauioTyVOd+D
4e94mO0TCr2+zGXnvdvYC2VGInmqhr5Ityaz0TIXKggge3r9eDq/WFjsFKK1AlnV
NzB5U8yxD2z+xPMprp8Uue3YT1TsXH2QBWuL94tdckB95Q3MTIolU5wm+/5HBKES
Oqzpof1IG8T/wVEELu5sjTG6Cv9ClQ==
=zXSZ
-----END PGP SIGNATURE-----

--tp1qSYlGx9yskAPh--
