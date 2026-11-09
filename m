Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794264400;
	b=OmCx2BaY0DwW4/8Tdp20xkuXOfmn26FpJfsb/KJOL3+uglJE3qAz//rWOpr4A7DfMImW
	 U4l4yX9OoI64y8XgG9fxepzYe7OY0ufTfzbNMhntMp5yFO0X2itb/QPObWWX8i7dEJJDr
	 z2zGvSAAD5qfT98anXC3mCTESGQP/Z8qNXx31WeU8BZnCVZIAUA9mkaaOWgn5Bs7MHRHD
	 OHN+YU/prDbB6bE9wB/tLoX3kg2JgsZQjlG+R5K9DTQDpCHN5rK7KPOpT8ifBZVFlxWXV
	 F3QFJrBRqNMgLscCJNdPkofpLGnrBoH0LHbP9o8SLQfZ+961WWFIMgdkay5fUiza9Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794264400;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=99ERz8flZbLpQPPNoAjv3/NUymHqEQ6Zqht+l1a9AyA=;
	b=hKE5ip5dCMohqnYdVGTW/TEqSpS3seTDndWCAV2g5HT7iPuRvMD3OoFQEBHfsXtUHQfj
	 tjjwZpaiaQgMaFBrvvJnsx98+NZEB5Sy5X61H6pB5UkfRWBGWEIVfi3gZTZ6387zr3N1d
	 rVlj0KbbZzcZPUVxO9nG6pSOJpnPZLdMe1Cg0uvDqEKwwzCaFsAg/2HB4cSKh4miVsHKZ
	 r2dE0n1t4poy5varPTvjolBNSrkERaErqHusQUJHNT6MEKjcmdPyChOIOkLri2OHY5d1P
	 VpoJUzId3kSZLhHqni5/W4o1PYD1dTeDDiWkcEhjdGXI9mS2JD8tjnABAVtd+dGSI3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WVv19Bmh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABCC606A31C;
	Mon,  9 Nov 2026 22:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WVv19Bmh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECDA71F008A2;
	Mon,  9 Nov 2026 22:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794264399;
	bh=99ERz8flZbLpQPPNoAjv3/NUymHqEQ6Zqht+l1a9AyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WVv19Bmhz87HnsQSCA/FkWzzselaJaLHMd4cYpGHmvPnedpTvUw48Auxtgwr9NNgO
	 fpsSeqHdVQk1M8KfFcOmh3tKIsga5/ovC8tRdqrmDSEJPv4ti/LnwnK5+hZSVz/FF5
	 X2t4usFcHkkr5oK4Erzr2ik2gUsVSPZWGYnmBUPilD4rdmGycJZhSlyYgtVIFe31YD
	 6wuqt39zrWC8g6gikIWw0E9mlolI0CEAPMa9G55L7JSDWmzzHUlhgKe1F6cFXVt7x1
	 fr4I/RgvS8hQiowh+CsPsUboIvAmX1GQ/1Gh26tJYXAcWCgov5lY3XUTRmuI8UEzj0
	 OZUIaiXmezdkg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 04478303F03D; Mon, 09 Nov 2026 22:46:36 +0000 (GMT)
Date: Mon, 9 Nov 2026 22:46:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Nov 9
Message-ID: <d702ef91-9e9a-40dc-9707-717eca77ae24@sirena.org.uk>
References: <avHgrm2PmkCsLyDT@sirena.co.uk>
 <20261109200324.GA950470-robh@kernel.org>
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
	protocol="application/pgp-signature"; boundary="DVxg8HXME28h4Hfe"
Content-Disposition: inline
In-Reply-To: <20261109200324.GA950470-robh@kernel.org>
X-Cookie: Whoever dies with the most toys wins.


--DVxg8HXME28h4Hfe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2026 at 02:03:24PM -0600, Rob Herring wrote:

> It looks like a number of trees are missing today. For example, clk,=20
> reset, and i2c trees have fixes, but not next branches.

OK, it looks like the script messed up at some point - it did die and
need rolling back at one point, it looks like the rollback got confused
about where it rolled back to.

--DVxg8HXME28h4Hfe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavJNSwAKCRAv73Ows9A4
iRClAP49omJHVlVq4jHUk+POCXe5YfYG3IGrzEqMstEWvtoTdQD/a28q9WDCyejO
/jno8AjQmeKGj7tY0MQ+eXeXEAM8Aww=
=DtSz
-----END PGP SIGNATURE-----

--DVxg8HXME28h4Hfe--
