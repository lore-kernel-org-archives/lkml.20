Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794573820;
	b=q0qgTAb+KnynhcUsaDPQaRXKsJK9s9sC1JfaZHLgn4VUIQa/ZJ907Z1ZJ9vj2gUSN/Gp
	 UAYiS+PTh126ajbju6R0ppqls57fZncvetOyTX3VDmXlrovj3M0+U6FGYu8Oq8BRqvHeU
	 h48j3SLqI6nlZ9/L0vx4saG0gjdAhyF/cB+tT+rjFzYwV+NufEvm4HcoIDcnNCTx40Yj2
	 n0CWb+mhG/SUbJ1r+MNwL/vIj5hestA/JJOoaZB8oxEbSF+0nmUOWBwGqdJ0+1DPR4/l4
	 F4xrdZw/1s89cCzrZvFievODvsGqx4XmeUkX6Rs/CBIRDyAiYCoGib66eaXGMwuHLtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794573820;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=kMKP29RyHKjNRqJmoHbWeAmE+St+tTfGn10VMRCGONI=;
	b=QmES7QBPlWqGOqHHZak6EdpAUUCXC361epz2qtZ1es4TTFQAe2htTlBHhQjoso1Ubii+
	 mta0wv5rUiL2rfAtxlrCpyz9HoFuIOa3ltu/7GUrw5lG8dzoK2856PtTALYqCXBJ6/lW1
	 V+6fT8FQqr8zCwjAELIE85W2gRNSYDYJU+RO/3yveR9Oz0hunkGKmHoQRjVsDX1p3x5ZN
	 CYXjPERREC52+6DPhristAuFWPnRonG+z9+2YkwiFQ/cSorTLkAuoyvpc/ISgLwhct+Db
	 qq884gg9s3tPZrPgAI7f5jI1Sc8ev4Dg6cohkcm346hwylnONYMsNdAmcuiJqYr0x3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SgKG248P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D9D606A330;
	Fri, 13 Nov 2026 12:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SgKG248P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2D91F000C7;
	Fri, 13 Nov 2026 12:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794573820;
	bh=kMKP29RyHKjNRqJmoHbWeAmE+St+tTfGn10VMRCGONI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SgKG248PDgjNTNmb3lcvA9hYPi33ggNOq2ENNk9W2Sqfn9W0ubdy2ydAwgRWPcX1b
	 dJ3RMA90dtXv/MDxYwEjnv/5FL/lBlv4VL8t86Vfe8G6qYhBwS/qYtX9xCvhstdceW
	 V9FiO+aVtXIiOxDxPlwqbFATeYMtPRpaFRvie6sWVwUcLmzDt58KIgEX3adOMjknD/
	 m6UGccBBU/0nNqy8ybTYrE2M3eYldyHK9Ct6NPKaPHnkIo2T7GLEhWPs2yOo7T6rlo
	 gBR1fr0kCzXejNiTc8THXV04lTTj+2OjAvltB3fprRzTzQJCiUp+Qhxu7f7U3jt3Ld
	 heTWCnGsax0bg==
Message-ID: <45881f93-3f30-49e4-98cb-677814b85664@kernel.org>
Date: Fri, 13 Nov 2026 13:43:33 +0100
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
Subject: Re: [PATCH v2 2/3] dt-bindings: trivial-devices: Add National lm77
 temperature sensor
To: =?UTF-8?Q?=C5=81ukasz_Majewski?= <lukma@nabladev.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Daniel Baluta <daniel.baluta@nxp.com>,
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261112163703.3358164-1-lukma@nabladev.com>
 <20261112163703.3358164-2-lukma@nabladev.com>
 <20261113-roaring-relaxed-oryx-5cfa1e@quoll> <20261113120947.6c9fb820@wsk>
 <c6095d41-09a4-4928-a55e-f4af7a5509da@kernel.org>
 <20261113132231.631638ad@wsk>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261113132231.631638ad@wsk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/11/2026 13:22, Łukasz Majewski wrote:
> Hi Krzysztof,
> 
>> On 13/11/2026 12:09, Łukasz Majewski wrote:
>>> Hi Krzysztof,
>>>   
>>>> On Thu, Nov 12, 2026 at 05:37:02PM +0100, Lukasz Majewski wrote:  
>>>>> Add "national,lm77" as compatible for the National (now TI) LM77
>>>>> digital I2C temperature sensor.    
>>>>
>>>> Are you sure this is a trivial device, not like LM75? No
>>>> interrupts, no VS supply? Datasheet disagrees.  
>>>
>>> In my case the T_CRIT_A and INT are not connected on the schematic.
>>> Moreover, the V+ is connected to board's 3V3.  
>>
>> But they are there and binding should be complete.
>> What's more,
>> existing lm75 binding does not require these so there is no issue
>> adding to the existing binding file.
> 
> Please be aware that internal operation of lm77 is a different than
> lm75 and hence it has its own Linux driver.
> 
> It seems like I cannot re-use the lm75.yaml and will need to add new
> national,lm77.yaml as lm77 has two interrupt outputs for hysteresis
> (lm75 has only one interrupt).
Can be a new binding file, "national,lm77.yaml". Indeed it looks like it
has two lines, unlike 75 variant.

Best regards,
Krzysztof
