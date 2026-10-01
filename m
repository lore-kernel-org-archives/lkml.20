Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EF5293458;
	Thu,  1 Oct 2026 19:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790881526; cv=none; b=u7uhxrK/SHtsHdZ/cQfap7CrldUP0w895lG7CYUMwOJNp35pQYn/s+4FQglovofPg5JYB5GVhUECcin39j+msbqnwfCyUxIDJKcRzhWdeJvWOFMWY7oo6SBqn4IXimOOguDgPMt5sxdeHBx9aIwSr6jI5vf8cOKQJGiSEol+y2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790881526; c=relaxed/simple;
	bh=ULCZAzF92W8cEvDNkN3v/J39kTcuPaGZ1ayWcAVrL3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=guWZBbfNlq+75R2hEAQpqWyzbAJe8G8A4cda2alukwilPIW4v4iNe1kslu2FXajVWRpGllGQPj+iB29pYdn6KeMPncfWlW3CI6H/hIeHJH2c7AZsDtiLezzj21tRh3NfK++pA/hqNbAa4Y32m0Yn1RUMEfsdE6CQiJGby+CJRpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fNG08HIz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fNG08HIz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED311F000FF;
	Thu,  1 Oct 2026 19:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790881525;
	bh=ULCZAzF92W8cEvDNkN3v/J39kTcuPaGZ1ayWcAVrL3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fNG08HIzd0qOlvTEdrlqYniMi9MIpteftz45mB3SZCFivt8xql9vG1H9buYgyYJg5
	 UrhCoiCMnFIFF8PHMz8XPJHxKI61rUiIFSAMBmllmPj98EPMnKjdGCQjwI+gdD0Gxz
	 bxcjB82PIty0Y1hP+esfph7qtC2FV+bW55/ULvcem9AOtgZgend9DFn44ZnRbTOqNh
	 hsDloVizJxP1HYWKfnZHwa18ZRAj7p5QzxE5dwIBeb4+xNVhr4TtTPv1g6PGy9CFbq
	 qE24Eu7/nt11ZrPjJY0iYOvy9+cZHiwWbNSprldoXF/sRZc9zyv84XGDTHqr2VB7Y/
	 fUJ2vSVMk2d2g==
Date: Thu, 1 Oct 2026 20:05:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: riscv: thead: add Milk-V Meles
Message-ID: <20261001-lunchbox-armadillo-e0bd59798ec7@spud>
References: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
 <20261001-rv-meles-v2-1-c61052262f84@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jvPau8PB/4zi0Dsp"
Content-Disposition: inline
In-Reply-To: <20261001-rv-meles-v2-1-c61052262f84@iscas.ac.cn>

--jvPau8PB/4zi0Dsp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--jvPau8PB/4zi0Dsp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar6u8AAKCRB4tDGHoIJi
0l40AP93RodilJvAshZjnXeYrB6Og2MzSO222vPE0Q+9zK/+uQEAt/wiz75UQUMN
Isxpxgc63CkaXiIZxfCyoqkNiZ0+/gE=
=gxed
-----END PGP SIGNATURE-----

--jvPau8PB/4zi0Dsp--
