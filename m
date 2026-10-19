Received: from prod-mta-13-02.swg-srv.net (prod-mta-13-02.swg-srv.net [185.255.28.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948FB495ADB
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.255.28.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401673; cv=none; b=okzZadjwYXV9yrBs5U27V5MkabLqKei+4Phlx9579kE9j4a+/u9+Ss3/U6roqJm20izI7va0mOGC0RRA9kIL3nxAsjCazlu0Er2xgxQx08bPRWZu86iNdZyJYnkdfx5qfYKjNS5Og0NNVmJAWRrjNNjcTEE9c4XW/yni552jAIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401673; c=relaxed/simple;
	bh=7mcOJQvRjtYGXZnA30TePasJOC/MWg9lA7dWarcXtco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jRqGP54AG08BICa9RlVOpoiqvMGLs/s6cn58/bTyHc8RTtAiDLhS7qWicd26EpLayBE7AmwwUTQ/sbQ5sdba5i9/lk8Nalvwjq3XrqJh6oIlWAOHXHvK4nl1toVxMxKIy4A+9iBd6icipd0xp71KwX15zo5txl+e1VqcY78Rfss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vates.tech; spf=pass smtp.mailfrom=swg.vates.tech; dkim=pass (2048-bit key) header.d=vates.tech header.i=@vates.tech header.b=C69geNP6; arc=none smtp.client-ip=185.255.28.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vates.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swg.vates.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vates.tech header.i=@vates.tech header.b="C69geNP6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=7mcOJQvRjtYGXZnA30TePasJOC/MWg9lA7dWarcXtco=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=C69geNP6QunsLf6SzkToLLcK3amuDD1lQvCyeJzab7pMYmAiiRX0ck9ngaF4dOpAY8k/drNsO
 oQLz5zrBbO5U1DCsdu+TvaWKTXwWAgvJHMkJpTC0mfa6D5+U+uzjOAeYrcNHD2dFYeb6eaJTRzr
 KJruCmKA8dmevGuuwWUTu3l+9JbGk28lTRdUQzUOI1iGjhi6DKFhECQVlakZkQ9VYnziGz96c3w
 czUH4Z9GEK+c9qYWC/XGi1SaRpvESc6Kz8ObYXvCTrlAJ6EswAANq7ppjQvddj/Xc5mIdwE2+Ol
 8R7lbtS6ZGkU+GfEZW19EUUpLhtn2kow2ykCL31yd/Qw==
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender: 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id 1a15376c42b0008425.009
 for <linux-kernel@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 19 Oct 2026 09:20:54 +0000
X-Zone-Loop: d16d17f2386ad6565e909bd1735a52fce6e21e155125
x-campaign-type: default
x-transaction-id: a35d3c46-2ef5-4de1-afd7-1b9208c8a490
x-swg-uid: 01-fc7e59b7-1437-48e5-9f16-67f63b6c02a5
X-Mailer: Sweego
Message-ID:
 <1792401654.8631fc262581453bbf619ec5b2062170.1a15376c42b0008425@vates.tech>
x-swg-bid: 1792401654.8631fc262581453bbf619ec5b2062170.1a15376c42b0008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
	(Authenticated sender: teddy.astie)
	by mail2.vates.fr (Postfix) with ESMTPSA id 26F7182272;
	Mon, 19 Oct 2026 11:20:54 +0200 (CEST)
Date: Mon, 19 Oct 2026 11:20:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] x86/xen/pv: Don't setup runstate area too early
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 David Woodhouse <dwmw2@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <1792170295.8631fc262581453bbf619ec5b2062170.1a145ac82530008425@vates.tech>
 <1792170392.8631fc262581453bbf619ec5b2062170.1a145adfbff0008425@vates.tech>
 <b2c02327-4d77-4ab3-855c-26b5d357f348@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <b2c02327-4d77-4ab3-855c-26b5d357f348@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LQJVOZZx3WI2pPmzX0QifgG0"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792401654342

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LQJVOZZx3WI2pPmzX0QifgG0
Content-Type: multipart/mixed; boundary="------------YJUUYI5pAxmHq7q0va98g4Io";
 protected-headers="v1"; hp="clear"
Message-ID: <63635ebf-f189-48af-913b-300a90f7c99c@vates.tech>
Date: Mon, 19 Oct 2026 11:20:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] x86/xen/pv: Don't setup runstate area too early
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 David Woodhouse <dwmw2@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <1792170295.8631fc262581453bbf619ec5b2062170.1a145ac82530008425@vates.tech>
 <1792170392.8631fc262581453bbf619ec5b2062170.1a145adfbff0008425@vates.tech>
 <b2c02327-4d77-4ab3-855c-26b5d357f348@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <b2c02327-4d77-4ab3-855c-26b5d357f348@citrix.com>

