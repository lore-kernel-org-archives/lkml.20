Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581843;
	b=21hiFzi1w2pj7vsiLjA0aOZ3ptO7bi5Uy/8KsC2nKjZSW97UM8qwRZuOynPlR4hMePDk
	 3A6PtfzeOCQuXl2laTg52UVuRf1tRijT+K2tnuK/XuZGIe/5PG1b2tukjtN1sm4E0ZMJu
	 4g4GS8DFti7eSmn8m5yx5Jn9xyRyUpWjgcU3d8L06Wl4XgrvrwHRjJD9Clq1zoZa4n7s7
	 rOmN2fY2+Kb/j0PL1yBADNilROEAwMcmE88s7tF9t4H4NuYXVqORArmYsj/OMnBG1IwDm
	 HkYKijCPphRDARb1q9etbwQUjeUpNrGBAjqDH2mwRwkCRlAktvmDOted7utV8oXKkjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581843;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Dh0sPs1sXxgYkXVsn06kIIGGOH++u3xH+hz++HRb9QI=;
	b=e+pumySKzGGsMnuNzP5HW9Ja9bx0RYHNdrpTydm1WmEC6o2p2Ri3Esjz1KUg/VgkKV04
	 Ycxky01GZ0sU0BlNYkmqltnd4QR0MEL37EP2L+nwnA378fxVNNVVQT+XfMcbmn0uBlS6a
	 aOY87yxFYqwKB1rF0dIkjODIFn+CcCwfwqk5ol/RzqJnjV3i/LT66QMLMVM56iPOuyzFb
	 5F7bT0tI9vxMbc3yxnjsH3+PUvvHUpSIwHlOUPU2ferUGKU0co8XQRiq7zhyn3kDZZMtZ
	 DzfB8ebqsDh9niZ2WJ+x2uz6xHyGD9ch74pmMVhWWlxRjzjLh2AubvMOVIA04aFTVwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="aIla0wr/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F35606A323;
	Fri, 13 Nov 2026 14:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aIla0wr/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A78D41F000C4;
	Fri, 13 Nov 2026 14:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794581843;
	bh=Dh0sPs1sXxgYkXVsn06kIIGGOH++u3xH+hz++HRb9QI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=aIla0wr/sXCZuqFGrrzCXRh5qvkWM2v9+W1o+f8OJAjQDWMIHX1aSH+cFBh+d3Kv8
	 nGD3yJZ0YdHCCcwtvigWqBuxBGQkL59Z0F2m75J9sUK9/CI5GzhX71V9YsHvRS4UgY
	 FO7/WXGnAZfexI+isO9V1u7h77LSD335xqXbc1TesUzhuf+AG5Eeywa3OTpZ+53NEg
	 AvA5zTlwz+VDcS6vzGIQeHv5zHFt79lU61Bzc4UJHT70mz2zJk/bdNWUWUNV6kENi8
	 F15w1D79R+kbQHqhMEU+DpRM/Cdi4RBrNjxx1xAUfo5zQpgYPUVLzpZ2w7YlNp6Ds1
	 oJkzvV41ZwCTQ==
Message-ID: <b945d65b-60a9-4437-999f-15b5f0307b5e@kernel.org>
Date: Fri, 13 Nov 2026 15:57:17 +0100
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
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM7550
To: Aditya Choudhury <mail@inferno0230.in>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261112-sm7550-soc-id-v1-v1-0-57299906d81a@inferno0230.in>
 <20261112-sm7550-soc-id-v1-v1-1-57299906d81a@inferno0230.in>
 <20261113-ambitious-solemn-narwhal-cbaeec@quoll>
 <avce6OKgtVIi15tR@mediaserver>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <avce6OKgtVIi15tR@mediaserver>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/11/2026 15:30, Aditya Choudhury wrote:
> On Fri, Nov 13, 2026 at 12:17:35PM +0100, Krzysztof Kozlowski wrote:
>> On Thu, Nov 12, 2026 at 10:30:26AM +0000, Aditya Choudhury wrote:
>>> Add the ID for the Qualcomm SM7550 SoC, whose internal codename is crow.
>>
>> >From where did you get internal codename? Downstream does not use the
>> proper codenames.
>>
> crow is the codename used in downstream sources. I assumed it was the
> internal codename since SM7550 is publicly known as Snapdragon 7 Gen 3.
> I was also unsure about this because SM7635 uses milos upstream instead
> of volcano downstream.

As you can easily check, names in downstream are not codenames and have
no meaning. Don't use them.

> 
>>>
>>> Signed-off-by: Aditya Choudhury <mail@inferno0230.in>
>>> ---
>>>  include/dt-bindings/arm/qcom,ids.h | 1 +
>>>  1 file changed, 1 insertion(+)
>>
>> Where is any user of this? Why do we need such SoC patches separate from
>> the actual new SoC?
>>
> I sent these patches first because I expected a possible codename
> change, just like what happened with SM7635. I wanted to settle the name
> before sending the actual SoC support patches, so it wouldn't need to
> be changed everywhere later.

But this does not settle the name! You only sent SoC ID, without the
actual name. Organize your work in proper chunks, not split without
proper reason. This only limits the view and makes review unnecessarily
difficult.

Best regards,
Krzysztof
