Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45342DC789;
	Tue, 29 Sep 2026 08:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790669266; cv=none; b=flnjTZungIEygktpK60kVqa01Eqw1EQVOmeYBlDXPZqdFoxb8Uk6gJ0526lBtRmH9xP7YlsB8VsJMMK7hdTvherTD+LHZ3SamyOrsDnCw+RoyyWxbsMuwEjs37nBbmtD6WSsHSERpHG/m/zTiNyL3c1TAkk5R1YvxH1GPBdY4jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790669266; c=relaxed/simple;
	bh=Xev45c8eXdUX+bfcNbRtTC5Px2ETN91LExi6YfueuZ0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DtgGOJ+LmdSWOPPFy67+yQe35xIgCJK6EOP837upHf9vYSYJfpZB3mkCfu8W+AXPZbCt3Lrcco4nyqS5RnZyYyQIUqqbcMJiWh2Q0df1J2UHHhvEyk8zofhePkrQaXfCYAPQ4Tf/T+TiHCGlchxDpjif8XKF+znxzKL3zjjCTmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=z/lcaKby; arc=none smtp.client-ip=212.227.126.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="z/lcaKby"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1790669257; x=1791274057;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=tVYdvd+sexqfFlzXLVRbiRVh+aGrhtWlsJZmlr0igcU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=z/lcaKbyS/qDBwTqxRPAe4QEuiy/1kqLZkxElzmlljRryOIb1S3YdGaWxf8Ub8jp
	 BA0QEehyrZ6JeGEvKXIrSkDnrDNjt/Nl7qtFPBYGBgaznpius4va7R4DRc/XAqi42
	 1dMmPR2e/45cOsfVeqNNRXLYH6EN4T418E510rs22UygIxfnJ+syZi7z988K434OZ
	 xnnFqB3Dwm77qW9b0pUTLiVXxk7IyaiF1NowIn//P7mExCQE731gxV6ol87urnWhw
	 38R7kUo74SIHvYKKEOSpgAebjAJ4n3PxUpLoxyh3emskYBavwCC6BMq5C4nLZ36em
	 ihF1yRhaJ6lICoj2Gg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MhDN4-1wXSx62KQ6-00npTf; Tue, 29
 Sep 2026 09:54:18 +0200
Message-ID: <9dbbeaa6-2782-4d57-b15a-31f254c586d0@oldschoolsolutions.biz>
Date: Tue, 29 Sep 2026 09:54:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sc8280xp-microsoft-blackrock:
 Replace old sound nodes, enable DisplayPort audio
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260825-blackrock-audio-v2-0-659cc4724d57@oldschoolsolutions.biz>
 <20260825-blackrock-audio-v2-1-659cc4724d57@oldschoolsolutions.biz>
 <arssv5dH5ywjQWUw@zenbook>
