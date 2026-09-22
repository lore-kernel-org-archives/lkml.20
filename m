Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A747559C90;
	Tue, 22 Sep 2026 13:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083717; cv=none; b=fDuLL0O9/OmHt6cggr1rFfeWDs1yfjdurvBfHcnsUrcNg5qu27c3VAoGFXHZui0Sm83o0p8227DzCNs+nyQHEMgW26kIK2hOgQOPrk9v50ultrD/a2nM+nA1xsYWxsvoJVGghdpeLgUNPtOWS8tWUvGhBzrgHH6txN1oQDUEj7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083717; c=relaxed/simple;
	bh=9eW88c8S/aoJHrxkAcI5AZAZsyv2cxHqMlwEPDgTMNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Db7K++3j/NXtQuAVkg6CitFXl0NOex4AJX/xE67eH6CiECBTeXWQ2qK/cbKzbMrzsYAYUi6at4Vb32h81x2bIQUf3Kc+RqA+eAm1mo5TJ81tYwNBw6nOzhFZ4oKMWbEq9h9R2AN9ZzPEgWBRhCIGQJae3cSltYWeR/7Hy6XLmSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cebMgg/L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cebMgg/L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB981F000FF;
	Tue, 22 Sep 2026 13:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790083715;
	bh=9eW88c8S/aoJHrxkAcI5AZAZsyv2cxHqMlwEPDgTMNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cebMgg/Low4lc+immEscrsxOFPXyB748Cyh3g4XYPTBw+Nzv0rhkyVEk2wpjEIjuF
	 6pn/B/e7osLnLAHsJBZuRSfmfQ40BQJ7b+7S6+1hoAqcXA7EmpF/kTswl6r1y3km7Q
	 5Hu1HAFeQHmo+ktX4Nm6jxeLg9KdAy4sKJYC0bBs/+9VighzSNmkfL6yKHZOPg73Xi
	 ySXUHQ53jT9ncWtQ6zAhy2ydAXjch2nTr5eDMcU1XsPlMw57aBOJwzRQVq12eSIiNj
	 +GSCGIMVtMM4+qNVJV4MbUgGaTKUMmhANeaA/Gp73kBrpJybBwQiXX92VsNZoy/6D7
	 AW5U0jJOT9bCg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id D468D1AC56C0; Tue, 22 Sep 2026 14:28:22 +0100 (BST)
Date: Tue, 22 Sep 2026 15:28:22 +0200
From: Mark Brown <broonie@kernel.org>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mikail <mikailb1998@gmail.com>
Subject: Re: [PATCH] ASoC: amd: acp: Add DMI quirk for Lenovo Yoga Pro 7
 14ASP9
Message-ID: <arKCdpOu3C85owdO@sirena.co.uk>
References: <20260922123029.534152-1-zhangheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ALKfgzAUxzWYfjey"
Content-Disposition: inline
In-Reply-To: <20260922123029.534152-1-zhangheng@kylinos.cn>
X-Cookie: Too clever is dumb.


--ALKfgzAUxzWYfjey
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 22, 2026 at 08:30:29PM +0800, Zhang Heng wrote:
> The Lenovo Yoga Pro 7 14ASP9 (83HN) has no digital microphone on the ACP
> PDM interface; all internal mics are wired to the Realtek ALC287 codec.
> Add 83HN to acp70_acpi_flag_override_table to prevent the legacy ACP
> driver from binding and exposing a non-functional PDM capture device,
> consistent with the sibling 83W5/83V9 entries.

This is good, but does show that we have what looks like a quirk in the
wrong driver from a28206060dc58 (ASoC: amd: yc: Add quirk for Lenovo
Yoga Pro 7 14ASP9), unless they reused a name or something.

--ALKfgzAUxzWYfjey
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqygnUACgkQJNaLcl1U
h9A8/Qf/fLXTheSP3Z6M7OK9AK8OnELUW79jbfgRuMksHQKHyglZaAGWEXmUK/d+
DnXLZKlz6YkV1SK5O4V02K/XOV5B6MalMJdKwBHljikUkD2/9EJsQ+Myv6LVPv19
DjUQn2iDlyey6Vq+//O05Vbb7SAm4hiLp4ijnDRbNH5L+p0eyhhwDUjOWbn6RwoE
dkQxlqyULIGPb5L+i8CvBE6XaQ3Bp6sPXy878NB5l8ooi+MvPwCKGMw5Yz0v32wz
YAlzSU4KKYYGT00SRvuiMyTPPCKjhF1U0qE5YvlPMBq14fUf3DxE5Dv6/YwrT1xi
0w+VrTQ4fnrA54HbRdZy6MS8JfME2Q==
=uohW
-----END PGP SIGNATURE-----

--ALKfgzAUxzWYfjey--
