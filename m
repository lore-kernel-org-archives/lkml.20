Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2717F400963;
	Tue, 29 Sep 2026 18:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790708167; cv=none; b=jE/Awj7ie9nT8KGIKnl4cMMNvqJrzGE9lgX0FcnU0QbH9Ym419QRZnWSYNjsLcW3Bhna1dsG8ZR4yShIiw3JrD9OUUw6/YiXsBK0x7khOJKF0q+TQP7oW29XxBDb1E6IJ82Pm2IpxhDx9k9KnTBBIuDaSH/HsDr0lz1w8ei1uQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790708167; c=relaxed/simple;
	bh=Xkhvea0RZw1+tuzxaBs0Ebnjpmv5xHcR8P/qUg74cWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cByGYLUpxy9ADipEN7SWSHDWRT0pI1GmgzTUOUTUmjWIBKNvy3fD9AW/pxYnlccAnqvzk9TyV50Y09pQDgbiT/k7FNBCt/7T6FsZrkFoarD8Nz+n8St6b2kQSWv/kQ3RYJmLgHAkPzL+Pd2kIGYrHpZz56/OaPkCDFljYOWZvIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMVZrUOi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMVZrUOi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC4B71F000FF;
	Tue, 29 Sep 2026 18:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790708165;
	bh=Xkhvea0RZw1+tuzxaBs0Ebnjpmv5xHcR8P/qUg74cWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QMVZrUOidXrJm32jrFre0CEzunEWWzJd1yAduRqz9MeubioZ7Z2hozCoW4jX3uaBv
	 S8cSQdQnWbg+g9F1wCg3wA/HBDIwjqQThpW1Cujg4ZRDLjsWF+rz1WmAvF71j7rCqe
	 Hf7PtF++0T2eUh6kL4s9DH0qiD78GsmYdXgNWYdvFXNOWJM9xe6cQSwdJjdjlXR4bv
	 edRpqCKZ8bByDO0GLOBoQ9IW35dBDEwBcn/GOWTUsuLMvAsgg88qNiYBy2oMq206aD
	 hF18OTKAlpPy2vE0jE7VqS8tKnWBK+5pO61egcfEWKIDSws/bi1sZ2ZZCeuEii9q/U
	 eKuErI4Vqn8Jw==
Date: Tue, 29 Sep 2026 19:56:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cory Tusar <cory.tusar@pid1solutions.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: eeprom: microchip,93lc46b: add
 Microchip 93LC86C
Message-ID: <20260929-strict-immature-474a9355fcbf@spud>
References: <20260929-eeprom-93xx46-93lc86c-v1-0-272791aac875@nexthop.ai>
 <20260929-eeprom-93xx46-93lc86c-v1-1-272791aac875@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lcoNXGu15q58qEFS"
Content-Disposition: inline
In-Reply-To: <20260929-eeprom-93xx46-93lc86c-v1-1-272791aac875@nexthop.ai>

--lcoNXGu15q58qEFS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--lcoNXGu15q58qEFS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarwJwQAKCRB4tDGHoIJi
0o+9AP9EbU90zgcFm9UWWujV4yQH3CbWxb8rpYp4Uuj6KQ0r1AD+KVKIKbQ22pNL
ZYccwYl7Pc/4/tilw5Xdjb8yA7FD+gI=
=PwxM
-----END PGP SIGNATURE-----

--lcoNXGu15q58qEFS--
