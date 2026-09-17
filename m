Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3B34BEE37
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789675484; cv=none; b=Ue6lH1sxSimZE2/GISZqXmiYAv8o21dpcSDCEcDdn9K8GDQx1Z4TKgs8B0yzPJkul1UTzGo6HVcEEQZ6sOwSSpuEQ6C3CimIdBVcTFF38jSFyLWvjqdb0kascfVpq5hPiAlDRWDWIyMloFQ1G1k0CtotLKFRzhqEPSMadH0jvh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789675484; c=relaxed/simple;
	bh=LFbrsGUqW8yrpFURqHYXM1g6SNb29x00BPNmfjfVMzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CGKRHO4AyR67VEHBQq6gDxm7Eam2K+wIaHaLg2khPqk3AAqpRTXu9dj5Q3OHSzhN1YL+G1nTRe0ORWsfm1meZXRNdQh6KDPBKjSHgcPjI6TySyyMCKsv8d/ezbzIJGZzvcMAYDRz72jFMzl2GIGPpVew49y6zamTnbJllu75/j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fx2jmNqS; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fx2jmNqS"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dc83so993143f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789675480; x=1790280280; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LFbrsGUqW8yrpFURqHYXM1g6SNb29x00BPNmfjfVMzA=;
        b=fx2jmNqSi8OQ//jgkB/LIc6yoJIQbbeczZcSSPRZspiZtnXEBsYz9E7yeRRFL8j89z
         tmKLSor0bzRreZq4RGDj5J+XzfUzEij7bvYJ28kYDagkDno6T9e6Moi6GcxVn3FDK83A
         7gqyu5shSOCTr7pWkeuFCgWDT/inqlqKpEFp186LcxXrF/3lsk3GblWc9DwCcr8Dvqjx
         mPdW57KEBob/prgsrxGPnW0lnDMFLo/Yv3IGPGlK1EKpufbvFD7ick2a2NoRTr+XQpOw
         SCaIp7SE3+MpgmBQ/11RHTVfyekmpS6joqXrFsKrjyKAr53Qk+dnMgVCxfcTuse40bTH
         kCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789675480; x=1790280280;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LFbrsGUqW8yrpFURqHYXM1g6SNb29x00BPNmfjfVMzA=;
        b=Fj8gQgzhCfzKQdADEPL5ECBCWKXcZwaNry+lP/8hqei9kM5FIK0BsRQg/rf12KYheq
         kxPLJxecIyjoENON0Z+dmGhAbYsMLYgV6cCi3Mxw31cRXUJOEVnWDRAGduHfVg+iGyGG
         2e9/57u9qdLq9rZ2pmK+9XNj+SIXylkjiaGv9sv095tVJLRaKZO6k0AeZlIXhV09k+tn
         lHcp8ANDUoqj9WbXQvEbwP6by/zxLMd9BRpgaxxO5KpG6vjG//tvjYVG9vAXBAlKQ6fG
         f9cgfpMkGh89S7T2VYpbSy/H8AzInEbdFQ5xDUVYpiS6H6KwfOpNOiN/NnNNxeuwsrpY
         XDzg==
X-Forwarded-Encrypted: i=1; AKwUvBwK/ptqS6uiwUPlXrENGbBfeNPCd0sXwLvx7XDESoS8zVkSW4vRZe9DGkEIf+Hj6GlVyM0VctSrDtefTag=@vger.kernel.org
X-Gm-Message-State: AFuF++mJhg0PZzV8fh6SlbnNZRYswUReSyx8Di0EaZI2pG2f/jBJlIW7
	zGsFNY6HV/Tg/t3U5S7br44CGgkZ1tnSCEcPukea8L3tYnAQ83Wur3ZWIR21Ud/crNU=
