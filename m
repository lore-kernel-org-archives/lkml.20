Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60834453A59
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 13:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294858; cv=none; b=lOl/5vT2rio6ruFGOwD9OvCW6EiZipOptHHQouAfrrth9KnHnxsXo7MZAA9qfMMpH5r00WSF+0GMV1QQZ80U5jJERoELS95xrTEcHxFC9r5fgqtoehIUHwpH4p7uzsYbzkONLo4wgtBiXrltOZfoiGkVPGmljCnSltp/m2l4yr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294858; c=relaxed/simple;
	bh=7Aj/eV1aN03dfyswZ0saxATThPh3KtdQzu+4ci/oYpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uf1LVgFer8KMwprVCXnchXsxqtW8J9d3AtSulOAm+3e6Eu+nX3UP6m8/5r9DBNWltVvXDNaU7ZUFv8NhVRfGQBa5BISyykfwpDDSbzlktYtkExNohWJ/BlnlkIKLPYOn0IsNT/EAvJXLmccbGWYDsaC9gNEvA3kL/y+GUqyG1XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cPnDzSXE; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cPnDzSXE"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b03f23305so2575304f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791294851; x=1791899651; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7Aj/eV1aN03dfyswZ0saxATThPh3KtdQzu+4ci/oYpI=;
        b=cPnDzSXEg2c5kKmdGuDzVBDMhBVXXUALMvXlvquvJtQVW1da61Xl2cJogYfToB3XNB
         v8c8ZwX/UKr3oiuJwqBupHkgGIwdPqBEASk8V6Gn6Mds7hkpkJt1ixKmkkk/qcISqP0T
         KLG4Xn2sjTUtWlRDYjk42pylFWUqZLIN2Iav5caU216Z6z1CmIQkVb/uTJKJnctDbhQH
         Yyt168+ArxGWpdKoS0+qpMrSTEx5NojSLvFKeRgohDrnUKUYN2rJ0OZ6NOnHIYQ9fChk
         jq3gY4x2niDM/qe77qj3HJC0qtiTU1kMHT8eIiWodO2SVNjAGm+rLo78wzwDH10SSwEB
         BtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791294851; x=1791899651;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Aj/eV1aN03dfyswZ0saxATThPh3KtdQzu+4ci/oYpI=;
        b=EBDETm+KSNKX5lCWSzFwV6WiD2n//mWdon23HEOpNprmOMR7MxzXkf/Bu9+oU4Kdmg
         wkDyFP2j0KHwJ5I0egbxxoBsJL8B0R7cX9KBBoVG4hWSr3qzclntxz6OwN1ACtp75jG4
         NpGL/J+LSkagA1fy1JjAGVlQjAjM7fNk0Cl22pojm84VmXutPomHmxOwJMfmgXXc5W4d
         2rWT7vxxJ8DLhsWF1gBrNf+X4jA2eOa0xRiROu0UdpZHAQz7u0XnOeoWe7Omk6H9wLa8
         OR7KVTdoEYdpfdww7kH2GcCu3T4Q8ExMESM65h3h5f0ilAE+2AROdQWFWm2bhz7kjP0y
         eJjA==
X-Forwarded-Encrypted: i=1; AKwUvBxAB08JZpoc2XucjFqdKaSsQOZvvuupgbIVgzQBIl7Kb1dpc2WgbpKNq1xRmAJ/T4q5YzhAkuU/RIrEijY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyIY6DyM0lEoaBrOc3HETbQnfIc49AyNaIvyebAXyi95j//Ojl
	kBgYZRDXmNVFgnpuamcSSb4Qwjksgc9tqUY3lN6rqc0TaelnREd80zgMQo8hp1xfaSY=
X-Gm-Gg: AYBFou1klL37QTjlEnixkKt+ej+D/Z2yU+D09Vw4QPiEdVx+hZxnSw6wFLTrXOSRWpC
	s0CZ3WBjKwRcBAjlE+YKMbXiISAJmAKPEUHzIDhgMZvkAHVhlRTSV3um8QEgBPacoHZ0HBG49Sg
	HMXKWIoY6gMqpmvGTh0/5v8wiSgfIb6KHFwR5BGjE/PPpOoOKlB3nQwooVJSc9lcs24X2V4KJFX
	WiayNgL/A6QKS4hIaeiXt8V7kd1xeXys2lieraNq9tHtLjMgbcu7vQbDsz2A05Vl9O8C7C1yMC7
	Fz0NAQAa3xzrJtvXXTPIs5OICE3L/AjreEg/cNbMuWOr57NN5RtWmLVLq+H7Or48sB/iSecfist
	/U3/kdWwy21/IBWjS4et67KVE4gIzVw0tXp7QzGanXzOm2CpmaLvUh9otcoqyeJqBpmVHsVTSol
	epZ8dsMBlle/l05jQSXEQsYtKPX6rm5U0zc6wdqH+O1exanworaqEqYKamKgiqsaJ6xVtXpvGWf
	LGzAyL+q5FJNx1bUvnYbB5AUnihGv16O5F10l8A3R4D1htCAzqMs27qxWJaFKuSVG3eNTGrrxuX
	OF4lH4aDLPdgvNv+0vEq8mdr
