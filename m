Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C3829E10B;
	Fri, 28 Aug 2026 18:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942860; cv=none; b=mdpq2yhLjnWAARmQAPRUZ12vsVFgF2rmB4UHwuqWqjCcTXnktAPRFo3KwoD3kHjZGgCPM7JYK/UyrRz1CRVjiLNZewnzAPRU7M+mp6XWDYBSEgh1j+eLcLwVmQTJNdH1QVrNBL3XY0ITZrVIQKIacjbJ354s/v2Wa+hXZpQolC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942860; c=relaxed/simple;
	bh=UrmwIWsCutQvfAXfJCfN9CHSP5jQzO9Lh0LAK6E1+go=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ufMAJh6g4sQ2JCvrP9eQ+lYLRgcFi+Xz7SwviwCuUUXrf8rJLtmE7oYgLYYTlVSkEN/4Lj6uR7SybW4delvJQXBZDE7SmuchKGXPL4nCjXzanGo9yeaupKDLWAqM3TBdMbcJpJz90tCPmDnVw7jZQ1rf0riXM+LHwbpic+tauw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=awRpxIHZ; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="awRpxIHZ"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59E4511CF0B;
	Fri, 28 Aug 2026 20:47:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787942846;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=m73Q82dkpKlkQ9sqZr4r1cIELFDi6oJxX/fWL+FJurA=;
	b=awRpxIHZQF0n2uHyM73nRpsvtijyMVdHPtYji2+JnPl3Op2nkT+hr8d/V1B/VmizxXUU4T
	gurGZhoWLkHXyQUP90Fn4UnU7fb7rWNEQ8yVe2PCUkVHZoJ8MGGQDUBNpC6UiQbFUB7feK
	VTHa6lziIUjuwgr04kHc3guuYxIS2YCwx9Wli+xhiWTCXH6grxOnijfKoXODBsgflV3Ujb
	xwsi/MMK71NplsinSlNxkh6ExCsV/cqyAFnbKTo8T32HBvJrmuFOUKugUhmDu6INL8F2gb
	OA4PUJmon5AgkNi8c1Y2SqwWxM1Hb2CPnCW2ijN9R7DBynRrV8ly470OFyU+IA==
Message-ID: <0f959651-34d9-4fb2-9e07-238f731c5342@nabladev.com>
Date: Fri, 28 Aug 2026 18:05:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: stm32: Document
 st,stm32mp23/25-syscfg subnodes and cells
To: Conor Dooley <conor@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Rob Herring <robh@kernel.org>, Yannick Fertre <yannick.fertre@foss.st.com>,
 devicetree@vger.kernel.org, kernel@dh-electronics.com,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260828151216.175020-1-marex@nabladev.com>
 <20260828-target-operable-ebc87e0bf30a@spud>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260828-target-operable-ebc87e0bf30a@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/28/26 5:57 PM, Conor Dooley wrote:

[...]

>> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> @@ -39,6 +39,17 @@ properties:
>>     "#clock-cells":
>>       const: 0
>>   
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 1
>> +
>> +patternProperties:
>> +  "^phy@[0-9a-f]+$":
>> +    type: object
>> +    $ref: /schemas/phy/st,stm32-usb2phy.yaml
>> +
>>   required:
>>     - compatible
>>     - reg
>> @@ -57,10 +68,14 @@ allOf:
>>     - if:
>>         properties:
>>           compatible:
>> -          const: st,stm32mp25-syscfg
>> +          enum:
>> +            - st,stm32mp23-syscfg
>> +            - st,stm32mp25-syscfg
> 
> Sashiko comment here I believe is valid, the syntax here only works if
> there's only the listed compatible present. It doesn't work with
> fallbacks.

This syntax is used all over the place ?

Documentation/devicetree/bindings/ata/ahci-platform.yaml-allOf:
Documentation/devicetree/bindings/ata/ahci-platform.yaml-  - $ref: 
ahci-common.yaml#
Documentation/devicetree/bindings/ata/ahci-platform.yaml-
Documentation/devicetree/bindings/ata/ahci-platform.yaml-  - if:
Documentation/devicetree/bindings/ata/ahci-platform.yaml-      properties:
Documentation/devicetree/bindings/ata/ahci-platform.yaml-        compatible:
Documentation/devicetree/bindings/ata/ahci-platform.yaml:          contains:
Documentation/devicetree/bindings/ata/ahci-platform.yaml-            enum:
Documentation/devicetree/bindings/ata/ahci-platform.yaml-              - 
qcom,apq8064-ahci
Documentation/devicetree/bindings/ata/ahci-platform.yaml-              - 
qcom,ipq806x-ahci

> pw-bot: changes-requested
> 
>>       then:
>>         required:
>>           - "#clock-cells"
>> +        - "#address-cells"
>> +        - "#size-cells"
> 
> else, false? But I'm also not sure what the benefit is of requiring
> addr/size cells when the child node is not?
The subnodes of this syscfg node have reg property , see [PATCH v4 0/4] 
arm64: dts: st: Add STM32MP2 USB support .
