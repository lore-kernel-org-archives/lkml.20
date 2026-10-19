Received: from prod-mta-13.swg-srv.net (prod-mta-13.swg-srv.net [185.255.28.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867E44A68A3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.255.28.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400810; cv=none; b=Erb20RC4g7ze/gJPndA1ksTGumttA0yM2DIM5qZ55B1nR/sKQlu/EfiKtGyhji2Od69jdI4N2pfcQq2w3YqSgZ+K7HkcdYTQhZx70CKoQV/fGJFUukVTg9P3U9WBWVY2hwqqPe8hC0RfhluBRERCaAJsWuyXdLfH6r9UdXTNCvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400810; c=relaxed/simple;
	bh=S9rlU3fumzPMwHOSR+1Y+kPQ1ZexeMRkIPsVGMEgYuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJEQpcwCvSbP7IsGOVDgwCRXdBxyNU2uxbImlk1urhi901yFla4LBTeftV8LiAT+zKTGIu97wiZsFcHclYU97dQI+XbZ4EMHyg3cvFnI4c69sRXEsMYarQWpNrSQ3zc+JhBJ21QLzK1naBT7FxxoA380qhFT+BFinFk1x7aeCLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vates.tech; spf=pass smtp.mailfrom=swg.vates.tech; dkim=pass (2048-bit key) header.d=vates.tech header.i=@vates.tech header.b=NTOulvxS; arc=none smtp.client-ip=185.255.28.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vates.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swg.vates.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vates.tech header.i=@vates.tech header.b="NTOulvxS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=S9rlU3fumzPMwHOSR+1Y+kPQ1ZexeMRkIPsVGMEgYuk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=NTOulvxSiSPrStgCiQlK4aAeuJVoYrLAKYL59o8sn4gTcZvQ69cfhDrfbVrRJcoh3QLWbKs3B
 MgGdUWBhq/Gf2KpyRVLG+sWNc0ZTqheplKCxpB7OJX8f/3WJeZApdX9OYW6pZO1GrBxINGGwSMJ
 1UVQtPd/2w8uX9aL5TfM7GZkAnXYEBraC5fXArFXRPeDiOZ0mJY1bMKkYccF5qJuNWq/RYbzT0g
 jQN6FWyM9D2qFZdttmfCzsjCdnovLrlQe8IPoIFh42G/9n7jtUndPcGukfYHHk1FqAniNsSPZLZ
 LRi2/YIio1t9qCwWMb1JgYKlwfa0OMWopR3ZyPe2VCYQ==
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender: 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id 1a1536999750008425.009
 for <linux-kernel@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 19 Oct 2026 09:06:31 +0000
X-Zone-Loop: 3cfbd52c607f63cc18051e291b749737a5117f2ce6cb
x-campaign-type: default
x-transaction-id: 60070b06-a0a4-4c27-a9f2-9210e05f645a
x-swg-uid: 01-a5fc6352-9387-497e-8348-b1c041fdde66
X-Mailer: Sweego
Message-ID:
 <1792400791.8631fc262581453bbf619ec5b2062170.1a1536999750008425@vates.tech>
x-swg-bid: 1792400791.8631fc262581453bbf619ec5b2062170.1a1536999750008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
	(Authenticated sender: teddy.astie)
	by mail2.vates.fr (Postfix) with ESMTPSA id 1345D80A47;
	Mon, 19 Oct 2026 11:06:31 +0200 (CEST)
Date: Mon, 19 Oct 2026 11:06:30 +0200
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
 <e934ac9c-cf59-446a-9b1f-ddca4c43d1c5@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <e934ac9c-cf59-446a-9b1f-ddca4c43d1c5@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------R0HTcQ4F0G50aXHnJOfKLM7X"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792400791261

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------R0HTcQ4F0G50aXHnJOfKLM7X
Content-Type: multipart/mixed; boundary="------------7yW0Wscd23IA2rw5ayHl3NGg";
 protected-headers="v1"; hp="clear"
Message-ID: <f15bd0d3-8310-4622-9852-c4cd8adce71e@vates.tech>
Date: Mon, 19 Oct 2026 11:06:30 +0200
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
 <e934ac9c-cf59-446a-9b1f-ddca4c43d1c5@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <e934ac9c-cf59-446a-9b1f-ddca4c43d1c5@citrix.com>

--------------7yW0Wscd23IA2rw5ayHl3NGg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMTYvMTAvMjAyNiDDoCAyMDowNCwgQW5kcmV3IENvb3BlciBhIMOpY3JpdMKgOg0KPiBP
biAxNi8xMC8yMDI2IDY6MzMgcG0sIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxNi8x
MC8yMDI2IDY6MDYgcG0sIFRlZGR5IEFzdGllIHdyb3RlOg0KPj4+IFRoaXMgaXMgbm8gbG9u
Z2VyIHJlcXVpcmVkIHNpbmNlIFsxXS4NCj4+Pg0KPj4+IEF0IHRoaXMgbW9tZW50IG9mIGJv
b3QsIHBlcl9jcHUgYXJlYXMgYXJlIG5vdCBpbml0aWFsaXplZCwgd2hpY2ggcHJldmVudHMN
Cj4+PiB1c2luZyBWQ1BVT1BfcmVnaXN0ZXJfcnVuc3RhdGVfcGh5c19hcmVhIGFzIHBlcl9j
cHVfcHRyX3RvX3BoeXMoKSB3b3VsZA0KPj4+IG1pc2JlaGF2ZSBpbiB0aGlzIGNhc2UuDQo+
PiBUaGlzIGlzbid0IHJlYWxseSBjb3JyZWN0Lg0KPj4NCj4+IFRoZSBwZXItY3B1IGFyZWEg
Zm9yIHRoZSBCU1AgaXMgd2l0aGluIHRoZSBtYWluIGltYWdlLCB3aGljaCBpcyB3aHkgdGhl
DQo+PiBsb2dpYyBmdW5jdGlvbnMgdG9kYXkuwqAgV2hhdCdzIG1pc3NpbmcgaXMgdGhlIGNh
bGwgdG8NCj4+IHBjcHVfc2V0dXBfZmlyc3RfY2h1bmsoKSB3aGljaCB0ZWxscyBwZXJfY3B1
X3B0cl90b19waHlzKCkgYWJvdXQgd2hlcmUNCj4+IHRoZSBCU1AgZGF0YSBpcy4NCj4+DQo+
PiBJIHRoaW5rIHlvdSB3YW50IHRvIHNheToNCj4+DQo+PiAiQSBmdXR1cmUgY2hhbmdlIHdh
bnRzIHRvIHVzZSBwZXJfY3B1X3B0cl90b19waHlzKCkgaW4NCj4+IHhlbl9zZXR1cF9ydW5z
dGF0ZV9pbmZvKCksIGJ1dCB0aGlzIGNhbGwgaXMgdG9vIGVhcmx5LsKgIEl0IHR1cm5zIG91
dCB0bw0KPj4gYmUgbm8gbG9uZ2VyIHJlcXVpcmVkIHNpbmNlIC4uLiINCj4+DQo+Pj4gWzFd
IDhhMjJiOTk5NmIwMCAoInhlbjogZHJvcCB4ZW5fc2NoZWRfY2xvY2sgaW4gZmF2b3VyIG9m
IHVzaW5nIHBsYWluIHdhbGxjbG9jayB0aW1lIikNCj4+PiAtLS0NCj4+IE1pc3NpbmcgU29C
Lg0KPj4NCj4+IH5BbmRyZXcNCj4gDQo+IEJ1dCB0aGlzIGRvZXMgcG9zZSBhbm90aGVyIHF1
ZXN0aW9uLi4uwqAgwqBMaW51eCBvbmx5IGV2ZXIgcmVnaXN0ZXJzIHRpbWUNCj4gcmVmZXJl
bmNpbmcgdkNQVSAwLsKgIFdoeSBhcmUgdGhlIHRhcmdldHMgb2YgdGhlIHJlZ2lzdHJhdGlv
biBpbiB0aGUNCj4gcGVyLWNwdSBhcmVhP8KgIFRoYXQncyBwcmVzdW1hYmx5IHdhc3RlZCBz
cGFjZSBvbiBhbGwgQVBzLg0KPiANCg0KWWVzIGJ1dCBvbmx5IGZvciB0aGlzIGVhcmx5IFBW
IGNhc2UsIHRoZXJlIGFyZSBvdGhlciBwbGFjZXMgd2hlcmUgDQp4ZW5fc2V0dXBfcnVuc3Rh
dGVfaW5mbygpIGlzIGNhbGxlZCBmb3Igb3RoZXIgQVBzLg0KDQpCdXQgbG9va2luZyBhdCBp
dCwgdGhlcmUgbWF5IGJlIHJlZHVuZGFudCBjYWxscyBvZiANCnhlbl9zZXR1cF9ydW5zdGF0
ZV9pbmZvKCkuDQoNCj4gfkFuZHJldw0KDQpUZWRkeQ0K

--------------7yW0Wscd23IA2rw5ayHl3NGg--

--------------R0HTcQ4F0G50aXHnJOfKLM7X
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmrV3ZYFAwAAAAAACgkQZg+p0QLLz9B3
KAv/VqZr1kmFNF9miMXIqBNL4H8gEOUgZ9d6YuJj9V5lkFqkFFhKFejHwSfyxc3FJWMCre3Ycwvd
bThooiv++8jlpo19iQgIaZQOb1M2eXgeug+meXUkgccjx9f5S8xWKT1B4bQOzf0mV07SCyjlKmj5
EyACl7hvph8PHM0fFiPmw5OOy3EDKvgkw8YSXZMNnHMh3SZ0LRkMg/oK2DzypFlBWpPGdPVZtzFS
XDEw21CutjknFF1u1JdJniELqMXmhcmua6Qx8F1GiQEJnn6eDR871vJI+nGvykLNn/9mBxQu4w+n
BjzGXliVJY3Qz5YzUXnFj/aPaXyRlGRnAW5agEqelqvKquWW+0i7gM/+V7LaZPnzzpb628NOuUMI
SBFmERSE0kWyCtUeExwdyUqasQOOZ7n4Teqzf0la1S1WMneZbeH2t+eZisFRrd/srtlLEAMjdKbu
k/vOMEZfpGPgPxFq6r5jzm8Fzh/ohF7+emnGiQh1a9l12Do2TNlUOfhslSzy
=pfB0
-----END PGP SIGNATURE-----

--------------R0HTcQ4F0G50aXHnJOfKLM7X--