Content-Language: en-US
In-Reply-To: <arssv5dH5ywjQWUw@zenbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VKhrjJNPspkyxdEOzYRea/A5s9+8FYl3pPNkI1KKkcQYzG0Kgn9
 yiv0zp3w6wFRBcJFfJpERj8i8ghATFjcQrNya5s5HANpFjOkWxelIRDvhE4sllR5Hu3ob7Y
 +ENJs1Jz7vXXRkDKkvLsDfsdVyvpjhdfQgdYCLm826FTVWUFsUXCCX2I7rHzT/6CmV75/M6
 NzK9OtuBRduBiMdss0kCQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oueTrvcMOr0=;8jgT2Wygsip+7bBlkZnK3PjVFRS
 LSAT48+z0jVNgbHhMF6MIcMVg2q2b0cEdCuD9Ho/zNckbcQPFYjBrQjntY5+qVTFMxuwZEQKk
 uJiABljZCXyY5HgCB9xHk7jqyIgWlJa5ELThKBmWK698XrNWO700mNnLpGzeR+pP1qfyT3y6M
 RlGt+ZUvMtqlCpgr0WhI91XRgLqAphtCf/nwk8Omf0KVZ+IjYGSODzn253aMSZUfCOcSGod5T
 b1irnBz8Lh8vAddH6FKNZ1NMPFZYxWSDnthIbyjbMW9UW4BwuCNQ4BWjec8YVXDAs9hUYtBYh
 E3Scyd1YjdXV67FVTikj58mnHLwfYTs/va0alY89Ir4oAtCxB6U3/qTG54hJzK5+/Xj2qTWev
 d2yZkcf69u2kLOvuMNS0Atj19boLQdj69LbSD40G3pz9LaoqH3afC5mA4fxQheUKdrnxr6G6+
 +wmJ13igAObEQy7dtwqJYbWHjPh+QLQJ3bYRpZqpV3brstaBLgzK6ug4+Rhs6F26bcZNdvsdd
 Nd8YfFflgivIsGYseVk9knNukwOcEJKg3APkXAHy1lWCsIHjf0N/U/2X1ss6zT3ekmUlcGqSo
 BpjhO00h650YTUx+PiZD4kgWS/50O7eTf4Hvkt7g7gEezyQ5/G2SJgykitJSdjaXUptI8NUMZ
 9wXKYChcNVhBBjM15qEGL5sqg1YpJT0GONKP3Uf6cED4/N6TK0FZsZWSYZe3yRz3HzBR+4Lue
 Ok9CHo0OPbxCfndjBaNrjRkPI45pDK3p3n4Pt+XsSd/D94+CDNa6p8WoK2U0svsVrGBvhFdxp
 oYAGADf5iCHlY+dlHkyJ3Nvti9LWFr1jrGU5OSl4nPbq4cJ2N8lhKW+27s14+dm76th+x5r5z
 1FAde2A3UmNphY3OgWW2BaLaCl4zVFpo6pdxDvRcDKIIDuxVfwh1yeYQQnv4moHDjK/CZjRBA
 PKBZ92f2DFntVb5LTGGg39PWsATQPZl/Dp7hbK49uik0cf0BEsJCnqj9cwjIxd6tZHHkKv8Md
 4hBBZU0TnVh8IgVjGT+Umzo0FCgoYw3nj1czenBz88y+HS6JWPs9DFbh2whXLyDVF6GdEEbMI
 FONzPrEYgAM8XP7fPY/21YUrF5jjUjsJEels1AL84oRrcLeoe+LJWSImxec5rqGQCj2dvyCWK
 7tCx23UuD7j1cr+6q9OHKhUAF1gZy7XUSMx9YvGwFZ23caRX+jgxOmALpaEPdC/jcX0ceW6pK
 Drg4Exnq7q4cb0+wXaN3eCJ9Kv8V1cc8wUb17MGyw+xnPpKqAbS0AIRhZX+xBZbk5EHwEWkXR
 VoJkD5ns44p81YEa2k2pixcnOTvPKRBzk7eEORT7Vr1pML+RXefzu078AwgrSJHqsjnrh6Xkp
 rZIefuJTSNXo45OxUqBV0/S7ZA3Ke3Taj5dwihw5g94WLlKeYqC2iVjUgxKclDlthCqJQObgq
 YprT+FWbBg2rkG2t3hHTat2CtL/SRHpxyMSbi03sHLmZKnqWjLDXX+Ug2DPOJ+h2PC7EFKb5L
 9tS3+w85dB1HIrnnqzExTc3xejaa3gp0SHXT6dPtypZ4UAzSgPhhFTKBf9sqKniX6f/hZKM+n
 JoYKJ8ICSdI7kVB900VzyJlTmCoIpsEaW4YlvxYE2kJt12TbeROI2e/tjdPDRwPTJ+FuONYR5
 WpJ76M7fqRUAHfY9qM10sK9fNkH9qY50HsWnvxoo7SrOp6OsLj6jCjyJMZYB5Kf7PVht50Dj7
 dKSQxfJz2NzPdN4aFHY2iw4hIzUlMizdBBtXjN+17aepA4nHzDDO/ebnwz0220UaUfktfs0pS
 3xP0bz+vF+dHkO1/9/FxSjGwsIXBKehm/ZGVd8cdJ1M8ix5cTL6g/OtB/soibFU/ZmWFa5jit
 nwxVP8GcNFfwVGVkxZ53lOJk29LMqGM0kbYv68/69xsydOirPmXT0BJ1iyZ3Vskitc1r3NYqd
 REUwglEzXH5vnLN8Ymrkv/qTtDw2c825KP5qDV38NVoi7nMkuMXLrririzmtLNAilTUJbEaKw
 oGbGDYkSa6oCeUIkMUzSi0v/eNPMlAkEkK9zPyAOUtFpGHQYR/82rYQQuZ33k9sjjyFnJqJA0
 52v7iEA9gtpT9TLL+G40wM/XWjowXY55aHKF6EV0MFgGDmzBam2lTfh5dE8fvquAy+SLyViL2
 llU9S6FW3e4CfIUB07+dFUpzmwgASxsO5VBu2khMAFI6OVN0GxYfCetV0tCsYUAU1r5zbee+w
 L9lIKS36JqfroQOUitb0iMMqBxwc1oig+vRA7eQReAcDzraJebqULh+byWbijKvormYLSYDXc
 ECaKxVlzATnpxrnSb2YbM2x4YYz91piccsIxdM0UlPwngvu27jjQhlZA5r+Azh61ISYb9kZRL
 fffBfJoozodCjCNYwc9ntpIzMkraLD68er8tUAC1M7Y6rL0HhooATgHUJiAHfqyr7tSABJ+Hc
 XLvDAkSkbzKtL+2ybTZ52Cj8DhckRbl01CSM2d2pNs63mrV0Qs3GEGu2tBtMrYR8/nxlvSeCw
 6p6laV18D5e29/CrpfZyI=

