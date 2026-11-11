Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398663;
	b=CupzKstwR+GvJYmjsLyjy7szdLj6RFdq58ngcujWMqxOliGuy0cVUl3Y8RTcMSDMfx+7
	 sjUVtQCQO/2hbLtgRPnR03SrBSQ94uFHYs54sLkml4LTlkz+dD6VE+uGoNLeSgvP0Q6Q7
	 yhdhNRop8i3LOvuxD++j1jMaLC1mQAhbftQKVtJzP9PFUgYgCgfYSpXQSozKfjbNEoVuS
	 Y7Ik06zNzPEZxeFhhsvZQ3Yq2KnDBLQt3ROeChEkR30wq01c7SYCMsjyAVKWIZ9fRGJS5
	 UQxQymTT7RF86mbeEeuJxOWDMp3L3n6g8cSb8sZL/xokiHoKMe4MK0Noy4aEsVnuYGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398663;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=vd8+/SDmJqgF26dHFr8sYaGJzzw+MQivmftWCV/6xEg=;
	b=bXIk+xK1dS4Frt7jkPOIBefuTd7udmEyLztLAUhCnNlfZ30J++6/huF62XoDTOtaItEo
	 5sfR5MYfBd8P+/aRUyoCQXxZcKHDw5f4nxqGBNjRHBjBJGPXPd2x+pdmMKouIdHDhDfqf
	 WChWNtc6ry80AiFhnJxPrMx2SkfD0NoC/aRxzLPTOs4GhMduARobaMFOOEnpIgngoE5Vs
	 36rc+x7G5uW2b3vA70xujjXef9XQKNUj41hNjsnWhbHzzL8XLpRJ/TEDie8B28CDHGj/h
	 4oQleRlsiYi/y9akGn1a283iX2rardVFr6LBTxVa+WNnenz5ZlJ6+BEC5DYxjvov0sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CxLFE6GP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB967606A33C;
	Wed, 11 Nov 2026 12:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CxLFE6GP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C171F00A05;
	Wed, 11 Nov 2026 12:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794398663;
	bh=vd8+/SDmJqgF26dHFr8sYaGJzzw+MQivmftWCV/6xEg=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=CxLFE6GPf0YC4outdx6ZaI4RB46glH1AbpSOAFFZQEst2S4HQtxGOwQqzbQKKtsRD
	 PG//b3sxSFe1DKysb3HsDEaxC84xKNKwR86gpqC/auSM8hcSUziWu8qvCRM94I6zeH
	 HGQxJr6VA4FeIwmikMUrPhSb1lnNHXLmxkX/wHqrzfLBVDz38VUBoRA9ljBaVW+b2M
	 nTCszJ8S+nfzkewdjwOGURSmi561EXUkYrisYZInf1UPzJGiqWionVWGUgbNpPgvUW
	 JWBTx2lPo8AbMlcjSQ+j4FRYCTelPM+z7cBLN6l8H1u/NLE+tokFyFF+EuX90QfU+T
	 HyN9yJBe1BaKQ==
Message-ID: <9d87c457-d692-4c55-835b-796029a5e54b@kernel.org>
Date: Wed, 11 Nov 2026 13:04:16 +0100
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
Subject: Re: [PATCHv2 2/4] dt-bindings: edac: altera: agilex5: document new
 edac support
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: bp@alien8.de, tony.luck@intel.com, rounakdas2025@gmail.com,
 niravkumar.l.rabara@altera.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261109162523.1698129-1-dinguyen@kernel.org>
 <20261109162523.1698129-2-dinguyen@kernel.org>
 <20261111-tunneling-elated-grouse-1f8bf7@quoll>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261111-tunneling-elated-grouse-1f8bf7@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/2026 13:02, Krzysztof Kozlowski wrote:
> On Mon, Nov 09, 2026 at 10:25:21AM -0600, Dinh Nguyen wrote:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: altr,socfpga-agilex5-ecc-manager
>> +    then:
>> +      properties:
>> +        interrupts:
>> +          maxItems: 7
> 
> minItems
> 
> Also, missing constraint for interrupt-names.
> 
>> +      required:
>> +        - interrupt-names
>> +    else:
>> +      properties:
>> +        interrupts:
>> +          maxItems: 2
> 
> interrupt-names: false
> 

And I already asked for this which you did not respond to.

Best regards,
Krzysztof
