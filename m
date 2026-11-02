Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793603083;
	b=0SOBLpfRfIe9528OhSIfKMQrTAeg6AfLV+6aT7ZreLVpJ5lBsatYN6XjaCu8412k22il
	 r9JNDEMksZwHskCNhPyF7aCTSKJ+VjXNcDZtih2lh/7r2w0gAND6GlQUd/d4ibvrCiWQV
	 WUj/fjRSseoCnKGO6BxEcTbdYR7YW51XhljO8lqZ2poQJ/CoSi8/j9ViFYonO5b2PXYmO
	 M4VQIlJWy89QBUDGyzaD3o7JPHyRENcrz/P77M5qWqTjep+Y4QJlIjzaV9Dawe1F+77Ur
	 OiiV/onCQz4AGV3cmGG0+ZiXhtQ6GTz70QiPHDC5M64Y20tUAG3++i3LtUNWKpW4xiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793603083;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=VU9BXhR7VAByKc6pd+oKrjGan0whFepMAX42Ew0W3wU=;
	b=qLCpKRAFtGBXsVYOQpUR4/WDtze1wb3DvFgoLW8/uAZEKV8ZXhlDTMPE9b/mB1yIdO7+
	 Wq60zt11n/CTzSNGj1TXRWS+HgslZQdCtvhPN9dKgUiPN5ZaXWk3EjzvdfaLzDSdp7g0J
	 XWSL8Zy9JMoudLLd0vitp1Tgi+jMOb7hfE2YOzFQMJ0nHlQ2W9vZBS9Y2Sdt7eG0bbVd1
	 Fpa4npKZoAXkx9vfTn3jTGXQC047XeOCuoF0w5hhVsc3vS22Ff1TsFDyL6HFcjDSrbwxW
	 FOyu83SvuuI7tLTCM789GhGkebAEGmn5zcWJPem1B5bxEA4ui/9RrtVzfa975RvhIvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hq+Nu9RU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0442D606A331;
	Mon,  2 Nov 2026 07:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hq+Nu9RU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 600A11F00A20;
	Mon,  2 Nov 2026 07:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793603082;
	bh=VU9BXhR7VAByKc6pd+oKrjGan0whFepMAX42Ew0W3wU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hq+Nu9RUys5ne52FWmDVRuqBrbLemnEHMqRBuGLtmLxD4mjV+TgEY1+gNI4Vyepv9
	 O6G1NneFk5+encnKy9qGMapN345cgeNzibUy8oUTOi+oiGxtg9+XNB7iu/iW5tfjPb
	 5I95wxCutFZlVJad0ewMWPuepXA24KPTmMXVmP2NVq0M1AuBfp9IJrqFjMT2MiiYcl
	 XTb2FHwBN2rZduICmsSpNUUQCiMqfwqEJgChtEmzfmmYG7v6ZR80HQ8bWARVnxVK6B
	 xWjSNwHIW0CMYaU9Jq/l1rfbz2VaQaa18K7uDKhZffklg1haAJEFnDhINk7wudOSXa
	 0Ps8dnYfqnPoQ==
Message-ID: <6cecea78-658a-4278-b5c9-228a827583e0@kernel.org>
Date: Mon, 2 Nov 2026 08:04:35 +0100
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
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: ti: Document the
 ti,tda54-mcu-scm-conf binding
To: Moteen Shah <m-shah@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, nm@ti.com,
 ssantosh@kernel.org, u-kumar1@ti.com, gehariprasath@ti.com, vigneshr@ti.com,
 afd@ti.com, a-limaye@ti.com, y-abhilashchandra@ti.com, johan@kernel.org,
 kees@kernel.org, jm@ti.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261027083700.1964371-1-m-shah@ti.com>
 <20261027083700.1964371-2-m-shah@ti.com>
 <20261028-inventive-screeching-bettong-9f4240@quoll>
 <b53d0986-33fd-43d3-a03f-2bbb39dda42a@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <b53d0986-33fd-43d3-a03f-2bbb39dda42a@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/11/2026 06:20, Moteen Shah wrote:
>>> +  ti,proxy-id:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    minimum: 0
>>> +    maximum: 7
>>> +    description:
>>> +      Proxy region (0-7) through which this node's clients access
>>> +      claimable registers and their fault status registers.
>> I don't get the need of this property. You have a one, specific device, so
>> why the proxy id would vary per board?
>>
>> It also looks like re-implementing access controllers.
>>
>> Best regards,
>> Krzysztof
> 
> 
> Thanks for the review, Krzysztof. I’ll drop the redundant “binding” from 
> the subject.
> 
> ti,proxy-id is not intended to vary by board. It selects the proxy 

Then it is implied by compatible, no?

> window used by this Linux instance. One use case we need to support is 
> running two VMs with different proxy IDs, with each VM’s DT describing 
> the proxy it uses.
> The driver reads the ID from DT and performs register accesses through 
> that proxy; it does not allocate proxy IDs or decide which VM uses which 
> one.
And if not, my statement still feels applicable.

Best regards,
Krzysztof
