Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.81.71.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434345;
	b=IClTjTjanti6RwSWw8M2lrM+xCVLUVsiPV2nvSM8JVYK0EDvI9xw5s+CoDDdIatYvehY
	 EMV0kcgASCh0P5BAp7TvOcevvHOVvtloMW17ngzmyHktqKybD0LD4/9E3fq01EIYv9HKd
	 lxBoCMpJ8gqgzrWPLtYxEwq6j9F/RCABb7D+oncXubhkXVnyHp27dNmFojCEw5+6S3aRR
	 Bg854uQe7Ih6RHdcRxq48pGEoqy4cyOTub1pCHcwoLZgLpj84Q81na7SaZDM5kO+8rb0o
	 Y3IAolThoYGpuSgy/NJZgA43PZZJsnw+qsl3/E/H97yllz5obqYfvACtMoM7NoP45Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434345;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Message-ID:
	 x-ms-reactions:Date:MIME-Version:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type;
	bh=b6gQCJ8IG452k2P9HU4LkQybTcDWIYVt75QbCcQLYRI=;
	b=cWupi2ZEYb1/sePas+JCwFIkG51xvs7tNfG5+pe4L0xeIOAP4RJrwL/WLrdiM2pyDwwd
	 vK2mIrpLFpNrrYrzxdjiqX/laVybbeHeIFm5ho7d3Pzjt8ITyz/1ig9YVpN56/fmfOU7o
	 Dt/xDxOmqRmSo2S/q1rK8JCNfUj+Omf26LkCfTfNOLfSrECR2F3QpemKSWzDoO0M5jAiz
	 u3mGVPbc43q58XhftzD6eLxZA4V6b7kCd8nlg86AfMjpXRADjW0csDT2YQuJuAmpdyNWc
	 mNnJGgRR4KgaWYPzx6u+sFrgo5ZFeZM+lSDJBfAEI+k3i/FhkFdSG3en0MuLclFYfoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=puzzle.ch;
	spf=pass smtp.mailfrom=puzzle.ch;
	dkim=pass header.d=puzzle.ch header.i=@puzzle.ch header.a=rsa-sha256 header.s=20211209 header.b="mn/KK1ha";
	dkim=pass header.d=puzzle.ch header.i=@puzzle.ch header.a=rsa-sha256 header.s=20211230 header.b=lrtZA8Yt;
	arc=none smtp.remote-ip=45.81.71.124
