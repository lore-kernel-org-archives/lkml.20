Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE24E4AE12A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788441709; cv=none; b=O54nmgk5NBJbYRL6e/IGyaaoGM6DWD3eA8JMo5HN3gbWpAsXmYRjSkawaPgZO9fRyQux+tnBvOrr4f+y4Jz4HHIVNK0R+XYIC+QymEBVx9TWN6J/Xp/hEst1QMJ2onCy4SdeYwBFjExOKpfmhzeAexOCaDOo9SBD2AaQFSMptfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788441709; c=relaxed/simple;
	bh=PQkLytTZT4SN++4srG0hVAU5DCBgVADto5HoLyxq0DU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R63wku3F6W55qnk2yjzP1X6V9frNwhuxSqLJaTlIKf4kmDPc9qe3h4kItydVXvAUzITyunkNhUOBEOhrm4/FVZezA78XhysRvbEGb5d2uis0qcnCIHdIQvy1SD/M1GtIKCFS9c4nhPW5fcpYoRVXnuQEMRVS8Nu3xsOKzWw8Pi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dVbBAMzq; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dVbBAMzq"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a18e24ad25so3266809a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788441703; x=1789046503; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PQkLytTZT4SN++4srG0hVAU5DCBgVADto5HoLyxq0DU=;
        b=dVbBAMzqqO5DxIJ93+3CcYzQqi+8CSMITWc8PehCSW2/W/78PgZTNfA05qyV9ybrzG
         zwoMW31pr9BnSo+VT0W3SF/tVMno83D33wc3h5z2dCudt7s+/eFM8sCCKkGZF15XYNY5
         TP5gbg6BSNTU3DF5+X2g+Kzb+W6tXj2Sf6LbfF4QKrJSFsOOFIscNUhylfcKyod+Kf7W
         wy4XskZSfiV8Nn8/GVMeFJKYoZ2OQJhOg2UAJVjHCzrBTuep4YYGPv+fuDw7L5hNI6Cj
         Kp8oHoSy20PyFPjEA2GkYYW2sUIzKpCmJUhVrHthjJ8l7kXv9Bj50I2JBMbMQRsbrpaX
         qYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788441703; x=1789046503;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PQkLytTZT4SN++4srG0hVAU5DCBgVADto5HoLyxq0DU=;
        b=L6MJmIC8ezEPSlw9XJh8l5mDxYVh8yYsTKC0XPHS5B6kXj6KAX4LZuAsPhtwYbNLrs
         8YmBNa7v9jruXVL+RhY7YpkvwcYrEYDu0+G0Rg6j74sCz7pfz2o6GABshRlg5geQV51l
         e+LNzaOoxedu2l3Gh1dwDFxxHPxfhQw9lE4VS3QB/8q8fVlv6GgjVJHm5FZnFEbcqGhL
         QoiGBbNXZum06GWq2bfQiH2NeocTgzxShBSIiS70y4xug/rmP3QgR436b3UYFH2YB7ep
         52Oq5YvFxO+/GoQwvVuMxGeAxIVeottV7xtu/wi55HVhYT0EMoyFe6KYo5kTTbP6eH28
         DiSw==
X-Forwarded-Encrypted: i=1; AKwUvBycsaFF2dVgB1de7oC8Ed3t/TmhPrTUuixr94e1fSXalifOraqb+2r3Y61DmICx26j/aEiAIPq/sP/dvu4=@vger.kernel.org
X-Gm-Message-State: AFuF++lL/geydVy7RIuAz7yT4U4YIcRvUOh+5UYaLTHr10SEHLYjQQow
	9q7JrLevN3gzPaBpHbTho0czxBKp371RiqdJsZl0jYLflq3bQ7Meiicx6cTceOvgdRE=
