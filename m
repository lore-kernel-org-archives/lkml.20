Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435CF44E671;
	Wed, 26 Aug 2026 16:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787760192; cv=none; b=g7WK0NBT1/mG+CyE35Y6l2sW3RvdcTu5xdvo9pUefxlnCq7sJDm8mtY77vVdqE5aabDOBLUgKQY6OCe57SB6x63f7dJsA8FUnOXuSimrY5atMTGocl3S6sfCWhk2DVzXSccfPmZ+m7wIQiIpvKGqWoSqKlmfuSLnu8EuqMfwOiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787760192; c=relaxed/simple;
	bh=2JTQubBjvQfLu6jkJMJBI2lduoGr/GayHRTWlLhxVaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tfU9c4MwQgHIGye3dhPHJQyeqwdl/tDyhzeYhuntUaLTEjoUHJs2J7Gpyh2yofnjOCi6Sn7ArZch4mYxGHD9fo0CEq6dO7D8XHKoeXBUvw32rfwb3HgfqvO9iWa6jOczYG3FgK6CdynOlICe1NS2xeYwUPAsRL5o2uOiUstFvQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NiAhv3bq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NiAhv3bq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7EE81F000E9;
	Wed, 26 Aug 2026 16:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787760184;
	bh=2JTQubBjvQfLu6jkJMJBI2lduoGr/GayHRTWlLhxVaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NiAhv3bqjbXVOACOHQ2GRxZQVGdO2Kaq0mkqd+GX5TXXCKw65bwY+LARjFOqA4ZpI
	 whoAr0go84Q8Q28bPs+kXWsGGRsjyvBx8bJlJmRlClz8Nz95nhi5DHTX+jmZSETcpY
	 I4S9ew4NeQgrVyy7z2mOSWOa9YsVoAWRL+O64GSQreXZFPOX+AnBOvzot4mhG8cZW6
	 bC91wUd9qT3QWi/StjnCok/s1ib6ZxsEI28QQ/DE1zSOpvpAkvDo5zK0rF9qmH8lr7
	 3hs74MgrSqpZAaA/yMfSGtYSU+RBtTqkIAN/LpuYODVhjhEon1QmJQKxYYv2ufaNsW
	 VYo4fFRq97vrg==
Date: Wed, 26 Aug 2026 17:02:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Amin Gattout <amin.gattout@gmail.com>
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: rockchip,rk3568-mipi-csi2: add
 rk3576 compatible
Message-ID: <20260826-paralysis-apply-9808186a040a@spud>
References: <20260826-csi-2-rcv-dts-v1-0-bcd8d459684d@gmail.com>
 <20260826-csi-2-rcv-dts-v1-1-bcd8d459684d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8NQRpl0hx+glIk1I"
Content-Disposition: inline
In-Reply-To: <20260826-csi-2-rcv-dts-v1-1-bcd8d459684d@gmail.com>

--8NQRpl0hx+glIk1I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--8NQRpl0hx+glIk1I
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCao8OMwAKCRB4tDGHoIJi
0qNVAQDws1oI74jTU6Lwdx4+GNMVbkYljAFVJrjengf0e7VoJAD+MR0x/6CRirei
QI1zIbqyBSCy8XYBjzxH/1LZtqqW6ws=
=tOwn
-----END PGP SIGNATURE-----

--8NQRpl0hx+glIk1I--
