Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BBE485517;
	Wed,  2 Sep 2026 12:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351899; cv=none; b=BhdTT/cYdKvhsl2Oa1QolTEKu4WL9en3luZ8EGarmZ5YlizAnKAHVLAcvzYW4DkDeKdE+v81cNxmSw0B9ruWZOuM3mFHD1FKJsNaGL8cn4WfFlgeP3Mgy+aze5E/euc+uaxXsT2zmCCRHzQLWNycO5JgZXNEGUwcul2C+pCilWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351899; c=relaxed/simple;
	bh=eYchmAyvkWBPpO7ov+ftOpPh+6JoX4c467XrQA/YUGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FgCb5qyR4c21qgvTEXue1Yb31JIrJiRf6uuvpIplqDNe4E2DCZD7mWv9notKED9v/ydA/U30B23FVy+2tzbQfaUXQUdPg6pSluYIXw1j/bhTL/SDdgtn1432UBtBSS23wJHqy5oej37VnCpLZF8YJWAgz5z0HcT/fwz32U0Y3jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=K3iA5QWT; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="K3iA5QWT"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9393511CCAE;
	Wed, 02 Sep 2026 14:24:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788351891;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ZePXJxfXIDFvhKYYoLzBZNdhyl64+xPx76X9iCv/PaA=;
	b=K3iA5QWTIoQWZp5B+wIxIxE9Z9k7fOXIZm9e0lutmfbXuVdVu8LbQR21K39ZJAeoo1xrf4
	pfNz15JWcXYLuHUve3r5HeGBsJfOT5TDzoQzYxSZiKswkZ5YKVKTYlUZNkJf8wMsDkbJ6I
	+bsbwT01REInXBRerxRUCtyPnErs70LIWCH5NZw/skaBHtwrvLFKOFgcxsgVShMnf22y1I
	aiO2DOjga41F3nT3fN/5kmkbnb7IPrz5NvndVttiqzX43rsq1oddxK7kVapEWRkdtwT+i6
	wy9tAl/QlNkVgJm513K1K1B9JG2KOJ3ArsuBs2vRIdLcN6f9bRUVB34ZmAk6zg==
Message-ID: <42c3cb51-c8db-4edb-be10-92f2cba7c945@nabladev.com>
Date: Wed, 2 Sep 2026 14:24:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: stm32: Document
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
References: <20260831231359.136475-1-marex@nabladev.com>
 <20260901-smolder-debug-e37fdd2b3d20@spud>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260901-smolder-debug-e37fdd2b3d20@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/1/26 8:11 PM, Conor Dooley wrote:

Hello Conor,

>> @@ -57,10 +68,17 @@ allOf:
>>     - if:
>>         properties:
>>           compatible:
>> -          const: st,stm32mp25-syscfg
>> +          contains:
>> +            enum:
>> +              - st,stm32mp23-syscfg
>> +              - st,stm32mp25-syscfg
>>       then:
>>         required:
>>           - "#clock-cells"
>> +        - "#address-cells"
>> +        - "#size-cells"
>> +        - phy@2400
>> +        - phy@2800
> 
> This looks good now, thanks.
> 
> I got hung up last time though and maybe didn't notice - in addition to
> requiring these things here, should we also not forbid them on other
> platforms that don't have them? IOW, adding "else: properties: foo: false".

I did add this, and reduced the pattern in patternProperties to match 
only on phy@2400 and phy@2800 so I can disable those too.

> With that, if appropriate,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
I will send a V6 without this tag, please have a look one more time.

Thank you for your help !