--------------YJUUYI5pAxmHq7q0va98g4Io
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMTYvMTAvMjAyNiDDoCAxOTozNCwgQW5kcmV3IENvb3BlciBhIMOpY3JpdMKgOg0KPiBP
biAxNi8xMC8yMDI2IDY6MDYgcG0sIFRlZGR5IEFzdGllIHdyb3RlOg0KPj4gVGhpcyBpcyBu
byBsb25nZXIgcmVxdWlyZWQgc2luY2UgWzFdLg0KPj4NCj4+IEF0IHRoaXMgbW9tZW50IG9m
IGJvb3QsIHBlcl9jcHUgYXJlYXMgYXJlIG5vdCBpbml0aWFsaXplZCwgd2hpY2ggcHJldmVu
dHMNCj4+IHVzaW5nIFZDUFVPUF9yZWdpc3Rlcl9ydW5zdGF0ZV9waHlzX2FyZWEgYXMgcGVy
X2NwdV9wdHJfdG9fcGh5cygpIHdvdWxkDQo+PiBtaXNiZWhhdmUgaW4gdGhpcyBjYXNlLg0K
PiANCj4gVGhpcyBpc24ndCByZWFsbHkgY29ycmVjdC4NCj4gDQo+IFRoZSBwZXItY3B1IGFy
ZWEgZm9yIHRoZSBCU1AgaXMgd2l0aGluIHRoZSBtYWluIGltYWdlLCB3aGljaCBpcyB3aHkg
dGhlDQo+IGxvZ2ljIGZ1bmN0aW9ucyB0b2RheS7CoCBXaGF0J3MgbWlzc2luZyBpcyB0aGUg
Y2FsbCB0bw0KPiBwY3B1X3NldHVwX2ZpcnN0X2NodW5rKCkgd2hpY2ggdGVsbHMgcGVyX2Nw
dV9wdHJfdG9fcGh5cygpIGFib3V0IHdoZXJlDQo+IHRoZSBCU1AgZGF0YSBpcy4NCj4gDQo+
IEkgdGhpbmsgeW91IHdhbnQgdG8gc2F5Og0KPiANCj4gIkEgZnV0dXJlIGNoYW5nZSB3YW50
cyB0byB1c2UgcGVyX2NwdV9wdHJfdG9fcGh5cygpIGluDQo+IHhlbl9zZXR1cF9ydW5zdGF0
ZV9pbmZvKCksIGJ1dCB0aGlzIGNhbGwgaXMgdG9vIGVhcmx5LsKgIEl0IHR1cm5zIG91dCB0
bw0KPiBiZSBubyBsb25nZXIgcmVxdWlyZWQgc2luY2UgLi4uIg0KPiANCg0KUmlnaHQsIEkg
d2FzIHRoaW5raW5nIHRoYXQgdGhlIHVzZSBvZiB0aGUgcGVyX2NwdSB3YXMgaW5jb3JyZWN0
IGF0IHRoaXMgDQpwb2ludC4gQnV0IHRoYXQncyBub3QgZXhhY3RseSB0aGUgaXNzdWUgaGVy
ZS4NCg0KV2lsbCBhZGp1c3QgZm9yIHRoZSB2My4NCg0KPj4NCj4+IFsxXSA4YTIyYjk5OTZi
MDAgKCJ4ZW46IGRyb3AgeGVuX3NjaGVkX2Nsb2NrIGluIGZhdm91ciBvZiB1c2luZyBwbGFp
biB3YWxsY2xvY2sgdGltZSIpDQo+PiAtLS0NCj4gDQo+IE1pc3NpbmcgU29CLg0KPiANCj4g
fkFuZHJldw0KDQpUZWRkeQ0K

--------------YJUUYI5pAxmHq7q0va98g4Io--

--------------LQJVOZZx3WI2pPmzX0QifgG0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmrV4PUFAwAAAAAACgkQZg+p0QLLz9A+
OAv+N+SSLcu9nZyqRhlPZNTKNHcpXTvFUpN+Lq/1yHFL83Csyk/zYbAMBqfQuyV3h3ay2XqWeGAb
aBN7kUtXIn7LXUb+O2W8YP3kdv0AAz5UFWIL/h/U3q8J2QsbQ9Wk7q7cvwgqkTsG9+D/suk4Yx6g
hu4vCeM/yUuBwYGkL/EPsMYMtcDqK0EGPz7TM0ksizMhzHvIEKpvu/+xakntWvI/WKrZH8OYZOd9
QbGra0Vwz1r6YugjDbJDxSN3DwWmT9EjBv+gdN1Tp8Em0uwmFSykq1VYxspN0BVY9XyrYG+8Tomg
1WGBXjdpO9NKyOUsl9gE26zwKKVxJMuqEw0lYvDEMQRY7qdH0Yn9AAXRC1Bf+292wXDMpMfJtAUm
TD1ARGD24tqV0Gooq0kRQI8yZIkrVRea6IZcmJnJg9f8C/dUssF1os+5+qTc+HOlhf59hJcRXVte
POvEZtmcEA78C9sIVXmACHQWtLse7n8YwHXkoVfXyp/KLvOkMFzAONEvobFQ
=T1yV
-----END PGP SIGNATURE-----

--------------LQJVOZZx3WI2pPmzX0QifgG0--
