Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E064A43F6
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465312; cv=none; b=bfNI3oHRfDWtzYezZF5j7JhTMW4mzvtQ6jaFg1OpNWBXblNQuLPvvwINyrtrUQwGvwbuuJX4vQD4KVFr1c7p0PD6gUt8yJAPFNP3DxjEFMV0RsVtgiONFNUP7xE5s+2iEpOj+4yN47GGhj0PfvX+Cx/gvTgo7pTlJ9Xis/MQKOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465312; c=relaxed/simple;
	bh=1ezpUQuoEMElOkxfb+MJvLpn/7TWxVa7rXLI3jpeXfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gZwVJVeu+4AxcQirfafpW6v6+lZ59JxzRvKRY/LkejbWfHUK8qVINLXV+EUyxrjdyL67AsEW187hWJsXhCeie2JGeeifNs0WpWqxGhb5asm5tc+89qZIEAASA9OfeAWH+NfJ3D6CypcwtQPEIhiaCOGjQVtOEFpLsL8nRgLfRXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=X6xNA2GM; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="X6xNA2GM"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2e36c3478aso772481466b.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791465305; x=1792070105; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1ezpUQuoEMElOkxfb+MJvLpn/7TWxVa7rXLI3jpeXfo=;
        b=X6xNA2GMWG8voGhK9fhUc5ZDry+Xn591pd5T/IGF5JG2nLl+JCuxduDjBaYWkGDtTN
         ZTQvMpjC+KdlxthvyERWAHGzco8f3wNVaZuyjlh8NOgtP485bXkfRdVQK2UCNHdZvtLK
         9ZJip2BA2vQH/1akxcmz1OmVJ8LuvYpliTla3y9UOU2HmcjXZQlfl/CAwXGBsvAEB0bj
         t1R0J2WZzpoU4EOdUrqHLV0xllbNm8LwsKYbqff6LFE9M2G5u2xcJNHbFdAVoeaOdm5Q
         xEZlINvBHy48kzfIs/rVglyz8iWEfuCO3hPqEuDvGaOBAPRMiqV38rdkV+756apXjZo6
         n62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465305; x=1792070105;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ezpUQuoEMElOkxfb+MJvLpn/7TWxVa7rXLI3jpeXfo=;
        b=wkrCExvWlxuNmaDFnZn+4zw5ZegAVJngus3af+pFkPKUvH0MH5UiBIoqgdPDgnqSQ/
         eWnV9Fg19831turUSm8YtpH0qrz8J59awzn9LD50l0wAQrlm8Cl2TwXpX1/BYHVpYQnB
         tHqH5kuyCEZ+d6MSe/tWG6L6cWEkmzwCiaYkcwBfjByxeNaNWhuKmBjRC3LX36xu1aeQ
         u1rQ5NI4W9oMH3QCRW8qAhBN9MWHAd/BejMsdfTs3yuDbapLPPd3APuKouqOESx03xMp
         9NrXw73cipahtVuCKkT1yP/LxFXIbf7U3n3+Rq0l/P1wc5dRN/omE8fqQV4z0OjELVuQ
         zCrw==
X-Gm-Message-State: AFuF++nuRLKM7RB88CMWahFvzDeuQrKhB2wgWHLXHYdfPjwjdTBtzdZR
	IiFLFRPh11G3ZkXwPn//qXvkEV+yqHq7xfl6GooH2JPE8xOl8lXZfwA9J59TsnPPTJtS+Ip9Tet
	UCjAOC0k=
X-Gm-Gg: AYBFou3XdWSzqAZpX9cjlirm8kJ+77J0jkiOMcWzc4zeqD3Yf5168W1mwnftLo/lvba
	JtUTiN8ddAANfkFFv0HjHE8ofLauiG5krcc/CdSHRaAsxl3VZ0owZchO+i0fVM7TdPDrEvrHRm2
	TQDmF4jqXcZA0t4lN9lytEEfbUPCo04828yo6i7NoD2y4vdR/glNhqQtH3HLK5d3jIfUtR+oK3Q
	Y1iicfR0PXpray90guvkzI3SuiZEFRncRI7xc6n0fcBjpsmYxQYcCbHWgG5KSoaPriD8vW4Bja7
	clm9XDBtCEaEuqDP27ry73+Ihgyp+b3vL3zxrx75ClUebZMxT3LWXGmgVOrMg9ujBnMreP07cW6
	j0gOc1Xaz30cYROYapsmXYv5Ym2hasmZ3w7RvzLdFMLTsECNvSfvyDuzW2DL72Wl4kOuPMdfoVy
	NMclzREpJQrYYIr4Xa1aMFX+Tby4YuNIfZeu6KVcSRTjcl0p2BiCeUI6Tt5Meu30NWeSmZAFRjg
	14Dtjs1HYJmcrkfjLicYQkQ68sJO22Kp8+4Y5/aRmwNSqrw59tUmBYr4QClRrqzpIhoRpHp2T9X
	czzgMShQP2jcTn8Pn5C5tR00
