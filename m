Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913811;
	b=id2Jpqx4Ta5x2lgKfB+KIAbNI3mjoLuJs9CSdpFqud2FjNN/1M157Fb936JGFPjQ5BJz
	 gTMWOTyEZaL1eQd5r4300Kmzhq/xvtvNkOOHQ8VNjJ5oVfm439EyuF7aVJI74lwPuAVQj
	 3Df3GJ3gQK7YcXRVSsCLhLCXF7EsUKIUzd8keOkOZtWYaGRb6BJDAjFonSNeDKkaDAZnI
	 pDLvx2WSJElQrvBwHR4LtTmJwQfQKPZY4UckL0K9HDE0p+R9gECjn6VEobJnjoPBovmnh
	 NyI4w5aPEESk/1D2AuQzbYidQLEdDQCwo9f0HpUZ/qk1x1eNIvuMbwTa2A1RRooBMyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913811;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=QxU79itN/fCXiwY1kUU+9UBb++2Vzi/0GRwpZ66iwFg=;
	b=POhnDpOb5FHBIbmRoS8NIOWOKVMCH2zE8DpQL9Sd3DWywch73z+PPv6721HBECJN8/Nm
	 5tNvwFG58FCJAOTYpucUJxnYStwAP44+pugmVyYpgzTj1m1dYTRMxBpfgIVI8pgxF5w6/
	 NJdESOXi97TWW1VIZ+/Vmxcrq/X8IG4QidHCIO1fUqyO6Z5yt/AixYZiqY0Jra4Q/8bRx
	 BhmerL/fiWA2HElYnWcW/LROMqcAj6P7SscO/0dYcjK2AQS2Iy0WKEHVkrAYYRppQw0Ay
	 zqE60b5804HzMN+SuAKZOtxw3wNnhkLz0qmP0DR4hKThNEnEtD/IwSaYUAa+YODlvCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RLZ1L36b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C333E606A31C;
	Tue, 17 Nov 2026 11:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RLZ1L36b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA5FA1F000C4;
	Tue, 17 Nov 2026 11:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794913811;
	bh=QxU79itN/fCXiwY1kUU+9UBb++2Vzi/0GRwpZ66iwFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RLZ1L36bZzwmMMsmB9iPvYjN5K1eHFmwI1TLzgLxX+9cHm4FzgNHMgTD1qXkrTVOG
	 HDsh4derjS/fcP+P+yLX5YT/zr5XAx8YKoyJwHgti0yPDiSPAenJJsJ+8GU2WecWXW
	 pL1WUwvxp2hEBiHLFjf6XgKGQ/sjIw8l/4fY0F1F/D5SvvGQLkByD5Ur2jjGS5mNbg
	 vXjC5AWbDDznWhamb9afYuNPaTpXQKJVJ4N/yEBZx+bCsrarH4XSM3WOVPNdIVRXHz
	 m/Iyvg15QLU0COj2c7WKmkKJBf8wg1UEslVZviQ2SPX31CDK6R7uXySoY+oDedc0Gv
	 5ngkL8nCy7iIA==
Date: Tue, 17 Nov 2026 11:10:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the gpio-brgl tree with the
 gpio-brgl-fixes tree
Message-ID: <6c6dceb4-1311-44a6-a25a-e85b984ecc19@sirena.org.uk>
References: <avtjEdUWiljJ5V7o@sirena.org.uk>
 <pb6e2wsemefeqkrzcvaqr7nfcsmufttvoooy6y3emypswaqnld@bflexif6xdgg>
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
	protocol="application/pgp-signature"; boundary="jgYT5BH6r5qLycUY"
Content-Disposition: inline
In-Reply-To: <pb6e2wsemefeqkrzcvaqr7nfcsmufttvoooy6y3emypswaqnld@bflexif6xdgg>
X-Cookie: Marriage, n.:


--jgYT5BH6r5qLycUY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 17, 2026 at 09:16:59AM +0100, Bartosz Golaszewski wrote:
> On Mon, Nov 16, 2026 at 08:09:53PM +0000, Mark Brown wrote:

> > - 				set_bit(GPIOD_FLAG_SHARED_PROXY, &gdev->descs[0].flags);
> >  -				__set_bit(GPIOD_FLAG_SHARED_PROXY,
> >  -					  &gdev->descs[0].flags);
> > ++				__set_bit(GPIOD_FLAG_SHARED_PROXY, &gdev->descs[0].flags);

> This should actually keep the atomic set_bit(). In any case, I will send
> a PR with fixes to Torvalds this week and pull back v7.4-rc4 into
> gpio/for-next once tagged.

Yeah, I didn't look up which one was atomic.

--jgYT5BH6r5qLycUY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr8Ng0ACgkQJNaLcl1U
h9C76gf/fXNdkFxRvSWeo+Wnyzao+KDEYmMbd/SXVSsT0gE6Npepk7cpWSLNceeu
0PiZs/vY8wRG4BJySiLAYg3L4rAQXgFD4XNAjhLn5V4RGe7BVcy6x4bY3v94sL3L
2sy2jrDzKmcUNmcBmEsE8sFY3paMwobdfHUiM18JobOydwqiMO40fZ+VWEbNmdL5
TW0YJUi2+AYTD0nXFGDqkQlNjsl8uQZgx5C+zaYYj3cDMPv9UqkdepJ3CP5Uxg6c
b/db83ejqcNoPFgiLXGFGAdmnxJP0S390ZsOHTz54DvBw+lDc4j4JLcS7GnfSIrU
HyFaSC/atnL8kG5UMIC27+j29Yjp/g==
=LYI6
-----END PGP SIGNATURE-----

--jgYT5BH6r5qLycUY--
