Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13EA51355B;
	Wed, 16 Sep 2026 14:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568678; cv=none; b=gWxYBW0E9Q+WlGCvgAh1RDkBUHVP6k8ydh1QQInpY0IrKhTzXLhBmeEebou2uGAn3QcnI3vP4XqavBwkR6H0wffuUX5Dm0M/+XcwIn9gUz91Y855zA4w5od8QnbBqHzDgHL5DQ8CWvOZ10LxkWrKhxTXdZEnfcEc4QUP9PggVB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568678; c=relaxed/simple;
	bh=yJ2NAM0LpWKZdnca4jMkeaTkoAipNu1J8SrBUIxHwDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODZayjlYJSQ6/YaEt82i+GGR6MWg0ivwuBuWC/usC7ROft0m2ooxDScrlVVOSSuAXtuaXkVfhvHZnxN5psLVOZpnxi7os6Qp0TkvwW9VE7VNZyhs3+usrWq9ipPSMSumtqsYKPfoi8v4GWxhBdQ7jFTem95x7SR/YM3pKxlx7U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DN9SkkW7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DN9SkkW7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2797D1F000FF;
	Wed, 16 Sep 2026 14:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789568677;
	bh=r+t8TMvnEg/S8wMNGvfQI5r8XZzjEg9v2zKxhMkNNn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DN9SkkW7u5UqnyyONVE82AwVzHBH7vtha+0LcgW2indjV8A+Tc0QxZZQ5/HcTzdMM
	 QIl8j7TIF0WTHb/JV/tF6c77jYGlcKyBIFw4AnqZ1egdBCmT4rT9JAgJbiIsCOSeEY
	 pcexPHO/n9Nkw9eSMSFaJU7/ZHX03ATOipsIv/VP5hiHSlJSmhAPwl+ximPH9K8Ijz
	 KCSlaiRnr4U6MDkFOwRckrDFkOVrly5XA8cwp3/qBACDM7BOEQDo60S3z1dmkj+2QP
	 A6DKb1UWZmW5ESACDodl9bIuZ9VGCeXdUWTXbDHASnceNDzLvuH+LEq8dBIXynV/PC
	 PHzBxq+4yfooQ==
Date: Wed, 16 Sep 2026 15:24:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kvm-x86 tree
Message-ID: <e3dc428b-7dae-4a1f-b2ca-6085b2343d8a@sirena.org.uk>
References: <aqqap3DngKznNrSA@sirena.org.uk>
 <aqqiAbgDmfQBLPTA@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w0XxvTF6wZrZP78A"
Content-Disposition: inline
In-Reply-To: <aqqiAbgDmfQBLPTA@google.com>
X-Cookie: Double!


--w0XxvTF6wZrZP78A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 16, 2026 at 07:04:49AM -0700, Sean Christopherson wrote:

> The test also needs to override/define the memory region.  Not fully tested, but
> I think it's this:

Thanks for checking, I'll roll your fixup into my resolution tomorrow
unless someone says otherwise.

--w0XxvTF6wZrZP78A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqqpqAACgkQJNaLcl1U
h9CVCAf8CVG2G4jR1Fwwm2OzbHxx3PUgSERyb6vZQHWDV8wfHRELw9CbtnMuOIye
Hd3UuhadFs1L8jENpVuON9uxC06VNUaNT/j5R2sJcajglDfUnfilF77KCEHGhYWL
0w6XOFc7fsT3fedVhvjE30XzwoKaWODydjct3FjWv064HR0A0nOzEOecBeBHTn7D
+yYSwQHvfsA222dJiWbhq03rSuW6CCoWE1F/+4PHaKgOiSG4kPAHmojj9YwdlQBU
C+YWk//yRAu9eTyp9AC8T/27ECL9TIqGIGjxOwWcMg2gEayqfMxp28qKZU4Ssj1X
ScUFOFww2DGE/eWdBB9Hm0Nb6v4nug==
=/ej7
-----END PGP SIGNATURE-----

--w0XxvTF6wZrZP78A--
