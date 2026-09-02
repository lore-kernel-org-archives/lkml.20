Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C01C2749C1;
	Thu,  3 Sep 2026 04:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788409515; cv=none; b=Na0axt6beube3fKnCOeADAQNtnew73Rvrizf6IM2BtlhLk6OGDBjRPkbHsUAiWrKTN2fACoFxezZ8TcXenG6YREy/1vrXtpHrh09TwJgZL8onZaOt8kovCSSHjBKlit4gu8EbqLsDqOsrnUW/X0maNriUMhVp23Co13PBtfTbrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788409515; c=relaxed/simple;
	bh=BDUP/AA9kLFh95TW+PIizcGVZQdRlZxm4YKpQRbuuSw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tVNHe7vPixqigzR9pB6mgBSDWU2dyHt7d/e9PPRB1wGl681TwpXhYf0RoV31fgLTS9MeNqM8oqwgHnZTiIqLCBpW9PdME0v+JWxxmL/XiAEGtlWDL5NM94ENqyU5/rXwb3RoSsLfLahp4ohrey+LLsVXRl9eJNbZBhK6UC8DTNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Dv53Qqh/; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Dv53Qqh/"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E74311D0C9;
	Thu, 03 Sep 2026 06:25:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788409503;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ZIddQ1SliQaGMK1VaNKY8IERnraAm91/zZYjC7XzicA=;
	b=Dv53Qqh/YafM1I2dkKKtJWgdlMB8VcuPZr0Ifm4V59ATOz441kkTRA8RU+PE/jZKjXXZwU
	tvM/gc5eKwTpOIZ3f2B6Efb2fKvm2KWdVLbM16OdWSw5ICL0tnI4LxK89CdbWuZka7htlP
	SsZXQBbjlUer8y7oabE/xs2VbodIbIWpT5l6IFT7/xH2OPr/ED09LXgiXVcZOgaCpAeIZe
	RsEFw4R+EPmyJdgwq4PeXOzN2Nokh5617Xx7OGBf6xcVSLloqqHy9yvJR62Nmk1H+b6pJG
	sYd7ZERT2J6g0T0C7Ujc92l9EAfXHJpZtfhtcHP5s7wc44ANRv/ITdUGo1B8KQ==
Message-ID: <c3bad2f4-d371-4254-a6db-0af31fcf1a41@nabladev.com>
Date: Wed, 2 Sep 2026 16:07:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Vasut <marex@nabladev.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: usb: generic-ehci: Document ST
 STM32MP2 SoC compatibles
To: Conor Dooley <conor@kernel.org>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260831231814.137120-1-marex@nabladev.com>
 <20260831231814.137120-3-marex@nabladev.com>
 <20260901-buzz-mousiness-96fa5be618eb@spud>
Content-Language: en-US
In-Reply-To: <20260901-buzz-mousiness-96fa5be618eb@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/1/26 7:54 PM, Conor Dooley wrote:

Hello Conor,

>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - st,stm32mp23-ehci
>> +              - st,stm32mp25-ehci
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: PHY clock
>> +            - description: Bus clock
>> +
>> +      required:
>> +        - access-controllers
>> +        - clocks
> 
> Since the property is new, I think you should add
> 
> else: properties: access-controllers: false
> 
> even though it may mean a bit more of a restructure if another platform
> wants access controllers.

I think Greg already picked the V5 in some form, I'll see what lands and 
either send a V6 or a follow up patch, whichever you prefer.

Thanks !