Received: from mx03.puzzle.ch (mx03.puzzle.ch [45.81.71.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995B3606A331;
	Wed, 11 Nov 2026 21:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 995B3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puzzle.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puzzle.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=puzzle.ch header.i=@puzzle.ch header.a=rsa-sha256 header.s=20211209 header.b=mn/KK1ha;
	dkim=pass (2048-bit key, unprotected) header.d=puzzle.ch header.i=@puzzle.ch header.a=rsa-sha256 header.s=20211230 header.b=lrtZA8Yt
Received: from mailstore02.cloud.puzzle.ch (mail.puzzle.ch [45.81.71.99])
	by mx03.puzzle.ch (Postfix) with ESMTPS id 0678018A;
	Wed, 11 Nov 2026 22:58:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=puzzle.ch; s=20211209;
	t=1794434338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=b6gQCJ8IG452k2P9HU4LkQybTcDWIYVt75QbCcQLYRI=;
	b=mn/KK1haSSLEvqICBfXcrlHiW/9bvc42gDRs4u20xePBJzJOqq7dEJtYZ5SEIlMHXDKvFN
	9OmZ6MUjw8eY7BeLdji4TMdxhy/ScVR02s47Itu2b1nhZ/WZwRKIKiPTIBHnIa1MFwFgQZ
	i1LrMLXI0JEWjmdxPk6HdBxbvMfiEAu1PzUqJAeOyIYk7PNny9TivNEI7CCPeIUDJHSHst
	vdiQ/RgDAhVEOhpw2TIherIBdg5sVfecRBujyaWaYsxVrS6r+UXKGeKEcxRHBfhjyHfKR3
	iM51KyPiBP+yO7M/Ev1El2whB0FWjPcpLRwAX937XhrMPYq5hoUhepM3ekJ7zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=puzzle.ch; s=20211230;
	t=1794434338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=b6gQCJ8IG452k2P9HU4LkQybTcDWIYVt75QbCcQLYRI=;
	b=lrtZA8YtCLHBi6WGEq8qxn983EtPzI/kQjoOcRNOrPhvc5dZR0OK6RHzEN1cAwGP4a45hy
	GpCD+GFJlBYlWTZj1suHDN+7jjvCjbYjf6u7sE0PHjLbdKucEvjuOSBpWqYeH6fC5J6BQs
	cmE3qIyXwXumUG/hoXZN1QmPnR2ssanOF35ozrVg5eM95gm0NC76/N53cxgAPZvpO7k+w6
	LgXhPtrxN+TiaIU6H68erE0EYRKUWF1Lxd0OEh5d33QoKMUHQABydnDiU+rqv5URYz2M8m
	Yza26QtnBLiEv1YlNi6bt54mHtrUy48nsnjpD4dHE2zU2ZXUN88gbV3CJmAGjQ==
Message-ID: <fcb2a8a4-f116-4bf4-b90b-b07af8a3da7c@puzzle.ch>
x-ms-reactions: disallow
Date: Wed, 11 Nov 2026 22:58:46 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] usbip: identify the event handler with current_work()
To: John Ernberg <john.ernberg@actia.se>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261111-usbip-v1-0-da5217ac71d7@puzzle.ch>
 <20261111-usbip-v1-2-da5217ac71d7@puzzle.ch>
 <427d908d-1fa2-442c-ac91-b3e925e5c7bb@actia.se>
From: Michael Grzeschik <grzeschik@puzzle.ch>
Content-Language: en-US, de-DE
Autocrypt: addr=grzeschik@puzzle.ch; keydata=
 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
 brFdynih
In-Reply-To: <427d908d-1fa2-442c-ac91-b3e925e5c7bb@actia.se>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nnSaolJ3FG0Hk6X9GteHOcqo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nnSaolJ3FG0Hk6X9GteHOcqo
Content-Type: multipart/mixed; boundary="------------Ns0W0V4sNqG25aXievHv1ZnS";
 protected-headers="v1"; hp="clear"
Message-ID: <fcb2a8a4-f116-4bf4-b90b-b07af8a3da7c@puzzle.ch>
x-ms-reactions: disallow
Date: Wed, 11 Nov 2026 22:58:46 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] usbip: identify the event handler with current_work()
To: John Ernberg <john.ernberg@actia.se>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261111-usbip-v1-0-da5217ac71d7@puzzle.ch>
 <20261111-usbip-v1-2-da5217ac71d7@puzzle.ch>
 <427d908d-1fa2-442c-ac91-b3e925e5c7bb@actia.se>
From: Michael Grzeschik <grzeschik@puzzle.ch>
Content-Language: en-US, de-DE
Autocrypt: addr=grzeschik@puzzle.ch; keydata=
 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
 brFdynih
In-Reply-To: <427d908d-1fa2-442c-ac91-b3e925e5c7bb@actia.se>

