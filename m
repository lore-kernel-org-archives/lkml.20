Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EED0339705;
	Thu, 10 Sep 2026 07:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789023722; cv=none; b=NNYwIYUViQlxPwPT8G+aklY5M2bMLU5NPdS4RcEP0YFNe2uvaJglJY1JmGxBKjJWrTP6COPKS00FczGPjBY2o4JOpj9dv8E0TdY/D98UzYJYXMgCoQajGBS0gg2ENQ9Aja9dDatOU6l3ufn4JerpDLqO/lyuIkQohbRBDN+5oj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789023722; c=relaxed/simple;
	bh=Lc7Kt2lhLezuEujbeA6JBnTwO8erz0yRNNuMc3wLKmg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NAIuKL8HQcWVI07d3JsqlVeSHUos5YqmU8DxPp8eSkcZbCFbldiEZLDbiKECYG0xhNchYzs+RQVHS43NTEEVtHQfJqVQhHnpbI+liEtypevvAiIK5iLccHa5jSYziwJJbVe31iHdihyL3rfaJE5ZPkzm1EQvfQFEc6098h4KZZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=hfX9LYll; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="hfX9LYll"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 21425102B79;
	Thu, 10 Sep 2026 09:01:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1789023714;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=R1AqE60xrKybP1elGY6Eu9TkumxPQD37e09X11zrnvM=;
	b=hfX9LYllfGjdL8YY/3p6OtO1dvWBcgbYqEu6QednOJWh0o3JN52QQw3eRqpKf2hoB7KP3Q
	aazovdjVt7ZWTNo8MVQRd+8UZg4t4EzhqpqkqcSPmyQcW1oTp4Offa5OqXo0pe++e4Mgcg
	hykUfM1/wYvBeMt34mVF+ZliVcbfj3SmRd6VJhe6KYj+OksucGTGyGZZapLGIgtfyOWKsv
	HC0XbBieLP1MkYI5zJjuuyBx2RCYmMTJbAwQ4NhVJuoEOy63TrZ3DNvCpXrGIw3QNr2oyi
	ihZsM6ixTym23+W3mBKRzrShsc4J6Y0wglaPbcD1xIJPGdR5G3F2Q8iqkhtlCg==
Message-ID: <1c39be54-c931-40a2-a806-fa963b2188ec@nabladev.com>
Date: Thu, 10 Sep 2026 09:01:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Vasut <marex@nabladev.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: xilinx: Document ifm ZynqMP
 VHIP6 EvalBoard
To: Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260909182641.165383-1-marex@nabladev.com>
 <082df9b0-0517-4580-8ba8-cf6f4d3e0713@amd.com>
Content-Language: en-US
In-Reply-To: <082df9b0-0517-4580-8ba8-cf6f4d3e0713@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/10/26 8:22 AM, Michal Simek wrote:
> 
> 
> On 9/9/26 20:26, Marek Vasut wrote:
>> Document ifm ZynqMP VHIP6 EvalBoard reference design binding.
>> The board is populated with four ethernet ports, QSPI NOR,
>> eMMC, UART and USB host interfaces.
>>
>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>> ---
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Michal Simek <michal.simek@amd.com>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> ---
>> V2: No change
>> ---
>>   Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml 
>> b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
>> index c9f99e0df2b35..49ef4e0c68501 100644
>> --- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
>> +++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
>> @@ -44,6 +44,11 @@ properties:
>>             - const: xlnx,zynq-zed
>>             - const: xlnx,zynq-7000
>> +      - items:
>> +          - const: ifm,zynqmp-vhip6-evalboard
>> +          - const: ifm,zynqmp-vhip6
>> +          - const: xlnx,zynqmp
>> +
>>         - items:
>>             - enum:
>>                 - xlnx,zynqmp-zc1751
> 
> Can you please provide any link to public documentation about this board?
> I wasn't able to find anything through google..

I do not know whether there is any, it is an internal board from which 
other boards get derived.

What would you like to know ?
