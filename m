Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605A63DFC7F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 19:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787946808; cv=none; b=sp1C3utYcuzh2QdZFLEr4GBb319EEgD0cyA726Sq7gQSDdVOFK0I2M+fuIts4+X5wbQN3JIhS14+mXV8RUZGsz9NS55FSuG8/RKTWUGZ5XYY2o/sPHAMaJVdLj+u6YBQvS45DAbQgAQ20W8+y3RGaY3bXLn1SYH/Wfgq2gHQBcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787946808; c=relaxed/simple;
	bh=IxzjcPz5+SNhCmE1JOyZebKxthNf1zJTzmh1W0Xwp6Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jQ4mjFR2OnSKhOFGpu3b8FqdOC9BlegQ3AAawb4CuN2rcUNYK0PGw7W1GsuyqFI1uNTwl53qT08qXsqgyTkdQv9XqwhIwVexy6KYYI8xDTWNZVh1uNmEy3Dxbdrcthw5Fa4jYHMPSWH0p4kKjY5205wVB5mSWad8KN7JurG7FW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=b+OSskcW; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="b+OSskcW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=IxzjcPz5+SNhCmE1JOyZebKxthNf1zJTzmh1W0Xwp6Y=; b=b+OSsk
	cW1Wu2OXiYmbZV0SF03y5tVK+iNBQUtluCoD6iGuWcYt9V+9rPCGi6/yAs53XcTy53sHgCeg/HL5m
	9uHO5D+QGW+l9RgAqw/jdPCSs77WsWWcJVzdbJUDU2+vgUifO3QGwlXpFd/bOEskHt05AfnDtXaGy
	aqd6ZbBRAKWBuqmH+hCVzyUlKYLu6VaTXK8YHSzMK8BWNtYu1o3x1Ia6ZZn0fco9WWCb+l6SM29zm
	e2b/eb6fG4UCiC9N1zA6TAeniXZpUFxT47jeqwi0+5HxBfgCZPHV4EbSOTrWKPLOyC2F9faYYciHl
	B2Ss8rhcfhHFr5XR6PMlRFumJeyw==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1x02dP-000000095oa-2jkc;
	Fri, 28 Aug 2026 19:53:07 +0000
Message-ID: <17f79998b5f328c6e79820b613b2194dd3e104e6.camel@surriel.com>
Subject: Re: [PATCH] memcg: clear FLUSHING_CACHED_CHARGE on cpu offline
From: Rik van Riel <riel@surriel.com>
To: Shakeel Butt <shakeel.butt@linux.dev>, Andrew Morton
	 <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@suse.com>, 
 Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, Roman
 Gushchin	 <roman.gushchin@linux.dev>, Meta kernel team
 <kernel-team@meta.com>, 	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Sashiko <sashiko-bot@kernel.org>
Date: Fri, 28 Aug 2026 15:53:07 -0400
In-Reply-To: <20260828192419.3057939-1-shakeel.butt@linux.dev>
References: <20260828192419.3057939-1-shakeel.butt@linux.dev>
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

On Fri, 2026-08-28 at 12:24 -0700, Shakeel Butt wrote:
> Sashiko [1] reported that memcg_hotplug_cpu_dead() drains the stocks
> of the CPU which went away but leaves FLUSHING_CACHED_CHARGE alone.
>=20
> The flag can be set at that point: drain_all_stock() may have claimed
> the stock and queued the drain work shortly before the CPU went down.
> workqueue_offline_cpu() unbinds the per-cpu workers, so such a
> pending
> work item is executed by an unbound worker on some other CPU, where
> drain_local_memcg_stock() operates on this_cpu_ptr() and thus drains
> and clears the flag of that other CPU instead.=C2=A0 Nothing clears the
> flag
> of the dead CPU, so drain_all_stock() would skip its stock forever
> once
> the CPU comes back online.
>=20
> Clear the flag of both stocks after draining them.
>=20
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link:
> https://sashiko.dev/#/patchset/20260828135036.7d44361f%40fangorn=C2=A0[1]
> ---
>=20
Funny, my AI came up with the same solution, and
I just asked it to do a safety analysis on it.

It was quite thorough.

Reviewed-by: Rik van Riel <riel@surriel.com>


--=20
All Rights Reversed.
