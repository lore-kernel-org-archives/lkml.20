Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D23D3A0B3F;
	Sat,  3 Oct 2026 23:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791068860; cv=none; b=N2Ccevsp0ecCexXSo8OhGlsUau6VhApopisSwLoRBryzAUF0ljpHXiDbQvU7Rjb4M7fxITdhP4njUigGRkgBgRk84oX9OdzUn7aus+0Ji2omVrVMrm0F6jLRcKSd9VJcqFqvLdEiazvfyICW8kXK5YKtYL/3+MsjqGxCKpu6CFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791068860; c=relaxed/simple;
	bh=pXZ753EXxZ0rDeOgcXKs0/3eP84hflPvqSjN/CHle0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cp5uHHG/ISsLlChY6ZQtw4VALkkXwJA9xUcat22Zku7+konuVtyDUtYujy4t8DyndpAdK3GUKzNaOkWM4l0WlMvChZaMr9I0kg8MmVgh8KGsWGTrAMKGpYRKXRHRxOm9yYtx6GHoWLQIEf8GJIrD+o13HEcPdQ+0iiuHS/yx0gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4KYTYch; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4KYTYch"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A0751F0089B;
	Sat,  3 Oct 2026 23:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791068858;
	bh=pXZ753EXxZ0rDeOgcXKs0/3eP84hflPvqSjN/CHle0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H4KYTYchn5QENcIsAI4ZJ0RAm0yFUJPZCJhsCaNJ2ZoVvRSR5zW0ZkQhaux0etrvt
	 qLw+4alDsNyaKoP6Pa6BR13BS+UV0MCYTuxEyvMsH5YoflUTSXkWmNQxYtLfLJZhxd
	 zIh+s+GfAFeZKan7Ijbbz3FoRPlTv3o/APl7btgneK5qaU3d8McGOmDY3vr9yloFBk
	 4Xiw4UTQu5hD+8l+xM5x9xnhBX/I2zVnkr5rcfc36fI1CXhwiv+N+tt/JfTqkxd0Vb
	 sC9llrDPKigmvFtxsN/yiDMlmjxEIH6h91Lb0CbVdCG9qy9qe8uthxYhSxEInnoWL/
	 w4QKu8+fg/JEA==
Date: Sun, 4 Oct 2026 00:07:35 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] regulator: dt-bindings: Drop obsolete MAX8925 .txt
 binding
Message-ID: <20261004-opponent-poise-72f3ad0eb7af@spud>
References: <20261002171455.2719968-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YCFRIHGcr6S5powZ"
Content-Disposition: inline
In-Reply-To: <20261002171455.2719968-1-robh@kernel.org>

--YCFRIHGcr6S5powZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--YCFRIHGcr6S5powZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasGKtwAKCRB4tDGHoIJi
0mvwAQDsLDTTNG/hXy3WbW79QbJiQkcNOz97Qu4VLOuMHdKhIQD/V9wulPBBix8R
SI40TbTONVno6cijy1GTn52zoHH47g0=
=1paZ
-----END PGP SIGNATURE-----

--YCFRIHGcr6S5powZ--
