Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794531454;
	b=S87/eRV4mqHE6Re1yjr6ufT2MuToEbftJalF5QAxJmR1Nm97g1yZpMGU8tUG0bdCq2wM
	 +rQLo8Yg9WA8lNQh3Z3W02w2GfCA7OOYp4i3cUgzaO/3k6SsGNBht2/p0iD8zipiNUFRj
	 up7qQGP7B2yWkbbH0irzpVfzOpk7m5lClSoYEKfGQNLalrnhbRAjLLYzdMPERpGXfExlp
	 13Gtphs6Uv2rWObdi0C5J8QIo3T9TP47OfVJGCegBNOStm/USlxHfJkdVtgbwsm/SNze+
	 6kdW5/WnHVLA0J7fhaJ8HXDQosSdOtl0KGw4MswiHXH5oE0fE1cvUpRLTBkkIXIE33A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794531454;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=31V3qdlSdnz4MOuLMwp5hpdA+AchzM1x7ZW8LBpE0QI=;
	b=F9Ygye07CEPO/qDawoMemMk/yboQIm2n9WZIf0VomV0UbTG+QapaJ97FLn5P2DNTjNLY
	 g30DePrUlPYKCdZZjnFEbtw4VbpZe51fgurjF6pmYE+RmsKj3gFRtLEb4cqZvKaByr8p/
	 D7ykD49CdtP0aUVIK+Tv2fbh/G0LY4BS5/oCiAeH2pChpy3EVijHiHPkyZwaMPRkiHz77
	 aQewerJOVjF/Ub1Vo3Eevz3AVzeONIp8r58JVRwJvbztkfKO4+g9vfbnQfpHFJ6fuucF+
	 1lgHkQIvNnqycm8N/A8WE2iKNulng07upUjMeG5NQyJOiuDQduST06fP7/fosbmz2wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=DWWUaiHf;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b="pYpX/OdJ";
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF713606A323;
	Fri, 13 Nov 2026 00:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF713606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=DWWUaiHf;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=pYpX/OdJ
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794531415; bh=31V3qdlSdnz4MOuLMwp5hpd
	A+AchzM1x7ZW8LBpE0QI=; b=DWWUaiHf2Zzhf66WBFqKi55LlUGCRU3F28bM+847Ubmi6Pvrfp
	j4o67zcS2QCznaX4eLWg+BtM7Ix0ypcf4/Aw==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794531415; bh=31V3qdlSdnz4MOuLMwp5hpd
	A+AchzM1x7ZW8LBpE0QI=; b=pYpX/OdJ+Tu95tgwvaMZdmFQdITa/e1E7ZnzLskAMWiWgZIs5S
	ZF6P3nhbNEc4TcAUg0gtDt8GKnhJeK3yPfcC7ByQI4PKIW/HRaJN9hiFNf0+rXgjmamZc9/XbHR
	Tsa3GdeTkedManOnlP4p2QP4cWQKVWWYFh4Ws4TFJ8/gbseREFwbUReOIzBsQNKbkfJy8PsyXsZ
	OsE20YOckyFY1fg4MRCFp7l+5HYQqnx2B2NQ6vwPK4r1qGNAbXeIZ98ulVPSkDXrPo3ObcNGjlU
	jfNUma1obwoA2/SscF5xIh6oku5/FCZViwSPzm9QN7PtSl7W943FtrfsI2sKEPLlLIQ==;
Message-ID: <2b9c85e9-58d7-4e31-b908-db3b0d0bd871@erebion.eu>
Date: Fri, 13 Nov 2026 01:56:54 +0100
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
Subject: Re: [PATCH v3 04/12] arm64: dts: qcom: sm6350-lena: Enable ADSP,
 CDSP, IPA & MPSS
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Luca Weiss <luca.weiss@fairphone.com>
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-4-cdc3be96d257@erebion.eu>
 <d176aebe-bc30-4585-8b71-821a30657a0d@oss.qualcomm.com>
From: erebion <erebion@erebion.eu>
Autocrypt: addr=erebion@erebion.eu; keydata=
 xjMEY7S2FRYJKwYBBAHaRw8BAQdAUf0YlT6sBQSunZeO44bgAPe+ndqTifGaNjw7vzJ2KPHN
 HGVyZWJpb24gPGVyZWJpb25AZXJlYmlvbi5ldT7CjwQTFggANxYhBJyMprURw7/YpjH7646v
 QDJuAq59BQJpWnovBQkHhhzbAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQjq9AMm4Crn057AEA
 j3didUIhbtAoppk2eNu6CbtMvkDisHWHVLaWF8YC1VsA/1P0ngBoVghELMachirfTinwBplJ
 qP7GGlSGRqSfnlAKzjgEY7S2FRIKKwYBBAGXVQEFAQEHQN6NPWcyqKdecGU1vN8FVXBwYEUd
 OAhF5jpmd7M0Ybx8AwEIB8J+BBgWCAAmFiEEnIymtRHDv9imMfvrjq9AMm4Crn0FAmlaei8F
 CQeGHNsCGwwACgkQjq9AMm4Crn075QEAoDqfm4OeAEQWMgfQ496u2S3rWJw1EMgTOP51FQbX
 rY4BAKn6AhEBh605uas3OTVtcwNIAJn1sHTA7HqqWniUe9sP