X-Received: by 2002:a05:6000:4a04:b0:48c:4707:1b6f with SMTP id ffacd0b85a97d-48c480272dcmr17230715f8f.53.1791294850634;
        Tue, 06 Oct 2026 06:54:10 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c63904832sm9475402f8f.14.2026.10.06.06.54.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 06:54:10 -0700 (PDT)
Message-ID: <938f42ec-8fda-4eca-89b4-e152e5e4d933@suse.com>
Date: Tue, 6 Oct 2026 15:54:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/mtrr: allocate the cache map before taking
 mtrr_mutex
To: Yogesh Gaur <yogeshgaur.83@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 syzbot+342762971f666337474e@syzkaller.appspotmail.com
References: <20261005102152.368-1-yogeshgaur.83@gmail.com/>
 <20261005130214.1775-1-yogeshgaur.83@gmail.com>
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
In-Reply-To: <20261005130214.1775-1-yogeshgaur.83@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------82Pg0ZvYarpCvbuZjOKEPYFU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------82Pg0ZvYarpCvbuZjOKEPYFU
Content-Type: multipart/mixed; boundary="------------anOTvGBLzF0XmgEFtPmRxPXG";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Yogesh Gaur <yogeshgaur.83@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 syzbot+342762971f666337474e@syzkaller.appspotmail.com
Message-ID: <938f42ec-8fda-4eca-89b4-e152e5e4d933@suse.com>
Subject: Re: [PATCH v2] x86/mtrr: allocate the cache map before taking
 mtrr_mutex
References: <20261005102152.368-1-yogeshgaur.83@gmail.com/>
 <20261005130214.1775-1-yogeshgaur.83@gmail.com>
In-Reply-To: <20261005130214.1775-1-yogeshgaur.83@gmail.com>

--------------anOTvGBLzF0XmgEFtPmRxPXG
Content-Type: multipart/mixed; boundary="------------wUF0sIcioSEFpah1KLYWwdE0"