--------------Ns0W0V4sNqG25aXievHv1ZnS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSm9obg0KDQpPbiAyMDI2LTExLTExIDQ6MzUgUE0sIEpvaG4gRXJuYmVyZyB3cm90ZToN
Cj4gSGkgTWljaGFlbCwNCj4gDQo+IE9uIDExLzExLzIwMjYgMTI6MzQsIE1pY2hhZWwgR3J6
ZXNjaGlrIHdyb3RlOg0KPj4gdXNiaXBfaW5fZWgoKSBjb21wYXJlcyB0aGUgdGFzayB3aXRo
IHdvcmtlcl9jb250ZXh0LCB0aGUgZmlyc3Qgd29ya2VyDQo+PiB0aGF0IGV2ZXIgcmFuIHRo
ZSBldmVudCBoYW5kbGVyLiBXb3JrZXJzIG9mIHRoZSB1bmJvdW5kIHVzYmlwX2V2ZW50DQo+
PiB3b3JrcXVldWUgYXJlIHJlYXBlZCB3aGVuIGlkbGUgYW5kIG5ldyBvbmVzIHJ1biB0aGUg
aGFuZGxlciBsYXRlciwgc28gdGhlDQo+PiBjaGVjayBmYWlscyBpbnNpZGUgdGhlIGV2ZW50
IGhhbmRsZXIsIGFuZCB0aGUgcmVtZW1iZXJlZCB0YXNrX3N0cnVjdCBtYXkNCj4+IGJlIHJl
dXNlZCBieSBhbnkgb3RoZXIgdGFzaywgd2hpY2ggdGhlbiB3cm9uZ2x5IGNvdW50cyBhcyB0
aGUgZXZlbnQNCj4+IGhhbmRsZXIuIHN0dWJfZGlzY29ubmVjdCgpIHJlbGllcyBvbiBpdCB0
byBza2lwIHRoZSBzaHV0ZG93biBvZiBhIGRldmljZQ0KPj4gcmVzZXQgZnJvbSB0aGUgZXZl
bnQgaGFuZGxlci4NCj4+DQo+PiBBc2sgdGhlIHdvcmtxdWV1ZSB3aGljaCB3b3JrIGl0ZW0g
dGhlIGN1cnJlbnQgdGFzayBleGVjdXRlcyBpbnN0ZWFkLg0KPj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IE1pY2hhZWwgR3J6ZXNjaGlrIDxncnplc2NoaWtAcHV6emxlLmNoPg0KPiANCj4gV2Ug
c2VudCBhIHNpbWlsYXIgcGF0Y2ggYmFjayBpbiBBdWd1c3QgdGhhdCB3ZSBmb3Jnb3QgdG8g
Zm9sbG93IHVwIG9uLiBbMV0NCj4gDQo+IFJldmlld2VkLWJ5OiBKb2huIEVybmJlcmcgPGpv
aG4uZXJuYmVyZ0BhY3RpYS5zZT4NCj4gDQo+IFsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtdXNiLzIwMjYwODAzMTA0MzQyLjI3OTAxMDUtMS1qb2huLmVybmJlcmdAYWN0
aWEuc2UvDQoNCkRhbW4sIEkgcmVhbGx5IHNob3VsZCBoYXZlIGNoZWNrZWQgdGhlIHVzYiBs
aXN0IGJldHRlciBiZWZvcmUgc2VuZGluZyBteSBjaGFuZ2UuDQpQbGVhc2UgbGV0cyB1c2Ug
eW91ciBjaGFuZ2UgdGhlbi4gSSB3aWxsIGp1c3Qgc2VuZCBteSBSZXZpZXdlZC1ieSBhbmQg
cHVzaCBmb3IgeW91ciBjb250cmlidXRpb24uDQoNClNvIHBsZWFzZSBpZ25vcmUgdGhpcyBt
YWlsLg0KDQpUaGFua3MsDQpNaWNoYWVsDQo=

--------------Ns0W0V4sNqG25aXievHv1ZnS--

--------------nnSaolJ3FG0Hk6X9GteHOcqo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEFdvthaW6nen779Bov2lYRPlx9KsFAmr05RcFAwAAAAAACgkQv2lYRPlx9KtT
mQ//Tdf3Z0c56+bsVE/pa1Befc8kPz2m+K6bRxRLb2EoF5OZwj5MkOhyJ6BWx9++8FYsM2FllyvX
u7Ff4y8iU9ufjkRPzGgEN6mEoBuwtG3PywW3fd2zAiE6QOVcQoGlOkYagF/vrLB2+3LImN1nrKv0
Xrt6BM2Lwcl77/koIIZeIb6wuPd77g8fJ/T1JVF2aUngZDehQzoYKASYJ2ceBCg+HGKYATmXkhvF
QHgFnvT9UK1KhdJHadca8nt+n2Ca0n1TDnQJA3W1gJUb2Izu4D5HWSrLJGUnq6b2rd12Nse/ygfT
Bs+zZ3hzshwCHN2AWqHySdgnxZsdlAxa4nHiMEWFxEz5/E/fJkRTf1dgpjUTDJziTPDV1Wxw2aN4
DldKArxAMabYoTqUxeZHoDLUIHhWlBBPrTEwmozJ4Ud0+H8bqQUQDr+aCRG63aLwNyj4evWWAvZR
wlquK/ojAzuvfx87bP31/xBdPbGqlpVjLmURy+Amdudcgk6P0o6Imm0h7EIib82rrkDpusB8F9Em
2dS/VV5BUHM5l/wi5filJOcXrPiIa+f7i1HglM/Zs8rV8+QRwb+Am3bHX3eU6j0TAShM5MjJDxXN
VxhwxDOfJkwm8pVlarq7EkaO3HgQx7IEngeF8BrqqgE2tAjlCbf7Mhw8WfC5UNv1EWpDPr5iVNUU
q5k=
=KvmX
-----END PGP SIGNATURE-----

--------------nnSaolJ3FG0Hk6X9GteHOcqo--