X-Gm-Gg: AYBFou3xx9I4O1QncpcSNSB2Dp5JgbCgf3rTeavXx/iulDh9twg/SmsWb5FZLN80wyJ
	5i+EJ6bVZqsGqTyulhePatcuz0t0o7fuMVt+quYIxWlRyBSjpbLqT8E1kCYvwNFV61lxTnEPpsA
	KhkjAjJkWw4sHPYM6jHweX6BwrqDF60gfMvRisvBhUqaXmx6yTkkTV3EK+SMuCaU35+W9Nn04eI
	PcAQZ2WBWSrkhqXArhphWdyos+E5ML3/U40gjUcXzhzZkWcYz50aeCTkJAHTG9t3IpF1x19GgCW
	eDCeRBT9t6ZZJmq4FLEYGMIVa4Q9yfxoqF1rD9BUdjlEX9WtcgPpBOSuh1roydZuqkIEhuTW85H
	w3oItKFRPBpxEPqgI9/a8SEp/CocVob24eGkViyWK887RF23ofcOK+5+PKxQ0vgCQEyDAs+YTub
	AdBQKeRsVChqwZJXkwNJnrY4wzaOEzFjNvM240FGRtOqtjUequs52ed5W5CDdfoH+7
X-Received: by 2002:a05:6000:41f0:b0:487:7fd:730 with SMTP id ffacd0b85a97d-4871e254ef7mr23744f8f.13.1789675480228;
        Thu, 17 Sep 2026 13:04:40 -0700 (PDT)
