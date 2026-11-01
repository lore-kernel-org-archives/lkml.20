Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793575215;
	b=vsav80OGGNWUBAn3oaghqEyZkiIgC/V8dVWdbTmMfIokP4wQ6+O4AN0tYHQhYum+3SLu
	 J8LBx4DCOQhPaebn5zfejjQ6HJt+RUE13YW3Y02B1RfC6xmjEELp4N8sDjzQ9FolXAHqB
	 FzgxUUSQRVMuD3PLkZRb08QnhITXFTKcqulWAS5Ma9AvZpuiE+Ab7Xzicp34LTwIcXltN
	 SKwtuC6XFOAPIQkTpHQHGt9SlMUolmIUN8JPD+zVOnLHY+SH++Mm3XmBK1pmlCAJlCf1Q
	 rVEZt+rzKTWumyUw9YusrwMu2Ela+ACnU/F9AavgJ+dqekzXudtsYghRrbUQMzEzkxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575215;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type;
	bh=6dm8J8E0M1ZNWs3l5j1o3es8syrK4YCFjARRn59ISEY=;
	b=tJR5Knzklkgkj6J2bo/+7GrnLZGUzvp1lxoF2g6diogFcjzhS6u3OofTBTV7pZr3vJ2+
	 cVhJpdG1RtJ23NNtjkov9+07jT7k0NiZu4Lwkchqld5XDSvXn+W17/Ygx+hgf8CTOoMvp
	 MzwGndqCjWZWPI7nsch1KkYO7/koOqu7DRXeEaFjnf//CC4UV01kN9azfW7NtczYDoxbx
	 kLCWAeTj7unwxfc1X6NUt37JItLkOnLfiBa9+heYR/TozrFgW3wduboZpnZRw8STXXgy2
	 tOsSaAZP1dwWOo+Ym93FIIUAWoFoG4gzKCi08eW1trVMVL6AfXw6o+2x0QkbsT9NjAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b="DfD/WTzN";
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=Le0r227+;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC48606A324;
	Sun,  1 Nov 2026 23:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EC48606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=DfD/WTzN;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=Le0r227+
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Subject:From:Date:Message-ID; t=1793575205; bh=6dm8J8E0M1ZNWs3l5j1o3es
	8syrK4YCFjARRn59ISEY=; b=DfD/WTzN9iChMjght3h2uUM7Xn+ZNCcpbAl4DtvkaqUFQKKULL
	s2eg2US6+yhhqRSOvR7puOJMTUJRlvvIx3CQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Subject:From:Date:Message-ID; t=1793575205; bh=6dm8J8E0M1ZNWs3l5j1o3es
	8syrK4YCFjARRn59ISEY=; b=Le0r227+TFsr16xUNP63aQZ0MUX0uzYbLzyeAi7Qwqi6ZIbe9f
	qwVLzlM+BGpHPgdV7ETxHmNmhyeD7bCDh64jO2IDrZ3CE+WdhwjdPXwskg9CQoIy1fWcC3tCj73
	1bYbMtrPHqXsO++z+LMEJdGIumm/1eLGwhI9E+BqA4kfXFTfbTNgnQ6z5t/g9M/pVNTT7rsCHPQ
	fP6fkR3CCwbKCHewdb8erOZqdpmNcYOvlvMJZNIbxquVlCjmKC01JYIwr2n8tcWqXHe+jbeouIn
	xav7PwVExAWGdNv/2bj8Hm2RORYVI6rGj77LXRcah/pk/W9ESlfjzk8LvpiF0wAIg8A==;
Message-ID: <2f96ca42-4ab2-4e3e-b15f-f1210362db7b@erebion.eu>
Date: Mon, 2 Nov 2026 00:20:04 +0100
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
From: erebion <erebion@erebion.eu>
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: sm6350-lena: Enable Bluetooth
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
Content-Language: en-GB
Autocrypt: addr=erebion@erebion.eu; keydata=
 xjMEY7S2FRYJKwYBBAHaRw8BAQdAUf0YlT6sBQSunZeO44bgAPe+ndqTifGaNjw7vzJ2KPHN
 HGVyZWJpb24gPGVyZWJpb25AZXJlYmlvbi5ldT7CjwQTFggANxYhBJyMprURw7/YpjH7646v
 QDJuAq59BQJpWnovBQkHhhzbAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQjq9AMm4Crn057AEA
 j3didUIhbtAoppk2eNu6CbtMvkDisHWHVLaWF8YC1VsA/1P0ngBoVghELMachirfTinwBplJ
 qP7GGlSGRqSfnlAKzjgEY7S2FRIKKwYBBAGXVQEFAQEHQN6NPWcyqKdecGU1vN8FVXBwYEUd
 OAhF5jpmd7M0Ybx8AwEIB8J+BBgWCAAmFiEEnIymtRHDv9imMfvrjq9AMm4Crn0FAmlaei8F
 CQeGHNsCGwwACgkQjq9AMm4Crn075QEAoDqfm4OeAEQWMgfQ496u2S3rWJw1EMgTOP51FQbX
 rY4BAKn6AhEBh605uas3OTVtcwNIAJn1sHTA7HqqWniUe9sP