X-Gm-Gg: AYBFou34e8UoyhevJhDZEGdWwms7zIYVO5R3URl3XXbCBmjeJqGw3pt4BygXRKLrQVu
	uh5ylDuMF9erqjKDEwm71q74YJ6pal2YkUTsUaMesShKUAMhNZTJ6MEiot1K0/jVg1iJ5pmlb+k
	28eYd9BlceJVKMRUrV0A2pljKN5Bb9OSF8pDKG8siGWaNaU+TLqXNqFwRQTZWEFbDE0c0/k30Dp
	ZxxrnWYwu9UrNpWYFZAz9VLMDK0Z8zRPegYe5hYf4J1JarQZVYx4nbQEpDqgx+3gCqMNbTVieeS
	m7nTgc/y/TWy7FKa6w09ocKu0FdPyVTbz/DwvAO3lP9NYFoyU22g59cSkptaJq1p6tjri6ItIZ5
	RffWfZ2g4LoaUuo+/F1/GLlRImytJs5N5wra2TGLGUJXoYe7ZdRmhRNuEZPUc4HOthKYMDnFnBG
	9DUJY3Sban8ubSNy2s4oDMlFObGNuAGDvGrd9uAXJJW+NehuvSim2rCZCjUt4bvrhriPFt5N0Do
	fLC5bG9GseLazKvs9pUAyimMhBu4abj77VvRFN3GYS7N80XXbLXaOjSjlhOY/sV8Ia8/gNrujol
	NRlb28fTVTky9hzAz0/eZWAn
X-Received: by 2002:a05:6402:3815:b0:6a6:774e:8a56 with SMTP id 4fb4d7f45d1cf-6a682567105mr9270695a12.4.1788441702626;
        Thu, 03 Sep 2026 06:21:42 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f932c41sm2427240a12.15.2026.09.03.06.21.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 06:21:42 -0700 (PDT)
Message-ID: <4c41443a-e856-4e97-bd24-8fb67bb391e3@suse.com>
Date: Thu, 3 Sep 2026 15:21:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/apic: Remove dead disable_esr machinery
To: Daniil Tatianin <d-tatianin@yandex-team.ru>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org
Cc: Daniil Tatianin <99danilt@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Steve Wahl <steve.wahl@hpe.com>, Justin Ernst <justin.ernst@hpe.com>,
 Kyle Meyer <kyle.meyer@hpe.com>, Dimitri Sivanich
 <dimitri.sivanich@hpe.com>, Russ Anderson <russ.anderson@hpe.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20260902220124.2931854-1-d-tatianin@yandex-team.ru>
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
In-Reply-To: <20260902220124.2931854-1-d-tatianin@yandex-team.ru>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iWbHXbpzPo1Jfvy0R7j2BLDb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iWbHXbpzPo1Jfvy0R7j2BLDb
Content-Type: multipart/mixed; boundary="------------tIP3VVuqkhqbdXkmZAyfita6";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org
Cc: Daniil Tatianin <99danilt@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Steve Wahl <steve.wahl@hpe.com>, Justin Ernst <justin.ernst@hpe.com>,
 Kyle Meyer <kyle.meyer@hpe.com>, Dimitri Sivanich
 <dimitri.sivanich@hpe.com>, Russ Anderson <russ.anderson@hpe.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <4c41443a-e856-4e97-bd24-8fb67bb391e3@suse.com>
Subject: Re: [PATCH] x86/apic: Remove dead disable_esr machinery
References: <20260902220124.2931854-1-d-tatianin@yandex-team.ru>
In-Reply-To: <20260902220124.2931854-1-d-tatianin@yandex-team.ru>

--------------tIP3VVuqkhqbdXkmZAyfita6
Content-Type: multipart/mixed; boundary="------------1aIsTFF7uTwgzFFWi4jmvaGy"