Received: from [10.1.0.43] ([62.214.88.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm19968531f8f.1.2026.09.17.13.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 13:04:39 -0700 (PDT)
Message-ID: <ceac20d1-7222-403f-a9ea-1bc2194684c7@suse.com>
Date: Thu, 17 Sep 2026 22:04:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CVE-2026-90310: xen/xenbus: check otherend_id only after it has
 been initialized
To: cve@kernel.org, linux-kernel@vger.kernel.org
References: <2026091756-CVE-2026-90310-3b21@gregkh>
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
In-Reply-To: <2026091756-CVE-2026-90310-3b21@gregkh>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------u0s0u7s60hizkOeJTyVW7zHZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------u0s0u7s60hizkOeJTyVW7zHZ
Content-Type: multipart/mixed; boundary="------------HSjMX0rwW7XmHuO69cngoFbq";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: cve@kernel.org, linux-kernel@vger.kernel.org
Message-ID: <ceac20d1-7222-403f-a9ea-1bc2194684c7@suse.com>
Subject: Re: CVE-2026-90310: xen/xenbus: check otherend_id only after it has
 been initialized
References: <2026091756-CVE-2026-90310-3b21@gregkh>
In-Reply-To: <2026091756-CVE-2026-90310-3b21@gregkh>

--------------HSjMX0rwW7XmHuO69cngoFbq
Content-Type: multipart/mixed; boundary="------------si5nIhDq4P1fjYRRgLoBsnjE"

--------------si5nIhDq4P1fjYRRgLoBsnjE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDkuMjYgMTg6MTIsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToNCj4gRnJvbTog
R3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAa2VybmVsLm9yZz4NCj4gDQo+IERlc2NyaXB0
aW9uDQo+ID09PT09PT09PT09DQo+IA0KPiBJbiB0aGUgTGludXgga2VybmVsLCB0aGUgZm9s
bG93aW5nIHZ1bG5lcmFiaWxpdHkgaGFzIGJlZW4gcmVzb2x2ZWQ6DQo+IA0KPiB4ZW4veGVu
YnVzOiBjaGVjayBvdGhlcmVuZF9pZCBvbmx5IGFmdGVyIGl0IGhhcyBiZWVuIGluaXRpYWxp
emVkDQo+IA0KPiBXaGVuIGRldmljZSBqdXN0IGdvdCBpbml0aWFsaXplZCAoZm9yIGV4YW1w
bGUgb24gbW9kdWxlIGxvYWQpLCB0aGUNCj4gb3RoZXJlbmRfaWQgZmllbGQgaXMgaW5pdGlh
bGl6ZWQgb25seSBhZnRlcg0KPiB4ZW5idXNfcmVhZF9vdGhlcmVuZF9kZXRhaWxzKCkgZ2V0
cyBjYWxsZWQuIElmIHhlbnN0b3JlIHdhdGNoIHRyaWdnZXJzDQo+IHhlbmJ1c19kZXZfY2hh
bmdlZCgpIGJlZm9yZSB0aGF0LCBpdCBtaWdodCBjb25zaWRlciBzdGlsbCB6ZXJvZWQNCj4g
b3RoZXJlbmRfaWQgZmllbGQgKG5vdCBtYXRjaGluZyBhY3R1YWwgeGVuc3RvcmUgY29udGVu
dCkgYXMgYSBzaWduIG9mDQo+IGRldmljZSBzdGF0ZSByZXNldC4gSXQgY2FuIGhhcHBlbiBi
ZWNhdXNlIHhlbnN0b3JlIHdhdGNoIGFyZSBoYW5kbGVkIGluDQo+IGFub3RoZXIgdGhyZWFk
ICh4ZW53YXRjaCksIHdoaWNoIGNhbiBydW4gaW4gcGFyYWxsZWwgdG8gdGhlIGluaXRpYWwN
Cj4gZGV2aWNlIHByb2JlIHJ1bm5pbmcgYXQgbW9kdWxlIGxvYWQuIEluIHRoYXQgY2FzZSwg
aXQgd291bGQgY2FsbA0KPiBkZXZpY2VfdW5yZWdpc3RlcigpLCB3aGljaCB3b3VsZCBkZWFk
bG9jayBhZ2FpbnN0IGRldmljZSBwcm9iZSBmcm9tDQo+IG1vZHVsZSBpbml0Lg0KPiANCj4g
Rml4IHRoaXMgYnkgY29uc2lkZXJpbmcgZGV2LT5vdGhlcmVuZF9pZCBjaGFuZ2Ugb25seSBh
ZnRlciBkZXYtPm90aGVyZW5kDQo+IGlzIHNldCAod2hpY2ggaGFwcGVuIGFmdGVyIG90aGVy
ZW5kX2lkIGlzIGluaXRpYWxpemVkKS4NCj4gDQo+IFRoZSBMaW51eCBrZXJuZWwgQ1ZFIHRl
YW0gaGFzIGFzc2lnbmVkIENWRS0yMDI2LTkwMzEwIHRvIHRoaXMgaXNzdWUuDQoNCkknZCBs
aWtlIHRvIGRpc3B1dGUgdGhpcyBDVkUuDQoNClRoaXMgaXMgbm90aGluZyBhbiB1bnByaXZp
bGVnZWQgdXNlciBoYXMgYW55IGluZmx1ZW5jZSBvbi4gVGhlIHJhY2UgY2FuDQpoYXBwZW4g
b25seSBpbiBYZW4gZ3Vlc3RzIGFmdGVyIGEgbmV3IFBWLWRldmljZSBoYXMgYmVlbiBhZGRl
ZCB0byBpdCBieSB0aGUNCmhvc3QgYWRtaW5pc3RyYXRvci4NCg0KVGhpcyBpcyBqdXN0IGEg
cmVndWxhciBidWcgd2l0aCBubyBzZWN1cml0eSBhc3BlY3QsIHNvIHBsZWFzZSByZXZva2Ug
dGhpcyBDVkUuDQoNCg0KSnVlcmdlbg0K
--------------si5nIhDq4P1fjYRRgLoBsnjE
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------si5nIhDq4P1fjYRRgLoBsnjE--

--------------HSjMX0rwW7XmHuO69cngoFbq--

--------------u0s0u7s60hizkOeJTyVW7zHZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqsR9cFAwAAAAAACgkQsN6d1ii/Ey8G
Nwf/dQR5GOlagD1UWG5nqlG5q/VqFiRNebbxODwhW0ZZXTwHBSC9TWYinQsjB97nJon8Uyrvv6+n
R87sdtg9Yy+WpyZ+xcHvb7Sc3xr5+3/Zchrdmroi+sLPn7Y3hNBYxUtUSMgOXSme7QuOSKBVhhLV
yIB4jGuGgS/DoeLv+qwURU7EyeKm8J/DwvSAzHAvXGIWFGQM8e00Rge83U7+s3WI+6iNpiZE/vGb
8NP++Bb6NzN9wVKO0rdulJLvnT5ycXgFPP/FUf6nwLkWXwNEi5xPo74qaZyxBsMXaJ5OnC8UzRrB
tLEGm/h4zNHqQ5uO6VwKHcJkLHe8P5eIS1Me/t2kBQ==
=bhKa
-----END PGP SIGNATURE-----

--------------u0s0u7s60hizkOeJTyVW7zHZ--
