Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37AE1C5D72;
	Sun, 13 Sep 2026 03:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789268662; cv=none; b=qQzI8sdu2IQkmpm84fShFGiCNQuc0stgU96b8QJAYXjZHPKrRtMYQ2ot5q+JZUpRvl0nnSWWwiKED363Pbf7F9OLZJrjA7XP7Api5m0VnWBlC3sev7SecGpGtnImDzpjmsFaklWg5P6Tl4a5WocImq1UlMTvPzuTr/19h9q0fns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789268662; c=relaxed/simple;
	bh=hauTJ9V3KQcync5Zfqbt6mzGFb2g/gJdB1BnCaFK8dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h83AEgGrAUTRLrbYLkZ16i6H56JqpzKEOcxMQoCmONJJxg1wYoRkZs/OQDU7JzQZl1sZP1/5uEjHubokhqbVnZwAVcSDpEn28po70y680QdH0FNU6PxDa+KDOH6M8GlWH/lJJZhgh3LMLYPiu2yCcwoaCTabRqAG6zuJVQ0cVIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=TxEh3Wcn; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="TxEh3Wcn"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 87DCC10384A;
	Sun, 13 Sep 2026 05:04:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1789268658;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=sCNmEzL/xZ/SzQ+Aa70CFkgEL/dKJ18aAMwiSI6jrj0=;
	b=TxEh3WcnbGRkrMci5uDLASOJB6+sAJIHYde7RdwEmM4YFz5nK7go3JNNInc0meD8lNVjJ9
	ZAwGS0jcPdqqB+EAEAhYt15ob0SmQ9TYSvtUD2+wgjmrp6FWwYKP4xjIN28oNVJfXy8g2H
	+rhIYbzFiwnyld1xTFEgJlPahbyQSjbelzLll9zR3GOCmGjiX8qgdIx0GRpVEO5t2AcpxB
	jnN+rFE++MO2tdQiCexW7OxOty0Bdq6punm3tXvntX8sr8tgngmtiN8mN2wQM2XU1Hck7b
	teZ+lapROQ8eLVxce1S1wxnnWuwMOJ5Ma1fAx6VVjiarKPdmcKULYXytk6qGNQ==
Message-ID: <8cf82848-116f-4bd4-b0c6-137a295c832a@nabladev.com>
Date: Fri, 11 Sep 2026 16:50:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Michal Simek
 <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260909182641.165383-1-marex@nabladev.com>
 <20260909182641.165383-2-marex@nabladev.com>
 <20260911-sweet-industrious-stallion-b7a727@quoll>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260911-sweet-industrious-stallion-b7a727@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/11/26 9:32 AM, Krzysztof Kozlowski wrote:
> On Wed, Sep 09, 2026 at 08:26:05PM +0200, Marek Vasut wrote:
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/phy/phy.h>
>> +
>> +#include "zynqmp.dtsi"
>> +#include "zynqmp-clk-ccf.dtsi"
>> +
>> +/ {
>> +	model = "ifm ZynqMP VHIP6 Evaluation Board";
>> +	compatible = "ifm,zynqmp-vhip6-evalboard", "ifm,zynqmp-vhip6", "xlnx,zynqmp";
>> +
>> +	aliases {
>> +		ethernet0 = &gem0;
>> +		ethernet1 = &gem1;
>> +		ethernet2 = &gem2;
>> +		ethernet3 = &gem3;
>> +		gpio0 = &gpio;
>> +		i2c0 = &i2c0;
>> +		i2c1 = &i2c1;
>> +		rtc0 = &i2crtc;
>> +		serial0 = &uart0;
>> +		spi0 = &qspi;
>> +		usb0 = &usb0;
>> +		usb1 = &usb1;
>> +	};
>> +
>> +	chosen {
>> +		bootargs = "clk_ignore_unused";
> 
> You should not have such bootargs in mainline DTS. It ties DTS to
> currecnt Linux driver implementation, not mentioning that it is
> subjective choice. And once such bootargs appear, then they are tricky
> to remove because users of DTS might rely on them.
This can be dropped, thanks.
