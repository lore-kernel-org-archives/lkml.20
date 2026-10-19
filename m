Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792435641;
	b=YqhoK5i+4sIgIuoOoCKKT2Dk7fDQDQA+cWCRki5Z1rdYAjJv2Ak6ktcUbLHjiahcaGVP
	 RjfsFbboxinMpeXsYpqFMbHrsTFn0ttYYqVBE37JtDflnpv1FzhiNLIylcm0dXKLpFEUd
	 8+ntisomHQF9buFwS4q+KB5xCRnAO5/N4t4Os9DlY5QjhZMOQr64NQMYI5h+ZCNA54YvD
	 tMKxidjbTPgtZAtzjMCXXffVmHOtf5Txj7zQ0lkNw4YVa5+96uNF9O9Wqlrcmwg8hkQwv
	 v51gy8pkPzRclqL7h/iInl/XkOPNBBYirt2Bdt+cy9VGjTf9DExnSqJI85d/Cyarh/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435641;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=8lRJe6qcL32g26xvlmRfstXqu2NrULSP/zOENc5q8uM=;
	b=gM6QbpTwg+Hwigie/C1VLbIG69Pt4AwittI6J2hZk9CO+VdsdTA1FQDvGH1P2dKwSgEy
	 iWhMpuc6YsLyCT5XVwfA4Fid3MspP1FZ/vVKIMkW6NBqXyuKnmg86WyWk3DXOeapTHB5q
	 OLuw0yrBZzF8cHSgqfZLA2GhERgvg9M0dPxjak/CahzMZHJgvUgjbI9ragBRbKRO3VIsT
	 gOxs04tKBksGrNcosPl+goUzUl2xjTXD2ud9Qe1AbXeMk+e2N8thHQLZd3++vZg5lkk7O
	 HfzQxaCcVH2mOE3bVsd2+KxIOAN7V8kbdurKoCNMcRLO4JSOwCZOUy5hx4tYgncmU2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=XSgqmx6G;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=JV+d0HXt;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10BC606A32A;
	Mon, 19 Oct 2026 18:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A10BC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=XSgqmx6G;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=JV+d0HXt
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1792435619; bh=8lRJe6qcL32g26xvlmRfstX
	qu2NrULSP/zOENc5q8uM=; b=XSgqmx6GJFEc55A58Z69kzM+ZxM+9OMpCkmlyMX8PMhn0Trq5Y
	o8SKSZQ44tSyEo/EJu0Aes9S9Rp9xU1d9zDg==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1792435619; bh=8lRJe6qcL32g26xvlmRfstX
	qu2NrULSP/zOENc5q8uM=; b=JV+d0HXtsgjVFmk7ygN7jYk+YTiX17byMVPzU1/L1+GnxvHSMT
	Ua6wxvFAg1d+xBFx2TcaxeX932UyYGPXM05oUpdgSKJM6Y6X5ZRqH1/aUhhT7Ls0h1A2fBqllL9
	sLOw91ZnZ1w60mjxk7NEYaL2V2ryqQTxe4H/5Pef+BdCExdP3jtBddJ3cpL/khngdkkQk8oH9Wo
	5qY4eOizsTHQZ00YsesGn6r1naQAyuAbv3OsSJ14r6/4JHlCRo0Ihg/1BLMPrjE+IRS4ezfwaS0
	ZtqZjKciYakJgIbmswyAf08FIwpFvzIusV3Iw32a7iihCr6u4Aq6nc0x+zW6DxXTiXw==;
Message-ID: <4fda6ac5-b6e9-4c95-a671-5a9aa86a4c38@erebion.eu>
Date: Mon, 19 Oct 2026 20:46:58 +0200
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
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: sm6350-lena: Enable PM7250B
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
 <20260926-pdx213-upstream-3-v2-7-b4612e3eb536@erebion.eu>
 <90d33b88-d171-4aef-8046-332a518dafca@oss.qualcomm.com>
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
In-Reply-To: <90d33b88-d171-4aef-8046-332a518dafca@oss.qualcomm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------H90K3fw2jYTnIrWn1g01WfTJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------H90K3fw2jYTnIrWn1g01WfTJ
Content-Type: multipart/mixed; boundary="------------FDJmtutktn8xqKdrIpzVE0Qk";
 protected-headers="v1"; hp="clear"
Message-ID: <4fda6ac5-b6e9-4c95-a671-5a9aa86a4c38@erebion.eu>
Date: Mon, 19 Oct 2026 20:46:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: sm6350-lena: Enable PM7250B
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
 <20260926-pdx213-upstream-3-v2-7-b4612e3eb536@erebion.eu>
 <90d33b88-d171-4aef-8046-332a518dafca@oss.qualcomm.com>
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
In-Reply-To: <90d33b88-d171-4aef-8046-332a518dafca@oss.qualcomm.com>

--------------FDJmtutktn8xqKdrIpzVE0Qk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvMTUvMjYgMTI6NTUsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQoNCj4gYXJjaC9hcm02
NC9ib290L2R0cy9zb21jL2NoYXJnZXItbGVuYS1jb21tb24uZHRzaQ0KPiAxODogICAgIHFj
b20sb3RnLWNsLXVhID0gPDEwMDAwMDA+Ow0KPiANCj4gc2hvdWxkIHRyYW5zbGF0ZSBpbnRv
IHRoZSBtYXggYmVpbmcgMSBBIGhlcmUNCj4gDQo+IEtvbnJhZA0KDQpDaGVja2VkIHRoYXQg
YWdhaW4gYW5kIHlvdSdyZSByaWdodCwgd2lsbCBmaXggdGhhdC4gVGhhbmsgeW91Lg0KDQot
LSANCmVyZWJpb24NCg0KWE1QUDogZXJlYmlvbkBlcmViaW9uLmV1DQoNCk15IGxhbmd1YWdl
czogR2VybWFuLCBFbmdsaXNoLCBTd2VkaXNoLCBOb3J3ZWdpYW4sIERhbmlzaA0KWWVzLCBJ
J20gYSBsYW5ndWFnZSBuZXJkLiBGZWVsIGZyZWUgdG8gd3JpdGUgdG8gbWUgaW4gYW55IG9m
IHRoZSANCmFmb3JlbWVudGlvbmVkIGxhbmd1YWdlcy4NCg0K

--------------FDJmtutktn8xqKdrIpzVE0Qk--

--------------H90K3fw2jYTnIrWn1g01WfTJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCatZlogUDAAAAAAAKCRCOr0AybgKufcOQ
AP9yABAksAOzQkkp/37NV1Jto2w2xrpXku2ghU37JtTZ1QEA2VVc1EF7TAvaTPnMs/SO5CmQB9+b
XiqaUT9UBcAI2Ag=
=M7OE
-----END PGP SIGNATURE-----

--------------H90K3fw2jYTnIrWn1g01WfTJ--
