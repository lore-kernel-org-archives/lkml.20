Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0333A45563F;
	Mon, 31 Aug 2026 16:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193652; cv=none; b=cozTbImQqcbw6k54nPt15CTw+xICfEc52wuGLrxyU3zG28TLTiW7/t3e737y9wGR1aFsD73CirAMGPdTpnv0SxxHeKA4iYQTCeGSTSKmNcWEWJiiObdm2uj2088TG3yAOM/fEhnS21624SLJl1CcVw3KIieRI7CEKqw2xiioMUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193652; c=relaxed/simple;
	bh=zgs+vADzBp4n4pKplNQNM7cYDwuu30CXustwyPU2QZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kIO/dbs77x8sUUxgFJKv0X6eCuKt8J1LBjiN3605mKMuXtv83EU05kgIOSnXOowS4h4PaCkxnrx+wyZY/2bGyrulkKMIM8YT4MajHTUAFwPZg+JN58kQU6Kfc5aYkRt3ACwZPEDYBAzS77HZbVo7Q938our1N/SZIzIhaLEfZh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=WmVGRFYJ; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="WmVGRFYJ"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01A7611B183;
	Mon, 31 Aug 2026 18:27:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788193644;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=fvYNluFuQySNF3hhgPFVZT3o5V52MNrGi+SgvNu4QfQ=;
	b=WmVGRFYJbQrjpBImYLPLZ/OyKJcCq/P3KEBI9wDx5T4krCeTGW86/OM+lcozfPy4qqw8yR
	/bILh2/MlyV8FbLwyWCO40xU2yH1BfRoSqB0I/EAsLZdL7HGM4sHQpzaeP+XhS5KIGHN4a
	vELVLf70M5rjUBcXgE8fg9QbhfqBkYOgUEw7mVONQdHasQCkn0+clmk/6lZOnET/M6EPuF
	J0WBiLIt9jQqoPsiyoZL1808IU1BIvR/QkyWrjVVY1Wnl0BJQPxtP5fx4sS5RPlqZA5eC5
	os8l0T+x9I7+U8zjZnuDJ3epOFvNs9d9N+DQS4+JIDhGXeIs4CoxhOBgC6YULg==
Message-ID: <2b09012a-3cae-4589-b42d-f61d33f2f876@nabladev.com>
Date: Mon, 31 Aug 2026 18:27:21 +0200
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
 <0f959651-34d9-4fb2-9e07-238f731c5342@nabladev.com>
 <20260831-clustered-margarine-80bf19005aad@spud>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260831-clustered-margarine-80bf19005aad@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/31/26 5:05 PM, Conor Dooley wrote:

Hello Conor,

>>> Sashiko comment here I believe is valid, the syntax here only works if
>>> there's only the listed compatible present. It doesn't work with
>>> fallbacks.
>>
>> This syntax is used all over the place ?
>>
>> Documentation/devicetree/bindings/ata/ahci-platform.yaml-allOf:
>> Documentation/devicetree/bindings/ata/ahci-platform.yaml-  - $ref:
>> ahci-common.yaml#
>> Documentation/devicetree/bindings/ata/ahci-platform.yaml-
>> Documentation/devicetree/bindings/ata/ahci-platform.yaml-  - if:
>> Documentation/devicetree/bindings/ata/ahci-platform.yaml-      properties:
>> Documentation/devicetree/bindings/ata/ahci-platform.yaml-        compatible:
>> Documentation/devicetree/bindings/ata/ahci-platform.yaml:          contains:
> 
>                                                                       ^^^^^^^^
> This is the key difference, you need "contains" for partial matches.

Uh ... right ... fixed in V5. Thank you.

>> Documentation/devicetree/bindings/ata/ahci-platform.yaml-            enum:
>> Documentation/devicetree/bindings/ata/ahci-platform.yaml-              -
>> qcom,apq8064-ahci
>> Documentation/devicetree/bindings/ata/ahci-platform.yaml-              -
>> qcom,ipq806x-ahci
>>
>>> pw-bot: changes-requested
>>>
>>>>        then:
>>>>          required:
>>>>            - "#clock-cells"
>>>> +        - "#address-cells"
>>>> +        - "#size-cells"
>>>
>>> else, false? But I'm also not sure what the benefit is of requiring
>>> addr/size cells when the child node is not?
>> The subnodes of this syscfg node have reg property , see [PATCH v4 0/4]
>> arm64: dts: st: Add STM32MP2 USB support .
> 
> Right, but I was questioning why the properties describing the reg
> property in children is required when the children (and thus the reg
> property in them) were not made required.

Do you mean this patternProperties should be made required in here ?

"
+patternProperties:
+  "^phy@[0-9a-f]+$":
"

Could you please give me a hint how to do that ? git grep gives me nothing.
