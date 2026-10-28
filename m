Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189555;
	b=bg0LjtDf87/xNBVmPWYC7lqcQuLbn/sIRgE+ckE/1hHcNTvkNWKhkRz+IPdGn+bmod/X
	 Mq+IW0Y4p6n402UT2i8LNT6b0DgNcAYQIb7MiJ9yfsTULnja9+QNwIASucxeTGFlNg78t
	 ZDOSCbdoZqeloE2Y6URqBjfCfB2211pCaL1SCbhd3a5By65XBOSsPzCvKm/Gv0G1a+fjK
	 es8cf8Un1CexhlAe2CxuPNs1tdlwfSeA6k00GEErfD5lk91/3D5bOyAX9UDdLvqntTZTz
	 Z2IUlAOet821tvbR2sP+4AnxWlfMXjRiFv5BzsryZHHRhbTjn4uMAHaF9NK6K46jwkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189555;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=hN4HbOsDQHi/NU8yy1iBJn/aHgqs4Mr+FW66cmSUjoY=;
	b=BjcLKOKV/1TkcCQTUYtuUu+Q+J47Kkmrv1NWms3bMdnnXQkfjLRo7zuGafEnbD78MHWi
	 RsdS9Ih636HdHZflQ+Pp5IOYOZwTTXa5+iIbVT8iTQJTREzoKdWepQKuSn5wmA2l8oln6
	 JXAeJlk++1q3dxCYE8nAGgoaH5TkY+jD+7r2oR0pGNqzRiHoMf8PGhZQPwQv3urELcsUP
	 i3Ocdh5Wz7b1J1ILpeLUYSTTB18sL2GUqDHPtOAQCqJWo1hKYm4NsIepbwRni63zy0bQL
	 hBaKnU1LBBMaRDsxzfpm72T404VxeMcp5lCFoZAH8v1zB/UneqdBX1QYf8WrHhdO2Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gnAr5C4v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B04A606A31A;
	Wed, 28 Oct 2026 12:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gnAr5C4v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076051F01825;
	Wed, 28 Oct 2026 12:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793189554;
	bh=hN4HbOsDQHi/NU8yy1iBJn/aHgqs4Mr+FW66cmSUjoY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gnAr5C4vUH8ajNAKoxqpSc8cDOibncHA3oc8uOBk/V5pflU14wbxqCanvd/iGg7v5
	 9xTEoTSqWb4/q4k7W1E76VkWrDNt7GIAaBMLd7ZJPTPbXGFo91zk+pXtGvkMKqt197
	 fQ31TpNhl7Jq7mxH97HT9d9V0iDjjm7CZ4DzWtbxZz7sreG/GUcAmnu2XFGq1g7Yjr
	 zopiVv2xf9RkMGRqKqDHe6Bh69r9PpppsdbGzTrdMX5QAfJCV0xRvnLGbcXIcNuPTm
	 SaN9duJIsHh1216g0ETh8wXfFTkbz9ZIYtVztfYN7mUpUzVhCl+swCLl7TXYVAYpBW
	 5JSrrVYZRkyEQ==
Message-ID: <0f60fcba-8f31-4b3d-a7d8-8dee548e0b41@kernel.org>
Date: Wed, 28 Oct 2026 13:12:29 +0100
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
Subject: Re: [PATCH] dt-bindings: regulator: add Will Semiconductor WL2868C
 PMIC
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261027051055.213301-1-xiaqinghuan@mail.ustc.edu.cn>
 <179312390429.199157.12016700546762955000.b4-review@b4>
 <20261028120432.99230-1-xiaqinghuan@mail.ustc.edu.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261028120432.99230-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/10/2026 13:04, Qianhui Xu wrote:
> On Tue, Oct 27, 2026 at 05:58:24PM +0000, Mark Brown wrote:
>> Please submit patches using subject lines reflecting the style for the
>> subsystem, this makes it easier for people to identify relevant patches.
> 
> Changed in v2 to:
> 
>   regulator: dt-bindings: willsemi,wl2868c: add the WL2868C camera PMIC
> 
> which is the shape the regulator tree is using (e.g. "regulator:
> dt-bindings: ti,lp872x: Document input supplies", "regulator:
> dt-bindings: sy8827n: support standard properties").  The v1 prefix was
> copied from the media-side bindings I was preparing in the same batch,
> which was my mistake.
> 
>>> +WILLSEMI WL2868C CAMERA PMIC DRIVER
>>
>> Please keep the file sorted.
> 
> Moved.  It was sitting after "VOLTAGE AND CURRENT REGULATOR FRAMEWORK",
> which is the V section, while the entry name starts with W.  It is now
> between "WIIMOTE HID DRIVER" and "WILOCITY WIL6210 WIRELESS DRIVER".
> 

That's LLM output. Why do you paste it?

Best regards,
Krzysztof
