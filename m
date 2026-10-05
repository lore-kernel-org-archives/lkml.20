Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB6547ACC0;
	Mon,  5 Oct 2026 10:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791197692; cv=none; b=M3nhYhLf/Ru1d3CvH5SKWrRDzZ0iIhmu8abQjAe5ecdNYWjybEneod/N05fWd7SminEK52ReWllHlgHJvXyq0L8hQXwAFlZhbHK0NFPKRAgy+4MVU6sr9oQuUCBWyMfLoYBJ3+4bSExLIFECTNIoUWR5vtwzODFuLYREQRqhDzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791197692; c=relaxed/simple;
	bh=4aOphlxRPVBxuWoEocxLm5Po9OeaVNbNJM8xAl/MU5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ky2Ao50rIa7X0j7nDjKwIWZSK/hZa9KSLDBPMFm/bB0ZMGshgJJ7IBN7wV1jYqVn1E5MIUMonVo20793o6FrlOl5tEksHhv/jULvDnSD4U5q2VlRXJwXzvCIiCZHHM9eur0Yz+hYNmXwbixoupFJYpQx2NXRYMb3LVqmTdRggeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZaeausFF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZaeausFF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FCE51F000FF;
	Mon,  5 Oct 2026 10:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791197691;
	bh=4aOphlxRPVBxuWoEocxLm5Po9OeaVNbNJM8xAl/MU5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZaeausFFJYnLsWIPauJzCjGNEytEx2XpHyKTPBa+6hq1wC5ouXkOvcOq0qKPvtpsC
	 QKw1NrbPto94WEc3DypNPEZDz2NPGyQkfAwxyIqnhZ6/ul+8si2C9W+U3ImMuxZwI0
	 tWtkivT/kY+1fEYuHawJ4JqoQDvMW0bZgtj8wNanLhb0YqnzeSb6HejFkcMlHbZaRA
	 DpcOawhFZfu1O26eGAKZmlzkGKd/+pEs0gKQ76aO/c10vf+Z6Hb7vI05D5+7tiL5m2
	 nyYA/ysEShT3est/VhxLpoG+3QDldT+Jfo0Q63pAZaRjsOCZD7AUF5amKiYJXzABfN
	 7Largm3793xkw==
Date: Mon, 5 Oct 2026 11:54:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: himax,hx83112a: Tighten
 compatible matching
Message-ID: <asOB9azB6OCN5fYH@squawk>
References: <20261002-hx83112-compatible-contains-v1-0-d558635ab7fc@fairphone.com>
 <20261002-hx83112-compatible-contains-v1-1-d558635ab7fc@fairphone.com>
 <9be89803-974c-4746-8af0-a13e5a19fb33@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RIqa/r0/keXy6YTE"
Content-Disposition: inline
In-Reply-To: <9be89803-974c-4746-8af0-a13e5a19fb33@linaro.org>

--RIqa/r0/keXy6YTE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--RIqa/r0/keXy6YTE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasOB9QAKCRB4tDGHoIJi
0ioTAQCm9zEIddkeZKgrUFGRAvTEXyK9EGR5tMTlusa2quGuuAD7BHGyTr47xeBU
y2PDNwtEgnc2DyFZx2ys0wU/gewdpAY=
=pQsR
-----END PGP SIGNATURE-----

--RIqa/r0/keXy6YTE--