--------------1aIsTFF7uTwgzFFWi4jmvaGy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDkuMjYgMDA6MDEsIERhbmlpbCBUYXRpYW5pbiB3cm90ZToNCj4gRnJvbTogRGFu
aWlsIFRhdGlhbmluIDw5OWRhbmlsdEBnbWFpbC5jb20+DQo+IA0KPiBhcGljOjpkaXNhYmxl
X2VzciB3YXMgYSBxdWlyayBmb3IgdGhlIDMyLWJpdCBOVU1BLVEsIFN1bW1pdCwgRVM3MDAw
IGFuZA0KPiBiaWdzbXAgcGxhdGZvcm1zLCB3aGljaCBsZWZ0IHRoZSBsb2NhbCBBUElDIGVy
cm9yIHN0YXR1cyByZWdpc3RlciBhbG9uZQ0KPiBiZWNhdXNlICJzb21ldGhpbmcgdW50cmFj
ZWFibGUiIHByb2R1Y2VkIGJhZCBpbnRlcnJ1cHRzIG9uIHRob3NlDQo+IG1hY2hpbmVzLiBO
VU1BLVEsIFN1bW1pdCBhbmQgRVM3MDAwIHdlbnQgYXdheSBpbiAyMDE0IHdpdGggY29tbWl0
DQo+IGI1NjYwYmE3NmI0MSAoIng4NiwgcGxhdGZvcm1zOiBSZW1vdmUgTlVNQVEiKSwgY29t
bWl0IDdjZjZjOTQ1OTFiYg0KPiAoIng4NiwgYXBpYzogUmVtb3ZlIHN1cHBvcnQgZm9yIElC
TSBTdW1taXQvRVhBIGNoaXBzZXQiKSBhbmQgY29tbWl0DQo+IDU4ZjVkMmQ0NDg4MyAoIng4
NiwgYXBpYzogUmVtb3ZlIHN1cHBvcnQgZm9yIGlhMzItYmFzZWQgVW5pc3lzIEVTNzAwMCIp
LA0KPiBhbmQgdGhlIGxhc3Qgc2V0dGVyIHdlbnQgd2l0aCBjb21taXQgMGFiZjUwODY3NWMw
ICgieDg2L3NtcDogRHJvcA0KPiAzMi1iaXQgImJpZ3NtcCIgbWFjaGluZSBzdXBwb3J0Iiku
IEV2ZXJ5IHJlbWFpbmluZyBBUElDIGRyaXZlcg0KPiBpbml0aWFsaXplcyB0aGUgZmxhZyB0
byB6ZXJvLg0KPiANCj4gUmVtb3ZlIHRoZSBmbGFnLCB0aGUgRVNSIHNldHVwIGJ5cGFzcyBr
ZXllZCBvbiBpdCBhbmQgdGhlIDMyLWJpdCBvbmx5DQo+IEVTUiBjbGVhcmluZyBoYW1tZXIg
aW4gc2V0dXBfbG9jYWxfQVBJQygpLCB3aGljaCB3YXMgZ2F0ZWQgb24gdGhlIHNhbWUNCj4g
ZmxhZyBhbmQgdGhlcmVmb3JlIGVxdWFsbHkgZGVhZC4NCj4gDQo+IE5vIGZ1bmN0aW9uYWwg
Y2hhbmdlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERhbmlpbCBUYXRpYW5pbiA8ZC10YXRp
YW5pbkB5YW5kZXgtdGVhbS5ydT4NCg0KQWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4gIyBYZW4gcGFydA0KDQoNCkp1ZXJnZW4NCg==
--------------1aIsTFF7uTwgzFFWi4jmvaGy
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------1aIsTFF7uTwgzFFWi4jmvaGy--

--------------tIP3VVuqkhqbdXkmZAyfita6--

--------------iWbHXbpzPo1Jfvy0R7j2BLDb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqZdGUFAwAAAAAACgkQsN6d1ii/Ey82
gAf8DsUJTn4oLgaXK8vEf9d3s6Ux3cSyhOC83QycarbB9fCeHEwJkJba/DO8+L+jvYcwDa7AsC1v
ybzCvUrXwuYUBQK/odBzbRIMQuxLL5wct+e2HYEbLw/t/7gayJCiKdzXqQO/XLzlJrcPMXn5Fr2e
mS6kc5dwlStPDVEkyFiXAL5YT1q0FChAJJC2xOy91Xs5wEnOhPee4ZPYNaPX95rN2x6of23o76Gr
S0Jk04w3Jdq8WAt6P3Yx953IV9e8ljWx3yLMlGnMwXeAgNR3yXk0DHdVAcV7tBU8TfeBg2R9JpIi
zNfsJn1HboyPCDz/wLc8L2ji2JA2oDrp1FTbQL4kKg==
=SqeV
-----END PGP SIGNATURE-----

--------------iWbHXbpzPo1Jfvy0R7j2BLDb--
