Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0416346C4AE
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791197919; cv=none; b=CRKh2wMD7EXjqXVNETGSJjLq4AWYLm5falIP04l2beiuYyB8V92Q0vNXdEgkhxApyKqfQTHS+qZAYl1HgoVgfYfhJkKG/mA5OOpXeBIlXuKQpMbJQ/K7Tpie4HlSDl1JN+MES5Cr04dAe6aTrM2DurXxKIAKl7LJfo++++J0OCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791197919; c=relaxed/simple;
	bh=MnjNsZvLBxlh06WEotH4Sv0vETbpUxjht0MF5KzNVik=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AWZkGjS8mwkm7aTKiU1abz2cPFEdVjdTLMdvS08x3GLdBh7AcPBmTwZ3Dh1okBNaDDMBzKer57pHsL0Z0qtyk4DpzIx++/yrE/HNQOPOhPvzWL5pXtDyuZxQsDMKHPkbB1vSOuNWteZbQToA5bozlAZvM02mMPdUKFTYuEPiZ1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=OLkmd7K9; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="OLkmd7K9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=MnjNsZvLBxlh06WEotH4Sv0vETbpUxjht0MF5KzNVik=; b=OLkmd7
	K991WN4E1A3Yoki6X/aL+GxIm7cGVR9lvUjfl9DyfmB//E/pNrVsdP/ojFz4kdzToWpV8NWfu5AZc
	VBoYv4nlMeb6pcRv/4CAyyUBEFuIynVu+LZb2bJg0TAG+K3D2+vInIw1mrMBjppQWQZFcB5gE7Vm1
	zLYXaQ59k0QYtIlIQuaPQQ7iEZHltLga4jfLg9sDhKZo3Unojbt/f5haCAM2KBW8HDrbvib8IwNzw
	O6MUTGOWXoEiPNOCFyDQqROJI5v1nXuBZ9uHYhTc2Rb54MO07fGFhxrz2oT8jUFTOoMO/2EBuXW/G
	TKVtdnYb4O5pzOd9zrS2aGVl8HVg==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xDgOc-00000006ENN-1cWN;
	Mon, 05 Oct 2026 10:58:14 +0000
Message-ID: <6047f10bc230a7d34628c0021373e407279bf3dd.camel@surriel.com>
Subject: Re: hunting memory corruption bug in 6.18.x
From: Rik van Riel <riel@surriel.com>
To: Nikola Ciprich <nikola.ciprich@linuxbox.cz>, "Lorenzo Stoakes (ARM)"
	 <ljs@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, 	david@kernel.org, Mike Rapoport
 <rppt@kernel.org>, Dave Hansen	 <dave.hansen@linux.intel.com>, Pedro
 Falcato <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>,
 luizcap@redhat.com, pbonzini@redhat.com
Date: Mon, 05 Oct 2026 06:58:13 -0400
In-Reply-To: <ar63St2LBfCdyhwj@pcnci.linuxbox.cz>
References: <arY1Wq6R9OY20ans@pcnci.linuxbox.cz> <arZHp8hjYFXE8Rkt@gremlin>
	 <arde/t0zQNEkWqi5@pcnci.linuxbox.cz> <areOeRwZOez0eHm7@gremlin>
	 <arotyz5g6LozSjb1@pcnci.linuxbox.cz> <arwNebjYXyGqrp32@pcnci.linuxbox.cz>
	 <arzRBv9ceJsxJppI@gremlin> <ar1Xl7PE2rcoT9h3@pcnci.linuxbox.cz>
	 <ar63St2LBfCdyhwj@pcnci.linuxbox.cz>
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

On Thu, 2026-10-01 at 21:40 +0200, Nikola Ciprich wrote:
>=20
> Oops:
> general protection fault, probably for non-canonical address
> 0xfffffff0c930038
> RIP: __d_lookup+0x4a/0xc0
> Comm: systemd PID: 1274600 CPU: 23
> Call trace:
> __d_lookup
> lookup_fast
> walk_component
> link_path_walk
> path_openat

That is the exact same memory address as the
crash in your original report.

Do you capture any crashes with other memory
addresses, or do they always crash with this
same address?

If it's always the same address, we may not
be looking at random corruption at all, but
instead at some bug that results in the same
bad address every time.

That might narrow the problem space a little.

--=20
All Rights Reversed.
