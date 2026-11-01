Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793575331;
	b=pbt/lhtzAfHtYSjTZR5M4noqJcggwQlHpSLSJRtIraUWQoIkgQUmMXX/kWLWCPaGp+Yo
	 cqaP1ZBPPwXS3nuO0qtmE33d4sdD6DfJ+MrfRuXh7y8uyKCiNSAyHYZsq3nEoKL4zzi8e
	 rYKjEJS4nKRugyTaxe1w1gmh68wvc/aQVHjT4FtDF3sYuyXYOqJVreB3A9gpm6f5mbQxH
	 b47ddXmOmVa79DL6xXWjaibdlx3ct3tL4RNHEjHlfJvBwHmXvlEuKK7BdOBqy6cetpwq5
	 9crQGtOpD0WvHUQ8C3pFSgAkY411Suz2pItN0iycgZnNo3POfX9IcsA6aLzNfxFGWqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575331;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:From:To:Cc:
	 References:Autocrypt:In-Reply-To:Content-Type;
	bh=5uAqahLyf28xXPGq/xW/37u7edux/lBqVsMIZXhNEWQ=;
	b=ZDn8FqFfZx5V3CKFeIX1ktIjGQ54cwTmNFPFa5l1R0WTAt6LzhsDXWbNFoY9DN5a6WV3
	 PQ4DFFfGQT3gNwMBo07fP98CvB6kz0KkNRM1fDwXhbx/MxKj34mz8Ils1sGotBGTe1bJA
	 Xk04c2XzdCpOGHdtRZjvitTjUD2RWDxKHw2YIaQsB2UaqbM2OvnboxHRNFJekVIOQGJaY
	 mlxvECaqCi4fcaObiWLOngYVM4wDSJDzi3OyWG2oUDUAWksJq076lZMNMefCD4gKgGv9C
	 hzqV5wWUTN+OupVbom88PNEOdnc0W3to+WQt/5tDVJegPgiwiRp1Qu0SzQzaxskAO5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=QpMLiNyz;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=vBQIAhYi;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17698606A324;
	Sun,  1 Nov 2026 23:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17698606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=QpMLiNyz;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=vBQIAhYi
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:From:Subject:Date:Message-ID; t=1793575305; bh=5uAqahLyf28xXPGq/xW/37u
	7edux/lBqVsMIZXhNEWQ=; b=QpMLiNyzjsixA6lOiz0GWB0Q5cGpDgWXHcjmmf+weL5lB5jyqF
	MKJQisK6RWa1U3VkFaXwqfrSCPGwnuxg7SAw==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:From:Subject:Date:Message-ID; t=1793575305; bh=5uAqahLyf28xXPGq/xW/37u
	7edux/lBqVsMIZXhNEWQ=; b=vBQIAhYiekW8FoI2CJBtLD2/PrJfV7q9j3uU0S4ngoFfbRS1I3
	V5hGPKMV4E/g+3kcK2w58mlyqvXFpAOB7bjYUsYSw0IFzob379AFIJs9veZsdxbtYEJQ1OxlvuF
	C3T1KeaWOMImWBnrjjT/HqSlmgUIhegdWiVk+oI83kQwQVOJLsBM5V8pMETKQ9TVxCKXaZOASWL
	rojwmsCmseuhn69Tlgbff6Av4EPVH5C28N2tvUH+QXcXdI2ptfewTXDqCDQU1uxvtONsoMYOL9o
	Ih2dQ5aW3j81qxPVhEmvwTXtwJng5f2uwE0/XsvTRnJ05ilKOqZGF8+wMEZ2w58o78A==;
Message-ID: <da5f1210-b386-472e-963c-039fd53d43db@erebion.eu>
Date: Mon, 2 Nov 2026 00:21:45 +0100
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
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: sm6350-lena: Enable Bluetooth
Content-Language: en-GB
From: erebion <erebion@erebion.eu>
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
 <20260926-pdx213-upstream-3-v2-5-b4612e3eb536@erebion.eu>
 <ddd2d324-4202-48bf-8984-45edae0c3278@oss.qualcomm.com>
 <2f96ca42-4ab2-4e3e-b15f-f1210362db7b@erebion.eu>
Autocrypt: addr=erebion@erebion.eu; keydata=
 xjMEY7S2FRYJKwYBBAHaRw8BAQdAUf0YlT6sBQSunZeO44bgAPe+ndqTifGaNjw7vzJ2KPHN
 HGVyZWJpb24gPGVyZWJpb25AZXJlYmlvbi5ldT7CjwQTFggANxYhBJyMprURw7/YpjH7646v
 QDJuAq59BQJpWnovBQkHhhzbAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQjq9AMm4Crn057AEA
 j3didUIhbtAoppk2eNu6CbtMvkDisHWHVLaWF8YC1VsA/1P0ngBoVghELMachirfTinwBplJ
 qP7GGlSGRqSfnlAKzjgEY7S2FRIKKwYBBAGXVQEFAQEHQN6NPWcyqKdecGU1vN8FVXBwYEUd
 OAhF5jpmd7M0Ybx8AwEIB8J+BBgWCAAmFiEEnIymtRHDv9imMfvrjq9AMm4Crn0FAmlaei8F
 CQeGHNsCGwwACgkQjq9AMm4Crn075QEAoDqfm4OeAEQWMgfQ496u2S3rWJw1EMgTOP51FQbX
 rY4BAKn6AhEBh605uas3OTVtcwNIAJn1sHTA7HqqWniUe9sP