In-Reply-To: <ddd2d324-4202-48bf-8984-45edae0c3278@oss.qualcomm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------m0Dl7hDtU9gzfRDxN9YR05gR"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------m0Dl7hDtU9gzfRDxN9YR05gR
Content-Type: multipart/mixed; boundary="------------8MmVZGt7YViH7ZG6jZ7S09Wz";
 protected-headers="v1"; hp="clear"
Message-ID: <2f96ca42-4ab2-4e3e-b15f-f1210362db7b@erebion.eu>
Date: Mon, 2 Nov 2026 00:20:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: erebion <erebion@erebion.eu>
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: sm6350-lena: Enable Bluetooth
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
Content-Language: en-GB
Autocrypt: addr=erebion@erebion.eu; keydata=
 xjMEY7S2FRYJKwYBBAHaRw8BAQdAUf0YlT6sBQSunZeO44bgAPe+ndqTifGaNjw7vzJ2KPHN
 HGVyZWJpb24gPGVyZWJpb25AZXJlYmlvbi5ldT7CjwQTFggANxYhBJyMprURw7/YpjH7646v
 QDJuAq59BQJpWnovBQkHhhzbAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQjq9AMm4Crn057AEA
 j3didUIhbtAoppk2eNu6CbtMvkDisHWHVLaWF8YC1VsA/1P0ngBoVghELMachirfTinwBplJ
 qP7GGlSGRqSfnlAKzjgEY7S2FRIKKwYBBAGXVQEFAQEHQN6NPWcyqKdecGU1vN8FVXBwYEUd
 OAhF5jpmd7M0Ybx8AwEIB8J+BBgWCAAmFiEEnIymtRHDv9imMfvrjq9AMm4Crn0FAmlaei8F
 CQeGHNsCGwwACgkQjq9AMm4Crn075QEAoDqfm4OeAEQWMgfQ496u2S3rWJw1EMgTOP51FQbX
 rY4BAKn6AhEBh605uas3OTVtcwNIAJn1sHTA7HqqWniUe9sP
In-Reply-To: <ddd2d324-4202-48bf-8984-45edae0c3278@oss.qualcomm.com>

