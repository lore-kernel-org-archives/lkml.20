Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A76E3F3296
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791756020; cv=none; b=aQmeosxBU9HXJ78CqOwQtnwVXimKxvcgcXK3rpweGYYXM0iRvKUlRWj9LBsgmkIvPM9MvOPwA9OWroqKvDgMBRQZIRsRieBOs2ASiDzDudmsBWi10JnISPl905xGaUCnPVdG9OVPqlLXXVx2XWr4006RV8F10DntwMcyfviI7/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791756020; c=relaxed/simple;
	bh=L+whpSUY8l7dBDYv2v/0jlwXxPfZEgsXE+WR12p+ftQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nv80VALMyJFXOkjLv+x+H7ZtV584G+OrU/tsNVkkjHgpagKYkdebQ8qZvLxDHBATmaOk7bzQgeBQ8N438Ze97hgl/fDp4dO8Z85SDz02HgMvlVaHyGUJ+8GEwhHwAjKCeJRJKyvf6qoMHC3UDUNsKiJiTine1FWaw0X0N/ISMfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=CdZxhgia; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="CdZxhgia"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=L+whpSUY8l7dBDYv2v/0jlwXxPfZEgsXE+WR12p+ftQ=; b=CdZxhg
	ia92+T7t9tNF9vFf9w3P69Jw3yi0P/s6f9KhxSwJFEMx3iadFoORgrniAV81+LBD/5qGjh/nRPaeD
	HJSrzr340wYnn7XQ8VDnzzILWHZoELF8LnEtpNLDZUWI4zLhVAnTWw5miSGMIpo6RUbBHIdge+A1Q
	rirkKWO+QO1q/F+5pLd2wZ4dMS8FJaEmRKoeG3izUopYp4QXNpqWr/nVRXoMInHfuY4JPpL9DxKpt
	wuIq7xjZVUQxZysrQD+18rU3B8ca2zxeLKeGUqIFurAmAmuW2aLACMqNwxhdMKlWPUsNTtiqfNoXA
	KsE+aN+ofpiPyAfbAml7z0hy00Vw==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xG1Zy-00000003Buv-2G6U;
	Sun, 11 Oct 2026 21:59:38 +0000
Message-ID: <16a9c5ef3fde0b7693e52dac91a2d397526dd99b.camel@surriel.com>
Subject: Re: [RFC NO CODE] [DISCUSSION] Anti-fragmenting ordered buddy
 allocator
From: Rik van Riel <riel@surriel.com>
To: Dev Jain <dev.jain@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, ryan.roberts@arm.com, 
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, 	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, 	kasong@tencent.com, qi.zheng@linux.dev,
 shakeel.butt@linux.dev, hannes@cmpxchg.org, 	brendan.jackman@linux.dev,
 ziy@nvidia.com
Date: Sun, 11 Oct 2026 17:59:38 -0400
In-Reply-To: <20261011215412.1181172-1-dev.jain@arm.com>
References: <20261011215412.1181172-1-dev.jain@arm.com>
Autocrypt: addr=riel@surriel.com; prefer-encrypt=mutual;
 keydata=mQENBFIt3aUBCADCK0LicyCYyMa0E1lodCDUBf6G+6C5UXKG1jEYwQu49cc/gUBTTk33A
 eo2hjn4JinVaPF3zfZprnKMEGGv4dHvEOCPWiNhlz5RtqH3SKJllq2dpeMS9RqbMvDA36rlJIIo47
 Z/nl6IA8MDhSqyqdnTY8z7LnQHqq16jAqwo7Ll9qALXz4yG1ZdSCmo80VPetBZZPw7WMjo+1hByv/
 lvdFnLfiQ52tayuuC1r9x2qZ/SYWd2M4p/f5CLmvG9UcnkbYFsKWz8bwOBWKg1PQcaYHLx06sHGdY
 dIDaeVvkIfMFwAprSo5EFU+aes2VB2ZjugOTbkkW2aPSWTRsBhPHhV6dABEBAAG0HlJpayB2YW4gU
 mllbCA8cmllbEByZWRoYXQuY29tPokBHwQwAQIACQUCW5LcVgIdIAAKCRDOed6ShMTeg05SB/986o
 gEgdq4byrtaBQKFg5LWfd8e+h+QzLOg/T8mSS3dJzFXe5JBOfvYg7Bj47xXi9I5sM+I9Lu9+1XVb/
 r2rGJrU1DwA09TnmyFtK76bgMF0sBEh1ECILYNQTEIemzNFwOWLZZlEhZFRJsZyX+mtEp/WQIygHV
 WjwuP69VJw+fPQvLOGn4j8W9QXuvhha7u1QJ7mYx4dLGHrZlHdwDsqpvWsW+3rsIqs1BBe5/Itz9o
 6y9gLNtQzwmSDioV8KhF85VmYInslhv5tUtMEppfdTLyX4SUKh8ftNIVmH9mXyRCZclSoa6IMd635
 Jq1Pj2/Lp64tOzSvN5Y9zaiCc5FucXtB9SaWsgdmFuIFJpZWwgPHJpZWxAc3VycmllbC5jb20+iQE
 +BBMBAgAoBQJSLd2lAhsjBQkSzAMABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDOed6ShMTe
 g4PpB/0ZivKYFt0LaB22ssWUrBoeNWCP1NY/lkq2QbPhR3agLB7ZXI97PF2z/5QD9Fuy/FD/jddPx
 KRTvFCtHcEzTOcFjBmf52uqgt3U40H9GM++0IM0yHusd9EzlaWsbp09vsAV2DwdqS69x9RPbvE/Ne
 fO5subhocH76okcF/aQiQ+oj2j6LJZGBJBVigOHg+4zyzdDgKM+jp0bvDI51KQ4XfxV593OhvkS3z
 3FPx0CE7l62WhWrieHyBblqvkTYgJ6dq4bsYpqxxGJOkQ47WpEUx6onH+rImWmPJbSYGhwBzTo0Mm
 G1Nb1qGPG+mTrSmJjDRxrwf1zjmYqQreWVSFEt26tBpSaWsgdmFuIFJpZWwgPHJpZWxAZmIuY29tP
 okBPgQTAQIAKAUCW5LbiAIbIwUJEswDAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQznneko
 TE3oOUEQgAsrGxjTC1bGtZyuvyQPcXclap11Ogib6rQywGYu6/Mnkbd6hbyY3wpdyQii/cas2S44N
 cQj8HkGv91JLVE24/Wt0gITPCH3rLVJJDGQxprHTVDs1t1RAbsbp0XTksZPCNWDGYIBo2aHDwErhI
 omYQ0Xluo1WBtH/UmHgirHvclsou1Ks9jyTxiPyUKRfae7GNOFiX99+ZlB27P3t8CjtSO831Ij0Ip
 QrfooZ21YVlUKw0Wy6Ll8EyefyrEYSh8KTm8dQj4O7xxvdg865TLeLpho5PwDRF+/mR3qi8CdGbkE
 c4pYZQO8UDXUN4S+pe0aTeTqlYw8rRHWF9TnvtpcNzZw==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2026-10-11 at 21:54 +0000, Dev Jain wrote:
>=20
>=20
> Apart from dividing the freelists between migratetypes, little
> attempt
> has been made to change the algorithm

Could I convince you to take a look at these
patches?

https://lore.kernel.org/all/20261007021250.1665929-1-riel@surriel.com/

My current plan is to first improve the
fragmentation at pageblock level, and then
add some slow path code on top of that
which can steer the allocations by physical
address range, to preserve the potential
for gigablock page lalocation.

--=20
All Rights Reversed.
