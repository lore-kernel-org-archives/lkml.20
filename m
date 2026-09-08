Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A59592205;
	Tue,  8 Sep 2026 17:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890119; cv=none; b=NTj0uYGJGwPoSe+ogjLjz6aB+OP/v0L7uFLXBwaOhQhKi98UZ3J8+cmS5aRN40ykeeLX1nH0ecOTbF7pAnSC87xxcWxQveOz66Mhyo39y0686Ub0FMb6DBBK+mA4gsQGz85WmGaIQwj2gX2vlMid1dSZC+8HPXDZ4qam5NSwAMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890119; c=relaxed/simple;
	bh=765idAEKKbWPuz2USlH1VcNBUvTkzIPKO0MxgkuZDTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDe8I3lST35oQGRMmw860XgFYuM6/euFshW+JOr5oA9yFyk0yOsxBhFifwKyPyzjTebAxGHlqb6vZ/68BXnkfDtq63WsoSbJPjdNQiGG5EPqJEfAcGp5RHKciXAtSxAbbdCQpSZYwyybTAqhjz2DmtECRBkx8yIxJJYBSFNALIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TO4wloGH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TO4wloGH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6ED41F00A3D;
	Tue,  8 Sep 2026 17:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788890118;
	bh=765idAEKKbWPuz2USlH1VcNBUvTkzIPKO0MxgkuZDTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TO4wloGHlbkHv52gHzObnN3VVqxM1a4e/M9o8fBTYihhow1bP9RJBw6jNnSBye4Ao
	 ntvkKCjI/vSDGmv+LIgaRXNIvv9lV7tKRSvyLYrKXZ3kzqGMhlPTFk2270uQ9tENoB
	 PWeZYkti1K+BEFDbSgGn0TrR4wUYfkknljXNTAtaFI1wjBFUa8OjOsHZ3+KTn9RSzp
	 +qCJPDcFTFah7hzjPiNXtM9aE/MORRz3hNqkBV+y0yT3Ditbou1V3KQJQE7h1Py6/A
	 gp/ouwO7LrmSgaxukWNxvEzu3I7rPQcOJSL3sciNtmX/oljsFGgv1izTei8qY6pC2q
	 TYl6leeLghpDQ==
Date: Tue, 8 Sep 2026 18:55:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: zhengxingda@iscas.ac.cn, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com,
	yclu4@nuvoton.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/6] dt-bindings: display: verisilicon,dc: add support
 for nuvoton,ma35d1-dcu
Message-ID: <20260908-elevating-eggnog-0d11f728f6f2@spud>
References: <20260908092840.225220-1-a0987203069@gmail.com>
 <20260908092840.225220-2-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bxAegO/MuCyNqq2e"
Content-Disposition: inline
In-Reply-To: <20260908092840.225220-2-a0987203069@gmail.com>

--bxAegO/MuCyNqq2e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--bxAegO/MuCyNqq2e
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqBMAAAKCRB4tDGHoIJi
0iZXAQCE8i0GV0vfMMOm3ja2XjSEnbf+JCqzgRyl/u9zngsMNgD/ZXAx3nxTMtoJ
P39HX+WyJk4Tjo3v5hxRuaPy++cdwwo=
=6YLb
-----END PGP SIGNATURE-----

--bxAegO/MuCyNqq2e--