X-Received: by 2002:a17:907:8992:b0:c29:5021:f6f8 with SMTP id a640c23a62f3a-c317c0bc3a7mr541833766b.36.1791465305252;
        Thu, 08 Oct 2026 06:15:05 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c317c32af4fsm218989366b.63.2026.10.08.06.15.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 06:15:03 -0700 (PDT)
Message-ID: <8e194f64-6add-4fb3-a1bb-9b27719b409e@suse.com>
Date: Thu, 8 Oct 2026 15:15:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] get_maintainer: only use THE REST as a fallback
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, users@kernel.org
References: <20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vxB2oDNLt7pmMDslmmFRNvPl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vxB2oDNLt7pmMDslmmFRNvPl
Content-Type: multipart/mixed; boundary="------------50Lf3zC22aAIf0GRaWqGVI3r";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, users@kernel.org
Message-ID: <8e194f64-6add-4fb3-a1bb-9b27719b409e@suse.com>
Subject: Re: [PATCH] get_maintainer: only use THE REST as a fallback
References: <20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org>
In-Reply-To: <20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org>

--------------50Lf3zC22aAIf0GRaWqGVI3r
Content-Type: multipart/mixed; boundary="------------rCUDJoysabVzy4kgINtUv7hZ"

--------------rCUDJoysabVzy4kgINtUv7hZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMTAuMjYgMTQ6NTEsIEtvbnN0YW50aW4gUnlhYml0c2V2IHdyb3RlOg0KPiBUSEUg
UkVTVCBtYXRjaGVzIGV2ZXJ5IGZpbGUgaW4gdGhlIHRyZWUgdmlhICJGOiAqIiBhbmQgIkY6
ICovIiwgc28NCj4gZ2V0X21haW50YWluZXIucGwgY3VycmVudGx5IGFkZHMgbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZyB0byBldmVyeQ0KPiBwYXRjaCwgcmVnYXJkbGVzcyBvZiB3
aGV0aGVyIHRoZSB0b3VjaGVkIGZpbGVzIGFscmVhZHkgYmVsb25nIHRvIGENCj4gc3Vic3lz
dGVtIHdpdGggaXRzIG93biBtYWlsaW5nIGxpc3QuDQo+IA0KPiBPbmx5IGFkZCBUSEUgUkVT
VCBmb3IgYSBmaWxlIHdoZW4gbm8gb3RoZXIgbWF0Y2hpbmcgc2VjdGlvbiBwcm92aWRlcyBh
DQo+IG1haWxpbmcgbGlzdCBmb3IgaXQuIEZpbGVzIHRoYXQgbWF0Y2ggbm8gc2VjdGlvbiwg
b3Igb25seSBzZWN0aW9ucw0KPiB3aXRob3V0IGFuIEw6IGVudHJ5LCBzdGlsbCBmYWxsIGJh
Y2sgdG8gVEhFIFJFU1QsIHNvIGV2ZXJ5IHBhdGNoIGtlZXBzDQo+IHJlYWNoaW5nIGF0IGxl
YXN0IG9uZSBwdWJsaWMgbGlzdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEtvbnN0YW50aW4g
UnlhYml0c2V2IDxrb25zdGFudGluQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IC0tLQ0KPiBM
S01MIGhhcyBiZWNvbWUgbW9zdGx5IGEgZmlyZWhvc2Ugb2YgcGF0Y2hlcyB0aGF0IGFyZSBh
bHJlYWR5IGdvaW5nIHRvIGENCj4gc3Vic3lzdGVtIGxpc3QuIFRoZSByZWFzb24gaXMgVEhF
IFJFU1Q6IGl0IG1hdGNoZXMgZXZlcnkgZmlsZSBpbiB0aGUNCj4gdHJlZSwgc28gZ2V0X21h
aW50YWluZXIucGwgYWRkcyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnIHRvIGV2ZXJ5
DQo+IHNpbmdsZSBwYXRjaC4gRHVyaW5nIHRoZSB3ZWVrIG9mIE9jdCAxLTcsIDIwMjY6DQo+
IA0KPiAgICAtIExLTUwgY2FycmllZCAxMyw2NDEgbWVzc2FnZXMgKH4xLDk1MC9kYXkpLCA5
MCUgb2Ygd2hpY2ggd2VyZSBhbHNvDQo+ICAgICAgc2VudCB0byBhdCBsZWFzdCBvbmUgb3Ro
ZXIgbGlzdDsNCj4gICAgLSB3aXRoIH4yLDEwMCBzdWJzY3JpYmVycywgdGhhdCBpcyBhYm91
dCAyOSBtaWxsaW9uIGRlbGl2ZXJpZXMgcGVyDQo+ICAgICAgd2VlayBmb3IgTEtNTCBhbG9u
ZS4NCj4gDQo+IFRoaXMgaXNzdWUgY2FtZSB1cCBkdXJpbmcgdGhlIDIwMjYgTWFpbnRhaW5l
ciBTdW1taXQgYW5kIHRoZSBjb25zZW5zdXMNCj4gd2FzIHRoYXQgImFsd2F5cyBpbmNsdWRl
IGxpbnV4LWtlcm5lbCBmb3IgZXZlcnkgcGF0Y2giIHdhcyBuZXZlciB0aGUNCj4gaW50ZW50
Lg0KPiANCj4gVGhpcyBwYXRjaCBtYWtlcyBUSEUgUkVTVCBhIGZhbGxiYWNrIGFzIGluaXRp
YWxseSBpbnRlbmRlZDogaXQgaXMgb25seQ0KPiBhZGRlZCBmb3IgYSBmaWxlIHdoZW4gbm8g
b3RoZXIgbWF0Y2hpbmcgTUFJTlRBSU5FUlMgc2VjdGlvbiBwcm92aWRlcyBhDQo+IG1haWxp
bmcgbGlzdCBmb3IgaXQuDQoNCkhtbSwgZm9yIG1lIHRoaXMgd2lsbCBiZSBhIG1ham9yIHBy
b2JsZW0uDQoNCkFzIHRoZSBYZW4gY29kZSBtYWludGFpbmVyIEkgaGF2ZSBzdHVtYmxlZCBv
dmVyIHByb2JsZW1hdGljIHBhdGNoZXMgd2hpY2gNCndlcmUgTk9UIHNlbnQgdG8geDg2IG9y
IHhlbiBNTCBzZXZlcmFsIHRpbWVzLCB3aGljaCBtYWRlIGl0IHBvc3NpYmxlIHRvIGNhdGNo
DQpwb3RlbnRpYWwgcmVncmVzc2lvbnMgZWFybHkuDQoNCkhhdmluZyB0byBzdWJzY3JpYmUg
dG8gZWFjaCBwb3RlbnRpYWxseSBpbnRlcmVzdGluZyBNTCAob3IgdXNpbmcga29yZ2Fsb3Jl
IG9uDQp0aG9zZSkgd291bGQgbm90IGJlIG15IHByZWZlcnJlZCB3b3JrZmxvdy4NCg0KVGhp
cyBpc24ndCBhIE5BQ0ssIGJ1dCBtYXliZSB0aGVyZSBhcmUgb3RoZXJzIHdpdGggc2ltaWxh
ciBpbnRlcmVzdHMvcHJvYmxlbXMuDQoNCk9yIGlzIGtvcmdhbG9yZSBjYXBhYmxlIG9mIHB1
bGxpbmcgQUxMIGtlcm5lbCByZWxhdGVkIG1haWxzIHdpdGhvdXQgaGF2aW5nIHRvDQpzcGVs
bCBvdXQgdGhlIE1McyBleHBsaWNpdGx5Pw0KDQoNCkp1ZXJnZW4NCg==
--------------rCUDJoysabVzy4kgINtUv7hZ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------rCUDJoysabVzy4kgINtUv7hZ--

--------------50Lf3zC22aAIf0GRaWqGVI3r--

--------------vxB2oDNLt7pmMDslmmFRNvPl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmrHl1cFAwAAAAAACgkQsN6d1ii/Ey/f
Kwf7BuZmcmo4XVW8XWbWPrji9W4UrfN0pfUImZjHy+QAPdpNCLUmLt+ALtYjArgKCuQYj1kl2d8T
Ml0O//eM+4K34ZlRyeLQjRpdnBBf5EoLuJQSVC9qrl6YNp8bJcM2CDrYIhPzk5hNXb1FJav2HdhC
M9Jom7mmmLGLuZCwL2N33C/Vlhsm7n2OjiYYqucNtY2BCv3Mw7PQK4sCp245HRueg+bH/FZyrK2I
mcrpkrHm7CpJRYgXmC3xXyXKRxP6iWItXYZZa1ZYI4IG/4FMyqfd1Tnxe9z5Yij17i3RlNCur7vU
wulA2vEzmqVeHA/uVEPQoz1TArFEWK5xyRzos4+TFg==
=HDMa
-----END PGP SIGNATURE-----

--------------vxB2oDNLt7pmMDslmmFRNvPl--
