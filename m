Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9912E040D;
	Mon,  5 Oct 2026 10:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791197752; cv=none; b=DO2c1N10nDLcSdKKq58GNimfQkJwuH4QcFNi8GEWphJow8ltk4I91skGcjo2kFTujc9+ent41bouN53UgfTETxJBRmHnZmfvR3eL9L/4CXCnBvoUgynJEqRc0W/KWG0M5hQmeHaLUQohzOOyUMCj+GSjIfeBiDdXshFjQpWybKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791197752; c=relaxed/simple;
	bh=kPu4cTAyFijp/5LzJz2S7ETVefd0fKnlMAA7BPnhczw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QjwH7Sxe/zHnXDDQArF9crmjM2BhQO72QNIfkj/ehobLzvHzqWDIHgMJIbc48tfavDYc/vB2UvbgSQq88GtbM/rjgG/I2OhF/SYBv5nI/J/GXdrpKKk10wZ3EQOevG967IYu3uZuEo2xTmq7ld23WaeiscbNhbG+TpHWhWXh0+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=om8EkMFz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="om8EkMFz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D1C1F000FF;
	Mon,  5 Oct 2026 10:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791197747;
	bh=kPu4cTAyFijp/5LzJz2S7ETVefd0fKnlMAA7BPnhczw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=om8EkMFzf78sjtstoiKOqliBN1xBT1Uf3lRvA/+SK7ToDK9R4IH+WbXFnHFV5kGci
	 ZcML1a5WBi898HacD8CGokYWdrD6QKIFa1JB3UBpCelLUu1Ref9HE9Kt6i3cbGgi56
	 r/dMh7vyXeYPBNWvUgR+ssgABZsbO5/jOdz1RPrpyiWHug7yYHTR5T++/1e12zf0y8
	 pcSsoUXSiPtWIve4kI57oHjZHwdahbWSvv7KaeiCJ3dMrMucZrJ87FGEng9gZZ4k6G
	 QEXJx+0t1HdgpKs5Y259PZ+60u5bzxce5tgLq0YyY6DPwWPWcP6orbFtX4Fv2KkMvJ
	 6XmiSvjIW2fMg==
Date: Mon, 5 Oct 2026 11:55:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
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
Subject: Re: [PATCH 2/2] dt-bindings: display: panel: himax,hx83112b: Tighten
 compatible matching
Message-ID: <asOCLYbmmiuqmd3n@squawk>
References: <20261002-hx83112-compatible-contains-v1-0-d558635ab7fc@fairphone.com>
 <20261002-hx83112-compatible-contains-v1-2-d558635ab7fc@fairphone.com>
 <DLWSX9ZHDC8K.1KXUAR8VSMNND@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HV8m08xHwAClXTgt"
Content-Disposition: inline
In-Reply-To: <DLWSX9ZHDC8K.1KXUAR8VSMNND@fairphone.com>

--HV8m08xHwAClXTgt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--HV8m08xHwAClXTgt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasOCLQAKCRB4tDGHoIJi
0uhgAP9qcGH7w9LpSSRHkLL99d3mDpw6YcqXgX3/+/KeYBQuswEAhVOGqnpwvhWq
M/cWo1qYH8QCbVFjGr7KaGfVW+qmpQE=
=ZH+k
-----END PGP SIGNATURE-----

--HV8m08xHwAClXTgt--
