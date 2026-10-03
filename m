Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD6423B63E
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987507; cv=none; b=L9+ll/55USR3cbKE3gu7FgQ4BIu/srCxOs6nzRJpvhFqBoXpetAkjzI993xZSwt9A8EOxYQK4fhOZvqO0ikbXh+Z0iYDsey2N+RJVgblUXxVhuAiJY2Ifa/powHmqnnyPKUfvVYDZsKKUzBIOzUU2UoEmckaW/BjLT3Wp1F11sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987507; c=relaxed/simple;
	bh=KJ8ZgFS4JU6o30G5Ax1odZwWw8GBuuDZ4cdczFgnpyY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jLMWZQxAePlWLdrcp2NewrjlpejV5iwZgAqya/OO1rUmigZUpkXbkpr453yZ27DxCyEe0i3qdsXCXxQ0nviAtlWjuEvamiLeG6ijHFZJvBK5sV60e7gqSt26EYkBMqJL6BKDzNUfxN4b7a2oKOxIRemyDNFgn93TGj+4OeAb6+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=OHenQ7dU; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="OHenQ7dU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=KJ8ZgFS4JU6o30G5Ax1odZwWw8GBuuDZ4cdczFgnpyY=; b=OHenQ7
	dUkFkOjnnfJkKRLOOONBgK9vVrDoIXwbXnaEQBa+HjnxVJtyxdkmw8NjRJd8JUoz821p+KAiLscrE
	pmQniWh1SE5h+UnUq+vDlhKba02BIZnF1vqHfvQpaBphqjnBTQTLmV4MkjKgOiRf21VMOSHN7YnQM
	3kck7HF6SJegk6Guu3xrPnzqbTF4NM2eQUyBIfXshlzUmWYdFov8Kn7/dk31RGjA6RohjqlHM8Sw4
	uH3Ptz3fNjmjy/5ZyKcvb7hJrDQzPDCw1wtzcQa1wI0C93zDSocbfOnTkN2mLdSvZ98m7SQLbpr82
	ZdFUp8rhhocKlMGbYv7rXWXLmZfw==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xCnf0-00000005DQV-2Xei;
	Sat, 03 Oct 2026 00:31:30 +0000
Message-ID: <4746af392d093deb08101530be1c870f277a182b.camel@surriel.com>
Subject: Re: [PATCH] x86/CPU/AMD: Fix AMD TLBI Erratum #1718
From: Rik van Riel <riel@surriel.com>
To: Borislav Petkov <bp@kernel.org>, X86 <x86@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "Borislav Petkov (AMD)"
 <bp@alien8.de>, 	stable@kernel.org
Date: Fri, 02 Oct 2026 20:31:30 -0400
In-Reply-To: <20261002211617.1001617-1-bp@kernel.org>
References: <20261002211617.1001617-1-bp@kernel.org>
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

On Fri, 2026-10-02 at 14:16 -0700, Borislav Petkov wrote:
> From: "Borislav Petkov (AMD)" <bp@alien8.de>
>=20
> The processor may fail to invalidate a TLB entry while executing an
> INVLPGB/TLBSYNC instruction pair.
>=20
> Detect the erratum and apply a software workaround when a microcode
> fix
> is not present.
>=20
> Fixes: 82378c6c2f43 ("x86/mm: Use INVLPGB for kernel TLB flushes")
> Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
> Cc: <stable@kernel.org>
>=20
This same change fell out of my testing with
a reproducer earlier this year, so I know it
works, at least for the test case I have.

I am surprised that it was good enough to be=C2=A0
a real workaround, but I'll take it ;)

Tested-by: Rik van Riel <riel@surriel.com>
Reviewed-by: Rik van Riel <riel@surriel.com>

--=20
All Rights Reversed.
