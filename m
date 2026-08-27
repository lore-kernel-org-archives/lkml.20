Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDBB32BF4B;
	Thu, 27 Aug 2026 23:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872468; cv=none; b=GC/VXffzmIrqayLJatL4y5YPJkBNvAxWivQ4x7Wjp30FjVzBu1ypKVvvHWVAijwyv0Gwz86M5zM0PGxacF/tKeNIuxcvtpsB7IEcX/n4ZyPkama/QWeH0wuP4z+9hJY6R9ooiSWIUpWgD8a85ak9xAf8uSW+BAHwnsFvUfAg4D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872468; c=relaxed/simple;
	bh=U04iR+qtdCoxG9gK1Z5LrwRMGX8xdLDMkZOI3f7jHsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NTPNa4IDUNj3OLz2pvRB/etnOR9+xZPM+pFm++54ADpIqXnWTqZfq6LYaqi8rIJ23rGBD5bjpbI9n5A0CY08Pa2v0RV3UiCLY07pFAvozR/NcNl/8YLcuqOF8MKXRHqP5Qu+UIWmGrPBw3Khd/N+aEvBw5WCIwFPUPkcpwJT0p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=i7CL2o6S; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="i7CL2o6S"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C1AA711C5D3;
	Fri, 28 Aug 2026 01:14:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787872460;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=gjJ6weS85s22FsCPd+HQktbWCP2SfOGkFBLAdeRpKpo=;
	b=i7CL2o6SLSrZdwX0d5+AsU2vabHXYQ1NNmnV/xx2ISa23sMUmdIGRb53cNIhJNGVbZsTdx
	WAdF9ERf6Uf1CaoM097RPCbumDaf+d475mXRefKf7E7+X43sCbomSMuwll7k0fkXQffzdB
	SBs+jMee+mA+bafgxAFrGyRltI7WCGMsa1gPCTxJpGarj6jWNq8H4dKdfA97nEK9HNF9m6
	+eoWKLE7AVgdSFiIdQW8feBK8viOr+0M1k4N8Bivc0VUQEMLpewdXAcly+bg2aBeCZgbl9
	h8RkaXiO6LcP9y7SaIxMYoqAi+28TMwMG5q2J5j9uzvv/EIWpD+n0M2ipwuSbA==
Message-ID: <84bd4b0b-69c3-451e-9e0b-690191f52537@nabladev.com>
Date: Fri, 28 Aug 2026 01:14:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO
 PHY
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org
Cc: fabrice.gasnier@foss.st.com, Pankaj Dev <pankaj.dev@st.com>,
 Rahul Kumar <rahul.kumar05@st.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-2-marex@nabladev.com>
 <7a16614a-bd1b-462a-be13-4a9c22aa588e@kernel.org>
 <34c48ff1-524f-4d24-b53f-99e7171d08db@nabladev.com>
 <25e10cfe-40dc-45f4-8a92-cd81263420ea@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <25e10cfe-40dc-45f4-8a92-cd81263420ea@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/27/26 11:33 PM, Krzysztof Kozlowski wrote:
> On 27/08/2026 16:53, Marek Vasut wrote:
>> On 8/27/26 2:54 PM, Krzysztof Kozlowski wrote:
>>> On 22/08/2026 09:46, Marek Vasut wrote:
>>>> +description:
>>>> +  USB2 PHY block in STM32 is attached to USB 2.0 Host controller and
>>>> +  USB 2.0 side of DWC3 DRD controller, and provides the USB LS/FS/HS
>>>> +  connectivity. Both PHYs are the FEMTO-PHY, but their configuration
>>>> +  bits in the system control register are different for each variant.
>>>> +
>>>> +maintainers:
>>>> +  - Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>>>> +  - Marek Vasut <marex@nabladev.com>
>>>> +  - Pankaj Dev <pankaj.dev@st.com>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - st,stm32mp25-usb2phy1
>>>> +      - st,stm32mp25-usb2phy2
>>>> +
>>>> +  "#clock-cells":
>>>> +    const: 1
>>>> +
>>>
>>> As pointed out by different patchset built on top of it, this is wrong.
>>
>> What is wrong in this (V3) of the patchset ? I think the ST patches were
>> fixing up V2 and what they were fixing up is already fixed here in V3.
> 
> Probably I got confused... but I had impression the ST patches were
> adding here "reg" property, no?
It is there in V3:

"
+  "#clock-cells":
+    const: 1
+
+  "#phy-cells":
+    const: 0
+
+  reg: <------------------ HERE
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
"