--------------wUF0sIcioSEFpah1KLYWwdE0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMTAuMjYgMTU6MDIsIFlvZ2VzaCBHYXVyIHdyb3RlOg0KPiBtdHJyX2NvcHlfbWFw
KCkgZG9lcyBhIEdGUF9LRVJORUwgYWxsb2NhdGlvbiB3aXRoIG10cnJfbXV0ZXggaGVsZC4N
Cj4gSXQgcnVucyBvbmNlIGF0IGJvb3QgZnJvbSBtdHJyX2luaXRfZmluYWxpemUoKSwgYnV0
IGxvY2tkZXAga2VlcHMNCj4gdGhlIG10cnJfbXV0ZXggLT4gZnNfcmVjbGFpbSBkZXBlbmRl
bmN5IGl0IHJlY29yZHMgdGhlcmUgZm9yIHRoZQ0KPiBsaWZlIG9mIHRoZSBzeXN0ZW0uIE9u
Y2UgYW5vdGhlciBwYXRoIGdpdmVzIGxvY2tkZXAgdGhlIHJlc3Qgb2YgYQ0KPiBjeWNsZSBi
YWNrIHRvIGEgbG9jayBoZWxkIGFyb3VuZCBtdHJyX211dGV4LCB0aGUgbmV4dCBNVFJSIGlv
Y3RsDQo+IHJlcG9ydHMgYSBjaXJjdWxhciBkZXBlbmRlbmN5LiBzeXpib3QgZm91bmQgdGhp
cyB0aHJvdWdoIG5iZCwgd2hpY2gNCj4gdGFrZXMgY3B1X2hvdHBsdWdfbG9jayAodmlhIHNr
X3NldF9tZW1hbGxvYygpIC0+IHN0YXRpY19rZXlfc2xvd19pbmMoKSkNCj4gdW5kZXIgaXRz
IHR4X2xvY2ssIHdoaWxlIG10cnJfZGVsX3BhZ2UoKSB0YWtlcyBtdHJyX211dGV4IHVuZGVy
DQo+IGNwdV9ob3RwbHVnX2xvY2s6DQo+IA0KPiAgICBXQVJOSU5HOiBwb3NzaWJsZSBjaXJj
dWxhciBsb2NraW5nIGRlcGVuZGVuY3kgZGV0ZWN0ZWQNCj4gICAgc3l6LjkuNTg0OC8yMTc0
NCBpcyB0cnlpbmcgdG8gYWNxdWlyZSBsb2NrOg0KPiAgICAgKG10cnJfbXV0ZXgpLCBhdDog
bXRycl9kZWxfcGFnZSBhcmNoL3g4Ni9rZXJuZWwvY3B1L210cnIvbXRyci5jOjQwOA0KPiAg
ICBidXQgdGFzayBpcyBhbHJlYWR5IGhvbGRpbmcgbG9jazoNCj4gICAgIChjcHVfaG90cGx1
Z19sb2NrKSwgYXQ6IG10cnJfZGVsX3BhZ2UgYXJjaC94ODYva2VybmVsL2NwdS9tdHJyL210
cnIuYzo0MDcNCj4gICAgLT4gIzEgKGZzX3JlY2xhaW0pOg0KPiAgICAgICAgICAgZnNfcmVj
bGFpbV9hY3F1aXJlDQo+ICAgICAgICAgICBtaWdodF9hbGxvYw0KPiAgICAgICAgICAgc2xh
Yl9wcmVfYWxsb2NfaG9vaw0KPiAgICAgICAgICAgX19rbWFsbG9jX25vcHJvZg0KPiAgICAg
ICAgICAgbXRycl9jb3B5X21hcCBhcmNoL3g4Ni9rZXJuZWwvY3B1L210cnIvZ2VuZXJpYy5j
OjQxMw0KPiAgICAgICAgICAgbXRycl9pbml0X2ZpbmFsaXplIGFyY2gveDg2L2tlcm5lbC9j
cHUvbXRyci9tdHJyLmM6NjE4DQo+ICAgIENoYWluIGV4aXN0cyBvZjoNCj4gICAgICBtdHJy
X211dGV4IC0tPiAmbnNvY2stPnR4X2xvY2sgLS0+IGNwdV9ob3RwbHVnX2xvY2sNCj4gDQo+
IFRoZSBhbGxvY2F0aW9uIGRvZXMgbm90IG5lZWQgdGhlIG11dGV4OyBvbmx5IHB1Ymxpc2hp
bmcgdGhlIG5ldyBtYXANCj4gZG9lcy4gQWxsb2NhdGUgZmlyc3QgYW5kIGFzc2lnbiBjYWNo
ZV9tYXAgb25jZSBtdHJyX211dGV4IGlzIGhlbGQuDQo+IFRoZSByZXN0IG9mIHRoZSBmdW5j
dGlvbiBpcyB1bmNoYW5nZWQuDQo+IA0KPiBGaXhlczogMDYxYjk4NGFhYjU4ICgieDg2L210
cnI6IENvbnN0cnVjdCBhIG1lbW9yeSBtYXAgd2l0aCBjYWNoZSBtb2RlcyIpDQo+IFJlcG9y
dGVkLWJ5OiBzeXpib3QrMzQyNzYyOTcxZjY2NjMzNzQ3NGVAc3l6a2FsbGVyLmFwcHNwb3Rt
YWlsLmNvbQ0KPiBBc3Npc3RlZC1ieTogTExNDQo+IFNpZ25lZC1vZmYtYnk6IFlvZ2VzaCBH
YXVyIDx5b2dlc2hnYXVyLjgzQGdtYWlsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=
--------------wUF0sIcioSEFpah1KLYWwdE0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------wUF0sIcioSEFpah1KLYWwdE0--

--------------anOTvGBLzF0XmgEFtPmRxPXG--

--------------82Pg0ZvYarpCvbuZjOKEPYFU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmrE/YEFAwAAAAAACgkQsN6d1ii/Ey9C
Qgf/djHtNtZK2pcbLmROhqlF2Q1jpxikHrdHlkBvMwk9s7HcccV8IQXERmqnYWEu4zxPLcIgbbSB
5VW+o5hLFOnYsAKV/tuGwV1WH205fKDUQa2RqtctdRStxJLaz2Ew/1YLzY4kopyY81EOndxrGkOr
Rwip7CsffvacJpCrJEcsTCIZkQo6FpKW0HhGhRMwIDgIYTqhczlAFpsUw77LaZQV1FUUEfq52MpW
01bD2vTjWnd70aodlezNs+KAwLUNXtVz3DM7H2htOkE8SOFysDkt5UHegM8DfQ471aWlhR1r/gpW
LhGKiApXpZKPY6ac4XwEgZHfRCwPjKTz1Xyiqhl2+Q==
=AbIM
-----END PGP SIGNATURE-----

--------------82Pg0ZvYarpCvbuZjOKEPYFU--
