Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE22B48489A;
	Mon, 21 Sep 2026 12:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789995504; cv=none; b=M/nIyhf0sO+NsBfurN0Duci4Hhr39btFHKefhQeNlIQA3MSHLWBKK88WkwCiLLTRTubbyGJDsmBQHJPTB5AcaedDdi1FZP0F2oUjgFyeeKkP9vFxfmLN/kVGUPDbSEDtxVbo8/C9poDk7QS3MDUgncwXxAbCAC/uKI3eySEWWh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789995504; c=relaxed/simple;
	bh=pQi0J0YunJhXplLL+sgbHaVGA7/QXtJTj3Tofd0S8xA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQRFxxxIjuIOUJFD7QiTWgBFOMTTjUOsuB1Dpz/rxG8sMWdhrwSYDIsP2MbJ6NVDiwqyFjIBR7eZPacU1e6uhLl02fNy00NlWlRw/yUDy407LhP/JDPST/90H/z/lM2w56dZusJADmVvFGKhTtlLsc3KWfFg2EEvGHemReygsKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qp9kT314; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qp9kT314"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFAD1F000FF;
	Mon, 21 Sep 2026 12:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789995503;
	bh=3VbWLlyaEHg2UathF2G5uSXnVwszyfXrtQOLlzDwmEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qp9kT314S8DVOXWEpmL26eB7SeAdPfAMdxyzLR6vSauewv88aaZnqUzs1EjJaGRuM
	 T2Hvwte6rRPHIMV4o/yA4MKiEkER67S5P4vvtW9IBxoCF3YioXl6peIDgHZwHftk08
	 9WCbG0b7q9w/C4nFwdhX/yPGR6D0YnXqns/sC1BmhQWKeAeRYV2QCF9ptfXFfrIZup
	 1FB8U8dAYnngi6mxvyqB8GoLvzwaMDnKswL6pH5sJaDEAlzXh2byiU1nzDzqdydlqy
	 IzzWtEI1Ytcgx4qq4PBFsWggkna5IaKogH1dA9eTcmYp4hUeM4O32p+8Xw+Rywm9qK
	 k1XXyOVlKScag==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 96CE51AC5376; Mon, 21 Sep 2026 13:58:19 +0100 (BST)
Date: Mon, 21 Sep 2026 14:58:19 +0200
From: Mark Brown <broonie@kernel.org>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for MSI Thin A15 B7UCX
Message-ID: <arEp6425iJfq-fla@sirena.co.uk>
References: <20260918104944.649403-1-zhangheng@kylinos.cn>
 <arEHjbt3AY06j_Vc@sirena.co.uk>
 <fe055bde-3542-40ea-aec3-8d379c9599a1@kylinos.cn>
 <arEls1VrT5hZbUZb@sirena.co.uk>
 <3c782f01-209a-4977-a82b-15dd0c7c40e8@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="67wT7du4SRqCHX6r"
Content-Disposition: inline
In-Reply-To: <3c782f01-209a-4977-a82b-15dd0c7c40e8@kylinos.cn>
X-Cookie: Too clever is dumb.


--67wT7du4SRqCHX6r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 21, 2026 at 08:52:32PM +0800, Zhang Heng wrote:

> You're right, DMI_MATCH uses strstr() for matching, so the existing "Thin
> A15 B7UC" entry already covers "Thin A15 B7UCX". This patch is unnecessary;
> please ignore it.

Great, thanks for confirming.  Hopefully the existing change will make
it back to user kernels soon enough.

--67wT7du4SRqCHX6r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxKeoACgkQJNaLcl1U
h9A+8Af3amQw78vzj90vcuXuX9/hWwo4X1pkdPfCsZDP+h2tPvaS5QaUxnkZNUyU
TrHQ8UGok2eIZG/T64mc4yJ07UNeDUQhNqxmUCIdvYMloav733Wc9eMLwP55kQJv
oLcNhyA7UIxF92FjuJQ/qEERk30wWPkui6xVaTpMgIU5AP2PB//V5r8MqyKixoJU
9YYn3a+sn44ic/2XnrN3oB0XN5xCZUrk0c6qxMRyP3I5TzxnQ96X12RtiJRPqqJv
SXgePUXi5U2gNa8Zt++2dz4V5b2ukPk30+uqCgjOsh0PSaYNX5VfVLXQlxPmKpU4
Rnzr3BQZemXm5Sd+Mgf4i35Vt7LP
=p2QQ
-----END PGP SIGNATURE-----

--67wT7du4SRqCHX6r--
