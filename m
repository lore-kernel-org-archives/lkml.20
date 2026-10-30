Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793360274;
	b=4liCdpMuGqG/Rwtu/ZOZ0c9loe830c0JAlvtIzfYGjinqBAIq7AAkHMh8KREi7REypm1
	 SUjZm2YAZIFLE29x1A2rDGvwWjToZv51R2wEto1GNlC/Ght9EcTiciDtij2pQNnG5FT9j
	 C7c6Ubk59W+55zTVQgJxvJhJgflPpLYNPYGcSRCrxGqlI1sLuZBmPjsMZQmqXLqDSAjbo
	 ydXiu7cuOfy5q7J8qfIXZOi1hZ33eeoSS1QeI1LcHDnXkbFFWjtFOgNUatuEzRLckRp2U
	 9rIbC/VM7B7Y58oA2zzxDJCtg6D0Ttkez4wK0mKA/SlTbYItO2IFJVksJf3md3el7qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=2TdFwSLld4QzeN4xCtR7SPOBFqA4szj65Dl45dXunEo=;
	b=YHkgvuTcF1fxdXCqQfvejYNgw27OkV//MrXQLv1j6fFJqERfzKmVWoaZ+IDPTdpFY/QS
	 sWXOEPbMJCC/Ewmp63fqMV77GK2e7wninq0dm3Rta4xl1FtGXNAN4Z3Qj7z4GUnFG+xLa
	 x/9JZdTR4nkQLmFu4h04V82oDocP2ydQ0y/+HRw07CFAMfZAVNRRb5qrS37u48n5AuzPH
	 FvfC7B291a0rGdMLoOXxqkprffWtVxdo7cXNOAW3cYwpAJkNvAvVuiWKewhVVmpWCuzID
	 02ZbRgxSI30F5jHUGWhKA5cMMpdmsGFZZo9RbK1zI9cKr16+zfYTcg79+vbPwbg8NEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VW7da+BS;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4F3606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A4F3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VW7da+BS
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4682977f9aso65338866b.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793360273; x=1793965073; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2TdFwSLld4QzeN4xCtR7SPOBFqA4szj65Dl45dXunEo=;
        b=VW7da+BSVT6T5rZa7BAVUnDyoJrgtDoLFIeuTI4eZ8TI7PWZiXLyONX+Jnx62M4OUH
         R0vckiiTvP8o6jxqoasrD3TUakfOanM7P8D8kz0j4IHar2pfyJLGFh8lvBmouD2wA81B
         E5fciDj7InJ0sM6zZgYbjqVsn1ArsIHMqMT1lNxIt/85U8sdqFpWhI2icdIQLG4FGItR
         vCKLzVsz5lG7Tk0ha8gCv7ytn9KOvCCQ330CDos8mkbP/SbQQP2JSXOmz24NAZ0fj0hI
         PCAaWfsSBQrO+XbwTXxuu1757VMK/tvhE0SAbJJpEmB+MQwjO/auD8AP8sSTUnYJ68Pe
         SgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360273; x=1793965073;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2TdFwSLld4QzeN4xCtR7SPOBFqA4szj65Dl45dXunEo=;
        b=Ax4ZYiYoPCD7W3VEi/kHmcoMLHKIrACJ6c1PLVAlMv+wob3kEZd8ztOym5MyvSXVIU
         aUXWRu1KjJSZkIUcTzWmEd8pK0OltUw0QCSYT7t7WWD5uw943iFnjb7iuTVbCG7Jy+9d
         JPL7yeKoqLjLP1zQ731kHh1/R6ojagykndvQue10eslduyKC2DlZo9oHWBiEcYkHMiyd
         ig/Fpgy9wYNgKDd/wlvFTKu0iev1knNBqKMWfbeEJb6LeO+5ZomWX/kmHxsJY20BtzgY
         qAPL01/OAzVsUp8p0HnNxUSMPuUkEK0COPjfv1/AaBg2OZ314Mw/XfziBs8MgzsSrxDF
         H+Kg==
X-Forwarded-Encrypted: i=1; AKwUvBzkEkmgSLXuRm4LGN+p2rjf15B0rCm6BjiPdFGzVSQZAvxW4VUJOx7dXSveELC26HPwJPY68ctiygpyB5s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqgXb9orc0XQPGyWSIybFLekYc2180M/Ja1lg7qcNlWwFRovtT
	cyYvFVVOsT8O73iy7yPJN97syP6kQKBANQc3sQwIJhD5BdpA9+fPz1lSjn9Uv4zJ0TY=