In-Reply-To: <d176aebe-bc30-4585-8b71-821a30657a0d@oss.qualcomm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EX2iq1P6U067v00X4SWZvkHm"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EX2iq1P6U067v00X4SWZvkHm
Content-Type: multipart/mixed; boundary="------------RvxOpiSSF6PfCDrX939QHyOK";
 protected-headers="v1"; hp="clear"
Message-ID: <2b9c85e9-58d7-4e31-b908-db3b0d0bd871@erebion.eu>
Date: Fri, 13 Nov 2026 01:56:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] arm64: dts: qcom: sm6350-lena: Enable ADSP,
 CDSP, IPA & MPSS
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Luca Weiss <luca.weiss@fairphone.com>
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-4-cdc3be96d257@erebion.eu>
 <d176aebe-bc30-4585-8b71-821a30657a0d@oss.qualcomm.com>
From: erebion <erebion@erebion.eu>
Autocrypt: addr=erebion@erebion.eu; keydata=
 xjMEY7S2FRYJKwYBBAHaRw8BAQdAUf0YlT6sBQSunZeO44bgAPe+ndqTifGaNjw7vzJ2KPHN
 HGVyZWJpb24gPGVyZWJpb25AZXJlYmlvbi5ldT7CjwQTFggANxYhBJyMprURw7/YpjH7646v
 QDJuAq59BQJpWnovBQkHhhzbAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQjq9AMm4Crn057AEA
 j3didUIhbtAoppk2eNu6CbtMvkDisHWHVLaWF8YC1VsA/1P0ngBoVghELMachirfTinwBplJ
 qP7GGlSGRqSfnlAKzjgEY7S2FRIKKwYBBAGXVQEFAQEHQN6NPWcyqKdecGU1vN8FVXBwYEUd
 OAhF5jpmd7M0Ybx8AwEIB8J+BBgWCAAmFiEEnIymtRHDv9imMfvrjq9AMm4Crn0FAmlaei8F
 CQeGHNsCGwwACgkQjq9AMm4Crn075QEAoDqfm4OeAEQWMgfQ496u2S3rWJw1EMgTOP51FQbX
 rY4BAKn6AhEBh605uas3OTVtcwNIAJn1sHTA7HqqWniUe9sP
In-Reply-To: <d176aebe-bc30-4585-8b71-821a30657a0d@oss.qualcomm.com>

--------------RvxOpiSSF6PfCDrX939QHyOK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMi8yNiAxMjo1OSwgS29ucmFkIER5YmNpbyB3cm90ZToNCj4gRldJVyBhbGwgb3Ro
ZXIgZGV2aWNlcyBoYXZlIGFuIHVwcGVyY2FzZSAnUycgZm9yIFNvbnkgaGVyZSwgSSdkDQo+
IGxpa2UgdG8ga2VlcCB0aGF0IGNvbnNpc3RlbnQNCj4gDQo+IEtvbnJhZA0KDQpUaGFuayB5
b3UsIGRpZG4ndCBub3RpY2UhDQoNCi0tIA0KZXJlYmlvbg0KDQpYTVBQOiBlcmViaW9uQGVy
ZWJpb24uZXUNCg0KQWNjZXB0ZWQgbGFuZ3VhZ2VzOiBHZXJtYW4sIEVuZ2xpc2gsIFN3ZWRp
c2gsIE5vcndlZ2lhbiwgRGFuaXNoDQoNCg==

--------------RvxOpiSSF6PfCDrX939QHyOK--

--------------EX2iq1P6U067v00X4SWZvkHm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCavZgVgUDAAAAAAAKCRCOr0AybgKufeOR
AQDVK3MOSV1de4DgpwUZLclbSokb5/z2o/pm06MTPj1OKwEAoxATUApa46KC2SnV8619BKM+EufD
BsBloLmGfnS5og0=
=8KR5
-----END PGP SIGNATURE-----

--------------EX2iq1P6U067v00X4SWZvkHm--
