Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3084AD4AE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790362870; cv=none; b=GDzGx3AaXJrTA+vkcH9ddpxuBVMzvdmhRCL+UB7NK8YMqz4PunDnmbG2rctG5iZ99Uw/U/Vg+BdcHc0GXWAVeVss/hgISqEkCEqBve9U5EFhPxrM8yqeejIORwuYyxXC6mUWUt9c4OP95dr9qXKF5X7BIVL4a1OuWY3urA/KoXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790362870; c=relaxed/simple;
	bh=cp3KpeoSWqR5DrpiHmEm+y4xxrxVLkmSxI1ryA+o7ns=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iFNTEwLNSWDHHwfJ6vqc0n/O1BcU+xj08QvIO1lwcKOJ4RIKI9N5cuw4QGWLW6/nupxmaTstBwu8W4fB8xdx/0SYG/9wtsOhDQ7vx5pWSue+seQMqgXoJiMzvQ4wx7JSJ8RtO9k5Q1yOX1ER6Wov1iOgQGwLPyaWm2OyiN9LFnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=VA8kCMU2; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="VA8kCMU2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=cp3KpeoSWqR5DrpiHmEm+y4xxrxVLkmSxI1ryA+o7ns=; b=VA8kCM
	U2XQAteHMN1acW47NufAGdhZPD1ooxBi7kh9whJOeSyIr//j0lyhZd4fyKo0PaFB33k6oo9QZSM3O
	YSWXSGnfCUNu2DK5KPiuxFBAQ8dB/ZlgtyAkefIO95VDAuMJJtr+8p4xmwJPLOc4GeuDGr+FDwpct
	KWbh3wZ6yLbvsJkxtZVzfDjwPNHgS0V71410DaIMKmEmwuZ6Hvspb46rfa/sWWOkNCaMMdD6Qy3zx
	8uC8EL1iseMq9VZK/iE4ro+hFDfpZtd4BhV/BeHGuBjxl32+a8jmB6IZaa7uDKd5yvKlERb6AL8ya
	0odqnoUIWuulxh2CAbJssW3a3Irg==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xAB9I-00000006GnA-05It;
	Fri, 25 Sep 2026 18:59:56 +0000
Message-ID: <f2cdc9352e4fa67d2ab4797b6b781e36e8b77129.camel@surriel.com>
Subject: Re: [PATCH] mm/vma: don't remove VMA from rmap if pgoff unchanged
From: Rik van Riel <riel@surriel.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Andrew Morton	
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike
 Rapoport <rppt@kernel.org>,  Suren Baghdasaryan	 <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Harry Yoo <harry@kernel.org>,  Jann Horn
 <jannh@google.com>, Lance Yang <lance.yang@linux.dev>, Pedro Falcato
 <pfalcato@suse.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, Pan Deng
	 <pan.deng@intel.com>
Date: Fri, 25 Sep 2026 14:59:54 -0400
In-Reply-To: <20260925-speed-up-inplace-rmap-v1-1-babc48ce7c83@kernel.org>
References: <20260925-speed-up-inplace-rmap-v1-1-babc48ce7c83@kernel.org>
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

On Fri, 2026-09-25 at 19:32 +0100, Lorenzo Stoakes (ARM) wrote:
>=20
> When performing a VMA shrink or a split where the VMA is the lower
> one, the
> page offset cannot change, so set the flags unconditionally in these
> cases.
>=20
> When merging VMAs the page offset is unchanged only in some cases, so
> update init_multi_vma_prep() to set the flags only if the page
> offsets
> remain the same.
>=20
> These changes ultimately result in less rmap lock contention.
>=20
> Reported-by: Pan Deng <pan.deng@intel.com>
> Closes:
> https://lore.kernel.org/linux-mm/20260924054301.2330822-1-pan.deng@intel.=
com/
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Nice optimization.

Reviewed-by: Rik van Riel <riel@surriel.com>

--=20
All Rights Reversed.
