Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985463;
	b=RBy4K4uLD96oTY8iNAjAHjeSXIJcIoH1hEC7rghjk1q3y3w72g/FBvmu+0BZ9DJKrZ7U
	 kxeljC+J2NRpNQdj4rGAHhmJa4qGV9vNxewm+sRkBxdUIMHU18Cr3r/6isz2ehasxgXMa
	 xIMasW+LNX6p8Ws/6uzlmRnpmHzdDtasGmJyrmGQlxUOAOCeU3Vf6ui7ZuWHlVBUQ6giY
	 6T5FVXq+sBe/KXCjso6DU+JZZZfj1dS7fnFse2VljJDuHtB663/iY5ewaqFkjb10zj/Bt
	 cc2A3iBqkmH6nkIB/gD7z9aRBbRsqrdg15JtlkwR+l10IbI58zxlp7djC/ewL8XjhHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985463;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=r5MRcDBiVmaF56L+TKdfQuiQz5NKLJ9vn1bExQarGUM=;
	b=a+TOOU54Z4moXq+RoDn8CcGtt15h22cBLu+nN2r3vR/dUkJgc6oOhX9nVdcraetmwFL5
	 PXuCyhvfA8VUFUV34zDdzMqlOJrfd7lsMJYxrIF7mxeJaoTDmmXi+aMXlzXwJ1aeIv++a
	 XeZRkaWDbdvIVTUnGV26v4y5cDpwwZk1Uh04S7NBHrlCdw++GG9ri7T1YwbqeuZtlUgo2
	 KHxrmRBNP9SarGsi/DVXBw+SEbeyyhRgqfJXqjKr0o3Ndy5I4mk9F/3GIi9/DzS/cdyOJ
	 xB6WGEinvzAJ0SZo1cLwGJ+Xo8TnppgboxRvMtqLtSWVunfsX5ScNRUG8ixJdPH1rDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TrfKL6M4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4413B606A32D;
	Fri,  6 Nov 2026 17:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TrfKL6M4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF331F008A2;
	Fri,  6 Nov 2026 17:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793985462;
	bh=r5MRcDBiVmaF56L+TKdfQuiQz5NKLJ9vn1bExQarGUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TrfKL6M4oJRQqos68GXQIN7AcGk+DWkz8zWAS7/KZvuznWo1i9oGVyh66eComALbg
	 T1hIl6D9DwBcUg2sgUP7yi17lnVVFfsXkCvoI/pVvOOkss+Jynq5+fsO4u4vgHJyfZ
	 7YZS0r4iEHPhMlOPPXeb4dBlM5TbSxWhX04DOMPk9mjMVK87dtA9v8ne/E0bOP89bu
	 yE9tHTzVN6oabAL5xxw644IiIVA0lVTsc2XqhCtlhN5pCBifEw8NzxthOHTFzgW/Zq
	 LubknQw9I+yGzXbcuSl2QEP1860EpgvVSPXh6N/EJTXCAwGota63PqI+jyQ+YfF/We
	 nXh/wH9h8eXyg==
Date: Fri, 6 Nov 2026 17:17:38 +0000
From: Conor Dooley <conor@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 01/10] dt-bindings: arm: amlogic: add the Amediatech X98Q
Message-ID: <20261106-ozone-unmoving-a5257f140856@spud>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-2-christian.koever-draxl@student.uibk.ac.at>
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
	protocol="application/pgp-signature"; boundary="43L1C2jAVesbohaI"
Content-Disposition: inline
In-Reply-To: <20261106104659.54656-2-christian.koever-draxl@student.uibk.ac.at>

--43L1C2jAVesbohaI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--43L1C2jAVesbohaI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau4LsgAKCRB4tDGHoIJi
0h5wAQD2Yv5p6EduM10yQbI+tmUxAN25JQQ2BJgn0EhNGxZZMwEAvFWm7X7O6pq8
Mkh7MwdDFZhBwElG6hSMS8g+UrLoHAE=
=7hXq
-----END PGP SIGNATURE-----

--43L1C2jAVesbohaI--