In-Reply-To: <2f96ca42-4ab2-4e3e-b15f-f1210362db7b@erebion.eu>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FH455MWZb0HIltfTq0GvCRcH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FH455MWZb0HIltfTq0GvCRcH
Content-Type: multipart/mixed; boundary="------------ip3QOm4ZfCebhdMFPrNWB5lv";
 protected-headers="v1"; hp="clear"
Message-ID: <da5f1210-b386-472e-963c-039fd53d43db@erebion.eu>
Date: Mon, 2 Nov 2026 00:21:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: sm6350-lena: Enable Bluetooth
Content-Language: en-GB
From: erebion <erebion@erebion.eu>
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
 <20260926-pdx213-upstream-3-v2-5-b4612e3eb536@erebion.eu>
 <ddd2d324-4202-48bf-8984-45edae0c3278@oss.qualcomm.com>
 <2f96ca42-4ab2-4e3e-b15f-f1210362db7b@erebion.eu>
Autocrypt: addr=erebion@erebion.eu; keydata=
 xjMEY7S2FRYJKwYBBAHaRw8BAQdAUf0YlT6sBQSunZeO44bgAPe+ndqTifGaNjw7vzJ2KPHN
 HGVyZWJpb24gPGVyZWJpb25AZXJlYmlvbi5ldT7CjwQTFggANxYhBJyMprURw7/YpjH7646v
 QDJuAq59BQJpWnovBQkHhhzbAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQjq9AMm4Crn057AEA
 j3didUIhbtAoppk2eNu6CbtMvkDisHWHVLaWF8YC1VsA/1P0ngBoVghELMachirfTinwBplJ
 qP7GGlSGRqSfnlAKzjgEY7S2FRIKKwYBBAGXVQEFAQEHQN6NPWcyqKdecGU1vN8FVXBwYEUd
 OAhF5jpmd7M0Ybx8AwEIB8J+BBgWCAAmFiEEnIymtRHDv9imMfvrjq9AMm4Crn0FAmlaei8F
 CQeGHNsCGwwACgkQjq9AMm4Crn075QEAoDqfm4OeAEQWMgfQ496u2S3rWJw1EMgTOP51FQbX
 rY4BAKn6AhEBh605uas3OTVtcwNIAJn1sHTA7HqqWniUe9sP
In-Reply-To: <2f96ca42-4ab2-4e3e-b15f-f1210362db7b@erebion.eu>

--------------ip3QOm4ZfCebhdMFPrNWB5lv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

PiBCdXQgYXMgdGhvc2UgZXJyb3JzIGRvIG5vdCBvY2N1ciB3aXRoIHRoaXMgcGF0Y2ggYXMt
aXMsIEknbSBsZWF2aW5nIHRoZSANCj4gcGF0Y2ggYXMtaXMgZm9yIG5vdyBpbiBteSBuZXh0
IHZlcnNpb24gb2YgdGhlIHBhdGNoIHNlcmllcy4NCj4gDQo+PiBGV0lXIEkgdGhpbmsgdGhp
cyBjbGFpbSBvZiBsb3dlciBwb3dlciBoZXJlIGlzIGp1c3QgcHJldmVudGluZw0KPj4gbGVh
a2FnZSBjdXJyZW50IGZyb20gYSBmbG9hdGluZyBwaW4uLg0KPj4NCj4+IEtvbnJhZA0KPiAN
Cg0KT3IgcGVyaGFwcyB5b3UncmUganVzdCByZWZlcnJpbmcgdG8gdGhlIGZpcnN0IG9uZSwg
JnF1cF91YXJ0MV9jdHM/DQoNClJlbW92aW5nIHRoYXQgZG9lcyBub3Qgc2VlbSB0byBtYWtl
IGEgZGlmZmVyZW5jZSwgc28gSSdsbCByZW1vdmUgdGhhdCANCnBhcnQgYW5kIGhvcGUgdGhh
dCdzIHdoYXQgeW91IHdlcmUgcmVmZXJyaW5nIHRvLg0KDQotLSANCmVyZWJpb24NCg0KWE1Q
UDogZXJlYmlvbkBlcmViaW9uLmV1DQoNCk15IGxhbmd1YWdlczogR2VybWFuLCBFbmdsaXNo
LCBTd2VkaXNoLCBOb3J3ZWdpYW4sIERhbmlzaA0KWWVzLCBJJ20gYSBsYW5ndWFnZSBuZXJk
LiBGZWVsIGZyZWUgdG8gd3JpdGUgdG8gbWUgaW4gYW55IG9mIHRoZSANCmFmb3JlbWVudGlv
bmVkIGxhbmd1YWdlcy4NCg0K

--------------ip3QOm4ZfCebhdMFPrNWB5lv--

--------------FH455MWZb0HIltfTq0GvCRcH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCaufJiQUDAAAAAAAKCRCOr0AybgKufYzv
AP9vxsbcBcYkAnBtfst2hRYkFKLXK5LFeUVl2MfBJw5ZWwEAxYpdTva0nOB8Cc/lRtpWRWCP1zCD
SHM55Cxuh0YDRQU=
=DrMC
-----END PGP SIGNATURE-----

--------------FH455MWZb0HIltfTq0GvCRcH--
