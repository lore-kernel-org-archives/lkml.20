Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840632;
	b=m4Y0uxe/rfuio6gaxMOjwzQxskMzwbmSkdoicsIbVIDN57n/2IkQlGD/q4to3GsEWgyZ
	 EYAR7hGzmmyEuwUXNssiEbI0ybc5OX4noFvRyLwmjHBnlYskDpas9+GsBL/iVe0b9Iysa
	 2IKrnlDYj4IZHnRu3HNNHfQrW/f/h9KjwVXSfaWpsUYaRlUd/UYKtOEI8Nqw9Q80SUbgL
	 q/Th+affDnNamlKbsvXaIw0dl5ASUfHnxv3w6HBZ5uROKaa7qQZzC7QG7vZUvrfeP58jw
	 JDH88Fk74bXsR1kol4oCOOPgEzTpUuXAoP0HJhCJsjp6M3B6kgwrwATdQsjVAEdYusA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840632;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Bq/YtpFjVFkTF8n5TJtylBl6Njspe2V/Cw+DhcKZ0i4=;
	b=cg021HjGF7DM9lhh7lxHWQKa8hBb2nXNF3w+Ow7Q3zTRdgMsg71pSTqnjKCNtzMiNFAz
	 FZa3DrncdUeIPgU+oO7QMtK29dH7zWvkRGcPVXR8Lq2o1CtxUWVDwDP9vBT5uBPfOvOvB
	 8v9mTMhYeDuANavtESkHlS1eDowPoLXQAIKcbaziGD9Z4rgmWYUEezM5Qwhk8o9yvCvpY
	 IZXhP/i/nC3a8nXNb/xSyTL3DLoSKNELmghVeRQD6U8eZumcReB5wWT3qUh0P9tg8b4N5
	 Zg6LJDlDwTeK3d67cY9Se6lY6GYxa6ASs0po5dZYkD9RCWnMuDtF2QuYe5APgowh/uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VpaKqzyt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44067606A32A;
	Mon, 16 Nov 2026 14:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VpaKqzyt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECAD91F000C5;
	Mon, 16 Nov 2026 14:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794840631;
	bh=Bq/YtpFjVFkTF8n5TJtylBl6Njspe2V/Cw+DhcKZ0i4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VpaKqzytU996iLiZInHWf7YPoDvi4rBLCIEGIR6yeSXUJjOD/sX5OgKX6wfVlTOC5
	 9/9BjV42ZlstAmLK7j1/+2FDf3ERBb7+F/XhJJ0Kt5NXHkrVoHl11H13trteFXd+re
	 km4eBthkqdCAfut7uuDTMQEejwl9S3pWtqG7fmcKakbocM26KS7WaOWMS4NBbO0BXZ
	 u1ONGbIX50LjEC+1zJWD+3X1k+s8XyPNKRiwvyO1TlsLKx8b2cSDHZONRx9NfN+n3B
	 AdH78L2JhVETb3cFy9J9HlcScIfW9c4S4ELx5NvQ4uGzUvho3W/LYcFO8gfT5rP1GR
	 wH+Qr9vW0bPRw==
Message-ID: <7af64754-c1c0-4a5d-abb6-155013514bcc@kernel.org>
Date: Mon, 16 Nov 2026 08:50:29 -0600
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
Subject: Re: [PATCHv3 2/4] dt-bindings: edac: altera: agilex5: document new
 edac support
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bp@alien8.de, tony.luck@intel.com, rounakdas2025@gmail.com,
 niravkumar.l.rabara@altera.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261112215342.2476801-1-dinguyen@kernel.org>
 <20261112215342.2476801-2-dinguyen@kernel.org>
 <20261113-laughing-crouching-hawk-5bccca@quoll>
 <2440a2e6-5d06-4642-b722-ac3baf5b8097@kernel.org>
 <cdde4ee5-930c-4982-ac79-ac52570c37e9@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <cdde4ee5-930c-4982-ac79-ac52570c37e9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/13/26 08:57, Krzysztof Kozlowski wrote:
> On 13/11/2026 14:29, Dinh Nguyen wrote:
>> Hi Krzysztof,
>>
>> On 11/13/26 02:18, Krzysztof Kozlowski wrote:
>>> On Thu, Nov 12, 2026 at 03:53:40PM -0600, Dinh Nguyen wrote:
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: altr,socfpga-agilex5-ecc-manager
>>>> +    then:
>>>> +      properties:
>>>> +        interrupts:
>>>> +          minItems: 1
>>>> +          maxItems: 7
>>>
>>> Why is this flexible? Wasn't before and changelog explains nothing.
>>>
>> Sorry, but I'm having difficulty understanding your comment here.
>> Doesn't the minItems as 1 specify that the
>> "altr,socfpga-agilex5-ecc-manager" must have at least 1 interrupts
>> specified, and up to 7?
>>
>> My changelog also specifies "up to 7 named interrupts".
> 
> So is my question: why is this number flexible?
> 

The driver was treating the 6 other interrupts as optional, but thanks 
to your question, I went back and looked at the documentation. I am now 
sure that these 7 interrupts are not optional and are required.

Appropriate changes will be made in v4.

Dinh



