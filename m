Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792435118;
	b=0XbVm+DTwe0cguJJhmrRUXhg4RqC4vnJss43mw8yxgB3lg6YzHZDAx4vJBYvAwFMtZof
	 0wvokqXOsJh+1Fxgdu4lzGrRkTnd1iRztrIyFTW8Qsro1s9BtJmpfOgR0/9hRgfGRGUHd
	 2shu0yPg6Ej+UVRh7UAgiIcy7qXFbpYol8L5inyuJ0V/d5q3MLc7/zqaOrKoRFWDSjgrF
	 5hs5Rz609TC/D5CbSeW8JZj8RzMK0w7xDR7lYd+YBamsBAN+QF5pPu8hRqbrCHiIHNeJp
	 146BB30q1Kuduzdz0u5AiDImf9y5q3G8ENC5/M8ByyuRsG9x9A4GK+sFk1F/u6QpV9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435118;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=VqmpqqxtdtIJZ/TLzgwyB+dL3v3MQcqOvb5KgYwYocw=;
	b=zpYMJkOYm2f7yWMI14FRyIcqtmXCMrF8QIA8+tRlX3O/a6Bi2XkNS3ISUFqEfI7ZNpvA
	 fIvEvy5OBvwA6rF1gUw3IvCHAcGOAqsAJl7TcCurnfcEmzDygZD/7SEbMymW0NKkErVl9
	 Ved47RGCdl81scwxoI5ndD9wJDICa0Klp1kaxmqYeRvUY99rguh0rCHMvv1cNuLSZvEkH
	 d1MoYjj3pAzFVQ4OJBvw0hu/+eBdRoLi1VoUz9QD8K8vjlHzAs0DREB51qW5IgpnwpQ+k
	 H1OWHH1BQ7ieo8809PgQLJ5pX6pf2O8mRnvY2q1M+ZUf+zQIcg2f25yHVGbLEJd2mnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=B1p9A4Y+;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=tXhHXaQU;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3087606A31C;
	Mon, 19 Oct 2026 18:38:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3087606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=B1p9A4Y+;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=tXhHXaQU
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1792435089; bh=VqmpqqxtdtIJZ/TLzgwyB+d
	L3v3MQcqOvb5KgYwYocw=; b=B1p9A4Y+0C6PVv3LUcNDYUvZLjXM7hMgxqclIUeZDGH17u3/12
	59TC3+svefDeQUfiW450E3g9puLpNneDMNBg==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1792435089; bh=VqmpqqxtdtIJZ/TLzgwyB+d
	L3v3MQcqOvb5KgYwYocw=; b=tXhHXaQUi5qgycsOpDpffLcROm85c90xVkmf35DHTkR7cZgv0z
	V/408OBAiL1ek9oMLgQ8hczG5blL82n266jjANzum6nTZHkp/5R7EKIb33ohLLO/OySUMmnfKFu
	7pKUR8zNlcIGgzmgBCljxqa2pqNER9EWI3KEwU4URfJOsgiDBZ+I5xT5l7u7krPI74geZgrzBy7
	aMcIAiBrXFqMUx+PNb0OIHdc+OQBy0AU2NgP91bdsLLKC1CGgNOmFj03MfMCuuJI1mWbV/x85vz
	T0uzOI/HTBgzy2seOdZ42RGtnyXo8nyBLS3XsVE5DrnLIohTu8TxIVX8ATe/Gc2LCHg==;
Message-ID: <dd7e4dd5-d544-4381-9d7d-14165f7d399a@erebion.eu>
Date: Mon, 19 Oct 2026 20:38:08 +0200
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
Subject: Re: [PATCH v2 1/8] arm64: dts: qcom: sm6350-lena: Add flash LED
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
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-1-b4612e3eb536@erebion.eu>
 <0f3f754b-c612-406e-9d35-6966e64a876a@oss.qualcomm.com>
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
In-Reply-To: <0f3f754b-c612-406e-9d35-6966e64a876a@oss.qualcomm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1z05rDufjGAHpPQicdcypUP0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1z05rDufjGAHpPQicdcypUP0
Content-Type: multipart/mixed; boundary="------------UKeaipVK5zzD958YpCQYpepW";
 protected-headers="v1"; hp="clear"
Message-ID: <dd7e4dd5-d544-4381-9d7d-14165f7d399a@erebion.eu>
Date: Mon, 19 Oct 2026 20:38:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] arm64: dts: qcom: sm6350-lena: Add flash LED
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
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-1-b4612e3eb536@erebion.eu>
 <0f3f754b-c612-406e-9d35-6966e64a876a@oss.qualcomm.com>
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
In-Reply-To: <0f3f754b-c612-406e-9d35-6966e64a876a@oss.qualcomm.com>

--------------UKeaipVK5zzD958YpCQYpepW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvMTUvMjYgMTI6NDYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQoNCj4+ICsJCWxlZC1t
YXgtbWljcm9hbXAgPSA8MTgwMDAwPjsNCj4gDQo+IEdQVCBzdWdnZXN0cyA1MDBtQSBoZXJl
DQo+IA0KPj4gKwkJZmxhc2gtbWF4LW1pY3JvYW1wID0gPDEwMDAwMDA+Ow0KPiANCj4gYW5k
IDE1MDAgaGVyZQ0KPiANCj4gYnV0IHRoZSBkb3duc3RyZWFtIERUIGlzIG5vaXN5Li4gcGxl
YXNlIHZlcmlmeSBvbmNlIGFnYWluDQo+IA0KPiBLb25yYWQNCg0KDQpEb3duc3RyZWFtIERU
IHNheXM6DQoNCnFjb20sbWF4LWN1cnJlbnQgPSA8MHg1ZGM+OyAtPiAxNTAwIChtdXN0IGJl
IG1BKQ0KcWNvbSxjdXJyZW50LW1hID0gPDB4M2U4PjsgLT4gMTAwMA0KDQoNClNvIHRoZSBm
aXJzdCBvbmUgaXMgd3JvbmcgYW5kIHRoZSAybmQgb25lIGxvb2tzIGZpbmUuIFRoYW5rIHlv
dSwgd2lsbCANCmNoYW5nZSBsZWQtbWF4LW1pY3JvYW1wIHRvIDE1MDAwMC4NCg0KLS0gDQpl
cmViaW9uDQo=

--------------UKeaipVK5zzD958YpCQYpepW--

--------------1z05rDufjGAHpPQicdcypUP0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCatZjkAUDAAAAAAAKCRCOr0AybgKuffXz
AQCxliiMnmU679/FFw6CbveNLllX2vc3GERhxjlcSl/PzgD+Nejvu6sqndizVZHGKdcXkjPPsrjW
fBpZddRG908OTgA=
=pHoE
-----END PGP SIGNATURE-----

--------------1z05rDufjGAHpPQicdcypUP0--