--------------8MmVZGt7YViH7ZG6jZ7S09Wz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCk9uIDEwLzE1LzI2IDEzOjA2LCBLb25yYWQgRHliY2lvIHdyb3RlOg0KID4gSSBk
b24ndCBsaWtlIGhvdyB0aGVzZSBjb21tZW50cyBhcmUgc3ByZWFkaW5nIGFjcm9zcyB0aGUg
dHJlZSBhcw0KID4gZXZlcnlvbmUgY29weS1wYXN0ZXMgdGhlbS4NCg0KSXQgc2VlbXMgb3Ro
ZXIgRFRzIGFyZSBqdXN0IHVzZWZ1bCBhcyB3b3JraW5nIGV4YW1wbGVzLiA6RA0KDQo+IE9u
IG5ld2VyIHBsYXRmb3Jtcywgd2Ugc2V0dGxlZCBvbg0KPiBzZXR0aW5nIGJpYXMtZGlzYWJs
ZSBldmVyeXdoZXJlIGFuZCB0aGVyZSBkb24ndCBzZWVtIHRvIGJlIGFueQ0KPiBpc3N1ZXMu
IEFyZSB0aGVzZSBlZGl0cyBiZW5lZmljaWFsIGluIGFueSB3YXk/DQoNCnRoZSBmb2xsb3dp
bmcgZXJyb3JzIGluIHRoZSBsb2cgZGlzYXBwZWFyIHdpdGggaXQgaW5jbHVkZWQ6DQoNCiAg
Qmx1ZXRvb3RoOiBIQ0kgVUFSVCBkcml2ZXIgdmVyIDIuMw0KICBCbHVldG9vdGg6IEhDSSBV
QVJUIHByb3RvY29sIEg0IHJlZ2lzdGVyZWQNCiAgQmx1ZXRvb3RoOiBIQ0kgVUFSVCBwcm90
b2NvbCBRQ0EgcmVnaXN0ZXJlZA0KICBCbHVldG9vdGg6IGhjaTA6IHNldHRpbmcgdXAgd2Nu
Mzk5eA0KLUJsdWV0b290aDogaGNpMDogRnJhbWUgcmVhc3NlbWJseSBmYWlsZWQgKC04NCkN
CiAgQmx1ZXRvb3RoOiBoY2kwOiBRQ0EgUHJvZHVjdCBJRCAgIDoweDAwMDAwMDBhDQogIEJs
dWV0b290aDogaGNpMDogUUNBIFNPQyBWZXJzaW9uICA6MHg0MDAxMDMyMA0KICBCbHVldG9v
dGg6IGhjaTA6IFFDQSBST00gVmVyc2lvbiAgOjB4MDAwMDAzMDINCiAgQmx1ZXRvb3RoOiBo
Y2kwOiBRQ0EgRG93bmxvYWRpbmcgcWNhL2NybnYzMnUuYmluDQogIEJsdWV0b290aDogaGNp
MDogUUNBIHNldHVwIG9uIFVBUlQgaXMgY29tcGxldGVkDQogIEJsdWV0b290aDogTUdNVCB2
ZXIgMS4yMw0KICBCbHVldG9vdGg6IGhjaTA6IHNldHRpbmcgdXAgd2NuMzk5eA0KLUJsdWV0
b290aDogaGNpMDogRnJhbWUgcmVhc3NlbWJseSBmYWlsZWQgKC04NCkNCiAgQmx1ZXRvb3Ro
OiBoY2kwOiBRQ0EgUHJvZHVjdCBJRCAgIDoweDAwMDAwMDBhDQogIEJsdWV0b290aDogaGNp
MDogUUNBIFNPQyBWZXJzaW9uICA6MHg0MDAxMDMyMA0KICBCbHVldG9vdGg6IGhjaTA6IFFD
QSBST00gVmVyc2lvbiAgOjB4MDAwMDAzMDINCiAgQmx1ZXRvb3RoOiBoY2kwOiBRQ0EgUGF0
Y2ggVmVyc2lvbjoweDAwMDAwZGU5DQogIEJsdWV0b290aDogaGNpMDogUUNBIGNvbnRyb2xs
ZXIgdmVyc2lvbiAweDAzMjAwMzAyDQogIEJsdWV0b290aDogaGNpMDogUUNBIERvd25sb2Fk
aW5nIHFjYS9jcmJ0ZnczMi50bHYNCiAgQmx1ZXRvb3RoOiBoY2kwOiBRQ0EgRG93bmxvYWRp
bmcgcWNhL2NybnYzMnUuYmluDQogIEJsdWV0b290aDogaGNpMDogUUNBIHNldHVwIG9uIFVB
UlQgaXMgY29tcGxldGVkDQoNClRob3NlIGFwcGVhciBpZiBJIHJlbW92ZSAmcXVwX3VhcnQx
X2N0cyAvICZxdXBfdWFydDFfcnRzIC8gJnF1cF91YXJ0MV9yeCANCi8gJnF1cF91YXJ0MV90
eCBmcm9tIHRoaXMgcGF0Y2guDQoNCkJ1dCBhcyB0aG9zZSBlcnJvcnMgZG8gbm90IG9jY3Vy
IHdpdGggdGhpcyBwYXRjaCBhcy1pcywgSSdtIGxlYXZpbmcgdGhlIA0KcGF0Y2ggYXMtaXMg
Zm9yIG5vdyBpbiBteSBuZXh0IHZlcnNpb24gb2YgdGhlIHBhdGNoIHNlcmllcy4NCg0KPiBG
V0lXIEkgdGhpbmsgdGhpcyBjbGFpbSBvZiBsb3dlciBwb3dlciBoZXJlIGlzIGp1c3QgcHJl
dmVudGluZw0KPiBsZWFrYWdlIGN1cnJlbnQgZnJvbSBhIGZsb2F0aW5nIHBpbi4uDQo+IA0K
PiBLb25yYWQNCg0KLS0gDQplcmViaW9uDQoNClhNUFA6IGVyZWJpb25AZXJlYmlvbi5ldQ0K
DQpNeSBsYW5ndWFnZXM6IEdlcm1hbiwgRW5nbGlzaCwgU3dlZGlzaCwgTm9yd2VnaWFuLCBE
YW5pc2gNClllcywgSSdtIGEgbGFuZ3VhZ2UgbmVyZC4gRmVlbCBmcmVlIHRvIHdyaXRlIHRv
IG1lIGluIGFueSBvZiB0aGUgDQphZm9yZW1lbnRpb25lZCBsYW5ndWFnZXMuDQoNCg0K

--------------8MmVZGt7YViH7ZG6jZ7S09Wz--

--------------m0Dl7hDtU9gzfRDxN9YR05gR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCaufJJAUDAAAAAAAKCRCOr0AybgKufTfZ
AQCnD0TurP80LdTaqD/H+gj6C7X5ObJGq7r8ttskAQQktwEA9B3Mj1zYeuSP1MDVEsxPddx3xfGV
UTOSbv4posv10QU=
=9fIv
-----END PGP SIGNATURE-----

--------------m0Dl7hDtU9gzfRDxN9YR05gR--