Hi Bjorn,

On 9/29/26 05:13, Bjorn Andersson wrote:
> On Tue, Aug 25, 2026 at 04:07:45PM +0200, Jens Glathe via B4 Relay wrote=
:
>> From: Jens Glathe<jens.glathe@oldschoolsolutions.biz>
>>
>> The Windows Dev Kit 2023 has no built-in speakers, microphones or
>> headphone jack. Likewise the device with the same mainboard, Surface
>> Pro 9 5G [1]. The previous WCD938x / WSA / VA sound card definition
>> was therefore non-functional.
>>
>> Replace the unused codec nodes, SoundWire controllers, LPASS macros
>> and related pinctrl with DisplayPort DAI links (DP0/DP1/DP2) so that
>> audio is available over the DP connectors. Add the required
>> sound-name-prefix properties and update the card model name to the
>> conventional SC8280XP-MICROSOFT-BLACKROCK form.
>>
>> [1]:https://support.microsoft.com/en-us/surface/models/surface-pro-9-fe=
atures-and-specs
> Computer says:
>
> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: displayport-controller@ae=
a0000 (qcom,sc8280xp-edp): Unevaluated properties are not allowed ('sound-=
name-prefix' was unexpected)
>      from schema $id:http://devicetree.org/schemas/display/msm/dp-contro=
ller.yaml
> + 5 more times...

Ouch. EDP has no sound node, it explicitly gets deleted. In=20
sc8280xp.dtsi the compatible for mdss0_dp3 is "qcom,sc8280xp-dp",=20
though. Therefore I added the sound-name-prefix there, too. I guess=20
adding the sound-name-prefixes in the .dtsi is only semi-good. So the=20
way forward (without changing all the sc8280xp-based dts files ) would=20
be to keep sound-name-prefix in the dts and live with that? Specifically=
=20
omitting sound-name-prefix in mdss0_dp3 is the worse choice, IMO.

with best regards

Jens


