Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4894C0436;
	Mon, 31 Aug 2026 14:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788185423; cv=none; b=RHLMvaUdGKnPgCnpCHS3BgOY+4r1G2nAXhjfRadtiWz3DmqEjqUHhp5raqyZlCq9lhtQIVm0Gi98izQSyg4CQr/mmekMWdg93wLoc48ab02BjPmkpY6+pHKxOyGuRnUfl1Cp9TxXBxX+MLJ3tZO+btZYOwhEmhZUqPzHAgxTTJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788185423; c=relaxed/simple;
	bh=NndcVdGnM6NLDZlKgJ9sg46h6r60xA561cn6PmJ3hPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JEgv5wtkUBRpswweJnTcNAKVLtelEGWxRo6VTcWcn2iR1KKEPJUsPz9lzExp6/aIaVyZHj4/rkJLq/Kx+ugSq12yAnBRwG6ih8MusHbhjpwTEzGtGTE4orT+VszIkSXpG3Pu98R0R/swRASgR8dA/GlaDTQ9+kWiwzDxdRdwjZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=DLXs6x2P; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="DLXs6x2P"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3BA0E11C0AE;
	Mon, 31 Aug 2026 16:10:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788185413;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=chiMGMoTDtadcW5BAFVin4DSW80fvvj3LIzuaS8WzUM=;
	b=DLXs6x2PgMEz8W1bxUwp+eQG15e0URusVWSSxSPkKI/ppPHEeerTEb/Yc+v8xqyGEmvZw6
	SqSQcZfj5rH2/w7vi3ivQ+VCHKr0ch1PXRzcBb6PqpnqUlW01gR0Mt+PKUSYW6CediCzh5
	F4+bqeGATMwCJLNyZGmydQGyfAL3fI8uL2V7+ym9KIKzldAYjfWa72jcAL2aG93AXZs8Kz
	aMHm3YG3W0ceSKp/UoVWa9HSUH0rerUmpi8NlGr4nM7GEMPSGpn6DswQDJOEcHTcG754cM
	6lo/UfUrcCRm3PmYYjgP3uz032FWLKFuB3CvlRcbVMAbw1WNwPQ8NAqVi0NmPg==
Message-ID: <e90c42ab-010a-4038-8973-1bfcb3948c4d@nabladev.com>
Date: Mon, 31 Aug 2026 15:02:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: usb: generic-ohci: Document ST
 STM32MP2 SoC compatibles
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260828155647.353877-1-marex@nabladev.com>
 <20260828155647.353877-2-marex@nabladev.com>
 <20260831-judicious-incredible-aardvark-baa48a@quoll>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260831-judicious-incredible-aardvark-baa48a@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/31/26 11:01 AM, Krzysztof Kozlowski wrote:
> On Fri, Aug 28, 2026 at 05:55:45PM +0200, Marek Vasut wrote:
>>     interrupts:
>> @@ -215,6 +220,22 @@ allOf:
>>           clocks:
>>             minItems: 1
>>             maxItems: 3
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - st,stm32mp23-ohci
>> +              - st,stm32mp25-ohci
>> +    then:
>> +      properties:
>> +        clocs:
> 
> typo

Fixed, thanks.

>> +          minItems: 2
>> +          maxItems: 2
> 
> Instead these two list clocks with description
Like this?

diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml 
b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 71537d268b075..7a8c3c2318153 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -229,9 +229,10 @@ allOf:
                - st,stm32mp25-ohci
      then:
        properties:
-        clocs:
-          minItems: 2
-          maxItems: 2
+        clocks:
+          items:
+            - description: PHY clock
+            - description: Bus clock

        required:
          - access-controllers