X-Gm-Gg: AYBFou3RO40hrwfG3EmNgKbe/DVdP1q3V3ZhBNxtIpfBqkKtzNM/SYsSctGJsESlWrK
	WN2jWt2bFRApfdYywGI7NSuCh2vXk4U+AU4hD3ZWIbcrwZEpPa2e8aYQTycaf7+wMkCIfV9MYmc
	FXJCLfJknrHJzjFHikkGdD5RQgQeJVvcxblEElYSJ1EDwP7+oopXTFlE0BSJEfay2deoKrcxAA4
	SCjE8WM5+Vwf+I/sOkh1VIfiI8EZ/SNmnkEZ8TjRggsTt1KLqWlr8CeUOEbNscChJa5Ee+W/bVK
	Gm0OFslFR6hasYRiVS+DmphigD+zDGW5YH3O6tHYbF3ORffkyc8JMvFe3YFG/HE3TiBwdU/Ignm
	/E1LtocMWKtZMbV1YaqUMO1CyTWR0TZUDDOSm5lmuEcp+sqPN+Lm+7wIvCeSB9MiINrbJB1WjAc
	XM9E0ZEAYjonKaJet78So6VnvYipU+rQPLIyRG/MHoNqFzB0MNY/h1kBdLrfIZ5ncHXfRnlRTsj
	yhYTa3ONj0HnWdzQagpV5O5S8VEXWViTQOJbD0lDVJfayNDqPL+aPXeMaimDhzVfbi2bD4cGqPx
	UX6tgGMGU4DiiLN3ML0qD7Hos10hn9M00FTcY7Co1wjsnnRLLbj9GUt1TR+7brLQ+IbJGO9rEqz
	TUyi40oO9Gk22dUvEau1KefI1yFimjT3VNxFBMnQyl3l30T7s+2mfvXo=
X-Received: by 2002:a17:907:80b:b0:c2d:be57:f73a with SMTP id a640c23a62f3a-c4ca7a072dcmr182967966b.13.1793360272617;
        Fri, 30 Oct 2026 04:37:52 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cb092c042sm27677566b.82.2026.10.30.04.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 04:37:52 -0700 (PDT)
Message-ID: <f7213045-4605-4655-9c88-ab3cafa0a80f@suse.com>
Date: Fri, 30 Oct 2026 12:37:51 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: paravirt: Mark steal_acc as __initdata
To: Thorsten Blum <blum@kernel.org>, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: virtualization@lists.linux.dev, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261030111053.114812-3-blum@kernel.org>
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
In-Reply-To: <20261030111053.114812-3-blum@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2BwsZTx69HSxgfco3oc0Wvi3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2BwsZTx69HSxgfco3oc0Wvi3
Content-Type: multipart/mixed; boundary="------------Nzr0UlVtZSKudWhbVnfiI9EU";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Thorsten Blum <blum@kernel.org>, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: virtualization@lists.linux.dev, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <f7213045-4605-4655-9c88-ab3cafa0a80f@suse.com>
Subject: Re: [PATCH] arm64: paravirt: Mark steal_acc as __initdata
References: <20261030111053.114812-3-blum@kernel.org>
In-Reply-To: <20261030111053.114812-3-blum@kernel.org>

--------------Nzr0UlVtZSKudWhbVnfiI9EU
Content-Type: multipart/mixed; boundary="------------02U2QW2VwF8f3BV2DKooFBr0"

--------------02U2QW2VwF8f3BV2DKooFBr0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMTAuMjYgMTI6MTAsIFRob3JzdGVuIEJsdW0gd3JvdGU6DQo+IHN0ZWFsX2FjYyBp
cyBvbmx5IHdyaXR0ZW4gYnkgcGFyc2Vfbm9fc3RlYWxhY2MoKSBhbmQgcmVhZCBieQ0KPiBw
dl90aW1lX2luaXQoKSwgYm90aCBvZiB3aGljaCBhcmUgX19pbml0IGZ1bmN0aW9ucy4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFRob3JzdGVuIEJsdW0gPGJsdW1Aa2VybmVsLm9yZz4NCg0K
UmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVy
Z2VuDQo=
--------------02U2QW2VwF8f3BV2DKooFBr0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------02U2QW2VwF8f3BV2DKooFBr0--

--------------Nzr0UlVtZSKudWhbVnfiI9EU--

--------------2BwsZTx69HSxgfco3oc0Wvi3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmrkgY8FAwAAAAAACgkQsN6d1ii/Ey8d
7gf/d0xlUYSFeFD5bOSurFsAT+L8A5rU1G79UcwL9ZErAMBMWOU/nYlpNzn6eqRIVUp9+l2gLi4f
xndbnOzCWlPF6xEEn835vmRb30jKyilOIgMzJIZ2LXe7DYRiUMvysU5GTI0mOJZ7nkQKZDvmuSCO
5QFcO8eMArtB/Bi3v3bpW6CqzxRoql7UAWKarMBJdLQrSz/okf5dIqy2uQMp/90mrzqR4ZdicmVn
9TSAAjdkWqf3GRB6Y84SaGUjgoJhL6R3xZnWAAKYk7XKHtWCe7AMLo6RU8H5zpbFwPrjHy2E5T5d
59GkECXL9V6MZPiEhIxD5LgVnE1CwHaKRdcje1XAtQ==
=WJpP
-----END PGP SIGNATURE-----

--------------2BwsZTx69HSxgfco3oc0Wvi3--
